import Conjectures.LonelinessPlaneGap

/-! Signed coordinate permutations preserve the integer speed support and the
actual real-subspace loneliness value. These equivalences normalize planes
before the finite critical-pattern certificate is applied. -/

namespace Loneliness.CoordinateSubspace

noncomputable section

variable {ι : Type*}

def signedCoordinates (K : Type*) [CommRing K]
    (σ : ι → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm ι) :
    (ι → K) ≃ₗ[K] (ι → K) where
  toFun x i := (σ i : K) * x (p i)
  invFun y i := (σ (p.symm i) : K) * y (p.symm i)
  left_inv x := by
    ext i
    rcases hσ (p.symm i) with h | h <;> simp [h]
  right_inv x := by
    ext i
    rcases hσ i with h | h <;> simp [h]
  map_add' x y := by ext i; simp [mul_add]
  map_smul' a x := by ext i; simp [smul_eq_mul]; ring

@[simp] theorem signedCoordinates_apply (K : Type*) [CommRing K]
    (σ : ι → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm ι)
    (x : ι → K) (i : ι) :
    signedCoordinates K σ hσ p x i = (σ i : K) * x (p i) := rfl

@[simp] theorem signedCoordinates_symm_apply (K : Type*) [CommRing K]
    (σ : ι → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm ι)
    (x : ι → K) (i : ι) :
    (signedCoordinates K σ hσ p).symm x i =
      (σ (p.symm i) : K) * x (p.symm i) := rfl

theorem natAbs_signedCoordinates (σ : ι → ℤ)
    (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm ι)
    (w : ι → ℤ) (i : ι) :
    (signedCoordinates ℤ σ hσ p w i).natAbs = (w (p i)).natAbs := by
  rcases hσ i with h | h <;> simp [h]

variable [Fintype ι]

theorem integerSpeeds_signedCoordinates (σ : ι → ℤ)
    (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm ι) (w : ι → ℤ) :
    (integerSpeeds (signedCoordinates ℤ σ hσ p w)).Perm (integerSpeeds w) := by
  apply List.perm_ext_iff_of_nodup
    (integerSpeeds_nodup _) (integerSpeeds_nodup _) |>.mpr
  intro a
  simp only [mem_integerSpeeds, natAbs_signedCoordinates]
  constructor
  · rintro ⟨i, hi⟩
    exact ⟨p i, hi⟩
  · rintro ⟨i, hi⟩
    exact ⟨p.symm i, by simpa using hi⟩

theorem value_integerSpeeds_signedCoordinates (σ : ι → ℤ)
    (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm ι) (w : ι → ℤ) :
    value (integerSpeeds (signedCoordinates ℤ σ hσ p w)) = value (integerSpeeds w) :=
  CriticalFamilies.value_perm (integerSpeeds_signedCoordinates σ hσ p w)

omit [Fintype ι] in
theorem coordinateFree_signedCoordinates (K : Type*) [Field K] [CharZero K]
    (σ : ι → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm ι)
    (E : Submodule K (ι → K)) (hfree : CoordinateFree E) :
    CoordinateFree (E.map (signedCoordinates K σ hσ p).toLinearMap) := by
  intro i
  obtain ⟨x, hx, hxi⟩ := hfree (p i)
  refine ⟨signedCoordinates K σ hσ p x, Submodule.mem_map.mpr ⟨x, hx, rfl⟩, ?_⟩
  rcases hσ i with h | h <;> simpa [h] using hxi

omit [Fintype ι] in
theorem rationalVector_signedCoordinates (σ : ι → ℤ)
    (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm ι) (x : ι → ℚ) :
    rationalVector (signedCoordinates ℚ σ hσ p x) =
      signedCoordinates ℝ σ hσ p (rationalVector x) := by
  ext i
  simp

omit [Fintype ι] in
theorem realSpan_signedCoordinates (σ : ι → ℤ)
    (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm ι)
    (E : Submodule ℚ (ι → ℚ)) :
    realSpan (E.map (signedCoordinates ℚ σ hσ p).toLinearMap) =
      (realSpan E).map (signedCoordinates ℝ σ hσ p).toLinearMap := by
  rw [realSpan, realSpan, Submodule.map_span]
  congr 1
  ext x
  constructor
  · rintro ⟨v, hv, rfl⟩
    obtain ⟨w, hw, rfl⟩ := Submodule.mem_map.mp hv
    exact ⟨rationalVector w, ⟨w, hw, rfl⟩, (rationalVector_signedCoordinates σ hσ p w).symm⟩
  · rintro ⟨v, ⟨w, hw, rfl⟩, rfl⟩
    exact ⟨signedCoordinates ℚ σ hσ p w,
      Submodule.mem_map.mpr ⟨w, hw, rfl⟩, rationalVector_signedCoordinates σ hσ p w⟩

variable [Nonempty ι]

theorem pointClearance_signedCoordinates (σ : ι → ℤ)
    (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm ι) (x : ι → ℝ) :
    SubspaceDensity.pointClearance (signedCoordinates ℝ σ hσ p x) =
      SubspaceDensity.pointClearance x := by
  have hd (i : ι) : distance (signedCoordinates ℝ σ hσ p x i) = distance (x (p i)) := by
    rcases hσ i with h | h <;> simp [h, CriticalFamilies.distance_neg]
  apply le_antisymm
  · apply SubspaceDensity.le_point
    intro i
    have h := SubspaceDensity.point_le_distance (signedCoordinates ℝ σ hσ p x) (p.symm i)
    rw [hd] at h
    simpa only [Equiv.apply_symm_apply] using h
  · apply SubspaceDensity.le_point
    intro i
    rw [hd]
    exact SubspaceDensity.point_le_distance x (p i)

theorem spaceValue_signedCoordinates (σ : ι → ℤ)
    (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm ι)
    (E : Submodule ℝ (ι → ℝ)) :
    SubspaceDensity.spaceValue (E.map (signedCoordinates ℝ σ hσ p).toLinearMap) =
      SubspaceDensity.spaceValue E := by
  apply le_antisymm
  · apply SubspaceDensity.spaceValue_le
    intro x hx
    obtain ⟨y, hy, rfl⟩ := Submodule.mem_map.mp hx
    change SubspaceDensity.pointClearance (signedCoordinates ℝ σ hσ p y) ≤ _
    rw [pointClearance_signedCoordinates]
    exact SubspaceDensity.point_le_spaceValue hy
  · apply SubspaceDensity.spaceValue_le
    intro x hx
    rw [← pointClearance_signedCoordinates σ hσ p x]
    exact SubspaceDensity.point_le_spaceValue (Submodule.mem_map.mpr ⟨x, hx, rfl⟩)

theorem spaceValue_realSpan_signedCoordinates (σ : ι → ℤ)
    (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm ι)
    (E : Submodule ℚ (ι → ℚ)) :
    SubspaceDensity.spaceValue (realSpan (E.map (signedCoordinates ℚ σ hσ p).toLinearMap)) =
      SubspaceDensity.spaceValue (realSpan E) := by
  rw [realSpan_signedCoordinates, spaceValue_signedCoordinates]

end

end Loneliness.CoordinateSubspace
