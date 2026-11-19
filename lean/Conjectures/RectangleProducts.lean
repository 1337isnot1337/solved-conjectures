import Conjectures.RectangleCounting
import Conjectures.RectangleEuler
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.Ring.GeomSum
import Mathlib.Algebra.Order.BigOperators.GroupWithZero.Finset
import Mathlib.Order.Interval.Finset.Nat

/-! The exact finite counting bridge to rectangle Euler products. All
multisets are encoded by their bounded multiplicity vectors; no analytic
coefficient estimate is assumed. -/

namespace RectanglePartitions

open Finset

noncomputable def logTypeProduct (types : Finset BlockType) (t : ℝ) : ℝ :=
  ∑ b ∈ types, -Real.log (1-Real.exp (-(blockArea b : ℝ)*t))

def unorderedTypes (N : ℕ) : Finset BlockType :=
  (Icc 1 N ×ˢ Icc 1 N).filter (fun b => b.1 ≤ b.2)

def orderedTypes (h N : ℕ) : Finset BlockType := Icc 1 h ×ˢ Icc 1 N

noncomputable def unorderedLogProduct (N : ℕ) (t : ℝ) : ℝ :=
  logTypeProduct (unorderedTypes N) t

noncomputable def orderedLogProduct (h N : ℕ) (t : ℝ) : ℝ :=
  logTypeProduct (orderedTypes h N) t

def typeCounts (types : Finset BlockType) (N : ℕ) (blocks : Multiset BlockType) :
    types → Fin (N+1) :=
  fun b => ⟨min (blocks.count b.val) N,by have := min_le_right (blocks.count b.val) N; omega⟩

theorem typeCounts_val {types : Finset BlockType} {N : ℕ} {blocks : Multiset BlockType}
    (hc : blocks.card ≤ N) (b : types) : (typeCounts types N blocks b).val=blocks.count b.val := by
  exact min_eq_left ((Multiset.count_le_card _ _).trans hc)

theorem typeCounts_injective_on (types : Finset BlockType) (N : ℕ)
    {S : Finset (Multiset BlockType)}
    (hc : ∀ blocks ∈ S, blocks.card ≤ N)
    (hs : ∀ blocks ∈ S, ∀ b ∈ blocks, b ∈ types) :
    Set.InjOn (typeCounts types N) (↑S : Set (Multiset BlockType)) := by
  intro blocks hb other ho he
  apply Multiset.ext.mpr
  intro b
  by_cases hbt : b ∈ types
  · have hh := congrArg (fun f : types → Fin (N+1) => (f ⟨b,hbt⟩).val) he
    simpa only [typeCounts_val (hc blocks hb),typeCounts_val (hc other ho)] using hh
  · rw [Multiset.count_eq_zero_of_notMem (fun hh => hbt (hs blocks hb b hh)),
      Multiset.count_eq_zero_of_notMem (fun hh => hbt (hs other ho b hh))]

theorem multiset_exp_weight (blocks : Multiset BlockType) (t : ℝ) :
    (blocks.map (fun b => Real.exp (-(blockArea b : ℝ)*t))).prod =
      Real.exp (-(totalArea blocks : ℝ)*t) := by
  induction blocks using Multiset.induction with
  | empty => simp [totalArea]
  | cons b blocks ih =>
    simp only [Multiset.map_cons,Multiset.prod_cons,ih,totalArea,Multiset.sum_cons,Nat.cast_add]
    rw [← Real.exp_add]
    congr 1
    ring

theorem typeCounts_weight (types : Finset BlockType) (N : ℕ)
    (blocks : Multiset BlockType) (hc : blocks.card ≤ N)
    (hs : ∀ b ∈ blocks, b ∈ types) (ha : totalArea blocks=N) (t : ℝ) :
    (∏ b : types, Real.exp (-(blockArea b.val : ℝ)*t)^
      (typeCounts types N blocks b).val) = Real.exp (-(N : ℝ)*t) := by
  simp only [typeCounts_val hc]
  rw [Finset.prod_coe_sort types (fun b : BlockType =>
    Real.exp (-(blockArea b : ℝ)*t)^blocks.count b)]
  calc
    (∏ b ∈ types,Real.exp (-(blockArea b : ℝ)*t)^blocks.count b) =
        ∏ b ∈ blocks.toFinset,Real.exp (-(blockArea b : ℝ)*t)^blocks.count b := by
      symm
      apply Finset.prod_subset
      · intro b hb
        exact hs b (Multiset.mem_toFinset.mp hb)
      · intro b hb hn
        rw [Multiset.count_eq_zero_of_notMem (fun hh => hn (Multiset.mem_toFinset.mpr hh)),pow_zero]
    _ = (blocks.map (fun b => Real.exp (-(blockArea b : ℝ)*t))).prod :=
      (Finset.prod_multiset_map_count blocks _).symm
    _ = Real.exp (-(N : ℝ)*t) := by rw [multiset_exp_weight,ha]

