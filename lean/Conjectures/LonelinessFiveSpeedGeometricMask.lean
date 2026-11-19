import Mathlib.Combinatorics.Colex
import Mathlib.Data.Nat.GCD.Basic
import Mathlib.Data.Nat.ModEq
import Mathlib.Algebra.Order.Interval.Finset.SuccPred
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! A compact, exact certificate for a multiplicatively permuted interval of
residues.  The certificate checks one geometric-sum congruence modulo
`2 ^ p - 1`; it does not trust a table generator or a bit-by-bit computation.

The multiplier `s` is the inverse of the multiplier whose good residues are
being encoded.  The interval endpoints remain parameters, so the arithmetic
layer does not depend on a particular loneliness threshold. -/

namespace Loneliness.FiveSpeedCertificate

open scoped BigOperators

/-- Residues obtained by multiplying the inclusive interval by `s`. -/
def intervalResidues (p s L U : ℕ) : Finset ℕ :=
  (Finset.Icc L U).image (fun r => s * r % p)

/-- The bit at residue `r` is set exactly when `r` is in `intervalResidues`. -/
def intervalMask (p s L U : ℕ) : ℕ :=
  ∑ r ∈ intervalResidues p s L U, 2 ^ r

/-- An executable check with no truncated subtraction on the right side of
the geometric-sum identity. -/
def geometricMaskCheck (p s L U G : ℕ) : Bool :=
  decide (G < 2 ^ p - 1) &&
    decide (((2 ^ s - 1) * G + 2 ^ ((s * L) % p)) % (2 ^ p - 1) =
      2 ^ ((s * (U + 1)) % p) % (2 ^ p - 1))

theorem intervalMask_testBit (p s L U r : ℕ) :
    (intervalMask p s L U).testBit r = true ↔ r ∈ intervalResidues p s L U := by
  have h := Finset.toFinset_bitIndices_sum_two_pow (intervalResidues p s L U)
  have hm := congrArg (fun S : Finset ℕ => r ∈ S) h
  simpa only [intervalMask, List.mem_toFinset, Nat.mem_bitIndices] using Iff.of_eq hm

theorem mul_mod_injective_below (p s : ℕ) (hsp : Nat.Coprime s p)
    {a b : ℕ} (ha : a < p) (hb : b < p) (hab : s * a % p = s * b % p) : a = b := by
  have h : Nat.ModEq p (s * a) (s * b) := hab
  exact (h.cancel_left_of_coprime hsp.symm.gcd_eq_one).eq_of_lt_of_lt ha hb

theorem intervalMask_eq_sum (p s L U : ℕ) (hU : U < p)
    (hsp : Nat.Coprime s p) :
    intervalMask p s L U = ∑ r ∈ Finset.Icc L U, 2 ^ (s * r % p) := by
  unfold intervalMask intervalResidues
  apply Finset.sum_image
  intro a ha b hb hab
  exact mul_mod_injective_below p s hsp
    ((Finset.mem_Icc.mp ha).2.trans_lt hU)
    ((Finset.mem_Icc.mp hb).2.trans_lt hU) hab

theorem intervalResidues_subset_range (p s L U : ℕ) (hp : 0 < p) :
    intervalResidues p s L U ⊆ Finset.range p := by
  intro r hr
  obtain ⟨a, ha, rfl⟩ := Finset.mem_image.mp hr
  exact Finset.mem_range.mpr (Nat.mod_lt _ hp)

