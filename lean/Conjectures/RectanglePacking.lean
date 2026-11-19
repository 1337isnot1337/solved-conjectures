import Mathlib.Algebra.Order.BigOperators.Group.List
import Mathlib.Data.List.Flatten
import Lean.Elab.Tactic.Omega

/-! The all-size shelf-packing lemma used in the rectangle lower bound.
The conclusion retains the input order, so each bin is a consecutive strip.
No finite enumeration is used. -/
namespace RectangleFinite

/-- A first-fit prefix either fills a strip or leaves less than the largest
allowed width. The remaining list is nonempty when the total exceeds B. -/
theorem prefix_near_capacity (xs : List ℕ) (B M : ℕ)
    (hwidth : ∀ b ∈ xs, b ≤ M) (htotal : B < xs.sum) :
    ∃ pre rest : List ℕ, xs=pre++rest ∧ pre.sum ≤ B ∧
      B < pre.sum+M ∧ rest ≠ [] := by
  induction xs generalizing B with
  | nil => simp at htotal
  | cons a xs ih =>
    have ha : a ≤ M := hwidth a (by simp)
    by_cases hab : B < a
    · refine ⟨[],a::xs,by simp,by simp,?_,by simp⟩
      simpa using hab.trans_le ha
    · have haB : a ≤ B := by omega
      have htotal' : B < a+xs.sum := by simpa using htotal
      have hrest : B-a < xs.sum := by omega
      obtain ⟨pre,rest,he,hpre,hfill,hne⟩ :=
        ih (B-a) (fun b hb => hwidth b (by simp [hb])) hrest
      refine ⟨a::pre,rest,by simp [he],?_,?_,hne⟩
      · simp only [List.sum_cons]
        omega
      · simp only [List.sum_cons]
        omega

/-- Lists whose total width fits the waste-adjusted budget can be assigned
to at most Q strips of width B. Empty inputs require no strips. -/
theorem shelf_packing (Q B M : ℕ) (hM : M ≤ B) (xs : List ℕ)
    (hpos : ∀ b ∈ xs, 0 < b) (hwidth : ∀ b ∈ xs, b ≤ M)
    (hbudget : xs.sum ≤ Q*(B-M)) :
    ∃ bins : List (List ℕ), bins.flatten=xs ∧ bins.length ≤ Q ∧
      ∀ bin ∈ bins, bin.sum ≤ B := by
  induction Q generalizing xs with
  | zero =>
    have hs : xs.sum=0 := by simpa using hbudget
    have hx : xs=[] := by
      cases xs with
      | nil => rfl
      | cons a xs =>
        have ha := hpos a (by simp)
        simp only [List.sum_cons] at hs
        omega
    exact ⟨[],by simp [hx],by simp,by simp⟩
  | succ Q ih =>
    by_cases ht : xs.sum ≤ B
    · exact ⟨[xs],by simp,by simp,by simpa⟩
    · obtain ⟨pre,rest,he,hpre,hfill,_⟩ := prefix_near_capacity xs B M hwidth
        (by omega)
      have hrest : rest.sum ≤ Q*(B-M) := by
        rw [he,List.sum_append] at hbudget
        have hdiff : B-M ≤ pre.sum := by omega
        rw [Nat.succ_mul] at hbudget
        omega
      have hrestmem : ∀ b ∈ rest, b ∈ xs := by
        intro b hb
        simp [he,hb]
      obtain ⟨bins,hflat,hlen,hbins⟩ := ih rest
        (fun b hb => hpos b (hrestmem b hb))
        (fun b hb => hwidth b (hrestmem b hb)) hrest
      refine ⟨pre::bins,by simpa [hflat] using he.symm,?_,?_⟩
      · simpa using Nat.succ_le_succ hlen
      · intro bin hbin
        rcases List.mem_cons.mp hbin with rfl | hbin
        · exact hpre
        · exact hbins bin hbin

end RectangleFinite
