module

public import Conjectures.GesselZhuangBlockOperations
public import Mathlib.Data.Finset.Lattice.Lemmas
public import Mathlib.Data.Finset.Card

/-!
# Gessel–Zhuang conjecture

Pinnacle values of literal words. Values inside words are zero-based, so
the pinnacle set records each local maximum plus one, as in the source.
The block version records only peaks interior to a block: an unfilled
gap is a position reserved for a later, larger value.
-/

@[expose] public section

namespace GesselZhuang

/-- One-based values at the interior peaks of a literal word. -/
def wordPinnacles : List ℕ → Finset ℕ
  | a :: b :: c :: L =>
      (if a < b ∧ c < b then {b + 1} else ∅) ∪ wordPinnacles (b :: c :: L)
  | _ => ∅

/-- Number of interior peak positions in the literal word. -/
def wordPeakCount : List ℕ → ℕ
  | a :: b :: c :: L =>
      (if a < b ∧ c < b then 1 else 0) + wordPeakCount (b :: c :: L)
  | _ => 0

/-- Pinnacles already fixed inside the nonempty exposed blocks. -/
def blockPinnacles : Blocks → Finset ℕ
  | [] => ∅
  | b :: B => wordPinnacles b ∪ blockPinnacles B

/-- The recursive statistic is exactly the set of values in adjacent
triples whose middle value exceeds both neighbors. -/
theorem mem_wordPinnacles_iff (w : List ℕ) (y : ℕ) :
    y + 1 ∈ wordPinnacles w ↔
      ∃ a c : ℕ, a < y ∧ c < y ∧ [a, y, c] <:+: w := by
  induction w with
  | nil =>
    simp only [wordPinnacles, Finset.notMem_empty, false_iff]
    rintro ⟨a, c, _, _, h⟩
    have := h.length_le
    simp at this
  | cons a w ih =>
    cases w with
    | nil =>
      simp only [wordPinnacles, Finset.notMem_empty, false_iff]
      rintro ⟨u, v, _, _, h⟩
      have := h.length_le
      simp at this
    | cons b w =>
      cases w with
      | nil =>
        simp only [wordPinnacles, Finset.notMem_empty, false_iff]
        rintro ⟨u, v, _, _, h⟩
        have := h.length_le
        simp at this
      | cons c w =>
        rw [wordPinnacles, Finset.mem_union]
        constructor
        · rintro (h | h)
          · by_cases hp : a < b ∧ c < b
            · rw [ite_eq_left hp] at h
              have hy : y = b := Nat.add_right_cancel (Finset.mem_singleton.mp h)
              subst y
              exact ⟨a, c, hp.1, hp.2, (by simp : [a, b, c] <+: a :: b :: c :: w).isInfix⟩
            · simp [hp] at h
          · rcases ih.mp h with ⟨u, v, hu, hv, hin⟩
            exact ⟨u, v, hu, hv, List.infix_cons_iff.mpr (Or.inr hin)⟩
        · rintro ⟨u, v, hu, hv, hin⟩
          rcases List.infix_cons_iff.mp hin with hp | ht
          · have heq : u = a ∧ y = b ∧ v = c := by simpa using hp
            rcases heq with ⟨rfl, rfl, rfl⟩
            exact Or.inl (by simp [hu, hv])
          · exact Or.inr (ih.mpr ⟨u, v, hu, hv, ht⟩)

theorem mem_wordPinnacles_mem_tail {w : List ℕ} {y : ℕ}
    (hy : y + 1 ∈ wordPinnacles w) : y ∈ w.tail := by
  induction w with
  | nil => simp [wordPinnacles] at hy
  | cons a w ih =>
    cases w with
    | nil => simp [wordPinnacles] at hy
    | cons b w =>
      cases w with
      | nil => simp [wordPinnacles] at hy
      | cons c w =>
        rw [wordPinnacles, Finset.mem_union] at hy
        rcases hy with hy | hy
        · by_cases hp : a < b ∧ c < b
          · rw [ite_eq_left hp] at hy
            have h : y = b := Nat.add_right_cancel (Finset.mem_singleton.mp hy)
            simp [h]
          · simp [hp] at hy
        · have h := ih hy
          simpa only [List.tail_cons] using List.mem_cons_of_mem b h

/-- Distinct letters make pinnacle values and peak positions equipotent. -/
theorem wordPeakCount_eq_card_wordPinnacles {w : List ℕ} (hw : w.Nodup) :
    wordPeakCount w = (wordPinnacles w).card := by
  induction w with
  | nil => simp [wordPeakCount, wordPinnacles]
  | cons a w ih =>
    cases w with
    | nil => simp [wordPeakCount, wordPinnacles]
    | cons b w =>
      cases w with
      | nil => simp [wordPeakCount, wordPinnacles]
      | cons c w =>
        have ht : (b :: c :: w).Nodup := (List.nodup_cons.mp hw).2
        have hb : b + 1 ∉ wordPinnacles (b :: c :: w) := by
          intro h
          exact (List.nodup_cons.mp ht).1 (mem_wordPinnacles_mem_tail h)
        rw [wordPeakCount, wordPinnacles]
        by_cases hp : a < b ∧ c < b
        · rw [ite_eq_left hp, ite_eq_left hp]
          simp [ih ht, hb, Nat.add_comm]
        · simp [hp, ih ht]

