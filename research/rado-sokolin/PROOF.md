# A strict upper bound for disjoint cube subfamilies

**Cinna Davis.** For every integer $`d\ge3`$, there is a finite family of parallel, homothetic cubes in $`\mathbb R^d`$ for which every disjoint subfamily occupies strictly less than $`2^{-d}`$ of the union volume. The construction gives

```math
F(Q^d)\le 2^{-d}-\frac{1}{1088}\left(\frac{2}{7}\right)^{d-2}.
```

Here $`F(Q^d)`$ is the infimum, over finite nonempty families of axis-parallel closed cubes of positive side lengths, of the maximum disjoint-subfamily volume divided by the volume of the union. Disjoint cubes have no common point. The last paragraph treats the convention allowing boundary contacts. This answers §7.2(6) in Dall’Ara and Dumitrescu’s survey. Ajtai supplied the planar input and anticipated the qualitative conclusion. The exact value in higher dimensions remains open. [Source question](https://arxiv.org/pdf/2604.17509v3#page=14) · [Attribution and review](REVIEW.md)

## Ajtai’s planar input

Figure 5 in the proof of Theorem 5.1 of the survey gives a family of squares in $`[0,14]\times[0,6]`$. Their interiors tile 76 unit cells. Their lower-left coordinates are as follows. [Planar argument and diagram](https://arxiv.org/pdf/2604.17509v3)

| Side | Bottom coordinate | Left coordinates |
| --- | --- | --- |
| 1 | 0 | 0 through 13 |
| 1 | 1 and 2 | 0, 3, 4, 9, 10, 13 |
| 1 | 3 | 0, 1, 2, 11, 12, 13 |
| 1 | 4 | 2, 11 |
| 1 | 5 | 2 through 11 |
| 2 | 1 | 1, 5, 7, 11 |
| 2 | 3 | 3, 5, 7, 9 |

Write $`U=76`$. Every disjoint subfamily has area at most $`U/4=19`$. If it omits all squares meeting the bottom side, its area is at most 18. These are the two estimates proved for the planar gadget in the survey. They can also be verified from the coordinates by choosing a tile and maximizing over its inclusion or exclusion. Including a tile excludes every tile whose two closed coordinate intervals both meet its intervals. The independent column sweep gives the same two optima. [Branching calculation](verify-planar-gadget.py) · [Column sweep](verify_lift.py)

## A finite family in every dimension

Set $`k=d-2`$ and $`L=14`$. Split $`[-L,L]^2`$ at the two axes into four closed squares of side $`L`$, all containing the origin. Attach a copy of the planar gadget to each square along its outer horizontal edge. More precisely, for a square with horizontal interval $`[a,a+L]`$ and outer edge at signed height $`\sigma L`$, map a gadget point $`(u,v)`$ to $`(a+u,\sigma(L+v))`$. The interiors of the four gadget boxes are mutually disjoint and outside the central square. Every bottom tile touches its own central square.

Take $`H`$ to be a positive multiple of $`2L`$. For each planar square $`S`$ of side $`s\in\{1,2,L\}`$ in this arrangement, take all cubes

```math
S\times\prod_{i=1}^k[j_i s,(j_i+1)s],
\qquad 0\le j_i<H/s,\quad j_i\in\mathbb Z .
```

Over each planar square the cubes fill the entire extra box. The union volume equals $`4(L^2+U)H^k`$.

## Counting an arbitrary disjoint subfamily

Call the cubes with side $`L`$ large. Let $`m`$ be the number of large cubes selected. Their extra boxes must be disjoint because all their planar projections contain the origin. Group the side-$`L`$ grid cells in pairs in each extra coordinate. The $`2^k`$ cells in each resulting block have a common point, so at most one large cube in that block can be selected. Thus

```math
m\le (H/(2L))^k .
```

On $`[0,H]`$ put mass two at each even integer, including both endpoints, and use the product measure in the extra coordinates. The total mass is $`(H+2)^k`$. A grid interval of length one contains one even integer and an aligned interval of length two contains two. Consequently the box of a small cube of side $`s`$ has mass $`(2s)^k`$. A large cube’s box has mass $`(L+2)^k`$.

At an atom $`t`$, the planar projections of the selected small cubes whose extra boxes contain $`t`$ are pairwise disjoint. A shared planar point would give a common point of both cubes over $`t`$. The total area at this atom is at most $`4(U/4)=U`$. If a selected large box also contains $`t`$, its planar square excludes every bottom tile of its own gadget. The planar bound at this atom drops to $`U-1`$. The selected large boxes are disjoint, so the atoms receiving this improvement have total mass $`m(L+2)^k`$.

Integrate the planar areas. A small cube contributes its base area times its box mass, or $`s^2(2s)^k=2^k s^d`$. Writing $`V_s`$ for the selected small volume and $`V`$ for all selected volume gives

```math
\begin{aligned}
2^k V_s &\le U(H+2)^k-m(L+2)^k,\\
V &\le 2^{-k}U(H+2)^k
       +m\left[L^{k+2}-((L+2)/2)^k\right].
\end{aligned}
```

The coefficient of $`m`$ is positive since $`(L+2)/2\le L`$ and $`L^2>1`$. Substitution of the bound on $`m`$ and division by the full union volume yield

```math
\frac{V}{4(L^2+U)H^k}
\le
\frac{2^{-k}L^2+2^{-k}U(1+2/H)^k
      -2^{-2k}(1+2/L)^k}{4(L^2+U)}.
```

Let $`H`$ increase through multiples of 28 for fixed $`k`$. The first two terms tend, after division, to $`2^{-d}`$. With $`L=14`$ and $`U=76`$, the subtracted term is exactly $`(2/7)^k/1088`$. Taking the infimum proves the stated inequality.

## Explicit witnesses and boundary contact

The finite bound is already strictly below $`2^{-d}`$ when

```math
76\big[(1+2/H)^k-1\big]<(4/7)^k .
```

For example, choose $`H=28\left\lceil(304k(7/4)^k+1)/28\right\rceil`$. Then $`H\ge2k`$ and $`(1+2/H)^k-1\le \exp(2k/H)-1\le4k/H`$, using convexity of the exponential on the unit interval. In dimension three, direct substitution of $`H=280`$ gives a disjoint-volume ratio at most $`1/8-1/76160`$.

For a fixed finite family, enlarge each cube by a factor $`1+\varepsilon`$ about its own center. Every point of an original cube lies in its expanded interior. An interior-disjoint selection of expanded cubes therefore comes from pairwise disjoint original cubes. Its volume is at most $`(1+\varepsilon)^d`$ times the original optimum, while the expanded union contains the original union. Taking $`\varepsilon`$ down to zero gives the same upper bound under the interior-disjoint convention. Any strict finite example retains strictness for sufficiently small positive $`\varepsilon`$.
