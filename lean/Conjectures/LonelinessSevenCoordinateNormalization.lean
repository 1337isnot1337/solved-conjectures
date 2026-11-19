import Conjectures.LonelinessSevenCoordinateDirections
import Mathlib.Data.Fin.Tuple.Sort
import Mathlib.LinearAlgebra.LinearIndependent.Lemmas

/-! Literal primitive generators for the seven-coordinate plane reduction.
The canonical order is `[1,2,3,4,5,6,k]`, with `1 ≤ k ≤ 6`. Each generator
is an actual signed coordinate permutation of one of these six vectors. -/

namespace Loneliness.SevenCoordinateCritical

open CoordinateSubspace SubspaceDensity

noncomputable section

def CanonicalSignedRepeat (w : Vector) : Prop :=
  ∃ (k : Fin 6) (p : Equiv.Perm (Fin 7)) (σ : Fin 7 → ℤ),
    (∀ i, σ i = 1 ∨ σ i = -1) ∧
    ∀ i, w i = σ i * canonical k (p i)

def PrimitiveDirection (w : Vector) : Prop :=
  Normalization.gcd (List.ofFn (fun i => (w i).natAbs)) = 1

theorem subset_successor_completion {base ds : List ℕ}
    (hbase : base.Nodup) (hds : ds.length = base.length + 1)
    (hsub : base ⊆ ds) : ∃ a : ℕ, ds.Perm (base ++ [a]) := by
  obtain ⟨xs, hperm, hlist⟩ := List.subperm_iff.mp (hbase.subperm hsub)
  obtain ⟨rest, hr⟩ := hlist.exists_perm_append
  have hp := hperm.symm.trans hr
  have hrl : rest.length = 1 := by
    have hl := hp.length_eq
    simp only [List.length_append] at hl
    omega
  obtain ⟨a, rfl⟩ := List.length_eq_one_iff.mp hrl
  exact ⟨a, hp⟩

theorem support_completion (f : Fin 7 → ℕ)
    (hsupport : ∀ a, a ∈ List.ofFn f ↔ a ∈ sixBase) :
    ∃ k : Fin 6,
      (List.ofFn f).Perm (List.ofFn (fun i => (canonical k i).natAbs)) := by
  obtain ⟨a, hp⟩ := subset_successor_completion
    (base := sixBase) (ds := List.ofFn f) (by decide) (by simp [sixBase])
    (fun a ha => (hsupport a).mpr ha)
  have ha : a ∈ sixBase := (hsupport a).mp (hp.mem_iff.mpr (by simp))
  have hbounds : ∀ a ∈ sixBase, 1 ≤ a ∧ a ≤ 6 := by norm_num [sixBase]
  have ha' := hbounds a ha
  let k : Fin 6 := ⟨a-1, by omega⟩
  have hk : k.val+1 = a := by dsimp [k]; omega
  refine ⟨k, ?_⟩
  rw [canonical_absolute_list, hk]
  exact hp

theorem perm_ofFn_coordinates {n : ℕ} (f g : Fin n → ℕ)
    (hperm : (List.ofFn f).Perm (List.ofFn g)) :
    ∃ p : Equiv.Perm (Fin n), ∀ i, f i = g (p i) := by
  let p := Tuple.sort f
  let q := Tuple.sort g
  have hp := (p.ofFn_comp_perm f).trans (hperm.trans (q.ofFn_comp_perm g).symm)
  have hlist := hp.eq_of_pairwise'
    (Tuple.monotone_sort f).sortedLE_ofFn.pairwise
    (Tuple.monotone_sort g).sortedLE_ofFn.pairwise
  have hfun : f ∘ p = g ∘ q := List.ofFn_injective hlist
  refine ⟨p.symm.trans q, ?_⟩
  intro i
  change f i = g (q (p.symm i))
  simpa only [Function.comp_apply, Equiv.apply_symm_apply] using congrFun hfun (p.symm i)

theorem canonical_of_support (f : Fin 7 → ℕ)
    (hsupport : ∀ a, a ∈ List.ofFn f ↔ a ∈ sixBase) :
    ∃ (k : Fin 6) (p : Equiv.Perm (Fin 7)),
      ∀ i, f i = (canonical k (p i)).natAbs := by
  obtain ⟨k, hperm⟩ := support_completion f hsupport
  obtain ⟨p, hp⟩ := perm_ofFn_coordinates f (fun i => (canonical k i).natAbs) hperm
  exact ⟨k, p, hp⟩

