import Conjectures.FerroniHigashitaniClosedCount
import Conjectures.FerroniHigashitaniPrefixPolynomial
import Mathlib.Algebra.Polynomial.Roots

/-! A direct polynomial statement of Ferroni–Higashitani Question 5.12(a).
For this particular witness, the weighted composition calculation identifies
both the actual Ehrhart polynomial and its three negative evaluations. -/

open Finset Polynomial
open scoped Pointwise

namespace FerroniHigashitani

private noncomputable def boxWeightPolynomial : MvPolynomial (Fin 6) ℚ :=
  (∏ i : Fin 5, (MvPolynomial.X 0 + MvPolynomial.X i.succ + 1) *
    (2 * MvPolynomial.X i.succ + 1) ^ 2) ^ 11

private theorem boxWeightPolynomial_eval (b : Fin 6 → ℕ) :
    MvPolynomial.eval (fun i => (b i : ℚ)) boxWeightPolynomial = (weight b ^ 11 : ℕ) := by
  rw [boxWeightPolynomial, map_pow, Nat.cast_pow, map_prod, weight, Nat.cast_prod]
  congr 1
  apply prod_congr rfl
  intro i _
  simp only [map_mul, map_add, map_one, map_ofNat, map_pow, MvPolynomial.eval_X,
    Nat.cast_mul, Nat.cast_add, Nat.cast_one, Nat.cast_ofNat, Nat.cast_pow]

private theorem boxWeightPolynomial_reflect (z : Fin 6 → ℚ) :
    MvPolynomial.eval (fun i => -z i - 1) boxWeightPolynomial =
      -MvPolynomial.eval z boxWeightPolynomial := by
  simp only [boxWeightPolynomial, map_pow, map_prod, map_mul, map_add, map_one, map_ofNat,
    MvPolynomial.eval_X]
  have h (i : Fin 5) :
      (-z 0 - 1 + (-z i.succ - 1) + 1) * (2 * (-z i.succ - 1) + 1) ^ 2 =
        -1 * ((z 0 + z i.succ + 1) * (2 * z i.succ + 1) ^ 2) := by ring
  simp_rw [h, prod_mul_distrib]
  have hsign : (∏ _ : Fin 5, (-1 : ℚ)) = -1 := by norm_num
  rw [hsign, neg_one_mul]
  rw [neg_pow]
  norm_num

private theorem prefixCount_polynomial :
    ∃ A : ℚ[X], (∀ n : ℕ, A.eval (n : ℚ) = prefixCount 11 n) ∧
      (∀ k : ℕ, 0 < k → k ≤ 6 → A.eval (-(k : ℚ)) = 0) ∧
      (∀ n : ℕ, A.eval (-(n : ℚ) - 6 - 1) = -(prefixCount 11 n : ℚ)) := by
  obtain ⟨A, hA, hzero, hreflect⟩ := weightedPrefixPolynomial boxWeightPolynomial
  have hsum (n : ℕ) :
      sumCompositions 6 n (fun b => MvPolynomial.eval (fun i => (b i : ℚ)) boxWeightPolynomial) =
        (prefixCount 11 n : ℚ) := by
    simp_rw [boxWeightPolynomial_eval, sumCompositions_cast]
    rfl
  refine ⟨A, fun n => (hA n).trans (hsum n), hzero, ?_⟩
  intro n
  have h := hreflect n
  simp only [Nat.cast_ofNat] at h
  rw [h]
  simp_rw [boxWeightPolynomial_reflect]
  have hz :
      sumCompositions 6 n (fun b => -MvPolynomial.eval (fun i => (b i : ℚ)) boxWeightPolynomial) =
        -sumCompositions 6 n (fun b => MvPolynomial.eval (fun i => (b i : ℚ)) boxWeightPolynomial) := by
    unfold sumCompositions
    induction compositions 6 n with
    | nil => simp
    | cons b bs ih => simp [ih, add_comm]
  rw [hz, hsum]
  norm_num

/-- The Ehrhart polynomial is characterized by the closed lattice-point
counts at every positive integer dilation. -/
def IsEhrhartPolynomial {m : ℕ} (P : Set (Space m)) (E : ℚ[X]) : Prop :=
  ∀ k : ℕ, 0 < k → E.eval (k : ℚ) = Nat.card (ClosedLatticePoints P k)

