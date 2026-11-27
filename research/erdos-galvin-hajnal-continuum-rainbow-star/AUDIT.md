# Exact statement and prior-resolution audit

Checked 27 November 2026. This is a bounded literature search.
It identifies no prior unconditional resolution of the precise
rooted, full-continuum-palette problem; it cannot exclude an
unindexed earlier argument.

## Primary source and known special cases

P. Erdős, F. Galvin, A. Hajnal, *On set-systems having large
chromatic number and not containing prescribed subsystems*,
*Infinite and Finite Sets*, Colloq. Math. Soc. János Bolyai 10,
North-Holland (1975), 425–513, MR 53#2727, Zbl 0324.04005.
[Full primary scan](https://www.renyi.hu/~p_erdos/1975-24.pdf);
also [the Zentralblatt record](https://emis.muni.cz/classics/Erdos/cit/32404005.htm).
The archive copy checked locally has SHA-256
`a9621bbef90bc4adf249b204afbcb55f94ffd448b0589b5d4c81120fddda32b2`.

1. [Definition 6.3, print p. 448](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=24).
   For graphs the suppressed fourth argument of (P^*) is (1).
   One vertex in one partition part must be incident to edges of
   **every** prescribed label to vertices in that part. The third
   argument (aleph_1) permits all countable partitions.
2. [Problem 6, print p. 462](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=38)
   explicitly asks whether ZFC proves that for **every** positive
   integer (n) a graph on exactly (2^{aleph_0}) vertices has
   (P^*(G,2^{aleph_0},aleph_1)) while excluding all
   (C_{2i+1}) with (1le ile n). The scanned statement,
   not a search-engine OCR transcription, was checked.
3. [Theorem 8.1, pp. 454–455](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=30)
   gives (n=1) unconditionally: when (lambda=2^{aleph_0}),
   (lambda^{aleph_0}=lambda) and the least exponent that
   increases (lambda) is at least (aleph_1). This is the
   admitted triangle-free case, not the all-odd-girth assertion.
4. [Theorem 8.5, pp. 457–458](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=33)
   gives the full assertion **under CH**, via its case
   (kappa=aleph_0). It depends on the polarized edge-colouring
   Lemma 8.4 under (2^kappa=kappa^+). [Theorem 8.6,
   pp. 458–459](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=34)
   gives a ZFC witness on ((2^{aleph_0})^+) with that larger
   palette. It uses identical profiles across one template edge.
   Restriction to a continuum-sized subset does not follow:
   the local witness and the edges realizing its whole palette
   could be lost. Theorem 8.6's label coding is an explicit
   ingredient of the new transfer, not claimed to be new.
5. [Corollaries 9.6 and 9.7 and the authors’ discussion of Problem 6,
   pp. 461–462](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=37)
   separate the full continuum palette for unstarred (P)
   from the countable edge palette for the starred conclusion
   on the continuum. Neither implies the exact problem.
6. [Problem 7, p. 466](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=42)
   has a countable host, finite vertex palettes, and asks to
   exclude all small cycles, even ones included. Its candidate
   [negative resolution](https://github.com/1337isnot1337/solved-conjectures/issues/1020)
   is separate and not a contradiction to the positive odd-girth
   construction here.

## Following the later literature

* [Erdős–Hajnal (1966), Theorem 7.4](https://www.renyi.hu/~p_erdos/1966-07.pdf)
  and [EGH75, Definition 8.2/Lemma 8.3](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=32)
  are the prior high-odd-girth ordinary chromatic template theorem.
  They supply the template, not the rooted edge-labelling transfer.
* [Hajnal–Komjáth (2003)](https://link.springer.com/article/10.1007/s00493-003-0015-2)
  and [Džamonja–Komjáth–Morgan (2004)](https://doi.org/10.2178/jsl/1080938840)
  study simultaneous/wild edge colourings. Their visible
  statements (also the [MathSciNet review for the 2003 paper](https://citeseerx.ist.psu.edu/document?doi=dd66b0c58d82b75a3c6906d1e8407bb18741c8d0&repid=rep1&type=pdf))
  require labels somewhere in one class, not at a fixed root,
  and consider different cardinal parameters. The two publisher
  landing pages and the review were checked; the 2003
  subscription full text was not obtained.
* [Lambie-Hanson–Soukup (2020), §5](https://arxiv.org/pdf/2002.02480#page=15)
  investigate short monochromatic odd cycles and pose two
  uncountable unrooted edge-colouring questions (5.10–5.11).
  Neither is the host exclusion plus rooted full-palette
  conclusion of EGH75 Problem 6.
* [Komjáth’s 2025 problem list](https://doi.org/10.1017/bsl.2025.1)
  and [its indexed scope](https://erdosproblems.ai/wiki/library/set_theory/komjath_2025_erdos_hajnal_problem_list)
  update a particular earlier 82-question list, not all
  statements in the 1975 memoir. Publisher metadata and the
  indexed map did not expose a resolution of this target.
* [Howe–Huffman–Kohlmeyer–Kruer (2026)](https://hexagonmath.org/2611.00585v1)
  concern relative independence of a **universal** unrooted
  splitting property at chromatic number (aleph_1) (Erdős
  #1176), not the size-matched **existential** rooted result.
* The [EGH75 catalogue paper card](https://erdosproblems.ai/wiki/library/set_theory/erdos_1975_set_systems_having_large_chromatic_number)
  and the [#593/#1177 source manifest](https://github.com/ericlisg/erdos-593-1177-lean/blob/main/SOURCES_E1_E5.md)
  explicitly distinguish unstarred (P) in Corollary 9.7.
  Those other numbered catalogue problems concern triple
  systems, not the present graph target. We do not assign this
  result a modern Erdős Problems number.

Searched the exact source title and alternates with “Problem 6”,
“short odd circuitless”, “continuum rainbow star”, “simultaneous
chromatic”, “edge colours”, “Specker graph”, and “Theorem 8.6”,
using graph, coloration, and spelling variants. Searched public
math work registries and the repository issue catalogue, and
checked likely same-author follow-ups and statement maps. Exact
repository tracking and scope: [issue #1021](https://github.com/1337isnot1337/solved-conjectures/issues/1021).
The publicly documented cases remain the CH proof, the
larger-size ZFC result, the triangle-free case, and the
weakened-palette/unrooted cases. No prior unconditional
proof of the full stated Problem 6 was found.

## Significance and new step

This removes a set-theoretic hypothesis from a complete
50-year-old question and reaches the smallest possible host
size for its palette. The old template threshold, chromatic
number greater than \(2^\mu\), is impossible at that size. The new step is to use all
incoming neighbours of a template vertex, rather than one
profile-matching edge. A profile containing a genuinely new
colour at every vertex would give an ordinary proper colouring.
This lowers the necessary template chromatic threshold from
(2^mu) to (mu), and gives the same improvement at every
infinite cardinal. The proof does not assert the different
local statement on a host of size exactly (aleph_1) when
the palette has size continuum (>aleph_1), which is
impossible by the one-colour condition.
