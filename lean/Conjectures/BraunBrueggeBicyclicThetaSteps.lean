import Conjectures.BraunBrueggeBicyclicThetaGeometry
import Conjectures.BraunBrueggeMinimumFacets

/-! The normalized polar vertices of a theta are precisely three integer
step words with common total, with at most one slack step on each path and
some path fully tight. -/

open Finset Set

namespace BraunBruegge

variable {length : Fin 3 → ℕ}

@[ext]
structure ThetaSteps (length : Fin 3 → ℕ) where
  step : (p : Fin 3) → Fin (length p) → ℤ
  bound : ∀ p i, |step p i| ≤ 1
  common_total : ∀ p, ∑ i, step p i = ∑ i, step 0 i
  one_slack : ∀ p i j, step p i = 0 → step p j = 0 → i = j
  full_path : ∃ p, ∀ i, step p i ≠ 0

private theorem abs_int_cast_eq_one_iff {z : ℤ} (h : |z| ≤ 1) : |(z : ℝ)| = 1 ↔ z ≠ 0 := by
  have hz := abs_le.mp h
  rcases (show z = -1 ∨ z = 0 ∨ z = 1 by omega) with rfl | rfl | rfl <;> norm_num

private def thetaPrefix (d : ThetaSteps length) (p : Fin 3) (k : ℕ) : ℤ :=
  ∑ i ∈ Finset.range k, if h : i < length p then d.step p ⟨i, h⟩ else 0

@[simp] private theorem thetaPrefix_zero (d : ThetaSteps length) (p : Fin 3) : thetaPrefix d p 0 = 0 := by
  simp [thetaPrefix]

private theorem thetaPrefix_full (d : ThetaSteps length) (p : Fin 3) :
    thetaPrefix d p (length p) = ∑ i, d.step 0 i := by
  rw [thetaPrefix, ← Finset.sum_fin_eq_sum_range (d.step p), d.common_total]

private theorem thetaPrefix_step (d : ThetaSteps length) (p : Fin 3) (i : Fin (length p)) :
    thetaPrefix d p i.succ.val - thetaPrefix d p i.castSucc.val = d.step p i := by
  simp [thetaPrefix, Finset.sum_range_succ, i.isLt]

private noncomputable def ThetaSteps.potential (d : ThetaSteps length) (v : ThetaVertex length) : ℝ :=
  (thetaLabels (0 : ℤ) (∑ i, d.step 0 i) (fun p i => thetaPrefix d p i.val) v : ℤ)

private theorem ThetaSteps.potential_diff (d : ThetaSteps length) (p : Fin 3) (i : Fin (length p)) :
    d.potential (thetaPosition p i.succ) - d.potential (thetaPosition p i.castSucc) = d.step p i := by
  have h₀ (q : Fin 3) : thetaPrefix d q (0 : Fin (length q + 1)).val = 0 := thetaPrefix_zero d q
  have h₁ (q : Fin 3) : thetaPrefix d q (thetaLast (length := length) q).val = ∑ j, d.step 0 j := thetaPrefix_full d q
  unfold potential
  rw [thetaLabels_position h₀ h₁, thetaLabels_position h₀ h₁]
  exact_mod_cast thetaPrefix_step d p i

private theorem ThetaSteps.potential_vertex (d : ThetaSteps length) (positive : ∀ p, 0 < length p) :
    d.potential ∈ (polar (thetaGraph length) thetaStart).extremePoints ℝ := by
  apply mem_extreme_polar_iff.mpr
  refine ⟨⟨by simp [potential, thetaLabels, thetaStart], ?_⟩, ?_⟩
  · intro u v he
    obtain ⟨p, i, e | e⟩ := he.2
    · obtain ⟨rfl, rfl⟩ := e
      rw [abs_sub_comm, d.potential_diff]
      exact_mod_cast d.bound p i
    · obtain ⟨rfl, rfl⟩ := e
      rw [d.potential_diff]
      exact_mod_cast d.bound p i
  · let T := tightGraph (thetaGraph length) d.potential
    have hT : T ≤ thetaGraph length := fun _ _ e => e.1
    have hstep (p : Fin 3) (i : Fin (length p)) : ThetaStepPresent T p i ↔ d.step p i ≠ 0 := by
      change ((thetaGraph length).Adj _ _ ∧ |d.potential _ - d.potential _| = 1) ↔ _
      rw [abs_sub_comm, d.potential_diff, abs_int_cast_eq_one_iff (d.bound p i)]
      exact and_iff_right (theta_step_adj p i)
    apply (theta_spanning_connected_iff hT positive).mpr
    refine ⟨?_, ?_⟩
    · intro p i j hi hj
      exact d.one_slack p i j (by simpa [hstep] using hi) (by simpa [hstep] using hj)
    · obtain ⟨p, hp⟩ := d.full_path
      exact ⟨p, fun i => (hstep p i).mpr (hp i)⟩

private abbrev ThetaPolarVertices (length : Fin 3 → ℕ) :=
  (polar (thetaGraph length) thetaStart).extremePoints ℝ

private noncomputable def thetaIntLabel (f : ThetaPolarVertices length) (v : ThetaVertex length) : ℤ :=
  (int_label_of_mem_extreme_polar f.property v).choose

private theorem thetaIntLabel_spec (f : ThetaPolarVertices length) (v : ThetaVertex length) :
    (thetaIntLabel f v : ℝ) = f.val v := (int_label_of_mem_extreme_polar f.property v).choose_spec.symm

