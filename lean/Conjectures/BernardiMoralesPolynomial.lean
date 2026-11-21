import Conjectures.BernardiMoralesColors
import Mathlib.Algebra.MvPolynomial.CommRing
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.Tactic.FieldSimp
import Mathlib.Algebra.BigOperators.Field

set_option linter.unusedSimpArgs false

namespace BernardiMorales

open Finset Matrix

variable {V R : Type*} [Fintype V] [DecidableEq V] [CommRing R]

def subsetWeight (x : V → R) (s : V → Bool) : R := ∏ i, if s i then x i else 1

def allSubsetsWeight (x : V → R) : R := ∏ i, (1 + x i)

def properSubsetsWeight (x : V → R) : R := allSubsetsWeight x - ∏ i, x i

def markedSubsetWeight (root : V) (D : Finset V) (x : V → R) : R :=
  ∏ i, if i = root then 1 else if i ∈ D then x i else 1 + x i

variable {K : Type*} [Field K]

def oddsParameter (x : V → K) (i : V) : K := x i / (1 + x i)

theorem odds_bitWeight (x : K) (hx : 1 + x ≠ 0) (b : Bool) :
    bitWeight (x / (1+x)) b = (if b then x else 1) / (1+x) := by
  cases b
  · simp only [bitWeight, Bool.false_eq_true, ite_false]
    field_simp
    ring
  · rfl

omit [DecidableEq V] in
theorem odds_weight (x : V → K) (hx : ∀ i, 1 + x i ≠ 0) (s : V → Bool) :
    weight (oddsParameter x) s = subsetWeight x s / allSubsetsWeight x := by
  unfold weight oddsParameter
  simp_rw [odds_bitWeight _ (hx _)]
  rw [Finset.prod_div_distrib]
  rfl

omit [DecidableEq V] in
theorem odds_delta (x : V → K) (hx : ∀ i, 1 + x i ≠ 0) :
    1 - ∏ i, oddsParameter x i = properSubsetsWeight x / allSubsetsWeight x := by
  have hg : allSubsetsWeight x ≠ 0 := Finset.prod_ne_zero_iff.mpr (by intro i _; exact hx i)
  unfold oddsParameter
  rw [Finset.prod_div_distrib]
  unfold properSubsetsWeight
  change 1 - (∏ i, x i) / allSubsetsWeight x =
    (allSubsetsWeight x - ∏ i, x i) / allSubsetsWeight x
  field_simp

theorem odds_marked_weight (root : V) (D : Finset V) (hD : root ∉ D)
    (x : V → K) (hx : ∀ i, 1 + x i ≠ 0) :
    markedSubsetWeight root D x =
      allSubsetsWeight x * (1 - oddsParameter x root) * ∏ i ∈ D, oddsParameter x i := by
  let d : V → K := fun i => if i = root then 1 - oddsParameter x i
    else markFactor D (oddsParameter x) i
  have hp : (∏ i, d i) = (1 - oddsParameter x root) * ∏ i ∈ D, oddsParameter x i := by
    rw [← Finset.mul_prod_erase Finset.univ _ (Finset.mem_univ root)]
    rw [show d root = 1 - oddsParameter x root by simp [d]]
    congr 1
    calc
      (∏ i ∈ Finset.univ.erase root, d i) =
          ∏ i ∈ Finset.univ.erase root, markFactor D (oddsParameter x) i := by
        apply Finset.prod_congr rfl
        intro i hi
        simp [d, Finset.ne_of_mem_erase hi]
      _ = ∏ i, markFactor D (oddsParameter x) i := by
        simp [markFactor, hD]
      _ = _ := by simp [markFactor]
  calc
    markedSubsetWeight root D x = ∏ i, (1 + x i) * d i := by
      apply Finset.prod_congr rfl
      intro i _
      by_cases hir : i = root
      · subst i
        simp only [d, ite_true, oddsParameter]
        field_simp [hx root]
        ring
      · by_cases hiD : i ∈ D
        · simp only [d, hir, ite_false, markFactor, hiD, ite_true, oddsParameter]
          field_simp [hx i]
        · simp [d, hir, markFactor, hiD]
    _ = allSubsetsWeight x * ∏ i, d i := Finset.prod_mul_distrib
    _ = _ := by rw [hp]; ring

