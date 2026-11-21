module

public import Mathlib.Analysis.Complex.Polynomial.Basic
public import Mathlib.Algebra.Order.BigOperators.Group.Multiset
public import Mathlib.Data.Nat.Choose.Basic
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.LinearCombination
public import Mathlib.Tactic.Ring
public import Mathlib.Tactic.Positivity
public import Mathlib.Tactic.FieldSimp

/-!
# A polar-derivative stability lemma

The half-plane part of the polarization argument needed for Vishnyakova's
root-radius theorem is proved directly from the roots of a complex polynomial.
No Grace--Walsh--Szegő or Hurwitz theorem is taken as an assumption.
-/

@[expose] public section

namespace VishnyakovaRootRadius

open Polynomial
open scoped BigOperators

private theorem multiset_sum_square_identity (s : Multiset ℝ) (a b : ℝ) :
    (s.map (fun x => (a * x - b) ^ 2)).sum =
      a ^ 2 * (s.map (fun x => x ^ 2)).sum - 2 * a * b * s.sum +
        (s.card : ℝ) * b ^ 2 := by
  induction s using Multiset.induction_on with
  | empty => simp
  | @cons x s ih =>
    simp only [Multiset.map_cons, Multiset.sum_cons, Multiset.card_cons,
      Nat.cast_add, Nat.cast_one, ih]
    ring

private theorem multiset_sum_sq_le (s : Multiset ℝ) :
    s.sum ^ 2 ≤ (s.card : ℝ) * (s.map (fun x => x ^ 2)).sum := by
  by_cases hs : s = 0
  · simp [hs]
  have hc : (0 : ℝ) < s.card := by
    exact_mod_cast Multiset.card_pos.mpr hs
  have hn : 0 ≤ (s.map (fun x => ((s.card : ℝ) * x - s.sum) ^ 2)).sum := by
    apply Multiset.sum_nonneg
    intro x hx
    obtain ⟨y, hy, rfl⟩ := Multiset.mem_map.mp hx
    positivity
  rw [multiset_sum_square_identity] at hn
  have heq : (s.card : ℝ) ^ 2 * (s.map (fun x => x ^ 2)).sum -
      2 * (s.card : ℝ) * s.sum * s.sum + (s.card : ℝ) * s.sum ^ 2 =
      (s.card : ℝ) * ((s.card : ℝ) * (s.map (fun x => x ^ 2)).sum - s.sum ^ 2) := by
    ring
  rw [heq] at hn
  have := nonneg_of_mul_nonneg_right hn hc
  linarith

/-- Cauchy--Schwarz for a complex multiset, retaining root multiplicities. -/
theorem normSq_multiset_sum_le (s : Multiset ℂ) :
    Complex.normSq s.sum ≤ (s.card : ℝ) * (s.map Complex.normSq).sum := by
  have hre := multiset_sum_sq_le (s.map Complex.re)
  have him := multiset_sum_sq_le (s.map Complex.im)
  have hre' : (s.map Complex.re).sum = s.sum.re :=
    (map_multiset_sum Complex.reAddGroupHom s).symm
  have him' : (s.map Complex.im).sum = s.sum.im :=
    (map_multiset_sum Complex.imAddGroupHom s).symm
  have hnorm : (s.map Complex.normSq).sum =
      (s.map (fun z => z.re ^ 2)).sum + (s.map (fun z => z.im ^ 2)).sum := by
    change (s.map (fun z => Complex.normSq z)).sum = _
    simp only [Complex.normSq_apply, ← pow_two, Multiset.sum_map_add]
  simp only [Multiset.card_map, Multiset.map_map, Function.comp_def, hre', him'] at hre him
  rw [hnorm, Complex.normSq_apply]
  nlinarith

/-- A polynomial has no zeros on the closed upper half-plane. -/
def ClosedUpperStable (p : ℂ[X]) : Prop :=
  ∀ z : ℂ, 0 ≤ z.im → p.eval z ≠ 0

theorem ClosedUpperStable.ne_zero {p : ℂ[X]} (hp : ClosedUpperStable p) : p ≠ 0 := by
  intro h
  have := hp 0 (by simp)
  simp [h] at this

theorem ClosedUpperStable.root_im_neg {p : ℂ[X]} (hp : ClosedUpperStable p)
    {r : ℂ} (hr : r ∈ p.roots) : r.im < 0 := by
  by_contra hn
  exact hp r (le_of_not_gt hn) ((Polynomial.mem_roots hp.ne_zero).mp hr)

private theorem inverse_half_plane_bound (z r : ℂ) (hz : 0 ≤ z.im) (hr : r.im < 0) :
    z.im * Complex.normSq (z - r)⁻¹ < -((z - r)⁻¹).im := by
  have hne : z - r ≠ 0 := by
    intro h
    have h' := congrArg Complex.im h
    simp only [Complex.sub_im, Complex.zero_im] at h'
    linarith
  have hnorm : 0 < Complex.normSq (z - r) := Complex.normSq_pos.mpr hne
  rw [Complex.normSq_inv, Complex.inv_im, Complex.sub_im, neg_div, neg_neg]
  rw [← div_eq_mul_inv]
  exact (div_lt_div_iff_of_pos_right hnorm).mpr (by linarith)

