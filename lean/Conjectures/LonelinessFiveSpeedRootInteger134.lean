import Conjectures.LonelinessFiveSpeedRootIntegerPhases
import Conjectures.LonelinessFiveSpeedRootIntegerAvoidance
import Conjectures.LonelinessFiveSpeedRootSemantics
import Conjectures.LonelinessFiveSpeedTriplePermutation

/-! A folded modular 1:3:4 triple yields an actual short relation. When that
relation is unique, the six extra factors force an actual positive 1:3:4
triple. The prime lower bound excludes all folded coordinate degeneracies. -/

namespace Loneliness.FiveSpeedRoot

open Matrix
open scoped BigOperators
open Loneliness.Modular
open Loneliness.FiveSpeedCertificate

theorem prime_not_dvd_small_int_mul (p : ℕ) (hp : p.Prime) (c : ℤ) (a : ℕ)
    (hc : 0 < c.natAbs) (hsmall : c.natAbs < p) (havoid : ¬p ∣ a) :
    ¬(p : ℤ) ∣ c * (a : ℤ) := by
  intro hdiv
  have hn : p ∣ c.natAbs * a := by
    simpa only [Int.natAbs_mul, Int.natAbs_natCast] using Int.natCast_dvd.mp hdiv
  rcases hp.dvd_mul.mp hn with hleft | hright
  · exact (not_le_of_gt hsmall) (Nat.le_of_dvd hc hleft)
  · exact havoid hright

theorem folded_multiples_ne (p : ℕ) (hp : p.Prime) (m n a : ℕ)
    (hmn : m ≠ n) (hsmall : m + n < p) (havoid : ¬p ∣ a) :
    folded p (m * a) ≠ folded p (n * a) := by
  intro hfold
  rcases folded_eq_signed_dvd p (m * a) (n * a) hp.pos hfold with hd | hd
  · have hc : 0 < ((m : ℤ) - (n : ℤ)).natAbs := by
      apply Nat.pos_of_ne_zero
      intro hz
      apply hmn
      exact_mod_cast (sub_eq_zero.mp (Int.natAbs_eq_zero.mp hz))
    have hb : ((m : ℤ) - (n : ℤ)).natAbs < p := by
      have hle : ((m : ℤ) - (n : ℤ)).natAbs ≤ m + n := by
        simpa only [Int.natAbs_natCast] using Int.natAbs_sub_le (m : ℤ) (n : ℤ)
      exact hle.trans_lt hsmall
    apply prime_not_dvd_small_int_mul p hp ((m : ℤ) - (n : ℤ)) a hc hb havoid
    have heq : ((m : ℤ) - (n : ℤ)) * (a : ℤ) =
        ((m * a : ℕ) : ℤ) - ((n * a : ℕ) : ℤ) := by
      rw [Nat.cast_mul, Nat.cast_mul]
      ring
    rw [heq]
    exact hd
  · have habs : ((m : ℤ) + (n : ℤ)).natAbs = m + n := by
      rw [← Nat.cast_add, Int.natAbs_natCast]
    have hc : 0 < ((m : ℤ) + (n : ℤ)).natAbs := by rw [habs]; omega
    have hb : ((m : ℤ) + (n : ℤ)).natAbs < p := by rw [habs]; exact hsmall
    apply prime_not_dvd_small_int_mul p hp ((m : ℤ) + (n : ℤ)) a hc hb havoid
    have heq : ((m : ℤ) + (n : ℤ)) * (a : ℤ) =
        ((m * a : ℕ) : ℤ) + ((n * a : ℕ) : ℤ) := by
      rw [Nat.cast_mul, Nat.cast_mul]
      ring
    rw [heq]
    exact hd

structure FoldedPhaseData (p : ℕ) (v : Speeds) where
  row : Row
  phase : Row
  scale : ℤ
  shape : ShortShape row
  zero : row ⬝ᵥ phase = 0
  code : ∀ i, row i ≠ 0 → ∃ a : Fin 6, phase i = phaseValues a
  point : ∀ i, row i ≠ 0 → (v i : ℤ) ≡ phase i * scale [ZMOD (p : ℤ)]

