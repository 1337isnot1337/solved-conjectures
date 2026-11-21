# Independent analysis review

21 November 2026. The complete all-sufficiently-large disproof in PROOF.md passes mathematical review. The reviewer independently read the original statement and correspondence in arXiv:2609.38084v1, independently derived the asymptotic constants and variance obstruction, and independently recomputed the unrestricted exact witness. This is an internal review.

## Source scope

Primary source:
https://arxiv.org/html/2609.38084v1

Section 2.1 defines ultra log-concavity by division by binomial(d,i). Corollary 3.13 gives exactly both formulas (7) in the proof, with semilength n for the unrestricted model and n-1 for the connected model. Its convention H(0,0)=1 also matches the boundary case. The height convention is the usual maximum of a Dyck path. Conjecture 3.14 asserts both families for all positive n. Therefore the distributions ceil(M_n/2) and 1+floor(M_(n-1)/2) and their respective Catalan normalizations are correct.

The source also reports a computation through n=200. The exact finite-degree witnesses contradict that report, so retaining the discrepancy explicitly is necessary. The stronger Poisson-normalized failure and the general asymptotic theorem do not depend on a disputed finite ambient degree.

## Review of the argument

- Poisson ultra log-concavity makes k p_k/p_(k-1) nonincreasing. The size-biased distribution relative to the shifted original distribution consequently has one positive-to-negative crossing, including the initial-support boundary. The resulting stochastic comparison yields E[X^2]/E[X] <= E[X]+1 and hence Var(X)<=E[X]. Finite-order ultra log-concavity implies that stronger ratio inequality.

- The path-graph eigenvalues and endpoint eigenvector weights are correct. The even power makes every summand nonnegative. With h=floor(sqrt(N)), the first and last summands produce the constant 4*pi^(5/2)*exp(-pi^2) after division by C_N. Thus a height of at most sqrt(N) has a positive lower limiting probability.

- The ballot formula for the midpoint is correct. Uniform Stirling asymptotics on k/sqrt(N) in [2,3] give mass (8/sqrt(pi))*x^2*exp(-x^2)/sqrt(N). The parity mesh is two, yielding exactly the factor 4/sqrt(pi) in the limiting integral. This gives a second, separated height range with positive probability.

- Reflection after the first visit to h bijects balanced walks reaching h with unrestricted walks ending at 2h. Applying it only as an upper bound to the Dyck subset is valid. The logarithm of the binomial ratio is at most -h^2/(N+h), hence at most -h^2/(2N). With h=ceil(N^(3/4)), the claimed sublinear first-moment bound follows.

- Both rounding maps differ from half the height by at most one. On the separated events, the rounded variables differ by at least sqrt(N)/2-1. Using independent copies gives variance at least c_0*c_1*(sqrt(N)/2-1)^2; the later linear lower bound is valid for all sufficiently large N. The first moment is o(N). Their ratio therefore tends to infinity, so the necessary variance inequality fails eventually for both families.

One small clarification would make the support hypothesis explicit: for every 1<=h<=N, the path U^h D^h (UD)^(N-h) has maximum exactly h. Thus the grouped-height distributions have no internal zeros. This is immediate but connects the source distributions directly to the hypothesis of Section 1.

## Independent exact witness

Using a fresh, short integer-only dynamic program, I counted walks of length 420 confined to heights 0 through h for h=30,32,34,36. Consecutive differences reproduce all three coefficients b_16,b_17,b_18 recorded in witnesses.json at n=210. Direct integer arithmetic gives

17*b_17^2 - 18*b_16*b_18 < 0.

This independently confirms failure of the Poisson normalization. I did not use the author's check.py implementation. The finite witness supplements the general proof; no finite screen is used to justify the asymptotic theorem.

## Priority limit

This review validates the mathematics and original-source scope. The separate novelty audit must still establish that no earlier full disproof has been located, using repository history, all issues, both search engines, and public exact-identifier searches. Nothing in this review asserts exhaustive priority.

