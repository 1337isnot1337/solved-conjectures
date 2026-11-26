# Braun–Bruegge's bicyclic facet-maximum conjecture

**Theorem.** For every $`n\ge4`$, the maximum number of facets of a symmetric edge polytope of a connected simple graph with $`n`$ vertices and $`n+1`$ edges is Braun–Bruegge's value $`M(n)`$. We prove their remaining mixed-parity inequality $`N(CB(a,b,c))\le M(a+b+c-1)`$; their existing reductions give the full theorem. Here $`n=4`$ is the smallest nonempty class of such simple graphs.

This resolves [Braun–Bruegge, *Facets of Symmetric Edge Polytopes for Graphs with Few Edges*, journal Conjectures 13 and 32](https://cs.uwaterloo.ca/journals/JIS/VOL26/Braun/braun6.pdf), J. Integer Seq. 26 (2023), Article 23.7.2. These are Conjectures 3.4 and 5.2 in [arXiv:2201.13303v4](https://arxiv.org/abs/2201.13303v4). The mixed-parity conjecture on which *theta graph* maximizes its subclass (journal Conjecture 33, arXiv 5.3) is addressed in the [separate theta optimizer proof](THETA-MAXIMIZER.md).

## Normalized path counts

Let $`a,b`$ be the two path lengths of the same parity and $`c`$ the third. Put $`L=a+b+c=n+1`$. Let
```math
p_m(r)=2^{-m}\binom{m}{(m+r)/2}
```
be the law of a sum of $`m`$ independent uniform signs, zero unless $`r\equiv m\bmod 2`$ and $`|r|\le m`$. In particular $`p_0(0)=1`$. For lengths of a common parity use
```math
F(x,y,z)=2^{x+y+z}\sum_r p_x(r)p_y(r)p_z(r).
```
The paper's Corollary 25 gives the mixed-parity count in the uniform form
```math
N(CB(a,b,c))=ab\,F(a-1,b-1,c)+c\,F(a,b,c-1). \tag{1}
```
For positive decremented lengths this is exactly Corollary 25(ii). In every length-one case its clauses (iii)–(v) collapse a zero-length path to a wedge of even cycles; the criterion $`r=0`$ then gives the same product of central binomial coefficients as the displayed convention for $`F`$. For a simple theta graph there is at most one path of length 1; the algebraic bound below also applies to the tuples with two length-one paths appearing among the paper's formulas.

Let $`U_2,U_1`$ be the first and second terms of (1) after multiplication by $`2\pi/2^L`$, and $`U=U_2+U_1`$. Thus
```math
U_2=\frac{2\pi ab}{4}\sum_r p_{a-1}(r)p_{b-1}(r)p_c(r),\qquad
U_1=\frac{2\pi c}{2}\sum_r p_a(r)p_b(r)p_{c-1}(r). \tag{2}
```
For the maximum binomial masses $`P_m=\max_r p_m(r)`$, we use
```math
\sqrt{\frac{2}{\pi(m+1)}}\le P_m\le
\sqrt{\frac{2}{\pi(m+1/2)}} \quad (m\text{ even}),\qquad
P_{2j-1}=P_{2j}. \tag{3}
```
For an elementary derivation, write $`P_{2j}=4^{-j}\binom{2j}{j}`$, and compare successive values of $`P_{2j}\sqrt{j+s}`$. The difference of successive squared cross-products has the sign of $`j(1-4s)+1-3s`$, so this sequence increases for $`s=1/4`$ and decreases for $`s=1/2`$, to common limit $`1/\sqrt{\pi}`$ by Stirling's formula. This gives (3), also for $`j=0`$. In particular $`P_m\le\sqrt{2/(\pi(m+1/2))}`$ for all nonnegative $`m`$.

## The wedge benchmark

By Definition 12 and Proposition 9 of the paper, $`M(n)`$ is the product of the facet counts of two odd cycles of lengths $`x,y`$ with $`|x-y|\le2`$, multiplied by a bridge factor if $`n`$ is even. Their length sum is
```math
S_0=\begin{cases}
L & n \text{ odd},
\\ L-1 & n \text{ even}.
\end{cases}
```
The normalization $`2^{-L}`$ exactly absorbs the bridge factor 2 in the even case. For an odd cycle of length $`x`$ the normalized facet count is $`2^{-x}N(C_x)=(x/2) P_{x-1}`$. Consequently (3) yields
```math
2\pi\,2^{-L}M(n)\ge\sqrt{xy}
\ge \sqrt{(S_0/2)^2-1}
\ge \frac{S_0}{2}-\frac{2}{S_0}. \tag{4}
```

## Large total length

Assume $`L\ge144`$. From (2), one may sum out any one of the three probability weights and bound the other two by their maxima. The general estimate from (3) is
```math
U_2\le \frac{ab}{\sqrt{(a-\tfrac12)(b-\tfrac12)}}
   \le\sqrt{(a+1)(b+1)},\qquad
U_1\le\frac{2c}{\sqrt{(a+\tfrac12)(c-\tfrac12)}}
   \le \frac4{\sqrt3}\sqrt c .
\tag{5}
```
In the first inequality for $`U_2`$ we retain $`p_{a-1},p_{b-1}`$; in the first for $`U_1`$ we retain $`p_a,p_{c-1}`$. The simplifications follow from $`a^2/(a-1/2)=a+1/2+(1/4)/(a-1/2)\le a+1`$ for $`a\ge1`$, and $`c/(c-1/2)\le2`$.

* **One of $`a,b`$ is below 10.** Equation (5) gives $`U\le(\sqrt{10}+4/\sqrt3)\sqrt{L+1}<\frac{11}{2}\sqrt{L+1}\le \frac{11}{24}(L+1)`$. The last inequality uses $`L+1\ge144`$. The bound is less than $`(L-1)/2-2/(L-1)\le 2\pi\,2^{-L}M(n)`$, since their difference is $`(L-23)/24-2/(L-1)>0`$.
* **Both $`a,b\ge10`$ are odd.** Then $`a,b\ge11`$ and $`c`$ is even, $`c\ge2`$. For $`a\ge3`$ one has $`a^2/(a-1/2)\le a+3/5`$, so the arithmetic-geometric mean applied to (5) gives $`U_2\le(a+b)/2+3/5`$. Retaining $`p_a,p_b`$ for $`U_1`$ instead gives $`U_1\le2c/11`$. Hence $`U\le L/2-2/55`$, which is smaller than $`L/2-2/L`$ from (4).
* **Both $`a,b\ge10`$ are even and $`c\ge3`$ is odd.** Now $`P_{a-1}=P_a`$ and $`P_{b-1}=P_b`$; the first estimate in (5) improves to $`U_2\le ab/\sqrt{(a+1/2)(b+1/2)}\le (a+b)/2`$. Keeping $`p_a,p_b`$ for $`U_1`$ gives $`U_1\le c/5`$. Thus $`U\le L/2-3c/10\le L/2-9/10`$, smaller than $`(L-1)/2-2/(L-1)`$ from (4).
* **Both $`a,b\ge10`$ are even and $`c=1`$.** Equation (1) simplifies exactly to
```math
N(CB(a,b,1))=(ab/2+1)\binom a{a/2}\binom b{b/2}.
```
Indeed $`F(a-1,b-1,1)`$ is twice the product of two half-central binomial coefficients; the second $`F`$ uses the $`r=0`$ term. Thus $`U\le (ab+2)/\sqrt{(a+1/2)(b+1/2)}`$. For $`a\ge2`$, $`a^2/(a+1/2)\le a-2/5`$. Arithmetic-geometric mean bounds the $`ab`$ contribution by $`(a+b)/2-2/5`$, and the remaining term is at most $`1/5`$. Therefore $`U\le (L-1)/2-1/5`$, smaller than (4).

This proves the mixed-parity bound for every $`L\ge144`$, without any constraint on an individual path length or growth rate.

## Finite base and the full extremal conjecture

The remaining $`5\le L\le143`$ are checked with exact integer arithmetic by [check.py](check.py). It computes (1) by direct finite centered binomial sums and compares it with Definition 12, testing 60,899 tuples (up to permuting the two paths of the same parity). The whole finite base passes. No numerical approximations or near-equality tests are needed.

Thus the mixed-parity inequality holds for every nonempty bicyclic class. The source already proves the same upper bound for graphs having two edge-disjoint cycles (Theorem 14) and for same-parity theta graphs (Theorem 27). Corollary 19 handles a leaf by removing it, multiplying the facet count by 2, and comparing $`2M(n-1)\le M(n)`$. After leaves are removed a connected graph of cycle rank two either has two edge-disjoint cycles or is one of the three-path theta graphs just covered. The wedges in Definition 12 attain the claimed bound in the valid simple cases with $`n\ge5`$; $`n=4`$ has just $`K_4`$ minus an edge, with twelve facets by (1) at $`(a,b,c)=(2,2,1)`$. This proves the global maximum.

## Priority and scope

The source explicitly identifies the mixed-parity upper bound as the remaining case of its all-bicyclic conjecture. The subsequent [reported proof of their same-parity binomial-transfer conjecture](https://www.trureturing.org/research/braun-bruegge-2022-symmetric-edge-polytope-facet-sum-conjecture-5-1/) states that mixed-parity triples are outside its scope. [Mori–Mori–Ohsugi](https://arxiv.org/abs/2312.11287) address the different all-connected-graphs facet bounds within join graphs, not the sharp bicyclic extremum. Focused searches for both journal and arXiv conjecture numbers and for maximal theta facet counts did not locate a prior resolution of the mixed-parity bound. This is a bounded check, not an exclusive-priority claim.
