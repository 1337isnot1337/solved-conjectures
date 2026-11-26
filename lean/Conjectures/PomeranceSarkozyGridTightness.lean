module
public import Conjectures.PomeranceSarkozyGridCompact
public import Conjectures.PomeranceSarkozyGridMarkov
public import Mathlib.MeasureTheory.Measure.Tight
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter Set MeasureTheory
open scoped Topology ENNReal BoundedContinuousFunction

noncomputable instance instMeasurableSpaceUnitIntervalPath : MeasurableSpace UnitIntervalPath :=
  borel _
instance instBorelSpaceUnitIntervalPath : BorelSpace UnitIntervalPath := ⟨rfl⟩

noncomputable def processGridIncrement (m : ℕ) (j : Fin (32^m)) (f : UnitIntervalPath) : ℝ :=
  f (unitBase32Vertex m j.succ)-f (unitBase32Vertex m j.castSucc)

/-- A tight value at zero and a common fourth-moment bound at each
grid edge suffice for tightness in the uniform topology on paths. -/
theorem base32_grid_tight {S : Set (Measure UnitIntervalPath)} (C : ℝ) (hC : 0≤C)
    (h0 : ∀ e : ℝ,0<e → ∃ A : ℝ, ∀ μ∈S,
      μ {f | A < |f processPathZero|} ≤ ENNReal.ofReal e)
    (hInt : ∀ μ∈S,∀ m j,Integrable (fun f=>processGridIncrement m j f ^4) μ)
    (hMoment : ∀ μ∈S,∀ m j,(∫ f,processGridIncrement m j f ^4 ∂μ)≤C/((32:ℝ)^m)^2) :
    IsTightMeasureSet S := by
  rw [isTightMeasureSet_iff_exists_isCompact_measure_compl_le]
  intro ε hε
  by_cases hTop : ε=⊤
  · subst ε
    exact ⟨∅,isCompact_empty,fun _ _=>le_top⟩
  let e := ε.toReal/2
  have he : 0<e := div_pos (ENNReal.toReal_pos hε.ne' hTop) (by norm_num)
  obtain ⟨A₀,hA₀⟩ := h0 e he
  let A := max A₀ (1+2*C/e)
  have hA₁ : 1≤A := by
    have h : 0≤2*C/e := by positivity
    exact (by linarith : (1:ℝ)≤1+2*C/e).trans (le_max_right ..)
  have hA : 0<A := zero_lt_one.trans_le hA₁
  have hB : 2*C/A^4≤e := by
    apply (div_le_iff₀ (pow_pos hA 4)).mpr
    have h₁ : 2*C/e≤A := (by linarith : 2*C/e≤1+2*C/e).trans (le_max_right ..)
    have h₂ : 2*C≤A*e := (div_le_iff₀ he).mp h₁
    have h₃ : A≤A^4 := by
      have h := one_le_pow₀ (n:=3) hA₁
      simpa only [one_mul,pow_succ] using mul_le_mul_of_nonneg_right h hA.le
    have h₂' : 2*C≤e*A := by simpa only [mul_comm] using h₂
    exact h₂'.trans (mul_le_mul_of_nonneg_left h₃ he.le)
  refine ⟨processGridGood A,processGridGood_isCompact A hA.le,?_⟩
  intro μ hμ
  let B₀ : Set UnitIntervalPath := {f | A < |f processPathZero|}
  let B₁ : Set UnitIntervalPath := {f | ∃ m j,A*(1/2:ℝ)^m < |processGridIncrement m j f|}
  have hEvent : (processGridGood A)ᶜ ⊆ B₀∪B₁ := by
    classical
    intro f hf
    change ¬ (|f processPathZero| ≤ A ∧ ∀ m (j : Fin (32^m)),
      |processGridIncrement m j f| ≤ A*(1/2:ℝ)^m) at hf
    rcases not_and_or.mp hf with h|h
    · exact Or.inl (lt_of_not_ge h)
    · push Not at h
      exact Or.inr h
  have h₀ : μ B₀≤ENNReal.ofReal e :=
    (measure_mono (fun f hf=> (le_max_left A₀ _).trans_lt hf)).trans (hA₀ μ hμ)
  have h₁ : μ B₁≤ENNReal.ofReal e :=
    (base32_grid_bad_all_le μ processGridIncrement hC hA (hInt μ hμ) (hMoment μ hμ)).trans
      (ENNReal.ofReal_le_ofReal hB)
  calc
    _ ≤ μ (B₀∪B₁) := measure_mono hEvent
    _ ≤ μ B₀+μ B₁ := measure_union_le _ _
    _ ≤ ENNReal.ofReal e+ENNReal.ofReal e := add_le_add h₀ h₁
    _ = ε := by
      rw [← ENNReal.ofReal_add he.le he.le,show e+e=ε.toReal by unfold e; ring, ENNReal.ofReal_toReal hTop]

end PomeranceSarkozy
