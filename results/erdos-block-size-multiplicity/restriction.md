# Restriction to a prescribed number of points

Let $`M(D)`$ be the largest number of blocks of any one size in a nontrivial pairwise balanced design $`D`$. A restriction keeps the intersections of the original blocks with the selected points whenever the intersection has size at least two.

**Theorem.** Fix $`0<\varepsilon<1/2`$. There is a constant $`C_\varepsilon`$ such that, whenever $`D`$ has $`v`$ points and $`\varepsilon v\le n\le(1-\varepsilon)v`$, some $`n`$-point restriction $`D'`$ is nontrivial and satisfies

```math
M(D')\le C_\varepsilon M(D).
```

Here and below $`v`$ is sufficiently large in terms of $`\varepsilon`$. In particular, if $`f(v)`$ is the smallest possible $`M(D)`$, then $`f(n)\le C_\varepsilon f(v)`$ throughout this range. No resolution into parallel classes is required.

## A binomial estimate

Write $`b(l,j)=\Pr(\mathrm{Bin}(l,p)=j)`$, with zero mass outside $`0\le j\le l`$. Take $`\varepsilon\le p\le1-\varepsilon`$. For each $`t\ge2`$ choose $`h=h_0+\lceil3\log_2(t+2)\rceil`$, where the positive integer $`h_0`$ will depend only on $`\varepsilon`$. Define weights for integer $`s\ge0`$ by

```math
w_s=\begin{cases}
1 & s<h,\\
\max_{0\le j\le h}b(s-h,t-j)&s\ge h.
\end{cases}
```

For $`s<h`$ with $`s<t`$, set $`w_s=0`$, since a block of size $`s`$ cannot contribute. Then $`\sum_s w_s\le K`$ uniformly in $`t`$ and $`p`$, with $`K`$ depending only on $`\varepsilon,h_0`$.

To see this, first take $`t\ge 2h+2`$. The binomial mass in $`j`$ increases up to $`\lfloor(l+1)p\rfloor`$ and decreases thereafter. If this mode lies outside $`[t-h,t]`$, the maximum is at one of the two endpoints. Their total contribution, summed over all $`l=s-h\ge0`$, is at most $`2/p`$, since for each $`a\ge0`$

```math
\sum_{l\ge0}b(l,a)=\sum_{l\ge a}\binom la p^a(1-p)^{l-a}=1/p.
```

The number of $`l`$ with mode in the interval is at most $`(h+2)/p+1`$. For these $`l`$, we have $`l\ge t-h-1`$ and the maximum binomial mass is at most $`C_\varepsilon/\sqrt{l+1}`$ by Stirling's bounds. Their contribution is $`O_\varepsilon((h+2)/\sqrt{t+1})`$, uniformly bounded for this choice of $`h`$. For the finitely many smaller $`t`$ the sum is at most $`h+(h+1)/p`$, by summing each possible endpoint separately and using the same identity. This proves the estimate.

## The restriction argument

Put $`M=M(D)`$. De Bruijn–Erdős gives at least $`v`$ blocks. The pair identity $`\sum_B |B|(|B|-1)=v(v-1)`$ shows that at most $`v/4`$ blocks have size greater than $`\lceil2\sqrt v\rceil`$. Consequently $`M\ge c\sqrt v`$ for an absolute $`c>0`$. The same identity bounds the total number of blocks larger than $`v^{3/4}`$ by $`O(\sqrt v)=O(M)`$. Set those blocks aside and call the remaining blocks small.

Select an $`n`$-element subset $`S`$ uniformly at random. Let $`X_t`$ count the small blocks meeting $`S`$ in exactly $`t`$ points. We prove a factorial-moment bound. Start with a model selecting each point independently with probability $`p=n/v`$. For an ordered tuple of $`h`$ distinct small blocks, each block meets the other $`h-1`$ blocks in at most $`h-1`$ points altogether. Expose every point belonging to two or more tuple blocks. In a tuple block of size $`s\ge h`$, expose additional private points until exactly $`h`$ of its points have been exposed. Expose every point of each smaller block. All unexposed parts of the tuple blocks are now disjoint. Given the exposed bits, the probability that all $`h`$ intersections have size $`t`$ is at most $`\prod_B w_{|B|}`$ by independence. The same bound holds before the bits are exposed.

