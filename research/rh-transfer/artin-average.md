# Artin's primitive root conjecture

## Status and dependencies

This note identifies the additional average estimate needed for the full Artin density formula. It proves reductions to a weighted prime-trace moment and to a weighted zero sum. It does **not** prove the required average estimate or resolve Artin's conjecture.

The accepted input in this campaign is RH and GRH for rational Dirichlet L-functions. The hypothesis H(δ) below is **separate**: it is imported from the October 4, 2026 OpenAI manuscript and has not been obtained from the accepted Alpöge archive. The companion [uniform splitting note](artin-uniform-splitting.md) records that manuscript's precise statement, inspected steps, and unverified theta-series dependency.

Fix an integer a that is neither a square nor −1, with |a|>1. The target is the complete density formula

$$
\#\{p\le X:a\bmod p\text{ generates }\mathbf F_p^\times\}
\sim A(a)\operatorname{Li}(X),\qquad
A(a)=\sum_{n\ge1}
\frac{\mu(n)}{[\mathbf Q(\zeta_n,a^{1/n}):\mathbf Q]}.
$$

The lower bounds and almost-all-base results mentioned below do not establish this assertion for every fixed admissible a.

H(δ), for some fixed 0<δ<1/2, asserts zero-freeness in Re(s)>1−δ for every finite-order Hecke L-function over every cyclotomic field containing μ12. The trivial character's pole at 1 is allowed. The companion note explains the resulting zero-free strip for each Kummer field

$$
K_q=\mathbf Q(\zeta_q,a^{1/q}),\qquad E_q=\mathbf Q(\zeta_q),
$$

and the bounds, valid for every prime q above a fixed q₀(a),

$$
[K_q:\mathbf Q]=q(q-1),\qquad
\log|D_{K_q}|\ll_a q(q-1)\log(2q).
\tag{0.1}
$$

All limits below keep a, δ, and the auxiliary positive constants fixed.

## 1. The middle interval can end below the square root

Write

$$
N_a(x,q)=\#\{x<p\le2x:p\text{ splits completely in }K_q\}.
$$

Fix 0<η<δ and A>0. The companion note proves that H(δ) controls the index-divisor tail y<q≤x^η, while an elementary product argument controls q>√x(log x)^A. Its remaining sufficient estimate is

$$
\sum_{x^\eta<q\le\sqrt x(\log x)^A}N_a(x,q)
=o_a(x/\log x).
\tag{1.1}
$$

Here and throughout, sums over q are over primes.

For any fixed B>0 put

$$
Q_-(x)=\frac{\sqrt x}{(\log x)^B},\qquad
Q_+(x)=\sqrt x(\log x)^A.
$$

Complete splitting implies p≡1 modulo q. The Brun–Titchmarsh inequality therefore gives, uniformly throughout this interval,

$$
N_a(x,q)\le\pi(2x;q,1)\ll_{A,B}\frac{x}{q\log x}.
$$

Partial summation and the elementary bound π(t)≪t/log t give

$$
\sum_{Q_-<q\le Q_+}\frac1q
\ll_{A,B}\frac{\log\log x}{\log x}.
$$

For example, integrate dt/(t log t) between Q₋ and Q₊; the resulting logarithm is O((A+B)log log x/log x), and the boundary term is O(1/log x). Consequently,

$$
\sum_{Q_-<q\le Q_+}N_a(x,q)
\ll_{A,B}\frac{x\log\log x}{(\log x)^2}
=o(x/\log x).
\tag{1.2}
$$

Thus it is enough to control

$$
I(x)=\{q\text{ prime}:x^\eta<q\le Q\},\qquad
Q=\frac{\sqrt x}{(\log x)^B}.
\tag{1.3}
$$

B can be any fixed positive constant, including one chosen after the exponents in an average theorem are known. This freedom only changes a cutoff in the same full-density proof.

## 2. Exact normalization of the nonlinear trace

For q>q₀(a), the Galois group is the affine group

$$
G_q=C_q\rtimes\mathbf F_q^\times.
$$

