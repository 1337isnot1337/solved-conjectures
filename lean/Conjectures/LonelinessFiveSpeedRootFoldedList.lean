import Conjectures.LonelinessFiveSpeedRootStarBlocks

/-! List-based folded-pattern checks and inexpensive structural prefixes.
The checks have separate soundness/equality lemmas so the finite search
can benchmark them independently without changing its mathematical scope. -/

namespace Loneliness.FiveSpeedCertificate

open Loneliness.FiveSpeedRoot Loneliness.Modular
open scoped BigOperators Matrix

def folded134RawListCheck (p : ℕ) (xs : List ℕ) : Bool :=
  xs.any (fun a => xs.contains (folded p (3 * a)) && xs.contains (folded p (4 * a)))

theorem folded134RawListCheck_iff (p : ℕ) (xs : List ℕ) :
    folded134RawListCheck p xs = true ↔
      ∃ a ∈ xs, folded p (3 * a) ∈ xs ∧ folded p (4 * a) ∈ xs := by
  simp only [folded134RawListCheck, List.any_eq_true,
    Bool.and_eq_true, List.contains_iff_mem]

def folded134ListCheck (p : ℕ) (xs : List ℕ) : Bool :=
  folded134RawListCheck p (xs.map (folded p))

theorem folded134ListCheck_iff (p : ℕ) (xs : List ℕ) :
    folded134ListCheck p xs = true ↔ ∃ a ∈ xs,
      folded p (3 * folded p a) ∈ xs.map (folded p) ∧
      folded p (4 * folded p a) ∈ xs.map (folded p) := by
  rw [folded134ListCheck, folded134RawListCheck_iff]
  constructor
  · rintro ⟨a, ha, h3, h4⟩
    obtain ⟨x, hx, rfl⟩ := List.mem_map.mp ha
    exact ⟨x, hx, h3, h4⟩
  · rintro ⟨a, ha, h3, h4⟩
    exact ⟨folded p a, List.mem_map.mpr ⟨a, ha, rfl⟩, h3, h4⟩

theorem foldedList_mem_iff (p : ℕ) (v : Speeds) (a : ℕ) :
    a ∈ (List.ofFn v).map (folded p) ↔ a ∈ foldedCoordinates p v := by
  rw [mem_foldedCoordinates]
  constructor
  · intro ha
    obtain ⟨x, hx, hfx⟩ := List.mem_map.mp ha
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp hx
    exact ⟨i, hfx⟩
  · rintro ⟨i, hi⟩
    exact List.mem_map.mpr ⟨v i, List.mem_ofFn.mpr ⟨i, rfl⟩, hi⟩

theorem folded134ListCheck_ofFn_eq (p : ℕ) (v : Speeds) :
    folded134ListCheck p (List.ofFn v) = folded134Check p v := by
  apply Bool.eq_iff_iff.mpr
  rw [folded134ListCheck_iff]
  simp only [folded134Check, decide_eq_true_eq]
  constructor
  · rintro ⟨a, ha, h3, h4⟩
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
    exact ⟨i, (foldedList_mem_iff p v _).mp h3, (foldedList_mem_iff p v _).mp h4⟩
  · rintro ⟨i, h3, h4⟩
    exact ⟨v i, List.mem_ofFn.mpr ⟨i, rfl⟩,
      (foldedList_mem_iff p v _).mpr h3, (foldedList_mem_iff p v _).mpr h4⟩

theorem folded134RawListCheck_mono (p : ℕ) (xs ys : List ℕ) (hsub : xs ⊆ ys)
    (h : folded134RawListCheck p xs = true) : folded134RawListCheck p ys = true := by
  obtain ⟨a, ha, h3, h4⟩ := (folded134RawListCheck_iff p xs).mp h
  exact (folded134RawListCheck_iff p ys).mpr ⟨a, hsub ha, hsub h3, hsub h4⟩

