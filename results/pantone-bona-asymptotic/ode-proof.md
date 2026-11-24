# The exact Bóna–Pantone differential equation for $A_{5,5}$

In [§6.4 of Bóna–Pantone, *Permutations avoiding sets of patterns with long monotone subsequences*](https://arxiv.org/html/2103.06918v2#S6.SS4), the authors print a specific differential equation guessed from enumerated terms. We prove that exact equation for
$$
A(z)=\sum_{n\ge0}|\operatorname{Av}_n(12354,12453,13452,23451)|z^n.
$$
This supplements the separate proof of their numbered asymptotic Conjecture 6.4. No coefficient extrapolation is used. The computer part only checks explicit rational-function identities; the portable verifier is [certify_ode.py](certify_ode.py), tested with SymPy 1.14. [check_ode.py](check_ode.py) is a separate finite sanity check, not needed for the proof.

## 1. From the double sum to an algebraic residue

Write $C(z)=(1-\sqrt{1-4z})/(2z)$, $C_j=[z^j]C(z)$, and $\Theta_s=s\,d/ds$. Put
$$
 G(z)=z^3\frac{d^3}{dz^3}\big(z^3 A(z)\big).
$$
In the [reduced double sum](double-sum.md), multiply by $(n+1)(n+2)(n+3)$; put $t+q=n+3$ and $i=a-1$. The outer factor becomes
$$
\frac{1}{2}\binom{t+q}{t}\frac{t}{2t-3}\binom{2t-2}{t-1}
=\binom{t+q}{t}\,t C_{t-2}.
$$
Also $\beta_t\,t C_{t-2}=t(t-2)(t-1)C_{t-3}$. Define
$$
\begin{aligned}
U(s)&=\Theta_s\big(s^2(C(s)-1)\big),&
V(s)&=\Theta_sU(s),\\
W(s)&=\Theta_s(\Theta_s-2)(\Theta_s-1)\big(s^3C(s)\big).
\end{aligned}
$$
These give respectively the $t$-series for $tC_{t-2}$, $t^2C_{t-2}$, and $t(t-2)(t-1)C_{t-3}$, all starting at $t=3$.

For $x$ the auxiliary variable and $y$ a marker for $i$, put
$$
 B=1+y(1+x),\quad T=1-zB,\quad s=\frac{z(1+x)}x,\quad
 \Phi_J=\frac{T^{-1}J(s/T)-J(s)}{B},\quad \mathcal E=y\,\partial_y+1 .
$$
Indeed $\binom{i+t-2}{t-3}=[x^{t-3}](1+x)^{i+t-2}$, and summing $\binom{q-1}{i}(y(1+x))^i$ in $i$ gives $B^{q-1}$. Then
$$
 \sum_{q\ge1}\binom{t+q}{t}z^q B^{q-1}
 =\frac{T^{-t-1}-1}{B}.
$$
Each occurrence of $a=i+1$ in the double sum corresponds to $\mathcal E$. Thus its ordinary generating function after the multiplication is
$$
 G(z)=z^3(z^3 C(z))'''
 +\operatorname{Res}_x
   \left.\frac{x^2}{(1+x)^2}
     \big(\mathcal E^2\Phi_U-\mathcal E\Phi_V+\Phi_W\big)\right|_{y=1}.
 \tag{1}
$$
Here $\operatorname{Res}_x$ extracts $x^{-1}$, expanding first in $z$ and then in $x$ at zero. Equivalently, for sufficiently small $z$ use the contour integral over a fixed sufficiently small circle around $x=0$, divided by $2\pi i$. All expansions in the derivation converge uniformly on this circle for $y$ near $1$ and $z$ near $0$. The factor $x^2/(1+x)^2$ in (1) is $x^3/(1+x)^2$ from the coefficient extraction divided by $x$ to convert constant term to residue.

## 2. Rational reduction and the elliptic periods

Let
$$
 P=x(1-z(2+x))\big(x(1-z(2+x))-4z(1+x)\big),\qquad
 Q=x\big(x-4z(1+x)\big).
$$
Use the square roots that tend to $x$ as $z$ tends to zero on the contour. After substituting the Catalan expression in $U,V,W$, the integrand in (1) is the sum of a rational function, $f_{\rm ell}\sqrt P$, and $f_{\rm gen}\sqrt Q$, where $f_{\rm ell},f_{\rm gen}\in\mathbb Q(z,x)$. The square roots come from $J(s/T)$ and $J(s)$, respectively. In evaluating the $y$-derivatives of the first radical one must use the $y$-dependent polynomial $xT(xT-4z(1+x))$ before setting $y=1$. The script gives all rational coefficients in compact differentiated form and checks that the rational lane has denominator $(xz+2z-1)^5$. That lane has zero residue.

For any $D\in\{P,Q\}$, a term $b_x+bD_x/(2D)$ in the rational factor is the divided derivative $(b\sqrt D)_x/\sqrt D$ and makes no contribution to the residue. The script checks exactly the reductions
$$
\begin{aligned}
f_{\rm ell}&\equiv c_0+c_1x+c_2x^2+\frac{b}{x+2}
       &&\text{modulo }F_x+FP_x/(2P),\\
f_{\rm gen}&\equiv a-\frac{b}{x+2}
       &&\text{modulo }F_x+FQ_x/(2Q).
\end{aligned}\tag{2}
$$
For reproducibility, every reduction in the script is only a linear polynomial calculation. Given the denominator $D_0=\prod p_i^{m_i}$ with displayed branch and nonbranch factors, write $H=\prod p_i^{m_i-1}$ and the unknown primitive as $N/H$. For $N=\sum_j N_jx^j$, the $j$-th primitive column in the identity cleared by $D_0$ is
$$
 j x^{j-1}\frac{D_0}{H} + x^j\frac{D_0}{H}
 \left(\frac{D_x}{2D}-\sum_i(m_i-1)\frac{(p_i)_x}{p_i}\right).
$$
The remaining columns come from the proper normal basis $1,x,\ldots,x^{\deg_x D-2},(x+2)^{-1}$ multiplied by $D_0$. The exact solver then independently substitutes its solution back in the rational identity. Use of this finite certificate is not an assumption that an arbitrary integrand admits reduction with these bounds.

Write $R=\sqrt{1-4z}$, $S=\sqrt{1-2z}$, each positive at $z=0$. The genus-zero normal form in (2) has residue
$$
 -2z^2a/R^3+2bR+2bz/R-2bS.
$$
To see this, enlarge the contour enclosing the two branch points near zero. At infinity the chosen branch has expansion $xR-2z/R-2z^2/(R^3x)+O(x^{-2})$. Subtract the additional pole at $x=-2$; the branch there is $-2S$, since it tends to $-2$ as $z\to0$. The genus-zero terms with $R$ exactly cancel $z^3(z^3 C(z))'''$; this is a rational identity after division by $R$, checked in the verifier.

Define four elliptic periods
$$
 I_j=\operatorname{Res}_x x^j\sqrt P\quad(0\le j\le2),\qquad
 I_*=\operatorname{Res}_x\frac{\sqrt P}{x+2}.
$$
Then (1) is exactly
$$
 G=c_0 I_0+c_1 I_1+c_2 I_2+b(I_*-2S).
 \tag{3}
$$
Their derivative matrix over $\mathbb Q(z)$ is computed and checked by applying the same reduction to $x^jP_z/(2P)$ or $P_z/(2P(x+2))$, since the contour is fixed. Adjoin the states $S$ and $1$, with derivatives $S/(2z-1)$ and $0$.

## 3. Exact intertwining and the integration constants

The following rational combination of these residues is the generating function itself:
$$
\begin{aligned}
\widehat A={}&
\frac{12z^4-236z^3+201z^2-57z+5}{24z^4(2z-1)}I_0
+\frac{120z^3-494z^2+259z-35}{48z^3(2z-1)}I_1\\
&+\frac{30z^2-85z+25}{48z^2(2z-1)}I_2
+\frac{2z+3}{8z^2}(I_*-2S)+\frac{z+1}{3z^2}.
\end{aligned}
$$
Let $L$ be the printed Bóna–Pantone operator: its coefficients, in order of ascending derivative, are
$$
\begin{aligned}
p_0&=200z^5-700z^4+716z^3-329z^2+76z-8,\\
p_1&=z(2z-1)(800z^4-1850z^3+1277z^2-339z+28),\\
p_2&=z^2(2z-1)(650z^4-1375z^3+909z^2-227z+16),\\
p_3&=z^3(z-1)(5z-2)(10z-1)(2z-1)^2 .
\end{aligned}
$$
Using the derivative matrix, the verifier obtains $\widehat A',\widehat A'',\widehat A'''$ as rational coefficient rows relative to $(I_0,I_1,I_2,I_*,S,1)$. It checks exactly in $\mathbb Q(z)^6$ that
$$
 z^3(z^3\widehat A)''' = G,\qquad L\widehat A=-2(5z-2)^2.
 \tag{4}
$$
The first equality uses the explicit row of (3); the second is the exact guessed differential equation.

It remains to show $A=\widehat A$; (4) and the definition of $G$ leave only a linear combination of $z^{-3},z^{-2},z^{-1}$ in their difference. The series $A$ has coefficients $1,1,2$ at degrees $0,1,2$, because the forbidden patterns have length five. Direct substitution of these coefficients into the polynomial operator gives $LA=-8+40z-50z^2+O(z^3)$: higher input coefficients cannot affect those outputs as $p_j$ is divisible by $z^j$. Now
$$
\begin{aligned}
L(z^{-1})&=-11+46z-50z^2,\\
L(z^{-2})&=-13+74z-100z^2,\\
L(z^{-3})&=4z^{-3}-101z^{-2}+640z^{-1}-1660+2000z-1000z^2.
\end{aligned}
$$
These are linearly independent already in degrees $-3,\ldots,2$. Since $L(\widehat A-A)$ vanishes there by (4), all three constants are zero. Thus $A$ satisfies the exact equation as printed. $\square$

Attribution: the equation is Bóna and Pantone's prediction, in their §6.4. The proof uses the exact RSK hook ratio and the separate reduction in [double-sum.md](double-sum.md), followed by the algebraic residue certificate above. A search by title, basis, ODE coefficients, and exact section did not locate a published proof as of 24 November 2026; priority beyond the checked sources is not asserted.
