# Fujii's conjecture

Independent replacement lemma, 20 November 2026. Main argument: [fujii.md](fujii.md). Unweighted-prime normalization: [fujii-review.md](fujii-review.md). Complementary non-GRH case: [fujii-landau.md](fujii-landau.md). Discussion: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87).

## 1. Purpose

The positive test pairing needed in the beta-GRH branch can be obtained from the local boundary behavior of the explicit formula. This removes the need to invoke Hardy–Littlewood's deep oscillation theorem for the character-weighted von Mangoldt sum.

The previous proof using that oscillation theorem remains a valid independent route. This note gives a shorter route using only the explicit formula, zero conjugation, and absolute convergence of a second-order zero sum.

The use of local boundary behavior followed by almost-periodic recurrence is classical. Kaczorowski's boundary-value method is described in [Ford–Konyagin, Section 4.1, printed pages 12–13](https://ford126.web.illinois.edu/wwwpapers/racefk.pdf). The claim here is the specific application to the exponential-power family; no originality is claimed for the general recurrence principle.

## 2. The reflection identity

Assume GRH for beta(s)=L(s,chi_4). Write its nontrivial zeros as rho=1/2+i gamma, with their multiplicities, and define the tempered distribution

~~~math
R(t)=-1-\sum_\rho\frac{e^{i\gamma t}}{\rho}.
\tag{1}
~~~

The definition is rigorous because, for every Schwartz test function phi, the Fourier transform decays rapidly and

~~~math
\sum_\rho\frac{|\widehat\phi(-\gamma)|}{|\rho|}<\infty.
~~~

The standard bound N_beta(T)=O(T log(T+2)) suffices.

Complex conjugation permutes the zeros and preserves every multiplicity, since beta has real Dirichlet coefficients. Reflection of a distribution is defined by pairing it with phi(-t). Reindexing the reflected zero sum by rho maps to its conjugate therefore gives

~~~math
\begin{aligned}
R(t)+R(-t)
&=-2-\sum_\rho e^{i\gamma t}
 \left(\frac1\rho+\frac1{\overline\rho}\right)\\
&=-2-\sum_\rho\frac{e^{i\gamma t}}{|\rho|^2}.
\end{aligned}
\tag{2}
~~~

The second equality uses rho+conjugate(rho)=1, which is where beta GRH enters this identity.

Every step in (2) is valid in the space of tempered distributions: the series of test pairings converges absolutely, so reindexing is allowed. Multiplicities are neither discarded nor divided by two.

Set

~~~math
A(t)=\sum_\rho\frac{e^{i\gamma t}}{|\rho|^2},
\qquad
B=\sum_\rho\frac1{|\rho|^2}.
\tag{3}
~~~

The zero count implies B<infinity. For example, dyadic intervals give a convergent majorant of size sum_j (j+1)2^(-j). The finitely many zeros in a bounded region cause no problem, since rho is never zero.

Thus A is an ordinary continuous real even function, its series converges absolutely and uniformly, and |A(t)|<=B for all real t. Equation (2) becomes

~~~math
R(-t)=-2-A(t)-R(t).
\tag{4}
~~~

No convergence claim is made for the original undamped zero sum pointwise at t=0.

## 3. The two one-sided singularities

Put c_0=beta'(0)/beta(0). The odd-character explicit formula is

~~~math
\psi_\chi(x)
=-\sum_\rho\frac{x^\rho}{\rho}
-c_0+\frac12\log\frac{x+1}{x-1},
\qquad x>1,
\tag{5}
~~~

with the usual distributional interpretation at prime-power jumps. Here

~~~math
\psi_\chi(x)=\sum_{n\le x}\chi_4(n)\Lambda(n).
~~~

The trivial zeros at -1,-3,-5,... give the positive logarithmic term in (5), since their contribution is

~~~math
\sum_{j\ge0}\frac{x^{-2j-1}}{2j+1}
=\frac12\log\frac{x+1}{x-1}.
~~~

For 0<t<log 3, the character-weighted prime-power sum is zero. Hence (5) gives an ordinary smooth representative of R on that interval:

~~~math
R(t)=-1+e^{-t/2}
 \left[c_0-\frac12\log\frac{e^t+1}{e^t-1}\right].
\tag{6}
~~~

As t decreases to zero,

~~~math
\log\frac{e^t+1}{e^t-1}
=\log\frac2t+O(t^2).
~~~

Since t log(1/t) tends to zero, (6) yields

~~~math
R(t)
=-\frac12\log\frac1t
+c_0-1-\frac12\log2+o(1)
\longrightarrow-\infty.
\tag{7}
~~~

Now apply (4). Because A(t) tends to B, it gives

~~~math
R(-t)
=\frac12\log\frac1t
-1-B-c_0+\frac12\log2+o(1)
\longrightarrow+\infty
\qquad(t\downarrow0).
\tag{8}
~~~

