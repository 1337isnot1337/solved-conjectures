module
public import Conjectures.WachsSingleColorLogConcavity
public import Conjectures.WachsTwoColorProduct
public import Conjectures.WachsThreeColorExample
public import Conjectures.WachsCompleteGraphRealZeros

@[expose] public section
namespace WachsCompleteGraph

open Polynomial WeightedCompletePartition

theorem realWeightedCharacteristic_above_degree (p k j : ℕ) (hj : k<j) :
    (realWeightedCharacteristic p k).coeff j = 0 := by
  obtain ⟨r,_,_,hr⟩ := laguerre_has_positive_factorization p
  rw [realWeightedCharacteristic,characteristic_eq_moment_polynomial p k r hr,
    Polynomial.finsetSum_coeff]
  apply Finset.sum_eq_zero
  intro i hi
  have h : i ≠ j := by have hh := Finset.mem_range.mp hi; omega
  simp [Polynomial.coeff_monomial,h]

theorem realWeightedCharacteristic_natDegree (p k : ℕ) :
    (realWeightedCharacteristic p k).natDegree = k := by
  apply le_antisymm
  · exact natDegree_le_iff_coeff_eq_zero.mpr (fun j hj => realWeightedCharacteristic_above_degree p k j hj)
  · apply le_natDegree_of_ne_zero
    intro h
    have hp := signedRankCoeff_positive p k k le_rfl
    rw [realWeightedCharacteristic,Polynomial.coeff_map] at h
    change (((characteristic (p+2) (k+1)).coeff k:ℤ):ℝ) = 0 at h
    rw [signedRankCoeff,h,mul_zero] at hp
    exact (lt_irrefl _ hp).elim

theorem shifted_color_signed_coefficients (p k : ℕ) :
    FinitePositiveLogConcave k (signedRankCoeff p k) := by
  refine ⟨fun j hj => signedRankCoeff_positive p k j hj,fun j hj => ?_,
    fun j hj => signedRankCoeff_strict_logConcave p k j hj⟩
  have hz := realWeightedCharacteristic_above_degree p k j hj
  rw [realWeightedCharacteristic,Polynomial.coeff_map] at hz
  change (((characteristic (p+2) (k+1)).coeff j:ℤ):ℝ) = 0 at hz
  rw [signedRankCoeff,hz,mul_zero]

/-- All positive numbers of equal colors satisfy the strict ordinary
coefficient log-concavity in the original rank convention. -/
theorem weighted_complete_graph_all_colors_signed_coefficients (r k : ℕ) (hr : 0<r) :
    FinitePositiveLogConcave k
      (fun j => (-1:ℝ)^j * (((characteristic r (k+1)).coeff j:ℤ):ℝ)) := by
  by_cases he : r=1
  · subst r
    exact single_color_signed_coefficients k
  · obtain ⟨p,rfl⟩ : ∃ p, r=p+2 := ⟨r-2,by omega⟩
    have hh : signedRankCoeff p k = (fun j => (-1:ℝ)^j * (((characteristic (p+2) (k+1)).coeff j:ℤ):ℝ)) := funext (fun _ => rfl)
    rw [← hh]
    exact shifted_color_signed_coefficients p k

theorem weighted_complete_graph_even_roots_multiset (p k : ℕ) (hk : Even k) :
    (realWeightedCharacteristic (p+1) k).roots = 0 := by
  classical
  let P := realWeightedCharacteristic (p+1) k
  have hp : P ≠ 0 := by
    intro h
    have he := weighted_complete_graph_even_no_real_roots p k hk 0
    change 0 < P.eval 0 at he
    rw [h,eval_zero] at he
    exact (lt_irrefl _ he).elim
  apply Multiset.eq_zero_iff_forall_notMem.mpr
  intro t ht
  have h := (Polynomial.mem_roots hp).mp ht
  exact (weighted_complete_graph_even_no_real_roots p k hk t).ne' h

theorem weighted_complete_graph_odd_roots_multiset (p k : ℕ) (hk : Even k) :
    ∃ t ∈ Set.Ioo 0 (((k+2:ℕ):ℝ)⁻¹),
      (realWeightedCharacteristic (p+1) (k+1)).roots = {t} := by
  classical
  obtain ⟨t,ht,hroot,hm,huniq⟩ := weighted_complete_graph_odd_one_simple_real_root p k hk
  let P := realWeightedCharacteristic (p+1) (k+1)
  have hp : P ≠ 0 := by
    intro h
    have hd := realWeightedCharacteristic_natDegree (p+1) (k+1)
    change P.natDegree = k+1 at hd
    rw [h,natDegree_zero] at hd
    omega
  have hrep : P.roots = Multiset.replicate P.roots.card t :=
    Multiset.eq_replicate_card.mpr (fun b hb => huniq b ((Polynomial.mem_roots hp).mp hb))
  have hc : P.roots.card = 1 := by
    have he : P.roots.count t = 1 := by rw [Polynomial.count_roots]; exact hm
    conv_lhs at he => rw [hrep,Multiset.count_replicate_self]
    exact he
  refine ⟨t,ht,?_⟩
  change P.roots = {t}
  rw [hrep,hc,Multiset.replicate_one]

/-- The remaining zeros cannot all be real for at least three
equal colors once the complete graph has at least three vertices. -/
theorem weighted_complete_graph_not_real_split (p k : ℕ) (hk : 2≤k) :
    ¬ (realWeightedCharacteristic (p+1) k).Splits := by
  intro h
  have hc := h.natDegree_eq_card_roots
  rw [realWeightedCharacteristic_natDegree] at hc
  obtain hE | hO := Nat.even_or_odd k
  · rw [weighted_complete_graph_even_roots_multiset p k hE,Multiset.card_zero] at hc
    omega
  · obtain ⟨j,rfl⟩ := hO
    have hE : Even (2*j) := ⟨j,by omega⟩
    obtain ⟨_,_,hr⟩ := weighted_complete_graph_odd_roots_multiset p (2*j) hE
    rw [hr,Multiset.card_singleton] at hc
    omega

end WachsCompleteGraph