theorem finite_geometric_le (q : ℝ) (hq : 0 ≤ q) (h1 : q < 1) (n : ℕ) :
    (∑ k : Fin n,q^k.val) ≤ 1/(1-q) := by
  rw [Fin.sum_univ_eq_sum_range]
  apply (le_div_iff₀ (sub_pos.mpr h1)).mpr
  rw [geom_sum_mul_neg]
  exact sub_le_self _ (pow_nonneg hq n)

theorem inverse_product_eq_exp (types : Finset BlockType) {t : ℝ} (ht : 0 < t)
    (ha : ∀ b ∈ types, 0 < blockArea b) :
    (∏ b ∈ types,(1-Real.exp (-(blockArea b : ℝ)*t))⁻¹) = Real.exp (logTypeProduct types t) := by
  rw [logTypeProduct,Real.exp_sum]
  apply Finset.prod_congr rfl
  intro b hb
  have hpos : 0 < (blockArea b : ℝ) := by exact_mod_cast ha b hb
  have hx : Real.exp (-(blockArea b : ℝ)*t) < 1 :=
    Real.exp_lt_one_iff.mpr (by nlinarith)
  rw [Real.exp_neg,Real.exp_log (sub_pos.mpr hx)]

/-- A finite family of fixed-area multisets is bounded by its complete
finite-type Euler product. The multiplicity-vector sum is finite throughout. -/
theorem fixed_area_card_le_exp (S : Finset (Multiset BlockType)) (types : Finset BlockType)
    (N : ℕ) {t : ℝ} (ht : 0 < t)
    (harea : ∀ blocks ∈ S,totalArea blocks=N)
    (hcard : ∀ blocks ∈ S,blocks.card ≤ N)
    (hsupport : ∀ blocks ∈ S,∀ b ∈ blocks,b ∈ types)
    (htypes : ∀ b ∈ types,0 < blockArea b) :
    (S.card : ℝ) ≤ Real.exp ((N : ℝ)*t+logTypeProduct types t) := by
  classical
  let weight : (types → Fin (N+1)) → ℝ := fun v =>
    ∏ b : types,Real.exp (-(blockArea b.val : ℝ)*t)^(v b).val
  have hsum : (S.card : ℝ)*Real.exp (-(N : ℝ)*t) ≤
      ∑ v : types → Fin (N+1),weight v := by
    have hh := Finset.sum_le_sum_of_injOn
      (f:=fun _ => Real.exp (-(N : ℝ)*t)) (g:=weight) (s:=S) (t:=Finset.univ)
      (typeCounts types N)
      (typeCounts_injective_on types N hcard hsupport)
      (Finset.subset_univ _)
      (fun blocks hb => le_of_eq
        (typeCounts_weight types N blocks (hcard blocks hb)
          (hsupport blocks hb) (harea blocks hb) t).symm)
      (fun v hv hn => by exact Finset.prod_nonneg (fun _ _ => by positivity))
    simpa only [Finset.sum_const,nsmul_eq_mul] using hh
  have hgeom : (∑ v : types → Fin (N+1),weight v) ≤
      ∏ b : types,(1-Real.exp (-(blockArea b.val : ℝ)*t))⁻¹ := by
    calc
      (∑ v : types → Fin (N+1),weight v) =
          ∏ b : types,∑ k : Fin (N+1),Real.exp (-(blockArea b.val : ℝ)*t)^k.val :=
        (Fintype.prod_sum (fun (b : types) (k : Fin (N+1)) =>
          Real.exp (-(blockArea b.val : ℝ)*t)^k.val)).symm
      _ ≤ _ := by
        apply Finset.prod_le_prod₀
        · intro b hb
          exact Finset.sum_nonneg (fun k _ => by positivity)
        · intro b hb
          have hpos : 0 < (blockArea b.val : ℝ) := by exact_mod_cast htypes b.val b.property
          have hq := Real.exp_lt_one_iff.mpr (show -(blockArea b.val : ℝ)*t < 0 by nlinarith)
          simpa only [one_div] using finite_geometric_le
            (Real.exp (-(blockArea b.val : ℝ)*t)) (Real.exp_pos _).le hq (N+1)
  have hprod := hsum.trans hgeom
  rw [Finset.prod_coe_sort types (fun b : BlockType =>
    (1-Real.exp (-(blockArea b : ℝ)*t))⁻¹),inverse_product_eq_exp types ht htypes] at hprod
  have hcancel : Real.exp (-(N : ℝ)*t)*Real.exp ((N : ℝ)*t)=1 := by
    rw [← Real.exp_add,show -(N : ℝ)*t+(N : ℝ)*t=0 by ring,Real.exp_zero]
  calc
    (S.card : ℝ) = ((S.card : ℝ)*Real.exp (-(N : ℝ)*t))*Real.exp ((N : ℝ)*t) := by
      rw [mul_assoc,hcancel,mul_one]
    _ ≤ Real.exp (logTypeProduct types t)*Real.exp ((N : ℝ)*t) :=
      mul_le_mul_of_nonneg_right hprod (Real.exp_pos _).le
    _ = Real.exp ((N : ℝ)*t+logTypeProduct types t) := by rw [← Real.exp_add,add_comm]