theorem folded134_phase_data (p : ℕ) (hp : p.Prime) (hlarge : 7 < p)
    (v : Speeds) (havoid : ∀ i, ¬(p : ℤ) ∣ (v i : ℤ))
    (h134 : Folded134 p v) : Nonempty (FoldedPhaseData p v) := by
  obtain ⟨A, hA, h3, h4⟩ := h134
  obtain ⟨l, hl⟩ := (mem_foldedCoordinates p v _).mp hA
  obtain ⟨m, hm⟩ := (mem_foldedCoordinates p v _).mp h3
  obtain ⟨n, hn⟩ := (mem_foldedCoordinates p v _).mp h4
  have hAavoid : ¬p ∣ A := by
    intro hdiv
    have hfoldA : folded p A = 0 :=
      (folded_eq_zero_iff hp.pos).mpr (Nat.mod_eq_zero_of_dvd hdiv)
    have hdivv : p ∣ v l :=
      Nat.dvd_of_mod_eq_zero ((folded_eq_zero_iff hp.pos).mp (hl.trans hfoldA))
    apply havoid l
    exact_mod_cast hdivv
  have h13 : folded p A ≠ folded p (3 * A) := by
    simpa only [one_mul] using
      folded_multiples_ne p hp 1 3 A (by decide) (by omega) hAavoid
  have h14 : folded p A ≠ folded p (4 * A) := by
    simpa only [one_mul] using
      folded_multiples_ne p hp 1 4 A (by decide) (by omega) hAavoid
  have h34 : folded p (3 * A) ≠ folded p (4 * A) :=
    folded_multiples_ne p hp 3 4 A (by decide) (by omega) hAavoid
  have hlm : l ≠ m := by
    intro h
    exact h13 (hl.symm.trans ((congrArg (fun t => folded p (v t)) h).trans hm))
  have hln : l ≠ n := by
    intro h
    exact h14 (hl.symm.trans ((congrArg (fun t => folded p (v t)) h).trans hn))
  have hmn : m ≠ n := by
    intro h
    exact h34 (hm.symm.trans ((congrArg (fun t => folded p (v t)) h).trans hn))
  obtain ⟨α, hα⟩ := folded_eq_modEq_phaseSign p (v l) A hp.pos hl
  obtain ⟨β, hβ⟩ := folded_eq_modEq_phaseSign p (v m) (3 * A) hp.pos hm
  obtain ⟨γ, hγ⟩ := folded_eq_modEq_phaseSign p (v n) (4 * A) hp.pos hn
  let r := signed134Row l m n α β γ
  let φ := signed134Phase l m n α β γ
  have hφl : φ l = phaseSign α := by
    simp [φ, signed134Phase, hlm, hln]
  have hφm : φ m = 3 * phaseSign β := by
    simp [φ, signed134Phase, hmn, Ne.symm hlm]
  have hφn : φ n = 4 * phaseSign γ := by
    simp [φ, signed134Phase, Ne.symm hln, Ne.symm hmn]
  refine ⟨{
    row := r
    phase := φ
    scale := (A : ℤ)
    shape := signed134Row_shape l m n hlm hln hmn α β γ
    zero := signed134Row_dot_phase l m n hlm hln hmn α β γ
    code := ?_
    point := ?_ }⟩
  · intro t ht
    exact (signed134Row_support_phase l m n hlm hln hmn α β γ t ht).2
  · intro t ht
    rcases (signed134Row_support_phase l m n hlm hln hmn α β γ t ht).1 with h | h | h
    · subst t
      simpa only [hφl] using hα
    · subst t
      rw [hφm]
      simpa only [Nat.cast_mul, Nat.cast_ofNat, mul_assoc, mul_left_comm] using hβ
    · subst t
      rw [hφn]
      simpa only [Nat.cast_mul, Nat.cast_ofNat, mul_assoc, mul_left_comm] using hγ

theorem phaseData_short_form (p : ℕ) (v : Speeds) (d : FoldedPhaseData p v) :
    ∃ a : Fin 80, (formRows a = d.row ∨ formRows a = -d.row) ∧
      (p : ℤ) ∣ dot (formRows a) v := by
  obtain ⟨a, ha⟩ := short_form_exists_eq_or_neg d.row d.shape
  have hdiv := dot_dvd_of_phase p v d.row d.phase d.scale d.point d.zero
  refine ⟨a, ha, ?_⟩
  rcases ha with he | he <;> simpa only [he, dot_neg, Int.dvd_neg] using hdiv

theorem folded134_gives_short_zero (p : ℕ) (hp : p.Prime) (hlarge : 7 < p)
    (v : Speeds) (havoid : ∀ i, ¬(p : ℤ) ∣ (v i : ℤ))
    (hforms : ∀ a : Fin 80, (p : ℤ) ∣ dot (formRows a) v → dot (formRows a) v = 0)
    (h134 : Folded134 p v) : ∃ a : Fin 80, dot (formRows a) v = 0 := by
  obtain ⟨d⟩ := folded134_phase_data p hp hlarge v havoid h134
  obtain ⟨a, _, hdiv⟩ := phaseData_short_form p v d
  exact ⟨a, hforms a hdiv⟩

