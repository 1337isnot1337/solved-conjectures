import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Finset.Max
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum

/-! The eighty primitive signed coefficient forms of total absolute weight
three, normalized so that their first nonzero coefficient is positive.
These include all doubled two-coordinate and signed three-coordinate forms.
No positivity of the speeds is imposed at this modular stage. -/

namespace Loneliness.FiveSpeedRoot

open scoped BigOperators

abbrev Row := Fin 5 → ℤ

def coefficientWeight (r : Row) : ℕ := ∑ i, (r i).natAbs

def ShortShape (r : Row) : Prop :=
  coefficientWeight r = 3 ∧ ∀ i, (r i).natAbs ≤ 2

def FirstPositive (r : Row) : Prop :=
  ∃ i : Fin 5, 0 < r i ∧ ∀ j : Fin 5, j < i → r j = 0

def CanonicalForm (r : Row) : Prop := ShortShape r ∧ FirstPositive r

instance (r : Row) : Decidable (ShortShape r) :=
  inferInstanceAs (Decidable (coefficientWeight r = 3 ∧ ∀ i, (r i).natAbs ≤ 2))

instance (r : Row) : Decidable (FirstPositive r) :=
  inferInstanceAs (Decidable (∃ i : Fin 5, 0 < r i ∧ ∀ j : Fin 5, j < i → r j = 0))

instance (r : Row) : Decidable (CanonicalForm r) :=
  inferInstanceAs (Decidable (ShortShape r ∧ FirstPositive r))

/-- Lexicographic coefficient-vector order. -/
def formRows : Fin 80 → Row :=
  ![![0, 0, 0, 1, -2],
    ![0, 0, 0, 1, 2],
    ![0, 0, 0, 2, -1],
    ![0, 0, 0, 2, 1],
    ![0, 0, 1, -2, 0],
    ![0, 0, 1, -1, -1],
    ![0, 0, 1, -1, 1],
    ![0, 0, 1, 0, -2],
    ![0, 0, 1, 0, 2],
    ![0, 0, 1, 1, -1],
    ![0, 0, 1, 1, 1],
    ![0, 0, 1, 2, 0],
    ![0, 0, 2, -1, 0],
    ![0, 0, 2, 0, -1],
    ![0, 0, 2, 0, 1],
    ![0, 0, 2, 1, 0],
    ![0, 1, -2, 0, 0],
    ![0, 1, -1, -1, 0],
    ![0, 1, -1, 0, -1],
    ![0, 1, -1, 0, 1],
    ![0, 1, -1, 1, 0],
    ![0, 1, 0, -2, 0],
    ![0, 1, 0, -1, -1],
    ![0, 1, 0, -1, 1],
    ![0, 1, 0, 0, -2],
    ![0, 1, 0, 0, 2],
    ![0, 1, 0, 1, -1],
    ![0, 1, 0, 1, 1],
    ![0, 1, 0, 2, 0],
    ![0, 1, 1, -1, 0],
    ![0, 1, 1, 0, -1],
    ![0, 1, 1, 0, 1],
    ![0, 1, 1, 1, 0],
    ![0, 1, 2, 0, 0],
    ![0, 2, -1, 0, 0],
    ![0, 2, 0, -1, 0],
    ![0, 2, 0, 0, -1],
    ![0, 2, 0, 0, 1],
    ![0, 2, 0, 1, 0],
    ![0, 2, 1, 0, 0],
    ![1, -2, 0, 0, 0],
    ![1, -1, -1, 0, 0],
    ![1, -1, 0, -1, 0],
    ![1, -1, 0, 0, -1],
    ![1, -1, 0, 0, 1],
    ![1, -1, 0, 1, 0],
    ![1, -1, 1, 0, 0],
    ![1, 0, -2, 0, 0],
    ![1, 0, -1, -1, 0],
    ![1, 0, -1, 0, -1],
    ![1, 0, -1, 0, 1],
    ![1, 0, -1, 1, 0],
    ![1, 0, 0, -2, 0],
    ![1, 0, 0, -1, -1],
    ![1, 0, 0, -1, 1],
    ![1, 0, 0, 0, -2],
    ![1, 0, 0, 0, 2],
    ![1, 0, 0, 1, -1],
    ![1, 0, 0, 1, 1],
    ![1, 0, 0, 2, 0],
    ![1, 0, 1, -1, 0],
    ![1, 0, 1, 0, -1],
    ![1, 0, 1, 0, 1],
    ![1, 0, 1, 1, 0],
    ![1, 0, 2, 0, 0],
    ![1, 1, -1, 0, 0],
    ![1, 1, 0, -1, 0],
    ![1, 1, 0, 0, -1],
    ![1, 1, 0, 0, 1],
    ![1, 1, 0, 1, 0],
    ![1, 1, 1, 0, 0],
    ![1, 2, 0, 0, 0],
    ![2, -1, 0, 0, 0],
    ![2, 0, -1, 0, 0],
    ![2, 0, 0, -1, 0],
    ![2, 0, 0, 0, -1],
    ![2, 0, 0, 0, 1],
    ![2, 0, 0, 1, 0],
    ![2, 0, 1, 0, 0],
    ![2, 1, 0, 0, 0]]

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
theorem formRows_spec : ∀ a : Fin 80, CanonicalForm (formRows a) := by
  decide +kernel

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
private theorem formRows_pointwise_injective_checked :
    ∀ a b : Fin 80, (∀ i : Fin 5, formRows a i = formRows b i) → a = b := by
  decide +kernel

