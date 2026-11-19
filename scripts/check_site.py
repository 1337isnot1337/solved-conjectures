#!/usr/bin/env python3
"""Validate a built catalogue's content, links, accessibility basics, and SEO."""

from __future__ import annotations

import argparse
from collections import Counter
from html.parser import HTMLParser
import json
from pathlib import Path
import re
import sys
from urllib.parse import unquote, urljoin, urlsplit
import xml.etree.ElementTree as ET


class Page(HTMLParser):
    def __init__(self, path: Path):
        super().__init__(convert_charrefs=True)
        self.path = path
        self.html = path.read_text(encoding="utf-8")
        self.ids = []
        self.links = []
        self.titles = []
        self.meta = {}
        self.canonicals = []
        self.h1_count = 0
        self.math_count = 0
        self.json_ld = []
        self.rows = {}
        self._title = False
        self._json_ld = False
        self._json_buffer = []
        self.feed(self.html)

    def handle_starttag(self, tag, attributes):
        attrs = dict(attributes)
        if "id" in attrs:
            self.ids.append(attrs["id"])
        if tag == "title":
            self._title = True
            self.titles.append("")
        if tag == "h1":
            self.h1_count += 1
        if tag == "math":
            self.math_count += 1
        if tag == "meta":
            key = attrs.get("name") or attrs.get("property")
            if key:
                self.meta[key] = attrs.get("content", "")
        if tag == "link" and attrs.get("rel") == "canonical":
            self.canonicals.append(attrs.get("href", ""))
        for attribute in ("href", "src"):
            if attribute in attrs:
                self.links.append(attrs[attribute])
        if tag == "script" and attrs.get("type") == "application/ld+json":
            self._json_ld = True
            self._json_buffer = []
        if attrs.get("data-result"):
            self.rows[attrs["data-result"]] = attrs

    def handle_endtag(self, tag):
        if tag == "title":
            self._title = False
        if tag == "script" and self._json_ld:
            self.json_ld.append(json.loads("".join(self._json_buffer)))
            self._json_ld = False

    def handle_data(self, data):
        if self._title:
            self.titles[-1] += data
        if self._json_ld:
            self._json_buffer.append(data)


