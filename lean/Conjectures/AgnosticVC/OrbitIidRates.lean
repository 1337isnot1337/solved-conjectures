module

public import Conjectures.AgnosticVC.OrbitWitnesses
public import Conjectures.AgnosticVC.LocalReconstructionMeasurable

/-! Both agnostic rates for the standard Borel circle-orbit class. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory Set

/-- A positive row identifies the orbit to enumerate. Constant candidates
from distinct orbits cover the empty trace. -/
theorem circleOrbit_measurable_localReconstruction :
    ∃ c : LocalReconstruction (orbitPredict irrationalCircleSubgroup) 1,
      ∀ {n : ℕ} (w : LocalWitness n), Measurable (w.output c.generate) := by
  classical
  let Γ := irrationalCircleSubgroup
  obtain ⟨b,hb⟩ := circle_exists_distinctCosets
  obtain ⟨e,he⟩ := exists_surjective_nat Γ
  let gen (j : ℕ) : List (UnitAddCircle × Bool) → UnitAddCircle
    | [] => b j
    | x :: _ => x.1 + (e j : UnitAddCircle)
  refine ⟨⟨gen,?_⟩,?_⟩
  · intro n x v
    obtain ⟨a,ha⟩ := mem_sampleFamily.mp v.property
    by_cases hp : ∃ i, orbitPredict Γ a (x i) = true
    · obtain ⟨i,hi⟩ := hp
      have hγ : a - (x i).1 ∈ Γ := by
        rcases hrow : x i with ⟨p,label⟩
        cases label
        · have h := (orbitPredict_false_iff Γ a p).mp (hrow ▸ hi)
          simpa [hrow, neg_sub] using Γ.neg_mem h
        · have h := (orbitPredict_true_iff Γ a p).mp (hrow ▸ hi)
          simp [h]
      obtain ⟨j,hj⟩ := he ⟨a - (x i).1,hγ⟩
      let w : LocalWitness n := toLex (j,toColex {i})
      have hw : w.output gen x = a := by
        have hj' := congrArg Subtype.val hj
        simp [w, LocalWitness.output, LocalWitness.rows, gen, hj', add_comm]
      refine ⟨w, by simp [w, LocalWitness.rows], Subtype.ext ?_⟩
      exact (congrArg (sampleTrace (orbitPredict Γ) x) hw).trans ha
    · let bad (i : Fin n) : Set ℕ := {j | (x i).1 - b j ∈ Γ}
      have hfinite (i : Fin n) : (bad i).Finite := Set.Subsingleton.finite (by
        intro p hp q hq
        apply hb
        change (x i).1 - b p ∈ Γ at hp
        change (x i).1 - b q ∈ Γ at hq
        simpa [sub_sub_sub_cancel_left] using Γ.sub_mem hq hp)
      obtain ⟨j,hj⟩ := (finite_iUnion hfinite).exists_notMem
      let w : LocalWitness n := toLex (j,toColex ∅)
      have hw : w.output gen x = b j := by simp [w, LocalWitness.output, LocalWitness.rows, gen]
      refine ⟨w, by simp [w, LocalWitness.rows], Subtype.ext ?_⟩
      change sampleTrace (orbitPredict Γ) x (w.output gen x) = v.val
      rw [hw, ← ha]
      ext i
      simp only [mem_sampleTrace]
      have hi : (x i).1 - b j ∉ Γ := fun hm => hj (mem_iUnion.mpr ⟨i,hm⟩)
      have hz : orbitPredict Γ (b j) (x i) ≠ true := by
        rcases hrow : x i with ⟨p,label⟩
        cases label
        · simpa [hrow] using hi
        · intro hpos
          have h : p = b j := by simpa [hrow] using hpos
          exact hi (by simp [hrow, h])
      exact iff_of_false hz (fun hpos => hp ⟨i,hpos⟩)
  · intro n w
    change Measurable (fun x : Fin n → UnitAddCircle × Bool => gen (ofLex w).1 (w.rows.sort.map x))
    cases w.rows.sort with
    | nil => simp [gen, measurable_const]
    | cons i l =>
      simp only [List.map_cons, gen]
      change Measurable ((fun x : Fin n → UnitAddCircle × Bool => (x i).1) +
        fun _ => (e (ofLex w).1 : UnitAddCircle))
      exact (measurable_pi_apply i).fst.add
        (measurable_const (a := (e (ofLex w).1 : UnitAddCircle)))

/-- The circle-orbit class satisfies both agnostic rates for every iid law.
The proof uses actual hypothesis parameters as outputs. -/
theorem circleOrbit_agnostic_iid_rates (m : ℕ) :
    let X := UnitAddCircle × Bool
    let predict := orbitPredict irrationalCircleSubgroup
    ∃ A : (Fin (m+1) → X × Bool) → PMF UnitAddCircle,
      Measurable (fun z => (A z).toMeasure) ∧
      (∀ (D : Measure (X × Bool)) [IsProbabilityMeasure D],
        let μ := Measure.pi fun _ : Fin (m+1) × Bool => D
        let info z := (InformationTheory.klDiv (originalPoolJoint A z).toMeasure
          (originalPoolMarginalProduct A z).toMeasure).toReal
        Integrable info μ ∧ (∫ z, info z ∂μ) ≤ 197152) ∧
      ∀ z, (∑' h : UnitAddCircle, (A z h).toReal * empiricalError predict z h) ≤
        (⨅ h : UnitAddCircle, empiricalError predict z h) + 583 * Real.sqrt (1 / (m+1)) := by
  obtain ⟨c,hc⟩ := circleOrbit_measurable_localReconstruction
  have hconst : (197120 : ℝ) + 32 = 197152 := by norm_num
  simpa [hconst] using c.iid_rates (d := 1) (m := m) (by decide) (Nat.succ_pos m)
    (orbitPredict_vc_le_one irrationalCircleSubgroup)
    (measurable_orbitPredict irrationalCircleSubgroup) hc

end AgnosticVC
