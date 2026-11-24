module

public import Conjectures.GesselZhuangPaths
public import Conjectures.GesselZhuangRoots
public import Conjectures.GesselZhuangSymmetry

/-!
# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

Every internal-gap height path has a symmetric, real-rooted polynomial with
nonnegative coefficients. These facts are proved for all path lengths by the
exact refined recurrence. The permutation interpretation is supplied separately
by the block-insertion bijection.
-/

@[expose] public section

namespace GesselZhuang

open Polynomial
open scoped BigOperators

/-- State `i` means that `i` internal gaps lie to the right of the newest label. -/
noncomputable def refinedPolynomial : {n h : ℕ} → HeightPath n h → Fin (h + 1) → ℝ[X]
  | _, _, .start => fun _ => 1
  | _, _, .up p => upVector (refinedPolynomial p)
  | _, _, .flat p => flatVector (refinedPolynomial p)
  | _, _, .down p => downVector (refinedPolynomial p)

/-- Sum over the refined gap-position states of a fixed full height path. -/
noncomputable def pathPolynomial {n h : ℕ} (p : HeightPath n h) : ℝ[X] :=
  ∑ i, refinedPolynomial p i

theorem refinedPolynomial_good {n h : ℕ} (p : HeightPath n h) :
    GoodVector (refinedPolynomial p) := by
  induction p with
  | start => exact goodVector_one
  | up p ih => exact ih.up
  | flat p ih => exact ih.flat
  | down p ih => exact ih.down

theorem refinedPolynomial_coeff_nonneg {n h : ℕ} (p : HeightPath n h)
    (i : Fin (h + 1)) (k : ℕ) : 0 ≤ (refinedPolynomial p i).coeff k := by
  induction p generalizing k with
  | start => by_cases hk : k = 0 <;> simp [refinedPolynomial, coeff_one, hk]
  | up p ih => exact upVector_coeff_nonneg ih i k
  | flat p ih => exact flatVector_coeff_nonneg ih i k
  | down p ih => exact downVector_coeff_nonneg ih i k

theorem refinedPolynomial_natDegree_le {n h : ℕ} (p : HeightPath n h)
    (i : Fin (h + 1)) : (refinedPolynomial p i).natDegree ≤ n := by
  induction p with
  | start => simp [refinedPolynomial]
  | up p ih => exact upVector_natDegree_le ih i
  | flat p ih => exact flatVector_natDegree_le ih i
  | down p ih => exact downVector_natDegree_le ih i

theorem refinedPolynomial_symmetric {n h : ℕ} (p : HeightPath n h) :
    SymmetricVector n (refinedPolynomial p) := by
  induction p with
  | start => exact symmetricVector_one
  | up p ih => exact ih.up (refinedPolynomial_natDegree_le p)
  | flat p ih => exact ih.flat (refinedPolynomial_natDegree_le p)
  | down p ih => exact ih.down (refinedPolynomial_natDegree_le p)

theorem pathPolynomial_upperStable {n h : ℕ} (p : HeightPath n h) :
    UpperStable (pathPolynomial p) :=
  (refinedPolynomial_good p).sum_upperStable (by omega)

theorem pathPolynomial_ne_zero {n h : ℕ} (p : HeightPath n h) :
    pathPolynomial p ≠ 0 := (pathPolynomial_upperStable p).ne_zero

theorem pathPolynomial_splits {n h : ℕ} (p : HeightPath n h) :
    (pathPolynomial p).Splits := (pathPolynomial_upperStable p).splits

theorem pathPolynomial_coeff_nonneg {n h : ℕ} (p : HeightPath n h) (k : ℕ) :
    0 ≤ (pathPolynomial p).coeff k := by
  simp only [pathPolynomial, finsetSum_coeff]
  exact Finset.sum_nonneg fun i _ => refinedPolynomial_coeff_nonneg p i k

theorem pathPolynomial_natDegree_le {n h : ℕ} (p : HeightPath n h) :
    (pathPolynomial p).natDegree ≤ n :=
  natDegree_sum_le_of_forall_le _ _ fun i _ => refinedPolynomial_natDegree_le p i

theorem pathPolynomial_symmetric {n h : ℕ} (p : HeightPath n h) :
    reflect n (pathPolynomial p) = pathPolynomial p :=
  (refinedPolynomial_symmetric p).sum

end GesselZhuang
