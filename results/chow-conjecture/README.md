# Chow's conjecture

For every $n\ge2$, the ordinary type-D Eulerian polynomial $D_n(x)$ interlaces $D_{n+1}(x)$. The interlacing is strict for $n\ge3$. The pair $D_2,D_3$ has a common zero at $-1$.

These polynomials count even-signed permutations by their type-D descent statistic. The assertion is the question in Section 5 of Chak-On Chow's *New proofs of interlacing of zeros of Eulerian polynomials* (2022).

- [Complete proof](PROOF.md).
- [Literature and priority audit](NOVELTY.md).
- [Independent exact convention checks](verify.py).
- [Coordination issue](https://github.com/1337isnot1337/solved-conjectures/issues/77).

## Proof

Savage and Visontai proved an ordered pairwise interlacing theorem for a refinement $T_{n,i}$. The first entry of row $n+1$ equals the total of row $n$, and the total is $2D_n$. A first member of an interlacing family interlaces its positive sum. This gives the full consecutive-interlacing assertion. The refinement recurrence also excludes common zeros of an entire row; a sign argument then gives strictness.

The proof is a short deduction from established results. The refinement and its compatibility theorem belong to Savage–Visontai, and Yang–Zhang later stated the relevant identities explicitly. The literature audit found no prior explicit resolution of the consecutive assertion, but does not claim the deduction was unknown to every specialist.

## Verification

The proof covers every rank and does not depend on a finite enumeration. It has received an independent mathematical review within this session. There is no Lean verification.

The script checks the formula conventions by direct enumeration of signed permutations for $2\le n\le6$, independently compares the refined recurrence with Stembridge's identity for $2\le n\le32$, and checks the cutoff and row-difference identities exactly. It requires Python and SymPy. Run:

    python results/chow-conjecture/verify.py

Those finite checks catch indexing and normalization errors. They are not the all-rank proof.

## Credits and references

Proof note: Cinna Davis and GPT-6.2 Astra. The central published input is due to Carla D. Savage and Mirkó Visontai.

- [Chow (2022)](https://doi.org/10.1016/j.jmaa.2022.126019), Section 5.
- [Savage–Visontai (2015)](https://arxiv.org/abs/1208.3831v3), Lemmas 2.5, 3.9 and 3.14, Corollary 2.6, and the proof of Theorem 3.15.
- [Yang–Zhang (2021/2022)](https://doi.org/10.1007/s10801-021-01101-2), Theorem 2.5 and equation (11).