private noncomputable def thetaDifference (f : ThetaPolarVertices length) (p : Fin 3) (i : Fin (length p)) : ℤ :=
  thetaIntLabel f (thetaPosition p i.succ) - thetaIntLabel f (thetaPosition p i.castSucc)

private theorem thetaDifference_cast (f : ThetaPolarVertices length) (p : Fin 3) (i : Fin (length p)) :
    (thetaDifference f p i : ℝ) = f.val (thetaPosition p i.succ) - f.val (thetaPosition p i.castSucc) := by
  simp [thetaDifference, thetaIntLabel_spec]

private theorem thetaDifference_bound (f : ThetaPolarVertices length) (p : Fin 3) (i : Fin (length p)) :
    |thetaDifference f p i| ≤ 1 := by
  have he := f.property.1.2 (theta_step_adj p i).symm
  rw [← thetaDifference_cast f p i] at he
  exact_mod_cast he

private theorem thetaDifference_total (f : ThetaPolarVertices length) (positive : ∀ p, 0 < length p) (p : Fin 3) :
    ∑ i, thetaDifference f p i = thetaIntLabel f thetaFinish - thetaIntLabel f thetaStart := by
  let g (k : Fin (length p + 1)) := thetaIntLabel f (thetaPosition p k)
  have h₀ : g 0 = thetaIntLabel f thetaStart := by simp [g]
  have h₁ : g (Fin.last (length p)) = thetaIntLabel f thetaFinish := thetaPosition_last positive p ▸ rfl
  have hs := Fin.sum_univ_succ g
  have ht := Fin.sum_univ_castSucc g
  rw [h₀] at hs
  rw [h₁] at ht
  change (∑ i : Fin (length p), (g i.succ - g i.castSucc)) = _
  rw [Finset.sum_sub_distrib]
  omega

private theorem thetaDifference_present_iff (f : ThetaPolarVertices length) (p : Fin 3) (i : Fin (length p)) :
    ThetaStepPresent (tightGraph (thetaGraph length) f.val) p i ↔ thetaDifference f p i ≠ 0 := by
  change ((thetaGraph length).Adj _ _ ∧ |f.val _ - f.val _| = 1) ↔ _
  rw [abs_sub_comm, ← thetaDifference_cast f p i, abs_int_cast_eq_one_iff (thetaDifference_bound f p i)]
  exact and_iff_right (theta_step_adj p i)

private noncomputable def thetaVertexSteps (f : ThetaPolarVertices length) (positive : ∀ p, 0 < length p) :
    ThetaSteps length := by
  let T := tightGraph (thetaGraph length) f.val
  have hT : T ≤ thetaGraph length := fun _ _ e => e.1
  have h := (theta_spanning_connected_iff hT positive).mp (mem_extreme_polar_iff.mp f.property).2
  refine ⟨thetaDifference f, thetaDifference_bound f, ?_, ?_, ?_⟩
  · intro p
    rw [thetaDifference_total f positive p, thetaDifference_total f positive 0]
  · intro p i j hi hj
    exact h.1 p i j (fun e => (thetaDifference_present_iff f p i).mp e hi)
      (fun e => (thetaDifference_present_iff f p j).mp e hj)
  · obtain ⟨p, hp⟩ := h.2
    exact ⟨p, fun i => (thetaDifference_present_iff f p i).mp (hp i)⟩

noncomputable def thetaPolarVerticesEquivSteps (positive : ∀ p, 0 < length p) :
    ThetaPolarVertices length ≃ ThetaSteps length := by
  apply Equiv.ofBijective (fun f => thetaVertexSteps f positive)
  refine ⟨?_, ?_⟩
  · intro f g he
    have hd (p : Fin 3) (i : Fin (length p)) : thetaDifference f p i = thetaDifference g p i :=
      congrArg (fun d : ThetaSteps length => d.step p i) he
    have hadj {u v : ThetaVertex length} (h : (thetaGraph length).Adj u v) :
        f.val u - g.val u = f.val v - g.val v := by
      obtain ⟨p, i, er⟩ := h.2
      have hu : (thetaDifference f p i : ℝ) = thetaDifference g p i := by rw [hd]
      rw [thetaDifference_cast, thetaDifference_cast] at hu
      rcases er with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ <;> linarith
    apply Subtype.ext
    funext v
    have h := eq_of_reachable (fun w => f.val w - g.val w) (fun _ _ e => hadj e)
      (thetaGraph_connected positive thetaStart v)
    rw [f.property.1.1, g.property.1.1, sub_self] at h
    linarith
  · intro d
    let f : ThetaPolarVertices length := ⟨d.potential, d.potential_vertex positive⟩
    refine ⟨f, ThetaSteps.ext ?_⟩
    funext p i
    change thetaDifference f p i = d.step p i
    apply Int.cast_inj (α := ℝ).mp
    rw [thetaDifference_cast]
    exact d.potential_diff p i

theorem theta_facet_card_eq_steps (positive : ∀ p, 0 < length p) :
    Nat.card {F // IsFacet (thetaGraph length) F} = Nat.card (ThetaSteps length) := by
  let : Nontrivial (ThetaVertex length) := ⟨⟨thetaStart, thetaFinish, by simp [thetaStart, thetaFinish]⟩⟩
  rw [← Nat.card_congr (polarVerticesEquivFacets (thetaGraph_connected positive) thetaStart)]
  exact Nat.card_congr (thetaPolarVerticesEquivSteps positive)

end BraunBruegge
