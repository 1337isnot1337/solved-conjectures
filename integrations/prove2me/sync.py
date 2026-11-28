#!/usr/bin/env python3
"""Elaborate repository mission payloads and optionally stage them on Prove2Me."""

import argparse
import json
import os
from pathlib import Path
import re
import subprocess
import tempfile
import tomllib
from urllib.error import HTTPError, URLError
from urllib.parse import quote, urlencode
from urllib.request import HTTPRedirectHandler, Request, build_opener


ROOT = Path(__file__).resolve().parent
API = "https://prove2.me/api/v1"
SOURCE_REPO = "https://github.com/1337isnot1337/solved-conjectures.git"
THEOREM_NAME = re.compile(r"[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*")


def read(path):
    return path.read_text(encoding="utf-8").strip()


def load_mission(manifest):
    spec = json.loads(read(manifest))
    spec["description"] = read(manifest.parent / spec["description"])
    items = {}
    for entry in spec["items"]:
        kind = entry["kind"]
        name = entry["name"]
        if name in items or not THEOREM_NAME.fullmatch(name):
            raise ValueError(f"{manifest.parent.name}: invalid or repeated name {name}")
        code = read(ROOT / entry["file"])
        item = {key: entry[key] for key in ("kind", "natural_language_statement", "source", "tags", "readback_model")}
        item["readback"] = read(manifest.parent / entry["readback"])
        if kind == "definition":
            if "." in name or entry["file"] != f"Definitions/Def_{name}.lean":
                raise ValueError(f"{name}: definition path must match its platform import")
            item.update(definition_name=name, definition_title=entry["title"], definition=code)
        elif kind == "theorem":
            marker = re.search(rf"^theorem {re.escape(name)}\b", code, re.MULTILINE)
            if marker is None or not code.endswith(":= by sorry"):
                raise ValueError(f"{name}: expected the named theorem ending in `:= by sorry`")
            item.update(theorem_name=name, theorem_title=entry["title"],
                        preamble=code[:marker.start()].rstrip(), formal_statement=code[marker.start():])
        else:
            raise ValueError(f"{name}: unknown item kind {kind}")
        items[name] = item
    if items[spec["goal"]]["kind"] != "theorem":
        raise ValueError(f"{spec['name']}: the goal must be a theorem")
    spec["items"] = items
    return spec


def check_published_inputs():
    subprocess.run(["git", "fetch", "--no-tags", SOURCE_REPO, "refs/heads/main"], cwd=ROOT, check=True)
    diff = subprocess.run(["git", "diff", "--quiet", "FETCH_HEAD", "--", "."], cwd=ROOT, check=False)
    untracked = subprocess.check_output(["git", "ls-files", "--others", "--exclude-standard", "--", "."], cwd=ROOT)
    if diff.returncode != 0 or untracked:
        raise ValueError("Prove2Me writes require the integration files published on upstream main.")


def lean_env(build):
    dependencies = subprocess.check_output(["lake", "env", "printenv", "LEAN_PATH"], cwd=ROOT, text=True).strip()
    return os.environ | {"LEAN_PATH": os.pathsep.join((str(build), dependencies))}


def check_missions(missions):
    with tempfile.TemporaryDirectory(prefix="prove2me-build-") as directory:
        build = Path(directory)
        definitions = build / "Definitions"
        definitions.mkdir()
        env = lean_env(build)
        compiled = {}
        for mission in missions:
            for name, item in mission["items"].items():
                args = ["lean", "-DautoImplicit=false", f"--root={build}"]
                if item["kind"] == "definition":
                    if name in compiled:
                        if compiled[name] != item["definition"]:
                            raise ValueError(f"Definition {name} has conflicting source files")
                        continue
                    source = definitions / f"Def_{name}.lean"
                    source.write_text(item["definition"] + "\n", encoding="utf-8")
                    args += ["-DwarningAsError=true", "-o", str(source.with_suffix(".olean"))]
                    compiled[name] = item["definition"]
                else:
                    source = build / f"{name.replace('.', '_')}.lean"
                    source.write_text(item["preamble"] + "\n\n" + item["formal_statement"] + "\n", encoding="utf-8")
                subprocess.run([*args, str(source)], cwd=ROOT, env=env, check=True)
            print(f"Checked {mission['name']}", flush=True)


class NoRedirect(HTTPRedirectHandler):
    def redirect_request(self, request, response, code, message, headers, new_url):
        return None


class Client:
    def __init__(self, key):
        self.opener = build_opener(NoRedirect())
        self.token = None
        self.token = self.request("/agent/refresh", "POST", {"api_key": key})["access_token"]

    def request(self, path, method="GET", body=None):
        headers = {"Accept": "application/json"}
        if self.token:
            headers["Authorization"] = f"Bearer {self.token}"
        data = None
        if body is not None:
            headers["Content-Type"] = "application/json"
            data = json.dumps(body, ensure_ascii=False).encode("utf-8")
        request = Request(API + path, data, headers, method=method)
        try:
            with self.opener.open(request, timeout=45) as response:
                content = response.read()
        except HTTPError as error:
            detail = error.read().decode(errors="replace")[:800] if self.token else ""
            raise ValueError(f"{method} {path} returned HTTP {error.code}. {detail}") from None
        return json.loads(content) if content else None

    def list(self, path, key, **query):
        offset = 0
        while True:
            params = urlencode({**query, "limit": 100, "offset": offset})
            result = self.request(f"{path}?{params}")
            rows = result[key]
            yield from rows
            offset += len(rows)
            if not rows or offset >= result["total"]:
                return


