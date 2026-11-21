# Independent review of the canonical trace Gibbs information lemma

Reviewed 21 November 2026. Source note:
[trace-gibbs-cmi-lemma.md](trace-gibbs-cmi-lemma.md).
This review checks the finite or countable measurable-class lemma. It does
not establish the learner required by Steinke–Zakynthinou Conjecture 6 or
its threshold special case, and does not record a completed bounty.

## Verdict

The stated bound is correct under the note's hypotheses:


```math
\mathop{\mathrm{CMI}}_D(G_{n,\eta})
\le \frac{n\eta^2}{2}
+4e^\eta(1+e^\eta)d\log 2\,\frac{n}{n+1}.
```


The proof controls expected original conditional mutual information for
every iid data distribution. It does not claim a uniform bound conditional
on every fixed supersample. The temperature is fixed before seeing the
data. Canonical representatives use one fixed enumeration, so their
selection and the loss weights are invariant under sample permutations.

## Canonical-support charge

Every representative for a restricted trace is also the first
representative for its full-pool trace. If a representative is lost when
replacing the distinguished observation, its earlier replacement agrees on
the common observations and the new observation. It must disagree on the
removed observation. The two full traces therefore form a genuine unit
edge in exactly that coordinate. There is no multiplicity loss: the
unit-edge graph in any fixed binary coordinate is a matching.

The one-inclusion bound holds for every induced subfamily because taking a
subfamily cannot increase VC dimension. Integrating its unweighted edge
bound over weight superlevel sets gives the minimum-endpoint-weight bound.
The two endpoint losses of a unit edge differ by exactly one even when
observations repeat; repeated features simply preclude some unit edges.
The endpoint sum is thus at most $`1+e^\eta`$ times its smaller weight.

One extra coordinate splits each restricted trace into at most two full
traces, each of weight at most its restricted weight. Hence
$`Z_T\le 2Z_0`$, and the additional loss contributes the factor at most
$`e^\eta`$. The bound $`P_0(h)\le 2e^\eta Q_T(h)`$ follows in the stated
direction. Exchangeability averages the incident mass over all $`n+1`$
coordinate labels, giving the note's bounds (5) and (6).

## Common-support mixture and divergence

Write $`Q_i=P_i(\cdot\mid C)`$ and
$`\gamma=\min(P_0(C),P_1(C))`$. For $`\gamma<1`$, the residual law


```math
R_i=\frac{P_i-\gamma Q_i}{1-\gamma}
```


is nonnegative and has total mass one. Thus the same independent Bernoulli
flag of probability $`\gamma`$ represents both mixtures. Revealing that
flag costs no separate entropy term about the input bit, because the flag
and input are independent. The residual branch carries at most $`\log 2`$
nats. This proves the claimed factor $`\max(a,b)\log 2`$, rather than a
binary-entropy term.

On the common support, the log-density tilt has range at most $`2\eta`$.
The second derivative of the log partition function is bounded by
$`(2\eta)^2/4`$. Integrating it with the usual triangular kernel bounds
each directed relative entropy by $`\eta^2/2`$. The note's same bound for
Jensen–Shannon divergence is valid, though not optimized. Empty common
support and identical supports are covered by the limiting mixture cases.

## Paired-selector information

Conditional on the supersample, the selector bits are independent. The
chain rule together with entropy decreasing under additional conditioning
gives


```math
I(W;S\mid\widetilde Z)
\le\sum_i I(W;S_i\mid S_{-i},\widetilde Z).
```


Each summand is the Jensen–Shannon divergence of two adjacent output laws.
After averaging, their common observations and two alternative observations
are $`n+1`$ iid samples. The unused ghost observations do not affect the
learner's output law. The multiplication by $`n`$ and every constant in
the displayed final bound therefore agree.

## Scope and documentation correction

The source target note independently gives a valid VC-dimension-one
counterfamily to this learner's required empirical-error guarantee.
Consequently this information lemma leaves the paid conjecture unresolved.
The target note's earlier sentence saying that no constant information bound
had been established for this Gibbs learner was corrected before this checkpoint.
It now points to this lemma while retaining the separate accuracy obstruction.

No numerical test was used to certify the lemma, and no stronger measurable
selection, accuracy, or novelty claim is included in this review.
