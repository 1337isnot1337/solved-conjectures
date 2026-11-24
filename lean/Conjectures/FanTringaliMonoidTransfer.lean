import Conjectures.FanTringaliMonoidNormalization

/-!
# Fan–Tringali's length-set conjecture

The length-set transfer in Fan–Tringali (2018), Theorem 3.8 and Theorem
4.11(i), proved from the injective power map and the unit normalization.
Every factor is lifted back to a finite subset of the natural numbers;
atomicity and both directions of length equality are proved explicitly.
-/

open scoped Pointwise

namespace FanTringali

variable {H : Type*} [Monoid H] [DecidableEq H]

/-- The finite-set image of the natural-number power homomorphism. -/
def powerImage (u : H) (X : Finset ℕ) : Finset H := X.image fun n => u ^ n

theorem powerImage_zero (u : H) : powerImage u 0 = 1 := by
  change ({0} : Finset ℕ).image (fun n => u ^ n) = {1}
  simp

theorem powerImage_one_mem (u : H) {X : Finset ℕ} (hX : 0 ∈ X) :
    1 ∈ powerImage u X := by
  exact Finset.mem_image.mpr ⟨0, hX, pow_zero u⟩

theorem powerImage_add (u : H) (X Y : Finset ℕ) :
    powerImage u (X + Y) = powerImage u X * powerImage u Y := by
  ext z
  constructor
  · intro hz
    obtain ⟨n, hn, rfl⟩ := Finset.mem_image.mp hz
    obtain ⟨a, ha, b, hb, rfl⟩ := Finset.mem_add.mp hn
    exact Finset.mem_mul.mpr ⟨u ^ a, Finset.mem_image.mpr ⟨a, ha, rfl⟩,
      u ^ b, Finset.mem_image.mpr ⟨b, hb, rfl⟩, (pow_add u a b).symm⟩
  · intro hz
    obtain ⟨a, ha, b, hb, rfl⟩ := Finset.mem_mul.mp hz
    obtain ⟨m, hm, rfl⟩ := Finset.mem_image.mp ha
    obtain ⟨n, hn, rfl⟩ := Finset.mem_image.mp hb
    exact Finset.mem_image.mpr ⟨m + n, Finset.add_mem_add hm hn, pow_add u m n⟩

theorem powerImage_injective {u : H} (hu : Function.Injective (fun n : ℕ => u ^ n)) :
    Function.Injective (powerImage u) := Finset.image_injective hu

theorem powerImage_eq_one_iff {u : H} (hu : Function.Injective (fun n : ℕ => u ^ n))
    {X : Finset ℕ} : powerImage u X = 1 ↔ X = 0 := by
  rw [← powerImage_zero u]
  exact (powerImage_injective hu).eq_iff

theorem powerImage_sum (u : H) (L : List (Finset ℕ)) :
    powerImage u L.sum = (L.map (powerImage u)).prod := by
  induction L with
  | nil => simpa using powerImage_zero u
  | cons A L ih => simp only [List.sum_cons, List.map_cons, List.prod_cons, powerImage_add, ih]

/-- Pull back a divisor using the finite ambient natural-number set. -/
def powerPreimage (u : H) (X : Finset ℕ) (A : Finset H) : Finset ℕ :=
  X.filter fun n => u ^ n ∈ A

theorem powerPreimage_zero_mem (u : H) {X : Finset ℕ} {A : Finset H}
    (hX : 0 ∈ X) (hA : 1 ∈ A) : 0 ∈ powerPreimage u X A := by
  simp [powerPreimage, hX, hA]

theorem powerImage_preimage (u : H) {X : Finset ℕ} {A : Finset H}
    (hA : A ⊆ powerImage u X) : powerImage u (powerPreimage u X A) = A := by
  ext x
  constructor
  · intro hx
    obtain ⟨n, hn, rfl⟩ := Finset.mem_image.mp hx
    exact (Finset.mem_filter.mp hn).2
  · intro hx
    obtain ⟨n, hn, he⟩ := Finset.mem_image.mp (hA hx)
    exact Finset.mem_image.mpr ⟨n, Finset.mem_filter.mpr ⟨hn, he.symm ▸ hx⟩, he⟩

theorem finset_isUnit_mul_unit_iff (A : Finset H) (u : Hˣ) :
    IsUnit (A * {(↑u : H)}) ↔ IsUnit A :=
  Units.isUnit_mul_units A (Units.map (Finset.singletonMonoidHom : H →* Finset H) u)

theorem finset_isUnit_unit_mul_iff (A : Finset H) (u : Hˣ) :
    IsUnit ({(↑u : H)} * A) ↔ IsUnit A :=
  Units.isUnit_units_mul (Units.map (Finset.singletonMonoidHom : H →* Finset H) u) A

section DedekindFinite

variable [IsDedekindFiniteMonoid H]

