# Independent review of the Pula–Song–Wanless threshold proof

Reviewer: sign-matrix worker. Initial review: 2026-11-20. Corrected review: 2026-11-20.

Reviewed draft: [proof.md](proof.md).

Reviewed primary source: Pula, Song and Wanless, *Minimum permanents on two faces of the polytope of doubly stochastic matrices*, Linear Algebra Appl. 434 (2011), 232–238, DOI 10.1016/j.laa.2010.08.015. Complete author preprint: https://cs.du.edu/~mathfiles/preprints/nsm-math-preprint-1022.pdf .

## Result of review

The scalar threshold argument and both non-barycentricity arguments check out. My initial review accepted the published equalization theorem as an external input. Song's 2013 remarks prompted a deeper check, which exposed a gap in that proof. A replacement argument was then found and independently verified below. The corrected result proves minimum attainment by A_0 and noncohesiveness at and above the threshold. Full-face uniqueness was temporarily removed pending an independent proof; the subsequent completion argument below now establishes it without invoking the published U-face uniqueness theorem.

With that correction, the proposed result completes the stated parameter-family conjecture when combined with the credited prior cohesive direction and small-parameter results. It does not characterize arbitrary cohesive or barycentric supports and does not settle either full Minc Problem 14 or full Minc Problem 15. The separate prior-art audit determines novelty.

## Source-dependent reduction

The source begins Section 2 with an arbitrary permanent minimizer Y. It explicitly invokes Minc's averaging theorem on the last m rows and columns to obtain its displayed block form (1). This averaging input is retained. The source's subsequent equalization argument is replaced by the proof below; it must not be imported without repair.

The last-block entry sum is unchanged by averaging within those rows and columns. Once the reduced minimizer is forced to have lower-right parameter x=0, every original nonnegative minimizer has a zero lower-right block. This proves noncohesiveness. Existence of an averaged minimizer and the scalar result prove that A_0 attains the global minimum. The independent uniqueness argument below also uses no equality characterization for the averaging theorem and no U-face uniqueness theorem.

The source extraction can confuse >= and >. The replacement equalization argument below is valid for m,n>=2. The threshold argument uses n>m, which follows from n>=m+sqrt(m) for positive m. The m=1 case can continue to be credited to Brualdi.

## The published perturbation gap and its repair

Let a=a_1<b=a_n, s=a+b, p=ab, x_1=1-ma, and x_n=1-mb. With the other parameters and s fixed, the actual permanent is

P(p)=(1-ms+m^2p)p_0 + m^2[s^2-(2+ms)p]p_1 + m^2(m-1)^2p^2p_2.

The p_j are fixed along this perturbation. The cofactor identities in the published proof hold only at the minimizing point. Substituting them yields the simpler expression m p_1(s-mp) at that point, but this expression is not the permanent along the perturbation. Indeed, in the interior case the identities make P'(p)=0 and P''(p)>0. Thus varying the simplified expression does not establish equalization.

The replacement uses additional structure of the minor. At a minimizer the positive cross entries give

(m-1)^2 ab p_2 = p_1 > 0.

The positivity follows because p_1=0 would also force p_2=0 and hence per(Y)=0 in the cross-cofactor expansion, contrary to Y being doubly stochastic. Since a<b<=1/m, x_1>0. The cofactor at x_1 equals per(Y), while the cofactor at x_n is at least per(Y), whether x_n is positive or zero. Subtracting gives

p_0 >= m(a+b)p_1.

Now replace every lower-right entry of the p_0 minor by y. Writing D_i=1-ma_i>=0 for its remaining upper diagonal entries, its permanent is exactly

q(y)=m! [product_(i != 1,n) (D_i+a_i^2 d/dy)] y^m.

This formula follows by choosing which upper rows use the cross block. Each operator c+d(d/dy), with c,d>=0, preserves the property of having only nonpositive real roots, unless it annihilates the polynomial. It follows by the standard derivative interlacing argument; pure derivatives cover c=0 directly. Hence no division by D_i and no positivity assumption on those diagonal entries are necessary.

At the actual lower-right value, q=p_0>0, so the zero-polynomial possibility is excluded. A real-rooted polynomial with nonpositive roots satisfies q'^2>=q q''. Symmetry of the m bottom rows and columns gives

q'=m^2 p_1,
q''=m^2(m-1)^2 p_2.

Consequently p_0 p_2 <= m^2 p_1^2/(m-1)^2. Combining with the cross-cofactor identity gives p_0<=m^2 ab p_1. The two bounds on p_0 force

1/a+1/b <= m.

But a,b<=1/m implies 1/a+1/b>=2m, a contradiction. Therefore all cross parameters agree. This proof covers zero upper diagonals and lower-right value zero, and it never varies a minimizer-only identity.

The alerting source was Song, *Minimum permanents on doubly stochastic matrices with prescribed zeros*, Honam Mathematical Journal 35 (2013), 211-220, DOI 10.5831/hmj.2013.35.2.211: https://koreascience.or.kr/article/JAKO201319133640171.pdf . The authoring worker is auditing its exact statements and later citations.

