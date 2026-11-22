module

public import Mathlib.MeasureTheory.Constructions.Pi

/-! A measurable joint sample/output law cannot give positive probability to a hit of
an observed point by the output when all permitted supports are nested null sets. -/

@[expose] public section

open MeasureTheory

namespace AgnosticVC

variable {X H Ω : Type*} [MeasurableSpace X] [MeasurableSpace H] [MeasurableSpace Ω]

/-- Two independent copies of a successful joint observation/output would have a
cross hit, since the two selected supports are nested. Independence and nullity rule out
both cross hits. The observation and its own output may have arbitrary dependence. -/
theorem measure_selfHit_eq_zero_of_null_chain
    (predict : H → X → Bool)
    (hpred : Measurable (fun p : X × H => predict p.2 p.1))
    (D : Measure X) (hnull : ∀ h, D {x | predict h x = true} = 0)
    (hchain : ∀ a b : H,
      {x | predict a x = true} ⊆ {x | predict b x = true} ∨
      {x | predict b x = true} ⊆ {x | predict a x = true})
    (μ : Measure Ω) [IsFiniteMeasure μ] {x : Ω → X} {h : Ω → H}
    (hx : Measurable x) (hh : Measurable h) (hmarginal : μ.map x = D) :
    μ {ω | predict (h ω) (x ω) = true} = 0 := by
  let success : Set Ω := {ω | predict (h ω) (x ω) = true}
  let cross : Set (Ω × Ω) := {p | predict (h p.2) (x p.1) = true}
  have hcross : MeasurableSet cross :=
    (hpred.comp ((hx.comp measurable_fst).prodMk (hh.comp measurable_snd)))
      (measurableSet_singleton true)
  have hcross_null : (μ.prod μ) cross = 0 := by
    rw [Measure.prod_apply_symm hcross]
    apply lintegral_eq_zero_of_ae_eq_zero
    filter_upwards with ω
    have hs : MeasurableSet {y | predict (h ω) y = true} :=
      (hpred.comp (measurable_id.prodMk measurable_const)) (measurableSet_singleton true)
    change μ (x ⁻¹' {y | predict (h ω) y = true}) = 0
    rw [← Measure.map_apply hx hs, hmarginal]
    exact hnull (h ω)
  have hswap_null : (μ.prod μ) (Prod.swap ⁻¹' cross) = 0 := by
    rw [← Measure.map_apply measurable_swap hcross, Measure.prod_swap]
    exact hcross_null
  have hsub : success ×ˢ success ⊆ cross ∪ Prod.swap ⁻¹' cross := by
    intro p hp
    rcases hp with ⟨hp₁, hp₂⟩
    rcases hchain (h p.1) (h p.2) with hle | hle
    · exact Or.inl (hle hp₁)
    · exact Or.inr (hle hp₂)
  have hzero : (μ.prod μ) (success ×ˢ success) = 0 :=
    measure_mono_null hsub (measure_union_null hcross_null hswap_null)
  rw [Measure.prod_prod, mul_eq_zero] at hzero
  exact hzero.elim id id

/-- A joint law with the iid sample marginal cannot put mass on any sample point lying
in the selected null support. In particular the conclusion requires no Markov-kernel
representation of the joint law. -/
theorem measure_exists_selfHit_eq_zero_of_null_chain
    {n : ℕ} (predict : H → X → Bool)
    (hpred : Measurable (fun p : X × H => predict p.2 p.1))
    (D : Measure X) [IsProbabilityMeasure D]
    (hnull : ∀ h, D {x | predict h x = true} = 0)
    (hchain : ∀ a b : H,
      {x | predict a x = true} ⊆ {x | predict b x = true} ∨
      {x | predict b x = true} ⊆ {x | predict a x = true})
    (ν : Measure ((Fin n → X) × H)) [IsFiniteMeasure ν]
    (hmarginal : ν.map Prod.fst = Measure.pi (fun _ : Fin n => D)) :
    ν {p | ∃ i : Fin n, predict p.2 (p.1 i) = true} = 0 := by
  have hsets : {p : (Fin n → X) × H | ∃ i : Fin n, predict p.2 (p.1 i) = true} =
      ⋃ i : Fin n, {p : (Fin n → X) × H | predict p.2 (p.1 i) = true} := by
    ext p
    simp
  rw [hsets]
  apply measure_iUnion_null
  intro i
  have heval : Measurable (fun s : Fin n → X => s i) := measurable_pi_apply i
  have hmap : ν.map (fun p : (Fin n → X) × H => p.1 i) = D := by
    change ν.map ((fun s : Fin n → X => s i) ∘ Prod.fst) = D
    rw [← Measure.map_map heval measurable_fst, hmarginal]
    exact (measurePreserving_eval (fun _ : Fin n => D) i).map_eq
  exact measure_selfHit_eq_zero_of_null_chain predict hpred D hnull hchain ν
    (heval.comp measurable_fst) measurable_snd hmap

end AgnosticVC
