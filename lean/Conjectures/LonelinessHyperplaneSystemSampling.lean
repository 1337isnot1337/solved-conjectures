import Conjectures.LonelinessHyperplaneSystemCounting
import Conjectures.LonelinessHyperplaneDenominatorQuasipolynomial

/-!
# Positive distinct sampling with any integer equation system

Coordinate-zero and coordinate-equality events are actual additional integer
rows. Inclusion-exclusion therefore transfers the closed-system formulas to
the original ordered positive, pairwise distinct sampling variables.
-/

namespace Loneliness.Hyperplane.RationalCone

open scoped BigOperators
open QuasipolynomialArithmetic

noncomputable section

variable {ι : Type*} [Fintype ι]

local instance systemSamplingDecidableEq : DecidableEq ι := Classical.decEq ι

def optionCoordinateRow (a : Option ι) : ι → ℤ := by
  classical
  exact a.elim 0 (fun i => Pi.single i 1)

def collisionNormal (e : collisionPair ι) : ι → ℤ :=
  optionCoordinateRow e.1.1 - optionCoordinateRow e.1.2

theorem optionCoordinateRow_pairing (a : Option ι) {N : ℕ}
    (v : ι → Fin (N + 1)) :
    (∑ i, optionCoordinateRow a i * (v i : ℕ)) =
      ((zeroExtended v a : Fin (N + 1)) : ℕ) := by
  classical
  cases a <;> simp [optionCoordinateRow, zeroExtended, Pi.single_apply]

theorem collisionNormal_pairing {N : ℕ} (e : collisionPair ι)
    (v : ι → Fin (N + 1)) :
    (∑ i, collisionNormal e i * (v i : ℕ)) =
      (((zeroExtended v e.1.1 : Fin (N + 1)) : ℕ) : ℤ) -
        (((zeroExtended v e.1.2 : Fin (N + 1)) : ℕ) : ℤ) := by
  simp only [collisionNormal, Pi.sub_apply, sub_mul, Finset.sum_sub_distrib,
    optionCoordinateRow_pairing]

theorem collisionNormal_pairing_eq_zero_iff {N : ℕ} (e : collisionPair ι)
    (v : ι → Fin (N + 1)) :
    (∑ i, collisionNormal e i * (v i : ℕ)) = 0 ↔
      zeroExtended v e.1.1 = zeroExtended v e.1.2 := by
  rw [collisionNormal_pairing, sub_eq_zero]
  constructor
  · intro h
    apply Fin.ext
    exact_mod_cast h
  · intro h
    exact congrArg (fun x : Fin (N + 1) => ((x : ℕ) : ℤ)) h

def withCollisionRows (rows : Set (ι → ℤ)) (S : Finset (collisionPair ι)) :
    Set (ι → ℤ) := rows ∪ collisionNormal '' (S : Set (collisionPair ι))

theorem withCollisionRows_conditions (rows : Set (ι → ℤ))
    (S : Finset (collisionPair ι)) {N : ℕ} (v : ι → Fin (N + 1)) :
    (∀ m ∈ withCollisionRows rows S, (∑ i, m i * (v i : ℕ)) = 0) ↔
      (∀ m ∈ rows, (∑ i, m i * (v i : ℕ)) = 0) ∧
        ∀ e ∈ S, zeroExtended v e.1.1 = zeroExtended v e.1.2 := by
  constructor
  · intro h
    refine ⟨fun m hm => h m (Or.inl hm), ?_⟩
    intro e he
    exact (collisionNormal_pairing_eq_zero_iff e v).mp
      (h (collisionNormal e) (Or.inr ⟨e, he, rfl⟩))
  · rintro ⟨hrows, hcollisions⟩ m hm
    rcases hm with hm | ⟨e, he, rfl⟩
    · exact hrows m hm
    · exact (collisionNormal_pairing_eq_zero_iff e v).mpr (hcollisions e he)

def collisionSystemBox (rows : Set (ι → ℤ))
    (S : Finset (collisionPair ι)) (N : ℕ) : Type _ :=
  {v : closedSystemBox rows N //
    ∀ e ∈ S, zeroExtended v.1 e.1.1 = zeroExtended v.1 e.1.2}

def collisionSystemBoxEquiv (rows : Set (ι → ℤ))
    (S : Finset (collisionPair ι)) (N : ℕ) :
    collisionSystemBox rows S N ≃ closedSystemBox (withCollisionRows rows S) N where
  toFun v := ⟨v.1.1, (withCollisionRows_conditions rows S v.1.1).mpr ⟨v.1.2, v.2⟩⟩
  invFun v := ⟨⟨v.1, ((withCollisionRows_conditions rows S v.1).mp v.2).1⟩,
    ((withCollisionRows_conditions rows S v.1).mp v.2).2⟩
  left_inv _ := rfl
  right_inv _ := rfl

theorem collisionSystemBox_quasipolynomial_on_positive
    (rows : Set (ι → ℤ)) (S : Finset (collisionPair ι)) :
    ∃ q : ℕ → ℚ, IsQuasipolynomial q (Fintype.card ι) ∧
      ∀ N : ℕ, 0 < N → q N = (Nat.card (collisionSystemBox rows S N) : ℚ) := by
  obtain ⟨q, hq, heq⟩ := closedSystemBox_quasipolynomial_on_positive (withCollisionRows rows S)
  refine ⟨q, hq, ?_⟩
  intro N hN
  rw [heq N hN]
  exact congrArg (fun n : ℕ => (n : ℚ))
    (Nat.card_congr (collisionSystemBoxEquiv rows S N)).symm

