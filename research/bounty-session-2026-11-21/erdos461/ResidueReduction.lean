import Mathlib.Data.Nat.Factorization.Basic
import Mathlib.Data.Nat.Prime.Factorial

/-!
Auxiliary arithmetic for Erdős 461, not a solution of its linear lower bound.
The predicates record equality of small-prime power-divisibility profiles.
The bridge to the platform's particular smooth-component definition and the
minimal product formula in the note are not formalized here. A larger explicit
factorial modulus is proved admissible.
-/
namespace Erdos461ResidueReduction

def SameSmallPrimePowers (t x y : ℕ) : Prop :=
  ∀ p k : ℕ, p.Prime → p < t → (p ^ k ∣ x ↔ p ^ k ∣ y)

/-- A modulus includes a sufficiently high power of every prime below `t`,
and has no other prime divisors. -/
def IsAdmissibleModulus (t L : ℕ) : Prop :=
  (∀ p : ℕ, p.Prime → p ∣ L → p < t) ∧
    ∀ p : ℕ, p.Prime → p < t → ∃ e : ℕ, t ≤ p ^ e ∧ p ^ e ∣ L

lemma pow_dvd_iff_of_gcd_eq {t L x y p e k : ℕ}
    (hxy : x < y) (hgap : y - x < t)
    (hlarge : t ≤ p ^ e) (hdiv : p ^ e ∣ L)
    (heq : x.gcd L = y.gcd L) : (p ^ k ∣ x ↔ p ^ k ∣ y) := by
  have transfer : ∀ d : ℕ, d ∣ L → (d ∣ x ↔ d ∣ y) := by
    intro d hd
    constructor
    · intro hx
      have hh : d ∣ y.gcd L := heq ▸ Nat.dvd_gcd hx hd
      exact hh.trans (Nat.gcd_dvd_left y L)
    · intro hy
      have hh : d ∣ x.gcd L := heq.symm ▸ Nat.dvd_gcd hy hd
      exact hh.trans (Nat.gcd_dvd_left x L)
  by_cases hke : k ≤ e
  · exact transfer (p ^ k) ((pow_dvd_pow p hke).trans hdiv)
  · have hek : e ≤ k := Nat.le_of_lt (Nat.lt_of_not_ge hke)
    have hnot : ¬p ^ e ∣ x := by
      intro hx
      have hy := (transfer (p ^ e) hdiv).mp hx
      have hdiff := Nat.dvd_sub hy hx
      have hle := Nat.le_of_dvd (Nat.sub_pos_of_lt hxy) hdiff
      exact (Nat.not_le_of_lt hgap) (hlarge.trans hle)
    constructor
    · intro hx
      exact False.elim (hnot ((pow_dvd_pow p hek).trans hx))
    · intro hy
      have hx := (transfer (p ^ e) hdiv).mpr ((pow_dvd_pow p hek).trans hy)
      exact False.elim (hnot hx)

lemma gcd_eq_of_same_small_prime_powers {t L x y : ℕ}
    (hsupport : ∀ p : ℕ, p.Prime → p ∣ L → p < t)
    (h : SameSmallPrimePowers t x y) : x.gcd L = y.gcd L := by
  have transfer : ∀ a b : ℕ, SameSmallPrimePowers t a b → a.gcd L ∣ b.gcd L := by
    intro a b hab
    apply (Nat.dvd_iff_prime_pow_dvd_dvd (b.gcd L) (a.gcd L)).mpr
    intro p k hp hpk
    have hL : p ^ k ∣ L := hpk.trans (Nat.gcd_dvd_right a L)
    have ha : p ^ k ∣ a := hpk.trans (Nat.gcd_dvd_left a L)
    by_cases hk : k = 0
    · subst k
      simp
    · have hpL : p ∣ L := by
        have hk' : 1 ≤ k := Nat.one_le_iff_ne_zero.mpr hk
        have hh : p ^ 1 ∣ p ^ k := pow_dvd_pow p hk'
        simpa using hh.trans hL
      exact Nat.dvd_gcd ((hab p k hp (hsupport p hp hpL)).mp ha) hL
  apply Nat.dvd_antisymm
  · exact transfer x y h
  · exact transfer y x (fun p k hp hpt => (h p k hp hpt).symm)

/-- Nearby positions have the same small-prime profile exactly when their
capped gcd values agree. -/
theorem same_small_prime_powers_iff_gcd_eq {t L x y : ℕ}
    (hL : IsAdmissibleModulus t L) (hxy : x < y) (hgap : y - x < t) :
    SameSmallPrimePowers t x y ↔ x.gcd L = y.gcd L := by
  constructor
  · exact gcd_eq_of_same_small_prime_powers hL.1
  · intro heq p k hp hpt
    obtain ⟨e, hlarge, hdiv⟩ := hL.2 p hp hpt
    exact pow_dvd_iff_of_gcd_eq hxy hgap hlarge hdiv heq

/-- Translating both nearby positions by an admissible modulus preserves
whether their small-prime divisibility profiles coincide. -/
theorem same_small_prime_powers_periodic {t L x y : ℕ}
    (hL : IsAdmissibleModulus t L) (hxy : x < y) (hgap : y - x < t) :
    SameSmallPrimePowers t (x + L) (y + L) ↔ SameSmallPrimePowers t x y := by
  rw [same_small_prime_powers_iff_gcd_eq hL (Nat.add_lt_add_right hxy L)
      (by simpa only [Nat.add_sub_add_right] using hgap), same_small_prime_powers_iff_gcd_eq hL hxy hgap]
  simp

/-- A nonminimal but simple explicit admissible modulus. -/
def factorialModulus (t : ℕ) : ℕ := ((t - 1).factorial) ^ t

theorem factorialModulus_admissible {t : ℕ} (ht : 0 < t) :
    IsAdmissibleModulus t (factorialModulus t) := by
  constructor
  · intro p hp hdiv
    have hpf : p ∣ (t - 1).factorial := hp.dvd_of_dvd_pow hdiv
    exact ((hp.dvd_factorial).mp hpf).trans_lt (Nat.sub_lt ht (by decide))
  · intro p hp hpt
    refine ⟨t, ?_, ?_⟩
    · exact (Nat.le_of_lt (show t < 2 ^ t from Nat.lt_two_pow_self)).trans
        (Nat.pow_le_pow_left hp.two_le t)
    · exact pow_dvd_pow_of_dvd
        (Nat.dvd_factorial hp.pos (Nat.le_pred_of_lt hpt)) t

/-- An explicit finite period exists for every positive interval length. -/
theorem explicit_small_prime_profile_period {t x y : ℕ}
    (ht : 0 < t) (hxy : x < y) (hgap : y - x < t) :
    SameSmallPrimePowers t (x + factorialModulus t) (y + factorialModulus t) ↔
      SameSmallPrimePowers t x y :=
  same_small_prime_powers_periodic (factorialModulus_admissible ht) hxy hgap

#print axioms factorialModulus_admissible
#print axioms explicit_small_prime_profile_period
#print axioms same_small_prime_powers_iff_gcd_eq
#print axioms same_small_prime_powers_periodic
end Erdos461ResidueReduction
