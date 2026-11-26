module
public import Conjectures.CyrusianKaplanExactCount
public import Mathlib.Data.Nat.Choose.Bounds
public import Mathlib.Data.Finset.Card
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

open Finset

private theorem box_power_le_factorial_mul_choose {q k n : ℕ} (h : q+k≤n+1) :
    q^k≤k.factorial*n.choose k := by
  rw [← Nat.descFactorial_eq_factorial_mul_choose]
  exact (Nat.pow_le_pow_left (by omega : q≤n+1-k) k).trans
    (n.pow_sub_le_descFactorial k)

/-- A full-dimensional sub-box without exceptional coincidences.
High gaps are confined close to g, while sufficiently large low
members have sums above the high box and leave differences below
the low box. Every such pair passes the actual closure tests. -/
theorem uniform_box_subset_admissible (g r : ℕ) (_hg : 0<g) :
    ((Finset.Ioc g (g+g/8)).powersetCard r ×ˢ
      (Finset.Ioc (3*g/4) (7*g/8)).powersetCard r) ⊆ admissibleEncodingPairs g r := by
  intro P hP
  rcases P with ⟨A,B⟩
  obtain ⟨⟨hA,hAC⟩,⟨hB,hBC⟩⟩ :=
    (Finset.mem_product.mp hP).imp (Finset.mem_powersetCard.mp) (Finset.mem_powersetCard.mp)
  apply (mem_admissibleEncodingPairs_iff g r A B).mpr
  refine ⟨⟨?_,hAC⟩,⟨?_,hBC⟩,?_,?_⟩
  · intro a ha
    have h := Finset.mem_Ioc.mp (hA ha)
    exact Finset.mem_Ioo.mpr ⟨h.1,by omega⟩
  · intro b hb
    have h := Finset.mem_Ioc.mp (hB hb)
    exact Finset.mem_Icc.mpr ⟨by omega,by omega⟩
  · intro b hb c hc
    have hb' := Finset.mem_Ioc.mp (hB hb)
    have hc' := Finset.mem_Ioc.mp (hB hc)
    exact Or.inr (Or.inr ⟨by omega,fun h =>
      have hi := Finset.mem_Ioc.mp (hA h)
      by omega⟩)
  · intro a ha b hb h
    have ha' := Finset.mem_Ioc.mp (hA ha)
    have hb' := Finset.mem_Ioc.mp (hB hb)
    rcases h with h0 | ⟨_,hMem⟩ | ⟨hOver,_⟩
    · omega
    · have hLow := Finset.mem_Ioc.mp (hB hMem)
      omega
    · omega

/-- A quantitative full-degree lower bound for the actual semigroup
count, independent of coefficient or regularity claims about
Ehrhart quasipolynomials. -/
theorem exact_ordinarization_count_scaled_power_lower (g r : ℕ)
    (hr : 1≤r) (hg : 32*r≤g) :
    g^(2*r) ≤ (32^(2*r)*(r.factorial*r.factorial)) *
      Nat.card (ExactOrdinarizationClass g r) := by
  let A := Finset.Ioc g (g+g/8)
  let B := Finset.Ioc (3*g/4) (7*g/8)
  let q := g/16
  have hiA : q+r≤A.card+1 := by
    unfold A q
    rw [Nat.card_Ioc]
    omega
  have hiB : q+r≤B.card+1 := by
    unfold B q
    rw [Nat.card_Ioc]
    omega
  have hA := box_power_le_factorial_mul_choose hiA
  have hB := box_power_le_factorial_mul_choose hiB
  have hChosen : A.card.choose r * B.card.choose r ≤ (admissibleEncodingPairs g r).card := by
    have h := Finset.card_le_card (uniform_box_subset_admissible g r (by omega))
    simpa only [A,B,Finset.card_product,Finset.card_powersetCard] using h
  have hQ : q^(2*r) ≤ (r.factorial*r.factorial)*(admissibleEncodingPairs g r).card := by
    calc
      _ = q^r*q^r := by rw [← pow_add,two_mul]
      _ ≤ (r.factorial*A.card.choose r)*(r.factorial*B.card.choose r) :=
        Nat.mul_le_mul hA hB
      _ = (r.factorial*r.factorial)*(A.card.choose r*B.card.choose r) := by ring
      _ ≤ _ := Nat.mul_le_mul_left _ hChosen
  have hgq : g≤32*q := by unfold q; omega
  rw [exact_ordinarization_count,mul_assoc]
  calc
    _ ≤ (32*q)^(2*r) := Nat.pow_le_pow_left hgq _
    _ = 32^(2*r)*q^(2*r) := mul_pow _ _ _
    _ ≤ _ := Nat.mul_le_mul_left _ hQ

end CyrusianKaplan
