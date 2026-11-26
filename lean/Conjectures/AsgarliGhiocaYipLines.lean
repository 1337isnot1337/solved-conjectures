import Mathlib.Algebra.Polynomial.Homogenize
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith

/-! # From root-free parameters to distinct missing projective lines -/

namespace Conjectures.AsgarliGhiocaYip

open Finset Polynomial
open scoped Classical

variable {K : Type*} [Field K] {ι : Type*}

/-- Value of the homogenized graph polynomial of degree `d` in its two coordinates. -/
noncomputable def homogeneousValue (g : K[X]) (d : ℕ) (x z : K) : K :=
  MvPolynomial.eval ![x, z] (g.homogenize d)

private theorem at_infinity (g : K[X]) (d : ℕ) (x : K) :
    homogeneousValue g d x 0 = g.coeff d * x ^ d := by
  simp only [homogeneousValue, homogenize, MvPolynomial.eval_sum]
  rw [sum_eq_single (d, 0)]
  · simp [MvPolynomial.eval_monomial, Finsupp.prod_fintype, Fin.prod_univ_two]
  · rintro ⟨i,j⟩ hij hne
    have he := mem_antidiagonal.mp hij
    have hj : j ≠ 0 := by intro hz; apply hne; subst j; simpa using he
    simp [MvPolynomial.eval_monomial, Finsupp.prod_fintype, Fin.prod_univ_two, hj]
  · simp

/-- Nonzero parameters at which all the normalized graph–line polynomials have no
rational zero. Multiplication by the common leading coefficient does not affect roots. -/
noncomputable def goodScales [Fintype K] (g : ι → K[X]) (d : ℕ) (u a : K) : Finset K :=
  univ.filter fun t ↦ t ≠ 0 ∧ ∀ i y, homogeneousValue (g i) d y t + u * y - a ≠ 0

theorem mem_goodScales [Fintype K] {g : ι → K[X]} {d : ℕ} {u a t : K} :
    t ∈ goodScales g d u a ↔ t ≠ 0 ∧ ∀ i y, homogeneousValue (g i) d y t + u * y - a ≠ 0 := by
  simp only [goodScales, mem_filter, mem_univ, true_and]

/-- Each pair `(m,b)` represents the distinct rational line `Y = mX + bZ`. -/
noncomputable def missingLines [Fintype K] (g : ι → K[X]) (d : ℕ) : Finset (K × K) :=
  univ.filter fun l ↦ ∀ i (x y z : K), (x ≠ 0 ∨ y ≠ 0 ∨ z ≠ 0) → y = l.1 * x + l.2 * z →
    y * z ^ (d - 1) ≠ homogeneousValue (g i) d x z

theorem mem_missingLines [Fintype K] {g : ι → K[X]} {d : ℕ} {l : K × K} :
    l ∈ missingLines g d ↔ ∀ i (x y z : K), (x ≠ 0 ∨ y ≠ 0 ∨ z ≠ 0) → y = l.1 * x + l.2 * z →
      y * z ^ (d - 1) ≠ homogeneousValue (g i) d x z := by
  simp only [missingLines, mem_filter, mem_univ, true_and]

theorem mem_missingLines_iff [Fintype K] {g : ι → K[X]} {d : ℕ} (hd : 2 ≤ d)
    (hg : ∀ i, (g i).natDegree = d) (m b : K) :
    (m,b) ∈ missingLines g d ↔ ∀ i x, (g i).eval x ≠ m * x + b := by
  constructor
  · intro h i x he
    apply (mem_filter.mp h).2 i x (m*x+b) 1 (by simp) (by simp)
    simpa [homogeneousValue, eval_homogenize (hg i).le] using he.symm
  intro h
  refine mem_filter.mpr ⟨mem_univ _, ?_⟩
  intro i x y z hn hline hgraph
  change y = m * x + b * z at hline
  have hg0 : g i ≠ 0 := fun h ↦ by have := hg i; simp [h] at this; omega
  by_cases hz : z = 0
  · subst z
    rw [at_infinity, show (g i).coeff d = (g i).leadingCoeff by rw [← hg i, coeff_natDegree]] at hgraph
    simp only [zero_pow (by omega : d - 1 ≠ 0), mul_zero] at hgraph
    have hx : x = 0 := by
      rcases mul_eq_zero.mp hgraph.symm with h | h
      · exact (leadingCoeff_ne_zero.mpr hg0 h).elim
      · exact eq_zero_of_pow_eq_zero h
    have hy : y = 0 := by simpa only [hx, mul_zero, add_zero] using hline
    simp only [hx, hy, ne_self_iff_false, or_self] at hn
  · have hzd : z ^ d = z ^ (d - 1) * z := by rw [← pow_succ, show d - 1 + 1 = d by omega]
    have evalh (X Z : K) (hZ : Z ≠ 0) : homogeneousValue (g i) d X Z =
        (g i).eval (X / Z) * Z ^ d := eval_homogenize (hg i).le _ hZ
    rw [evalh _ _ hz, hzd] at hgraph
    have hy : y = (g i).eval (x / z) * z := by
      apply mul_right_cancel₀ (pow_ne_zero (d - 1) hz); linear_combination hgraph
    apply h i (x / z)
    rw [← (div_eq_iff hz).mpr hy, hline]
    field_simp

