# Bardakov–Kozlovskaya’s even-order multivalued-group conjecture

[Catalogue](../../CONTENTS.md) · [Proof](PROOF.md) · [Adversarial audit](AUDIT.md) · [LaTeX manuscript](paper/main.tex) · [Zenodo preprint (DOI 10.5281/zenodo.24601452)](https://doi.org/10.5281/zenodo.24601452) · [Issue #174](https://github.com/1337isnot1337/solved-conjectures/issues/174)

**Status:** Complete computer-assisted proof of Bardakov–Kozlovskaya Conjecture 3.3(2) (even-order nonvanishing), proved via a stronger universal sign law and slice real-rootedness theorem. Together with the prime-power divisibility theorem of Buchstaber and Kornev ([arXiv:2505.04296](https://arxiv.org/abs/2505.04296)) for Conjecture 3.3(1), this completely resolves Conjecture 3.3 of Bardakov and Kozlovskaya ([arXiv:2305.07261](https://arxiv.org/abs/2305.07261)). Unrefereed preprint ([Zenodo record 24601452](https://zenodo.org/records/24601452)).

**Contributor:** **Atharvsinh Jadav** ([@Atharvsinh-codez](https://github.com/Atharvsinh-codez) · [athrix.me](https://athrix.me/) · [X `@athrix_codes`](https://x.com/athrix_codes)), prepared with a multi-agent research swarm powered by **Gemini 4 Neon Extra High**. Full standalone research and verification repository: [`Atharvsinh-codez/conjectures`](https://github.com/Atharvsinh-codez/conjectures).

**Lean status:** Not formalized (`⬜`). All infinite-parameter analytic bounds in Regime 2 are certified in 50-digit outward-rounded interval arithmetic (`mpmath.iv`, pure `mpf` endpoints, zero loops over unbounded parameters), and all finite degrees $`n = 2, 4, \dots, 130`$ are certified in exact arbitrary-precision integer arithmetic.

## Result

For each positive integer $`n`$, let $`\zeta = e^{2\pi i/n}`$, $`\alpha^n = x`$, $`\beta^n = y`$, and let
```math
p_n(x, y, z) := \prod_{k=0}^{n-1}\Bigl(z - (-1)^n(\alpha + \zeta^k \beta)^n\Bigr) = \sum_{\substack{a,b,c \ge 0 \\ a + 2b + 3c = n}} c_{a,b,c}^{(n)}\, e_1^a e_2^b e_3^c
```
be the defining homogeneous degree-$`n`$ symmetric integer polynomial of the $`n`$-valued Buchstaber–Novikov group $`\mathbb{G}_n`$ on $`\mathbb{C}`$, written in the elementary symmetric basis $`e_1 = x+y+z`$, $`e_2 = xy+yz+zx`$, $`e_3 = xyz`$. For each $`0 \le c \le \lfloor 2m/3 \rfloor`$, set $`D_c := \lfloor (2m - 3c)/2 \rfloor`$ and define the univariate $`c`$-slice polynomial
```math
Q_c^{(2m)}(1, u) := \sum_{b=0}^{D_c} c_{2m-3c-2b,\, b,\, c}^{(2m)}\, u^b.
```

**Theorem 1.1 (Universal Sign Law and Slice Real-Rootedness).** For every even integer $`n = 2m \ge 2`$:

1. **Exact universal sign law:** Every admissible coefficient $`c_{a,b,c}^{(2m)}`$ ($`a + 2b + 3c = 2m`$) is nonzero and satisfies
```math
\mathop{\mathrm{sgn}}\!\bigl(c_{a,b,c}^{(2m)}\bigr) = (-1)^{b(c+1)+c} = (-1)^{b(a+1)+c} = (-1)^{k_1 k_2 + k_1 k_3 + k_2 k_3} = \begin{cases} (-1)^b & \text{if } c \text{ is even,} \\ -1 & \text{if } c \text{ is odd.} \end{cases}
```
2. **Slice real-rootedness:**
   - *Interior slices ($`n \ge 132`$, $`2 \le c \le \lfloor (2m-3)/3 \rfloor`$):* $`Q_c^{(2m)}(1, u)`$ has $`D_c`$ simple real roots — all strictly positive (with at least $`D_c - 1`$ in $`(0, 1/4)`$) when $`c`$ is even, and all strictly negative when $`c`$ is odd — strictly separated by the universal trigonometric sample points $`u_j = t_j/(1+t_j)^2`$, $`t_j = (-1)^c (\sin(j\pi/n)/\sin((j+c)\pi/n))^n`$.
   - *All four boundary families (all even $`n = 2m \ge 2`$):* $`Q_0^{(2m)}(1, u) = (1 - 4u)^m`$; the $`a = 0`$ and $`b = 0`$ slices are simple positive real-rooted in $`e_3^2/e_2^3`$ and $`e_3/e_1^3`$ via the Half-Size Lucas–Chebyshev resultant; and along $`c = 1`$, $`c_{2m-3-2b, b, 1}^{(2m)} = 2m\bigl((-4)^{b+1}\binom{m-1}{b+1} - \gamma_{b+1}\bigr) < 0`$ via Rolle real-rootedness of the palindromic polynomial $`A_{2m-1}^{(2m)}(u)`$ and Maclaurin's inequality.

**Corollary 1.2 (Resolution of Bardakov–Kozlovskaya Conjecture 3.3).** Every admissible coefficient $`c_{a,b,c}^{(2m)}`$ is nonzero for all even $`n = 2m \ge 2`$. Together with Buchstaber–Kornev ([arXiv:2505.04296](https://arxiv.org/abs/2505.04296)) for prime-power divisibility (Part (1)), this completely resolves Conjecture 3.3 of [arXiv:2305.07261](https://arxiv.org/abs/2305.07261).

## Proof Architecture and Margins

| Component | Exact Parameter Domain | Method / Arithmetic | Worst Certified Margin | Master Script |
| :--- | :--- | :--- | :--- | :--- |
| 1. Finite Base | Even $`n = 2, 4, \dots, 130`$ (33,417 coeffs) | Exact integer Newton + Kronecker | 0 zeros, 0 violations | [`verify/engine.py`](verify/engine.py), [`verify/fast_certify_140.py`](verify/fast_certify_140.py) |
| 2. Resultants and 4 Boundaries | All even $`n \ge 2`$; $`c=0, a=0, b=0, c=1`$ | Depressed-Cubic & Lucas–Chebyshev resultants, Rolle, Maclaurin | Exact closed form | [`PROOF.md`](PROOF.md) |
| 3. Regime 1 | $`n \ge 84`$, interior, $`\kappa \ge 2.5`$ | Closed-form 6-subcase elementary bounds (0 search) | `+0.469913` ($`\kappa \ge 3`$) / `+0.074799` ($`\kappa \ge 2.5`$) | [`algebra/verify_regime1_complete.py`](algebra/verify_regime1_complete.py) |
| 4–6. Zero-Crevice Partition, R2.1, 2A | Regime 2 ($`\kappa < 2.5, n \ge 132`$), $`c\kappa^2 \ge 42`$ | Mirror-root pairing, 50-dps `mpmath.iv` | `>= +0.220613`, 0 crevices | [`analyst/certify_R2_1_and_2A_iv.py`](analyst/certify_R2_1_and_2A_iv.py) |
| 7. Sub-regime 2C-Upgrade | Regime 2, $`c q \kappa \le 0.90`$ | Pólya–Szegő + KL harmonics, 50-dps `mpmath.iv` | `+0.441480` ($`q=1`$) / `+0.266331` ($`q\ge 2`$) | [`analyst/certify_R2_3_iv.py`](analyst/certify_R2_3_iv.py) |
| 8. Piece G2 ($`D=0`$ Major) | $`c\kappa^2 < 42, cq\kappa \ge 0.85, d \ge 2`$ | Cauchy–Riemann + Euler–Maclaurin + Pigeonhole-Annulus (`iv`) | `+0.216651` ($`q=1`$) / `+0.00176348` ($`q\ge 2`$) | [`algebra/certify_G2_D0.py`](algebra/certify_G2_D0.py) |
| 9. Piece G1 (Minor Arcs) | $`c\kappa^2 < 42, q \ge 2`$, outside G2/G3 | HS duality + CF Fibonacci ladder + $`D_r^2`$-cancellation (`iv`) | `>= +0.03355852` ($`\max\lvert\Phi^{\mathrm{ex}}\rvert \le 1.536448`$) | [`algebra/certify_G1_minor.py`](algebra/certify_G1_minor.py) |
| 10. Piece G3 ($`D\ne 0`$ Major) | Box G3, cases A1/A2/B/C/D (37 slices) | $`(1-w)`$-free IBP + 4-pole shifted-line Poisson (`iv`) | `>= +0.0545` across all 5 cases | [`analyst/certify_G3_ABC_full_iv.py`](analyst/certify_G3_ABC_full_iv.py), [`analyst/certify_G3_D_full_iv.py`](analyst/certify_G3_D_full_iv.py) |

## Scope Notes

- Real-rootedness is proved for all interior slices $`2 \le c \le \lfloor (2m-3)/3 \rfloor`$ at all even $`n \ge 132`$ and for the $`c = 0`$, $`a = 0`$, and $`b = 0`$ slices at all even $`n \ge 2`$. Along $`c = 1`$, strict negativity $`c_{a,b,1}^{(2m)} < 0`$ is proved for all even $`n \ge 4`$ directly via Maclaurin's inequality without claiming real-rootedness of $`Q_1^{(2m)}(1, u)`$ itself.
- Four adversarial audit rounds caught and resolved 17 genuine soundness bugs and 1 partition seam prior to sign-off; the complete ledger and locked SHA-256 checksums are recorded in [`AUDIT.md`](AUDIT.md).

## Primary Sources

- V. G. Bardakov and T. A. Kozlovskaya, *Multivalued groups and Newton polyhedron*, *Sib. Elektron. Mat. Izv.* **20**:2 (2023), 1590–1596, [arXiv:2305.07261](https://arxiv.org/abs/2305.07261), DOI [10.33048/semi.2023.20.097](https://doi.org/10.33048/semi.2023.20.097), Conjecture 3.3(2).
- V. M. Buchstaber and M. Kornev, *n-Valued Groups, Kronecker Sums, and Wendt's Matrices*, [arXiv:2505.04296](https://arxiv.org/abs/2505.04296) (2025), settling Part (1) (prime-power divisibility).

## Verification

Requires Python 3.10+ with `mpmath`, `sympy`, `numpy`, and `scipy` (`pip install mpmath sympy numpy scipy`). From the repository root:

```sh
# Fast smoke suite (< 30 seconds total)
python3 results/bardakov-kozlovskaya-even-coefficients/verify/engine.py
python3 results/bardakov-kozlovskaya-even-coefficients/algebra/verify_regime1_complete.py
python3 results/bardakov-kozlovskaya-even-coefficients/analyst/certify_R2_1_and_2A_iv.py
python3 results/bardakov-kozlovskaya-even-coefficients/analyst/certify_R2_3_iv.py
python3 results/bardakov-kozlovskaya-even-coefficients/analyst/verify_G3_empirical_corners.py

# Full exact-integer base (n = 2..60 via engine.py, n = 62..84 via stress_to_84.py, n = 86..130 via fast_certify_140.py)
# and 50-digit interval-arithmetic certification
python3 results/bardakov-kozlovskaya-even-coefficients/verify/engine.py
python3 results/bardakov-kozlovskaya-even-coefficients/verify/stress_to_84.py
python3 results/bardakov-kozlovskaya-even-coefficients/verify/fast_certify_140.py
python3 results/bardakov-kozlovskaya-even-coefficients/algebra/certify_G2_D0.py
python3 results/bardakov-kozlovskaya-even-coefficients/algebra/certify_G1_minor.py
python3 results/bardakov-kozlovskaya-even-coefficients/analyst/certify_G3_ABC_full_iv.py
python3 results/bardakov-kozlovskaya-even-coefficients/analyst/certify_G3_D_full_iv.py --part all --workers 3
```
