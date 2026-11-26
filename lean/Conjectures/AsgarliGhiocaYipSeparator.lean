import Mathlib.Data.Fintype.Perm
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.LinearAlgebra.Vandermonde

/-! # A separator for simultaneous root orderings

One ground-field scalar suffices to separate all the orderings at the seed.
The coefficients of the collision polynomial are the Vandermonde moments of
the differences of the two orderings.
-/

namespace Conjectures.AsgarliGhiocaYip

open Finset Polynomial

variable {K E : Type*} [Field K] [Field E] [Algebra K E]
variable {k d : ℕ}

/-- A family with one permutation of the `d` root labels per polynomial. -/
abbrev LabelPermutations (k d : ℕ) := Fin k → Equiv.Perm (Fin d)

/-- The parameter-dependent linear function on an array of geometric roots. -/
noncomputable def separatorPolynomial (r : Fin d → E) (v : Fin k → Fin d → E) : E[X] :=
  ∑ e : Fin (k * d),
    let (i, h) := (finProdFinEquiv (m := k) (n := d)).symm e
    monomial e.val (∑ j, v i j * r j ^ h.val)

/-- Evaluate the separator using a scalar in the ground field. -/
noncomputable def separatorValue (r : Fin d → E) (s : K) (v : Fin k → Fin d → E) : E :=
  (separatorPolynomial r v).eval (algebraMap K E s)

private theorem coeff_separatorPolynomial (r : Fin d → E) (v : Fin k → Fin d → E)
    (e : Fin (k * d)) :
    (separatorPolynomial r v).coeff e.val =
      ∑ j, v (finProdFinEquiv.symm e).1 j * r j ^ (finProdFinEquiv.symm e).2.val := by
  rw [separatorPolynomial, finsetSum_coeff, sum_eq_single e]
  · exact coeff_monomial_same ..
  · intro l _ hl
    exact coeff_monomial_of_ne _ (fun h ↦ hl (Fin.ext h.symm))
  · simp

theorem separatorPolynomial_injective {r : Fin d → E} (hr : Function.Injective r) :
    Function.Injective (separatorPolynomial (k := k) r) := by
  intro v w h
  funext i j
  have hm (l : Fin d) : (∑ j', (v i j' - w i j') * r j' ^ l.val) = 0 := by
    have hc := congrArg (fun p : E[X] ↦ p.coeff (finProdFinEquiv (i, l)).val) h
    simp only [coeff_separatorPolynomial, Equiv.symm_apply_apply] at hc
    simpa only [sub_mul, sum_sub_distrib, sub_eq_zero] using hc
  have hz := congrFun (Matrix.eq_zero_of_forall_pow_sum_mul_pow_eq_zero hr hm) j
  exact sub_eq_zero.mp hz

private theorem natDegree_separatorPolynomial (r : Fin d → E) (v : Fin k → Fin d → E) :
    (separatorPolynomial r v).natDegree ≤ k * d - 1 := by
  unfold separatorPolynomial
  apply natDegree_sum_le_of_forall_le
  intro e _
  exact (natDegree_monomial_le _).trans (Nat.le_sub_one_of_lt e.isLt)

