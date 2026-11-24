import Conjectures.FanTringaliCoordinates
import Conjectures.FanTringaliSlices
import Mathlib.Data.Fintype.Option

/-!
# Fan–Tringali's power-monoid length-set conjecture: marked slices

The graph construction uses one height coordinate, one marker coordinate, and
an arbitrary finite collection of ordinary coordinates. Divisibility by a low
box can be tested independently on every marked upper slice.
-/

open scoped Pointwise

namespace FanTringali

abbrev Marked (ι : Type*) := Option (Option ι)

def lift {ι : Type*} (h m : ℕ) (x : ι → ℕ) : Marked ι → ℕ
  | none => h
  | some none => m
  | some (some i) => x i

def readOrdinary {ι : Type*} (x : Marked ι → ℕ) : ι → ℕ := fun i => x (some (some i))

@[simp] theorem lift_height {ι : Type*} (h m : ℕ) (x : ι → ℕ) : lift h m x none = h := rfl
@[simp] theorem lift_marker {ι : Type*} (h m : ℕ) (x : ι → ℕ) :
    lift h m x (some none) = m := rfl
@[simp] theorem lift_ordinary {ι : Type*} (h m : ℕ) (x : ι → ℕ) (i : ι) :
    lift h m x (some (some i)) = x i := rfl
@[simp] theorem read_lift {ι : Type*} (h m : ℕ) (x : ι → ℕ) :
    readOrdinary (lift h m x) = x := rfl

theorem lift_read {ι : Type*} (x : Marked ι → ℕ) :
    lift (x none) (x (some none)) (readOrdinary x) = x := by
  funext i
  cases i with
  | none => rfl
  | some i => cases i <;> rfl

theorem lift_injective {ι : Type*} (h m : ℕ) : Function.Injective (lift (ι := ι) h m) :=
  fun _ _ hxy => congrArg readOrdinary hxy

@[simp] theorem lift_add {ι : Type*} (h m h' m' : ℕ) (x y : ι → ℕ) :
    lift h m x + lift h' m' y = lift (h+h') (m+m') (x+y) := by
  funext i
  cases i with
  | none => rfl
  | some i => cases i <;> rfl

@[simp] theorem lift_zero {ι : Type*} : lift (ι := ι) 0 0 0 = 0 := by
  funext i
  cases i with
  | none => rfl
  | some i => cases i <;> rfl

/-- Adjoin two zero coordinates. -/
def low {ι : Type*} : (ι → ℕ) →+ (Marked ι → ℕ) where
  toFun := lift 0 0
  map_zero' := lift_zero
  map_add' x y := (lift_add 0 0 0 0 x y).symm

section MarkedFinsets

variable {ι : Type*} [Fintype ι]

def row (h m : ℕ) (A : Finset (Marked ι → ℕ)) : Finset (ι → ℕ) :=
  (A.filter fun x => x none = h ∧ x (some none) = m).image readOrdinary

@[simp] theorem mem_row {h m : ℕ} {A : Finset (Marked ι → ℕ)} {x : ι → ℕ} :
    x ∈ row h m A ↔ lift h m x ∈ A := by
  simp only [row, Finset.mem_image, Finset.mem_filter]
  constructor
  · rintro ⟨y, ⟨hy, hyh, hym⟩, hyx⟩
    have heq : lift h m x = y := by rw [← hyx, ← hyh, ← hym]; exact lift_read y
    exact heq ▸ hy
  · intro hx
    exact ⟨lift h m x, ⟨hx, rfl, rfl⟩, rfl⟩

theorem ext_rows {A B : Finset (Marked ι → ℕ)}
    (hrows : ∀ h m, row h m A = row h m B) : A = B := by
  ext x
  have hh := congrArg (fun C => readOrdinary x ∈ C) (hrows (x none) (x (some none)))
  exact eq_iff_iff.mp (by simpa only [mem_row, lift_read] using hh)

