# Independent review: Erdős 873 and divisor-cluster equivalence

21 November 2026. Reviewed [window-divisor-equivalence.md](window-divisor-equivalence.md), SHA256 `0526c8777bba59eea13b28a96de6a60ec8d7e4e137911b8d9595fe15e09536c2`.

The equivalence W–U–R passes this independent review. No correction is requested. Neither open statement is proved or disproved by the equivalence.

## Statements and forward packing

I independently fetched the [pinned E873 formal source](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/873.lean) and [pinned E886 formal source](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/886.lean). The former quantifies one window length after the sequence and exponent and requires the bound at every positive real scale. The latter has strict endpoints and an eventual uniform constant. The definitions W and R match those scopes. The formal files are admitted conjecture statements, not proof certificates.

For U implies W, the span of a counted window is strictly greater than its first element times $`X^{-\delta}`$. Splitting starts by index modulo the window length makes the corresponding element intervals disjoint. The stated dyadic packing bound follows uniformly in the sequence. Increasing the window length beyond the large-scale threshold removes all small-scale windows by positivity and strict increase. This verifies the literal all-scale conclusion, not only an eventual estimate.

## One bad sequence from failure of U

Unbounded divisor counts force unbounded available denominators even after any finite set is excluded. This permits every inductive size and stage-separation requirement. Replacing an interval's left endpoint by its least contained divisor preserves the cluster.

For $`T=\lfloor L^\delta\rfloor`$ and successive multipliers $`t,t+3\le2T`$, the gap between scaled clusters is at least $`u(3-tL^{-\delta})\ge u>0`$. Each scaled cluster has a window of every length at most its cardinality, and its LCM is at most $`tL<3TL`$. The number of copies is at least $`L^\delta/6`$ for large $`L`$. At the fixed exponent $`\varepsilon_0=\delta/(2(1+\delta))`$, this exceeds $`(3TL)^{\varepsilon_0}`$ once $`L`$ is sufficiently large.

Taking each new $`T`$ above all earlier elements makes the final union one increasing sequence; no later insertion can break an internal window. Stage $`j`$ works simultaneously for every $`k\le j`$. Thus the same sequence and exponent defeat every window length, as required to negate W. The proof does not interchange its sequence and window quantifiers.

## Recentring and endpoints

With $`u\mid L`$, $`D=L^3`$, $`z=D/u^2`$, $`t=\lceil z\rceil`$, and $`N=tD`$, every $`td`$ divides $`N`$. Direct calculation gives $`L^4\le N\le2L^6`$ and

```math
1\le\frac{tu}{\sqrt N}=\sqrt{t/z}\le1+\frac1{2L}.
```

For $`0<\delta\le1`$, the whole scaled cluster has relative width less than $`2L^{-\delta}`$. Choosing $`\eta=\delta/8`$ gives
$`N^{-\eta}\ge2^{-\delta/8}L^{-3\delta/4}>2L^{-\delta}`$
for all sufficiently large $`L`$. The upper endpoint is strictly inside the E886 interval. At most one distinct scaled divisor equals its lower endpoint. This justifies the added one in the bound, while finitely many small $`L`$ can be absorbed into the constant. The reverse U-to-R implication is immediate from the interval definitions.

This review establishes the stated logical reductions only. It does not certify the claimed absence of prior publication of the full equivalence, establish a bounded divisor-cluster theorem, produce unbounded clusters, or add a completed paid target. No numerical checks were needed.
