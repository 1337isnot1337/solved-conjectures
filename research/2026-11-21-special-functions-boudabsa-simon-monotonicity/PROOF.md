# Boudabsa–Simon’s parameter-monotonicity question

**Excluded from new-resolution claims.** A September 17, 2026 manuscript, archived publicly on October 27, already proves the full interior exponential-functional representation used below. Fixing its first parameter and rescaling its subordinator gives the requested monotonicity immediately; the remaining boundary case is already Proposition 1 of the original paper. This valid proof is retained as a documented consequence of prior work, not a new solution. See `LITERATURE.md` for the pinned source and exact transfer.

## Statement and source

Fix $`0<\alpha\leq1`$ and $`l\leq1/\alpha`$. The question in Remark 3 of Boudabsa and Simon, *Some Properties of the Kilbas–Saigo Function*, Mathematics **9** (2021), 217, asks whether

```math
m\longmapsto E_{\alpha,m,m-l}(x),\qquad m>0,
```

is decreasing for every $`x>0`$ and increasing for every $`x<0`$. Proposition 1 of that paper establishes the cases $`l=1`$ and $`l=1/\alpha`$. The same question appeared earlier in Boudabsa, Simon and Vallois, *Fractional extreme distributions*, arXiv:1908.00584v1, Remark 4.10, printed page 30. We use the journal's name and numbering for the target, while crediting that earlier formulation.

The Kilbas–Saigo function is defined here by

```math
E_{\alpha,m,r}(z)
=\sum_{n=0}^{\infty}c_n(\alpha,m,r)z^n,
\qquad
c_0=1,
\qquad
c_n=\prod_{k=0}^{n-1}
\frac{\Gamma(1+\alpha(km+r))}
     {\Gamma(1+\alpha(km+r+1))}.
```

**Theorem.** For the complete parameter range above and every $`0<m_1<m_2`$,

```math
E_{\alpha,m_1,m_1-l}(x)>E_{\alpha,m_2,m_2-l}(x)
\quad (x>0),
```

and

```math
E_{\alpha,m_1,m_1-l}(x)\lt E_{\alpha,m_2,m_2-l}(x)
\quad (x<0).
```

At $`x=0`$ every function equals one. Thus both requested monotonicities hold strictly away from zero.

The proof constructs the whole family as exponential functionals of one subordinator with one independent killing time. The general theory of such functionals, their moment formula, and the gamma-ratio Bernstein function are classical inputs. The moment computation and gamma-ratio integral are included below so that the parameter identification and the coupling can be checked directly.

**Lean status:** none.

## 1. A gamma ratio as a Laplace exponent

First suppose $`0<\alpha<1`$, and set

```math
\phi_\alpha(s)=\frac{\Gamma(s+\alpha)}{\Gamma(s)}
\quad(s>0),\qquad \phi_\alpha(0)=0.
```

We have the Lévy–Khintchine representation

```math
\phi_\alpha(s)=
\int_0^\infty(1-e^{-st})\nu_\alpha(dt),
\qquad
\nu_\alpha(dt)=
\frac{\alpha}{\Gamma(1-\alpha)}
\frac{e^{-\alpha t}}{(1-e^{-t})^{1+\alpha}}\,dt.
\tag{1}
```

Indeed, put $`h(t)=(e^t-1)^{-\alpha}`$. Its derivative satisfies

```math
-h'(t)=\alpha e^{-\alpha t}(1-e^{-t})^{-1-\alpha}.
```

Integration by parts, followed by the substitution $`u=e^{-t}`$, gives, for $`s>0`$,

```math
\begin{aligned}
\int_0^\infty(1-e^{-st})\nu_\alpha(dt)
&=\frac{s}{\Gamma(1-\alpha)}
  \int_0^\infty e^{-st}(e^t-1)^{-\alpha}\,dt
\\ &=\frac{s}{\Gamma(1-\alpha)}
  \int_0^1 u^{s+\alpha-1}(1-u)^{-\alpha}\,du
\\ &=\frac{s\Gamma(s+\alpha)}{\Gamma(s+1)}
 =\phi_\alpha(s).
\end{aligned}
```

