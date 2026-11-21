# Christiano 2014: exact cash menu and stopping point

Checked 2026-11-21. This note records no solution, prize acceptance, or payment. The two cash clauses are historical primary offers. The searched sources do not establish that the sponsor has renewed or withdrawn them.

## 1. The paid questions

The [original COLT 2014 paper](https://proceedings.mlr.press/v35/christiano14.html), [five-page primary PDF](https://proceedings.mlr.press/v35/christiano14.pdf), defines a universe of $`n`$ items, $`k`$ labels, and local arity $`r`$. Each round reveals an $`r`$-element set. The learner chooses a distribution over its labelings, then receives the full payoff function with values in $`[-1,1]`$. Expected regret is measured against the best fixed global labeling of all items. The local sets and payoff functions are adversarial.

The second printed page offers US$500 for an **affirmative answer to each** of two questions:

| Item | Required algorithm | Scope that must be retained |
| --- | --- | --- |
| 1 | Efficient regret $`O(\sqrt{n\log(k)T})`$ for $`r=2`$ | The logarithmic dependence must hold for arbitrary label-set size, not just constant $`k`$. |
| 2 | Efficient regret $`o(\sqrt{n^{r/2}T})`$ | The surrounding discussion and appendix concern higher arity. The intended improvement is in the item-count dependence for nontrivial fixed arity and alphabet, not the trivial alphabet or a selected horizon regime. |

The source's general model allows positive $`r`$, but its discussion explicitly separates the known constant-alphabet pairwise case from the higher-arity obstruction. Reading item 2 as the already-known $`r=2`$ case, a one-label case, or an inconsistent universal claim including $`r=1`$ would not produce a defensible prize solution. Efficiency must hold in the ordinary input parameters; the paper treats a constant number of hierarchy rounds as polynomial time and growing polynomially many rounds as nonpolynomial time.

A negative result, conditional or unconditional, does not meet either affirmative-only cash clause. This matters because a later paper describes the label-dependence question as resolved.

## 2. What the 2015 result actually proves

Awasthi, Charikar, Lai, and Risteski, [*Label optimal regret bounds for online local learning*](https://proceedings.mlr.press/v40/Awasthi15a.html), [primary PDF](https://proceedings.mlr.press/v40/Awasthi15a.pdf), studies pairwise queries. Its Theorem 3 gives a polynomial-time algorithm with regret

```math
O\!\left(\sqrt{nkT}\right).
```

Corollary 1 and Appendix A prove that, for fixed positive $`\varepsilon`$, a polynomial-time algorithm with regret of order

```math
\sqrt{n k^{1-\varepsilon}T}
```

would yield a polynomial-time algorithm distinguishing a random graph on $`N`$ vertices from one with a planted clique of size $`N^{1/2-\varepsilon/6}`$, with success probability at least $`4/5`$. Here $`N`$ is the graph size in the reduction, not the online universe size $`n`$. The theorem's constants can be absorbed in the reduction. A second reduction uses a planted-dense-subgraph conjecture.

Thus the optimal logarithmic label dependence is subject to a substantial prior conditional barrier. It is not supplied by the published upper bound, and it has not been unconditionally disproved by this theorem. Section 4 still separates the possibility of subexponential-time improvements from the question of basing hardness on standard worst-case assumptions. The paper does not give the higher-arity affirmative algorithm from item 2.

## 3. Higher-arity prior results and their limits

The original Christiano appendix already supplies two relevant facts. They are prior work, not deductions to count in this campaign.

1. Its Theorem 1 excludes regret $`O(\sqrt{n^{r/2-\varepsilon}T})`$ when the comparator is a fixed-level Lasserre pseudodistribution relaxation. This is a stronger comparator class than actual global labelings. The theorem is not an unconditional lower bound for all online algorithms. Its written proof concerns a fixed power improvement; it does not by itself exclude every logarithmic saving covered by little-o notation.
2. Section 4.3 converts a regret guarantee $`O(\sqrt{cT})`$ into detection of noisy planted $`r`$-XOR using order $`c`$ clauses. A favorable planted-CSP algorithm is not automatically a reverse reduction to adversarial online prediction.

The following nearby primary results were checked for a possible affirmative transfer:

| Primary result | Actual scope | Why it does not supply the paid algorithm |
| --- | --- | --- |
| Rakhlin–Sridharan 2015, [*Hierarchies of Relaxations for Online Prediction Problems with Evolving Constraints*](https://proceedings.mlr.press/v40/Rakhlin15.pdf), model on pp. 2 and 5 and random-playout rule | The learner can sample the known conditional process generating evolving constraints and side information. Its regret includes the relaxation's integrality gap. | An arbitrary adversarial sequence of Christiano local queries does not provide that sampling access. The paper also discusses adversarial ordering of known nodes, which does not erase the stated process assumption for arbitrary evolving constraints. |
| Barak–Moitra, [*Noisy tensor completion via the sum-of-squares hierarchy*](https://link.springer.com/article/10.1007/s10107-022-01793-9), published 2022, Theorem 3.3 | Random observation locations; sixth-level norm Rademacher complexity bounded by $`O(\sqrt{n_1^{1/2}(n_2+n_3)\log^4 n/m})`$. The earlier manuscript is [arXiv:1501.06521](https://arxiv.org/abs/1501.06521). | This is a tensor-completion result with a stochastic observation model, and its displayed rate does not provide the requested little-o saving. |
| [*Algorithms and Certificates for Boolean CSP Refutation: Smoothed Is No Harder Than Random*](https://par.nsf.gov/servlets/purl/10423407), STOC 2022, Theorem 1.4 | A semirandom arity-$`r`$ instance can be refuted in time $`n^{O(\ell)}`$ with at least $`n(n/\ell)^{r/2-1}\mathop{\mathrm{poly}}(\log n/\epsilon)`$ constraints. | At fixed $`\ell`$, the written guarantee does not beat $`n^{r/2}`$ by a little-o factor. Taking growing hierarchy size changes the runtime, and this is still a refutation theorem rather than a complete adversarial online algorithm. |

Targeted searches covered the exact original title, the 2015 title and theorem family, higher-arity online learning, tensor prediction, and sub-spectral random-XOR refutation. They found no affirmative theorem matching either paid target. This is a bounded source audit, not a proof that no later result exists.

## 4. A direct pair-lifting attempt stops at the requested scale

A natural attempt is to encode blocks of original items as super-items, give each super-item a label containing its block's assignment, and apply the known pairwise algorithm. The following elementary count explains why merely changing the block family does not make the published regret parameter little-o. No priority claim is made for this observation.

Suppose there are $`N`$ blocks, each of size at most $`b`$, and every original $`r`$-subset is contained in the union of two blocks. Counting all possible block pairs, with repetitions permitted, gives

```math
\binom nr\le N^2\binom{2b}{r}.
```

Using a common alphabet of size $`k^b`$ for their assignments makes the 2015 pairwise regret parameter $`Nk^b`$. For fixed $`r`$ and $`k\ge2`$, the number

```math
C_{r,k}=\sup_{b\ge1}\frac{\binom{2b}{r}}{k^{2b}}
```

is finite and positive, since the numerator grows polynomially and the denominator exponentially. Therefore

```math
Nk^b\ge \sqrt{\binom nr/C_{r,k}}
       =\Omega_{r,k}(n^{r/2}).
```

Consequently the existing bound $`O(\sqrt{Nk^bT})`$ cannot, by this block-count parameter alone, certify item 2. This remains true if $`b`$ grows while the encoded alphabet is polynomial in $`n`$. It is a limitation of this attempted use of that guarantee, not a regret lower bound for every block algorithm or every online learner.

## 5. Stopping status and source receipts

No qualifying affirmative algorithm was obtained. The source audit prevents treating conditional hardness, stochastic tensor completion, or a constant-factor block-size gain as a paid resolution. The lane is stopped here while a different exact paid target is sought.

Local primary receipts:

| Source | Local file | SHA-256 |
| --- | --- | --- |
| Christiano COLT 2014 | `agents/other_paid/older_colt/sources/christiano14.pdf` | `74612d92460c2e044ea68d3dd20c5deed7ab9fa741d70b84e6400dfe417fa442` |
| Awasthi et al. COLT 2015 | `agents/demath_zzz/christiano-online-local/awasthi2015.pdf` | `4c9b5ff303b332756abab5b131cbda7f6d137128ca6759d53d84ebb2550a654f` |

The other full primary texts were inspected through the linked publisher or repository pages. Their URLs are recorded above; no uncomputed local checksum is asserted.
