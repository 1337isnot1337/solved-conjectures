# Strict consecutive interlacing of type-D Eulerian polynomials

For every $n\ge2$, the ordinary type-D Eulerian polynomial $D_n(x)$ interlaces $D_{n+1}(x)$. The interlacing is strict for $n\ge3$. The pair $D_2,D_3$ has a common zero at $-1$.

These polynomials count even-signed permutations by their type-D descent statistic. Chow’s 2022 question asks for weak interlacing, a direct consequence of Savage and Visontai’s published refinement theorem and the elementary rank-two case. Cinna Davis and GPT-6.2 Astra recorded that deduction and supplied the separate proof of strictness from rank three. This entry preserves their unranked strengthening. [Chow, §§2 and 5](https://doi.org/10.1016/j.jmaa.2022.126019) · [Savage–Visontai, §§2.4 and 3.4](https://arxiv.org/html/1208.3831v3)

- [Complete proof](PROOF.md).
- [Literature and priority audit](NOVELTY.md).
- [Independent exact convention checks](verify.py).
- [Coordination issue](https://github.com/1337isnot1337/solved-conjectures/issues/77).

## Proof

Savage and Visontai proved an ordered pairwise interlacing theorem for a refinement $T_{n,i}$. The first entry of row $n+1$ equals the total of row $n$, and the total is $2D_n$. A first member of an interlacing family interlaces its positive sum. This gives the full consecutive-interlacing assertion. The refinement recurrence also excludes common zeros of an entire row; a sign argument then gives strictness.

Yang and Zhang later stated the refined interlacing and first-entry identity explicitly. The strict proof uses the absence of a common zero of an entire row. The sources checked in the priority audit contain no earlier explicit all-rank strict conclusion.

## Verification

Lean verifies the full assertion for every rank. The formal source polynomial
counts actual even-signed permutations by the type-D descent statistic.
The append/delete bijection proves the refinement recurrence, and a sign
involution proves the factor of two between the total row and the source
polynomial. The ordered cone inequalities and strict root sign argument
are proved inside Lean.

The conclusion includes full polynomial factorizations, root multiplicities,
and the actual alternating root inequalities. Interlacing holds for every
rank at least two and is strict from rank three.

All 11 modules passed strict source checks, the complete declaration and
axiom audit, and independent stock-kernel replay. The audit covers 329
declarations, including 286 theorem declarations and 149 private declarations.
All 48 required endpoints passed. See the
[formal theorem](../../lean/Conjectures/Chow.lean) and
[verification receipt](../../docs/verification/lean-chow-20261121/receipt.json).
The combined repository gate remains a separate pending check.

The script checks the formula conventions by direct enumeration of signed permutations for $2\le n\le6$, independently compares the refined recurrence with Stembridge's identity for $2\le n\le32$, and checks the cutoff and row-difference identities exactly. It requires Python and SymPy. Run:

    python results/chow-conjecture/verify.py

Those finite checks catch indexing and normalization errors. They are not the all-rank proof.

## Credits and references

Proof note: Cinna Davis and GPT-6.2 Astra. The central published input is due to Carla D. Savage and Mirkó Visontai.

- [Chow (2022)](https://doi.org/10.1016/j.jmaa.2022.126019), Section 5.
- [Savage–Visontai (2015)](https://arxiv.org/abs/1208.3831v3), Lemmas 2.5, 3.9 and 3.14, Corollary 2.6, and the proof of Theorem 3.15.
- [Yang–Zhang (2021/2022)](https://doi.org/10.1007/s10801-021-01101-2), Theorem 2.5 and equation (11).

## Alternative proof and weighted extension

The alternative unweighted proof joins analytic estimates to exact dyadic certificates through degree 128. Its independent audit and finite checker are available with the proof.

[Alternative proof](ALTERNATIVE-PROOF.md) · [Exact checker](check_dyadic.py) · [Supplement audit](ALTERNATIVE-AUDIT.md)

For the Yang–Zhang weight counting negative entries in positions two through the last, a separate research note proves strict consecutive interlacing at every positive parameter except the initial pair at parameter one. This weighted extension is unranked and has a written proof only. [Weighted extension and its sources](https://github.com/1337isnot1337/solved-conjectures/blob/46a5bf1913dc3f2b44fbb1f78583f3eb0e157b30/research/chow-type-d-weighted/weighted-extension.md)