The integration-by-parts boundary terms vanish: at zero their size is $`O(t^{1-\alpha})`$, and at infinity $`h(t)\to0`$. The measure in (1) has density of order $`t^{-1-\alpha}`$ at zero and decays exponentially at infinity. Hence

```math
\int_0^\infty(1\wedge t)\nu_\alpha(dt)<\infty,
\qquad \nu_\alpha((0,\infty))=\infty.
```

It therefore defines a driftless subordinator, that is, a nonnegative Lévy process with nondecreasing paths. When $`\alpha=1`$, use instead $`\phi_1(s)=s`$, the Laplace exponent of the deterministic process $`S_t=t`$.

## 2. One process for every value of m

Set

```math
c=1-\alpha l\geq0,
\qquad q=\phi_\alpha(c).
```

For $`0<\alpha<1`$, let $`S=(S_t)_{t\geq0}`$ be the subordinator with Lévy measure $`e^{-ct}\nu_\alpha(dt)`$, zero drift, and no killing. Its Laplace exponent is

```math
\psi_c(s)=\phi_\alpha(c+s)-\phi_\alpha(c),
\qquad
\mathbb E[e^{-sS_t}]=e^{-t\psi_c(s)}.
\tag{2}
```

To check (2), subtract the two versions of (1); the difference of the integrands is $`e^{-ct}(1-e^{-st})`$. For $`\alpha=1`$ let $`S_t=t`$, so the same equation holds with $`\psi_c(s)=s`$ and $`q=c`$.

Independently of $`S`$, take an exponential time $`\zeta`$ with rate $`q`$. When $`q=0`$, define $`\zeta=\infty`$. In every case $`\zeta>0`$ almost surely. The process and killing time depend on $`\alpha,l`$, but do not depend on $`m`$.

For every $`m>0`$ define

```math
I_m=\int_0^\zeta e^{-\alpha m S_t}\,dt.
\tag{3}
```

The next calculation proves both that $`I_m`$ is finite and that its moment-generating function is exactly the required Kilbas–Saigo function.

## 3. Moments and the entire moment-generating function

For every positive integer $`n`$, Tonelli's theorem and symmetry of the integration variables give

```math
\mathbb E[I_m^n]
=n!\int_{0\lt t_1<\cdots\lt t_n}
  \mathbb E\!\left[
     e^{-\alpha m\sum_{j=1}^nS_{t_j}}
     \boldsymbol1_{\{\zeta>t_n\}}
  \right]dt_1\cdots dt_n.
```

Write $`t_0=0`$ and $`u_j=t_j-t_{j-1}`$. Independent increments and (2), together with $`\mathbb P(\zeta>t_n)=e^{-qt_n}`$, turn the expectation into

```math
\prod_{j=1}^n
\exp\!\left[-u_j\phi_\alpha(c+\alpha m(n-j+1))\right].
```

Every exponent coefficient is positive. Integration over $`u_1,\ldots,u_n>0`$ therefore yields

```math
\mathbb E[I_m^n]
=n!\prod_{k=1}^n\frac1{\phi_\alpha(c+\alpha mk)}
=n!\prod_{k=1}^n
\frac{\Gamma(c+\alpha mk)}{\Gamma(c+\alpha mk+\alpha)}.
\tag{4}
```

In particular $`\mathbb E[I_m]=1/\phi_\alpha(c+\alpha m)<\infty`$, so (3) is finite almost surely. Denote the product on the right of (4), without $`n!`$, by $`a_n(m)`$, and put $`a_0(m)=1`$. Stirling's gamma-ratio asymptotic gives

```math
\frac{a_{n+1}(m)}{a_n(m)}
=\frac{\Gamma(c+\alpha m(n+1))}
        {\Gamma(c+\alpha m(n+1)+\alpha)}
\sim (\alpha mn)^{-\alpha}\longrightarrow0.
\tag{5}
```

Thus $`\sum_n a_n(m)z^n`$ converges absolutely for every complex $`z`$. For real $`r\geq0`$, expansion of the nonnegative series and Tonelli give