For the exact-size model, the probability of any event determined by the tuple's union $`U`$ is at most $`D_\varepsilon`$ times its probability in the independent model. Indeed, $`|U|\le h v^{3/4}\le v/2`$ for all sufficiently large $`v`$ and $`t\le v^{3/4}`$. Conditional on the chosen points of $`U`$, the probability that exactly $`n`$ points are chosen in total is at most $`C_\varepsilon/\sqrt{v-|U|}`$. Without this conditioning it is at least $`c_\varepsilon/\sqrt v`$, by the binomial mass at its integer mean. The ratio is bounded by $`D_\varepsilon`$, independently of the tuple, by Stirling's bounds. For $`t>v^{3/4}`$ we have $`X_t=0`$.

Let $`(x)_h=x(x-1)\cdots(x-h+1)`$. Expanding over ordered distinct tuples and then allowing all tuples in the product bound gives

```math
\mathbb E (X_t)_h
\le D_\varepsilon\left(\sum_{B\text{ small}} w_{|B|}\right)^h
\le D_\varepsilon(KM)^h.
```

For all large $`v`$, $`h\le KM`$ for every relevant $`t`$, after increasing $`K`$ to at least one. If $`X_t\ge3KM`$, every factor in $`(X_t)_h`$ is at least $`2KM`$. Hence $`\Pr(X_t\ge3KM)\le D_\varepsilon 2^{-h}`$. Choose $`h_0`$ so that the sum of these bounds over all $`t\ge2`$ is less than $`(\varepsilon/2)^3`$. This choice precedes the choice of $`K`$.

Fix three noncollinear points of $`D`$. They exist since any block of size at least two is proper and a pair of its points occurs in it alone. The uniform $`n`$-set contains the fixed triple with probability $`(n)_3/(v)_3\ge(\varepsilon/2)^3`$ for all large $`v`$. There is therefore an $`S`$ containing the triple for which every $`X_t<3KM`$. Any retained pair is still in exactly one block, and the fixed triple ensures the restriction is nontrivial. Adding back the $`O(M)`$ large original blocks proves the theorem. Distinct original blocks cannot yield identical intersections of size at least two.

## Which orders suffice

Suppose there is an increasing unbounded sequence of orders $`v_j`$ with $`v_{j+1}/v_j\le A`$ for all large $`j`$ and $`f(v_j)\le B\sqrt{v_j}`$. Given large $`n`$, take the first $`v_j\ge2n`$. Then $`2n\le v_j<2An`$. The theorem gives $`f(n)=O_{A,B}(\sqrt n)`$. The converse follows by choosing the powers of two. The same argument propagates any bound of the form $`O(v^\alpha)`$ along such a sequence.

This removes the order-selection gap identified in the July working report on Zribi's conditional construction. In his Conjecture 2.2, take $`q=\lceil\sqrt n\rceil`$ and use the prime $`p`$ actually supplied for that $`q`$, with $`2q<p\le C_pq`$. Lemma 2.4 gives a design on $`v=qp`$. Each support of size at least two gives $`p`$ translates of that size, and at most $`C_L`$ supports have a given size. The $`q`$ group blocks show that $`M(D)\le p C_L+q=O(\sqrt v)`$. Since $`2n<v\le4C_p n`$, the restriction theorem applies to this very design and gives an $`n`$-point design with $`M=O(\sqrt n)`$. The existence of the codes in Conjecture 2.2 remains open. [Zribi, Definition 2.1 and Lemma 2.4](https://drive.google.com/file/d/1dp5tbTjJR3t1jdvDUO90U3gxZp2nxySe/view) · [July report, §4](https://erdosproblemaday.com/report/734)
