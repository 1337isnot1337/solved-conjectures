import Conjectures.LonelinessHyperplaneCounting
import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-! An explicit lower count for positive, pairwise distinct integer
velocities on a relation hyperplane. The input is one such integer
velocity. A parameter grid in independent pivot directions then gives
the required power of the box size without an Ehrhart theorem. -/

namespace Loneliness.Hyperplane

open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

def normalSize (m : ι → ℤ) : ℕ := ∑ i, (m i).natAbs

omit [DecidableEq ι] in
theorem cast_normalSize (m : ι → ℤ) :
    (normalSize m : ℤ) = ∑ i, |m i| := by
  simp [normalSize]

omit [DecidableEq ι] in
theorem abs_le_normalSize (m : ι → ℤ) (i : ι) : |m i| ≤ (normalSize m : ℤ) := by
  rw [cast_normalSize]
  exact Finset.single_le_sum (fun j _ => abs_nonneg (m j)) (Finset.mem_univ i)

omit [DecidableEq ι] in
theorem integerPairing_abs_le (m r : ι → ℤ) (M : ℕ)
    (hr : ∀ i, |r i| ≤ (M : ℤ)) :
    |integerPairing m r| ≤ (normalSize m : ℤ) * (M : ℤ) := by
  calc
    _ ≤ ∑ i, |m i * r i| := Finset.abs_sum_le_sum_abs _ _
    _ = ∑ i, |m i| * |r i| := by simp only [abs_mul]
    _ ≤ ∑ i, |m i| * (M : ℤ) :=
      Finset.sum_le_sum (fun i _ => mul_le_mul_of_nonneg_left (hr i) (abs_nonneg (m i)))
    _ = _ := by rw [← Finset.sum_mul, ← cast_normalSize]