theorem divided_support (w : Vector) (d : ℕ) (hd : 0 < d)
    (hperm : (integerSpeeds w).Perm (sixBase.map (fun a => d * a))) :
    (∀ i, (w i).natAbs = d * ((w i).natAbs / d)) ∧
      (∀ a, a ∈ List.ofFn (fun i => (w i).natAbs / d) ↔ a ∈ sixBase) := by
  constructor
  · intro i
    have hmem := hperm.mem_iff.mp ((mem_integerSpeeds w ((w i).natAbs)).mpr ⟨i, rfl⟩)
    obtain ⟨a, _, heq⟩ := List.mem_map.mp hmem
    rw [← heq, Nat.mul_div_cancel_left a hd]
  · intro a
    constructor
    · intro ha
      obtain ⟨i, hi⟩ := List.mem_ofFn.mp ha
      have hmem := hperm.mem_iff.mp ((mem_integerSpeeds w ((w i).natAbs)).mpr ⟨i, rfl⟩)
      obtain ⟨b, hb, heq⟩ := List.mem_map.mp hmem
      rw [← heq, Nat.mul_div_cancel_left b hd] at hi
      rwa [← hi]
    · intro ha
      have hmem := hperm.mem_iff.mpr (List.mem_map.mpr ⟨a, ha, rfl⟩)
      obtain ⟨i, hi⟩ := (mem_integerSpeeds w (d * a)).mp hmem
      exact List.mem_ofFn.mpr ⟨i, by rw [hi, Nat.mul_div_cancel_left a hd]⟩

theorem consecutive_direction_normalization (w : Vector)
    (hzero : ∀ i, w i ≠ 0) (hcritical : ConsecutiveRepeatDirection w) :
    ∃ (d : ℕ) (k : Fin 6) (p : Equiv.Perm (Fin 7)) (σ : Fin 7 → ℤ),
      0 < d ∧ (∀ i, σ i = 1 ∨ σ i = -1) ∧
      ∀ i, w i = (d : ℤ) * σ i * canonical k (p i) := by
  obtain ⟨d, hd, hperm⟩ := hcritical
  obtain ⟨hdiv, hsupport⟩ := divided_support w d hd hperm
  obtain ⟨k, p, hp⟩ := canonical_of_support (fun i => (w i).natAbs / d) hsupport
  refine ⟨d, k, p, fun i => (w i).sign, hd, ?_, ?_⟩
  · intro i
    rcases lt_or_gt_of_ne (hzero i) with hn | hp
    · exact Or.inr (Int.sign_eq_neg_one_of_neg hn)
    · exact Or.inl (Int.sign_eq_one_of_pos hp)
  · intro i
    have habs : (w i).natAbs = d * (canonical k (p i)).natAbs := by
      rw [← hp i]
      exact hdiv i
    calc
      w i = (w i).sign * ((w i).natAbs : ℤ) := (Int.sign_mul_natAbs (w i)).symm
      _ = (d : ℤ) * (w i).sign * canonical k (p i) := by
        rw [habs, Nat.cast_mul, Int.natCast_natAbs, abs_of_pos (canonical_positive k (p i))]
        ring

theorem canonicalSigned_nonzero {w : Vector} (h : CanonicalSignedRepeat w) :
    ∀ i, w i ≠ 0 := by
  obtain ⟨k, p, σ, hσ, hw⟩ := h
  intro i
  rw [hw i]
  apply mul_ne_zero
  · rcases hσ i with hi | hi <;> simp [hi]
  · exact ne_of_gt (canonical_positive k (p i))

theorem canonicalSigned_abs_le_six {w : Vector} (h : CanonicalSignedRepeat w) :
    ∀ i, |w i| ≤ 6 := by
  obtain ⟨k, p, σ, hσ, hw⟩ := h
  intro i
  rw [hw i, abs_mul]
  have hsign : |σ i| = 1 := by rcases hσ i with hi | hi <;> simp [hi]
  rw [hsign, one_mul]
  exact canonical_abs_le_six k (p i)

theorem canonicalSigned_absolute_list {w : Vector} (h : CanonicalSignedRepeat w) :
    ∃ k : Fin 6,
      (List.ofFn (fun i => (w i).natAbs)).Perm (sixBase ++ [k.val+1]) := by
  obtain ⟨k, p, σ, hσ, hw⟩ := h
  have hfunction : (fun i => (w i).natAbs) =
      (fun i => (canonical k (p i)).natAbs) := by
    funext i
    rw [hw i, Int.natAbs_mul]
    rcases hσ i with hi | hi <;> simp [hi]
  refine ⟨k, ?_⟩
  rw [hfunction, ← canonical_absolute_list k]
  exact p.ofFn_comp_perm (fun i => (canonical k i).natAbs)

theorem canonicalSigned_support {w : Vector} (h : CanonicalSignedRepeat w) (a : ℕ) :
    a ∈ List.ofFn (fun i => (w i).natAbs) ↔ a ∈ sixBase := by
  obtain ⟨k, hperm⟩ := canonicalSigned_absolute_list h
  have hrepeat : k.val+1 ∈ sixBase := by fin_cases k <;> decide
  rw [hperm.mem_iff, List.mem_append, List.mem_singleton]
  constructor
  · rintro (ha | rfl)
    · exact ha
    · exact hrepeat
  · exact Or.inl

