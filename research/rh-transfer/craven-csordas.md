# Craven–Csordas’s conjecture

## Status and scope

**An exact counterexample to the literal 2004 Problem 4.16 is proved below. This target is excluded from the campaign’s count of previously unresolved conjectures.**

The prior-art audit found Craven and Csordas’s 1996 Theorem 3.3, whose existential statement already implies a negative answer. Its printed example contains an incorrect generating-function identity, confirmed from the actual page image. We have not established a corrected version of that example or a complete resolution of its bibliographic history. That uncertainty does not justify claiming that the question was previously unresolved.

The argument below is unconditional. It arose from the campaign’s study of Laguerre–Pólya functions and zero-preserving operators, rather than from a further consequence of the accepted RH package. No Lean verification or numerical zero-location claim is used.

Research date: 20 November 2026. Owner: analytic-targets agent. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## 1. The original question

In their 2004 survey, Craven and Csordas ask in Problem 4.16, equation (4.12), whether the following hypotheses imply that a sequence is complex zero decreasing:

\[
\phi(z)=\sum_{k=0}^{\infty}\frac{\gamma_k}{k!}z^k\in\mathcal{LP}^{+},
\qquad
\gamma_k\ge 0,
\qquad
\lim_{k\to\infty}\gamma_k^{1/k}=0.
\]

Here \(\mathcal{LP}^{+}\) is the Laguerre–Pólya class with nonnegative Taylor coefficients. The first condition says precisely that \(\{\gamma_k\}\) is a nonnegative multiplier sequence.

For a real polynomial \(f(z)=\sum a_kz^k\), define

\[
T_\gamma f(z)=\sum\gamma_ka_kz^k.
\]

The sequence is a **complex zero decreasing sequence**, abbreviated CZDS, if

\[
Z_{\mathbb C\setminus\mathbb R}(T_\gamma f)
\le Z_{\mathbb C\setminus\mathbb R}(f)
\]

for every real polynomial \(f\), with multiplicities included.

The question concerns the exponential generating function. Its root-decay hypothesis is different from the stronger uniform Turán-ratio condition called rapidly decreasing elsewhere in the survey. The counterexample below does not settle the separate fixed-sequence problem for \(\{e^{-k^3}\}\).

