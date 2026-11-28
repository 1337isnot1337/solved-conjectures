# Erdős 25: geometric weights do not preserve the proposed comparison

> Subsequent status: the general finite Haar-zeta comparison and its stronger LCM-capacity version are now [disproved](finite-zeta-counterexample.md), with [independent](COUNTEREXAMPLE_REVIEW.md) and [coordinator](COUNTEREXAMPLE_COORDINATOR_REVIEW.md) reviews. The earlier conditional implication and restricted theorems remain valid. Erdős 25 itself remains unresolved. The original argument below is preserved.

21 November 2026. This note refutes a proposed strengthening of the finite zeta route. It does not refute that route or the full logarithmic-density conjecture. The counterexample is a uniform symbolic family of four distinct moduli; no numerical search is used.

The [preceding intersection note](intersection-loss-allocation.md) proves restricted zeta comparisons and records why losses must be shared between classes. The [general finite zeta inequality](finite-zeta-route.md) remains unproved.

## 1. The stronger proposed inequality

For a finite singleton system, write $`B`$ for its activated union. For each nonempty compatible index set $`I`$, let $`L_I`$ be its LCM. The geometric-weight proposal was

```math
G(x):=
\sum_{\substack{\varnothing\ne I\\ I\text{ compatible}}}
(-1)^{|I|+1}\frac{x^{L_I}}{1-x^{L_I}}
-\sum_{n\in B}x^n
\ \ge0
\qquad(0\lt x<1).                                           \tag{1}
```

Nonnegativity in (1) for every finite system would imply the desired stronger Dirichlet comparison by substituting $`x=e^{-t}`$ and integrating against $`t^{s-1}/\Gamma(s)`$. All sums are absolutely convergent after that integral when $`s>1`$.

Equation (1) is false.

## 2. A family of distinct moduli

Let $`d,e>3`$ be coprime positive integers satisfying $`d\equiv e\equiv1\pmod6`$. Use the four classes

```math
(q,a)=(2,0),\quad(3,2),\quad(d,0),\quad(e,0).              \tag{2}
```

There are infinitely many explicit choices: for every integer $`u\ge1`$,

```math
d=6u+1,\qquad e=6u+7
```

are coprime, because their difference is $`6`$ and both are coprime to $`6`$. The four moduli are distinct and pairwise coprime.

Let $`Z`$ be the union of the positive multiples of these four moduli. Since all congruences are compatible and their LCMs equal the corresponding products, the first term of (1) is exactly $`\sum_{n\in Z}x^n`$. Thus

```math
G(x)=\sum_{n\ge1}\bigl(\mathbf1_Z(n)-\mathbf1_B(n)\bigr)x^n.
                                                               \tag{3}
```

For the first two classes alone, the activated union consists of the even positive integers and the numbers $`n\ge5`$ with $`n\equiv2\pmod3`$. It is also the completed positive periodic union: the omitted first representative $`2`$ of the second class is already in the even class.

The difference between the zero-residue union and this activated union is consequently

```math
g(n)=
\begin{cases}
1,&n\equiv3\pmod6,
\\ -1,&n\equiv5\pmod6,
\\ 0,&\text{otherwise}.
\end{cases}
```

Adding the two zero-residue classes makes both unions contain every multiple of $`d`$ or $`e`$. Their final indicator difference is

```math
\mathbf1_Z(n)-\mathbf1_B(n)
=g(n)\mathbf1_{\{d\nmid n\}}\mathbf1_{\{e\nmid n\}}.        \tag{4}
```

Because $`d,e\equiv1\pmod6`$, one has $`g(dn)=g(en)=g(n)`$. Since $`d,e`$ are coprime, inclusion-exclusion in (4) gives

```math
G(x)=h(x)-h(x^d)-h(x^e)+h(x^{de}),                        \tag{5}
```

where

```math
h(x)=\sum_{k\ge0}(x^{6k+3}-x^{6k+5})
=\frac{x^3(1-x^2)}{1-x^6}
=\frac{x^3}{1+x^2+x^4}.                                  \tag{6}
```

## 3. The geometric deficit is negative near one

Set $`x=e^{-t}`$ with $`t>0`$. Equation (6) gives the exact analytic expression

```math
h(e^{-t})
=\frac{e^{-t}}{1+2\cosh(2t)}
=\frac13-\frac t3+O(t^2)
\qquad(t\downarrow0).                                    \tag{7}
```

For each fixed pair $`d,e`$, substitute (7) into (5). The constant terms cancel, and

```math
G(e^{-t})
=-\frac{1-d-e+de}{3}\,t+O(t^2)
=-\frac{(d-1)(e-1)}3\,t+O(t^2).                          \tag{8}
```

The displayed coefficient is strictly negative. Therefore there exists $`t_0(d,e)>0`$ such that $`G(e^{-t})<0`$ for every $`0\lt t\lt t_0(d,e)`$. Equivalently, (1) fails for all $`x<1`$ sufficiently close to one.

The smallest member of the stated family is $`d=7,e=13`$, for which (8) reads

```math
G(e^{-t})=-24t+O(t^2).
```

That value is only an illustration of the uniform proof. No numerical approximation determines the sign.

## 4. The same family satisfies the Dirichlet inequality

For every real $`s>1`$, define

```math
A_s=\sum_{k\ge0}
\bigl((6k+3)^{-s}-(6k+5)^{-s}\bigr)>0.
```

Using the same indicator identity (4), now with weights $`n^{-s}`$, gives

```math
\sum_{n\in Z}n^{-s}-\sum_{n\in B}n^{-s}
=(1-d^{-s})(1-e^{-s})A_s>0.                              \tag{9}
```

Each dilation has produced the scalar factor $`d^{-s}`$ or $`e^{-s}`$. Since every compatible intersection in (2) has its expected product modulus, $`\sum_{n\in Z}n^{-s}=\zeta(s)\mu_s`$ for the capacity defined in the preceding note. Hence (9) is exactly the positive deficit in the stronger finite zeta comparison.

This also explains why the sign failure in (8) does not refute the zeta route. The geometric deficit has both positive and negative regions; its Mellin average in (9) is positive. Demanding pointwise positivity of the integrand adds a false requirement.

## 5. Scope of the obstruction

For general finite singleton systems, neither the Haar-density zeta inequality nor its stronger $`\mu_s`$ form has been proved or refuted by this note. The uniform four-class family only rules out proving them by the pointwise geometric inequality (1).

The obstruction already uses distinct pairwise coprime moduli. Removing repeated moduli, requiring full CRT compatibility, or restricting to prime moduli cannot repair (1): the concrete pair $`d=7,e=13`$ gives four primes. A successful global loss transfer must retain information about the power weights that the pointwise geometric condition discards.

There is no additional completed paid target.

