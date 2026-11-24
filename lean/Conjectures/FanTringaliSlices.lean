import Conjectures.FanTringaliBasic

/-!
# Fan–Tringali's power-monoid length-set conjecture: height slices

These are the height-zero and height-one arguments in Section 2 of the
repository proof. The statements quantify over arbitrary finite coordinate
sets and arbitrary finite subsets of the nonnegative integer lattice.
-/

open scoped Pointwise

namespace FanTringali

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- The slice at coordinate `h` equal to `n`. -/
def slice (h : ι) (n : ℕ) (X : Finset (ι → ℕ)) : Finset (ι → ℕ) :=
  X.filter fun x => x h = n

omit [Fintype ι] [DecidableEq ι] in
@[simp] theorem mem_slice {h : ι} {n : ℕ} {X : Finset (ι → ℕ)} {x : ι → ℕ} :
    x ∈ slice h n X ↔ x ∈ X ∧ x h = n := Finset.mem_filter

omit [Fintype ι] [DecidableEq ι] in
theorem zero_mem_slice {h : ι} {X : Finset (ι → ℕ)} (hX : 0 ∈ X) :
    0 ∈ slice h 0 X := mem_slice.mpr ⟨hX, rfl⟩

omit [Fintype ι] [DecidableEq ι] in
theorem slice_of_all {h : ι} {n : ℕ} {X : Finset (ι → ℕ)}
    (hX : ∀ x ∈ X, x h = n) : slice h n X = X :=
  Finset.filter_eq_self.mpr hX

omit [DecidableEq ι] in
theorem slice_zero_add (h : ι) (A B : Finset (ι → ℕ)) :
    slice h 0 (A + B) = slice h 0 A + slice h 0 B := by
  ext z
  constructor
  · intro hz
    obtain ⟨hz, hz₀⟩ := mem_slice.mp hz
    obtain ⟨x, hx, y, hy, rfl⟩ := Finset.mem_add.mp hz
    change x h + y h = 0 at hz₀
    refine Finset.mem_add.mpr ⟨x, mem_slice.mpr ⟨hx, by omega⟩,
      y, mem_slice.mpr ⟨hy, by omega⟩, rfl⟩
  · intro hz
    obtain ⟨x, hx, y, hy, rfl⟩ := Finset.mem_add.mp hz
    obtain ⟨hx, hx₀⟩ := mem_slice.mp hx
    obtain ⟨hy, hy₀⟩ := mem_slice.mp hy
    apply mem_slice.mpr
    refine ⟨Finset.add_mem_add hx hy, ?_⟩
    change x h + y h = 0
    omega

omit [DecidableEq ι] in
theorem slice_add_low (h : ι) (n : ℕ) (A B : Finset (ι → ℕ))
    (hA : ∀ x ∈ A, x h = 0) :
    slice h n (A + B) = A + slice h n B := by
  ext z
  constructor
  · intro hz
    obtain ⟨hz, hzₙ⟩ := mem_slice.mp hz
    obtain ⟨x, hx, y, hy, rfl⟩ := Finset.mem_add.mp hz
    have hx₀ := hA x hx
    change x h + y h = n at hzₙ
    exact Finset.mem_add.mpr ⟨x, hx, y, mem_slice.mpr ⟨hy, by omega⟩, rfl⟩
  · intro hz
    obtain ⟨x, hx, y, hy, rfl⟩ := Finset.mem_add.mp hz
    obtain ⟨hy, hyₙ⟩ := mem_slice.mp hy
    refine mem_slice.mpr ⟨Finset.add_mem_add hx hy, ?_⟩
    change x h + y h = n
    rw [hA x hx, zero_add, hyₙ]

/-- The geometric hypotheses used in the height-one graph construction. -/
structure Layered (h : ι) (U : Finset ι) (X : Finset (ι → ℕ)) : Prop where
  zero_mem : 0 ∈ X
  height_le : ∀ x ∈ X, x h ≤ 1
  high : ∃ x ∈ X, x h = 1
  bottom : slice h 0 X = box U

theorem Layered.nonzero {h : ι} {U : Finset ι} {X : Finset (ι → ℕ)}
    (hX : Layered h U X) : X ≠ 0 := by
  intro hzero
  obtain ⟨x, hx, hxh⟩ := hX.high
  have hx₀ : x = 0 := by simpa only [hzero, Finset.mem_zero] using hx
  have : (0 : ℕ) = 1 := by simpa only [hx₀, Pi.zero_apply] using hxh
  omega

theorem Layered.height_notMem {h : ι} {U : Finset ι} {X : Finset (ι → ℕ)}
    (hX : Layered h U X) : h ∉ U := by
  intro hh
  have he := axis_mem_box hh
  rw [← hX.bottom] at he
  have := (mem_slice.mp he).2
  simp at this

theorem layered_factor_low {h : ι} {U : Finset ι} {X A B : Finset (ι → ℕ)}
    (hX : Layered h U X) (hA : 0 ∈ A) (hB : 0 ∈ B) (hAB : A + B = X)
    (hLow : ∀ a ∈ A, a h = 0) :
    ∃ J : Finset ι, J ⊆ U ∧ A = box J ∧ Layered h (U \ J) B := by
  have hBottom : A + slice h 0 B = box U := by
    rw [← slice_add_low h 0 A B hLow, hAB, hX.bottom]
  obtain ⟨J, hJU, hAJ, hBJ⟩ := factors_of_box hA (zero_mem_slice hB) hBottom
  refine ⟨J, hJU, hAJ, hB, ?_, ?_, hBJ⟩
  · intro b hb
    apply hX.height_le b
    rw [← hAB]
    exact right_subset_sum (A := A) (B := B) hA hb
  · obtain ⟨z, hz, hzh⟩ := hX.high
    rw [← hAB] at hz
    obtain ⟨a, ha, b, hb, rfl⟩ := Finset.mem_add.mp hz
    have hah := hLow a ha
    change a h + b h = 1 at hzh
    exact ⟨b, hb, by omega⟩

/-- In a reduced binary factorization of a height-one set, precisely one factor
can have positive height; the other is a Boolean box. -/
theorem layered_factor {h : ι} {U : Finset ι} {X A B : Finset (ι → ℕ)}
    (hX : Layered h U X) (hA : 0 ∈ A) (hB : 0 ∈ B) (hAB : A + B = X) :
    (∃ J : Finset ι, J ⊆ U ∧ A = box J ∧ Layered h (U \ J) B) ∨
    (∃ J : Finset ι, J ⊆ U ∧ B = box J ∧ Layered h (U \ J) A) := by
  by_cases hLow : ∀ a ∈ A, a h = 0
  · exact Or.inl (layered_factor_low hX hA hB hAB hLow)
  · right
    simp only [not_forall] at hLow
    obtain ⟨a, ha, hah⟩ := hLow
    have hLowB : ∀ b ∈ B, b h = 0 := by
      intro b hb
      have hab : a + b ∈ X := by
        rw [← hAB]
        exact Finset.add_mem_add ha hb
      have hbound := hX.height_le _ hab
      change a h + b h ≤ 1 at hbound
      omega
    exact layered_factor_low hX hB hA (by simpa only [add_comm B A] using hAB) hLowB

end FanTringali
