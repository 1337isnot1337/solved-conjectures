import Conjectures.RectangleCumulativeFinite
import Conjectures.RectanglePartitionBounds

namespace RectanglePartitionAsymptotics

open Finset

def configParts {B T : ℕ} (f : CappedConfig B T) : Multiset ℕ :=
  ∑ i : Fin B, Multiset.replicate (f i).val (i.val+1)

theorem configParts_sum {B T : ℕ} (f : CappedConfig B T) :
    (configParts f).sum=mass f := by
  change (Multiset.sumAddMonoidHom : Multiset ℕ →+ ℕ)
    (∑ i : Fin B, Multiset.replicate (f i).val (i.val+1))=mass f
  rw [map_sum]
  simp only [Multiset.coe_sumAddMonoidHom,Multiset.sum_replicate,nsmul_eq_mul,
    Nat.cast_id,mul_comm,mass]

theorem configParts_count {B T : ℕ} (f : CappedConfig B T) (i : Fin B) :
    (configParts f).count (i.val+1)=(f i).val := by
  rw [configParts,Multiset.count_sum']
  calc
    (∑ j : Fin B,(Multiset.replicate (f j).val (j.val+1)).count (i.val+1))=
        (Multiset.replicate (f i).val (i.val+1)).count (i.val+1) := by
      apply Finset.sum_eq_single i
      · intro j hj hji
        have hne : j.val+1 ≠ i.val+1 := by
          intro he
          apply hji
          apply Fin.ext
          omega
        simp only [Multiset.count_replicate,hne,ite_false]
      · intro hi
        exact False.elim (hi (Finset.mem_univ i))
    _=(f i).val := Multiset.count_replicate_self _ _

theorem configParts_count_outside {B T : ℕ} (f : CappedConfig B T) {a : ℕ}
    (ha : ¬(1 ≤ a ∧ a ≤ B)) : (configParts f).count a=0 := by
  rw [configParts,Multiset.count_sum']
  apply Finset.sum_eq_zero
  intro i hi
  have hne : i.val+1 ≠ a := by
    intro he
    apply ha
    have hi := i.isLt
    omega
  simp only [Multiset.count_replicate,hne,ite_false]

theorem configParts_support {B T : ℕ} (f : CappedConfig B T) {a : ℕ}
    (ha : a ∈ configParts f) : 1 ≤ a ∧ a ≤ B := by
  by_contra hn
  have hz := configParts_count_outside f hn
  have hp := Multiset.count_pos.mpr ha
  omega

theorem configParts_injective (B T : ℕ) :
    Function.Injective (configParts (B:=B) (T:=T)) := by
  intro f g hfg
  funext i
  apply Fin.ext
  have hh := congrArg (Multiset.count (i.val+1)) hfg
  simpa only [configParts_count] using hh

def partsConfig (B T : ℕ) (parts : Multiset ℕ) : CappedConfig B T :=
  fun i => ⟨min (parts.count (i.val+1)) T,
    by have := min_le_right (parts.count (i.val+1)) T; omega⟩

theorem partsConfig_val {B T : ℕ} {parts : Multiset ℕ}
    (hp : parts ∈ RectanglePartitions.boundedParts 1 B T) (i : Fin B) :
    (partsConfig B T parts i).val=parts.count (i.val+1) := by
  obtain ⟨hs,hparts⟩ := (RectanglePartitions.mem_boundedParts_iff 1 B T (by omega) parts).mp hp
  have hc := RectanglePartitions.count_le_budget parts T
    (fun b hb => (hparts b hb).1) hs (i.val+1)
  exact min_eq_left hc

theorem configParts_partsConfig {B T : ℕ} {parts : Multiset ℕ}
    (hp : parts ∈ RectanglePartitions.boundedParts 1 B T) :
    configParts (partsConfig B T parts)=parts := by
  apply Multiset.ext.mpr
  intro b
  by_cases hb : 1 ≤ b ∧ b ≤ B
  · let i : Fin B := ⟨b-1,by omega⟩
    have hi : i.val+1=b := by dsimp [i]; omega
    rw [←hi,configParts_count]
    exact partsConfig_val hp i
  · have hn : b ∉ parts := by
      intro hmem
      exact hb (((RectanglePartitions.mem_boundedParts_iff 1 B T (by omega) parts).mp hp).2 b hmem)
    rw [configParts_count_outside _ hb,Multiset.count_eq_zero_of_notMem hn]

theorem configParts_image (B T : ℕ) :
    (cumulativeConfigs B T).image configParts=RectanglePartitions.boundedParts 1 B T := by
  classical
  ext parts
  constructor
  · intro hp
    obtain ⟨f,hf,rfl⟩ := Finset.mem_image.mp hp
    apply (RectanglePartitions.mem_boundedParts_iff 1 B T (by omega) _).mpr
    constructor
    · rw [configParts_sum]
      exact mem_cumulativeConfigs.mp hf
    · intro b hb
      exact configParts_support f hb
  · intro hp
    refine Finset.mem_image.mpr ⟨partsConfig B T parts,?_,configParts_partsConfig hp⟩
    apply mem_cumulativeConfigs.mpr
    rw [←configParts_sum,configParts_partsConfig hp]
    exact ((RectanglePartitions.mem_boundedParts_iff 1 B T (by omega) parts).mp hp).1

/-- The finite multiplicity count is exactly the cumulative multiset partition
count consumed by the geometric lower bound. -/
theorem cumulativeCount_eq_boundedParts (B T : ℕ) :
    cumulativeCount B T=(RectanglePartitions.boundedParts 1 B T).card := by
  classical
  unfold cumulativeCount
  rw [←configParts_image B T]
  exact (Finset.card_image_of_injective _ (configParts_injective B T)).symm

end RectanglePartitionAsymptotics
