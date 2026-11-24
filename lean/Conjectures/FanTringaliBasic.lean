import Mathlib.Algebra.Group.Pointwise.Finset.Basic
import Mathlib.Algebra.Group.Pi.Basic
import Mathlib.Data.Fintype.Pi
import Mathlib.Algebra.BigOperators.Group.List.Basic
import Mathlib.Tactic.SplitIfs
import Lean.Elab.Tactic.Omega

/-!
# Fan–Tringali's power-monoid length-set conjecture: finite-set foundations

This file follows the Boolean-box argument in
`results/fan-tringali-power-monoid-lengths/PROOF.md`, Sections 1–2.
The conjecture is due to Yushuang Fan and Salvatore Tringali, *Power monoids:
A bridge between factorization theory and arithmetic combinatorics* (2018), §5.
These foundational lemmas alone do not establish the conjecture.

`Atom` is the literal atom predicate for the reduced finitary additive power
monoid: its elements are finite sets containing zero, and its operation is the
pointwise sumset. `Lengths` counts finite lists of such atoms.
-/

open scoped Pointwise

namespace FanTringali

set_option maxHeartbeats 2000000

section Reduced

variable {α : Type*} [DecidableEq α] [AddMonoid α]

/-- An atom of the reduced finitary additive power monoid. -/
def Atom (A : Finset α) : Prop :=
  0 ∈ A ∧ A ≠ 0 ∧
    ∀ B C : Finset α, 0 ∈ B → 0 ∈ C → B + C = A → B = 0 ∨ C = 0

/-- All lengths of atomic factorizations, using the actual finite-set sum. -/
def Lengths (A : Finset α) : Set ℕ :=
  {n | ∃ L : List (Finset α), (∀ B ∈ L, Atom B) ∧ L.sum = A ∧ L.length = n}

theorem left_subset_sum {A B : Finset α} (hB : 0 ∈ B) : A ⊆ A + B := by
  intro x hx
  exact Finset.mem_add.mpr ⟨x, hx, 0, hB, add_zero x⟩

theorem right_subset_sum {A B : Finset α} (hA : 0 ∈ A) : B ⊆ A + B := by
  intro x hx
  exact Finset.mem_add.mpr ⟨0, hA, x, hx, zero_add x⟩

theorem zero_mem_sum {A B : Finset α} (hA : 0 ∈ A) (hB : 0 ∈ B) :
    0 ∈ A + B := by
  simpa using Finset.add_mem_add hA hB

theorem zero_mem_list_sum {L : List (Finset α)} (hL : ∀ A ∈ L, 0 ∈ A) :
    0 ∈ L.sum := by
  induction L with
  | nil => simp
  | cons A L ih =>
    simp only [List.sum_cons]
    exact zero_mem_sum (hL A (by simp)) (ih fun B hB => hL B (by simp [hB]))

end Reduced

section Boxes

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- The Boolean box on the axes in `J`, with every other coordinate zero. -/
def box (J : Finset ι) : Finset (ι → ℕ) :=
  Fintype.piFinset fun i => if i ∈ J then {0, 1} else {0}

theorem mem_box {J : Finset ι} {x : ι → ℕ} :
    x ∈ box J ↔ (∀ i, x i ≤ 1) ∧ (∀ i, i ∉ J → x i = 0) := by
  simp only [box, Fintype.mem_piFinset]
  constructor
  · intro h
    constructor
    · intro i
      have hi := h i
      split_ifs at hi with hij
      · simp only [Finset.mem_insert, Finset.mem_singleton] at hi
        omega
      · have hxi : x i = 0 := Finset.mem_singleton.mp hi
        omega
    · intro i hi
      simpa [hi] using h i
  · rintro ⟨h₁, h₀⟩ i
    split_ifs with hi
    · simp only [Finset.mem_insert, Finset.mem_singleton]
      have := h₁ i
      omega
    · simpa only [Finset.mem_singleton] using h₀ i hi

