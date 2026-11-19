---
name: Solved conjectures
description: A searchable mathematical catalogue and proof reading site.
colors:
  paper: "#f8f8f3"
  surface: "#fffefa"
  ink: "#24352f"
  muted: "#5e6862"
  rule: "#d6ddd4"
  rule-strong: "#b9c6bc"
  control-line: "#87988b"
  green: "#285d49"
  green-wash: "#e7efe7"
  violet: "#665584"
  violet-wash: "#eee9f4"
  neutral-wash: "#eeeee8"
  focus: "#60529a"
  selection: "#d8e7d8"
  selection-ink: "#173b2c"
  link-hover: "#123f2d"
  link-rule: "#a4baaa"
  secondary-link-rule: "#a0b3a5"
  placeholder: "#626d64"
  neutral-status: "#59615b"
  proof-ink: "#2c3630"
  code-ink: "#385345"
  code-surface: "#f0f2eb"
  scrollbar: "#aebcaf"
  notice-ink: "#574d67"
typography:
  display:
    fontFamily: "Newsreader, Georgia, serif"
    fontSize: "clamp(42px, 5.2vw, 74px)"
    fontWeight: 400
    lineHeight: 1.02
    letterSpacing: "-0.035em"
  title:
    fontFamily: "Newsreader, Georgia, serif"
    fontSize: "clamp(23px, 2vw, 27px)"
    fontWeight: 450
    lineHeight: 1.2
    letterSpacing: "-0.017em"
  body:
    fontFamily: "Geist, sans-serif"
    fontSize: "1rem"
    fontWeight: 400
    lineHeight: 1.7
  proof:
    fontFamily: "Newsreader, Georgia, serif"
    fontSize: "1.1875rem"
    fontWeight: 400
    lineHeight: 1.72
  label:
    fontFamily: "Geist, sans-serif"
    fontSize: "0.875rem"
    fontWeight: 500
  metadata:
    fontFamily: "Geist, sans-serif"
    fontSize: "0.8125rem"
    fontWeight: 400
  introduction:
    fontFamily: "Geist, sans-serif"
    fontSize: "1.0625rem"
  mobile-proof:
    fontFamily: "Newsreader, Georgia, serif"
    fontSize: "1.125rem"
  mobile-display:
    fontFamily: "Newsreader, Georgia, serif"
    fontSize: "clamp(41px, 7.7vw, 55px)"
  article-title:
    fontFamily: "Newsreader, Georgia, serif"
    fontSize: "clamp(36px, 4.2vw, 59px)"
  brand:
    fontFamily: "Newsreader, Georgia, serif"
    fontSize: "25px"
  mobile-brand:
    fontFamily: "Newsreader, Georgia, serif"
    fontSize: "23px"
  narrow-brand:
    fontFamily: "Newsreader, Georgia, serif"
    fontSize: "22px"
  mobile-title:
    fontFamily: "Newsreader, Georgia, serif"
    fontSize: "39px"
  narrow-title:
    fontFamily: "Newsreader, Georgia, serif"
    fontSize: "35px"
  narrow-result-title:
    fontFamily: "Newsreader, Georgia, serif"
    fontSize: "24px"
  equation:
    fontFamily: "STIX Two Math, Cambria Math, Latin Modern Math, math"
    fontSize: "0.98em"
rounded:
  field: "4px"
  status: "3px"
  inline-code: "2px"
spacing:
  page-gutter: "clamp(20px, 5vw, 72px)"
  row-block: "27px"
  field-gap: "22px"
components:
  search-field:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.ink}"
    rounded: "{rounded.field}"
    padding: "10px 13px"
    height: "46px"
  full-status:
    backgroundColor: "{colors.green-wash}"
    textColor: "{colors.green}"
    rounded: "{rounded.status}"
    padding: "5px 9px"
  partial-status:
    backgroundColor: "{colors.violet-wash}"
    textColor: "{colors.violet}"
    rounded: "{rounded.status}"
    padding: "5px 9px"
---

# Design system

## Overview

The site uses an editorial catalogue layout. Result names, mathematical summaries,
and verification scope provide the structure. A reader can scan the collection
and move into a proof without a change in visual language.

## Colors

Warm paper and dark green ink form the reading surface. Green identifies links
and complete formalization. Muted violet identifies partial formalization.
Neutral status labels identify results without a formalization. Every status
includes readable text; color never carries the distinction alone.

## Typography

Newsreader supplies headings and proof prose. Geist supplies controls, catalogue
summaries, and metadata. Both are self-hosted under the SIL Open Font License.
Newsreader includes a genuine italic face. Mathematical expressions use native
MathML and the browser's mathematical font.

Primary text stays at least 16px. Inputs use 16px, labels use 14px, and metadata
uses 13px. Proof prose is 19px on desktop and 18px on mobile. Code and tables use
14px with independent horizontal scrolling.

## Layout

The page container has a maximum width of 1180px. The index is a list of ruled
rows, with a content column and a narrow status column. Below 720px, each result
flows into one column. Below 480px, search and both filters stack vertically.

Proof pages pair a narrow, sticky navigation column with a reading column of at
most 74 characters. On mobile, navigation becomes ordinary content above the
proof. Tables, code, and long equations scroll within their own blocks.

## Elevation & Depth

The design is flat. Thin rules separate sections. Subtle surface colors identify
controls and status labels. Shadows are not part of the system.

## Shapes

Controls have small rounded corners. Status labels have smaller corners. Rows
remain open and are separated by rules; they are not individual cards.

## Components

Search matches titles, names, identifiers, and proof text. It folds accents so
that `Erdos` matches `Erdős`. The current query and filters remain in the URL.
The clear control resets all filters and returns focus to search. A no-result
state explains how to recover.

The slash key focuses search when the reader is not typing. Escape clears the
search field. Search does not intercept keys within other editing controls.
Proof navigation marks the heading currently in view.

Focus uses a visible two-pixel violet outline. Text selection uses pale green.
Hover changes are brief and remain disabled under reduced-motion preferences.
All mathematical content remains present without JavaScript.

## Do's and Don'ts

- Do retain precise status text, contributor credit, and mathematical scope.
- Do keep line lengths readable and let narrow layouts reflow.
- Do use the existing type and color tokens for additional pages.
- Do not add decorative summary metrics, repeated cards, or unnecessary icons.
- Do not hide mathematical content behind JavaScript.
- Do not shrink mobile text to make a desktop layout fit.
