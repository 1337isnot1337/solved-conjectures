module

public import Conjectures.ChowInitial
public import Conjectures.ChowRootSigns
public import Conjectures.ChowSignedPermutations
public import Conjectures.ChowStrictInterlacing

/-!
# Consecutive interlacing of the ordinary type-D Eulerian polynomials

`typeDEulerian r` is the sum over the actual even-signed permutations of
rank `r+2`, with the source type-D descent statistic. The root-vector
predicates below include complete linear factorizations and positive leading
coefficients, so they describe every root, with its multiplicity.
-/

@[expose] public section

namespace Chow

open Polynomial
open scoped BigOperators

def OrderedNegativeRoots {d : ℕ} (p : ℝ[X]) (a : Fin d → ℝ) : Prop :=
  0 < p.leadingCoeff ∧ Monotone a ∧ (∀ i, a i < 0) ∧
    p = C p.leadingCoeff * ∏ i, (X - C (a i))

def StrictlyOrderedNegativeRoots {d : ℕ} (p : ℝ[X]) (a : Fin d → ℝ) : Prop :=
  0 < p.leadingCoeff ∧ StrictMono a ∧ (∀ i, a i < 0) ∧
    p = C p.leadingCoeff * ∏ i, (X - C (a i))

theorem StrictlyOrderedNegativeRoots.weak {d : ℕ} {p : ℝ[X]} {a : Fin d → ℝ}
    (ha : StrictlyOrderedNegativeRoots p a) : OrderedNegativeRoots p a :=
  ⟨ha.1, ha.2.1.monotone, ha.2.2.1, ha.2.2.2⟩

def ConsecutiveInterlacing (d : ℕ) (p q : ℝ[X]) : Prop :=
  ∃ a : Fin d → ℝ, ∃ b : Fin (d + 1) → ℝ,
    OrderedNegativeRoots p a ∧ OrderedNegativeRoots q b ∧
      ∀ i : Fin d, b i.castSucc ≤ a i ∧ a i ≤ b i.succ

def StrictConsecutiveInterlacing (d : ℕ) (p q : ℝ[X]) : Prop :=
  ∃ a : Fin d → ℝ, ∃ b : Fin (d + 1) → ℝ,
    StrictlyOrderedNegativeRoots p a ∧ StrictlyOrderedNegativeRoots q b ∧
      ∀ i : Fin d, b i.castSucc < a i ∧ a i < b i.succ

theorem StrictConsecutiveInterlacing.weak {d : ℕ} {p q : ℝ[X]}
    (h : StrictConsecutiveInterlacing d p q) : ConsecutiveInterlacing d p q := by
  obtain ⟨a, b, ha, hb, hbetween⟩ := h
  exact ⟨a, b, ha.weak, hb.weak, fun i => ⟨(hbetween i).1.le, (hbetween i).2.le⟩⟩

private theorem next_total_roots (r : ℕ) (hr : 1 ≤ r) (a : Fin (r + 2) → ℝ)
    (ha : StrictlyOrderedNegativeRoots (totalRow r) a) :
    ∃ b : Fin (r + 2 + 1) → ℝ,
      StrictlyOrderedNegativeRoots (totalRow (r + 1)) b ∧
        ∀ i : Fin (r + 2), b i.castSucc < a i ∧ a i < b i.succ := by
  have hsign (i : Fin (r + 2)) :
      (totalRow (r + 1)).eval (a i) * (totalRow r).derivative.eval (a i) < 0 := by
    have hroot : (totalRow r).eval (a i) = 0 := by
      rw [ha.2.2.2, eval_mul, eval_C, eval_prod]
      have hp : (∏ j : Fin (r + 2), ((X - C (a j) : ℝ[X]).eval (a i))) = 0 :=
        Finset.prod_eq_zero (Finset.mem_univ i) (by simp)
      rw [hp, mul_zero]
    have hder := derivative_ne_zero_of_ordered_product
      (p := totalRow r) (a := a) ha.2.1 ha.2.2.2 ha.1 i
    exact refinedRow_sign_at_total_root r hr (a i) hroot hder
  obtain ⟨b, hbmono, hbneg, hbetween, hbfactor⟩ := strict_interlacing_extension
    (p := totalRow r) (q := totalRow (r + 1)) (a := a)
    (by omega) ha.2.1 ha.2.2.1 ha.2.2.2 ha.1
    (by simpa using totalRow_natDegree (r + 1))
    (totalRow_leadingCoeff_pos (r + 1)) (totalRow_eval_zero_pos (r + 1)) hsign
  exact ⟨b, ⟨totalRow_leadingCoeff_pos (r + 1), hbmono, hbneg, hbfactor⟩, hbetween⟩