/-- Polar differentiation at a real point preserves nonvanishing on the
closed upper half-plane.  The integer `n` may exceed the polynomial's degree.
This is the special stability statement required to successively specialize
a symmetric multiaffine polynomial at arbitrary real parameters. -/
theorem ClosedUpperStable.polar_derivative {p : ℂ[X]} (hp : ClosedUpperStable p)
    (a : ℝ) (n : ℕ) (hn : 0 < n) (hdeg : p.natDegree ≤ n) :
    ClosedUpperStable (Polynomial.C (n : ℂ) * p +
      (Polynomial.C (a : ℂ) - Polynomial.X) * p.derivative) := by
  intro z hz hzero
  let s : Multiset ℂ := p.roots.map (fun r => (z - r)⁻¹)
  let S : ℂ := s.sum
  have hpz : p.eval z ≠ 0 := hp z hz
  have hder : p.derivative.eval z = p.eval z * S := by
    simpa [S, s, one_div] using
      (IsAlgClosed.splits p).eval_derivative_eq_eval_mul_sum hpz
  have hmul : (z - (a : ℂ)) * S = (n : ℂ) := by
    simp only [Polynomial.eval_add, Polynomial.eval_mul, Polynomial.eval_C,
      Polynomial.eval_sub, Polynomial.eval_X] at hzero
    rw [hder] at hzero
    have hc : p.eval z * ((z - (a : ℂ)) * S - (n : ℂ)) = 0 := by
      linear_combination -hzero
    have h := (mul_eq_zero.mp hc).resolve_left hpz
    exact sub_eq_zero.mp h
  have hnreal : (0 : ℝ) < n := by exact_mod_cast hn
  have hs : s ≠ 0 := by
    intro hs
    have hS : S = 0 := by simp [S, hs]
    rw [hS, mul_zero] at hmul
    have h := congrArg Complex.re hmul
    simp only [Complex.zero_re, Complex.natCast_re] at h
    linarith
  have hcard : s.card ≤ n := by
    simpa [s, (IsAlgClosed.splits p).natDegree_eq_card_roots] using hdeg
  have hpoint : ∀ w ∈ s, z.im * Complex.normSq w < -w.im := by
    intro w hw
    obtain ⟨r, hr, rfl⟩ := Multiset.mem_map.mp hw
    exact inverse_half_plane_bound z r hz (hp.root_im_neg hr)
  have hsum := Multiset.sum_lt_sum_of_nonempty hs hpoint
  have him : (s.map (fun w => -w.im)).sum = -S.im := by
    rw [Multiset.sum_map_neg]
    exact congrArg Neg.neg (map_multiset_sum Complex.imAddGroupHom s).symm
  have hbound : z.im * (s.map Complex.normSq).sum < -S.im := by
    simpa only [Multiset.sum_map_mul_left, him] using hsum
  have hcauchy : Complex.normSq S ≤ (n : ℝ) * (s.map Complex.normSq).sum := by
    apply (normSq_multiset_sum_le s).trans
    apply mul_le_mul_of_nonneg_right
    · exact_mod_cast hcard
    · apply Multiset.sum_nonneg
      intro w hw
      obtain ⟨r, hr, rfl⟩ := Multiset.mem_map.mp hw
      exact Complex.normSq_nonneg r
  have hmulre : (z.re - a) * S.re - z.im * S.im = n := by
    simpa using congrArg Complex.re hmul
  have hmulim : (z.re - a) * S.im + z.im * S.re = 0 := by
    simpa using congrArg Complex.im hmul
  have hid : (n : ℝ) * (-S.im) = z.im * Complex.normSq S := by
    rw [Complex.normSq_apply]
    linear_combination S.im * hmulre - S.re * hmulim
  have hstrict := mul_lt_mul_of_pos_left hbound hnreal
  have hweak := mul_le_mul_of_nonneg_left hcauchy hz
  rw [hid] at hstrict
  nlinarith only [hstrict, hweak]

/-- The diagonal of the symmetric multiaffine polynomial with elementary
symmetric coefficients `c`. -/
noncomputable def diagonalPolynomial (n : ℕ) (c : ℕ → ℂ) : ℂ[X] :=
  ∑ k ∈ Finset.range (n + 1), Polynomial.C ((n.choose k : ℂ) * c k) * Polynomial.X ^ k