theorem formRows_injective : Function.Injective formRows := by
  intro a b h
  exact formRows_pointwise_injective_checked a b (fun i => congrFun h i)

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
private theorem formRows_not_negative_checked :
    ∀ a b : Fin 80, ∃ i : Fin 5, formRows a i ≠ -(formRows b i) := by
  decide +kernel

theorem formRows_ne_neg (a b : Fin 80) : formRows a ≠ -formRows b := by
  intro h
  obtain ⟨i, hi⟩ := formRows_not_negative_checked a b
  exact hi (congrFun h i)

theorem formRows_eq_up_to_sign_iff (a b : Fin 80) :
    formRows a = formRows b ∨ formRows a = -formRows b ↔ a = b := by
  constructor
  · rintro (h | h)
    · exact formRows_injective h
    · exact False.elim (formRows_ne_neg a b h)
  · rintro rfl
    exact Or.inl rfl

def decodeCoefficient (a : Fin 5) : ℤ := (a.val : ℤ) - 2

set_option maxRecDepth 10000 in
set_option maxHeartbeats 0 in
private theorem formRows_complete_checked :
    ∀ a b c d e : Fin 5,
      CanonicalForm (![decodeCoefficient a, decodeCoefficient b, decodeCoefficient c,
        decodeCoefficient d, decodeCoefficient e] : Row) →
      ∃ j : Fin 80, ∀ i : Fin 5,
        formRows j i = (![decodeCoefficient a, decodeCoefficient b, decodeCoefficient c,
          decodeCoefficient d, decodeCoefficient e] : Row) i := by
  decide +kernel

theorem short_coordinate_bounds {r : Row} (hr : ShortShape r) (i : Fin 5) :
    -(2 : ℤ) ≤ r i ∧ r i ≤ 2 := by
  have hp := Int.le_natAbs (a := r i)
  have hn : -(r i) ≤ ((r i).natAbs : ℤ) := by
    simpa only [Int.natAbs_neg] using (Int.le_natAbs (a := -(r i)))
  have hb := hr.2 i
  omega

def encodeRow (r : Row) (hr : ShortShape r) : Fin 5 → Fin 5 :=
  fun i => ⟨(r i + 2).toNat, by
    have h := short_coordinate_bounds hr i
    omega⟩

theorem decode_encodeRow (r : Row) (hr : ShortShape r) (i : Fin 5) :
    decodeCoefficient (encodeRow r hr i) = r i := by
  have h := short_coordinate_bounds hr i
  change ((r i + 2).toNat : ℤ) - 2 = r i
  rw [Int.toNat_of_nonneg (by omega)]
  omega

