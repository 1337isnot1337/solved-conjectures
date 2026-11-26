# Finite compact-action analogue with an abelian odd core

Partial progress for [Erdős #811](https://www.erdosproblems.com/811). The zero-density classification holds for an unbounded family of even finite groups, including nonabelian ones. It is not a solution for arbitrary balanced colorings.

**Theorem.** Let $G$ be a finite group with a normal abelian subgroup $H$ of index two. Suppose every prime divisor of $|H|$ exceeds $22{,}674{,}816$; the trivial group is allowed. For any balanced six-color homogeneous graphon from $G$, zero rainbow six-cycle density is equivalent to the exact three-and-three parity model of $G/H$.

Pull back to $G$, and let $f_i$ be the six symmetric Cayley functions, with sum one and means $1/6$. Denote their averages on $H$ and its other coset by $w_{i,0}, w_{i,1}$. Each pair sums to $1/3$. Let $D=\sum_i |w_{i,0}-w_{i,1}|$ and let $c=6^{-6}/81=1/3{,}779{,}136$.

## Small bias: repair only the restrictions to the subgroup

If $D<2c$, the six restrictions to $H$ have total degree discrepancy
$$\sum_i |w_{i,0}-1/6|=D/2<c.$$
Produce a balanced set of Cayley functions on $H$ without increasing this discrepancy in total $L^1$ distance. For each color with surplus mean, scale its function by the constant needed to reduce its mean to $1/6$. Pool the removed functions and distribute their sum to the deficit colors in proportion to their missing mean. This preserves nonnegativity, symmetry and pointwise sum one. Surplus functions only decrease and deficit functions only increase, so the total $L^1$ difference is exactly $D/2$.

The subgroup has odd order, so the average rainbow cycle density over the 720 orders for the repaired functions is at least $c$ by [the pro-odd theorem](PRO-ODD-ACTIONS.md). For each order the change in density is at most the total $L^1$ difference: telescope the six edge factors, bound all unchanged factors by one, and integrate the one difference on that edge. Therefore the restrictions before repair already have positive rainbow cycle density. Cycles with all vertices in a common coset of $H$ give positive density in $G$.

## Large bias: finite sumset growth

Assume $D\ge 2c$. Choose the heavier component in each color. Their total score is $1+D/2$. If they contain an odd number of outside components and a nonpure color exists, switch a color of least absolute bias. That color is nonpure, since pure colors have the largest possible bias $1/3$. Thus all selected components are nonempty in measure. The score of the new tuple is at least $1+D/2-D/6=1+D/3$. If the initial tuple already has even parity, its score is at least that large. If all colors are pure, column balance forces exactly three outside colors and exactly the asserted parity obstruction; all such graphons have zero density.

For a selected even tuple outside the obstruction, move the coset representatives to the right of the product as in [the compact component argument](SMALL-COMPONENT-QUOTIENTS.md). The factors now have positive supports $A_1,\dots,A_6$ in $H$, transformed by fixed translations and automorphisms, with
$$\frac{\sum_i |A_i|}{|H|}\ \ge\ 1+\frac D3\ \ge\ 1+\frac{2c}{3}.$$
The desired target is a single prescribed element of $H$, which absorbs the product of the representatives. If $H$ is trivial there is nothing to prove. Otherwise let $p$ be its least prime divisor. If $S=A_1+\cdots+A_5$ is all of $H$, every target is in $S+A_6$. If not, its stabilizer is a proper subgroup of size at most $|H|/p$. By the iterated form of [Kneser's sumset theorem](https://doi.org/10.1112/blms.70043),
$$|S|\ \ge\ \sum_{i=1}^5 |A_i|-\frac{4|H|}{p}.$$
This form follows by applying the aperiodic bound repeatedly in the quotient by the stabilizer of $S$; any period of an intermediate sum would be a period of the final sum in that quotient. Consequently $|S|+|A_6|>|H|$, since $p>6/c$ implies $4/p<2c/3$. Every target in $H$ is represented. The representation gives a positive graphon contribution because the factors are positive on their selected support elements. In the parity case the index-two cut descends to the homogeneous space since the stabilizer lies in $H$, as in the compact proof.

The fixed prime cutoff is sufficient and not asserted to be optimal. Kneser's theorem and the earlier pro-odd cycle bound are the inputs. The new argument joins a perturbative small-bias regime to the large-bias component score and requires no upper bound on $|H|$ or on the number of prime factors. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