def injectiveSystemBox (rows : Set (ι → ℤ)) (N : ℕ) : Type _ :=
  {v : closedSystemBox rows N // Function.Injective (zeroExtended v.1)}

private theorem mem_sampling_inf {α β : Type*} [Fintype β] [DecidableEq β]
    (S : Finset α) (F : α → Finset β) (x : β) :
    x ∈ S.inf F ↔ ∀ i ∈ S, x ∈ F i := by
  classical
  induction S using Finset.induction_on with
  | empty => simp
  | @insert i S hi ih =>
    rw [Finset.inf_insert, Finset.inf_eq_inter, Finset.mem_inter, ih]
    simp only [Finset.forall_mem_insert]

theorem injectiveSystemBox_card_inclusion_exclusion (rows : Set (ι → ℤ)) (N : ℕ) :
    (Nat.card (injectiveSystemBox rows N) : ℤ) =
      ∑ S : Finset (collisionPair ι), (-1 : ℤ) ^ S.card *
        (Nat.card (collisionSystemBox rows S N) : ℤ) := by
  classical
  let : Fintype (closedSystemBox rows N) := Fintype.ofFinite _
  let bad : collisionPair ι → Finset (closedSystemBox rows N) := fun e =>
    Finset.univ.filter (fun v => zeroExtended v.1 e.1.1 = zeroExtended v.1 e.1.2)
  have hgood : Nat.card (injectiveSystemBox rows N) =
      (Finset.univ.inf (fun e => (bad e)ᶜ)).card := by
    apply Nat.subtype_card
    intro v
    simpa only [mem_sampling_inf, Finset.mem_univ, forall_true_left,
      Finset.mem_compl, bad, Finset.mem_filter, true_and] using
        (injective_zeroExtended_iff v.1).symm
  have hbad (S : Finset (collisionPair ι)) :
      Nat.card (collisionSystemBox rows S N) = (S.inf bad).card := by
    apply Nat.subtype_card
    intro v
    simp only [mem_sampling_inf, bad, Finset.mem_filter, Finset.mem_univ, true_and]
  have h := Finset.inclusion_exclusion_card_inf_compl Finset.univ bad
  simpa only [← hgood, ← hbad, Finset.powerset_univ] using h

theorem injectiveSystemBox_quasipolynomial_on_positive (rows : Set (ι → ℤ)) :
    ∃ q : ℕ → ℚ, IsQuasipolynomial q (Fintype.card ι) ∧
      ∀ N : ℕ, 0 < N → q N = (Nat.card (injectiveSystemBox rows N) : ℚ) := by
  classical
  choose q hq heq using fun S : Finset (collisionPair ι) =>
    collisionSystemBox_quasipolynomial_on_positive rows S
  refine ⟨fun N => ∑ S : Finset (collisionPair ι), (-1 : ℚ) ^ S.card * q S N, ?_, ?_⟩
  · exact IsQuasipolynomial.finite_linear_combination q
      (fun S => (-1 : ℚ) ^ S.card) (Fintype.card ι) hq
  · intro N hN
    have hIE := congrArg (fun z : ℤ => (z : ℚ))
      (injectiveSystemBox_card_inclusion_exclusion rows N)
    simp only [Int.cast_sum, Int.cast_mul, Int.cast_pow, Int.cast_neg,
      Int.cast_one, Int.cast_natCast] at hIE
    rw [hIE]
    apply Finset.sum_congr rfl
    intro S _
    rw [heq S N hN]

def positiveSystemBox (rows : Set (ι → ℤ)) (N : ℕ) : Finset (ι → Fin N) := by
  classical
  exact Finset.univ.filter (fun v =>
    (∀ m ∈ rows, integerPairing m (positiveBoxCoordinates v) = 0) ∧ Function.Injective v)

def positiveSystemBoxEquiv (rows : Set (ι → ℤ)) (N : ℕ) :
    ↥(positiveSystemBox rows N) ≃ injectiveSystemBox rows N := by
  classical
  exact {
    toFun v := ⟨⟨positiveBoxLift v.1, by
        intro m hm
        rw [positiveBoxLift_pairing]
        exact (Finset.mem_filter.mp v.2).2.1 m hm⟩,
      zeroExtended_positiveBoxLift_injective v.1 (Finset.mem_filter.mp v.2).2.2⟩
    invFun w := ⟨positiveBoxLower w.1.1 w.2, by
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_univ _, ?_, positiveBoxLower_injective w.1.1 w.2⟩
      intro m hm
      rw [← positiveBoxLift_pairing, positiveBoxLift_lower]
      exact w.1.2 m hm⟩
    left_inv v := by
      apply Subtype.ext
      funext i
      apply Fin.ext
      change (v.1 i : ℕ) + 1 - 1 = (v.1 i : ℕ)
      omega
    right_inv w := by
      apply Subtype.ext
      apply Subtype.ext
      exact positiveBoxLift_lower w.1.1 w.2
  }

theorem positiveSystemBox_card_eq (rows : Set (ι → ℤ)) (N : ℕ) :
    (positiveSystemBox rows N).card = Nat.card (injectiveSystemBox rows N) := by
  have h := Nat.card_congr (positiveSystemBoxEquiv rows N)
  simpa only [Nat.card_eq_fintype_card, Fintype.card_coe] using h

/-- The original positive distinct coordinates are retained literally. -/
theorem positiveSystemBox_quasipolynomial_on_positive (rows : Set (ι → ℤ)) :
    ∃ q : ℕ → ℚ, IsQuasipolynomial q (Fintype.card ι) ∧
      ∀ N : ℕ, 0 < N → q N = ((positiveSystemBox rows N).card : ℚ) := by
  obtain ⟨q, hq, heq⟩ := injectiveSystemBox_quasipolynomial_on_positive rows
  refine ⟨q, hq, ?_⟩
  intro N hN
  rw [heq N hN, positiveSystemBox_card_eq]

end

end Loneliness.Hyperplane.RationalCone