This also proves that R has a locally integrable representative on the negative punctured interval (-log 3,0): equation (4) represents it there by a continuous bounded function plus the reflected function in (6). In fact the representative is continuous away from zero. The logarithmic singularity is locally integrable, although no assertion about a distribution supported exactly at zero is needed for this proof.

The signs are explicit: R tends to minus infinity from the positive side, and to plus infinity from the negative side.

## 4. The positive test pairing

By (8), there is delta>0 such that R is strictly positive throughout the interval (-delta,-delta/2). Choose a nonnegative, nonzero smooth test function phi compactly supported inside that interval. Then

~~~math
\langle R,\phi\rangle>0.
\tag{9}
~~~

For alpha>0 let

~~~math
F_\alpha(t)
=-\frac{\Gamma(1/(2\alpha))}{2\alpha}
-\sum_\rho\frac{\Gamma(\rho/\alpha)}{\alpha}e^{i\gamma t}.
\tag{10}
~~~

For fixed alpha this is a continuous real Bohr almost-periodic function, by the exponential decay of Gamma in the zero height. The companion review proves

~~~math
F_\alpha\longrightarrow R
\quad\hbox{in }\mathcal D'(\mathbb R)
\qquad(\alpha\to\infty).
\tag{11}
~~~

The convergence is on the whole real line. For completeness, the uniform coefficient bound for alpha>=1 is

~~~math
\left|\frac{\Gamma(\rho/\alpha)}{\alpha}\right|
=\frac{|\Gamma(1+\rho/\alpha)|}{|\rho|}
\le\frac{\Gamma(1+1/(2\alpha))}{|\rho|}
\le\frac C{|\rho|}.
~~~

Together with the Fourier decay of a compactly supported smooth test function, this justifies dominated convergence in the zero sum.

Equations (9)–(11) show that for every sufficiently large alpha,

~~~math
\int_{\mathbb R}F_\alpha(t)\phi(t)\,dt>0.
~~~

Each such fixed F_alpha therefore has a positive value at a point in the negative interval supporting phi.

This is a statement about the zero-series function F_alpha. It is not an application of the large-x prime-sum asymptotic at a negative logarithmic argument.

## 5. Moving the positive phase to large positive arguments

Fix one of the alpha values selected in Section 4. Suppose F_alpha(t_0)>2epsilon for some epsilon>0. Uniform almost periodicity provides arbitrarily large positive shifts tau such that

~~~math
\sup_t|F_\alpha(t+\tau)-F_\alpha(t)|<\epsilon.
~~~

Therefore F_alpha(t_0+tau)>epsilon at arbitrarily large positive arguments.

Only at those large positive arguments do we apply the independently proved normalization

~~~math
\frac{\log x}{\sqrt x}S_\alpha(x)
=F_\alpha(\log x)+o_\alpha(1).
\tag{12}
~~~

It follows that S_alpha(x) is at least a fixed positive multiple of sqrt(x)/log x along a sequence tending to infinity. This refutes its proposed negative limit for every sufficiently large fixed alpha under beta GRH.

The negative subsequence follows from the negative mean of F_alpha, as in the main argument. Alternatively, (7) supplies a negative compact test pairing and (11) gives a negative value for every sufficiently large alpha; recurrence then gives both signs without calculating the mean. The negative-mean argument additionally handles every positive alpha.

No linear independence of zero ordinates is used. No simultaneous limiting process in alpha and x is used.

## 6. Attribution and prior-art check

The local-boundary strategy is related directly to Kaczorowski's classical method, rather than being a newly invented principle. The following sources were checked:

- [Ford and Konyagin's survey](https://ford126.web.illinois.edu/wwwpapers/racefk.pdf), Section 4.1, explains recurrence of finite-argument orderings from Bohr and Stepanov almost periodicity and explicitly describes locating those orderings near zero.
- [Kaczorowski and Ramaré, Almost periodicity of some error terms in prime number theory](https://www.impan.pl/shop/publication/transaction/download/product/82202), Acta Arithmetica 106 (2003), 277–297, develops the corresponding boundary functions and their distribution. No Fujii or exponential-power all-alpha conclusion was found in the full paper.
- Suzuki's [2011/2012 introduction](https://arxiv.org/pdf/1204.1823) and [corrected 2025 Section 1.2](https://link.springer.com/article/10.1007/s11139-025-01238-9) independently record Fujii's proposed all-alpha extension, without giving this disproof.

Directed searches for Fujii with Chebyshev, boundary, singularity, reflection, and Kaczorowski did not locate an earlier statement applying the boundary obstruction to Fujii's exponential-power family. The source and novelty limitations in the main files remain: the original 1988 paper has not been read directly, and absence from these searches does not establish priority.

The reflection identity, both signs in (7)–(8), the local representative on the negative interval, and the use of a negative-support test function were independently checked by a second research agent before this checkpoint.

This is a replacement lemma within the same named-conjecture argument, not an additional solved-target count.
