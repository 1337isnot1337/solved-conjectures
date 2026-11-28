# Lieb's permanental dominance conjecture

Research date: 20 November 2026 (America/Chicago).

Status: **No MINC entry is resolved here.** This checkpoint records exact
obstructions to transferring known permanent-on-top counterexamples to
Conjecture 42 or Problem 2. The new-vector calculation covers every appended
Gram vector for the specified cores and subgroup characters. It does not prove
the conjecture for other cores, other characters, or arbitrary orders.

## 1. Target and source status

[MINC Conjecture 42](https://yair-lavi.com/mincs-list/conjecture-42/index.html)
asks whether

```math
f_{H,\chi}(A):=\frac1{\chi(e)}\sum_{h\in H}\chi(h)
                    \prod_i a_{i,h(i)}\leq\mathop{\mathrm{per}}A
```

for every positive semidefinite Hermitian matrix and every character of every
permutation subgroup. [Problem 2](https://yair-lavi.com/mincs-list/problem-2/index.html)
asks for conditions on degree-one characters under which this holds. Both
entries are currently marked open. Problem 2's original wording is a
classification question; finding one failing character would refute the
universal prediction, without classifying all valid characters.

The known permanent-on-top counterexamples do not themselves settle either
entry. The relevant primary sources are Shchesnovich's order-five example,
Tran's simpler order-five example, and Drury's examples. Drury's 2018 paper
identifies the offending Specht block of Shchesnovich's example as $`(3,2)`$.
Full citations and links are in Section 9.

## 2. The dimension factor in subgroup extraction

Write $`N=n!`$, $`a_g=\prod_i a_{i,g(i)}`$, and choose unitary irreducible
representations $`\rho_\lambda`$ of $`S_n`$, of dimension $`d_\lambda`$. Set

```math
C_\lambda(A)=\sum_{g\in S_n}a_g\rho_\lambda(g).
```

The matrices $`C_\lambda`$ are positive semidefinite Fourier blocks of the
Schur power matrix, up to the harmless inverse/transposition convention. For a
linear character $`\chi`$ of $`H`$, define

```math
P_{\lambda,\chi}=\frac1{|H|}\sum_{h\in H}
                    \chi(h)\rho_\lambda(h^{-1}).
```

This is the orthogonal projection onto the $`\chi`$-isotypic subspace of
$`\rho_\lambda|_H`$. Fourier inversion gives, with $`m=[S_n:H]`$,

```math
\boxed{f_{H,\chi}(A)=\frac1m\sum_\lambda
                 d_\lambda\mathop{\mathrm{tr}}(C_\lambda P_{\lambda,\chi}).}
\tag{1}
```

Indeed, $`a_h=N^{-1}\sum_\lambda d_\lambda
\mathop{\mathrm{tr}}(C_\lambda\rho_\lambda(h^{-1}))`$; summing with coefficient
$`\chi(h)`$ proves (1). If only one block survives and its projection has
rank one, the generalized matrix function is $`d_\lambda/m`$ times a unit
Rayleigh quotient. Containment in an induced representation does not remove
this factor or permit choosing the spherical vector arbitrarily.

For an irreducible character of degree $`q`$, let
$`P_{\lambda,\chi}=(q/|H|)\sum_h\chi(h)\rho_\lambda(h^{-1})`$.
The corresponding normalized formula is

```math
f_{H,\chi}(A)=\frac1{mq^2}\sum_\lambda d_\lambda
                    \mathop{\mathrm{tr}}(C_\lambda P_{\lambda,\chi}).
\tag{2}
```

The weights in (2), counted with projection ranks, sum to one by Frobenius
reciprocity. Thus the function is a spectral average, not generally an
eigenvalue of the full Schur power matrix.

There is a source caveat here. Wanless's 2022 survey, page 4, states an
eigenvalue assertion that is too strong for general normalized characters.
For $`A=J_2\oplus[1]`$, the Schur power has eigenvalues only $`0,2`$, while
the normalized standard $`S_3`$ immanant is $`1`$. The numerical-range
statement in Zhang's 2016 survey, page 308, is correct and sufficient for the
usual permanent-on-top implication. None of the calculations below uses the
stronger assertion.

For a Gram matrix of rank $`r`$, Schur--Weyl duality gives

```math
C_\lambda=0\quad\text{if }\ell(\lambda)>r,
\qquad
\mathop{\mathrm{rank}}C_\lambda\leq\dim S_\lambda(\mathbb C^r).
\tag{3}
```

The rank statement follows by expressing the Fourier block as a reduced
Gram operator of the component of a decomposable tensor in
$`V_\lambda\otimes S_\lambda(\mathbb C^r)`$.

## 3. The affine group of order twenty

Let $`F_{20}=\mathop{\mathrm{AGL}}(1,5)\leq S_5`$, acting on $`\mathbb F_5`$.
Its index is six. Exact character sums give

```math
\mathop{\mathrm{Ind}}_{F_{20}}^{S_5}1=[5]+[2,2,1],\qquad
\mathop{\mathrm{Ind}}_{F_{20}}^{S_5}(\mathop{\mathrm{sgn}}|_{F_{20}})
      =[1^5]+[3,2].
\tag{4}
```

Each of its other two linear characters induces $`[3,1,1]`$. Consequently,
on rank-two Gram matrices, the four functions are respectively

```math
\frac{\mathop{\mathrm{per}}A}{6},\qquad
\frac56\langle v,C_{(3,2)}v\rangle,\qquad 0,\qquad0.
\tag{5}
```

Here $`v`$ is a fixed unit spherical vector for the chosen conjugate of the
group. Before imposing rank two, the sign formula also contains
$`\det A/6`$.

There are six conjugates. Their spherical lines can be represented in the
ten-dimensional space on two-subsets of $`\{1,\ldots,5\}`$ by vectors with
entries $`+1`$ on the five edges of a pentagon and $`-1`$ on its five
diagonals. Their squared norm is ten. The six normalized vectors form an
equiangular tight frame in the $`(3,2)`$ component, with
$`\sum vv^*=(6/5)I`$. Therefore the six sign-function values sum to
$`\mathop{\mathrm{tr}}C_{(3,2)}`$.

For the two published order-five examples the exact values are below. The
checker uses Shchesnovich's core up to entrywise conjugation; this leaves
the permanent, Schur-power spectrum, and all the real sign-character sums
unchanged.

| Core | Permanent | Six affine sign-function values |
|---|---:|---|
| Shchesnovich | 814016640 | 234838080, 175632320, 217411520, 286627520, 253091520, 231295040 |
| Tran | 504 | 160, 160, 160, 160, 160, 160 |

Moreover, Shchesnovich's published top eigenvalue
$`320(2185775+\sqrt{160600333345})`$, and Tran's top eigenvalue $`512`$,
are both strictly below $`(6/5)\mathop{\mathrm{per}}A`$. Thus even arbitrary
alignment with the top eigenspace would not make (5) violate dominance for
either core. The checker verifies these comparisons with integer arithmetic.

## 4. The exceptional subgroup of order 120 in $`S_6`$

Acting with $`S_5`$ on the six lines from Section 3 gives an explicit
exceptional subgroup $`H\cong S_5`$ of $`S_6`$. It has index six and six
conjugates. The checker verifies the following induced-character identity at
all 720 elements of $`S_6`$:

```math
\mathop{\mathrm{Ind}}_H^{S_6}(\mathop{\mathrm{sgn}}|_H)=[1^6]+[3,3].
\tag{6}
```

For rank two, its sign function is $`(5/6)\langle v,C_{(3,3)}v\rangle`$.
Unlike the previous examples, a simple octahedral configuration passes the
raw spectral threshold. Take $`A=W^*W`$, where

```math
W=\begin{pmatrix}1&0&1&1&1&1\\0&1&1&-1&i&-i\end{pmatrix}.
```

Its permanent is $`240`$. Its $`(3,3)`$ block has rank one by (3), and its
exact trace is $`336`$, so its unique nonzero eigenvalue is $`336`$.
This exceeds $`(6/5)240=288`$. Nevertheless, the six subgroup sign values
are

```math
120,\ 120,\ 24,\ 24,\ 24,\ 24.
```

Thus passing the dimension threshold does not solve the alignment problem.
These calculations are exact Gaussian-integer identities, not numerical
eigenvalue approximations.

## 5. The Fano-plane group and Drury's seven-vector example

Let $`H=\mathop{\mathrm{GL}}(3,2)`$ act on the seven nonzero binary vectors.
It has order 168 and index 30 in $`S_7`$. Its numbers of orbits on
$`k`$-subsets for $`k=0,1,2,3`$ are $`1,1,1,2`$. The multiplicities of
the two-row partitions in $`\mathop{\mathrm{Ind}}_H^{S_7}1`$ are therefore
$`1,0,0,1`$. On rank-two matrices,

```math
f_{H,1}(A)=\frac{\mathop{\mathrm{per}}A+
                    14\langle v,C_{(4,3)}v\rangle}{30}.
\tag{7}
```

Use the unnormalized columns $`e_1,e_2,(1,\zeta^j)^T`$, $`0\leq j<5`$,
where $`\zeta=e^{2\pi i/5}`$. They are Drury's seven-vector example with
the last five columns multiplied by $`\sqrt2`$. All degree-seven functions
are consequently multiplied by $`32`$.

The exact calculation in $`\mathbb Z[\zeta]`$ gives

```math
\mathop{\mathrm{per}}A=1440,\quad
\mathop{\mathrm{tr}}C_{(4,3)}=4200,\quad
\mathop{\mathrm{tr}}C_{(4,3)}^2=8820000.
```

By (3) this block has rank at most two. Positivity and the two moments force
both nonzero eigenvalues to equal $`2100`$. Hence every conjugate of the
Fano subgroup satisfies

```math
f_{H,1}(A)\leq\frac{1440+14\cdot2100}{30}=1028<1440.
\tag{8}
```

For Drury's correlation normalization this reads $`f_{H,1}\leq257/8<45`$.
The offending block is $`(4,3)`$, not the cofactor block $`(6,1)`$.

## 6. Why orthogonal marker vectors cannot repair the transfer

This obstruction holds in every order and for characters of any degree.
Let

```math
B=A\oplus J_{m_1}\oplus\cdots\oplus J_{m_s},\qquad
Y=S_{m_1}\times\cdots\times S_{m_s}.
```

For $`H\leq S_{n+\sum m_j}`$, put $`K=H\cap(S_n\times Y)`$, and let
$`G\leq S_n`$ be the projection of $`K`$ onto its first factor. Let
$`K_0`$ be the kernel of that projection. If $`\chi`$ has degree $`q`$,
the $`K_0`$-fixed subspace of its representation is $`K`$-invariant and
descends to a character $`\theta`$ of $`G`$, of degree $`q'\leq q`$.
Summing over each fiber of $`K\to G`$ gives

```math
f_{H,\chi}(B)=\frac{|K_0|q'}q f_{G,\theta}(A),\qquad
\mathop{\mathrm{per}}B=|Y|\mathop{\mathrm{per}}A.
\tag{9}
```

If $`q'=0`$, the first expression is zero. Otherwise their ratio is the
old ratio multiplied by $`|K_0|q'/(|Y|q)\leq1`$. A violation after adding
such markers therefore implies a violation already present in the original
order, for some irreducible constituent of $`\theta`$. For a linear
character, $`q'`$ is zero or one and $`\theta`$ is linear when nonzero.

In particular, adjoining an identity matrix cannot convert a mere
permanent-on-top violation into a new dominance violation. Positive diagonal
rescaling of the marker vectors does not change this conclusion.

This argument does not cover arbitrary orthogonal Gram blocks. For example,
on $`A\oplus B`$, the diagonal subgroup
$`\{(g,g):g\in S_n\}`$ with trivial character gives
$`\mathop{\mathrm{per}}(A\circ B)`$. Thus a Chollet counterexample would be a
dominance counterexample in twice the order. This identity does not transfer
a permanent-on-top counterexample by itself.

Another proposed amplification would extract
$`\mathop{\mathrm{tr}}C_\lambda^k`$ through tuples satisfying
$`g_1\cdots g_k=e`$. For a nonabelian group, that set is not a subgroup of
the direct product when $`k\geq2`$. It cannot be substituted for the
permutation subgroup in Problem 2.

## 7. Appending an arbitrary Gram vector

There is an exact all-order test for a proposed one-vector transfer. The
following derivation uses a linear character; the normalized sums give the
same identity for a character of higher degree $`q`$, with $`\chi(g)/q`$
in place of $`\chi(g)`$ in (10).

Let $`A=W^*W`$ have order $`n`$, let $`H\leq S_{n+1}`$, and let
$`K=\{g\in H:g(n+1)=n+1\}`$, viewed as a subgroup of $`S_n`$. Use the
restricted character on $`K`$, and define

```math
P=\mathop{\mathrm{per}}A,\qquad \delta=P-f_{K,\chi|_K}(A),\qquad
D_{ji}=\mathop{\mathrm{per}}A(i\mid j).
```

The orientation of the cofactor transpose is deliberate. Define

```math
(D_H)_{ji}=\sum_{\substack{g\in H:\ g(n+1)=j,\ g(i)=n+1}}
           \chi(g)\prod_{\substack{k\leq n\\k\ne i}}a_{k,g(k)}.
\tag{10}
```

For $`B=\begin{pmatrix}A&b\\b^*&c\end{pmatrix}`$, separating permutations
that fix the new index from those that move it gives exactly

```math
\mathop{\mathrm{per}}B=cP+b^*Db,\qquad
f_{H,\chi}(B)=c f_{K,\chi|_K}(A)+b^*D_Hb.
\tag{11}
```

Taking inverse permutations in (10) shows that $`D_H`$ is Hermitian. Write
the new Gram vector as $`v+u`$, where $`v`$ lies in the span of the old
vectors and $`u`$ is orthogonal to that span. Then $`b=W^*v`$ and
$`c=\|v\|^2+\|u\|^2`$. Thus

```math
\boxed{\mathop{\mathrm{per}}B-f_{H,\chi}(B)
   =v^*M v+\delta\|u\|^2,\qquad
M=\delta I+W(D-D_H)W^*.}
\tag{12}
```

When $`\delta\geq0`$, a negative eigenvalue of $`M`$ would give an actual
counterexample, with a positive semidefinite Gram matrix by construction.
When $`\delta\geq0`$ and $`M\succeq0`$, no appended vector in any ambient
dimension can work.
This reduces an infinite vector search to an exact Hermitian inequality; it
does not establish that inequality in general.

We applied (12) to the two published order-five cores and all six
exceptional $`S_5\leq S_6`$ sign characters. Every $`\delta`$ is positive,
and every $`2\times2`$ matrix $`M`$ is strictly positive definite. For
Shchesnovich's core the smallest of the six determinants is
$`5289492733102080000`$; for Tran's core it is $`2109312`$. Both diagonal
entries are positive in every certificate. Therefore **no appended vector**
can turn either of these cores into a counterexample for any of these six
characters. Orthogonal components are covered by the last term of (12).

The check also evaluates the full degree-six functions at
$`v=(1,0),(0,1),(1,1),(1,i)`$. These four exact evaluations independently
check all real coefficients and the conjugation convention of the Hermitian
quadratic form. Positivity of the resulting form, not those four evaluations
alone, proves the all-vector assertion.

## 8. Reproduction and remaining gap

Run, in this directory:

```sh
python f20_transfer_check.py
python exceptional_transfer_check.py
python one_vector_transfer_check.py
```

The scripts use only the Python standard library. They write, respectively,
`f20_transfer_certificate.json`, `exceptional_transfer_certificate.json`,
and `one_vector_transfer_certificate.json`. All proof checks use integer,
Gaussian-integer, or cyclotomic-integer arithmetic. No floating-point
optimizer or eigenvalue test is used in these certificates.

The unresolved task is to find a group, character, and Gram configuration
whose actual subgroup function exceeds the permanent, or to prove the full
inequality. A negative eigenvalue in (12), for an exact core with
$`\delta\geq0`$, would supply one concrete route. The existing cores checked
here do not have that property. Multiple coupled ancillas and other subgroup
characters have not been excluded by this work.

## 9. Sources

1. E. H. Lieb, *Proofs of some conjectures on permanents*, J. Math. Mech. 16
   (1966), 127--134. [JSTOR](https://www.jstor.org/stable/24901474).
2. V. S. Shchesnovich, *The permanent-on-top conjecture is false*, Linear
   Algebra Appl. 490 (2016), 196--201.
   [Publisher](https://doi.org/10.1016/j.laa.2015.10.034);
   [author-uploaded manuscript](https://www.researchgate.net/publication/280495158_The_permanent_on_top_conjecture_is_false).
3. Tran Hoang Anh, *A simple counterexample for the permanent-on-top
   conjecture*, Math. Inequal. Appl. 25 (2022), 1--16.
   [Published PDF](https://files.ele-math.com/articles/mia-25-01.pdf);
   [arXiv version](https://arxiv.org/abs/2101.03428).
4. S. W. Drury, *A counterexample to a question of Bapat and Sunder*,
   Electron. J. Linear Algebra 31 (2016), 69--70.
   [Published PDF](https://journals.uwyo.edu/index.php/ela/article/download/1631/1631/1631).
5. S. Drury, *A counterexample to a question of Bapat & Sunder*,
   Math. Inequal. Appl. 21 (2018), 517--520.
   [Published PDF](https://files.ele-math.com/articles/mia-21-37.pdf).
6. F. Zhang, *An update on a few permanent conjectures*, Special Matrices 4
   (2016), 305--316. [DOI](https://doi.org/10.1515/spma-2016-0030);
   [author's institutional PDF](https://scholars.nova.edu/ws/portalfiles/portal/42826589/An%20Update%20on%20a%20Few%20Permanent%20Conjectures.pdf).
7. I. M. Wanless, *Lieb's permanental dominance conjecture*, 2022.
   [arXiv](https://arxiv.org/abs/2202.01867);
   [published chapter](https://doi.org/10.4171/90-2/48).

The calculations and obstruction lemmas above are recorded as research
bookkeeping. No novelty claim is made for the Fourier formulas, induction
decompositions, or padding argument.
