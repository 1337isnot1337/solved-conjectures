import Conjectures.BernardiMoralesCounting
import Conjectures.BernardiMoralesDelta

set_option linter.unusedSimpArgs false

namespace BernardiMorales

open scoped Classical
open Finset Matrix MvPolynomial

variable {V R : Type*} [Fintype V] [DecidableEq V] [CommRing R]

def properSubsetMonomial (x : V → R) (s : V → Bool) : R :=
  if s = (fun _ => true) then 0 else subsetWeight x s

variable {K : Type*} [Field K]

omit [DecidableEq V] in
theorem odds_properWeight (x : V → K) (hx : ∀ i, 1 + x i ≠ 0) (s : V → Bool) :
    properWeight (oddsParameter x) s = properSubsetMonomial x s / allSubsetsWeight x := by
  by_cases hs : s = (fun _ => true)
  · simp [properWeight, properSubsetMonomial, hs]
  · simp [properWeight, properSubsetMonomial, hs, odds_weight x hx]

omit [DecidableEq V] in
theorem odds_vacancy_product (x : V → K) (hx : ∀ i, 1 + x i ≠ 0) :
    (∏ i : V, (1 - oddsParameter x i : K)) = 1 / allSubsetsWeight x := by
  have he (i : V) : 1 - oddsParameter x i = 1 / (1 + x i) := by
    unfold oddsParameter
    field_simp [hx i]
    ring
  simp_rw [he]
  rw [Finset.prod_div_distrib]
  simp [allSubsetsWeight]

theorem vacancy_generating_function_field (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin (r+1)) (x : V → K)
    (hx : ∀ i, 1 + x i ≠ 0) (hF : properSubsetsWeight x ≠ 0) :
    (∑ s : Fin (r+1) → V → Bool, (∏ c, properSubsetMonomial x (s c)) *
      (vacancyMatrix C root f s).det) = properSubsetsWeight x ^ r := by
  have hG : allSubsetsWeight x ≠ 0 :=
    Finset.prod_ne_zero_iff.mpr (by intro i _; exact hx i)
  have hq : 1 - ∏ i, oddsParameter x i ≠ 0 := by
    rw [odds_delta x hx]
    exact div_ne_zero hF hG
  have h := weighted_vacancy_identity C root f (oddsParameter x) hq
  simp_rw [odds_properWeight x hx, Finset.prod_div_distrib, Finset.prod_const,
    Finset.card_univ, Fintype.card_fin, div_mul_eq_mul_div] at h
  rw [← Finset.sum_div, odds_delta x hx, odds_vacancy_product x hx] at h
  apply (div_eq_iff (pow_ne_zero _ hG)).mp at h
  rw [h, div_pow, pow_succ]
  field_simp [hG]

variable {S : Type*} [CommRing S]

omit [DecidableEq V] in
theorem properSubsetMonomial_map (φ : R →+* S) (x : V → R) (s : V → Bool) :
    φ (properSubsetMonomial x s) = properSubsetMonomial (fun i => φ (x i)) s := by
  by_cases hs : s = (fun _ => true) <;>
    simp [properSubsetMonomial, hs, subsetWeight_map]

