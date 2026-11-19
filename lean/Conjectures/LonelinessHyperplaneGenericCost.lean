import Mathlib.Algebra.MvPolynomial.Funext
import Mathlib.LinearAlgebra.LinearIndependent.Basic
import Mathlib.Data.Fintype.Powerset
import Mathlib.Tactic.Ring

/-! A rational cost avoiding finitely many dependence witnesses.
The cost is constructed by nonvanishing of a product of linear
polynomials over the infinite field of rationals. -/

namespace Loneliness.Hyperplane.RationalCone

open scoped BigOperators

noncomputable section

variable {ι κ V : Type*} [Fintype ι] [DecidableEq ι]

def cost (c a : ι → ℚ) : ℚ := ∑ i, c i * a i

def Supported (S : Finset ι) (a : ι → ℚ) : Prop := ∀ i ∉ S, a i = 0

def combination [AddCommGroup V] [Module ℚ V] (g : ι → V) (a : ι → ℚ) : V :=
  ∑ i, a i • g i

theorem combination_zero [AddCommGroup V] [Module ℚ V] (g : ι → V) :
    combination g 0 = 0 := by simp [combination]

theorem combination_add [AddCommGroup V] [Module ℚ V]
    (g : ι → V) (a b : ι → ℚ) :
    combination g (a + b) = combination g a + combination g b := by
  simp only [combination, Pi.add_apply, add_smul, Finset.sum_add_distrib]

theorem combination_sub [AddCommGroup V] [Module ℚ V]
    (g : ι → V) (a b : ι → ℚ) :
    combination g (a - b) = combination g a - combination g b := by
  simp only [combination, Pi.sub_apply, sub_smul, Finset.sum_sub_distrib]

theorem combination_smul [AddCommGroup V] [Module ℚ V]
    (g : ι → V) (r : ℚ) (a : ι → ℚ) :
    combination g (r • a) = r • combination g a := by
  simp only [combination, Pi.smul_apply, smul_eq_mul, mul_smul, Finset.smul_sum]

theorem cost_add (c a b : ι → ℚ) : cost c (a + b) = cost c a + cost c b := by
  simp only [cost, Pi.add_apply, mul_add, Finset.sum_add_distrib]

theorem cost_sub (c a b : ι → ℚ) : cost c (a - b) = cost c a - cost c b := by
  simp only [cost, Pi.sub_apply, mul_sub, Finset.sum_sub_distrib]

