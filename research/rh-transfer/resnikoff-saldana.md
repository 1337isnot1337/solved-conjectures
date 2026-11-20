# Resnikoff–Saldaña conjecture

Scope audit, 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## 1. Outcome

The accepted Riemann-hypothesis input supplies a published conditional bound for at least one Fourier coefficient in each genus of binary quadratic forms. It does not supply the individual-coefficient bound in the full Resnikoff–Saldaña conjecture.

There are two separate gaps: the exponent and the quantifier over coefficients. A stronger theorem improves the exponent by assuming Lindelöf estimates for quadratic twists of modular forms, but it retains the existential quantifier. Neither gap is closed here. This note records no solved conjecture.

## 2. Exact statements

Let F be a degree-two Siegel cusp form of even integral weight k for Sp_2(Z), and let A(T) denote its coefficient at a positive definite half-integral symmetric matrix T. Write D=-4 det T.

The target coefficient estimate has the form

~~~math
|A(T)|\ll_{\epsilon,F}|D|^{k/2-3/4+\epsilon}.
\tag{1}
~~~

The intended admissible class of forms matters: Kohnen's introduction records known failures along imprimitive coefficient sequences for forms in the Maass subspace. Those known exceptions cannot be presented as a new disproof. Our scope audit concerns the remaining individual-coefficient prediction in its admissible setting.

[Kohnen, *On the growth of Fourier coefficients of Siegel cusp forms of degree two*, Research in the Mathematical Sciences 9 (2022), article 50](https://link.springer.com/article/10.1007/s40687-022-00348-w), Section 4, Theorem 2, assumes generalized Lindelöf for all quadratic Dirichlet L-functions and concludes:

~~~math
\text{for every genus }\mathcal G\in\mathcal G_D,\quad
\text{there exists }T\in\mathcal G\text{ such that }
|A(T)|\ll_{\epsilon,F}|D|^{k/2-1/2+\epsilon}.
\tag{2}
~~~

Theorem 3 additionally assumes generalized Lindelöf for quadratic twists of normalized cuspidal Hecke eigennewforms of weight 2k-2 and level 1 or a prime. It gives the exponent in (1), still for at least one T in each genus.

These are the exact theorem imports. The preceding paragraph specifies the additional L-function family; “GRH” without that specification would hide an essential hypothesis.

## 3. What transfers from the accepted input

The [uniform Dirichlet Lindelöf derivation](dirichlet-applications.md) establishes

~~~math
L(1/2+it,\chi)\ll_\epsilon
\bigl(q(2+|t|)\bigr)^\epsilon
\tag{3}
~~~

for every primitive Dirichlet character chi of conductor q. In particular, (3) applies to every primitive quadratic character chi_Delta. Thus all the analytic hypotheses of Kohnen's Theorem 2 are supplied, and (2) follows.

This is an inherited consequence of Kohnen's theorem, with his attribution retained. No new modular-form argument is claimed.

The distinction can be written without asymptotic notation. For each epsilon>0 and F, a constant C_epsilon,F exists so that every negative discriminant D and every genus G in G_D contains some matrix T with

~~~math
|A(T)|\le C_{\epsilon,F}|D|^{k/2-1/2+\epsilon}.
~~~

The chosen T can depend on D and G. This is not a bound for every matrix in that genus.

## 4. Why the two gaps are independent

A genus can contain several inequivalent quadratic forms. The Fourier coefficient is invariant under equivalence of forms, but membership in the same genus does not identify the coefficients. Therefore the existence of one suitably small coefficient in each genus supplies no upper bound for the other coefficients in that genus. A proof replacing “there exists” with “for every” needs further information.

Even at the chosen coefficient, (2) is larger than (1) by a factor |D|^(1/4), before the arbitrary epsilon. Choosing epsilon differently does not remove this fixed exponent gap. For example, to establish the target with epsilon=1/100, the exponent in (2) would require its epsilon to be -24/100. The theorem permits only positive epsilon.

The extra modular-twist hypothesis in Theorem 3 concerns L(s,f tensor chi_Delta), with f a nonzero cuspidal modular eigenform. Such an L-function has degree two. It is not one of the degree-one Dirichlet L-functions covered by (3). The current accepted source contains no identified theorem reducing these twists to products of Dirichlet L-functions.

Even if that additional hypothesis were supplied, the stated Theorem 3 would still select one coefficient per genus. Hence enlarging the L-function scope alone would not prove the full individual-coefficient prediction.

## 5. Contemporary cross-check

[Comtat, Marzec-Ballesteros, and Saha, *Bounds on Fourier coefficients and global sup-norms for Siegel cusp forms of degree 2*, Journal of the London Mathematical Society (2025), DOI 10.1112/jlms.70119](https://londmathsoc.onlinelibrary.wiley.com/doi/full/10.1112/jlms.70119), formulate an individual-coefficient refinement of Resnikoff–Saldaña and explain that its proof remains beyond the available standard-GRH arguments. Their discussion separates averaged coefficient information from control of individual coefficients.

This source corroborates the quantifier obstruction. It is not used to assert that no future proof is possible, or that the conjecture is logically independent of Dirichlet GRH.

The current conclusion is precise: the identified implication stops at (2), and no argument in this research lane closes the remaining exponent or individual-coefficient gaps.

## 6. Search record

Searches included the exact paper title, Resnikoff with Saldaña/Saldana and Dirichlet GRH, generalized Lindelöf, and individual Fourier coefficients. We inspected Kohnen's full theorem statements, assumptions on quadratic twists, and proof discussion, together with the 2025 primary source.

This is a source-scope exclusion, not a claim to an exhaustive priority search on the entire Siegel-modular-form literature. A complete novelty search would be required only after a full argument had cleared the two mathematical gaps above.
