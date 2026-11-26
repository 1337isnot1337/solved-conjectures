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

This identity holds for sufficiently large $r$, when all ground sizes that can first fail have at least $p$ distinct edges. Indeed $n=r$ admits no failure, and at $n\ge r+1$ the family has at least $r+1$ edges. Adding one point with the same signature as an old point increases $b_p$ by at most one, and deleting a point cannot increase it. Hence $n-b_p(n)$ is nondecreasing with increments zero or one. Also $L(p)<1$: the three signatures $\{1,2\},\{2,3\},\{1,3\}$ with equal weights give $L(p)\le2/3$. Inverting the eventual recurrence gives

```math
N_p(r+q(1-L(p)))=N_p(r)+q
```

for all sufficiently large $r$. At the last admissible $n=N_p(r)-1$, the transversal number is $n-r+1=N_p(r)-r$. Its asymptotic slope is $L(p)/(1-L(p))$, with eventually periodic additive error. For $p=7$ the Fano plane gives $L(7)=3/7$ by Hall–Horsley–Stinson's Theorem 1.1, recovering the proposed slope.

For arbitrary hypergraphs, a two-point transversal of a chosen subfamily can have very few possible witnesses. Replicating the vertices in each edge preserves those witnesses but leaves the global transversal number constant. The complete-model calculation supplies a lower bound for the unrestricted problem. The remaining task is to control arbitrary families with the local property. The general bounds of Bucić, Korándi and Sudakov concern that distinction. [Bucić–Korándi–Sudakov, §§1.4 and 5](https://arxiv.org/abs/1902.05055)
