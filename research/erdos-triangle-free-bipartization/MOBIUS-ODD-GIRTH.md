# Sharp odd-girth bipartization through Möbius ladders

This establishes the [generalized Erdős bipartization bound](https://www.erdosproblems.com/23) for **all** Möbius-ladder preimages, including arbitrary vertex product weights, and gives a new all-odd-girth minimum-degree regime by the Lu–Wang structure theorem. It does not resolve the conjecture without the structural assumption.

**Theorem.** Let m≥4 be even. Every graph homomorphic to the Möbius ladder on 2m vertices can be made bipartite by deleting edges of total product cost at most N²/(m+1)², where N is the total vertex weight. For N>0 equality holds, after removing zero-weight vertices, precisely for a complete blow-up of the odd cycle of length m+1 whose class masses are all N/(m+1).

## Two kinds of cut

Write the ladder as m columns, with two rails joining successive columns, a rung inside each column, and a twist interchanging the rails at the last join. In column i the two masses are x_i,y_i; put s_i=x_i+y_i and c_i=x_i y_i. For each join let q_i be the sum of its two rail edge costs. At ordinary joins q_i=x_i x_(i+1)+y_i y_(i+1); at the twist interchange the next pair's coordinates. Write C=∑c_i and S=∑s_i.

Alternating along the whole outer cycle cuts all rail edges and misses all rungs, for cost C. For each join i one can instead put opposite signs on each rung and alternate the rail signs along the other m−1 joins. The outer rail loop has one twist and m even, so precisely the two rails at join i remain uncut. This costs q_i. Thus the minimum cut deletion cost is at most min(C,min_i q_i).

## The twisted mass inequality

It suffices to prove S≥m+1 whenever all q_i≥1 and C≥1. A positive candidate threshold can then be scaled to one by dividing all vertex masses by its square root; the case of a zero cost is immediate.

Assume S≤m+1. Follow the dominant (larger) coordinate of each column along the circular sequence, interchanging at the twist. There is some join whose two dominant coordinates are opposite relative to its rail pairing, because a full turn exchanges the rails. In a tie one may pick either dominant coordinate consistently per column; ties do not affect the inequalities below. Call this join exceptional. Let its two total column masses have sum s, its two larger coordinates be a,b, and set A=a+b. Put δ=3−s.

At the exceptional join, the dot product q is at most half the product of column masses: writing it as one half of the product of their sums plus the product of their signed differences, the differences have opposite signs. Thus s≥2√2. Pair the columns by the perfect matching of the column cycle containing this join. Every other paired column sum is at least two, by q_i≥1 and AM–GM. It follows that s≤3 and 0≤δ≤3−2√2<1/5.

For any paired columns with total mass 2+z and rail sum q, the sum of their two rung products plus q is a product of two complementary sums of the four weights. In the ordinary labeling this is (x+y′)(y+x′); the swapped pairing uses the swapped labels. Therefore their rung sum is at most (2+z)²/4−1=z+z²/4. The total z of the pairs other than the exceptional one is at most δ. Hence the rung mass outside the exceptional columns is at most δ+δ²/4.

Now use the *other* perfect matching of the column cycle. Each exceptional column is paired with a different neighbor whose mass is at least 1/a or 1/b, respectively, since its rail dot product is at most the exceptional column's largest coordinate times the neighbor's total mass. All remaining pairs cost at least two in vertex mass. Thus

```math
 1/a+1/b\le 5-s=2+\delta,\qquad A\ge 4/(2+\delta).
```

The sum of the exceptional rung products plus q is A(s−A), since the exceptional join pairs a larger coordinate with a smaller one in both rails. The function z(s−z) is decreasing for z≥s/2, and 4/(2+δ)>s/2. Consequently

```math
 A(s-A) \le \frac{4(2+\delta-\delta^2)}{(2+\delta)^2}
 \le 2-\delta-\delta^2/4.
```

For the last comparison the difference after multiplication by (2+δ)² is δ²(1−2δ−δ²/4), strictly positive when 0<δ<1/5. As q≥1, the exceptional rung mass is at most 1−δ−δ²/4, with strict inequality when δ>0. Together with the other pairs this contradicts C≥1 unless δ=0. If δ=0 then s=3 and S≥m+1 from the first matching. This proves the inequality.

## Equality and transfer to preimages

At equality normalized to q_i,C≥1 and S=m+1, the comparison above forces δ=0. All nonexceptional pairs in the first matching have total mass exactly two and q_i≥1, so their columns are pure of mass one. In the exceptional pair, the inequalities force A=2 and the sum of the smaller coordinates to be one. The reciprocal inequality with a+b=2 implies a=b=1.

Reindex the strip so the exceptional join is the twist. Consecutive interior pure columns occupy the same rail; each of the two end columns must have its unit coordinate on that rail to meet the next interior join at cost ≥1. The two possible extra masses of total one at the other rail ends, when positive, are twins, each joined to both ends of the occupied rail path. After merging the twins the positive support is exactly an odd cycle of length m+1 with unit masses. Conversely, an odd cycle with equal class masses attains the bound. It is realized in the ladder already on m+1 consecutive outer cycle vertices.

For a homomorphism to the ladder, aggregate the vertex weights on each fiber. The product of the fiber weights is an upper bound on the mass of original edges between them, so a cut pulled back from the template gives the inequality. In case of equality the complete weighted template at the same fiber weights must also attain equality. Its positive support is the cycle blow-up just described. Any missing edge of positive product cost on a cyclic pair would make the cut that omits exactly that pair cost strictly less, so equality in the preimage requires the complete blow-up.

## Consequence for Erdős's higher odd-girth question

Write g=2k+1 for k≥2. [Lu and Wang](https://arxiv.org/abs/2607.04323) prove that an N-vertex graph of odd girth at least g and minimum degree greater than 4N/(6k−1) maps to the 4k-vertex Möbius ladder. Taking m=2k, the present cut theorem gives the exact generalized Erdős bound N²/g² throughout that minimum-degree regime. The older [Messuti–Schacht](https://arxiv.org/abs/1602.03904) cycle-homomorphism theorem gives the cut bound under the stronger degree threshold 3N/(4k). Neither structure theorem asserts the weighted ladder cut inequality; that is the new step here. Related papers on sparse halves address a different objective. No unrestricted higher-odd-girth solution or finite-order computation is claimed.
