module

public import Conjectures.GesselZhuangCone
public import Mathlib.Algebra.Polynomial.BigOperators
public import Mathlib.Algebra.Polynomial.Coeff
public import Mathlib.Algebra.Polynomial.Degree.Operations
public import Mathlib.Algebra.Polynomial.Eval.Coeff

/-!
# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

The exact polynomial operators for the internal-gap paths, with the state
indices read from right to left. The three operators correspond to creating a
block, extending a block, and joining adjacent blocks by the new maximum.
-/

@[expose] public section

namespace GesselZhuang

open Polynomial
open scoped BigOperators

noncomputable def complexEval (p : ℝ[X]) (z : ℂ) : ℂ :=
  (p.map Complex.ofRealHom).eval z

/-- No zero in the open upper half-plane. -/
def UpperStable (p : ℝ[X]) : Prop :=
  ∀ z : ℂ, 0 < z.im → complexEval p z ≠ 0

/-- The ordered cone and nonvanishing maintained by every refined path row. -/
def GoodVector {n : ℕ} (f : Fin n → ℝ[X]) : Prop :=
  ∀ z : ℂ, 0 < z.im →
    Chow.OrderedCone z (fun i => complexEval (f i) z) ∧
      ∀ i, complexEval (f i) z ≠ 0

/-- The initial segment receives the factor `X`. -/
noncomputable def cutPolynomial {n : ℕ} (f : Fin n → ℝ[X]) (k : ℕ) : ℝ[X] :=
  ∑ i : Fin n, if i.val < k then X * f i else f i

noncomputable def upVector {h : ℕ} (f : Fin (h + 1) → ℝ[X]) :
    Fin (h + 2) → ℝ[X] := fun i => cutPolynomial f i.val

noncomputable def flatVector {h : ℕ} (f : Fin (h + 1) → ℝ[X]) :
    Fin (h + 1) → ℝ[X] :=
  fun i => cutPolynomial f i.val + cutPolynomial f (i.val + 1)

noncomputable def downVector {h : ℕ} (f : Fin (h + 2) → ℝ[X]) :
    Fin (h + 1) → ℝ[X] := fun i => cutPolynomial f (i.val + 1)

theorem complexEval_cutPolynomial {n : ℕ} (f : Fin n → ℝ[X]) (k : ℕ) (z : ℂ) :
    complexEval (cutPolynomial f k) z =
      Chow.cutValue z (fun i => complexEval (f i) z) k := by
  simp [complexEval, cutPolynomial, Chow.cutValue, Polynomial.map_sum,
    eval_finsetSum, apply_ite]

theorem goodVector_one : GoodVector (fun _ : Fin 1 => (1 : ℝ[X])) := by
  intro z hz
  constructor
  · intro i j _
    simpa [complexEval] using cone_diagonal hz.le (1 : ℂ)
  · intro i
    simp [complexEval]

theorem GoodVector.cut {n m : ℕ} {f : Fin n → ℝ[X]} (hf : GoodVector f)
    (hn : 0 < n) (k : Fin m → ℕ) (hk : Monotone k) :
    GoodVector (fun i => cutPolynomial f (k i)) := by
  intro z hz
  have h := hf z hz
  simp only [complexEval_cutPolynomial]
  exact ⟨Chow.orderedCone_cutValue hz.le h.1 k hk,
    fun i => cutValue_ne_zero hz h.1 ⟨⟨0, hn⟩, h.2 _⟩ (k i)⟩

theorem GoodVector.up {h : ℕ} {f : Fin (h + 1) → ℝ[X]} (hf : GoodVector f) :
    GoodVector (upVector f) :=
  hf.cut (by omega) (fun i => i.val) (fun _ _ hij => hij)

theorem GoodVector.down {h : ℕ} {f : Fin (h + 2) → ℝ[X]} (hf : GoodVector f) :
    GoodVector (downVector f) :=
  hf.cut (by omega) (fun i => i.val + 1) (fun _ _ hij => Nat.add_le_add_right hij 1)

