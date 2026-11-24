# Canonical Boolean potentials already compute permanent values

Status: proved reductions for two specific constructive approaches. The reductions rule out a uniform polynomial-time exact constructor or evaluator for those canonical potentials, conditional on the imported permanent graph lower bound. They do not rule out nonconstructive polynomial-size certificates with instance-dependent complex constants, and they do not rule out other, nonunique choices of potentials.

A later, independently reviewed argument in `POTENTIAL_CONSTRUCTOR_BARRIER.md` excludes a polynomial-time constructor of actual valid potentials even when it may choose arbitrary noncanonical outputs. Its proof freezes a generic branch on the true graph and extracts one nonzero Boolean residual as a small multiple of the graph equation. The concrete examples here remain useful because they give explicit reductions for the ordered-average and Laplacian methods and exhibit small alternative certificates on the same inputs. Neither note disproves nonconstructive polynomial-size certificate existence.

## 1. The Boolean divergence equation

For an M by M matrix X, let K_X be its Ryser kernel, and let T_i flip Boolean coordinate i. Set

```math
R_{X,y}(b)=K_X(b)-y\delta_0(b),
\qquad
\delta_0(b)=\prod_i(1-b_i).
```

The certificate equation is

```math
R_{X,y}=\sum_{i=1}^M(I-T_i)Q_i
\quad\text{on }\{0,1\}^M.                                      \tag{1}
```

For y equal to the permanent, the right-hand side can equal the left-hand side as an identity of Boolean functions. The original proposed hypothesis was that some choice of the Q_i always has polynomial total arithmetic-circuit size. The later critical-incidence theorem excludes that all-instance bound; the present note records narrower constructive obstructions. All constructions and evaluations below refer to Boolean functions, so they do not depend on a chosen polynomial representative away from the cube.

## 2. A zero-permanent block with a nonzero kernel

Use the constant matrix

```math
C=\begin{pmatrix}1&1\\1&-1\end{pmatrix}.
```

Its permanent is zero. Its Ryser kernel is

```math
K_C(c_1,c_2)
=(2c_1-1)(2c_2-1)(c_1+c_2)(c_1-c_2),
```

and on the Boolean square this equals c_2-c_1. This follows by checking the four Boolean inputs, or by using c_i squared equal to c_i in the quotient ring of Boolean functions.

Kernels and permanents multiply under block diagonal sums. Hence for every complex m by m matrix A,

```math
X=\mathop{\mathrm{diag}}(A,C)
\quad\Longrightarrow\quad
\mathop{\mathrm{per}}(X)=0,
\qquad
K_X(b,c)=K_A(b)(c_2-c_1)\text{ on the cube}.             \tag{2}
```

These are true permanent instances with their claimed value known without evaluating the permanent of A.

## 3. Ordered partial averages: one query already recovers the permanent

Let

```math
\mathcal A_i=\tfrac12(I+T_i).
```

The canonical ordered construction in `BOOLEAN_POTENTIALS.md` is

```math
Q_i=\tfrac12\mathcal A_1\cdots\mathcal A_{i-1}R.
```

Put the m coordinates b of A first and the two coordinates c of C last. For the true instance (X,0) of (2), its first gadget potential is

```math
\begin{aligned}
Q_{m+1}(b,c)
&=\tfrac12\mathcal A_1\cdots\mathcal A_m
       \bigl(K_A(b)(c_2-c_1)\bigr)\\
&=2^{-(m+1)}\mathop{\mathrm{per}}(A)(c_2-c_1).
\end{aligned}
```

Consequently its value at c=(0,1), with arbitrary Boolean b, is permanent(A) divided by 2^(m+1). A uniform polynomial-time algorithm that constructs these canonical circuits, including their actual scalar constants, or evaluates these canonical potentials at Boolean points for all true numeric instances, would therefore evaluate the permanent in polynomial time.

This is a computational reduction, not a circuit-size lower bound for every numeric certificate. At each fixed numerical matrix A, the displayed Q_(m+1) itself has a constant-size circuit if its permanent coefficient is supplied as a free scalar. The size of a circuit does not charge for discovering that scalar.

## 4. The cube Laplacian inverse

Define the cube Laplacian on functions by

```math
\mathcal L_M=\sum_{i=1}^M(I-T_i).
```

Its kernel consists of constant functions. For a zero-mean Boolean function R there is a unique zero-mean function U with

```math
\mathcal L_M U=R.
```

Taking every Q_i equal to U gives a valid divergence certificate. This symmetric choice is the canonical Green potential.

Write sigma_i(b)=2b_i-1 and chi_S(b)=the product of sigma_i over i in S. These characters form a basis of Boolean functions. They satisfy

```math
\mathcal L_M\chi_S=2|S|\chi_S.
```

Thus the inverse divides the Fourier coefficient at a nonempty S by 2|S|. Formally the inverse can be expressed as a degree-M interpolation polynomial in the operator L_M, taking the values zero at zero and 1/(2k) at eigenvalue 2k for 1<=k<=M. The polynomial degree of this operator expression does not give a polynomial-size scalar arithmetic circuit: each application of L_M evaluates a function at M differently flipped inputs.

Direct repeated substitution can create M^M terms. Collecting equal flip patterns reduces this to at most 2^M patterns. Those are bounds for the direct implementations, not lower bounds for all possible representations. The next reduction identifies why an exact uniform polynomial-time shortcut for this canonical inverse is unavailable under the imported permanent lower bound.

## 5. Green-potential evaluations recover the permanent by Cauchy interpolation

