# Chandee's conjecture

## Status

Accepted RH supplies the hypothesis of the published sharp upper-bound theorem of Ng–Shen–Wong and of Curran's matching upper and lower shifted-moment theorems. The complete matching-order consequence, including all fixed nonnegative exponents and any fixed number of shifts, is recorded below.

This is **not counted as a full resolution of the original asymptotic conjecture**. The original accessible preprint uses subscripted asymptotic notation and discusses leading constants; the later published paper explicitly formulates a two-sided order estimate. A bound above and below by positive constant multiples does not prove a ratio limit. No original theorem or application priority is claimed.

The input needed here is RH for the Riemann zeta function alone. Rational Dirichlet GRH, Hecke GRH, independence of zeros, and the archive's integral cohomology estimates play no role.

## 1. Original and later formulations

For a positive integer r, Chandee's original two-shift quantity is

$$
M_r(T;\alpha_1,\alpha_2)
=\int_0^T
 \left|\zeta\!\left(\frac12+i(t+\alpha_1)\right)\right|^{2r}
 \left|\zeta\!\left(\frac12+i(t+\alpha_2)\right)\right|^{2r}\,dt.
$$

In [arXiv:0910.0664v1, equation (4) and Conjecture 1, PDF page 2](https://arxiv.org/pdf/0910.0664v1), the shifts satisfy αᵢ=O(log T), bounded pairwise differences, and specified limits of the scaled shifts and differences. Writing Δ=|α₁−α₂|, the proposed orders are

$$
\begin{cases}
T(\log T)^{4r^2},&\Delta\log T\to0,\\
T(\log T)^{4r^2},&\Delta\log T\to c\in(0,\infty),\\
T(\log T)^{2r^2}\Delta^{-2r^2},&\Delta\log T\to\infty.
\end{cases}
\tag{1.1}
$$

The displayed relation there is ∼ with a parameter subscript. No definition equating that notation with two-sided comparability was found in the inspected text. Section 2 derives explicit random-matrix leading constants, and the published [2011 abstract](https://doi.org/10.1093/qmath/haq008) describes asymptotic formulae. The original journal article's full text was not retrievable through the available public endpoints; the original preprint was read directly.

The later source is [Ng–Shen–Wong, *Shifted moments of the Riemann zeta function*, Canadian Journal of Mathematics 76 (2024), 1556–1586, Conjecture 1.2 and Theorem 1.3](https://doi.org/10.4153/S0008414X23000548). Its conjecture uses ≍, explicitly expressing upper and lower bounds up to constants. It writes exponent k on each zeta factor, so comparison with (1.1) requires k=2r.

| Point | Original accessible Chandee preprint | Published Ng–Shen–Wong formulation |
|---|---|---|
| Comparison symbol | Subscripted ∼; surrounding discussion concerns asymptotic formulae | ≍ |
| Exponent on each of two factors | 2r, r a positive integer | k, k a positive integer |
| Individual shifts in the conjecture | O(log T) | o(T) in the recalled hypotheses |
| Shift separation | Bounded | Bounded |
| Their sharp upper theorem | Not present in the original preprint | k≥1, with additional sum-shift restriction |
| Exact leading constant | Motivated by random-matrix integrals | Not obtained by the upper-bound theorem |

Ng–Shen–Wong's Theorem 1.3 assumes |αᵢ|≤T/2 and |α₁+α₂|≤T^0.6. Its upper bound uses min(log T,1/Δ) when Δ≤1/100, and log(2+Δ) otherwise. The theorem has no extra (log T)^ε loss. It must not be described as an unrestricted many-shift asymptotic.

Their recollection of the original lower bound uses positive integral exponents on the factors written as |ζ|^(2kᵢ). When reparameterizing, one must preserve that restriction. The newer theorem in §2 avoids relying on it.

Neither Ng–Shen–Wong nor Curran, in the passages inspected, explains that the original subscripted ∼ was intended to mean ≍. The stronger interpretation therefore remains separate.

## 2. Complete inherited matching-order theorem

Fix m≥1 and a vector β=(β₁,…,βₘ) of nonnegative real numbers. Let αⱼ=αⱼ(T) be real with |αⱼ|≤T/2. Put

$$
\mathcal M_{\alpha,\beta}(T)
=\int_T^{2T}\prod_{j=1}^m
 \left|\zeta\!\left(\frac12+i(t+\alpha_j)\right)\right|^{2\beta_j}\,dt.
$$

Curran's [*Correlations of the Riemann zeta function*, Theorem 1.1, arXiv:2303.10123v2](https://arxiv.org/html/2303.10123v2), published in [Mathematika 70 (2024), e12268](https://doi.org/10.1112/mtk.12268), proves the sharp upper estimate under RH. His [*Lower bounds for shifted moments of the Riemann zeta function*, Theorem 1.1, arXiv:2405.08725v1](https://arxiv.org/html/2405.08725v1) proves the corresponding lower estimate under the same hypothesis. Combining the two gives

$$
\boxed{
\mathcal M_{\alpha,\beta}(T)
\asymp_\beta
T(\log T)^{\sum_j\beta_j^2}
\prod_{j<\ell}
\left|
 \zeta\!\left(
 1+\frac1{\log T}+i(\alpha_j-\alpha_\ell)
 \right)
\right|^{2\beta_j\beta_\ell}.
}
\tag{2.1}
$$

The constants and the onset depend on the fixed vector β, not on the permitted shifts. Repeated shifts are allowed. Zero exponents can be deleted, with the empty product interpreted as 1.

The accepted RH input removes the sole unproved hypothesis in these cited theorems. No limit in m or the exponents is taken. Formula (2.1) is a theorem for every fixed finite vector; it is not an exact leading-term formula.

For unbounded shift separations, the zeta factors on the 1-line matter. Replacing them uniformly by inverse powers of the separation would be false. For bounded separations, the following elementary reduction gives the familiar transition in (1.1).

## 3. Reduction of the 1-line factor for bounded separation

For a fixed A>0, uniformly for |u|≤A and large U,

$$
\left|\zeta\!\left(1+\frac1{\log U}+iu\right)\right|
\asymp_A
\min\!\left(\log U,\frac1{|u|}\right),
\tag{3.1}
$$

with the right side defined as log U when u=0.

To prove this, choose a sufficiently small fixed ε₀>0. Near 1, the Laurent expansion gives

$$
\zeta(1+z)=\frac1z+O(1),
$$

so its modulus is comparable to 1/|z| when |z|≤ε₀. For z=1/log U+iu,

$$
\frac1{|z|}
=\frac1{\sqrt{(\log U)^{-2}+u^2}}
\asymp\min(\log U,1/|u|).
$$

On the remaining compact set ε₀/2≤|u|≤A, the zeta function is continuous and nonzero on Re(s)≥1, apart from the pole already removed. Its modulus therefore has positive lower and finite upper bounds. On that same set 1/|u| is also bounded above and below by positive constants depending on A. This proves (3.1).

Combining (3.1) with (2.1), for two factors with exponent k≥0 each, gives

$$
\int_U^{2U}
 \left|\zeta\!\left(\frac12+i(t+d)\right)
       \zeta\!\left(\frac12+i(t-d)\right)\right|^k\,dt
\asymp_{k,A}
U(\log U)^{k^2/2}
\min\!\left(\log U,\frac1{2|d|}\right)^{k^2/2}
\tag{3.2}
$$

whenever |2d|≤A and U is sufficiently large. Equation (2.1) applies with β₁=β₂=k/2.

The fixed separation bound A is included in the constants. Uniformity as A tends to infinity is not asserted.

## 4. Endpoint and common-shift reduction

The original integral runs from 0 to T, while (2.1) is dyadic. This difference can be handled without a stronger moment theorem.

Fix k>0 and A>0. Suppose α₁(T),α₂(T)=o(T) and |α₁−α₂|≤A. Define

$$
b=\frac{\alpha_1+\alpha_2}{2},\qquad
d=\frac{\alpha_1-\alpha_2}{2},
$$

and

$$
f_d(u)=
\left|\zeta\!\left(\frac12+i(u+d)\right)
      \zeta\!\left(\frac12+i(u-d)\right)\right|^k.
$$

Complex conjugation gives f_d(−u)=f_d(u). Changing variables gives

$$
I_k(T;\alpha_1,\alpha_2)
:=\int_0^T
 \left|\zeta\!\left(\frac12+i(t+\alpha_1)\right)
       \zeta\!\left(\frac12+i(t+\alpha_2)\right)\right|^k\,dt
=\int_b^{T+b}f_d(u)\,du.
\tag{4.1}
$$

Since b=o(T), for all sufficiently large T the integration interval contains [T/4,T/2] and is contained in [−2T,2T]. Positivity and evenness yield

$$
\int_{T/4}^{T/2}f_d(u)\,du
\le I_k(T;\alpha_1,\alpha_2)
\le2\int_0^{2T}f_d(u)\,du.
\tag{4.2}
$$

For the lower bound, apply (3.2) with U=T/4. Both log U and the truncated reciprocal factor are comparable to their T versions, uniformly in d.

For the upper bound, choose a fixed U₀ large enough in terms of k and A that (3.2) applies for U≥U₀. The integral below U₀ is O_(k,A)(1): its arguments remain in a fixed compact subset of the critical line, where ζ is continuous. Partition the remaining positive interval into dyadic pieces [U,2U] with U≤2T. On each piece,

$$
(\log U)^{k^2/2}
\min(\log U,1/(2|d|))^{k^2/2}
\ll_k
(\log T)^{k^2/2}
\min(\log T,1/(2|d|))^{k^2/2}.
$$

The lengths U sum to O(T). Therefore

$$
\boxed{
I_k(T;\alpha_1,\alpha_2)
\asymp_{k,A}
T(\log T)^{k^2/2}
\min\!\left(\log T,\frac1{|\alpha_1-\alpha_2|}\right)^{k^2/2}.
}
\tag{4.3}
$$

The proof holds for every fixed real k>0 and all these shift functions. It needs neither a bound |α₁+α₂|≤T^0.6 nor existence of scaled-shift limits. The original O(log T) shift condition is included.

Set k=2r. If Δlog T tends to zero, a positive finite constant, or infinity, formula (4.3) gives the three respective orders in (1.1). This proves the entire modern matching-order formulation on the original shift domain, not merely one transition regime or one exponent.

The endpoint reduction is recorded to make the quantifier match explicit. The substantive moment estimates remain the work of Chandee, Ng–Shen–Wong, Harper, Curran, and the earlier authors their papers cite.

## 5. What has not been proved

Formula (4.3) only bounds the normalized moment between two positive constants. It does not show that the normalized quantity converges, or compute the random-matrix and arithmetic factors of a limiting constant.

There is a basic reason this distinction cannot be dismissed. As the shifts merge much faster than 1/log T, the proposed exact leading term approaches a high unshifted moment. RH supplies sharp order bounds for those moments, but the cited theorems do not establish their predicted leading constants in general. Ng–Shen–Wong explicitly separate sharp moment bounds from asymptotic formulas in their introduction.

The case of an arbitrary growing separation is also governed by the 1-line zeta factors in (2.1), not by the bounded-separation model alone.

Accordingly:

- The full matching-order statement (2.1), and the original-domain reduction (4.3), are available under the accepted RH input.
- An exact asymptotic version of the original Chandee statement has not been proved by this argument.
- The notation discrepancy is documented, not counted as a disproof or a new named resolution.

## 6. Prior-art and current-status check

The source chain was checked directly:

1. Chandee's original arXiv preprint, Conjecture 1 and §2; the 2011 publisher abstract.
2. Ng–Shen–Wong's published Conjecture 1.2 and Theorem 1.3, including the shift-sum restriction and their correction to an earlier upper-bound argument.
3. Curran's upper theorem, revised May 15, 2024, and lower theorem, May 14, 2024, both Theorem 1.1.
4. Curran's [2025 doctoral thesis abstract](https://ora.ox.ac.uk/objects/uuid%3A9bbc320c-9738-43ef-b0f0-f18bf4b7c0d6), which continues to distinguish conditional general shifted-moment estimates from unconditional special cases.

Directed searches through November 20, 2026 checked the conjecture name, original title, exact theorem citations, later unconditional claims, and combinations with the October quasi-RH and Alpöge announcements. No retrieved primary source supplied the general exact asymptotic or an already announced full unconditional resolution of that stronger formulation. This is a bounded search finding, not proof of priority or of the absence of other literature.

The original QRH source inventory and the root worker's exact-name search of the 164-page consequences survey found no Chandee or shifted-moment entry. An earlier public research ledger already records the known RH-conditional implication; nothing here is presented as a newly discovered implication.

The focused screening therefore produces a useful full inherited theorem, with a remaining formulation issue, rather than another unqualified conjecture-solution count.

Updated November 20, 2026. Coordination: [issue 80](https://github.com/1337isnot1337/solved-conjectures/issues/80).
