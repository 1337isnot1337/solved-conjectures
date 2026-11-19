import Conjectures.LonelinessHyperplaneResidueTranslation
import Conjectures.LonelinessHyperplaneProbability

/-! Equidistribution among the genuine residue-kernel classes follows
from the translation comparison and the explicit sampling denominator.
The proof does not assume a lattice-volume or Ehrhart asymptotic. -/

namespace Loneliness.Hyperplane

open Filter
open scoped BigOperators Topology

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

theorem positiveBoxResidue_partition
    (m : ι → ℤ) (Q : ℕ) [NeZero Q] (N : ℕ) :
    (∑ r : (residueNormalHom m Q).ker,
      (positiveBoxResidue m Q r.1 N).card) = (positiveBoxAdmissible m N).card := by
  classical
  calc
    _ = ∑ r : (residueNormalHom m Q).ker, ∑ v ∈ positiveBoxAdmissible m N,
        if (∀ i, (positiveBoxCoordinates v i : ZMod Q) = r.1 i) then 1 else 0 := by
      apply Finset.sum_congr rfl
      intro r _
      exact (Finset.sum_boole _ (positiveBoxAdmissible m N)).symm
    _ = ∑ v ∈ positiveBoxAdmissible m N, ∑ r : (residueNormalHom m Q).ker,
        if (∀ i, (positiveBoxCoordinates v i : ZMod Q) = r.1 i) then 1 else 0 :=
      Finset.sum_comm
    _ = ∑ _v ∈ positiveBoxAdmissible m N, 1 := by
      apply Finset.sum_congr rfl
      intro v hv
      have hkernel := (Finset.mem_filter.mp hv).2.1
      have hρ : residueNormalHom m Q (fun i => (positiveBoxCoordinates v i : ZMod Q)) = 0 := by
        rw [residueNormalHom_intCast, hkernel, Int.cast_zero]
      let r₀ : (residueNormalHom m Q).ker :=
        ⟨fun i => (positiveBoxCoordinates v i : ZMod Q), hρ⟩
      have heq : ∀ r : (residueNormalHom m Q).ker,
          (∀ i, (positiveBoxCoordinates v i : ZMod Q) = r.1 i) ↔ r = r₀ := by
        intro r
        constructor
        · intro hr
          apply Subtype.ext
          funext i
          exact (hr i).symm
        · rintro rfl
          intro i
          rfl
      simp_rw [heq]
      simp
    _ = _ := by simp

/-- Multiplying a class count by the exact number of classes differs
from the total count by only the boundary-order error. -/
theorem exists_residue_centered_count_bound
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (Q : ℕ) (hQ : 0 < Q) (r : ι → ZMod Q)
    (hr : residueNormalHom m Q r = 0) :
    ∃ R : ℕ, ∀ N : ℕ,
      (((Q ^ (Fintype.card ι - 1) : ℕ) : ℤ) *
        ((positiveBoxResidue m Q r N).card : ℤ) -
          ((positiveBoxAdmissible m N).card : ℤ)).natAbs ≤
        R * N ^ (Fintype.card ι - 2) := by
  classical
  let : NeZero Q := ⟨hQ.ne'⟩
  choose C hC using fun s : (residueNormalHom m Q).ker =>
    exists_residue_count_difference_bound m hm hreal Q hQ r s.1 hr s.2
  let R : ℕ := ∑ s : (residueNormalHom m Q).ker, C s
  refine ⟨R, ?_⟩
  intro N
  have hcard : Fintype.card (residueNormalHom m Q).ker = Q ^ (Fintype.card ι - 1) := by
    simpa only [Nat.card_eq_fintype_card] using residue_kernel_card m hm Q hQ
  have hsum : (∑ s : (residueNormalHom m Q).ker,
      ((positiveBoxResidue m Q s.1 N).card : ℤ)) =
        ((positiveBoxAdmissible m N).card : ℤ) := by
    exact_mod_cast positiveBoxResidue_partition m Q N
  have heq : (((Q ^ (Fintype.card ι - 1) : ℕ) : ℤ) *
        ((positiveBoxResidue m Q r N).card : ℤ) -
          ((positiveBoxAdmissible m N).card : ℤ)) =
      ∑ s : (residueNormalHom m Q).ker,
        (((positiveBoxResidue m Q r N).card : ℤ) -
          ((positiveBoxResidue m Q s.1 N).card : ℤ)) := by
    rw [Finset.sum_sub_distrib, Finset.sum_const, Finset.card_univ,
      nsmul_eq_mul, hcard, hsum]
  have hb : |(((Q ^ (Fintype.card ι - 1) : ℕ) : ℤ) *
        ((positiveBoxResidue m Q r N).card : ℤ) -
          ((positiveBoxAdmissible m N).card : ℤ))| ≤
      (R : ℤ) * (N : ℤ) ^ (Fintype.card ι - 2) := by
    rw [heq]
    calc
      _ ≤ ∑ s : (residueNormalHom m Q).ker,
          |((positiveBoxResidue m Q r N).card : ℤ) -
            ((positiveBoxResidue m Q s.1 N).card : ℤ)| :=
        Finset.abs_sum_le_sum_abs _ _
      _ ≤ ∑ s : (residueNormalHom m Q).ker,
          (C s : ℤ) * (N : ℤ) ^ (Fintype.card ι - 2) := by
        apply Finset.sum_le_sum
        intro s _
        exact hC s N
      _ = _ := by simp only [R, Nat.cast_sum, Finset.sum_mul]
  let z : ℤ := ((Q ^ (Fintype.card ι - 1) : ℕ) : ℤ) *
    ((positiveBoxResidue m Q r N).card : ℤ) - ((positiveBoxAdmissible m N).card : ℤ)
  have hcast : (z.natAbs : ℤ) ≤
      ((R * N ^ (Fintype.card ι - 2) : ℕ) : ℤ) := by
    simpa only [z, Int.natCast_natAbs, Nat.cast_mul, Nat.cast_pow] using hb
  exact Int.ofNat_le.mp hcast

