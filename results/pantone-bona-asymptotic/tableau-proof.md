# A shorter tableau proof of the Pantone–Bóna asymptotic

This is an independent, shorter proof of the asymptotic in [PROOF.md](PROOF.md). It also gives a factorial multisum for the exact coefficients. For the conjectured $A_{5,5}$, the conclusion is
```math
|\mathop{\mathrm{Av}}\nolimits_n(A_{5,5})|\sim\frac{625\sqrt3}{192\pi}\,10^n n^{-4}.
```

## Exact count

Fix $d\ge1$ and $k=d+2$. A permutation avoiding $A_{k,k}$ has a unique cut just before its first entry of rank $d+1$, using the whole permutation as front if no such entry exists. Here rank means the length of a longest increasing subsequence ending at the entry. The suffix from that first high-rank entry onwards is increasing, since any smaller later entry would complete a forbidden pattern; each subsequent increasing entry is again of rank at least $d+1$. The front has longest increasing subsequence length at most $d$.

Apply Robinson–Schensted row insertion. If the tail has length $r>0$, then at the cut the first row has exactly $d$ boxes and every tail insertion then appends a cell to the first row. Indeed its first entry has rank $d+1$, meaning it exceeds the current final first-row entry. The later tail values increase, so they append in the same way. Conversely, if all boxes beyond column $d$ are in the first row and their recording labels are precisely the final $r$ labels, then those last $r$ insertions must each append a cell to the first row. In row insertion appending to the first row occurs exactly when the new value exceeds every entry already in that row. Thus the tail increases and the front avoids the monotone pattern of length $d+1$. Such a front followed by such a tail always avoids $A_{k,k}$: an increasing subsequence of length $d+1$ has its final entry in the tail, after which every following value is larger. This gives the converse exactly.

