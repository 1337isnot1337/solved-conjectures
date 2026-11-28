# Counterexample to the Caiolo–Ferroni–Hoster conjecture

**Status (2026-11-23):** complete written disproof of Conjecture 7.3 and of the accompanying dual right augmented real-rootedness conjecture; exact independent calculations agree. External review and Lean verification pending. This is one named-conjecture resolution, not two entries. Priority is not asserted.

## Theorem

For every prime power $`q\ge 17`$ there is a simple rank-five matroid $`M_q`$ such that its dual Chow polynomial has no real roots, and its dual right augmented Chow polynomial has exactly one real root, at $`-1`$. In particular this refutes the unrestricted real-rootedness assertion of [Caiolo–Ferroni–Hoster, Conjecture 7.3](https://arxiv.org/html/2605.28474v1#S7.SS2).

The construction adapts the hyperplane-coalescence and Gabidulin-code mechanism of [Bérczi–Coron–Eur–Li, Proposition 3.11 and Section 4.2](https://arxiv.org/html/2610.17135v1#S4.SS2). Their paper treats ordinary Chow and chain polynomials, not the dual invariant. The new calculation uses rank five and the dual gamma formula. Prior work on this repository's issue [#111](https://github.com/1337isnot1337/solved-conjectures/issues/111) tested different families and developed a negative-zeta amplification criterion; the present direct counterexample does not need that criterion.

## Construction and matroid verification

Let $`K=\mathbb F_{q^4}`$, $`V=K\oplus K`$ over $`\mathbb F_q`$, and let $`P(V)`$ be its projective points. Adjoin a disjoint set of free points $`p_a`$, one for each $`a\in K`$. Write $`m=q^4`$, $`b=q^{16}`$.

For each $`a\in K`$ and $`u,v,w\in K`$, form the four-dimensional graph subspace

```math
W_{a,u,v,w}=\{(t,ut+vt^q+wt^{q^2}+at^{q^3}):t\in K\}.
```

There are $`q^{16}`$ distinct graph subspaces: if two maps are equal, their difference, of ordinary polynomial degree at most $`q^3<q^4`$, vanishes at all $`q^4`$ field elements, and thus all four coefficients vanish. For fixed $`a`$, two distinct maps differ by a nonzero polynomial of degree at most $`q^2`$, so their kernel has at most $`q^2`$ elements. Their graphs intersect in dimension at most two. Each family indexed by $`a`$ has $`q^{12}`$ members.

Let $`Q=P(V)\oplus U_{X,X}`$, with $`X=\{p_a:a\in K\}`$ (here $`P(V)`$ denotes the projective geometry matroid). Let $`N`$ be the rank-five truncation of $`Q`$. For each graph subspace coalesce the block $`H=P(W_{a,u,v,w})\cup\{p_a\}`$. Such a block is a rank-five flat of $`Q`$ and a proper spanning subset of $`N`$. Distinct blocks with the same $`a`$ intersect in rank at most $`2+1=3`$; those with distinct $`a`$ have no common auxiliary point and intersect in rank at most three. Thus no independent four-set belongs to two blocks. This verifies BCEL's coalescence hypotheses.

For completeness, the resulting matroid can also be checked directly. Take as independent sets all $`N`$-independent sets of size at most four and the $`N`$-independent five-sets not contained in any block. The family is hereditary and contains five-sets (choose five linearly independent geometric points). The only augmentation case not inherited from $`N`$ is an independent four-set $`I`$ and an allowed five-set $`J`$. There exists an $`e\in J\setminus\mathop{\mathrm{cl}}_N(I)`$ by rank. If no such $`e`$ gives an allowed five-set, each belongs with $`I`$ to a block, and by uniqueness they belong to the same block $`H`$. Moreover $`\mathop{\mathrm{cl}}_N(I)=\mathop{\mathrm{cl}}_Q(I)\subseteq H`$, because the rank of $`I`$ is four, below the truncation rank, and $`H`$ is a flat of $`Q`$. Consequently $`J\subseteq H`$, contradiction. This proves the independent-set axioms.

Flats of rank at most three are unchanged, since independence up to size four is unchanged. Every rank-four flat is the closure of some independent four-set $`I`$: if $`I`$ is in a block $`H`$, this closure is exactly $`H`$, by the same uniqueness and closure argument. Otherwise it is $`\mathop{\mathrm{cl}}_N(I)`$, an old rank-four flat not contained in a block. In particular all singleton and rank-two flats retain their original ranks, so the matroid is simple. This establishes the entire relevant flat lattice without assuming a representation of the final matroid.

## Exact flag enumeration

Use $`D_{d,t}`$ for the product of the subspace lattice of $`\mathbb F_q^d`$ and the Boolean lattice on $`t`$ points. Define $`A(d,t;S)`$ to be its flag count for a strictly increasing sequence of selected ranks $`S`$, including the unique top if its rank occurs. In particular $`A(d,t;\varnothing)=1`$. If $`S\ne\varnothing`$, put $`s=\max S`$, $`S'=S\setminus\{s\}`$. Counting the largest selected flat yields

```math
A(d,t;S)=\sum_{i=\max(0,s-t)}^{\min(d,s)}
 {d\brack i}_q {t\choose s-i} A(i,s-i;S').
```

The Gaussian coefficient $`{d\brack i}_q`$ counts $`i`$-dimensional subspaces and can be computed by
```math
{d\brack i}_q={d-1\brack i-1}_q+q^i{d-1\brack i}_q,
\quad {0\brack0}_q=1,
```
with out-of-range entries zero.

Put $`N_i={8\brack i}_q`$, $`L={4\brack 3}_q`$.
All proper ranks less than four in $`M_q`$ agree with $`D_{8,m}`$. Hyperplanes, grouped by the product lattice whose lower flats describe them, are precisely:

| Lower lattice type $`(d,t)`$ | Multiplicity |
|---|---:|
| $`(4,0)`$ | $`N_4-b`$ |
| $`(4,1)`$, truncated to rank four | $`b`$ |
| $`(3,1)`$ | $`mN_3-bL`$ |
| $`(2,2)`$ | $`N_2\binom m2`$ |
| $`(1,3)`$ | $`N_1\binom m3`$ |
| $`(0,4)`$ | $`\binom m4`$ |

Indeed each selected geometric four-space is replaced by its coalesced block. Each block also removes its $`L`$ old rank-four flats comprising a geometric three-space and the auxiliary point. The bound on intersections in each family ensures that no such old flat is removed twice. All rank-four flats with at least two auxiliary points remain unchanged. Within a coalesced block, the lower flats of ranks at most three are precisely those of $`D_{4,1}`$, because the lower ranks of the ambient matroid are unchanged.

If $`\alpha(S)`$ is the flag count of $`M_q`$, for $`S\subseteq\{1,2,3\}`$ it equals $`A(8,m;S)`$. If $`4\in S`$, it is the sum of $`A(d,t;S\setminus\{4\})`$ times the corresponding multiplicities in the table. Define $`\beta(S)=\sum_{T\subseteq S}(-1)^{|S|-|T|}\alpha(T)`$.

## Dual gamma-polynomial certificate

By CFH Theorem 4.9, with $`R=\{1,2,3,4\}`$,
```math
H^*_{M_q}(x)=g_0(1+x)^4+g_1 x(1+x)^2+g_2x^2,
```
where
```math
g_0=\beta(R),\qquad g_1=\sum_{i=1}^3\beta(R\setminus\{i\}),
\qquad g_2=\beta(R\setminus\{1,3\}).
```
For the dual right augmented polynomial,
```math
F^*_{M_q}(x)=h_0(1+x)^5+h_1 x(1+x)^3+h_2x^2(1+x),
```
where $`h_0=g_0`$, $`h_1=\sum_{i=1}^4\beta(R\setminus\{i\})`$, and $`h_2=\sum_{i<j,\ j-i\ge2}\beta(R\setminus\{i,j\})`$.

At $`q=17`$, $`m=83521`$, $`b=48661191875666868481`$, exact evaluation gives

```math
(g_0,g_1,g_2)=(1367432169863264385040621589,
\ 677031173160167651396287043,
\ 85823997163784007690567699)
```
and
```math
g_1^2-4g_0g_2=-11062769241414341239970603495681493737981374532130995<0.
```
Likewise
```math
(h_0,h_1,h_2)=(1367432169863264385040621589,
\ 677047053626088109460305403,
\ 85827739133054463066849240),
```
```math
h_1^2-4h_0h_2=-11061733404916469626152098526056073213151599377977031<0.
```

This single exact witness already refutes both assertions. To see why, write $`z=x/(1+x)^2`$ for real $`x\ne-1`$. The quadratic $`g_0+g_1z+g_2z^2`$ has negative discriminant and positive leading coefficient, so is strictly positive for all real $`z`$. Thus $`H^*_{M_q}(x)\ne0`$ for all real $`x\ne-1`$, and its value at $`-1`$ is $`g_2>0`$. Its degree is four. Similarly, the augmented polynomial has no real zero other than $`-1`$, which is simple because $`F^*/(1+x)`$ has value $`h_2>0`$ there.

The same recurrences give rational polynomials in $`q`$, since $`m=q^4,b=q^{16}`$ and all required binomials have fixed lower index at most four. Both negative discriminants, shifted by $`q=17+s`$, have degree 43, with all 44 coefficients strictly positive; leading coefficient 4. The accompanying exact rational symbolic verifier checks this certificate. Consequently both discriminants are strictly negative for all real $`q\ge17`$ in the expressions and therefore for every prime power in the stated construction. Positivity of $`g_2,h_2`$ follows either from the explicit gamma polynomials or from the negative discriminants and $`g_0=h_0>0`$, the top absolute Möbius invariant of a loopless geometric lattice.

## Literature and priority

- CFH, arXiv:2605.28474v1, Conjecture 7.3 and Theorem 4.9. Their uniform-matroid theorem does not settle this construction; the EL-shellable-poset counterexample in their Remark 7.4 is not a matroid.
- BCEL, arXiv:2610.17135v1, Proposition 3.11, Proposition 4.13, and Section 4.2, are credited for the matroid construction method. Their text was checked for "dual Chow" and "Caiolo"; no matches. Their disproofs of the ordinary Chow, chain, and augmented Chow conjectures do not imply a disproof of this dual invariant.
- Per Alexandersson's [current open-problem catalogue](https://www.symmetricfunctions.com/realRootedOpenProblems.htm) still lists CFH Conjecture 7.3 and its augmented extension as open, despite explicitly listing the BCEL counterexamples elsewhere.
- The prior October 29 discussion [RealRooted issue #1394](https://github.com/PerAlexandersson/RealRooted/issues/1394#issuecomment-6506049597) distinguishes this remaining conjecture.

A targeted public literature check on 2026-11-23 found no earlier resolution of this exact dual assertion; this is not an exhaustive proof of priority. The mathematical disproof is unconditional given the published gamma identity, which is applied with its original hypotheses. No outside acceptance or peer review is claimed.

## Replay

See the companion verifier for independent integer flag and incidence-algebra calculations at $`q=17`$ and the exact symbolic sign certificate for $`q\ge17`$. No numerical root finder or exhaustive construction of the enormous ground set is needed.
