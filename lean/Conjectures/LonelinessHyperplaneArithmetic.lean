import Conjectures.LonelinessSubspaceDensity
import Mathlib.Algebra.GCDMonoid.Finset
import Mathlib.Data.Int.GCD

/-! Integer normals and explicit finite Bézout coefficients. Primitivity is
the literal gcd-one condition on the absolute integer coordinates. -/

namespace Loneliness.Hyperplane

open scoped BigOperators
open Loneliness.SubspaceDensity

noncomputable section

variable {ι : Type*}

/-- The gcd of finitely many integer coordinates is an integer linear
combination of those coordinates, including negative and zero entries. -/
theorem finset_bezout (s : Finset ι) (m : ι → ℤ) :
    ∃ e : ι → ℤ, ∑ i ∈ s, m i * e i =
      ((s.gcd (fun i => (m i).natAbs) : ℕ) : ℤ) := by
  classical
  induction s using Finset.induction_on with
  | empty => exact ⟨fun _ => 0, by simp⟩
  | @insert a s ha ih =>
    obtain ⟨e, he⟩ := ih
    let d : ℕ := s.gcd (fun i => (m i).natAbs)
    let ca : ℤ := Int.gcdA (m a) (d : ℤ)
    let cb : ℤ := Int.gcdB (m a) (d : ℤ)
    refine ⟨fun i => if i = a then ca else cb * e i, ?_⟩
    rw [Finset.sum_insert ha, Finset.gcd_insert]
    dsimp only
    rw [if_pos rfl]
    change m a * ca + (∑ i ∈ s, m i * (if i = a then ca else cb * e i)) =
      (Nat.gcd (m a).natAbs d : ℤ)
    calc
      _ = m a * ca + cb * (∑ i ∈ s, m i * e i) := by
        congr 1
        rw [Finset.mul_sum]
        apply Finset.sum_congr rfl
        intro i hi
        have hia : i ≠ a := by
          intro h
          subst i
          exact ha hi
        rw [if_neg hia]
        ring
      _ = m a * ca + cb * (d : ℤ) := by rw [he]
      _ = m a * Int.gcdA (m a) (d : ℤ) +
          (d : ℤ) * Int.gcdB (m a) (d : ℤ) := by
        dsimp only [ca, cb]
        ring
      _ = (Int.gcd (m a) (d : ℤ) : ℤ) :=
        (Int.gcd_eq_gcd_ab (m a) (d : ℤ)).symm
      _ = (Nat.gcd (m a).natAbs d : ℤ) := by
        rw [Int.gcd_def, Int.natAbs_natCast]

variable [Fintype ι]

def PrimitiveNormal (m : ι → ℤ) : Prop :=
  Finset.univ.gcd (fun i => (m i).natAbs) = 1

def pairing (m : ι → ℤ) (x : ι → ℝ) : ℝ :=
  ∑ i, (m i : ℝ) * x i

def normalMass (m : ι → ℤ) : ℝ :=
  ∑ i, |(m i : ℝ)|

theorem primitive_bezout (m : ι → ℤ) (hm : PrimitiveNormal m) :
    ∃ e : ι → ℤ, ∑ i, m i * e i = 1 := by
  obtain ⟨e, he⟩ := finset_bezout Finset.univ m
  change Finset.univ.gcd (fun i => (m i).natAbs) = 1 at hm
  rw [hm] at he
  exact ⟨e, he⟩

theorem primitive_exists_nonzero (m : ι → ℤ) (hm : PrimitiveNormal m) :
    ∃ i, m i ≠ 0 := by
  obtain ⟨e, he⟩ := primitive_bezout m hm
  by_contra h
  have hz : ∀ i, m i = 0 := fun i => not_not.mp (fun hi => h ⟨i, hi⟩)
  simp [hz] at he

theorem one_le_normalMass (m : ι → ℤ) (hm : PrimitiveNormal m) :
    1 ≤ normalMass m := by
  obtain ⟨i, hi⟩ := primitive_exists_nonzero m hm
  have hiN : 1 ≤ (m i).natAbs :=
    Nat.one_le_iff_ne_zero.mpr (Int.natAbs_ne_zero.mpr hi)
  have hiR : (1 : ℝ) ≤ |(m i : ℝ)| := by
    have h : (1 : ℝ) ≤ ((m i).natAbs : ℝ) := by exact_mod_cast hiN
    simpa only [Nat.cast_natAbs, Int.cast_abs] using h
  exact hiR.trans (Finset.single_le_sum
    (fun j _ => abs_nonneg (m j : ℝ)) (Finset.mem_univ i))

theorem normalMass_pos (m : ι → ℤ) (hm : PrimitiveNormal m) :
    0 < normalMass m := lt_of_lt_of_le (by norm_num) (one_le_normalMass m hm)

@[simp] theorem pairing_zero (m : ι → ℤ) : pairing m 0 = 0 := by
  simp [pairing]

theorem pairing_add (m : ι → ℤ) (x y : ι → ℝ) :
    pairing m (x + y) = pairing m x + pairing m y := by
  simp [pairing, mul_add, Finset.sum_add_distrib]

theorem pairing_sub (m : ι → ℤ) (x y : ι → ℝ) :
    pairing m (x - y) = pairing m x - pairing m y := by
  simp [pairing, mul_sub, Finset.sum_sub_distrib]

theorem pairing_smul (m : ι → ℤ) (r : ℝ) (x : ι → ℝ) :
    pairing m (r • x) = r * pairing m x := by
  simp only [pairing, Pi.smul_apply, smul_eq_mul, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i _
  ring

theorem pairing_integerVector (m e : ι → ℤ) :
    pairing m (integerVector e) = (∑ i, m i * e i : ℤ) := by
  simp [pairing, integerVector]

/-- At a zero coordinate either sign is available; this definition chooses
one. Every coordinate therefore has absolute value one. -/
def signChoice (m : ι → ℤ) : ι → ℝ :=
  fun i => if 0 ≤ (m i : ℝ) then 1 else -1

theorem abs_signChoice (m : ι → ℤ) (i : ι) : |signChoice m i| = 1 := by
  unfold signChoice
  split_ifs <;> norm_num

theorem pairing_signChoice (m : ι → ℤ) :
    pairing m (signChoice m) = normalMass m := by
  unfold pairing normalMass
  apply Finset.sum_congr rfl
  intro i _
  by_cases hi : 0 ≤ (m i : ℝ)
  · simp [signChoice, hi, abs_of_nonneg hi]
  · simp [signChoice, hi, abs_of_neg (lt_of_not_ge hi)]

end

end Loneliness.Hyperplane
