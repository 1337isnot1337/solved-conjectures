# Independent review of the Brualdi symmetric-support checkpoint

Review date: 21 November 2026 UTC.

Reviewed `../sign/brualdi_symmetric_support.md` and its exact checker.
The sparse-row bound, all-order numerical comparison, graph lemma, and
scaling identities pass. They do not establish cohesiveness of the whole
Brualdi family or characterize all cohesive matrices.

## Sharp sparse-row bound and comparison

The primary source
[Gurvits, arXiv:0711.3496](https://arxiv.org/pdf/0711.3496),
Corollary 2.7(a), gives the capacity bound with column-support degrees.
Item 4 immediately afterward, equation (19), displays precisely the sharp
one-sparse-column example used in the checkpoint. Transposition gives the
row formulation. Thus this bound and its attainer are prior results, as
the revised checkpoint explicitly says.

The derivative elimination order is correct. Put the sparse variable last
in the theorem's indexing, or eliminate it first in the recursive proof.
Its factor is `g(d)`, and the remaining unrestricted degrees supply
`g(n-1)...g(2) = (n-1)!/(n-1)^(n-1)`. Capacity of the product of column
forms of a doubly stochastic matrix is exactly one. If the actual degree
is below `d`, monotonicity of `g` only strengthens the bound.

I independently rederived the logarithmic expansion. The coefficient of
`r^(-k)` is

```math
\frac1{k(k+1)}-\frac1{k2^k}
=\frac{2^k-k-1}{k(k+1)2^k}.
```

The coefficient for `k=1` vanishes and every coefficient for `k>=2` is
positive. Keeping the `k=2` term proves the displayed strict margin.
For even `n=2r`, multiplication of the alternating-series error
`1/(n+1)!` by `n` gives exactly
`1/((2r+1)(2r-1)!)`, so no factorial factor is missing.
The bound `(2r+1)(2r-1)! > 12 e r` holds from `r=3` onward;
the claimed elementary comparison with `36r` suffices. The odd-order
argument uses the opposite sign of the derangement remainder correctly.
Direct substitution at `n=4` gives equality `1/9` on both sides.

Therefore `per(A) < D_n/(n-1)^n` does force every row and column degree
to exceed `n/2`, in every order covered by the checkpoint.

## Graph lemma

The positive last row and column, including the last diagonal entry, are
essential hypotheses. They must be retained when the lemma is quoted.
The draft does retain them and lists their origin in the earlier structural
reduction.

Let `F` be the mutual-positive support. Failure of full indecomposability
gives a nonempty proper set `S` with `|N_F(S)| <= |S|`. The universal
vertex is outside `S` and inside `N_F(S)`. Thus
`I = S minus N_F(S)` is nonempty. Symmetry of `F` proves that `I` has
no edges to `S`, not merely that it is independent. Consequently

```math
N_F(I)\subseteq N_F(S)\setminus S,
\qquad |N_F(I)|\le |I|.
```

With `k=|I|`, `h=|N_F(I)|`, and `T` the remaining vertices, every
`I`--`I` pair and `I`--`T` pair has exactly one zero arc. A second
opposite zero arc would violate acyclicity. In a topological ordering,
the first vertex of `I` has at least `k-1` outgoing zero arcs within `I`,
and the last has at least `k-1` incoming zero arcs within `I`.
Every vertex of `T` contributes to at least one of these two counts.
Counting an arc twice when it contributes to both degrees is legitimate:
the expression being bounded is a sum of degrees.

The resulting sum is at least
`2(k-1)+|T| = n+k-h-2 >= n-2`. Adding the prescribed diagonal zero
to the respective row and column makes the sum of their positive degrees
at most `n`, contradicting two strict-majority degrees. This argument
also handles `k=1` and rules out Hall equalities, not just strict Hall
failures. The conclusion is full indecomposability.

## Scaling and retained comparison gap

Full indecomposability ensures Sinkhorn scaling exists and yields a unique
doubly stochastic matrix in the diagonal scaling class. Transposition
preserves that class, so the scaled matrix is symmetric. Connected support
then turns two-sided scaling into `B = D G D`. The positive universal
diagonal fixes the possible reciprocal ambiguity in `D`.

The displayed capacity transformation and
`per(B) = per(G)/cap(G)` have the correct powers of the scaling factors.
The Cauchy--Schwarz inequality for permutation weights gives
`per(G) <= per(A)`. If a positive entry has a zero transpose entry,
Birkhoff's decomposition places that entry in a positive perfect matching;
the inverse matching has zero weight. This proves strictness of that
Cauchy--Schwarz inequality in the stated asymmetric-support case.

Crucially, strict decrease before scaling is insufficient. Since `B` is
feasible on the original face, global minimality gives only

```math
\operatorname{per}B\ge\operatorname{per}A,
\qquad
\operatorname{cap}(G)\le
\frac{\operatorname{per}G}{\operatorname{per}A}.
```

The draft leaves the required reverse comparison unproved and does not
claim a full solution.

## Certificate and scope

Running

```sh
python research/minc/continuation-2026-11-20/sign/brualdi_symmetric_support_checks.py
```

returned `Exact one-row formulas, parity comparisons, and C8 obstruction checked.`
Its subset recurrence uses exact rational arithmetic. The `C_8` illustration
has 1331 supported permutation matrices and the displayed cofactor counts
give its exact doubly stochastic barycenter. Its largest nonempty zero
rectangle has row-plus-column size 6, but its mutual-positive support
violates Hall through the first five vertices. This correctly shows that
the majority-degree assumption cannot simply be omitted.

The checker is only an exact illustration and transcription check. The
all-order comparison and graph lemma are justified by the analytic arguments
above. This review treats the earlier `C_n` minimizer properties as the
stated previously established inputs; it does not substitute a new proof
or a new priority audit for that earlier structural reduction. No complete
MINC problem is added to the solved count.
