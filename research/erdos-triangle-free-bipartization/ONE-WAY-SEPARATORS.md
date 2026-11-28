# One-way separators for the Erdős bipartization problem

This is an all-order partial result for [Erdős Problem 23](https://www.erdosproblems.com/23). A one-way separator after cyclically orienting a proper three-coloring forces the sharp bound if the separator has reasonably balanced shores. The result also holds with some edges in the wrong direction, and with two independently four-colored blocks.

Normalize the total vertex mass to one and give each edge the product of its endpoint masses. Write \(e\) for the unordered edge mass and \(\beta\) for the minimum mass deleted. Suppose \(V=X\sqcup Y\), and each of the induced graphs admits a proper coloring with labels \(1,2,3,4\). The colorings need not agree with a coloring of the whole graph. A cross edge is compatible if its two labels agree. Let \(U\) be the total mass of incompatible cross edges, and write \(\mu(X)=1/2+s\). Then
```math
 \frac{s^2}{2}+3U\le\frac{603}{40000}
 \quad\Longrightarrow\quad
 \beta\le\frac1{25}.
```
In particular \(U=0\) suffices for any split with both shores having masses in \([.33,.67]\), and a perfectly balanced split allows \(U\le201/40000\).

## Proof

Let \(E=e(G[X])+e(G[Y])\). Choose a uniformly random split of the four labels into two pairs. Assign the resulting signs to the labels in \(X\), and reverse all signs in \(Y\). There are three distinct cuts up to global sign. Any two different labels agree in exactly one of the three splits. Thus each internal edge is monochromatic with probability \(1/3\), each compatible cross edge is always cut, and each incompatible cross edge is monochromatic with probability \(2/3\). Consequently
```math
 \beta\le\frac{E+2U}{3}. \tag{1}
```

For a second cut, optimize separately in each block and then reverse one block with probability \(1/2\). The cross edges contribute exactly \((e-E)/2\) in expectation. A triangle-free graph of vertex mass \(a>0\) and edge mass \(z\) has a cut with cost at most \(z-4z^2/a^2\): cut a random vertex neighborhood from its complement and apply Cauchy–Schwarz to the degree second moment. Indeed the neighborhood is independent, so the mean weight cut is \(a^{-1}\int d(v)^2\,d\mu(v)\), at least \(4z^2/a^2\). This cost is at most \(a^2/4-z\), since their difference is \((a^2-4z)^2/(4a^2)\). The zero-mass case is trivial. With \(S=(\mu(X)^2+\mu(Y)^2)/4=1/8+s^2/2\), this gives
```math
 \beta\le S-E+\tfrac12(e-E)=S+\tfrac12 e-\tfrac32 E. \tag{2}
```
The neighborhood argument is the classical density cut of [Erdős, Faudree, Pach and Spencer](https://combinatorica.hu/~p_erdos/1988-12.pdf).

If \(e\ge3197/20000\) the [Balogh–Clemen–Lidický dense theorem](https://arxiv.org/html/2103.14179) already gives the result. It transfers to arbitrary product weights by rational independent blow-ups, continuity, and an arbitrarily large common blow-up of the vertex classes. For the threshold equality one can first use the argument below, whose inequalities allow \(e\le3197/20000\); thus no limiting issue at the equality density is needed. Otherwise a counterexample would satisfy \(E>3/25-2U\) by (1), and (2) implies
```math
 \beta<\frac18+\frac{s^2}{2}+\frac{3197}{40000}
            -\frac9{50}+3U
       =\frac{997}{40000}+\frac{s^2}{2}+3U
       \le\frac1{25},
```
a contradiction.

## Directed consequence for proper three-colorings

Orient every edge cyclically between the three color classes, from \(i\) to \(i+1\) modulo 3. After taking \(X\) to be a prefix of a topological order of the strongly connected components, there are no arcs from \(Y\) to \(X\). Color \(X\) with its original labels and color a vertex of original label \(i\) in \(Y\) with label \(i-1\) (modulo 3). Then every cross edge is compatible, so the theorem applies. In particular, if every strongly connected component has mass at most \(17/50\), taking the first prefix of mass at least \(33/100\) leaves its mass at most \(67/100\). Hence a counterexample with any proper three-coloring must have a strongly connected component of mass **greater than \(17/50\)** in that cyclic orientation. For a general approximate prefix, \(U\) is just the mass of arcs from \(Y\) to \(X\).

This argument uses neither constant link densities nor vertexwise degree balance. It does not cover arbitrary three-colorings when a large strongly connected component crosses all balanced cuts; eliminating that case and extending to arbitrary triangle-free graphs remain open.

## Version without color labels

The same argument applies to a partition into any number of blocks if a law of cuts misses each internal edge with probability at most \(1/3\), crosses each good cross edge surely, and misses each of the remaining cross edges with probability at most \(2/3\). Independently flipping each whole block in (2) again charges each cross edge half its mass. The sufficient condition becomes \(\sum_i\mu(X_i)^2/4+3U\le5603/40000\).

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
