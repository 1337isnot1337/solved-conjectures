import Mathlib.Data.Nat.Find
import Mathlib.Algebra.BigOperators.Group.List.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

/-! Finite next-fit shelf packing with integral widths. The theorem produces
the shelves themselves and preserves the entire input list in order. -/

namespace RectanglePartitions

theorem exists_full_prefix (widths : List ℕ) (B C : ℕ) (hC : C ≤ B)
    (hwidth : ∀ b ∈ widths, b ≤ C) (hbad : B < widths.sum) :
    ∃ k : ℕ, k < widths.length ∧ (widths.take k).sum ≤ B ∧
      B-C < (widths.take k).sum := by
  have hex : ∃ n : ℕ, B < (widths.take n).sum :=
    ⟨widths.length,by simpa using hbad⟩
  let n := Nat.find hex
  have hn : B < (widths.take n).sum := Nat.find_spec hex
  have hnlen : n ≤ widths.length := Nat.find_min' hex (by simpa using hbad)
  have hnpos : 0 < n := by
    by_contra hh
    have he : n=0 := by omega
    simp only [he,List.take_zero,List.sum_nil] at hn
    omega
  let k := n-1
  have hk : k+1=n := by dsimp [k]; omega
  have hklen : k < widths.length := by omega
  have hkn : k < n := by omega
  have hfit : (widths.take k).sum ≤ B := le_of_not_gt (Nat.find_min hex hkn)
  have hnext : widths[k] ≤ C := hwidth _ (List.getElem_mem hklen)
  have hsum : (widths.take n).sum = (widths.take k).sum+widths[k] := by
    rw [←hk,List.take_succ_eq_append_getElem hklen,List.sum_append]
    simp
  refine ⟨k,hklen,hfit,?_⟩
  omega

/-- If every width is at most `C`, total width at most `Q*(B-C)` fits
within `Q` shelves of width `B`. All coordinates remain integral. -/
theorem shelf_packing (Q B C : ℕ) (widths : List ℕ)
    (hwidth : ∀ b ∈ widths, 0 < b ∧ b ≤ C) (hC : C ≤ B)
    (hbudget : widths.sum ≤ Q*(B-C)) :
    ∃ shelves : List (List ℕ), shelves.flatten=widths ∧ shelves.length ≤ Q ∧
      ∀ shelf ∈ shelves, shelf.sum ≤ B := by
  induction Q generalizing widths with
  | zero =>
    cases widths with
    | nil => exact ⟨[],by simp,by simp,by simp⟩
    | cons b bs =>
      have hb := (hwidth b (by simp)).1
      simp only [List.sum_cons,Nat.zero_mul] at hbudget
      omega
  | succ Q ih =>
    by_cases hfit : widths.sum ≤ B
    · exact ⟨[widths],by simp,by simp,by simpa using hfit⟩
    · obtain ⟨k,hklen,hfirst,hfull⟩ := exists_full_prefix widths B C hC
        (fun b hb => (hwidth b hb).2) (lt_of_not_ge hfit)
      have hsplit : (widths.take k).sum+(widths.drop k).sum=widths.sum := by
        rw [←List.sum_append,List.take_append_drop]
      have hrest : (widths.drop k).sum ≤ Q*(B-C) := by
        nlinarith only [hbudget,hfull,hsplit]
      have hrestwidth : ∀ b ∈ widths.drop k, 0 < b ∧ b ≤ C := by
        intro b hb
        exact hwidth b (List.mem_of_mem_drop hb)
      obtain ⟨shelves,hflatten,hlen,hshelves⟩ := ih (widths.drop k) hrestwidth hrest
      refine ⟨widths.take k :: shelves,?_,?_,?_⟩
      · rw [List.flatten_cons,hflatten,List.take_append_drop]
      · simpa only [List.length_cons] using Nat.succ_le_succ hlen
      · intro shelf hshelf
        rcases List.mem_cons.mp hshelf with rfl | hshelf
        · exact hfirst
        · exact hshelves shelf hshelf

end RectanglePartitions
