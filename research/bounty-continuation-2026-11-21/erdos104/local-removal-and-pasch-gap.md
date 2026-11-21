# Erdős 104: a localized removal attempt and its exact gap

Date: 21 November 2026. Status: elementary structural calculations for the full paid target, not a solution. See [the target and prior audit](target-and-prior-audit.md).

## 1. What the generic removal route would need

Choose one three-point witness for every counted unit circle. Different circles cannot have the same witness, since three distinct points on a circle are noncollinear and determine that circle uniquely. Every point-pair lies in at most two witnesses: there are at most two possible unit-circle centers through that pair. Consequently

```math
3U(P)\le 2\binom{|P|}{2}.
\tag{1}
```

In the conflict graph joining witnesses that share a pair, each witness has at most three neighbors. Greedy selection therefore retains at least one quarter of the witnesses with no shared pair. These witnesses form a linear 3-uniform hypergraph.

The [Ruzsa–Szemerédi (6,3) theorem, stated in the introduction of Conlon–Fox's survey](https://www.its.caltech.edu/~dconlon/RemSurvey.pdf), would give a subquadratic bound if one could exclude three witness triples on six vertices. In a linear triple system this configuration is a loose triangle: its three pairwise intersections are distinct. The following construction shows that excluding it is not justified even after strong spatial localization.

## 2. A uniform local six-point realization

Fix

```math
A=(1,0),\qquad B=(0,1),\qquad C=(-3/5,-4/5).
```

For any $`0\lt t<1/10`$, let $`\Gamma_1,\Gamma_2,\Gamma_3`$ be unit circles with centers

```math
o_1=(0,0),\qquad o_2=(0,3t),\qquad o_3=(4t,0),
```

and write $`s=\sqrt{1-25t^2/4}`$. Define

```math
a_1=\left(\sqrt{1-9t^2/4},3t/2\right),
\qquad a_2=(1+4t,0),
```

```math
b_1=\left(2t,\sqrt{1-4t^2}\right),
\qquad b_2=(0,1+3t),
```

```math
c_1=C,
\qquad c_2=(2t,3t/2)+sC.
```

The circles contain the triples

```math
\Gamma_1:\ (a_1,b_1,c_1),\qquad
\Gamma_2:\ (a_1,b_2,c_2),\qquad
\Gamma_3:\ (a_2,b_1,c_2).
\tag{2}
```

For $`a_1`$ and $`b_1`$, membership follows directly by squaring the coordinates relative to the two specified centers. For $`c_2`$, the center difference is $`(4t,-3t)`$, perpendicular to $`C`$, and the two squared distances are

```math
\frac{25t^2}{4}+s^2=1.
```

The remaining three memberships are immediate. As $`t\to0`$, the two $`a`$ points tend to $`A`$, the two $`b`$ points tend to $`B`$, and the two $`c`$ points tend to $`C`$. Hence all three triples have one point in each of three arbitrarily small disjoint neighborhoods of fixed noncollinear anchors, and all centers lie in an arbitrarily small neighborhood of the origin.

The six points are distinct. Points near different anchors are separated for sufficiently small $`t`$. Within the pairs, $`a_1`$ has first coordinate less than one whereas $`a_2`$ has first coordinate greater than one; $`b_1`$ has positive first coordinate whereas $`b_2`$ has first coordinate zero; and

```math
c_2-c_1=(2t,3t/2)+(s-1)C
```

has both coordinates positive.

The three displayed circles do not contain any of the other three witness points. In particular,

```math
|a_1-o_3|^2=1-8t\sqrt{1-9t^2/4}+16t^2<1,
```

```math
|b_1-o_2|^2=1-6t\sqrt{1-4t^2}+9t^2<1,
\qquad
|c_2-o_1|^2=1-(24/5)ts<1.
```

The first two strict inequalities hold for $`0\lt t<1/10`$ by squaring the equivalent positive inequalities. The free points $`a_2,b_2,c_1`$ have distance greater than one from both undesignated centers: for $`c_1`$ the two squared distances are $`1+24t/5+9t^2`$ and $`1+24t/5+16t^2`$; the other cases are immediate from the coordinates.

Thus (2) is a genuine linear (6,3) configuration. There may be additional unit circles determined by these six points, which are irrelevant: the required three-circle configuration is already present. This is a uniform obstruction to this local forbidden-configuration claim. It is not an asymptotic counterexample to Erdős 104.

## 3. A stronger local four-circle pattern is impossible

The next pattern has four circles, with their six pairwise shared witness points divided into three opposite-edge classes:

```math
\{12,34\}:A,\qquad \{13,24\}:B,\qquad \{14,23\}:C.
\tag{3}
```

Equivalently its four witness triples form a 3-partite Pasch configuration.

**Lemma.** Suppose four unit circles have centers $`o_i\in B(0,\varepsilon)`$, and for every pair $`i,j`$ they share a point $`p_{ij}`$ within distance $`\varepsilon`$ of the anchor specified in (3). If $`0<\varepsilon<1/28`$, all four centers coincide. In particular, four distinct circles cannot have this pattern.

**Proof.** Let $`D=\max_{i,j}|o_i-o_j|`$. Subtracting the squared-distance equations at a shared point gives

```math
(o_i-o_j)\cdot
\left(p_{ij}-\frac{o_i+o_j}{2}\right)=0.
```

Writing $`u`$ for the assigned anchor, we obtain

```math
|(o_i-o_j)\cdot u|\le2\varepsilon D=:e.
\tag{4}
```

Set $`q_i=o_i-o_1=(x_i,y_i)`$, so $`q_1=0`$. The $`A`$ and $`B`$ constraints give

```math
|x_2|,\ |x_4-x_3|,\ |y_3|,\ |y_4-y_2|\le e.
```

The two $`C`$ constraints are

```math
|3x_4+4y_4|\le5e,
\qquad
|3(x_3-x_2)+4(y_3-y_2)|\le5e.
```

Therefore $`|3x_3+4y_2|\le12e`$ and $`|3x_3-4y_2|\le12e`$. It follows that

```math
|x_3|\le4e,\quad |y_2|\le3e,
\quad |x_4|\le5e,\quad |y_4|\le4e.
```

Each $`|q_i|`$ is at most $`7e`$, so $`D\le2\max_i|q_i|\le14e=28\varepsilon D`$. Since $`28\varepsilon<1`$, this forces $`D=0`$. This also covers $`e=0`$ directly. $`\square`$

There is a point-neighborhood-only version of the lemma. A circle through one point near each of $`A,B,C`$ has its center near zero: its circumcenter depends continuously on that noncollinear triple and the limiting circumcenter is zero. Consequently, for sufficiently small common point-neighborhood radius, the center hypothesis in the lemma follows automatically. This is only a local statement; it does not exclude every Pasch pattern in every unit-circle configuration.

## 4. Why this stronger exclusion still does not close the count

Let $`G`$ be a finite abelian group of odd order $`m`$. Form a 3-partite hypergraph with three disjoint copies of $`G`$ and edges

```math
(x,y,x+y),\qquad x,y\in G.
\tag{5}
```

It is linear, has $`3m`$ vertices and $`m^2`$ edges, and has no 3-partite Pasch configuration. Indeed, such a configuration would have the four edges

```math
(x_1,y_1,z_1),\ (x_1,y_2,z_2),\
(x_2,y_1,z_2),\ (x_2,y_2,z_1),
```

with distinct entries in each part. Substitution into (5) gives

```math
y_2-y_1=x_2-x_1=-(y_2-y_1).
```

Thus $`2(y_2-y_1)=0`$. An odd-order group has no nonzero element of order two, a contradiction. Taking odd cyclic groups of unbounded order gives quadratic-size examples for this abstract forbidden-pattern condition.

No geometric realization of (5) by unit circles is supplied or asserted. Its role is exact: linearity and local Pasch avoidance alone cannot imply a subquadratic edge count. They leave out additional metric compatibility, which is where a successful argument would have to work.

## 5. Precise remaining obligation

The basic removal theorem forces a local pattern that unit circles can realize. A stronger local pattern that unit circles cannot realize does not have a subquadratic abstract extremal bound. We have neither a density-to-geometry theorem that bypasses these examples nor an equal-radius realization of a quadratic group construction. The envelope theorem in the target audit requires separate one-parameter and domain hypotheses; no extraction of such a family from arbitrary input points has been proved.

These calculations therefore do not establish either direction of the full $`o(n^2)`$ problem. No numerical endpoint was investigated and no completed bounty is claimed.
