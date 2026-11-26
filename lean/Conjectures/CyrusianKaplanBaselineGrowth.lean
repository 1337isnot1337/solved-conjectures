module
public import Conjectures.CyrusianKaplanBaselineCount
public import Mathlib.Data.Nat.Choose.Bounds
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

open Finset
open scoped BigOperators

private theorem power_le_factorial_mul_choose {q k n : ℕ} (h : q+k≤n+1) :
    q^k≤k.factorial*n.choose k := by
  rw [← Nat.descFactorial_eq_factorial_mul_choose]
  exact (Nat.pow_le_pow_left (by omega : q≤n+1-k) k).trans
    (n.pow_sub_le_descFactorial k)

/-- A uniform lower bound of the full baseline degree, proved
from an explicit central window rather than from sample genera. -/
theorem baseline_power_lower (g r : ℕ) (hr : 1≤r) (hg : 16*r≤g) :
    (g/8)^(2*r)≤((r-1).factorial*r.factorial)*(baselinePairs g r).card := by
  let q := g/8
  let C := Finset.Icc (g/2+1) (3*g/4)
  let R := Finset.Ioc (g/2) g
  let F (t : ℕ) := (g-t).choose (r-1)*t.choose r
  let K := (r-1).factorial*r.factorial
  have hCR : C⊆R := by
    intro t ht
    have h := Finset.mem_Icc.mp ht
    exact Finset.mem_Ioc.mpr ⟨by omega,by omega⟩
  have hC : q≤C.card := by
    unfold q C
    rw [Nat.card_Icc]
    omega
  have hTerm (t : ℕ) (ht : t∈C) : q^(2*r-1)≤K*F t := by
    have hh := Finset.mem_Icc.mp ht
    have hL : q^(r-1)≤(r-1).factorial*(g-t).choose (r-1) :=
      power_le_factorial_mul_choose (by unfold q; omega)
    have hR : q^r≤r.factorial*t.choose r :=
      power_le_factorial_mul_choose (by unfold q; omega)
    calc
      _ = q^(r-1)*q^r := by rw [← pow_add,show r-1+r=2*r-1 by omega]
      _ ≤ ((r-1).factorial*(g-t).choose (r-1))*(r.factorial*t.choose r) :=
        Nat.mul_le_mul hL hR
      _ = _ := by unfold K F; ring
  rw [card_baselinePairs]
  change q^(2*r)≤K*∑ t∈R,F t
  rw [Finset.mul_sum]
  calc
    q^(2*r) = q*q^(2*r-1) := by rw [← pow_succ',show 2*r-1+1=2*r by omega]
    _ ≤ C.card*q^(2*r-1) := Nat.mul_le_mul_right _ hC
    _ = ∑ _t∈C,q^(2*r-1) := (Finset.sum_const_nat (fun _ _=>rfl)).symm
    _ ≤ ∑ t∈C,K*F t := Finset.sum_le_sum hTerm
    _ ≤ ∑ t∈R,K*F t := Finset.sum_le_sum_of_subset_of_nonneg hCR (fun _ _ _=>Nat.zero_le _)

/-- An integer denominator version of the constant-times g^(2r)
lower bound in the written proof. -/
theorem baseline_scaled_power_lower (g r : ℕ) (hr : 1≤r) (hg : 16*r≤g) :
    g^(2*r)≤(16^(2*r)*((r-1).factorial*r.factorial))*(baselinePairs g r).card := by
  have hg8 : g≤16*(g/8) := by omega
  calc
    _ ≤ (16*(g/8))^(2*r) := Nat.pow_le_pow_left hg8 _
    _ = 16^(2*r)*(g/8)^(2*r) := mul_pow _ _ _
    _ ≤ 16^(2*r)*(((r-1).factorial*r.factorial)*(baselinePairs g r).card) :=
      Nat.mul_le_mul_left _ (baseline_power_lower g r hr hg)
    _ = _ := by simp only [mul_assoc]

/-- Uniform lower bound for each of the two Pascal increment sums
(and for the baseline itself), with explicit factorial denominator. -/
theorem choose_product_sum_scaled_power_lower (g r k l : ℕ)
    (hr : 1 ≤ r) (hg : 16*r ≤ g) (hk : k ≤ r) (hl : l ≤ r) :
    g^(k+l+1) ≤ (16^(k+l+1)*(k.factorial*l.factorial)) *
      (∑ t ∈ Finset.Ioc (g/2) g,(g-t).choose k*t.choose l) := by
  let q := g/8
  let C := Finset.Icc (g/2+1) (3*g/4)
  let R := Finset.Ioc (g/2) g
  let F (t : ℕ) := (g-t).choose k*t.choose l
  let K := k.factorial*l.factorial
  have hCR : C ⊆ R := by
    intro t ht
    have hh := Finset.mem_Icc.mp ht
    exact Finset.mem_Ioc.mpr ⟨by omega,by omega⟩
  have hC : q ≤ C.card := by
    unfold q C
    rw [Nat.card_Icc]
    omega
  have hTerm (t : ℕ) (ht : t ∈ C) : q^(k+l) ≤ K*F t := by
    have hh := Finset.mem_Icc.mp ht
    have hL : q^k ≤ k.factorial*(g-t).choose k :=
      power_le_factorial_mul_choose (by unfold q; omega)
    have hR : q^l ≤ l.factorial*t.choose l :=
      power_le_factorial_mul_choose (by unfold q; omega)
    calc
      _ = q^k*q^l := pow_add _ _ _
      _ ≤ (k.factorial*(g-t).choose k)*(l.factorial*t.choose l) := Nat.mul_le_mul hL hR
      _ = _ := by unfold K F; ring
  have hInner : q^(k+l+1) ≤ K * ∑ t∈R,F t := by
    rw [Finset.mul_sum]
    calc
      _ = q*q^(k+l) := pow_succ' _ _
      _ ≤ C.card*q^(k+l) := Nat.mul_le_mul_right _ hC
      _ = ∑ _t∈C,q^(k+l) := (Finset.sum_const_nat (fun _ _=>rfl)).symm
      _ ≤ ∑ t∈C,K*F t := Finset.sum_le_sum hTerm
      _ ≤ ∑ t∈R,K*F t :=
        Finset.sum_le_sum_of_subset_of_nonneg hCR (fun _ _ _=>Nat.zero_le _)
  have hgq : g ≤ 16*q := by unfold q; omega
  change g^(k+l+1) ≤ (16^(k+l+1)*K)*(∑ t∈R,F t)
  rw [mul_assoc]
  calc
    _ ≤ (16*q)^(k+l+1) := Nat.pow_le_pow_left hgq _
    _ = 16^(k+l+1)*q^(k+l+1) := mul_pow _ _ _
    _ ≤ _ := Nat.mul_le_mul_left _ hInner

end CyrusianKaplan
