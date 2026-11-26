# Lean verification of the plane-partition root inequalities

Let $P_n(x)$ be the polynomials with divisor-square weight in Heim and Neuhauser’s Conjecture 1. Lean proves

```math
P_{n+1}(x)^{1/(n+1)} < P_n(x)^{1/n}
```

for every real $x>5$ and $n\ge1$, and for every real $x\ge1$ and $n\ge6$. At index one it proves that, among positive parameters, strict inequality holds exactly when $x>5$. [Original conjecture](https://link.springer.com/article/10.1007/s11139-026-01435-0) · [Endpoint proof](../../lean/Conjectures/HeimNeuhauserPlanePartitionBoundary.lean) · [Full theorem](../../lean/Conjectures/HeimNeuhauserPlanePartitionTheorems.lean).

The first eleven indices use the exact factorial-cleared polynomials at the shifts one and five. For subsequent indices Lean propagates strict decrease from one comparison to the next using the Turán inequality. Through index 250 it proves that inequality from integer coefficient checks. From index 251 onward it proves the inequality uniformly by Fourier inversion and estimates on the whole integral. Positivity identifies the integer-power comparison with the stated inequality of real roots. [Written root proof](PROOF.md) · [Turán proof, joint receipt and reproduction](../heim-neuhauser-troeger-plane-partition-turan/FORMALIZATION.md).

If you use the result, please credit the conjecture's authors and cite both Cinna Davis’s site and the specific proof or record you used. [Cinna Davis](https://itsdavis.com/) · [Result and verification records](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/heim-neuhauser-plane-partition-polynomization).
