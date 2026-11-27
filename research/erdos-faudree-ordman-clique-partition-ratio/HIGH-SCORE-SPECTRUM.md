# Spectral restrictions on counterexamples with triangles

The sharp unrestricted ratio in [issue #990](https://github.com/1337isnot1337/solved-conjectures/issues/990) remains open. The pair-profile estimates can nevertheless constrain the positive-score graph of any extremal dual, even if the quotient has triangles. For seven through ten covers, the restriction already applies to the triangle-free graph of scores strictly above one half.

## A weighted adjacency condition for any template

Let x be a vector of type proportions and Y any feasible dual.
Put h_i = -y_ii, z_i = x_i sqrt(h_i), D = sum_i z_i²/2, and
write P and N for total positive and negative mass, with F = P - N.
In particular D <= N. Absent edges have score zero. The two-type
profile constraints give, for every positive edge with score p,

```math
p \le \sqrt{h_i h_j},\qquad
p \le \tfrac14 + \tfrac{3}{4\sqrt 2}\sqrt{h_i h_j}.
```

The first inequality follows by taking large two-type occupancies
in arbitrary proportions, so the resulting binary quadratic form
is nonpositive on the nonnegative quadrant. This also handles
a zero diagonal penalty by taking one proportion arbitrarily small.
The second inequality is the five-vertex pair bound in
[TRIANGLE-FREE.md](TRIANGLE-FREE.md). Its proof only uses profiles on this pair,
so it does not require a triangle-free template.

Let H have the edges with p > 1/2 and B the other positive edges.
Let M be the unweighted edge mass of H and L the positive
score mass in B. The capped score estimate of
[HIGH-SCORE-STABILITY.md](HIGH-SCORE-STABILITY.md) gives M + 2L <= 1/4.
Write b = 3/(4 sqrt(2)). Then

```math
P \le M/4+L+b\sum_{ij\in H}z_i z_j
  \le \tfrac1{16}+\tfrac L2+b\sum_{ij\in H}z_i z_j.
```

Applying the first pair inequality to B shows that the last
right side is at most 1/16 plus half the quadratic form at z
of the symmetric matrix W = b A(H) + A(B)/2. With rho the largest
eigenvalue of W, this gives

```math
F\le\min\{1/4-N,\ 1/16+(\rho-1)N\}.
```

For 1/16 <= T < 1/4, these bounds force F <= T if
rho <= (3/4)/(1-4T). For N >= 1/4 - T use the first bound.
On the complementary interval use the maximum of the affine
second bound at its two endpoints. The same conclusion follows
if the ordinary adjacency matrix of the positive-score graph
has spectral radius at most sqrt(2)/(1-4T), since W is dominated
entrywise by b times that matrix. Apply both quadratic forms to
nonnegative z to justify this last comparison.

## Only the high scores matter at targets at least one eighth

There is a different bound that does not depend on the graph B.
Write r for the adjacency spectral radius of H. Leaving L intact
in the earlier estimate and using L <= 1/4 - P gives

```math
F\le \tfrac1{16}+L/2+brD-N
 \le \tfrac3{16}-F/2+(br-3/2)N.
```

If br <= 3/2 this implies F <= 1/8. Otherwise substitute
N <= 1/4 - F to obtain F <= 1/4 - 3/(16br).
Thus for 1/8 <= T < 1/4, a dual objective above T requires

```math
r > \frac{\sqrt 2}{1-4T}.
```

Taking T = q/56, this says r² > 392/(14-q)² for every
q-cover template with q from seven through ten whose limiting
partition ratio exceeds 1/56. Since H is triangle-free,
r² <= |E(H)| by the weighted Mantel and Cauchy-Schwarz argument
in [TRIANGLE-FREE.md](TRIANGLE-FREE.md), applied to H. So the
required minimum numbers of edges with score strictly above
one half are respectively 9, 11, 16, and 25 for q = 7, 8, 9, 10.
In particular every such ten-cover counterexample needs at least
ten active types: a triangle-free graph on nine types has at
most twenty edges. These restrictions hold for any feasible
dual beating the target and do not assume stationarity.

The spectral conditions are necessary conditions on a dual
certificate for a counterexample, not a proof that one exists
or an evaluation of the sharp ratio.
