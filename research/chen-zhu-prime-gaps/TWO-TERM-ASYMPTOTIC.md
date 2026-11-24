# Chen–Zhu’s prime-gap conjectures: a uniform second-order asymptotic

**Partial only: the conjectures hold for all sufficiently large Frobenius numbers, but this does not settle every pair.** Yong-Gao Chen and Hui Zhu propose two inequalities in [*The number of primes not in a numerical semigroup*, Conjectures 1.3 and 1.4](https://arxiv.org/html/2506.03625v2). For coprime integers 3≤a<b, put F=ab−a−b and let π*(a,b) count the primes not in the monoid ⟨a,b⟩. Conjecture 1.3 asks for π*>aF/[2(a−1)log F] with two small exceptions. Conjecture 1.4 asks for π*≥π(F)/2 for all pairs, with a stated finite equality classification. We prove both strict inequalities once F is sufficiently large, uniformly in a,b. The threshold is not made effective here, and no conjecture is counted as resolved.

Define

    A_a = a/[2(a−1)],
    B_a = (1/φ(a)) Σ_{1≤j<a, (j,a)=1} −v_j log v_j,    v_j=j/(a−1).

Then, uniformly over the stated pairs as F→∞,

    π*(a,b) = A_a F/log F + (A_a+B_a) F/(log F)² + O(F/(log F)³).      (1)

In particular, when a≥(log F)^64 this reads

    π*(a,b) = F/(2 log F) + 3F/[4(log F)²] + O(F/(log F)³).

The secondary coefficient is what determines the side of the half-prime threshold. Ding, Zhai and Zhao's standard first-order asymptotic alone does not determine this sign.

## 1. Polylogarithmically small a: progression count

Put X=(a−1)b=F+a. Every integer has a unique expression n=au+bj with u integral and 0≤j<a. It belongs to ⟨a,b⟩ exactly when u≥0: reducing any nonnegative representation's second coefficient modulo a preserves nonnegativity of the first. If p does not divide a, then j is coprime to a, and p is a gap just when p<bj. Thus π* differs from

    Σ_{1≤j<a,(j,a)=1} π(bj; a,bj mod a)

by O(a+log a), accounting for an endpoint change from < to ≤, the primes dividing a, and truncation at F. For j≤a−2 one has bj<F since b>a, while at j=a−1 the endpoint changes by only a.

Now assume a≤(log F)^64. Uniformly in j, bj≥b≥F/a, so log(bj)∼log F and a≤(log(bj))^65 for all sufficiently large F. Apply Siegel–Walfisz in this fixed power range, summing the error over at most a reduced classes. The total error is O(F/(log F)^K) for every fixed K, with an implicit constant; this uses a≤(log F)^64 against exp(−c√log F). The main term is the average, over the reduced j, of Li(X v_j). Uniformly for 1/(a−1)≤v≤1,

    Li(Xv) = Xv/log X + Xv(1−log v)/(log X)²
             + O(Xv(1+|log v|²)/(log X)³).

Indeed |log v|≤64 log log F, and the standard two-term expansion for Li followed by geometric expansion of 1/log(Xv) gives the displayed error. Because v(1+|log v|²) is bounded on (0,1], the averaged error is O(X/(log X)^3). The average of v_j is A_a by the involution j↦a−j, and the average of −v_j log v_j is B_a. Replacing X by F changes the main terms negligibly. This proves (1) in the small-a range.

## 2. Large a: truncate the prime Fourier sum at an arbitrary endpoint

The input is [Ding–Zhai–Zhao, *On a conjecture of Ramírez Alfonsín and Skałba II*](https://doi.org/10.5802/jtnb.1324), in particular Sections 3–4; [the arXiv HTML version](https://arxiv.org/html/2309.09796v2) exposes their estimates. We make the endpoint uniform to obtain the secondary term.

Write L=log F and Q=floor(L^20). In this section a>L^64, so Q<a^{1/3} and Q²≪F. Let e(z)=exp(2πiz), let

    H(α) = Σ_{0≤x≤b, 0≤y≤a} e((ax+by)α),
    f_t(α) = Σ_{1≤n≤t} Λ(n)e(nα),       0≤t≤F.

Every n≤F has at most one nonnegative representation: two distinct representations would force one x≥b and hence n≥ab>F. Thus orthogonality identifies the full integral of f_t·H(−α) with Ψ_R(t)=Σ_{n≤t,n∈⟨a,b⟩}Λ(n).

Use DZZ's major arcs about reduced rationals u/q, q≤Q, with radius Q/(qF), considered modulo 1. The arcs are disjoint for large F. All the estimates below are uniform in t.

1. **Minor arcs.** DZZ's Dirichlet step gives Q<q≤F/Q and |α−u/q|≤1/q². If t<F/Q, the trivial bound |f_t|≪(F/Q)L suffices. Otherwise q≤t and their Vinogradov exponential-sum theorem at length t gives

       |f_t(α)| ≪ (tq^(−1/2)+t^(4/5)+√(tq)) (log t)^4
                ≪ (FQ^(−1/2)+F^(4/5))L^4.

   DZZ's L¹ bound ∫|H|≪L² is independent of t (journal Lemma 3.3). Hence the entire minor-arc contribution is O((FQ^(−1/2)+F^(4/5))L^6).

2. **Nonzero major arcs.** The geometric-sum argument in DZZ's journal Lemma 4.4 gives |H(−α)|≪qb on the arc at u/q with q≥2. Indeed gcd(a,b)=1 and at least one angular distance in the two geometric sums is ≥1/(2q), using Q<a^{1/3}. The other factor is at most O(b). The prime-side bound |f_t|≤Σ_{n≤F}Λ(n)≪F is uniform. Summing the integral of O(Fqb) over the Q/(qF)-length arcs and O(q) numerators for each q gives O(bQ³).

3. **The major arc at zero.** The prime number theorem with its de la Vallée Poussin error, followed by summation by parts, gives uniformly in t≤F, |α|≤Q/F,

       f_t(α) = Σ_{1≤n≤t}e(nα)
                  + O(F(1+F|α|) exp(−c√L)).

   In detail, the supremum of |Σ_{n≤u}(Λ(n)−1)| for u≤F is O(F exp(−c√L)): use that bound at u≥√F with a smaller c, and the trivial logarithmic estimate below √F. Multiplying by |H|≪F and integrating gives O(FQ² exp(−c√L)). Restoring the resulting geometric sum to the full circle costs at most O((F/Q)L²), since away from the zero arc its absolute value is ≪F/Q and H has that same L¹ bound. Its integral over the circle is exactly R(t)=#{1≤n≤t:n∈⟨a,b⟩}.

Together these give uniformly for all t in [0,F]

    Ψ_R(t)=R(t)+O(FL^(−4)).

In fact b≪F/a and a>L^64, so bQ³≪F L^(−4), and every other error is no larger.

The elementary triangular lattice count is R(t)=t²/(2ab)+O(a+b) uniformly for t≤F: sum 1+floor((t−ax)/b) over x≤t/a, subtract the origin, and compare the linear sum with its integral, with error O(t/a+t/b+1)≤O(a+b). As a,b are in the large range, this error is also O(FL^(−4)). By Abel summation, the number of representable primes is

    π_R(F) = Li(F²)/(ab) + O(F/(log F)³)
           = F/(2 log F) + F/[4(log F)²] + O(F/(log F)³).

For the first equality apply partial summation with 1/log t to Ψ_R(t), removing higher prime powers at O(√F log F). The uniform remainder contributes O(FL^(−4)) because the integral of 1/[t(log t)²] from 2 to infinity converges. The leading integral is (1/ab)∫_2^F t/log t dt, equal to [Li(F²)−Li(4)]/(ab) up to the harmless lower endpoint term. For the second equality use F²/(ab)=F(1−1/a−1/b). Subtracting from π(F) gives the announced simplified formula in the large-a range.

To put it in form (1), standard totative counting by inclusion–exclusion gives B_a=1/4+O(2^{ω(a)}/φ(a)+1/a). Indeed, for 0≤x≤1, the number of reduced j with j/a≤x differs from xφ(a) by O(2^{ω(a)}); integrating against the bounded-variation function −x log x yields its average integral 1/4, and replacing j/a by j/(a−1) has O(1/a) averaged error, since the derivative in the rescaling direction is bounded by a constant times v(1+|log v|). The elementary inequalities φ(a)≥√(a/2) and 2^{ω(a)}≤C a^{1/4} (separate the finite primes below 16) make this O(a^(−1/4)). Also A_a=1/2+O(1/a). Thus the difference from (1) is absorbed into the error for a>L^64.

## 3. Consequence and outstanding finite range

For every a≥3, B_a>0 because the reduced class j=1 is included and its v_j is strictly between 0 and 1. Since B_a→1/4, the infimum over all a≥3 is positive. In (1), A_a+B_a is bounded below by a positive absolute constant, so π*>A_a F/log F for sufficiently large F. By the ordinary two-term prime-number theorem,

    π*(a,b)−π(F)/2
      = (A_a−1/2)F/log F + (A_a−1/2+B_a)F/(log F)² + O(F/(log F)³)>0

uniformly for sufficiently large F, as asserted. The finite range, including the original equality classification, is not resolved by this argument. The known a=1,2 behavior is unchanged.

## Literature check

Ding–Zhai–Zhao's cited theorem is first-order and fixes the endpoint at F. The extension here is to run their uniform endpoint estimates before Abel summation and retain the secondary coefficient, with Siegel–Walfisz covering small moduli. [Chen–Zhu v2](https://arxiv.org/html/2506.03625v2) proves fixed-a eventual inequalities and verifies both conjectures for a≤10. [Ding–Komatsu–Liu](https://arxiv.org/html/2510.01781v1) restates Conjecture 1.4 and proves fixed-a / first-order variants, not the uniform second-order expansion. Exact-conjecture, constant, author and follow-up searches found no prior result with this uniform sign estimate or full resolution, but priority is not asserted.
