import Conjectures.LonelinessSixPlaneGap
import Conjectures.LonelinessSixPlaneDefs
import Mathlib.Data.Fin.Tuple.Sort

/-! Exact normalization of every critical six-coordinate integer direction
to a signed permutation of one of the ten repeated-speed patterns. -/

namespace Loneliness.SixPlane

noncomputable section

open CoordinateSubspace

theorem canonical_positive : ∀ (k : Fin 10) (i : Fin 6), 0 < canonical k i := by
  decide +kernel

theorem canonical_monotone : ∀ k : Fin 10,
    Monotone (fun i : Fin 6 => (canonical k i).natAbs) := by
  decide +kernel

theorem subset_five_completion {base ds : List ℕ}
    (hbase : base.Nodup) (hlen : base.length = 5)
    (hds : ds.length = 6) (hsub : base ⊆ ds) :
    ∃ a : ℕ, ds.Perm (base ++ [a]) := by
  obtain ⟨xs, hperm, hlist⟩ := List.subperm_iff.mp (hbase.subperm hsub)
  obtain ⟨rest, hr⟩ := hlist.exists_perm_append
  have hp := hperm.symm.trans hr
  have hrl : rest.length = 1 := by
    have hl := hp.length_eq
    simp only [List.length_append] at hl
    omega
  obtain ⟨a, rfl⟩ := List.length_eq_one_iff.mp hrl
  exact ⟨a, hp⟩

theorem support_completion (f : Fin 6 → ℕ)
    (hsupport : (∀ a, a ∈ List.ofFn f ↔ a ∈ ([1,2,3,4,5] : List ℕ)) ∨
      (∀ a, a ∈ List.ofFn f ↔ a ∈ ([1,3,4,5,9] : List ℕ))) :
    ∃ k : Fin 10, (List.ofFn f).Perm (List.ofFn (fun i => (canonical k i).natAbs)) := by
  rcases hsupport with hmem | hmem
  · obtain ⟨a, hp⟩ := subset_five_completion
      (base := [1,2,3,4,5]) (ds := List.ofFn f)
      (by decide) (by decide) (by simp) (fun a ha => (hmem a).mpr ha)
    have ha : a ∈ ([1,2,3,4,5] : List ℕ) :=
      (hmem a).mp (hp.mem_iff.mpr (by simp))
    simp only [List.mem_cons, List.not_mem_nil, or_false] at ha
    rcases ha with rfl | rfl | rfl | rfl | rfl
    · exact ⟨0, hp.trans (by decide +kernel)⟩
    · exact ⟨1, hp.trans (by decide +kernel)⟩
    · exact ⟨2, hp.trans (by decide +kernel)⟩
    · exact ⟨3, hp.trans (by decide +kernel)⟩
    · exact ⟨4, hp.trans (by decide +kernel)⟩
  · obtain ⟨a, hp⟩ := subset_five_completion
      (base := [1,3,4,5,9]) (ds := List.ofFn f)
      (by decide) (by decide) (by simp) (fun a ha => (hmem a).mpr ha)
    have ha : a ∈ ([1,3,4,5,9] : List ℕ) :=
      (hmem a).mp (hp.mem_iff.mpr (by simp))
    simp only [List.mem_cons, List.not_mem_nil, or_false] at ha
    rcases ha with rfl | rfl | rfl | rfl | rfl
    · exact ⟨5, hp.trans (by decide +kernel)⟩
    · exact ⟨6, hp.trans (by decide +kernel)⟩
    · exact ⟨7, hp.trans (by decide +kernel)⟩
    · exact ⟨8, hp.trans (by decide +kernel)⟩
    · exact ⟨9, hp.trans (by decide +kernel)⟩

theorem canonical_of_support (f : Fin 6 → ℕ)
    (hsupport : (∀ a, a ∈ List.ofFn f ↔ a ∈ ([1,2,3,4,5] : List ℕ)) ∨
      (∀ a, a ∈ List.ofFn f ↔ a ∈ ([1,3,4,5,9] : List ℕ))) :
    ∃ (k : Fin 10) (p : Equiv.Perm (Fin 6)), ∀ i, f i = (canonical k (p i)).natAbs := by
  obtain ⟨k, hperm⟩ := support_completion f hsupport
  let p := Tuple.sort f
  have hperm' := (p.ofFn_comp_perm f).trans hperm
  have hlist := hperm'.eq_of_pairwise'
    (Tuple.monotone_sort f).sortedLE_ofFn.pairwise
    (canonical_monotone k).sortedLE_ofFn.pairwise
  have hfun : f ∘ p = fun i => (canonical k i).natAbs := List.ofFn_injective hlist
  refine ⟨k, p.symm, ?_⟩
  intro i
  simpa only [Function.comp_apply, Equiv.apply_symm_apply] using congrFun hfun (p.symm i)

