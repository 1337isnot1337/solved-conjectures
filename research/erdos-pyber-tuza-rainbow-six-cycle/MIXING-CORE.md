# Erdős–Pyber–Tuza rainbow six-cycle conjecture

**Exact finite result.** A balanced six-colouring on $6n+1$ vertices cannot avoid a rainbow six-cycle if it contains two large vertex sets on which the six colour supports mix according to a three-and-three parity template. The edges involving the exceptional vertices are arbitrary. In fact the argument recovers an exact global parity split from the assumed absence of a rainbow cycle.

Let each vertex have degree $n$ in each of the six colours. Label three colours by $p(c)=0$ and the other three by $p(c)=1$. Suppose there are disjoint vertex sets $U_0,U_1$ and an integer $r\ge1$ with the following properties:

1. Each $U_i$ has size at least $6r+2$, and at most $n-4r-4$ vertices are outside $U_0\cup U_1$.
2. For every colour $c$ and $`i,j\in\{0,1\}`$ with $i\oplus j=p(c)$, any disjoint $r$-sets $X\subseteq U_i$ and $Y\subseteq U_j$ have at least one edge of colour $c$ between them. The disjointness qualifier is needed only when $i=j$.

Neither the edges in the core nor those outside it are required to respect the template. The condition is only a positive-edge condition for the specified colour and pair of sides.

## A rooted rainbow path

For a vertex $u$ and colour $a$, call a side $i$ available if $u$ has at least $2r+2$ neighbours of colour $a$ in $U_i$. At least one side is available: at most $n-4r-4$ of its $n$ colour-$`a`$ neighbours are outside the core. From each available side record the bit $q=i\oplus p(a)$; write $Q(u,a)$ for the resulting nonempty set of bits.

Take an edge $uv$ of colour $c$. Choose distinct colours $a,b$ different from $c$ and bits $q\in Q(u,a),q'\in Q(v,b)$. Suppose
```math
q\oplus q'=1\oplus p(c).
```
There is a rainbow path from $u$ to $v$ using all colours other than $c$. At the ends use $a,b$, with the first and last interior vertices on sides $i=q\oplus p(a)$ and $j=q'\oplus p(b)$. The three middle edge colours are exactly the remaining three colours. Their parity bits sum modulo two to $1\oplus p(c)\oplus p(a)\oplus p(b)=i\oplus j$, so they specify a consistent sequence of core sides between $i$ and $j$.

Take disjoint $r$-sets of eligible neighbours in the first and last interior positions, omitting $u,v$. This is possible even when the two pools overlap, since both have size at least $2r+2$. Take disjoint $2r$-sets in the other two positions, on their specified sides, avoiding the chosen sets and $u,v$. Even when all four positions use the same side, $6r+2$ vertices suffice.

The first $r$-set reaches at least $r+1$ vertices of the first $2r$-set by the specified middle colour: otherwise its non-neighbours there contain an $r$-set, contrary to condition 2. The same reasoning through the next middle colour reaches at least $r+1$ vertices of the second $2r$-set. Condition 2 gives an edge in the last middle colour to the designated final $r$-set. This constructs the path with distinct vertices, so adjoining $uv$ gives a rainbow six-cycle.

## Recovering global parity

If there is no rainbow six-cycle, the preceding argument forces, for every edge $uv$ of colour $c$,
```math
q\oplus q'=p(c)
\quad\text{for every distinct }a,b\ne c\text{ and every }
q\in Q(u,a),\ q'\in Q(v,b).
```
Fix $u$ and any two colours $a,a'$. Choose a third colour $c$ and a colour-$`c`$ neighbour $v$ of $u$. Choose a fourth colour $b$ outside $`\{a,a',c\}`$ and any bit in $Q(v,b)$. Applying the relation first to $a$ and then to $a'$ shows that $Q(u,a),Q(u,a')$ are singletons and equal. Thus $u$ has a single common bit $q_u$ for every colour, and every edge $uv$ of colour $c$ satisfies $q_u\oplus q_v=p(c)$.

The three colours with $p=1$ have total degree $3n$ at every vertex. Under the recovered split they are exactly the edges between the bit classes. Each class would therefore have size $3n$, impossible on $6n+1$ vertices. This proves the exact finite claim.

## Consequence for cut limits

Any limit of a sequence of rainbow-free balanced colourings cannot be a parity template in which all three permissible colours are positive almost everywhere on each relevant block. Indeed, fix a positive fraction $\delta$ smaller than $1/100$ and take $r=\lfloor\delta n\rfloor$. Any two measurable sets of size at least $r/(6n+1)$ in a correctly matched block have uniformly positive integral in the chosen colour. To see this, discard the part of the block on which that colour's limit weight is below a sufficiently small positive constant; the discarded measure is less than half the area of every such rectangle.

Represent each vertex by its measure-$`1/(6n+1)`$ atom and relabel for cut convergence. Let $P$ be the sum of the three crossing colours. Since the limit is the zero-one crossing indicator of two equal halves, the cut convergence of $P$ implies $L^1$ convergence to that indicator: sum the signed cut errors on the four rectangles of the fixed halves, with the signs chosen according to the limit values zero and one. If a vertex atom straddles the halves, the two target crossing rows differ everywhere, while its actual row is constant as a function of the source point in that atom. The integrated error on the atom is therefore at least the mass of its smaller half. Assign each atom to its majority half. This changes the parity halves by total measure tending to zero, and their vertex counts are $(3+o(1))n$ each. Cutting down any large rectangle of the resulting vertex sets to the original half blocks changes its area by $o(1)$. The positive lower bounds transfer by cut convergence, giving condition 2 on the finite vertex sets. Condition 1 then holds with no exceptional vertices. This contradicts the finite claim.

The restriction does not cover parity limits with macroscopic support holes in one or more allowable colours. In particular, the proof does not show that a general putative counterexample must be close to a parity template. [Tracking issue #870](https://github.com/1337isnot1337/solved-conjectures/issues/870) · [Original Erdős problem](https://www.erdosproblems.com/811).
