# Polynomial-recurrence obstructions for two sign-matrix construction problems

Research checkpoint, 20 November 2026 (America/Chicago).

These are limitations on proposed construction families. They do not resolve Wang's classification problem or Kräuter's minimum-positive-permanent conjecture. No priority claim or solved-conjecture count is made.

## A uniform recurrence lemma

Call a sequence P-recursive if it satisfies, eventually,


```math
\sum_{j=0}^d p_j(n)a(n+j)=0,
\qquad p_j\in\mathbb Q[n],\quad p_d\not\equiv0.
\tag{1}
```


Only finitely many nonnegative integers can be zeros of $`p_d`$. Past those indices, $`d`$ consecutive zeros force every subsequent term to vanish.

Finite sums and pointwise products of P-recursive sequences are P-recursive. We also need the following uniform form: given finitely many P-recursive sequences $`a_0,\ldots,a_s`$, there is a single eventual recurrence of the form (1), independent of constants $`c_0,\ldots,c_s`$, satisfied by every sequence $`\sum_r c_r a_r(n)`$. In particular, the exceptional integer indices of that recurrence do not depend on the constants.

Here is an elementary state-space proof. After a finite initial segment, each recurrence can be written as a first-order system
$`Y(n+1)=M(n)Y(n)`$, with a fixed finite-dimensional vector and a matrix over $`\mathbb Q(n)`$. Products use tensor-product systems and sums use direct sums. For a system of dimension $`D`$, put


```math
\Phi_0(n)=I,\qquad
\Phi_j(n)=M(n+j-1)\cdots M(n)\quad(j\ge1).
```


The $`D^2+1`$ matrices $`\Phi_0,\ldots,\Phi_{D^2}`$ are linearly dependent over $`\mathbb Q(n)`$. Thus
$`\sum_j r_j(n)\Phi_j(n)=0`$ for rational functions $`r_j`$, not all zero. Clear denominators and select the highest index with a nonzero coefficient. Since $`Y(n+j)=\Phi_j(n)Y(n)`$, this gives one polynomial-coefficient recurrence for every coordinate of $`Y`$, and for every constant linear combination of the coordinates. Its finitely many singular integer indices are fixed independently of that linear combination.

This proves both the closure facts and the uniform assertion.

## Wang's equality problem

Suppose finitely many families $`A_n^{(1)},\ldots,A_n^{(s)}`$ consist of sign matrices of order $`n`$, defined for all sufficiently large $`n`$. Suppose their permanent and determinant sequences are P-recursive.

These families cannot supply a nonsingular equality example
$`\lvert\mathop{\mathrm{per}}A\rvert=\lvert\det A\rvert`$ at every sufficiently large non-Mersenne order.

Indeed,


```math
F(n)=\prod_{r=1}^s
\left(\mathop{\mathrm{per}}(A_n^{(r)})^2
-\det(A_n^{(r)})^2\right)
```


is P-recursive. The proposed coverage would make it zero on arbitrarily long consecutive intervals
$`[2^k,2^{k+1}-2]`$. The recurrence lemma would then make it eventually zero.

For $`n=2^\ell-1`$, $`\ell\ge2`$, however, every sign matrix satisfies
$`v_2(\mathop{\mathrm{per}}A)=n-\ell`$, whereas $`2^{n-1}\mid\det A`$. Thus every factor of $`F(n)`$ is nonzero at every sufficiently large Mersenne order, a contradiction. The complete elementary valuation proof and primary attribution are in [the constant-recurrence note](cfinite_obstruction.md).

This strengthens the earlier constant-coefficient recurrence obstruction. It still does not assert that every non-Mersenne order is admissible.

## Kräuter's minimum: one family

The conjectured least positive absolute permanent is


```math
m(n)=2^{\,n-\lfloor\log_2(n+1)\rfloor}.
\tag{2}
```


No single P-recursive permanent sequence can attain this value in absolute value for all sufficiently large $`n`$.

If it did, its square would be
$`b(n)=4^{n-\lfloor\log_2(n+1)\rfloor}`$.
The P-recursive sequence $`h(n)=b(n+1)-4b(n)`$ would vanish except at
$`n=2^k-2`$, where $`h(n)=-3b(n)\ne0`$. Its arbitrarily long zero runs contradict the recurrence lemma.

## Kräuter's minimum: finitely many families

The uniform part of the lemma extends this obstruction to finite coverage.

**Proposition.** Suppose the permanent sequences of finitely many all-order sign-matrix families $`A_n^{(1)},\ldots,A_n^{(s)}`$ are P-recursive. They cannot attain (2), between them, at every sufficiently large order.

**Proof.** Write $`b_r(n)=\mathop{\mathrm{per}}(A_n^{(r)})^2`$, and for a scalar $`c`$ define


```math
F_c(n)=\prod_{r=1}^s\bigl(b_r(n)-c\,4^n\bigr).
\tag{3}
```


As a polynomial in $`c`$, (3) has $`s+1`$ coefficient sequences. Each is P-recursive, by closure under sums, products, and multiplication by $`4^{jn}`$. The uniform recurrence lemma provides a single eventual polynomial-coefficient recurrence for $`F_c`$, with order and singular indices independent of $`c`$.

On the interval

```math
2^k-1\le n\le2^{k+1}-2
```

we have $`\lfloor\log_2(n+1)\rfloor=k`$. Coverage of the conjectured minimum would therefore give
$`F_{4^{-k}}(n)=0`$ throughout that interval. For every sufficiently large $`k`$, the interval lies past all singular indices and is longer than the common recurrence order. Consequently $`F_{4^{-k}}(n)=0`$ for every sufficiently large $`n`$.

Choose $`s+1`$ distinct such values of $`k`$, and choose $`n`$ beyond all of their zero tails. Then each of the $`s+1`$ distinct numbers $`4^{-k}`$ must equal one of the $`s`$ numbers

```math
b_1(n)/4^n,\ldots,b_s(n)/4^n.
```

This is impossible. $`\square`$

The proof concerns construction coverage, regardless of whether the minimum conjecture is true. It does not disprove the existence of a matrix attaining (2) in any order.

## What remains available

These arguments leave open families with recurrences in the binary digits of the order, growing state spaces, infinitely many parameter choices, and permanent sequences with no eventual polynomial-coefficient recurrence. The recurrence hypotheses must be established before applying the obstruction to a particular matrix construction.

Current problem statements and progress:

- Wang's classification: https://yair-lavi.com/mincs-list/problem-7/index.html .
- Kräuter's minimum: https://yair-lavi.com/mincs-list/conjecture-36/index.html .
- Classical Mersenne obstruction: A. R. Kräuter and N. Seifter, *On some questions concerning permanents of (1,-1)-matrices*, Israel Journal of Mathematics 45 (1983), 53--62, https://link.springer.com/article/10.1007/BF02760670 .

The finite-family uniform-recurrence argument was independently checked by the root reviewer. Internal review is not external peer review, and the result is not counted as a resolution of either Minc-list target.