def validate(root: Path) -> list[str]:
    errors = []
    manifest = json.loads((root / "build-manifest.json").read_text())
    base_url = manifest["base_url"]
    base = urlsplit(base_url)
    base_path = base.path
    pages = {item["file"]: Page(root / item["file"]) for item in manifest["pages"]}
    listed_files = {item["file"] for item in manifest["pages"]}
    actual_files = {path.relative_to(root).as_posix() for path in root.rglob("*.html")}
    if listed_files != actual_files:
        errors.append(f"Manifest/HTML mismatch: {sorted(listed_files ^ actual_files)}")
    titles, descriptions, canonicals = [], [], []
    for item in manifest["pages"]:
        name = item["file"]
        page = pages[name]
        if page.titles != [item["title"]]:
            errors.append(f"{name}: missing, duplicate, or incorrect title")
        if page.canonicals != [item["canonical"]]:
            errors.append(f"{name}: incorrect canonical URL")
        if page.meta.get("description") != item["description"] or not item["description"]:
            errors.append(f"{name}: missing or incorrect description")
        if page.meta.get("og:url") != item["canonical"]:
            errors.append(f"{name}: Open Graph URL differs from canonical")
        if page.meta.get("og:title") != item["title"]:
            errors.append(f"{name}: Open Graph title differs from document title")
        if page.h1_count != 1:
            errors.append(f"{name}: expected one H1, found {page.h1_count}")
        duplicates = [anchor for anchor, count in Counter(page.ids).items() if count > 1]
        if duplicates:
            errors.append(f"{name}: duplicate IDs {duplicates}")
        if not {"main"}.issubset(page.ids):
            errors.append(f"{name}: skip link has no main target")
        if len(page.json_ld) != 1 or page.json_ld[0].get("url") != item["canonical"]:
            errors.append(f"{name}: incorrect structured data")
        if "graffiti-pc-318/" in name:
            if "@JesterInABarrel" not in page.json_ld[0].get("creditText", ""):
                errors.append(f"{name}: external result credit missing from structured data")
            if "Result and proof credited to" not in page.html or "@JesterInABarrel" not in page.html:
                errors.append(f"{name}: external result credit missing from page")
            if page.json_ld[0].get("author"):
                errors.append(f"{name}: unexpected inherited article author")
        if bool(item["noindex"]) != ("noindex" in page.meta.get("robots", "")):
            errors.append(f"{name}: incorrect indexing instruction")
        titles.append(item["title"])
        descriptions.append(item["description"])
        canonicals.append(item["canonical"])
        for link in page.links:
            parsed = urlsplit(urljoin(item["canonical"], link))
            if parsed.scheme not in {"http", "https"} or parsed.netloc != base.netloc:
                continue
            if not parsed.path.startswith(base_path):
                continue  # The maintainer's parent site is a separate build.
            relative = unquote(parsed.path[len(base_path):])
            relative = relative + "index.html" if not relative or relative.endswith("/") else relative
            target = root / relative
            if not target.exists():
                errors.append(f"{name}: missing internal target {link}")
            elif parsed.fragment and relative in pages and unquote(parsed.fragment) not in pages[relative].ids:
                errors.append(f"{name}: missing anchor {link}")
    for label, values in [("titles", titles), ("descriptions", descriptions), ("canonical URLs", canonicals)]:
        repeated = [value for value, count in Counter(values).items() if count > 1]
        if repeated:
            errors.append(f"Duplicate {label}: {repeated}")
    for css in (root / "assets").rglob("*.css"):
        for url in re.findall(r"url\(\s*['\"]?([^)'\"]+)", css.read_text()):
            if not url.startswith(("data:", "http:", "https:", "//", "#")) and not (css.parent / url).exists():
                errors.append(f"{css.relative_to(root)}: missing CSS asset {url}")
    homepage = pages["index.html"]
    expected_results = {result["slug"]: result for result in manifest["results"]}
    if set(homepage.rows) != set(expected_results):
        errors.append("Homepage does not contain exactly the manifest's result entries")
    for slug, result in expected_results.items():
        row = homepage.rows.get(slug, {})
        if row.get("data-status") != result["status"] or row.get("data-scope") != result["scope"]:
            errors.append(f"{slug}: homepage status/scope does not match the source manifest")
        path = f"results/{slug}/index.html"
        if path not in pages:
            errors.append(f"{slug}: missing result landing page")
        elif result["scope"] == "partial" and "does not claim a solution of the general conjecture" not in pages[path].html:
            errors.append(f"{slug}: mathematical partial scope is not visible")
        elif result["status"] not in {"full", "partial", "none"}:
            errors.append(f"{slug}: invalid formalization status")
    search = json.loads((root / "search.json").read_text())
    if {entry["slug"] for entry in search} != set(expected_results):
        errors.append("Search data does not contain exactly the current results")
    for entry in search:
        expected = expected_results[entry["slug"]]
        if entry["status"] != expected["status"] or entry["scope"] != expected["scope"]:
            errors.append(f"{entry['slug']}: search status/scope differs from source manifest")
    namespace = {"s": "http://www.sitemaps.org/schemas/sitemap/0.9"}
    sitemap = ET.parse(root / "sitemap.xml").getroot()
    sitemap_urls = [node.text for node in sitemap.findall("s:url/s:loc", namespace)]
    indexable = {page["canonical"] for page in manifest["pages"] if not page["noindex"]}
    if set(sitemap_urls) != indexable or len(sitemap_urls) != len(set(sitemap_urls)):
        errors.append("Sitemap does not contain exactly the unique indexable pages")
    if (root / "robots.txt").exists():
        errors.append("robots.txt belongs at the host root, not the /solved-conjectures/ project path")
    if not (root / ".nojekyll").exists():
        errors.append("Missing .nojekyll marker")
    if not errors:
        print(f"Verified {len(pages)} HTML pages, {len(expected_results)} results, {len(sitemap_urls)} sitemap URLs, and {sum(page.math_count for page in pages.values())} MathML formulas.")
        print("Titles, descriptions, canonicals, source scopes, attribution, internal links, anchors, and local assets passed.")
    return errors


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("directory", type=Path, nargs="?", default=Path(__file__).resolve().parents[1] / "_site")
    args = parser.parse_args()
    errors = validate(args.directory.resolve())
    for error in errors:
        print(error, file=sys.stderr)
    if errors:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