theorem areaMultisets_properties {h N : ℕ} {blocks : Multiset BlockType}
    (hb : blocks ∈ areaMultisets h N) :
    totalArea blocks=N ∧ blocks.card ≤ N ∧
      ∀ b ∈ blocks, 1 ≤ b.1 ∧ b.1 ≤ b.2 ∧ b.2 ≤ N ∧ b.1 ≤ h := by
  obtain ⟨_,ha,hpos⟩ := Finset.mem_filter.mp hb
  refine ⟨ha,?_,?_⟩
  · have hh := card_le_totalArea blocks (fun b hb => ⟨(hpos b hb).1,(hpos b hb).2.1⟩)
    simpa only [ha] using hh
  · intro b hb
    obtain ⟨hp,hle,hheight⟩ := hpos b hb
    have harea : blockArea b ≤ N := by
      rw [← ha]
      exact Multiset.le_sum_of_mem (Multiset.mem_map.mpr ⟨b,hb,rfl⟩)
    refine ⟨hp,hle,?_,hheight⟩
    have hh := Nat.mul_le_mul_right b.2 hp
    dsimp [blockArea] at harea
    omega

theorem areaMultisets_card_le_exp_unordered (h N : ℕ) {t : ℝ} (ht : 0 < t) :
    ((areaMultisets h N).card : ℝ) ≤ Real.exp ((N : ℝ)*t+unorderedLogProduct N t) := by
  apply fixed_area_card_le_exp _ (unorderedTypes N) N ht
  · exact fun blocks hb => (areaMultisets_properties hb).1
  · exact fun blocks hb => (areaMultisets_properties hb).2.1
  · intro blocks hb b hbb
    obtain ⟨hp,hle,hN,hh⟩ := (areaMultisets_properties hb).2.2 b hbb
    simp only [unorderedTypes,Finset.mem_filter,Finset.mem_product,Finset.mem_Icc]
    omega
  · intro b hb
    simp only [unorderedTypes,Finset.mem_filter,Finset.mem_product,Finset.mem_Icc] at hb
    obtain ⟨⟨⟨ha,_⟩,⟨hw,_⟩⟩,_⟩ := hb
    exact Nat.mul_pos ha hw

theorem areaMultisets_card_le_exp_ordered (h N : ℕ) {t : ℝ} (ht : 0 < t) :
    ((areaMultisets h N).card : ℝ) ≤ Real.exp ((N : ℝ)*t+orderedLogProduct h N t) := by
  apply fixed_area_card_le_exp _ (orderedTypes h N) N ht
  · exact fun blocks hb => (areaMultisets_properties hb).1
  · exact fun blocks hb => (areaMultisets_properties hb).2.1
  · intro blocks hb b hbb
    obtain ⟨hp,hle,hN,hh⟩ := (areaMultisets_properties hb).2.2 b hbb
    simp only [orderedTypes,Finset.mem_product,Finset.mem_Icc]
    omega
  · intro b hb
    simp only [orderedTypes,Finset.mem_product,Finset.mem_Icc] at hb
    obtain ⟨⟨ha,_⟩,⟨hw,_⟩⟩ := hb
    exact Nat.mul_pos ha hw

end RectanglePartitions
