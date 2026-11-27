import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Basic.Real.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.List.Permutation
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Data.Rat.BigOperators
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.IntervalCases
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-!
# Five-variable Schur semiring for Chen–Khare–Sahi Conjecture 4

At source parameter `σ = 1` the normalized source Jack polynomials are the
normalized Schur polynomials. This module defines them in five variables by the
Jacobi–Trudi determinant of complete homogeneous symmetric polynomials, defines
the full source semiring (finite nonnegative real sums of products of normalized
Schur polynomials and of normalized dominance differences), and proves the
grading and finite cone reductions used by the counterexample.
-/

namespace ChenKhareSahi.Jack

open Finset

noncomputable section

/-! ## Complete homogeneous symmetric polynomials -/

/-- `hl xs k` is the complete homogeneous symmetric polynomial `h_k` evaluated at the
list of variables `xs`. -/
def hl {R : Type*} [CommSemiring R] : List R → ℕ → R
  | [], k => if k = 0 then 1 else 0
  | c :: cs, k => ((List.range (k + 1)).map fun j => c ^ j * hl cs (k - j)).sum

theorem hl_map_mul {R : Type*} [CommSemiring R] (t : R) (cs : List R) (k : ℕ) :
    hl (cs.map (t * ·)) k = t ^ k * hl cs k := by
  induction cs generalizing k with
  | nil => by_cases hk : k = 0 <;> simp [hl, hk]
  | cons c cs ih =>
    simp only [List.map_cons, hl, ih]
    rw [← List.sum_map_mul_left]
    congr 1
    apply List.map_congr_left
    intro j hj
    have hjk : j ≤ k := Nat.lt_succ_iff.mp (List.mem_range.mp hj)
    calc (t * c) ^ j * (t ^ (k - j) * hl cs (k - j))
        = (t ^ j * t ^ (k - j)) * (c ^ j * hl cs (k - j)) := by ring
      _ = t ^ k * (c ^ j * hl cs (k - j)) := by rw [← pow_add, Nat.add_sub_cancel' hjk]

theorem hl_cast {R : Type*} [CommSemiring R] (cs : List ℕ) (k : ℕ) :
    hl (cs.map (Nat.cast : ℕ → R)) k = ((hl cs k : ℕ) : R) := by
  induction cs generalizing k with
  | nil => by_cases hk : k = 0 <;> simp [hl, hk]
  | cons c cs ih =>
    simp only [List.map_cons, hl, ih, Nat.cast_list_sum, List.map_map]
    congr 1
    apply List.map_congr_left
    intro j _
    simp

/-- Points of five-dimensional real space. -/
abbrev Pt := Fin 5 → ℝ

/-- The complete homogeneous symmetric polynomial `h_k(x₀, …, x₄)`. -/
def h (k : ℕ) (x : Pt) : ℝ := hl (List.ofFn x) k

theorem h_smul (t : ℝ) (x : Pt) (k : ℕ) : h k (t • x) = t ^ k * h k x := by
  unfold h
  have : List.ofFn (t • x) = (List.ofFn x).map (t * ·) := by
    simp
  rw [this, hl_map_mul]

/-- `h_k` with the convention `h_k = 0` for negative `k`. -/
def hz (k : ℤ) (x : Pt) : ℝ := if 0 ≤ k then h k.toNat x else 0

theorem hz_smul (t : ℝ) (x : Pt) (k : ℤ) : hz k (t • x) = t ^ k.toNat * hz k x := by
  unfold hz
  split_ifs <;> simp [h_smul]

/-! ## Jacobi–Trudi Schur polynomials -/

/-- The size of a partition with at most five parts. -/
def size (p : Fin 5 → ℕ) : ℕ := ∑ i, p i

/-- The Jacobi–Trudi matrix `(h_{p_i - i + j})`. -/
def jt (p : Fin 5 → ℕ) (x : Pt) : Matrix (Fin 5) (Fin 5) ℝ :=
  Matrix.of fun i j => hz ((p i : ℤ) - (i : ℕ) + (j : ℕ)) x

/-- The five-variable Schur polynomial `s_p = det (h_{p_i - i + j})`. -/
def schur (p : Fin 5 → ℕ) (x : Pt) : ℝ := (jt p x).det

theorem schur_smul (p : Fin 5 → ℕ) (t : ℝ) (x : Pt) :
    schur p (t • x) = t ^ size p * schur p x := by
  unfold schur
  rw [Matrix.det_apply', Matrix.det_apply', Finset.mul_sum]
  refine Finset.sum_congr rfl fun σ _ => ?_
  rw [mul_left_comm]
  congr 1
  simp only [jt, Matrix.of_apply, hz_smul, Finset.prod_mul_distrib]
  by_cases hneg : ∃ i, ((p (σ i) : ℤ) - ((σ i : Fin 5) : ℕ) + (i : ℕ)) < 0
  · obtain ⟨i, hi⟩ := hneg
    have hz0 : ∏ j, hz ((p (σ j) : ℤ) - ((σ j : Fin 5) : ℕ) + (j : ℕ)) x = 0 :=
      Finset.prod_eq_zero (Finset.mem_univ i) (by simp [hz, not_le.mpr hi])
    rw [hz0]
    simp
  · simp only [not_exists, not_lt] at hneg
    rw [Finset.prod_pow_eq_pow_sum]
    congr 2
    have hsum : ((∑ i, ((p (σ i) : ℤ) - ((σ i : Fin 5) : ℕ) + (i : ℕ)).toNat : ℕ) : ℤ) =
        (size p : ℤ) := by
      push_cast
      rw [Finset.sum_congr rfl (fun i _ => Int.toNat_of_nonneg (hneg i))]
      rw [Finset.sum_add_distrib, Finset.sum_sub_distrib,
        Equiv.sum_comp σ (fun i => (p i : ℤ)),
        Equiv.sum_comp σ (fun i : Fin 5 => ((i : ℕ) : ℤ))]
      simp [size]
    exact_mod_cast hsum

/-- The normalized Schur polynomial `s_p(x) / s_p(1,1,1,1,1)`. -/
def nschur (p : Fin 5 → ℕ) (x : Pt) : ℝ := schur p x / schur p 1

theorem nschur_smul (p : Fin 5 → ℕ) (t : ℝ) (x : Pt) :
    nschur p (t • x) = t ^ size p * nschur p x := by
  unfold nschur
  rw [schur_smul, mul_div_assoc]

/-! ## Exact evaluation at points with natural coordinates -/

/-- The real point with the given natural-number coordinates. -/
def natPt (a : Fin 5 → ℕ) : Pt := fun i => (a i : ℝ)

theorem h_natPt (a : Fin 5 → ℕ) (k : ℕ) :
    h k (natPt a) = ((hl (List.ofFn a) k : ℕ) : ℝ) := by
  unfold h natPt
  rw [show List.ofFn (fun i => (a i : ℝ)) = (List.ofFn a).map (Nat.cast : ℕ → ℝ) by
    simp, hl_cast]

/-- The integer Jacobi–Trudi matrix at a point with natural coordinates. -/
def jtInt (p a : Fin 5 → ℕ) : Matrix (Fin 5) (Fin 5) ℤ :=
  Matrix.of fun i j =>
    if 0 ≤ (p i : ℤ) - (i : ℕ) + (j : ℕ) then
      ((hl (List.ofFn a) ((p i : ℤ) - (i : ℕ) + (j : ℕ)).toNat : ℕ) : ℤ) else 0

/-- Laplace expansion along the first row, as a kernel-computable function. -/
def lap : (n : ℕ) → Matrix (Fin n) (Fin n) ℤ → ℤ
  | 0, _ => 1
  | n + 1, M => ∑ j : Fin (n + 1), (-1) ^ (j : ℕ) * M 0 j * lap n (M.submatrix Fin.succ j.succAbove)

theorem lap_eq_det : ∀ (n : ℕ) (M : Matrix (Fin n) (Fin n) ℤ), lap n M = M.det
  | 0, M => by simp [lap]
  | n + 1, M => by
    rw [Matrix.det_succ_row_zero, lap]
    refine Finset.sum_congr rfl fun j _ => ?_
    rw [lap_eq_det n]

theorem schur_natPt (p a : Fin 5 → ℕ) : schur p (natPt a) = ((lap 5 (jtInt p a) : ℤ) : ℝ) := by
  have hm : jt p (natPt a) = (jtInt p a).map (Int.cast : ℤ → ℝ) := by
    ext i j
    simp only [jt, jtInt, Matrix.of_apply, Matrix.map_apply, hz, h_natPt]
    split_ifs <;> simp
  rw [schur, hm, lap_eq_det]
  exact ((Int.castRingHom ℝ).map_det (jtInt p a)).symm

theorem one_eq_natPt : (1 : Pt) = natPt ![1, 1, 1, 1, 1] := by
  funext i
  fin_cases i <;> simp [natPt]

/-! ## Dominance and the source semiring -/

/-- The sum of the first `r` parts. -/
def prefixSum (p : Fin 5 → ℕ) (r : ℕ) : ℕ := ∑ i : Fin 5, if (i : ℕ) < r then p i else 0

/-- Dominance of partitions of the same size: every prefix sum of `a` is at least that of `b`. -/
def Dominates (a b : Fin 5 → ℕ) : Prop := size a = size b ∧ ∀ r : ℕ, prefixSum b r ≤ prefixSum a r

/-- A decidable form of dominance using the prefixes of length at most five. -/
def DominatesFin (a b : Fin 5 → ℕ) : Prop := size a = size b ∧ ∀ r : Fin 6, prefixSum b r ≤ prefixSum a r

instance (a b : Fin 5 → ℕ) : Decidable (DominatesFin a b) := by
  unfold DominatesFin; infer_instance

theorem prefixSum_of_le (p : Fin 5 → ℕ) (r : ℕ) (hr : 5 ≤ r) : prefixSum p r = size p := by
  unfold prefixSum size
  refine Finset.sum_congr rfl fun i _ => ?_
  rw [ite_eq_left_iff.mpr (fun h => absurd (by omega) h)]

theorem dominates_iff (a b : Fin 5 → ℕ) : Dominates a b ↔ DominatesFin a b := by
  constructor
  · rintro ⟨hs, hr⟩
    exact ⟨hs, fun r => hr r⟩
  · rintro ⟨hs, hr⟩
    refine ⟨hs, fun r => ?_⟩
    by_cases h5 : r < 6
    · exact hr ⟨r, h5⟩
    · rw [prefixSum_of_le a r (by omega), prefixSum_of_le b r (by omega), hs]

/-- The full source semiring at `σ = 1` in five variables: finite nonnegative real
combinations of products of normalized Schur polynomials `s_λ/s_λ(1⁵)` for partitions
with at most five parts and of normalized dominance differences. -/
inductive SchurSemiring : (Pt → ℝ) → Prop
  | schur (p : Fin 5 → ℕ) : Antitone p → SchurSemiring (nschur p)
  | difference (a b : Fin 5 → ℕ) : Antitone a → Antitone b → Dominates a b →
      SchurSemiring (fun x => nschur a x - nschur b x)
  | add {f g : Pt → ℝ} : SchurSemiring f → SchurSemiring g → SchurSemiring (fun x => f x + g x)
  | mul {f g : Pt → ℝ} : SchurSemiring f → SchurSemiring g → SchurSemiring (fun x => f x * g x)
  | scale (c : ℝ) {f : Pt → ℝ} : 0 ≤ c → SchurSemiring f → SchurSemiring (fun x => c * f x)

/-- Homogeneous elements of the semiring, graded by degree. -/
inductive HomSchur : ℕ → (Pt → ℝ) → Prop
  | zero (n : ℕ) : HomSchur n (fun _ => 0)
  | schur (p : Fin 5 → ℕ) : Antitone p → HomSchur (size p) (nschur p)
  | difference (a b : Fin 5 → ℕ) : Antitone a → Antitone b → Dominates a b →
      HomSchur (size a) (fun x => nschur a x - nschur b x)
  | add {n : ℕ} {f g : Pt → ℝ} : HomSchur n f → HomSchur n g → HomSchur n (fun x => f x + g x)
  | mul {n m : ℕ} {f g : Pt → ℝ} : HomSchur n f → HomSchur m g →
      HomSchur (n + m) (fun x => f x * g x)
  | scale {n : ℕ} (c : ℝ) {f : Pt → ℝ} : 0 ≤ c → HomSchur n f → HomSchur n (fun x => c * f x)

/-! ## Homogeneous decomposition -/

/-- A graded term: a degree and a function. -/
abbrev GTerm := ℕ × (Pt → ℝ)

def evalTerms (as : List GTerm) (t : ℝ) (x : Pt) : ℝ :=
  (as.map fun a => t ^ a.1 * a.2 x).sum

def termsMul (as bs : List GTerm) : List GTerm :=
  as.flatMap fun a => bs.map fun b => (a.1 + b.1, fun x => a.2 x * b.2 x)

theorem evalTerms_append (as bs : List GTerm) (t : ℝ) (x : Pt) :
    evalTerms (as ++ bs) t x = evalTerms as t x + evalTerms bs t x := by
  simp [evalTerms]

theorem evalTerms_termsMul (as bs : List GTerm) (t : ℝ) (x : Pt) :
    evalTerms (termsMul as bs) t x = evalTerms as t x * evalTerms bs t x := by
  induction as with
  | nil => simp [evalTerms, termsMul]
  | cons a as ih =>
    have hc : termsMul (a :: as) bs =
        bs.map (fun b => (a.1 + b.1, fun x => a.2 x * b.2 x)) ++ termsMul as bs := by
      simp [termsMul]
    rw [hc, evalTerms_append, ih]
    simp only [evalTerms, List.map_cons, List.sum_cons, List.map_map, add_mul]
    congr 1
    rw [← List.sum_map_mul_left]
    congr 1
    apply List.map_congr_left
    intro b _
    simp only [Function.comp_apply, pow_add]
    ring

theorem SchurSemiring.expand {f : Pt → ℝ} (hf : SchurSemiring f) :
    ∃ as : List GTerm, (∀ a ∈ as, HomSchur a.1 a.2) ∧
      ∀ (t : ℝ) (x : Pt), f (t • x) = evalTerms as t x := by
  induction hf with
  | schur p hp =>
    refine ⟨[(size p, nschur p)], by simpa using HomSchur.schur p hp, fun t x => ?_⟩
    simp [evalTerms, nschur_smul]
  | difference a b ha hb hab =>
    refine ⟨[(size a, fun x => nschur a x - nschur b x)],
      by simpa using HomSchur.difference a b ha hb hab, fun t x => ?_⟩
    simp only [evalTerms, List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero,
      nschur_smul, hab.1]
    ring
  | add _ _ ihf ihg =>
    obtain ⟨as, has, hfa⟩ := ihf
    obtain ⟨bs, hbs, hgb⟩ := ihg
    refine ⟨as ++ bs, fun a ha => ?_, fun t x => by rw [evalTerms_append, ← hfa, ← hgb]⟩
    rcases List.mem_append.mp ha with ha | ha
    · exact has a ha
    · exact hbs a ha
  | mul _ _ ihf ihg =>
    obtain ⟨as, has, hfa⟩ := ihf
    obtain ⟨bs, hbs, hgb⟩ := ihg
    refine ⟨termsMul as bs, fun c hc => ?_, fun t x => by rw [evalTerms_termsMul, ← hfa, ← hgb]⟩
    simp only [termsMul, List.mem_flatMap, List.mem_map] at hc
    obtain ⟨a, ha, b, hb, rfl⟩ := hc
    exact HomSchur.mul (has a ha) (hbs b hb)
  | scale c hc _ ih =>
    obtain ⟨as, has, hfa⟩ := ih
    refine ⟨as.map fun a => (a.1, fun x => c * a.2 x), fun a ha => ?_, fun t x => ?_⟩
    · simp only [List.mem_map] at ha
      obtain ⟨b, hb, rfl⟩ := ha
      exact HomSchur.scale c hc (has b hb)
    · beta_reduce
      rw [hfa]
      simp only [evalTerms, List.map_map]
      rw [← List.sum_map_mul_left]
      congr 1
      apply List.map_congr_left
      intro a _
      simp only [Function.comp_apply]
      ring

/-- The degree-`d` part of a list of graded terms. -/
def degreePart (d : ℕ) (as : List GTerm) (x : Pt) : ℝ :=
  (as.map fun a => if a.1 = d then a.2 x else 0).sum

theorem degreePart_hom (d : ℕ) (as : List GTerm) (has : ∀ a ∈ as, HomSchur a.1 a.2) :
    HomSchur d (degreePart d as) := by
  induction as with
  | nil =>
    have he : degreePart d [] = fun _ => 0 := by funext x; simp [degreePart]
    rw [he]
    exact HomSchur.zero d
  | cons a as ih =>
    have hrest := ih (fun b hb => has b (by simp [hb]))
    have he : degreePart d (a :: as) =
        fun x => (if a.1 = d then a.2 x else 0) + degreePart d as x := by
      funext x; simp [degreePart]
    rw [he]
    by_cases had : a.1 = d
    · have ha : HomSchur d a.2 := had ▸ has a (by simp)
      simpa only [had, ite_true] using HomSchur.add ha hrest
    · simpa only [had, ite_false] using HomSchur.add (HomSchur.zero d) hrest

open Polynomial in
/-- If a function homogeneous of degree `d` agrees with a graded expansion on every ray,
then it is the degree-`d` part of the expansion. -/
theorem eq_degreePart (d : ℕ) (as : List GTerm) (T : Pt → ℝ)
    (hT : ∀ (t : ℝ) (x : Pt), T (t • x) = t ^ d * T x)
    (heq : ∀ (t : ℝ) (x : Pt), T (t • x) = evalTerms as t x) (x : Pt) :
    T x = degreePart d as x := by
  let P : ℝ[X] := (as.map fun a : GTerm => C (a.2 x) * X ^ a.1).sum - C (T x) * X ^ d
  have hP : P = 0 := by
    apply Polynomial.funext
    intro t
    have hev : ∀ bs : List GTerm,
        ((bs.map fun a : GTerm => C (a.2 x) * X ^ a.1).sum).eval t = evalTerms bs t x := by
      intro bs
      induction bs with
      | nil => simp [evalTerms]
      | cons b bs ih =>
        simp only [List.map_cons, List.sum_cons, eval_add, ih, evalTerms, eval_mul, eval_C,
          eval_pow, eval_X]
        ring
    simp only [P, eval_sub, hev, eval_mul, eval_C, eval_pow, eval_X, eval_zero]
    rw [← heq, hT]
    ring
  have hc := congrArg (fun q : ℝ[X] => q.coeff d) hP
  simp only [P, coeff_sub, coeff_C_mul_X_pow, coeff_zero] at hc
  have hlist : ∀ bs : List GTerm,
      ((bs.map fun a : GTerm => C (a.2 x) * X ^ a.1).sum).coeff d = degreePart d bs x := by
    intro bs
    induction bs with
    | nil => simp [degreePart]
    | cons b bs ih =>
      simp only [List.map_cons, List.sum_cons, coeff_add, ih, coeff_C_mul_X_pow, degreePart]
      by_cases hb : b.1 = d
      · simp [hb]
      · simp [hb, Ne.symm hb]
  rw [hlist] at hc
  simp only [ite_true] at hc
  linarith

/-! ## Finite cones of value vectors at three points -/

/-- Rational vectors of values at the three evaluation points. -/
abbrev V3 := ℚ × ℚ × ℚ

def pt1 : Fin 5 → ℕ := ![1, 1, 1, 0, 0]
def pt2 : Fin 5 → ℕ := ![2, 1, 0, 0, 0]
def pt3 : Fin 5 → ℕ := ![1, 1, 1, 1, 0]

/-- The values of a function at the three evaluation points. -/
def val (f : Pt → ℝ) : ℝ × ℝ × ℝ := (f (natPt pt1), f (natPt pt2), f (natPt pt3))

def toR (u : V3) : ℝ × ℝ × ℝ := ((u.1 : ℝ), (u.2.1 : ℝ), (u.2.2 : ℝ))

theorem toR_mul (u w : V3) : toR (u * w) = toR u * toR w := by
  simp [toR]

/-- The nonnegative cone generated by a finite list of rational vectors. -/
inductive Cone (T : List V3) : ℝ × ℝ × ℝ → Prop
  | zero : Cone T 0
  | gen (u : V3) : u ∈ T → Cone T (toR u)
  | add {v w : ℝ × ℝ × ℝ} : Cone T v → Cone T w → Cone T (v + w)
  | scale (c : ℝ) {v : ℝ × ℝ × ℝ} : 0 ≤ c → Cone T v → Cone T (c • v)

theorem Cone.mul {A B C : List V3} (h : ∀ u ∈ A, ∀ w ∈ B, u * w ∈ C)
    {v w : ℝ × ℝ × ℝ} (hv : Cone A v) (hw : Cone B w) : Cone C (v * w) := by
  induction hv with
  | zero => simpa using (Cone.zero : Cone C 0)
  | gen u hu =>
    induction hw with
    | zero => simpa using (Cone.zero : Cone C 0)
    | gen w hw' => rw [← toR_mul]; exact Cone.gen _ (h u hu w hw')
    | add _ _ ih1 ih2 => rw [mul_add]; exact Cone.add ih1 ih2
    | scale c hc _ ih => rw [mul_smul_comm]; exact Cone.scale c hc ih
  | add _ _ ih1 ih2 => rw [add_mul]; exact Cone.add ih1 ih2
  | scale c hc _ ih => rw [smul_mul_assoc]; exact Cone.scale c hc ih

/-- The separating functional `-45 f(pt1) + 10 f(pt2) + 18 f(pt3)`. -/
def sepQ (u : V3) : ℚ := -45 * u.1 + 10 * u.2.1 + 18 * u.2.2

def sepR (v : ℝ × ℝ × ℝ) : ℝ := -45 * v.1 + 10 * v.2.1 + 18 * v.2.2

theorem Cone.sep_nonneg {T : List V3} (hT : ∀ u ∈ T, 0 ≤ sepQ u) {v : ℝ × ℝ × ℝ}
    (hv : Cone T v) : 0 ≤ sepR v := by
  induction hv with
  | zero => simp [sepR]
  | gen u hu =>
    have := hT u hu
    have hc : sepR (toR u) = ((sepQ u : ℚ) : ℝ) := by simp [sepR, sepQ, toR]
    rw [hc]
    exact_mod_cast this
  | add _ _ ih1 ih2 =>
    simp only [sepR, Prod.fst_add, Prod.snd_add] at ih1 ih2 ⊢
    linarith
  | scale c hc _ ih =>
    simp only [sepR, Prod.smul_fst, Prod.smul_snd, smul_eq_mul] at ih ⊢
    nlinarith

end

end ChenKhareSahi.Jack
