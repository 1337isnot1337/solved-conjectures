import Conjectures.LonelinessEightPlaneGap
import Mathlib.Data.Fin.Tuple.Sort

/-! Every full-support allowed direction is a positive integer multiple of
a signed permutation of a seven-speed base with one repeated entry. -/

namespace Loneliness.EightPlane

noncomputable section

open CoordinateSubspace

theorem base_nodup : ∀ family : Fin 3, (baseList family).Nodup := by
  decide +kernel

theorem canonical_positive : ∀ (family : Fin 3) (repeatIndex : Fin 7) (i : Fin 8),
    0 < canonical family repeatIndex i := by
  decide +kernel

theorem canonical_absolute_list : ∀ (family : Fin 3) (repeatIndex : Fin 7),
    List.ofFn (fun i => (canonical family repeatIndex i).natAbs) =
      baseList family ++ [base family repeatIndex] := by
  decide +kernel

theorem subset_seven_completion {W ds : List ℕ}
    (hW : W.Nodup) (hlen : W.length = 7)
    (hds : ds.length = 8) (hsub : W ⊆ ds) :
    ∃ a : ℕ, ds.Perm (W ++ [a]) := by
  obtain ⟨xs, hperm, hlist⟩ := List.subperm_iff.mp (hW.subperm hsub)
  obtain ⟨rest, hr⟩ := hlist.exists_perm_append
  have hp := hperm.symm.trans hr
  have hrl : rest.length = 1 := by
    have hl := hp.length_eq
    simp only [List.length_append] at hl
    omega
  obtain ⟨a, rfl⟩ := List.length_eq_one_iff.mp hrl
  exact ⟨a, hp⟩

theorem support_completion (f : Fin 8 → ℕ) (family : Fin 3)
    (hsupport : ∀ a, a ∈ List.ofFn f ↔ a ∈ baseList family) :
    ∃ repeatIndex : Fin 7,
      (List.ofFn f).Perm (List.ofFn (fun i => (canonical family repeatIndex i).natAbs)) := by
  obtain ⟨a, hp⟩ := subset_seven_completion (base_nodup family)
    (by simp only [baseList, List.length_ofFn]) (by simp only [List.length_ofFn])
    (fun a ha => (hsupport a).mpr ha)
  have ha : a ∈ baseList family := (hsupport a).mp (hp.mem_iff.mpr (by simp))
  obtain ⟨repeatIndex, rfl⟩ := List.mem_ofFn.mp ha
  refine ⟨repeatIndex, ?_⟩
  rw [canonical_absolute_list]
  exact hp

theorem tuple_permutation_of_perm {n : ℕ} (f g : Fin n → ℕ)
    (hperm : (List.ofFn f).Perm (List.ofFn g)) :
    ∃ p : Equiv.Perm (Fin n), ∀ i, f i = g (p i) := by
  let p := Tuple.sort f
  let q := Tuple.sort g
  have hperm' := (p.ofFn_comp_perm f).trans (hperm.trans (q.ofFn_comp_perm g).symm)
  have hlist := hperm'.eq_of_pairwise'
    (Tuple.monotone_sort f).sortedLE_ofFn.pairwise
    (Tuple.monotone_sort g).sortedLE_ofFn.pairwise
  have hfun : f ∘ p = g ∘ q := List.ofFn_injective hlist
  refine ⟨p.symm.trans q, ?_⟩
  intro i
  change f i = g (q (p.symm i))
  simpa only [Function.comp_apply, Equiv.apply_symm_apply] using congrFun hfun (p.symm i)

theorem canonical_of_support (f : Fin 8 → ℕ) (family : Fin 3)
    (hsupport : ∀ a, a ∈ List.ofFn f ↔ a ∈ baseList family) :
    ∃ (repeatIndex : Fin 7) (p : Equiv.Perm (Fin 8)),
      ∀ i, f i = (canonical family repeatIndex (p i)).natAbs := by
  obtain ⟨repeatIndex, hperm⟩ := support_completion f family hsupport
  obtain ⟨p, hp⟩ := tuple_permutation_of_perm f
    (fun i => (canonical family repeatIndex i).natAbs) hperm
  exact ⟨repeatIndex, p, hp⟩

theorem divided_support (w : Vector) (family : Fin 3) (d : ℕ) (hd : 0 < d)
    (hsub : ∀ i, (w i).natAbs ∈ (baseList family).map (fun a => d * a))
    (hcover : ∀ a ∈ baseList family, ∃ i, (w i).natAbs = d * a) :
    (∀ i, (w i).natAbs = d * ((w i).natAbs / d)) ∧
      (∀ a, a ∈ List.ofFn (fun i => (w i).natAbs / d) ↔ a ∈ baseList family) := by
  constructor
  · intro i
    obtain ⟨a, _ha, heq⟩ := List.mem_map.mp (hsub i)
    rw [← heq, Nat.mul_div_cancel_left a hd]
  · intro a
    constructor
    · intro ha
      obtain ⟨i, hi⟩ := List.mem_ofFn.mp ha
      obtain ⟨b, hb, heq⟩ := List.mem_map.mp (hsub i)
      rw [← heq, Nat.mul_div_cancel_left b hd] at hi
      rwa [← hi]
    · intro ha
      obtain ⟨i, hi⟩ := hcover a ha
      exact List.mem_ofFn.mpr ⟨i, by rw [hi, Nat.mul_div_cancel_left a hd]⟩

theorem critical_direction_normalization (w : Vector)
    (hwzero : ∀ i, w i ≠ 0) (hcrit : KnownShape w) :
    ∃ (d : ℕ) (family : Fin 3) (repeatIndex : Fin 7)
      (p : Equiv.Perm (Fin 8)) (σ : Fin 8 → ℤ),
      1 ≤ d ∧ (∀ i, σ i = 1 ∨ σ i = -1) ∧
      ∀ i, w i = (d : ℤ) * σ i * canonical family repeatIndex (p i) := by
  obtain ⟨family, d, hd, hsub, hcover⟩ := hcrit
  obtain ⟨hrescale, hsupport⟩ := divided_support w family d hd hsub hcover
  obtain ⟨repeatIndex, p, hp⟩ := canonical_of_support
    (fun i => (w i).natAbs / d) family hsupport
  refine ⟨d, family, repeatIndex, p, fun i => (w i).sign, by omega, ?_, ?_⟩
  · intro i
    rcases lt_or_gt_of_ne (hwzero i) with hn | hp
    · exact Or.inr (Int.sign_eq_neg_one_of_neg hn)
    · exact Or.inl (Int.sign_eq_one_of_pos hp)
  · intro i
    have habs : (w i).natAbs = d * (canonical family repeatIndex (p i)).natAbs := by
      rw [← hp i]
      exact hrescale i
    calc
      w i = (w i).sign * ((w i).natAbs : ℤ) := (Int.sign_mul_natAbs (w i)).symm
      _ = (d : ℤ) * (w i).sign * canonical family repeatIndex (p i) := by
        rw [habs, Nat.cast_mul, Int.natCast_natAbs,
          abs_of_pos (canonical_positive family repeatIndex (p i))]
        ring

end

end Loneliness.EightPlane

