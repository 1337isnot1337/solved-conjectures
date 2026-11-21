import Conjectures.BernardiMoralesPolynomial
import Conjectures.BernardiMoralesEvents

set_option linter.unusedSimpArgs false

namespace BernardiMorales

open scoped Classical
open Finset Matrix MvPolynomial

variable {V R : Type*} [Fintype V] [DecidableEq V] [CommRing R]

/-- Boolean membership functions are exactly the actual subsets of the
finite vertex set. This equivalence fixes the subset representation used in
all tuple counts below. -/
def subsetEncodingEquiv : (V → Bool) ≃ Finset V where
  toFun s := Finset.univ.filter (fun i => s i = true)
  invFun S := fun i => decide (i ∈ S)
  left_inv s := by
    funext i
    cases h : s i <;> simp [h]
  right_inv S := by
    ext i
    simp

def isProperSubset (s : V → Bool) : Prop := s ≠ fun _ => true

def isMarkedSubset (root : V) (D : Finset V) (s : V → Bool) : Prop :=
  s root = false ∧ ∀ i ∈ D, s i = true

def isTargetTuple (root : V) (D : Finset V) {r : ℕ}
    (s : Fin (r+1) → V → Bool) : Prop :=
  ∀ c, if c = 0 then isMarkedSubset root D (s c) else isProperSubset (s c)

noncomputable def subsetMembership (s : V → Bool) : V →₀ ℕ :=
  ∑ i, if s i then Finsupp.single i 1 else 0

noncomputable def tupleMembership {r : ℕ} (s : Fin r → V → Bool) : V →₀ ℕ :=
  ∑ c, subsetMembership (s c)

omit [DecidableEq V] in
@[simp] theorem subsetMembership_apply (s : V → Bool) (i : V) :
    subsetMembership s i = if s i then 1 else 0 := by
  simp only [subsetMembership, Finsupp.finsetSum_apply, ite_apply]
  rw [Finset.sum_eq_single i]
  · cases h : s i <;> simp [h]
  · intro j _ hji
    cases h : s j <;> simp [h, Finsupp.single_apply, hji, Ne.symm hji]
  · simp

omit [DecidableEq V] in
/-- This exponent is the literal number of subsets containing each vertex. -/
theorem tupleMembership_apply {r : ℕ} (s : Fin r → V → Bool) (i : V) :
    tupleMembership s i = ∑ c, if s c i then 1 else 0 := by
  simp [tupleMembership, Finsupp.sum_apply]

omit [DecidableEq V] in
theorem subsetWeight_monomial (s : V → Bool) :
    subsetWeight (MvPolynomial.X : V → MvPolynomial V R) s =
      MvPolynomial.monomial (subsetMembership s) 1 := by
  rw [subsetMembership, MvPolynomial.monomial_sum_one]
  unfold subsetWeight
  apply Finset.prod_congr rfl
  intro i _
  cases hs : s i <;> simp [subsetWeight, hs, MvPolynomial.X]

omit [DecidableEq V] in
theorem tupleWeight_monomial {r : ℕ} (s : Fin r → V → Bool) :
    (∏ c, subsetWeight (MvPolynomial.X : V → MvPolynomial V R) (s c)) =
      MvPolynomial.monomial (tupleMembership s) 1 := by
  simp_rw [subsetWeight_monomial]
  exact (MvPolynomial.monomial_sum_one Finset.univ _).symm

