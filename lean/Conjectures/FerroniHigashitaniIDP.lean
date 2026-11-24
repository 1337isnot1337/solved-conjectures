import Conjectures.FerroniHigashitaniInterior

/-! Integer decomposition in the refined lattice, including the dilation
used for the counterexample. -/

open Finset
open scoped Pointwise

namespace FerroniHigashitani

variable {m : ℕ}

private def oldOrigin (m : ℕ) : OldPoint m :=
  ⟨fun _ => 0, fun _ => 0, fun _ => Nat.zero_le _⟩

noncomputable def center (m : ℕ) : Space m := (encode (oldOrigin m) 1).spatial

private theorem center_spec (m : ℕ) : center m ∈ closedSlice 1 ∧ center m ∈ refinedLattice m := by
  have hk : (encode (oldOrigin m) 1).atDegree 1 :=
    (encode_atDegree_iff (oldOrigin m) 1 1).mpr (by simp [OldPoint.degree, oldOrigin])
  refine ⟨?_, spatial_mem_refinedLattice (encode_residue _ _)⟩
  simpa only [center, Nat.cast_one] using
    (spatial_mem_closedSlice_iff hk).mpr (encode_closed _ (by norm_num))

/-- Decompose in the degree-one slice of the cone, using old-lattice points
and one copy of the central point for each unit of the residue. -/
theorem refined_idp_slice (k : ℕ) {v : Space m} (hv : v ∈ closedSlice (k : ℝ))
    (hl : v ∈ refinedLattice m) :
    ∃ f : Fin k → Space m, (∀ i, f i ∈ closedSlice 1 ∧ f i ∈ refinedLattice m) ∧
      ∑ i, f i = v := by
  obtain ⟨w, s, hwdeg, hwres, hwv⟩ := exists_scaled_of_mem_refinedLattice hl k
  let r : ℤ := s % 6
  have hr0 : 0 ≤ r := Int.emod_nonneg _ (by norm_num)
  have hr6 : r < 6 := Int.emod_lt_of_pos _ (by norm_num)
  have hrres : w.residue r := by simpa [r, ScaledPoint.residue] using hwres
  have hwclosed := (spatial_mem_closedSlice_iff hwdeg).mp (hwv.symm ▸ hv)
  obtain ⟨p, hp, _⟩ := refined_closed_translate w hr0 hr6 hrres hwclosed
  have hpdeg := (encode_atDegree_iff p r k).mp (hp.symm ▸ hwdeg)
  have hrnat : (r.toNat : ℤ) = r := Int.toNat_of_nonneg hr0
  have hd : p.degree + r.toNat = k := by omega
  obtain ⟨f, hf, hb, hx⟩ := oldPoint_idp p
  let g (i : Fin p.degree) := (encode (f i) 0).spatial
  have hg (i : Fin p.degree) : g i ∈ closedSlice 1 ∧ g i ∈ refinedLattice m := by
    have hi : (encode (f i) 0).atDegree 1 :=
      (encode_atDegree_iff _ _ _).mpr (by simp [hf i])
    refine ⟨?_, spatial_mem_refinedLattice (encode_residue _ _)⟩
    simpa only [g, Nat.cast_one] using
      (spatial_mem_closedSlice_iff hi).mpr (encode_closed _ (by norm_num))
  let a : Fin (p.degree + r.toNat) → Space m := Fin.append g (fun _ => center m)
  have ha (i : Fin (p.degree + r.toNat)) : a i ∈ closedSlice 1 ∧ a i ∈ refinedLattice m := by
    exact Fin.addCases (fun j => by simpa [a, Fin.append_left] using hg j)
      (fun j => by simpa [a, Fin.append_right] using center_spec m) i
  refine ⟨fun i => a ((finCongr hd).symm i), fun i => ha _, ?_⟩
  rw [Equiv.sum_comp (finCongr hd).symm a, Fin.sum_univ_add]
  simp only [a, Fin.append_left, Fin.append_right, sum_const, card_univ,
    Fintype.card_fin, ← hwv, ← hp]
  change (∑ i, (encode (f i) 0).spatial) + r.toNat • center m = (encode p r).spatial
  have e (j : Fin 5) : (∑ i, ((f i).b j.succ : ℝ)) = (p.b j.succ : ℝ) := by
    exact_mod_cast hb j.succ
  have ea (c : BoxIndex m) : (∑ i, ((f i).x c : ℝ)) = (p.x c : ℝ) := by
    exact_mod_cast hx c
  have hrR : (r.toNat : ℝ) = (r : ℝ) := by exact_mod_cast hrnat
  apply Prod.ext <;> funext j
  · simp [center, ScaledPoint.spatial, encode, oldOrigin, ← prod_mk_sum, hrR, e]
    ring
  · simp [center, ScaledPoint.spatial, encode, oldOrigin, ← prod_mk_sum, hrR, ea]
    ring

theorem twoSlice_dilate (m : ℕ) (k : ℕ) (hk : 0 < k) :
    (k : ℝ) • (closedSlice (m := m) 2) = closedSlice (((k * 2 : ℕ) : ℝ)) := by
  rw [Nat.cast_mul, Nat.cast_ofNat, closedSlice_dilate 2 (by exact_mod_cast hk)]

/-- The degree-two slice is IDP. The `2k` degree-one summands are paired
to produce `k` degree-two summands. -/
theorem refined_idp_twoSlice (k : ℕ) (hk : 0 < k) {v : Space m}
    (hv : v ∈ (k : ℝ) • closedSlice 2) (hl : v ∈ refinedLattice m) :
    ∃ f : Fin k → Space m, (∀ i, f i ∈ closedSlice 2 ∧ f i ∈ refinedLattice m) ∧
      ∑ i, f i = v := by
  rw [twoSlice_dilate m k hk] at hv
  obtain ⟨g, hg, hsum⟩ := refined_idp_slice (k * 2) hv hl
  let e : Fin k × Fin 2 ≃ Fin (k * 2) := finProdFinEquiv
  let f (i : Fin k) := g (e (i, 0)) + g (e (i, 1))
  refine ⟨f, fun i => ⟨?_, refinedLattice_add (hg _).2 (hg _).2⟩, ?_⟩
  · have hconv := closedSlice_convex (m := m) 1
    obtain ⟨u, hu, he⟩ := hconv.exists_mem_add_smul_eq (hg (e (i, 0))).1 (hg (e (i, 1))).1
      (p := 1) (q := 1) (by norm_num) (by norm_num)
    have he' : (2 : ℝ) • u = f i := by simpa [f, one_add_one_eq_two] using he
    rw [← he']
    simpa only [mul_one] using (scale_mem_closedSlice_iff 1 (a := 2) (by norm_num) u).mpr hu
  · rw [← Equiv.sum_comp e g, Fintype.sum_prod_type] at hsum
    simpa [f, Fin.sum_univ_two] using hsum

end FerroniHigashitani
