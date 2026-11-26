import Conjectures.AsgarliGhiocaYipSeed
import Conjectures.AsgarliGhiocaYipRootLabels

/-! # Counting regular points of the twisted ordered-root cover

Over a fixed field element `t`, a rational ordering is a bijection from the labels at
zero to the roots at `t`, commuting with Frobenius, for each graph. Only nonzero `t`
are counted. The bijections automatically exclude fibers with fewer distinct roots.
-/

namespace Conjectures.AsgarliGhiocaYip

open Polynomial Finset
open scoped Classical

variable {K : Type*} [Field K]

/-- The intersection polynomial in `Y`, before division by the leading coefficient. -/
noncomputable def intersectionPolynomial (g : K[X]) (d : ℕ) (u a t : K) : K[X] :=
  (∑ j ∈ range (d + 1), C (g.coeff j * t ^ (d - j)) * X ^ j) + C u * X - C a

theorem intersection_at_zero (g : K[X]) {d : ℕ} (hg : g.natDegree = d) (u a : K) :
    intersectionPolynomial g d u a 0 = seed g.leadingCoeff u d - C a := by
  unfold intersectionPolynomial seed; rw [sum_eq_single d]
  · simp [← hg]
  · intro j hj hjd; simp [zero_pow (by have := mem_range.mp hj; omega : d - j ≠ 0)]
  · simp

private theorem eval_intersection (g : K[X]) (d : ℕ) (u a t y : K) :
    (intersectionPolynomial g d u a t).eval y = homogeneousValue g d y t + u*y - a := by
  simp only [intersectionPolynomial, homogeneousValue, homogenize, eval_sub, eval_add,
    eval_finsetSum, eval_mul, eval_pow, eval_X, eval_C, MvPolynomial.eval_sum,
    Nat.sum_antidiagonal_eq_sum_range_succ_mk, MvPolynomial.eval_monomial]
  simp [mul_comm, mul_assoc]

private theorem intersection_degree_le (g : K[X]) {d : ℕ} (hd : 2 ≤ d) (u a t : K) :
    (intersectionPolynomial g d u a t).natDegree ≤ d := by
  rw [intersectionPolynomial, natDegree_sub_C]
  apply (natDegree_add_le ..).trans; apply max_le
  · apply natDegree_sum_le_of_forall_le; intro j hj
    exact (natDegree_C_mul_le _ _).trans ((natDegree_X_pow j).le.trans (by have := mem_range.mp hj; omega))
  · exact (natDegree_C_mul_le _ _).trans ((natDegree_X_le).trans (by omega))

variable [Fintype K]

private abbrev Roots (p : K[X]) := p.rootSet (AlgebraicClosure K)

/-- A rational ordering over one parameter, expressed without choosing extension bases. -/
abbrev Ordering {k : ℕ} (g : Fin k → K[X]) (d : ℕ) (p : K[X]) (u a t : K) :=
  {r : ∀ i, Roots p ≃ Roots (intersectionPolynomial (g i) d u a t) //
    ∀ i x, r i (rootPermutation p x) = rootPermutation _ (r i x)}

/-- Number of simultaneous rational root orderings over all nonzero scales. -/
noncomputable def orderedPointCount {k : ℕ} (g : Fin k → K[X]) (d : ℕ) (p : K[X]) (u a : K) : ℕ :=
  ∑ t ∈ univ.erase 0, Nat.card (Ordering g d p u a t)

/-- The common leading coefficient supplies a rational ordering at zero, although the
definition of `orderedPointCount` deliberately excludes that fiber. -/
theorem seed_ordering_at_zero {k d : ℕ} (g : Fin k → K[X]) (c u a : K)
    (hg : ∀ i, (g i).natDegree = d ∧ (g i).leadingCoeff = c) :
    0 < Nat.card (Ordering g d (seed c u d - C a) u a 0) := by
  classical
  have he (i : Fin k) : intersectionPolynomial (g i) d u a 0 = seed c u d - C a := by
    rw [intersection_at_zero _ (hg i).1, (hg i).2]
  let e (i : Fin k) : Roots (seed c u d - C a) ≃ Roots (intersectionPolynomial (g i) d u a 0) :=
    Equiv.cast (congrArg (fun p : K[X] ↦ ↥(Roots p)) (he i).symm)
  apply Nat.card_pos_iff.mpr
  refine ⟨⟨⟨e, ?_⟩⟩, inferInstance⟩
  intro i x
  -- Both sides of the transport have the same geometric root.
  apply Subtype.ext
  have cast_val {p q : K[X]} (h : p = q) (y : Roots p) :
      (Equiv.cast (congrArg (fun p : K[X] ↦ ↥(Roots p)) h) y).val = y.val := by cases h; rfl
  exact (cast_val (he i).symm _).trans (congrArg (· ^ Fintype.card K) (cast_val (he i).symm x).symm)