theorem zero_not_mem_intervalResidues (p s L U : ℕ) (hL : 1 ≤ L)
    (hLU : L ≤ U) (hU : U < p) (hsp : Nat.Coprime s p) :
    0 ∉ intervalResidues p s L U := by
  intro hz
  obtain ⟨a, ha, ha0⟩ := Finset.mem_image.mp hz
  have hp : 0 < p := by omega
  have ha' := Finset.mem_Icc.mp ha
  have heq : a = 0 := mul_mod_injective_below p s hsp (ha'.2.trans_lt hU) hp
    (by simpa using ha0)
  omega

theorem sum_range_two_pow (p : ℕ) :
    (∑ r ∈ Finset.range p, 2 ^ r) + 1 = 2 ^ p := by
  induction p with
  | zero => simp
  | succ p ih =>
    rw [Finset.sum_range_succ, pow_succ]
    omega

theorem intervalMask_lt_mersenne (p s L U : ℕ) (hL : 1 ≤ L)
    (hLU : L ≤ U) (hU : U < p) (hsp : Nat.Coprime s p) :
    intervalMask p s L U < 2 ^ p - 1 := by
  have hp : 0 < p := by omega
  have hzero := zero_not_mem_intervalResidues p s L U hL hLU hU hsp
  have hsub : insert 0 (intervalResidues p s L U) ⊆ Finset.range p := by
    intro r hr
    rcases Finset.mem_insert.mp hr with rfl | hr
    · exact Finset.mem_range.mpr hp
    · exact intervalResidues_subset_range p s L U hp hr
  have hsum : (∑ r ∈ insert 0 (intervalResidues p s L U), 2 ^ r) ≤
      ∑ r ∈ Finset.range p, 2 ^ r :=
    Finset.sum_le_sum_of_subset hsub
  rw [Finset.sum_insert hzero] at hsum
  have htotal := sum_range_two_pow p
  change 2 ^ 0 + intervalMask p s L U ≤ _ at hsum
  norm_num only [pow_zero] at hsum
  omega

theorem two_pow_mod_mersenne (p e : ℕ) :
    Nat.ModEq (2 ^ p - 1) (2 ^ e) (2 ^ (e % p)) := by
  have h : Nat.ModEq (2 ^ p - 1) (2 ^ e - 1)
      ((2 ^ e - 1) % (2 ^ p - 1)) := by
    simp [Nat.ModEq]
  rw [Nat.pow_sub_one_mod_pow_sub_one] at h
  have h' := h.add_right 1
  simpa only [Nat.sub_add_cancel (Nat.one_le_pow e 2 (by decide)),
    Nat.sub_add_cancel (Nat.one_le_pow (e % p) 2 (by decide))] using h'

theorem interval_geometric_sum (x L V : ℕ) (hx : 1 ≤ x) (hLV : L ≤ V) :
    (x - 1) * (∑ r ∈ Finset.Ico L V, x ^ r) + x ^ L = x ^ V := by
  induction V, hLV using Nat.le_induction with
  | base => simp
  | succ V hLV ih =>
    rw [Finset.sum_Ico_succ_top hLV, mul_add]
    calc
      (x - 1) * (∑ r ∈ Finset.Ico L V, x ^ r) + (x - 1) * x ^ V + x ^ L =
          ((x - 1) * (∑ r ∈ Finset.Ico L V, x ^ r) + x ^ L) +
            (x - 1) * x ^ V := by omega
      _ = x ^ V + (x - 1) * x ^ V := by rw [ih]
      _ = (1 + (x - 1)) * x ^ V := by ring
      _ = x * x ^ V := by rw [Nat.add_sub_of_le hx]
      _ = x ^ (V + 1) := by rw [pow_succ]; exact Nat.mul_comm _ _

theorem intervalMask_congruence (p s L U : ℕ) (hLU : L ≤ U) (hU : U < p)
    (hsp : Nat.Coprime s p) :
    Nat.ModEq (2 ^ p - 1)
      ((2 ^ s - 1) * intervalMask p s L U + 2 ^ ((s * L) % p))
      (2 ^ ((s * (U + 1)) % p)) := by
  have hsum (S : Finset ℕ) :
      Nat.ModEq (2 ^ p - 1) (∑ r ∈ S, 2 ^ (s * r))
        (∑ r ∈ S, 2 ^ ((s * r) % p)) := by
    induction S using Finset.induction_on with
    | empty => simp [Nat.ModEq]
    | @insert a S ha ih =>
      rw [Finset.sum_insert ha, Finset.sum_insert ha]
      exact (two_pow_mod_mersenne p (s * a)).add ih
  have hraw :
      (2 ^ s - 1) * (∑ r ∈ Finset.Icc L U, 2 ^ (s * r)) + 2 ^ (s * L) =
        2 ^ (s * (U + 1)) := by
    have h := interval_geometric_sum (2 ^ s) L (U + 1)
      (Nat.one_le_pow s 2 (by decide)) (by omega)
    simpa only [Finset.Ico_add_one_right_eq_Icc, ← pow_mul] using h
  have htotal := ((hsum (Finset.Icc L U)).mul_left (2 ^ s - 1)).add
    (two_pow_mod_mersenne p (s * L))
  rw [hraw, ← intervalMask_eq_sum p s L U hU hsp] at htotal
  exact htotal.symm.trans (two_pow_mod_mersenne p (s * (U + 1)))

theorem geometricMaskCheck_sound (p s L U G : ℕ) (hL : 1 ≤ L)
    (hLU : L ≤ U) (hU : U < p) (hsp : Nat.Coprime s p)
    (hcheck : geometricMaskCheck p s L U G = true) :
    G = intervalMask p s L U := by
  have hc : G < 2 ^ p - 1 ∧
      Nat.ModEq (2 ^ p - 1) ((2 ^ s - 1) * G + 2 ^ ((s * L) % p))
        (2 ^ ((s * (U + 1)) % p)) := by
    simpa only [geometricMaskCheck, Bool.and_eq_true, decide_eq_true_eq,
      Nat.ModEq] using hcheck
  have htrue := intervalMask_congruence p s L U hLU hU hsp
  have hboth := Nat.ModEq.add_right_cancel' (2 ^ ((s * L) % p))
    (hc.2.trans htrue.symm)
  have hgcd : Nat.gcd (2 ^ p - 1) (2 ^ s - 1) = 1 := by
    rw [Nat.pow_sub_one_gcd_pow_sub_one, hsp.symm.gcd_eq_one]
    norm_num
  exact (hboth.cancel_left_of_coprime hgcd).eq_of_lt_of_lt hc.1
    (intervalMask_lt_mersenne p s L U hL hLU hU hsp)

theorem inverse_mul_mod (p t s a : ℕ) (hts : t * s % p = 1) :
    t * (s * a % p) % p = a % p := by
  calc
    _ = t * (s * a) % p := by simp only [Nat.mul_mod, Nat.mod_mod]
    _ = (t * s) * a % p := by rw [Nat.mul_assoc]
    _ = a % p := by rw [Nat.mul_mod, hts]; simp

theorem mem_intervalResidues_iff (p t s L U r : ℕ) (hts : t * s % p = 1)
    (hU : U < p) (hr : r < p) :
    r ∈ intervalResidues p s L U ↔ L ≤ t * r % p ∧ t * r % p ≤ U := by
  constructor
  · intro hm
    obtain ⟨a, ha, rfl⟩ := Finset.mem_image.mp hm
    have ha' := Finset.mem_Icc.mp ha
    rw [inverse_mul_mod p t s a hts, Nat.mod_eq_of_lt (ha'.2.trans_lt hU)]
    exact ha'
  · intro hh
    apply Finset.mem_image.mpr
    refine ⟨t * r % p, Finset.mem_Icc.mpr hh, ?_⟩
    have hst : s * t % p = 1 := by simpa only [Nat.mul_comm] using hts
    rw [inverse_mul_mod p s t r hst, Nat.mod_eq_of_lt hr]

/-- A checked integer mask has precisely the intended good-residue bits. -/
theorem geometricMaskCheck_testBit (p t s L U G r : ℕ) (hL : 1 ≤ L)
    (hLU : L ≤ U) (hU : U < p) (hsp : Nat.Coprime s p)
    (hts : t * s % p = 1) (hr : r < p)
    (hcheck : geometricMaskCheck p s L U G = true) :
    G.testBit r = true ↔ L ≤ t * r % p ∧ t * r % p ≤ U := by
  rw [geometricMaskCheck_sound p s L U G hL hLU hU hsp hcheck,
    intervalMask_testBit]
  exact mem_intervalResidues_iff p t s L U r hts hU hr

end Loneliness.FiveSpeedCertificate
