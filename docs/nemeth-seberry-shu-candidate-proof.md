# Nemeth–Seberry–Shu conjecture: candidate asymptotic disproof

Date: 2026-11-20. **Research proof draft. Two independent internal audits found no flaw; external review remains outstanding.**

## Statement and attribution

For a prime p and S⊆Z/pZ, let C_p(S) be the binary circulant with (i,j) entry 1 if j−i∈S, and zero otherwise. Let

    V(p)=#{per C_p(S): S⊆Z/pZ}.

The Nemeth–Seberry–Shu conjecture asserts V(p)=O(p). The statement concerns all supports and all row sums, not a fixed sparse degree. Cheon–Wanless (2005), Conjecture 27, pp.329–330, records exactly this statement and contrasts it with Resta–Sburlati's stronger fixed-degree rival. No symmetry condition is imposed.

**Candidate theorem.** As p tends to infinity through primes, V(p)/p tends to infinity. In particular V(p) is not O(p).

This does not establish the Resta–Sburlati fixed-degree asymptotic. All supports constructed below have degrees proportional to p.

## External permanent estimate

We use the following established asymptotic estimate, not a result proved in this note. Put J_N=(1/N)11ᵀ. For fixed constants A0<∞ and r<1, if D=J_N+B is an N×N doubly stochastic matrix with

    max_ij |B_ij|≤A0/N,    ||B||op≤r,

then, uniformly over these matrices,

    N^N per(D)/N! = (1+o(1)) det(I−BᵀB)^(-1/2).          (1)

Source: Divoux–Wang, *The Maximum Number of Hamiltonian Cycles in Tournaments*, arXiv:2610.23755v1, Proposition 3.1 and the uniformity paragraph immediately following it. Their Section 3 supplies a self-contained proof and attributes the estimate to McCullagh, *An asymptotic approximation for the permanent of a doubly stochastic matrix*, J. Stat. Comput. Simul. 84 (2014), 404–414; arXiv:1205.5723. Equation (1), including its uniformity and applicability to matrices with zero entries, is the external analytic dependency requiring audit.

## Lemma 1: binary Fourier profiles with exact cardinality

Uniformly for integers k with p/3≤k≤2p/3 and real a∈[0,1/12], there exists S⊆Z/pZ with |S|=k such that the eigenvalues of D=C_p(S)/k satisfy

    λ0=1,
    λ1=a/ρ+O(sqrt(log p/p)),
    λ_(p−1)=a/ρ+O(sqrt(log p/p)),
    max_(l≠0,1,p−1)|λ_l|=O(sqrt(log p/p)),                (2)

where ρ=k/p and all constants are absolute. The errors can be complex; the two exceptional eigenvalues are conjugates.

**Proof.** Let ζ=exp(2πi/p). Choose independent Bernoulli variables X_s with

    P(X_s=1)=ρ+2a cos(2πs/p).

These probabilities lie in [1/6,5/6]. Exact character orthogonality gives

    E Σ_s X_s ζ^(ls) = k        if l=0,
                          pa   if l=1 or p−1,
                          0    otherwise.

Hoeffding's inequality applied to real and imaginary parts, followed by a union bound over the p frequencies, gives a realization for which all p Fourier errors are at most 2 sqrt(p log p), for every sufficiently large p. For example, for any fixed frequency the failure probability is at most 4 exp(−t²/p); taking t=2 sqrt(p log p) makes the total failure probability at most 4/p³.

In particular the number of selected elements differs from k by at most 2 sqrt(p log p). Add or delete that many elements to obtain exactly k. This is always possible because the desired cardinality lies between zero and p. Each alteration changes each unnormalized Fourier coefficient by at most one. Thus after adjustment all Fourier errors are at most 4 sqrt(p log p). Divide by k≥p/3 to obtain (2), with error at most 12 sqrt(log p/p). ∎

## Lemma 2: limiting permanent factor

For the sets in Lemma 1, uniformly in ρ∈[1/3,2/3] and a∈[0,1/12],

    log[per C_p(S) / (k^p p!/p^p)] = F(ρ,a)+o(1),         (3)

where

    F(ρ,a)=(1/2)(1/ρ−1)−log(1−(a/ρ)²)−(a/ρ)².

**Proof.** Real circulants are normal and are unitarily diagonalized by the Fourier matrix. B=D−J_p has eigenvalue zero in the constant direction and eigenvalues λ_l for l≠0. Thus the eigenvalues of BᵀB are |λ_l|².

The entries of B are either −1/p or 1/k−1/p. Hence their absolute values are at most 2/p. Lemma 1 gives

    ||B||op≤a/ρ+o(1)≤1/4+o(1)≤1/2

for all sufficiently large p. Therefore (1) applies with fixed A0=2 and r=1/2.

Parseval gives the exact identity

    Σ_(l≠0)|λ_l|² = p/k−1 = 1/ρ−1.                     (4)

Indeed Σ_l |Σ_(s∈S) ζ^(ls)|²=p|S|=pk, and λ0=1.

