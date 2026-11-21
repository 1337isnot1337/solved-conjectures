# Independent review of the Erdős 50 tangent reductions

21 November 2026. Reviewer: the coordinating agent, independently of the
author of the two probability arguments. The reviewed conclusions are
partial deductions. Erdős 50 remains unresolved.

## Reviewed versions and target

| Author file | SHA-256 |
| --- | --- |
| [Target and prior audit](target-and-prior-audit.md) | `dcbc19c4cf007a6818fc51a0a5714a637617b699a5fbc6a5cd42e53e324dc234` |
| [Finite-prime tangent reduction](tangent-cylinder-reduction.md) | `17e1349370c92705b8819df87ba77f8dd57d338af98ce6f65fc7fed39db01b98` |
| [Inverse-scale cutoff](inverse-scale-cutoff.md) | `c3580da0b7b789e3ab170c0a2267fc3f5cfefc8fe2c30a9de483c13073de339d` |

The primary [Erdős problem collection](https://users.ime.usp.br/~yoshi/resenhas/abstracts/Erdos.pdf), section 9, explicitly offers USD 250 for a proof or disproof of the assertion that the limiting distribution of the totient ratio has no finite positive derivative. The separate live [Conjectures.io listing](https://conjectures.io/problems/erdos50-erdos-50) was also opened during this review. It displayed an estimated USD 2,724, compared with USD 2,515 in the author's earlier check. These are observations at different times, not locked awards. No submission or payment is claimed.

The target is a pointwise assertion. The established singularity of the
distribution only forces a zero derivative almost everywhere, so it does
not settle the problem. The review below does not replace the target by
an almost-everywhere statement.

## 1. The probability model and finite products

The independent-prime model has

```math
X=\prod_p(1-1/p)^{B_p},\qquad \Pr(B_p=1)=1/p.
```

The logarithmic tail is integrable because

```math
\sum_{p>P}\frac{-\log(1-1/p)}p
\le\sum_{p>P}\frac1{p(p-1)}.
```

The argument for distinctness of finite products is valid. After cancelling
the common prime factors of two candidate products, take the largest prime
in their symmetric difference. Cross multiplication puts that prime on
one side. Every numerator factor on the other side is smaller, and every
remaining denominator prime there is different. This is a contradiction.
Nothing in this argument asserts uniqueness of infinite expansions.

The elementary endpoint lower bound used in the note is sufficient. For
small positive $`u`$, forbid all selected primes up to
$`P=\lceil2/u\rceil`$. The remaining logarithmic tail has expectation at
most $`1/P\le u/2`$, so with conditional probability at least one half it
is at most $`u`$. Then $`X\ge e^{-u}>1-u`$. Mertens's prime-product bound
supplies a constant multiple of $`1/\log(1/u)`$ for the probability of
the forbidden-prime event. The stronger known endpoint asymptotic is not
needed in either proof.

## 2. The individual-cylinder obstruction

Conditioning on every prime in a finite set $`A`$ being selected has
probability $`1/Q_A`$. The remaining product stochastically dominates
the full product. This proves the lower bound on the mass just below
$`t_A=\prod_{p\in A}(1-1/p)`$ without incorrectly introducing an
independent second copy of the full distribution.

If $`f'(x)=d<\infty`$, differentiability controls the two interval
endpoints uniformly when $`|t_A-x|\le Ch`$. For each fixed positive
$`\eta`$, it follows that

```math
\limsup_{h\downarrow0}
\sup_{|t_A-x|\le Ch}
\frac1{Q_Ah\log(1/h)}\le\frac{d\eta}{c_0}.
```

The constants and logarithmic comparison are uniform over the indicated
sets. Letting $`\eta\downarrow0`$ proves the claimed zero limit. The order
of limits is legitimate: first fix $`\eta`$, then take the limit in
$`h`$, and only then decrease $`\eta`$.

The stated limitation at rational points also passes. If a rational
$`a/b`$ is not one of the finite products, then
$`|t_A-a/b|\ge1/(bQ_A)`$. Its contribution to the supremum is therefore
at most $`bC/\log(1/h)`$. The example $`1/4`$ is correctly excluded from
the finite products by the largest-prime argument. This necessary
condition cannot by itself settle even that one rational point.

## 3. The exact tangent equivalence

For the unconditional truncation $`P(h)=\lceil h^{-4}\rceil`$, the
pointwise product displacement is bounded by a nonnegative random
variable of expectation at most $`h^4`$. Markov's inequality gives
spatial error $`h^2`$ with probability error at most $`h^2`$. Both errors
are $`o(h)`$, as required for a derivative-scale statement.

The two CDF comparisons have the correct directions. In particular,
$`X\le X_h`$ gives $`F_h\le f`$, and the displacement estimate gives
$`f(t)\le F_h(t+h^2)+h^2`$. Shifting this last inequality gives the
other lower comparison in the author's formula (7).

The atom at a finite product is exactly

```math
\Pr(X_h=t_A)
=\prod_{p\in A}\frac1p
  \prod_{\substack{p\le P(h)\\p\notin A}}\left(1-\frac1p\right)
=\frac{M(P(h))}{R_A}.
```

There are no merged atoms because finite products are distinct. The
forward implication to the weighted interval limit follows from the
uniform derivative expansion. For the converse, enlarge and shrink a
fixed scaled interval by $`\varepsilon h`$, absorb the smaller spatial
error, apply the assumed limit, and then let $`\varepsilon`$ tend to
zero. The intervals with scaled endpoints $`(0,1)`$ and $`(-1,0)`$
recover both one-sided derivatives. The claimed equivalence therefore
passes.

## 4. The inverse-scale strengthening

This separate note uses the derivative hypothesis. Chebyshev's bound
for the number of primes, applied on dyadic intervals, gives

```math
\mathbb E Z_h\ll\frac1{P\log P}
=O\!\left(\frac h{\log(1/h)}\right)=o(h),
\qquad P=\lceil1/h\rceil.
```

This expectation estimate alone would not justify a derivative-scale
transfer. The additional local mass argument supplies the missing step.
For every $`h\le r\le r_0`$, independence yields

```math
\Pr(|U_h-x|\le r)\Pr(Z_h\le r)
\le\Pr(x-2r\le X\le x+r)\le Cr.
```

The second factor on the left is at least one half for all sufficiently
small $`h`$, uniformly over that range of $`r`$. Thus the finite-prefix
law has the required $`O(r)`$ local bound at every intermediate scale.

For a compactly supported Lipschitz test function, condition on
$`Z_h=z`$. If either test value is nonzero, $`U_h`$ lies within
$`Kh+z`$ of $`x`$. When $`z\le h`$, multiply the $`O(h+z)`$ local
mass bound by the $`O(z/h)`$ Lipschitz difference. When
$`h\lt z\le r_0/2`$, multiply the same mass bound by the uniform bound
on the test function. Each result is $`O(z)`$. Finally,
$`\Pr(Z_h>r_0/2)=O(\mathbb E Z_h)`$ handles larger translations
without an unsupported global local-density assumption.

Integration therefore gives an $`O(\mathbb E Z_h)=o(h)`$ difference
between the two test integrals. The positive measures converge locally
after division by $`h`$ to $`d`$ times Lebesgue measure. Approximation
of fixed interval indicators proves the stated necessary finite-product
limit at cutoff $`\lceil1/h\rceil`$. No unconditional converse at this
smaller cutoff is established or needed.

## 5. What is still missing

I also checked [Toulmonde's primary paper](https://www.impan.pl/shop/en/publication/transaction/download/product/83896), especially Lemma 9. Its uniform remainder has the slower scale identified in the note. If $`L=\log(1/h)`$, the logarithm of the ratio of that remainder to $`h`$ is

```math
L-c\sqrt{L\log L}\longrightarrow+\infty.
```

That error cannot be discarded in a limit divided by $`h`$.

The individual-cylinder condition does not bound the total contribution
of many small cylinders. Neither note proves that the required positive
flat tangent is impossible. The review passes the stated reductions,
including the smaller necessary cutoff, and rejects any interpretation
of them as a solution of the bounty. No Lean verification or external
refereeing is claimed. This work adds zero completed problems.