## Independent full-face uniqueness argument

Let d=n-m>0 and a=d/n. Every minimizer has zero lower-right block by the preceding mass-preservation argument. Averaging the last rows and columns does not alter its upper diagonal, and the reduced minimizer has upper diagonal aI_n. Thus an arbitrary original minimizer is

Y=[[aI_n,L],[K,0]],

where L has n rows and m columns, K has m rows and n columns, each row of L and each column of K sums to m/n, and each column of L and each row of K sums to one.

Average only the bottom rows. This preserves minimality and L, and makes K=J_(m,n)/n. Expand the permanent over the set S of m upper rows used by the cross block:

per(Y_avg)=a^d (m!/n^m) sum_(|S|=m) per(L[S,:]).

The n-by-n matrix B=[L,J_(n,d)/n] is doubly stochastic, and its permanent is

per(B)=(d!/n^d) sum_(|S|=m) per(L[S,:]).

Consequently

per(Y_avg)=d^d m!/(d!n^m) per(B).

The scalar minimum already proved is n!m!d^d/(d!n^(n+m)), so per(B)=n!/n^n. The equality case of van der Waerden's theorem forces B=J_n/n and therefore L=J_(n,m)/n. This L is the original L, since bottom-row averaging did not change it.

Return to the original Y, now with L uniform. The identical expansion with K transposed, completed by d constant columns, gives

per(Y)=d^d m!/(d!n^m) per([K^T,J_(n,d)/n]).

The completed matrix is again doubly stochastic. The same equality case forces K=J_(m,n)/n. Hence Y=A_0. All constants and both completion row/column sums were independently checked. The proof applies whenever d>0, including every parameter in the claimed noncohesive range.

## Permanent and differential identities

Counting a permutation with i lower-right entries gives

binom(n,d+i) binom(m,i)^2 i! (m-i)!^2
 = binom(m,i) n!m!/(d+i)!,

where d=n-m. Multiplying the three block-entry weights produces equation (1) exactly, including all powers of n. The substitution t=mx then gives the stated F-polynomial and z(t).

For c_i=binom(m,i)/(d+1)_i,

(i+1)(d+i+1)c_(i+1)=(m-i)c_i.

This verifies the differential equation zF''+(d+1+z)F'-mF=0. Substituting mu=zF'/F gives the Riccati equation in the draft. The logarithmic derivative of the elementary prefactor is exactly -mt z'/z, so the sign reduction to h(t)=mu(z(t))-mt is correct.

At an interior zero of h, independent simplification gives

h'(t)=[(d^2-m)+(d^2+3dm+2m)t+m(d+2m-1)t^2]/(1-t)^2.

This is strictly positive on 0<t<1 whenever d^2>=m. It remains strictly positive at the threshold, where the constant coefficient vanishes.

The initial sign was checked separately. At d^2=m the first nonzero term is

h(t)=3d^2(d+1)/(d+2) t^2+O(t^3).

Thus the equality case is not lost by using a first-order expansion with zero derivative. The coefficient is positive for every positive integer d, including d=1. A differentiable function that starts positive cannot first reach zero with positive derivative, so the first-zero argument is valid.

The t=1 singularity belongs only to the factorization using z(t); the original permanent is a polynomial. Strict increase on the open interval and continuity of the polynomial give the endpoint inequality as well.

## Non-barycentricity

The orthogonality argument for Q(x)=F(-x) is valid: integrating its monomials against x^(d+j)e^(-x) leaves the qth finite difference of a polynomial of degree j<q. The sign-change argument then gives q distinct positive roots for Q, hence distinct negative roots for F. This does not assume the desired minimum theorem.

Factoring F yields a sum of independent Bernoulli variables. Distinct roots imply distinct success probabilities, giving strict variance bound v<u(q-u)/q when q>=2. At q=1 the draft correctly uses equality and obtains strictness from d>0 later.

For n>=m, the coefficient distribution counts lower-right entries in a uniform supported permutation. Its mean u gives the stated barycenter, and the two inequalities

n v < n u(m-u)/m <= (m-u)(d+u)

combine with the Riccati identity to give n u(d+u)>(m-u)^2. The latter is exactly z(u/m)>1. The tilted mean mu(z) is strictly increasing, because z mu'(z) is a nonzero variance. Consequently the derivative at the barycenter is positive.

For m>=n, the coefficient distribution instead counts upper diagonal entries. The stated alternative parameter a gives z(u/n)=n u(d+u)/(n-u)^2>1 by the same variance identity. This is the correct parameter swap; merely interchanging the original block sizes without changing the statistic would not have sufficed.

Both arguments cover d=0 because the barycenter parameters lie strictly inside the relevant interval. The n=1 exception is correctly excluded: the support is the full all-ones matrix and is barycentric.

## Copy edits reported

The displayed expression `z,m(1-t)` should read `z m(1-t)`. The authoring worker is fixing this and a separate binomial-subscript notation issue. Neither affects the argument.