It has q−1 linear characters and one nonlinear irreducible representation ρ_q of degree q−1. Write φ_q for its character. Inducing any nontrivial character of C_q gives

$$
\varphi_q(g)=
\begin{cases}
q-1,&g=1,\\
-1,&g\in C_q\setminus\{1\},\\
0,&g\notin C_q.
\end{cases}
\tag{2.1}
$$

For x sufficiently large, every p in (x,2x] is unramified in every K_q with q∈I(x). Restriction of Frobenius to E_q is trivial exactly when p≡1 modulo q. Therefore (2.1) gives the exact pointwise identity

$$
\mathbf1_{\{p\text{ splits in }K_q\}}
=\frac1q\left(
 \mathbf1_{\{p\equiv1\pmod q\}}+\varphi_q(\operatorname{Frob}_p)
\right).
\tag{2.2}
$$

Define

$$
A_q(x)=\#\{x<p\le2x:p\equiv1\pmod q\},\qquad
T_q(x)=\sum_{x<p\le2x}\varphi_q(\operatorname{Frob}_p).
$$

Then

$$
qN_a(x,q)=A_q(x)+T_q(x).
\tag{2.3}
$$

In particular, the nonlinear trace is already centered by the cyclotomic congruence count. The required weight is 1/q.

Brun–Titchmarsh and comparison with all integers imply

$$
\sum_{q\in I(x)}\frac{A_q(x)}q
\ll_\eta \frac{x}{\log x}\sum_{q>x^\eta}\frac1{q^2}
\ll_\eta\frac{x^{1-\eta}}{\log x}
=o(x/\log x).
\tag{2.4}
$$

The two inequalities

$$
N_a(x,q)\le\frac{|T_q(x)|}{q}+\frac{A_q(x)}q,\qquad
\frac{|T_q(x)|}{q}\le N_a(x,q)+\frac{A_q(x)}q
$$

now prove the equivalence

$$
\boxed{
\sum_{q\in I(x)}N_a(x,q)=o(x/\log x)
\quad\Longleftrightarrow\quad
\sum_{q\in I(x)}\frac{|T_q(x)|}{q}=o(x/\log x).
}
\tag{2.5}
$$

The signed first-moment version is also equivalent, by (2.3). Cancellation between different q is not essential: the total negative part is at most the negligible quantity in (2.4).

If one uses the bounded character φ̃_q=φ_q/(q−1), the corresponding first-moment weight is (q−1)/q, and the second-moment weight below is (q−1)²/q. Replacing these weights by 1/q would incorrectly discard a growing degree factor.

