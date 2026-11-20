# Alexandersson's Catalan-word peak conjecture: research checkpoint

Status: target screened, no solution claimed. All n is the target.

## Exact target and convention

A Catalan word is w_1...w_n with w_1=0 and 0<=w_(i+1)<=w_i+1. A peak here means a *strict local* peak w_(i-1)<w_i>w_(i+1). In Baril et al. this is called a short peak, not their plateau-permitting statistic called peak. Let C_n(t) sum t to this statistic.

Alexandersson's current SymCat page states that C_n is real-rooted and interlaces C_(n+1). Source: https://www.symmetricfunctions.com/realRootedOpenProblems.htm . Its current stated test range is n<=40; no all-index proof is supplied there.

The primary enumerative source is Baril, Harris, Harry, McClinton, Ramirez, Enumerating runs, valleys, and peaks in Catalan words, https://arxiv.org/html/2404.05672v1 , Theorem5.1 specialized to ell=1. SymCat cites the published version as Theorem18; the linked arXiv v1 labels the same result Theorem5.1. The paper gives the generating function, not a real-rootedness assertion (full HTML searched for real-root). The first rows match A116424: C3=4+t, C4=9+5t, C5=22+19t+t^2.

Own-repository issue search `Catalan peak` returned no collision. Author-repository exact searches for A116424, Catalan words, UDUU returned no issue. Broad Catalan peak search returns unrelated general infrastructure and already-solved big-descents papers. Web searches for the exact sequence plus real roots, Catalan words peaks real roots, and UDUU real-rooted found no solution. This is screening, not absolute proof of novelty.

## Established enumerative reductions

Initial values are C_0=1, C_1=1, C_2=2. The factorial formula below is for n>=1.

Let G=1+sum_(n>=1) C_n(t) x^n. Published formula is equivalent to

 G = 1 + x^2(1-t)G + x(1-x+tx)G^2.

Thus with Cat(z)=(1-sqrt(1-4z))/(2z),

 G = 1/[1-x^2(1-t)] * Cat( x(1-x+tx)/[1-x^2(1-t)]^2 ).

The explicit formula given on SymCat is

 C_n(t)=sum_i [binom(n-i,i)binom(2n-3i,n-2i-1)/(n-i)] (t-1)^i.

Writing B_n(u)=C_n(1+u), its coefficient is equivalently

 [u^i] B_n(u)=(2n-3i)!/[i!(n-2i)!(n-2i-1)!(n-i)(n-i+1)]

for 0<=i<=floor((n-1)/2). This factorial-ratio form suggests finite multiplier-sequence/total-positivity methods, but none has yet been proved to apply. Establishing real-rootedness of B_n alone gives real-rootedness of C_n; coefficient positivity of C_n then forces negative roots. Consecutive interlacing remains an additional obligation.

## Current routes, unproved

1. Convert the quadratic GF to an orthogonal-polynomial or compatible recurrence. A quadratic algebraic GF alone does not guarantee real-rooted coefficient polynomials.
2. Recognize the factorial-ratio row as a Schur-Szego composition of real-rooted rows. Ordinary coefficientwise products do not preserve real-rootedness without the correct binomial normalization.
3. A direct combinatorial matching/independence representation could prove real-rootedness, but no such representation is established.

No bounded computation is a claimed solution.

## A low-order differential recurrence to investigate

For n>=3, the following exact recurrence follows from the coefficient formula:

 (n+1)C_n(t) - (t-1) C'_n(t)
 = (4n-2)C_(n-1)(t) - 6(t-1)C'_(n-1)(t)
   +3(n-2)(t-1)C_(n-2)(t) -5(t-1)^2 C'_(n-2)(t).

This was discovered by exact rational nullspace calculation and then verified symbolically coefficientwise. Put b_(n,i)=[u^i]C_n(1+u), extending it by zero outside its support. The needed identity is (n+1-i)b_(n,i)=(4n-2-6i)b_(n-1,i)+(3n-1-5i)b_(n-2,i-1). For 0<=i<=floor((n-1)/2), divide by b_(n,i) and use

 b_(n-1,i)/b_(n,i)=(n-2i)(n-2i-1)(n-i+1)/[(2n-3i)(2n-3i-1)(n-i-1)],
 b_(n-2,i-1)/b_(n,i)=i(n-i+1)/[(2n-3i)(n-i-1)].

Direct simplification gives the identity. All denominators are nonzero for n>=3 in this range; zero factors handle i=0 and the top boundary. Outside the support all terms vanish. Novelty of this recurrence itself has not been established. Compared with the long-cycle recurrence, it has only two previous rows, but its left-hand inverse Euler operator is NOT automatically real-rootedness-preserving. Do not assert that it yields an induction without a further invariant.
