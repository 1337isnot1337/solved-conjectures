# Hajdu–Sárközy’s multiplicative perturbation conjecture

**Result.** Let $k\ge2$ be an integer and $c\ne0$ an integer. Write
$P=\{m^k+c:m\ge1\}\cap\mathbb N$, where $\mathbb N$ denotes the positive
integers. If $R\subseteq\mathbb N$ satisfies
```math
|(R\triangle P)\cap[1,X]|=o(X^{1/k}),
```
then neither $R$ nor any finite modification of $R$ is a product set
$AB=\{ab:a\in A,\ b\in B\}$ of two subsets of $\mathbb N$ each having
at least two elements. In particular this proves the full original
conjecture, including $k=2$.

The original [Hajdu–Sárközy, Conjecture 1.2](https://math.unideb.hu/sites/default/files/inline-files/poly3_revised.pdf)
is the shift $c=1$, with the additional value $0^k+1=1$. That finite
difference does not change the hypothesis. The conclusion “totally
m-primitive” in their Definition 1.6 explicitly includes all finite
modifications.

## 1. A local four-cycle obstruction

Use the bipartite graph in which a positive integer $a$ on the left
is joined to a positive integer $b$ on the right when $ab\in P$.
Suppose $a<a'$ and $b<b'$ span a four-cycle. Put
$t_{u,v}=(uv-c)^{1/k}$ on each edge, so that these are positive
integers. For $p=t_{a,b}t_{a',b'}$ and $q=t_{a,b'}t_{a',b}$,
```math
p^k-q^k
=(ab-c)(a'b'-c)-(ab'-c)(a'b-c)
=-c(a'-a)(b'-b).
```
In particular, $p\ne q$. With $ab\ge2|c|$, both products $p,q$ are
at least $(ab-c)^{2/k}$. Factoring the difference of $k$th powers,
and using $ab-c\ge ab/2\ge1$, gives
```math
|p^k-q^k|
\ge k\min(p,q)^{k-1}
\ge k(ab-c)^{2-2/k}
\ge 2(ab-c)\ge ab.
```
Therefore such a four-cycle is impossible if
```math
|c|(a'-a)(b'-b)<ab. \tag{1}
```

Two consequences will be used.

1. For any two *fixed* positive integers $a<a'$, there are only
   $O_{a,a',c}(\log(2X))$ positive integers $b\le X$ for which
   $ab,a'b\in P$. Indeed, choose a fixed $\eta>0$ with
   $|c|(a'-a)\eta<a$. Any two such $b<b'$ in the same interval
   $[(1+\eta)^j,(1+\eta)^{j+1})$ satisfy (1). The finitely many
   $b$ with $ab<2|c|$ do not affect the bound.
2. For fixed $\rho=1+1/(2|c|)$, set $I_i=[\rho^i,\rho^{i+1})$ for
   $i\ge0$. On every rectangle $I_i\times I_j$ with
   $\rho^{i+j}\ge2|c|$, the graph has no four-cycle. Indeed
   $(a'-a)<(\rho-1)a$, $(b'-b)<(\rho-1)b$, and
   $|c|(\rho-1)^2\le1/4$, so (1) holds.

## 2. A sparse-factor counting bound

For a set $D\subseteq\mathbb N$, put $D(X)=|D\cap[1,X]|$ and
write $\alpha=1/k$. We first show
```math
 A(X),B(X)=o(X^\alpha)
 \quad\Longrightarrow\quad
 |(AB)\cap P\cap[1,X]|=o(X^\alpha). \tag{2}
```
Count representations $(a,b)\in A\times B$ instead of distinct
products, which gives an upper bound. If $a\in I_i$, $b\in I_j$
and $ab\le X$, then $i+j\le L=\lfloor\log_\rho X\rfloor$.
Discard the finitely many rectangles with $\rho^{i+j}<2|c|$ as
an $O_c(1)$ contribution. In every other rectangle we may count
all edges, even for products above $X$.

Let $m_i=|A\cap I_i|$ and $n_j=|B\cap I_j|$. A four-cycle-free
bipartite graph with parts of size $m,n$ has at most
$m\sqrt n+n$ edges: the sum of $\binom{d_v}{2}$ over the $n$
vertices is at most $\binom m2$ because a pair of left vertices
has at most one common right neighbor. Cauchy–Schwarz gives
$E^2/n-E\le m(m-1)$ for $n>0$, and hence $E\le n+m\sqrt n$;
the case $n=0$ is immediate.

Consider $i\le j$ first. We have $m_i=O(\rho^{\alpha i})$
and $n_j=O(\rho^{\alpha j})$. Thus
```math
\begin{aligned}
\sum_{i=0}^{\lfloor L/2\rfloor}\sum_{j=i}^{L-i}m_i\sqrt{n_j}
&\ll \sum_{i=0}^{\lfloor L/2\rfloor}
       \rho^{\alpha i}\rho^{\alpha(L-i)/2}\\
&\ll \rho^{3\alpha L/4}=O(X^{3\alpha/4}).
\end{aligned}
```
For the linear term, the inner sum over $j$ is at most
$B(\rho^{L-i+1})$. Since $i\le L/2$, the little-oh bound for
$B$ applies uniformly at these arguments: write
$\epsilon_L=\sup_{t\ge\rho^{L/2}}B(t)/t^\alpha$, which tends to
zero. Then
```math
\sum_{i=0}^{\lfloor L/2\rfloor}B(\rho^{L-i+1})
\le\epsilon_L\rho^{\alpha(L+1)}
       \sum_{i\ge0}\rho^{-\alpha i}
=o(X^\alpha).
```
The region $i>j$ is bounded by exchanging $A$ and $B$. This proves
(2).

## 3. Perturbations force sparse factors

Suppose $R=AB$ with $|A|,|B|\ge2$. Set
$E(T)=|(R\setminus P)\cap[1,T]|$. Fix two distinct elements
$a<a'$ in $A$. For every $b\in B$ with $b\le X$, both $ab$ and
$a'b$ are in $R$ and are at most $a'X$. For each of the two
fixed multipliers the map from $b$ to the product is injective.
Consequently at most $2E(a'X)$ such $b$ give a product outside
$P$. The first consequence of (1) bounds the rest by
$O_{a,a',c}(\log(2X))$. Hence
```math
B(X)\le2E(a'X)+O_{a,a',c}(\log(2X))=o(X^\alpha).
```
Exchanging the factors gives the same bound for $A(X)$. By (2)
this would give $|R\cap P\cap[1,X]|=o(X^\alpha)$. But
$P(X)=X^\alpha+O_{k,c}(1)$, and the hypothesis removes only
$o(X^\alpha)$ of its values. This contradiction proves
irreducibility. Every finite modification of $R$ satisfies the
same error hypothesis, so total m-primitivity follows.

In fact only $E(X)=o(X^\alpha)$ and
$\limsup_{X\to\infty}|R\cap P\cap[1,X]|/X^\alpha>0$ are needed;
the argument does not need the retained density to be one.

## Sources and priority

- L. Hajdu and A. Sárközy, [*On multiplicative decompositions of
  polynomial sequences, III*](https://math.unideb.hu/sites/default/files/inline-files/poly3_revised.pdf),
  Acta Arith. 193 (2020), 193–216. Definition 1.6 gives total
  m-primitivity, Conjecture 1.2 states the full error tolerance for
  $c=1$, and Theorem 2.1 proves a smaller error tolerance. Its
  proof already uses geometric bins for both factors, in Section 6
  around equations (6.7)–(6.15).
- C. H. Yip, [*Multiplicative irreducibility of small perturbations
  of the set of shifted k-th powers*](https://doi.org/10.1007/s00493-025-00193-9),
  Combinatorica 46 (2026), article 1,
  [arXiv:2501.16620](https://arxiv.org/abs/2501.16620).
  Theorem 1.3 proves the general nonzero-shift result for $k\ge3$;
  the end of Section 3 explicitly leaves $k=2$ untreated. The
  bipartite graph and its edge bounds were used in that work,
  as was a crossed-products gap inequality (Lemma 2.3, citing
  the antecedent there). The step used here is to keep the exact
  determinant before relaxing the bound, exclude four-cycles in
  skinny bins uniformly for $k\ge2$, and sum the resulting edge
  bounds over all bins without a logarithmic loss.
- K. Tsang and C. H. Yip, [*Bipartite Diophantine tuples and their
  applications*](https://doi.org/10.1007/s40993-026-00709-2),
  Res. Number Theory 12 (2026), article 16, cites the partial
  resolution of the perturbation conjecture for $k\ge3$.

Exact searches for the conjecture, the $k=2$ residual statement,
and the geometric-rectangle argument through November 24, 2026
did not identify an earlier full resolution. This describes the
search, not a guarantee of priority.
