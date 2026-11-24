# Weighted complement to the Gawron–Ulas odd-step theorem

This extends the root-filter proof of Gawron–Ulas Conjecture 4.3, not a separate resolution. Let $a\ge3$ be odd, let $b\ge1$ with $\gcd(a,b)=1$, and let $P(X)$ be any nonzero real polynomial. On every infinite arithmetic progression of indices, the weighted signed coefficients
$$
 f_{n,P}=\sum_{\lambda}(-1)^{\ell(\lambda)}P(\ell(\lambda))
$$
have infinitely many positive and infinitely many negative values. The sum is over partitions of $n$ into parts in $b+a\mathbb N$.

Put
$$
 \mathcal F(w,q)=\prod_{j\ge0}(1-wq^{aj+b})^{-1},
 \qquad D=w\frac{\partial}{\partial w}.
$$
The generating function of the coefficients in question is $F_P(q)=(P(D)\mathcal F)(-1,q)$. For each fixed $q$ in the unit disk the product converges locally uniformly near $w=-1$, and there are no poles or zeros there. Its logarithmic $D$-derivatives are sums
$$
 (D^r\log\mathcal F)(-1,q)=
 \sum_{j\ge0} R_r(-q^{aj+b}),
 \qquad
 R_1(z)=\frac{z}{1-z},\quad R_{r+1}(z)=z R_r'(z).
$$
Here $R_r(z)$ is $z$ times a polynomial divided by $(1-z)^r$.

Along any fixed angular approach $q=\eta e^{-\lambda t}$ of the [main proof](PROOF.md) ($\eta$ a root of unity, $\Re\lambda=1$), these logarithmic derivatives grow at most polynomially in $1/t$. Indeed with $p=aj+b$,
$|1+q^p|\ge 1-e^{-bt}\gg_b t$ for small $t>0$, while $\sum_j|q^{aj+b}|=O_{a,b}(t^{-1})$. Thus $D^r\log\mathcal F=O(t^{-r-1})$ for each fixed $r$. The differential identity $D^k\mathcal F/\mathcal F=\mathcal B_k(D\log\mathcal F,\ldots,D^k\log\mathcal F)$ follows by repeated product rules, where each $\mathcal B_k$ is the complete Bell polynomial. Hence multiplying by this factor, or applying any polynomial in $D$, does not increase the exponential growth rates of the unweighted function.

At the strictly dominant oblique root $\eta=\zeta$ from the [main proof](PROOF.md), $\zeta^a=1$ and $\xi=-\zeta^b=e^{i\pi/a}$. The arguments of the rational functions above become $z_j=\xi e^{-\lambda t(aj+b)}$. The function $|1-\xi e^{-\lambda s}|$ on $s\ge0$ is bounded below by a positive constant: it is nonzero at $s=0$ by $\xi\ne1$, at $s>0$ by modulus, and tends to $1$ at infinity. Thus each summand is bounded by a constant times $e^{-t(aj+b)}$, giving the improved estimate $D^r\log\mathcal F=O(t^{-1})$ for every $r$. The first derivative has a nonzero leading constant given by the Riemann sum
$$
 t(D\log\mathcal F)(-1,\zeta e^{-\lambda t})
 \longrightarrow
 \frac1a\int_0^\infty \frac{\xi e^{-\lambda s}}{1-\xi e^{-\lambda s}}\,ds
 =
 -\frac{\log(1-\xi)}{a\lambda}\ne0.
$$
The Riemann sum converges by continuity and an exponentially bounded tail. The integral uses the principal logarithm: the logarithm argument stays in the open right half-plane, and its derivative equals $\lambda\xi e^{-\lambda s}/(1-\xi e^{-\lambda s})$.

If $k=\deg P$ with leading coefficient $p_k$, the unique monomial of $\mathcal B_k$ with $k$ factors is $(D\log\mathcal F)^k$ with coefficient one. All the other monomials have at most $k-1$ factors. Therefore at the chosen root
$$
 \frac{F_P(\zeta e^{-\lambda t})}{\mathcal F(-1,\zeta e^{-\lambda t})}
 \sim
 p_k\left(-\frac{\log(1-\xi)}{a\lambda}\right)^k t^{-k}.
$$
For $k=0$ this is the exact nonzero constant ratio. The factor does not change the exponential scale, so the strictly dominant oblique rate and upper bounds on all other rates are as in the unweighted proof.

Each arithmetic-progression residue filter is a finite combination of rotations of $F_P$. At the selected oblique approach one rotation strictly dominates and at the real point all rotations are bounded by the smaller radial rate. The eventual-one-sign triangle criterion of the [main proof](PROOF.md) therefore gives both signs infinitely often on every progression. In particular this applies to every moment weight $P(X)=X^k$ in the Gawron–Ulas notation.