theorem GoodVector.flat {h : ℕ} {f : Fin (h + 1) → ℝ[X]} (hf : GoodVector f) :
    GoodVector (flatVector f) := by
  intro z hz
  have hc := hf.up z hz
  change Chow.OrderedCone z
      (fun i : Fin (h + 1) => complexEval (flatVector f i) z) ∧ _
  have heval (i : Fin (h + 1)) : complexEval (flatVector f i) z =
      complexEval (upVector f i.castSucc) z + complexEval (upVector f i.succ) z := by
    simp [flatVector, upVector, complexEval]
  simp only [heval]
  exact ⟨orderedCone_adjacent hz.le hc.1, adjacent_ne_zero hz hc.1 hc.2⟩

theorem GoodVector.upperStable {n : ℕ} {f : Fin n → ℝ[X]}
    (hf : GoodVector f) (i : Fin n) : UpperStable (f i) :=
  fun z hz => (hf z hz).2 i

theorem GoodVector.sum_upperStable {n : ℕ} {f : Fin n → ℝ[X]}
    (hf : GoodVector f) (hn : 0 < n) : UpperStable (∑ i, f i) := by
  intro z hz
  have h := hf z hz
  simpa only [complexEval, Polynomial.map_sum, eval_finsetSum] using
    orderedCone_sum_ne_zero hz h.1 ⟨⟨0, hn⟩, h.2 _⟩

theorem cutPolynomial_coeff_nonneg {n : ℕ} {f : Fin n → ℝ[X]}
    (hf : ∀ i k, 0 ≤ (f i).coeff k) (l k : ℕ) :
    0 ≤ (cutPolynomial f l).coeff k := by
  simp only [cutPolynomial, finsetSum_coeff]
  apply Finset.sum_nonneg
  intro i _
  split_ifs
  · cases k with
    | zero => simp
    | succ k => simpa only [coeff_X_mul] using hf i k
  · exact hf i k

theorem upVector_coeff_nonneg {h : ℕ} {f : Fin (h + 1) → ℝ[X]}
    (hf : ∀ i k, 0 ≤ (f i).coeff k) (i : Fin (h + 2)) (k : ℕ) :
    0 ≤ (upVector f i).coeff k := cutPolynomial_coeff_nonneg hf _ _

theorem flatVector_coeff_nonneg {h : ℕ} {f : Fin (h + 1) → ℝ[X]}
    (hf : ∀ i k, 0 ≤ (f i).coeff k) (i : Fin (h + 1)) (k : ℕ) :
    0 ≤ (flatVector f i).coeff k := by
  simp only [flatVector, coeff_add]
  exact add_nonneg (cutPolynomial_coeff_nonneg hf _ _) (cutPolynomial_coeff_nonneg hf _ _)

theorem downVector_coeff_nonneg {h : ℕ} {f : Fin (h + 2) → ℝ[X]}
    (hf : ∀ i k, 0 ≤ (f i).coeff k) (i : Fin (h + 1)) (k : ℕ) :
    0 ≤ (downVector f i).coeff k := cutPolynomial_coeff_nonneg hf _ _

theorem cutPolynomial_natDegree_le {n d : ℕ} {f : Fin n → ℝ[X]}
    (hf : ∀ i, (f i).natDegree ≤ d) (k : ℕ) :
    (cutPolynomial f k).natDegree ≤ d + 1 := by
  apply natDegree_sum_le_of_forall_le
  intro i _
  split_ifs
  · exact natDegree_mul_le.trans (by simp only [natDegree_X]; have := hf i; omega)
  · exact (hf i).trans (by omega)

theorem upVector_natDegree_le {h d : ℕ} {f : Fin (h + 1) → ℝ[X]}
    (hf : ∀ i, (f i).natDegree ≤ d) (i : Fin (h + 2)) :
    (upVector f i).natDegree ≤ d + 1 := cutPolynomial_natDegree_le hf _

theorem flatVector_natDegree_le {h d : ℕ} {f : Fin (h + 1) → ℝ[X]}
    (hf : ∀ i, (f i).natDegree ≤ d) (i : Fin (h + 1)) :
    (flatVector f i).natDegree ≤ d + 1 :=
  natDegree_add_le_of_degree_le (cutPolynomial_natDegree_le hf _)
    (cutPolynomial_natDegree_le hf _)

theorem downVector_natDegree_le {h d : ℕ} {f : Fin (h + 2) → ℝ[X]}
    (hf : ∀ i, (f i).natDegree ≤ d) (i : Fin (h + 1)) :
    (downVector f i).natDegree ≤ d + 1 := cutPolynomial_natDegree_le hf _

end GesselZhuang
