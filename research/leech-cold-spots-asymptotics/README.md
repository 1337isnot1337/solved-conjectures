# Gaussian cold spots of the Leech lattice

A Gaussian cold spot minimizes the sum of the Gaussian contributions from all lattice points. On the Leech lattice, the cold spots at large Gaussian parameter approach the deep holes of type $`E_8^3`$. Near each such hole the minimizer moves by a nonzero distance of order $`1/\alpha`$. With minimum squared lattice norm 4, the limiting coefficient of the minimum is 24.3223954 to seven decimal places. The $`D_{24}`$ type ranks second among the 23 deep-hole types.

Bachoc, Moustrou, Vallentin and Zimmermann compared Gaussian sums evaluated exactly at fixed holes and inferred the limiting type $`A_{24}`$ in the paragraph following Table 3. Optimizing the point within each hole's neighborhood gives the corrected type. Their Theorem 1.4, which excludes stable Gaussian cold spots, still holds. [Published paper, §5](https://doi.org/10.1017/fms.2026.10169)

The written proof is due to Cinna Davis. The mathematical review was performed independently within the project using Codex. The result has no Lean formalization or external referee report. [Proof](PROOF.md) · [Review and prior-work search](REVIEW.md) · [Tracking issue #376](https://github.com/1337isnot1337/solved-conjectures/issues/376)

Run `python3 verify.py` from this directory to reproduce the exact interval comparison for all 23 types. [Verification script](verify.py)
