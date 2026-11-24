import Mathlib.Data.Nat.Digits.Lemmas
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Lean.Elab.Tactic.Omega

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

Binary arithmetic for Section 2 of the existing entry's `PROOF.md`
(Cinna Davis, repository commit a84f0efd3a7899a73c78019e48b3dfdf62e6a0d7).
The source conjecture is Conjecture 9.15 in Hartke, Stolee, West and Yancey,
*Extremal Graphs With a Given Number of Perfect Matchings*, author manuscript
dated 5 May 2011, printed page 21; the final article appeared in 2013.

These arithmetic lemmas alone do not formalize the graph conjecture. In
particular, no matching count, extremal constant, or graph construction is
assumed here. The reduction of a positive Mersenne multiple folds its high
and low binary blocks; subadditivity of binary weight makes this equivalent
to the cyclic-carry residue argument recorded in the entry.
-/

namespace HartkeMatchingExcess

/-- Number of ones in the ordinary binary expansion, with weight zero at zero. -/
def binaryWeight (n : ℕ) : ℕ := (Nat.digits 2 n).sum

/-- Length of the ordinary binary expansion, with length zero at zero. -/
def binaryLength (n : ℕ) : ℕ := (Nat.digits 2 n).length

@[simp] theorem binaryWeight_zero : binaryWeight 0 = 0 := by
  simp [binaryWeight]

@[simp] theorem binaryLength_zero : binaryLength 0 = 0 := by
  simp [binaryLength]

theorem binaryWeight_rec (n : ℕ) :
    binaryWeight n = n % 2 + binaryWeight (n / 2) := by
  by_cases hn : n = 0
  · simp [hn]
  · simp only [binaryWeight, Nat.digits_eq_cons_digits_div (by omega : 1 < 2) hn,
      List.sum_cons]

@[simp] theorem binaryWeight_double (n : ℕ) : binaryWeight (2 * n) = binaryWeight n := by
  rw [binaryWeight_rec (2 * n)]
  simp

@[simp] theorem binaryWeight_double_add_one (n : ℕ) :
    binaryWeight (2 * n + 1) = binaryWeight n + 1 := by
  rw [binaryWeight_rec (2 * n + 1)]
  simp [Nat.add_div, Nat.add_mod, Nat.add_comm]

@[simp] theorem binaryWeight_one : binaryWeight 1 = 1 := by
  simpa using binaryWeight_double_add_one 0

theorem binaryWeight_pos {n : ℕ} (hn : 0 < n) : 0 < binaryWeight n := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    rw [binaryWeight_rec]
    by_cases hq : n / 2 = 0
    · have := Nat.mod_add_div n 2
      omega
    · have hi := ih (n / 2) (Nat.div_lt_self hn (by omega)) (by omega)
      omega

theorem binaryWeight_succ_le (n : ℕ) : binaryWeight (n + 1) ≤ binaryWeight n + 1 := by
  induction n using Nat.binaryRec with
  | zero => simp
  | bit b n ih =>
    cases b with
    | false => simp
    | true =>
      rw [Nat.bit_true, show 2 * n + 1 + 1 = 2 * (n + 1) by omega,
        binaryWeight_double, binaryWeight_double_add_one]
      omega

theorem binaryWeight_add_le (a b : ℕ) :
    binaryWeight (a + b) ≤ binaryWeight a + binaryWeight b := by
  induction a using Nat.binaryRec generalizing b with
  | zero => simp
  | bit ba a ih =>
    induction b using Nat.binaryRec with
    | zero => simp
    | bit bb b _ =>
      have hi := ih b
      cases ba <;> cases bb
      · simpa only [Nat.bit_false, show 2 * a + 2 * b = 2 * (a + b) by omega,
          binaryWeight_double] using hi
      · simp only [Nat.bit_false, Nat.bit_true,
          show 2 * a + (2 * b + 1) = 2 * (a + b) + 1 by omega,
          binaryWeight_double_add_one, binaryWeight_double]
        omega
      · simp only [Nat.bit_false, Nat.bit_true,
          show 2 * a + 1 + 2 * b = 2 * (a + b) + 1 by omega,
          binaryWeight_double_add_one, binaryWeight_double]
        omega
      · simp only [Nat.bit_true,
          show 2 * a + 1 + (2 * b + 1) = 2 * (a + b + 1) by omega,
          binaryWeight_double, binaryWeight_double_add_one]
        have hs := binaryWeight_succ_le (a + b)
        omega

theorem binaryWeight_ofDigits (L : List ℕ) (hL : ∀ d ∈ L, d < 2) :
    binaryWeight (Nat.ofDigits 2 L) = L.sum := by
  exact Nat.sum_digits_ofDigits_eq_sum (by omega : 1 < 2) ⟨rfl, hL⟩

