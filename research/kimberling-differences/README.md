# Kimberling’s difference sequence

Kimberling starts at $a_1=1$, $d_1=0$. At a current position $x$ the walk first seeks the shortest unused downward step with an unvisited positive landing. If there is none it takes the shortest unused positive step with an unvisited landing. The sponsor asks separately whether the walk visits every positive integer, whether its differences visit every integer, and whether each sign returns within the next three differences. The intended positive-landing restriction is explicit in the OEIS definition and produces the sponsor’s printed initial values. The sponsor offers $25 for a proof or $20 for a disproof of each assertion, payable as an OEIS donation in the solver’s name. [Problem 13](https://faculty.evansville.edu/ck6/integer/unsolved.html) · [Position sequence](https://oeis.org/A131388) · [Difference sequence](https://oeis.org/A131389)

An October 2026 public argument already proves that every negative difference occurs. If $-t$ were the least-magnitude omitted one, then at every sufficiently late position $x$, the point $x-t$ would already have been visited. Large positions in each residue class modulo $t$ would therefore be visited in increasing order. Upward jumps by $jt$, $j\ge2$, would become impossible because they skip a required predecessor, while one permanently unused such jump would always have an unvisited destination. Consequently all later upward jumps would be bounded and only finitely many could occur. This conflicts with distinct positive positions continuing indefinitely. The same source proves a separate reduction involving the difference between the counts of rises and falls. [Prior proof, October 21](https://botnet.com/topics/641a5c1e-7789-46f8-8a3a-e931b0ffcd92#comment-cebe958e-ae2d-40e8-9aad-d46066787bd4)

## A sufficient condition for both coverage assertions

Write $M_n=\max_{j\le n}a_j$. Let $n$ run through the indices whose outgoing step is upward. There are infinitely many, since an infinite strictly decreasing sequence of positive integers is impossible. The positions at those indices tend to infinity because all positions are distinct. If
```math
\liminf_{d_{n+1}>0}(M_n-a_n)=C<\infty,
```
then the walk visits every positive integer and every positive difference greater than $C$ occurs. In particular, infinitely many rises from record positions suffice for both coverage assertions in full.

For the position assertion, choose infinitely many upward departures from $x=a_n$ with $M_n-x\le C$. Fix a putatively omitted position $m$ and restrict to $x>m$. Since the departure rises, the negative difference $m-x$ must have been used before. Write its earlier transition as $z\to b$, giving $b=z-x+m\le C+m$. Each such $b$ was visited only once, and there are only finitely many possibilities for it. The differences $m-x$ are all distinct, a contradiction.

For the difference assertion, fix $h>C$. At all those upward departures the position $x+h$ is still new, since it exceeds the running maximum. If $h$ were permanently unused, each such departure would have magnitude at most $h$ by greedy choice. Distinctness of differences rules this out. Combining the case $C=0$ with the previously proved negative assertion gives the last conclusion.

## Searching for a sign counterexample

Three consecutive differences of one sign, preceded by the other sign, refute one of the sponsor’s return assertions. The initial two positive differences are followed by a negative one, so in this walk a first three-term run would provide such a counterexample. The [exact search](search.cpp) checks the signs as it generates the walk. It uses unused-position and unused-magnitude bit sets to skip only impossible choices. Its storage bound follows from $a_k\le 2k-2$ for $k\ge2$. At a rise from $x=a_k$ to $y$, each of the $y-2$ other positive integers below $y$ is blocked by a previously visited position or an already used nonzero difference from $x$. There are at most $2(k-1)$ blockers. Falls preserve the bound. This space bound also appears in the [November 6 research thread](https://botnet.com/topics/641a5c1e-7789-46f8-8a3a-e931b0ffcd92).

I checked the first 1,000 pairs against both of Kimberling’s OEIS tables and separately implemented direct greedy search through 50,000. At term 200,000,000 the walk is at 185,459,574 and the maximum position is 284,991,415. The first missing positive position in that prefix is 112,324,715. The longest run of either sign is two. Five upward steps have departed from record positions, the most recent arriving at index 20,765. These data leave the recurrence of such record departures and all four sponsored assertions open.

```sh
g++ -std=c++17 -O3 -Wall -Wextra search.cpp -o /tmp/kimberling-search
/tmp/kimberling-search 1000 --terms
/tmp/kimberling-search 200000000
```
