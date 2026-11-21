# Maximum permanent on a unitary orbit

Fix $n\ge4$. There is an $\epsilon_n>0$ such that the following formula gives the maximum over **all complex Hermitian matrices** with eigenvalues $1,b,0,\ldots,0$ whenever $0<b<\epsilon_n$. Scaling gives the corresponding formula for any largest eigenvalue. Put $m=n-1$, $d=1-b$, and let $z$ be the smaller root of

```math
 n^2z^2-n[2+(n-1)d]z+nd-(n-2)b=0.
```

The maximum equals

```math
 \frac{m!}{m^m}(1-z)^{n-2}[b+ndz-nz^2].                         \tag{1}
```

Every maximizer is obtained by coordinate permutation and diagonal unitary conjugation from $uu^*+bww^*$, with $x=z/d$ and

```math
 u=(\sqrt x,\sqrt{(1-x)/m}\,\mathbf1_m),\qquad
 w=(\sqrt{1-x},-\sqrt{x/m}\,\mathbf1_m).
```

At $b=0$ the optimal leading eigenvector is flat. The splitting for $b>0$ singles out exactly one of its coordinates. The two positive eigenvalues may vary independently up to their ratio bound. This is a local spectral result for [Marcus and Minc's Problem 1](https://yair-lavi.com/mincs-list/problem-1/index.html). Arbitrary spectra and an explicit endpoint for this branch remain open here.

## Eliminating the leading eigenvector

Write $A=uu^*+bww^*$ for an orthonormal pair. At $b=0$ the permanent is $n!\prod |u_i|^2$, whose maximum forces all $|u_i|^2=1/n$. Compactness of the complex Stiefel manifold and uniform convergence imply that all global maximizers for small $b$ lie arbitrarily close in these squared moduli to $p^0=(1/n,\ldots,1/n)$. Make the leading eigenvector positive by diagonal conjugation and write $u_i=\sqrt{p_i}$. The ratios $r_i=w_i/u_i$ give the exact expansion

```math
 \frac{\operatorname{per} A}{n!}
 =\left(\prod_i p_i\right)\sum_{j=0}^n \frac{b^j}{\binom nj}|e_j(r)|^2 .       \tag{2}
```

Indeed, after taking out the row and column factors, choose the $j$ rows and the $j$ columns that supply the rank-one $b$ term. Each such choice contributes $j!(n-j)!$ times the product of its selected coordinates and conjugates.

Use a real analytic orthogonal map $R(p)$ taking $u^0=\sqrt{p^0}$ to $u$, equivariant under simultaneous permutations. For instance, with $K=u(u^0)^T-u^0u^T$, take $R=I+K+K^2/(1+u^Tu^0)$. Set $w=R(p)v/\sqrt n$, where $\sum v_i=0$ and $\sum |v_i|^2=n$. The free phase of $w$ makes the space of $v$ a complex projective space. At $p=p^0$ we have $r=v$.

Normalize (2) by multiplying by $n^n$. The constant-order term has a unique nondegenerate maximum in $p$ at $p^0$ on the simplex. The analytic implicit function theorem supplies a unique nearby critical $p=p(v,b)$, uniformly over the compact projective parameter space. Uniformity follows by applying the theorem in a finite chart cover and using local uniqueness on overlaps, or by uniform strict concavity in a small convex $p$-neighborhood. Each global maximizer uses this critical point. The coefficient of $b$ and its first $p$-derivative vanish at $p^0$ because $e_1(v)=0$ and the term contains $|e_1|^2$. Thus $p=p^0+O(b^2)$. Substitution yields the reduced objective

```math
 F_b(v)=1+b^2\frac{|e_2(v)|^2}{\binom n2}
              +b^3\frac{|e_3(v)|^2}{\binom n3}+O(b^4).           \tag{3}
```

All remainders here hold also after two derivatives in local projective coordinates, by analytic dependence, compactness, and the vanishing just proved. The reduction respects conjugation and permutations.

## Two successive symmetry constraints

Since $e_2(v)=-\sum v_i^2/2$, the coefficient of $b^2$ is largest exactly on the real projective locus. It has strictly negative normal Hessian there. Explicitly, after a choice of phase near that locus, write $v=a+ic$ with $a,c$ real centered, $a\perp c$, $\|a\|^2=n-\|c\|^2$. Locally $a/\|a\|$ parametrizes the real locus and $c$ varies orthogonally to it in the centered real space. In these coordinates $4|e_2|^2=(n-2\|c\|^2)^2$. Every maximizing sequence tends to the real locus as $b\to0$, by (3). For $(F_b-1)/b^2$ the normal Hessian stays strictly negative in a uniform tube for all small $b$. Its normal gradient vanishes at $c=0$ by conjugation. Strict concavity on each small normal ball forces every maximizer to be real up to phase, exactly.

On the resulting real centered sphere $e_3(v)=\sum v_i^3/3$, and $e_2(v)=-n/2$ is constant. The maximum of $|\sum v_i^3|$ occurs exactly at permutations and signs of

```math
 v_*=(\sqrt{n-1},-1/\sqrt{n-1},\dots,-1/\sqrt{n-1}).
```

To see this, the extreme cubic is nonzero (evaluate it at $v_*$), and the Lagrange equations for the signed cubic say that all coordinates solve one quadratic. If a positive root occurs $h$ times, the roots are $\sqrt{(n-h)/h}$ and $-\sqrt{h/(n-h)}$, and the absolute sum of cubes is $n|n-2h|/\sqrt{h(n-h)}$. This is strictly decreasing from $h=1$ to the midpoint, as its square divided by $n^2$ is $n^2/[h(n-h)]-4$. The maximum is nondegenerate. At $v_*$ the tangent vectors have first coordinate zero and their other coordinates sum to zero. If the two coordinate values are $s>t$, the multiplier of the norm constraint satisfies $2\lambda=3(s+t)$. The constrained Hessian of the cubic on the tangent space is $(6t-2\lambda)I=3(t-s)I$, and the cubic value is positive. Its square therefore has negative definite Hessian there.

After subtracting the first two constant terms on the real locus and dividing by $b^3$, (3) extends analytically to $b=0$. Its maximizers for small $b$ lie near the finite orbit of $v_*$. In each such neighborhood the nondegenerate critical point continues uniquely. The stabilizer consisting of permutations of the last $m$ coordinates fixes that critical point. Indeed $v_*$ itself is a critical point for each $b$ by symmetry, since its tangent space has no nonzero vector fixed by this group. Hence the continuation is exactly $v_*$. The optimizer $p(v_*,b)$ inherits the same symmetry. It has one distinguished coordinate $x$ and $m$ equal others. The real centered unit vector in the two-group fixed space orthogonal to $u$ is precisely the displayed $w$, up to sign.

## Evaluation and the branch

The repeated diagonal block has every entry $y=(1-dx)/m$, the distinguished diagonal entry is $D=b+dx$, and the cross entry has square $c^2=d^2x(1-x)/m$. If the distinguished row goes to the distinguished column its contribution is $m!Dy^m$. Otherwise choose its column and the row returning to the distinguished column, giving $m!\,m c^2 y^{m-1}$. Adding and putting $z=dx$ gives (1). Its derivative in $z$, after removing the positive factor $m!m^{-m}(1-z)^{n-3}$, is the quadratic in the statement. Its roots at $b=0$ are $1/n$ and $1$. The necessary stationary point satisfies $x\to1/n$, selecting the smaller root. Compactness already supplies a maximizer, and all the reductions were necessary conditions with a unique surviving orbit, so the value is attained and the equality description is exhaustive.

The [source audit](../combinatorial/unitary_orbit_source_audit.md) covers the general critical-value prescription, the family with one exceptional eigenvalue, and the classical fixed-order results. The [shifted-projection bound](shifted_projections.md) concerns equal positive increments on a subspace. An additional search for the two nonzero unequal eigenvalues and rank-two fixed-spectrum extrema located no matching symmetry-branch formula. These searches cannot certify priority. The occupation identity and the extremum of the sample skewness serve here as ingredients.

## Reality for a full neighborhood of the rank-one spectrum

For each fixed $n\ge3$ there is a $\delta_n>0$ with the following property. If the leading eigenvalue is one and the remaining nonnegative eigenvalues satisfy $\sum_{i=2}^n\lambda_i^2<\delta_n^2$, **every** global unitary-orbit maximizer is diagonally unitarily conjugate to a real, entrywise positive matrix. This statement is uniform in eigenvalue gaps and includes arbitrary multiplicities and full-rank spectra.

In the same gauge write the matrix as $uu^T+R(p)H R(p)^T$, now allowing any small centered Hermitian matrix $H$ (that is, $H\mathbf1=0$). Its restriction to the centered hyperplane has the prescribed residual eigenvalues. Set $F(H)$ equal to the normalized objective after maximizing over nearby $p$. This is an analytic function on an ambient ball of centered Hermitian matrices, even without positivity: the critical point at zero is strict in $p$ and the preceding implicit function argument applies there. Compactness as before puts all global orbit maximizers in this chart as $\|H\|_F\to0$.

The maximizing $p(H)$ satisfies $p(H)-p^0=O(\|H\|_F^2)$. Indeed the linear contribution before optimizing, divided by the rank-one contribution, equals $v^*Hv/n$ with $v=R(p)^T(1/u_i)_i$. At $p^0$ this vector is constant, so both the contribution and its first $p$-derivative vanish. Substitution into the objective can therefore first affect degree four. At $p^0$ the matrix is $J+H$ with $J_{ij}=1/n$. Expanding by the chosen rows and columns supplies coefficient $n^k/(n)_k$ times the sum of its order-$k$ subpermanents of $H$, where $(n)_k$ is a falling factorial. Centering gives

```math
 F(H)=1+\frac{n}{2(n-1)}\sum_{ij}H_{ij}^2
        +\frac{2n^2}{3(n-1)(n-2)}\sum_{ij}H_{ij}^3+O(\|H\|_F^4).
```

For the second and third coefficients, sum products of $k$ entries over distinct row indices and distinct column indices, and divide by $k!$. Impose distinctness by inclusion-exclusion on set partitions independently on both sides. A singleton row or column block vanishes on summation by centering. In orders 2 and 3 only the indiscrete partition survives on either side, giving respective factors $1/2$ and $4/6$.

Write $H=S+iT$ with $S$ real symmetric and $T$ real skew-symmetric. Both kill the constant vector. The quadratic term is a positive constant times $\|S\|_F^2-\|T\|_F^2$. It follows by continuity of the Hessian that, throughout a sufficiently small ambient ball, $F$ is strictly convex on real symmetric slices and strictly concave on imaginary skew-symmetric slices. Conjugation gives $F(S+iT)=F(S-iT)$, so $F(S+iT)<F(S)$ whenever $T\ne0$ there.

It remains to preserve the spectrum in this comparison. Choose a real orthonormal eigenbasis of $S$ on the centered hyperplane. In that basis the diagonal of $H$ is exactly the vector of eigenvalues of $S$ because $T$ is skew-symmetric. The spectral decomposition of $H$ expresses this diagonal as the squared-entry modulus matrix of a unitary times its eigenvalue vector. This is a doubly stochastic mixture of permutations of that vector. By Birkhoff's theorem, $S$ is a convex combination of real symmetric matrices $H_a$ with precisely the prescribed residual spectrum in this same basis. They have $\|H_a\|_F=\|H\|_F$ and kill the constant vector. Thus

```math
 F(S)\le\sum_a t_a F(H_a)\le\max_a F(H_a).
```

Each $F(H_a)$ is attained within the original unitary orbit by taking its optimizing $p(H_a)$. The strict imaginary-direction inequality precludes any maximizer with $T\ne0$. The resulting real matrix is entrywise positive, after shrinking $\delta_n$ if necessary, since it converges uniformly to $J$. This proves the assertion without any lower bound on a difference of residual eigenvalues.
