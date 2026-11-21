# Independent review of McCrea's linear-density crossover conjecture

Date: 21 November 2026. Reviewer: analysis agent. The proposed positive-large-powers proof supplied by the root agent passes the following mathematical and source audit.

## Source and exact scope

Marcus McCrea, *Fixed-Perimeter Franklin Statistics and an Eventual Inequality*, arXiv:2609.12005v2, 5 November 2026, Conjecture 9.2, printed page 12. Full versioned PDF inspected through [this arXiv mirror](https://arxiv.cnoctave.top/pdf/2609.12005). The first-page footer explicitly identifies v2 and its date. The original arXiv HTML endpoint was inaccessible.

The conjecture is explicitly restricted to fixed densities strictly between the means $`a_k=2^{-k-1}`$ and $`b_k=1/(4k)`$, for each integer $`k\ge3`$. It asserts exactly one transition density, with the two eventual strict coefficient comparisons on its two sides. The text expressly does not assert a rule at the transition or outside that interval. Thus proving monotonicity of the exponent difference only between the means suffices for the entire stated conjecture.

The generating functions used in the proof are Propositions 3.1 and 3.2, equations (7) and (9), printed pages 4–5. The full paper and final Section 9 were inspected. The previous fixed-$`j`$ conjecture is already resolved by this paper and independently by Cuthbertson; it must not be counted anew.

## Algebra and analytic hypotheses

Writing $`S(q)=q+\cdots+q^k`$ and $`H(q)=(1-q)(1-S(q))`$, the source formula factors exactly as

```math
D_{j,k}(q)=A_D(q)F_D(q)^{j-1},\qquad
A_D=\frac{q^k}{(1-S)^2},\quad
F_D=\frac{q^{k+1}}{(1-q)(1-S)}.
```

On the other side, with $`A=q/(1-q)`$, $`U=A+\cdots+A^{k-1}`$, $`V=A^k`$, $`T=Vq`$, and $`K=1-V(1-q)`$,

```math
O_{j,k}(q)=A_O(q)F_O(q)^{j-1},\qquad
A_O=\frac{UT}{K^2}+\frac VK,\quad
F_O=\frac TK.
```

Both prefactors have nonnegative coefficients and are positive at every positive point inside their radii. Both power-series bases have a positive coefficient at every degree from $`k+1`$ onward: for D this follows from the factor $`(1-q)^{-1}`$, and for O from the initial summand $`T=q^{k+1}(1-q)^{-k}`$ in the geometric expansion of $`1/K`$. Consequently both induced integer distributions have span one and positive variance.

For either base $`F`$, set $`h(r)=rF'(r)/F(r)`$. Under the probability weights $`[q^t]F(q)r^t/F(r)`$, this is the mean and $`rh'(r)`$ is the variance. Hence $`h`$ is strictly increasing. It tends to $`k+1`$ at zero and to infinity at its simple positive pole. The latter poles are the source's $`\rho_k`$ and $`\sigma_k`$. Thus for every $`0<x<1/(k+1)`$ there is a unique interior $`r(x)`$ with $`h(r(x))=1/x`$.

The entire conjectured interval lies in that domain, since $`b_k=1/(4k)<1/(k+1)`$. Direct exact differentiation gives

```math
F_D(1/2)=F_O(1/2)=1,\qquad
h_D(1/2)=2^{k+1},\quad h_O(1/2)=4k.
```

## The local coefficient step, including the floor

One can use a fixed saddle $`r=r(x)`$ rather than a triangular family. Let $`m=\lfloor xn\rfloor-1`$. Let $`X_1,X_2,\ldots`$ be independent with the base-$`F`$ tilted distribution above, and let an independent $`Y`$ have probability generating function $`A(rt)/A(r)`$. Exact coefficient extraction yields

```math
[q^n]A(q)F(q)^m
=A(r)F(r)^m r^{-n}
\Pr(Y+X_1+\cdots+X_m=n).
```

The mean of each $`X_i`$ is $`1/x`$, and

```math
n-m/x=(xn-\lfloor xn\rfloor+1)/x=O(1).
```

The distributions have exponential moments because the saddle lies strictly within the common analytic domain. Span one and positive variance give the local central limit estimate

```math
\Pr(Y+X_1+\cdots+X_m=n)
\sim (2\pi m\mathop{\mathrm{Var}}X_1)^{-1/2}.
```

For a self-contained proof, use Fourier inversion. The base characteristic function has modulus strictly less than one away from multiples of $`2\pi`$; near zero its centered logarithm has quadratic term $`-\mathop{\mathrm{Var}}X_1\,t^2/2`$. The prefactor characteristic function tends to one at zero, and the bounded centered displacement contributes a phase tending to one on the $`m^{-1/2}`$ scale. The compact complementary arc is exponentially small. This provides the stated asymptotic, not merely a large-deviation upper bound.

It follows that the exact coefficient growth exponent is

```math
\Phi(x)=-\log r(x)+x\log F(r(x)).
```

## The unique crossover

The saddle equation cancels the implicit derivative terms, giving $`\Phi'(x)=\log F(r(x))`$. Because $`h`$ is increasing, $`r(x)`$ decreases with $`x`$. Because $`F`$ is strictly increasing and equals one at $`r=1/2`$, the exponent strictly increases before its mean and strictly decreases afterward.

Therefore on $`(a_k,b_k)`$,

```math
\Phi_D'(x)<0<\Phi_O'(x).
```

Both exponents have maximum $`\log2`$ at their respective means, with strict inequality elsewhere. Their difference is positive at $`a_k`$, negative at $`b_k`$, continuous, and strictly decreasing between. It has exactly one zero there. The coefficient ratio has logarithm $`n(\Phi_D-\Phi_O)+o(n)`$, so the required eventual strict comparisons follow. This covers every fixed integer $`k\ge3`$ and every allowed fixed density other than the transition.

## Bounded prior-resolution audit

Both search engines were queried for the paper identifier, title, author's full name, crossover, linear-density, large deviation, Conjecture 9.2, proof, and resolution. Specific queries included:

```text
"McCrea" "Conjecture 9.2"
"McCrea" "linear-density" crossover
"2609.12005" conjecture resolution
"McCrea" "single-crossover" proof
"linear-density" "Franklin" conjecture proved
"Fixed-Perimeter Franklin" "crossover" proof
"McCrea" "crossover" partitions proof
"linear-density single-crossover"
"Franklin statistics" "large deviation"
"2609.12005" "9.2"
"Cuthbertson" "Franklin" partitions
"2609.17389" "density"
```

The results led to the original v2 and index records reporting the newly added open conjecture. No prior proof, counterexample, or withdrawal of the linear-density conjecture was found.

The source cites P. Cuthbertson, *A perimeter analogue of Franklin's identity and an inequality related to the parity of parts*, arXiv:2609.17389 (September 2026), as an independent solution of the fixed-$`j`$ comparison. The indexed abstract confirms that fixed-perimeter eventual inequality and a separate parity-bias problem. Direct retrieval of its full text failed through the research tool; no uninspected full-text exclusion is claimed. McCrea's later v2 acknowledges that paper and then explicitly introduces Conjecture 9.2 as a distinct open problem. This establishes a primary source distinction between the resolved predecessor and the present target.

No numerical experiments are needed for the proof. Exact coefficient comparisons can check the generating-function interpretation, but they should be described as diagnostic checks rather than evidence for all densities.

The reviewer subsequently read the complete PROOF.md, including the written Fourier lemma, and found no mathematical gap. A typographic differential marker in the Gaussian integral was corrected.
