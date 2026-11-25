import Mathlib.Analysis.Complex.Norm
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FinCases
import Mathlib.Data.Fin.VecNotation
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Degree.SmallDegree
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Tactic.NormNum

namespace CurgusMascioniQuadratic

noncomputable section

/-- The two possible bottleneck costs for the unordered pairs `{u,-u}`, `{v,-v}`. -/
def centeredMatch (u v : ℂ) : ℝ := min ‖u - v‖ ‖u + v‖

theorem centeredMatch_le (u v : ℂ) (h : u ^ 2 - v ^ 2 = 1) :
    centeredMatch u v ≤ 1 := by
  have hd : (u - v) * (u + v) = 1 := by
    calc (u-v)*(u+v) = u^2-v^2 := by ring
      _ = 1 := h
  have hm : ‖u - v‖ * ‖u + v‖ = 1 := by
    rw [← Complex.norm_mul, hd]
    rw [Complex.norm_def, Complex.normSq_one, Real.sqrt_one]
  change min ‖u - v‖ ‖u + v‖ ≤ 1
  by_contra! hn
  have ha := (lt_min_iff.mp hn).1
  have hb := (lt_min_iff.mp hn).2
  nlinarith [mul_pos (sub_pos.mpr ha) (sub_pos.mpr hb)]

def inputRoot (s : ℝ) : ℂ := ⟨Real.sqrt s, 0⟩
def outputRoot (s : ℝ) : ℂ := ⟨0, Real.sqrt (1-s)⟩

theorem inputRoot_sq (s : ℝ) (hs : 0 ≤ s) :
    inputRoot s ^ 2 = (s : ℂ) := by
  apply Complex.ext
  · rw [pow_two]
    change Real.sqrt s * Real.sqrt s - 0 * 0 = s
    nlinarith [Real.sq_sqrt hs]
  · rw [pow_two]
    change Real.sqrt s * 0 + 0 * Real.sqrt s = 0
    ring

theorem outputRoot_sq (s : ℝ) (hs : s ≤ 1) :
    outputRoot s ^ 2 = (s : ℂ) - 1 := by
  apply Complex.ext
  · rw [pow_two]
    simp only [Complex.sub_re, Complex.ofReal_re, Complex.one_re]
    change 0 * 0 - Real.sqrt (1-s) * Real.sqrt (1-s) = s - 1
    nlinarith [Real.sq_sqrt (sub_nonneg.mpr hs)]
  · rw [pow_two]
    simp [outputRoot, Complex.mul_im]

theorem attaining (s : ℝ) (h0 : 0 ≤ s) (h1 : s ≤ 1) :
    centeredMatch (inputRoot s) (outputRoot s) = 1 := by
  have ha := Real.sq_sqrt h0
  have hb := Real.sq_sqrt (sub_nonneg.mpr h1)
  have hd : ‖inputRoot s - outputRoot s‖ ^ 2 = 1 := by
    rw [Complex.sq_norm, Complex.normSq_apply]
    simp only [Complex.sub_re, Complex.sub_im, inputRoot, outputRoot, sub_zero, zero_sub]
    nlinarith
  have he : ‖inputRoot s + outputRoot s‖ ^ 2 = 1 := by
    rw [Complex.sq_norm, Complex.normSq_apply]
    simp only [Complex.add_re, Complex.add_im, inputRoot, outputRoot, add_zero, zero_add]
    nlinarith
  have hd' : ‖inputRoot s - outputRoot s‖ = 1 := by
    nlinarith [norm_nonneg (inputRoot s - outputRoot s)]
  have he' : ‖inputRoot s + outputRoot s‖ = 1 := by
    nlinarith [norm_nonneg (inputRoot s + outputRoot s)]
  simp [centeredMatch, hd', he']

theorem squared_diameter (s : ℝ) (hs : 0 ≤ s) :
    ‖inputRoot s - (-inputRoot s)‖ ^ 2 = 4*s := by
  rw [Complex.sq_norm, Complex.normSq_apply]
  simp only [Complex.sub_re, Complex.sub_im, Complex.neg_re, Complex.neg_im, inputRoot, neg_zero, sub_zero, zero_mul, add_zero]
  nlinarith [Real.sq_sqrt hs]

theorem distinct_diameters {s t : ℝ} (hs : 0 ≤ s) (ht : 0 ≤ t) (hst : s ≠ t) :
    ‖inputRoot s - (-inputRoot s)‖ ≠ ‖inputRoot t - (-inputRoot t)‖ := by
  intro h
  have h2 := congrArg (fun x : ℝ => x ^ 2) h
  rw [squared_diameter s hs, squared_diameter t ht] at h2
  exact hst (by linarith)

