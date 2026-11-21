# Coordinator review of the finite-zeta counterexample

21 November 2026. Reviewed source: [finite-zeta-counterexample.md](finite-zeta-counterexample.md), SHA-256 `328bf04b0bdf579aab3c0f079e9728b393330c10b5e09168d8319946ddcd2595`.

## Verdict

The counterexample is correct. It refutes both the proposed finite Haar-density comparison and the stronger LCM-capacity comparison. The uniform vanishing-excess estimate for this particular family is also correct.

The finite comparison was introduced as an unproved sufficient hypothesis in the [earlier route note](finite-zeta-route.md). That hypothesis is now false. Its conditional limiting argument and the restricted comparisons already proved remain valid. No infinite system without logarithmic density is constructed, so this is not a resolution of Erdős 25.

## The singleton system and activation

The moduli are $`2,3`$ and the unordered prime products $`pp'`$, including squares, from a finite set of primes $`5\bmod6`$. Unique factorization gives distinct moduli. The simultaneous residue condition is consistent, as witnessed by $`2\prod p^2`$.

All product classes and the even class have zero residue. The only omitted initial representative is two in the class $`2\bmod3`$, and the even class already deletes it. Hence the activated union is exactly the positive part of a finite periodic set. Its complement consists of odd integers outside $`2\bmod3`$ with at most one total occurrence of a chosen prime.

Finite CRT then gives the retained density $`\delta=V_1^-(1+W_1)/3`$. In particular, squares cannot be omitted from the construction: without them the permitted prime-power factors and the displayed Euler products would change.

## Independent derivation of the Dirichlet formula

Writing $`S`$ for the odd permitted-integer series and $`K`$ for its character-weighted counterpart, their Euler factors give

```math
S=(1-2^{-s})\zeta(s)V_s^-(1+W_s),\qquad
K=(1+2^{-s})L(s,\chi)V_s^+(1-W_s).
```

The mass divisible by three is $`3^{-s}S`$. The other two residue classes have total $`(1-3^{-s})S`$ and difference $`K`$. Thus the retained normalized mass is

```math
R(s)=\frac{(1+3^{-s})S+K}{2\zeta(s)}.
```

This independently reproduces source equation (9), including the signs and factors at two and three. The stronger-capacity deficit follows by taking the difference from the all-zero residue system. If $`W_s\ge1`$, its character term is nonpositive and its other term is strictly negative, proving that separate failure.

## Classical inputs and the endpoint

I read the exact weighted progression estimates in [Liu's notes, recorded by Streipel, Theorem 12.1.1(ii)–(iii)](https://bpb-us-w2.wpmucdn.com/faculty.umaine.edu/dist/1/19/files/2022/08/analyticnumbertheory.pdf#page=33), as well as the ordinary product estimate and zeta pole in [Tao's Mertens notes, Theorem 1 and Proposition 2](https://terrytao.wordpress.com/2013/12/11/mertens-theorems/). The former is applied only at the fixed modulus three or six; no uniformity in a growing modulus is needed.

The passage to the prime-ordered character product at one is justified. Boundedness of $`A(x)=\sum_{p\le x}\chi(p)\log p/p`$ gives convergence of $`\sum_p\chi(p)/p`$ by partial summation, because $`\int^\infty dt/(t\log^2t)`$ converges. The higher-order logarithmic Euler factors are absolutely summable. Abelian passage from the convergent product for $`s>1`$ identifies the boundary product with $`L(1,\chi)`$. Its value $`\pi/(3\sqrt3)`$ also follows from the source's elementary integral.

The finite product ratio has the exact factor $`9/2`$: two contributes three, three contributes $`3/2`$, and primes $`1\bmod3`$ cancel. This confirms the constant in the asymptotic for $`J_Y=V_1^+/V_1^-`$.

## Derivative and order of limits

For each fixed finite prime cutoff, the product formula is differentiable at one from the right. The paired character series and its derivative converge locally there, and the reciprocal zeta factor has derivative one.

Differentiating the first term logarithmically and the vanishing second term directly gives

```math
\frac{R_{P_Y}'(1)}{\delta_Y}
=\log2-\frac14\log3+E_Y+
\frac{W T_Y-\frac94 L(1,\chi)(W-1)J_Y}{1+W}.
```

Using $`T_Y/\log Y\to1/2`$, $`W\to\infty`$, $`E_Y=O(1)`$ and the checked product constant gives the claimed limit $`(1-e^\gamma)/2<0`$. The elementary lower bound $`\gamma\ge1-\log2>0`$ is sufficient for its sign.

Only after obtaining a negative derivative does the argument fix one finite cutoff and choose $`s>1`$ close to one. There is no differentiation of an uncontrolled infinite-family limit. This proves an existential finite counterexample without requiring a numerically chosen cutoff.

## The uniform bound does not solve the full problem

The probability polynomial $`F_s=V_s^-(1+W_s)`$ increases with $`s`$, as checked by its coordinate derivatives. The elementary derivative bound for the factor $`a(s)`$ gives the lower bound $`\delta-\varepsilon`$ for the first term. The negative part of the character term is at most $`3\varepsilon W_1e^{W_1}/4`$.

Splitting at $`W_1=K`$ is valid. For the larger case, nonnegativity of the retained mass bounds the excess by $`\delta\le(1+K)e^{-K}/3`$. Choosing $`K=\frac12\log(1/\varepsilon)`$ yields the displayed uniform bound tending to zero. All finite subsets of the chosen prime progression are covered.

That estimate has not been proved for arbitrary singleton congruence systems. It also does not prevent a different infinite construction. The full paid target remains open in this work. This review is of written mathematics and primary-source inputs; it is not a Lean replay or a new prize completion.
