module

public import Mathlib.Data.Fin.Tuple.Basic
public import Mathlib.Data.Fintype.Pi

/-! Enumerate longer words from two finite lists of overlapping shorter
words. Membership characterizes the exact two-end coverage property, so a
coverage proof needs to inspect only the constructed list. The alphabet
does not need to be finite. -/
@[expose] public section

namespace FranklSpanFour.WordCoverage

abbrev Word (A : Type*) (k : ℕ) := Fin k → A

variable {A : Type*} {k : ℕ}

def wordPrefix (v : Word A (k + 1)) : Word A k := fun j => v j.castSucc

def wordSuffix (v : Word A (k + 1)) : Word A k := fun j => v j.succ

/-- Join two words by appending the last letter of the right word. -/
def join (left right : Word A (k + 1)) : Word A (k + 2) :=
  Fin.snoc left (right (Fin.last k))

theorem suffix_prefix (v : Word A (k + 2)) :
    wordSuffix (wordPrefix v) = wordPrefix (wordSuffix v) := by
  funext j
  rfl

@[simp] theorem prefix_join (left right : Word A (k + 1)) :
    wordPrefix (join left right) = left := by
  funext j
  simp only [wordPrefix, join, Fin.snoc_castSucc]

theorem suffix_join (left right : Word A (k + 1))
    (h : wordSuffix left = wordPrefix right) : wordSuffix (join left right) = right := by
  funext j
  refine Fin.lastCases ?_ (fun i => ?_) j
  · change join left right (Fin.last (k + 1)) = _
    simp only [join, Fin.snoc_last]
  · change join left right i.succ.castSucc = _
    simp only [join, Fin.snoc_castSucc]
    exact congrFun h i

@[simp] theorem join_ends (v : Word A (k + 2)) :
    join (wordPrefix v) (wordSuffix v) = v := by
  funext j
  refine Fin.lastCases ?_ (fun i => ?_) j
  · simp only [join, Fin.snoc_last, wordSuffix]
    rfl
  · simp only [join, Fin.snoc_castSucc, wordPrefix]

theorem overlap_iff_exists (left right : Word A (k + 1)) :
    wordSuffix left = wordPrefix right ↔
      ∃ v : Word A (k + 2), wordPrefix v = left ∧ wordSuffix v = right := by
  constructor
  · intro h
    exact ⟨join left right, prefix_join left right, suffix_join left right h⟩
  · rintro ⟨v, rfl, rfl⟩
    exact suffix_prefix v

theorem ends_injective :
    Function.Injective (fun v : Word A (k + 2) => (wordPrefix v, wordSuffix v)) := by
  intro v w h
  have hp : wordPrefix v = wordPrefix w := congrArg Prod.fst h
  have hs : wordSuffix v = wordSuffix w := congrArg Prod.snd h
  rw [← join_ends v, ← join_ends w, hp, hs]

variable [DecidableEq A]

/-- Retain compatible pairs, in left-list then right-list order. -/
def overlapWords (left right : List (Word A (k + 1))) : List (Word A (k + 2)) :=
  left.flatMap fun u =>
    (right.filter (fun v => decide (wordSuffix u = wordPrefix v))).map (join u)

theorem mem_overlapWords_iff (left right : List (Word A (k + 1)))
    (v : Word A (k + 2)) :
    v ∈ overlapWords left right ↔ wordPrefix v ∈ left ∧ wordSuffix v ∈ right := by
  constructor
  · intro hv
    obtain ⟨u, hu, hv⟩ := List.mem_flatMap.mp hv
    obtain ⟨w, hw, rfl⟩ := List.mem_map.mp hv
    obtain ⟨hw, hoverlap⟩ := List.mem_filter.mp hw
    have h := of_decide_eq_true hoverlap
    exact ⟨by simpa only [prefix_join] using hu,
      by simpa only [suffix_join u w h] using hw⟩
  · rintro ⟨hp, hs⟩
    exact List.mem_flatMap.mpr ⟨wordPrefix v, hp, List.mem_map.mpr
      ⟨wordSuffix v, List.mem_filter.mpr ⟨hs, decide_eq_true (suffix_prefix v)⟩,
        join_ends v⟩⟩