theorem cost_smul (c a : ι → ℚ) (r : ℚ) : cost c (r • a) = r * cost c a := by
  simp only [cost, Pi.smul_apply, smul_eq_mul, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i _
  ring

theorem combination_eq_sum_of_supported [AddCommGroup V] [Module ℚ V]
    (g : ι → V) (S : Finset ι) (a : ι → ℚ) (ha : Supported S a) :
    combination g a = ∑ i ∈ S, a i • g i := by
  symm
  apply Finset.sum_subset (Finset.subset_univ S)
  intro i _ hi
  rw [ha i hi, zero_smul]

theorem combination_injective_on_independent_support [AddCommGroup V] [Module ℚ V]
    (g : ι → V) (S : Finset ι) (hS : LinearIndepOn ℚ g (S : Set ι))
    (a b : ι → ℚ) (ha : Supported S a) (hb : Supported S b)
    (hab : combination g a = combination g b) : a = b := by
  have hsub : Supported S (a - b) := by
    intro i hi
    simp only [Pi.sub_apply, ha i hi, hb i hi, sub_self]
  have hsum : (∑ i ∈ S, (a - b) i • g i) = 0 := by
    rw [← combination_eq_sum_of_supported g S (a - b) hsub,
      combination_sub, hab, sub_self]
  have hz := linearIndepOn_finset_iff.mp hS (a - b) hsum
  funext i
  apply sub_eq_zero.mp
  by_cases hi : i ∈ S
  · exact hz i hi
  · exact hsub i hi

private def linearCostPolynomial (z : ι → ℚ) : MvPolynomial ι ℚ :=
  ∑ i, MvPolynomial.C (z i) * MvPolynomial.X i

private theorem linearCostPolynomial_eval (z c : ι → ℚ) :
    MvPolynomial.eval c (linearCostPolynomial z) = cost c z := by
  simp only [linearCostPolynomial, map_sum, map_mul, MvPolynomial.eval_C,
    MvPolynomial.eval_X, cost]
  apply Finset.sum_congr rfl
  intro i _
  ring

private theorem linearCostPolynomial_ne_zero (z : ι → ℚ) (hz : z ≠ 0) :
    linearCostPolynomial z ≠ 0 := by
  intro hpoly
  apply hz
  funext i
  have he := congrArg (MvPolynomial.eval (Pi.single i 1)) hpoly
  rw [linearCostPolynomial_eval, map_zero] at he
  simpa [cost, Pi.single_apply] using he

theorem exists_rational_cost_avoiding [Fintype κ]
    (z : κ → ι → ℚ) (hz : ∀ j, z j ≠ 0) :
    ∃ c : ι → ℚ, ∀ j, cost c (z j) ≠ 0 := by
  classical
  let P : MvPolynomial ι ℚ := ∏ j, linearCostPolynomial (z j)
  have hP : P ≠ 0 := Finset.prod_ne_zero_iff.mpr
    (fun j _ => linearCostPolynomial_ne_zero (z j) (hz j))
  have hexists : ∃ c : ι → ℚ, MvPolynomial.eval c P ≠ 0 := by
    by_contra h
    apply hP
    apply MvPolynomial.funext
    intro c
    have hc : MvPolynomial.eval c P = 0 := by
      by_contra hc
      exact h ⟨c, hc⟩
    simpa only [map_zero] using hc
  obtain ⟨c, hc⟩ := hexists
  refine ⟨c, ?_⟩
  have hprod : (∏ j, cost c (z j)) ≠ 0 := by
    simpa only [P, map_prod, linearCostPolynomial_eval] using hc
  intro j
  exact Finset.prod_ne_zero_iff.mp hprod j (Finset.mem_univ j)

theorem exists_supported_kernel [AddCommGroup V] [Module ℚ V]
    (g : ι → V) (S : Finset ι) (hS : ¬ LinearIndepOn ℚ g (S : Set ι)) :
    ∃ z : ι → ℚ, z ≠ 0 ∧ Supported S z ∧ combination g z = 0 := by
  classical
  obtain ⟨f, hf, i, hi, hfi⟩ := not_linearIndepOn_finset_iff.mp hS
  let z : ι → ℚ := fun j => if j ∈ S then f j else 0
  have hsup : Supported S z := by
    intro j hj
    simp only [z, if_neg hj]
  refine ⟨z, ?_, hsup, ?_⟩
  · intro hz
    have he := congrFun hz i
    simp only [z, if_pos hi, Pi.zero_apply] at he
    exact hfi he
  · rw [combination_eq_sum_of_supported g S z hsup]
    calc
      _ = ∑ j ∈ S, f j • g j := by
        apply Finset.sum_congr rfl
        intro j hj
        rw [show z j = f j from if_pos hj]
      _ = 0 := hf

def GenericCost [AddCommGroup V] [Module ℚ V] (g : ι → V) (c : ι → ℚ) : Prop :=
  ∀ S : Finset ι, ¬ LinearIndepOn ℚ g (S : Set ι) →
    ∃ z : ι → ℚ, z ≠ 0 ∧ Supported S z ∧ combination g z = 0 ∧ cost c z ≠ 0

/-- Only finitely many chosen support-dependence witnesses must be
excluded. Genericity is proved, not assumed as geometry input. -/
theorem exists_genericCost [AddCommGroup V] [Module ℚ V] (g : ι → V) :
    ∃ c : ι → ℚ, GenericCost g c := by
  classical
  let D := {S : Finset ι // ¬ LinearIndepOn ℚ g (S : Set ι)}
  choose z hz hsupp hkernel using fun S : D => exists_supported_kernel g S.1 S.2
  obtain ⟨c, hc⟩ := exists_rational_cost_avoiding z hz
  refine ⟨c, ?_⟩
  intro S hS
  exact ⟨z ⟨S, hS⟩, hz _, hsupp _, hkernel _, hc _⟩

end

end Loneliness.Hyperplane.RationalCone
