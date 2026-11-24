# Chaudhary–Khmiri–Mazhouda conjecture

Research date: 20 November 2026. [Issue #124](https://github.com/1337isnot1337/solved-conjectures/issues/124). Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Exact statement and result

M. P. Chaudhary, J. Khmiri, and K. Mazhouda, *A note on the behavior of the Li coefficients for automorphic L-functions*, **Journal of Classical Analysis 28** (2026), 107–119, [publisher record](https://jca.ele-math.com/28-07/A-note-on-the-behavior-of-the-Li-coefficients-for-automorphic-L-functions), [original PDF](https://files.ele-math.com/articles/jca-28-07.pdf), DOI 10.7153/jca-2026-28-07, state the following conjecture on printed page 116:

> The coefficients \(\operatorname{Re}(\lambda_\pi(n))\) are positive and increasing in \(n\).

The scope is fixed on pages 108–110: \(L(s,\pi)\) is attached to an irreducible unitary cuspidal representation of \(\mathrm{GL}_N\) over \(\mathbb Q\), and
\[
\lambda_\pi(n)=\sum_{\rho\in Z(\pi)}^*
 \left[1-\left(1-\frac1\rho\right)^n\right]. \tag{1}
\]
The star means a symmetric cutoff in the imaginary parts of the zeros, with multiplicities included. The paper imposes no condition that the central character be trivial on the positive real norm subgroup. Its displayed analytic class allows complex gamma parameters.

**Theorem.** Let \(\chi=\chi_{-3}\) be the primitive odd real Dirichlet character modulo \(3\), and let \(\pi_8\) be its unitary norm twist with
\[
L(s,\pi_8)=L(s+8i,\chi).
\]
Then
\[
\boxed{\quad
\operatorname{Re}\lambda_{\pi_8}(2)
-\operatorname{Re}\lambda_{\pi_8}(1)<-\frac32.
\quad} \tag{2}
\]
Consequently the full universal monotonicity conjecture is false.

The proof is unconditional. It uses no zero table, numerical RH verification, zero simplicity, or unknown automorphic GRH. A finite calculation is enclosed by exact rational interval arithmetic and explicit analytic remainder estimates. This is a counterexample to the full universal statement, not a claim about a restricted collection of numerical cases.

The associated [certificate](verify.py) uses standard Python integers and rational numbers only. It does not call a floating-point special-function library.

## 1. Why the example is in the stated class

Define
\[
\chi(n)=
\begin{cases}
0,&3\mid n,\\
1,&n\equiv1\pmod3,\\
-1,&n\equiv2\pmod3.
\end{cases}
\]
Its Hecke character is a one-dimensional unitary cuspidal automorphic representation. Multiplication by the unitary idele norm character \(|\cdot|^{8i}\) preserves these properties. In the usual convention this gives \(L(s,\pi_8)=L(s+8i,\chi)\).

This is an ordinary unitary twist. For the general definition and its effect on \(L\)-functions, see the discussion of analytic Tate twists in D. Ramakrishnan, [*Irreducibility and cuspidality*](https://www.its.caltech.edu/~dinakar/papers/drama-kor2.pdf), §1.2. A [primary Oxford thesis discussion](https://ora.ox.ac.uk/objects/uuid%3A0cdd341f-c4ef-4e5e-9b7e-747a5548a198/files/drv042t916), §2.3.2, explicitly states both preservation of unitarity and \(L(s,\pi[it])=L(s+it,\pi)\), while distinguishing a separately imposed normalization from the general class.

Here the finite conductor is \(3\), the archimedean parameter in the conjecture's notation is
\[
k_1=1+8i,
\]
and the finite Euler factors are
\[
(1-\chi(p)p^{-8i}p^{-s})^{-1}.
\]
The Dirichlet series and logarithmic derivative converge absolutely for \(\operatorname{Re}s>1\). The function is entire because \(\chi\) is nonprincipal.

The analytic axioms on page 109 of the original paper also hold directly: \(\lambda_1=1/2\), \(\mu_1=1/2+4i\), so
\[
\operatorname{Re}\mu_1=\frac12>-\frac14,\qquad
\operatorname{Re}(\lambda_1+2\mu_1)=\frac32>0.
\]
The usual functional equation and finite-order continuation follow from those of the primitive Dirichlet \(L\)-function. No normalization excluding this twist appears in the conjecture's stated hypotheses.

## 2. Reduction to a local logarithmic derivative

Use the completed Dirichlet function
\[
\Lambda(w)=
 \left(\frac3\pi\right)^{(w+1)/2}
 \Gamma\left(\frac{w+1}{2}\right)L(w,\chi).
\]
For this primitive odd character, \(\Lambda\) is entire of order one and satisfies
\[
\Lambda(w)=\Lambda(1-w),\qquad
\overline{\Lambda(\overline w)}=\Lambda(w).
\]
Put \(F(s)=\Lambda(s+8i)\). Its zeros are those used in (1). Its completion differs from the paper's conductor/gamma normalization only by the nonzero constant \(3^{(1+8i)/2}\), which does not affect zeros or logarithmic derivatives.

Thus
\[
F(s)=\overline{F(1-\overline s)}. \tag{3}
\]
In particular the multiset of zeros is invariant under \(\rho\mapsto1-\overline\rho\). All its zeros are in \(0<\operatorname{Re}\rho<1\). Nonvanishing at \(s=1\), also certified below, implies nonvanishing at \(s=0\) by (3).

We justify the real-part identity carefully, without assuming that the Hadamard constant is real. Write the genus-one Hadamard product as
\[
F(s)=e^{a+bs}\prod_\rho
 \left(1-\frac{s}{\rho}\right)e^{s/\rho}.
\]
If \(H=\log F\) locally, then
\[
H'(s)=b+\sum_\rho
 \left(\frac1{s-\rho}+\frac1\rho\right),\qquad
H''(s)=-\sum_\rho\frac1{(s-\rho)^2}. \tag{4}
\]
The displayed paired sum at \(s=1\) converges absolutely. The real parts of \(\sum1/\rho\) also converge absolutely, since the real parts of the zeros are bounded and the zero count is \(O(T\log(T+2))\).

Equation (3) gives \(H'(1)=-\overline{H'(0)}=-\overline b\). The zero symmetry gives
\[
\operatorname{Re}\sum_\rho\frac1{1-\rho}
=\operatorname{Re}\sum_\rho\frac1\rho.
\]
Taking real parts in (4) at \(1\), therefore,
\[
-\operatorname{Re}b
=\operatorname{Re}b+
 2\operatorname{Re}\sum_\rho\frac1\rho.
\]
It follows that
\[
\operatorname{Re}H'(1)
=\operatorname{Re}\sum_\rho\frac1\rho,\qquad
\operatorname{Re}H''(1)
=-\operatorname{Re}\sum_\rho\frac1{\rho^2}. \tag{5}
\]
Expanding (1) at \(n=1,2\) now yields
\[
\operatorname{Re}(\lambda_{\pi_8}(2)-\lambda_{\pi_8}(1))
=\operatorname{Re}(H'(1)+H''(1)). \tag{6}
\]
This is also the real-part specialization of Lagarias's coefficient identities, [*Li coefficients for automorphic L-functions*](https://www.numdam.org/articles/10.5802/aif.2311/), Lemma 4.1. The argument above accounts explicitly for the contragredient and possible imaginary constant.

Let
\[
s_0=1+8i,\quad z_0=1+4i,\quad
L_j=L^{(j)}(s_0,\chi)\quad(j=0,1,2).
\]
Logarithmic differentiation gives the exact target expression
\[
D=\frac12\log\frac3\pi
 +\frac12\operatorname{Re}\psi(z_0)
 +\frac14\operatorname{Re}\psi'(z_0)
 +\operatorname{Re}\left(
 \frac{L_1}{L_0}+\frac{L_2}{L_0}
 -\left(\frac{L_1}{L_0}\right)^2\right). \tag{7}
\]
Here \(\psi=\Gamma'/\Gamma\), and \(D\) is the left side of (2).

## 3. An explicit approximation to \(L\) and its derivatives

Use Euler–Maclaurin with two Bernoulli terms on each of the two residue classes. Set
\[
M=32,\qquad a=97,\qquad b=98,
\]
and define the finite analytic expression
\[
\begin{aligned}
U(s)={}&
 \sum_{k=0}^{31}\big((3k+1)^{-s}-(3k+2)^{-s}\big)\\
&+\frac{a^{1-s}-b^{1-s}}{3(s-1)}
 +\frac12(a^{-s}-b^{-s})\\
&+\frac{s}{4}(a^{-s-1}-b^{-s-1})\\
&-\frac{3s(s+1)(s+2)}{80}
 (a^{-s-3}-b^{-s-3}).
\end{aligned} \tag{8}
\]
The apparent singularity at \(1\) in this expression is removable; our calculation occurs near \(1+8i\).

For \(\sigma=\operatorname{Re}s>-3\), the remainder from each residue tail beginning at \(c=a\) or \(b\) is bounded by
\[
|R_c(s)|\le
 \frac{3^3}{720}|s(s+1)(s+2)(s+3)|
 \frac{c^{-\sigma-3}}{\sigma+3}. \tag{9}
\]
For completeness, this follows from the Euler–Maclaurin integral with the periodic Bernoulli polynomial \(B_4\). On \([0,1]\),
\[
B_4(x)=x^4-2x^3+x^2-\frac1{30},
\qquad |B_4(x)|\le\frac1{30}.
\]
Dividing by \(4!=24\), changing from a unit-step progression to step \(3\), and integrating \(t^{-\sigma-4}\) gives (9).

On the closed disk \(|s-s_0|\le1/4\),
\[
\sigma\ge\frac34,\qquad
|s|<9,\quad|s+1|<10,\quad|s+2|<11,\quad|s+3|<12.
\]
Since \(c\ge97\ge81\), we also have \(c^{3/4}\ge27\). Therefore
\[
|R_c(s)|<
 \frac{27\cdot11880}{720\cdot(15/4)}
 \frac1{27c^3}
=\frac{22}{5c^3}.
\]
Summing the two residue remainders,
\[
|L(s,\chi)-U(s)|
<\frac{44}{5\cdot97^3}<\frac1{100000}. \tag{10}
\]
The difference is analytic on the disk. Cauchy's derivative estimate at its center gives
\[
\begin{aligned}
|L_0-U(s_0)|&<10^{-5},\\
|L_1-U'(s_0)|&<4\cdot10^{-5},\\
|L_2-U''(s_0)|&<32\cdot10^{-5}.
\end{aligned} \tag{11}
\]
These bounds are independent of RH and do not rely on asymptotic truncation heuristics.

The certificate differentiates (8) by exact product rules for the value and first two full derivatives. For \(c^{-s}\), these three entries at \(s_0\) are
\[
c^{-s_0},\qquad-(\log c)c^{-s_0},
\qquad(\log c)^2c^{-s_0}.
\]
The jet of \(1/(s-1)\) is
\[
-\frac i8,\qquad \frac1{64},\qquad\frac i{256}.
\]
The errors in (11) are then added to both real and imaginary coordinates. Bounding a complex error of modulus at most \(e\) by a rectangle of coordinate radius \(e\) is conservative.

## 4. Gamma terms and elementary constants

The standard convergent partial-fraction expansions of the digamma function give
\[
\operatorname{Re}\psi(1+4i)
=-\gamma+\sum_{k=1}^{\infty}\frac{16}{k(k^2+16)}, \tag{12}
\]
and
\[
\operatorname{Re}\psi'(1+4i)
=\sum_{k=1}^{\infty}\frac{k^2-16}{(k^2+16)^2}. \tag{13}
\]
They also follow by differentiating the Weierstrass product for \(\Gamma\); Lagarias's paper displays the relevant digamma expansion in equation (4.19).

Take \(K=100\). The summand in (12) is positive and decreasing. Its tail after \(K\) lies between
\[
\frac12\log\left(1+\frac{16}{(K+1)^2}\right)
\quad\text{and}\quad
\frac12\log\left(1+\frac{16}{K^2}\right). \tag{14}
\]
For \(k>K\), the summand in (13) is also positive and decreasing. Its derivative has the sign of \(48-k^2\). Its tail lies between
\[
\frac{K+1}{(K+1)^2+16}
\quad\text{and}\quad
\frac{K}{K^2+16}. \tag{15}
\]
Both pairs of bounds are the ordinary integral comparison for a decreasing positive function.

Euler's constant is enclosed using only a finite harmonic sum:
\[
H_{1000}-\log1000-\frac1{1000}
<\gamma<H_{1000}-\log1000. \tag{16}
\]
The integral comparison defining \(\gamma\) proves these inequalities.

The certificate computes \(\pi\) from Machin's identity
\[
\pi=16\arctan(1/5)-4\arctan(1/239),
\]
using fifty terms of each alternating series and its next-term bound.

For positive rational \(x\), it reduces \(x\) by powers of \(2\) to \(1\le x\le2\), and uses
\[
\log x=2\sum_{j=0}^{79}\frac{y^{2j+1}}{2j+1}+r,
\qquad y=\frac{x-1}{x+1},
\]
with
\[
0\le r\le\frac{9}{4\cdot161\cdot3^{161}}. \tag{17}
\]
This bounds the positive geometric tail for \(0\le y\le1/3\).

For \(e^{ix}\) in (8), the certificate evaluates the Taylor polynomial of degree \(31\) at \(ix/512\), then squares nine times. All inputs satisfy \(|x/512|\le1/8\). Before squaring, the complex remainder has modulus at most
\[
\frac{2}{8^{32}32!}. \tag{18}
\]
The factor \(2\) bounds \(e^{1/8}\). Rectangular interval multiplication encloses each subsequent squaring.

## 5. Exact certificate and conclusion

Every interval endpoint is an integer multiple of \(2^{-180}\). Addition, subtraction, multiplication, and division round outward using integer floor and ceiling division. Rational constants are likewise enclosed outward. There are no machine floating-point operations in the certificate.

Running
\[
\texttt{python3 results/chaudhary-khmiri-mazhouda/verify.py}
\]
returns the following outer decimal intervals. The decimals here denote exact terminating rationals.

| Quantity | Real part | Imaginary part |
|---|---|---|
| \(L_0\) | \([0.416416149624,\ 0.416436149625]\) | \([-0.103826348535,\ -0.103806348534]\) |
| \(L_1\) | \([0.608547213441,\ 0.608627213442]\) | \([-0.059531344748,\ -0.059451344747]\) |
| \(L_2\) | \([-0.752888883501,\ -0.752248883500]\) | \([0.182952382430,\ 0.183592382431]\) |

In particular \(L_0\ne0\), so the divisions in (7) are valid. The first three, gamma-factor terms of (7) together lie in
\[
[\,0.680255755273,\ 0.680788259534\,].
\]
Substitution with outward interval arithmetic gives
\[
D\in
[\, -1.660157075630,\ -1.655616272869\,].
\tag{19}
\]
The script checks the stronger, simple rational comparison
\[
D<-\frac32<0
\]
directly at its internal integer endpoints. Equations (6)–(7) prove (2).

A universal assertion of monotonicity fails when two consecutive terms decrease for a single admissible representation. Thus (2) refutes the original full conjecture. No extrapolation from finitely many computed coefficients is involved.

## 6. Relation to the accepted RH work

The accepted source repository's rational Dirichlet-GRH theorem implies GRH for the untwisted \(L(s,\chi_{-3})\). A vertical shift preserves real parts of zeros, so it also implies GRH for \(L(s,\pi_8)\). The counterexample therefore persists under the source's accepted conclusions.

The proof of the decrease itself does not need GRH. This distinguishes positivity of the real Li coefficients, which is the GRH criterion, from monotonicity, which is an additional assertion. The source theorem cannot supply that extra assertion because the assertion is false in the conjecture's full class.

The mechanism is visible in the zero formula: a zero near the central point contributes positively to the first coefficient and can contribute less to the second. The proof uses the local derivative formula and analytic bounds, so it does not assume any zero location to establish the counterexample.

## 7. Sources and prior-art audit

### Primary statement and scope

The complete original publisher PDF was downloaded and its text inspected, including pages 108–110 and 116–117. The full statement occurs on page 116; the definition (1) is equation (4) on page 110. The paper's Remark 3 adds a sufficient positivity hypothesis for a second-difference sum. That hypothesis is not a hypothesis of the conjecture.

The definition on page 108 ranges over irreducible unitary cuspidal representations. The displayed conditions on complex gamma parameters on page 109 are satisfied by \(1+8i\). The scope does not impose triviality of the central character on the positive norm subgroup.

### Related work checked

- **J. C. Lagarias**, *Li coefficients for automorphic L-functions*, *Annales de l'Institut Fourier* **57** (2007), 1689–1740, [published article](https://www.numdam.org/articles/10.5802/aif.2311/), [preprint](https://arxiv.org/pdf/math/0404394). Its positivity criterion and logarithmic-derivative identities are established inputs, not new claims here.
- **K. Mazhouda**, *On the Li coefficients for the Dirichlet L-functions*, *Monatshefte für Mathematik* **170** (2013), 405–423, DOI [10.1007/s00605-012-0436-3](https://doi.org/10.1007/s00605-012-0436-3). Its reported result concerns Dirichlet characters. An imaginary norm twist is a unitary Hecke character and is not itself a Dirichlet character.
- **S. Omar and R. Ouni**, *A note on Li's coefficients for Hecke L-functions*, *International Journal of Number Theory* **13** (2017), DOI [10.1142/S1793042117501007](https://doi.org/10.1142/S1793042117501007). Its public abstract reports an RH-equivalence for monotonicity in its Hecke setting. The present note does not claim to refute that separate paper or silently extend its statement to all unitary norm twists.
- **A.-M. Ernvall-Hytönen, A. Odžak, L. Smajlović, and M. Šušić**, *On the modified Li criterion for a certain class of L-functions*, *Journal of Number Theory* **156** (2015), 340–367, [publisher record](https://www.sciencedirect.com/science/article/pii/S0022314X15001481). This develops modified coefficients and studies certain products of shifted zeta functions; the retrieved statement does not resolve the 2026 universal monotonicity conjecture.


A related 2011 paper by S. Omar, R. Ouni, and K. Mazhouda, *On the zeros of Dirichlet L-functions*, was formally retracted by agreement of the authors and publisher. The [primary retraction notice](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/9D250A51B842A4538CF179AEDBC78E73/S1461157018000013a.pdf/on_the_zeros_of_dirichlet_lfunctions_retraction.pdf), DOI [10.1112/S1461157018000013](https://doi.org/10.1112/S1461157018000013), states that the mathematical results were incorrect. This is a reason to check old results directly, not a basis to infer that every later paper by those authors is incorrect. The accessible first-page preview of the 2017 Hecke paper does not expose its full family definition, so its inclusion or exclusion of imaginary norm twists remains unverified in this audit. Neither the 2011 paper nor an inferred extension of the 2013 or 2017 claims is used in the proof above.

Searches on 20 November 2026 used the authors' names, exact title, DOI, “Li coefficients” with “monotonicity,” “increasing,” “counterexample,” “unitary,” “imaginary twist,” and “central zero,” including current indexed material. They found no earlier refutation of the exact 2026 statement or this twist counterexample. This is a bounded prior-art audit, not proof of exclusive priority.

The older finite numerical computations and the published Dirichlet or modular-form results must not be counted as additional conjecture resolutions here.

## Review status

The complete argument passed two independent internal reviews:

- [Analytic-targets review](https://github.com/1337isnot1337/solved-conjectures/issues/124#issuecomment-7049839337) inspected and independently ran the exact certificate. It checked the dyadic interval operations, elementary-function remainder bounds, derivative jets, gamma tails, Euler–Maclaurin disk bound, and Cauchy factors.
- [Root review](https://github.com/1337isnot1337/solved-conjectures/issues/124#issuecomment-7049870616) independently downloaded and inspected the publisher PDF, confirmed the original class and absence of a norm-central-character normalization, checked the real-part derivative identity, and inspected and ran the certificate.

Both reviews passed the displayed strict decrease. The current prior-art search found no earlier refutation of the exact universal statement; exclusive priority remains unclaimed.

Internal review is not external peer review or Lean verification.