/-- The event generating function, first over a field where its displayed
rational substitutions are defined. The next theorem specializes it to
formal indeterminates, so the final polynomial identity has no exclusions. -/
theorem event_generating_function_field (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin (r+1)) (hf : Function.Surjective f)
    (D : Finset V) (hD : root ∉ D) (x : V → K)
    (hx : ∀ i, 1 + x i ≠ 0) (hF : properSubsetsWeight x ≠ 0) :
    (∑ S : Fin (r+1) → V → Bool, (∏ c, subsetWeight x (S c)) *
      (eventMatrix C root f D S).det) =
      properSubsetsWeight x ^ r * markedSubsetWeight root D x := by
  have hG : allSubsetsWeight x ≠ 0 :=
    Finset.prod_ne_zero_iff.mpr (by intro i _; exact hx i)
  have hq : 1 - ∏ i, oddsParameter x i ≠ 0 := by
    rw [odds_delta x hx]
    exact div_ne_zero hF hG
  have h := weighted_event_identity C root f hf D hD (oddsParameter x) hq
  simp_rw [odds_weight x hx, Finset.prod_div_distrib, Finset.prod_const,
    Finset.card_univ, Fintype.card_fin, div_mul_eq_mul_div] at h
  rw [← Finset.sum_div, odds_delta x hx] at h
  apply (div_eq_iff (pow_ne_zero _ hG)).mp at h
  rw [h, odds_marked_weight root D hD x hx, div_pow, pow_succ]
  field_simp [hG]

variable {S : Type*} [CommRing S]

omit [DecidableEq V] in
theorem subsetWeight_map (φ : R →+* S) (x : V → R) (s : V → Bool) :
    φ (subsetWeight x s) = subsetWeight (fun i => φ (x i)) s := by
  simp only [subsetWeight, map_prod]
  apply Finset.prod_congr rfl
  intro i _
  cases s i <;> simp

omit [DecidableEq V] in
theorem properSubsetsWeight_map (φ : R →+* S) (x : V → R) :
    φ (properSubsetsWeight x) = properSubsetsWeight (fun i => φ (x i)) := by
  simp [properSubsetsWeight, allSubsetsWeight, map_prod]

theorem markedSubsetWeight_map (φ : R →+* S) (root : V) (D : Finset V) (x : V → R) :
    φ (markedSubsetWeight root D x) = markedSubsetWeight root D (fun i => φ (x i)) := by
  simp only [markedSubsetWeight, map_prod]
  apply Finset.prod_congr rfl
  intro i _
  by_cases hir : i = root <;> by_cases hi : i ∈ D <;> simp [hir, hi]

theorem eventMatrix_map (φ : R →+* S) (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (D : Finset V) (s : Fin r → V → Bool) :
    φ.mapMatrix (eventMatrix C root f D s : Matrix V V R) = eventMatrix C root f D s := by
  have hk (t : V → Bool) (i j : V) :
      φ (intervalKernel C.pred (fun v => (bitValue (t v) : R)) i j) =
        intervalKernel C.pred (fun v => (bitValue (t v) : S)) i j := by
    rw [intervalKernel_binary, intervalKernel_binary]
    split_ifs <;> simp
  ext i j
  change φ (eventMatrix C root f D s i j) = eventMatrix C root f D s i j
  by_cases hi : i = root
  · simp [eventMatrix, colorMatrix, hi]
  · simp only [eventMatrix, colorMatrix, hi, dite_false, Matrix.of_apply, map_mul, hk]
    congr 1
    by_cases hd : i ∈ D <;> cases s (f ⟨i, hi⟩) i <;> simp [markFactor, hd, bitValue]

/-- The full formal generating-function identity. Every term on the left is
an actual subset tuple, and all membership variables are independent formal
indeterminates. There is no nonvanishing assumption. -/
theorem event_generating_function (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin (r+1)) (hf : Function.Surjective f)
    (D : Finset V) (hD : root ∉ D) :
    (∑ s : Fin (r+1) → V → Bool,
      (∏ c, subsetWeight (MvPolynomial.X : V → MvPolynomial V ℚ) (s c)) *
        (eventMatrix C root f D s : Matrix V V (MvPolynomial V ℚ)).det) =
      properSubsetsWeight (MvPolynomial.X : V → MvPolynomial V ℚ) ^ r *
        markedSubsetWeight root D MvPolynomial.X := by
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
  simpa only [map_sum, map_mul, map_prod, map_pow, subsetWeight_map,
    properSubsetsWeight_map, markedSubsetWeight_map, RingHom.map_det, eventMatrix_map]
    using event_generating_function_field C root f hf D hD x hx hF

end BernardiMorales
