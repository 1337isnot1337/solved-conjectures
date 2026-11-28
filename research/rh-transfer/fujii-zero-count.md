# Fujii's conjecture

Status: an independent short proof of the positive-profile asymptotic used in the main argument. This uses the classical zero-counting formula and Fourier inversion for the gamma function. It does not claim a new oscillation principle or an additional named-conjecture solution.

Coordination: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87). The prime-sum normalization, almost-periodic recurrence, and complementary non-GRH case are proved in [fujii.md](fujii.md). The older boundary argument remains in [fujii-boundary.md](fujii-boundary.md).

## 1. Statement

Assume GRH for the Dirichlet beta function. Its nontrivial zeros are rho=1/2+i gamma, counted with multiplicity. There is no real zero: the paired series for beta(sigma) is positive for every real sigma>0.

Define
~~~math
F_\alpha(t)=
-\frac{\Gamma(1/(2\alpha))}{2\alpha}
-\sum_\rho \frac{\Gamma(\rho/\alpha)}{\alpha}e^{i\gamma t},
\qquad \alpha>0.
~~~
For fixed alpha this series converges absolutely and uniformly.

We prove
~~~math
F_\alpha(0)=
\left(\frac12-\frac1{\mathrm e}\right)\log\alpha
+C_\beta
+O\!\left(\frac{\log(\alpha+2)}{\alpha}\right)
\qquad(\alpha\to\infty),
\tag{1}
~~~
where
~~~math
C_\beta=
-1-\sum_{\gamma>0}\frac1{1/4+\gamma^2}
-\frac1\pi\int_0^\infty
   \mathop{\mathrm{Re}}\Gamma(iu)\,
   \log\frac{2u}{\pi}\,du.
\tag{2}
~~~
Both the sum and integral in (2) converge absolutely. No zero independence, simplicity, or numerical zero data are required.

In particular F_alpha(0)>0 for every sufficiently large alpha. Together with the prime-sum normalization and recurrence already proved, this supplies the positive half of the main Fujii theorem.

## 2. The classical zero count

Let N_+(T) count beta zeros with 0<gamma<=T, including multiplicities. The Riemann–von Mangoldt formula gives
~~~math
N_+(T)=M(T)+E(T),\qquad
M(T)=\frac{T}{2\pi}\log\frac{2T}{\pi\mathrm e},
\qquad
E(T)=O(\log(T+2)).
\tag{3}
~~~
Set M(0)=0 and E(0)=0. The bound can be enlarged to hold for every T>=0.

For a primary reference with explicit constants and the precise counting convention, see Bennett, Martin, O'Bryant and Rechnitzer, [Counting zeros of Dirichlet L-functions, Theorem 1.1](https://personal.math.ubc.ca/~bennett/BeMaObRe-MathComp-2021.pdf), Math. Comp. 90 (2021), 1455–1482, DOI 10.1090/mcom/3599. Their N(T,chi) counts both signs of the ordinate. For the real character chi_4, conjugate symmetry and absence of a central zero divide their leading term by two. Only the classical O(log T) remainder is needed here.

This source is preferable to relying on the earlier explicit Trudgian constants, whose proof the 2021 paper corrects. No particular explicit constant enters (1).

## 3. Remove the pole of gamma before summing

Put
~~~math
g(z)=\Gamma(z)-\frac1z,\qquad
G_\varepsilon(u)=\mathop{\mathrm{Re}}g(\varepsilon+iu).
~~~
The singularity of g at zero is removable. Take alpha>=1 and epsilon=1/(2alpha), so 0<epsilon<=1/2.

For u in [0,1], g and its first derivatives are uniformly bounded in the closed strip 0<=Re z<=1/2. For u>=1, the usual gamma estimates in a fixed vertical strip and the elementary rational term give, uniformly in 0<=epsilon<=1/2,
~~~math
|G_\varepsilon(u)|+
|\partial_\varepsilon G_\varepsilon(u)|
\le C\big((1+u)^{-2}+e^{-c u}\big),
\tag{4}
~~~
and
~~~math
|G_\varepsilon'(u)|
\le C\big((1+u)^{-3}+e^{-c u}\big).
\tag{5}
~~~
Here a smaller fixed c>0 absorbs the polynomial and logarithmic factors in Stirling's formula and its derivative. The estimates for u<=1 mean boundedness, and can be included in these displays by increasing C.

For example,
~~~math
\mathop{\mathrm{Re}}\frac1{\varepsilon+iu}
=\frac{\varepsilon}{\varepsilon^2+u^2}.
~~~
Its u derivative is O(u^-3) for u>=1, and its epsilon derivative is O(u^-2). The apparent singularities near zero cancel inside g.

Consequently all the following are bounded uniformly in epsilon:
~~~math
\int_0^\infty |G_\varepsilon(u)|(1+|\log u|)\,du,\qquad
\int_0^\infty |\partial_\varepsilon G_\varepsilon(u)|
 (1+|\log u|)\,du,\qquad