theorem folded134RawListCheck_sound (p : ℕ) (xs : List ℕ) (v : Speeds)
    (hsub : xs ⊆ List.ofFn v) (h : folded134RawListCheck p xs = true) :
    Folded134 p v := by
  obtain ⟨a, ha, h3, h4⟩ := (folded134RawListCheck_iff p xs).mp h
  have hcoord (x : ℕ) (hx : x ∈ xs) : folded p x ∈ foldedCoordinates p v := by
    obtain ⟨i, hi⟩ := List.mem_ofFn.mp (hsub hx)
    exact (mem_foldedCoordinates p v _).mpr ⟨i, congrArg (folded p) hi⟩
  refine ⟨a, hcoord a ha, ?_, ?_⟩
  · have hh := hcoord (folded p (3 * a)) h3
    simpa only [folded_eq_self (folded_le_half p (3 * a))] using hh
  · have hh := hcoord (folded p (4 * a)) h4
    simpa only [folded_eq_self (folded_le_half p (4 * a))] using hh

def rootPrefix134Check (p b c d : ℕ) : Bool :=
  folded134RawListCheck p [1, b, c, d]

theorem rootPrefix134Check_folded (p b c d e : ℕ)
    (h : rootPrefix134Check p b c d = true) :
    Folded134 p (rootQuintuple b c d e) := by
  apply folded134RawListCheck_sound p [1, b, c, d] (rootQuintuple b c d e) ?_ h
  intro x hx
  change x ∈ [1, b, c, d] ++ [e]
  exact List.mem_append.mpr (Or.inl hx)

theorem rootStarFastLeaf_of_folded134 (p : ℕ) (hp : 0 < p) (b c d e : ℕ)
    (h : Folded134 p (rootQuintuple b c d e)) : rootStarFastLeaf p b c d e = true := by
  unfold rootStarFastLeaf
  exact Bool.or_eq_true_iff.mpr (Or.inl (folded134Check_complete p hp _ h))

theorem rootStarFastLeaf_of_twoShortRelations (p b c d e : ℕ)
    (h : TwoShortRelations p (rootQuintuple b c d e)) :
    rootStarFastLeaf p b c d e = true := by
  unfold rootStarFastLeaf
  exact Bool.or_eq_true_iff.mpr (Or.inr (decide_eq_true h))

theorem rootPrefix134Check_accept (p : ℕ) (hp : 0 < p) (b c d : ℕ)
    (h : rootPrefix134Check p b c d = true) :
    ∀ e, rootStarFastLeaf p b c d e = true := by
  intro e
  exact rootStarFastLeaf_of_folded134 p hp b c d e (rootPrefix134Check_folded p b c d e h)

theorem rootPrefix134Check_1234 (p : ℕ) (hp : 8 ≤ p) :
    rootPrefix134Check p 2 3 4 = true := by
  apply (folded134RawListCheck_iff p [1, 2, 3, 4]).mpr
  refine ⟨1, by decide, ?_, ?_⟩
  · rw [Nat.mul_one, folded_eq_self (by omega : 2 * 3 ≤ p)]
    decide
  · rw [Nat.mul_one, folded_eq_self (by omega : 2 * 4 ≤ p)]
    decide

def rootStarListLeaf (p b c d e : ℕ) : Bool :=
  folded134ListCheck p [1, b, c, d, e] ||
    decide (2 ≤ (zeroFormIndices p (rootQuintuple b c d e)).card)

theorem rootStarListLeaf_eq (p b c d e : ℕ) :
    rootStarListLeaf p b c d e = rootStarFastLeaf p b c d e := by
  unfold rootStarListLeaf rootStarFastLeaf
  rw [show [1, b, c, d, e] = List.ofFn (rootQuintuple b c d e) from rfl,
    folded134ListCheck_ofFn_eq]