def residueFrequency (m : ι → ℤ) (Q : ℕ) (r : ι → ZMod Q) (N : ℕ) : ℝ :=
  ((positiveBoxResidue m Q r N).card : ℝ) / (positiveBoxAdmissible m N).card


/-- Every fixed genuine residue class has the expected density, with a
reciprocal-box-size error bound and an eventually positive denominator. -/
theorem exists_residue_frequency_rate
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (Q : ℕ) (hQ : 0 < Q) (r : ι → ZMod Q)
    (hr : residueNormalHom m Q r = 0) :
    ∃ C K : ℕ, 0 < C ∧ ∀ N : ℕ, C ≤ N →
      0 < (positiveBoxAdmissible m N).card ∧
        |residueFrequency m Q r N - 1 / (Q : ℝ) ^ (Fintype.card ι - 1)| ≤
          (K : ℝ) / (N : ℝ) := by
  obtain ⟨C, hC, hden⟩ := exists_admissible_box_denominator m hm hreal
  obtain ⟨R, hR⟩ := exists_residue_centered_count_bound m hm hreal Q hQ r hr
  let K : ℕ := R * (2 * C) ^ (Fintype.card ι - 1)
  let q : ℕ := Q ^ (Fintype.card ι - 1)
  have hq : 0 < q := pow_pos hQ _
  have hqR : (0 : ℝ) < (q : ℝ) := by exact_mod_cast hq
  have hq1 : (1 : ℝ) ≤ (q : ℝ) := by exact_mod_cast (show 1 ≤ q from hq)
  refine ⟨C, K, hC, ?_⟩
  intro N hN
  let D := (positiveBoxAdmissible m N).card
  let c := (positiveBoxResidue m Q r N).card
  let E : ℕ := ((q : ℤ) * (c : ℤ) - (D : ℤ)).natAbs
  have hD : 0 < D :=
    (pow_pos (Nat.div_pos hN hC) _).trans_le (hden N hN)
  have hDR : (0 : ℝ) < (D : ℝ) := by exact_mod_cast hD
  have hNR : (0 : ℝ) < (N : ℝ) := by exact_mod_cast (hC.trans_le hN)
  have hcross : E * N ≤ K * D := exceptional_count_mul_box_le
    (Fintype.card ι) C R N E D hdim hC hN (hR N) (hden N hN)
  have hcrossR : (E : ℝ) * (N : ℝ) ≤ (K : ℝ) * (D : ℝ) := by
    exact_mod_cast hcross
  have hER : (E : ℝ) = |(q : ℝ) * (c : ℝ) - (D : ℝ)| := by
    have hEI : (E : ℤ) = |(q : ℤ) * (c : ℤ) - (D : ℤ)| := Int.natCast_natAbs _
    exact_mod_cast hEI
  have hidentity : residueFrequency m Q r N - 1 / (q : ℝ) =
      ((q : ℝ) * (c : ℝ) - (D : ℝ)) / ((q : ℝ) * (D : ℝ)) := by
    change (c : ℝ) / (D : ℝ) - 1 / (q : ℝ) = _
    field_simp [hDR.ne', hqR.ne']
  refine ⟨hD, ?_⟩
  have hqcast : (q : ℝ) = (Q : ℝ) ^ (Fintype.card ι - 1) := by simp [q]
  rw [← hqcast, hidentity, abs_div, abs_of_pos (mul_pos hqR hDR), ← hER]
  calc
    (E : ℝ) / ((q : ℝ) * (D : ℝ)) ≤ (E : ℝ) / (D : ℝ) := by
      apply (div_le_div_iff₀ (mul_pos hqR hDR) hDR).mpr
      have hmul : (D : ℝ) ≤ (q : ℝ) * (D : ℝ) := by nlinarith
      exact mul_le_mul_of_nonneg_left hmul (Nat.cast_nonneg E)
    _ ≤ _ := (div_le_div_iff₀ hDR hNR).mpr hcrossR