theorem formRows_complete (r : Row) (hr : CanonicalForm r) :
    ∃ a : Fin 80, formRows a = r := by
  let code := encodeRow r hr.1
  have hdecode : (![decodeCoefficient (code 0), decodeCoefficient (code 1),
      decodeCoefficient (code 2), decodeCoefficient (code 3),
      decodeCoefficient (code 4)] : Row) = r := by
    funext i
    fin_cases i <;> exact decode_encodeRow r hr.1 _
  have hcanonical := hr
  rw [← hdecode] at hcanonical
  obtain ⟨a, ha⟩ := formRows_complete_checked (code 0) (code 1) (code 2)
    (code 3) (code 4) hcanonical
  refine ⟨a, ?_⟩
  exact (funext ha).trans hdecode

theorem formRows_range_card : (Finset.univ.image formRows).card = 80 := by
  classical
  rw [Finset.card_image_of_injective _ formRows_injective]
  simp

theorem shortShape_neg {r : Row} (hr : ShortShape r) : ShortShape (-r) := by
  simpa only [ShortShape, coefficientWeight, Pi.neg_apply, Int.natAbs_neg] using hr

theorem firstPositive_or_neg {r : Row} (hr : ShortShape r) :
    FirstPositive r ∨ FirstPositive (-r) := by
  classical
  have hex : ∃ i : Fin 5, r i ≠ 0 := by
    by_contra h
    have hz : ∀ i : Fin 5, r i = 0 := by
      intro i
      by_contra hi
      exact h ⟨i, hi⟩
    have hw := hr.1
    simp [coefficientWeight, hz] at hw
  let s := Finset.univ.filter (fun i : Fin 5 => r i ≠ 0)
  have hs : s.Nonempty := by
    obtain ⟨i, hi⟩ := hex
    exact ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hi⟩⟩
  let i := s.min' hs
  have hi : r i ≠ 0 := (Finset.mem_filter.mp (Finset.min'_mem s hs)).2
  have hprev : ∀ j : Fin 5, j < i → r j = 0 := by
    intro j hj
    by_contra hz
    have hmem : j ∈ s := Finset.mem_filter.mpr ⟨Finset.mem_univ _, hz⟩
    have hle : i ≤ j := Finset.min'_le s j hmem
    exact (not_le_of_gt hj) hle
  by_cases hpos : 0 < r i
  · exact Or.inl ⟨i, hpos, hprev⟩
  · right
    refine ⟨i, ?_, ?_⟩
    · change 0 < -(r i)
      omega
    · intro j hj
      change -(r j) = 0
      simp only [hprev j hj, neg_zero]

def canonicalize (r : Row) : Row := if FirstPositive r then r else -r

theorem canonicalize_eq_or_neg (r : Row) : canonicalize r = r ∨ canonicalize r = -r := by
  by_cases h : FirstPositive r
  · exact Or.inl (ite_eq_left h)
  · exact Or.inr (ite_eq_right h)

theorem canonicalize_spec {r : Row} (hr : ShortShape r) : CanonicalForm (canonicalize r) := by
  by_cases h : FirstPositive r
  · rw [canonicalize, ite_eq_left h]
    exact ⟨hr, h⟩
  · have hn : FirstPositive (-r) := (firstPositive_or_neg hr).resolve_left h
    rw [canonicalize, ite_eq_right h]
    exact ⟨shortShape_neg hr, hn⟩

theorem canonicalize_eq_implies_eq_or_neg (r s : Row)
    (h : canonicalize r = canonicalize s) : r = s ∨ r = -s := by
  by_cases hr : FirstPositive r
  · by_cases hs : FirstPositive s
    · exact Or.inl (by simpa only [canonicalize, ite_eq_left hr, ite_eq_left hs] using h)
    · exact Or.inr (by simpa only [canonicalize, ite_eq_left hr, ite_eq_right hs] using h)
  · by_cases hs : FirstPositive s
    · right
      have h' : -r = s := by simpa only [canonicalize, ite_eq_right hr, ite_eq_left hs] using h
      funext i
      have hi := congrFun h' i
      change -(r i) = s i at hi
      change r i = -(s i)
      omega
    · left
      have h' : -r = -s := by simpa only [canonicalize, ite_eq_right hr, ite_eq_right hs] using h
      exact neg_injective h'

def signPerm (σ : Fin 5 → ℤ) (p : Equiv.Perm (Fin 5)) (r : Row) : Row :=
  fun i => σ i * r (p i)

theorem shortShape_signPerm {r : Row} (hr : ShortShape r)
    (σ : Fin 5 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
    (p : Equiv.Perm (Fin 5)) : ShortShape (signPerm σ p r) := by
  have hσabs (i : Fin 5) : (σ i).natAbs = 1 := by
    rcases hσ i with h | h <;> simp [h]
  constructor
  · calc
      coefficientWeight (signPerm σ p r) = ∑ i : Fin 5, (r (p i)).natAbs := by
        simp only [coefficientWeight, signPerm, Int.natAbs_mul, hσabs, one_mul]
      _ = coefficientWeight r := Equiv.sum_comp p (fun i => (r i).natAbs)
      _ = 3 := hr.1
  · intro i
    simpa only [signPerm, Int.natAbs_mul, hσabs, one_mul] using hr.2 (p i)

theorem signPerm_injective (σ : Fin 5 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1)
    (p : Equiv.Perm (Fin 5)) : Function.Injective (signPerm σ p) := by
  intro r s h
  funext j
  have hσne : σ (p.symm j) ≠ 0 := by
    rcases hσ (p.symm j) with h | h <;> simp [h]
  have hi := congrFun h (p.symm j)
  change σ (p.symm j) * r (p (p.symm j)) = σ (p.symm j) * s (p (p.symm j)) at hi
  simpa only [Equiv.apply_symm_apply] using mul_left_cancel₀ hσne hi

theorem signPerm_neg (σ : Fin 5 → ℤ) (p : Equiv.Perm (Fin 5)) (r : Row) :
    signPerm σ p (-r) = -signPerm σ p r := by
  funext i
  simp only [signPerm, Pi.neg_apply, mul_neg]

theorem formRows_signPerm_exists (a : Fin 80) (σ : Fin 5 → ℤ)
    (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm (Fin 5)) :
    ∃ b : Fin 80, formRows b = canonicalize (signPerm σ p (formRows a)) :=
  formRows_complete _ (canonicalize_spec (shortShape_signPerm (formRows_spec a).1 σ hσ p))

theorem two_distinct_forms_signPerm (a b : Fin 80) (hab : a ≠ b)
    (σ : Fin 5 → ℤ) (hσ : ∀ i, σ i = 1 ∨ σ i = -1) (p : Equiv.Perm (Fin 5)) :
    ∃ c d : Fin 80, c ≠ d ∧
      (formRows c = signPerm σ p (formRows a) ∨ formRows c = -signPerm σ p (formRows a)) ∧
      (formRows d = signPerm σ p (formRows b) ∨ formRows d = -signPerm σ p (formRows b)) := by
  obtain ⟨c, hc⟩ := formRows_signPerm_exists a σ hσ p
  obtain ⟨d, hd⟩ := formRows_signPerm_exists b σ hσ p
  have hcd : c ≠ d := by
    intro heq
    have hcan : canonicalize (signPerm σ p (formRows a)) =
        canonicalize (signPerm σ p (formRows b)) := by
      rw [← hc, ← hd, heq]
    rcases canonicalize_eq_implies_eq_or_neg _ _ hcan with h | h
    · exact hab (formRows_injective (signPerm_injective σ hσ p h))
    · have h' : signPerm σ p (formRows a) = signPerm σ p (-formRows b) := by
        simpa only [signPerm_neg] using h
      exact formRows_ne_neg a b (signPerm_injective σ hσ p h')
  refine ⟨c, d, hcd, ?_, ?_⟩
  · rw [hc]
    exact canonicalize_eq_or_neg _
  · rw [hd]
    exact canonicalize_eq_or_neg _

end Loneliness.FiveSpeedRoot
