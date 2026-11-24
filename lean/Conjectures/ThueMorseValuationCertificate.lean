module

public import Conjectures.ThueMorseValuationBasic
public import Mathlib.Algebra.Polynomial.Inductions

/-!
# Exact coefficient certificates by base expansion

The product of the nonnegative residue polynomials has coefficients uniformly
below the packing base. Evaluation at that base therefore encodes every
coefficient as one digit. The witnesses use ordinary kernel reduction.
-/

@[expose] public section

namespace ThueMorseValuation

open Polynomial Finset

private def residue (M i c : ℕ) : ℕ :=
  if i % 2 = 0 then c % M else (M - c % M) % M

private theorem residue_lt (M i c : ℕ) (hM : 0 < M) : residue M i c < M := by
  unfold residue
  split <;> exact Nat.mod_lt _ hM

private theorem cast_residue (M i c : ℕ) (hM : 0 < M) :
    (residue M i c : ZMod M) = (-1) ^ i * (c : ZMod M) := by
  have hi : i = 2 * (i / 2) + i % 2 := by omega
  have hp : (-1 : ZMod M) ^ 2 = 1 := by ring
  conv_rhs => rw [hi, pow_add, pow_mul, hp, one_pow, one_mul]
  unfold residue
  rcases (show i % 2 = 0 ∨ i % 2 = 1 by omega) with h | h
  · simp [h, ZMod.natCast_mod]
  · rw [ite_eq_right (by omega), ZMod.natCast_mod, Nat.cast_sub (Nat.mod_lt c hM).le]
    simp [h, ZMod.natCast_mod]

private noncomputable def residuePolynomial (M m terms : ℕ) : ℕ[X] :=
  ∑ i ∈ range terms, monomial i (residue M i (m.choose i))

private theorem coeff_residuePolynomial (M m terms i : ℕ) :
    (residuePolynomial M m terms).coeff i =
      if i < terms then residue M i (m.choose i) else 0 := by
  unfold residuePolynomial
  simp only [finsetSum_coeff, coeff_monomial]
  by_cases hi : i < terms
  · rw [sum_eq_single_of_mem i (mem_range.mpr hi)]
    · simp [hi]
    · intro j _ hj
      simp [hj]
  · rw [sum_eq_zero]
    · simp [hi]
    · intro j hj
      simp [show j ≠ i from fun he => hi (he ▸ mem_range.mp hj)]

private def packFactor (m M B : ℕ) : ℕ → ℕ → ℕ → ℕ → ℕ × ℕ
  | _, _, c, 0 => (0, c)
  | 0, i, c, _ + 1 => (residue M i c, c * (m - i) / (i + 1))
  | depth + 1, i, c, l + 1 =>
    let h := (l + 1) / 2
    let left := packFactor m M B depth i c h
    let right := packFactor m M B depth (i + h) left.2 (l + 1 - h)
    (left.1 + (right.1 <<< (B * h)), right.2)

private def packFactorTop (m M B l : ℕ) : ℕ :=
  (packFactor m M B (l.log2 + 1) 0 1 l).1

private theorem packFactor_eq (m M B depth i l : ℕ) (hl : l ≤ 2 ^ depth) :
    packFactor m M B depth i (m.choose i) l =
      ((∑ j ∈ range l, residue M (i + j) (m.choose (i + j)) * (2 ^ B) ^ j), m.choose (i + l)) := by
  induction depth generalizing i l with
  | zero =>
    have h : l ≤ 1 := hl
    obtain rfl | rfl : l = 0 ∨ l = 1 := by omega
    · simp [packFactor]
    · simp [packFactor, ← Nat.choose_succ_right_eq, Nat.mul_div_cancel _ (Nat.succ_pos _)]
  | succ depth ih =>
    cases l with
    | zero => simp [packFactor]
    | succ l =>
      let h := (l + 1) / 2
      let k := l + 1 - h
      have he : h + k = l + 1 := by dsimp [h, k]; omega
      have hh : h ≤ 2 ^ depth := by dsimp [h]; rw [pow_succ] at hl; omega
      have hk : k ≤ 2 ^ depth := by dsimp [k, h]; rw [pow_succ] at hl; omega
      rw [packFactor]
      change
        ((packFactor m M B depth i (m.choose i) h).1 +
          ((packFactor m M B depth (i + h) (packFactor m M B depth i (m.choose i) h).2 k).1 <<< (B * h)),
          (packFactor m M B depth (i + h) (packFactor m M B depth i (m.choose i) h).2 k).2) = _
      rw [ih _ _ hh]
      dsimp only
      rw [ih _ _ hk]
      simp only [Prod.mk.injEq, Nat.shiftLeft_eq]
      refine ⟨?_, by rw [Nat.add_assoc i h k, he]⟩
      rw [← he, sum_range_add, sum_mul, pow_mul]
      congr 1
      apply sum_congr rfl
      intro j _
      rw [add_assoc i h j, pow_add, mul_comm ((2 ^ B) ^ h) ((2 ^ B) ^ j), mul_assoc]