def rootPair (u : ℂ) : Fin 2 → ℂ := ![u, -u]

def rootMatchCost (u v : ℂ) (σ : Equiv.Perm (Fin 2)) : ℝ :=
  max ‖rootPair u 0 - rootPair v (σ 0)‖ ‖rootPair u 1 - rootPair v (σ 1)‖

theorem rootMatch_identity (u v : ℂ) :
    rootMatchCost u v (Equiv.refl _) = ‖u-v‖ := by
  simp [rootMatchCost, rootPair]
  rw [show -u+v = -(u-v) by ring, norm_neg]

theorem rootMatch_swap (u v : ℂ) :
    rootMatchCost u v (Equiv.swap 0 1) = ‖u+v‖ := by
  simp [rootMatchCost, rootPair]
  rw [show -u-v = -(u+v) by ring, norm_neg]

theorem perm_two_cases (σ : Equiv.Perm (Fin 2)) :
    σ = Equiv.refl _ ∨ σ = Equiv.swap 0 1 := by
  have h : σ 0 ≠ σ 1 := fun e => (by decide : (0 : Fin 2) ≠ 1) (σ.injective e)
  rcases Fin.eq_zero_or_eq_succ (σ 0) with h0 | ⟨j, h0⟩
  · have h1 : σ 1 = 1 := by
      rcases Fin.eq_zero_or_eq_succ (σ 1) with h1 | ⟨j, h1⟩
      · exact (h (h0.trans h1.symm)).elim
      · have hj : j = 0 := Subsingleton.elim _ _
        simpa [hj] using h1
    left
    apply Equiv.ext
    intro i
    fin_cases i
    · exact h0
    · exact h1
  · have hj : j = 0 := Subsingleton.elim _ _
    have h0' : σ 0 = 1 := by simpa [hj] using h0
    have h1 : σ 1 = 0 := by
      rcases Fin.eq_zero_or_eq_succ (σ 1) with h1 | ⟨k, h1⟩
      · exact h1
      · have hk : k = 0 := Subsingleton.elim _ _
        have h1' : σ 1 = 1 := by simpa [hk] using h1
        exact (h (h0'.trans h1'.symm)).elim
    right
    apply Equiv.ext
    intro i
    fin_cases i
    · simpa using h0'
    · simpa using h1

/-- The least bottleneck cost for the actual permutations of two labelled roots. -/
theorem centeredMatch_exact (u v : ℂ) :
    (∀ σ, centeredMatch u v ≤ rootMatchCost u v σ) ∧
    ∃ σ, centeredMatch u v = rootMatchCost u v σ := by
  constructor
  · intro σ
    rcases perm_two_cases σ with rfl | rfl
    · rw [rootMatch_identity]; exact min_le_left _ _
    · rw [rootMatch_swap]; exact min_le_right _ _
  · by_cases h : ‖u-v‖ ≤ ‖u+v‖
    · exact ⟨Equiv.refl _, by rw [rootMatch_identity, centeredMatch, min_eq_left h]⟩
    · exact ⟨Equiv.swap 0 1, by rw [rootMatch_swap, centeredMatch, min_eq_right (le_of_not_ge h)]⟩

open Polynomial

def centeredPolynomial (w : ℂ) : ℂ[X] := X ^ 2 - C w

def quadraticOperator (f : ℂ[X]) : ℂ[X] :=
  f + C (1/2 : ℂ) * derivative (derivative f)

theorem operator_centered (w : ℂ) :
    quadraticOperator (centeredPolynomial w) = centeredPolynomial (w - 1) := by
  simp only [quadraticOperator, centeredPolynomial, derivative_C, sub_zero,
    derivative_X_pow, Nat.cast_ofNat, Nat.reduceSub, pow_one, derivative_C_mul_X,
    ← map_mul, map_sub]
  have h : (1/2 : ℂ) * 2 = 1 := by norm_num
  rw [h, map_one]
  ring

theorem centered_factors (w u : ℂ) (h : u ^ 2 = w) :
    centeredPolynomial w = (X - C u) * (X - C (-u)) := by
  rw [← h]
  simp only [centeredPolynomial, map_pow, map_neg]
  ring