set_option maxRecDepth 10000 in
theorem rootPrefix23_relations (p d e : ℕ) :
    TwoShortRelations p (rootQuintuple 2 3 d e) := by
  have h72 : dot (formRows 72) (rootQuintuple 2 3 d e) = 0 := by
    change dot ![2, -1, 0, 0, 0] (rootQuintuple 2 3 d e) = 0
    norm_num [dot, rootQuintuple, Fin.sum_univ_succ]
  have h65 : dot (formRows 65) (rootQuintuple 2 3 d e) = 0 := by
    change dot ![1, 1, -1, 0, 0] (rootQuintuple 2 3 d e) = 0
    norm_num [dot, rootQuintuple, Fin.sum_univ_succ]
  apply (twoShortRelations_iff p _).mpr
  refine ⟨72, 65, by decide, ?_, ?_⟩
  · rw [h72]
    exact dvd_zero _
  · rw [h65]
    exact dvd_zero _

set_option maxRecDepth 10000 in
theorem rootPrefix24_relations (p d e : ℕ) :
    TwoShortRelations p (rootQuintuple 2 4 d e) := by
  have h72 : dot (formRows 72) (rootQuintuple 2 4 d e) = 0 := by
    change dot ![2, -1, 0, 0, 0] (rootQuintuple 2 4 d e) = 0
    norm_num [dot, rootQuintuple, Fin.sum_univ_succ]
  have h34 : dot (formRows 34) (rootQuintuple 2 4 d e) = 0 := by
    change dot ![0, 2, -1, 0, 0] (rootQuintuple 2 4 d e) = 0
    norm_num [dot, rootQuintuple, Fin.sum_univ_succ]
  apply (twoShortRelations_iff p _).mpr
  refine ⟨72, 34, by decide, ?_, ?_⟩
  · rw [h72]
    exact dvd_zero _
  · rw [h34]
    exact dvd_zero _

theorem rootPrefix34_folded (p d e : ℕ) : Folded134 p (rootQuintuple 3 4 d e) := by
  refine ⟨1, ?_, ?_, ?_⟩
  · exact (mem_foldedCoordinates p _ _).mpr ⟨0, rfl⟩
  · exact (mem_foldedCoordinates p _ _).mpr ⟨1, rfl⟩
  · exact (mem_foldedCoordinates p _ _).mpr ⟨2, rfl⟩

def rootCheapCCheck (b c : ℕ) : Bool :=
  (b == 2 && (c == 3 || c == 4)) || (b == 3 && c == 4)

theorem rootCheapCCheck_accept (p : ℕ) (hp : 0 < p) (b c : ℕ)
    (h : rootCheapCCheck b c = true) :
    ∀ d e, rootStarFastLeaf p b c d e = true := by
  have hcases : (b = 2 ∧ (c = 3 ∨ c = 4)) ∨ (b = 3 ∧ c = 4) := by
    simpa only [rootCheapCCheck, Bool.or_eq_true, Bool.and_eq_true, beq_iff_eq] using h
  intro d e
  rcases hcases with ⟨rfl, hc⟩ | ⟨rfl, rfl⟩
  · rcases hc with rfl | rfl
    · exact rootStarFastLeaf_of_twoShortRelations p 2 3 d e (rootPrefix23_relations p d e)
    · exact rootStarFastLeaf_of_twoShortRelations p 2 4 d e (rootPrefix24_relations p d e)
  · exact rootStarFastLeaf_of_folded134 p hp 3 4 d e (rootPrefix34_folded p d e)

def rootCheapPrefixCheck (b c _d : ℕ) : Bool := rootCheapCCheck b c

theorem rootCheapPrefixCheck_accept (p : ℕ) (hp : 0 < p) (b c d : ℕ)
    (h : rootCheapPrefixCheck b c d = true) :
    ∀ e, rootStarFastLeaf p b c d e = true := rootCheapCCheck_accept p hp b c h d

end Loneliness.FiveSpeedCertificate