theorem row_add_low (h m : ℕ) (A : Finset (Marked ι → ℕ)) (T : Finset (ι → ℕ)) :
    row h m (A + T.image low) = row h m A + T := by
  ext x
  constructor
  · intro hx
    obtain ⟨a, ha, t, ht, heq⟩ := Finset.mem_add.mp (mem_row.mp hx)
    obtain ⟨y, hy, rfl⟩ := Finset.mem_image.mp ht
    have hah : a none = h := by simpa [low] using congrFun heq none
    have ham : a (some none) = m := by simpa [low] using congrFun heq (some none)
    refine Finset.mem_add.mpr ⟨readOrdinary a, mem_row.mpr ?_, y, hy, ?_⟩
    · rw [← hah, ← ham, lift_read]
      exact ha
    · exact congrArg readOrdinary heq
  · intro hx
    obtain ⟨a, ha, t, ht, rfl⟩ := Finset.mem_add.mp hx
    apply mem_row.mpr
    refine Finset.mem_add.mpr ⟨lift h m a, mem_row.mp ha, low t,
      Finset.mem_image.mpr ⟨t, ht, rfl⟩, ?_⟩
    simp only [low, AddMonoidHom.coe_mk, ZeroHom.coe_mk, lift_add, add_zero]

/-- A bottom row and finitely many separately marked upper rows. -/
def stack (B : Finset (ι → ℕ)) (S : Finset ℕ) (F : ℕ → Finset (ι → ℕ)) :
    Finset (Marked ι → ℕ) :=
  B.image low ∪ S.biUnion (fun m => (F m).image (lift 1 m))

@[simp] theorem mem_stack {B : Finset (ι → ℕ)} {S : Finset ℕ}
    {F : ℕ → Finset (ι → ℕ)} {x : Marked ι → ℕ} :
    x ∈ stack B S F ↔
      (x none = 0 ∧ x (some none) = 0 ∧ readOrdinary x ∈ B) ∨
      (x none = 1 ∧ x (some none) ∈ S ∧ readOrdinary x ∈ F (x (some none))) := by
  simp only [stack, Finset.mem_union, Finset.mem_image, Finset.mem_biUnion]
  constructor
  · rintro (⟨y, hy, rfl⟩ | ⟨m, hm, y, hy, rfl⟩)
    · exact Or.inl ⟨rfl, rfl, hy⟩
    · exact Or.inr ⟨rfl, hm, hy⟩
  · rintro (⟨hh, hm, hx⟩ | ⟨hh, hm, hx⟩)
    · left
      refine ⟨readOrdinary x, hx, ?_⟩
      change lift 0 0 (readOrdinary x) = x
      simpa only [hh, hm] using lift_read x
    · right
      refine ⟨x (some none), hm, readOrdinary x, hx, ?_⟩
      rw [← hh, lift_read]

theorem row_stack_bottom (B : Finset (ι → ℕ)) (S : Finset ℕ)
    (F : ℕ → Finset (ι → ℕ)) : row 0 0 (stack B S F) = B := by
  ext x
  simp

theorem row_stack_upper (B : Finset (ι → ℕ)) (S : Finset ℕ)
    (F : ℕ → Finset (ι → ℕ)) {m : ℕ} (hm : m ∈ S) :
    row 1 m (stack B S F) = F m := by
  ext x
  simp [hm]

theorem row_stack_other (B : Finset (ι → ℕ)) (S : Finset ℕ)
    (F : ℕ → Finset (ι → ℕ)) {h m : ℕ} (hBottom : ¬(h=0 ∧ m=0))
    (hUpper : ¬(h=1 ∧ m∈S)) : row h m (stack B S F) = ∅ := by
  ext x
  simp only [mem_row, mem_stack, lift_height, lift_marker, read_lift, Finset.notMem_empty,
    iff_false]
  rintro (⟨hh, hm, _⟩ | ⟨hh, hm, _⟩)
  · exact hBottom ⟨hh, hm⟩
  · exact hUpper ⟨hh, hm⟩

