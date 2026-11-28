# Shallit 9: exact dyadic structure and the determinant gap

21 November 2026. Continuation of [issue 216](https://github.com/1337isnot1337/solved-conjectures/issues/216), reserved in [comment 7069254092](https://github.com/1337isnot1337/solved-conjectures/issues/216#issuecomment-7069254092). The full paid target is unresolved. No larger finite nonvanishing range is claimed here.

## Target and fresh source check

The fixed point starting at 1 of the morphism $`1\mapsto12,2\mapsto23,3\mapsto14,4\mapsto32`$ is denoted by $`a_n`$. The [original sponsor presentation](https://cs.uwaterloo.ca/~shallit/Talks/bc4.pdf), slide 35, offers £50 for deciding whether every shifted Hankel determinant of this sequence is nonzero, with both order and shift unrestricted. This is the existing target in the repository, not a new problem created from a finite range.

I re-read the sponsor's [current status page](https://cs.uwaterloo.ca/~shallit/talks.html) and searched the exact morphism, its initial word, the problem number, and current Hankel/morphism literature. The separately rewarded three-real-number Problem 8 is already solved by Cavalcante's [July 2026 Dakota construction](https://zenodo.org/records/21728308). Its coefficients are a transcendental translate of a three-valued sequence. It is not this four-integer word. The sponsor explicitly distinguishes the unresolved integer question. No matching full resolution of Problem 9 was located in this check. This is a source audit, not a guarantee of priority or of payment.

The existing repository note proves all-order independence of every set of at most three columns and verifies all shifts through order 4096. That work is preserved and credited. The present direction concerns dyadic structure, not an extension of that finite screen.

## Exact finite kernel

Let

```math
f_0=(1,2,1,3),\qquad f_1=(2,3,4,2).
```

The substitution gives $`a_{2n+d}=f_d(a_n)`$. A coding vector $`v=(v_1,v_2,v_3,v_4)`$ represents the infinite sequence $`v_{a_n}`$. Its two sections have coding vectors

```math
T_d(v)=(v_{f_d(1)},v_{f_d(2)},v_{f_d(3)},v_{f_d(4)}).
```

Starting with $`(1,2,3,4)`$, repeated application of these two exact maps gives 79 distinct vectors. The [closure script](dyadic-kernel.py) records every state, both transitions, and an offset/depth word reaching it in [the certificate](dyadic-kernel.json). All four letters occur in the third substitution iterate, so distinct coding vectors represent distinct infinite sequences. Closure and reachability therefore certify the complete 2-kernel, rather than a sample of subsequences.

Four states are constant. They give the identities, for every nonnegative integer $`n`$,

```math
a_{64n+12}=1,\qquad
a_{128n+25}=2,\qquad
a_{256n+51}=3,\qquad
a_{512n+103}=4.
```

These identities follow from the exact section maps. They do not use a finite determinant screen or imply singularity of a contiguous Hankel matrix.

## Dyadic blocks do not yet close a determinant induction

For any sequence $`u`$, write $`H_m^u(t)=(u_{t+i+j})_{0\le i,j\lt m}`$. Set $`b_n=a_{2n}`$ and $`c_n=a_{2n+1}`$. Simultaneously ordering rows and columns by parity gives

```math
H_{2m}^a(2t)\sim
\begin{pmatrix}
H_m^b(t)&H_m^c(t)
\\ H_m^c(t)&H_m^b(t+1)
\end{pmatrix},
```

and

```math
H_{2m}^a(2t+1)\sim
\begin{pmatrix}
H_m^c(t)&H_m^b(t+1)
\\ H_m^b(t+1)&H_m^c(t+1)
\end{pmatrix}.
```

The simultaneous permutation changes no determinant sign. Analogous rectangular off-diagonal blocks handle odd orders. These are entrywise identities, not determinant factorizations.

The finite kernel does not itself provide a finite closed family under Schur complements. In fact it includes constant sequences, whose Hankel matrices are singular in every order at least2. Consequently an induction asserting nonvanishing for every auxiliary kernel sequence is false. Singular blocks also prevent unconditional inversion of the block that a proposed elimination happens to choose.

[Bacher's recurrence-matrix paper](https://arxiv.org/abs/math/0703428), and its [published primary account](https://comptes-rendus.academie-sciences.fr/mathematique/articles/10.1016/j.crma.2005.11.025/), give an established way to prove exact Hankel determinant formulas for a different Thue–Morse-derived sequence. That theorem is not an automatic consequence of finite kernel and is not a solution of this target.

The missing obligation is an actual closed symbolic determinant/elimination system with a proved nonzero invariant for this particular word, or a verified singular contiguous matrix refuting the complete assertion. Neither has been obtained. The finite-kernel computation is a structural checkpoint only and adds no completed bounty.