private def line (d : ℕ) (u : K) (at' : K × K) : K × K :=
  (-u / at'.2 ^ (d - 1), at'.1 / at'.2 ^ d)

private theorem line_misses [Fintype K] {g : ι → K[X]} {d : ℕ} (hd : 2 ≤ d)
    (hg : ∀ i, (g i).natDegree = d) {a t u : K} (ht : t ∈ goodScales g d u a) :
    line d u (a,t) ∈ missingLines g d := by
  obtain ⟨ht0, hfree⟩ := (mem_filter.mp ht).2
  apply (mem_missingLines_iff hd hg _ _).mpr
  intro i x hx
  apply hfree i (t*x)
  have htd : t ^ d = t ^ (d - 1) * t := by rw [← pow_succ, show d - 1 + 1 = d by omega]
  simp only [homogeneousValue, eval_homogenize (hg i).le _ (by simpa : ![t*x,t] 1 ≠ 0),
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_fin_one, mul_div_cancel_left₀ _ ht0,
    hx, htd]
  field_simp; ring

private theorem fiber_le {d : ℕ} (hd : 2 ≤ d) {u : K} (hu : u ≠ 0) (P : Finset (K × K))
    (hP : ∀ p ∈ P, p.2 ≠ 0) (l : K × K) :
    (P.filter fun p ↦ line d u p = l).card ≤ d - 1 := by
  classical
  let R := nthRootsFinset (d - 1) (-u / l.1)
  have fiber (p : K × K) (hp : p ∈ P.filter fun w ↦ line d u w = l) :
      p.2 ∈ R ∧ p.1 = l.2 * p.2 ^ d := by
    obtain ⟨hmem, he⟩ := mem_filter.mp hp
    have ht := hP p hmem
    have hm : -u / p.2 ^ (d - 1) = l.1 := congrArg Prod.fst he
    have hb : p.1 / p.2 ^ d = l.2 := congrArg Prod.snd he
    have hl : l.1 ≠ 0 := hm ▸ div_ne_zero (neg_ne_zero.mpr hu) (pow_ne_zero _ ht)
    refine ⟨(mem_nthRootsFinset (by omega) _).mpr ((eq_div_iff hl).mpr ?_),
      (div_eq_iff (pow_ne_zero _ ht)).mp hb⟩
    simpa [mul_comm] using ((div_eq_iff (pow_ne_zero _ ht)).mp hm).symm
  calc
    _ ≤ R.card := by
      apply card_le_card_of_injOn Prod.snd (fun p hp ↦ (fiber p hp).1)
      intro p hp w hw he
      exact Prod.ext (by rw [(fiber p hp).2, (fiber w hw).2, he]) he
    _ ≤ _ := by rw [show R = _ from nthRootsFinset_def ..]; exact
                  (Multiset.toFinset_card_le _).trans (card_nthRoots ..)

/-- A lower bound for each seed's number of good scales gives the claimed line count.
All cardinalities use cleared denominators; `D` is the geometric degree bound. -/
theorem missing_lines_of_good_scales [Fintype K] (g : ι → K[X]) {d D : ℕ} (hd : 2 ≤ d)
    (hg : ∀ i, (g i).natDegree = d) {u : K} (hu : u ≠ 0) (A : Finset K)
    (ha : Fintype.card K ≤ 4 * d * A.card)
    (ht : ∀ a ∈ A, Fintype.card K ≤ 2 * D * (goodScales g d u a).card) :
    Fintype.card K ^ 2 ≤ 8 * d * (d - 1) * D * (missingLines g d).card := by
  classical
  let P := (A ×ˢ (univ : Finset K)).filter fun p ↦ p.2 ∈ goodScales g d u p.1
  have hP (p : K × K) (hp : p ∈ P) : p.1 ∈ A ∧ p.2 ∈ goodScales g d u p.1 := by
    simpa [P] using hp
  have hcount := card_le_mul_card_image_of_maps_to (s := P) (t := missingLines g d)
    (f := line d u) (fun p hp ↦ line_misses hd hg (hP p hp).2) (d - 1)
    (fun l _ ↦ fiber_le hd hu P (fun p hp ↦ (mem_filter.mp (hP p hp).2).2.1) l)
  have hsize : P.card = ∑ a ∈ A, (goodScales g d u a).card := by
    rw [card_eq_sum_card_fiberwise (s := P) (f := Prod.fst) (t := A) (fun p hp ↦ (hP p hp).1)]
    apply sum_congr rfl; intro a hA
    have eq : (P.filter fun p ↦ p.1 = a) = {a} ×ˢ goodScales g d u a := by
      ext ⟨x,t⟩; simp [P]; aesop
    simp [eq]
  have hsum := sum_le_sum ht
  simp only [sum_const, nsmul_eq_mul, ← mul_sum, ← hsize] at hsum
  calc
    _ ≤ (4 * d) * (A.card * Fintype.card K) := by
      rw [sq, ← mul_assoc]; exact Nat.mul_le_mul_right _ ha
    _ ≤ 4 * d * (2 * D * P.card) := Nat.mul_le_mul_left _ hsum
    _ ≤ 4 * d * (2 * D * ((d - 1) * (missingLines g d).card)) := by gcongr
    _ = _ := by ring

end Conjectures.AsgarliGhiocaYip
