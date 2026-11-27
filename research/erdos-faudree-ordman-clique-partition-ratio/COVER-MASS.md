# Bounding high scores by the mass of their covering cliques

This argument excludes both eleven and twelve as extremal cover
numbers for the sharp ratio problem. The earlier method gives exact
or strict bounds for smaller cover numbers one through three and for
all cover numbers at least thirteen. Thus a strict improvement on
1/56, if it exists, must have minimum cover number between four and ten
and must fall outside the triangle-free quotient class.

Use the notation for the unbounded-profile dual in
[COVER-MULTIPLICITY.md](COVER-MULTIPLICITY.md) and the capped
inequality in [HIGH-SCORE-STABILITY.md](HIGH-SCORE-STABILITY.md).
In particular x maximizes the fixed dual quadratic on the simplex
and every active row has scalar product 2f with x. As before
$`P`$ is the positive edge score, $`f=P-N`$, and $`H`$ is the graph
of edges with score greater than one half. Write $`M`$ for its
unweighted mass and $`L`$ for the positive score outside H. Then
$`M+2L\le1/4`$ and $`0\le L\le1/4-P`$.

## A joint row bound

For an edge ij of H, write p for its score, c for the mass of
the common closed neighborhood of i and j in the original template,
and b for the mass of the types adjacent to neither. For any type v
in the common neighborhood, the profile of i, j and v gives
$`y_{iv}+y_{jv}\le1-p`$, also when v repeats one of the endpoint
types. For a type adjacent to just one endpoint the sum is at
most one, and for a common nonneighbor the sum is zero. Averaging
against x and adding the two stationarity equations gives

```math
4f\le (1-p)c+(1-c-b)=1-pc-b .
```

In particular $`pc\le K=1-4f`$. Every original covering clique
containing ij is contained in that common neighborhood. Hence
if its mass is m, $`p\le K/m`$.

## Summing the high edges across the cover

Assign each edge of H to any one covering index shared by its
endpoints. For an index s, let $`M_s`$ be the unweighted x-mass
of its assigned edges, and $`m_s`$ the mass of its covering clique.
Since H is triangle-free, the weighted Mantel bound gives
$`M_s\le m_s^2/4`$. This weighted form follows by replacing each
type by an independent part of size proportional to its mass
and rounding the masses, then applying ordinary Mantel.
The preceding joint row bound now gives

```math
P-L\le \sum_{s:M_s>0}\frac{K M_s}{m_s}
     \le \frac K2\sum_s\sqrt{M_s}
     \le \frac K2\sqrt{qM}.
```

Suppose $`P>1/8`$, which is the only relevant regime here.
Dividing by $`\sqrt M`$ is then legitimate: otherwise
$`P=L\le1/4-P`$, a contradiction. Moreover, as
$`0\le L\le1/4-P<1/8`$, the function
$`(P-L)/\sqrt{1/4-2L}`$ is nonincreasing in L on this interval.
Its derivative has the sign of $`P+L-1/4`$.
At the right endpoint its value is $`\sqrt{2P-1/4}`$.
Using $`M\le1/4-2L`$ therefore proves the general inequality

```math
2P-1/4\le \frac q4(1-4f)^2.
```

By the cover-multiplicity lemma $`P\ge qf/(q-1)`$ for $`q>1`$.
Thus any maximizing value above one eighth obeys

```math
\frac{2qf}{q-1}-\frac14\le \frac q4(1-4f)^2 .
```

## Strict exclusions

For eleven covers suppose $`f\ge19/100`$. The left side of the
last inequality is at least $`21/125`$ and its right side is
at most $`99/625`$, a contradiction. The resulting ratio is
at most $`19/1100<1/56`$.

For twelve covers suppose $`f\ge24/125`$. The left side is at least
$`929/5500`$ and the right side is at most $`2523/15625`$, again
a contradiction. The resulting ratio is at most $`2/125<1/56`$.

Together with the [three-cover certificate](SIMPLEX-CERTIFICATES.md),
the [thirteen-cover exclusion](COVER-MULTIPLICITY.md) and
Erdős–Goodman–Pósa for larger cover numbers, this leaves cover
numbers four through ten. No evaluation of their maximum is
claimed here.

## An explicit upper endpoint for the unrestricted ratio

The same inequality yields a stronger global upper endpoint.
For four covers, solve the quadratic on $`0\le f\le1/4`$;
its smaller root is $`(8-\sqrt{19})/24`$. The inequality
forces f to be at most this root. For five or six covers,
$`f\ge3/16`$ would make the left side of the inequality at
least 1/5 and the right side at most 6/64, impossible.
Their ratios are therefore at most 3/80 and 1/32,
respectively. At seven or more covers, the
Erdős–Goodman–Pósa bound gives at most 1/28. At most
three covers already give a ratio below 1/56. Consequently
the unrestricted limiting ratio R satisfies

```math
\frac1{56}\le R\le \frac{8-\sqrt{19}}{96}.
```

The endpoint on the right is approximately 0.03793.
This is not asserted to be attainable.
