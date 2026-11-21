# Independent review of the quantitative convexity proof

Reviewed 20 November 2026 (America/Chicago) by the combinatorial research lane.

The reviewed draft is `proof.md`. It proves a uniform tangent-Hessian lower bound for the sum of order-$`k`$ subpermanents on the doubly stochastic polytope when $`k\geq3`$ and $`n\geq16k^2`$. I found no mathematical gap in the proof. The priority audit in `kopotun_convexity_source_audit.md` is separate and prevents counting its existential conclusion as a newly solved conjecture.

## Statement and scope

With $`S_{n,k}=k!\binom nk^2n^{-k}`$, the conclusion is

```math
D^2\sigma_k(A)[D,D]\geq
S_{n,k}\frac{k(k-1)}{2(n-1)^2}\|D\|_F^2
```

for every $`A\in\Omega_n`$ and every real zero-margin direction $`D`$. The asserted chord deficit has half this Hessian constant, as required by integration on a segment. It applies to any two doubly stochastic matrices, including boundary matrices. It gives no assertion in the permanent regime $`k=n`$.

## Tensor and normalization checks

The normalized distinct-coordinate symmetric tensors satisfy
$`\langle v_S,Y^{\otimes j}v_T\rangle=\mathop{\mathrm{per}}Y[S,T]`$ with no missing factorial. Summing over both index sets gives the stated subpermanent sum. On the zero-margin space, $`Y=QYQ`$ for $`Q=I-J`$, so inserting $`Q`$ in every tensor position is valid. The squared norm of the projected tensor is exactly $`q_{n,j}=\sigma_j(Q)`$.

The one-factor marginal is invariant under all simultaneous coordinate permutations and vanishes on the all-ones direction. Extending it by zero makes its matrix a linear combination of $`I`$ and $`J`$; hence its restriction to the zero-sum space is scalar. Its trace gives the coefficient $`q_{n,j}/(n-1)`$. This verifies the isotropy identity without an unstated irreducibility theorem.

For the mixed second derivative, moving one occurrence of $`D`$ across the inner product produces $`D^{\mathsf T}`$. Cauchy–Schwarz and the contraction of $`X`$ on the other positions then produce two squared norms, each equal to $`q_{n,j}\|D\|_F^2/(n-1)`$. Thus the argument allows nonsymmetric $`X`$ and $`D`$. Jensen's inequality with the row probabilities, followed by the column sums, proves that every doubly stochastic matrix contracts Euclidean norm; therefore $`X=A-J=QAQ`$ meets the hypothesis.

The centered expansion coefficient counts extensions of a chosen $`j`$-matching to a $`k`$-matching. Dividing it by $`S_{n,k}`$ gives exactly

```math
a_{n,k,j}=\frac{n^j(k)_j}{(n)_j^2}.
```

Since $`\sigma_2(X)=\|X\|_F^2/2`$ on the zero-margin space, the quadratic Hessian term is $`k(k-1)\|D\|_F^2/(n-1)^2`$. There is no missing factor of two.

## Majorant and numerical constants

The expansion of $`\mathop{\mathrm{per}}(tI+(1-t)J)`$ agrees through degree $`n`$ with

```math
E_n(t)=\exp\left(n\left[\log(1-t)+\frac{t}{1-t}\right]\right).
```

Every omitted term of the truncated exponential has order at least $`n+1`$, so coefficient comparison is valid despite the expression involving $`(1-t)^{-1}`$. The exponent has nonnegative coefficients starting at degree two, and the constant coefficient of $`E_n''`$ is $`n`$. This justifies both positivity of the majorant and the subtraction of precisely $`n`$ in the higher-order Hessian estimate.

For $`u=k/n`$, the inequality $`(k)_j/(n)_j\leq u^j`$ has the correct direction. Under $`n\geq16k^2`$ and $`k\geq3`$, the bounds $`u\leq1/48`$ and $`nu^2\leq1/16`$ give

```math
E_n(u)<\frac{16}{15},\qquad
g''(u)<\frac98,\qquad n(g'(u))^2<\frac18.
```

These imply $`E_n''(u)<4n/3`$. The resulting lower bound is at least half the quadratic Hessian because

```math
3n(k-1)-2k(n-1)=(k-3)n+2k\geq0.
```

The argument is uniform over all admissible orders, matrices, and tangent directions. It uses no numerical sampling, support enumeration, or limiting passage from positive entries. No additional computational test was needed to verify these symbolic steps.

## Attribution and prior overlap

The projected tensor and its marginal isotropy are credited in the draft to Lemma 3.1 of [Lavi's 2026 Marcus–Minc manuscript](https://arxiv.org/html/2609.29262v1). The mixed-Hessian application and the displayed $`16k^2`$ estimate are the sharper argument reviewed here.

The separate source audit found an earlier dimension-independent bound
$`|\sigma_j(X)|\leq(D_j^2/j!)\|X\|_F^j`$ for all real zero-margin $`X`$, with an accessible mathematical proof in the August 2026 DCPRevere repository. Ordinary polarization gives a mixed derivative bound from that scalar inequality and already implies eventual global strict convexity. I also checked the complete polarization deduction in `agent-inequalities/prior-bound-implication.md`: the constant $`C_jj^j/(j-2)!`$, the exact coefficient ratio, the $`O_k(n^{-1/2})`$ tail, and its explicit large threshold are all correct.

Therefore this review supports the correctness of the quantitative theorem, not a claim that the historical existential conjecture was unresolved before this campaign. The result remains uncounted research under the user's exclusion of threshold improvements.
