# Burstein’s permutation enumeration conjecture

**Scope.** We prove the two outstanding clauses of Burstein’s 2017 conjecture about A218225, reported as Conjecture 1.1 in [Chern–Fu–Lin](https://arxiv.org/html/2209.12137#S1) ([published version](https://doi.org/10.1017/S0013091523000652)). Their Corollary 1.2 proves the first clause and their §6 identifies the other two as open. We give an isomorphism of maximum-insertion generating trees for the other two classes and a kernel evaluation of their common generating function. This does not address their separate statistic-refined Conjectures 6.1 and 6.2.

Let `X = Av(2134,42153,24153)` and `Y = Av(2143,42135,24135)`. The length-zero permutation is included in both. A gap of a length-`n` permutation has index `g` if there are `g` entries to its left, `0 ≤ g ≤ n`. A gap is legal if it admits insertion of the new maximum. All occurrence indices below are 1-based. Define `d` as the bottom index of the first adjacent descent, or `n+1` if none. Thus `d` is also the first index at which a prefix contains any inversion. Define `b` as the least middle index of a `213` occurrence, or `n+1` if absent. Write `T_3` for the least ending index of a `213` occurrence and `T_4` for the least ending index of a `4213` or `2413` occurrence, each with the same sentinel.

The two four-letter patterns `4213`, `2413` both contain a `213` in their last three or in their first, third and fourth positions, respectively. In both cases this `213` shares the third and fourth positions as middle and end. Conversely, inserting a new maximum in front of the middle position of any `213` creates one of `4213`, `2413`, depending on whether it goes before or after the first position.

## 1. The tree for X

A `213` ending at position `c` forbids every gap `g ≥ c`, via `2134`. A `4213` or `2413` occurrence with third and fourth positions `u,v` forbids every gap `u ≤ g < v`, via `42153` or `24153`. These are all forbidden gaps, since any new basis occurrence must use the inserted maximum. The latter intervals each have `v ≥ T_3`. Their union with the forbidden tail therefore gives one forbidden tail. Consequently the legal gaps are `0, …, k−1`, where `k` is the minimum of `T_3` and every such `u`. If there is no `213`, there is no such `u`, and `b=k=n+1`. Otherwise, `d ≤ b ≤ k`, since each `u` is a middle index of a `213` and `T_3>b`.

Insert the new maximum in a legal gap `g`. If `g<d`, the prefix before it is increasing, so there is no new `213` (the new maximum could only end it). All old `213` middles shift by one, so `b'=b+1` including the sentinel. All old obstruction indices that define `k` also shift by one. The new maximum, as first or second entry of a newly formed `4213` or `2413`, creates an obstruction at the shifted middle of every old `213`, hence `k'=b+1`; this is again true when no `213` exists, by the sentinels. The first descent moves to position `g+2`, because the old prefix is increasing and the new maximum drops to the next entry; if there is no next entry, `g+2` is the new sentinel.

If `d ≤ g<k`, the new maximum ends a `213` with middle index `d), so `b'=d` and `T'_3=g+1` (old 213 ends were strictly past the gap and hence now past the inserted maximum). Each old obstruction defining `k` is past `g`, and each new `4213` or `2413` has its third position past the inserted maximum. Hence `k'=g+1`. The first descent bottom stays at `d`. These two cases give exactly
```
g in [0,d−1] : (d,b,k) -> (g+2,b+1,b+1)
g in [d,k−1] : (d,b,k) -> (d,d,g+1).
```

Write `A(a,m)` for `(d,b,k)=(a+1,m+1,m+1)`, with `0 ≤ a ≤ m`, and `B(a,m)` for `(d,b,k)=(a+1,a+1,m+1)`, with `0 ≤ a<m`. The empty permutation is `A(0,0)`. The cases above exhaust the tree and give
```
A(a,m) -> A(h,m+1)       for 1 ≤ h ≤ a+1,
          B(a,m')        for a+1 ≤ m' ≤ m.
B(a,m) -> A(h,a+1)       for 1 ≤ h ≤ a+1,
          B(a,m')        for a+1 ≤ m' ≤ m.
```
Each child on the indicated list occurs once.

## 2. The identical tree for Y

Now a `213` with middle and end `u,v` forbids `u ≤ g<v`, via `2143`, and a `4213` or `2413` ending at `T` forbids `g ≥ T`, via `42135` or `24135`. These again give all forbidden gaps. In particular the initial `d` gaps belong to the legal initial run.

Fix a legal gap `g`. No old `213` crosses it in the sense `u ≤ g<v`. Consider old `213` occurrences with middle index `u>g`. If there is at least one, let `u_*` be the minimum such middle index and `v_*` the minimum such end index, allowing different occurrences to attain the two minima. Then `u_*<v_*`. If `T_4≤n`, legality gives `g<T_4`. The embedded `213` in an earliest four-pattern also ends at `T_4`, so its middle lies beyond `g`; thus `v_*≤T_4`. In particular the old run of consecutive legal gaps starting at `g` ends just before `u_*`. If there is no such old `213`, there is no old four-pattern (by the same argument), and every old gap from `g` on is legal.

After insertion, the old `213` occurrences past `g` have their indices increased by one. Each creates a new four-pattern ending at the shifted end index, by using the inserted maximum. All new four-patterns arise in this manner. Hence the new forbidden tail begins at `v_*+1` when such occurrences exist. An old occurrence with middle `u_*` has end at least `v_*`, and its shifted forbidden interval covers all gaps from `u_*+1` through `v_*`. From the gap immediately after the new maximum, the new legal gaps are therefore exactly `g+1,…,u_*`. If there are no such old occurrences, they are instead `g+1,…,n+1`. In both cases their number is the number of consecutive legal old gaps starting at `g`.

Before the new maximum, the only new possible `213` occurrences are those ending at the new maximum. If `g<d`, there are none. Hence all old gaps up to `g` stay legal (for `g<d` they belonged to the initial run), and the new legal set is one initial run of length exactly the old initial-run length plus one. If `g≥d`, the earliest middle of a `213` ending at the new maximum is `d`, and that occurrence blocks all gaps `d,…,g`. No gap below `d` is blocked. In this case the legal set consists of precisely the initial `d` gaps and the disjoint second run just calculated. The first descent updates identically to Section 1.

Inductively the legal set always has one of these two forms. Label a one-run word `A(a,m)` if its legal run length is `m+1` and `d=a+1`. Label a two-run word `B(a,m)` if its initial run has length `d=a+1` and its second run length is `m−a`. The empty permutation has label `A(0,0)`. The first `d` gaps give the indicated `A` children as in Section 1. The remaining legal gaps are the last `m−a` gaps of the initial run for `A`, or all of the second run for `B`; the available run lengths from those gaps are precisely `1,…,m−a`, each occurring once. Thus the `B` children are exactly as in Section 1. This proves equality of the two tree level sizes for every length, since deleting the maximum uniquely recovers each parent.

## 3. Evaluation of the common series

Use a formal variable `x`, and let `U(a,m)` be the generating series for all descendants of `A(a,m)`, with the starting vertex counted as 1 and each additional tree edge weighted `x`. For a path beginning at `A(a,m)`, a block of `r≥1` consecutive `B` labels selects a weakly decreasing list of `r` values from `a+1,…,m`. The generating series of all such blocks, including the empty block, is `v^(m−a)`, where `v=(1−x)^−1`, by choosing the multiplicities independently. After a nonempty block, the next `A` child, if any, is `A(h,a+1)`. If there is no intervening block, a next `A` child is `A(h,m+1)`. Therefore
```
U(a,m) = v^(m−a)
       + x sum_(h=1)^(a+1) U(h,m+1)
       + x(v^(m−a)−1) sum_(h=1)^(a+1) U(h,a+1).
```

Let `α_a, β_a` be the unique formal series satisfying
```
S_a = sum_(h=1)^(a+1) α_h v^(a+1−h)
β_a = −x S_a
α_a = 1 − 2β_a + x sum_(h=1)^(a+1) β_h.
```
Existence and uniqueness are immediate by recursion on powers of `x`, with `α_a(0)=1, β_a(0)=0`. Substitution verifies that `α_a v^(m−a)+β_a` satisfies the recurrence for `U`, which likewise has a unique solution coefficient by coefficient. Thus `U(a,m)=α_a v^(m−a)+β_a`.

Write `α(u)=sum_(a≥0) α_a u^a` and `β(u)=sum_(a≥0) β_a u^a`. Summing successively gives
```
(1−vu)β(u) = −x (α(u)−α_0)/u,
(1−u)(α(u)+2β(u)) = 1 + x(β(u)−β_0)/u.
```
Eliminating `α(u)` yields
```
K(u) β(u) = xu − x^2 β_0 − xu(1−u)α_0,
K(u) = u^2(1−u)(vu−1) + 2xu(1−u) − x^2
     = (u−x)/(x−1) [u^3+(2x−2)u^2+(1−x)u+x^2−x].
```
Both `u=x` and the unique formal root `u=r(x)=x+O(x^2)` of the bracket with zero constant term are valid substitutions: all coefficients of `β(u)` are regular series in `x`, and both arguments vanish at 0. Existence of `r` follows by the coefficient recursion with linear coefficient 1 at `x=0,u=0`; the cubic evaluates to `x^2(3x−2)` at `u=x`, so `r≠x`.

At `u=x` the kernel identity gives `1−β_0=(1−x)α_0`. At `u=r` it then gives
```
(r−x) = [r(1−r)−x(1−x)] α_0.
```
As the coefficient ring is an integral domain, cancellation gives `α_0=(1−x−r)^−1`. Thus the nonempty series is
```
P = U(0,0)−1 = xα_0 = x/(1−x−r).
```
Substitute `r=1−x−x/P` in its cubic, in the field of formal Laurent series. After multiplication by the nonzero factor `P^3/x^2` this gives
```
P = (1+P)(x+(1−x)P^2).
```
The unique solution with zero constant term is precisely Chern–Fu–Lin’s (1.2). Hence both previously open classes have the enumerating series in Burstein’s conjecture, at every length.
