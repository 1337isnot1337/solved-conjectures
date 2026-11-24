import Conjectures.FerroniHigashitaniLattice
import Conjectures.FerroniHigashitaniCount

/-! The exact coset bijections count the topological interior of the
real Cayley boxes in the refined lattice. -/

open Finset

namespace FerroniHigashitani

variable {m : ℕ}

theorem base_encode_spatial (p : OldPoint m) (r : ℤ) (j : Fin 5) :
    (encode p r).spatial.1 j = (p.b j.succ : ℝ) + (r : ℝ) / 6 := by
  simp only [ScaledPoint.spatial, encode, Int.cast_add, Int.cast_mul, Int.cast_ofNat,
    Int.cast_natCast]
  ring

theorem box_encode_spatial (p : OldPoint m) (r : ℤ) (c : BoxIndex m) :
    (encode p r).spatial.2 c = (p.x c : ℝ) + (r : ℝ) / 6 := by
  simp only [ScaledPoint.spatial, encode, Int.cast_add, Int.cast_mul, Int.cast_ofNat,
    Int.cast_natCast]
  ring

/-- The interior integer points through degree six correspond to all old
points of degree at most one less than the given degree. -/
noncomputable def oldPrefixInteriorEquiv (m k : ℕ) (hk0 : 0 < k) (hk6 : k ≤ 6) :
    {p : OldPoint m // p.degree ≤ k - 1} ≃
      {v : Space m // v ∈ interior (closedSlice (k : ℝ)) ∧ v ∈ refinedLattice m} := by
  let r (p : OldPoint m) : ℤ := (k : ℤ) - p.degree
  have hr (p : {p : OldPoint m // p.degree ≤ k - 1}) : 0 < r p.val ∧ r p.val ≤ 6 := by
    have := p.property
    dsimp [r]
    omega
  have hdegree (p : OldPoint m) : (encode p (r p)).atDegree k :=
    (encode_atDegree_iff p (r p) k).mpr (by dsimp [r]; ring)
  let f (p : {p : OldPoint m // p.degree ≤ k - 1}) :
      {v : Space m // v ∈ interior (closedSlice (k : ℝ)) ∧ v ∈ refinedLattice m} :=
    ⟨(encode p.val (r p.val)).spatial, by
      rw [interior_closedSlice, spatial_mem_strictSlice_iff (hdegree p.val)]
      exact ⟨encode_strict p.val (hr p).1, spatial_mem_refinedLattice (encode_residue _ _)⟩⟩
  refine Equiv.ofBijective f ⟨?_, ?_⟩
  · intro p q h
    have hval : (encode p.val (r p.val)).spatial = (encode q.val (r q.val)).spatial :=
      congrArg Subtype.val h
    have e := spatial_injective_atDegree (hdegree p.val) (hdegree q.val) hval
    have er : r p.val = r q.val := by
      have hp := (encode_residue p.val (r p.val)).1 0
      have hq := (encode_residue q.val (r q.val)).1 0
      rw [e, hq] at hp
      have := hr p
      have := hr q
      omega
    apply Subtype.ext
    exact encode_injective (r q.val) (er ▸ e)
  · intro v
    obtain ⟨w, s, hwdeg, hwres, hwv⟩ := exists_scaled_of_mem_refinedLattice v.property.2 k
    let t : ℤ := if s % 6 = 0 then 6 else s % 6
    have ht : 0 < t ∧ t ≤ 6 := by dsimp [t]; split_ifs <;> omega
    have htres : w.residue t := by
      have e : s % 6 = t % 6 := by dsimp [t]; split_ifs <;> omega
      exact ⟨fun j => (hwres.1 j).trans e, fun c => (hwres.2 c).trans e⟩
    have hwstr : w.strict := by
      apply (spatial_mem_strictSlice_iff hwdeg).mp
      rw [hwv, ← interior_closedSlice]
      exact v.property.1
    obtain ⟨p, hp, _⟩ := refined_strict_translate w ht.1 ht.2 htres hwstr
    have hpdeg := (encode_atDegree_iff p t k).mp (hp.symm ▸ hwdeg)
    have he : r p = t := by dsimp [r]; omega
    have hp_le : p.degree ≤ k - 1 := by omega
    refine ⟨⟨p, hp_le⟩, Subtype.ext ?_⟩
    change (encode p (r p)).spatial = v.val
    rw [he, hp, hwv]

theorem finite_refinedInterior (m k : ℕ) (hk0 : 0 < k) (hk6 : k ≤ 6) :
    Finite {v : Space m // v ∈ interior (closedSlice (k : ℝ)) ∧ v ∈ refinedLattice m} := by
  have := finite_oldPrefix m (k - 1)
  exact Finite.of_equiv _ (oldPrefixInteriorEquiv m k hk0 hk6)

theorem card_refinedInterior (m k : ℕ) (hk0 : 0 < k) (hk6 : k ≤ 6) :
    Nat.card {v : Space m // v ∈ interior (closedSlice (k : ℝ)) ∧ v ∈ refinedLattice m} =
      prefixCount m (k - 1) :=
  (Nat.card_congr (oldPrefixInteriorEquiv m k hk0 hk6).symm).trans (card_oldPrefix m (k - 1))

end FerroniHigashitani
