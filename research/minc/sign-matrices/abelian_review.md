# Permanent dominance for degree-one characters

Independent review, 21 November 2026. This checks
`research/minc/abelian-dominance.md` and records a shorter absolute-value proof.
No priority claim is made. These group classes do not resolve full Minc Problem
2 or Conjecture 42.

## Inputs and conclusion

For a complex Hermitian positive semidefinite matrix A, put

```math
a_g=\prod_{i=1}^n a_{i,g(i)}.
```
The Grone–Pierce theorem says that every correlation matrix C satisfies

```math
\mathop{\mathrm{per}}C\geq\frac{\|C\|_F^2}{n}
=1+\frac1n\sum_{i\ne j}|c_{ij}|^2.\tag{1}
```
The [publisher record](https://epubs.siam.org/doi/10.1137/0609016) explicitly
states the Hermitian positive semidefinite domain; it is not restricted to real
matrices. The reference is R. Grone and S. Pierce, *Permanental Inequalities for
Correlation Matrices*, SIAM J. Matrix Anal. Appl. 9 (1988), 194–201,
DOI 10.1137/0609016.

Lieb's permanental Fischer inequality gives

```math
\mathop{\mathrm{per}}A\geq
\prod_{O\in\mathcal P}\mathop{\mathrm{per}}A[O,O]\tag{2}
```
for any partition of the index set. The source is E. H. Lieb, *Proofs of some
conjectures on permanents*, J. Math. Mech. 16 (1966), 127–134; its theorem and
corollary are reproduced as Theorem 1 and Corollary 1 of
[Wanless's 2022 survey](https://arxiv.org/pdf/2202.01867).

From these two inputs one obtains the stronger estimate

```math
\boxed{\sum_{g\in H}|a_g|\leq\mathop{\mathrm{per}}A}\tag{3}
```
whenever the image of H on each of its orbits acts regularly on that orbit.
This includes all abelian permutation groups, all semiregular groups, and all
groups in their regular permutation representation. The groups themselves need
not be abelian.

For any character χ, the standard bound |χ(g)|≤χ(e) and reality of its generalized
matrix function then yield

```math
d_\chi^H(A)=\sum_{g\in H}\chi(g)a_g
\leq\chi(e)\sum_{g\in H}|a_g|
\leq\chi(e)\mathop{\mathrm{per}}A.\tag{4}
```
Thus the conclusion also holds for characters of arbitrary degree within these
group classes.

## Proof for a semiregular action

First suppose H is semiregular: no nonidentity element fixes a point. If a
diagonal entry of A vanishes, positivity makes that row and column zero, so
every a_g and the permanent are zero. Otherwise put
C_ij=A_ij/sqrt(A_ii A_jj). Both sides of (3) are multiplied by the same positive
factor prod_i A_ii under this normalization, so it suffices to prove (3) for C.
The case n=1 is immediate.

For n≥2, every |c_ij|≤1. For each g≠e, AM–GM gives

```math
|c_g|\leq\frac1n\sum_i|c_{i,g(i)}|^n
\leq\frac1n\sum_i|c_{i,g(i)}|^2.\tag{5}
```
For a fixed ordered pair (i,j), at most one g maps i to j; if two did, their
quotient would fix i. Further, g(i)≠i for every g≠e. Summing (5) therefore gives

```math
\sum_{g\in H}|c_g|
\leq1+\frac1n\sum_{i\ne j}|c_{ij}|^2
\leq\mathop{\mathrm{per}}C.
```
The identity term is exactly 1. This proves (3) for semiregular actions.

The same proof does not require a group if one instead has a set of
permutations containing the identity whose nonidentity permutation matrices
have pairwise disjoint supports and avoid the diagonal.

## Regular action on each orbit

Let O_1,...,O_r be the H-orbits. Assume the image G_i of H in the symmetric group
on O_i acts regularly. Embed H into the independent product

```math
K=G_1\times\cdots\times G_r.
```
The embedding is injective because an element acting identically on all orbits
acts identically on the whole index set. Since all summands are nonnegative,

```math
\begin{aligned}
\sum_{h\in H}|a_h|
&\leq\sum_{k\in K}|a_k|
\\ &=\prod_{i=1}^r\left(
   \sum_{g\in G_i}\left|\prod_{j\in O_i}a_{j,g(j)}\right|\right)
\\ &\leq\prod_{i=1}^r\mathop{\mathrm{per}}A[O_i,O_i]
\\ &\leq\mathop{\mathrm{per}}A.
\end{aligned}
```
The penultimate step is the regular case already proved; singleton orbits are
immediate. The final step is (2). No extension of characters or nonnegativity of
individual generalized matrix functions is needed in this argument.

For abelian H, each point stabilizer is normal and equals the kernel of the
action on its orbit. The quotient by that stabilizer acts freely and
transitively. Thus every abelian H meets the hypothesis.

For a nonabelian example beyond globally semiregular actions, take the direct
product of the regular action of S_3 on six points and the regular action of C_2
on two other points. Elements of either factor fix the other orbit, so the total
action is not semiregular, but (3) still applies.

## Review of the original character-extension proof

The proof in the root draft is also correct. For an abelian H, the product of
the regular orbit quotients is abelian. Every degree-one character of H extends
to that product, and averaging its extensions gives zero off H and its original
value on H. Factoring the generalized matrix functions on the independent
orbits, using their nonnegativity and then (2), gives the desired inequality.
The absolute-value proof above removes these extra representation-theoretic
steps and proves (3), which is stronger.

The argument does not extend to arbitrary permutation actions. For a
nonregular transitive action, several group elements can map a given i to the
same j. Then the support-counting step after (5) has multiplicities, and the
Grone–Pierce bound does not absorb them. Point stabilizers also need not be
normal, so orbit images need not be regular quotients.

## Bounded source audit

This audit used both web search engines, the exact article title and DOI,
author-page links, and combinations of the terms permanent/permanental
dominance with abelian, cyclic, regular, semiregular, fixed-point-free,
quasiregular, Latin square, and generalized matrix function. No explicit
earlier statement of (3) or the all-abelian conclusion was located. That
negative search result is not a proof of novelty.

1. **Grone–Pierce, 1988.** The publisher abstract verifies (1). The publisher
   PDF link redirects to the subscription abstract. The
   [ResearchGate article record](https://www.researchgate.net/publication/243095147_Permanental_Inequalities_for_Correlation_Matrices)
   expressly has no full text. An accessible public author copy was not found.
   The full eight-page paper, including all of its corollaries, therefore
   remains uninspected.
2. **Wanless, 2022.** The full
   [survey PDF](https://arxiv.org/pdf/2202.01867), page 9 of the PDF, presents the
   Grone–Pierce result as Theorem 5 and lists three consequences as Corollaries
   3–5: a bound using the diagonal product of C², the inequality
   (n−1)perA+detA≥n prod_i A_ii, and the bound n/(n−1) for singular correlation
   matrices. Its discussion of subgroup dominance includes Young subgroups
   with trivial characters. Text searches for abelian and cyclic found no
   occurrence. This survey does not explicitly state (3).
3. **Cheon–Wanless, 2005.** The full
   [survey](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf),
   Sections 3 and 7, retains the general subgroup inequality and degree-one
   Problem 2. Its reported large families concern symmetric-group immanants;
   it does not provide an all-abelian theorem in those sections.
4. **Herman, 2007.** The
   [public author-uploaded manuscript](https://www.researchgate.net/publication/240903668_A_Maximal_Eigenvalue_Conjecture_Equivalent_to_Permanental_Dominance)
   compares central and full Schur-power blocks. Its abelian observation
   identifies two spectral formulations. It is not an assertion that the
   resulting eigenvalues are bounded by the full permanent. Its C_5 example
   compares characters within that subgroup; this does not negate (3).
5. **Zeng, August 2026.** The full
   [order-four preprint](https://arxiv.org/html/2608.21749v1) explicitly restricts
   its main theorem to order four. It handles C_4 and the regular Klein-four
   action by separate finite-case inequalities and states no all-order
   abelian result. Its reference list does not cite Grone–Pierce. The Lean
   material was not used or inspected for verification.
6. **Lavi's current catalogue.** The
   [Problem 2 page](https://yair-lavi.com/mincs-list/problem-2/index.html)
   still lists C_5 among the groups yielding unresolved complex order-five
   cases. Formula (3) covers that group. This is a discrepancy between an
   elementary deduction from an older theorem and the catalogue's stated
   frontier; it does not establish priority or solve the full entry.

The defensible status is: the deduction is valid, the stated group scope is
proved from known inputs, and priority is unverified. No full-entry count is
increased.
