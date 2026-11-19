import Conjectures.LonelinessHyperplaneArithmetic

/-! Elementary integer linear algebra for the hyperplane counting
argument. Primitivity turns a rational dependence of integer normals into
an integer multiple. Two independent normals determine two coordinates
once the other coordinates are fixed. -/

namespace Loneliness.Hyperplane

open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι]

def integerPairing (m v : ι → ℤ) : ℤ := ∑ i, m i * v i

@[simp] theorem integerPairing_zero (m : ι → ℤ) : integerPairing m 0 = 0 := by
  simp [integerPairing]

theorem integerPairing_comm (m v : ι → ℤ) : integerPairing m v = integerPairing v m := by
  simp only [integerPairing, mul_comm]

theorem integerPairing_add (m x y : ι → ℤ) :
    integerPairing m (x + y) = integerPairing m x + integerPairing m y := by
  simp [integerPairing, mul_add, Finset.sum_add_distrib]

theorem integerPairing_sub (m x y : ι → ℤ) :
    integerPairing m (x - y) = integerPairing m x - integerPairing m y := by
  simp [integerPairing, mul_sub, Finset.sum_sub_distrib]

theorem integerPairing_smul (m : ι → ℤ) (c : ℤ) (x : ι → ℤ) :
    integerPairing m (c • x) = c * integerPairing m x := by
  simp only [integerPairing, Pi.smul_apply, zsmul_eq_mul, Int.cast_id, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i _
  ring

theorem integerPairing_single [DecidableEq ι] (m : ι → ℤ) (j : ι) (a : ℤ) :
    integerPairing m (Pi.single j a) = m j * a := by
  simp [integerPairing, Pi.single_apply, mul_ite]

/-- The projection of a coordinate vector to the integer kernel using
an explicit Bézout vector. -/
def kernelDirection (m e : ι → ℤ) (j : ι) : ι → ℤ := by
  classical
  exact Pi.single j 1 - m j • e

theorem integerPairing_kernelDirection (m e b : ι → ℤ) (j : ι) :
    integerPairing b (kernelDirection m e j) = b j - m j * integerPairing b e := by
  classical
  rw [kernelDirection, integerPairing_sub, integerPairing_single, integerPairing_smul,
    mul_one]

theorem kernelDirection_mem (m e : ι → ℤ) (he : integerPairing m e = 1) (j : ι) :
    integerPairing m (kernelDirection m e j) = 0 := by
  rw [integerPairing_kernelDirection, he, mul_one, sub_self]

/-- Every integer frequency outside the normal's integer span is detected
by an integer vector in the kernel. -/
theorem exists_integer_kernel_separator
    (m : ι → ℤ) (hm : PrimitiveNormal m) (b : ι → ℤ)
    (hb : ¬ ∃ c : ℤ, b = c • m) :
    ∃ z : ι → ℤ, integerPairing m z = 0 ∧ integerPairing b z ≠ 0 := by
  classical
  obtain ⟨e, he⟩ := primitive_bezout m hm
  change integerPairing m e = 1 at he
  let c := integerPairing b e
  have hj : ∃ j, b j ≠ c * m j := by
    by_contra h
    apply hb
    refine ⟨c, ?_⟩
    ext j
    change b j = c * m j
    exact not_not.mp (fun hne => h ⟨j, hne⟩)
  obtain ⟨j, hj⟩ := hj
  refine ⟨kernelDirection m e j, kernelDirection_mem m e he j, ?_⟩
  rw [integerPairing_kernelDirection]
  apply sub_ne_zero.mpr
  simpa only [mul_comm] using hj

theorem integer_annihilator_iff
    (m : ι → ℤ) (hm : PrimitiveNormal m) (b : ι → ℤ) :
    (∀ z : ι → ℤ, integerPairing m z = 0 → integerPairing b z = 0) ↔
      ∃ c : ℤ, b = c • m := by
  constructor
  · intro h
    by_contra hb
    obtain ⟨z, hmz, hbz⟩ := exists_integer_kernel_separator m hm b hb
    exact hbz (h z hmz)
  · rintro ⟨c, rfl⟩ z hz
    rw [integerPairing_comm (c • m) z, integerPairing_smul,
      integerPairing_comm z m, hz, mul_zero]

/-- A primitive normal and an integer frequency outside its integer span
have a nonzero two-by-two minor. -/
theorem exists_nonzero_minor
    (m : ι → ℤ) (hm : PrimitiveNormal m) (b : ι → ℤ)
    (hb : ¬ ∃ c : ℤ, b = c • m) :
    ∃ p q : ι, p ≠ q ∧ m p * b q - m q * b p ≠ 0 := by
  classical
  obtain ⟨e, he⟩ := primitive_bezout m hm
  change integerPairing m e = 1 at he
  by_contra h
  have hdet : ∀ p q : ι, m p * b q = m q * b p := by
    intro p q
    by_cases hpq : p = q
    · subst q
      rfl
    · apply sub_eq_zero.mp
      exact not_not.mp (fun hn => h ⟨p, q, hpq, hn⟩)
  apply hb
  refine ⟨integerPairing b e, ?_⟩
  ext q
  change b q = integerPairing b e * m q
  calc
    b q = integerPairing m e * b q := by rw [he, one_mul]
    _ = ∑ p, (m p * e p) * b q := by rw [integerPairing, Finset.sum_mul]
    _ = ∑ p, (b p * e p) * m q := by
      apply Finset.sum_congr rfl
      intro p _
      calc
        _ = (m p * b q) * e p := by ring
        _ = (m q * b p) * e p := by rw [hdet p q]
        _ = _ := by ring
    _ = integerPairing b e * m q := by rw [integerPairing, Finset.sum_mul]

private theorem integerPairing_eq_two_terms
    (m z : ι → ℤ) (p q : ι) (hpq : p ≠ q)
    (hz : ∀ i, i ≠ p → i ≠ q → z i = 0) :
    integerPairing m z = m p * z p + m q * z q := by
  classical
  calc
    integerPairing m z =
        ∑ i, ((if i = p then m p * z p else 0) +
          (if i = q then m q * z q else 0)) := by
      apply Finset.sum_congr rfl
      intro i _
      by_cases hip : i = p
      · subst i
        simp [hpq]
      · by_cases hiq : i = q
        · subst i
          simp [hpq.symm]
        · simp [hip, hiq, hz i hip hiq]
    _ = _ := by simp [Finset.sum_add_distrib]

/-- Two independent integer linear equations determine their two pivot
coordinates from all remaining coordinates. -/
theorem eq_of_pairings_eq_of_eq_off
    (m b : ι → ℤ) (p q : ι) (hpq : p ≠ q)
    (hdet : m p * b q - m q * b p ≠ 0)
    (x y : ι → ℤ)
    (hm : integerPairing m x = integerPairing m y)
    (hb : integerPairing b x = integerPairing b y)
    (hxy : ∀ i, i ≠ p → i ≠ q → x i = y i) : x = y := by
  let z := x - y
  have hz : ∀ i, i ≠ p → i ≠ q → z i = 0 := by
    intro i hip hiq
    change x i - y i = 0
    exact sub_eq_zero.mpr (hxy i hip hiq)
  have hmz : m p * z p + m q * z q = 0 := by
    rw [← integerPairing_eq_two_terms m z p q hpq hz]
    change integerPairing m (x - y) = 0
    rw [integerPairing_sub, hm, sub_self]
  have hbz : b p * z p + b q * z q = 0 := by
    rw [← integerPairing_eq_two_terms b z p q hpq hz]
    change integerPairing b (x - y) = 0
    rw [integerPairing_sub, hb, sub_self]
  have hzp : z p = 0 := by
    have h : (m p * b q - m q * b p) * z p = 0 := by
      calc
        _ = b q * (m p * z p + m q * z q) -
            m q * (b p * z p + b q * z q) := by ring
        _ = 0 := by rw [hmz, hbz]; ring
    exact (mul_eq_zero.mp h).resolve_left hdet
  have hzq : z q = 0 := by
    have h : (m p * b q - m q * b p) * z q = 0 := by
      calc
        _ = m p * (b p * z p + b q * z q) -
            b p * (m p * z p + m q * z q) := by ring
        _ = 0 := by rw [hmz, hbz]; ring
    exact (mul_eq_zero.mp h).resolve_left hdet
  ext i
  by_cases hip : i = p
  · subst i
    exact sub_eq_zero.mp hzp
  · by_cases hiq : i = q
    · subst i
      exact sub_eq_zero.mp hzq
    · exact hxy i hip hiq

end

end Loneliness.Hyperplane