/-- Unique quotients on individual rows assemble into a unique quotient of the
whole marked construction. -/
theorem uniqueQuotient_stack {B T QB : Finset (ι → ℕ)} {S : Finset ℕ}
    {F Q : ℕ → Finset (ι → ℕ)} (hB : UniqueQuotient B T QB)
    (hF : ∀ m ∈ S, UniqueQuotient (F m) T (Q m)) (hT : 0 ∈ T) :
    UniqueQuotient (stack B S F) (T.image low) (stack QB S Q) := by
  have hRows : ∀ h m, row h m (stack QB S Q) + T = row h m (stack B S F) := by
    intro h m
    by_cases hBottom : h=0 ∧ m=0
    · obtain ⟨rfl, rfl⟩ := hBottom
      rw [row_stack_bottom, row_stack_bottom]
      exact hB.sum_eq
    · by_cases hUpper : h=1 ∧ m∈S
      · obtain ⟨rfl, hm⟩ := hUpper
        rw [row_stack_upper _ _ _ hm, row_stack_upper _ _ _ hm]
        exact (hF m hm).sum_eq
      · rw [row_stack_other _ _ _ hBottom hUpper,
          row_stack_other _ _ _ hBottom hUpper, Finset.empty_add]
  constructor
  · apply ext_rows
    intro h m
    rw [row_add_low]
    exact hRows h m
  · intro D hD
    apply ext_rows
    intro h m
    have hh : row h m D + T = row h m (stack B S F) := by
      rw [← row_add_low, hD]
    by_cases hBottom : h=0 ∧ m=0
    · obtain ⟨rfl, rfl⟩ := hBottom
      rw [row_stack_bottom] at hh ⊢
      exact hB.unique _ hh
    · by_cases hUpper : h=1 ∧ m∈S
      · obtain ⟨rfl, hm⟩ := hUpper
        rw [row_stack_upper _ _ _ hm] at hh ⊢
        exact (hF m hm).unique _ hh
      · rw [row_stack_other _ _ _ hBottom hUpper] at hh ⊢
        apply Finset.eq_empty_iff_forall_notMem.mpr
        intro x hx
        have hx' := left_subset_sum (A := row h m D) (B := T) hT hx
        rw [hh] at hx'
        exact Finset.notMem_empty x hx'

variable [DecidableEq ι]

def markedAxes (J : Finset ι) : Finset (Marked ι) := J.image (fun i => some (some i))

omit [Fintype ι] in
@[simp] theorem mem_markedAxes {J : Finset ι} {i : ι} :
    some (some i) ∈ markedAxes J ↔ i ∈ J := by simp [markedAxes]

omit [Fintype ι] in
@[simp] theorem height_not_mem_markedAxes (J : Finset ι) : none ∉ markedAxes J := by
  simp [markedAxes]

omit [Fintype ι] in
@[simp] theorem marker_not_mem_markedAxes (J : Finset ι) : some none ∉ markedAxes J := by
  simp [markedAxes]

theorem image_box_low (J : Finset ι) : (box J).image low = box (markedAxes J) := by
  ext x
  constructor
  · intro hx
    obtain ⟨y, hy, rfl⟩ := Finset.mem_image.mp hx
    obtain ⟨hy₁, hy₀⟩ := mem_box.mp hy
    apply mem_box.mpr
    constructor
    · intro i
      cases i with
      | none => exact Nat.zero_le _
      | some i => cases i with
        | none => exact Nat.zero_le _
        | some i => exact hy₁ i
    · intro i hi
      cases i with
      | none => rfl
      | some i => cases i with
        | none => rfl
        | some i => exact hy₀ i (by simpa using hi)
  · intro hx
    obtain ⟨hx₁, hx₀⟩ := mem_box.mp hx
    refine Finset.mem_image.mpr ⟨readOrdinary x, ?_, ?_⟩
    · apply mem_box.mpr
      exact ⟨fun i => hx₁ (some (some i)),
        fun i hi => hx₀ (some (some i)) (by simpa using hi)⟩
    · change lift 0 0 (readOrdinary x) = x
      simpa only [hx₀ none (height_not_mem_markedAxes J),
        hx₀ (some none) (marker_not_mem_markedAxes J)] using lift_read x

theorem layered_stack {U : Finset ι} {S : Finset ℕ} {F : ℕ → Finset (ι → ℕ)}
    (hHigh : ∃ m ∈ S, (F m).Nonempty) :
    Layered none (markedAxes U) (stack (box U) S F) := by
  constructor
  · apply mem_stack.mpr
    exact Or.inl ⟨rfl, rfl, zero_mem_box U⟩
  · intro x hx
    rcases mem_stack.mp hx with ⟨hh, _, _⟩ | ⟨hh, _, _⟩ <;> omega
  · obtain ⟨m, hm, x, hx⟩ := hHigh
    refine ⟨lift 1 m x, mem_stack.mpr (Or.inr ⟨rfl, hm, hx⟩), rfl⟩
  · rw [← image_box_low]
    ext x
    simp only [mem_slice, mem_stack]
    constructor
    · rintro ⟨(⟨hh, hm, hx⟩ | ⟨hh, _, _⟩), hx₀⟩
      · refine Finset.mem_image.mpr ⟨readOrdinary x, hx, ?_⟩
        change lift 0 0 (readOrdinary x) = x
        simpa only [hh, hm] using lift_read x
      · omega
    · intro hx
      obtain ⟨y, hy, rfl⟩ := Finset.mem_image.mp hx
      exact ⟨Or.inl ⟨rfl, rfl, hy⟩, rfl⟩

end MarkedFinsets

end FanTringali
