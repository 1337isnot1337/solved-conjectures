# Gyires ratio inequality: discovery and analytic reduction

20 November 2026. Full conjecture remains open. No novelty or resolution claim.

## Status and scope

For real doubly stochastic A of order n, put c_n=n!/n^n. Gyires (1978) asks

  4 per(A)^2 >= c_n [per(AA^T)+per(A^T A)+2 per(A^2)],

with equality only at J_n. Primary historic statement: Cheon–Wanless (2005), Conjecture20, printed p327, https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf . Latest specialist page https://yair-lavi.com/mincs-list/conjecture-20/index.html (site updated Nov15 2026) records general case open, order4 proved by Ozols2026 and several structured families. Searched Gyires 2026, ratio inequality proof/counterexample, and stochastic Gram permanent inequalities; no general solution located. Live repository issues checked: no Gyires claim at time of inspection. No external issue posted by this worker.

## Exact probabilistic reformulation

Let q_A(m), for nonnegative integer occupation vectors m of total n, be the distribution of counts obtained by independently selecting a column from each row of A. Write m!=product_i m_i!, and let pi(m)=n!/(n^n m!) be the uniform multinomial distribution. Then

  q_A(m)=per(A with column j repeated m_j times)/m!,
  q_A(1,...,1)=per A,
  per(AA^T)=sum_m m! q_A(m)^2
             = c_n sum_m q_A(m)^2/pi(m).

The first equality follows by grouping the intermediate indices in the permanent Cauchy–Binet formula. Similarly

  per(A^T A)=c_n ||q_{A^T}/pi||_{L2(pi)}^2,
  per(A^2)=c_n <q_A/pi,q_{A^T}/pi>_{L2(pi)}.

Consequently Gyires is exactly

  || (q_A+q_{A^T})/(2pi) ||_{L2(pi)} <= per A/c_n.

This reformulation is not asserted new. It isolates a possible symmetric likelihood inequality rather than a numerical-order problem.

A tempting stronger lemma per(AA^T)<=per A is FALSE: A=(I+C4)/2 gives per A=1/8 and per(AA^T)=9/64. Do not use a blanket permanent contraction claim.

## Uniform dense regime (derived partial result)

Fix A0<infinity, r<1. Let A=J_n+B be doubly stochastic with maxentry(B)<=A0/n and opnorm(B)<=r. Put S=||B||F^2. Suppose S sqrt(n) -> infinity. Then Gyires holds strictly for sufficiently large n, uniformly over any such sequence. This does not cover all dense matrices, let alone the full conjecture.

Proof using audited Divoux–Wang rate extraction:

  per(A)/c_n = Delta(B)+O(n^-1/2),
  Delta(X)=det(I-X^T X)^(-1/2).

The products AA^T, A^T A, A^2 have centered parts BB^T, B^T B, B^2. Their maxentries<=A0^2/n and opnorms<=r^2, so the same estimate applies uniformly. Write singular values of B as s_i and

  D1=product_i (1-s_i^2)^(-1/2),
  D2=product_i (1-s_i^4)^(-1/2).

Delta(BB^T)=Delta(B^T B)=D2. For B^2, Schatten Holder gives ||B^2||_{2m} <= ||B||_{4m}^2, hence the convergent logdet series implies Delta(B^2)<=D2.

The normalized Gyires ratio is therefore at least D1^2/D2+O(n^-1/2). All factors are uniformly bounded above and away from zero. Moreover

  log(D1^2/D2)=1/2 sum_i log((1+s_i^2)/(1-s_i^2)) >= S.

Thus the ratio is >=exp(S)-O(n^-1/2)>1 under the stated assumption.

## Remaining full-proof obstruction

The Gaussian asymptotic error is presently absolute, not relative to S. A uniform error O(S/n) would bridge the near-J regime and prove eventual validity for fixed entry/op bounds, but has NOT been proved here. Even that would leave sparse or nearly decomposable matrices outside these bounds. Neither dense-regime asymptotics nor fixed-order computations settle Gyires.

## Audit clarifications and prior art

Define the normalized Gyires ratio explicitly as

  R(A)=4 per(A)^2 / {c_n [per(AA^T)+per(A^T A)+2 per(A^2)]}.

The dense-regime hypotheses use max_{i,j}|B_ij|, not an induced matrix norm. The conclusion is R(A)>1 eventually along each admissible sequence with S sqrt(n)->infinity; the threshold also depends on how quickly that sequence leaves the O(n^-1/2) error scale. No uniform numerical threshold across all such sequences is asserted. This result gives neither the full conjecture nor its equality characterization.

Prior nearby results include Chang (1990), *On two permanental conjectures*, DOI10.1080/03081089008817977: the inequality holds if every entry of A is at least (n−2)/(n−1)^2. The current Lavi catalogue records a Frobenius ball ||A−J||F<=3/[4(n−1)] for n>=5, strict off J, and an unspecified punctured neighborhood in every order. Parent audit identified Gyires1981 multinomial prior art; the occupancy reformulation here must not be advertised as a new idea without inspecting that original reference.

## Two further exact obstructions to pointwise likelihood arguments

For A=(I+C4)/2, the row-factor polynomials of A and A^T coincide: both are (x1+x2)(x2+x3)(x3+x4)(x4+x1)/16. Thus q_A=q_{A^T}. At m=(2,0,2,0), q_A(m)=1/16, m!q_A(m)=1/4, whereas per A=1/8. So even the SYMMETRIZED likelihood is not pointwise maximized at the balanced occupation. Moreover per(A)^2/c4=1/6<1/4: the squared pointwise envelope is false as well. Gyires itself is not violated: per(AA^T)=per(A^T A)=per(A^2)=9/64, giving R=32/27>1.

An independent colleague supplied another exact counterexample to the one-sided pointwise envelope: A=(1/100)[[12,36,52],[57,43,0],[31,21,48]], perA=31853/125000, and at m=(1,0,2), m!q_A(m)=4446/15625, larger by743/25000. This rules out that intermediary, not Gyires.

## Relevant probability literature inspected

Han–Niles-Weed, *Approximate independence of permutation mixtures*, arXiv:2408.09341v3, develops chi-square/permanent identities, zero-sum elementary-symmetric bounds, and PSD doubly-stochastic permanent bounds. Its Sections5.1–5.3 are directly relevant background, but no theorem establishing the global Gyires likelihood inequality was found there. Its overlap matrix is PSD; applying it to AA^T alone does not supply the needed lower bound on per A.
