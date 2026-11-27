import Conjectures.ChenKhareSahiJackMonomials

/-!
# The target Jack polynomials of degree five at Stanley parameter 2/3

Chen–Khare–Sahi's target parameter `τ = 3/2` is the reciprocal of Stanley's Jack
parameter, so `α = 2/3`. In degree five with five variables the monic Jack polynomials
`P_λ(x; α)` are characterized by Stanley's definition: `P_λ = m_λ + (dominance-lower
monomials)`, pairwise orthogonal for the power-sum scalar product
`⟨p_λ, p_μ⟩ = δ_{λμ} z_λ α^{ℓ(λ)}`. All seven partitions of five occur, the monomial
symmetric polynomials are literal orbit sums, and the power-sum coordinates are the
literal coefficients of the same five-variable polynomial functions.
-/

namespace ChenKhareSahi.Jack

noncomputable section

set_option maxRecDepth 32768
set_option maxHeartbeats 16000000

/-- Each monomial is the stated combination of power sums. -/
theorem monomial_in_power (i : Index) (x : Pt) :
    monomial i x = ∑ j, (monomialInPower i j : ℝ) * power j x := by
  simp_rw [power_expansion, Finset.mul_sum]
  rw [Finset.sum_comm]
  have hBA : ∀ k, ∑ j, (monomialInPower i j : ℝ) * (powerInMonomial j k : ℝ) =
      if i = k then 1 else 0 := by
    intro k
    have h := congrFun (congrFun transition_inverse i) k
    rw [Matrix.mul_apply, Matrix.one_apply] at h
    have h' : ((∑ j, monomialInPower i j * powerInMonomial j k : ℚ) : ℝ) =
        ((if i = k then 1 else 0 : ℚ) : ℝ) := by rw [h]
    push_cast at h'
    exact h'.trans (by split_ifs <;> simp)
  symm
  calc ∑ k, ∑ j, (monomialInPower i j : ℝ) * ((powerInMonomial j k : ℝ) * monomial k x)
      = ∑ k, (∑ j, (monomialInPower i j : ℝ) * (powerInMonomial j k : ℝ)) * monomial k x := by
        refine Finset.sum_congr rfl fun k _ => ?_
        rw [Finset.sum_mul]
        refine Finset.sum_congr rfl fun j _ => ?_
        ring
    _ = monomial i x := by simp [hBA]

/-! ## The Jack scalar product at α = 2/3 -/

/-- Stanley's parameter for the source target parameter `τ = 3/2`. -/
def alpha : ℚ := 2 / 3

/-- `z_λ = ∏_a a^{m_a} m_a!`. -/
def zee (l : List ℕ) : ℕ := ∏ a ∈ l.toFinset, a ^ l.count a * (l.count a).factorial

/-- The weight `z_λ α^{ℓ(λ)}` of `p_λ` in the Jack scalar product. -/
def weightQ (i : Index) : ℚ := (zee (jparts i) : ℚ) * alpha ^ (jparts i).length

/-- Power-sum coordinates of the polynomial `∑ v_μ m_μ`. -/
def powerCoords (v : Index → ℝ) (j : Index) : ℝ := ∑ i, v i * (monomialInPower i j : ℝ)

/-- The Jack scalar product on monomial coordinate vectors. -/
def jackForm (v w : Index → ℝ) : ℝ :=
  ∑ j, powerCoords v j * powerCoords w j * (weightQ j : ℝ)

/-- The polynomial function with the given monomial coordinates. -/
def jackPoly (v : Index → ℝ) (x : Pt) : ℝ := ∑ i, v i * monomial i x

/-- The coordinates used in the scalar product are the literal power-sum coefficients. -/
theorem jackPoly_power (v : Index → ℝ) (x : Pt) :
    jackPoly v x = ∑ j, powerCoords v j * power j x := by
  simp only [jackPoly, monomial_in_power, powerCoords, Finset.mul_sum, Finset.sum_mul]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun j _ => Finset.sum_congr rfl fun k _ => ?_
  ring

theorem jackPoly_smul (v : Index → ℝ) (t : ℝ) (x : Pt) :
    jackPoly v (t • x) = t ^ 5 * jackPoly v x := by
  simp only [jackPoly, monomial_smul, Finset.mul_sum]
  refine Finset.sum_congr rfl fun i _ => ?_
  ring

/-- Stanley's characterization of the monic Jack family in degree five. -/
structure IsJackFamily (F : Index → Index → ℝ) : Prop where
  monic : ∀ i, F i i = 1
  triangular : ∀ i j, ¬ Dominates (jpart5 i) (jpart5 j) → F i j = 0
  orthogonal : ∀ i j, i ≠ j → jackForm (F i) (F j) = 0

theorem not_dominates_iff (i j : Index) : ¬ Dominates (jpart5 i) (jpart5 j) ↔ i < j := by
  rw [dominates_iff]
  revert i j
  decide +kernel

/-- The exact monic Jack polynomials of degree five at `α = 2/3`. -/
def jackQ : Index → Index → ℚ :=
  ![![1, 0, 0, 0, 0, 0, 0],
    ![30/7, 1, 0, 0, 0, 0, 0],
    ![135/22, 9/4, 1, 0, 0, 0, 0],
    ![108/13, 243/65, 6/5, 1, 0, 0, 0],
    ![81/10, 108/25, 63/25, 6/5, 1, 0, 0],
    ![54/7, 351/70, 3, 37/14, 9/7, 1, 0],
    ![216/77, 180/77, 150/77, 20/11, 50/33, 15/11, 1]]

def jackR (i : Index) : Index → ℝ := fun k => (jackQ i k : ℝ)

/-- The rational form of the scalar product. -/
def jackFormQ (v w : Index → ℚ) : ℚ :=
  ∑ j, (∑ i, v i * monomialInPower i j) * (∑ i, w i * monomialInPower i j) * weightQ j

theorem jackForm_cast (v w : Index → ℚ) :
    jackForm (fun k => (v k : ℝ)) (fun k => (w k : ℝ)) = ((jackFormQ v w : ℚ) : ℝ) := by
  simp [jackForm, jackFormQ, powerCoords]

theorem jackQ_orthogonal : ∀ i j : Index, i ≠ j → jackFormQ (jackQ i) (jackQ j) = 0 := by
  decide +kernel

theorem jackR_family : IsJackFamily jackR := by
  refine ⟨?_, ?_, ?_⟩
  · intro i; fin_cases i <;> simp [jackR, jackQ]
  · intro i j h
    rw [not_dominates_iff] at h
    revert h
    fin_cases i <;> fin_cases j <;> simp [jackR, jackQ]
  · intro i j hij
    show jackForm (fun k => (jackQ i k : ℝ)) (fun k => (jackQ j k : ℝ)) = 0
    rw [jackForm_cast, jackQ_orthogonal i j hij]
    simp

end

end ChenKhareSahi.Jack
