# Bounded-occurrence 3-CNF weighted counting and VP versus VNP

**Classification:** Conditional consequence of an external, unreviewed proof claim. This is a reduction to a VNP-complete polynomial family, not a newly solved conjecture. It is intentionally excluded from the root Results table and solved-result totals.

## Statement

For each integer n >= 3, construct a 3-CNF formula Phi_n with N_n = O(n^3) variables and O(n^3) clauses such that every variable appears in at most three literal occurrences. Define its weighted satisfying-assignment polynomial over a field K by

```math
W_{\Phi_n}(z_1,\ldots,z_{N_n})
=\sum_{a\models\Phi_n}\prod_{u:a_u=1}z_u.
```

There is an explicit projection pi_n mapping each z_u either to 1 or to an edge variable X_ij such that

```math
W_{\Phi_n}(\pi_n(X))
=HC_n(X)
=\sum_{\substack{\sigma\in S_n\\\sigma\text{ is one cycle}}}
\prod_{i=1}^n X_{i,\sigma(i)}.
```

The identity and construction are unconditional and valid in **every characteristic**, including characteristic 2. By Valiant's known all-field VNP-completeness theorem for HC_n, the particular family W_{Phi_n} is VNP-complete under p-projections over every field.

**Conditional consequence.** If the lower bound asserted in Anthropic's November 23, 2026 preprint is correct, then for some field-dependent c_K > 0 and sufficiently large n,

```math
\underline{\mathrm{size}}_K(W_{\Phi_n})
\geq \underline{\mathrm{size}}_K(HC_n)
\geq \exp\!\left(c_K(\log n)^{4/3}\right)
=\exp\!\left(\Omega_K((\log N_n)^{4/3})\right).
```

Here the underlined size is **border arithmetic circuit size**. Ordinary arithmetic circuit size is at least as large. This does **not** imply Boolean circuit lower bounds, #P lower bounds, P != NP, or a new proof of VP != VNP.

## Explicit construction and proof

1. Fix vertex 1 at the beginning of a directed Hamiltonian cycle. For positions p in {2,...,n} and vertices j in {2,...,n}, introduce b_{p,j}. Require exactly one true b in each row and column. Use pairwise negative clauses for the at-most-one constraints and an OR chain of binary Tseitin gates for each at-least-one constraint. Thus the satisfying b assignments are precisely the permutations (v_2,...,v_n) of {2,...,n}.

2. Introduce e_{ij} for ordered pairs i != j. Use binary fan-in gates and Tseitin equivalence clauses to enforce

```math
e_{1j}\leftrightarrow b_{2j},\qquad
e_{i1}\leftrightarrow b_{ni},\qquad
e_{ij}\leftrightarrow
\bigvee_{p=2}^{n-1}(b_{pi}\wedge b_{p+1,j})
\quad (i,j\geq2,\; i\neq j).
```

An AND equivalence z <-> (x AND y) uses (-z OR x), (-z OR y), (z OR -x OR -y); OR is analogous. Every gate has a unique output once its inputs are fixed. Consequently, all the e and gate variables are uniquely determined by b. Call the resulting 3-CNF T_n.

3. Make variable occurrences sparse. For each original variable v having r literal occurrences, replace those r occurrences by fresh variables v_1,...,v_r. When r >= 2, add the directed implication cycle

```math
(\neg v_1\vee v_2)\wedge(\neg v_2\vee v_3)
\wedge\cdots\wedge(\neg v_r\vee v_1).
```

A cyclic chain of implications forces all copies equal. Each copy occurs once in an original clause, once as the antecedent of an implication, and once as a consequent: **at most three total occurrences**. The copying adds no freedom to satisfying assignments. Denote this formula by Phi_n.

4. Project weighted variables. For each edge indicator e_{ij}, assign X_ij to the weight variable corresponding to exactly one occurrence-copy of e_{ij}; substitute 1 into every other weighted variable, including other copies of e_{ij}. For the satisfying assignment determined by (v_2,...,v_n), the projected monomial is exactly

```math
X_{1,v_2}X_{v_2,v_3}\cdots X_{v_{n-1},v_n}X_{v_n,1}.
```

Every directed Hamiltonian cycle occurs exactly once, because the cycle has a unique written representation beginning at 1. Therefore coefficients are exactly 1, even in characteristic 2, and the polynomial identity follows.

### Size bound

There are O(n^2) permutation variables and O(n^2) edge indicators. Exactly-one constraints take O(n^3) clauses total; the n(n-1) edge conditions require O(n) binary gates each, hence O(n^3) gates and Tseitin clauses overall. The occurrence-splitting step adds one variable and at most one clause per original literal occurrence. Thus N_n = O(n^3) and the formula has O(n^3) clauses. It is uniformly constructible in polynomial time. Conversely N_n is at least (n-1)^2, so log N_n = Theta(log n).

### VNP membership

For a Boolean assignment vector a, let ell(a) denote a_i for a positive literal and (1-a_i) for a negative one. The polynomial

```math
Q_n(z,a)=
\left(\prod_{C\in\Phi_n}
\left[1-\prod_{\ell\in C}(1-\ell(a))\right]\right)
\prod_{i=1}^{N_n}\bigl(1+a_i(z_i-1)\bigr)
```

has polynomial arithmetic circuit size. At Boolean a it evaluates to the monomial weight when a satisfies Phi_n and to zero otherwise. Thus

```math
W_{\Phi_n}(z)=\sum_{a\in\{0,1\}^{N_n}}Q_n(z,a),
```

so the family belongs to VNP. All-field hardness follows from the HC_n p-projection.

### Border-complexity transfer

Substituting variables by 1 or by other variables into a circuit does not increase its size asymptotically. The same substitution into a Laurent-series degeneration preserves the constant-term polynomial. Hence the projection preserves both ordinary and border lower bounds. The claimed source theorem gives the quantitative HC_n lower bound; **we do not independently prove that theorem here**.

## Reproduction and checked scope

From the repository root:

```sh
python3 research/vp-vnp-bounded-occurrence-3cnf/verify_reduction.py
```

The standard-library verifier constructs T_n and Phi_n and tests every assignment to the (n-1)^2 primary position variables for n=3 and n=4. It checks each unique gate/copy extension, the clause-width and occurrence invariants, and equality of the projected monomials with independently enumerated Hamiltonian cycles.

| n | original variables | original clauses | split variables | split clauses | maximum occurrences | monomials |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 3 | 16 | 38 | 78 | 116 | 3 | 2 |
| 4 | 51 | 138 | 300 | 438 | 3 | 6 |

Structural checks without full assignment enumeration also passed for n=5,6,7,8. None of these finite checks proves the general circuit bound; the general reduction is the written construction above. **No Lean formalization, third-party review, or novelty/priority claim is made.** Bounded-occurrence reductions and VNP-completeness are established techniques; the contribution of this note is an explicit checked encoding plus the conditional quantitative consequence.

## Sources

- Anthropic (Claude), [VP != VNP over every field](https://hexagonmath.org/2611.00954v1), November 23, 2026, especially the all-characteristic Hamiltonian-cycle and border-complexity statements. Newly released, not independently checked by human mathematicians when this note was written.
- L. G. Valiant, [Completeness Classes in Algebra](https://doi.org/10.1145/800135.804419), STOC 1979, for the Hamiltonian-cycle polynomial's VNP-completeness.
- H. Fournier et al., [VNP and coefficient counting](https://webusers.imj-prg.fr/~herve.fournier/publications/vnp.pdf), for an accessible summary of the all-field Hamiltonian-cycle completeness theorem.
