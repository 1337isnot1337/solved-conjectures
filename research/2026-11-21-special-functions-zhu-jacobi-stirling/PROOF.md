# Zhu’s generalized Jacobi–Stirling conjecture

Research date: 21 November 2026. Mathematical status: complete disproof. Prior-resolution review is recorded separately; no claim of exhaustive worldwide priority is made. Coordination: [issue 163](https://github.com/1337isnot1337/solved-conjectures/issues/163).

## Source and exact statement

Bao-Xuan Zhu’s *Coefficientwise Hankel-total positivity of the row-generating polynomials for the output matrices of certain production matrices*, Advances in Mathematics 444 (2024), 109695, DOI [10.1016/j.aim.2024.109695](https://doi.org/10.1016/j.aim.2024.109695), states the conjecture in §5.2, immediately after equation (5.10). In the [author’s arXiv v2](https://arxiv.org/pdf/2202.03793), this is printed page 24. The paper attributes the conjecture to the author in 2018.

Relabel the source’s parameters $(x,y,q)$ as $(a,b,x)$. The triangle is defined by

```math
J_{0,0}=1,\qquad J_{n,k}=0\quad(k<0\text{ or }k>n),
\qquad J_{n,k}=J_{n-1,k-1}+(ak^2+bk)J_{n-1,k}.
```

Its unweighted row polynomials are

```math
P_n(x)=\sum_{k=0}^n J_{n,k}x^k.
```

The conjecture asserts that every finite minor of the Hankel matrix

```math
H=(P_{i+j}(x))_{i,j\ge0}
```

has nonnegative coefficients in the polynomial ring $\mathbb Z[a,b,x]$. [Deb’s current problem P1.9](https://bishaldeb.com/positivity/themes/SMSCHTP/hankel.html) states the same conjecture with precisely this recurrence and unweighted normalization.

## Theorem

For the polynomials just defined, the following polynomial identity holds:

```math
\boxed{
\det\begin{pmatrix}
P_0&P_1&P_2
\\ P_1&P_2&P_3
\\ P_2&P_3&P_4
\end{pmatrix}
=2x^3\bigl[(a+b)(2a+b)(3a+b)-2a^2x\bigr].
}
```

Consequently, Zhu’s conjecture is false. Its first three rows and columns already have a minor with coefficient

```math
[a^2b^0x^4]\det H[\{0,1,2\},\{0,1,2\}]=-4.
```

The same identity gives a full real counterexample region: for every $a>0$ and $b\ge0$, the Hankel matrix is not totally nonnegative whenever

```math
x>\frac{(a+b)(2a+b)(3a+b)}{2a^2}.
```

This includes strictly positive parameters $a,b,x$. It is an exact obstruction to the complete conjecture, without a limiting or numerical hypothesis.

## Proof

Put

```math
c=a+b,\qquad d=4a+2b,\qquad e=9a+3b.
```

These are the recurrence weights at $k=1,2,3$. Repeated substitution into the defining recurrence gives

```math
\begin{aligned}
P_0&=1,
\\ P_1&=x,
\\ P_2&=cx+x^2,
\\ P_3&=c^2x+(c+d)x^2+x^3,
\\ P_4&=c^3x+(c^2+cd+d^2)x^2+(c+d+e)x^3+x^4.
\end{aligned}
```

For completeness, the nonzero entries in rows two through four are respectively

```math
(c,1),\qquad(c^2,c+d,1),\qquad
(c^3,c^2+cd+d^2,c+d+e,1).
```

For example, the second entry of row four is
$c^2+d(c+d)$, and its third is $(c+d)+e$. Thus the displayed expressions use the literal triangle recurrence, not an assumed generating-function formula.

Subtract $P_1$ times the first row from the second row of the displayed Hankel matrix, and $P_2$ times the first row from the third. Expanding down the first column yields

```math
\Delta_3=(P_2-P_1^2)(P_4-P_2^2)-(P_3-P_1P_2)^2.
```

The three differences are

```math
\begin{aligned}
P_2-P_1^2&=cx,
\\ P_3-P_1P_2&=c^2x+dx^2,
\\ P_4-P_2^2&=c^3x+(cd+d^2)x^2+(-c+d+e)x^3.
\end{aligned}
```

Therefore

```math
\begin{aligned}
\Delta_3
&=cx\bigl[c^3x+(cd+d^2)x^2+(-c+d+e)x^3\bigr]
 -(c^2x+dx^2)^2
\\ &=cd(d-c)x^3+(cd+ce-c^2-d^2)x^4.
\end{aligned}
```

Substitution of $c,d,e$ gives the two exact identities

```math
cd(d-c)=2(a+b)(2a+b)(3a+b),\qquad
cd+ce-c^2-d^2=-4a^2.
```

This proves the determinant formula. Its negative coefficient disproves coefficientwise Hankel total positivity. For $a>0,b\ge0$ and $x$ above the stated threshold, $2x^3>0$ and the bracket is negative, proving the real counterexample assertion. ∎

## Normalization audit

The same source immediately introduces the factorial-weighted triangle

```math
\widetilde J_{n,k}=k!J_{n,k},\qquad
\widetilde P_n(x)=\sum_{k=0}^n k!J_{n,k}x^k.
```

Its Proposition 5.7 proves coefficientwise Hankel total positivity for this weighted sequence. That sequence has a different recurrence: the coefficient of $\widetilde J_{n-1,k-1}$ is $k$. The present determinant uses coefficient one in that position throughout. This disproof concerns exactly the preceding unweighted conjecture.

The 2018 paper cited nearby, [arXiv:1609.01544v2](https://arxiv.org/pdf/1609.01544), proves strong log-convexity preservation for Jacobi–Stirling transformations in §4.2. Its full text contains no Hankel assertion. The date 2018 is therefore reported as Zhu’s retrospective attribution in the 2024 source, rather than as a claim that the conjecture appears verbatim in the 2018 article.

## Exact illustrations and verification scope

At $a=b=1$, the formula reduces to $4x^3(12-x)$, so every $x>12$ gives a strictly negative determinant. For example, $x=13$ gives $-8788$. At $a=1,b=0$, it reduces to $4x^3(3-x)$.

These evaluations illustrate the all-parameter identity; the proof does not depend on selecting a numerical witness. An independent sparse-integer-polynomial verifier reconstructs the triangle directly from its recurrence and expands the determinant by its six permutations. It checks the full polynomial identity and the negative monomial. That finite algebra check supplements the written proof.