theorem residueFrequency_tendsto
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (Q : ℕ) (hQ : 0 < Q) (r : ι → ZMod Q)
    (hr : residueNormalHom m Q r = 0) :
    Tendsto (residueFrequency m Q r) atTop
      (𝓝 (1 / (Q : ℝ) ^ (Fintype.card ι - 1))) := by
  obtain ⟨C, K, _, hrate⟩ := exists_residue_frequency_rate m hm hreal hdim Q hQ r hr
  apply Metric.tendsto_atTop.mpr
  intro ε hε
  obtain ⟨N₀, hN₀⟩ := Metric.tendsto_atTop.mp
    (tendsto_const_div_atTop_nhds_zero_nat (K : ℝ)) ε hε
  refine ⟨max C N₀, ?_⟩
  intro N hN
  have hsmall : (K : ℝ) / (N : ℝ) < ε := by
    have h := hN₀ N ((le_max_right _ _).trans hN)
    simpa only [Real.dist_eq, sub_zero, abs_of_nonneg (by positivity :
      (0 : ℝ) ≤ (K : ℝ) / (N : ℝ))] using h
  rw [Real.dist_eq]
  exact ((hrate N ((le_max_left _ _).trans hN)).2).trans_lt hsmall

def positiveBoxResidueSet (m : ι → ℤ) (Q : ℕ) (S : Finset (ι → ZMod Q)) (N : ℕ) :
    Finset (ι → Fin N) :=
  (positiveBoxAdmissible m N).filter
    (fun v => (fun i => (positiveBoxCoordinates v i : ZMod Q)) ∈ S)

theorem positiveBoxResidueSet_card_eq_sum
    (m : ι → ℤ) (Q : ℕ) (S : Finset (ι → ZMod Q)) (N : ℕ) :
    (positiveBoxResidueSet m Q S N).card =
      ∑ r ∈ S, (positiveBoxResidue m Q r N).card := by
  classical
  symm
  calc
    _ = ∑ r ∈ S, ∑ v ∈ positiveBoxAdmissible m N,
        if (∀ i, (positiveBoxCoordinates v i : ZMod Q) = r i) then 1 else 0 := by
      apply Finset.sum_congr rfl
      intro r _
      exact (Finset.sum_boole _ (positiveBoxAdmissible m N)).symm
    _ = ∑ v ∈ positiveBoxAdmissible m N, ∑ r ∈ S,
        if (∀ i, (positiveBoxCoordinates v i : ZMod Q) = r i) then 1 else 0 :=
      Finset.sum_comm
    _ = ∑ v ∈ positiveBoxAdmissible m N,
        if (fun i => (positiveBoxCoordinates v i : ZMod Q)) ∈ S then 1 else 0 := by
      apply Finset.sum_congr rfl
      intro v _
      have heq : ∀ r : ι → ZMod Q,
          (∀ i, (positiveBoxCoordinates v i : ZMod Q) = r i) ↔
            (fun i => (positiveBoxCoordinates v i : ZMod Q)) = r := by
        intro r
        exact ⟨funext, fun h i => congrFun h i⟩
      simp_rw [heq]
      simp
    _ = _ := Finset.sum_boole _ (positiveBoxAdmissible m N)

def residueSetFrequency (m : ι → ℤ) (Q : ℕ) (S : Finset (ι → ZMod Q)) (N : ℕ) : ℝ :=
  ((positiveBoxResidueSet m Q S N).card : ℝ) / (positiveBoxAdmissible m N).card

theorem residueSetFrequency_eq_sum
    (m : ι → ℤ) (Q : ℕ) (S : Finset (ι → ZMod Q)) (N : ℕ) :
    residueSetFrequency m Q S N = ∑ r ∈ S, residueFrequency m Q r N := by
  unfold residueSetFrequency residueFrequency
  rw [positiveBoxResidueSet_card_eq_sum, Nat.cast_sum, Finset.sum_div]

theorem residueSetFrequency_tendsto
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (Q : ℕ) (hQ : 0 < Q) (S : Finset (ι → ZMod Q))
    (hS : ∀ r ∈ S, residueNormalHom m Q r = 0) :
    Tendsto (residueSetFrequency m Q S) atTop
      (𝓝 ((S.card : ℝ) / (Q : ℝ) ^ (Fintype.card ι - 1))) := by
  have ht := tendsto_finsetSum S (fun r hr =>
    residueFrequency_tendsto m hm hreal hdim Q hQ r (hS r hr))
  change Tendsto (fun N : ℕ => residueSetFrequency m Q S N) atTop _
  simpa only [residueSetFrequency_eq_sum, Finset.sum_const, nsmul_eq_mul,
    div_eq_mul_inv, one_mul] using ht

end

end Loneliness.Hyperplane
