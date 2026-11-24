import Conjectures.FerroniHigashitani

/-! Closed lattice-point counts for all dilations. The six refined cosets
give a band of six consecutive old-lattice degrees. -/

open scoped Pointwise

namespace FerroniHigashitani

private abbrev OldBand (m k : ℕ) := {p : OldPoint m // p.degree ≤ k ∧ k < p.degree + 6}

private abbrev RefinedClosed (m k : ℕ) :=
  {v : Space m // v ∈ closedSlice (k : ℝ) ∧ v ∈ refinedLattice m}

private noncomputable def oldBandClosedEquiv (m k : ℕ) : OldBand m k ≃ RefinedClosed m k := by
  let r (p : OldPoint m) : ℤ := (k : ℤ) - p.degree
  have hr (p : OldBand m k) : 0 ≤ r p.val ∧ r p.val < 6 := by
    have := p.property
    dsimp [r]
    omega
  have hd (p : OldPoint m) : (encode p (r p)).atDegree k :=
    (encode_atDegree_iff p (r p) k).mpr (by dsimp [r]; ring)
  let f (p : OldBand m k) : RefinedClosed m k :=
    ⟨(encode p.val (r p.val)).spatial, (spatial_mem_closedSlice_iff (hd p.val)).mpr
      (encode_closed p.val (hr p).1), spatial_mem_refinedLattice (encode_residue _ _)⟩
  refine Equiv.ofBijective f ⟨?_, ?_⟩
  · intro p q h
    have hval : (encode p.val (r p.val)).spatial = (encode q.val (r q.val)).spatial :=
      congrArg Subtype.val h
    have e := spatial_injective_atDegree (hd p.val) (hd q.val) hval
    have er : r p.val = r q.val := by
      have hp := (encode_residue p.val (r p.val)).1 0
      have hq := (encode_residue q.val (r q.val)).1 0
      rw [e, hq] at hp
      have := hr p
      have := hr q
      omega
    exact Subtype.ext (encode_injective (r q.val) (er ▸ e))
  · intro v
    obtain ⟨w, s, hwdeg, hwres, hwv⟩ := exists_scaled_of_mem_refinedLattice v.property.2 k
    let t := s % 6
    have h0 : 0 ≤ t := Int.emod_nonneg _ (by norm_num)
    have h6 : t < 6 := Int.emod_lt_of_pos _ (by norm_num)
    have ht : w.residue t := by simpa [t, ScaledPoint.residue] using hwres
    have hw : w.closed := (spatial_mem_closedSlice_iff hwdeg).mp (hwv.symm ▸ v.property.1)
    obtain ⟨p, hp, _⟩ := refined_closed_translate w h0 h6 ht hw
    have hpdeg := (encode_atDegree_iff p t k).mp (hp.symm ▸ hwdeg)
    have he : r p = t := by dsimp [r]; omega
    have hband : p.degree ≤ k ∧ k < p.degree + 6 := by omega
    refine ⟨⟨p, hband⟩, Subtype.ext ?_⟩
    change (encode p (r p)).spatial = v.val
    rw [he, hp, hwv]

private theorem oldBand_finite (m k : ℕ) : Finite (OldBand m k) := by
  have := finite_oldPrefix m k
  exact Finite.of_injective (fun p : OldBand m k => (⟨p.val, p.property.1⟩ : {p : OldPoint m // p.degree ≤ k}))
    fun _ _ h => Subtype.ext (congrArg (fun q : {p : OldPoint m // p.degree ≤ k} => q.val) h)

private theorem card_oldBand_small (m k : ℕ) (hk : k < 6) : Nat.card (OldBand m k) = prefixCount m k := by
  rw [← card_oldPrefix]
  apply Nat.card_congr (Equiv.subtypeEquivRight _)
  intro p
  omega

private noncomputable def prefixPartition (m k : ℕ) (hk : 6 ≤ k) :
    {p : OldPoint m // p.degree ≤ k} ≃ OldBand m k ⊕ {p : OldPoint m // p.degree ≤ k - 6} := by
  let q := fun p : {p : OldPoint m // p.degree ≤ k} => k < p.val.degree + 6
  apply (Equiv.sumCompl q).symm.trans
  apply Equiv.sumCongr
  · exact
      { toFun := fun p => ⟨p.val.val, p.val.property, p.property⟩
        invFun := fun p => ⟨⟨p.val, p.property.1⟩, p.property.2⟩
        left_inv := fun _ => rfl
        right_inv := fun _ => rfl }
  · exact
      { toFun := fun p => ⟨p.val.val, by have h := p.property; change ¬ k < p.val.val.degree + 6 at h; omega⟩
        invFun := fun p => ⟨⟨p.val, by have h := p.property; omega⟩, by
          have h := p.property
          change ¬k < p.val.degree + 6
          omega⟩
        left_inv := fun _ => rfl
        right_inv := fun _ => rfl }

private theorem card_oldBand_large (m k : ℕ) (hk : 6 ≤ k) :
    Nat.card (OldBand m k) + prefixCount m (k - 6) = prefixCount m k := by
  have := oldBand_finite m k
  have := finite_oldPrefix m (k - 6)
  rw [← card_oldPrefix m k, Nat.card_congr (prefixPartition m k hk), Nat.card_sum, card_oldPrefix]

def ClosedLatticePoints {m : ℕ} (P : Set (Space m)) (k : ℕ) :=
  {v : Space m // v ∈ (k : ℝ) • P ∧ v ∈ standardLattice m}

private noncomputable def closedBasisEquiv (m k : ℕ) (hk : 0 < k) :
    RefinedClosed m (k * 2) ≃ ClosedLatticePoints (witness m) k := by
  apply (toBasis m).toEquiv.subtypeEquiv
  intro v
  have h : toBasis m v ∈ (k : ℝ) • witness m ↔ v ∈ closedSlice (((k * 2 : ℕ) : ℝ)) := by
    rw [witness_dilate m k hk]
    constructor
    · rintro ⟨w, hw, he⟩
      rwa [(toBasis m).injective he] at hw
    · exact fun hv => ⟨v, hv, rfl⟩
  exact and_congr h.symm (mem_standardLattice_toBasis_iff v).symm

theorem finite_witnessClosed (m k : ℕ) (hk : 0 < k) : Finite (ClosedLatticePoints (witness m) k) := by
  have := oldBand_finite m (k * 2)
  exact Finite.of_equiv _ ((oldBandClosedEquiv m (k * 2)).trans (closedBasisEquiv m k hk))

theorem card_witnessClosed_small (m k : ℕ) (hk : 0 < k) (hk6 : k * 2 < 6) :
    Nat.card (ClosedLatticePoints (witness m) k) = prefixCount m (k * 2) :=
  (Nat.card_congr ((oldBandClosedEquiv m (k * 2)).trans (closedBasisEquiv m k hk)).symm).trans
    (card_oldBand_small _ _ hk6)

theorem card_witnessClosed_large (m k : ℕ) (hk : 0 < k) (hk6 : 6 ≤ k * 2) :
    Nat.card (ClosedLatticePoints (witness m) k) + prefixCount m (k * 2 - 6) =
      prefixCount m (k * 2) := by
  rw [Nat.card_congr ((oldBandClosedEquiv m (k * 2)).trans (closedBasisEquiv m k hk)).symm]
  exact card_oldBand_large _ _ hk6

end FerroniHigashitani
