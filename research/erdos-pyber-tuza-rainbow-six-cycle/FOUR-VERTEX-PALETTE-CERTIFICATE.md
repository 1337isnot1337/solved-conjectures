# Four-vertex palette certificate

**Theorem.** Let each hue of a six-coloured complete graphon have constant
degree (1/6). For any relabelling of
[
mathcal A={012,013,023,014,024,134,015,125,035,045},
]
at least (809/181704>0.00445) of random triangles are rainbow
with palette outside (mathcal A).

This excludes one of the three maximal families from
[CONNECTED-LINK-ABUNDANCE.md](CONNECTED-LINK-ABUNDANCE.md). It is an
all-orders density obstruction, not an exhaustive check of host graphs of a
particular order. It does **not** yet settle the remaining Erdős–Tuza
two-disjoint-triangles question. The other two maximal families are
[
egin{split}
mathcal B&={012,013,023,014,124,234,025,125,135,045},\
mathcal C&={012,013,024,134,234,125,035,235,045,145}.
end{split}
]
The nine-palette family in that note is a subset of (mathcal C).

## Proof

Sample four independent vertices, and colour the six edges independently
conditional on these vertices, according to the graphon kernels. For any
ordered listing ((i,j,k,l)) of those vertices let (a,b,c,d) be the
colours of (ij,ik,jk,il), respectively. Take the integer tables (S,L)
in [verify_star_leaf_A.py](verify_star_leaf_A.py), with (S) symmetric
and (L) symmetric in its first two arguments. They are specified by
orbits of the colour permutations preserving (mathcal A).

Define a random variable
[
Z=48+sum_{(i,j,k,l)}
left(S(a,b,d)+6L(a,b,c,d)-sum_{h=0}^{5}L(a,b,c,h)
ight),
]
with all 24 listings included. The three star colours (a,b,d) are
independent and uniform by the degree condition. Also (d) is uniform
conditional on the three triangle colours (a,b,c): even if the
positions of the three sampled vertices and the three triangle
colours are fixed, integration over the new vertex (l) gives (1/6)
for each hue of (il). Consequently
[
mathbb E Z=48+rac{24}{6^3}sum_{a,b,d=0}^{5}S(a,b,d)
=-3188/3.
]

The attached short Python verifier uses exact integers to check **all**
(6^6) labelled colourings of the six edges. The minimum of (Z) on
the 14,172 colourings with no rainbow face outside (mathcal A) is 16;
the unrestricted minimum is (-60552). These two inequalities give
[
Pr[	ext{some rainbow face outside }mathcal A]
 ge rac{16+3188/3}{16+60552}
 = rac{809}{45426}.
]
There are four identically distributed faces. The union bound proves the
stated lower bound. The certificate requires only Python's standard
library; the linear optimization used to discover it is not needed for
verification.

## Finite consequence for complementary triangles

Consider any sequence of exactly balanced finite colourings of growing
order with no disjoint complementary rainbow triangles. Recall that a
palette is rich if it has four disjoint triangles. The rich family is
complementary-free and has all links connected, by the asymptotic
[one-two-three](ONE-TWO-THREE-TRANSVERSALS.md) and
[one-one-four](PAIR-TRIANGLE-TRANSVERSALS.md) vertex-cover results.
No hue is common to all rich palettes, as the following count shows.

For direct counting, at each root take just the neighbours in the five
unavoided hues. They have total size (5t). The number of edges of
the avoided hue within those neighbours is at most (5t^2/2);
so there are at least (inom{5t}{2}-5t^2/2) rooted triangles with
all edges in the five hues. Each rooted triangle is counted at
three roots overall. At most (5Ninom{t}{2}) triangles among them
are nonrainbow, by counting their same-hue wedges. Thus there are at
least (5Nt^2/6+5Nt/3) rainbow triangles avoiding the hue. Since
each nonrich palette has an at-most-nine-vertex hitting set, it has
(O(N^2)) triangles. For growing (N) some rich palette avoids
the chosen hue.

If the rich family were contained in a relabelling of (mathcal A)
on an infinite subsequence, fix that relabelling and take a coloured
cut limit. Exact balance passes to the limit. The rainbow density of
palettes outside (mathcal A) would converge to zero, since all of
them would be nonrich. This contradicts the theorem. Consequently
the only possible rich families in large counterexamples lie in the
two maximal orbits (mathcal B,mathcal C).

Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