@[simp] theorem blockPinnacles_append (A B : Blocks) :
    blockPinnacles (A ++ B) = blockPinnacles A ∪ blockPinnacles B := by
  induction A with
  | nil => simp [blockPinnacles]
  | cons a A ih => simp [blockPinnacles, ih, Finset.union_assoc]

@[simp] theorem blockPinnacles_singleton (b : List ℕ) :
    blockPinnacles [b] = wordPinnacles b := by
  simp [blockPinnacles]

theorem wordPinnacles_prepend_max {b : List ℕ} {x : ℕ}
    (hx : ∀ y ∈ b, y < x) : wordPinnacles (x :: b) = wordPinnacles b := by
  cases b with
  | nil => rfl
  | cons a b =>
    cases b with
    | nil => rfl
    | cons c L =>
      have ha : ¬ x < a := by have := hx a (by simp); omega
      simp [wordPinnacles, ha]

theorem wordPinnacles_append_max {b : List ℕ} {x : ℕ}
    (hx : ∀ y ∈ b, y < x) : wordPinnacles (b ++ [x]) = wordPinnacles b := by
  induction b with
  | nil => rfl
  | cons a b ih =>
    cases b with
    | nil => rfl
    | cons c L =>
      have hc : ¬ x < c := by have := hx c (by simp); omega
      have ih' := ih (fun y hy => hx y (by simp [hy]))
      cases L with
      | nil => simp [wordPinnacles, hc]
      | cons d L =>
        simpa only [List.cons_append, wordPinnacles] using
          congrArg (fun S => (if a < c ∧ d < c then {c + 1} else ∅) ∪ S) ih'

theorem wordPinnacles_join_max {b c : List ℕ} {x : ℕ}
    (hb : b ≠ []) (hc : c ≠ [])
    (hxb : ∀ y ∈ b, y < x) (hxc : ∀ y ∈ c, y < x) :
    wordPinnacles (b ++ x :: c) = wordPinnacles b ∪ {x + 1} ∪ wordPinnacles c := by
  induction b with
  | nil => exact False.elim (hb rfl)
  | cons a b ih =>
    have hax : a < x := hxb a (by simp)
    cases b with
    | nil =>
      cases c with
      | nil => exact False.elim (hc rfl)
      | cons d L =>
        have hdx : d < x := hxc d (by simp)
        simpa only [List.nil_append, List.cons_append, wordPinnacles, hax, hdx,
          and_self, ↓reduceIte, Finset.empty_union] using
          congrArg (fun S => {x + 1} ∪ S) (wordPinnacles_prepend_max hxc)
    | cons d L =>
      have ih' := ih (by simp) (fun y hy => hxb y (by simp [hy]))
      have hdx : ¬ x < d := by have := hxb d (by simp); omega
      cases L with
      | nil =>
        simpa only [List.cons_append, List.nil_append, wordPinnacles, hdx,
          and_false, ↓reduceIte, Finset.empty_union] using ih'
      | cons e L =>
        simpa only [List.cons_append, wordPinnacles, Finset.union_assoc] using
          congrArg (fun S => (if a < d ∧ e < d then {d + 1} else ∅) ∪ S) ih'

theorem blockPinnacles_up {B : Blocks} {i x : ℕ} (hi : i ≤ B.length) :
    blockPinnacles (upBlocks B i x) = blockPinnacles B := by
  rcases blocks_split_at hi with ⟨A, C, rfl, rfl⟩
  simp [upBlocks_append, blockPinnacles, wordPinnacles]

theorem blockPinnacles_flat {B : Blocks} {i x : ℕ}
    (hi : i < B.length) (e : Bool) (hx : ∀ y ∈ B.flatten, y < x) :
    blockPinnacles (flatBlocks B i x e) = blockPinnacles B := by
  rcases blocks_split_one hi with ⟨A, C, b, rfl, rfl⟩
  have hb : ∀ y ∈ b, y < x := fun y hy => hx y (by simp [hy])
  rw [flatBlocks_append]
  cases e <;> simp [blockPinnacles, wordPinnacles_prepend_max hb,
    wordPinnacles_append_max hb]

theorem blockPinnacles_down {B : Blocks} {i x : ℕ}
    (hi : i + 1 < B.length) (hne : NonemptyBlocks B)
    (hx : ∀ y ∈ B.flatten, y < x) :
    blockPinnacles (downBlocks B i x) = blockPinnacles B ∪ {x + 1} := by
  rcases blocks_split_two hi with ⟨A, C, b, c, rfl, rfl⟩
  have hb : b ≠ [] := hne b (by simp)
  have hc : c ≠ [] := hne c (by simp)
  have hxb : ∀ y ∈ b, y < x := fun y hy => hx y (by simp [hy])
  have hxc : ∀ y ∈ c, y < x := fun y hy => hx y (by simp [hy])
  simp [downBlocks_append, blockPinnacles, wordPinnacles_join_max hb hc hxb hxc,
    Finset.union_left_comm, Finset.union_comm]

end GesselZhuang
