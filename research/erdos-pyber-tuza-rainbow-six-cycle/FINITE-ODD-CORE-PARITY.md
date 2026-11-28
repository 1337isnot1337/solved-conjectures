# Index-two compact actions with a large-index pro-odd core

Partial progress for [Erdős #811](https://www.erdosproblems.com/811). The zero-density classification holds for an family of even finite and infinite profinite groups, including nonabelian ones. It is not a solution for arbitrary balanced colorings.

**Theorem.** Let $G$ be a compact metrizable group with a closed subgroup $H$ of index two. Suppose $H$ is profinite, every finite quotient of $H$ has odd order, and every proper open subgroup of $H$ has index greater than $22{,}674{,}816$. In particular, this applies to every finite group of order $2n$ having an index-two subgroup when the prime divisors of $n$ all exceed that cutoff. The trivial core is allowed. For any balanced six-color homogeneous graphon from $G$, zero rainbow six-cycle density is equivalent to the exact three-and-three parity model of $G/H$.

Pull back to $G$, and let $f_i$ be the six symmetric Cayley functions, with sum one and means $1/6$. Denote their averages on $H$ and its other coset by $w_{i,0}, w_{i,1}$. Each pair sums to $1/3$. Let $D=\sum_i |w_{i,0}-w_{i,1}|$ and let $c=6^{-6}/81=1/3{,}779{,}136$.

## Small bias: repair only the restrictions to the subgroup

If $D<2c$, the six restrictions to $H$ have total degree discrepancy
```math
\sum_i |w_{i,0}-1/6|=D/2\lt c.
```
Produce a balanced set of Cayley functions on $H$ without increasing this discrepancy in total $L^1$ distance. For each color with surplus mean, scale its function by the constant needed to reduce its mean to $1/6$. Pool the removed functions and distribute their sum to the deficit colors in proportion to their missing mean. This preserves nonnegativity, symmetry and pointwise sum one. Surplus functions only decrease and deficit functions only increase, so the total $L^1$ difference is exactly $D/2$.

The subgroup is pro-odd, so the average rainbow cycle density over the 720 orders for the repaired functions is at least $c$ by [the pro-odd theorem](PRO-ODD-ACTIONS.md). For each order the change in density is at most the total $L^1$ difference: telescope the six edge factors, bound all unchanged factors by one, and integrate the one difference on that edge. Therefore the restrictions before repair already have positive rainbow cycle density. Cycles with all vertices in a common coset of $H$ give positive density in $G$.

## Large bias: product growth on a compact group

Assume $D\ge 2c$. Choose the heavier component in each color. Their total score is $1+D/2$. If they contain an odd number of outside components and a nonpure color exists, switch a color of least absolute bias. That color is nonpure, since pure colors have the largest possible bias $1/3$. Thus all selected components are nonempty in measure. The score of the new tuple is at least $1+D/2-D/6=1+D/3$. If the initial tuple already has even parity, its score is at least that large. If all colors are pure, column balance forces exactly three outside colors and exactly the asserted parity obstruction; all such graphons have zero density.

For a selected even tuple outside the obstruction, move the coset representatives to the right of the product as in [the compact component argument](SMALL-COMPONENT-QUOTIENTS.md). The factors now have positive supports $A_1,\dots,A_6$ in $H$, transformed by fixed translations and automorphisms, with
```math
\sum_i \mu(A_i)\ \ge\ 1+\frac D3\ \ge\ 1+\frac{2c}{3}.
```
The desired target is a single prescribed element of $H$, which absorbs the product of the representatives. Write $\mu$ for normalized Haar measure on $H$. If $H$ is trivial there is nothing to prove. Otherwise every proper closed subgroup of positive measure is open (Steinhaus' theorem), and hence
```math
s_H:=\sup_{L\lt H,\ L\ \mathrm{closed}}\mu(L)\ \le\ \frac{1}{22{,}674{,}817}\ <\ \frac c6.
```
The unimodular form of [Jing and Tran's Cauchy–Davenport theorem](https://arxiv.org/abs/2106.02924), Theorem 1.1, gives for any nonempty compact sets $A,B\subseteq H$ the lower bound
```math
\mu(AB)\ge\min\{\mu(A)+\mu(B)-s_H,1\}.
```
It applies to positive convolution supports: first pass to full-measure subsets whose ordinary product lies in the positive support using the conjugation-invariant smoothing argument in [the connected-action proof](CONNECTED-COMPACT-ACTIONS.md), which itself does not require connectedness. Approximate those subsets from inside by compact sets. At each of four steps of forming the positive support $P$ of the first five factors, this bounds the loss by $s_H$. If any intermediate step reaches measure one, the next positive factor again gives positivity at every target. Otherwise the final measure is at least the sum of the first five support measures minus $4s_H$. In either case $\mu(P)+\mu(A_6)>1$, since the six support measures sum to at least $1+2c/3$. Thus $P$ intersects the translated inverse of $A_6$ in positive measure at every target. This gives positive rainbow cycle density, not just existence of a product representative.

In the parity case the index-two cut descends to the homogeneous space since the stabilizer lies in $H$, as in the compact proof.

The fixed subgroup-index cutoff is sufficient and not asserted to be optimal. The compact product theorem and the earlier pro-odd cycle bound are the inputs. The new argument joins a perturbative small-bias regime to the large-bias component score and requires neither commutativity nor finiteness of $H$. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