theorem zero_mem_box (J : Finset ι) : 0 ∈ box J :=
  mem_box.mpr ⟨fun _ => by simp, fun _ _ => rfl⟩

@[simp] theorem box_empty : box (∅ : Finset ι) = 0 := by
  ext x
  constructor
  · intro hx
    apply Finset.mem_zero.mpr
    funext i
    exact (mem_box.mp hx).2 i (by simp)
  · intro hx
    have hx₀ := Finset.mem_zero.mp hx
    simpa only [hx₀] using zero_mem_box (∅ : Finset ι)

theorem box_mono {J K : Finset ι} (hJK : J ⊆ K) : box J ⊆ box K := by
  intro x hx
  obtain ⟨h₁, h₀⟩ := mem_box.mp hx
  exact mem_box.mpr ⟨h₁, fun i hi => h₀ i (fun hij => hi (hJK hij))⟩

/-- The coordinate unit vector. -/
def axis (i : ι) : ι → ℕ := fun j => if j = i then 1 else 0

omit [Fintype ι] in
@[simp] theorem axis_self (i : ι) : axis i i = 1 := by simp [axis]

omit [Fintype ι] in
@[simp] theorem axis_other {i j : ι} (h : j ≠ i) : axis i j = 0 := by
  simp [axis, h]

theorem axis_mem_box {i : ι} {J : Finset ι} (hi : i ∈ J) : axis i ∈ box J := by
  apply mem_box.mpr
  constructor
  · intro j
    simp only [axis]
    split_ifs <;> omega
  · intro j hj
    exact axis_other (fun hji => hj (hji.symm ▸ hi))

theorem box_injective : Function.Injective (box (ι := ι)) := by
  intro J K h
  apply Finset.Subset.antisymm
  · intro i hi
    have hx : axis i ∈ box K := h ▸ axis_mem_box hi
    by_contra hni
    have := (mem_box.mp hx).2 i hni
    simp at this
  · intro i hi
    have hx : axis i ∈ box J := h.symm ▸ axis_mem_box hi
    by_contra hni
    have := (mem_box.mp hx).2 i hni
    simp at this

@[simp] theorem box_eq_zero {J : Finset ι} : box J = 0 ↔ J = ∅ := by
  rw [← box_empty]
  exact box_injective.eq_iff

theorem box_add {J K : Finset ι} (hJK : Disjoint J K) :
    box J + box K = box (J ∪ K) := by
  ext z
  constructor
  · intro hz
    obtain ⟨x, hx, y, hy, rfl⟩ := Finset.mem_add.mp hz
    obtain ⟨hx₁, hx₀⟩ := mem_box.mp hx
    obtain ⟨hy₁, hy₀⟩ := mem_box.mp hy
    apply mem_box.mpr
    constructor
    · intro i
      change x i + y i ≤ 1
      by_cases hi : i ∈ J
      · have hyi := hy₀ i (Finset.disjoint_left.mp hJK hi)
        have hxi := hx₁ i
        omega
      · have hxi := hx₀ i hi
        have hyi := hy₁ i
        omega
    · intro i hi
      have hiJ : i ∉ J := fun h => hi (Finset.mem_union_left K h)
      have hiK : i ∉ K := fun h => hi (Finset.mem_union_right J h)
      change x i + y i = 0
      rw [hx₀ i hiJ, hy₀ i hiK, add_zero]
  · intro hz
    obtain ⟨hz₁, hz₀⟩ := mem_box.mp hz
    let x : ι → ℕ := fun i => if i ∈ J then z i else 0
    let y : ι → ℕ := fun i => if i ∈ J then 0 else z i
    have hx : x ∈ box J := by
      apply mem_box.mpr
      constructor
      · intro i
        dsimp [x]
        split_ifs <;> first | exact hz₁ i | omega
      · intro i hi
        simp [x, hi]
    have hy : y ∈ box K := by
      apply mem_box.mpr
      constructor
      · intro i
        dsimp [y]
        split_ifs <;> first | exact hz₁ i | omega
      · intro i hiK
        dsimp [y]
        split_ifs with hiJ
        · rfl
        · exact hz₀ i (by simp [hiJ, hiK])
    refine Finset.mem_add.mpr ⟨x, hx, y, hy, ?_⟩
    funext i
    dsimp [x, y]
    split_ifs <;> simp

