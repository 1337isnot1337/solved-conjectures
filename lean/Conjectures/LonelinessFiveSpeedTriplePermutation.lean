import Conjectures.LonelinessFiveSpeedRelationData
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring

/-! Three distinct coordinates can occupy the first three positions of a
permutation.  This converts an actual 1:3:4 triple into the exact relation
matrix used by the finite reduction certificates. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped BigOperators Matrix

theorem exists_permutation_first_three (i j k : Fin 5)
    (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k) :
    ∃ π : Equiv.Perm (Fin 5), π 0 = i ∧ π 1 = j ∧ π 2 = k := by
  let p : Equiv.Perm (Fin 5) := Equiv.swap 0 i
  have hp0 : p 0 = i := Equiv.swap_apply_left _ _
  have hj0 : (0 : Fin 5) ≠ p.symm j := by
    intro h
    apply hij
    calc
      i = p 0 := hp0.symm
      _ = p (p.symm j) := congrArg p h
      _ = j := p.apply_symm_apply j
  let q : Equiv.Perm (Fin 5) := (Equiv.swap 1 (p.symm j)).trans p
  have hq0 : q 0 = i := by
    change p (Equiv.swap 1 (p.symm j) 0) = i
    rw [Equiv.swap_apply_of_ne_of_ne (show (0 : Fin 5) ≠ 1 by decide) hj0]
    exact hp0
  have hq1 : q 1 = j := by
    change p (Equiv.swap 1 (p.symm j) 1) = j
    rw [Equiv.swap_apply_left, Equiv.apply_symm_apply]
  have hk0 : (0 : Fin 5) ≠ q.symm k := by
    intro h
    apply hik
    calc
      i = q 0 := hq0.symm
      _ = q (q.symm k) := congrArg q h
      _ = k := q.apply_symm_apply k
  have hk1 : (1 : Fin 5) ≠ q.symm k := by
    intro h
    apply hjk
    calc
      j = q 1 := hq1.symm
      _ = q (q.symm k) := congrArg q h
      _ = k := q.apply_symm_apply k
  refine ⟨(Equiv.swap 2 (q.symm k)).trans q, ?_, ?_, ?_⟩
  · change q (Equiv.swap 2 (q.symm k) 0) = i
    rw [Equiv.swap_apply_of_ne_of_ne (show (0 : Fin 5) ≠ 2 by decide) hk0]
    exact hq0
  · change q (Equiv.swap 2 (q.symm k) 1) = j
    rw [Equiv.swap_apply_of_ne_of_ne (show (1 : Fin 5) ≠ 2 by decide) hk1]
    exact hq1
  · change q (Equiv.swap 2 (q.symm k) 2) = k
    rw [Equiv.swap_apply_left, Equiv.apply_symm_apply]

theorem special134_of_indexed_values (v : Fin 5 → ℕ) (i j k : Fin 5) (x : ℕ)
    (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k)
    (hi : v i = x) (hj : v j = 3 * x) (hk : v k = 4 * x) :
    ∃ π : Equiv.Perm (Fin 5),
      special134Relations *ᵥ (fun a => (v (π a) : ℤ)) = 0 := by
  obtain ⟨π, h0, h1, h2⟩ := exists_permutation_first_three i j k hij hik hjk
  refine ⟨π, ?_⟩
  ext a
  fin_cases a <;>
    simp [special134Relations, Matrix.mulVec, dotProduct, Fin.sum_univ_succ,
      h0, h1, h2, hi, hj, hk] <;> ring

theorem special134_of_positive_triple (v : Fin 5 → ℕ) (i j k : Fin 5) (x : ℕ)
    (hx : 0 < x) (hi : v i = x) (hj : v j = 3 * x) (hk : v k = 4 * x) :
    ∃ π : Equiv.Perm (Fin 5),
      special134Relations *ᵥ (fun a => (v (π a) : ℤ)) = 0 := by
  have hij : i ≠ j := by intro h; have := congrArg v h; omega
  have hik : i ≠ k := by intro h; have := congrArg v h; omega
  have hjk : j ≠ k := by intro h; have := congrArg v h; omega
  exact special134_of_indexed_values v i j k x hij hik hjk hi hj hk

end Loneliness.FiveSpeedCertificate
