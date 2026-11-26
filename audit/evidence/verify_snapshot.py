"""Verify the dossier coverage, source bytes and replay links in a full git clone."""
from hashlib import sha256
from pathlib import Path
import gzip
import json
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]
AUDIT = ROOT / "audit"
BASE = "d676ae52308b71d65beac020fb2a1a591a9e6d34"


def git(*args):
    return subprocess.check_output(["git", "-C", str(ROOT), *args])


def main():
    records = [json.loads(line) for line in (AUDIT / "records.jsonl").read_text().splitlines()]
    names = {record["record"] for record in records}
    assert len(names) == len(records), "duplicate record"
    original_results = set(git("ls-tree", "--name-only", BASE + ":results").decode().splitlines())
    covered_results = {name.removeprefix("results/") for name in names if name.startswith("results/")}
    assert covered_results == original_results, original_results.symmetric_difference(covered_results)
    sys.path.insert(0, str(ROOT / "scripts"))
    from check_readme_verification import parse_results
    ranked = {r["record"]: tuple(r["rank"]) for r in records if r["rank"]}
    expected_ranks = {"results/" + slug: (rank, marker) for rank, slug, marker
                      in parse_results(git("show", BASE + ":README.md").decode())}
    assert ranked == expected_ranks and len(ranked) == 171
    source_objects = {}
    for record in records:
        assert (AUDIT / record["dossier"]).is_file(), record["dossier"]
        for ref in record["local_checks"]:
            assert (AUDIT / "evidence" / "replays" / (ref + ".txt")).is_file(), ref
        for source in record["record_files"]:
            key = record["source_ref"] + ":" + source["path"]
            assert source_objects.setdefault(key, source["sha256"]) == source["sha256"], key
    with gzip.open(AUDIT / "evidence" / "tracked-files.tsv.gz", "rt") as manifest:
        assert next(manifest).strip() == "revision\tfile_mode\tgit_object\tbytes\tpath"
        trees = {}
        for row in manifest:
            revision, mode, oid, size, path = row.rstrip("\n").split("\t", 4)
            trees.setdefault(revision, {})[path] = (mode, oid, size)
    for revision, stored in trees.items():
        args = [] if revision == BASE else [r["record"] for r in records if r["source_ref"] == revision]
        tree = {}
        for row in git("ls-tree", "-rlz", revision, "--", *args).rstrip(b"\0").split(b"\0"):
            metadata, path = row.decode().split("\t", 1)
            mode, _, oid, size = metadata.split()
            tree[path] = (mode, oid, size)
        assert tree == stored, revision

    proc = subprocess.Popen(["git", "-C", str(ROOT), "cat-file", "--batch"],
                            stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    with proc.stdin, proc.stdout:
        for key, expected in sorted(source_objects.items()):
            proc.stdin.write(key.encode() + b"\n")
            proc.stdin.flush()
            header = proc.stdout.readline().split()
            assert len(header) == 3 and header[1] == b"blob", (
                key, "fetch the pinned main and research commits in this clone")
            data = proc.stdout.read(int(header[2]))
            assert proc.stdout.read(1) == b"\n"
            assert sha256(data).hexdigest() == expected, key
    assert proc.wait() == 0
    print(f"Verified {len(records)} dossiers, {len(covered_results)} result directories, "
          f"{len(ranked)} ranks and {len(source_objects)} pinned source files.")


if __name__ == "__main__":
    main()
