import Conjectures.BraunBrueggeBicyclicCycleSteps
import Conjectures.BraunBrueggeBicyclicSigns

/-! Cycle facets are counted by zero-sum signs. The sole slack step in
an odd cycle specifies which position is omitted from the sign word. -/

open Finset

namespace BraunBruegge

variable {n : ℕ}

private abbrev NonSlackIndex (s : Fin (n + 3)) := {i : Fin (n + 3) // i ≠ s}

private abbrev CycleSignData (n : ℕ) :=
  SignsWithTotal (Fin (n + 3)) 0 ⊕ (Σ s : Fin (n + 3), SignsWithTotal (NonSlackIndex s) 0)

private def fullSignSteps (b : SignsWithTotal (Fin (n + 3)) 0) : CycleSteps n where
  step i := stepSign (b.val i)
  bound _ := (abs_stepSign _).le
  sum_zero := b.property
  one_slack i _ h _ := (stepSign_ne_zero (b.val i) h).elim

private def withSlack (s : Fin (n + 3)) (b : SignsWithTotal (NonSlackIndex s) 0)
    (i : Fin (n + 3)) : ℤ := if h : i = s then 0 else stepSign (b.val ⟨i, h⟩)

@[simp] private theorem withSlack_at (s : Fin (n + 3)) (b : SignsWithTotal (NonSlackIndex s) 0) :
    withSlack s b s = 0 := by simp [withSlack]

private theorem withSlack_off (s : Fin (n + 3)) (b : SignsWithTotal (NonSlackIndex s) 0)
    (i : NonSlackIndex s) : withSlack s b i.val = stepSign (b.val i) := by
  simp [withSlack, i.property]

private theorem withSlack_zero_iff {s : Fin (n + 3)} (b : SignsWithTotal (NonSlackIndex s) 0)
    (i : Fin (n + 3)) : withSlack s b i = 0 ↔ i = s := by
  by_cases h : i = s <;> simp [withSlack, h]

private def slackSignSteps (s : Fin (n + 3)) (b : SignsWithTotal (NonSlackIndex s) 0) : CycleSteps n where
  step := withSlack s b
  bound i := by
    by_cases he : i = s
    · simp [he]
    · rw [withSlack_off s b ⟨i, he⟩, abs_stepSign]
  sum_zero := by
    rw [Fintype.sum_eq_add_sum_subtype_ne _ s, withSlack_at, zero_add]
    simp_rw [withSlack_off]
    exact b.property
  one_slack i j hi hj := ((withSlack_zero_iff b i).mp hi).trans ((withSlack_zero_iff b j).mp hj).symm

private noncomputable def cycleSignsEquivSteps (n : ℕ) : CycleSignData n ≃ CycleSteps n := by
  let f : CycleSignData n → CycleSteps n := Sum.elim fullSignSteps (fun p => slackSignSteps p.1 p.2)
  apply Equiv.ofBijective f
  refine ⟨?_, ?_⟩
  · intro a b hab
    rcases a with a | ⟨s, a⟩ <;> rcases b with b | ⟨t, b⟩
    · congr 1
      apply Subtype.ext
      funext i
      exact stepSign_injective (congrArg (fun q : CycleSteps n => q.step i) hab)
    · have h : stepSign (a.val t) = withSlack t b t := congrArg (fun q : CycleSteps n => q.step t) hab
      rw [withSlack_at] at h
      exact (stepSign_ne_zero _ h).elim
    · have h : withSlack s a s = stepSign (b.val s) := congrArg (fun q : CycleSteps n => q.step s) hab
      rw [withSlack_at] at h
      exact (stepSign_ne_zero _ h.symm).elim
    · have h₀ : withSlack s a s = withSlack t b s := congrArg (fun q : CycleSteps n => q.step s) hab
      have he : s = t := (withSlack_zero_iff b s).mp (h₀.symm.trans (withSlack_at s a))
      subst t
      have h₁ : a = b := by
        apply Subtype.ext
        funext i
        have hi : withSlack s a i.val = withSlack s b i.val := congrArg (fun q : CycleSteps n => q.step i.val) hab
        rw [withSlack_off s a i, withSlack_off s b i] at hi
        exact stepSign_injective hi
      subst b
      rfl
  · intro d
    by_cases h : ∃ s, d.step s = 0
    · obtain ⟨s, hs⟩ := h
      let b (i : NonSlackIndex s) : Bool := decide (d.step i.val = 1)
      have hb (i : NonSlackIndex s) : stepSign (b i) = d.step i.val :=
        stepSign_test_of_unit_of_ne_zero (d.bound i.val) (fun he => i.property (d.one_slack i.val s he hs))
      have hsum := d.sum_zero
      rw [Fintype.sum_eq_add_sum_subtype_ne _ s, hs, zero_add] at hsum
      let signs : SignsWithTotal (NonSlackIndex s) 0 := ⟨b, by simp_rw [hb]; exact hsum⟩
      refine ⟨.inr ⟨s, signs⟩, CycleSteps.ext ?_⟩
      funext i
      change withSlack s signs i = d.step i
      by_cases he : i = s
      · subst i
        rw [withSlack_at, hs]
      · exact (withSlack_off s signs ⟨i, he⟩).trans (hb ⟨i, he⟩)
    · push Not at h
      let b (i : Fin (n + 3)) : Bool := decide (d.step i = 1)
      have hb (i : Fin (n + 3)) : stepSign (b i) = d.step i := stepSign_test_of_unit_of_ne_zero (d.bound i) (h i)
      let signs : SignsWithTotal (Fin (n + 3)) 0 := ⟨b, by simp_rw [hb]; exact d.sum_zero⟩
      exact ⟨.inl signs, CycleSteps.ext (funext hb)⟩

private theorem cycleSteps_card_split (n : ℕ) :
    Nat.card (CycleSteps n) = Nat.card (SignsWithTotal (Fin (n + 3)) 0) +
      ∑ s : Fin (n + 3), Nat.card (SignsWithTotal (NonSlackIndex s) 0) := by
  classical
  rw [← Nat.card_congr (cycleSignsEquivSteps n)]
  change Nat.card (_ ⊕ _) = _
  rw [Nat.card_sum]
  congr 1
  rw [Nat.card_eq_fintype_card, Fintype.card_sigma]
  simp only [Nat.card_eq_fintype_card]

private theorem card_nonSlackIndex (s : Fin (n + 3)) : Fintype.card (NonSlackIndex s) = n + 2 := by
  rw [Fintype.card_subtype_compl (fun i => i = s), Fintype.card_subtype_eq, Fintype.card_fin]
  omega

theorem cycle_facet_card_even (n : ℕ) (h : Even (n + 3)) :
    Nat.card {F // IsFacet (SimpleGraph.cycleGraph (n + 3)) F} = (n + 3).choose ((n + 3) / 2) := by
  rw [cycle_facet_card_eq_steps, cycleSteps_card_split,
    card_signsWithTotal_zero_of_even (by simpa using h), Fintype.card_fin]
  have ho (s : Fin (n + 3)) : Odd (Fintype.card (NonSlackIndex s)) := by
    obtain ⟨k, hk⟩ := h
    exact ⟨k - 1, by rw [card_nonSlackIndex]; omega⟩
  simp_rw [card_signsWithTotal_zero_of_odd (ho _)]
  simp

theorem cycle_facet_card_odd (n : ℕ) (h : Odd (n + 3)) :
    Nat.card {F // IsFacet (SimpleGraph.cycleGraph (n + 3)) F} = (n + 3) * (n + 2).choose ((n + 2) / 2) := by
  rw [cycle_facet_card_eq_steps, cycleSteps_card_split,
    card_signsWithTotal_zero_of_odd (by simpa using h), zero_add]
  have he (s : Fin (n + 3)) : Even (Fintype.card (NonSlackIndex s)) := by
    obtain ⟨k, hk⟩ := h
    exact ⟨k, by rw [card_nonSlackIndex]; omega⟩
  simp_rw [card_signsWithTotal_zero_of_even (he _), card_nonSlackIndex]
  simp

end BraunBruegge
