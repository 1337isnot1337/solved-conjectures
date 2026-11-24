# Adversarial reviews of the critical-incidence argument

These are independent internal model reviews of written mathematics, not human refereeing or formal verification. The reviewed argument is [CRITICAL_INCIDENCE_BARRIER.md](CRITICAL_INCIDENCE_BARRIER.md). The integrator also checked the complete proof, its universal circuit size, selected gradient rows, component dimension argument, and quantitative consequence. No gap was found in that reviewed argument. Its conclusion is a certificate-size obstruction, not a BSS separation.

The integrator and weighted-protocol reviewer also checked the generic-matrix consequence added to Section 7. The bounded-size feasible set is constructible; if it were dense, the same component-selection proof would apply. Below the resulting lower-bound threshold, its Zariski closure is proper, so every matrix in a nonempty open complement needs larger certificates. No explicit hard matrix or defining equation for that open set is claimed.


## Incidence-route review

## Independent review of the critical-incidence argument

Reviewed file: `CRITICAL_INCIDENCE_BARRIER.md`, Sections 1–9, on 23 November 2026 (America/Chicago). This is an independent mathematical adversarial review, not a formal verification or novelty assessment.

Result: no gap found in the written proof. Its conclusion is a lower bound for the proposed Boolean-potential certificate scheme, conditional on the separately reviewed singular-witness jet lemma and the imported permanent border lower bound. It is not a proof of `P_C != NP_C`.

### Points checked

1. **The parameter template covers arbitrary certificates.** The polynomial-size universal division-free template has polynomially many scalar parameters and covers every bounded-size circuit topology. Its parameters may depend arbitrarily on the numerical matrix. No efficient construction of these parameters, bounded parameter degree, or linear parameter dependence is assumed. Every specialization still defines polynomial potentials, so enlarging the template preserves soundness.

2. **The exponentially many equations are used only for existence.** The full zero set of the Boolean residuals projects exactly onto the permanent graph under the hypothesized certificate-size bound. Finite irreducible decomposition and irreducibility of the graph give a component with dense image in that graph. The proof does not claim a small description of that original component.

3. **Differentiate before restricting.** The identity summing all residuals to `per(X)-y` holds in the ambient polynomial ring for all certificate parameters. Its derivatives in `(c,y)` sum to `(0,-1)` there, and the same identity holds after restriction to the component function field. At most `p+1` rows span the target covector. Their multipliers are rational functions on that component, defined on a nonempty common open subset. The multipliers are new existential coordinates; their own circuit complexity does not enter the small incidence.

4. **The new incidence has polynomial size.** Each selected residual is a small circuit. All its first derivatives in the `p` certificate coordinates and the output coordinate have circuits with `O(p)` overhead by gatewise differentiation. There are at most `p+1` selected rows and `O(p)` multiplier equations. Exponential degree in certificate parameters does not invalidate that operation count.

5. **Every projected component is proper.** On the function field of every irreducible component of the new critical incidence, all selected residuals are zero. Multiplying their differential identities by the multiplier coordinates gives `dy=-sum A_i dx_i`. No derivative of a multiplier is missing: the proof combines `dE_j=0`, and even the alternative product differentiation has `E_j d(lambda_j)=0`. In characteristic zero, differentials of algebraically independent coordinates remain independent in a larger finitely generated field. Therefore the projected coordinates have transcendence degree at most `n`, and every image closure has dimension at most `n`. This remains true for components on which the defining equations are singular or nonreduced.

6. **An actual source component has the graph as image closure.** The rational multiplier lift of the original dense component has image dense in the permanent graph. Choose any irreducible component of the new small incidence containing its closure. Its image closure contains the graph and has dimension at most `n`. It is irreducible, and the graph already has dimension `n`, so equality follows. This is the exact component hypothesis required by the singular-witness lemma. The lifted variety itself need not be a component.

7. **The ideal-membership extension is valid and the radical caveat matters.** If `f(x)-y=sum H_beta E_beta` in the polynomial ideal, differentiation and restriction to common zeros remove all terms containing `E_beta`. The normalized output covector is again in the gradient span, regardless of the complexity of `H_beta`. Membership merely in the radical gives only a power of the graph equation; its differential can vanish on the graph. The written proof correctly declines that extension.

### Why the nonlinear equation-subset counterexample does not apply

