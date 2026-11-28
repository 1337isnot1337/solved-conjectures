# Gyires's ratio inequality on positive-semidefinite permutation orbits

**Status:** Complete all-order theorem for a proper subclass of Minc Conjecture 20. It does **not** prove or disprove the unrestricted conjecture, so it adds **zero** completed entries to the MINC-list campaign. Independent priority review is still required. No Lean work.

## Original conjecture

Minc Conjecture 20 (Gyires) asks whether every real nonnegative doubly stochastic matrix A of order n satisfies

~~~math
\frac{4\mathop{\mathrm{per}}(A)^2}{\mathop{\mathrm{per}}(AA^{\mathsf T})+\mathop{\mathrm{per}}(A^{\mathsf T}A)+2\mathop{\mathrm{per}}(A^2)}
\ge \beta_n,\qquad \beta_n=\frac{n!}{n^n},
~~~

with equality only at J_n. The [specialist statement](https://yair-lavi.com/mincs-list/conjecture-20/index.html) lists the unrestricted conjecture as open (20 November 2026).

## Theorem (proper subclass in all orders)

Let S be *any* real symmetric positive-semidefinite doubly stochastic n-by-n matrix. Let P,Q be *arbitrary* permutation matrices, independently chosen, and put A=PSQ. Then

~~~math
\mathop{\mathrm{per}}(AA^{\mathsf T})
=\mathop{\mathrm{per}}(A^{\mathsf T}A)
=\mathop{\mathrm{per}}(S^2)
\le \mathop{\mathrm{per}}(S)=\mathop{\mathrm{per}}(A)
~~~

and

~~~math
0\le \mathop{\mathrm{per}}(A^2)\le \mathop{\mathrm{per}}(S^2).
~~~

In particular, for every n>=1 the **stronger** conclusion holds:

~~~math
\boxed{
\frac{4\mathop{\mathrm{per}}(A)^2}{\mathop{\mathrm{per}}(AA^{\mathsf T})+\mathop{\mathrm{per}}(A^{\mathsf T}A)+2\mathop{\mathrm{per}}(A^2)}
\ge \mathop{\mathrm{per}}(A)\ge\beta_n}.
~~~

Equality with beta_n occurs **if and only if** A=J_n. P and Q need not commute with S. The theorem includes genuinely nonsymmetric matrices and block-diagonal matrices in arbitrary orders.

### Lemma 1: permanent Cauchy--Schwarz

For arbitrary real n-by-n matrices X,Y,

~~~math
|\mathop{\mathrm{per}}(XY^{\mathsf T})|^2
\le \mathop{\mathrm{per}}(XX^{\mathsf T})\mathop{\mathrm{per}}(YY^{\mathsf T}).
~~~

Proof: If x_i,y_i are the rows and Sym is the orthogonal projection onto symmetric n-fold tensors, direct expansion gives

~~~math
\langle\mathop{\mathrm{Sym}}(x_1\otimes\cdots\otimes x_n),
\mathop{\mathrm{Sym}}(y_1\otimes\cdots\otimes y_n)\rangle
=\mathop{\mathrm{per}}(XY^{\mathsf T})/n!.
~~~

Apply vector Cauchy--Schwarz; the two norm squares are the two Gram permanents divided by n!.

### Lemma 2: positive-semidefinite monotonicity

If H,K are real symmetric, 0 <= H <= K in the Loewner order, then per(H)<=per(K). This follows from the same symmetric-tensor formula for per and positive semidefiniteness of

~~~math
K^{\otimes n}-H^{\otimes n}
=\sum_{j=1}^n K^{\otimes(j-1)}\otimes(K-H)\otimes H^{\otimes(n-j)}.
~~~

Every summand is positive semidefinite. This is *Loewner-order* monotonicity, not merely entrywise monotonicity.

### Proof of theorem

Since S is nonnegative and doubly stochastic, ||S||_op <= sqrt(||S||_1 ||S||_infinity)=1. Since S is symmetric and PSD, its eigenvalues lie in [0,1]. Hence 0 <= S^2 <= S in the Loewner order. Lemma 2 gives d:=per(S^2) <= p:=per(S). Plain row/column permutation invariance gives per(A)=p and

~~~math
AA^{\mathsf T}=PS^2P^{\mathsf T},\qquad
A^{\mathsf T}A=Q^{\mathsf T}S^2Q,
~~~

so both Gram permanents are exactly d.

Let R=QP, another permutation matrix. Since A^2=P S R S Q and a permanent is unchanged by outside row/column permutations,

~~~math
\mathop{\mathrm{per}}(A^2)=\mathop{\mathrm{per}}(S R S).
~~~

In Lemma 1 set X=S and Y=S R^{\mathsf T}. Then XY^{\mathsf T}=SRS, while XX^{\mathsf T}=YY^{\mathsf T}=S^2. Therefore |per(SRS)|<=d. Because A^2 is nonnegative, 0<=per(A^2)<=d.

Consequently the full Gyires denominator is at most 4d<=4p. It is strictly positive: its two Gram matrices are doubly stochastic and thus have positive permanent. The Gyires ratio is at least p. Finally the van der Waerden theorem gives p>=beta_n, with equality exactly at S=J_n; in that case A=PJ_nQ=J_n. If A is not J_n, then S is not J_n, and the Gyires inequality is strict. The argument includes n=1.

## Scope, prior work, and stronger-claim obstruction

The class consists of **two-sided permutation orbits of symmetric PSD doubly stochastic matrices**, not all doubly stochastic matrices. It includes arbitrary permutations that do not commute with S. The source page lists an invariant symmetric one-parameter family, spectral/entrywise neighborhoods, and few-permutation mixtures; it does not list this class. Existing repository work on [the spectral neighborhood](inequalities/gyires_spectral.md), [row-support at most two](gyires_sparse_support.md), and [block closure](gyires_weak_block_closure.md) covers different classes. No claim of novel priority is justified without a more thorough survey: the tensor Cauchy--Schwarz, PSD monotonicity, and van der Waerden bounds are classical.

The intermediate stronger claim that the Gyires ratio always exceeds per(A) is **false** without the orbit hypothesis. The average of the two 4-by-4 permutation matrices whose one-based row maps are (2,1,4,3) and (4,3,1,2) has per(A)=1/8 but per(AA^T)=per(A^T A)=per(A^2)=9/64. Thus its Gyires ratio is 1/9<1/8, although 1/9>beta_4=3/32. This does *not* contradict Gyires.

The theorem is a partial class result, not a full named MINC resolution. The rational diagnostic verifier checks specific examples, never the universal proof.

## Sources

- [Yair Lavi, MINC Conjecture 20](https://yair-lavi.com/mincs-list/conjecture-20/index.html), current statement and status.
- [Cheon--Wanless 2005 survey](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf), historical Conjecture 20.
- [Anari, Gurvits, Oveis Gharan and Saberi (FOCS 2017)](https://ieee-focs.org/FOCS-2017-Papers/3464a914.pdf), section on the classical Loewner-order monotonicity of the permanent (proof repeated above).
- [Exact rational diagnostic script](verify_gyires_psd_permutation_orbits.py).