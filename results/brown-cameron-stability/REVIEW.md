# Adversarial review and verification

## Separate mathematical review — 2026-11-26

A separate model session that did not develop the proof rechecked the two source statements and derived the critical steps below. This is an independent model check, not independent human review or peer review.

1. **Closed half-plane.** Write $a,b,c,d$ and $A,B,C,D$ for the lowest four coefficients of two factors or partial products. The minor of their product, computed in increasing degree, is

```math
A^2(bc-ad)+a^2(BC-AD)+b^2AB+a b B^2.
```

This is nonnegative when the two lower coefficients of each factor are nonnegative and both input minors are nonnegative. Every real or conjugate-pair factor of the reversed monic polynomial meets these tests even for zero real parts, so a strictly negative minor of the full product implies an open-right-half-plane root.

2. **Off-diagonal pairs.** At the least crossing, the binomial bounds above and below give $`n=\Theta(hq^{-h/2})`$ for each of the four sizes $h=k,k-1,k-2,k-3$. If an overlap of size $i$ is at most $h/2$, its penalty is at most $`q^{-ih/4}`$; for an overlap missing $t$ vertices with $`t<h/2`$, the recovered factor is $`q^{t(h-(t+1)/2)}`$. The resulting geometric bases are each $`O(h^2q^{h/4})`$ for fixed $q$ and therefore vanish. The diagonal contributes $`1/\mu_h`$ to the normalized second moment. It does not enter the void comparison, which uses only distinct pairs.

3. **Void constant and quantifiers.** In the avoidance recursion, replace avoidance of the entire prefix by avoidance of just the nonneighbors. Independence of the relevant edge variables gives the product with the single-event probability $s$. Putting the neighbors back changes the intersection by at most the sum of the joint probabilities and the product term by at most the sum of $s^2$. The recurrence contracts by $1-s$; each unordered neighboring pair contributes at most twice its joint probability. This matches the ordered pair sum from step 2. Thus the error at the end is $o(1)$ and the void probability tends to $`e^{-\lambda}`$. The three-event intersection in the root proof is an unconditional union bound. The two quotient constants are $`\lambda/q^2`$ and $`\lambda/q`$, and one takes the supremum of lower bounds over fixed strict choices of $`\lambda`$, with no claim about a common optimizing subsequence or the boundary value.

4. **Graph weighting.** The finite permutation bound is uniform in the number of moved vertices. Burnside's formula then gives the asymptotic count used in the proof. Counting bad labelled graphs and dividing by $n!$ is a lower bound on the number of bad isomorphism classes; this direction also works for the event “bad and connected.” Problem 2 specifies labelled $G(n,p)$ directly. The subject of preprint Conjecture 3.2 is all graphs, not just the very well-covered graphs appearing in the title or the trees in the subsequent conjecture.

No gap was found in the claimed subsequential bounds. Computation is not used in any of these deductions.

## Author's adversarial checks

### Can the disproof be made without the delicate void calculation?

Yes. This is a useful independent route to the qualitative result. Fix $`\lambda=q^2/2`$. Count distinct ordered pairs of independent $k$-sets. The disjoint and one-vertex-overlap terms contribute at most $`\mu_k^2`$, and the remaining **off-diagonal** terms contribute $o(1)$ by the overlap bounds. Therefore the elementary inequality $`1_{x>0}\ge x-\binom x2`$ for integers $`x\ge0`$ gives $`\liminf\mathop{\mathrm{Pr}}(X_k>0)\ge\lambda-\lambda^2/2>0`$. With the lower three counts concentrated, their Hurwitz quotient tends to $1/2$. Even allowing 10% error in each count yields $`1.1^2/(2\cdot0.9)<1`$. Markov's bound excludes larger sets. This second argument already refutes both named root-location assertions. The avoidance recursion in the full proof improves the constants and is not a single point of failure for the resolution. Replacing $q^2/2$ by $q/2$ likewise refutes the log-concavity consequence.

### Checks aimed at breaking the argument