The root-of-unity family in `NONLINEAR_BOOLEAN_COMPONENT.md` shows that even two parameters can require exponentially many original Boolean equations to retain a singular component. The critical-incidence proof does not make that selection claim. It adds derivative equations whose normalization prevents any projected component from dominating the full input-output space. This is a different and valid use of a small selected gradient span.

### Remaining scope

The special residual conservation identity is essential to this proof. It does not hold for an arbitrary second-level predicate, and the argument does not eliminate every fixed level of the complex polynomial hierarchy. The requested BSS separation still needs a different bridge from the permanent lower bound to a language in `NP_C` outside `P_C`.


## Graph-hardness review

## Independent review of the critical-incidence argument

Reviewed file: `CRITICAL_INCIDENCE_BARRIER.md`, Sections 1–9, including its full written proof. The reviewer found no gap in the implication from polynomial-size Boolean divergence certificates to polynomial border complexity of the permanent. This review does not certify the imported lower bound or replace the separate review of the singular-witness lemma.

### 1. Assumptions and selection

The universal arithmetic template has polynomially many scalar parameters and represents every circuit of the stated size. Every parameter specialization is a polynomial circuit, so its conservation identity holds in the entire ambient polynomial ring. No Boolean restriction on topology selectors is needed for this template.

The full Boolean zero set has finitely many irreducible components even though its defining list is exponential. Soundness places every projected point in the graph; completeness covers the graph. Irreducibility then supplies one component with dense graph projection. No polynomial description of that selected component is assumed.

Over its function field, differentiating the conservation identity in the witness parameters and `y` gives the nonzero vector `(0,...,0,-1)`. A basis of the gradient-row space uses at most `p+1` rows. Expressing that vector in the basis gives rational multipliers. The proof needs their existence, not circuits for computing them.

### 2. The new incidence and the component issue

The selected residual equations, stationarity equations in the witness parameters, and normalized `y` derivative form a system with polynomially many variables, equations, and gates. Forward differentiation has the stated polynomial cost. The selected Boolean points contribute only polynomially many fixed Boolean constants.

The rational multiplier functions lift a dense open part of the original component to the new incidence. Their graph closure is irreducible and is contained in some irreducible component of that incidence. It need not itself be an irreducible component. The proof correctly avoids asserting otherwise.

For every component of the new incidence, the residual equations vanish in its function field. Their differential identities, multiplied by the multiplier coordinates, imply a relation with coefficient one on `dy` and no `dc` terms. Multiplying differential identities does not introduce `d(lambda)` terms. Differentiating their products instead gives the same result because the residuals themselves are zero.

In characteristic zero, algebraically independent projected coordinates have linearly independent differentials after passage to the source function field. Thus the projected image of every component has dimension at most `n`. The component containing the rational lift has projected closure containing the `n`-dimensional graph, so its projected closure equals the graph. This verifies the actual component hypothesis required by the singular-witness lemma, including singular and nonreduced defining systems.

### 3. Complexity and scope

The witness count, derivative circuits, and selected equations have a bound polynomial in `m+s(m)`. The singular-witness lemma therefore gives a fixed polynomial bound on the permanent's border complexity in those parameters. Combining this with the imported quantitative lower bound also gives the stated superpolynomial lower bound on the worst-case potential size. Arbitrary numerical constants and nonuniform topology choices are allowed throughout.

The argument closes the polynomial-size Boolean divergence certificate route itself. It does not establish fixed-level hierarchy membership, does not derive a witness constructor from `P_C=NP_C`, and does not prove the requested separation.

### 4. The remaining distinction for a general quantified presentation

The same differential selection works if `y-f(x)` belongs to the ideal generated by a finite family of residuals, provided their common-zero variety has a component projecting densely to the graph. Restriction to that component kills the derivatives of the ideal-membership multipliers, leaving the normalized output covector. Even membership after localization by a polynomial nonzero on the chosen component is enough.

Set-theoretic soundness supplies only radical membership in general. If only a positive power of the graph equation belongs to the residual ideal, its first differential can vanish along the graph. The argument does not remove that nilpotent obstruction. A general Boolean-quantified equational presentation may therefore remain outside this specific proof's scope; predicates involving inequations or further quantifier alternation are also not covered merely by this conservation argument.

Squaring a known good family of equations does not supply a new protocol: its unsquared equations still define the same set and may restore the argument. An actual alternative must supply explicit small equations and prove its own completeness and soundness; simply naming radical membership does not do so.

No general fixed-level presentation of the permanent graph, no implication from `P_C=NP_C` to such a presentation, and no alternate separation proof were obtained in this review.
