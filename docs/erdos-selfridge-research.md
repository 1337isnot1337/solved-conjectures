# Erdős–Selfridge conjecture

[Erdős Problem 7](https://www.erdosproblems.com/7) asks whether residue classes modulo finitely many distinct odd integers greater than one can cover the integers. The conjecture asserts that they cannot. The problem also appears in Wikipedia’s [list of conjectures by Paul Erdős](https://en.wikipedia.org/wiki/List_of_conjectures_by_Paul_Erd%C5%91s).

## Status as of 2026-11-20

Hough and Nielsen prove that some modulus of every distinct covering system is divisible by 2 or 3. Balister, Bollobás, Morris, Sahasrabudhe and Tiba prove that the least common multiple is divisible by one of 2, 9 or 15, and their squarefree theorem rules out all-odd distinct systems with squarefree moduli. Dai, Li, Li and Yi strengthen the all-odd condition to divisibility of the least common multiple by 45 and show that some modulus is at most 9. Their least-common-multiple result permits the factors 9 and 5 to come from different moduli.

- [Hough and Nielsen, *Covering systems with restricted divisibility*](https://arxiv.org/abs/1703.02133)
- [Balister et al., *On the Erdős covering problem: the density of the uncovered set*](https://arxiv.org/abs/1811.03547)
- [Balister et al., *The Erdős covering problem for squarefree moduli*](https://arxiv.org/abs/1901.11465)
- [Dai et al., *On the moduli of distinct covering systems*](https://arxiv.org/abs/2611.15110)

The published odd coverings in which a modulus repeats fall outside the conjecture. The recent rank and prime-divisor exclusions have support restrictions. The detailed research ledger also identifies a gap in the global nonexistence claim on Zenodo involving passage from local coverage to reuse of prime powers. I found no proof of the unrestricted statement in these sources.

- [Bispels et al., *Odd covering systems with one repeated modulus*](https://arxiv.org/abs/2507.16135)
- [Schroeder, *Odd distinct covering systems require at least nine prime divisors*](https://michaelschroeder.ai/research/NinePrimeSupport/companion)
- [Research ledger and assessment of the global nonexistence claim](https://the-omega-institute.github.io/trureturing-mdbook/Problems/erdos-7-odd-covering-systems.html)
- [Global nonexistence claim](https://zenodo.org/records/18440762)

## Removing the moduli divisible by 45 from the comparison

Use the CRT space of the prime-power factors of the least common multiple. At each prime $p$, delete the pure $p$-power classes from the reference measure on that coordinate. Their union has uniform measure at most $1/(p-1)$. The resulting measure has density at most $(p-1)/(p-2)$ relative to uniform. A mixed class with largest prime $p$ and fixed earlier coordinates therefore covers at most $1/(p-2)$ of the new reference fiber. Let $N_p$ count the mixed classes at that stage whose earlier-coordinate conditions are active.

For a distortion threshold $\delta_p=t_p/(p-2)$ with $0\le t_p\lt p-2$, Dai et al.'s conditional probability and convex comparison lemmas give a stage loss at most

```math
\frac{\mathbb E (W_p-1-t_p)_+}{p-2-t_p}.
```

Here the independent comparison exponent $T_q$ at each previous prime $q$ has tail $\Pr(T_q\ge e)=\min(1,\gamma_q/q^e)$ for $e\ge1$, where $\gamma_q=(q-1)/(q-2-t_q)$. The variable $W_p-1$ counts the eligible predecessor cofactors other than 1 with all exponents within $T_q$. Indeed, the union bound on the new fiber gives $N_p/(p-2)$, and the one-coordinate nesting inequality for the hinge loss allows each required earlier residue to be replaced by the corresponding nested condition on $T_q$. The pure power case gives $t_3=0$ and $\gamma_3=2$.

If every modulus avoids divisibility by 45, then $W_5-1=\mathbf 1_{T_3\ge1}$. The choice $t_5=1$ gives no comparison loss at 5 and $\gamma_5=2$. For $p\ge7$ the eligible powers of 3 and 5 have either no factor of 5 or at most one factor of 3. Thus

```math
W_p=\big((T_3+1)(T_5+1)-(T_3-1)_+T_5\big)
\prod_{7\le q\lt p}(T_q+1),
```

where the product is over primes. This gives an explicit comparison for the proposed restriction, including arbitrary prime-power heights. The mean of the first factor is $17/6$ under the stated thresholds. With $t_7=0$, the comparison loss at 7 alone is therefore $11/30$.

A trial with fixed small-prime thresholds and $t_p$ approximately $(p-2)/3$ thereafter used up the full comparison budget before reaching the tail. This trial does not bound the optimum over threshold choices. It also discards the actual residue compatibility between cofactors. In particular, a single cofactor containing 3 but no 9 can be assigned to only one of the two residue branches left when a class modulo 3 is removed. The comparison assigns the full divisor count to both branches separately. Using one joint choice across these branches and the 5-coordinate could improve the bound. The current estimate proves neither that an individual modulus must be divisible by 45 nor the conjecture.
