# A quantitative codegree-variance gap

For every triangle-free graphon with edge density 6/25≤p≤8/25, the codegree variance from [CODEGREE-VARIANCE](CODEGREE-VARIANCE.md) satisfies

    ν = t(C₄) − t(P₃)²/(1−p) > 10^(-8).

This is an explicit strict structural inequality throughout the middle band of [Erdős #23](https://www.erdosproblems.com/23). The constant is only a conservative witness of a gap, not an optimization or a solution to the cut conjecture.

## Operator estimates

Write T for the graphon integral operator, J for projection onto constants, K for the kernel of T², μ=t(P₃)/(1−p), and E=T²+μT−μJ. Put ε=√ν. Triangle-freeness implies WK=0 almost everywhere. Expanding the Hilbert–Schmidt norm gives the exact identity

    ν = ||E||_HS² + μ²(p−∫W²).

In particular ||E||_HS≤ε. Also μ≥p²/(1−p)>3/40. Let g=T1−p. The commutator [T,E]=−μ[T,J] controls the degree variance: ||[T,J]||_HS²=2||g||₂², while ||[T,E]||_HS≤2√p ε because ||T||_op≤||W||₂≤√p. Hence

    t(P₃)−p² = ||g||₂² ≤ 2pν/μ².

Let P project orthogonally onto the span of the constant function and the eigenspaces of T with |λ|>μ/2. Its rank r is at most 1+4p/μ²<229. On the small-eigenvalue subspace T+μI has inverse norm at most 2/μ. If R is the spectral projection onto that subspace, then

    (I−P)T = (I−P)E (T+μI)^(-1) R,

where the inverse is used only on the range of R. Indeed the large eigenspaces are killed by I−P, and (I−P)J=0. It follows that ||(I−P)T||_HS²≤4ν/μ².

Set K_P(x,y)=⟨P W(x,·), P W(y,·)⟩. The kernel K−K_P is positive semidefinite, with trace ||(I−P)T||_HS², so

    ||K−K_P||_HS ≤ 4ν/μ².

The diagonal mass a=∫K_P(x,x)dx therefore satisfies a≥p−5ν/μ², using ∫W²≥p−ν/μ² from the first identity.

## A finite-rank trace witness

Define F(x,y)=K_P(x,y)²−μK_P(x,y), where this square is pointwise, not operator composition. As K_P is a Gram kernel with at most r coordinates, F has rank at most r(r+1)/2+r. Its trace is the diagonal integral, which by Jensen is at least a²−μa.

On the other hand, K(K−μ)=K·E pointwise because WK=0. Thus ||K²−μK||₂≤ε. Since |K_P|,|K|≤1 and μ≤1, replacing K by K_P gives

    ||F||_HS ≤ ε + 3||K−K_P||_HS ≤ √ν+12ν/μ².

For any self-adjoint finite-rank kernel, |tr F|≤√rank(F)·||F||_HS by Cauchy–Schwarz on eigenvalues.

If ν≤10^(-8), the previous bounds, using p∈[0.24,0.32] and μ>0.075, give

    a>0.239,     μ<0.151,     ||F||_HS<0.000122,     √rank(F)<164.

For μ, use [p²+2pν/μ²]/(1−p); for the other estimates the displayed inequalities apply directly. But then the trace is greater than 0.239·(0.239−0.151)=0.021032 and simultaneously less than 164·0.000122=0.020008. This contradiction proves the quantitative assertion. The argument covers nonbinary kernels as well, by the p−∫W² error term.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