theorem vacancyMatrix_map (φ : R →+* S) (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (s : Fin r → V → Bool) :
    φ.mapMatrix (vacancyMatrix C root f s : Matrix V V R) = vacancyMatrix C root f s := by
  have hk (t : V → Bool) (i j : V) :
      φ (intervalKernel C.pred (fun v => (bitValue (t v) : R)) i j) =
        intervalKernel C.pred (fun v => (bitValue (t v) : S)) i j := by
    rw [intervalKernel_binary, intervalKernel_binary]
    split_ifs <;> simp
  ext i j
  change φ (vacancyMatrix C root f s i j) = vacancyMatrix C root f s i j
  by_cases hi : i = root
  · simp [vacancyMatrix, colorMatrix, hi]
  · simp only [vacancyMatrix, colorMatrix, hi, dite_false, Matrix.of_apply, map_mul, hk]
    congr 1
    cases s (f ⟨i, hi⟩) i <;> simp [bitValue]

theorem vacancy_generating_function (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin (r+1)) :
    (∑ s : Fin (r+1) → V → Bool,
      (∏ c, properSubsetMonomial (MvPolynomial.X : V → MvPolynomial V ℚ) (s c)) *
        (vacancyMatrix C root f s : Matrix V V (MvPolynomial V ℚ)).det) =
      properSubsetsWeight (MvPolynomial.X : V → MvPolynomial V ℚ) ^ r := by
  let P := MvPolynomial V ℚ
  let L := FractionRing P
  let φ : P →+* L := algebraMap P L
  let x : V → L := fun i => φ (MvPolynomial.X i)
  have hφ : Function.Injective φ := IsFractionRing.injective P L
  have hx : ∀ i, 1 + x i ≠ 0 := by
    intro i hi
    have hp : (1 + MvPolynomial.X i : P) = 0 := hφ (by simpa [x, map_add] using hi)
    have hc := congrArg (MvPolynomial.constantCoeff : P →+* ℚ) hp
    simp at hc
  have hF : properSubsetsWeight x ≠ 0 := by
    intro hz
    have hp : properSubsetsWeight (MvPolynomial.X : V → P) = 0 :=
      hφ (by simpa only [properSubsetsWeight_map, map_zero] using hz)
    have hc := congrArg (MvPolynomial.constantCoeff : P →+* ℚ) hp
    have hpz : (∏ _i : V, (0 : ℚ)) = 0 :=
      Finset.prod_eq_zero (Finset.mem_univ root) rfl
    simp [properSubsetsWeight, allSubsetsWeight, map_prod, hpz] at hc
  apply hφ
  simpa only [map_sum, map_mul, map_prod, map_pow, properSubsetMonomial_map,
    properSubsetsWeight_map, RingHom.map_det, vacancyMatrix_map]
    using vacancy_generating_function_field C root f x hx hF

def isProperTuple {r : ℕ} (s : Fin r → V → Bool) : Prop := ∀ c, s c ≠ fun _ => true

def isDeltaTreeTuple (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (s : Fin r → V → Bool) : Prop :=
  ∃ hs : isProperTuple s, isRootedTree (deltaGraph C root f s hs) root

theorem isDeltaTreeTuple_iff (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (s : Fin r → V → Bool) (hs : isProperTuple s) :
    isDeltaTreeTuple C root f s ↔ isRootedTree (deltaGraph C root f s hs) root := by
  constructor
  · rintro ⟨hs', ht⟩
    exact ht
  · exact fun ht => ⟨hs, ht⟩

omit [DecidableEq V] in
theorem product_properSubsetMonomial {r : ℕ} (x : V → R) (s : Fin r → V → Bool) :
    (∏ c, properSubsetMonomial x (s c)) =
      if isProperTuple s then ∏ c, subsetWeight x (s c) else 0 := by
  have he (c : Fin r) : properSubsetMonomial x (s c) =
      if s c ≠ (fun _ => true) then subsetWeight x (s c) else 0 := by
    by_cases hc : s c = (fun _ => true) <;> simp [properSubsetMonomial, hc]
  simp_rw [he, Fintype.prod_ite_zero]
  unfold isProperTuple
  split_ifs <;> rfl

theorem properTuple_generating_function (r : ℕ) (x : V → R) :
    (∑ s : Fin r → V → Bool, ∏ c, properSubsetMonomial x (s c)) = properSubsetsWeight x ^ r := by
  have he : (∑ s : V → Bool, properSubsetMonomial x s) = properSubsetsWeight x := by
    convert sum_properSubsetWeight x using 1
    apply Finset.sum_congr rfl
    intro s _
    by_cases hs : s = (fun _ => true) <;> simp [properSubsetMonomial, isProperSubset, hs]
  calc
    (∑ s : Fin r → V → Bool, ∏ c, properSubsetMonomial x (s c)) =
        ∏ _c : Fin r, ∑ s : V → Bool, properSubsetMonomial x s := by
      simpa only [Fintype.piFinset_univ] using
        (Finset.prod_univ_sum (fun _ : Fin r => (Finset.univ : Finset (V → Bool)))
          (fun _ s => properSubsetMonomial x s)).symm
    _ = _ := by simp [he]

theorem tree_term_coefficient (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (s : Fin r → V → Bool) (p : V →₀ ℕ) :
    ((∏ c, properSubsetMonomial (MvPolynomial.X : V → MvPolynomial V ℚ) (s c)) *
      (vacancyMatrix C root f s : Matrix V V (MvPolynomial V ℚ)).det).coeff p =
      if isDeltaTreeTuple C root f s ∧ tupleMembership s = p then (1 : ℚ) else 0 := by
  rw [product_properSubsetMonomial]
  by_cases hs : isProperTuple s
  · rw [ite_eq_left hs, tupleWeight_monomial]
    have hm : (vacancyMatrix C root f s : Matrix V V (MvPolynomial V ℚ)) =
        MvPolynomial.C.mapMatrix (vacancyMatrix C root f s : Matrix V V ℚ) :=
      (vacancyMatrix_map MvPolynomial.C C root f s).symm
    rw [hm, ← RingHom.map_det, mul_comm, MvPolynomial.C_mul_monomial, mul_one,
      MvPolynomial.coeff_monomial, vacancyMatrix_tree_indicator C root f s hs,
      isDeltaTreeTuple_iff C root f s hs]
    by_cases ht : isRootedTree (deltaGraph C root f s hs) root <;>
      by_cases hp : tupleMembership s = p <;> simp [ht, hp]
  · have ht : ¬ isDeltaTreeTuple C root f s := by
      rintro ⟨h, _⟩
      exact hs h
    simp [hs, ht]

/-- The delta-process tree count for every fixed color map, including maps
that omit colors. This is the exact all-membership-vectors count asserted by
the source probability formula. -/
theorem delta_tree_membership_count (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin (r+1)) (p : V →₀ ℕ) :
    ((Finset.univ : Finset (Fin (r+1) → V → Bool)).filter
      (fun s => isDeltaTreeTuple C root f s ∧ tupleMembership s = p)).card =
    ((Finset.univ : Finset (Fin r → V → Bool)).filter
      (fun s => isProperTuple s ∧ tupleMembership s = p)).card := by
  have hp := vacancy_generating_function C root f
  rw [← properTuple_generating_function r (MvPolynomial.X : V → MvPolynomial V ℚ)] at hp
  have hc := congrArg (fun P : MvPolynomial V ℚ => P.coeff p) hp
  simp only [MvPolynomial.coeff_sum, tree_term_coefficient] at hc
  have he : (((Finset.univ : Finset (Fin (r+1) → V → Bool)).filter
      (fun s => isDeltaTreeTuple C root f s ∧ tupleMembership s = p)).card : ℚ) =
      (((Finset.univ : Finset (Fin r → V → Bool)).filter
        (fun s => isProperTuple s ∧ tupleMembership s = p)).card : ℚ) := by
    simp only [Finset.natCast_card_filter]
    rw [hc]
    apply Finset.sum_congr rfl
    intro s _
    rw [product_properSubsetMonomial]
    by_cases hs : isProperTuple s <;> by_cases hsp : tupleMembership s = p <;>
      simp [hs, hsp, tupleWeight_monomial]
  exact Nat.cast_inj.mp he

end BernardiMorales
