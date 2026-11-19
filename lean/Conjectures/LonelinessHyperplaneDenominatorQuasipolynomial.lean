import Conjectures.LonelinessHyperplaneInjectiveBoxCounting
import Conjectures.LonelinessHyperplaneDenominator

/-! The exact quasipolynomial applies to the original sampling
denominator: ordered, positive, pairwise distinct integer velocities
in [1,N] satisfying the normal relation. -/

namespace Loneliness.Hyperplane.QuasipolynomialArithmetic

open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

def positiveBoxLift {N : ℕ} (v : ι → Fin N) : ι → Fin (N + 1) :=
  fun i => ⟨(v i : ℕ) + 1, Nat.succ_lt_succ (v i).isLt⟩

omit [DecidableEq ι] in
theorem positiveBoxLift_pairing (m : ι → ℤ) {N : ℕ} (v : ι → Fin N) :
    (∑ i, m i * (positiveBoxLift v i : ℕ)) =
      integerPairing m (positiveBoxCoordinates v) := by
  simp only [positiveBoxLift, integerPairing, positiveBoxCoordinates,
    positiveBoxEntry, Nat.cast_add, Nat.cast_one]

omit [Fintype ι] [DecidableEq ι] in
theorem zeroExtended_positiveBoxLift_injective {N : ℕ} (v : ι → Fin N)
    (hv : Function.Injective v) : Function.Injective (zeroExtended (positiveBoxLift v)) := by
  intro a b hab
  cases a with
  | none =>
    cases b with
    | none => rfl
    | some j =>
      have h := congrArg Fin.val hab
      change 0 = (v j : ℕ) + 1 at h
      omega
  | some i =>
    cases b with
    | none =>
      have h := congrArg Fin.val hab
      change (v i : ℕ) + 1 = 0 at h
      omega
    | some j =>
      apply congrArg Option.some
      apply hv
      apply Fin.ext
      have h := congrArg Fin.val hab
      change (v i : ℕ) + 1 = (v j : ℕ) + 1 at h
      omega

omit [Fintype ι] [DecidableEq ι] in
theorem positive_of_zeroExtended_injective {N : ℕ} (v : ι → Fin (N + 1))
    (hv : Function.Injective (zeroExtended v)) (i : ι) : 0 < (v i : ℕ) := by
  by_contra h
  have hzero : v i = 0 := by
    apply Fin.ext
    change (v i : ℕ) = 0
    omega
  have he : (some i : Option ι) = none := hv hzero
  exact Option.some_ne_none i he

def positiveBoxLower {N : ℕ} (v : ι → Fin (N + 1))
    (hv : Function.Injective (zeroExtended v)) : ι → Fin N :=
  fun i => ⟨(v i : ℕ) - 1, by
    have hpos := positive_of_zeroExtended_injective v hv i
    have hlt := (v i).isLt
    omega⟩

omit [Fintype ι] [DecidableEq ι] in
theorem positiveBoxLift_lower {N : ℕ} (v : ι → Fin (N + 1))
    (hv : Function.Injective (zeroExtended v)) :
    positiveBoxLift (positiveBoxLower v hv) = v := by
  funext i
  apply Fin.ext
  have hpos := positive_of_zeroExtended_injective v hv i
  change (v i : ℕ) - 1 + 1 = (v i : ℕ)
  omega

omit [Fintype ι] [DecidableEq ι] in
theorem positiveBoxLower_injective {N : ℕ} (v : ι → Fin (N + 1))
    (hv : Function.Injective (zeroExtended v)) :
    Function.Injective (positiveBoxLower v hv) := by
  intro i j hij
  apply Option.some.inj
  apply hv
  change v i = v j
  have h := congrArg (fun x : Fin N => (x : ℕ)) hij
  have hi := positive_of_zeroExtended_injective v hv i
  have hj := positive_of_zeroExtended_injective v hv j
  apply Fin.ext
  change (v i : ℕ) - 1 = (v j : ℕ) - 1 at h
  omega

/-- The bridge uses the exact finite sampling set from the probability
theorems, rather than an asymptotically equivalent replacement. -/
def positiveBoxAdmissibleEquiv (m : ι → ℤ) (N : ℕ) :
    ↥(positiveBoxAdmissible m N) ≃ injectiveRelationBox m N where
  toFun v := ⟨⟨positiveBoxLift v.1, by
      rw [positiveBoxLift_pairing]
      exact (Finset.mem_filter.mp v.2).2.1⟩,
    zeroExtended_positiveBoxLift_injective v.1 (Finset.mem_filter.mp v.2).2.2⟩
  invFun w := ⟨positiveBoxLower w.1.1 w.2, by
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ _, ?_, positiveBoxLower_injective w.1.1 w.2⟩
    rw [← positiveBoxLift_pairing, positiveBoxLift_lower]
    exact w.1.2⟩
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

theorem positiveBoxAdmissible_card_eq (m : ι → ℤ) (N : ℕ) :
    (positiveBoxAdmissible m N).card = Nat.card (injectiveRelationBox m N) := by
  have h := Nat.card_congr (positiveBoxAdmissibleEquiv m N)
  simpa only [Nat.card_eq_fintype_card, Fintype.card_coe] using h

end

end Loneliness.Hyperplane.QuasipolynomialArithmetic

namespace Loneliness.Hyperplane

open Polynomial QuasipolynomialArithmetic

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

theorem positiveBoxAdmissible_isQuasipolynomial_of_nonzero
    (m : ι → ℤ) (hm : m ≠ 0) :
    IsQuasipolynomial (fun N => ((positiveBoxAdmissible m N).card : ℚ))
      (Fintype.card ι - 1) := by
  apply (injectiveRelationBox_isQuasipolynomial m hm).congr
  intro N
  exact congrArg (fun n : ℕ => (n : ℚ)) (positiveBoxAdmissible_card_eq m N).symm

/-- Exact polynomial formulas on residue classes, for all N ≥ 0. -/
theorem positiveBoxAdmissible_quasipolynomial (m : ι → ℤ) (hm : PrimitiveNormal m) :
    ∃ M : ℕ, 0 < M ∧ ∃ P : Fin M → ℚ[X],
      (∀ r, (P r).natDegree ≤ Fintype.card ι - 1) ∧
      ∀ (r : Fin M) (n : ℕ),
        ((positiveBoxAdmissible m (M * n + r)).card : ℚ) = (P r).eval (n : ℚ) := by
  have hmne : m ≠ 0 := by
    intro hzero
    obtain ⟨i, hi⟩ := primitive_exists_nonzero m hm
    exact hi (congrFun hzero i)
  exact positiveBoxAdmissible_isQuasipolynomial_of_nonzero m hmne

end

end Loneliness.Hyperplane