Transpose the tableaux. A possible shape with tail length $r>0$ is $(\mu_1,\dots,\mu_d,1^r)$, where $\mu\vdash m=n-r$ has exactly $d$ rows. The insertion tableau is arbitrary. The recording tableau restricted to $\mu$ is arbitrary too, with the removed $r$ cells in the first column below $\mu$ filled freely in the only possible order. Therefore, with $`f_m=\sum_{\mu\vdash m,\ \ell(\mu)\le d}(f^\mu)^2=|\mathop{\mathrm{Av}}\nolimits_m(12\cdots (d+1))|`$,
```math
|\mathop{\mathrm{Av}}\nolimits_n(A_{k,k})|
=f_n+\sum_{m\lt n}\sum_{\substack{\mu\vdash m\\\ell(\mu)=d}}
 f^\mu f^{(\mu,1^{n-m})}.
\tag{1}
```
Here $f^\mu$ counts standard tableaux of shape $\mu$. This sharpens [the original tableau encoding of Bóna and Pantone, Theorem 3.1](https://arxiv.org/html/2103.06918v2#S3).

Set $y_i=\mu_i+d-i$. The hook lengths of the $r$ new cells have product $r!$, and the $d$ old first-column hook lengths change from $y_i$ to $y_i+r$. Other hook lengths do not change. The hook-length formula therefore gives the exact identity
```math
f^{(\mu,1^r)}
=\binom{m+r}{r} f^\mu\prod_{i=1}^d\frac{y_i}{y_i+r}.
\tag{2}
```

## Asymptotics

Set $\alpha=(d^2-1)/2$ and $p=d^2/(d^2+1)$. By [Regev](https://doi.org/10.1016/0001-8708(81)90012-8), $f_m\sim c_d d^{2m}m^{-\alpha}$ with $c_d>0$. For fixed $m$, sample $\mu$ with probability $(f^\mu)^2/f_m$ among shapes having at most $d$ rows. Under this law $\mu_i/m\to1/d$ in probability. In fact $f^\mu$ is at most the multinomial coefficient selecting the entries of each row, which is bounded by $\exp(mH(\mu/m))$ where $H$ is entropy. Away from the uniform profile entropy has a fixed deficit from $\log d$, and there are at most $(m+1)^d$ shapes. Division by Regev's polynomially corrected $d^{2m}$ gives an exponentially small outlying probability. For $d=1$ the profile is automatic.

For $m<n$ define $q_{n,m}$ to be the expectation of the product in (2) over this shape law, with the contribution of a shape with fewer than $d$ rows set to zero. Set $q_{n,n}=1$ to include the tail-free term. If $m/n\to p$, then with probability tending to one the shape has exactly $d$ rows, and for each $i$ the ratio in (2) tends to
```math
\frac{p/d}{p/d+1-p}=\frac{d}{d+1}.
```
The product lies in $[0,1]$; its expectation along every such sequence tends to $(d/(d+1))^d$. Formula (1), now with (2), is
```math
|\mathop{\mathrm{Av}}\nolimits_n(A_{k,k})|=\sum_{m=0}^n\binom nm f_m q_{n,m}.
```
Writing $M\sim\mathop{\mathrm{Binomial}}(n,p)$, divide by $(d^2+1)^n n^{-\alpha}$ to rewrite this as the expectation of $n^\alpha (f_M/d^{2M})q_{n,M}$. The part with $M<pn/2$ tends to zero by an exponential binomial tail bound and $f_m/d^{2m}\le C_d(m+1)^{-\alpha}$. The remaining integrands are uniformly bounded. Since $M/n\to p$ in probability, the expectation tends to $c_d p^{-\alpha}(d/(d+1))^d$. For example one can work on the event $|M-pn|\le n^{2/3}$, where the deterministic approximation is uniform (otherwise a counterexample sequence would violate the limit along deterministic $m/n\to p$); its complement has probability tending to zero. This proves the whole asymptotic in [PROOF.md](PROOF.md).

## Exact holonomicity

Formula (1) also implies that for every fixed $d$, the counting sequence is P-recursive, so its ordinary generating function is D-finite. It does not by itself identify the conjectural third-order differential equation in [Bóna–Pantone, §6.4](https://arxiv.org/html/2103.06918v2#S6.SS4).

For the sum with a tail, use the nonnegative gap variables $u_i=\mu_i-\mu_{i+1}$ for $i<d$ and $u_d=\mu_d-1$. Then $m=d+\sum_{i=1}^d i u_i$. Put $r=n-m$ and sum over $r\ge0$, absorbing the $r=0$ contribution of shapes having exactly $d$ rows. The remaining term counts shapes having at most $d-1$ rows. The straight tableau formula $f^\mu=m!\prod_{i<j}(y_i-y_j)/\prod_i y_i!$ and (2) give the summand
```math
\frac{n!\,m!\,\prod_{i\lt j}(y_i-y_j)^2}{r!\,\prod_i (y_i!)^2}
\prod_i\frac{y_i}{y_i+r}.
```
All factorial arguments are affine integral forms in $n,u_1,\dots,u_d$. The final product can be written as ratios of factorials and polynomial factors. For each $n$, support is finite: $u_i\ge0$ and $\sum i u_i\le n-d$, or equivalently nonnegative factorial arguments $u_i,r$, with factors $1/u_i!$ paired with $u_i!$ on the natural support. Thus this is a finite, fixed-dimensional proper-hypergeometric factorial multisum with polyhedral bounds. The pure-sum case of the fundamental theorem of [Wilf–Zeilberger, *Inventiones Mathematicae* 108 (1992), §1](https://sites.math.rutgers.edu/~zeilberg/mamarimY/Zeilberger_y1992_p575.pdf) implies P-recursiveness for terminating proper-hypergeometric multisums. The remaining term with at most $d-1$ rows is the same type via the straight tableau formula, padding with zeros and taking differences.

The exact companion check_ode.py evaluates (1)–(2) with integer factorials and tests the literal conjectured third-order equation through degree 110. The residual coefficients in that range vanish exactly. This finite check and the all-orders D-finiteness result do **not** prove that the guessed operator annihilates the complete series.
