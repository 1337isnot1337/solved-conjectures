# Erdős–Fon-Der-Flaass–Kostochka–Tuza transversal conjecture

For fixed $p\ge3$, let $f(r,p,2)$ be the largest transversal number of an $r$-uniform hypergraph in which any $p$ edges can be met by two vertices. Erdős Problem 644 asks whether $f(r,p,2)/r$ has a limit for every fixed $p$. The proposed $3/4$ for $p=7$ is the complete-hypergraph value. The 1999 parity construction beats that model by one on an infinite sequence of ranks. [1992 source record](https://eprints.sztaki.hu/110/) · [1999 primary paper](https://kostochk.web.illinois.edu/docs/2000/dm1999FlaWoo.pdf) · [Kostochka (2002)](https://doi.org/10.1007/s004930200013) · [Erdős Problem 644](https://www.erdosproblems.com/644) · [Issue 786](https://github.com/1337isnot1337/solved-conjectures/issues/786)

## Exact eventual periodicity for the complete model

Let $b_p(n)$ be the least $b$ for which $p$ subsets of an $n$-point ground set, each of size at most $b$, cover all pairs. Let $L(p)$ denote the *all-to-all comparison data limit* of Hall, Kelly and Tian. Hall, Horsley and Stinson identify it as the least maximum block weight of a pair covering by $p$ blocks with total point weight one. They prove rational attainment and identify its reciprocal as the maximum fractional matching number of an intersecting hypergraph on $p$ vertices. [Hall–Horsley–Stinson, §3, Lemma 3.1](https://arxiv.org/abs/2309.00213)

**Proposition.** For each fixed $p\ge3$ there is a positive integer $q$ such that $qL(p)$ is integral and, for all sufficiently large $n$,

```math
b_p(n+q)=b_p(n)+qL(p).
```

In particular $b_p(n)=nL(p)+O_p(1)$ with an eventually periodic error.

**Proof.** Give each point the set of indices of blocks containing it. When $n\ge2$ these signatures are nonempty and any two signatures intersect. Conversely any assignment of nonempty, pairwise-intersecting signatures to points gives a pair covering, including when several points have the same signature. There are only finitely many maximal intersecting families $F$ of nonempty subsets of $[p]$. Every realization uses signatures from one such $F$.

For a fixed $F$, minimize $\max_i\sum_{S\ni i}w_S$ over nonnegative $w_S$ with $\sum_{S\in F}w_S=1$. Write $\lambda_F$ for this rational linear-programming optimum. Its minimum over $F$ is exactly $L(p)$. The restricted integer optimum $b_F(n)$ uses nonnegative counts $x_S$ summing to $n$. Thus $b_F(n)\ge n\lambda_F$. Choose an optimal rational weighting and an integer $q_F$ clearing its denominators. Adding its $q_F$-point realization to any configuration using $F$ preserves all pair coverings and gives

```math
b_F(n+q_F)\le b_F(n)+q_F\lambda_F .
```

For each residue of $n$ modulo $q_F$, the integer $q_F(b_F(n)-n\lambda_F)$ is nonnegative and nonincreasing as $n$ advances by $q_F$. It eventually stabilizes. This gives $b_F(n)=n\lambda_F+O_F(1)$ with eventually periodic error. In $b_p(n)=\min_F b_F(n)$ the families with $\lambda_F>L(p)$ eventually drop out. Taking a common multiple of $q_F$ over the remaining families proves the proposition.

**Translation to transversal numbers.** The complete $r$-uniform family on $n$ points violates the local condition exactly when some $p$ complements of edges cover all pairs. Blocks witnessing $b_p(n)\le n-r$ may be padded to size $n-r$. Duplicate blocks in a witness can be dropped and the corresponding edges supplemented to $p$ distinct edges whenever the complete family has at least $p$ edges. Thus the first failing ground size $N_p(r)$ satisfies

```math
N_p(r)=\min\{n\ge r:n-b_p(n)\ge r\}.
```

This identity holds for sufficiently large $r$, when all ground sizes that can first fail have at least $p$ distinct edges. Indeed $n=r$ admits no failure, and at $n\ge r+1$ the family has at least $r+1$ edges. Adding one point with the same signature as an old point increases $b_p$ by at most one, and deleting a point cannot increase it. Hence $n-b_p(n)$ is nondecreasing with increments zero or one. Also $L(p)<1$: the three signatures $`\{1,2\},\{2,3\},\{1,3\}`$ with equal weights give $L(p)\le2/3$. Inverting the eventual recurrence gives

```math
N_p(r+q(1-L(p)))=N_p(r)+q
```

for all sufficiently large $r$. At the last admissible $n=N_p(r)-1$, the transversal number is $n-r+1=N_p(r)-r$. Its asymptotic slope is $L(p)/(1-L(p))$, with eventually periodic additive error. For $p=7$ the Fano plane gives $L(7)=3/7$ by Hall–Horsley–Stinson's Theorem 1.1, recovering the proposed slope.

For arbitrary hypergraphs, a two-point transversal of a chosen subfamily can have very few possible witnesses. Replicating the vertices in each edge preserves those witnesses but leaves the global transversal number constant. The complete-model calculation supplies a lower bound for the unrestricted problem. The remaining task is to control arbitrary families with the local property. The general bounds of Bucić, Korándi and Sudakov concern that distinction. [Bucić–Korándi–Sudakov, §§1.4 and 5](https://arxiv.org/abs/1902.05055)

## An exact upper bound under independent choices in vertex classes

Partition a ground set into any number of classes $V_i$, with $|V_i|=n_i$. Fix integers $1\le a_i\le n_i$. The edges are **all** unions of independent choices of $a_i$ points in each class. Write $r=\sum_i a_i$ and $k=\max_i a_i$. Classes with prescribed occupancy zero can be discarded. Put $C_p(k)$ equal to the largest transversal number of a complete $k$-uniform hypergraph satisfying the local two-point condition. In this subsection we formulate that condition on subfamilies of *at most* $p$ edges. This agrees with the original whenever the family has at least $p$ edges.

**Proposition.** Every such product family $H$ with the local condition has $\tau(H)\le C_p(k)$. In particular it has $\tau(H)\le C_p(r)$. Both bounds apply with arbitrarily many classes.

**Proof.** Put $w=\min_i(n_i-a_i)$. Any set of at most $w$ points can be avoided in every class, whereas $w+1$ points from a minimizing class meet all edges. Thus $\tau(H)=w+1$. We show that the complete $k$-uniform hypergraph on $k+w$ points also satisfies the local condition.

Suppose instead that it has edges $E_1,\ldots,E_j$ with no two-point transversal, for some $j\le p$. In each class choose $a_i+w$ points and inject these into the old $k+w$ points. Such an injection exists since $a_i\le k$. For every $E_\ell$ at most $w$ image points lie outside $E_\ell$. Select $a_i$ of its preimages in class $i$. Taking the union across the classes yields an edge $F_\ell$ of $H$. Any two points meeting all $F_\ell$ would, by this map, give at most two old points meeting all $E_\ell$. Unselected points in a putative transversal may be discarded. Equal new edges may also be discarded. This contradicts the local property, and proves $w+1\le C_p(k)$.

Finally $C_p(k)$ is nondecreasing in $k$. In a complete hypergraph on $k+w$ points, the complements are all $w$-subsets. If $p$ such subsets could cover all pairs on the larger ground set $k+1+w$, restricting to any $k+w$ points and padding to size $w$ would give the same failure there. This proves the second inequality. The one-class case attains the complete-family bound. The published parity construction allows multiple occupancy profiles, so controlling unions of profiles remains necessary.

For a union of occupancy profiles given by fixed integer linear conditions and congruences, the [finite-class limit theorem](symmetric-models.md) proves a rational slope and eventual periodicity for the rank-bounded extremum. Its proof also covers the two-class parity construction.

## An obstruction for sparse arbitrary families

Let $H$ be a finite, nonempty $r$-uniform hypergraph in which every subfamily of at most $p$ edges admits a two-point transversal. Set $q=\lceil p/2\rceil$ and let $M$ be its fractional matching number. Then

```math
M^{q-1}\le {p\choose q}r,\qquad
\tau(H)\le 1+ M\log |H|.
```

For the first inequality, normalize an optimal fractional matching to a probability distribution on edges. Let $d_v$ be the probability a sampled edge contains $v$. Then $d_v\le1/M$ and $\sum_v d_v=r$. In $p$ independent samples some vertex must hit at least $q$ of the sampled positions, since two vertices cover all of them, including repeated edges. For a specified choice of $q$ positions the probability that there is such a common vertex is at most $\sum_v d_v^q\le r/M^{q-1}$. Taking the union bound over the position sets proves the claim.

For the second inequality, linear-programming duality gives a fractional transversal of weight $M$. Normalize it to a probability distribution on vertices and sample $t$ times. The expected number of unhit edges is at most $|H|\exp(-t/M)$. Choosing $t=\lfloor M\log |H|\rfloor+1$ gives an integral transversal of size at most $t$.

Thus for every fixed $p\ge5$, the search for a positive linear extremal slope requires at least $\exp(\Omega_p(r^{1-1/(q-1)}))$ edges if $\tau(H)\ge c r$ for a fixed $c>0$ (the implied constant also depends on $c$). For $p=7$ the exponent is $2/3$. This elementary obstruction applies without assumptions about symmetry or the size of the ground set.
