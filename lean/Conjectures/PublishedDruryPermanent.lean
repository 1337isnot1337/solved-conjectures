import Mathlib.LinearAlgebra.Matrix.Permanent
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.Analysis.Complex.Order
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ext

/-!
# Drury's permanent conjecture

Exact formalization candidate for George Hutchinson's published counterexample,
Special Matrices 5 (2017), 301–302, DOI 10.1515/spma-2017-0022.
The integer matrix is 10000 times the displayed correlation matrix.
-/

noncomputable section

open Matrix Complex
open scoped BigOperators ComplexOrder
local notation "ℤ[i]" => GaussianInt

namespace Published.Drury

/-- Delete the first row and column, preserving the original ordering. -/
def firstMinor {n : ℕ} {R : Type*}
    (A : Matrix (Fin (n + 1)) (Fin (n + 1)) R) : Matrix (Fin n) (Fin n) R :=
  A.submatrix Fin.succ Fin.succ

/-- Delete the first row/column and the indicated further row/column. -/
def secondMinor {n : ℕ} {R : Type*}
    (A : Matrix (Fin (n + 2)) (Fin (n + 2)) R) (k : Fin (n + 1)) :
    Matrix (Fin n) (Fin n) R :=
  (firstMinor A).submatrix k.succAbove k.succAbove

/-- The full original conjecture for every matrix order at least two. -/
def DruryConjecture : Prop :=
  ∀ (n : ℕ) (A : Matrix (Fin (n + 2)) (Fin (n + 2)) ℂ), A.PosSemidef →
    ((A 0 0 * (firstMinor A).permanent).re) ^ 2 +
        (∑ k : Fin (n + 1), Complex.normSq (A 0 k.succ) *
          ((secondMinor A k).permanent).re) ^ 2 ≤
      (A.permanent.re) ^ 2

/-- A transparent sum over exactly all permutations. -/
def permanentFinite {n : ℕ} {R : Type*} [CommSemiring R]
    (A : Matrix (Fin n) (Fin n) R) : R :=
  ∑ σ ∈ permsOfFinset (Finset.univ : Finset (Fin n)), ∏ i, A (σ i) i

lemma permanentFinite_eq {n : ℕ} {R : Type*} [CommSemiring R]
    (A : Matrix (Fin n) (Fin n) R) : permanentFinite A = A.permanent := by
  have h : permsOfFinset (Finset.univ : Finset (Fin n)) = Finset.univ := by
    ext σ
    simp [mem_perms_of_finset_iff]
  simp [permanentFinite, h, Matrix.permanent]

lemma permanent_map {n : Type*} [Fintype n] [DecidableEq n]
    {R S : Type*} [CommSemiring R] [CommSemiring S]
    (f : R →+* S) (A : Matrix n n R) :
    (A.map f).permanent = f A.permanent := by
  simp [Matrix.permanent, Matrix.map_apply, map_sum, map_prod]

def hutchinsonZ : Matrix (Fin 4) (Fin 4) ℤ[i] :=
  !![⟨10000, 0⟩, ⟨-110, 2225⟩, ⟨2281, -237⟩, ⟨-1790, -1755⟩;
     ⟨-110, -2225⟩, ⟨10000, 0⟩, ⟨9140, 1634⟩, ⟨8974, 541⟩;
     ⟨2281, 237⟩, ⟨9140, -1634⟩, ⟨10000, 0⟩, ⟨8758, -2433⟩;
     ⟨-1790, 1755⟩, ⟨8974, -541⟩, ⟨8758, 2433⟩, ⟨10000, 0⟩]

def hutchinson : Matrix (Fin 4) (Fin 4) ℂ := hutchinsonZ.map GaussianInt.toComplex

/-- Positive denominator clearing an exact LDL* factorization. -/
def factorScale : ℕ := 33499985282416431791567985310517252024156147080000000000

/-- The exact LDL* lower factor multiplied by 9426016774724530000. -/
def lowerZ : Matrix (Fin 4) (Fin 4) ℤ[i] :=
  !![⟨9426016774724530000, 0⟩, 0, 0, 0;
     ⟨-103686184521969830, -2097288732376207925⟩, ⟨9426016774724530000, 0⟩, 0, 0;
     ⟨2150074426314665293, 223396597560971361⟩,
       ⟨9142450573993202000, -2121425870293346000⟩, ⟨9426016774724530000, 0⟩, 0;
     ⟨-1687257002675690870, 1654265943964155015⟩,
       ⟨9268386324355770000, -122410810951440000⟩,
       ⟨6007033215199927500, 1232339012264595000⟩, ⟨9426016774724530000, 0⟩]