/-- The power embedding preserves and reflects the actual ordinary power-monoid atoms. -/
theorem powerAtom_powerImage_iff (u : H)
    (hu : Function.Injective (fun n : ℕ => u ^ n)) {X : Finset ℕ} (hX : 0 ∈ X) :
    PowerAtom (powerImage u X) ↔ Atom X := by
  constructor
  · rintro ⟨_, hAtom⟩
    refine ⟨hX, ?_, ?_⟩
    · intro hzero
      exact hAtom.ne_one (by rw [hzero, powerImage_zero])
    · intro B C hB hC he
      have hproduct : powerImage u X = powerImage u B * powerImage u C := by
        rw [← powerImage_add, he]
      rcases hAtom.isUnit_or_isUnit hproduct with h | h
      · exact Or.inl ((powerImage_eq_one_iff hu).mp
          (finset_unit_eq_one (powerImage_one_mem u hB) h))
      · exact Or.inr ((powerImage_eq_one_iff hu).mp
          (finset_unit_eq_one (powerImage_one_mem u hC) h))
  · intro hAtom
    have hOne := powerImage_one_mem u hX
    refine ⟨⟨1, hOne⟩, ?_, ?_⟩
    · intro hunit
      exact hAtom.2.1 ((powerImage_eq_one_iff hu).mp (finset_unit_eq_one hOne hunit))
    · intro B C he
      obtain ⟨v, hB, hC, hBC⟩ := normalize_two hOne he.symm
      let D := powerPreimage u X (B * {(↑v⁻¹ : H)})
      let E := powerPreimage u X ({(↑v : H)} * C)
      have hD : powerImage u D = B * {(↑v⁻¹ : H)} :=
        powerImage_preimage u (by rw [← hBC]; exact subset_mul_left_of_one hC)
      have hE : powerImage u E = {(↑v : H)} * C :=
        powerImage_preimage u (by rw [← hBC]; exact subset_mul_right_of_one hB)
      have hDzero : 0 ∈ D := powerPreimage_zero_mem u hX hB
      have hEzero : 0 ∈ E := powerPreimage_zero_mem u hX hC
      have hDE : D + E = X := by
        apply powerImage_injective hu
        rw [powerImage_add, hD, hE, hBC]
      rcases hAtom.2.2 D E hDzero hEzero hDE with h | h
      · apply Or.inl
        apply (finset_isUnit_mul_unit_iff B v⁻¹).mp
        rw [← hD, h, powerImage_zero]
        exact isUnit_one
      · apply Or.inr
        apply (finset_isUnit_unit_mul_iff C v).mp
        rw [← hE, h, powerImage_zero]
        exact isUnit_one

/-- Theorem 3.8: equality of the literal length sets, with normalization discharged. -/
theorem powerLengths_powerImage (u : H)
    (hu : Function.Injective (fun n : ℕ => u ^ n)) {X : Finset ℕ} (hX : 0 ∈ X) :
    PowerLengths (powerImage u X) = Lengths X := by
  ext n
  constructor
  · intro hn
    obtain ⟨L, hL, hOne, hprod, hlen⟩ :=
      normalize_factorization (powerImage_one_mem u hX) hn
    let K := L.map (powerPreimage u X)
    have hSub : ∀ A ∈ L, A ⊆ powerImage u X := by
      intro A hA
      rw [← hprod]
      exact factor_subset_list_prod hOne hA
    have hImage : ∀ A ∈ L, powerImage u (powerPreimage u X A) = A :=
      fun A hA => powerImage_preimage u (hSub A hA)
    have hZero : ∀ A ∈ L, 0 ∈ powerPreimage u X A :=
      fun A hA => powerPreimage_zero_mem u hX (hOne A hA)
    refine ⟨K, ?_, ?_, by simpa [K] using hlen⟩
    · intro D hD
      obtain ⟨A, hA, rfl⟩ := List.mem_map.mp hD
      apply (powerAtom_powerImage_iff u hu (hZero A hA)).mp
      rw [hImage A hA]
      exact hL A hA
    · apply powerImage_injective hu
      rw [powerImage_sum]
      have hm : K.map (powerImage u) = L := by
        dsimp [K]
        rw [List.map_map]
        have hm' : L.map (fun A => powerImage u (powerPreimage u X A)) = L.map id := by
          apply List.map_congr_left
          intro A hA
          exact hImage A hA
        simpa only [Function.comp_def, List.map_id] using hm'
      rw [hm, hprod]
  · rintro ⟨L, hL, hsum, hlen⟩
    refine ⟨L.map (powerImage u), ?_, ?_, by simpa using hlen⟩
    · intro A hA
      obtain ⟨B, hB, rfl⟩ := List.mem_map.mp hA
      exact (powerAtom_powerImage_iff u hu (hL B hB).1).mpr (hL B hB)
    · rw [← powerImage_sum, hsum]

/-- The same element realizes the same set in the restricted power monoid. -/
theorem restrictedLengths_powerImage (u : H)
    (hu : Function.Injective (fun n : ℕ => u ^ n)) {X : Finset ℕ} (hX : 0 ∈ X) :
    RestrictedLengths (powerImage u X) = Lengths X := by
  rw [restrictedLengths_eq_powerLengths
    ⟨1, powerImage_one_mem u hX, isUnit_one⟩, powerLengths_powerImage u hu hX]

end DedekindFinite
end FanTringali
