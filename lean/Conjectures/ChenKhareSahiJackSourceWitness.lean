import Conjectures.ChenKhareSahiJackSourceBasis

namespace ChenKhareSahi.Jack.Source

noncomputable section
open Matrix

set_option maxRecDepth 65536
set_option maxHeartbeats 16000000

abbrev Key := (d : Fin 6) × Fin (dimension d)

def keyShape (k : Key) : Shape := (degreeBlock k.1).sh k.2

theorem keySize (k : Key) : size (keyShape k) = (k.1 : ℕ) := by
  revert k
  decide +kernel

theorem keyInjective : Function.Injective keyShape := by
  intro a b
  revert a b
  decide +kernel

def refPower {n : ℕ} (b : Block n) := b.schurRow * b.transition

theorem reference_monic : ∀ d : Fin 6, ∀ i, (degreeBlock d).schurRow i i = 1 := by
  decide +kernel

theorem reference_tri : ∀ d : Fin 6, ∀ i j,
    ¬ DominatesFin ((degreeBlock d).sh i) ((degreeBlock d).sh j) → (degreeBlock d).schurRow i j = 0 := by
  intro d i j
  fin_cases d <;> fin_cases i <;> fin_cases j <;> decide +kernel

theorem reference_orth (d : Fin 6) :
    refPower (degreeBlock d) * weights (degreeBlock d).sh * (refPower (degreeBlock d)).transpose = 1 := by
  revert d
  decide +kernel

def canonical (k : Key) (x : Pt) : ℝ :=
  ∑ j, ((refPower (degreeBlock k.1) k.2 j : ℚ) : ℝ) * powerValue ((degreeBlock k.1).sh j) x

/-- One nonvacuous homogeneous completion, taking zero in irrelevant degrees above
five. The exclusion theorem applies to every homogeneous completion. -/
def completion (p : Shape) (x : Pt) : ℝ := if h : ∃ k, keyShape k = p then
  canonical h.choose x else 0

theorem completion_at (k : Key) (x : Pt) : completion (keyShape k) x = canonical k x := by
  classical
  let h : ∃ j, keyShape j = keyShape k := ⟨k, rfl⟩
  rw [completion, dite_eq_left h, keyInjective h.choose_spec]

theorem power_scale (d : Fin 6) (i : Fin (dimension d)) (t : ℝ) (x : Pt) :
    powerValue ((degreeBlock d).sh i) (t • x) = t ^ (d : ℕ) * powerValue ((degreeBlock d).sh i) x := by
  have degree : ∀ d : Fin 6, ∀ i : Fin (dimension d), (parts ((degreeBlock d).sh i)).sum = d.val := by
    decide +kernel
  have scale (l : List ℕ) :
      (l.map (fun k => ∑ j : Fin 5, (t * x j) ^ k)).prod =
        t ^ l.sum * (l.map (fun k => ∑ j : Fin 5, x j ^ k)).prod := by
    induction l with
    | nil => simp
    | cons h l ih =>
      simp only [List.map_cons, List.prod_cons, List.sum_cons, mul_pow, ← Finset.mul_sum,
        pow_add]
      simp only [mul_pow, ← Finset.mul_sum] at ih
      rw [ih]
      ring
  simpa only [powerValue, Pi.smul_apply, smul_eq_mul, degree] using scale (parts ((degreeBlock d).sh i))

theorem canonical_monomial (d : Fin 6) (i : Fin (dimension d)) (x : Pt) :
    canonical ⟨d,i⟩ x =
      ∑ j, (((degreeBlock d).schurRow i j : ℚ) : ℝ) * monomialValue ((degreeBlock d).sh j) x := by
  simp only [canonical, refPower, Matrix.mul_apply, Rat.cast_sum, Rat.cast_mul, Finset.sum_mul,
    power_expansion, Finset.mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro a _
  apply Finset.sum_congr rfl
  intro b _
  ring

theorem completion_family : SourceFamily completion := by
  constructor
  · intro p _ t x
    classical
    by_cases h : ∃ k, keyShape k = p
    · obtain ⟨k,rfl⟩ := h
      rw [completion_at, completion_at, keySize]
      simp only [canonical, power_scale, Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro j _
      ring
    · simp [completion, h]
  · intro d
    let b := degreeBlock d
    refine ⟨liftQ b.schurRow, liftQ (refPower b), ?_⟩
    constructor
    · intro i
      change ((b.schurRow i i : ℚ) : ℝ) = 1
      rw [reference_monic]; norm_num
    · intro i j hij
      change ((b.schurRow i j : ℚ) : ℝ) = 0
      rw [reference_tri d i j (fun h => hij ((dominates_iff _ _).mpr h))]; norm_num
    · intro i j hij
      have h := congrArg (fun A : Mat (dimension d) ℚ => liftQ A) (reference_orth d)
      have tr (A : Mat (dimension d) ℚ) : liftQ A.transpose = (liftQ A).transpose := rfl
      have one : liftQ (1 : Mat (dimension d) ℚ) = 1 := map_one _
      simp only [liftQ_mul, tr, one] at h
      change (liftQ (refPower (degreeBlock d)) * liftQ (weights (degreeBlock d).sh) *
        (liftQ (refPower (degreeBlock d))).transpose) i j = 0
      rw [h, Matrix.one_apply, ite_eq_right hij]
    · intro i x
      change completion (keyShape ⟨d,i⟩) x = _
      rw [completion_at]
      exact canonical_monomial d i x
    · intro i x
      change completion (keyShape ⟨d,i⟩) x = _
      rw [completion_at]
      rfl

end

end ChenKhareSahi.Jack.Source
