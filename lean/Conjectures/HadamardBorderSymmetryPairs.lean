import Mathlib.Algebra.Group.End
import Mathlib.Data.Fintype.Card
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Tactic.Abel

/-!
# The two pairs forced by a nontrivial four-point automorphism

For any abelian group of order four, every nonidentity automorphism moves
some `a` to `a + h`, where `h` has order two. The pairs are `(0, h)` and
`(a, a + h)`. This does not require classifying the group or the order of
the automorphism.
-/

namespace HadamardBorderSymmetry

variable {Q : Type*} [AddCommGroup Q] [Finite Q]

/-- A moved point supplies the two pairs, their complete enumeration, and
the addition relation needed to expand correlations at the other shift. -/
theorem moved_point_order_four_pairs (hQ : Nat.card Q = 4)
    (e : AddAut Q) (a : Q) (ha : e a ≠ a) :
    ∃ h : Q, h ≠ 0 ∧ (2 : ℕ) • h = 0 ∧ a ≠ 0 ∧ a ≠ h ∧
      e a = a + h ∧ (∀ x : Q, x = 0 ∨ x = h ∨ x = a ∨ x = a + h) ∧
      List.Pairwise (· ≠ ·) [0, h, a, a + h] ∧
      ((2 : ℕ) • a = 0 ∨ (2 : ℕ) • a = h) := by
  classical
  let : Fintype Q := Fintype.ofFinite Q
  let b := e a
  let h := b - a
  have hfour (x : Q) : (x + x) + (x + x) = 0 := by
    calc
      (x + x) + (x + x) = (4 : ℕ) • x := by abel
      _ = 0 := by simpa only [hQ] using (card_nsmul_eq_zero' (x := x))
  have hba : b = a + h := by
    dsimp only [h]
    abel
  have ha0 : a ≠ 0 := by
    intro hzero
    exact ha (by rw [hzero, map_zero])
  have hb0 : b ≠ 0 := by
    intro hzero
    exact ha0 (e.injective (hzero.trans (map_zero e).symm))
  have h0 : h ≠ 0 := by
    intro hzero
    exact ha (by simpa only [hzero, add_zero] using hba)
  have hha : h ≠ a := by
    intro heq
    have hbaa : b = a + a := by simpa only [heq] using hba
    have hedouble : e (a + a) = 0 := by
      rw [map_add]
      change b + b = 0
      rw [hbaa]
      exact hfour a
    have hadouble : a + a = 0 := e.injective (hedouble.trans (map_zero e).symm)
    exact hb0 (hbaa.trans hadouble)
  have hhb : h ≠ b := by
    intro heq
    have hab : b = a + b := by simpa only [heq] using hba
    exact ha0 (add_right_cancel (hab.symm.trans (zero_add b).symm))
  have hm0 : (0 : Q) ∉ ({h, a, b} : Finset Q) := by
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using
      And.intro h0.symm (And.intro ha0.symm hb0.symm)
  have hmh : h ∉ ({a, b} : Finset Q) := by
    simpa only [Finset.mem_insert, Finset.mem_singleton, not_or] using And.intro hha hhb
  have hma : a ∉ ({b} : Finset Q) := by
    simpa only [Finset.mem_singleton] using ha.symm
  have hcard : ({0, h, a, b} : Finset Q).card = 4 := by
    rw [Finset.card_insert_of_notMem hm0, Finset.card_insert_of_notMem hmh,
      Finset.card_insert_of_notMem hma, Finset.card_singleton]
  have huniv : ({0, h, a, b} : Finset Q) = Finset.univ :=
    Finset.eq_univ_of_card _ (by simpa only [← Nat.card_eq_fintype_card, hQ] using hcard)
  have hcover (x : Q) : x = 0 ∨ x = h ∨ x = a ∨ x = b := by
    have hx : x ∈ ({0, h, a, b} : Finset Q) := by
      rw [huniv]
      exact Finset.mem_univ _
    simpa only [Finset.mem_insert, Finset.mem_singleton] using hx
  have hdouble_iff : a + a = 0 ↔ b + b = 0 := by
    constructor
    · intro hadouble
      change e a + e a = 0
      rw [← map_add, hadouble, map_zero]
    · intro hbdouble
      apply e.injective
      rw [map_add, map_zero]
      exact hbdouble
  have hdiff (hadouble : a + a = 0) (hbdouble : b + b = 0) : h + h = 0 := by
    calc
      h + h = (b + b) - (a + a) := by dsimp only [h]; abel
      _ = 0 := by rw [hadouble, hbdouble, sub_self]
  have hhdouble : h + h = 0 := by
    rcases hcover (h + h) with hz | hh | hhaa | hhbb
    · exact hz
    · exact (h0 (add_left_cancel (hh.trans (add_zero h).symm))).elim
    · have hadouble : a + a = 0 := by
        rw [← hhaa]
        exact hfour h
      have hz := hdiff hadouble (hdouble_iff.mp hadouble)
      exact (ha0 (hhaa.symm.trans hz)).elim
    · have hbdouble : b + b = 0 := by
        rw [← hhbb]
        exact hfour h
      have hz := hdiff (hdouble_iff.mpr hbdouble) hbdouble
      exact (hb0 (hhbb.symm.trans hz)).elim
  have hadouble : a + a = 0 ∨ a + a = h := by
    rcases hcover (a + a) with hz | hh | haa | hab
    · exact Or.inl hz
    · exact Or.inr hh
    · exact (ha0 (add_left_cancel (haa.trans (add_zero a).symm))).elim
    · exact (hha (add_left_cancel (hab.trans hba)).symm).elim
  have hpairwise : List.Pairwise (· ≠ ·) [0, h, a, b] := by
    simp_all [List.pairwise_cons]
  refine ⟨h, h0, ?_, ha0, hha.symm, hba, ?_, ?_, ?_⟩
  · simpa only [two_nsmul] using hhdouble
  · intro x
    simpa only [hba] using hcover x
  · simpa only [hba] using hpairwise
  · simpa only [two_nsmul] using hadouble

/-- Every nonidentity automorphism of an abelian group of order four
provides the paired orbit used by the border correlation argument. -/
theorem nontrivial_order_four_automorphism_pairs (hQ : Nat.card Q = 4)
    (e : AddAut Q) (he : e ≠ 0) :
    ∃ a h : Q, h ≠ 0 ∧ (2 : ℕ) • h = 0 ∧ a ≠ 0 ∧ a ≠ h ∧
      e a = a + h ∧ (∀ x : Q, x = 0 ∨ x = h ∨ x = a ∨ x = a + h) ∧
      List.Pairwise (· ≠ ·) [0, h, a, a + h] ∧
      ((2 : ℕ) • a = 0 ∨ (2 : ℕ) • a = h) := by
  classical
  obtain ⟨a, ha⟩ : ∃ a : Q, e a ≠ a := by
    by_contra h
    apply he
    ext a
    change e a = a
    exact Classical.not_not.mp (fun hne => h ⟨a, hne⟩)
  obtain ⟨h, hh⟩ := moved_point_order_four_pairs hQ e a ha
  exact ⟨a, h, hh⟩

end HadamardBorderSymmetry