theorem ehrhartPolynomial_unique {m : ℕ} {P : Set (Space m)} {E F : ℚ[X]}
    (hE : IsEhrhartPolynomial P E) (hF : IsEhrhartPolynomial P F) : E = F := by
  apply E.eq_of_infinite_eval_eq F
  have hi : Function.Injective (fun n : ℕ => ((n + 1 : ℕ) : ℚ)) := by
    intro a b h
    change ((a + 1 : ℕ) : ℚ) = ((b + 1 : ℕ) : ℚ) at h
    have he : a + 1 = b + 1 := by exact_mod_cast h
    omega
  apply (Set.infinite_range_of_injective hi).mono
  rintro _ ⟨n, rfl⟩
  exact (hE (n + 1) (by omega)).trans (hF (n + 1) (by omega)).symm

theorem witness_ehrhartPolynomial :
    ∃ E : ℚ[X], IsEhrhartPolynomial (witness 11) E ∧
      ∀ k : ℕ, 0 < k → k ≤ 3 →
        E.eval (-(k : ℚ)) = Nat.card (InteriorLatticePoints (witness 11) k) := by
  obtain ⟨A, hA, hzero, hreflect⟩ := prefixCount_polynomial
  let E := A.comp (C 2 * X) - A.comp (C 2 * X - C 6)
  have hev (t : ℚ) : E.eval t = A.eval (2 * t) - A.eval (2 * t - 6) := by
    simp [E, eval_comp]
  refine ⟨E, ?_, ?_⟩
  · intro k hk
    rw [hev, show (2 : ℚ) * k = ((k * 2 : ℕ) : ℚ) by push_cast; ring, hA]
    by_cases h : k * 2 < 6
    · rw [card_witnessClosed_small 11 k hk h]
      have hneg : ((k * 2 : ℕ) : ℚ) - 6 = -((6 - k * 2 : ℕ) : ℚ) := by
        rw [Nat.cast_sub h.le]
        norm_num
      rw [hneg, hzero _ (by omega) (by omega), sub_zero]
    · have h6 : 6 ≤ k * 2 := by omega
      rw [← show ((6 : ℕ) : ℚ) = 6 from rfl, ← Nat.cast_sub h6, hA]
      have hc := card_witnessClosed_large 11 k hk h6
      have hc' : (Nat.card (ClosedLatticePoints (witness 11) k) : ℚ) + (prefixCount 11 (k * 2 - 6) : ℚ) =
          (prefixCount 11 (k * 2) : ℚ) := by exact_mod_cast hc
      linarith
  · intro k hk hk3
    have hex : 2 * -(k : ℚ) = -((k * 2 : ℕ) : ℚ) := by push_cast; ring
    have hshift : -((k * 2 : ℕ) : ℚ) - 6 = -((k * 2 - 1 : ℕ) : ℚ) - 6 - 1 := by
      rw [Nat.cast_sub (by omega)]
      push_cast
      ring
    rw [hev, hex, hzero _ (by omega) (by omega), hshift, hreflect, zero_sub, neg_neg,
      card_witnessInterior 11 k hk hk3]

/-- The ordinary form of Question 5.12(a), using the unique polynomial
that counts the closed dilations of the exhibited very ample polytope. -/
theorem question_5_12a :
    ∃ (P : Set (Space 11)) (E : ℚ[X]),
      (∃ S : Set (Space 11), S.Finite ∧ S ⊆ standardLattice 11 ∧ P = convexHull ℝ S) ∧
      (∀ k : ℕ, 0 < k → ∀ v ∈ (k : ℝ) • P, v ∈ standardLattice 11 →
        ∃ f : Fin k → Space 11, (∀ i, f i ∈ P ∧ f i ∈ standardLattice 11) ∧ ∑ i, f i = v) ∧
      IsEhrhartPolynomial P E ∧
      |E.eval (-2)| ^ 2 < |E.eval (-1)| * |E.eval (-3)| := by
  obtain ⟨E, hE, hneg⟩ := witness_ehrhartPolynomial
  refine ⟨witness 11, E, witness_latticePolytope 11, fun k hk _ h h' => witness_idp 11 k hk h h', hE, ?_⟩
  have h1 := hneg 1 (by decide) (by decide)
  have h2 := hneg 2 (by decide) (by decide)
  have h3 := hneg 3 (by decide) (by decide)
  simp only [Nat.cast_one, Nat.cast_ofNat] at h1 h2 h3
  rw [h1, h2, h3]
  rw [card_witnessInterior 11 1 (by decide) (by decide),
    card_witnessInterior 11 2 (by decide) (by decide), card_witnessInterior 11 3 (by decide) (by decide)]
  simp only [abs_of_nonneg (Nat.cast_nonneg (α := ℚ) _), Nat.reduceMul, Nat.reduceSub]
  exact_mod_cast exact_prefix_violation

end FerroniHigashitani
