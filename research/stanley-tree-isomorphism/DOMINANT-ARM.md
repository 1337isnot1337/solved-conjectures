# Recovering a long exterior arm and the path between the hubs

Use the notation and recognition hypotheses of the [two-hub theorem](TWO-HUB-SUBDIVISIONS.md). Each exterior arm has a unary-stripped rooted cap of order at most $`L+1`$, the smallest exterior order is at least $`K=\max(3,L+1,rL)`$, and there are at least two exterior arms at each hub. Put $`m=rL`$. Let $`S`$ be the sum of the $`\min(p,q)`$ smallest arm orders. Suppose exactly one exterior arm has order $`b\ge S`$, and the largest of the other arm orders, $`c`$, satisfies $`c\lt S`$ and $`c+m\le S`$. Write $`M`$ for the sum of the $`r-1`$ smaller orders and $`B`$ for the total exterior arm order at the hub opposite the arm of order $`b`$. The central path has length $`h\ge1`$.

**Theorem.** The ordinary chromatic symmetric function distinguishes this tree among all finite trees if $`b\lt B`$. If $`b>B`$ it does so under any one of these conditions:

1. $`\max(h,b-B)>2(M+2)`$.
2. Among the recovered smaller decorated arms there is only one possible submultiset of total order $`B`$ and of a size consistent with the two hub degrees, up to repetitions of identical arms.
3. $`h=b-B`$.

In particular an exterior arm of order $`b>3M+4`$ may be arbitrarily long relative to all other exterior arms, and the central path length remains unrestricted. The two largest lengths may grow at any relative rate. For two equal-degree hubs with identical smaller decorated arms, the uniqueness condition in item 2 always holds.

## Recovering the shorter arms

The two-hub recognition and initial scan determine the unmarked skeleton, the cap multiset, $`S`$ and every exterior arm order strictly below $`S`$ on each competitor. Thus the same $`r-1`$ small orders occur and the remaining arm has order at least $`S`$. Erasing the unique large component gives the truncated product of the exterior rooted factors through weight $`S`$ as in the two-hub theorem.

At each remaining small order $`j\le c`$, use the logarithmic derivative from that proof, keeping the unknown long factor throughout. To weight $`j+m\le S`$ that factor agrees with $`HG_D`$ for its cap $`D`$. The cap normalization $`G_D`$ uses only generator indices at most $`L\lt j`$. Its contribution to the normalized derivative is therefore exactly one through weight $`m`$, regardless of its cap. Subtract one and use the same irreducible-factor comparison to identify the cap multiplicities at $`j`$. After all short lengths have been processed, the sole remaining cap $`D`$ belongs to the long arm. In the unit-only case there are no cap assignments to distinguish.

## The possible exchange of two lengths

Let $`A=M-B`$, so that $`A`$ is the combined order of the small arms at the hub of the long arm. Both $`A,B`$ are positive. The order of the whole tree determines $`N=b+h`$. Extend the ordinary two-component cut counts to an oriented histogram $`H_i`$ over orders $`1\le i\lt n`$, using the coefficient of $`x_i x_{n-i}`$ when $`2i\ne n`$ and twice that coefficient when $`2i=n`$. Each edge then contributes its two oriented component orders.

Use the signed differences $`H_i-H_{i+1}`$ on $`K\le i\le n-1-K`$. Remove the known single-arm terms $`x^s-x^{n-1-s}`$ for the $`r-1`$ short exterior orders $`s`$, using a formal variable $`x`$ to record the index. The two central intervals and the remaining exterior term give the polynomial
```math
 J(x)=(1-x^A)(x^b+x^{h+B})-x^B+x^{b+h+A}.
```
Indeed the central side sums are $`b+A`$ and $`B`$; use the [oriented difference formula](TWO-HUB-SUBDIVISIONS.md). All displayed exponents and their reflections about $`(n-1)/2`$ lie in the available range, since each side contains at least two exterior arms and each outer arm has order at least $`K`$. This formula holds for every competitor, even when its remaining exterior arm has a different order.