private theorem card_eval_zero_le [Fintype K] [DecidableEq K] [DecidableEq E]
    {p : E[X]} (hp : p ≠ 0) :
    (univ.filter fun s : K ↦ p.eval (algebraMap K E s) = 0).card ≤ p.natDegree := by
  classical
  apply (card_le_card_of_injOn (algebraMap K E) (t := p.roots.toFinset) ?_ ?_).trans
    ((Multiset.toFinset_card_le _).trans (card_roots' p))
  · intro s hs
    exact Multiset.mem_toFinset.mpr ((mem_roots hp).mpr (mem_filter.mp hs).2)
  · exact (algebraMap K E).injective.injOn

/-- A degree-bounded family of distinct polynomials admits one simultaneous
injective evaluation at a base-field element. -/
theorem exists_injective_evaluation [Fintype K] {ι : Type*} [Fintype ι] {f : ι → E[X]}
    (hf : Function.Injective f) {b : ℕ} (hdeg : ∀ i, (f i).natDegree ≤ b)
    (hq : (Fintype.card ι)^2 * b < Fintype.card K) :
    ∃ s : K, Function.Injective (fun i ↦ (f i).eval (algebraMap K E s)) := by
  classical
  let pairs := (univ : Finset (ι × ι)).filter fun p ↦ p.1 ≠ p.2
  let collision (p : ι × ι) := (univ : Finset K).filter fun s ↦
    (f p.1 - f p.2).eval (algebraMap K E s) = 0
  let bad := pairs.biUnion collision
  have hpairs : pairs.card ≤ (Fintype.card ι)^2 := by
    simpa [pow_two] using card_le_card (filter_subset _ (univ : Finset (ι × ι)))
  have hbad : bad.card < Fintype.card K := by
    apply lt_of_le_of_lt ?_ hq
    apply (card_biUnion_le_card_mul _ _ _ ?_).trans (Nat.mul_le_mul_right _ hpairs)
    intro p hp
    refine (card_eval_zero_le (K := K) (p := f p.1 - f p.2) (sub_ne_zero.mpr ?_)).trans ?_
    · exact fun h ↦ (mem_filter.mp hp).2 (hf h)
    · exact (natDegree_sub_le ..).trans (max_le (hdeg _) (hdeg _))
  obtain ⟨s, hs⟩ : ∃ s : K, s ∉ bad := by
    by_contra! h
    simp [eq_univ_of_forall h] at hbad
  refine ⟨s, fun i j h ↦ ?_⟩
  by_contra hij
  refine hs (mem_biUnion.mpr ⟨(i, j), mem_filter.mpr ⟨mem_univ _, hij⟩, ?_⟩)
  apply mem_filter.mpr
  exact ⟨mem_univ _, by simpa only [eval_sub] using sub_eq_zero.mpr h⟩

/-- A point at which no pair of distinct arrays has colliding values. It is enough
to count the ordered pairs, rather than reducing the count by symmetry. -/
theorem exists_separator [Fintype K] {ι : Type*} [Fintype ι] {r : Fin d → E}
    (hr : Function.Injective r) {v : ι → Fin k → Fin d → E} (hv : Function.Injective v)
    (hq : (Fintype.card ι)^2 * (k * d - 1) < Fintype.card K) :
    ∃ s : K, Function.Injective (fun i ↦ separatorValue r s (v i)) :=
  exists_injective_evaluation ((separatorPolynomial_injective hr).comp hv)
    (fun i ↦ natDegree_separatorPolynomial r (v i)) hq

theorem card_labelPermutations : Fintype.card (LabelPermutations k d) = d.factorial ^ k := by
  simp [LabelPermutations, Fintype.card_perm]

omit [Field K] in
theorem label_collision_budget [Fintype K] (hd : 2 ≤ d) (hk : 0 < k)
    (hq : (d ^ (d * k)) ^ 8 ≤ Fintype.card K) :
    (Fintype.card (LabelPermutations k d))^2 * (k * d - 1) < Fintype.card K := by
  let D := d ^ (d * k)
  have hN : Fintype.card (LabelPermutations k d) ≤ D := by
    let f (p : LabelPermutations k d) (i : Fin k) (j : Fin d) : Fin d := p i j
    have hf : Function.Injective f := by
      intro p p' h
      funext i
      apply Equiv.ext; intro j
      exact congrFun (congrFun h i) j
    simpa [D, Fintype.card_pi, pow_mul] using Fintype.card_le_of_injective f hf
  have hD : 1 < D := one_lt_pow₀ (by omega) (by positivity)
  have hgrow (n : ℕ) : n + 1 ≤ 2 ^ n := by
    induction n with
    | zero => decide
    | succ n ih => rw [pow_succ]; omega
  have hkd : k * d - 1 ≤ D := by
    rw [mul_comm k d]
    exact (by omega : d * k - 1 ≤ d * k + 1).trans
      ((hgrow _).trans (Nat.pow_le_pow_left hd _))
  calc
    _ ≤ D^2 * D := Nat.mul_le_mul (Nat.pow_le_pow_left hN _) hkd
    _ = D^3 := (pow_succ _ _).symm
    _ < D^8 := Nat.pow_lt_pow_right hD (by decide)
    _ ≤ _ := hq

/-- Step 1 of the reduction: when every polynomial has the same `d` distinct seed
roots, one scalar from `K` separates all the simultaneous label permutations. -/
theorem exists_seed_separator [Fintype K] (hd : 2 ≤ d) (hk : 0 < k)
    (hq : (d ^ (d * k)) ^ 8 ≤ Fintype.card K) {r : Fin d → E} (hr : Function.Injective r) :
    ∃ s : K, Function.Injective
      (fun p : LabelPermutations k d ↦ separatorValue r s (fun i j ↦ r (p i j))) := by
  apply exists_separator hr
  · intro p p' h
    funext i
    apply Equiv.ext; intro j
    exact hr (congrFun (congrFun h i) j)
  · exact label_collision_budget hd hk hq

end Conjectures.AsgarliGhiocaYip
