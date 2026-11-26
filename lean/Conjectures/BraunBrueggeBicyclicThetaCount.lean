import Conjectures.BraunBrueggeBicyclicThetaFibers

/-! The exact common-parity and mixed-parity binomial sums count the
facets of the literal three-path theta graph. -/

open Finset

namespace BraunBruegge

abbrev thetaLengths (a b c : ℕ) : Fin 3 → ℕ := ![a, b, c]

variable {a b c : ℕ} {r : ℤ}

private abbrev FullWord (m : ℕ) (r : ℤ) := {w : UnitStepWord m r // w.Full}
private abbrev GapWord (m : ℕ) (r : ℤ) := {w : UnitStepWord m r // ¬w.Full}

private abbrev TripleWords (a b c : ℕ) (r : ℤ) :=
  {w : UnitStepWord a r × UnitStepWord b r × UnitStepWord c r //
    w.1.Full ∨ w.2.1.Full ∨ w.2.2.Full}

private def assembleTriple (x : UnitStepWord a r) (y : UnitStepWord b r) (z : UnitStepWord c r) :
    (p : Fin 3) → UnitStepWord (thetaLengths a b c p) r := by
  intro p
  refine Fin.cases x (fun i => ?_) p
  refine Fin.cases y (fun j => ?_) i
  exact Fin.cases z (fun i => i.elim0) j

private def thetaTripleEquiv (a b c : ℕ) (r : ℤ) : ThetaFiber (thetaLengths a b c) r ≃ TripleWords a b c r where
  toFun f := ⟨(f.path 0, f.path 1, f.path 2), by
    obtain ⟨p, hp⟩ := f.full
    fin_cases p
    · exact Or.inl hp
    · exact Or.inr (Or.inl hp)
    · exact Or.inr (Or.inr hp)⟩
  invFun w := ⟨assembleTriple w.val.1 w.val.2.1 w.val.2.2, by
    rcases w.property with hx | hy | hz
    · exact ⟨0, hx⟩
    · exact ⟨1, hy⟩
    · exact ⟨2, hz⟩⟩
  left_inv f := by
    apply ThetaFiber.ext
    funext p
    fin_cases p <;> rfl
  right_inv w := rfl

private theorem word_full_iff_of_same_parity {m n : ℕ} (u : UnitStepWord m r) (v : UnitStepWord n r)
    (hm : 0 < m) (hn : 0 < n) (h : (m : ℤ) % 2 = (n : ℤ) % 2) : u.Full ↔ v.Full := by
  rw [u.full_iff_total_parity hm, v.full_iff_total_parity hn, h]

private def tripleSameParityEquiv (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (hab : (a : ℤ) % 2 = (b : ℤ) % 2) (hac : (a : ℤ) % 2 = (c : ℤ) % 2) :
    TripleWords a b c r ≃ FullWord a r × FullWord b r × FullWord c r where
  toFun w := by
    let x := w.val.1
    let y := w.val.2.1
    let z := w.val.2.2
    have e₁ := word_full_iff_of_same_parity x y ha hb hab
    have e₂ := word_full_iff_of_same_parity x z ha hc hac
    have hx : x.Full := by
      rcases w.property with h | h | h
      · exact h
      · exact e₁.mpr h
      · exact e₂.mpr h
    exact (⟨x, hx⟩, ⟨y, e₁.mp hx⟩, ⟨z, e₂.mp hx⟩)
  invFun w := ⟨(w.1.val, w.2.1.val, w.2.2.val), Or.inl w.1.property⟩
  left_inv w := rfl
  right_inv w := rfl

private abbrev MixedWords (a b c : ℕ) (r : ℤ) :=
  (FullWord a r × FullWord b r × GapWord c r) ⊕
    (GapWord a r × GapWord b r × FullWord c r)

private noncomputable def tripleMixedTo (ha : 0 < a) (hb : 0 < b)
    (hab : (a : ℤ) % 2 = (b : ℤ) % 2) (hac : (a : ℤ) % 2 ≠ (c : ℤ) % 2)
    (w : TripleWords a b c r) : MixedWords a b c r := by
  classical
  let x := w.val.1
  let y := w.val.2.1
  let z := w.val.2.2
  have e := word_full_iff_of_same_parity x y ha hb hab
  exact if hx : x.Full then
    .inl (⟨x, hx⟩, ⟨y, e.mp hx⟩, ⟨z, fun hz => hac ((fullWord_total_parity x hx).symm.trans (fullWord_total_parity z hz))⟩)
  else
    .inr (⟨x, hx⟩, ⟨y, fun hy => hx (e.mpr hy)⟩, ⟨z, by
      rcases w.property with h | h | h
      · exact (hx h).elim
      · exact (hx (e.mpr h)).elim
      · exact h⟩)

private def tripleMixedFrom : MixedWords a b c r → TripleWords a b c r
  | .inl w => ⟨(w.1.val, w.2.1.val, w.2.2.val), Or.inl w.1.property⟩
  | .inr w => ⟨(w.1.val, w.2.1.val, w.2.2.val), Or.inr (Or.inr w.2.2.property)⟩

private noncomputable def tripleMixedEquiv (ha : 0 < a) (hb : 0 < b)
    (hab : (a : ℤ) % 2 = (b : ℤ) % 2) (hac : (a : ℤ) % 2 ≠ (c : ℤ) % 2) :
    TripleWords a b c r ≃ MixedWords a b c r where
  toFun := tripleMixedTo ha hb hab hac
  invFun := tripleMixedFrom
  left_inv w := by
    by_cases h : w.val.1.Full <;> simp [tripleMixedTo, h, tripleMixedFrom]
  right_inv w := by
    rcases w with w | w
    · simp [tripleMixedFrom, tripleMixedTo, w.1.property]
    · simp [tripleMixedFrom, tripleMixedTo, w.1.property]

private theorem positive_thetaLengths (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    ∀ p, 0 < thetaLengths a b c p := by
  intro p
  fin_cases p <;> assumption

theorem theta_facet_card_same_parity (a b c : ℕ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (hab : (a : ℤ) % 2 = (b : ℤ) % 2) (hac : (a : ℤ) % 2 = (c : ℤ) % 2) :
    Nat.card {F // IsFacet (thetaGraph (thetaLengths a b c)) F} =
      ∑ r : ThetaTotal a, binomialSignCount a r.val * binomialSignCount b r.val * binomialSignCount c r.val := by
  classical
  rw [theta_facet_card_eq_total_fibers (positive_thetaLengths ha hb hc)]
  apply Finset.sum_congr rfl
  intro r _
  rw [Nat.card_congr ((thetaTripleEquiv a b c r.val).trans (tripleSameParityEquiv ha hb hc hab hac))]
  simp [Nat.card_prod, card_fullWords, mul_assoc]

theorem theta_facet_card_mixed_parity (a b c : ℕ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (hab : (a : ℤ) % 2 = (b : ℤ) % 2) (hac : (a : ℤ) % 2 ≠ (c : ℤ) % 2) :
    Nat.card {F // IsFacet (thetaGraph (thetaLengths a b c)) F} =
      a * b * (∑ r : ThetaTotal a, binomialSignCount (a - 1) r.val * binomialSignCount (b - 1) r.val * binomialSignCount c r.val) +
      c * (∑ r : ThetaTotal a, binomialSignCount a r.val * binomialSignCount b r.val * binomialSignCount (c - 1) r.val) := by
  classical
  rw [theta_facet_card_eq_total_fibers (positive_thetaLengths ha hb hc), Finset.mul_sum, Finset.mul_sum,
    ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro r _
  rw [Nat.card_congr ((thetaTripleEquiv a b c r.val).trans (tripleMixedEquiv ha hb hab hac))]
  simp only [MixedWords, Nat.card_sum, Nat.card_prod, card_fullWords, card_gapWords]
  ring

end BraunBruegge