theorem canonicalSigned_primitive {w : Vector} (h : CanonicalSignedRepeat w) :
    PrimitiveDirection w := by
  obtain ⟨k, p, σ, hσ, hw⟩ := h
  have hone : (w (p.symm 0)).natAbs = 1 := by
    rw [hw, Equiv.apply_symm_apply]
    rcases hσ (p.symm 0) with hi | hi <;> simp [canonical, hi]
  have hmem : 1 ∈ List.ofFn (fun i => (w i).natAbs) :=
    List.mem_ofFn.mpr ⟨p.symm 0, hone⟩
  exact Nat.dvd_one.mp (Normalization.gcd_dvd_mem hmem)

theorem consecutive_direction_rescale (w : Vector)
    (hzero : ∀ i, w i ≠ 0) (hcritical : ConsecutiveRepeatDirection w) :
    ∃ (d : ℕ) (u : Vector), 0 < d ∧ CanonicalSignedRepeat u ∧
      ∀ i, w i = (d : ℤ) * u i := by
  obtain ⟨d, k, p, σ, hd, hσ, hw⟩ := consecutive_direction_normalization w hzero hcritical
  refine ⟨d, (fun i => σ i * canonical k (p i)), hd, ⟨k, p, σ, hσ, fun _ => rfl⟩, ?_⟩
  intro i
  rw [hw i]
  ring

theorem rational_cast_rescale (w u : Vector) (d : ℕ)
    (h : ∀ i, w i = (d : ℤ) * u i) :
    (fun i => (w i : ℚ)) = (d : ℚ) • (fun i => (u i : ℚ)) := by
  ext i
  simp only [Pi.smul_apply, smul_eq_mul, h i, Int.cast_mul, Int.cast_natCast]

theorem primitive_rescale_mem (E : Submodule ℚ (Fin 7 → ℚ))
    (w u : Vector) (d : ℕ) (hd : 0 < d)
    (hwE : (fun i => (w i : ℚ)) ∈ E)
    (hscale : (fun i => (w i : ℚ)) = (d : ℚ) • (fun i => (u i : ℚ))) :
    (fun i => (u i : ℚ)) ∈ E := by
  have hdne : (d : ℚ) ≠ 0 := by exact_mod_cast (ne_of_gt hd)
  rw [hscale] at hwE
  have h := E.smul_mem (d : ℚ)⁻¹ hwE
  simpa only [smul_smul, inv_mul_cancel₀ hdne, one_smul] using h

theorem two_primitive_signed_repeat_directions
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hlow : spaceValue (realSpan E) ≤ (1 / 7 : ℝ)) :
    ∃ q w : Vector,
      (fun i => (q i : ℚ)) ∈ E ∧ (fun i => (w i : ℚ)) ∈ E ∧
      (∀ i, q i ≠ 0) ∧ (∀ i, w i ≠ 0) ∧
      PrimitiveDirection q ∧ PrimitiveDirection w ∧
      CanonicalSignedRepeat q ∧ CanonicalSignedRepeat w ∧
      LinearIndependent ℚ ![(fun i => (q i : ℚ)), (fun i => (w i : ℚ))] ∧
      Submodule.span ℚ {(fun i => (q i : ℚ)), (fun i => (w i : ℚ))} = E := by
  obtain ⟨q, w, hqE, hwE, hqzero, hwzero, hqcrit, hwcrit, hpair, hspan⟩ :=
    two_consecutive_repeat_directions hfive hsix E hfree hdim hlow
  obtain ⟨dq, q', hdq, hq', hqscale⟩ := consecutive_direction_rescale q hqzero hqcrit
  obtain ⟨dw, w', hdw, hw', hwscale⟩ := consecutive_direction_rescale w hwzero hwcrit
  have hqQ := rational_cast_rescale q q' dq hqscale
  have hwQ := rational_cast_rescale w w' dw hwscale
  have hq'E := primitive_rescale_mem E q q' dq hdq hqE hqQ
  have hw'E := primitive_rescale_mem E w w' dw hdw hwE hwQ
  have hdqne : (dq : ℚ) ≠ 0 := by exact_mod_cast (ne_of_gt hdq)
  have hdwne : (dw : ℚ) ≠ 0 := by exact_mod_cast (ne_of_gt hdw)
  have hpair' : LinearIndependent ℚ ![(fun i => (q' i : ℚ)), (fun i => (w' i : ℚ))] := by
    rw [hqQ, hwQ] at hpair
    exact (LinearIndependent.pair_smul_smul_iff
      (isUnit_iff_ne_zero.mpr hdqne) (isUnit_iff_ne_zero.mpr hdwne)).mp hpair
  refine ⟨q', w', hq'E, hw'E, canonicalSigned_nonzero hq', canonicalSigned_nonzero hw',
    canonicalSigned_primitive hq', canonicalSigned_primitive hw', hq', hw', hpair', ?_⟩
  apply le_antisymm
  · exact Submodule.span_le.mpr
      (Set.insert_subset_iff.mpr ⟨hq'E, Set.singleton_subset_iff.mpr hw'E⟩)
  · rw [← hspan]
    apply Submodule.span_le.mpr
    refine Set.insert_subset_iff.mpr ⟨?_, Set.singleton_subset_iff.mpr ?_⟩
    · rw [hqQ]
      exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
    · rw [hwQ]
      exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))

end

end Loneliness.SevenCoordinateCritical