def parameterCoordinates (p : ι) {M : ℕ} (r : {i : ι // i ≠ p} → Fin M) : ι → ℤ :=
  fun i => if hi : i = p then 0 else ((r ⟨i, hi⟩ : ℕ) : ℤ)

omit [Fintype ι] in
@[simp] theorem parameterCoordinates_pivot
    (p : ι) {M : ℕ} (r : {i : ι // i ≠ p} → Fin M) :
    parameterCoordinates p r p = 0 := by simp [parameterCoordinates]

omit [Fintype ι] in
theorem parameterCoordinates_off
    (p : ι) {M : ℕ} (r : {i : ι // i ≠ p} → Fin M) (i : {i : ι // i ≠ p}) :
    parameterCoordinates p r i = ((r i : ℕ) : ℤ) := by
  simp [parameterCoordinates, i.2]

omit [Fintype ι] in
theorem parameterCoordinates_abs_le
    (p : ι) {M : ℕ} (r : {i : ι // i ≠ p} → Fin M) (i : ι) :
    |parameterCoordinates p r i| ≤ (M : ℤ) := by
  by_cases hip : i = p
  · subst i
    simp
  · simp [parameterCoordinates, hip]

def boxPerturbation (m : ι → ℤ) (p : ι) {M : ℕ}
    (r : {i : ι // i ≠ p} → Fin M) : ι → ℤ :=
  m p • parameterCoordinates p r -
    Pi.single p (integerPairing m (parameterCoordinates p r))

theorem boxPerturbation_kernel (m : ι → ℤ) (p : ι) {M : ℕ}
    (r : {i : ι // i ≠ p} → Fin M) : integerPairing m (boxPerturbation m p r) = 0 := by
  rw [boxPerturbation, integerPairing_sub, integerPairing_smul, integerPairing_single,
    sub_self]

theorem boxPerturbation_pivot (m : ι → ℤ) (p : ι) {M : ℕ}
    (r : {i : ι // i ≠ p} → Fin M) :
    boxPerturbation m p r p = -integerPairing m (parameterCoordinates p r) := by
  simp [boxPerturbation, zsmul_eq_mul]

theorem boxPerturbation_off (m : ι → ℤ) (p : ι) {M : ℕ}
    (r : {i : ι // i ≠ p} → Fin M) (i : {i : ι // i ≠ p}) :
    boxPerturbation m p r i = m p * ((r i : ℕ) : ℤ) := by
  simp [boxPerturbation, parameterCoordinates, i.2, zsmul_eq_mul,
    Pi.single_eq_of_ne]

theorem boxPerturbation_abs_le (m : ι → ℤ) (p : ι) {M : ℕ}
    (r : {i : ι // i ≠ p} → Fin M) (i : ι) :
    |boxPerturbation m p r i| ≤ (normalSize m : ℤ) * (M : ℤ) := by
  by_cases hip : i = p
  · subst i
    rw [boxPerturbation_pivot, abs_neg]
    exact integerPairing_abs_le m _ M (parameterCoordinates_abs_le p r)
  · rw [boxPerturbation_off m p r ⟨i, hip⟩, abs_mul]
    have hr : |(((r ⟨i, hip⟩ : Fin M) : ℕ) : ℤ)| ≤ (M : ℤ) := by
      have h := parameterCoordinates_abs_le p r i
      rw [parameterCoordinates_off p r ⟨i, hip⟩] at h
      exact h
    exact mul_le_mul (abs_le_normalSize m p) hr (abs_nonneg _) (by positivity)

def gridScale (m : ι → ℤ) (M : ℕ) : ℤ := (2 * (normalSize m : ℤ) + 1) * (M : ℤ)

def gridBoxConstant (m : ι → ℤ) (U : ℕ) : ℕ :=
  (2 * normalSize m + 1) * (U + 1) + normalSize m

omit [DecidableEq ι] in
theorem gridBoxConstant_pos (m : ι → ℤ) (U : ℕ) : 0 < gridBoxConstant m U := by
  unfold gridBoxConstant
  positivity

def gridVector (m u : ι → ℤ) (p : ι) {M : ℕ}
    (r : {i : ι // i ≠ p} → Fin M) : ι → ℤ :=
  gridScale m M • u + boxPerturbation m p r

theorem gridVector_apply (m u : ι → ℤ) (p : ι) {M : ℕ}
    (r : {i : ι // i ≠ p} → Fin M) (i : ι) :
    gridVector m u p r i = gridScale m M * u i + boxPerturbation m p r i := by
  simp [gridVector, zsmul_eq_mul]

theorem gridVector_kernel (m u : ι → ℤ) (hu : integerPairing m u = 0)
    (p : ι) {M : ℕ} (r : {i : ι // i ≠ p} → Fin M) :
    integerPairing m (gridVector m u p r) = 0 := by
  rw [gridVector, integerPairing_add, integerPairing_smul, hu, mul_zero,
    boxPerturbation_kernel, add_zero]

theorem gridVector_bounds (m u : ι → ℤ) (p : ι) (U : ℕ)
    (hu : ∀ i, 0 < u i) (hU : ∀ i, u i ≤ (U : ℤ))
    {M : ℕ} (hM : 1 ≤ M) (r : {i : ι // i ≠ p} → Fin M) (i : ι) :
    1 ≤ gridVector m u p r i ∧
      gridVector m u p r i ≤ (gridBoxConstant m U * M : ℕ) := by
  have hT : 0 ≤ gridScale m M := by unfold gridScale; positivity
  have hUi : (1 : ℤ) ≤ u i := by have hi := hu i; omega
  have hlo := mul_le_mul_of_nonneg_left hUi hT
  have hhi := mul_le_mul_of_nonneg_left (hU i) hT
  have hp := abs_le.mp (boxPerturbation_abs_le m p r i)
  have hMR : (1 : ℤ) ≤ (M : ℤ) := by exact_mod_cast hM
  have hAR : 0 ≤ (normalSize m : ℤ) := by positivity
  rw [gridVector_apply]
  constructor
  · dsimp only [gridScale] at hlo ⊢
    nlinarith [hp.1, mul_nonneg hAR (le_trans (by norm_num) hMR)]
  · have hstep : gridScale m M * u i + boxPerturbation m p r i ≤
        gridScale m M * ((U : ℤ) + 1) + (normalSize m : ℤ) * (M : ℤ) := by
      nlinarith
    calc
      _ ≤ _ := hstep
      _ = _ := by simp only [gridScale, gridBoxConstant, Nat.cast_add, Nat.cast_mul,
        Nat.cast_one, Nat.cast_ofNat]; ring

theorem gridVector_distinct (m u : ι → ℤ) (p : ι) (hu : Function.Injective u)
    {M : ℕ} (hM : 1 ≤ M) (r : {i : ι // i ≠ p} → Fin M) :
    Function.Injective (gridVector m u p r) := by
  intro i j hij
  by_contra hne
  have huij : u i ≠ u j := fun h => hne (hu h)
  have hdu : (1 : ℤ) ≤ |u i - u j| := by
    have hd : u i - u j ≠ 0 := sub_ne_zero.mpr huij
    have habs : 0 < |u i - u j| := abs_pos.mpr hd
    omega
  have hT : 0 ≤ gridScale m M := by unfold gridScale; positivity
  have hprod : gridScale m M ≤ |gridScale m M * (u i - u j)| := by
    rw [abs_mul, abs_of_nonneg hT]
    simpa only [mul_one] using mul_le_mul_of_nonneg_left hdu hT
  have heq : gridScale m M * (u i - u j) =
      boxPerturbation m p r j - boxPerturbation m p r i := by
    rw [gridVector_apply, gridVector_apply] at hij
    nlinarith
  have habs : |boxPerturbation m p r j - boxPerturbation m p r i| ≤
      2 * ((normalSize m : ℤ) * (M : ℤ)) := by
    calc
      _ ≤ |boxPerturbation m p r j| + |boxPerturbation m p r i| := by
        simpa using abs_sub_le (boxPerturbation m p r j) 0 (boxPerturbation m p r i)
      _ ≤ _ := by linarith [boxPerturbation_abs_le m p r j, boxPerturbation_abs_le m p r i]
  rw [heq] at hprod
  have hbad := hprod.trans habs
  have hMR : (1 : ℤ) ≤ (M : ℤ) := by exact_mod_cast hM
  dsimp only [gridScale] at hbad
  nlinarith

theorem gridVector_parameters_injective (m u : ι → ℤ) (p : ι) (hp : m p ≠ 0)
    (M : ℕ) : Function.Injective (gridVector m u p (M := M)) := by
  intro r s hrs
  funext i
  apply Fin.ext
  have hi := congrFun hrs i.1
  rw [gridVector_apply, gridVector_apply, boxPerturbation_off m p r i,
    boxPerturbation_off m p s i] at hi
  have hmul := add_left_cancel hi
  have hcast := (mul_left_cancel₀ hp) hmul
  exact_mod_cast hcast

def positiveBoxAdmissible (m : ι → ℤ) (N : ℕ) : Finset (ι → Fin N) :=
  Finset.univ.filter (fun v =>
    integerPairing m (positiveBoxCoordinates v) = 0 ∧ Function.Injective v)

private theorem card_away_from_one (p : ι) :
    Fintype.card {i : ι // i ≠ p} = Fintype.card ι - 1 := by
  calc
    _ = ((Finset.univ : Finset ι).erase p).card := by
      apply Fintype.card_of_subtype
      intro i
      simp
    _ = _ := by simp

/-- The explicit parameter grid gives `M^(k-1)` admissible velocities in
every box with side at least `gridBoxConstant m U * M`. -/
theorem positiveBoxAdmissible_card_lower_grid
    (m u : ι → ℤ) (p : ι) (hp : m p ≠ 0)
    (hkernel : integerPairing m u = 0) (hpositive : ∀ i, 0 < u i)
    (hdistinct : Function.Injective u) (U : ℕ) (hU : ∀ i, u i ≤ (U : ℤ))
    (M : ℕ) (hM : 1 ≤ M) (N : ℕ) (hN : gridBoxConstant m U * M ≤ N) :
    M ^ (Fintype.card ι - 1) ≤ (positiveBoxAdmissible m N).card := by
  classical
  have hb : ∀ r : {i : ι // i ≠ p} → Fin M, ∀ i,
      1 ≤ gridVector m u p r i ∧ gridVector m u p r i ≤ (N : ℤ) := by
    intro r i
    have hi := gridVector_bounds m u p U hpositive hU hM r i
    refine ⟨hi.1, hi.2.trans ?_⟩
    exact_mod_cast hN
  choose F hF using fun r : {i : ι // i ≠ p} → Fin M =>
    exists_positiveBoxCoordinates (gridVector m u p r) (hb r)
  have hmem : ∀ r, F r ∈ positiveBoxAdmissible m N := by
    intro r
    simp only [positiveBoxAdmissible, Finset.mem_filter, Finset.mem_univ, true_and]
    constructor
    · rw [hF r]
      exact gridVector_kernel m u hkernel p r
    · intro i j hij
      have hc : positiveBoxCoordinates (F r) i = positiveBoxCoordinates (F r) j :=
        congrArg positiveBoxEntry hij
      rw [hF r] at hc
      exact gridVector_distinct m u p hdistinct hM r hc
  let G : ({i : ι // i ≠ p} → Fin M) → positiveBoxAdmissible m N :=
    fun r => ⟨F r, hmem r⟩
  have hG : Function.Injective G := by
    intro r s hrs
    apply gridVector_parameters_injective m u p hp M
    calc
      gridVector m u p r = positiveBoxCoordinates (F r) := (hF r).symm
      _ = positiveBoxCoordinates (F s) :=
        congrArg positiveBoxCoordinates (congrArg Subtype.val hrs)
      _ = gridVector m u p s := hF s
  have hcard := Fintype.card_le_of_injective G hG
  simpa only [Fintype.card_pi, Fintype.card_fin, Finset.prod_const, Finset.card_univ,
    card_away_from_one p, Fintype.card_coe] using hcard

theorem positiveBoxAdmissible_card_lower
    (m u : ι → ℤ) (p : ι) (hp : m p ≠ 0)
    (hkernel : integerPairing m u = 0) (hpositive : ∀ i, 0 < u i)
    (hdistinct : Function.Injective u) (U : ℕ) (hU : ∀ i, u i ≤ (U : ℤ))
    (N : ℕ) (hN : gridBoxConstant m U ≤ N) :
    (N / gridBoxConstant m U) ^ (Fintype.card ι - 1) ≤
      (positiveBoxAdmissible m N).card := by
  apply positiveBoxAdmissible_card_lower_grid m u p hp hkernel hpositive hdistinct U hU
  · exact Nat.div_pos hN (gridBoxConstant_pos m U)
  · simpa only [Nat.mul_comm] using Nat.div_mul_le_self N (gridBoxConstant m U)

/-- A single positive, distinct integer kernel point supplies a fixed
positive denominator constant for every sufficiently large box. -/
theorem exists_positiveBoxAdmissible_card_lower
    (m : ι → ℤ) (hm : PrimitiveNormal m) (u : ι → ℤ)
    (hkernel : integerPairing m u = 0) (hpositive : ∀ i, 0 < u i)
    (hdistinct : Function.Injective u) :
    ∃ C : ℕ, 0 < C ∧ ∀ N : ℕ, C ≤ N →
      (N / C) ^ (Fintype.card ι - 1) ≤ (positiveBoxAdmissible m N).card := by
  obtain ⟨p, hp⟩ := primitive_exists_nonzero m hm
  have hU : ∀ i, u i ≤ (normalSize u : ℤ) :=
    fun i => (le_abs_self (u i)).trans (abs_le_normalSize u i)
  refine ⟨gridBoxConstant m (normalSize u), gridBoxConstant_pos m (normalSize u), ?_⟩
  intro N hN
  exact positiveBoxAdmissible_card_lower m u p hp hkernel hpositive hdistinct
    (normalSize u) hU N hN

end

end Loneliness.Hyperplane
