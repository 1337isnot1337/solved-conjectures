# Second adversarial audit of the geometric transfer notes

Reviewed main-branch files: SINGULAR_WITNESS.md, DENSE_BOUNDARY_BARRIER.md, REAL_KKT_RADICAL_EXTENSION.md, and BLOCK_KKT_FINITE_EXISTENTIAL_EXTENSION.md. The current repository AGENTS.md was read before this audit. No change to the adopted Anthropic premise was considered.

No counterexample to the stated hypotheses was found. The checks below target the fixed-neighborhood limits, actual-component assumptions, and normalized KKT dimension argument. This is mathematical review, not formal verification.

## 1. High multiplicity does not refute the fixed-neighborhood argument

For H(x,z)=(z-x)^D, a circuit uses O(log D) gates by binary powering. The perturbed equation H=epsilon has D roots

```math
z=x+\omega\epsilon^{1/D}.
```

Every branch converges uniformly to x on every fixed compact x-domain, regardless of multiplicity or the choice of root omega. Their low-order x-jets are small. This is consistent with the singular-witness claim, whose jet bound is independent of D when Taylor order is fixed.

In the general proof, dominance of Phi=(x,H) follows from its isolated full-dimensional finite germ. In characteristic zero its witness Jacobian determinant is a nonzero polynomial. The critical-image closure is proper. A generic ray v=epsilon c and a center avoiding the first nonzero epsilon coefficient of its discriminant give a fixed input polydisc for all sufficiently small nonzero epsilon. Properness confines roots to one cluster, and the reduced central cluster is a single chosen graph branch. These are exactly the features that make the preceding example uniform.

If one instead selects a point where different reduced components meet, a unique central cluster need not exist. The proof explicitly moves to a generic point outside those intersections and takes a fresh finite representative. It does not use a neighborhood fixed before that move.

## 2. A hard trace is not a hard individual branch

The all-multiple worker's TAGGED_TRACE_OBSTRUCTION gives a small finite algebra defined by t^(2^m)=z and an O(m^2)-size observable H_m(X,t), whose trace at z=1 is the permanent. This is the strongest explicit attempted counterexample supplied during this audit.

It does not satisfy the singular-witness graph hypothesis for that trace. A single component or local inverse gives H_m evaluated at one root. The trace sums all 2^m conjugate values. The small defining equations do not contain a coordinate equal to that sum. Each individual branch has small bounded-order jets, as the lemma predicts. Introducing all roots and a sum would introduce exponentially many witness coordinates or an unproved compressed aggregation operation.

Thus this example locates the missing operation rather than a failure of the jet estimate.

## 3. Witness escape at a dense omitted graph

The elementary system

```math
(y-x^D)u-1=0
```

has dense projection omitting y=x^D. Its witnesses diverge near that graph. In the infinity chart epsilon=1/u, the local family is y=x^D+epsilon, with a fixed-domain limit x^D. The affine witnesses need not converge.

The dense-boundary proof uses this same geometry in a projective compactification. The selected infinity component has the divisor dimension required for slicing. Proper projective projection supplies a boundary fiber; simultaneous cuts prevent the retained component from becoming vertical over the graph. In a witness chart, (x,epsilon) has an isolated fiber and a finite representative even if the source is singular. The omitted graph branch is the unique reduced central cluster. Returning to the affine chart uses only the original small equations, linear witness cuts, and epsilon*w_i-1=0.

No small circuit for the projective closure, saturation, or discriminant is asserted. The circuit cost concerns only the specialized affine systems.

## 4. Actual components can fail at special fibers

For the equation t*w=0, the total zero set has components w=0 and t=0. The fiber of the first component at t=0 is contained in the full second-component fiber and is not an actual component of that fiber. At every nonzero t it is an actual component.

This is the precise pathology handled by the generic-specialization arguments in the dense-boundary and KKT notes. For a selected total component Z, its intersections with other total components have dimension at most dim Z-1. Their generic nonconstant-t fibers have dimension at most dim Z-2, while every nonempty component of Z_t has dimension dim Z-1. Constant-t intersection components contribute only finitely many parameter exceptions. A sequence avoiding those exceptions suffices for the later limit.

The corresponding projected-hypersurface argument is also valid: a dominant constructible image contains a dense open subset, whose closed complement has one smaller dimension. For generic t it cannot contain any whole hypersurface fiber component. Hence every selected fiber branch is generically dominated by a source fiber component.

## 5. KKT normalization controls every component

The selected KKT incidences impose active equalities and witness-gradient cancellation with output-gradient coefficient exactly one. On every reduced component, the multiplier-weighted sum of equality differentials is

```math
dy+\sum_i A_i\,dx_i-C\,dt=0.
```

Characteristic zero makes the projected differential rank equal to the projected field's transcendence degree. The projected dimension is therefore at most n+1 on every component, not only on components containing real maximizers.

No multiplier derivative is missing: this is a linear combination of dE=0. Differentiating lambda*E gives the same relation because E vanishes on the component.

For the block proof, discarding a full local block cannot introduce an uncancelled derivative into a retained block. Each retained residual depends only on shared variables and its own local coordinates. Uniform rescaling of all multipliers in one block preserves its zero local gradient. The final equations impose cancellation anew on every complex component.

## 6. Real maximizers are not treated as holomorphic branches

The real compact feasible sets are used only to obtain h_t converging uniformly to the real polynomial output on a real box. The proof does not differentiate h_t or assert its holomorphy.

Finitely many normalized incidences cover all maximizing points. Nondominant base-image components are excluded by a nonzero polynomial after removing powers of t. The remaining hypersurface equations have nonzero t=0 specializations. Their finite product vanishes at h_t; its limit vanishes on a real open graph and hence algebraically on the complex polynomial graph. One central hypersurface therefore contains its graph factor.

Only after this algebraic selection does the separate fixed-polydisc root-cluster lemma construct holomorphic complex branches. Cauchy estimates apply to those branches, including at moving generic Taylor centers. This order avoids an unjustified derivative limit of the maximizer functions.

## 7. A genuine boundary of the current scope

The new moving-challenge note gives the explicit finite family Q(y,z)=z(z-y), with predicate z=0. Universal verification over its roots defines y=0, but two existential root slots can both equal zero for every y. The resulting full equation variety has no graph component at y=0.

This is not a counterexample to any of the four reviewed lemmas, because their actual-component hypothesis fails. It is a counterexample to extending their conclusions by silently equating existential root slots with complete enumeration at a collision. The moving-cover extension supplies completeness only on a finite étale open meeting a dense set of correct certificates.

The current notes retain their stated scope. No separation of P_C and NP_C was established by this audit.