private theorem packFactorTop_eq (m M B l : ℕ) :
    packFactorTop m M B l = ∑ j ∈ range l, residue M j (m.choose j) * (2 ^ B) ^ j := by
  have he := congrArg Prod.fst
    (packFactor_eq m M B (l.log2 + 1) 0 l Nat.lt_log2_self.le)
  simpa [packFactorTop] using he

private def packProduct (M m B n : ℕ) : ℕ → ℕ
  | 0 => 1
  | d + 1 =>
    packProduct M m B n d * packFactorTop m M (B * 2 ^ d) (min (m + 1) (n / 2 ^ d + 1))

private noncomputable def residueProduct (M m n : ℕ) : ℕ → ℕ[X]
  | 0 => 1
  | d + 1 =>
    residueProduct M m n d *
      expand ℕ (2 ^ d) (residuePolynomial M m (min (m + 1) (n / 2 ^ d + 1)))

private theorem packProduct_eq (M m B n d : ℕ) :
    packProduct M m B n d = (residueProduct M m n d).eval (2 ^ B) := by
  induction d with
  | zero => simp [packProduct, residueProduct]
  | succ d ih =>
    rw [packProduct, residueProduct, eval_mul, ih, expand_eval, residuePolynomial, eval_finsetSum]
    simp only [eval_monomial]
    congr 1
    simpa only [pow_mul, mul_comm] using
      packFactorTop_eq m M (B * 2 ^ d) (min (m + 1) (n / 2 ^ d + 1))

private theorem eval_one_bound (M m n d : ℕ) (hM : 0 < M) :
    (residueProduct M m n d).eval 1 ≤ ((m + 1) * M) ^ d := by
  induction d with
  | zero => simp [residueProduct]
  | succ d ih =>
    rw [residueProduct, eval_mul, expand_eval, one_pow, residuePolynomial, eval_finsetSum, pow_succ]
    refine Nat.mul_le_mul ih ?_
    simp only [eval_monomial, one_pow, mul_one]
    calc
      _ ≤ ∑ _ ∈ range (min (m + 1) (n / 2 ^ d + 1)), M :=
        sum_le_sum fun i _ => (residue_lt M i _ hM).le
      _ ≤ _ := by simpa using Nat.mul_le_mul_right M (min_le_left (m + 1) (n / 2 ^ d + 1))

private theorem coeff_le_eval_one (p : ℕ[X]) (n : ℕ) : p.coeff n ≤ p.eval 1 := by
  rw [eval_eq_sum]
  simp only [one_pow, mul_one, Polynomial.sum]
  by_cases h : n ∈ p.support
  · exact single_le_sum (fun i _ => Nat.zero_le (p.coeff i)) h
  · rw [notMem_support_iff.mp h]; exact Nat.zero_le _

private theorem eval_eq_divX (p : ℕ[X]) (B : ℕ) : p.eval B = p.coeff 0 + B * p.divX.eval B := by
  conv_lhs => rw [← X_mul_divX_add p, eval_add, eval_mul, eval_X, eval_C, add_comm]

