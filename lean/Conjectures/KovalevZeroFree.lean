import Conjectures.KovalevZeroFreeAssembly
import Conjectures.KovalevZeroFreeSectionIntegral
import Conjectures.KovalevZeroFreeTaylor

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

The full original Conjecture 1.2 of Leonid V. Kovalev, *Sharp bounds for some
segments of bounded power series*, arXiv:2507.04544v1, Section 1. Every Taylor
section of the normalized square root of a geometric polynomial is zero-free
on the closed unit disk. The proof below handles every positive length and
every section degree, and includes the original conjecture as a specialization.

The argument formalized is Sections 1–3 of the existing repository proof
`results/kovalev-zero-free/PROOF.md`, commit
`6432592c03b24aed190ed7b3204ed942a40a8da4`, recorded by Cinna Davis. Kovalev's
original Proposition 3.2 supplied the earlier length-three case and the
multiplication-by-square-root idea. The entry's uncertainty about priority of
an all-length resolution is preserved. The written general-exponent and
sharp-segment supplements are separate and are not asserted here.
-/

namespace Conjectures.KovalevZeroFree

open Finset

noncomputable section

/-- The explicit coefficient polynomial has no zero anywhere in the closed unit
 disk, for every positive length and every section degree. -/
theorem sectionPolynomial_ne_zero {D : ℕ} (hD : 0 < D) (n : ℕ)
    {z : ℂ} (hz : ‖z‖ ≤ 1) : sectionPolynomial D n z ≠ 0 := by
  by_cases hz1 : z = 1
  · subst z
    exact section_one_ne_zero D n
  apply sectionPolynomial_ne_zero_of_remainder_identity hD n hz
  intro M
  exact invSection_remainder_identity M hz hz1

/-- The actual complex Taylor sections of the normalized principal square root,
for every positive geometric-polynomial length and every degree. -/
theorem taylorSection_ne_zero {D : ℕ} (hD : 0 < D) (n : ℕ)
    {z : ℂ} (hz : ‖z‖ ≤ 1) :
    (∑ k ∈ range (n + 1),
      (iteratedDeriv k (fun w : ℂ => Complex.sqrt (∑ i ∈ range D, w ^ i)) 0 /
        (k.factorial : ℂ)) * z ^ k) ≠ 0 := by
  rw [← sectionPolynomial_eq_taylor hD]
  exact sectionPolynomial_ne_zero hD n hz

/-- Kovalev's original Conjecture 1.2 (`d > 2`), without any bound on the
Taylor-section degree and with the entire closed unit disk included. -/
theorem kovalev_conjecture {d : ℕ} (hd : 2 < d) (n : ℕ)
    {z : ℂ} (hz : ‖z‖ ≤ 1) :
    (∑ k ∈ range (n + 1),
      (iteratedDeriv k (fun w : ℂ => Complex.sqrt (∑ i ∈ range (d + 1), w ^ i)) 0 /
        (k.factorial : ℂ)) * z ^ k) ≠ 0 :=
  taylorSection_ne_zero (by omega : 0 < d + 1) n hz

end

end Conjectures.KovalevZeroFree