theorem binaryWeight_mod_pow_add_div_pow (n u : ℕ) :
    binaryWeight (n % 2 ^ u) + binaryWeight (n / 2 ^ u) = binaryWeight n := by
  rw [Nat.self_mod_pow_eq_ofDigits_take u n (by omega : 2 ≤ 2),
    Nat.self_div_pow_eq_ofDigits_drop u n (by omega : 2 ≤ 2)]
  rw [binaryWeight_ofDigits _ (fun d hd => Nat.digits_lt_base (by omega : 1 < 2)
      (List.mem_of_mem_take hd)),
    binaryWeight_ofDigits _ (fun d hd => Nat.digits_lt_base (by omega : 1 < 2)
      (List.mem_of_mem_drop hd))]
  simp [binaryWeight]

theorem binaryWeight_mersenne (u : ℕ) : binaryWeight (2 ^ u - 1) = u := by
  induction u with
  | zero => simp
  | succ u ih =>
    have hp : 0 < (2 : ℕ) ^ u := pow_pos (by omega) u
    have he : 2 ^ (u + 1) - 1 = 2 * (2 ^ u - 1) + 1 := by
      rw [pow_succ]
      omega
    rw [he, binaryWeight_double_add_one, ih]

theorem binaryLength_pos {n : ℕ} (hn : 0 < n) : 0 < binaryLength n := by
  exact List.length_pos_iff.mpr (Nat.digits_ne_nil_iff_ne_zero.mpr (by omega))

theorem binaryLength_le_iff (n u : ℕ) : binaryLength n ≤ u ↔ n < 2 ^ u :=
  Nat.digits_length_le_iff (by omega : 1 < 2) n

theorem binaryLength_double {n : ℕ} (hn : 0 < n) :
    binaryLength (2 * n) = binaryLength n + 1 := by
  unfold binaryLength
  rw [show 2 * n = 0 + 2 * n by omega,
    Nat.digits_add 2 (by omega) 0 n (by omega) (Or.inr (by omega))]
  rfl

theorem binaryLength_rec {n : ℕ} (hn : 0 < n) :
    binaryLength n = binaryLength (n / 2) + 1 := by
  unfold binaryLength
  rw [Nat.digits_eq_cons_digits_div (by omega : 1 < 2) (by omega)]
  rfl

/-- A positive multiple of a Mersenne number has at least `u` binary ones. -/
theorem mersenne_dvd_binaryWeight_le {u n : ℕ} (hu : 1 ≤ u) (hn : 0 < n)
    (hd : 2 ^ u - 1 ∣ n) : u ≤ binaryWeight n := by
  have hb : 2 ≤ (2 : ℕ) ^ u := by
    exact le_trans (by omega : 2 ≤ 2 ^ 1) (Nat.pow_le_pow_right (by omega) hu)
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases hsmall : n < 2 ^ u
    · have hm : 2 ^ u - 1 ≤ n := Nat.le_of_dvd hn hd
      have he : n = 2 ^ u - 1 := by omega
      simp [he, binaryWeight_mersenne]
    · let s := n % 2 ^ u + n / 2 ^ u
      have hmod := Nat.mod_lt n (by omega : 0 < (2 : ℕ) ^ u)
      have hdiv := Nat.mod_add_div n (2 ^ u)
      have hq : 0 < n / 2 ^ u := Nat.div_pos (by omega) (by omega)
      have hspos : 0 < s := by dsimp [s]; omega
      have hsn : s < n := by
        dsimp [s]
        nlinarith
      have he : n = (2 ^ u - 1) * (n / 2 ^ u) + s := by
        dsimp [s]
        have hpow : 2 ^ u = (2 ^ u - 1) + 1 := by omega
        nlinarith
      have hsd : 2 ^ u - 1 ∣ s := by
        apply Nat.dvd_of_mod_eq_zero
        have hz := Nat.mod_eq_zero_of_dvd hd
        rw [he, Nat.add_mod] at hz
        simpa using hz
      have hi := ih s hsn hspos hsd
      have hw := binaryWeight_add_le (n % 2 ^ u) (n / 2 ^ u)
      rw [binaryWeight_mod_pow_add_div_pow] at hw
      exact hi.trans hw

/-- The residue fact in the recorded proof, valid for every positive input. -/
theorem sparse_mersenne_not_dvd {u n : ℕ} (hu : 1 ≤ u) (hn : 0 < n)
    (hw : binaryWeight n < u) : ¬(2 ^ u - 1 ∣ n) := by
  intro hd
  exact (Nat.not_lt_of_ge (mersenne_dvd_binaryWeight_le hu hn hd)) hw

theorem sparse_mersenne_mod_pos {u n : ℕ} (hu : 1 ≤ u) (hn : 0 < n)
    (hw : binaryWeight n < u) : 0 < n % (2 ^ u - 1) := by
  apply Nat.pos_of_ne_zero
  intro hz
  exact sparse_mersenne_not_dvd hu hn hw (Nat.dvd_of_mod_eq_zero hz)

end HartkeMatchingExcess