```math
\mathbb E[e^{rI_m}]
=\sum_{n=0}^\infty\frac{r^n\mathbb E[I_m^n]}{n!}
=\sum_{n=0}^\infty a_n(m)r^n<\infty.
```

Consequently the exponential series can also be integrated term by term for any complex $`z`$, using $`e^{|z|I_m}`$ as an integrable majorant. Since $`c=1-\alpha l`$, reindexing (4) gives

```math
\begin{aligned}
\mathbb E[e^{zI_m}]
&=\sum_{n=0}^\infty a_n(m)z^n
\\ &=\sum_{n=0}^\infty z^n
  \prod_{j=0}^{n-1}
  \frac{\Gamma(1+\alpha(jm+m-l))}
       {\Gamma(1+\alpha(jm+m-l+1))}
\\ &=E_{\alpha,m,m-l}(z).
\end{aligned}
\tag{6}
```

All gamma arguments in these products are positive, including when $`c=0`$.

## 4. Strict pathwise order and the conclusion

The measure $`e^{-ct}\nu_\alpha(dt)`$ has infinite mass when $`0<\alpha<1`$. Equivalently, (2) and (5)'s gamma-ratio asymptotic imply $`\psi_c(s)\to\infty`$ as $`s\to\infty`$. For each fixed $`t>0`$, bounded convergence therefore gives

```math
\mathbb P(S_t=0)
=\lim_{s\to\infty}\mathbb E[e^{-sS_t}]
=\lim_{s\to\infty}e^{-t\psi_c(s)}=0.
```

Intersecting the probability-one events for positive rational $`t`$ and using nondecreasing paths shows that $`S_t>0`$ simultaneously for every $`t>0`$. The same property holds directly for $`\alpha=1`$, since $`S_t=t`$.

There is also a single probability-one event on which $`I_m<\infty`$ for every $`m>0`$: first intersect the finiteness events for positive rational $`m`$, then use $`I_m\leq I_r`$ whenever $`0<r<m`$. On this event, for every $`m_1<m_2`$ and every $`0<t<\zeta`$,

```math
e^{-\alpha m_1S_t}>e^{-\alpha m_2S_t}.
```

Since $`\zeta>0`$, integration gives $`I_{m_1}>I_{m_2}`$ almost surely. For $`x>0`$, applying the strictly increasing function $`u\mapsto e^{xu}`$, taking finite expectations, and using (6) gives the first asserted inequality. For $`x<0`$, the same function is strictly decreasing and gives the second inequality. This proves the question in its full stated range.

## References and priority boundary

1. L. Boudabsa and T. Simon, *Some Properties of the Kilbas–Saigo Function*, Mathematics **9** (2021), 217. [Primary journal article](https://www.mdpi.com/2227-7390/9/3/217), Proposition 1 and Remark 3. [arXiv:2012.05666](https://arxiv.org/abs/2012.05666).
2. L. Boudabsa, T. Simon and P. Vallois, *Fractional extreme distributions*, [arXiv:1908.00584v1](https://arxiv.org/pdf/1908.00584), Remark 4.10, printed page 30. This earlier preprint states the same question. Its subsequent journal version has different length and organization.
3. J. Bertoin and M. Yor, *Exponential functionals of Lévy processes*, Probability Surveys **2** (2005), 191–212, [DOI:10.1214/154957805100000122](https://doi.org/10.1214/154957805100000122). Standard background for the exponential functional and the subordinator moment formula. Formula (4) is derived here rather than claimed as a new general identity.
4. Principia Math In Progress, *The two hyperbolic bounds for the Kilbas–Saigo function*, September 17, 2026, [full source pinned at archive commit 34b8b155d7db464ad7306f70b16d3af9cee34501](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-348998/mathdb-348998-solution.tex). The gamma-ratio exponent, Lévy kernel, exponential-functional representation for all interior parameters, moment calculation, entire moment-generating identity and simultaneous positivity argument are all already present in that manuscript. Its representation makes the present target an immediate prior consequence.

The separate literature file records the searches and inspected later papers. The result above concerns the parameter-monotonicity question only. It does not claim novelty for complete monotonicity of the Kilbas–Saigo function, its special-case stable-subordinator representations, or its hyperbolic bounds.
