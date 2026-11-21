# Independent review of the window–divisor equivalence

21 November 2026. Source: [window-divisor-equivalence.md](window-divisor-equivalence.md), SHA-256 `0526c8777bba59eea13b28a96de6a60ec8d7e4e137911b8d9595fe15e09536c2`.

## Verdict and formal scope

The three statements in the source are equivalent as written. The proof handles the dependence of window length on the sequence, all positive real cutoffs, and both strict square-root endpoints. It proves neither statement true or false. It therefore resolves neither Erdős 873 nor Erdős 886.

I inspected the pinned [873 declaration](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/873.lean) and [886 declaration](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/886.lean). The first uses extended cardinality, so an empty window does not acquire a spurious finite count. For positive window length the count is finite because a counted start is less than the cutoff. The second uses eventual boundedness and two strict endpoints, matching statement R.

## Uniform cluster bounds imply all-scale window bounds

With more than $`C_\delta`$ elements in a window, its divisors cannot all lie between its first element $`u`$ and $`u(1+L^{-\delta})`$. The resulting strict span bound is correct, including the stronger inequality using $`L\lt X`$.

In one residue class of starting indices modulo the window length, the index blocks are disjoint. Hence their value intervals are disjoint and ordered. Within a dyadic interval for the starting value, successive counted starts are separated by more than $`uX^{-\delta}`$. This gives the stated packing bound. Its constants depend only on the chosen exponent and window length, not on the original increasing sequence.

Enlarging the window length preserves every large-cutoff upper bound because a larger window has an LCM divisible by that of its initial smaller window. Choosing the new length at least the cutoff threshold makes every small-cutoff count zero: positivity and strict increase imply $`a_{i+K-1}\ge i+K`$. This verifies the literal quantifier over all $`X>0`$, not only an asymptotic variant.

## The contrapositive uses one sequence

If U fails at a positive exponent, decreasing the exponent retains failure. Unbounded cluster size forces the available moduli to be unbounded, since finitely many moduli have only finitely many divisors altogether. This permits every successive stage-size and stage-separation requirement.

Replacing the left endpoint by the least actual divisor preserves containment in the same relative-width interval. The multipliers $`T,T+3,\ldots`$ are at most $`2T`$, and the separation estimate

```math
(t+3)u-t\max D\ge u(3-tL^{-\delta})\ge u
```

is valid. Thus no two scaled copies interlace. Each copy supplies a consecutive window of every length at most its size, with LCM at most $`2TL`$, strictly below the selected cutoff $`3TL`$.

The number of copies is at least $`L^\delta/6`$, while the selected exponent makes the required cutoff power at most $`3^{\varepsilon_0}L^{\delta/2}`$. The first term eventually dominates the second. Requiring the first value in each new stage to exceed every preceding stage value preserves all these internal windows in the final increasing enumeration.

For each fixed window length, every sufficiently late stage supplies a violating cutoff in that same final sequence. This is the quantifier needed to negate W. A separate sequence for each window length would have been insufficient; the source does not make that error.

## Recentring at a square root

For the least divisor $`u`$ of a cluster, put $`D=L^3`$, $`z=D/u^2`$, $`t=\lceil z\rceil`$, and $`N=tD`$. Every scaled divisor $`td`$ divides $`N`$. Since $`1\le u\le L`$, one has $`z\ge L`$ and

```math
L^4\le N\le L^6+L^3\le2L^6.
```

The rounding error satisfies

```math
1\le \frac{tu}{\sqrt N}=\sqrt{t/z}
\le1+\frac1{2L}.
```

For $`0<\delta\le1`$, multiplying this by $`1+L^{-\delta}`$ gives a ratio strictly below $`1+2L^{-\delta}`$. Taking $`\eta=\delta/8`$ leaves a genuine power margin:

```math
\frac{N^{-\eta}}{L^{-\delta}}
\ge2^{-\delta/8}L^{\delta/4}\longrightarrow\infty.
```

Therefore the full scaled cluster lies below the strict upper endpoint for all sufficiently large $`L`$. At most one scaled divisor equals the square root, so deleting that possible endpoint costs one element. The lower bound on $`N`$ makes the eventual hypothesis in R applicable; the remaining finitely many smaller moduli contribute a fixed maximum. This proves the required bound uniformly in the original interval position.

The reverse implication uses the square-root position directly and is immediate with the same exponent. Larger exponents in U follow from the corresponding smaller intervals.

## What the equivalence leaves open

No bound uniform in the modulus and no unbounded cluster at a fixed positive exponent is constructed. The argument establishes a reduction between full open statements and a uniformity consequence for W. Its novelty search and source audit are separate from mathematical correctness; this review makes no priority claim and performs no Lean verification.
