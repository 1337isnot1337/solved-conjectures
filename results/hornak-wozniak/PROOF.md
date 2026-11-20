# Horňák–Woźniak conjecture

A tree is *arbitrarily vertex decomposable* (AVD) if, for every list of positive integers summing to its order, its vertices can be partitioned into connected sets of those sizes. Write $S(a_1,\ldots,a_q)$ for the star-like tree whose arms have those orders, each counting the common central vertex. We prove both conjectures in §4 of Horňák and Woźniak's paper.

1. Every admissible sequence $(a_1,a_2,a_3)$ gives an AVD tree $S(a_1,a_2,a_3)$.
2. If both $(2,a_2,a_3,a_4)$ and $(a_2,a_3,a_4)$ are admissible, then $S(2,a_2,a_3,a_4)$ is AVD.

Admissibility is the conjunction of the five tests of Theorem 12 for every indicated modulus. The proof below uses only tests 1, 2 and 5. We use Theorems 9 and 10, which quote the reductions of Barth and coauthors, and use the numbering of the publicly available preprint throughout. [Original preprint](https://umv.science.upjs.sk/preprints/dokumenty/A3-2006.pdf) · [Published paper](https://doi.org/10.1016/j.disc.2007.04.008)

## 1. Packing pieces of two consecutive sizes

Fix positive integers $i$ and $j=i+1$. When one part of size $j$ contains the central vertex, every other part fits in a single arm. Conversely, if all the other parts can be assigned to the arms without exceeding their capacities, place them on consecutive segments starting at the leaves. The unused initial segments, together with the centre, form the central part.

Let $x_l$ denote the available capacity of arm $l$. Write

```math
q_l=\left\lfloor x_l/i\right\rfloor,\quad u_l=x_l\bmod i,
\qquad
h_l=\left\lfloor x_l/j\right\rfloor,\quad v_l=x_l\bmod j.
```

If $b_l$ pieces of size $j$ go in arm $l$, the number of size-$i$ pieces it can still accommodate is

```math
q_l-b_l-\left\lceil (b_l-u_l)/i\right\rceil .
```

The ceiling is nonnegative. To place $a$ pieces of size $i$ and $b$ pieces of size $j$ outside the centre, we need $0\le b_l\le h_l$, $\sum_l b_l=b$, and total ceiling cost at most $K=\sum_lq_l-a-b$. For $K\ge0$ let $M(K)$ be the largest $b$ obtainable with that cost budget. At cost zero each arm contributes $\min(h_l,u_l)$ possible pieces. Each unit of additional cost in that arm increases this allowance by $i$ until it reaches $h_l$, with a possibly smaller final increment. Thus $M(K)$ is obtained by taking the $K$ largest available increments, including zero increments as needed. Ties can be ordered by taking earlier increments of an arm first. Removing pieces preserves the cost bound. Consequently the assignment exists exactly when $K\ge0$ and $b\le M(K)$, and

```math
0\le M(K+1)-M(K)\le i. \tag{1}
```

For a fixed total size of the pieces outside the centre, increasing $b$ by $i$ decreases $a$ by $j$ and increases $K$ by one. By (1), if the largest possible $b$ is feasible in the given capacities, so is every smaller $b$ for which $K\ge0$.

We will also use the complementary count. If $a_l$ pieces of size $i$ go in arm $l$, its remaining capacity for pieces of size $j$ is

```math
h_l-a_l+\left\lfloor (v_l+a_l)/j\right\rfloor . \tag{2}
```

For a partition with $a\le i$, each flooring term is either zero or one. Producing a carry of one in arm $l$ requires exactly $j-v_l$ of the smaller pieces as a minimum, and is possible if $q_l\ge j-v_l$. If these minima for the required carries fit within $a$ and $\sum_l q_l\ge a$, the rest of the smaller pieces can be distributed within the remaining space for size $i$. This can only increase the sum of the flooring terms in (2).

## 2. Partitions without a smaller extra part

Let the arm capacities be their full orders minus one, and let $n=1+\sum_l x_l$. Let $r(k)\in[1,k]$ represent $n$ modulo $k$. For a modulus $k$ let $\gamma_k$ be the quotient on dividing the sum of the arm residues modulo $k$ by $k$, so this sum equals $r(k)-1+\gamma_k k$. The first admissibility test gives $\gamma_i\le1$ for every index $i$ needed in Theorems 9 and 10. We also have $\gamma_j\le1$ in the same range. At the upper endpoint $j=a_{q-2}+a_{q-1}-1$, the two shorter regular arms contribute $j-1$, the possible one-vertex arm contributes one, and the longest arm contributes at most $j-1$.

Suppose a partition into sizes $i,j$ with at least one size-$j$ part exists. Reserve one of the latter for the centre. Among these partitions the smallest possible $b$ is $r(i)-1$ and the corresponding budget is $K=1-\gamma_i\ge0$. All budgets are therefore nonnegative, so (1) reduces the problem to the partition with the largest $b$. At that endpoint

```math
a=j-r(j),\qquad b=\sum_l h_l-a+\gamma_j .
```

The nonnegative budget implies that $\sum_l q_l\ge a$. If $\gamma_j=0$, (2) permits the required number of size-$j$ parts for any assignment of the size-$i$ parts. If $\gamma_j=1$, condition 5 of Theorem 12 applies, since this partition has $a\le i$. It gives an arm with $v_l\ge r(j)$ and $q_l+v_l\ge j$. By (2), put at least $j-v_l\le a$ smaller pieces there to produce one carry. This accommodates all parts of the endpoint partition, proving the claim for every partition in this class.

## 3. Three regular arms and one smaller extra part

Here $i\ge2$ and we have three regular arm capacities $x_1,x_2,x_3$, each at least $j+1$. Write $n=1+\lambda+\sum_l x_l$, where $\lambda=0$ for a tripod and $\lambda=1$ when an extra one-vertex arm stays with the centre. Suppose there is a part of size $m$ with $1\le m\lt i$ in addition to the parts of sizes $i,j$. We will reserve size $j$ for the centre, including the one-vertex arm if present, and place size $m$ in a regular arm. Superscript primes will indicate the capacities, quotients, and residues after subtracting $m$ from that arm.

Set $U=\sum_l u_l$ and $V=\sum_l v_l$, with sums over the three regular arms. The admissibility tests on the residues at $i$ and $j$ give

```math
U+\lambda-\max_l u_l<i,\qquad V+\lambda-\max_l v_l<j. \tag{3}
```

Indeed, tests 1 and 2 at a modulus $k$ say that the sum of the arm residues other than a largest is less than $k$. For four arms and $k\ge2$, the residue of the one-vertex arm is 1. A largest residue can be taken among the three regular arms unless they are all zero, in which case the corresponding inequality in (3) holds directly. Both $i$ and $j$ lie within the admissibility test range when there is a smaller extra part in Theorems 9 and 10.

For each regular arm set $w_l=h_l+v_l$ and $d_l=q_l-h_l$. Then

```math
x_l=i h_l+w_l,\qquad w_l=i d_l+u_l .
```

In particular $d_l\ge0$, and the arm can produce a carry in (2) exactly when $w_l\ge i$, by the identity

```math
x_l-(j-v_l)i=(w_l-i)j. \tag{4}
```

Define $r=V+\lambda-i$. When $r\gt0$, the partition without $m$ with the largest count of size-$j$ parts has $a_0=j-r$ smaller parts and $\sum_l h_l+2-a_0$ bigger parts including the centre. It exists precisely when $\sum_l w_l+\lambda\ge2i$. When it exists, Section 2 and (2) show that there is an arm $p$ with

```math
v_p\ge r,\qquad w_p\ge i . \tag{5}
```

All size-$i$ and size-$j$ parts outside the centre of that partition belong to regular arms, so the existence of an optional one-vertex arm does not change (5).

### The endpoint with the most size-$j$ parts

For fixed $m$, assume at least one partition in the required class exists. At the endpoint with the largest count of size-$j$ parts, put

```math
\rho=\left\lceil (V+1+\lambda-m)/j\right\rceil,qquad
a=\rho j-(V+1+\lambda-m),\qquad
b+1=\sum_l h_l+\rho-a .
```

Here $0\le a\le i$, $b+1\ge1$, and $\rho\in\{0,1,2\}$ by (3) and $1\le m\lt i$. If $m$ goes in arm $l$, its size-$j$ quotient decreases by $1$ exactly when $v_l\lt m$. Thus (2) needs at least $\rho-1+\mathbf 1_{v_l\lt m}$ carries. Write $H=\sum_l h_l$. Existence of the partition gives $H\ge a+1-\rho$.

**Case $\rho=0$.** All $v_l\lt m$. Subtracting $m$ from any arm leaves at least $H-1\ge a$ slots for the size-$i$ parts, since $x_l-m\ge (h_l-1)j$. No carry is needed.

**Case $\rho=1$.** We have $H\ge a$. If some $v_l\ge m$, put $m$ there, leaving $x'_l\ge h_l j$, so there are at least $H$ slots for the size-$i$ parts and no carry is needed. Suppose all $v_l\lt m$. We will find an arm $l$ with $v_l\ge r$ and $w_l\ge m$. Subtracting $m$ there leaves $x'_l\ge i h_l$, and the wrapped size-$j$ residue is $v'_l=v_l+j-m$. The new carry costs $m-v_l\le a=m-r$ smaller parts. This many fit in the arm because $h_l\ge m-v_l$. Thus (2) gives feasibility.

To find such an arm, if $r\gt0$ and $\sum_l w_l+\lambda\ge2i$, use (5). In the other cases, suppose no arm satisfies both bounds. Every arm with $v_l\ge r$ then has $w_l\lt m$. If an arm has $v_l\lt r$, then $r\gt0$ and $H+V+\lambda\le2i-1$, giving $w_l\le H+r-1\le i-2$. Hence $w_l\lt i$ for all arms, so $u_l=w_l$. We have
```math
U+\lambda=H+V+\lambda\ge a+V+\lambda=i+m.
```
By (3), there is an arm with $u_l\gt m$, so this arm must have $v_l\lt r$. The other two $v$ residues sum to at least $i-\lambda+1$, and each is at most $m-1$. Each is thus at least $i-\lambda+2-m$. The other two $u$ residues are at least their corresponding $v$ residues, as $u_l=w_l$ in all arms. Every pair of $u$ residues now sums to at least $i-\lambda$, contradicting (3). This proves the required existence.

**Case $\rho=2$.** Now $r\gt m$ and $a=j-r+m=a_0+m$. Since $H\ge a-1$, the partition without $m$ at $a_0$ exists. Take the arm $p$ from (5). If an arm other than $p$ has $v_l\ge m$, place $m$ there and produce the required carry in arm $p$ at cost $j-v_p\le a_0$. The arm receiving $m$ still has room for $h_l$ smaller parts, and $q_p\ge h_p+1$, so the total room for smaller parts is at least $H+1\ge a$. If $w_p\ge i+m$, we may instead place $m$ in arm $p$: it has $v_p\ge r\gt m$, still has a carry by (4), and its carry costs $j-v_p+m\le a$. Again there is room for at least $H+1$ smaller parts.

In the remaining case the other two arms have $v_l\lt m$ and $w_p\lt i+m$. If another arm $l$ has $w_l\ge m$, put $m$ there. Arm $p$ can produce its usual carry and the adjusted arm $l$ can produce a carry at cost $m-v_l$, as in the case $\rho=1$. Both are needed because $v_l\lt m$. Their total cost is at most $a$, since
```math
a-[(j-v_p)+(m-v_l)]=i-\lambda-v_k\ge0
```
for the remaining arm $k$, whose $v_k\lt m\lt i$. There is still room for at least $H+1$ smaller parts. Finally, if neither other arm has $w_l\ge m$, we have $u_l=w_l\lt m$ on both and $u_p=w_p-i\lt m$. But $H\ge a-1$ implies
```math
U+\lambda=H+V+\lambda-i\ge i+m.
```
This would force $\max_l u_l\gt m$ by (3). All possibilities have now been covered, proving feasibility at the largest count of size-$j$ parts.

### The endpoint with the fewest size-$j$ parts

Put $R=\lfloor(U+\lambda-m)/i\rfloor$. At the endpoint with the smallest count of size-$j$ parts, the count outside the centre is $b=U+\lambda-m-Ri$. The budget after placing $m$ in arm $l$ is

```math
K=1-R-\mathbf 1_{u_l\lt m} .
```

This follows by using $a+b=\sum_l q_l+R-1$ in the budget formula. By (3), $R\le1$. If $R\le0$, the budget is nonnegative for every choice of arm. The largest-count partition and (1) then give every partition for this $m$. If $R=1$, only the first endpoint still needs a proof, since every later budget is at least zero for any placement of $m$.

Suppose $R=1$. Since $U+\lambda\ge i+m$, (3) gives $\max_l u_l\gt m$. Choose an arm with $u_l\ge m$, so $K=0$ and $\sum_l u'_l=b+i-\lambda$. At this budget we can place $\sum_l\min(h'_l,u'_l)$ bigger pieces. The difference between this number and $\sum_l u'_l$ comes only from the arms with $d'_l=0$. More precisely, the number of bigger pieces possible is

```math
\sum_l u'_l-\sum_{l:d'_l=0}v'_l,
```

because $h'_l-u'_l=i d'_l-v'_l$. It suffices to make the sum of the indicated $v'_l$ at most $i-\lambda$.

Placing $m$ in an arm with $u_l\ge m$ leaves $q_l$ unchanged and increases $d_l$ by one if $v_l\lt m$, leaving it unchanged otherwise. If at least two $d_l$ were positive before the placement, at most one $d'_l$ is zero. In a zero arm $v'_l\le u'_l\le i-1\le i-\lambda$, as required.

Suppose only arm $p$ originally had positive $d_p$. The two other residues satisfy $\sum_{l\ne p}v_l\le i-\lambda$. For $r\le0$ this follows from $V\le i-\lambda$. For $r\gt0$ we have $\sum_l w_l+\lambda\ge U+i+\lambda\ge2i+m$, so (5) applies and its carry arm must be $p$. If the placement of $m$ increases the number of positive arms, the preceding argument applies. Otherwise, the residue in any arm other than $p$ receiving $m$ decreases, and the required bound on the two zero arms persists.

If all three $d_l$ were zero, choose an arm with largest $u_l$. When this becomes positive, the two unaltered residues $v'_l=v_l$ off that arm satisfy $v_l\le u_l$ and have sum at most $i-\lambda$ by (3). When all three $d'_l$ remain zero, $h'_l=q'_l\le u'_l$ in each arm, so the number of bigger pieces possible at zero cost is $\sum_l h'_l=\sum_l q'_l=a+b\ge b$. This last case also gives feasibility. We have proved the first endpoint, and hence all partitions with the extra part.

## 4. Applying the reductions

For the tripod, take $\lambda=0$ and $x_l=a_l-1$. Theorem 9 reduces AVD to the partitions from Section 2 for $1\le i\le a_1+a_2-2$ and those from Section 3 for $2\le i\le a_1-3$. In the latter range all arms have capacity at least $i+2=j+1$. Sections 2 and 3 therefore prove Conjecture 1 for every admissible triple.

For the four-arm tree, the shorter sequence $(a_2,a_3,a_4)$ is admissible, so its tree is AVD by Conjecture 1. Theorem 10 then reduces AVD of $S(2,a_2,a_3,a_4)$ to the same two kinds of partitions, now with $a_2$ in place of $a_1$ in the smaller-extra-part range and upper bound $a_2+a_3-2$ for Section 2. For Section 3 take $\lambda=1$ and capacities $a_2-1,a_3-1,a_4-1$. All regular arms have capacity at least $j+1$ in the range in question. This proves Conjecture 2. The proof applies throughout the original ranges and uses no lower bound on the middle arm.

Theorem 12 gives necessity of tests 1, 2 and 5. In the four-arm case, the necessity of decomposability of the remaining tripod follows from Theorem 10. Together with the proof above, the three tests characterize AVD for tripods, and characterize AVD for four-arm trees with a one-vertex arm when also applied to the tripod obtained by removing that leaf.
