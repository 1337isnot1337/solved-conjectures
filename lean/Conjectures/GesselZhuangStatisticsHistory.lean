module

public import Conjectures.GesselZhuangHistoryBlocks
public import Conjectures.GesselZhuangStatistics
public import Conjectures.GesselZhuangStatisticsInverse

/-!
# Gessel–Zhuang conjecture

The insertion histories record the literal pinnacle values and inverse
descents of the permutation words they construct.
-/

@[expose] public section

namespace GesselZhuang

theorem blockPinnacles_eq_wordPinnacles {B : Blocks} (hB : B.length = 1) :
    blockPinnacles B = wordPinnacles B.flatten := by
  cases B with
  | nil => simp at hB
  | cons b B =>
    have hnil : B = [] := by simpa using hB
    subst B
    simp

namespace History

theorem blocks_pinnacles {n h : ℕ} (p : HeightPath n h) (H : History p) :
    blockPinnacles (blocks p H) = p.downLabels := by
  induction p with
  | start => rfl
  | up p ih =>
    rw [blocks, blockPinnacles_up, ih]
    rfl
    rw [blocks_length]
    have := H.2.isLt
    omega
  | flat p ih =>
    rw [blocks, blockPinnacles_flat, ih]
    rfl
    · rw [blocks_length]
      exact H.2.1.isLt
    · intro y hy
      exact (mem_blocks_iff p H.1).mp hy
  | down p ih =>
    rw [blocks, blockPinnacles_down, ih]
    · simp [HeightPath.downLabels, Finset.union_comm]
    · rw [blocks_length]
      have := H.2.isLt
      omega
    · exact blocks_nonempty p H.1
    · intro y hy
      exact (mem_blocks_iff p H.1).mp hy

/-- A closed history produces one literal permutation word, whose
pinnacle set is the set of down-step labels. -/
theorem word_pinnacles {n : ℕ} (p : HeightPath n 0) (H : History p) :
    wordPinnacles (blocks p H).flatten = p.downLabels := by
  rw [← blockPinnacles_eq_wordPinnacles (by simp : (blocks p H).length = 1)]
  exact blocks_pinnacles p H

/-- The fixed peak-count statistic is the literal number of interior
peak positions, not merely a proxy attached to a path. -/
theorem word_peakCount {n : ℕ} (p : HeightPath n 0) (H : History p) :
    wordPeakCount (blocks p H).flatten = p.downLabels.card := by
  rw [wordPeakCount_eq_card_wordPinnacles
    ((blocks_flatten_perm p H).nodup_iff.mpr List.nodup_range), word_pinnacles]

/-- Every insertion records exactly the position comparison of the
new value and the preceding value; all older comparisons persist. -/
theorem word_inverseDescents {n h : ℕ} (p : HeightPath n h) (H : History p) :
    wordInverseDescents (blocks p H).flatten = inverseDescents p H := by
  induction p with
  | start => rfl
  | @up n h p ih =>
    rw [blocks, wordInverseDescents_up, ih]
    · simp only [inverseDescents, Nat.add_sub_cancel, blocks_recent]
    · rw [blocks_length]
      have := H.2.isLt
      omega
    · omega
    · simpa using (blocks_flatten_perm p H.1).length_eq
    · intro y hy
      exact (mem_blocks_iff p H.1).mp hy
  | @flat n h p ih =>
    rw [blocks, wordInverseDescents_flat, ih]
    · simp only [inverseDescents, Nat.add_sub_cancel, blocks_recent]
    · rw [blocks_length]
      exact H.2.1.isLt
    · omega
    · simpa using (blocks_flatten_perm p H.1).length_eq
    · intro y hy
      exact (mem_blocks_iff p H.1).mp hy
  | @down n h p ih =>
    rw [blocks, wordInverseDescents_down, ih]
    · simp only [inverseDescents, Nat.add_sub_cancel, blocks_recent]
    · rw [blocks_length]
      have := H.2.isLt
      omega
    · omega
    · simpa using (blocks_flatten_perm p H.1).length_eq
    · intro y hy
      exact (mem_blocks_iff p H.1).mp hy

end History

end GesselZhuang
