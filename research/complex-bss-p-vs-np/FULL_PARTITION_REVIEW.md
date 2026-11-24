# Independent review: full-partition gluing and central re-entry

Reviewer: weighted-protocol agent, 23 November 2026 (America/Chicago).

Reviewed `FULL_PARTITION_CERTIFICATE_ATTEMPT.md`, Sections 1–4. The algebraic gluing lemma and explicit uniform re-entry example pass. The file correctly leaves the production of short leaf Hilbert certificates unproved.

## Gluing two supplied certificates

From
```math
1=\sum_i f_i a_i+ha,\qquad
1=\sum_i f_i b_i(x,u)+(hu-1)b(x,u),
```
substitution $`u=1/h`$ is valid in $`\mathbb C[x,h^{-1}]`$ when $`h\ne0`$. Homogenizing each gate with its syntactic degree in $`u`$ gives polynomial circuits
$`B_i=h^K b_i(x,1/h)`$, with
```math
h^K=\sum_i f_iB_i.
```
The maximum syntactic degree has logarithm $`O(S+1)`$. Addition gates require powers of $`h`$ for the degree gaps; multiplication gates require no further clearing. Binary powering gives the stated degree-independent polynomial overhead.

The final coefficients are correct:
```math
\sum_i f_i\bigl(a^KB_i+a_iS_K(ha)\bigr)
=(ha)^K+(1-ha)S_K(ha)=1.
```
The geometric sum $`S_K`$ has an $`O(\log(K+1))`$-size circuit by the two doubling identities in the file. The zero-polynomial case $`h=0`$ is handled separately and correctly.

For exact gate accounting, the supplied resource size should include the number of outputs $`r`$ and the circuit for $`h`$, or the bound should explicitly be polynomial in those quantities as well. This does not affect the mathematical statement or its degree independence.

Nothing in this construction obtains either input certificate from a Boolean answer about branch feasibility. Nor does the one-split bound automatically control iteration over a large computation tree.

## Uniformity and re-entry example

At a primitive $`D=2^m`$-th root $`\zeta`$, induction gives
```math
U_j(\zeta^a)
=\zeta^{\,2^j\lfloor a/2^j\rfloor},
\qquad
B_j(\zeta^a)=a_j.
```
The next $`U`$-update removes exactly the $`j`$-th bit. The powers
$`\zeta^{D-2^j}`$ avoid division and remain well-defined on arbitrary complex inputs, including $`\zeta=0`$.

There is a uniform $`O(m^2)`$ construction. Precomputing the $`m`$ successive squares of $`\zeta`$ and their suffix products gives all $`\zeta^{D-2^j}`$; the powers of $`U_j`$ use at most $`m-j-1`$ squarings each. The remaining arithmetic and branch work is $`O(m)`$.

For every input, each selected $`c_j`$ is nonzero by construction. Therefore $`xc=0`$ holds exactly when $`x=0`$. The algorithm is correct globally, not only on the root-of-unity specialization.

At $`\eta=0`$, a zero central value of $`p_j`$ has derivative
```math
B_j'(\zeta^a)+\tau D(\zeta^a)^{D-1}\ne0.
```
The first term is algebraic and the coefficient of the one fixed transcendental $`\tau`$ is a nonzero algebraic number. Thus every zero is simple. The other central factors have value one.

Along $`t=\zeta^a+\epsilon`$, all factors are nonzero rational functions of $`\epsilon`$. All these arcs consequently take the same all-nonzero branch pattern for generic $`\epsilon`$, while the central inputs exhibit all $`2^m`$ patterns. For fixed $`x\ne0`$, the generic-path final register has order equal to the number of zero bits of $`a`$.

The primitive root is an input coordinate. Only $`\tau`$ is an additional fixed complex machine constant. The construction therefore has the claimed uniformity and respects the standard allowance for arbitrary fixed constants.

The scope is correct: this gives exponential re-entry width for a polynomial-time correct program. It refutes a path-enumeration bound inferred solely from time. It does not rule out a symbolic simplification that exploits this particular program's redundant branches.

## Primary-source direction check

I opened the author-hosted Grochow–Pitassi manuscript:
<https://www.cs.toronto.edu/~toni/Papers/jacm-gp.pdf>.

Proposition 3.1 derives a complexity inclusion from polynomial-size IPS proofs; its immediately following remark discusses the BSS variant without constant-freeness. Theorem 1.2 derives algebraic circuit lower bounds from IPS lower bounds. The full-partition note uses these directions correctly and does not import a reverse theorem producing small IPS proofs from an arbitrary decision procedure.

The reviewed assertions are written mathematical results, not formal verification. No HN separation follows from them.