theorem totalRow_strict_roots (r : ℕ) (hr : 1 ≤ r) :
    ∃ a : Fin (r + 2) → ℝ, StrictlyOrderedNegativeRoots (totalRow r) a := by
  induction r, hr using Nat.le_induction with
  | base =>
    exact ⟨rankThreeRoots, totalRow_leadingCoeff_pos 1, rankThreeRoots_strictMono,
      rankThreeRoots_neg, totalRow_one_roots⟩
  | succ r hr ih =>
    obtain ⟨a, ha⟩ := ih
    obtain ⟨b, hb, _⟩ := next_total_roots r hr a ha
    exact ⟨b, hb⟩

theorem totalRow_strict_interlacing (r : ℕ) (hr : 1 ≤ r) :
    StrictConsecutiveInterlacing (r + 2) (totalRow r) (totalRow (r + 1)) := by
  obtain ⟨a, ha⟩ := totalRow_strict_roots r hr
  obtain ⟨b, hb, hbetween⟩ := next_total_roots r hr a ha
  exact ⟨a, b, ha, hb, hbetween⟩

theorem totalRow_interlacing (r : ℕ) :
    ConsecutiveInterlacing (r + 2) (totalRow r) (totalRow (r + 1)) := by
  cases r with
  | zero =>
    refine ⟨fun _ => -1, rankThreeRoots, ?_, ?_, initial_weak_interlacing⟩
    · exact ⟨totalRow_leadingCoeff_pos 0, monotone_const, fun _ => by norm_num,
        totalRow_zero_roots⟩
    · exact ⟨totalRow_leadingCoeff_pos 1, rankThreeRoots_strictMono.monotone,
        rankThreeRoots_neg, totalRow_one_roots⟩
  | succ r => exact (totalRow_strict_interlacing (r + 1) (by omega)).weak

private theorem half_factorization {d : ℕ} (p q : ℝ[X]) (a : Fin d → ℝ)
    (hpq : p = C 2 * q) (hp : 0 < p.leadingCoeff)
    (hfactor : p = C p.leadingCoeff * ∏ i, (X - C (a i))) :
    0 < q.leadingCoeff ∧ q = C q.leadingCoeff * ∏ i, (X - C (a i)) := by
  have hl : p.leadingCoeff = 2 * q.leadingCoeff := by
    rw [hpq, leadingCoeff_mul, leadingCoeff_C]
  constructor
  · rw [hl] at hp
    linarith
  · apply mul_left_cancel₀ (show (C 2 : ℝ[X]) ≠ 0 by simp)
    calc
      C 2 * q = p := hpq.symm
      _ = C p.leadingCoeff * ∏ i, (X - C (a i)) := hfactor
      _ = C 2 * (C q.leadingCoeff * ∏ i, (X - C (a i))) := by rw [hl, map_mul, mul_assoc]

theorem typeDEulerian_ordered_roots {r : ℕ} {a : Fin (r + 2) → ℝ}
    (ha : OrderedNegativeRoots (totalRow r) a) : OrderedNegativeRoots (typeDEulerian r) a := by
  obtain ⟨hlead, hfactor⟩ := half_factorization (totalRow r) (typeDEulerian r) a
    (totalRow_eq_two_typeDEulerian r) ha.1 ha.2.2.2
  exact ⟨hlead, ha.2.1, ha.2.2.1, hfactor⟩

theorem typeDEulerian_strict_roots {r : ℕ} {a : Fin (r + 2) → ℝ}
    (ha : StrictlyOrderedNegativeRoots (totalRow r) a) :
    StrictlyOrderedNegativeRoots (typeDEulerian r) a := by
  obtain ⟨hlead, hfactor⟩ := half_factorization (totalRow r) (typeDEulerian r) a
    (totalRow_eq_two_typeDEulerian r) ha.1 ha.2.2.2
  exact ⟨hlead, ha.2.1, ha.2.2.1, hfactor⟩

/-- Chow's consecutive interlacing assertion for every actual rank `r+2 ≥ 2`. -/
theorem typeD_consecutive_interlacing (r : ℕ) :
    ConsecutiveInterlacing (r + 2) (typeDEulerian r) (typeDEulerian (r + 1)) := by
  obtain ⟨a, b, ha, hb, hbetween⟩ := totalRow_interlacing r
  exact ⟨a, b, typeDEulerian_ordered_roots ha, typeDEulerian_ordered_roots hb, hbetween⟩

/-- Strict consecutive interlacing and simple negative roots for every actual rank at least three. -/
theorem typeD_consecutive_strict_interlacing (r : ℕ) (hr : 1 ≤ r) :
    StrictConsecutiveInterlacing (r + 2) (typeDEulerian r) (typeDEulerian (r + 1)) := by
  obtain ⟨a, b, ha, hb, hbetween⟩ := totalRow_strict_interlacing r hr
  exact ⟨a, b, typeDEulerian_strict_roots ha, typeDEulerian_strict_roots hb, hbetween⟩

end Chow