theorem box_singleton (i : ι) : box {i} = {0, axis i} := by
  ext x
  constructor
  · intro hx
    obtain ⟨hx₁, hx₀⟩ := mem_box.mp hx
    have hxi := hx₁ i
    have hcases : x i = 0 ∨ x i = 1 := by omega
    rcases hcases with hi | hi
    · simp only [Finset.mem_insert, Finset.mem_singleton]
      left
      funext j
      by_cases hji : j = i
      · simpa [hji] using hi
      · exact hx₀ j (by simpa)
    · simp only [Finset.mem_insert, Finset.mem_singleton]
      right
      funext j
      by_cases hji : j = i
      · simpa [hji] using hi
      · rw [axis_other hji]
        exact hx₀ j (by simpa)
  · intro hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact zero_mem_box _
    · exact axis_mem_box (by simp)

/-- Every reduced factor of a Boolean box is itself a coordinate box.
The other factor occupies exactly the complementary axes. -/
theorem factors_of_box {A B : Finset (ι → ℕ)} {U : Finset ι}
    (hA : 0 ∈ A) (hB : 0 ∈ B) (hAB : A + B = box U) :
    ∃ J : Finset ι, J ⊆ U ∧ A = box J ∧ B = box (U \ J) := by
  let J : Finset ι := Finset.univ.filter fun i => ∃ x ∈ A, x i = 1
  have hJA : ∀ i, i ∈ J ↔ ∃ x ∈ A, x i = 1 := by
    intro i
    simp only [J, Finset.mem_filter, Finset.mem_univ, true_and]
  have hAsub : A ⊆ box U := by
    rw [← hAB]
    exact left_subset_sum (A := A) (B := B) hB
  have hBsub : B ⊆ box U := by
    rw [← hAB]
    exact right_subset_sum (A := A) (B := B) hA
  have hJU : J ⊆ U := by
    intro i hi
    obtain ⟨x, hx, hxi⟩ := (hJA i).mp hi
    by_contra hni
    have := (mem_box.mp (hAsub hx)).2 i hni
    omega
  have hAoff : ∀ x ∈ A, ∀ i, i ∉ J → x i = 0 := by
    intro x hx i hi
    have hx₁ := (mem_box.mp (hAsub hx)).1 i
    have hxne : x i ≠ 1 := fun heq => hi ((hJA i).mpr ⟨x, hx, heq⟩)
    omega
  have hBon : ∀ y ∈ B, ∀ i ∈ J, y i = 0 := by
    intro y hy i hi
    obtain ⟨x, hx, hxi⟩ := (hJA i).mp hi
    have hxy : x + y ∈ box U := by
      rw [← hAB]
      exact Finset.add_mem_add hx hy
    have hle := (mem_box.mp hxy).1 i
    change x i + y i ≤ 1 at hle
    omega
  have hAe : A = box J := by
    apply Finset.Subset.antisymm
    · intro x hx
      exact mem_box.mpr ⟨(mem_box.mp (hAsub hx)).1, hAoff x hx⟩
    · intro z hz
      have hzU := box_mono hJU hz
      rw [← hAB] at hzU
      obtain ⟨x, hx, y, hy, hxy⟩ := Finset.mem_add.mp hzU
      have hxz : x = z := by
        funext i
        have heq := congrFun hxy i
        change x i + y i = z i at heq
        by_cases hi : i ∈ J
        · have := hBon y hy i hi
          omega
        · have hx₀ := hAoff x hx i hi
          have hz₀ := (mem_box.mp hz).2 i hi
          omega
      simpa only [hxz] using hx
  have hBe : B = box (U \ J) := by
    apply Finset.Subset.antisymm
    · intro y hy
      refine mem_box.mpr ⟨(mem_box.mp (hBsub hy)).1, ?_⟩
      intro i hi
      by_cases hiU : i ∈ U
      · have hiJ : i ∈ J := by simpa [Finset.mem_sdiff, hiU] using hi
        exact hBon y hy i hiJ
      · exact (mem_box.mp (hBsub hy)).2 i hiU
    · intro z hz
      have hzU := box_mono (Finset.sdiff_subset : U \ J ⊆ U) hz
      rw [← hAB] at hzU
      obtain ⟨x, hx, y, hy, hxy⟩ := Finset.mem_add.mp hzU
      have hyz : y = z := by
        funext i
        have heq := congrFun hxy i
        change x i + y i = z i at heq
        by_cases hi : i ∈ J
        · have hz₀ := (mem_box.mp hz).2 i (by simp [hi])
          omega
        · have hx₀ := hAoff x hx i hi
          omega
      simpa only [hyz] using hy
  exact ⟨J, hJU, hAe, hBe⟩

