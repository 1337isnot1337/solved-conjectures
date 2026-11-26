# Merlini–Sala–Sala conjecture

Research date: 20 November 2026. [Issue #128](https://github.com/1337isnot1337/solved-conjectures/issues/128). Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Exact statement and result

D. Merlini, M. Sala, and N. Sala proposed a logarithmic bound for the tiny part of the Li coefficients in [*A numerical comment on the “tiny” oscillations and a heuristic “conjecture”*](https://arxiv.org/pdf/1903.06233), arXiv:1903.06233v2 (2019), Conclusion, PDF page 5. That paragraph also states the weaker subpower assertion
```math
|\lambda_{\rm tiny}(n)|=O_\varepsilon(n^\varepsilon)
\qquad\text{for every }\varepsilon>0. \tag{1}
```
Their later [*Analysis of a Complex approximation to the Li-Keiper coefficients around the K Function*](https://arxiv.org/pdf/1907.01903), arXiv:1907.01903 (2019), Introduction, PDF page 2, repeats the subpower conjecture.

The normalization is
```math
\begin{aligned}
G(z)&=\frac{z}{1-z}\,
 \zeta\!\left(\frac1{1-z}\right),
\\ F(z)&=\log G(z)
 =\sum_{n\ge1}c_nz^n
 =\sum_{n\ge1}\frac{\lambda_{\rm tiny}(n)}n z^n,
\qquad F(0)=0.
\end{aligned}
\tag{2}
```
The value $`G(0)=1`$ is understood by removal of the pole of $`\zeta`$. Initially $`F`$ is the analytic logarithm near $`0`$. In particular,
```math
\lambda_{\rm tiny}(n)=n c_n. \tag{3}
```
This factor of $`n`$ matters. The authors' prose sometimes abbreviates the coefficient convention, but their displayed differentiated generating function, equation (2) of arXiv:1907.01903, explicitly gives (2)–(3). Their numerical value $`\lambda_{\rm tiny}(5)=1.4582685\ldots`$, compared with coefficient $`c_5=0.2916537\ldots`$, confirms that convention.

**Theorem.**
```math
\boxed{\displaystyle
\limsup_{n\to\infty}
 \frac{|\lambda_{\rm tiny}(n)|}{n^{1/4}}=+\infty.}
\tag{4}
```

Consequently (1), and hence the logarithmic bound, are false. The theorem is unconditional. It uses neither a numerical coefficient table nor assumptions about simple zeros or gaps between zeros.

This resolves the full logarithmic/subpower conjecture. The authors' separate, weaker linear stability assertion $`|\lambda_{\rm tiny}(n)|\le\gamma n`$ is not resolved here.

## 1. The proposed coefficient bound supplies the analytic setting

Suppose, for a contradiction, that
```math
|\lambda_{\rm tiny}(n)|\le A n^{1/4}\qquad(n\ge1) \tag{5}
```
for some finite $`A`$. An eventual bound can be enlarged to cover the finitely many earlier terms, so this is exactly the assumption $`\lambda_{\rm tiny}(n)=O(n^{1/4})`$.

Then
```math
|c_n|\le A n^{-3/4}. \tag{6}
```
The series $`F(z)=\sum c_nz^n`$ is analytic on the unit disk, and
```math
\sum_{n\ge1}|c_n|^2<\infty. \tag{7}
```
Thus $`F`$ belongs to the Hardy space $`H^2`$. Equivalently, its radial boundary values exist in $`L^2(-\pi,\pi)`$, with the same Fourier coefficients.

The function $`G`$ in (2) is analytic throughout the open unit disk: $`s=(1-z)^{-1}`$ maps that disk to $`\mathop{\mathrm{Re}}s>1/2`$, and $`(s-1)\zeta(s)`$ is entire. Near $`0`$, the defining logarithm gives $`e^{F(z)}=G(z)`$. The identity theorem therefore gives
```math
e^{F(z)}=G(z)\qquad(|z|<1). \tag{8}
```
The left side never vanishes. Hence $`\zeta(s)`$ has no zero with $`\mathop{\mathrm{Re}}s>1/2`$. The functional equation and reflection symmetry then imply RH.

This last implication is the elementary direction of Arias de Reyna's established $`H^2`$ criterion: [*Asymptotics of Keiper–Li coefficients*](https://personal.us.es/arias/56-2RHB.pdf), *Functiones et Approximatio Commentarii Mathematici* **45** (2011), 7–21, Theorem 6. Its coefficient $`A_n`$ is the $`c_n`$ of (2).

Our argument does not assume RH in addition to (5). It obtains the needed analytic logarithm from (5) itself. This will make the contradiction unconditional.

The coefficients $`c_n`$ are real because the defining germ in (2) is real on a real interval about $`0`$. Let
```math
f(\theta)=\mathop{\mathrm{Im}}F(e^{i\theta})
```
denote the $`L^2`$ boundary function. In the $`L^2`$ sense,
```math
f(\theta)=\sum_{n\ge1}c_n\sin(n\theta). \tag{9}
```

## 2. An exact derivative between zero angles

For $`0<\theta<\pi`$,
```math
\frac1{1-e^{i\theta}}=\frac12+it,
\qquad
t=t(\theta)=\frac12\cot\frac{\theta}{2}, \tag{10}
```
and
```math
t'(\theta)=-\left(t^2+\frac14\right). \tag{11}
```

Let $`\vartheta(t)`$ be the continuous Riemann–Siegel theta function,
```math
\vartheta(t)=
 \mathop{\mathrm{Im}}\log\Gamma\!\left(\frac14+\frac{it}{2}\right)
 -\frac t2\log\pi,
```
with the logarithm continued from $`t=0`$. The Hardy function
```math
Z(t)=e^{i\vartheta(t)}
 \zeta\!\left(\frac12+it\right)
```
is real for real $`t`$. These are the standard functional-equation identities; see [NIST DLMF, equations 25.10.1–25.10.2](https://dlmf.nist.gov/25.10#i).

On an interval containing no zero of $`Z`$, its sign is constant. Thus any continuous logarithm of $`\zeta(1/2+it)`$ on that interval satisfies
```math
\frac{d}{dt}\mathop{\mathrm{Im}}\log
 \zeta\!\left(\frac12+it\right)=-\vartheta'(t). \tag{12}
```
Also,
```math
\frac{d}{dt}\arg\!\left(-\frac12+it\right)
=-\frac{1/2}{t^2+1/4}. \tag{13}
```

The logarithm in (8) has a local analytic continuation through every point $`e^{i\theta}\ne1`$ at which $`G(e^{i\theta})\ne0`$. Indeed $`G`$ is analytic and nonzero on a sufficiently small neighborhood of that point, so a local logarithm exists. Its difference from $`F`$ inside the disk is a constant multiple of $`2\pi i`$. Its boundary restriction is therefore a representative of the $`H^2`$ boundary value there.

Consequently (12)–(13) apply to $`f`$ on every arc whose full interior and endpoints contain no mapped zeta zero. A branch constant does not affect the derivative. Combining them with (11) gives the exact formula
```math
\boxed{\displaystyle
f'(\theta)=
 \left(t(\theta)^2+\frac14\right)\vartheta'(t(\theta))
 +\frac12.}
\tag{14}
```

In particular the contribution from the factor $`s-1`$ has positive sign in this angular variable. It does not cancel the gamma-factor term.

Stirling's formula for the logarithmic derivative of $`\Gamma`$ gives
```math
\vartheta'(t)=
 \frac12\log\frac{t}{2\pi}+O(t^{-2})
 \qquad(t\to+\infty). \tag{15}
```
For example this follows by taking real parts of
$`\psi(w)=\log w-(2w)^{-1}+O(|w|^{-2})`$
at $`w=1/4+it/2`$; the term of order $`1/t`$ is purely imaginary. See [DLMF 5.11.2](https://dlmf.nist.gov/5.11#E2).

It follows that there is an absolute $`T_0`$ such that, for $`T\ge T_0`$ and $`t(\theta)\in[T,2T]`$ away from zeros,
```math
f'(\theta)\ge\frac14 T^2\log T. \tag{16}
```
The only quantitative property needed below is a positive constant times $`T^2\log T`$.

## 3. Many whole angular segments contain no zero

Write the inverse of (10) as
```math
\theta(t)=2\arctan\frac1{2t}.
```
For $`T\ge1`$, the angular interval corresponding to $`t\in[T,2T]`$ is
```math
I_T=[\theta(2T),\theta(T)].
```
Its length satisfies
```math
|I_T|
=\int_T^{2T}\frac{dt}{t^2+1/4}
\ge\frac{T}{4T^2+1/4}
\ge\frac1{5T}. \tag{17}
```

Let $`N(U)`$ count nontrivial zeta zeros with $`0<\mathop{\mathrm{Im}}\rho\le U`$, including multiplicities. The classical zero-count estimate gives an absolute $`C_0\ge1`$ such that
```math
N(2T)\le C_0 T\log T \tag{18}
```
for all sufficiently large $`T`$. An explicit stronger version is given by E. Hasanalizade, Q. Shen, and P.-J. Wong, [*Counting zeros of the Riemann zeta function*](https://arxiv.org/pdf/2107.06506), Corollary 1.2. Only the upper bound (18) is used.

Fix
```math
\kappa=\frac1{20C_0}>0,
\qquad
h_T=\frac{\kappa}{T^2\log T}. \tag{19}
```
To keep each entire segment inside $`I_T`$, restrict its starting point to
```math
J_T=[\theta(2T),\,\theta(T)-h_T].
```
For all sufficiently large $`T`$, $`h_T\le1/(30T)`$, so (17) yields
```math
|J_T|\ge\frac1{6T}. \tag{20}
```

Remove from $`J_T`$ every starting point $`\theta`$ for which the closed segment
```math
[\theta,\theta+h_T]
```
contains a mapped zeta zero. Each distinct zero angle removes a set of starting points of measure at most $`h_T`$. There are at most $`N(2T)`$ such angles in $`I_T`$, so the total removed measure is at most
```math
h_T N(2T)\le\frac{\kappa C_0}{T}=\frac1{20T}. \tag{21}
```
Multiple zeros only make this upper bound larger than necessary. Overlaps of removed intervals reduce the removed measure.

Thus the remaining set $`E_T`$ has
```math
|E_T|\ge\frac1{6T}-\frac1{20T}
=\frac7{60T}\ge\frac1{10T}. \tag{22}
```
This argument needs no lower bound for a zero gap, no simplicity assumption, and no independence assumption on zero locations.

For every $`\theta\in E_T`$, formula (16) holds throughout the full segment. Integration gives
```math
f(\theta+h_T)-f(\theta)
\ge \frac14 T^2\log T\,h_T
=\frac{\kappa}{4}. \tag{23}
```

Define the squared $`L^2`$ translation modulus, with periodic boundary values, by
```math
M(h)=\int_{-\pi}^{\pi}
 |f(\theta+h)-f(\theta)|^2\,d\theta.
```
Equations (22)–(23) imply
```math
\boxed{\displaystyle
M(h_T)\ge\frac{\kappa^2}{160T}.}
\tag{24}
```
Only the positive-angle subinterval $`E_T`$ was used. No issue at the periodic endpoint or at $`\theta=0`$ enters this lower bound.

## 4. The coefficient bound forces an incompatible upper bound

By (9) and Parseval's identity,
```math
M(h)=\pi\sum_{n\ge1}c_n^2
 |e^{inh}-1|^2. \tag{25}
```
This normalization follows either from sine/cosine orthogonality or from the two Fourier coefficients $`c_n/(2i)`$ and $`-c_n/(2i)`$.

Since
```math
|e^{ix}-1|\le\min(2,|x|),
```
the supposed bound (6) gives, for $`0<h<1/2`$,
```math
\begin{aligned}
M(h)
&\le \pi A^2
 \left(
 h^2\sum_{n\le1/h}n^{1/2}
 +4\sum_{n>1/h}n^{-3/2}
 \right)
\\ &\ll A^2\sqrt h.
\end{aligned}
\tag{26}
```
The implied constant is absolute; both estimates are immediate integral comparisons.

Substituting (19),
```math
M(h_T)\ll
 \frac{A^2\sqrt\kappa}{T\sqrt{\log T}}
=o\!\left(\frac1T\right). \tag{27}
```
This contradicts (24), whose constant $`\kappa^2/160`$ is fixed and positive.

Therefore (5) is impossible. A nonnegative sequence that is not bounded has infinite limsup after discarding finitely many entries. Applying this to
$`|\lambda_{\rm tiny}(n)|/n^{1/4}`$
proves (4).

In particular, the assertion (1) fails already at $`\varepsilon=1/4`$. Any bound $`O(\log n)`$ would imply $`O(n^{1/4})`$, so the logarithmic conjecture also fails.

## 5. Relation to the RH transfer program

The generating function and its $`H^2`$ boundary values were the useful transfer from the Li-coefficient side of the accepted RH work. They also appeared in the adjacent [Coffey–Smith analysis](../coffey-smith/PROOF.md).

Here RH becomes unnecessary in the final theorem: the proposed coefficient bound supplies both the analytic logarithm and its $`H^2`$ trace, so the contradiction covers every possibility. The accepted RH theorem remains consistent with (4).

The source of the obstruction is specific. As $`t`$ grows, the smooth boundary argument between zeros has slope of order $`t^2\log t`$ in the angular coordinate. The total zero count still leaves a positive proportion of intervals of angular length proportional to $`1/(t^2\log t)`$ that avoid zeros entirely. On those intervals the argument moves by a fixed amount. Coefficients as small as $`n^{-3/4}`$ would force a smaller $`L^2`$ translation modulus.

This is a disproof of a full asymptotic assertion about all coefficients, not a report of one large computed coefficient.

## 6. Statement and prior-art audit

### Original conjecture and normalization

- **Merlini–Sala–Sala, arXiv:1903.06233v2**, [PDF](https://arxiv.org/pdf/1903.06233), PDF pages 3–5. The text proposes a logarithmic bound and explicitly gives the weaker $`O_\varepsilon(n^\varepsilon)`$ formulation in the Conclusion. It already observes that a numerical constant suggested by early data must be enlarged for later data. Thus disproving one proposed constant would not settle the asymptotic conjecture.
- **Merlini–Sala–Sala, arXiv:1907.01903**, [PDF](https://arxiv.org/pdf/1907.01903), PDF pages 2–3. The introduction repeats the subpower assertion. Its differentiated generating-function identity fixes the factor of $`n`$ in (2)–(3).
- Their earlier **linear stability conjecture**, [*Fluctuation around the Gamma function and a Conjecture*](https://www.iosrjournals.org/iosr-jm/papers/Vol15-issue1/Series-1/H1501015770.pdf), *IOSR Journal of Mathematics* **15**, issue 1 (2019), 57–70, is a weaker, separate assertion. It is not claimed as another resolution here.

### Established nearby results

- **Arias de Reyna (2011)**, [author's full text](https://personal.us.es/arias/56-2RHB.pdf), proves the $`H^2`$/square-summability criterion. That theorem is an established input and is not the lower bound (4). The present proof of the implication needed from it is included in Section 1.
- **Lagarias (2007)**, [*Li coefficients for automorphic L-functions*](https://www.numdam.org/articles/10.5802/aif.2311/), proves the conditional $`O(\sqrt n\log n)`$ estimate for the relevant arithmetic contribution. An upper bound of that size does not resolve the logarithmic/subpower assertion.
- **Maślanka (2004)**, [*Effective method of computing Li's coefficients and their properties*](https://arxiv.org/pdf/math/0402168), provides the trend/tiny decomposition and numerical study. No theorem of the form (4) was found there.
- **Voros (2022)**, [*From asymptotic to closed forms for the Keiper/Li approach to the Riemann Hypothesis*](https://arxiv.org/pdf/2204.01036), §3, reviews Keiper–Li asymptotics and a different discretized sequence. Its remainder discussion does not give the present lower bound.

### Later papers by the conjecture's authors

- **Merlini–Sala–Sala (2020)**, [*Infinite set of non linear Equations for the Li-Keiper Coefficients: a possible new upper and lower bound*](https://arxiv.org/pdf/2012.07980), develops coefficient equations and proposed low-order bounds. The retrieved introduction, coefficient discussion, and conclusion do not withdraw or disprove the logarithmic/subpower claim.
- **Merlini–Rusconi–Sala–Sala (2023)**, [*Thermodynamic limit for the low Li-Keiper coefficients: upper and lower bounds*](https://www.questjournals.org/jram/papers/v9-i11/09112025.pdf), *Journal of Research in Applied Mathematics* **9**, issue 11, 20–25, explicitly concerns the first six coefficients of its model. It does not resolve the asymptotic conjecture.

Searches on 20 November 2026 used both search engines and combined the authors' names and exact titles with “logarithmic,” “subpower,” “tiny,” “disproof,” and “counterexample.” Additional searches combined “Li coefficients” or “Keiper” with “Omega,” “lower bound,” “quarter power,” “n^{1/4},” “Sobolev,” and “fluctuations.” Current indexed repositories and recent followups were also screened. No earlier refutation of the exact logarithmic/subpower assertion or the lower bound (4) was retrieved.

This records a bounded prior-art audit. It does not prove exclusive priority.

## Review status

Three independent internal reviews checked the complete written proof and the original conjecture's normalization:

- [Analytic review](https://github.com/1337isnot1337/solved-conjectures/issues/128#issuecomment-7049980571): verified the original subpower assertion, the factor $`\lambda_{\rm tiny}(n)=n c_n`$, the exact boundary derivative, the complete-segment exclusion, and the incompatible translation bounds.
- [Arithmetic review](https://github.com/1337isnot1337/solved-conjectures/issues/128#issuecomment-7049994642): independently verified the $`H^2`$-to-RH implication, branch-local derivative and positive $`1/2`$ term, the constant $`\kappa^2/160`$, Parseval normalization, and the contradiction.
- [Root review](https://github.com/1337isnot1337/solved-conjectures/issues/128#issuecomment-7050043433): checked the complete argument against the original source statements and differentiated generating-function normalization.

All three reviews passed without a requested mathematical repair.

Internal review is not external peer review or Lean verification.