def sync_mission(client, mission, revision, proposals, fields, collection):
    name = mission["name"]
    matches = [row for row in proposals if row["name"] == name]
    if len(matches) > 1:
        raise ValueError(f"Multiple proposals match {name}. Resolve the duplicate in My missions.")
    meta = {"name": name, "description": mission["description"], "mission_type": mission["mission_type"],
            "field_ids": [fields[field] for field in mission["fields"]]}
    if matches:
        path = f"/mission-proposals/{matches[0]['id']}"
        proposal = client.request(path)
        if proposal["env"] != revision:
            raise ValueError(f"{name} uses a different platform environment")
    else:
        existing = client.list("/missions", "missions", q=name, visibility="public")
        if any(row["name"] == name for row in existing):
            raise ValueError(f"A public mission already uses the name {name}")
        proposal = client.request("/mission-proposals", "POST", {**meta, "env": revision})
        path = f"/mission-proposals/{proposal['id']}"
    if proposal["status"] == "Reviewed" and collection:
        live = [row for row in client.list("/missions", "missions", q=name, visibility="public")
                if row["name"] == name]
        if len(live) != 1:
            raise ValueError(f"Could not identify the public mission for {name}")
        client.request(f"/collections/{quote(collection, safe='')}/missions", "POST", {"mission_id": live[0]["id"]})
        print(f"Collected {name} ({live[0]['id']})", flush=True)
    if proposal["status"] != "Draft":
        print(f"{proposal['status']}: {name} ({proposal['id']})", flush=True)
        return

    existing_items = {row.get("theorem_name") or row.get("definition_name"): row for row in proposal["items"]}
    if existing_items.keys() - mission["items"].keys():
        raise ValueError(f"{name} has draft items outside the repository manifest. Reconcile them before syncing.")
    ids = {}
    for item_name, payload in mission["items"].items():
        row = existing_items.get(item_name, {})
        stored = row.copy()
        if payload["kind"] == "definition":
            # Draft detail exposes definition identifiers and titles under the theorem keys.
            stored.setdefault("definition_name", row.get("theorem_name"))
            stored.setdefault("definition_title", row.get("theorem_title"))
        if any(stored.get(key) != value for key, value in payload.items()):
            row = client.request(f"{path}/items", "POST", payload)
        ids[item_name] = row["id"]
    updates = {"main_item_id": ids[mission["goal"]], "item_order": list(ids.values())}
    for key in ("description", "mission_type"):
        if proposal.get(key) != meta[key]:
            updates[key] = meta[key]
    if {field["id"] for field in proposal["fields"]} != set(meta["field_ids"]):
        updates["field_ids"] = meta["field_ids"]
    if any(proposal.get(key) != value for key, value in updates.items()):
        client.request(path, "PATCH", updates)
    print(f"Draft: {name} ({proposal['id']})", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("missions", metavar="SLUG", nargs="*", help="mission directories, defaulting to all")
    parser.add_argument("--apply", action="store_true", help="stage private proposals after checking Lean")
    parser.add_argument("--username", help="expected Prove2Me account, required for --apply")
    parser.add_argument("--key-file", type=Path, help="read key from a local file instead of PROVE2ME_API_KEY")
    parser.add_argument("--collection", help="add approved public missions to an existing collection")
    args = parser.parse_args()
    if args.apply and not args.username:
        parser.error("--apply requires --username")
    if any(not re.fullmatch(r"[a-z0-9][a-z0-9-]*", slug) for slug in args.missions):
        parser.error("invalid mission slug")
    if args.apply:
        check_published_inputs()
    paths = [ROOT / "missions" / slug / "mission.json" for slug in args.missions]
    missions = [load_mission(path) for path in sorted(paths or (ROOT / "missions").glob("*/mission.json"))]
    if not missions or len({spec["name"] for spec in missions}) != len(missions):
        parser.error("expected at least one mission and unique mission names")
    check_missions(missions)
    if not args.apply:
        return
    key = read(args.key_file) if args.key_file else os.getenv("PROVE2ME_API_KEY", "").strip()
    if not key:
        parser.error("--apply requires a key file or PROVE2ME_API_KEY")
    client = Client(key)
    account = client.request("/me")
    if account["username"] != args.username:
        raise ValueError(f"Authenticated as {account['username']}, expected {args.username}")
    revision = tomllib.loads(read(ROOT / "lakefile.toml"))["require"][0]["rev"]
    available = client.request("/environments")["environments"]
    if not any(row["mathlib_rev"] == revision and row["toolchain"] == read(ROOT / "lean-toolchain") for row in available):
        raise ValueError("The pinned environment is unavailable on Prove2Me")
    if args.collection:
        collection = client.request(f"/collections/{quote(args.collection, safe='')}")
        if not collection["permissions"]["can_manage_missions"]:
            raise ValueError(f"Missing editor access to collection {args.collection}")
    fields = {}
    for slug in sorted({field for mission in missions for field in mission["fields"]}):
        fields[slug] = next(row["id"] for row in client.list("/fields", "fields", q=slug) if row["slug"] == slug)
    proposals = list(client.list("/mission-proposals", "proposals"))
    for mission in missions:
        sync_mission(client, mission, revision, proposals, fields, args.collection)


if __name__ == "__main__":
    try:
        main()
    except (ValueError, KeyError, OSError, URLError, StopIteration, subprocess.CalledProcessError) as error:
        raise SystemExit(str(error) or "No matching platform field found.") from None