private theorem unpack (p : ℕ[X]) (B n : ℕ) (hB : 0 < B)
    (hcoeff : ∀ i, p.coeff i < B) : p.eval B / B ^ n % B = p.coeff n := by
  induction n generalizing p with
  | zero => simp [eval_eq_divX p B, Nat.mod_eq_of_lt (hcoeff 0)]
  | succ n ih =>
    rw [pow_succ', ← Nat.div_div_eq_div_mul, eval_eq_divX p B, Nat.add_mul_div_left _ _ hB,
      Nat.div_eq_of_lt (hcoeff 0), zero_add, ih p.divX (fun j => by simpa only [coeff_divX] using hcoeff (j + 1)),
      coeff_divX]

private def packedCoeff (M m d width bound n : ℕ) : ℕ :=
  (packProduct M m width bound d >>> (width * n)) % M

private theorem coeff_residue_factor (M m bound d i : ℕ) (hM : 0 < M) (hi : i ≤ bound) :
    (↑((expand ℕ (2 ^ d) (residuePolynomial M m (min (m + 1) (bound / 2 ^ d + 1)))).coeff i) : ZMod M) =
      ((1 - X ^ (2 ^ d) : (ZMod M)[X]) ^ m).coeff i := by
  have hp : 0 < (2 : ℕ) ^ d := by positivity
  have ht : ((1 - X ^ (2 ^ d) : (ZMod M)[X]) ^ m) = expand (ZMod M) (2 ^ d) ((1 - X) ^ m) := by simp
  rw [ht, coeff_expand hp, coeff_expand hp]
  split_ifs with hd
  · rw [coeff_residuePolynomial, coeff_factor]
    by_cases hc : i / 2 ^ d < m + 1
    · rw [ite_eq_left (lt_min hc (Nat.lt_succ_of_le (Nat.div_le_div_right hi))), cast_residue M _ _ hM]
    · rw [ite_eq_right (not_lt_of_ge ((Nat.le_of_not_gt hc).trans' (min_le_left _ _)))]
      simp [Nat.choose_eq_zero_of_lt (by omega : m < i / 2 ^ d)]
  · simp

private theorem cast_residueProduct_coeff (M m bound d n : ℕ) (hM : 0 < M) (hn : n ≤ bound) :
    ((residueProduct M m bound d).coeff n : ZMod M) = ((truncProduct (ZMod M) d) ^ m).coeff n := by
  induction d generalizing n with
  | zero => by_cases h : n = 0 <;> simp [residueProduct, truncProduct, coeff_one, h]
  | succ d ih =>
    rw [residueProduct, prefix_succ, mul_pow, coeff_mul, coeff_mul, Nat.cast_sum]
    apply sum_congr rfl
    intro ⟨i, j⟩ hij
    have hs : i + j = n := Finset.mem_antidiagonal.mp hij
    rw [Nat.cast_mul, ih i (by omega), coeff_residue_factor M m bound d j hM (by omega)]

private theorem packedCoeff_eq (M m d width bound n : ℕ) (hM : 0 < M)
    (hwidth : ((m + 1) * M) ^ d < 2 ^ width) (hdiv : M ∣ 2 ^ width) (hn : n ≤ bound) :
    (packedCoeff M m d width bound n : ZMod M) = ((truncProduct (ZMod M) d) ^ m).coeff n := by
  have hbound (i : ℕ) : (residueProduct M m bound d).coeff i < 2 ^ width :=
    (coeff_le_eval_one _ i).trans_lt ((eval_one_bound M m bound d hM).trans_lt hwidth)
  rw [packedCoeff, Nat.shiftRight_eq_div_pow, pow_mul, packProduct_eq]
  rw [← Nat.mod_mod_of_dvd _ hdiv, ZMod.natCast_mod,
    unpack _ _ _ (Nat.two_pow_pos width) hbound, cast_residueProduct_coeff M m bound d n hM hn]

set_option maxRecDepth 25000 in
set_option maxHeartbeats 0 in
private theorem packed_2049 :
    packedCoeff 4096 2049 13 313 6400 6399 = 2048 ∧
    packedCoeff 4096 2049 13 313 6400 6400 = 3072 := by decide +kernel

set_option exponentiation.threshold 350 in
/-- The two base residues used for the uniform family. -/
theorem exponent2049_residues : (t 2049 6399 : ZMod 4096) = 2048 ∧
    (t 2049 6400 : ZMod 4096) = 3072 := by
  constructor
  · rw [cast_t_eq_coeff _ _ _ 13 (by decide),
      ← packedCoeff_eq _ _ _ 313 6400 _ (by decide) (by decide) (by decide) (by decide), packed_2049.1]
    rfl
  · rw [cast_t_eq_coeff _ _ _ 13 (by decide),
      ← packedCoeff_eq _ _ _ 313 6400 _ (by decide) (by decide) (by decide) (by decide), packed_2049.2]
    rfl

/-- A residue modulo a multiple of `2^(v+1)` determines valuation `v`. -/
theorem valuation_of_residue (a b : ℤ) (M v : ℕ)
    (hmod : (a : ZMod M) = (b : ZMod M))
    (hM : (2 : ℤ) ^ (v + 1) ∣ (M : ℤ))
    (hdiv : (2 : ℤ) ^ v ∣ b) (hnot : ¬ (2 : ℤ) ^ (v + 1) ∣ b) :
    padicValInt 2 a = v := by
  have hsub := hM.trans ((ZMod.intCast_eq_intCast_iff_dvd_sub _ _ _).mp hmod)
  have hsmall : (2 : ℤ) ^ v ∣ (2 : ℤ) ^ (v + 1) := by rw [pow_succ]; exact dvd_mul_right _ _
  have ha : (2 : ℤ) ^ v ∣ a := by
    simpa using dvd_sub hdiv (hsmall.trans hsub)
  have hna : ¬ (2 : ℤ) ^ (v + 1) ∣ a := by
    intro h
    apply hnot
    simpa using dvd_add hsub h
  have ha0 : a ≠ 0 := fun h => hna (h ▸ dvd_zero _)
  have hge := ((padicValInt_dvd_iff_of_ne_one (by decide : (2 : ℕ) ≠ 1) v a).mp ha).resolve_left ha0
  have hlt : ¬ v + 1 ≤ padicValInt 2 a := fun h =>
    hna ((padicValInt_dvd_iff_of_ne_one (by decide : (2 : ℕ) ≠ 1) (v + 1) a).mpr (Or.inr h))
  omega

set_option maxRecDepth 25000 in
set_option maxHeartbeats 0 in
private theorem packed_17 :
    packedCoeff (2 ^ 20) 17 9 226 504 503 = 786432 ∧
    packedCoeff (2 ^ 20) 17 9 226 504 504 = 524288 := by decide +kernel

/-- The exponent-17 coefficients at indices 503 and 504 have different valuations. -/
theorem exponent17_witness :
    padicValInt 2 (t 17 503) = 18 ∧ padicValInt 2 (t 17 504) = 19 := by
  constructor
  · apply valuation_of_residue _ 786432 (2 ^ 20) 18
    · rw [cast_t_eq_coeff _ _ _ 9 (by decide), ← packedCoeff_eq _ _ _ 226 504 _ (by decide) (by decide) (by decide) (by decide),
        packed_17.1]
      rfl
    · decide
    · decide
    · decide
  · apply valuation_of_residue _ 524288 (2 ^ 20) 19
    · rw [cast_t_eq_coeff _ _ _ 9 (by decide), ← packedCoeff_eq _ _ _ 226 504 _ (by decide) (by decide) (by decide) (by decide),
        packed_17.2]
      rfl
    · decide
    · decide
    · decide

/-- The general clause of Conjecture 5.2 for a given exponent parameter. -/
def BlockValuation (k : ℕ) : Prop :=
  ∃ A : ℕ → ℕ, StrictMono A ∧ A 0 = 0 ∧
    ∀ n j : ℕ, j < 2 ^ k →
      padicValInt 2 (t (2 ^ k + 1) (2 ^ k * n + j)) = A (padicValNat 2 (n + 1))

/-- The general clause of Gawron–Miska–Ulas Conjecture 5.2 is false. -/
theorem not_conjecture52 : ¬ ∀ k : ℕ, 2 ≤ k → BlockValuation k := by
  intro h
  obtain ⟨_, _, _, hA⟩ := h 4 (by decide)
  have he := (hA 31 7 (by decide)).trans (hA 31 8 (by decide)).symm
  change padicValInt 2 (t 17 503) = padicValInt 2 (t 17 504) at he
  rw [exponent17_witness.1, exponent17_witness.2] at he
  omega

end ThueMorseValuation
