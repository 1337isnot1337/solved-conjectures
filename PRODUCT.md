# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Purpose

The website publishes the repository's mathematical catalogue as searchable HTML.
Readers can find a result, read its proof, inspect its formalization status, and
open the original source files. The user requested GitHub Pages publication and
better discovery through specific problem names.

## Readers

Inferred from the collection: mathematicians, Lean users, and readers following
the named conjectures. They need exact claims, sources, and verification scope.

## Stack

Static HTML generated from repository Markdown with Python and Pandoc. Equations
use native MathML. A small JavaScript file filters the catalogue; all results and
proofs remain readable without JavaScript. GitHub Pages hosts the generated site.

## Source of truth

`README.md`, `CONTENTS.md`, `docs/lean-status.md`, and each result directory contain
the source content. The build derives result pages and counts from those files.
Changes to the site must not change a mathematical claim or its quantifiers.

## Constraints

- Preserve complete, partial, and absent Lean formalization as distinct states.
- Preserve the collection's unrefereed status and external contributor credit.
- Keep titles and descriptions free of hard-coded result counts.
- Keep the existing stable result slugs.
- Use concise, concrete language and working links to proofs and checks.
- Do not add analytics, accounts, tracking, or a server-side database.

## Accessibility

The catalogue must work with a keyboard and at narrow viewport widths. Controls
have visible labels. Statuses use text as well as color. Text and equations remain
selectable. Reduced-motion preferences are respected.
