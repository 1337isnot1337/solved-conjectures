import Conjectures.ChenKhareSahiJackTheorem

/-! The source Hall product and its finite-degree specialization for the rank-five witness. -/

namespace ChenKhareSahi.Jack.Source

noncomputable section

open Matrix
open scoped Matrix

abbrev Mat (n : ℕ) (R : Type*) := Matrix (Fin n) (Fin n) R
abbrev Shape := Fin 5 → ℕ

/-- A square matrix is lower triangular with diagonal entries equal to one. -/
def UnitLower {n : ℕ} {R : Type*} [Zero R] [One R] (A : Mat n R) : Prop :=
  (∀ i, A i i = 1) ∧ ∀ i j, i < j → A i j = 0

theorem unitLower_mul {n : ℕ} {A B : Mat n ℝ} (hA : UnitLower A) (hB : UnitLower B) :
    UnitLower (A * B) := by
  constructor
  · intro i
    rw [Matrix.mul_apply, Finset.sum_eq_single i]
    · rw [hA.1, hB.1, one_mul]
    · intro j _ hji
      rcases lt_or_gt_of_ne hji with hj | hj
      · rw [hB.2 _ _ hj, mul_zero]
      · rw [hA.2 _ _ hj, zero_mul]
    · simp
  · intro i j hij
    rw [Matrix.mul_apply]
    apply Finset.sum_eq_zero
    intro k _
    by_cases hik : i < k
    · rw [hA.2 _ _ hik, zero_mul]
    · rw [hB.2 _ _ (lt_of_le_of_lt (le_of_not_gt hik) hij), mul_zero]

theorem unitLower_orthogonal {n : ℕ} {C : Mat n ℝ} (hC : UnitLower C)
    (orth : ∀ i j, i ≠ j → (C * C.transpose) i j = 0) : C = 1 := by
  have row (i : Fin n) : ∀ j, C i j = if i = j then 1 else 0 := by
    induction i using WellFoundedLT.induction with
    | ind i ih =>
      intro j
      rcases lt_trichotomy i j with h | h | h
      · simp [ne_of_lt h, hC.2 _ _ h]
      · subst j; simp [hC.1]
      · have e := orth i j (ne_of_gt h)
        simp only [Matrix.mul_apply, Matrix.transpose_apply, ih j h] at e
        simpa [ne_of_gt h] using e
  ext i j
  simpa [Matrix.one_apply] using row i j

abbrev liftQ {n : ℕ} (A : Mat n ℚ) : Mat n ℝ := (Rat.castHom ℝ).mapMatrix A

theorem liftQ_mul {n : ℕ} (A B : Mat n ℚ) : liftQ (A * B) = liftQ A * liftQ B := by
  exact map_mul _ _ _

theorem liftQ_lower {n : ℕ} {A : Mat n ℚ} (h : UnitLower A) : UnitLower (liftQ A) := by
  constructor
  · intro i
    change (A i i : ℝ) = 1
    rw [h.1]; norm_num
  · intro i j hij
    change (A i j : ℝ) = 0
    rw [h.2 i j hij]; norm_num

/-- The literal orbit sum at five natural-number variables. -/
def monAt (p x : Shape) : ℕ :=
  (((List.ofFn p).permutations'.eraseDups).map fun exps =>
    (List.ofFn fun i : Fin 5 => x i ^ exps.getD i 0).prod).sum

def parts (p : Shape) : List ℕ := (List.ofFn p).filter (· ≠ 0)

/-- The actual homogeneous power-sum product, with zero padding removed. -/
def powAt (p x : Shape) : ℕ :=
  ((parts p).map fun k => ∑ i, x i ^ k).prod

def weights {n : ℕ} (sh : Fin n → Shape) : Mat n ℚ :=
  Matrix.diagonal fun i => (zee (parts (sh i)) : ℚ)

def sampleMatrix {n : ℕ} (eval : Shape → Shape → ℕ) (sh : Fin n → Shape) : Mat n ℚ :=
  Matrix.of fun i j => (eval (sh i) (sh j) : ℚ)

/-- Rational data in a single degree. The proof checks their identities against
literal monomial evaluations, power sums and the source's Hall weights. -/
structure Block (n : ℕ) where
  sh : Fin n → Shape
  sampleInverse : Mat n ℚ
  transition : Mat n ℚ
  inverseSchur : Mat n ℚ
  schurRow : Mat n ℚ

structure ValidBlock {n : ℕ} (b : Block n) : Prop where
  invertible : sampleMatrix powAt b.sh * b.sampleInverse = 1
  transition_ok : sampleMatrix monAt b.sh * b.sampleInverse = b.transition
  hall : b.transition * weights b.sh * b.transition.transpose =
    b.inverseSchur * b.inverseSchur.transpose
  triangular : UnitLower b.inverseSchur
  undo : b.inverseSchur * b.schurRow = 1

/-- Restrictions to interpolation nodes are sufficient. Every literal Jack family
has these equal evaluations in its two basis expansions. -/
theorem source_coordinates {n : ℕ} (b : Block n) (h : ValidBlock b)
    (M P : Mat n ℝ) (hm : UnitLower M)
    (samples : M * liftQ (sampleMatrix monAt b.sh) = P * liftQ (sampleMatrix powAt b.sh))
    (orth : ∀ i j, i ≠ j → (P * liftQ (weights b.sh) * P.transpose) i j = 0) :
    M = liftQ b.schurRow := by
  have ht : M * liftQ b.transition = P := by
    have v := congrArg (fun A : Mat n ℝ => A * liftQ b.sampleInverse) samples
    simp only [Matrix.mul_assoc, ← liftQ_mul, h.transition_ok, h.invertible, liftQ,
      map_one, Matrix.mul_one] at v
    exact v
  let C := M * liftQ b.inverseSchur
  have hg := congrArg (fun A : Mat n ℚ => liftQ A) h.hall
  simp only [liftQ_mul] at hg
  have tr (A : Mat n ℚ) : liftQ A.transpose = (liftQ A).transpose := rfl
  rw [tr, tr] at hg
  have hc : C * C.transpose = P * liftQ (weights b.sh) * P.transpose := by
    rw [← ht, Matrix.transpose_mul, ← Matrix.mul_assoc]
    dsimp [C]
    rw [Matrix.transpose_mul]
    simp only [Matrix.mul_assoc] at hg ⊢
    rw [← Matrix.mul_assoc (liftQ b.inverseSchur), ← hg]
    simp only [Matrix.mul_assoc]
  have eq := unitLower_orthogonal (unitLower_mul hm (liftQ_lower h.triangular))
    (fun i j hij => by change (C * C.transpose) i j = 0; rw [hc]; exact orth i j hij)
  have v := congrArg (fun A : Mat n ℝ => A * liftQ b.schurRow) eq
  simp only [Matrix.mul_assoc, ← liftQ_mul, h.undo, liftQ, map_one, Matrix.mul_one,
    Matrix.one_mul] at v
  exact v

end

end ChenKhareSahi.Jack.Source
