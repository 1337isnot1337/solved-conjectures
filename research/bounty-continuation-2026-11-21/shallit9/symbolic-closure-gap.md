# Shallit Problem 9: symbolic dyadic closure attempt

Date: 2026-11-21. Status: no full proof or counterexample. This note records a bounded symbolic attempt on the existing £50 target in [issue 216](https://github.com/1337isnot1337/solved-conjectures/issues/216). It does not extend the repository's finite determinant screen and is not a completed bounty.

## 1. Exact target and source scope

Let $`a=a_0a_1\ldots`$ be the fixed point starting in 1 of

```math
1\mapsto12,\qquad 2\mapsto23,\qquad 3\mapsto14,\qquad 4\mapsto32.
```

The target asks whether

```math
\det H_n(k)\ne0,
\qquad H_n(k)=(a_{k+i+j})_{0\le i,j\lt n},
\qquad n\ge1,\ k\ge0.
```

Shallit states the exact morphism and £50 offer as Open Problem 9 on slide 35 of the [2014 BC4 talk](https://cs.uwaterloo.ca/~shallit/Talks/bc4.pdf). The [sponsor's current talk page](https://cs.uwaterloo.ca/~shallit/talks.html) distinguishes the resolved three-real-number Problem 8 from the remaining integer problem. No claim about eligibility acceptance or payment is made here. Root refreshed those sources before reserving this continuation at [comment 7069254092](https://github.com/1337isnot1337/solved-conjectures/issues/216#issuecomment-7069254092).

The same morphism already appears as Problem 44 on printed page 2234 of Shallit's contribution to the [2010 Oberwolfach report](https://ems.press/content/serial-article-files/46296), DOI [10.4171/OWR/2010/37](https://doi.org/10.4171/OWR/2010/37). Its following Conjecture 45 predicts a zero Hankel determinant modulo every fixed integer modulus. That is a conjecture in the source, not a theorem used in this note.

The existing repository note, `research/shallit-hankel/README.md`, already proves independence of every set of at most three columns, and records all-shift nonsingularity through order 4096. Neither statement is reproved or enlarged here. The separate [dyadic-kernel script](dyadic-kernel.py) gives the exact 79-state 2-kernel, including constant sections. Those constants already prevent an induction asserting nonvanishing for every auxiliary kernel sequence.

## 2. Exact all-index Mahler identities

Set

```math
E=(1,2,1,3),\qquad O=(2,3,4,2).
```

Thus $`a_{2n}=E(a_n)`$ and $`a_{2n+1}=O(a_n)`$, where tuples are read as maps on $`\{1,2,3,4\}`$ in that order. Define the indicator series

```math
f_j(z)=\sum_{n\ge0}\mathbf1_{\{a_n=j\}}z^n,
\qquad G(z)=f_1(z)+f_3(z),\qquad A(z)=\sum_{n\ge0}a_nz^n.
```

Splitting each sum into its even and odd indices proves, as identities of formal power series,

```math
\begin{aligned}
f_1(z)&=f_1(z^2)+f_3(z^2),
\\ f_2(z)&=f_2(z^2)+z f_1(z^2)+z f_4(z^2),
\\ f_3(z)&=f_4(z^2)+z f_2(z^2),
\\ f_4(z)&=z f_3(z^2),
\\ f_1(z)+f_2(z)+f_3(z)+f_4(z)&=\frac1{1-z}.
\end{aligned}
```

Thus $`G`$ is the indicator series for odd-valued letters. The first identity gives $`f_1(z)=G(z^2)`$, and consequently

```math
\begin{aligned}
f_3(z)&=G(z)-G(z^2),
\\ f_4(z)&=z\bigl(G(z^2)-G(z^4)\bigr),
\\ f_2(z)&=\frac1{1-z}-G(z)-zG(z^2)+zG(z^4).
\end{aligned}
```

Substituting these into the equation for $`f_3`$ gives the scalar order-three Mahler equation

```math
G(z)=(1-z)G(z^2)+z^2(1-z)G(z^4)-z^2(1-z)G(z^8)+\frac{z}{1-z^2}.
\tag{1}
```

The original integer series has either of the equivalent expressions

```math
A(z)=\frac2{1-z}+G(z)+(-2+2z)G(z^2)-2zG(z^4)
\tag{2}
```

and

```math
A(z)=\frac{2+3z}{1-z^2}-(1-z)G(z^2)
 +\bigl(z^2(1-z)-2z\bigr)G(z^4)-z^2(1-z)G(z^8).
\tag{3}
```

Equation (2) follows directly from $`A=f_1+2f_2+3f_3+4f_4`$. For (3), the even and odd output maps satisfy

```math
E(s)+O(s)=5-2\mathbf1_{\{s=1\}},
\qquad E(s)=2-\mathbf1_{\{s=1\}}-\mathbf1_{\{s=3\}}+\mathbf1_{\{s=4\}}.
```

Hence $`A(z)=\sum_n(E(a_n)+zO(a_n))z^{2n}`$ gives (3). These identities are valid at every index; the finite verifier is only a sanity check on the displayed formulas. In terms of the letter-1 indicator $`F(z)=f_1(z)=G(z^2)`$, equation (1) instead reads

```math
F(z)=(1-z^2)F(z^2)+z^4(1-z^2)F(z^4)-z^4(1-z^2)F(z^8)+\frac{z^2}{1-z^4}.
```

Earlier internal messages mishandled the argument of $`f_3`$ or $`f_4`$ during the substitutions. They are superseded by this derivation and its exact coefficient check. In particular, the substitution in the third indicator equation uses $`f_4(z^2)=z^2(G(z^4)-G(z^8))`$.

### The constant-free output space does not split into smaller invariant pieces

For an output vector $`x=(x_1,x_2,x_3,x_4)`$, quotient out the constant vectors and use coordinates

```math
u=(x_2-x_1,x_3-x_1,x_4-x_1)^{\mathsf T}.
```

Composition with the even and odd transition maps acts by

```math
T_0=\begin{pmatrix}1&0&0\\0&0&0\\0&1&0\end{pmatrix},
\qquad
T_1=\begin{pmatrix}-1&1&0\\-1&0&1\\0&0&0\end{pmatrix}.
```

Flatten the following nine matrices in row-major order and use them as columns of a $`9\times9`$ matrix:

```math
I,\ T_0,\ T_1,\ T_0^2,\ T_1T_0,\ T_0T_1,
\ T_1^2,\ T_1T_0^2,\ T_0T_1T_0.
```

The resulting determinant is exactly $`-1`$. They therefore form an integral basis of $`M_3(\mathbb Z)`$. Over any field the transition algebra is the full matrix algebra, so it has no common proper nonzero invariant subspace on this quotient. This rules out a reduction by a fixed linear output change to smaller invariant blocks. It does not rule out a change of variables depending on $`z`$, a nonlinear recurrence, or a larger determinant system.

## 3. The exact parity block identities and the failed closure

For any output coding $`v`$, write $`b_n=v(a_n)`$, $`b^{(0)}_n=b_{2n}`$, and $`b^{(1)}_n=b_{2n+1}`$. Let $`H_m^b(k)=(b_{k+i+j})_{i,j\lt m}`$. Reordering both rows and columns by parity gives

```math
H_{2m}^b(2k)\ \sim
\ \begin{pmatrix}
H_m^{b^{(0)}}(k)&H_m^{b^{(1)}}(k)
\\ H_m^{b^{(1)}}(k)&H_m^{b^{(0)}}(k+1)
\end{pmatrix},
\tag{4}
```

```math
H_{2m}^b(2k+1)\ \sim
\ \begin{pmatrix}
H_m^{b^{(1)}}(k)&H_m^{b^{(0)}}(k+1)
\\ H_m^{b^{(0)}}(k+1)&H_m^{b^{(1)}}(k+1)
\end{pmatrix}.
\tag{5}
```

Here $`\sim`$ means simultaneous row and column permutation, so there is no determinant sign change. The odd-order versions have the same entry formulas with rectangular off-diagonal blocks.

These are block identities, not scalar determinant recurrences. Already for the original coding, $`m=3,k=0`$, the blocks in (4) are

```math
P=\begin{pmatrix}1&2&2\\2&2&1\\2&1&2\end{pmatrix},
\quad
Q=\begin{pmatrix}2&3&3\\3&3&4\\3&4&3\end{pmatrix},
\quad
R=\begin{pmatrix}2&2&1\\2&1&2\\1&2&1\end{pmatrix}.
```

Here $`\det P=-5`$, and exact elimination gives

```math
R-QP^{-1}Q=
\begin{pmatrix}
-8/5&-3&-4
\\ -3&-6&-4
\\ -4&-4&-6
\end{pmatrix}.
\tag{6}
```

Its entries in positions $`(0,2)`$ and $`(1,1)`$ differ. Thus it is not Hankel. Every fixed-size, fixed-shift matrix obtained by a linear output coding, and every linear combination of such Hankel matrices, is Hankel. The Schur complement therefore leaves that entire matrix space in the first nontrivial example, not just the finite list of 79 kernel states. Its determinant is $`22`$, so the original order-six determinant is $`-110`$; no target singularity is claimed.

The precise missing object is a class of mixed matrices or bordered minors closed under the operations in (4)–(5), together with a uniform reason that every required pivot or determinant remains nonzero. No such class or invariant has been established here.

## 4. Two exact failures of an affine sign mechanism

For any finite square matrix $`B`$ and all-ones matrix $`J`$, $`\det(B+sJ)`$ is affine in $`s`$, because any term using two columns from $`J`$ vanishes. For $`b_n=a_n-1`$, put

```math
D=\det H_n^b(k),\qquad C=\sum_{i,j}\mathop{\mathrm{cof}}_{ij}(H_n^b(k)).
```

Then

```math
\det\bigl(J+tH_n^b(k)\bigr)=t^{n-1}(C+tD).
\tag{7}
```

For a Hankel matrix, subtracting each row from its successor and then each column from its successor proves

```math
C=\det H_{n-1}^{\Delta^2a}(k),
\qquad (\Delta^2a)_j=a_{j+2}-2a_{j+1}+a_j.
```

There is no general same-sign guarantee in (7). Two short exact witnesses, both inside the already verified target range, are:

| Order $`n`$ | Shift $`k`$ | Required factor | $`D`$ | $`C`$ | $`\det H_n^a(k)=D+C`$ |
|---:|---:|---|---:|---:|---:|
| 10 | 56 | `1232231423141232122` | 53 | -56 | -3 |
| 9 | 60 | `23142314123212231` | -619 | 284 | -335 |

In the first case (7) is $`t^9(-56+53t)`$, which has the positive root $`56/53`$. In the second case

```math
\det\bigl(H_9^a(60)+sJ\bigr)=-335+284s,
```

which has positive root $`335/284`$. The first defeats a same-sign cone after subtracting the constant 1; the second defeats the weaker proposal that adding a nonnegative constant to the original sequence preserves every determinant sign. Neither root is the original specialization under study.

## 5. Relevant prior methods and their limits

- Hu and Han's [automatic Hankel determinant paper](https://irma.math.unistra.fr/~guoniu/papers/p104ashankel.pdf), published in *Theoretical Computer Science* 795 (2019), [DOI 10.1016/j.tcs.2019.06.009](https://doi.org/10.1016/j.tcs.2019.06.009), treats unshifted determinants of a specified family of digit-multiplicative $`\{\pm1\}`$ sequences and the automaticity of their reduced determinants modulo 2. Its hypotheses do not cover the present four-state sequence or all shifts.
- Bacher's [*La suite de Thue–Morse et la catégorie Rec*](https://numdam.org/item/10.1016/j.crma.2005.11.025.pdf), [DOI 10.1016/j.crma.2005.11.025](https://doi.org/10.1016/j.crma.2005.11.025), gives an explicit LU decomposition for a different sequence, $`i^{s_2(n)}`$, and an unshifted determinant product. It demonstrates a possible kind of certificate; it does not supply one for this target.
- More generally, Bacher's [*Recurrence matrices*](https://arxiv.org/pdf/math/0601372), arXiv:math/0601372v2, Remark 15.5, proves that an invertible finite-complexity recurrence matrix can have an inverse of infinite recursive complexity. Thus finite input recursion alone does not justify assuming that Gaussian elimination stays in a finite recursive family. This is a general warning, not a proof that the present inverse or factorization has infinite complexity.

No priority claim is made for the elementary decimation identities or the auxiliary failures above. The all-order, all-shift £50 problem remains unresolved by this work.

## Verification

The companion [exact verifier](check_shallit9_symbolic_closure.py) uses integer/rational arithmetic to replay the 9-by-9 basis determinant, the displayed Schur complement, and both affine witnesses. It checks formal-series coefficients only as a transcription check for (1)–(3); the proof of those equations is the indicator-series derivation above. It performs no search for further nonzero target determinants. Its output is [shallit9-symbolic-closure-check.json](shallit9-symbolic-closure-check.json).
