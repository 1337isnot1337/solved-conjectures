# Erdős–Pyber–Tuza rainbow six-cycle conjecture

**Noncentral compact Cayley classification with a representation gap.** There is an absolute integer $D_0$ such that, if every nonlinear irreducible representation of a compact group $G$ has dimension at least $D_0$, its balanced inverse-symmetric six-colour Cayley graphons have zero rainbow six-cycle density exactly in the parity family. No conjugation invariance of the individual colours is required. The abelianization can be arbitrary. If the abelianization has order two, $D_0=10^5$ suffices.

Let $f_i:G\to[0,1]$ be the six functions, each of mean $1/6$, inverse-symmetric and with sum one. Use $W_i(x,y)=f_i(x^{-1}y)$. Write $Q=G/\overline{[G,G]}$ and let $V_i$ be the corresponding conditional averages on $Q$. They are balanced and inverse-symmetric, and because $Q$ is abelian they are also central. Let $R$ be the average of the six-factor convolution at the identity over all colour orders, multiplied by $6^6$.

## Transfer to the abelianization

On a nonlinear irreducible representation of degree $d$, put $M_i=\widehat{6f_i}$. Each $M_i$ is self-adjoint by inversion symmetry, and $\sum_i M_i=0$. For $S\subseteq[6]$,
```math
d\Big\|\sum_{i\in S}M_i\Big\|_{\mathrm{HS}}^2\le |S|(6-|S|).
```
Indeed the squared $L^2$ norm of $6\sum_{i\in S}f_i-|S|$ is at most $|S|(6-|S|)$ because $0\le\sum_{i\in S}f_i\le1$ and its mean is $|S|/6$. Apply Parseval to its contribution on this representation.

With $`E=\sum_i\|M_i\|_{\mathrm{HS}}^2`$, the averaged product trace on this block is at least $-536E/(720d^2)$ by the [six-matrix inequality](ALL-CAYLEY.md#the-key-six-matrix-estimate). For clarity, expand the trace of the sixth power of a signed subset sum by inclusion–exclusion. Dropping the nonnegative pair terms, the negative terms are twice the singleton terms and once each triple term. Bound $\mathrm{tr}(M_S^6)$ by $`\|M_S\|_{\mathrm{HS}}^6`$, and the sum of squared norms over triples is $6E$. This gives $2\cdot25+6\cdot81=536$.

Both convolution expansions are absolutely convergent: the matrix operator norms of all six Fourier coefficients are at most one, and two Hilbert–Schmidt factors are summable in product by Cauchy–Schwarz and Parseval with the multiplicities $d$. The linear blocks give exactly $R(V)$, and the nonlinear energy summed with multiplicities is at most $30$. Consequently, when all nonlinear dimensions are at least $D$,
```math
R(W)\ge R(V)-\frac{67}{3D^2}.
```

## Recover an exact parity graphon

Suppose $R(W)=0$. The [uniform compact normal stability theorem](COMPACT-NORMAL-STABILITY.md) applied to $V$ shows, for sufficiently large absolute $D$, that some quotient sign character has three colours assigned to each coset and total wrong-coset colour mass below $10^{-10}$. The ordered density required there follows from $R(V)$ being small; on an abelian group the order is immaterial. The lifted sign on $G$ has exactly the same wrong-coset masses for $W$ as for $V$, since $V$ was obtained by conditional averaging.

There is a parity graphon close to $W$. On each retained coset keep the weights of the three assigned hues. Their deficit in total pointwise mass from one is precisely the mass of the three deleted hues at that point. Distribute the deficit in fixed proportions among the three retained colours, proportional to the losses each must recover to reach mean $1/6$. These losses sum to the required total on that coset, since three hues are assigned there and it has measure $1/2$. In the zero-deficit case no replacement is needed. This gives six balanced inverse-symmetric functions, with the prescribed parity. For each colour the $L^1$ error is twice its wrong-coset mass, so the coloured cut distance is below $2\cdot10^{-10}$.

By [uniform parity rigidity](PARITY-RIGIDITY.md), $W$ itself is exactly parity. In a Cayley graphon the crossing sum of a parity palette determines a rank-one sign kernel; left translations preserve it and therefore act on its real line by a continuous character to $`\{1,-1\}`$. This gives the character form of the locally recovered split. Conversely a pure parity split has zero density by parity of every closed walk.

If $Q$ has order two, write $a_i$ for the six real normalized coefficients at its sign character. Then $R(V)=1+\prod_i a_i$. For $D\ge10^5$, zero density gives $\prod_i a_i\le-1+67/(3D^2)$, so all six $|a_i|\ge1-67/(3D^2)$. Their sum is zero, forcing three positive and three negative signs. Each hue has wrong mass $(1-|a_i|)/12$, and parity completion costs $L^1$ error at most $67/(18D^2)<10^{-9}$ per hue. This proves the stated explicit sufficient dimension in this case.

The argument also applies to graphons pulled back from a homogeneous quotient $G/H$: the exact cut palette is unique, and a recovered crossing kernel constant on the $H$-fibres makes its sign character trivial on $H$. The finite odd-order Cayley implication is already known in the repository; this extends the graphon classification beyond normal colours under a degree gap and imposes neither odd order nor connectedness. Arbitrary compact groups with small nonlinear representations and nonhomogeneous graphons remain open. [Issue #870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