theorem realizing_polynomials (s : ℝ) (hs : 0 ≤ s) (ht : s ≤ 1) :
    ∃ f : ℂ[X],
      f = (X - C (inputRoot s)) * (X - C (-(inputRoot s))) ∧
      quadraticOperator f = (X - C (outputRoot s)) * (X - C (-(outputRoot s))) ∧
      (∀ σ, 1 ≤ rootMatchCost (inputRoot s) (outputRoot s) σ) ∧
      (∃ σ, 1 = rootMatchCost (inputRoot s) (outputRoot s) σ) := by
  refine ⟨centeredPolynomial (s : ℂ), centered_factors _ _ (inputRoot_sq s hs), ?_, ?_⟩
  · rw [operator_centered]
    exact centered_factors _ _ (outputRoot_sq s ht)
  · simpa only [attaining s hs ht] using centeredMatch_exact (inputRoot s) (outputRoot s)

def translatedMatchCost (c u v : ℂ) (σ : Equiv.Perm (Fin 2)) : ℝ :=
  max ‖(c + rootPair u 0) - (c + rootPair v (σ 0))‖
      ‖(c + rootPair u 1) - (c + rootPair v (σ 1))‖

theorem translatedMatchCost_eq (c u v : ℂ) (σ : Equiv.Perm (Fin 2)) :
    translatedMatchCost c u v σ = rootMatchCost u v σ := by
  simp [translatedMatchCost, rootMatchCost]