Primary statement: [Craven–Csordas 2004, PDF p. 29, Problem 4.16](https://www.dcce.ibilce.unesp.br/~dimitrov/ProfRusev/czdssurvey.pdf).

## 2. The sequence

Put

\[
q=\frac{999999}{1000000},\qquad
h(k)=1+k+k^2,\qquad
\gamma_k=h(k)q^{k^2}\quad(k\ge0).
\tag{1}
\]

All terms are strictly positive, and \(\gamma_0=1\).

### 2.1. It is a multiplier sequence

First,

\[
\sum_{k=0}^{\infty}h(k)\frac{z^k}{k!}
=(1+z)^2e^z\in\mathcal{LP}^{+}.
\]

Thus \(\{h(k)\}\) is a multiplier sequence by the Pólya–Schur characterization.

Next let \(\varepsilon=-\log q>0\). The real entire function

\[
g(w)=e^{-\varepsilon w^2}
\]

belongs to the Laguerre–Pólya class and has no zeros. Laguerre’s theorem, in the form of Theorem 4.1(2) of the 2004 survey, shows that \(\{g(k)\}=\{q^{k^2}\}\) is a CZDS, hence a multiplier sequence. For completeness, membership of \(g\) in \(\mathcal{LP}\) follows from the locally uniform limit

\[
\left(1-\frac{\varepsilon w^2}{m}\right)^m
\longrightarrow e^{-\varepsilon w^2};
\]

each approximating polynomial has only real zeros.

The coefficientwise product of two multiplier sequences is a multiplier sequence: the corresponding diagonal operators compose. Therefore \(\{\gamma_k\}\) is a multiplier sequence. Its positive terms ensure

\[
\sum_{k\ge0}\frac{\gamma_k}{k!}z^k\in\mathcal{LP}^{+}.
\]

### 2.2. It has the required decay

For \(k\ge1\),

\[
\gamma_k^{1/k}=h(k)^{1/k}q^k\longrightarrow0,
\]

since \(h(k)^{1/k}\to1\) and \(0<q<1\).

Every hypothesis of the original question is satisfied.

## 3. An exact finite witness against the CZDS conclusion

Define the cubic and the strictly positive sextic

\[
Q(x)=-343+1989x-2457x^2+403x^3,
\qquad P(x)=Q(x)^2+1.
\]

Let \(T_{1/\gamma}\) act coefficientwise, and put

\[
R(x)=T_{1/\gamma}P(x).
\]

These are explicit real polynomials with rational coefficients. Because every \(\gamma_k\) is positive,

\[
T_\gamma R=P,\qquad \deg R=\deg P=6,
\]

and the leading coefficient of \(R\) is positive.

We will prove \(R(1)<0\). Write

\[
(v_0,v_1,v_2,v_3)=(-343,1989,-2457,403).
\]

Then

\[
R(1)=1+\sum_{i,j=0}^{3}
 \frac{v_iv_jq^{-(i+j)^2}}{1+(i+j)+(i+j)^2}.
\tag{2}
\]

Two finite rational identities are

\[
S:=\sum_{i,j=0}^{3}
 \frac{v_iv_j}{1+(i+j)+(i+j)^2}
=-\frac{188784}{301},
\tag{3}
\]

and

\[
A:=\sum_{i,j=0}^{3}
 \frac{|v_iv_j|}{1+(i+j)+(i+j)^2}
=\frac{777479632}{301}.
\tag{4}
\]

For \(0\le m\le36\), Bernoulli’s inequality gives

\[
q^{36}\ge 1-\frac{36}{10^6},
\]

and consequently

\[
0\le q^{-m}-1
\le q^{-36}-1
\le\frac{36}{10^6-36}
<\frac1{20000}.
\tag{5}
\]

Using \((i+j)^2\le36\), equations (2)–(5) yield the exact estimate

\[
\begin{aligned}
R(1)
&\le1+S+\frac{A}{20000}\\
&=-\frac{187011273}{376250}<0.
\end{aligned}
\tag{6}
\]

Since \(R\) has positive leading coefficient and even degree six,

\[
R(x)\longrightarrow+\infty\quad(x\longrightarrow\pm\infty).
\]

Together with \(R(1)<0\), the intermediate value theorem supplies one real root on each side of \(1\). They are distinct. Therefore

\[
Z_{\mathbb C\setminus\mathbb R}(R)\le4.
\]

On the other hand \(P(x)=Q(x)^2+1>0\) for every real \(x\). It has degree six and no real root, so

\[
Z_{\mathbb C\setminus\mathbb R}(T_\gamma R)
=Z_{\mathbb C\setminus\mathbb R}(P)=6.
\]

Thus \(T_\gamma\) increases the number of nonreal zeros, proving that the sequence (1) is not a CZDS.

This establishes a negative answer to the entire universal implication in Problem 4.16. The rational choice of \(q\) is an exact witness, not a numerical approximation to a root calculation.

## 4. Why the construction works

The polynomial multiplier sequence \(1+k+k^2\) is the classical non-CZDS example discussed in Craven and Csordas’s 1995 work and their 2004 Example 4.5. The quadratic form (3) gives a finite witness to failure of positivity for its reciprocal operator.

Multiplying by a Gaussian factor \(q^{k^2}\), with \(q<1\) sufficiently close to \(1\), forces the required root decay. It also preserves the multiplier property. The strict finite inequality witnessing failure of the CZDS property survives this perturbation. Equations (3)–(6) make that continuity argument fully quantitative.

More generally, any strictly positive multiplier sequence with a strict finite reciprocal-positivity obstruction can be damped in this way. The classical example, the Gaussian multiplier theorem, and the finite-dimensional perturbation argument are all credited; no claim is made that the underlying construction is new.

## 5. The earlier result and its printed inconsistency

Craven–Csordas 1996, Theorem 3.3 on printed p. 520, asserts that a TP-sequence can have a reciprocal which is not a \(\lambda\)-sequence. Here a TP-sequence has an entire ordinary generating function in \(\mathcal{LP}^{+}\). Such a sequence has root decay zero and is itself a multiplier sequence: applying the classical multiplier \(1/k!\) to its ordinary generating function gives the required exponential generating function.

A positive CZDS must have a reciprocal which preserves strict positivity of real polynomials, the defining property of a \(\lambda\)-sequence. Thus the existential assertion of Theorem 3.3 already implies a counterexample to the later Problem 4.16.

However, the displayed identity used for its specific example is incorrect. The source literally prints

\[
(x+\tfrac12)^2e^x
=\sum_{k\ge0}\frac{(k-\tfrac12)^2}{k!}x^k.
\]

In fact,

\[
\sum_{k\ge0}\frac{(k-\tfrac12)^2}{k!}x^k
=(x^2+\tfrac14)e^x,
\]

whereas the coefficients corresponding to \((x+\tfrac12)^2e^x\) are \(k^2+\tfrac14\). The printed sequence \(\{(k-\tfrac12)^2\}\) is therefore not a multiplier sequence. Its stated example does not prove the assertion as written.

The actual raster of printed p. 520 was independently inspected by the root and analytic-targets agents. This discrepancy is present in the printed source; it is not an OCR artifact. The supplied PDF has SHA-256

\[
\texttt{26f3fa0dd024b896df967fb50cb8ded59171c3db53178d0f389ef90df0c885c3}.
\]

We do not infer from this mistake that the existential theorem is false, or that the later question qualifies as previously unresolved. The target remains **uncounted**.

## 6. Verification and prior-art record

The exact fractions in (3), (4), and (6) were recomputed with rational arithmetic. The proof requires no numerical root finder, floating-point determinant, or unverified classification of CZDS.

The audit read the original 2004 formulation, the 1995 classical example, the 1996 theorem and definitions, the 1997 converse-of-Laguerre paper, and later discussions of rapidly decreasing sequences. Exact searches covered Problem 4.16, the root-decay condition, TP-sequence reciprocals, the 1996 theorem, and corrections or errata. The author’s publication list was also checked.

No correction resolving the 1996 printed example was found in those bounded searches. This is an access-and-search result, not a proof that no correction exists. The earlier published existence assertion prevents a claim of first resolution.

### Sources

1. T. Craven and G. Csordas, *Composition theorems, multiplier sequences and complex zero decreasing sequences*, in *Value Distribution Theory and Related Topics* (2004), pp. 131–166. [Author PDF](https://math.hawaii.edu/~tom/mathfiles/czdssurvey.pdf); [alternative author-hosted copy](https://www.dcce.ibilce.unesp.br/~dimitrov/ProfRusev/czdssurvey.pdf). Theorem 4.1, Example 4.5, and Problem 4.16.
2. T. Craven and G. Csordas, *Problems and theorems in the theory of multiplier sequences*, *Serdica Mathematical Journal* **22** (1996), 515–524. [Publisher PDF](https://www.math.bas.bg/serdica/1996/1996-515-524.pdf); [author manuscript](https://math.hawaii.edu/~tom/mathfiles/serdica1.pdf). Definitions 2.3 and 3.2, Theorems 2.4 and 3.3.
3. T. Craven and G. Csordas, *Complex zero decreasing sequences*, *Methods and Applications of Analysis* **2** (1995), 420–441. [Author PDF](https://www.math.hawaii.edu/~tom/mathfiles/zds.pdf). Example 1.8 and the Laguerre multiplier theorem.
4. T. Craven and G. Csordas, *On a converse of Laguerre’s theorem*, *Electronic Transactions on Numerical Analysis* **5** (1997), 7–17. [Journal PDF](https://etna.ricam.oeaw.ac.at/vol.5.1997/pp7-17.dir/pp7-17.pdf). Its additional interpolation hypotheses do not identify the root-decay question with a new theorem here.
5. T. Craven, [publication list](https://www.math.hawaii.edu/~tom/papers.html), checked 20 November 2026.

## 7. Review status

The root agent independently checked the original 1996 raster and the contradictory generating-function identity. The full exact witness and the TP-to-multiplier implication passed independent root review: [issue #80, review receipt 7050479883](https://github.com/1337isnot1337/solved-conjectures/issues/80#issuecomment-7050479883). The receipt checks the multiplier construction, rational sums and bound, root count, and prior-result implication. Bibliographic eligibility is deliberately not inferred from mathematical validity; the target remains uncounted.