If $`b\lt B`$, the lowest coefficient is positive at degree $`b`$ and the highest is negative at degree $`h+M>M`$. If $`b>B`$, the lowest coefficient is negative at degree $`B\lt M`$. If $`b=B`$, the whole polynomial is $`x^N-x^M`$ and has neither signature, including when it vanishes. Thus the cases are distinguishable from the data. In the first case we read off $`b`$ and hence $`h`$. The quadratic arm-allocation argument now recovers the tree. In the second case we read off $`B`$ and hence $`A`$. Subtracting the known last two monomials and dividing by $`1-x^A`$ determines the unordered pair $`\{b,h+B\}`$, with multiplicity. Unless both values coincide, the only other possibility is
```math
 b'=h+B,\qquad h'=b-B.
```
It suffices to rule out this exchange in the first two conditions of the theorem.

## A stem transposition in the connected-subset polynomial

Use the [transposition identity](TWO-HUB-SUBDIVISIONS.md#distinguishing-one-transposition-without-size-restrictions) for the attached-branch factors. Write $`Y=y/(1-x)`$ and $`J_D=x^{-d}(F_D-Y)`$ for a cap of order $`d`$. If total orders $`s,t`$ are exchanged between two caps $`D,Z`$ at a vertex with remaining factor product $`V`$, the connected-subset size and boundary polynomial changes by
```math
 xY(V-1)(x^s-x^t)(J_D-J_Z).
```
Distinct stripped caps have distinct normalized factors by rooted reconstruction.

For a possible length exchange in our tree, let $`W`$ be the product of the smaller arm factors at the far hub and $`V`$ the product of those at the near hub. The far hub with its exterior arms is itself a cap $`Z`$ of order $`e=B+1`$, with $`F_Z=y+xW`$. It has at least two children, whereas $`D`$ is a stripped cap of order $`d\le L+1\lt e`$. Thus $`J_D\ne J_Z`$. At least one other arm remains at the near hub, so $`V\ne1`$. When the far-arm submultiset is uniquely determined, the transposition identity already rules out different lengths.

## Allowing the arms to change hubs

For any fixed lengths and decorated arm multiset, changing the allocation at fixed $`h'`$ changes only the term for subsets meeting exactly one hub. The change in $`C_T`$ is a polynomial multiple of
```math
 xy(1-x^{h'})/(1-x),
```
by the last identity in the [two-hub proof](TWO-HUB-SUBDIVISIONS.md). Suppose the switched candidate, after any such reallocation, has the same invariant as the original. Its far total is still $`B`$. First switch lengths without reallocating and use the transposition identity with $`s=b`$ and $`t=h+B`$. Then change the allocation to that of the competitor. Multiplying the resulting identity by $`(1-x)^2 x^e/(xy)`$ shows that $`x^{h'}-1`$ divides $`(x^b-x^{h+B})E(x,y)`$, where
```math
 E=(V-1)\left[x^{e-d}\big((1-x)F_D-y\big)
                  -\big((1-x)F_Z-y\big)\right].
```
It is nonzero by the two distinct caps and $`V\ne1`$. Its degree in $`x`$ is at most $`A+e+1=M+2`$. Since $`b=B+h'`$ and $`x`$ is a unit modulo $`x^{h'}-1`$, this divisor also divides $`(x^h-1)E`$. In $`\mathbb Q(y)[x]`$ the greatest common divisor of $`x^{h'}-1`$ and $`x^h-1`$ is $`x^{g}-1`$ with $`g=\gcd(h,h')`$. Cancellation gives $`h'-g\le M+2`$. Reversing the two trees gives $`h-g\le M+2`$ with the same $`M`$, even if the products of their short arms on each side differ. For unequal $`h,h'`$ their larger value has $`g`$ as a proper divisor. It is at least twice $`g`$, hence $`\max(h,h')\le2(M+2)`$. This contradicts condition 1. In all three conditions the central length and exterior orders are determined, and the known arm-allocation identity finishes the proof.

Codex in the WadeDavis research session derived the signed residual and stem exchange; separate internal derivations checked the divisor and degree arguments. This treats a long arm on one side of a two-hub tree with arbitrary rooted ends. The regime with several unresolved exterior orders outside the measurable cutoff, and remaining shorter ambiguous exchanges, are still open. [Finite checks](verify_dominant_arm.py) · [Stanley’s research issue](https://github.com/1337isnot1337/solved-conjectures/issues/315)