theorem coeff_quad_form (f : ℂ[X]) (hf : f.natDegree = 2) :
    ∃ a c w : ℂ, a ≠ 0 ∧ f = C a * ((X - C c)^2 - C w) := by
  let a := f.coeff 2
  let b := f.coeff 1
  let d := f.coeff 0
  let c := -b / (2*a)
  let w := c^2 - d/a
  have ha : a ≠ 0 := by
    have hn : f ≠ 0 := by rintro rfl; simp at hf
    unfold a
    rw [← hf]
    exact leadingCoeff_ne_zero.mpr hn
  have hc : b = -(2*a*c) := by
    dsimp [c]
    field_simp [ha]
  have hd : d = a * (c^2-w) := by
    dsimp [w]
    field_simp [ha]
    ring
  have hf' : f = C a * X^2 + C b * X + C d := by
    conv_lhs => rw [f.as_sum_range_C_mul_X_pow, hf]
    simp [Finset.sum_range_succ, a, b, d]
    ring
  refine ⟨a,c,w,ha,?_⟩
  rw [hf', hc, hd]
  simp only [map_neg, map_mul, map_ofNat, map_sub, map_pow]
  ring

theorem operator_translated (a c w : ℂ) :
    quadraticOperator (C a * ((X - C c)^2 - C w)) =
      C a * ((X - C c)^2 - C (w-1)) := by
  have ht : C (1/2 : ℂ) * (2 : ℂ[X]) = 1 := by
    rw [show (2 : ℂ[X]) = C (2:ℂ) from (map_ofNat C 2).symm, ← map_mul]
    have hc : (1/2:ℂ) * 2 = 1 := by norm_num
    rw [hc, map_one]
  simp [quadraticOperator, pow_two, derivative_mul, map_sub]
  ring_nf
  have hc : C a * C (1/2 : ℂ) * (2 : ℂ[X]) = C a := by rw [mul_assoc, ht, mul_one]
  rw [hc]
  ring

theorem translated_factors (a c w u : ℂ) (hu : u^2 = w) :
    C a * ((X - C c)^2 - C w) =
      C a * (X - C (c+u)) * (X - C (c-u)) := by
  rw [← hu]
  simp only [map_add, map_sub, map_pow]
  ring

/-- Every degree-two complex polynomial and its image admit root labellings
with an actual permutation of the two labels of bottleneck cost at most one. -/
theorem arbitrary_quadratic_matching (f : ℂ[X]) (hf : f.natDegree = 2) :
    ∃ a c u v : ℂ, a ≠ 0 ∧
      f = C a * (X - C (c+u)) * (X - C (c-u)) ∧
      quadraticOperator f = C a * (X - C (c+v)) * (X - C (c-v)) ∧
      ∃ σ, translatedMatchCost c u v σ ≤ 1 := by
  obtain ⟨a,c,w,ha,rfl⟩ := coeff_quad_form f hf
  obtain ⟨u,hu⟩ := IsAlgClosed.exists_pow_nat_eq w (by decide : 0 < 2)
  obtain ⟨v,hv⟩ := IsAlgClosed.exists_pow_nat_eq (w-1) (by decide : 0 < 2)
  have h : u^2-v^2 = 1 := by rw [hu, hv]; ring
  obtain ⟨σ,hσ⟩ := (centeredMatch_exact u v).2
  refine ⟨a,c,u,v,ha,translated_factors _ _ _ _ hu,?_,σ,?_⟩
  · rw [operator_translated]
    exact translated_factors _ _ _ _ hv
  · rw [translatedMatchCost_eq, ← hσ]
    exact centeredMatch_le u v h

theorem operator_linear_unchanged (f : ℂ[X]) (hf : f.natDegree ≤ 1) :
    quadraticOperator f = f := by
  obtain ⟨a,b,rfl⟩ := exists_eq_X_add_C_of_natDegree_le_one hf
  simp [quadraticOperator]

theorem roots_of_factored_quad (a r s : ℂ) (ha : a ≠ 0) :
    (C a * (X - C r) * (X - C s)).roots = ({r} : Multiset ℂ) + {s} := by
  rw [mul_assoc, roots_C_mul _ ha, roots_mul (mul_ne_zero (X_sub_C_ne_zero _) (X_sub_C_ne_zero _)),
    roots_X_sub_C, roots_X_sub_C]

theorem arbitrary_quadratic_root_bound (f : ℂ[X]) (hf : f.natDegree = 2) :
    ∃ c u v : ℂ,
      f.roots = ({c+u} : Multiset ℂ) + {c-u} ∧
      (quadraticOperator f).roots = ({c+v} : Multiset ℂ) + {c-v} ∧
      ∃ σ, translatedMatchCost c u v σ ≤ 1 := by
  obtain ⟨a,c,u,v,ha,hf',hTf,σ,hσ⟩ := arbitrary_quadratic_matching f hf
  refine ⟨c,u,v,?_,?_,σ,hσ⟩
  · rw [hf']
    exact roots_of_factored_quad _ _ _ ha
  · rw [hTf]
    exact roots_of_factored_quad _ _ _ ha

/-- Sharp matching cost and multiplicities for each member of the interval family. -/
theorem interval_root_extremizers (s : ℝ) (hs : 0 ≤ s) (ht : s ≤ 1) :
    let f := centeredPolynomial (s : ℂ)
    f.roots = ({inputRoot s} : Multiset ℂ) + {-(inputRoot s)} ∧
    (quadraticOperator f).roots = ({outputRoot s} : Multiset ℂ) + {-(outputRoot s)} ∧
    (∀ σ, 1 ≤ rootMatchCost (inputRoot s) (outputRoot s) σ) ∧
    (∃ σ, 1 = rootMatchCost (inputRoot s) (outputRoot s) σ) := by
  dsimp only
  refine ⟨?_,?_,?_⟩
  · rw [centered_factors _ _ (inputRoot_sq s hs)]
    simpa only [map_one, one_mul] using roots_of_factored_quad 1 (inputRoot s) (-inputRoot s) one_ne_zero
  · rw [operator_centered, centered_factors _ _ (outputRoot_sq s ht)]
    simpa only [map_one, one_mul] using roots_of_factored_quad 1 (outputRoot s) (-outputRoot s) one_ne_zero
  · simpa only [attaining s hs ht] using centeredMatch_exact (inputRoot s) (outputRoot s)

theorem degree_centered (w : ℂ) : (centeredPolynomial w).natDegree = 2 := by
  have hform : centeredPolynomial w = C (1:ℂ) * X^2 + C (0:ℂ) * X + C (-w) := by
    simp [centeredPolynomial, sub_eq_add_neg]
  rw [hform]
  exact natDegree_quadratic one_ne_zero

theorem no_isometric_relabelling {s t : ℝ} (hs : 0 ≤ s) (ht : 0 ≤ t) (hne : s ≠ t)
    (g : ℂ → ℂ) (hg : Isometry g) (σ : Equiv.Perm (Fin 2)) :
    ¬ ∀ i, g (rootPair (inputRoot s) i) = rootPair (inputRoot t) (σ i) := by
  intro h
  have he := hg.dist_eq (rootPair (inputRoot s) 0) (rootPair (inputRoot s) 1)
  rw [h 0, h 1] at he
  apply distinct_diameters hs ht hne
  rcases perm_two_cases σ with rfl | rfl
  · simpa [Complex.dist_eq, rootPair] using he.symm
  · have hz : dist (-inputRoot t) (inputRoot t) = dist (inputRoot t) (-inputRoot t) :=
      dist_comm _ _
    have hdist : dist (-inputRoot t) (inputRoot t) = dist (inputRoot s) (-inputRoot s) := by
      simpa [rootPair] using he
    rw [hz] at hdist
    simpa only [Complex.dist_eq] using hdist.symm

end

end CurgusMascioniQuadratic
