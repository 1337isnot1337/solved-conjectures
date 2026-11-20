# Simm–Wei conjecture: RH transfer and complex-coefficient audit

Research checkpoint: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Status

Accepting the RH input for this campaign, the classical implication RH to Lindelöf removes the hypothesis from **Najnudel–Wei's already published conditional argument** for the normalized Simm–Wei moment formula. The argument is in a preprint submitted on 16 November 2026; this note records a theorem-level transfer and scope audit, not a full independent validation of that manuscript.

No original solution credit is claimed. The new conditional moment theorem belongs to Joseph Najnudel and Fei Wei. The complex-coefficient observation below prevents an unjustified assertion that the leading coefficient is nonzero everywhere. It is not being counted as a disproof based on a convention for asymptotic notation.

Primary sources:

- Simm and Wei, *On moments of the derivative of CUE characteristic polynomials and the Riemann zeta function*, [arXiv:2409.03687v2](https://arxiv.org/html/2409.03687v2), §1.3, Conjecture 1 and equations (1.26)–(1.27); [published version, JLMS 113 (2026), e70487](https://doi.org/10.1112/jlms.70487).
- Najnudel and Wei, *Complex Moments of the Derivative of the Riemann Zeta Function*, [arXiv:2611.21551v1](https://arxiv.org/html/2611.21551v1), Theorems 1.2 and 1.3, Corollary 1.4, and §4.1.
- [Uniform RH-to-Lindelöf derivation in this campaign](dirichlet-applications.md). Only the classical zeta case is needed here.

## Original domain and order of limits

The original zeta conjecture concerns **every complex s with positive real part**. Its domain is not the half-plane with real part greater than minus one. That latter domain occurs in Simm–Wei's separate random-matrix Theorem 1.1.

For sigma greater than one-half, define the long-time mean

~~~math
M_s(\sigma)=
\lim_{T\to\infty}\frac1T\int_1^T
|\zeta'(\sigma+it)|^{2s}\,dt.
~~~

The complex power means the exponential of 2s times the real logarithm of the positive modulus; at a zero of the derivative, define the integrand as zero. This gives its continuous extension when the real part of s is positive.

Write delta equal to 2sigma minus one, a positive real number. All powers of delta below use its real logarithm. Define

~~~math
a_s=
\prod_p(1-p^{-1})^{s^2}
\sum_{k=0}^\infty
 \left(\frac{(s)_k}{k!}\right)^2p^{-k},
\qquad
h_s=e^{-s^2}\Gamma(s+1)
 {}_1F_1(s+1;1;s^2),
\qquad
C(s)=a_sh_s.
~~~

The limit is iterated:

1. Fix sigma greater than one-half and s, then let T tend to infinity.
2. After this mean has been formed, let sigma decrease to one-half.

Neither source theorem used here proves an arbitrary simultaneous scaling of sigma with T. The result does not supply moments on the critical line itself.

## The transfer theorem

Assume classical RH. Use the two numbered theorems of Najnudel–Wei as published mathematical inputs. Then, for every complex s with positive real part, the inner mean exists for every fixed sigma greater than one-half, and

~~~math
\lim_{\sigma\downarrow1/2}
 (2\sigma-1)^{s^2+2s}M_s(\sigma)=C(s).
~~~

Equivalently,

~~~math
M_s(\sigma)=
(2\sigma-1)^{-s^2-2s}\bigl(C(s)+o(1)\bigr).
~~~

### Proof

Classical RH implies the Lindelöf hypothesis, as derived in the linked note.

Najnudel–Wei Theorem 1.3 uses Lindelöf to identify, for every fixed sigma greater than one-half and every s in the stated half-plane,

~~~math
M_s(\sigma)=
\mathbb E\bigl[|\zeta'(\sigma,X)|^{2s}\bigr],
~~~

where the right side is the derivative moment of their random Euler product.

Their Theorem 1.2, an unconditional random-model theorem, states

~~~math
\lim_{\sigma\downarrow1/2}
(2\sigma-1)^{s^2+2s}
\mathbb E\bigl[|\zeta'(\sigma,X)|^{2s}\bigr]
=C(s).
~~~

Substitution proves the asserted normalized iterated limit. No interchange of the T limit and the sigma limit is used. Theorem 1.2 also gives local uniformity in s for the normalized outer limit. This does not assert an unproved uniform interchange of limits.

The input from the RH announcement is therefore only classical RH. No Dirichlet, Hecke, or automorphic extension is required for this consequence.

## Why a ratio statement needs an extra qualification

The original conjecture writes a ratio asymptotic with leading coefficient C(s). A ratio statement is meaningful only when C(s) is nonzero.

For positive real s, all terms in each prime sum defining a_s are positive, and its normalized Euler factors equal one plus a summable error. Thus a_s is strictly positive. Also, every term in the series defining the displayed confluent hypergeometric function is positive, and the remaining factors in h_s are positive. Consequently C(s) is strictly positive for every positive real s. The normalized theorem then yields the genuine ratio asymptotic

~~~math
M_s(\sigma)\sim
\frac{C(s)}{(2\sigma-1)^{s^2+2s}},
\qquad s>0.
~~~

For complex s the coefficient has zeros. This is an analytic fact, not merely a numerical suspicion.

### 1. A prime factor is a Legendre function

Fix any prime p and set

~~~math
m_p(s)=\sum_{k=0}^\infty
       \left(\frac{(s)_k}{k!}\right)^2p^{-k}
={}_2F_1(s,s;1;p^{-1}),
\qquad
x_p=\frac{p+1}{p-1}>1.
~~~

Pfaff's transformation and the hypergeometric representation of the Legendre function give

~~~math
m_p(s)=(1-p^{-1})^{-s}P_{s-1}(x_p).
~~~

The identities are [DLMF 15.8.1](https://dlmf.nist.gov/15.8.E1) and [DLMF 14.3.6](https://dlmf.nist.gov/14.3.E6), with order zero. Their factors are unambiguous here because their bases are positive real numbers.

Put x_p equal to cosh eta, with eta positive, and let s equal one-half plus i tau. Then the Legendre degree is minus one-half plus i tau.

### 2. Stationary phase forces infinitely many zeros

The order-zero case of [DLMF 14.12.7](https://dlmf.nist.gov/14.12.E7) gives

~~~math
P_{-1/2+i\tau}(\cosh\eta)=
\frac1\pi\int_0^\pi
(\cosh\eta+\sinh\eta\cos\theta)^{-1/2+i\tau}
\,d\theta.
~~~

Write this integrand as A(theta) times the exponential of i tau f(theta), where

~~~math
f(\theta)=\log(\cosh\eta+\sinh\eta\cos\theta),
\qquad
A(\theta)=e^{-f(\theta)/2}.
~~~

The phase has no stationary point in the open interval. At its two endpoints,

~~~math
f(0)=\eta,\quad f(\pi)=-\eta,
\qquad
f''(0)=-e^{-\eta}\sinh\eta,\quad
f''(\pi)=e^\eta\sinh\eta.
~~~

Both are nondegenerate. The endpoint amplitudes divided by the square roots of the absolute second derivatives are equal:

~~~math
\frac{A(0)}{\sqrt{|f''(0)|}}
=\frac{A(\pi)}{\sqrt{|f''(\pi)|}}
=\frac1{\sqrt{\sinh\eta}}.
~~~

Split the integral using smooth cutoffs near the two endpoints and an interior cutoff. Integration by parts makes the interior contribution smaller than every fixed negative power of tau. The standard one-sided stationary-phase expansion gives conjugate endpoint contributions. Therefore, as tau tends to positive infinity,

~~~math
P_{-1/2+i\tau}(\cosh\eta)
=
\sqrt{\frac{2}{\pi\tau\sinh\eta}}\,
\cos(\tau\eta-\pi/4)
+O_\eta(\tau^{-3/2}).
~~~

The function is real for real tau: complex conjugation changes the degree to minus one-half minus i tau, while the degree symmetry of P leaves its value unchanged.

Take tau_n equal to (n pi plus pi/4) divided by eta. The leading cosine equals minus one to the power n. For all sufficiently large n, the error is smaller than the magnitude of the leading term. Thus the values at consecutive tau_n alternate in sign. Continuity supplies a zero between each consecutive pair.

Hence m_p(s) has infinitely many zeros on the line with real part one-half.

### 3. These are zeros of the arithmetic coefficient

On each compact set of complex s, the normalized local factor in a_s has the expansion

~~~math
(1-p^{-1})^{s^2}m_p(s)=1+O_K(p^{-2}).
~~~

Its Euler product therefore converges locally uniformly. A zero of one fixed local factor makes a_s zero; the remaining infinite product is finite. The function h_s is holomorphic and finite in the half-plane of positive real part, since the gamma factor has no pole there. Therefore C(s) also vanishes at the points just constructed.

At such an s, the normalized-limit theorem says that the displayed scale times M_s tends to zero. It does not justify division by C(s).

## Exact conclusion and credit

The robust all-complex statement is the normalized-limit formula. The ratio formulation holds wherever C(s) is nonzero and, in particular, for every positive real s.

Najnudel–Wei's Theorems 1.2 and 1.3 explicitly support this all-complex normalized statement. Their Corollary 1.4 is phrased for positive real s under Lindelöf; its proof in §4.1 displays the normalized complex limit. The distinction is material and should be preserved when citing the result.

The accepted RH input removes the Lindelöf assumption. This is a direct application of an existing conditional theorem. It is not an original derivation of Najnudel–Wei's random-model analysis, and it does not merit a new solved-conjecture entry credited to this campaign.

## Prior-art record

The search checked the original arXiv version, its 2026 journal version, exact-name and title searches, the new November preprint, its numbered theorem statements, its proof of the corollary, and special-function identities needed for the coefficient audit.

The original paper already proves all positive integer instances under Lindelöf. The new preprint claims the whole complex half-plane in normalized form and an unconditional restricted strip. Listing either old integer instances or the already unconditional strip as new campaign solutions would misstate priority and scope.

No assertion is made here that the November preprint has already completed independent specialist review. Its results are explicit inputs to this application, just as the user-requested RH result is an explicit input. The coefficient-zero audit uses standard identities and an analytic argument; it does not depend on the validity of the November preprint.
