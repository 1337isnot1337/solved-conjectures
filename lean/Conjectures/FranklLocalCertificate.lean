module

public import Conjectures.FranklLocalWeights

/-! A finite integer check for a local abundance certificate. Its quantifiers
range over boundary subsets, while the soundness theorem applies to the
actual full family of distinct unions. -/
@[expose] public section

namespace FranklLocal

open scoped BigOperators

variable {α : Type*} [DecidableEq α]

def integerImbalance (W : Finset α) (w : α → ℕ) (U : Finset α) : ℤ :=
  ∑ x ∈ W, if x ∈ U then (w x:ℤ) else -(w x:ℤ)

theorem integerImbalance_cast (W : Finset α) (w : α → ℕ) (U : Finset α) :
    (integerImbalance W w U:ℝ)=imbalance W (fun x => (w x:ℝ)) U := by
  simp [integerImbalance,imbalance]

def certificateCheck (G : Finset (Finset α)) (W : Finset α) (w : α → ℕ) : Bool :=
  decide (∃ x ∈ W, 0 < w x) &&
    decide (∀ E ∈ (boundary G W).powerset, ∀ M ∈ E.powerset,
      0 ≤ ∑ S ∈ compatible G W E M, integerImbalance W w S)

theorem certificateCheck_weightCertificate {G : Finset (Finset α)}
    {W : Finset α} {w : α → ℕ} (hc : certificateCheck G W w=true) :
    WeightCertificate G W (fun x => (w x:ℝ)) := by
  have hchecked := of_decide_eq_true (Bool.and_eq_true.mp hc).2
  intro E M hME hEB
  have h := hchecked E (Finset.mem_powerset.mpr hEB) M (Finset.mem_powerset.mpr hME)
  have hcast : 0 ≤ ((∑ S ∈ compatible G W E M, integerImbalance W w S:ℤ):ℝ) := by
    exact_mod_cast h
  simpa only [Int.cast_sum,integerImbalance_cast] using hcast

theorem certificateCheck_abundance {G : Finset (Finset α)}
    {W : Finset α} {w : α → ℕ} (hc : certificateCheck G W w=true) :
    ∃ x ∈ W, Abundant (family G) x := by
  have hpositive := of_decide_eq_true (Bool.and_eq_true.mp hc).1
  apply abundant_of_total_imbalance (w:=fun x => (w x:ℝ))
  · intro x _
    exact Nat.cast_nonneg _
  · obtain ⟨x,hx,hpos⟩ := hpositive
    exact ⟨x,hx,by exact_mod_cast hpos⟩
  · exact weightCertificate_total (certificateCheck_weightCertificate hc)

end FranklLocal
