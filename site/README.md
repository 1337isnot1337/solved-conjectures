# Research site

The public reading site is [1337isnot1337.github.io/solved-conjectures](https://itsdavis.com/solved-conjectures/).

The generator reads the repository's current Markdown. It publishes a complete HTML catalogue, individual result pages, proofs, supporting notes, verification guidance, and history. Search works in the browser. Every result and proof remains readable without JavaScript.

## Build and check

Use Python 3.12 or later and Pandoc 3.x. No Python packages or network requests are needed during the build.

```sh
python3 scripts/check_readme_verification.py
python3 scripts/test_build_site.py
python3 scripts/build_site.py --base-url https://itsdavis.com/solved-conjectures/
python3 scripts/check_site.py _site
```

To use another output directory:

```sh
python3 scripts/build_site.py --output /tmp/solved-conjectures-site
python3 scripts/check_site.py /tmp/solved-conjectures-site
```

The output directory must be empty or contain an earlier build from this generator. Generated files are not committed.

For a local preview at the server root, set the preview URL during the build:

```sh
python3 scripts/build_site.py --output /tmp/solved-conjectures-preview --base-url http://127.0.0.1:8000/
python3 scripts/check_site.py /tmp/solved-conjectures-preview
python3 -m http.server 8000 --directory /tmp/solved-conjectures-preview
```

Production builds use the default public URL. Do not publish a preview build.

## Source data and scope

- `CONTENTS.md` supplies result names, mathematical findings, categories, and displayed Lean status.
- The first table in `docs/lean-status.md` supplies the accepted formalization status and checked scope. The build rejects discrepancies in either catalogue or README.
- Each result must have `results/<stable-slug>/README.md` and a catalogue entry. The generator rejects missing entries and duplicate public routes.
- Partial results on open problems have a separate mathematical scope label. This is independent of their Lean status.
- `search-aliases.json` adds factual alternate spellings and problem names. It contains no mathematical claims or verification statuses.
- Graffiti.pc 318 pages preserve the result and proof credit to `@JesterInABarrel`. Collection maintenance is credited separately.
- Root developer instructions and design documents are excluded from the published content.

When the Lean status report adds a new result, add its label-to-directory mapping in `STATUS_LABEL_SLUGS` in `scripts/build_site.py`. The build fails on an unknown label rather than guessing its status.

## Rendering and metadata

Pandoc renders mathematical notation as native MathML and retains TeX annotations. Unsupported formulas fail the build. The renderer converts the equivalent scoped `\rm` notation to `\mathrm` internally; source mathematical statements remain unchanged.

The site uses local fonts, CSS, and JavaScript. It does not load analytics, a search service, or a remote math renderer. Each page has its own title, description, canonical URL, Open Graph metadata, and structured page data. `build-manifest.json` records the source commit and whether the checkout contains local changes. Production builds use a clean checkout.

The checker validates generated result coverage, source statuses, external credit, metadata, sitemap coverage, links, anchors, and local assets.

## Publication

The `Research site` workflow builds and checks source changes and uploads the static output. Publication uses the existing Pages workflow in `1337isnot1337/1337isnot1337.github.io`, which builds this public repository into `site/solved-conjectures/` before deploying the personal site.

The root README Results table is ranked by mathematical significance and supplies the default catalogue order. The checker requires identical manifest, homepage and search result ordering and coverage. Follow `AGENTS.md` before every publication.

Check the [live catalogue provenance](https://itsdavis.com/solved-conjectures/catalogue-provenance.json) and [live build manifest](https://itsdavis.com/solved-conjectures/build-manifest.json) after publication. A current-mode deployment must contain the published commit or a newer commit that includes it. A dated fallback is not a current release. Record and resolve pending or failed deployments instead of declaring synchronization.

The generated `sitemap.xml` belongs to the project path. The host's root sitemap must reference it. Crawler policy belongs in `https://1337isnot1337.github.io/robots.txt`; a project-level `robots.txt` would not control crawling.

The canonical URL and source slugs remain stable when display titles change. Source file links point to GitHub; proof PDFs and images are copied into the site.