| Possible failure | Check |
|---|---|
| A sparse deterministic family cannot refute an almost-everywhere conjecture. | Here graph orders are chosen deterministically; at those orders there is a positive probability over the **entire** $G(n,p)$ ensemble. Only a subsequence of orders is required to contradict convergence to 1. |
| Tuning a real parameter could miss every integer order. | The consecutive-order ratio is $n/(n-k)=1+o(1)$ at the least crossing; $n$ grows exponentially in $k$ up to a polynomial factor. |
| Counting cliques instead of independent sets might reverse the density. | The base in the expectation and overlap corrections is the **nonedge** probability $q=1-p$. Direct graph enumeration tests the formulas at both $q=1/3$ and $q=2/3$. |
| Near-full overlaps or the diagonal might invalidate concentration. | Separate bounds for $`2\le i\le h/2`$ and $`h/2\lt i\lt h`$. The exact diagonal is $`1/\mu_h`$ and is retained for the variance, excluded from the dependency sum. No concentration at $h=k$ is asserted. |
| Pairwise independence need not imply independence from a sigma-algebra. | For nonneighbors every edge variable used by $`E_i`$ is absent from the **union** of the other internal-edge variable sets. The void argument uses this joint independence. |
| An event of positive probability could bias all the lower coefficients. | Intersection with an event of probability $1-o(1)$ loses at most $o(1)$ *without conditioning*; independence between different set-size counts is never assumed. |
| An independent $(k+2)$-set could make the four coefficients nonleading. | A larger independent set contains a $(k+1)$-set. The latter are excluded with probability $1-o(1)$. |
| An erroneous factor of $q$ could change the threshold. | The exact quotient of consecutive means is $`(k-t)q^{-(k-t-1)}/(n-k+t+1)`$. The reversed means have factors $1,1,q,q^3$ after scaling. Z3 checks both cross-multiplied identities. |
| The Hurwitz criterion may require an open half-plane or distinct roots. | The factorization proof uses only $`-2\Re r\ge0`$ and $`\lvert r\rvert^2\ge0`$. Strict negativity of the minor forces an **open** right-half-plane zero, even if other zeros lie on the imaginary axis. |
| Strictly violating log-concavity might not force nonunimodality. | No such inference is made. The separate unimodality question is not resolved here. |
| Labelled or connected graph weighting might change the result. | The source for Problem 2 explicitly specifies $G(n,p)$. The proof also includes an elementary labelled-to-unlabelled count for $p=1/2$; conditioning on connectedness costs $o(1)$. |

### Reproducible checks

* [Python](verify.py) requires only the standard library. It checks exact first and second moments and the void error bound for every independent-set size on five vertices at three edge densities, then uses exact rational Bonferroni, Chebyshev and Markov bounds at six large orders. The large graphs are **not** enumerated. Their certificates come from exact combinatorial counting, not Monte Carlo or numerical roots. The display rounds down only after all comparisons are complete.
* The optional local [Z3 check](verify_z3.py) negates four algebra claims in quantifier-free nonlinear real arithmetic. It checks the minor inequality under polynomial multiplication separately from the product expansion in the manuscript.
* The complete probabilistic derivation is in the [written proof](PROOF.md); neither check is a proof of a limit. No Lean module is registered for this contribution.

Local replay with Python 3.12.10:

```text
Exhaustive: all 1024 labeled graphs on 5 vertices, all set sizes, 3 edge densities; first and second moments and void bounds passed.
Hurwitz q=1/3, k=64, n=25231715538892510, exact certified failure probability >=54012/1000000
LC      q=1/3, k=64, n=25668577368524214, exact certified failure probability >=152777/1000000
Hurwitz q=1/2, k=64, n=72539569121, exact certified failure probability >=117187/1000000
LC      q=1/2, k=64, n=73329473239, exact certified failure probability >=218749/1000000
Hurwitz q=2/3, k=100, n=19484319202, exact certified failure probability >=197529/1000000
LC      q=2/3, k=100, n=19563481697, exact certified failure probability >=277776/1000000
```

Z3 4.16.0:

```text
convolution preserves the necessary Hurwitz minor: unsat
second quotient limit constant: unsat
third quotient limit constant: unsat
top count >= 1 and threshold imply strictly negative minor: unsat
```