theorem phaseData_unique_additive (p : ℕ) (v : Speeds) (d : FoldedPhaseData p v)
    (a₀ : Fin 80) (i j k : Fin 5) (hpos : ∀ t, 0 < v t)
    (hik : i ≠ k) (hjk : j ≠ k) (hadd : v i + v j = v k)
    (hrow : formRows a₀ = additiveRelation i j k ∨
      formRows a₀ = -additiveRelation i j k)
    (hforms : ∀ a : Fin 80, (p : ℤ) ∣ dot (formRows a) v → dot (formRows a) v = 0)
    (hunique : ∀ a : Fin 80, dot (formRows a) v = 0 → a = a₀)
    (hextra : ∀ e : Fin 6, (p : ℤ) ∣ tripleExtraFactors (v i) (v j) e →
      tripleExtraFactors (v i) (v j) e = 0) :
    i ≠ j ∧ ∃ π : Equiv.Perm (Fin 5),
      special134Relations *ᵥ (fun t => (v (π t) : ℤ)) = 0 := by
  obtain ⟨a, ha, hdiv⟩ := phaseData_short_form p v d
  have heq : a = a₀ := hunique a (hforms a hdiv)
  have hcan : formRows a₀ = d.row ∨ formRows a₀ = -d.row := by
    simpa only [heq] using ha
  have htransfer (t : Fin 5) (ht : additiveRelation i j k t ≠ 0) : d.row t ≠ 0 :=
    (row_nonzero_iff_of_eq_or_neg (formRows a₀) d.row hcan t).mp
      ((row_nonzero_iff_of_eq_or_neg (formRows a₀) (additiveRelation i j k) hrow t).mpr ht)
  have hs := additiveRelation_selected_nonzero i j k hik hjk
  have hri := htransfer i hs.1
  have hrj := htransfer j hs.2.1
  have hrk := htransfer k hs.2.2
  obtain ⟨ci, hci⟩ := d.code i hri
  obtain ⟨cj, hcj⟩ := d.code j hrj
  obtain ⟨ck, hck⟩ := d.code k hrk
  have hrowzero : formRows a₀ ⬝ᵥ d.phase = 0 :=
    (row_dot_zero_iff_of_eq_or_neg (formRows a₀) d.row d.phase hcan).mpr d.zero
  have haddzero : additiveRelation i j k ⬝ᵥ d.phase = 0 :=
    (row_dot_zero_iff_of_eq_or_neg (formRows a₀) (additiveRelation i j k) d.phase hrow).mp hrowzero
  have hsum : d.phase i + d.phase j = d.phase k := by
    simpa only [additiveRelation_dotProduct, sub_eq_zero] using haddzero
  rw [hci, hcj, hck] at hsum
  obtain ⟨hne, e, hcoeff⟩ := phase_additive_codes ci cj ck hsum
  have hij : i ≠ j := by
    intro h
    exact hne (hci.symm.trans ((congrArg d.phase h).trans hcj))
  have hcoeff' : tripleExtraCoefficients e 0 * d.phase i +
      tripleExtraCoefficients e 1 * d.phase j = 0 := by
    rw [hci, hcj]
    exact hcoeff
  have hdextra := extraFactor_dvd_of_phases p (v i) (v j) d.scale
    (d.phase i) (d.phase j) e (d.point i hri) (d.point j hrj) hcoeff'
  have hzero := hextra e hdextra
  rcases tripleExtraFactors_zero_gives_134 (v i) (v j) (v k)
    (hpos i) (hpos j) hadd ⟨e, hzero⟩ with ⟨hj, hk⟩ | ⟨hi, hk⟩
  · exact ⟨hij, special134_of_positive_triple v i j k (v i) (hpos i) rfl hj hk⟩
  · exact ⟨hij, special134_of_positive_triple v j i k (v j) (hpos j) rfl hi hk⟩

theorem folded134_unique_additive (p : ℕ) (hp : p.Prime) (hlarge : 7 < p)
    (v : Speeds) (havoid : ∀ i, ¬(p : ℤ) ∣ (v i : ℤ))
    (a₀ : Fin 80) (i j k : Fin 5) (hpos : ∀ t, 0 < v t)
    (hik : i ≠ k) (hjk : j ≠ k) (hadd : v i + v j = v k)
    (hrow : formRows a₀ = additiveRelation i j k ∨
      formRows a₀ = -additiveRelation i j k)
    (hforms : ∀ a : Fin 80, (p : ℤ) ∣ dot (formRows a) v → dot (formRows a) v = 0)
    (hunique : ∀ a : Fin 80, dot (formRows a) v = 0 → a = a₀)
    (hextra : ∀ e : Fin 6, (p : ℤ) ∣ tripleExtraFactors (v i) (v j) e →
      tripleExtraFactors (v i) (v j) e = 0)
    (h134 : Folded134 p v) :
    i ≠ j ∧ ∃ π : Equiv.Perm (Fin 5),
      special134Relations *ᵥ (fun t => (v (π t) : ℤ)) = 0 := by
  obtain ⟨d⟩ := folded134_phase_data p hp hlarge v havoid h134
  exact phaseData_unique_additive p v d a₀ i j k hpos hik hjk hadd hrow hforms hunique hextra

end Loneliness.FiveSpeedRoot