/-- The diagonal LDL* pivots multiplied by 377040670988981200. -/
def pivotsZ : Fin 4 → ℤ[i] :=
  ![3770406709889812000000, 3583291793496432827423,
    19674262503405788480, 60091024255602932700]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
lemma hutchinson_scaled_factor_Z :
    (factorScale : ℤ[i]) • hutchinsonZ = lowerZ * diagonal pivotsZ * lowerZᴴ := by
  decide

lemma hutchinson_scaled_factor :
    (factorScale : ℂ) • hutchinson =
      lowerZ.map GaussianInt.toComplex *
        diagonal (fun i => GaussianInt.toComplex (pivotsZ i)) *
          (lowerZ.map GaussianInt.toComplex)ᴴ := by
  ext i j
  have h := congrArg GaussianInt.toComplex
    (congrFun (congrFun hutchinson_scaled_factor_Z i) j)
  simpa [hutchinson, Matrix.mul_apply, Matrix.conjTranspose_apply, Matrix.map_apply,
    Matrix.diagonal, Pi.smul_apply, smul_eq_mul, map_sum, map_mul,
    GaussianInt.toComplex_star, map_natCast, map_ofNat, apply_ite] using h

lemma hutchinson_posSemidef : hutchinson.PosSemidef := by
  have hd : (diagonal (fun i => GaussianInt.toComplex (pivotsZ i))).PosSemidef := by
    apply Matrix.PosSemidef.diagonal
    intro i
    fin_cases i <;> norm_num [pivotsZ, map_ofNat, Complex.nonneg_iff]
  have h := hd.mul_mul_conjTranspose_same (lowerZ.map GaussianInt.toComplex)
  rw [← hutchinson_scaled_factor] at h
  have hinv : (0 : ℂ) ≤ (factorScale : ℂ)⁻¹ := by
    norm_num [factorScale, Complex.nonneg_iff]
  have hh := h.smul hinv
  simpa [smul_smul, factorScale] using hh

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
lemma hutchinson_permanent_Z : permanentFinite hutchinsonZ = 50033545799805685 := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
lemma hutchinson_first_permanent_Z :
    permanentFinite (firstMinor hutchinsonZ) = 4996048920680 := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
lemma hutchinson_second_permanents_Z :
    (fun k : Fin 3 => permanentFinite (secondMinor hutchinsonZ k)) =
      ![182622053, 180825357, 186209556] := by
  decide

lemma hutchinson_permanent : hutchinson.permanent = 50033545799805685 := by
  rw [hutchinson, permanent_map, ← permanentFinite_eq, hutchinson_permanent_Z]
  exact map_natCast GaussianInt.toComplex _

lemma hutchinson_first_permanent :
    (firstMinor hutchinson).permanent = 4996048920680 := by
  change ((firstMinor hutchinsonZ).map GaussianInt.toComplex).permanent = _
  rw [permanent_map, ← permanentFinite_eq, hutchinson_first_permanent_Z]
  exact map_natCast GaussianInt.toComplex _

lemma hutchinson_second_permanents (k : Fin 3) :
    (secondMinor hutchinson k).permanent =
      (![182622053, 180825357, 186209556] : Fin 3 → ℂ) k := by
  change ((secondMinor hutchinsonZ k).map GaussianInt.toComplex).permanent = _
  rw [permanent_map, ← permanentFinite_eq]
  have h := congrFun hutchinson_second_permanents_Z k
  rw [h]
  fin_cases k <;> norm_num [map_ofNat]

lemma hutchinson_violation :
    (hutchinson.permanent.re) ^ 2 <
      ((hutchinson 0 0 * (firstMinor hutchinson).permanent).re) ^ 2 +
        (∑ k : Fin 3, Complex.normSq (hutchinson 0 k.succ) *
          ((secondMinor hutchinson k).permanent).re) ^ 2 := by
  rw [hutchinson_permanent, hutchinson_first_permanent]
  simp_rw [hutchinson_second_permanents]
  norm_num [hutchinson, hutchinsonZ, Matrix.map_apply, GaussianInt.toComplex_def',
    Fin.sum_univ_succ, Complex.normSq_apply]

/-- Hutchinson's witness refutes the original universally quantified conjecture. -/
theorem not_druryConjecture : ¬ DruryConjecture := by
  intro h
  exact (not_le_of_gt hutchinson_violation) (h 2 hutchinson hutchinson_posSemidef)

end Published.Drury
