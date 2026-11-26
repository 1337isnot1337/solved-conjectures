module
public import Conjectures.CyrusianKaplanRayResidues
public import Mathlib.RingTheory.Polynomial.Pochhammer
public import Mathlib.Algebra.Polynomial.Degree.Lemmas
public import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith

@[expose] public section
namespace CyrusianKaplan

open Polynomial

/-- Polynomial encoding `choose (t+k) k` for the k+1 ray
stars-and-bars count. Its negative arguments in [-k,-1] give zero. -/
noncomputable def rayBinomialPolynomial (k : ℕ) : ℚ[X] :=
  (C ((k.factorial:ℚ)⁻¹) * descPochhammer ℚ k).comp (X+C (k:ℚ))

private theorem eval_unshifted_binomial_poly (k n : ℕ) :
    (C ((k.factorial:ℚ)⁻¹) * descPochhammer ℚ k).eval (n:ℚ) = (n.choose k : ℚ) := by
  rw [eval_mul,eval_C,descPochhammer_eval_eq_descFactorial,
    Nat.descFactorial_eq_factorial_mul_choose,Nat.cast_mul,← mul_assoc,
    inv_mul_cancel₀ (by exact_mod_cast Nat.factorial_ne_zero k),one_mul]

theorem rayBinomialPolynomial_eval_integral (k : ℕ) (t : ℤ) (ht : -(k:ℤ)≤t) :
    (rayBinomialPolynomial k).eval (t:ℚ) =
      if 0≤t then (((t.toNat+k).choose k : ℕ):ℚ) else 0 := by
  let n := (t+(k:ℤ)).toNat
  have hn : (n:ℤ)=t+(k:ℤ) := Int.toNat_of_nonneg (by omega)
  have hnq : (n:ℚ)=(t:ℚ)+(k:ℚ) := by exact_mod_cast hn
  rw [rayBinomialPolynomial,eval_comp,eval_add,eval_X,eval_C,← hnq,
    eval_unshifted_binomial_poly]
  split_ifs with hz
  · have h : n=t.toNat+k := by
      have hInt : (t.toNat:ℤ)=t := Int.toNat_of_nonneg hz
      omega
    rw [h]
  · have hnlt : n<k := by omega
    rw [Nat.choose_eq_zero_of_lt hnlt,Nat.cast_zero]

/-- The exact polynomial for a single numerator shift on the
matching period class. It is evaluated at genus, not at a
truncated natural quotient. -/
noncomputable def shiftedRayPolynomial (k p h : ℕ) : ℚ[X] :=
  (rayBinomialPolynomial k).comp (C ((p:ℚ)⁻¹)*(X-C (h:ℚ)))

theorem shiftedRayPolynomial_eval (k p h g : ℕ) (hp : 0<p) (hg : 0<g)
    (hh : h≤(k+1)*p) (hmod : g≡h [MOD p]) :
    (shiftedRayPolynomial k p h).eval (g:ℚ) =
      if h≤g then ((((g-h)/p+k).choose k : ℕ):ℚ) else 0 := by
  have hSh := positive_genus_shift_deficit_bound hg hh hmod
  simp only [Nat.add_sub_cancel] at hSh
  have hPos : (p:ℚ)≠0 := by exact_mod_cast hp.ne'
  have hD : (p:ℤ)∣(g:ℤ)-(h:ℤ) := (Nat.modEq_iff_dvd.mp hmod.symm)
  obtain ⟨t,ht⟩ := hD
  have htQ : (g:ℚ)-(h:ℚ)=(p:ℚ)*(t:ℚ) := by exact_mod_cast ht
  have htLower : -(k:ℤ)≤t := by
    by_contra! hn
    have hmul := mul_lt_mul_of_pos_left hn (show 0<(p:ℤ) by exact_mod_cast hp)
    have hhI : (h:ℤ)≤(g:ℤ)+(k:ℤ)*(p:ℤ) := by exact_mod_cast hSh
    nlinarith [ht,hmul,hhI]
  unfold shiftedRayPolynomial
  rw [eval_comp,eval_mul,eval_C,eval_sub,eval_X,eval_C,htQ,← mul_assoc,
    inv_mul_cancel₀ hPos,one_mul,rayBinomialPolynomial_eval_integral k t htLower]
  have htSign : 0≤t ↔ h≤g := by
    have hEq : 0≤(g:ℤ)-(h:ℤ) ↔ 0≤t := by
      rw [ht,mul_nonneg_iff_of_pos_left (show (0:ℤ)<(p:ℤ) by exact_mod_cast hp)]
    exact hEq.symm.trans (sub_nonneg.trans Int.ofNat_le)
  by_cases he : h≤g
  · have htN : (t.toNat:ℤ)=t := Int.toNat_of_nonneg (htSign.mpr he)
    have heq : g-h=p*t.toNat := by
      apply Int.ofNat_inj.mp
      rw [Int.ofNat_sub he,Int.natCast_mul,htN]
      exact ht
    rw [ite_eq_left (htSign.mpr he),ite_eq_left he,
      heq,Nat.mul_comm p t.toNat,Nat.mul_div_cancel _ hp]
  · have hneg : ¬0≤t := fun ht0 => he (htSign.mp ht0)
    simp [he,hneg]

end CyrusianKaplan
