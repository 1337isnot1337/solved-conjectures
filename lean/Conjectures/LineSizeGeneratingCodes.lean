import Conjectures.LineSizeGeneratingGaps

/-! A finite family of base weights times unrestricted gap vectors has the
coefficient count given by its geometric-series generating function. -/
noncomputable section
namespace LineSize.Generating

open Finset PowerSeries

variable {α : Type*} [Fintype α]

def codeWeight (r : ℕ) (base : α → ℕ) (c : α × (Fin r → ℕ)) : ℕ :=
  base c.1+gapWeight r c.2

def exactCodes (r : ℕ) (base : α → ℕ) (n : ℕ) : Finset (α × (Fin r → ℕ)) :=
  (univ ×ˢ gapBox r n).filter (fun c => codeWeight r base c=n)

@[simp] theorem mem_exactCodes (r : ℕ) (base : α → ℕ) (n : ℕ)
    (c : α × (Fin r → ℕ)) : c ∈ exactCodes r base n ↔ codeWeight r base c=n := by
  rw [exactCodes,mem_filter]
  constructor
  · exact And.right
  · intro h
    refine ⟨?_,h⟩
    simp only [mem_product,mem_univ,true_and,mem_gapBox]
    intro j
    have hbound := coordinate_le_gapWeight r c.2 j
    unfold codeWeight at h
    omega

def codeSeries (r : ℕ) (base : α → ℕ) : PowerSeries ℚ :=
  ∑ a : α, (PowerSeries.X : PowerSeries ℚ)^(base a)*gapSeries r

theorem coeff_shifted_gapSeries (r n a : ℕ) :
    coeff n ((PowerSeries.X : PowerSeries ℚ)^a*gapSeries r)=
      ∑ z ∈ gapBox r n, if n=a+gapWeight r z then (1 : ℚ) else 0 := by
  have hagree := agreeTo_mul n ((PowerSeries.X : PowerSeries ℚ)^a)
    (∏ j : Fin r, geometricPartial (j.val+1) n)
    ((PowerSeries.X : PowerSeries ℚ)^a) (gapSeries r)
    (agreeTo_refl n _) (partial_product_agree r n)
  rw [← hagree n le_rfl,partial_product,mul_sum,map_sum]
  apply sum_congr rfl
  intro z _hz
  rw [← pow_add,PowerSeries.coeff_X_pow]

/-- Every coefficient counts exactly the codes with that total weight.
Coordinate truncation at `n` imposes no extra condition at weight `n`. -/
theorem coeff_codeSeries (r n : ℕ) (base : α → ℕ) :
    coeff n (codeSeries r base)=((exactCodes r base n).card : ℚ) := by
  rw [codeSeries,map_sum]
  simp only [coeff_shifted_gapSeries]
  rw [exactCodes,natCast_card_filter,sum_product]
  apply sum_congr rfl
  intro a _ha
  apply sum_congr rfl
  intro z _hz
  simp only [codeWeight,eq_comm]

end LineSize.Generating