theorem atom_box_singleton (i : ι) : Atom (box {i}) := by
  refine ⟨zero_mem_box _, by simp, ?_⟩
  intro A B hA hB hAB
  obtain ⟨J, hJ, rfl, rfl⟩ := factors_of_box hA hB hAB
  rcases Finset.subset_singleton_iff.mp hJ with rfl | rfl
  · exact Or.inl box_empty
  · exact Or.inr (by simp)

theorem atom_box_iff_singleton {J : Finset ι} :
    Atom (box J) ↔ ∃ i, J = {i} := by
  constructor
  · intro hJ
    have hne : J.Nonempty := Finset.nonempty_iff_ne_empty.mpr (fun h => hJ.2.1 (by simp [h]))
    obtain ⟨i, hi⟩ := hne
    have hsum : box {i} + box (J.erase i) = box J := by
      rw [box_add (by simp)]
      rw [Finset.singleton_union, Finset.insert_erase hi]
    have hsplit := hJ.2.2 (box {i}) (box (J.erase i)) (zero_mem_box _) (zero_mem_box _) hsum
    rcases hsplit with himpossible | herase
    · simp at himpossible
    · have he := box_eq_zero.mp herase
      refine ⟨i, ?_⟩
      rw [← Finset.insert_erase hi, he, Finset.insert_empty]
  · rintro ⟨i, rfl⟩
    exact atom_box_singleton i

theorem atomic_factorization_box_length {L : List (Finset (ι → ℕ))} {U : Finset ι}
    (hL : ∀ A ∈ L, Atom A) (hSum : L.sum = box U) : L.length = U.card := by
  induction L generalizing U with
  | nil =>
    have hU : U = ∅ := box_eq_zero.mp (by simpa using hSum.symm)
    simp [hU]
  | cons A L ih =>
    have hA := hL A (by simp)
    have hTail : ∀ B ∈ L, Atom B := fun B hB => hL B (by simp [hB])
    have hB := zero_mem_list_sum (fun B hB => (hTail B hB).1)
    have hAB : A + L.sum = box U := by simpa only [List.sum_cons] using hSum
    obtain ⟨J, hJU, hAJ, hBJ⟩ := factors_of_box hA.1 hB hAB
    obtain ⟨i, hJi⟩ := atom_box_iff_singleton.mp (hAJ ▸ hA)
    have hi : i ∈ U := hJU (by simp [hJi])
    have hlen := ih hTail hBJ
    rw [hJi, Finset.sdiff_singleton_eq_erase] at hlen
    simpa [List.length_cons, hlen] using Finset.card_erase_add_one hi

end Boxes

end FanTringali