\int_0^\infty |G_\varepsilon'(u)|\log(u+2)\,du.
\tag{6}
~~~

Pairing conjugate zeros is essential in the next identity. It is not a claim that the unpaired sum of 1/rho converges absolutely:
~~~math
\sum_\rho\frac{\Gamma(\rho/\alpha)}{\alpha}
=
\sum_{\gamma>0}\frac1{1/4+\gamma^2}
+
\sum_{\gamma>0}\frac2\alpha
     G_\varepsilon(\gamma/\alpha).
\tag{7}
~~~
Both sums on the right converge absolutely by (3)–(5).

## 4. Stieltjes summation with an explicit vanishing error

Set
~~~math
f_\alpha(T)=\frac2\alpha G_\varepsilon(T/\alpha).
~~~
Equation (3) and Stieltjes integration by parts give
~~~math
\sum_{\gamma>0}f_\alpha(\gamma)
=\int_0^\infty f_\alpha(T)M'(T)\,dT
-\int_0^\infty E(T)f_\alpha'(T)\,dT.
\tag{8}
~~~
The endpoint at zero vanishes because E(0)=0. The endpoint at infinity vanishes because E(T)=O(log(T+2)) and f_alpha(T)=O_alpha(T^-2). The logarithmic singularity of M' at zero is integrable against bounded f_alpha.

Using (5)–(6), the last integral has the bound
~~~math
\begin{aligned}
\left|\int_0^\infty E(T)f_\alpha'(T)\,dT\right|
&\ll \frac1\alpha
 \int_0^\infty \log(\alpha u+2)|G_\varepsilon'(u)|\,du
\\ &\ll \frac{\log(\alpha+2)}{\alpha}.
\end{aligned}
\tag{9}
~~~
The main integral in (8), after T=alpha u, is
~~~math
\frac1\pi\int_0^\infty
 G_\varepsilon(u)\log\frac{2\alpha u}{\pi}\,du
=
\frac{\log\alpha}{\pi}I_\varepsilon
+\frac1\pi J_\varepsilon,
\tag{10}
~~~
where
~~~math
I_\varepsilon=\int_0^\infty G_\varepsilon(u)\,du,\qquad
J_\varepsilon=\int_0^\infty
 G_\varepsilon(u)\log\frac{2u}{\pi}\,du.
~~~

## 5. The sign comes from an exact gamma integral

For every epsilon>0,
~~~math
\Gamma(\varepsilon+iu)
=\int_{-\infty}^\infty
 e^{\varepsilon v-e^v}e^{iuv}\,dv.
~~~
The function of v and its Fourier transform are integrable. Fourier inversion at v=0 and conjugate symmetry give
~~~math
\int_0^\infty\mathop{\mathrm{Re}}\Gamma(\varepsilon+iu)\,du
=\frac{\pi}{\mathrm e}.
~~~
The pole term has integral
~~~math
\int_0^\infty\frac{\varepsilon}{\varepsilon^2+u^2}\,du
=\frac{\pi}{2}.
~~~
Therefore the signed integral is exact and independent of epsilon:
~~~math
I_\varepsilon=
\pi\left(\frac1{\mathrm e}-\frac12\right).
\tag{11}
~~~

At epsilon=0 and u>0, G_0(u)=Re Gamma(iu), since 1/(iu) is purely imaginary. The epsilon-derivative estimate in (6) gives
~~~math
J_\varepsilon
=\int_0^\infty\mathop{\mathrm{Re}}\Gamma(iu)
     \log\frac{2u}{\pi}\,du+O(\varepsilon).
\tag{12}
~~~
Near zero Re Gamma(iu) tends to minus the Euler constant; at infinity it decreases exponentially. This also proves the absolute convergence asserted in (2).

Substitute (9)–(12) into (7). Finally,
~~~math
\frac{\Gamma(1/(2\alpha))}{2\alpha}
=\Gamma(1+1/(2\alpha))
=1+O(1/\alpha).
~~~
The result is exactly (1)–(2).

## 6. Scope and attribution

This proof uses only a classical zero count and gamma Fourier inversion to locate the positive phase. The prime normalization and Bohr recurrence remain necessary to transfer that phase to the original prime sum at arbitrarily large x. Positivity at t=0 is not a claim about the prime sum at x=1.

The same calculation, with conductor q and a separate finite central-zero term, gives the leading coefficient (1/2-1/e)log alpha for each primitive real nonprincipal Dirichlet character under its GRH. This observation is not counted as a separate named target or used to claim an unconditional result for characters that could have a real off-line zero.

Kaczorowski and Ramaré's [Almost periodicity of some error terms in prime number theory](https://www.impan.pl/shop/publication/transaction/download/product/82202), Acta Arith. 106 (2003), Theorem 1, already supplies the general boundary and almost-periodicity framework behind the other proof. Ford and Konyagin's survey also explains the recurrence mechanism. Any novelty claim for this campaign would have to concern the exact application to Fujii's weight family, not the invention of that machinery. Priority is unclaimed pending the separate prior-art audit.
