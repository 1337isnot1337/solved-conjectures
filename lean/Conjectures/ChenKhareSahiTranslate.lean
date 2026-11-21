import Conjectures.ChenKhareSahiTheorem

namespace ChenKhareSahi

theorem realM_average (a b c : ℕ) (x y z : ℝ) :
    realM a b c x y z =
      (x^a*y^b*z^c + x^a*y^c*z^b + x^b*y^a*z^c + x^b*y^c*z^a +
       x^c*y^a*z^b + x^c*y^b*z^a) / 6 := by
  by_cases hab : a=b <;> by_cases hac : a=c <;> by_cases hbc : b=c
  all_goals simp_all [realM, orbit, Finset.sum_insert, Finset.sum_singleton] <;> ring

theorem realM_translate (a b c r : ℕ) (x y z : ℝ) :
    realM (a+r) (b+r) (c+r) x y z = (x*y*z)^r * realM a b c x y z := by
  rw [realM_average, realM_average]
  simp only [pow_add, mul_pow]
  ring


def shiftPartition (p : Partition) (r : ℕ) : Partition := (p.1+r, p.2.1+r, p.2.2+r)

theorem realP_translate (p : Partition) (r : ℕ) (x y z : ℝ) :
    realP (shiftPartition p r) x y z = (x*y*z)^r * realP p x y z := by
  exact realM_translate p.1 p.2.1 p.2.2 r x y z

theorem realD_translate (a b : Partition) (r : ℕ) (x y z : ℝ) :
    realD (shiftPartition a r) (shiftPartition b r) x y z = (x*y*z)^r * realD a b x y z := by
  simp only [realD, realP_translate]
  ring

theorem dominates_translate (a b : Partition) (r : ℕ) :
    dominates (shiftPartition a r) (shiftPartition b r) ↔ dominates a b := by
  simp only [dominates, degree, shiftPartition]
  omega

theorem eigenoperator_translate (f : SymFun) (r : ℕ) (x y z : ℝ) :
    realClearedOperator (fun x y z => (x*y*z)^r * f x y z) x y z =
      (1/10 : ℝ)^r * (x*y*z)^r * realClearedOperator f x y z := by
  simp only [realClearedOperator, mul_pow]
  ring

theorem translate_eigenfunction (f : SymFun) (η : ℝ)
    (hf : ∀ x y z, realClearedOperator f x y z = η * realDelta x y z * f x y z)
    (r : ℕ) (x y z : ℝ) :
    realClearedOperator (fun x y z => (x*y*z)^r * f x y z) x y z =
      ((1/10 : ℝ)^r * η) * realDelta x y z * ((x*y*z)^r * f x y z) := by
  rw [eigenoperator_translate, hf]
  ring

end ChenKhareSahi
