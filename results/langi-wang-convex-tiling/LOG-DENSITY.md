# Logarithmic density of the exceptional window sizes

For either side-count convention in [the tiling theorem](PROOF.md), for every $`\epsilon>0`$ the radii $`R`$ with $`v_R>6+\epsilon`$ have logarithmic density zero:

```math
\lim_{X\to\infty}\frac1{\log X}\int_{[1,X]\cap\{R:v_R>6+\epsilon\}}\frac{dR}{R}=0.
```

Radii with $`S_R=\varnothing`$ can be omitted, since $`N(R)\to\infty`$. Thus the unbounded upper limit in the counterexample is compatible with a strong typical-radius bound applying to every tiling.

Fix $`\delta>0`$. If a tile $`C`$ is an outside neighbor of $`S_R`$, it meets $`B_R`$ at a contact with a tile in $`S_R`$. If $`D(C)\le\delta R`$, it is wholly contained in $`B_{(1+\delta)R}`$. If $`D(C)>\delta R`$, homothetically shrink it about that contact by $`\delta R/D(C)`$. The resulting convex set lies inside $`C\cap B_{(1+\delta)R}`$ and has an inball of radius at least $`\delta R/(2\mu)`$. The scaled inballs of all these large outside neighbors have disjoint interiors. Hence

```math
|\partial S_R|\le N((1+\delta)R)-N(R) + 4\mu^2(1+\delta)^2/\delta^2 .
\qquad (1)
```

As proved in the main note, $`v_R\le 6+3|\partial S_R|/N(R)`$. Since $`N(R)\to\infty`$, for all sufficiently large $`R`$ depending on $`\delta,\epsilon,\mu`$ the constant in (1) is at most $`(\epsilon/6)N(R)`$. It follows that

```math
v_R>6+\epsilon\quad\Longrightarrow\quad
\log N((1+\delta)R)-\log N(R)>\log(1+\epsilon/6).
\qquad (2)
```


For $`x=\log R`$, let $`f(x)=\log N(e^x)`$ and $`h=\log(1+\delta)>0`$. The function $`f`$ is nondecreasing and $`f(x)\le 2x+O_\lambda(1)`$ by disjoint inball areas. Take $`x_0`$ large enough that $`N(e^{x_0})>0`$ and (2) holds for $`x\ge x_0`$. For $`Y>x_0+h`$,

```math
\int_{x_0}^{Y}[f(x+h)-f(x)]\,dx
=\int_Y^{Y+h}f(x)\,dx-\int_{x_0}^{x_0+h}f(x)\,dx
\le 2hY+O_{h,x_0,\lambda}(1).
```

Since the integrand is nonnegative, (2) bounds the upper asymptotic density of the exceptional real $`x`$'s by $`2h/\log(1+\epsilon/6)`$. This holds for each fixed $`h>0`$, so letting $`h\downarrow0`$ gives zero. The result for radii follows by $`dx=dR/R`$.
