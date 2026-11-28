# Erdős–Pyber–Tuza rainbow six-cycle conjecture

**Uniform rigidity of the parity family.** Let $W$ be a balanced six-colour graphon with zero rainbow six-cycle density. If its coloured cut distance from a parity graphon is less than $10^{-9}$ (the maximum of the six cut norms after simultaneous relabelling), then $W$ itself is a parity graphon. Thus genuine non-parity obstructions cannot accumulate at the parity family. This does not rule out distant obstructions.

## Quantitative three-colour path inequality

On one half of a parity graphon $V$, let $V_1,V_2,V_3$ be its within-half colours, using the original graphon measure. The three-colour path identity from [excluding parity limits](EXCLUDING-PARITY-LIMITS.md) holds unchanged without normalization: the constant kernel on the half has cube equal to one fourth times itself, and each of the three equal-index corrections is one twelfth times itself. Thus the sum $P$ of its six distinct-colour three-path kernels is $2\sum_i V_i^3$.

For measurable endpoint weights $f,g$ supported on this half, with $0\le f,g\le1$, write $a=\int f$, $b=\int g$, and $E_i=\int f(x)g(y)V_i(x,y)$. The weighted bipartite four-cycle Cauchy–Schwarz inequality gives
```math
\int f(x)f(x')g(y)g(y') V_i(x,y)V_i(x',y)V_i(x',y')V_i(x,y')
\ge \frac{E_i^4}{a^2 b^2},
```
where the integral uses the four indicated variables. To see this, normalize $f,g$ to probability densities and apply Cauchy–Schwarz first to the inner product of two rows and then to their column averages. Dropping the factors $f(x'),g(y'),V_i(x,y)\le1$ bounds the left side above by $\int f(x)g(y)V_i^3(x,y)$. Since $\sum E_i=ab$, convexity of the fourth power gives
```math
\int f(x)g(y)P(x,y)\ge 2a^2b^2/27.
```
This does not require any mixing or connectedness for individual colours.

If $W$ is within cut norm $\delta$ per colour of $V$ in a common labelling, telescoping the three path edges gives absolute error at most $18\delta$ in the preceding weighted path integral. All internal vertices are restricted to the same half. For each edge replacement, fixing the other two vertices leaves a product of two separate tests in $[0,1]$ on the replaced edge. Its integral error is bounded by the cut norm by layer cake. Sum over the three edges and the six orders. In particular for $a,b\ge1/24$ and $\delta<10^{-9}$ the weighted path integral for $W$ is strictly positive.

## A nearby zero must be parity

Use the parity halves of $V$ as a reference partition for $W$. The integral of the three crossing hues of $W$ on the two within-half squares is at most $6\delta$, by the corresponding cut tests and their zero integrals in $V$. Thus the set of vertices at which the total within-half mass of crossing hues is at least $1/24$ has measure at most $144\delta<1/6$. Call its complement typical. Every colour sends positive mass from almost every vertex to typical vertices, because every colour has degree $1/6$.

For a vertex $u$ and crossing hue $a$, a side is available when the $a$-mass from $u$ to it is at least $1/24$. Some side is available since the two masses sum to $1/6$. Record the side bit flipped, and let $Q(u,a)$ be the set of recorded bits. At a typical vertex all three crossing hues have the same recorded singleton, namely the vertex's reference side.

Take a positive edge of crossing colour $c$ at roots $u,v$, and let $a,b$ be the other two crossing hues. If an available side for $a$ at $u$ is also available for $b$ at $v$, use $f=W_a(u,\cdot)$ and $g=W_b(v,\cdot)$ restricted to that side. Their masses are at least $1/24$, so the transferred weighted path integral is positive. In combination with $W_c(u,v)>0$ this would contribute to rainbow six-cycle density. Thus for almost every such pair, the available side sets under these terminal colours cannot share a bit. The same holds with $a,b$ exchanged.

For almost every $u$, each crossing hue $c$ has a positive-mass set of typical neighbours at which the two constraints hold. The terminal hue sets of such a neighbour have the same singleton bit. Hence the two other crossing hue sets at $u$ are equal singletons as well. Varying $c$ shows all three sets at $u$ give one bit $q_u$. Each crossing hue is now supported between opposite $q$-classes. Their sum has degree $1/2$ and is symmetric. Integrating across the cut from each side gives equal part measures, each $1/2$. By the degree and the bound of one on the summed kernel, that sum is one almost everywhere across the recovered cut. The other three hues are therefore entirely within the two recovered classes. This is the parity graphon condition.

The $10^{-9}$ threshold is a conservative explicit cut separation, independent of the number of graphon types and of how small the admissible colour values are. The [no-parity-limit theorem](EXCLUDING-PARITY-LIMITS.md) still handles the passage to exactly balanced odd finite orders. [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/870).
