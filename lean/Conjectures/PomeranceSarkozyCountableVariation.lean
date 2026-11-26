module
public import Mathlib

@[expose] public section
namespace PomeranceSarkozy

open scoped ENNReal BigOperators

variable {A B : Type*}

noncomputable def atomicMass (p : A→ℝ) : ℝ≥0∞ := ∑' a,ENNReal.ofReal (p a)

noncomputable def atomicL1 (p q : A→ℝ) : ℝ≥0∞ := ∑' a,ENNReal.ofReal |p a-q a|

theorem pair_atomicMass (p : A→ℝ) (q : B→ℝ)
    (hp : ∀ a,0≤p a) :
    atomicMass (fun z : A×B => p z.1*q z.2)=atomicMass p*atomicMass q := by
  unfold atomicMass
  rw [ENNReal.tsum_prod']
  simp_rw [ENNReal.ofReal_mul (hp _),ENNReal.tsum_mul_left,ENNReal.tsum_mul_right]

/-- Finite or countable atomic product bound, expressed in extended
nonnegative reals so no artificial finite truncation is needed. -/
theorem pair_atomicL1_le (p p' : A→ℝ) (q q' : B→ℝ)
    (hp' : ∀ a,0≤p' a) (hq : ∀ b,0≤q b)
    (hp'₁ : atomicMass p'=1) (hq₁ : atomicMass q=1) :
    atomicL1 (fun z : A×B => p z.1*q z.2) (fun z => p' z.1*q' z.2)
      ≤ atomicL1 p p'+atomicL1 q q' := by
  have he (z : A×B) :
      ENNReal.ofReal |p z.1*q z.2-p' z.1*q' z.2| ≤
        ENNReal.ofReal |p z.1-p' z.1| * ENNReal.ofReal (q z.2) +
          ENNReal.ofReal (p' z.1) * ENNReal.ofReal |q z.2-q' z.2| := by
    have h : p z.1*q z.2-p' z.1*q' z.2 =
        (p z.1-p' z.1)*q z.2+p' z.1*(q z.2-q' z.2) := by ring
    rw [h,← ENNReal.ofReal_mul (abs_nonneg _),← ENNReal.ofReal_mul (hp' _),
      ← ENNReal.ofReal_add (mul_nonneg (abs_nonneg _) (hq _))
        (mul_nonneg (hp' _) (abs_nonneg _))]
    apply ENNReal.ofReal_le_ofReal
    simpa only [abs_mul,abs_of_nonneg (hp' _),abs_of_nonneg (hq _)] using
      abs_add_le ((p z.1-p' z.1)*q z.2) (p' z.1*(q z.2-q' z.2))
  calc
    _ ≤ ∑' z : A×B,(
        ENNReal.ofReal |p z.1-p' z.1| * ENNReal.ofReal (q z.2) +
          ENNReal.ofReal (p' z.1) * ENNReal.ofReal |q z.2-q' z.2|) :=
      ENNReal.tsum_le_tsum he
    _ = _ := by
      rw [ENNReal.tsum_add,ENNReal.tsum_prod',ENNReal.tsum_prod']
      simp_rw [ENNReal.tsum_mul_left]
      rw [ENNReal.tsum_mul_right,ENNReal.tsum_mul_right]
      change atomicL1 p p'*atomicMass q+atomicMass p'*atomicL1 q q'=_
      rw [hq₁,hp'₁,mul_one,one_mul]

end PomeranceSarkozy
