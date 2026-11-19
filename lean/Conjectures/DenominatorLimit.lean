import Conjectures.DenominatorWordFacts
import Conjectures.DenominatorFinitePaths

namespace DenominatorForest

open DenominatorFinite

theorem cycle_count_stabilizes (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (hprim : RotationsDistinct word) (n k : Nat) (hp : 0 < word.length) (hk : 0 < k)
    (hperiod : word.length+1 ≤ word.length*k) (hdepth : 3*n+5 ≤ word.length*k) :
    actualCycleCount (cycleSet word k) n=
      ∑ q ∈ Finset.range word.length, pathCount n (wordRoot word hsmall q) := by
  unfold actualCycleCount cycleSet
  rw [Finset.sum_image (cycleList_injective word hsmall hprim k hperiod)]
  apply Finset.sum_congr rfl
  intro q hq
  exact cycleList_pathCount word hsmall n k q hp hk (Finset.mem_range.mp hq) hdepth

theorem ancestor_coeff_stabilizes (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (hprim : RotationsDistinct word) (n k : Nat) (hp : 0 < word.length) (hk : 0 < k)
    (hperiod : word.length+1 ≤ word.length*k) (hdepth : 3*n+5 ≤ word.length*k) :
    PowerSeries.coeff n (ancestorSeries (cycleSet word k))=
      PowerSeries.coeff n (∑ q ∈ Finset.range word.length, series (wordRoot word hsmall q)) := by
  rw [ancestorSeries,PowerSeries.coeff_mk,
    cycle_count_stabilizes word hsmall hprim n k hp hk hperiod hdepth]
  simp only [map_sum,series_coeff,Nat.cast_sum]

/-- The limiting coefficient is the exact cardinality of a finite orbit level,
for every sufficiently large repetition. -/
theorem firstEntry_coeff_stabilizes (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (hprim : RotationsDistinct word) (n k : Nat) (hp : 0 < word.length) (hk : 0 < k)
    (hperiod : word.length+1 ≤ word.length*k) (hdepth : 3*n+5 ≤ word.length*k) :
    ((firstEntry (cycleSet word k) n).card:ℚ)=PowerSeries.coeff n (wordSeries word hsmall) := by
  have hL : 2 ≤ word.length*k := by omega
  have hseries := firstEntrySeries_eq (cycleSet word k)
    (cycleSet_positive word hsmall k hp hk)
    (cycleSet_nonempty_parts word k hL)
    (cycleSet_forward word hsmall k hp hk hL)
  have he : PowerSeries.coeff n (firstEntrySeries (cycleSet word k))=
      PowerSeries.coeff n (wordSeries word hsmall) := by
    rw [hseries,wordSeries]
    have hc : ∀ m ≤ n, PowerSeries.coeff m (ancestorSeries (cycleSet word k))=
        PowerSeries.coeff m (∑ q ∈ Finset.range word.length, series (wordRoot word hsmall q)) := by
      intro m hm
      exact ancestor_coeff_stabilizes word hsmall hprim m k hp hk hperiod (by omega)
    cases n with
    | zero =>
      simp only [sub_mul,one_mul,map_sub,PowerSeries.coeff_zero_X_mul,sub_zero]
      exact hc 0 le_rfl
    | succ n =>
      simp only [sub_mul,one_mul,map_sub,PowerSeries.coeff_succ_X_mul]
      rw [hc (n+1) le_rfl,hc n (by omega)]
  simpa only [firstEntrySeries,PowerSeries.coeff_mk] using he

theorem wordSeries_level_limit (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (hprim : RotationsDistinct word) (hp : 0 < word.length) :
    ∀ n, ∃ K, ∀ k, K ≤ k →
      ((firstEntry (cycleSet word k) n).card:ℚ)=PowerSeries.coeff n (wordSeries word hsmall) := by
  intro n
  refine ⟨3*n+word.length+6,?_⟩
  intro k hk
  have hkL : k ≤ word.length*k := by
    calc
      k=1*k := by omega
      _ ≤ word.length*k := Nat.mul_le_mul_right k (by omega)
  exact firstEntry_coeff_stabilizes word hsmall hprim n k hp (by omega) (by omega) (by omega)

theorem primary_level_stabilizes (n k : Nat) (hk : n+2 ≤ k) :
    ((firstEntry (cycleSet primaryWord k) n).card:ℚ)=PowerSeries.coeff n primarySeries := by
  apply firstEntry_coeff_stabilizes primaryWord primary_small primary_rotations_distinct n k
  · decide
  · omega
  · change 11 ≤ 10*k
    omega
  · change 3*n+5 ≤ 10*k
    omega

theorem dual_level_stabilizes (n k : Nat) (hk : n+2 ≤ k) :
    ((firstEntry (cycleSet dualWord k) n).card:ℚ)=PowerSeries.coeff n dualSeries := by
  apply firstEntry_coeff_stabilizes dualWord dual_small dual_rotations_distinct n k
  · decide
  · omega
  · change 11 ≤ 10*k
    omega
  · change 3*n+5 ≤ 10*k
    omega

/-- Coefficientwise stabilization of exact first-entry levels in the finite
orbits associated with repeated copies of the word. -/
def IsOrbitLevelLimit (word : List Nat) (H : PowerSeries ℚ) : Prop :=
  ∀ n, ∃ K, ∀ k, K ≤ k →
    ((firstEntry (cycleSet word k) n).card:ℚ)=PowerSeries.coeff n H

theorem orbitLevelLimit_unique (word : List Nat) (H G : PowerSeries ℚ)
    (hH : IsOrbitLevelLimit word H) (hG : IsOrbitLevelLimit word G) : H=G := by
  ext n
  obtain ⟨K,hK⟩ := hH n
  obtain ⟨L,hL⟩ := hG n
  exact (hK (max K L) (le_max_left _ _)).symm.trans (hL (max K L) (le_max_right _ _))

theorem primary_level_limit : IsOrbitLevelLimit primaryWord primarySeries := by
  intro n
  exact ⟨n+2,fun k hk => primary_level_stabilizes n k hk⟩

theorem dual_level_limit : IsOrbitLevelLimit dualWord dualSeries := by
  intro n
  exact ⟨n+2,fun k hk => dual_level_stabilizes n k hk⟩

theorem levels_preserve_mass (word : List Nat) (hsmall : ∀ i, word.getD i 0 ≤ 1)
    (k n : Nat) (hp : 0 < word.length) (hk : 0 < k) (hL : 2 ≤ word.length*k) :
    ∀ p ∈ firstEntry (cycleSet word k) n,
      p.sum=(cycleList word k 0:Multiset Nat).sum :=
  firstEntry_preserve_mass (cycleSet word k) n _ (cycleSet_mass word hsmall k hp hk hL)
    (cycleSet_positive word hsmall k hp hk) (cycleSet_nonempty_parts word k hL)
    (cycleSet_forward word hsmall k hp hk hL)

end DenominatorForest