/-- Every word whose two ends occur in the input lists is enumerated. -/
theorem overlapWords_covers (left right : List (Word A (k + 1)))
    (v : Word A (k + 2)) (hp : wordPrefix v ∈ left) (hs : wordSuffix v ∈ right) :
    v ∈ overlapWords left right :=
  (mem_overlapWords_iff left right v).mpr ⟨hp, hs⟩

theorem forall_overlapWords_iff (left right : List (Word A (k + 1)))
    (P : Word A (k + 2) → Prop) :
    (∀ v ∈ overlapWords left right, P v) ↔
      ∀ v, wordPrefix v ∈ left → wordSuffix v ∈ right → P v := by
  constructor
  · intro h v hp hs
    exact h v (overlapWords_covers left right v hp hs)
  · intro h v hv
    obtain ⟨hp, hs⟩ := (mem_overlapWords_iff left right v).mp hv
    exact h v hp hs

theorem all_overlapWords_eq_true_iff (left right : List (Word A (k + 1)))
    (test : Word A (k + 2) → Bool) :
    (overlapWords left right).all test = true ↔
      ∀ v, wordPrefix v ∈ left → wordSuffix v ∈ right → test v = true := by
  rw [List.all_eq_true, forall_overlapWords_iff]

theorem mem_filter_overlapWords_iff (left right : List (Word A (k + 1)))
    (accept : Word A (k + 2) → Bool) (v : Word A (k + 2)) :
    v ∈ (overlapWords left right).filter accept ↔
      wordPrefix v ∈ left ∧ wordSuffix v ∈ right ∧ accept v = true := by
  rw [List.mem_filter, mem_overlapWords_iff]
  exact and_assoc

/-- A filtered overlap list has exactly the requested universal coverage. -/
theorem filter_overlapWords_covers (left right : List (Word A (k + 1)))
    (accept : Word A (k + 2) → Bool) (v : Word A (k + 2))
    (hp : wordPrefix v ∈ left) (hs : wordSuffix v ∈ right) (ha : accept v = true) :
    v ∈ (overlapWords left right).filter accept :=
  (mem_filter_overlapWords_iff left right accept v).mpr ⟨hp, hs, ha⟩

def coverageCheck (left right : List (Word A (k + 1)))
    (targets : List (Word A (k + 2))) : Bool :=
  (overlapWords left right).all (fun v => decide (v ∈ targets))

theorem coverageCheck_eq_true_iff (left right : List (Word A (k + 1)))
    (targets : List (Word A (k + 2))) :
    coverageCheck left right targets = true ↔
      ∀ v, wordPrefix v ∈ left → wordSuffix v ∈ right → v ∈ targets := by
  simp only [coverageCheck, all_overlapWords_eq_true_iff, decide_eq_true_eq]

def filteredCoverageCheck (left right : List (Word A (k + 1)))
    (accept : Word A (k + 2) → Bool) (targets : List (Word A (k + 2))) : Bool :=
  ((overlapWords left right).filter accept).all (fun v => decide (v ∈ targets))

theorem filteredCoverageCheck_eq_true_iff (left right : List (Word A (k + 1)))
    (accept : Word A (k + 2) → Bool) (targets : List (Word A (k + 2))) :
    filteredCoverageCheck left right accept targets = true ↔
      ∀ v, wordPrefix v ∈ left → wordSuffix v ∈ right → accept v = true → v ∈ targets := by
  simp only [filteredCoverageCheck, List.all_eq_true, decide_eq_true_eq]
  constructor
  · intro h v hp hs ha
    exact h v (filter_overlapWords_covers left right accept v hp hs ha)
  · intro h v hv
    obtain ⟨hp, hs, ha⟩ := (mem_filter_overlapWords_iff left right accept v).mp hv
    exact h v hp hs ha

end FranklSpanFour.WordCoverage
