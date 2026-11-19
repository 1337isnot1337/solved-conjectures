import Conjectures.LonelinessHyperplaneQuasipolynomialClosure
import Mathlib.Data.Fintype.EquivFin

/-! Exact compression of coordinate identifications. A distinguished
class is fixed at zero; every other class becomes one box coordinate,
whose normal coefficient is the sum of the original coefficients in
that class. -/

namespace Loneliness.Hyperplane.QuasipolynomialArithmetic

open scoped BigOperators

noncomputable section

variable {ι κ : Type*} [Fintype ι] [DecidableEq ι] [Fintype κ] [DecidableEq κ]

def zeroExtended {N : ℕ} (v : ι → Fin (N + 1)) : Option ι → Fin (N + 1)
  | none => 0
  | some i => v i

abbrev freeClasses (π : Option ι → κ) := {q : κ // q ≠ π none}

def classExtension {N : ℕ} (π : Option ι → κ)
    (w : freeClasses π → Fin (N + 1)) (q : κ) : Fin (N + 1) :=
  if hq : q = π none then 0 else w ⟨q, hq⟩

@[simp] theorem classExtension_zero {N : ℕ} (π : Option ι → κ)
    (w : freeClasses π → Fin (N + 1)) : classExtension π w (π none) = 0 := by
  simp only [classExtension, dif_pos rfl]

theorem classExtension_free {N : ℕ} (π : Option ι → κ)
    (w : freeClasses π → Fin (N + 1)) (q : freeClasses π) :
    classExtension π w q.1 = w q := by
  simp only [classExtension, dif_neg q.2]

def pullbackCoordinates {N : ℕ} (π : Option ι → κ)
    (w : freeClasses π → Fin (N + 1)) : ι → Fin (N + 1) :=
  fun i => classExtension π w (π (some i))

theorem zeroExtended_pullback {N : ℕ} (π : Option ι → κ)
    (w : freeClasses π → Fin (N + 1)) (a : Option ι) :
    zeroExtended (pullbackCoordinates π w) a = classExtension π w (π a) := by
  cases a with
  | none => simp only [zeroExtended, classExtension_zero]
  | some i => rfl

def compressedNormal (m : ι → ℤ) (π : Option ι → κ) : freeClasses π → ℤ :=
  fun q => ∑ i, if π (some i) = q.1 then m i else 0

theorem compressed_pairing (m : ι → ℤ) (π : Option ι → κ) {N : ℕ}
    (w : freeClasses π → Fin (N + 1)) :
    (∑ q, compressedNormal m π q * (w q : ℕ)) =
      ∑ i, m i * (pullbackCoordinates π w i : ℕ) := by
  simp only [compressedNormal, Finset.sum_mul]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro i _
  by_cases hi : π (some i) = π none
  · have hterms : ∀ q : freeClasses π,
        ((if π (some i) = q.1 then m i else 0) * (w q : ℕ) : ℤ) = 0 := by
      intro q
      have hne : π (some i) ≠ q.1 := by
        intro h
        exact q.2 (h.symm.trans hi)
      rw [if_neg hne, zero_mul]
    rw [Finset.sum_eq_zero (fun q _ => hterms q)]
    simp only [pullbackCoordinates, hi, classExtension_zero, Fin.val_zero,
      Nat.cast_zero, mul_zero]
  · let q : freeClasses π := ⟨π (some i), hi⟩
    rw [Finset.sum_eq_single q]
    · simp only [q, if_pos rfl, pullbackCoordinates, classExtension, dif_neg hi]
    · intro b _ hb
      have hne : π (some i) ≠ b.1 := by
        intro h
        apply hb
        exact Subtype.ext h.symm
      rw [if_neg hne, zero_mul]
    · simp

def coarsenedRelationBox (m : ι → ℤ) (π : Option ι → κ) (N : ℕ) : Type _ :=
  {v : closedRelationBox m N //
    ∀ a b, π a = π b → zeroExtended v.1 a = zeroExtended v.1 b}

def chosenClassCoordinates {N : ℕ} (π : Option ι → κ) (hπ : Function.Surjective π)
    (v : ι → Fin (N + 1)) : freeClasses π → Fin (N + 1) :=
  fun q => zeroExtended v (Function.surjInv hπ q.1)

theorem chosenClassCoordinates_extension {N : ℕ}
    (π : Option ι → κ) (hπ : Function.Surjective π) (v : ι → Fin (N + 1))
    (hv : ∀ a b, π a = π b → zeroExtended v a = zeroExtended v b) (a : Option ι) :
    classExtension π (chosenClassCoordinates π hπ v) (π a) = zeroExtended v a := by
  by_cases ha : π a = π none
  · rw [ha, classExtension_zero]
    exact (hv a none ha).symm
  · simp only [classExtension, dif_neg ha, chosenClassCoordinates]
    exact hv _ a (Function.surjInv_eq hπ (π a))

theorem chosenClassCoordinates_pullback {N : ℕ}
    (π : Option ι → κ) (hπ : Function.Surjective π) (v : ι → Fin (N + 1))
    (hv : ∀ a b, π a = π b → zeroExtended v a = zeroExtended v b) :
    pullbackCoordinates π (chosenClassCoordinates π hπ v) = v := by
  funext i
  exact chosenClassCoordinates_extension π hπ v hv (some i)

/-- This is a bijection of the actual constrained solution types. -/
def coarsenedRelationBoxEquiv (m : ι → ℤ) (π : Option ι → κ)
    (hπ : Function.Surjective π) (N : ℕ) :
    coarsenedRelationBox m π N ≃ closedRelationBox (compressedNormal m π) N where
  toFun v := ⟨chosenClassCoordinates π hπ v.1.1, by
    rw [compressed_pairing, chosenClassCoordinates_pullback π hπ v.1.1 v.2]
    exact v.1.2⟩
  invFun w := ⟨⟨pullbackCoordinates π w.1, by
      rw [← compressed_pairing]
      exact w.2⟩, by
    intro a b hab
    rw [zeroExtended_pullback, zeroExtended_pullback, hab]⟩
  left_inv v := by
    apply Subtype.ext
    apply Subtype.ext
    exact chosenClassCoordinates_pullback π hπ v.1.1 v.2
  right_inv w := by
    apply Subtype.ext
    funext q
    change zeroExtended (pullbackCoordinates π w.1) (Function.surjInv hπ q.1) = w.1 q
    rw [zeroExtended_pullback, Function.surjInv_eq]
    exact classExtension_free π w.1 q

theorem freeClasses_card_le (π : Option ι → κ) (hπ : Function.Surjective π) :
    Fintype.card (freeClasses π) ≤ Fintype.card ι := by
  have hfree : Fintype.card (freeClasses π) < Fintype.card κ :=
    Fintype.card_subtype_lt (x := π none) (fun h => h rfl)
  have hquot := Fintype.card_le_of_surjective π hπ
  simp only [Fintype.card_option] at hquot
  omega

theorem freeClasses_card_le_of_noninjective
    (π : Option ι → κ) (hπ : Function.Surjective π) (hnπ : ¬ Function.Injective π) :
    Fintype.card (freeClasses π) ≤ Fintype.card ι - 1 := by
  have hfree : Fintype.card (freeClasses π) < Fintype.card κ :=
    Fintype.card_subtype_lt (x := π none) (fun h => h rfl)
  have hquot := Fintype.card_lt_of_surjective_not_injective π hπ hnπ
  simp only [Fintype.card_option] at hquot
  omega

theorem coarsenedRelationBox_isQuasipolynomial
    (m : ι → ℤ) (π : Option ι → κ) (hπ : Function.Surjective π) :
    IsQuasipolynomial (fun N => (Nat.card (coarsenedRelationBox m π N) : ℚ))
      (Fintype.card ι) := by
  have h := closedRelationBox_isQuasipolynomial (compressedNormal m π)
  have hdegree : (if compressedNormal m π = 0 then Fintype.card (freeClasses π)
      else Fintype.card (freeClasses π) - 1) ≤ Fintype.card ι := by
    have hb := freeClasses_card_le π hπ
    split_ifs <;> omega
  apply (h.mono_degree hdegree).congr
  intro N
  exact congrArg (fun n : ℕ => (n : ℚ))
    (Nat.card_congr (coarsenedRelationBoxEquiv m π hπ N)).symm

theorem coarsenedRelationBox_isQuasipolynomial_of_noninjective
    (m : ι → ℤ) (π : Option ι → κ) (hπ : Function.Surjective π)
    (hnπ : ¬ Function.Injective π) :
    IsQuasipolynomial (fun N => (Nat.card (coarsenedRelationBox m π N) : ℚ))
      (Fintype.card ι - 1) := by
  have h := closedRelationBox_isQuasipolynomial (compressedNormal m π)
  have hdegree : (if compressedNormal m π = 0 then Fintype.card (freeClasses π)
      else Fintype.card (freeClasses π) - 1) ≤ Fintype.card ι - 1 := by
    have hb := freeClasses_card_le_of_noninjective π hπ hnπ
    split_ifs <;> omega
  apply (h.mono_degree hdegree).congr
  intro N
  exact congrArg (fun n : ℕ => (n : ℚ))
    (Nat.card_congr (coarsenedRelationBoxEquiv m π hπ N)).symm

end

end Loneliness.Hyperplane.QuasipolynomialArithmetic