theorem sum_properSubsetWeight (x : V → R) :
    (∑ s : V → Bool, if isProperSubset s then subsetWeight x s else 0) =
      properSubsetsWeight x := by
  classical
  have hall : (∑ s : V → Bool, subsetWeight x s) = allSubsetsWeight x := by
    unfold subsetWeight allSubsetsWeight
    rw [sum_prod_choices (fun i b => if b then x i else 1)]
    simp [add_comm]
  have he : (∑ s : V → Bool, if isProperSubset s then subsetWeight x s else 0) =
      ∑ s ∈ Finset.univ.erase (fun _ : V => true), subsetWeight x s := by
    rw [← Finset.filter_ne']
    simp only [isProperSubset, Finset.sum_filter]
    apply Finset.sum_congr rfl
    intro s _
    by_cases hs : s = (fun _ => true) <;> simp [hs]
  rw [he]
  unfold properSubsetsWeight
  apply eq_sub_iff_add_eq.mpr
  simpa [properSubsetsWeight, subsetWeight] using
    (Finset.sum_erase_add Finset.univ (subsetWeight x)
      (Finset.mem_univ (fun _ : V => true))).trans hall

theorem sum_markedSubsetWeight (root : V) (D : Finset V) (hD : root ∉ D) (x : V → R) :
    (∑ s : V → Bool, if isMarkedSubset root D s then subsetWeight x s else 0) =
      markedSubsetWeight root D x := by
  classical
  let allowed : V → Bool → Prop := fun i b => if i = root then b = false
    else if i ∈ D then b = true else True
  have ha (s : V → Bool) : (∀ i, allowed i (s i)) ↔ isMarkedSubset root D s := by
    constructor
    · intro h
      refine ⟨by simpa [allowed] using h root, ?_⟩
      intro i hi
      have hir : i ≠ root := by intro he; exact hD (he ▸ hi)
      simpa [allowed, hir, hi] using h i
    · rintro ⟨hr, hm⟩ i
      by_cases hir : i = root
      · subst i; simp [allowed, hr]
      · by_cases hi : i ∈ D <;> simp [allowed, hir, hi, hm]
  calc
    (∑ s : V → Bool, if isMarkedSubset root D s then subsetWeight x s else 0) =
        ∑ s : V → Bool, ∏ i, if allowed i (s i) then (if s i then x i else 1) else 0 := by
      apply Finset.sum_congr rfl
      intro s _
      rw [Fintype.prod_ite_zero]
      by_cases hm : isMarkedSubset root D s
      · have hs := (ha s).mpr hm
        simp only [ite_eq_left hm, ite_eq_left hs]
        rfl
      · have hs := mt (ha s).mp hm
        simp only [ite_eq_right hm, ite_eq_right hs]
    _ = ∏ i, ∑ b : Bool, if allowed i b then (if b then x i else 1) else 0 :=
      sum_prod_choices (fun (i : V) (b : Bool) =>
        if allowed i b then (if b then x i else 1) else 0)
    _ = markedSubsetWeight root D x := by
      apply Finset.prod_congr rfl
      intro i _
      by_cases hir : i = root <;> by_cases hi : i ∈ D <;>
        simp [allowed, markedSubsetWeight, hir, hi, add_comm]

omit [Fintype V] [DecidableEq V] in
theorem isTargetTuple_iff (root : V) (D : Finset V) {r : ℕ}
    (s : Fin (r+1) → V → Bool) :
    isTargetTuple root D s ↔ (∀ c, isProperSubset (s c)) ∧ isMarkedSubset root D (s 0) := by
  classical
  constructor
  · intro h
    have hm : isMarkedSubset root D (s 0) := by simpa [isTargetTuple] using h 0
    refine ⟨?_, hm⟩
    intro c
    by_cases hc : c = 0
    · subst c
      intro he
      have hz := congrFun he root
      simp [hm.1] at hz
    · simpa [isTargetTuple, hc] using h c
  · rintro ⟨hp, hm⟩ c
    by_cases hc : c = 0 <;> simp [hc, hp, hm]

theorem targetTuple_generating_function (root : V) (D : Finset V) (hD : root ∉ D)
    (r : ℕ) (x : V → R) :
    (∑ s : Fin (r+1) → V → Bool, if isTargetTuple root D s then
      ∏ c, subsetWeight x (s c) else 0) =
        properSubsetsWeight x ^ r * markedSubsetWeight root D x := by
  classical
  let g : Fin (r+1) → (V → Bool) → R := fun c s =>
    if (if c = 0 then isMarkedSubset root D s else isProperSubset s)
      then subsetWeight x s else 0
  calc
    (∑ s : Fin (r+1) → V → Bool, if isTargetTuple root D s then
        ∏ c, subsetWeight x (s c) else 0) = ∑ s : Fin (r+1) → V → Bool, ∏ c, g c (s c) := by
      apply Finset.sum_congr rfl
      intro s _
      simp only [g, Fintype.prod_ite_zero, isTargetTuple]
      split_ifs <;> simp_all
    _ = ∏ c : Fin (r+1), ∑ s : V → Bool, g c s := by
      simpa only [Fintype.piFinset_univ] using
        (Finset.prod_univ_sum (fun _ : Fin (r+1) => (Finset.univ : Finset (V → Bool))) g).symm
    _ = _ := by
      rw [Fin.prod_univ_succ]
      simp [g, sum_markedSubsetWeight root D hD, sum_properSubsetWeight, mul_comm]

theorem event_term_coefficient (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (D : Finset V)
    (s : Fin r → V → Bool) (p : V →₀ ℕ) :
    ((∏ c, subsetWeight (MvPolynomial.X : V → MvPolynomial V ℚ) (s c)) *
      (eventMatrix C root f D s : Matrix V V (MvPolynomial V ℚ)).det).coeff p =
      if tupleMembership s = p then (sourceEventMatrix C root f D s : Matrix V V ℚ).det
      else 0 := by
  rw [tupleWeight_monomial]
  have hm : (eventMatrix C root f D s : Matrix V V (MvPolynomial V ℚ)) =
      MvPolynomial.C.mapMatrix (eventMatrix C root f D s : Matrix V V ℚ) :=
    (eventMatrix_map MvPolynomial.C C root f D s).symm
  rw [hm, ← RingHom.map_det, mul_comm, MvPolynomial.C_mul_monomial, mul_one,
    MvPolynomial.coeff_monomial, sourceEventMatrix_eq_eventMatrix]

/-- The exact finite membership-count identity in the published conjecture.
The left side sums the literal numerical event determinants over all tuples
with prescribed memberships. The right side counts proper tuples whose first
subset avoids the root and contains every marked vertex. -/
theorem source_event_membership_count (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin (r+1)) (hf : Function.Surjective f)
    (D : Finset V) (hD : root ∉ D) (p : V →₀ ℕ) :
    (∑ s ∈ (Finset.univ : Finset (Fin (r+1) → V → Bool)).filter
      (fun s => tupleMembership s = p),
      (sourceEventMatrix C root f D s : Matrix V V ℚ).det) =
    (((Finset.univ : Finset (Fin (r+1) → V → Bool)).filter
      (fun s => isTargetTuple root D s ∧ tupleMembership s = p)).card : ℚ) := by
  classical
  have hp := event_generating_function C root f hf D hD
  rw [← targetTuple_generating_function root D hD r
    (MvPolynomial.X : V → MvPolynomial V ℚ)] at hp
  have hc := congrArg (fun P : MvPolynomial V ℚ => P.coeff p) hp
  simp only [MvPolynomial.coeff_sum, event_term_coefficient] at hc
  rw [Finset.sum_filter]
  rw [hc]
  rw [Finset.natCast_card_filter]
  apply Finset.sum_congr rfl
  intro s _
  by_cases ht : isTargetTuple root D s <;> by_cases hm : tupleMembership s = p <;>
    simp [ht, hm, tupleWeight_monomial]

/-- The normalized count identity. When the admissible sample is nonempty,
its left side is the average numerical event determinant; the unconditional
arithmetic identity uses total rational division. -/
theorem source_event_probability (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin (r+1)) (hf : Function.Surjective f)
    (D : Finset V) (hD : root ∉ D) (p : V →₀ ℕ) :
    ((∑ s ∈ (Finset.univ : Finset (Fin (r+1) → V → Bool)).filter
      (fun s => tupleMembership s = p),
      (sourceEventMatrix C root f D s : Matrix V V ℚ).det) /
      ((Finset.univ : Finset (Fin (r+1) → V → Bool)).filter
        (fun s => tupleMembership s = p)).card) =
    (((Finset.univ : Finset (Fin (r+1) → V → Bool)).filter
      (fun s => isTargetTuple root D s ∧ tupleMembership s = p)).card : ℚ) /
      ((Finset.univ : Finset (Fin (r+1) → V → Bool)).filter
        (fun s => tupleMembership s = p)).card := by
  rw [source_event_membership_count C root f hf D hD p]

end BernardiMorales
