# Five-vertex palette certificate

**Theorem.** A six-coloured complete graphon of constant degree (1/6)
in each hue cannot have all its rainbow triangle palettes in
[
mathcal C={012,013,024,134,234,125,035,235,045,145}.
]
The conclusion holds up to any hue relabelling. This rules out the
projective-plane spectrum, and its nine-palette subfamily, from the
[connected-link reduction](CONNECTED-LINK-ABUNDANCE.md), in addition to
the [previous exclusion](FOUR-VERTEX-PALETTE-CERTIFICATE.md) of
(mathcal A). Only the maximal family (mathcal B) remains in
the reduction for the two-disjoint-rainbow-triangles question.

## Exact certificate

Sample five independent vertices, with the six-colour kernels used to
colour the ten edges independently given the vertices. The score below
is a function of the ten resulting colours. Its integer coefficients
are in [five_palette_certificate_C.py](five_palette_certificate_C.py).
The [standard-library verifier](verify_five_palette_certificate.py)
allows exact independent checks without a linear or semidefinite
optimization package.

The score consists of these four pieces:

1. The constant (120w_0).
2. For each of the three shapes of a tree on five vertices, sum its
   tree-table entry over the 120 vertex orderings. Every ordered list
   of four edge colours on a fixed tree is uniformly distributed:
   repeatedly integrate a leaf and use the degree condition.
3. For each vertex ordering, regard its first four vertices as a
   complete rooted graph, rooted at the first vertex. If (d) is the
   hue of the edge from the root to the fifth vertex, sum
   (6L(d)-sum_{h=0}^{5}L(h)). The leaf table (L) depends on the
   coloured rooted graph on the first four vertices. This term has
   expectation zero: given those vertices and all their colours, the
   last edge has a uniform hue.
4. Subtract a two-root square. For every ordering ((i,j,k,l,m)) and
   every hue permutation (sigma) preserving (mathcal C),
   put (r=sigma(c_{ij})), (a=sigma(c_{ik})), (b=sigma(c_{jk})),
   (d=sigma(c_{il})) and (e=sigma(c_{jl})). Subtract
   [
       720,mathbf 1_{{r=0}}v(a,b)v(d,e).
   ]
   Here (v) is the single pair table in the coefficient file,
   indexed by the 26 ordered pairs ((a,b)) which can occur beside hue
   0 under the allowed palettes (repeated hues are allowed).
   Conditional on (i,j,c_{ij}), the two pairs of colours from (k,l)
   have the same distribution and are independent. Hence this
   subtraction has nonpositive expectation.

By exact calculation the first two pieces have combined expectation
(-164735/9), so this is an upper bound on the expectation of the
score. On the other hand, the minimum score is 72 among the 551
admissible five-vertex patterns up to hue and vertex symmetry. The
enumeration suffices: first pick the minimum possible labelled
restriction to four vertices, then minimize the four colours incident
to the remaining vertex over the transformations which achieve that
restriction. The verifier starts with every admissible four-pattern
and tries all (6^4) ways to append those colours. Its tables and the
score are invariant under the hue automorphisms and all reorderings
of the five vertices.

If there were no rainbow triangle outside (mathcal C), every sampled
five-vertex pattern would be admissible. Then the score would be at
least 72 almost surely, contradicting its negative expectation.
In the square formula one may set (v) to zero on any ordered pair
not listed; this also defines the score on unrestricted samples.

The argument concerns every balanced graphon, so it applies to
coloured cut limits of arbitrarily large finite examples and is not
a host-size enumeration. The [finite consequence of the four-vertex
certificate](FOUR-VERTEX-PALETTE-CERTIFICATE.md#finite-consequence-for-complementary-triangles)
explains the transfer using rich palettes.

Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
