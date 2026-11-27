# Exact minimizers of root type-A Gaussian sums at high rank

Fix a compact interval $`I`$ in the positive real line. There exists an integer $`N_I`$ such that whenever $`N\ge N_I`$ and $`\alpha\in I`$, the Gaussian sum on $`A_{N-1}`$ is minimized precisely at its deep holes. The rank bound may depend on both endpoints of $`I`$. This is a theorem about all translations and an entire parameter interval at once. The [half-line theorem](HALF-LINE.md) removes the dependence on the upper endpoint. Together with the [uniform small-scale theorem](SMALL-SCALE.md), it covers all positive scales in sufficiently high primal ranks. [Original question, §1.6](https://arxiv.org/html/2502.08819v2#S1.SS6)

Write $`H=\mathbf1^\perp`$ and $`L=\mathbb Z^N\cap H`$ in the standard Euclidean normalization. The function is $`P_\alpha(x)=\sum_{k\in L}e^{-\alpha\|k-x\|^2}`$ on $`H/L`$. For $`0\le k\lt N`$, let $`c_k`$ be the class with common fractional coordinate $`k/N`$. It has a representative with $`k`$ coordinates $`k/N-1`$ and the rest $`k/N`$. The desired classes are those with $`k`$ nearest to $`N/2`$. Indeed the Voronoi cell of zero is the projection of the unit cube onto $`H`$. Its defining inequalities are $`|x_i-x_j|\le1`$. Every integer vector of zero sum decomposes into $`d`$ differences of coordinate units with $`d\le\|k\|^2/2`$, so these inequalities imply every Voronoi inequality. Conversely each is required by a root vector. Projection of cube vertices gives squared norms $`k(N-k)/N`$. Their farthest values give precisely the listed classes by strict convexity of squared norm.

## The one-dimensional Gaussian and a uniform local limit

Set $`\Theta(y)=\sum_{k\in\mathbb Z}e^{-\alpha(k-y)^2}`$ and let $`K_y`$ have probabilities proportional to these summands. Write $`m(y)`$ and $`v(y)`$ for its mean and variance. Integer translation shifts the mean by that integer; the variance and all absolute central moments are uniformly bounded on $`I`$ times the phase circle, and the variance has a strictly positive lower bound. We have $`m'(y)=2\alpha v(y)`$ and $`(\log\Theta)''=4\alpha^2v-2\alpha`$.

Put $`q=e^{-\pi^2/\alpha}`$. Poisson summation and Jacobi's triple product give, up to a constant independent of $`y`$,

```math
\log\Theta(y)=C_\alpha+2\sum_{r\ge1}
\frac{(-1)^{r-1}q^r}{r(1-q^{2r})}\cos(2\pi r y).
```

The factors $`1+2q^{2k-1}\cos(2\pi y)+q^{4k-2}`$ in the product have their common unique minimum modulo one at $`1/2`$. The second derivative of the displayed log series has every term maximized there, and their sum is strictly positive there. All differentiated series used here converge uniformly for $`\alpha\in I`$. Consequently $`v(y)\le v_*=v(1/2)`$ and for some $`c_I>0`$,

```math
\log\Theta(y)-\log\Theta(1/2)\ge c_I\,\mathop{\mathrm{dist}}(y,1/2+\mathbb Z)^2,
\qquad 4\alpha^2 v_*-2\alpha\ge c_I .
```

For independent $`K_i`$ with any centers $`y_i`$, set $`S=\sum_iK_i`$, $`V=\sum_i v(y_i)`$. Uniformly for integers $`a`$ with $`|a-\mathbb ES|\le B`$ for a fixed constant $`B`$,

```math
\Pr(S=a)=(2\pi V)^{-1/2}\bigl(1+O_{I,B}(N^{-1})\bigr).
```

Here is a direct proof. Center each characteristic function, obtaining $`\phi_i(t)`$. Two consecutive atom probabilities have a common uniform lower bound, so $`|\phi_i(t)|\le e^{-c_I t^2}`$ for $`|t|\le\pi`$. Near zero the uniform fourth moments give $`\log\phi_i(t)=-v(y_i)t^2/2+i\gamma_i t^3+O_I(t^4)`$ with real bounded $`\gamma_i`$. On $`|t|\le N^{-2/5}`$ the difference between the real inversion integrand and $`e^{-Vt^2/2}`$ is bounded by a constant times $`e^{-Vt^2/2}(Nt^4+N^2t^6+B^2t^2)`$. This follows by bounding the cosine error of the accumulated odd phase by its square, and the remaining exponential error by $`O_I(Nt^4)`$. Outside this interval the Gaussian envelope makes the integral exponentially small in a positive power of $`N`$. The three error terms inside each integrate to $`O_{I,B}(N^{-1})`$ relative to the Gaussian integral since $`V`$ has order $`N`$.

## Localization of every minimizer

For any $`x\in H`$ there is a unique common shift $`u`$ such that $`\sum_i m(x_i+u)=0`$, by strict monotonicity and integer translation. Write $`y_i=x_i+u`$, $`K_i\sim K_{y_i}`$. Completing squares on $`S=0`$ gives exactly

```math
P_\alpha(x)=e^{\alpha N u^2}\prod_i\Theta(y_i)\;\Pr(S=0).
```

At a deepest central point set $`k_0=N/2+j_0`$, where $`j_0=0`$ for even $`N`$ and $`j_0=1/2`$ or $`-1/2`$ for odd $`N`$. Substituting the half-integer centers in the preceding sum directly gives

```math
P_\alpha(c_{k_0})=
\Theta(1/2)^N e^{\alpha j_0^2/N}\,
\Pr(K_{1/2}^{(1)}+\cdots+K_{1/2}^{(N)}=k_0)
=\frac{\Theta(1/2)^N}{\sqrt{2\pi N v_*}}(1+O_I(N^{-1})).
```

Each summand in this probability is an independent copy. At a global minimizer, comparison with this value and the uniform local limit gives

```math
\alpha N u^2+\sum_i\big[\log\Theta(y_i)-\log\Theta(1/2)\big]
+\tfrac12\log\frac{Nv_*}{V}\le O_I(N^{-1}).
```

All three terms on the left are nonnegative. Thus $`|u|=O_I(N^{-1})`$ and $`\sum_i\mathop{\mathrm{dist}}(y_i,1/2+\mathbb Z)^2=O_I(N^{-1})`$. Write $`x_i=d_i+1/2+\epsilon_i`$ with $`d_i`$ integer. The same square-sum bound holds for $`\epsilon_i`$ since $`Nu^2=O_I(N^{-1})`$. In particular every deviation is $`O_I(N^{-1/2})`$ and $`|\sum_i\epsilon_i|=O_I(1)`$. This localization is uniform over all global minima. A minimum exists by periodicity and continuity on the compact torus.

## Every localized minimum has scalar phase

Exchanging $`\epsilon_i`$ and $`\epsilon_j`$ while keeping the integer parts fixed amounts to a coordinate permutation followed by translation in $`L`$, so the two endpoints have the same energy. Along the segment of this exchange every coordinate remains $`O_I(N^{-1/2})`$ from its half-integer center. The common tilt at each point of the segment is $`O_I(N^{-1/2})`$. Indeed $`m(d+1/2)=d+1/2`$, $`m'`$ is uniformly bounded above and below, and the coordinates sum to zero. Hence all tilted phases on the segment also tend uniformly to the half-integers.

For each fixed pair of indices, the tilted conditional law of $`(K_i,K_j)`$ given $`S=0`$ has the same centered first and second moments as its independent law up to $`o_I(1)`$, uniformly on the segment. To see this, truncate both coordinates to a fixed distance $`M`$ from their respective means. For each such pair of values the local limit for the remaining $`N-2`$ variables gives a conditional-to-unconditional mass ratio $`1+O_{I,M}(N^{-1})`$, since the residual sum differs from its mean by at most $`2M`$. For arbitrary values the ratio stays uniformly bounded: integrate the characteristic-function envelope of the remaining variables and divide by the uniform lower bound of order $`N^{-1/2}`$ for $`\Pr(S=0)`$. The two independent discrete Gaussian tails make all first and second moments outside the truncation uniformly small as $`M`$ grows. Centering here uses the one-site means, so arbitrary integer parts cause no change to the estimates.

Differentiation of the original root-lattice sum along $`e_i-e_j`$ gives

```math
\partial^2_{e_i-e_j}\log P_\alpha(x)
=-4\alpha+4\alpha^2\mathrm{Var}(K_i-K_j\mid S=0).
```

Conditioning eliminates the common tilt from the probability law. The variance tends uniformly to $`2v_*`$ along every segment above. The one-site strict midpoint curvature gives a positive uniform lower bound for this directional second derivative when $`N`$ is sufficiently large. If the two deviations differed, strict convexity on the segment would give a value below the global minimum at its midpoint. Thus all $`\epsilon_i`$ agree. A minimizing class is therefore $`c_k`$ for $`k=-\sum_i d_i`$, with $`j=k-N/2=O_I(1)`$.

## Selecting the deepest central levels

Let $`\psi(t)=\mathbb E\exp(it(K_{1/2}-1/2))`$. Symmetry about $`1/2`$ makes it real and even. Let $`J_j=\int_{-\pi}^{\pi}\psi(t)^N\cos(jt)\,dt`$. For the admissible integer $`N/2+j`$, inversion gives $`J_j/(2\pi)`$ as its mass under the sum of the $`N`$ independent midpoint variables, including when $`j`$ is a half-integer. Rescaling $`t=s/\sqrt{Nv_*}`$ in this integral and using the uniform Gaussian envelope and the expansion at zero gives

```math
\frac{\int_{-\pi}^{\pi}t^2\psi(t)^Ndt}{J_0}
=\frac{1+o_I(1)}{Nv_*},
\qquad
\frac{\int_{-\pi}^{\pi}t^4|\psi(t)|^Ndt}{J_0}=O_I(N^{-2}).
```

Here $`J_0`$ is just the zero-shift integral, and its asymptotic order is $`N^{-1/2}`$ for odd and even $`N`$. Expanding the cosines for bounded $`j,j_0`$ and including the exact exponential factor from completing squares gives

```math
\frac{P_\alpha(c_{N/2+j})}{P_\alpha(c_{N/2+j_0})}
=1+\frac{j^2-j_0^2}{N}\left(\alpha-\frac1{2v_*}\right)+o_I(N^{-1}).
```

The coefficient in parentheses has a positive uniform lower bound on $`I`$ by the strict midpoint curvature. Every larger admissible $`|j|`$ has $`j^2-j_0^2\ge1`$, and the two nearest classes in odd $`N`$ have identical values by inversion. This proves the theorem.
