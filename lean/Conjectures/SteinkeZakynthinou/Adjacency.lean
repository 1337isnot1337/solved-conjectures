module

public import Conjectures.SteinkeZakynthinou.Inclusion

/-! The two choices at a row embed in their common augmented sample. -/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

abbrev Slot (n : ℕ) := Fin n × Bool

def slotTag {n : ℕ} (x : Slot n) : ℕ := 2 * x.1.val + x.2.toNat

theorem slotTag_injective {n : ℕ} : Function.Injective (slotTag (n := n)) := by
  rintro ⟨i,b⟩ ⟨j,c⟩ h
  cases b <;> cases c <;> simp only [slotTag, Bool.toNat_false, Bool.toNat_true, add_zero] at h
  · congr 1
    exact Fin.ext (by omega)
  · omega
  · omega
  · congr 1
    exact Fin.ext (by omega)

def selectedSlot {n : ℕ} (s : Selector n) (i : Fin n) : Slot n := (i, s i)

def selectedTag {n : ℕ} (s : Selector n) (i : Fin n) : ℕ := slotTag (selectedSlot s i)

theorem selectedTag_injective {n : ℕ} (s : Selector n) : Function.Injective (selectedTag s) :=
  fun _ _ h => congrArg Prod.fst (slotTag_injective h)

theorem selectedTag_lt_iff {n : ℕ} (s : Selector n) (i j : Fin n) :
    selectedTag s i < selectedTag s j ↔ i.val < j.val := by
  rcases lt_trichotomy i.val j.val with hij | hij | hij
  · cases h₁ : s i <;> cases h₂ : s j <;>
      simp only [selectedTag, selectedSlot, slotTag, h₁, h₂, Bool.toNat_false, Bool.toNat_true] <;>
      omega
  · have h : i = j := Fin.ext hij
    simp [h]
  · cases h₁ : s i <;> cases h₂ : s j <;>
      simp only [selectedTag, selectedSlot, slotTag, h₁, h₂, Bool.toNat_false, Bool.toNat_true] <;>
      omega

theorem sortedRows_selectedTag_eq {n : ℕ} (z : Sample n) (s : Selector n) :
    sortedRows z (selectedTag s) (selectedTag_injective s) = sortedRows z Fin.val Fin.val_injective := by
  apply Equiv.ext
  intro r
  have h := (sortedRows_eq_iff z Fin.val Fin.val_injective r _).mp rfl
  apply (sortedRows_eq_iff z (selectedTag s) (selectedTag_injective s) r _).mpr
  simpa only [key, Prod.Lex.toLex_lt_toLex, selectedTag_lt_iff] using h

theorem shiftedCost_selectedTag_eq {n : ℕ} (z : Sample n) (s : Selector n)
    (θ : Fin (cycleSize n)) :
    shiftedCost z (selectedTag s) (selectedTag_injective s) θ =
      shiftedCost z Fin.val Fin.val_injective θ := by
  funext j
  rw [shiftedCost, shiftedCost, virtualLoss_cutAt_eq_rankLoss, virtualLoss_cutAt_eq_rankLoss,
    sortedRows_selectedTag_eq]

def slotObservation {n : ℕ} (T : Pool n) (x : Slot n) : Observation := T x.1 x.2

def unionSlot {n : ℕ} (s : Selector n) (i : Fin n) : Fin (n + 1) → Slot n :=
  Fin.lastCases (i, true) (selectedSlot (Function.update s i false))

theorem unionSlot_castSucc {n : ℕ} (s : Selector n) (i j : Fin n) :
    unionSlot s i (Fin.castSucc j) = selectedSlot (Function.update s i false) j := by
  simp [unionSlot]

theorem unionSlot_last {n : ℕ} (s : Selector n) (i : Fin n) :
    unionSlot s i (Fin.last n) = (i, true) := by
  simp [unionSlot]

theorem unionSlot_injective {n : ℕ} (s : Selector n) (i : Fin n) :
    Function.Injective (unionSlot s i) := by
  intro a b h
  refine Fin.lastCases ?_ (fun j => ?_) a h
  · refine Fin.lastCases ?_ (fun k => ?_) b
    · intro _
      rfl
    · rw [unionSlot_castSucc, unionSlot_last, selectedSlot, Prod.mk.injEq]
      rintro ⟨rfl, hc⟩
      simp [Function.update] at hc
  · refine Fin.lastCases ?_ (fun k => ?_) b
    · rw [unionSlot_castSucc, unionSlot_last, selectedSlot, Prod.mk.injEq]
      rintro ⟨rfl, hc⟩
      simp [Function.update] at hc
    · rw [unionSlot_castSucc, unionSlot_castSucc, selectedSlot, selectedSlot, Prod.mk.injEq]
      intro h
      rw [h.1]

def replacementRow {n : ℕ} (i : Fin n) (b : Bool) (j : Fin n) : Fin (n + 1) :=
  if b ∧ j = i then Fin.last n else Fin.castSucc j

theorem replacementRow_injective {n : ℕ} (i : Fin n) (b : Bool) :
    Function.Injective (replacementRow i b) := by
  intro a c h
  cases b <;> by_cases ha : a = i <;> by_cases hc : c = i <;>
    simp_all [replacementRow, Fin.castSucc_ne_last, Ne.symm (Fin.castSucc_ne_last _)]

theorem unionSlot_replacementRow {n : ℕ} (s : Selector n) (i : Fin n) (b : Bool) (j : Fin n) :
    unionSlot s i (replacementRow i b j) = selectedSlot (Function.update s i b) j := by
  cases b <;> by_cases h : j = i <;>
    simp [replacementRow, unionSlot_castSucc, unionSlot_last, selectedSlot, Function.update, h]

def omittedRow {n : ℕ} (i : Fin n) (b : Bool) : Fin (n + 1) :=
  if b then Fin.castSucc i else Fin.last n

theorem omittedRow_not_mem {n : ℕ} (i : Fin n) (b : Bool) :
    omittedRow i b ∉ Set.range (replacementRow i b) := by
  rintro ⟨j,hj⟩
  cases b <;> by_cases h : j = i <;>
    simp_all [omittedRow, replacementRow, Fin.castSucc_ne_last, Ne.symm (Fin.castSucc_ne_last _)]

def unionSample {n : ℕ} (T : Pool n) (s : Selector n) (i : Fin n) : Sample (n + 1) :=
  slotObservation T ∘ unionSlot s i

def unionTag {n : ℕ} (s : Selector n) (i : Fin n) : Fin (n + 1) → ℕ :=
  slotTag ∘ unionSlot s i

theorem unionTag_injective {n : ℕ} (s : Selector n) (i : Fin n) :
    Function.Injective (unionTag s i) := slotTag_injective.comp (unionSlot_injective s i)

def branchInclusion {n : ℕ} (T : Pool n) (s : Selector n) (i : Fin n) (b : Bool) :
    IncludedSample (select T (Function.update s i b)) (unionSample T s i)
      (selectedTag (Function.update s i b)) (unionTag s i) where
  rows := ⟨replacementRow i b, replacementRow_injective i b⟩
  obs_eq j := congrArg (slotObservation T) (unionSlot_replacementRow s i b j)
  tag_eq j := congrArg slotTag (unionSlot_replacementRow s i b j)

theorem mem_range_other_of_ne {n : ℕ} (i j : Fin n) (h : j ≠ i) (b : Bool) :
    replacementRow i b j ∈ Set.range (replacementRow i (!b)) := by
  use j
  simp [replacementRow, h]

end SteinkeZakynthinou