The character description can also be found in [Murty–Naik, §2](https://arxiv.org/html/2608.21573v1#S2). The derivation above fixes the particular normalization needed here.

## 3. A sufficient second moment has no diagonal obstruction

Since

$$
\sum_{q\in I(x)}\frac1q=O_\eta(1),
$$

Cauchy–Schwarz shows that the following condition suffices for (2.5):

$$
M_2(x):=
\sum_{q\in I(x)}\frac{|T_q(x)|^2}{q}
=o_\eta\!\left(\frac{x^2}{(\log x)^2}\right).
\tag{3.1}
$$

This is a sufficient condition, not an asserted necessary consequence of Artin's density formula.

The character is real. Expanding the square separates the contribution with the same rational prime on both sides,

$$
D(x)=\sum_{x<p\le2x}\sum_{q\in I(x)}
 \frac{\varphi_q(\operatorname{Frob}_p)^2}{q},
$$

from the terms with two different primes. Formula (2.1) also yields the exact identity

$$
D(x)=\sum_{q\in I(x)}
\left((q-2)N_a(x,q)+\frac{A_q(x)}q\right).
\tag{3.2}
$$

This diagonal is negligible without any hypothesis about splitting. A summand is nonzero only when q divides p−1. Since q>x^η, each p−1<2x has at most log(2x)/(η log x)=O(1/η) such prime divisors. Also φ_q²/q≤q≤Q. Hence

$$
D(x)\ll_\eta Q\pi(2x)
\ll_\eta \frac{x^{3/2}}{(\log x)^{B+1}}
=o\!\left(\frac{x^2}{(\log x)^2}\right).
\tag{3.3}
$$

There is therefore no unavoidable diagonal mass preventing (3.1). The missing assertion is control of

$$
\sum_{\substack{x<p,r\le2x\\p\ne r}}
\sum_{q\in I(x)}
\frac{\varphi_q(\operatorname{Frob}_p)
      \varphi_q(\operatorname{Frob}_r)}q.
\tag{3.4}
$$

These terms can have either sign. Their required total is little-o at the scale in (3.1); treating them as individually positive would be unjustified.

## 4. What the available sieve estimate actually supplies

[Murty–Naik, Theorem 5 and its proof in §4.5](https://arxiv.org/html/2608.21573v1#S4.SS5) give the unconditional estimate

$$
\sum_{q\le Q}\sum_{c\in\mathbf F_q^\times}
\left|\sum_{\substack{p\le X\\p\equiv1\pmod q}}
 a_p e(i_p(a)c/q)\right|^2
\ll_\epsilon \frac{X}{\log\log X}
 \sum_{p\le X}|a_p|^2,\qquad Q\le X^{1-\epsilon}.
\tag{4.1}
$$

Their paper states results for a=2 and discusses other admissible bases in Remark 1.1. The upper-bound proof used here depends only on |e(t)|=1 and Brun–Titchmarsh, so it applies to every fixed a.

For the interval I(x), one can improve the final step of that proof. Set

$$
U_{q,c}=\sum_{\substack{x<p\le2x\\p\equiv1\pmod q}}
 a_p e(i_p(a)c/q).
$$

For each q,c, Cauchy–Schwarz gives

$$
|U_{q,c}|^2
\le A_q(x)\sum_{\substack{x<p\le2x\\p\equiv1\pmod q}}|a_p|^2.
$$

Sum over c, use A_q(x)≪x/(q log x), then exchange p and q. Since each p−1 has O(1/η) divisors q∈I(x),

$$
\begin{aligned}
\sum_{q\in I(x)}\sum_{c\ne0}|U_{q,c}|^2
&\ll \frac{x}{\log x}
 \sum_{x<p\le2x}|a_p|^2
 \#\{q\in I(x):q\mid p-1\}\\
&\ll_\eta\frac{x}{\log x}\sum_{x<p\le2x}|a_p|^2.
\end{aligned}
\tag{4.2}
$$

The index is i_p(a)=(p−1)/ord_p(a). By additive-character orthogonality and the splitting criterion,

$$
\varphi_q(\operatorname{Frob}_p)
=\mathbf1_{\{p\equiv1\pmod q\}}
 \sum_{c\in\mathbf F_q^\times}e(i_p(a)c/q).
$$

Take a_p=1 and apply Cauchy–Schwarz in c:

$$
M_2(x)
\le\sum_{q\in I(x)}\sum_{c\ne0}|U_{q,c}|^2
\ll_\eta\frac{x^2}{(\log x)^2}.
\tag{4.3}
$$

This is the correct **big-O** scale. It does not imply the **little-o** statement (3.1). Applying (4.1) without using the lower cutoff gives only the weaker bound O(x²/(log x log log x)); (4.3) is the sharper relevant comparison.

The same paper's stronger nonabelian large-sieve inequality is a conjectural input, not a proved replacement for (4.3). Its Theorem 4 retains a coprimality restriction that removes precisely the indices divisible by q; that restriction cannot be dropped for this application. No theorem from that paper has been promoted to a full-density result here.

## 5. The exact zero sum that would suffice

The single nonlinear L-function is

$$
L_q(s)=L(s,\rho_q).
$$

It is entire: ρ_q is induced from a nontrivial character of C_q, and its L-function is the corresponding nonprincipal Hecke L-function over E_q. Regular-representation factorization gives

$$
\zeta_{K_q}(s)=\zeta_{E_q}(s)L_q(s)^{q-1}.
\tag{5.1}
$$

This does not invoke the general Artin holomorphy conjecture. The factorization is also recorded in [Goldfeld, §3, equation (14)](https://www.math.columbia.edu/~goldfeld/LargeSieve.pdf).

The conductor-discriminant formula gives the exact relation

$$
\log\mathfrak f(\rho_q)
=\frac{\log|D_{K_q}|-\log|D_{E_q}|}{q-1}
\ll_a q\log(2q).
\tag{5.2}
$$

Thus L_q has degree q−1 and logarithmic conductor O_a(q log q). Under H(δ), all its nontrivial zeros lie in δ≤Re(s)≤1−δ. Reflection follows from its functional equation and the self-duality visible in (2.1).

Fix a nonnegative w∈C_c^∞((0,∞)), independent of q and x, with w≥1 on [1,2]. Let

$$
W(s)=\int_0^\infty w(t)t^{s-1}\,dt.
$$

W is entire and decreases faster than every inverse power of |Im(s)| in every fixed vertical strip. Define

$$
\Theta_{K,w}(x)=
\sum_{\mathfrak p}\sum_{j\ge1}
 \log N\mathfrak p\,w((N\mathfrak p)^j/x).
$$

The uniform smooth explicit formula in the October 4 manuscript,
[07-splitting.tex, equation spl:smooth-explicit-formula](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Primitive-roots-for-every-admissible-integer-base-October-4-2026/build/sections/07-splitting.tex), is

$$
\Theta_{K,w}(x)
=xW(1)-\sum_{\rho_K}x^{\rho_K}W(\rho_K)
 -(r_1+r_2-1)W(0)
 +O_w\!\left(x^{-1/2}
   (\log|D_K|+[K:\mathbf Q])\right).
\tag{5.3}
$$

The zeros are nontrivial and counted with multiplicity. The constant is uniform in K. Shifting the Mellin contour to Re(s)=−1/2 crosses, besides the nontrivial zeros and pole at 1, only the zero at 0 of order r₁+r₂−1. On that line the functional equation bounds ζ′_K/ζ_K by O(log|D_K|+[K:Q]log(|Im(s)|+3)); this also explains the uniform error.

Divide (5.3) for K_q by q(q−1). Equation (5.1) shows that the coefficient of each zero of L_q is exactly

$$
\frac{q-1}{q(q-1)}=\frac1q.
$$

Define the nonlinear zero sum

$$
Z_{a,w}(x;I)=
\sum_{q\in I(x)}\frac1q
 \sum_{\rho\text{ of }L_q}x^\rho W(\rho).
\tag{5.4}
$$

Under Dirichlet GRH, the cyclotomic zero contribution is bounded by

$$
\begin{aligned}
\sum_{q\in I(x)}
\frac1{q(q-1)}
 \sum_{\rho\text{ of }\zeta_{E_q}}|x^\rho W(\rho)|
&\ll_w\sqrt x
 \sum_{q\le Q}\frac{\log|D_{E_q}|+q-1}{q(q-1)}\\
&\ll_w\sqrt x\sum_{q\le Q}\frac{\log(2q)}q
\ll_w\sqrt x\log(2Q)=o(x).
\end{aligned}
\tag{5.5}
$$

This uses the uniform zero count and |D_Eq|=q^(q−2). The main terms sum to O_w(x^(1−η)). The residues at zero sum to O_w(π(Q)); the remaining errors sum to O_(a,w)(x^(−1/2)π(Q)log(2Q)). All are o(x). Thus

$$
\boxed{
\sum_{q\in I(x)}
\frac{\Theta_{K_q,w}(x)}{q(q-1)}
=-Z_{a,w}(x;I)+o_{a,w}(x).
}
\tag{5.6}
$$

The left side is nonnegative and at least log x times Σ_(q∈I)N_a(x,q). Therefore

$$
Z_{a,w}(x;I)=o(x)
\tag{5.7}
$$

is sufficient for the missing middle average. Even the one-sided bound −Re Z_(a,w)(x;I)≤o(x) suffices. The zero sum is real for real w, but the real-part formulation avoids relying on a choice of zero ordering. Absolute convergence follows from the smooth weight.

Prime powers need not be removed: their nonnegative contributions make the required upper bound valid.

## 6. A sufficient weighted zero-density estimate

Here is an explicit additional hypothesis that implies (5.7). It is a sufficient analytic condition, not a theorem established by this campaign and not a newly counted named conjecture.

For σ≥1/2 and T≥2, define

$$
\mathcal N_a(\sigma,T;Q)
=\sum_{\substack{q_0(a)<q\le Q\\q\text{ prime}}}\frac1q
 \#\{\rho\text{ of }L_q:
       \operatorname{Re}\rho\ge\sigma,\ 
       |\operatorname{Im}\rho|\le T\}.
$$

Suppose there are fixed C,D≥0 such that

$$
\boxed{
\mathcal N_a(\sigma,T;Q)
\ll_{a,\delta}
Q^{2(1-\sigma)}(\log Q)^D(T+3)^C
}
\tag{6.1}
$$

uniformly for Q,T≥2 and 1/2≤σ≤1−δ. The constant and exponents must not grow with q,Q,T or σ.

Choose a fixed decay order exceeding C+2 for W. Dyadic summation in height gives

$$
\sum_{q_0(a)<q\le Q}\frac1q
 \sum_{\substack{\rho\text{ of }L_q\\\operatorname{Re}\rho\ge\sigma}}
 |W(\rho)|
\ll_{a,\delta,w}
Q^{2(1-\sigma)}(\log Q)^D.
\tag{6.2}
$$

The same bound at σ=1/2 controls the whole weighted zero mass, up to a constant, by functional-equation reflection and a decay majorant uniform on δ≤Re(s)≤1−δ.

For β≥1/2, use the identity

$$
x^\beta=\sqrt x+\log x\int_{1/2}^{\beta}x^\sigma\,d\sigma.
$$

For β<1/2, use x^β≤√x and reflection. Equations (6.1)–(6.2) yield

$$
\begin{aligned}
\sum_{q_0(a)<q\le Q}\frac1q
 \sum_{\rho\text{ of }L_q}x^{\operatorname{Re}\rho}|W(\rho)|
\ll (\log Q)^D
\left[
 \sqrt x\,Q+
 \log x\int_{1/2}^{1-\delta}
 x^\sigma Q^{2(1-\sigma)}\,d\sigma
\right].
\end{aligned}
\tag{6.3}
$$

Set L=log x and Q=√x/L^B. Then

$$
x^\sigma Q^{2(1-\sigma)}
=xL^{-2B(1-\sigma)}
$$

and direct integration gives

$$
\int_{1/2}^{1-\delta}L^{-2B(1-\sigma)}\,d\sigma
\le\frac{L^{-2B\delta}}{2B\log L}.
$$

Consequently, the absolute zero sum is at most

$$
O_{a,\delta,w}\!\left(
x\left[
 L^{D-B}+
 \frac{L^{D+1-2B\delta}}{\log L}
\right]\right).
\tag{6.4}
$$

Choose

$$
B>\frac{D+1}{2\delta}.
$$

Since δ<1/2, this also gives B>D. Both brackets tend to zero. This proves (5.7), hence the missing middle average by (5.6), and hence the complete Artin density formula by the companion note.

**Conditional conclusion.** H(δ), Dirichlet GRH, and the additional family estimate (6.1) imply the full Artin density formula for the fixed base a. If these hypotheses hold for every admissible a, they imply the full named conjecture.

The signed zero-sum condition (5.7) is weaker than this absolute zero-density certificate. No proof of (6.1), or of an adequate substitute, has been found in the inspected sources. An estimate valid only up to logarithmic zero height would require a separate tail argument; the stated condition deliberately includes every T≥2.

## 7. Scope of the primary literature checked

The issue is the family with **a fixed and prime degree q growing**. Averaging a different parameter, or allowing constants to depend arbitrarily on the degree, does not supply (2.5) or (6.1).

| Primary source | Exact scope relevant here | Why it does not close this reduction |
|---|---|---|
| [Goldfeld, *A large sieve for a class of non-abelian L-functions* (1973), Theorem 2](https://www.math.columbia.edu/~goldfeld/LargeSieve.pdf) | The odd prime q is fixed; the Kummer parameter a varies. | The averaging parameter and degree uniformity differ from the fixed-a family needed here. |
| [Thorner–Zaman, *A zero density estimate for Dedekind zeta functions*, Theorem 1.1](https://arxiv.org/pdf/1909.01338) | A fixed finite Galois group G; fields ordered by discriminant Δ. The density bound includes an exponent 10⁷|G|³(1−σ), a logarithmic exponent |G|², and an intersection multiplicity. | Here G=G_q changes with q, |G_q|≈q², and log|D_Kq| can be O_a(q²log q). The discriminant parameter cannot be replaced by q, or the degree exponents suppressed. |
| [Lemke Oliver–Smith, *Faithful Artin induction and the Chebotarev density theorem*, Definition 1.8, Theorem 1.9 and Proposition 1.10](https://arxiv.org/pdf/2405.08383) | Fixed base field and degree bound d. Its effective prime-height range starts at (log|D_K|)^(2+[K:F]/(2ε)). | For K_q/Q the degree is q(q−1), and |D_Kq|≥|D_Eq|^q=q^(q(q−2)), so the theorem's stated height threshold exceeds every fixed polynomial in q. Moving to E_q changes the base field with q and still leaves growing relative degree. |
| [Klurman–Shparlinski–Teräväinen, *On Artin's conjecture on average and short character sums* (2025), Theorem 1.1](https://doi.org/10.1112/blms.70103) | Almost all integer bases in a growing interval; quantified exceptional set. | It does not establish the density assertion for each fixed admissible base. |
| [Järviniemi–Teräväinen, *Composite values of shifted exponentials*, Hypothesis 1.2 and Theorem 1.9](https://arxiv.org/pdf/2010.01789) | An averaged Kummer Brun–Titchmarsh input is assumed; the indicated implication uses a pair-correlation hypothesis. The family also varies a different parameter. | An additional conjectural average is not an available theorem for (2.5). |
| [Murty–Naik, *A non-abelian large sieve and Artin's primitive root conjecture* (2026)](https://arxiv.org/abs/2608.21573) | Prime-index trace family; conditional stronger sieve and unconditional weaker bounds. | Section 4 above gives the exact remaining big-O versus little-o gap. |

These checks do not prove that no relevant theorem exists. They identify the hypotheses and growing parameters in the principal candidate results inspected through November 20, 2026. Recent claims of primitive-root infinitude or positive lower density are separately recorded in the companion note and are not counted as new consequences.

## 8. Checkpoint

Established reductions:

- The missing interval can stop at √x/(log x)^B for any fixed B>0.
- Its negligibility is equivalent to the weighted nonlinear trace first moment (2.5).
- The sufficient second moment (3.1) has a negligible diagonal; the unresolved terms involve different primes.
- The available elementary sieve argument supplies (4.3), a big-O bound at the required scale, but no vanishing factor.
- Under Dirichlet GRH, the exact nonlinear zero weight is 1/q and the sufficient signed zero sum is (5.7).
- The explicit additional zero-density hypothesis (6.1), together with H(δ), closes the full density proof.

Unresolved input: prove (2.5), (3.1), (5.7), (6.1), or another estimate that controls the same middle tail. None has been inferred merely from Dirichlet GRH or from bounded normalized traces.

The factorization, Mellin normalization, archimedean residue and uniform remainder in §5 were independently checked by the nonabelian worker. The elementary diagonal calculation was checked separately from the second-moment sufficiency argument.

The root worker independently reviewed §§2–6 after the first commit: the qN=A+T identity, bounded-character weights, exact diagonal, restricted-range big-O estimate, nonlinear zero weight 1/q, reflection using a uniform height-decay majorant, and the integration requiring B>(D+1)/(2δ). No gap was found in those reductions. This review does not establish the additional average hypothesis.

Updated November 20, 2026. Coordination: [issue 80](https://github.com/1337isnot1337/solved-conjectures/issues/80).