Write h(x)=−log(1−x)−x. Since λ_(p−1)=conjugate(λ1),

    log det(I−BᵀB)^(-1/2)
       =(1/2)(1/ρ−1)+h(|λ1|²)
          +(1/2) Σ_(l≠0,1,p−1)h(|λ_l|²).              (5)

The final sum is o(1) uniformly. To see this without summing p individual error bounds, use h(x)≤x²/[2(1−x)] for 0≤x<1, the maximum bound in (2), and the bounded total mass (4). Thus it is O(log p/p). The exceptional term tends uniformly to h((a/ρ)²), since h has bounded derivative on a fixed compact interval below one. Equations (1) and (5), together with per(C_p(S))=k^p per(D), prove (3). ∎

## Lemma 3: distinct row sums have disjoint permanent values

For prime p,

    per C_p(S) ≡ |S| (mod p).                           (6)

**Proof.** The permanent counts permutations σ of Z/pZ with σ(i)−i∈S for every i. Translation by c acts on this set by

    σ(i) ↦ σ(i−c)+c.

Because the acting group has prime order, every orbit has size 1 or p. The fixed permutations commute with translation by 1, so are exactly σ(i)=i+s with s∈S. There are |S| of them. Counting orbits proves (6). ∎

## Completion of the candidate proof

Fix any positive integer M. Choose a_j=j/(12M), 1≤j≤M. For each integer k∈[p/3,2p/3], use Lemma 1 to construct sets S_(k,j) of cardinality k with these amplitudes.

For every fixed ρ∈[1/3,2/3], F(ρ,a) is strictly increasing for a>0. Indeed h'(x)=x/(1−x)>0 for x>0. Hence, for M≥2,

    δ_M = min_{1≤j<M} min_{ρ∈[1/3,2/3]}
              [F(ρ,a_(j+1))−F(ρ,a_j)] > 0,             (7)

by continuity on a compact interval. An explicit lower bound is δ_M≥15/(8192 M⁴): expand h(x)=Σ_(r≥2)x^r/r, keep its quadratic term in the difference, and use ρ≤2/3 and j≥1. The case M=1 needs no separation argument.

Uniformity in (3) implies that for all sufficiently large p, depending on M, the M constructed permanents for each fixed k are distinct: their normalized logarithms differ by at least δ_M−2o(1)>0. The normalization factor k^p p!/p^p is common to these M matrices.

By (6), values arising from different k in this interval are also distinct, because these k are distinct residues modulo p. Consequently

    V(p) ≥ M [floor(2p/3)−ceil(p/3)+1]
         = M(p/3+O(1))

for every sufficiently large prime p. Since M is arbitrary, for every real L there is a threshold beyond which V(p)/p>L: choose M>3L and then take p sufficiently large. This proves V(p)/p→∞. ∎

## Status audit and scope

Checked sources include the original-author publication listing, the 1983 Eades–Praeger–Seberry paper, the 2003 Resta–Sburlati paper, the 2005 Cheon–Wanless survey, and Yair Lavi's specialist status page updated November 15, 2026. Searches combining the original authors, conjecture, disproof, superlinear, McCullagh, and 2026 did not locate a prior full solution. This search is not a guarantee of novelty. The permanent asymptotic is explicitly credited, not claimed as new. Two independent internal audits checked (1), its uniformity, the Fourier construction, the determinant calculation, the congruence, and the final quantifiers without finding a flaw. This is not external peer review. A second targeted search also located and checked the original 1979 paper itself; its title-page abstract states the prime-order conjecture.

## References

1. E. Nemeth, J. Seberry, M. Shu, *On the distribution of the permanent of cyclic (0,1) matrices*, Utilitas Math. 16 (1979), 171–182. Original paper: https://documents.uow.edu.au/~jennie/WEBPDF/071_1979.pdf ; author publication listing (with variant author order/title): https://documents.uow.edu.au/~jennie/PublicationsAll.html
2. P. Eades, C. E. Praeger, J. R. Seberry, *Some remarks on the permanents of circulant (0,1) matrices*, Utilitas Math. 23 (1983), 145–159. https://documents.uow.edu.au/~jennie/WEBPDF/092_1983.pdf
3. G. Resta, G. Sburlati, *On the number of different permanents of some sparse (0,1)-circulant matrices*, Linear Algebra Appl. 375 (2003), 197–209. https://doi.org/10.1016/S0024-3795(03)00649-9
4. G.-S. Cheon, I. M. Wanless, *An update on Minc's survey of open problems involving permanents*, Linear Algebra Appl. 403 (2005), 314–342, Conjecture 27. https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf
5. P. McCullagh, *An asymptotic approximation for the permanent of a doubly stochastic matrix*, Journal of Statistical Computation and Simulation 84 (2014), 404–414. https://arxiv.org/abs/1205.5723 ; https://doi.org/10.1080/00949655.2012.712122
6. A. Divoux, S. Wang, *The Maximum Number of Hamiltonian Cycles in Tournaments*, arXiv:2610.23755v1, Proposition 3.1. https://arxiv.org/html/2610.23755v1
7. Y. Lavi, current status page for Minc Conjecture 27: https://yair-lavi.com/mincs-list/conjecture-27/index.html
