# The inverse-scale finite-prime cutoff at a finite derivative

This is a necessary-condition strengthening of [the finite-prime tangent note](tangent-cylinder-reduction.md). It does not assert an unconditional converse or resolve Erdős 50. Use the same independent-prime probability model $`X=\prod_p(1-1/p)^{B_p}`$, with $`\Pr(B_p=1)=1/p`$, and $`f(t)=\Pr(X\le t)`$. Fix $`x\in(0,1)`$ and suppose $`f'(x)=d<\infty`$. Put

```math
P=\lceil1/h\rceil,\qquad
U_h=\prod_{p\le P}q_p^{B_p},\qquad
Z_h=\sum_{p>P}(-\log q_p)B_p.
```

The variables $`U_h`$ and $`Z_h`$ are independent and $`X=U_he^{-Z_h}`$. Chebyshev's prime-counting upper bound, summed over dyadic intervals, gives

```math
\mathbb E Z_h
\le\sum_{p>P}\frac1{p(p-1)}
\ll\frac1{P\log P}=o(h).                             \tag{10}
```

Let $`\nu_h`$ be the law of $`U_h`$ and $`\mu`$ the law of $`X`$. Differentiability gives constants $`C,r_0>0`$ such that

```math
\mu([x-2r,x+r])\le Cr\qquad(0\lt r\le r_0).
```

If $`|U_h-x|\le r`$ and $`Z_h\le r`$, then $`X\in[x-2r,x+r]`$, since $`0\le U_h-X\le Z_h`$. Independence and (10) therefore imply, for sufficiently small $`h`$,

```math
\nu_h([x-r,x+r])\le2Cr
\qquad(h\le r\le r_0),                              \tag{11}
```

because $`\Pr(Z_h\le r)\ge1-\mathbb E Z_h/h\ge1/2`$.

Now let $`\psi`$ be a fixed compactly supported Lipschitz function, with support in $`[-K,K]`$, where $`K\ge1`$. If either of

```math
\psi((U_h-x)/h),\qquad\psi((X-x)/h)
```

is nonzero, then $`|U_h-x|\le Kh+Z_h`$. Conditional on $`Z_h=z\le r_0/2`$ and for $`Kh\le r_0/2`$, (11) bounds the probability of this event by $`2C(Kh+z)`$. The absolute difference of the two test values is at most

```math
\min\{2\|\psi\|_\infty,\ \mathop{\mathrm{Lip}}(\psi)z/h\}.
```

Multiplying these bounds gives at most $`C_\psi z`$: use the Lipschitz bound for $`z\le h`$ and the uniform bound for $`z>h`$. For $`z>r_0/2`$, the expectation of the uniform bound is $`O_\psi(\mathbb E Z_h)`$ by Markov's inequality. Hence

```math
\left|\int\psi\!\left(\frac{t-x}{h}\right)\,d\nu_h(t)
      -\int\psi\!\left(\frac{t-x}{h}\right)\,d\mu(t)\right|
\le C_\psi\mathbb E Z_h=o(h).                        \tag{12}
```

After division by $`h`$, the second integral tends to $`d\int\psi`$ by differentiability. Thus the finite-prefix measures with $`P=\lceil1/h\rceil`$ have the same Lebesgue tangent. Approximating interval indicators from above and below by compact Lipschitz functions gives the companion note's weighted finite-product limit (9) with this smaller cutoff as a **necessary** condition.

The local mass estimate (11) is the step that makes the expectation bound $`o(h)`$ sufficient. Without that estimate, simply dividing a Markov error by $`h`$ would be invalid. Conversely, a proposed flat limit for this smaller-cutoff family alone does not automatically supply (11) uniformly on all intermediate scales, so no reverse implication is asserted here.


The aggregate of many individually negligible cylinders remains uncontrolled. No new full bounty resolution is claimed. The proof uses the original multiplicative variable and its independent logarithmic tail, so it does not require a change of derivative coordinates.