Expand the Boolean kernel of A in its Fourier basis:

```math
K_A(b)=\sum_{S\subseteq[m]}\widehat K_A(S)\chi_S(b).
```

Its constant Fourier coefficient is

```math
\widehat K_A(\varnothing)=2^{-m}\mathop{\mathrm{per}}(A).
```

For 1<=r<=m+1, construct

```math
X_r=\mathop{\mathrm{diag}}(\underbrace{C,\ldots,C}_{r\text{ copies}},A).
```

Every one of these matrices has permanent zero. Its kernel on the cube is

```math
G_r(c)K_A(b),
\qquad
G_r(c)=\prod_{h=1}^r(c_{2h}-c_{2h-1}).
```

Every Fourier monomial of G_r has weight r, because each factor is one half of sigma_(2h) minus sigma_(2h-1). Therefore the zero-mean Green potential for this true zero-permanent instance is

```math
U_r(c,b)=G_r(c)
\sum_{S\subseteq[m]}
\frac{\widehat K_A(S)\chi_S(b)}{2(r+|S|)}.
```

Evaluate at c*=(0,1,0,1,...,0,1) and b=0. Then G_r(c*)=1 and chi_S(0)=(-1)^|S|. Put

```math
a_j=(-1)^j\sum_{|S|=j}\widehat K_A(S),
\qquad 0\le j\le m.
```

The queried values v_r=U_r(c*,0) satisfy

```math
2v_r=\sum_{j=0}^m\frac{a_j}{r+j},
\qquad 1\le r\le m+1.                                    \tag{3}
```

The Cauchy coefficient matrix in (3) is invertible. For a direct proof, define

```math
D(z)=\prod_{j=0}^m(z+j),
\qquad
N(z)=D(z)\sum_{j=0}^m\frac{a_j}{z+j}.
```

The polynomial N has degree at most m. If all right-hand sides of (3) vanish, N vanishes at m+1 distinct positive integers, hence is zero. Evaluating N at z=-j then gives a_j=0 for every j. This proves invertibility.

In particular a_0 is recovered using polynomially many arithmetic operations, and

```math
\mathop{\mathrm{per}}(A)=2^m a_0.
```

An explicit formula is obtained by Lagrange interpolation of N at 1,...,m+1:

```math
a_0=\frac{2}{m!}\sum_{r=1}^{m+1}
(-1)^{r-1}\binom{m+1}{r}
\left(\prod_{j=0}^m(r+j)\right)v_r.
```

All coefficients in this formula can be formed in polynomially many BSS operations. Each queried matrix has size at most 3m+2. Thus a uniform exact evaluator with running time T(M) for the canonical Green potential of all true permanent instances would give an exact permanent evaluator with cost

```math
O\bigl(m\,T(3m+2)+m^3\bigr).
```

Polynomial T would contradict the imported permanent graph hardness. The same conclusion holds for a uniform constructor that outputs the actual scalar arithmetic circuits in polynomial time, because those circuits can then be evaluated at the stated Boolean inputs.

## 6. Nonuniqueness is a real escape from these reductions

For the single-gadget family X=diag(A,C), there are explicit small potentials that never use the permanent of A:

```math
Q_{c_1}(b,c)=-\tfrac12 K_A(b)c_1,
\qquad
Q_{c_2}(b,c)=\tfrac12 K_A(b)c_2,
\qquad
Q_{b_i}=0.
```

Their divergence is

```math
-\tfrac12K_A(b)(2c_1-1)
+\tfrac12K_A(b)(2c_2-1)
=K_A(b)(c_2-c_1)=K_X(b,c).
```

The total circuit size is O(m^2). For multiple gadget blocks, use the first block's two potentials multiplied by all other gadget kernels and K_A; the same bound is polynomial in the enlarged matrix size.

Thus the matrices used to defeat the canonical constructors actually have easily constructed noncanonical certificates. The reductions cannot be cited as a lower bound for all divergence certificates, or as a disproof of the exact polynomial-size hypothesis in `BOOLEAN_POTENTIALS.md`.

## 7. A restricted positive statement and the remaining cost

If R is already supplied by a small circuit for its multilinear representative in the centered coordinates sigma, there is a small Green potential. Write its homogeneous decomposition as R=the sum of R_k for 0<=k<=M. Zero Boolean mean means R_0=0. Set

```math
U=\sum_{k=1}^M\frac{R_k}{2k}.
```

The homogeneous components can be recovered by M+1 evaluations of R(t sigma) and scalar interpolation, at polynomial circuit cost. Since R is multilinear, each degree-k monomial has Fourier weight k. The displayed U therefore satisfies L_M U=R, and all Q_i=U are small.

The Ryser kernel has a small unreduced circuit, but it is not a multilinear polynomial. Replacing total degree by Fourier weight is invalid for it: on a monomial sigma^alpha, the Laplacian eigenvalue is twice the number of odd alpha_i, not twice their sum. A polynomial-time multilinearization or equivalent fast Green-potential evaluation has not been supplied; the reductions above block such a uniform exact route on the stated true-instance families.

These canonical arguments alone leave open the existence of some polynomial-size, instance-dependent, nonunique collection of potentials. The subsequent `CRITICAL_INCIDENCE_BARRIER.md` gives a stronger obstruction to that size-existence hypothesis itself, using the conservation identity for the full family of Boolean residuals, a small critical incidence, and the reviewed singular-witness lemma. The explicit restricted certificates in Section 6 remain valid.
