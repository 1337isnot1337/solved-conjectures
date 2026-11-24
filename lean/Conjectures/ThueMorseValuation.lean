module

public import Conjectures.ThueMorseValuationCertificate

/-! Uniform transfer of the Thue–Morse valuation counterexamples. -/

@[expose] public section

namespace ThueMorseValuation

open Polynomial Finset

private theorem natDegree_truncProduct_lt (R : Type*) [CommRing R] (s : ℕ) :
    (truncProduct R s).natDegree < 2 ^ s := by
  induction s with
  | zero => simp [truncProduct]
  | succ s ih =>
    have hfactor : (1 - X ^ (2 ^ s) : R[X]).natDegree ≤ 2 ^ s := by
      refine (natDegree_sub_le _ _).trans (max_le ?_ (natDegree_X_pow_le _))
      simp
    rw [prefix_succ, pow_succ]
    apply lt_of_le_of_lt natDegree_mul_le
    omega

private theorem coeff_truncProduct_sign (s r : ℕ) (hr : r < 2 ^ s) :
    (truncProduct ℤ s).coeff r = 1 ∨ (truncProduct ℤ s).coeff r = -1 := by
  induction s generalizing r with
  | zero =>
    have : r = 0 := by simpa using hr
    simp [this, truncProduct]
  | succ s ih =>
    rw [prefix_succ, mul_sub, mul_one, coeff_sub, coeff_mul_X_pow']
    by_cases h : r < 2 ^ s
    · simpa [Nat.not_le.mpr h] using ih r h
    · have hle : 2 ^ s ≤ r := Nat.le_of_not_gt h
      have hzero := coeff_eq_zero_of_natDegree_lt ((natDegree_truncProduct_lt ℤ s).trans_le hle)
      rw [hzero, ite_eq_left hle, zero_sub]
      have hr' : r - 2 ^ s < 2 ^ s := by rw [pow_succ] at hr; omega
      rcases ih (r - 2 ^ s) hr' with hp | hm
      · right; rw [hp]
      · left; simp [hm]

private theorem cast_mod_two_frobenius (p : ℤ[X]) (s : ℕ) :
    C (2 : ℤ) ∣ p ^ (2 ^ s) - expand ℤ (2 ^ s) p := by
  let _ : Fact (Nat.Prime 2) := ⟨by decide⟩
  let f : ℤ →+* ZMod 2 := Int.castRingHom _
  have hf : iterateFrobenius (ZMod 2) 2 s = RingHom.id _ := by
    ext a
    rw [iterateFrobenius_def, RingHom.id_apply]
    induction s with
    | zero => simp
    | succ s ih => rw [pow_succ, pow_mul, ih, ZMod.pow_card]
  have he : (p ^ (2 ^ s)).map f = (expand ℤ (2 ^ s) p).map f := by
    rw [Polynomial.map_pow, map_expand, ← map_iterateFrobenius_expand 2 (p.map f) s, hf, map_id]
  rw [C_dvd_iff_dvd_coeff]
  intro n
  have hn := congrArg (fun q : (ZMod 2)[X] => q.coeff n) he
  simp only [coeff_map] at hn
  apply (ZMod.intCast_zmod_eq_zero_iff_dvd _ 2).mp
  rw [coeff_sub, Int.cast_sub, sub_eq_zero]
  exact hn

private theorem square_lift (a b : ℤ[X]) (j : ℕ) (h : C (2 ^ (j + 1) : ℤ) ∣ a - b) :
    C (2 ^ ((j + 1) + 1) : ℤ) ∣ a ^ 2 - b ^ 2 := by
  obtain ⟨q, hq⟩ := h
  refine ⟨q * (C (2 ^ j : ℤ) * q + b), ?_⟩
  calc
    a ^ 2 - b ^ 2 = (a - b) * ((a - b) + C 2 * b) := by simp; ring
    _ = C (2 ^ ((j + 1) + 1) : ℤ) * (q * (C (2 ^ j : ℤ) * q + b)) := by
      rw [hq]
      simp only [pow_succ (2 : ℤ), map_mul]
      ring

private theorem lift_frobenius (p : ℤ[X]) (s j : ℕ) :
    C (2 ^ (j + 1) : ℤ) ∣ p ^ (2 ^ s * 2 ^ j) - (expand ℤ (2 ^ s) p) ^ (2 ^ j) := by
  induction j with
  | zero => simpa using cast_mod_two_frobenius p s
  | succ j ih =>
    simpa only [pow_succ (2 : ℕ) j, ← mul_assoc, pow_mul _ _ 2] using square_lift _ _ j ih

private theorem coeff_mul_expand (R : Type*) [CommRing R]
    (a b : R[X]) (p u r : ℕ) (hp : 0 < p) (hr : r < p) (ha : a.natDegree < p) :
    (a * expand R p b).coeff (p * u + r) = a.coeff r * b.coeff u := by
  rw [coeff_mul, sum_eq_single (r, p * u)]
  · exact congrArg (a.coeff r * ·) (coeff_expand_mul' hp b u)
  · intro ⟨i, j⟩ hij hne
    have hsum : i + j = p * u + r := Finset.mem_antidiagonal.mp hij
    by_cases hi : p ≤ i
    · rw [coeff_eq_zero_of_natDegree_lt (ha.trans_le hi), zero_mul]
    · rw [coeff_expand hp]
      split_ifs with hd
      · obtain ⟨v, rfl⟩ := hd
        have hh := congrArg (· % p) hsum
        have hi' : i = r := by
          simpa [Nat.add_mod, Nat.mod_eq_of_lt (lt_of_not_ge hi), Nat.mod_eq_of_lt hr] using hh
        exact False.elim (hne (Prod.ext hi' (by omega)))
      · rw [mul_zero]
  · simp [add_comm]

/-- Splitting off the low binary digits transfers each base coefficient
modulo `2^12`, with a sign from the initial product. -/
theorem lifted_coeff (s u r : ℕ) (hr : r < 2 ^ s) :
    (t (2 ^ (s + 11) + 1) (2 ^ s * u + r) : ZMod 4096) =
      ((truncProduct ℤ s).coeff r : ZMod 4096) * (t 2049 u : ZMod 4096) := by
  let d := u
  have hu : u < 2 ^ d := Nat.lt_two_pow_self
  have hs : 0 < (2 : ℕ) ^ s := by positivity
  have hbound : 2 ^ s * u + r < 2 ^ (s + d) := by
    rw [pow_add]
    calc
      _ < 2 ^ s * u + 2 ^ s := Nat.add_lt_add_left hr _
      _ = 2 ^ s * (u + 1) := by rw [mul_add, mul_one]
      _ ≤ _ := Nat.mul_le_mul_left _ hu
  let f : ℤ →+* ZMod 4096 := Int.castRingHom _
  let p := truncProduct ℤ (s + d)
  let q := truncProduct ℤ d
  have hyp := lift_frobenius p s 11
  change C (4096 : ℤ) ∣ _ at hyp
  obtain ⟨w, hw⟩ := hyp
  have hzero : (p ^ (2 ^ s * 2 ^ 11) - (expand ℤ (2 ^ s) p) ^ (2 ^ 11)).map f = 0 := by
    rw [hw, Polynomial.map_mul, map_C, show f 4096 = 0 from (ZMod.intCast_zmod_eq_zero_iff_dvd 4096 4096).mpr (dvd_refl _), C_0, zero_mul]
  rw [Polynomial.map_sub, sub_eq_zero, Polynomial.map_pow, Polynomial.map_pow, map_expand] at hzero
  have he : p.map f ^ (2 ^ (s + 11)) = expand (ZMod 4096) (2 ^ s) (p.map f ^ 2048) := by
    rw [pow_add, hzero, ← map_pow]
    rfl
  have hsplit : p.map f = (truncProduct ℤ s).map f * expand (ZMod 4096) (2 ^ s) (q.map f) := by
    simp only [p, q, prefix_add, Polynomial.map_mul, map_expand]
  have hcoeff : (q.map f * p.map f ^ 2048).coeff u = (q.map f ^ 2049).coeff u := by
    rw [show q.map f ^ 2049 = q.map f * q.map f ^ 2048 by rw [pow_succ'], coeff_mul, coeff_mul]
    apply sum_congr rfl
    intro i hi
    have hu' : i.2 < 2 ^ d := by
      have hh := Finset.mem_antidiagonal.mp hi
      omega
    dsimp only [p, q]
    rw [map_truncProduct, map_truncProduct]
    rw [coeff_prefix_pow_stable _ _ _ _ _ hu' (by omega)]
  have hpdeg := natDegree_truncProduct_lt (ZMod 4096) s
  rw [cast_t_eq_coeff 4096 _ _ (s + d) hbound, cast_t_eq_coeff 4096 _ _ d hu]
  rw [← map_truncProduct_pow_mod, ← map_truncProduct_pow_mod, Polynomial.map_pow]
  change (p.map f ^ (2 ^ (s + 11) + 1)).coeff _ = _ * ((q ^ 2049).map f).coeff u
  rw [pow_succ', he]
  nth_rw 1 [hsplit]
  rw [mul_assoc, ← map_mul]
  rw [coeff_mul_expand _ _ _ _ _ _ hs hr (by rwa [map_truncProduct])]
  rw [hcoeff, Polynomial.map_pow, coeff_map]
  rfl

/-- For every `k ≥ 11`, the adjacent coefficients in the written witness
have valuations eleven and ten, respectively. -/
theorem uniform_witness (k : ℕ) (hk : 11 ≤ k) :
    let N := 25 * 2 ^ (k - 3)
    padicValInt 2 (t (2 ^ k + 1) (N - 1)) = 11 ∧
      padicValInt 2 (t (2 ^ k + 1) N) = 10 := by
  obtain ⟨s, rfl⟩ := Nat.exists_eq_add_of_le hk
  rw [Nat.add_comm 11 s]
  dsimp only
  have hN : 25 * 2 ^ (s + 11 - 3) = 2 ^ s * 6400 := by
    rw [show s + 11 - 3 = s + 8 by omega, pow_add]
    ring
  have hs : 0 < (2 : ℕ) ^ s := Nat.two_pow_pos s
  have hNsub : 2 ^ s * 6400 - 1 = 2 ^ s * 6399 + (2 ^ s - 1) := by
    rw [show (2 : ℕ) ^ s * 6400 = 2 ^ s * 6399 + 2 ^ s from Nat.mul_succ _ _]
    omega
  rw [hN, hNsub]
  have hminus := lifted_coeff s 6399 (2 ^ s - 1) (by omega)
  have hplus := lifted_coeff s 6400 0 hs
  rw [exponent2049_residues.1] at hminus
  rw [add_zero, exponent2049_residues.2] at hplus
  constructor
  · rcases coeff_truncProduct_sign s (2 ^ s - 1) (by omega) with h | h
    · apply valuation_of_residue _ 2048 4096 11 _ (by decide) (by decide) (by decide)
      simpa [h] using hminus
    · apply valuation_of_residue _ (-2048) 4096 11 _ (by decide) (by decide) (by decide)
      simpa [h] using hminus
  · rcases coeff_truncProduct_sign s 0 hs with h | h
    · apply valuation_of_residue _ 3072 4096 10 _ (by decide) (by decide) (by decide)
      simpa [h] using hplus
    · apply valuation_of_residue _ (-3072) 4096 10 _ (by decide) (by decide) (by decide)
      simpa [h] using hplus

/-- Block constancy fails at each exponent parameter `k ≥ 11`, with both
indices in the block with quotient three. -/
theorem not_blockValuation_of_ge_eleven (k : ℕ) (hk : 11 ≤ k) : ¬ BlockValuation k := by
  rintro ⟨_, _, _, hA⟩
  let p := 2 ^ (k - 3)
  have hp : 0 < p := Nat.two_pow_pos _
  have hpow : 2 ^ k = 8 * p := by
    conv_lhs => rw [show k = 3 + (k - 3) by omega, pow_add]
    rfl
  have h1 := hA 3 (p - 1) (by rw [hpow]; omega)
  have h2 := hA 3 p (by rw [hpow]; omega)
  have he := h1.trans h2.symm
  have hidx1 : 2 ^ k * 3 + (p - 1) = 25 * p - 1 := by rw [hpow]; omega
  have hidx2 : 2 ^ k * 3 + p = 25 * p := by rw [hpow]; omega
  rw [hidx1, hidx2] at he
  have hw := uniform_witness k hk
  change padicValInt 2 (t (2 ^ k + 1) (25 * p - 1)) = 11 ∧
    padicValInt 2 (t (2 ^ k + 1) (25 * p)) = 10 at hw
  rw [hw.1, hw.2] at he
  omega

end ThueMorseValuation
