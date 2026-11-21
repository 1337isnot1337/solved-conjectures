# Independent review of the singleton-refinement barrier

21 November 2026. Reviewed source: [singleton-refinement-barrier.md](singleton-refinement-barrier.md), SHA256 `9039702ef93c9d9079bfd3d48b03c3880c5fe9924d1a764ce336ad9a8b8582ce`.

## Verdict and scope

The stated conversion theorem passes independent mathematical review. It proves natural density for the specified finite-per-block singleton refinements of Wang's multiple-residue construction. It does not prove or refute unrestricted Erdős 25. No Lean replay, new-priority claim, submission, or award is asserted.

## Checks

1. **Activation count.** A single class with modulus $`d`$ contains at most $`X/d`$ active integers up to $`X`$. Normalization of its residue removes the otherwise possible initial term below $`d`$.
2. **Divisor allocation.** Summing over all new moduli divisible by some $`Tq`$ gives $`(W/T)(1+\log(X/(Tq_0)))`$. Overlap between different source-divisor lists only overcounts. The bound remains valid for an infinite new family because only finitely many moduli activate below $`X`$.
3. **Period cutoff.** At $`X\lt TQL`$, the logarithm is at most $`1+\log(QL/q_0)`$. The common dilation cancels. At $`X\ge TQL`$, periodic containment gives density at most $`\eta+1/Q`$ from the error $`TL/X`$. This is uniform in the dilation.
4. **Block assembly.** Finitely many new classes per source block make each finite union eventually periodic. The summable uniform tail bound then gives natural density by a direct liminf/limsup squeeze. The note correctly does not infer density for an arbitrary infinite replacement family inside one block.
5. **Wang parameters.** The inequalities $`W_j\le20M_j/(19Q_j)`$ and $`\log L_j\le M_j\log(21Q_j/20)`$ hold without assuming coprimality. With $`M_j\le2^{k_j}`$ and $`k_j=O(\sqrt j)`$, the resulting $`O(j2^{2k_j-j})`$ term is summable; the original $`e^{-k_j/100}`$ term is also summable.
6. **Affine lifts.** For arbitrary integer $`b`$, the set defined by $`\lfloor(m-b)/T\rfloor\in U`$ is $`TL`$-periodic and has the same density as $`U`$. The displayed $`T`$ residue classes exactly describe the lift of one old cylinder. Further subdivisions have the required divisibility and containment. A single affine copy is a subset of this thickened lift.
7. **Singleton scope.** Divisibility and containment are separate hypotheses. Distinct moduli within a block are used in the reciprocal count; cross-block duplicates must agree in residue if the resulting system is to satisfy the original singleton condition.

The final revision corrects one display typo before `\qquad`. It changes no mathematical claim.

The original multiple-residue theorem and its exact primary source were checked separately for target mismatch. This review does not certify Wang's entire analytic or Lean proof.