theorem diagonalPolynomial_coeff (n : ℕ) (c : ℕ → ℂ) (k : ℕ) :
    (diagonalPolynomial n c).coeff k = (n.choose k : ℂ) * c k := by
  classical
  unfold diagonalPolynomial
  simp only [Polynomial.finsetSum_coeff, Polynomial.coeff_C_mul_X_pow]
  rw [Finset.sum_eq_single k]
  · simp
  · intro j hj hjk
    simp [Ne.symm hjk]
  · intro hk
    have hnk : n < k := by simpa using hk
    simp [Nat.choose_eq_zero_of_lt hnk]

theorem diagonalPolynomial_natDegree (n : ℕ) (c : ℕ → ℂ) :
    (diagonalPolynomial n c).natDegree ≤ n := by
  apply Polynomial.natDegree_le_iff_coeff_eq_zero.mpr
  intro k hk
  rw [diagonalPolynomial_coeff, Nat.choose_eq_zero_of_lt hk]
  simp

private theorem coeff_X_derivative (p : ℂ[X]) (k : ℕ) :
    (Polynomial.X * p.derivative).coeff k = (k : ℂ) * p.coeff k := by
  cases k with
  | zero => simp
  | succ k =>
    rw [Polynomial.coeff_X_mul, Polynomial.coeff_derivative]
    push_cast
    ring

private theorem polar_coefficient (p : ℂ[X]) (a : ℂ) (n k : ℕ) :
    (Polynomial.C (n : ℂ) * p +
      (Polynomial.C a - Polynomial.X) * p.derivative).coeff k =
        ((n : ℂ) - (k : ℂ)) * p.coeff k +
          a * ((k : ℂ) + 1) * p.coeff (k + 1) := by
  rw [sub_mul, ← add_sub_assoc]
  simp only [Polynomial.coeff_add, Polynomial.coeff_sub, Polynomial.coeff_C_mul,
    Polynomial.coeff_derivative, coeff_X_derivative]
  ring

theorem polar_diagonal_identity (n : ℕ) (c : ℕ → ℂ) (a : ℂ) :
    Polynomial.C ((n + 1 : ℕ) : ℂ) * diagonalPolynomial (n + 1) c +
      (Polynomial.C a - Polynomial.X) * (diagonalPolynomial (n + 1) c).derivative =
    Polynomial.C ((n + 1 : ℕ) : ℂ) *
      diagonalPolynomial n (fun k => c k + a * c (k + 1)) := by
  ext k
  rw [polar_coefficient, Polynomial.coeff_C_mul]
  simp only [diagonalPolynomial_coeff]
  by_cases hk : k ≤ n + 1
  · have hA : ((n + 1).choose k : ℂ) * ((n + 1 - k : ℕ) : ℂ) =
        (n.choose k : ℂ) * ((n + 1 : ℕ) : ℂ) := by
      exact_mod_cast (Nat.choose_mul_succ_eq n k).symm
    have hB : ((n + 1).choose (k + 1) : ℂ) * ((k + 1 : ℕ) : ℂ) =
        ((n + 1 : ℕ) : ℂ) * (n.choose k : ℂ) := by
      exact_mod_cast (Nat.add_one_mul_choose_eq n k).symm
    rw [Nat.cast_sub hk] at hA
    push_cast at hA hB ⊢
    linear_combination c k * hA + a * c (k + 1) * hB
  · have hk' : n + 1 < k := lt_of_not_ge hk
    rw [Nat.choose_eq_zero_of_lt hk',
      Nat.choose_eq_zero_of_lt (by omega : n + 1 < k + 1),
      Nat.choose_eq_zero_of_lt (by omega : n < k)]
    simp

/-- Successive real specialization of a symmetric multiaffine polynomial,
written in the elementary symmetric basis. -/
noncomputable def realPolarValue (c : ℕ → ℂ) : List ℝ → ℂ
  | [] => c 0
  | a :: as => realPolarValue (fun k => c k + (a : ℂ) * c (k + 1)) as

/-- A direct special case of polarization: a diagonal with no zeros on the
closed upper half-plane has no zero at any independent real parameter vector.
This proof iterates the proved polar-derivative theorem. -/
theorem realPolarValue_ne_zero (as : List ℝ) (c : ℕ → ℂ)
    (hp : ClosedUpperStable (diagonalPolynomial as.length c)) :
    realPolarValue c as ≠ 0 := by
  induction as generalizing c with
  | nil =>
    have h := hp 0 (by simp)
    simpa [realPolarValue, diagonalPolynomial] using h
  | cons a as ih =>
    have hlen : (a :: as).length = as.length + 1 := rfl
    rw [hlen] at hp
    have hpolar := hp.polar_derivative a (as.length + 1) (by omega)
      (diagonalPolynomial_natDegree (as.length + 1) c)
    rw [polar_diagonal_identity] at hpolar
    apply ih
    intro z hz hzero
    have h := hpolar z hz
    simp only [Polynomial.eval_mul, Polynomial.eval_C, hzero, mul_zero, ne_eq,
      not_true_eq_false] at h

end VishnyakovaRootRadius