theorem divided_support (w : Fin 6 → ℤ) (d : ℕ) (hd : 1 ≤ d) (base : List ℕ)
    (hperm : (integerSpeeds w).Perm (base.map (fun a => d * a))) :
    (∀ i, (w i).natAbs = d * ((w i).natAbs / d)) ∧
      (∀ a, a ∈ List.ofFn (fun i => (w i).natAbs / d) ↔ a ∈ base) := by
  have hdpos : 0 < d := by omega
  constructor
  · intro i
    have hmem := hperm.mem_iff.mp ((mem_integerSpeeds w ((w i).natAbs)).mpr ⟨i, rfl⟩)
    obtain ⟨a, ha, heq⟩ := List.mem_map.mp hmem
    rw [← heq, Nat.mul_div_cancel_left a hdpos]
  · intro a
    constructor
    · intro ha
      obtain ⟨i, hi⟩ := List.mem_ofFn.mp ha
      have hmem := hperm.mem_iff.mp ((mem_integerSpeeds w ((w i).natAbs)).mpr ⟨i, rfl⟩)
      obtain ⟨b, hb, heq⟩ := List.mem_map.mp hmem
      rw [← heq, Nat.mul_div_cancel_left b hdpos] at hi
      rwa [← hi]
    · intro ha
      have hmem := hperm.mem_iff.mpr (List.mem_map.mpr ⟨a, ha, rfl⟩)
      obtain ⟨i, hi⟩ := (mem_integerSpeeds w (d * a)).mp hmem
      exact List.mem_ofFn.mpr ⟨i, by rw [hi, Nat.mul_div_cancel_left a hdpos]⟩

theorem critical_direction_normalization (w : Fin 6 → ℤ)
    (hwzero : ∀ i, w i ≠ 0) (hcrit : CriticalIntegerDirection w) :
    ∃ (d : ℕ) (k : Fin 10) (p : Equiv.Perm (Fin 6)) (σ : Fin 6 → ℤ),
      1 ≤ d ∧ (∀ i, σ i = 1 ∨ σ i = -1) ∧
      ∀ i, w i = (d : ℤ) * σ i * canonical k (p i) := by
  obtain ⟨d, hd, hperm⟩ := hcrit
  have hdiv : (∀ i, (w i).natAbs = d * ((w i).natAbs / d)) ∧
      ((∀ a, a ∈ List.ofFn (fun i => (w i).natAbs / d) ↔ a ∈ ([1,2,3,4,5] : List ℕ)) ∨
      (∀ a, a ∈ List.ofFn (fun i => (w i).natAbs / d) ↔ a ∈ ([1,3,4,5,9] : List ℕ))) := by
    rcases hperm with hperm | hperm
    · obtain ⟨hr, hs⟩ := divided_support w d hd [1,2,3,4,5] hperm
      exact ⟨hr, Or.inl hs⟩
    · obtain ⟨hr, hs⟩ := divided_support w d hd [1,3,4,5,9] hperm
      exact ⟨hr, Or.inr hs⟩
  obtain ⟨k, p, hp⟩ := canonical_of_support (fun i => (w i).natAbs / d) hdiv.2
  refine ⟨d, k, p, fun i => (w i).sign, hd, ?_, ?_⟩
  · intro i
    rcases lt_or_gt_of_ne (hwzero i) with hn | hp
    · exact Or.inr (Int.sign_eq_neg_one_of_neg hn)
    · exact Or.inl (Int.sign_eq_one_of_pos hp)
  · intro i
    have habs : (w i).natAbs = d * (canonical k (p i)).natAbs := by
      rw [← hp i]
      exact hdiv.1 i
    calc
      w i = (w i).sign * ((w i).natAbs : ℤ) := (Int.sign_mul_natAbs (w i)).symm
      _ = (d : ℤ) * (w i).sign * canonical k (p i) := by
        rw [habs, Nat.cast_mul, Int.natCast_natAbs, abs_of_pos (canonical_positive k (p i))]
        ring

end

end Loneliness.SixPlane