private theorem scale_of_ordering {k d : ℕ} {g : Fin k → K[X]} {p : K[X]} {u a t : K}
    (hL : Nonempty (Roots p)) (hp : ∀ x : K, p.eval x ≠ 0) (ht : t ≠ 0) (r : Ordering g d p u a t) :
    t ∈ goodScales g d u a := by
  refine mem_goodScales.mpr ⟨ht, ?_⟩
  intro i y hy
  let f := intersectionPolynomial (g i) d u a t
  have hf : f.IsRoot y := (eval_intersection ..).trans hy
  by_cases hzero : f = 0
  · obtain ⟨x⟩ := hL
    have hmem : ((r.val i x).val) ∈ f.rootSet (AlgebraicClosure K) := (r.val i x).property
    exact (mem_rootSet.mp hmem).1 hzero
  let l : Roots f := ⟨algebraMap K _ y, mem_rootSet.mpr ⟨hzero, by
    rw [← eval_map_algebraMap, eval_map_apply, hf.eq_zero, map_zero]⟩⟩
  let x := (r.val i).symm l
  apply rootPermutation_no_fixed_point p hp x ((r.val i).injective ?_)
  rw [r.property, (r.val i).apply_symm_apply]
  apply Subtype.ext
  change (algebraMap K (AlgebraicClosure K) y) ^ Fintype.card K = _
  rw [← map_pow, FiniteField.pow_card]

private theorem ordering_card_le {k d : ℕ} (g : Fin k → K[X]) (hd : 2 ≤ d) {p : K[X]}
    (hp : Fintype.card (Roots p) = d) (u a t : K) :
    Nat.card (Ordering g d p u a t) ≤ d ^ (d * k) := by
  classical
  let f i := intersectionPolynomial (g i) d u a t
  have h (i : Fin k) : Fintype.card (Roots (f i)) ≤ d := by
    calc
      _ = ((f i).rootSet (AlgebraicClosure K)).ncard := by rw [Set.ncard_eq_toFinset_card', Set.toFinset_card]
      _ ≤ (f i).natDegree := (f i).ncard_rootSet_le _
      _ ≤ d := intersection_degree_le _ hd ..
  let incl (r : Ordering g d p u a t) : ∀ i, Roots p → Roots (f i) := fun i ↦ r.val i
  have hinj : Function.Injective incl := by
    intro r s he; apply Subtype.ext; funext i; apply Equiv.ext; exact congrFun (congrFun he i)
  rw [Nat.card_eq_fintype_card]
  calc
    _ ≤ _ := Fintype.card_le_of_injective incl hinj
    _ = ∏ i, Fintype.card (Roots (f i)) ^ d := by simp [Fintype.card_pi, hp]
    _ ≤ ∏ _ : Fin k, d ^ d := by gcongr with i; exact h i
    _ = _ := by simp [pow_mul]

/-- The line-count conclusion reduced to a point count on the explicit finite root data.
The geometric lower estimate for `orderedPointCount` is a hypothesis here. -/
theorem missing_lines_of_ordered_point_count {k d : ℕ} (g : Fin k → K[X]) (hd : 2 ≤ d)
    (hg : ∀ i, (g i).natDegree = d) {c : K} (hc : c ≠ 0) (hlarge : 4 * d^2 ≤ Fintype.card K)
    (hpoints : ∀ u : K, u ≠ 0 → ∀ a : K, let p := seed c u d - C a
      p.Separable → (∀ x : K, p.eval x ≠ 0) → Fintype.card K ≤ 2 * orderedPointCount g d p u a) :
    Fintype.card K ^ 2 ≤ 8 * d * (d - 1) * d ^ (d * k) * (missingLines g d).card := by
  obtain ⟨u, hu, A, hA, hseed⟩ := exists_regular_seeds hd hc hlarge
  apply missing_lines_of_good_scales g hd hg hu A hA
  intro a ha
  let p := seed c u d - C a
  obtain ⟨hsep, hfree⟩ := hseed a ha
  have hp : Fintype.card (Roots p) = d := by
    rw [card_rootSet_eq_natDegree (K := AlgebraicClosure K) hsep (IsAlgClosed.splits _), natDegree_sub_C]
    exact seed_degree hc u hd
  calc
    _ ≤ 2 * orderedPointCount g d p u a := hpoints u hu a hsep hfree
    _ ≤ 2 * ((goodScales g d u a).card * d ^ (d*k)) := by
      gcongr 1
      calc
        _ ≤ ∑ t ∈ univ.erase 0, (if t ∈ goodScales g d u a then d ^ (d*k) else 0) := by
          apply sum_le_sum; intro t ht
          split_ifs with h
          · exact ordering_card_le g hd hp u a t
          · have hL : Nonempty (Roots p) := Fintype.card_pos_iff.mp (by omega)
            have : IsEmpty (Ordering g d p u a t) := ⟨fun r ↦ h (scale_of_ordering hL hfree (ne_of_mem_erase ht) r)⟩
            simp
        _ ≤ ∑ t : K, (if t ∈ goodScales g d u a then d ^ (d*k) else 0) := by
          apply sum_le_sum_of_subset (subset_univ _)
        _ = _ := by simp
    _ = _ := by ring

end Conjectures.AsgarliGhiocaYip
