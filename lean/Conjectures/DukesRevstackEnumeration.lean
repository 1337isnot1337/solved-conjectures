import Conjectures.DukesRevstackWeights
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma

/-! Summing the independently permuted parity halves gives the exact
Eulerian product removed from the descent polynomial. -/

open Polynomial
open scoped BigOperators

namespace DukesRevstack

variable {R : Type*} [CommRing R]

private def permutationsFinset (labels : List ℕ) : Finset (List ℕ) := labels.permutations.toFinset

private theorem mem_permutationsFinset {labels w : List ℕ} :
    w ∈ permutationsFinset labels ↔ w.Perm labels := by
  rw [permutationsFinset, List.mem_toFinset, List.mem_permutations]

private def joinAtMaximum (m : ℕ) (lr : List ℕ × List ℕ) : List ℕ :=
  lr.1 ++ m :: lr.2

private theorem joinAtMaximum_injOn (m : ℕ) :
    Set.InjOn (joinAtMaximum m)
      ↑((permutationsFinset (leftParityLabels m)).product (permutationsFinset (rightParityLabels m))) := by
  rintro ⟨l₁, r₁⟩ h₁ ⟨l₂, r₂⟩ h₂ he
  obtain ⟨hl₁, hr₁⟩ := Finset.mem_product.mp h₁
  obtain ⟨hl₂, hr₂⟩ := Finset.mem_product.mp h₂
  have hL₁ (x : ℕ) (hx : x ∈ l₁) : x < m :=
    (mem_leftParityLabels.mp ((mem_permutationsFinset.mp hl₁).mem_iff.mp hx)).1
  have hR₁ (x : ℕ) (hx : x ∈ r₁) : x < m :=
    (mem_rightParityLabels.mp ((mem_permutationsFinset.mp hr₁).mem_iff.mp hx)).1
  have hL₂ (x : ℕ) (hx : x ∈ l₂) : x < m :=
    (mem_leftParityLabels.mp ((mem_permutationsFinset.mp hl₂).mem_iff.mp hx)).1
  have hR₂ (x : ℕ) (hx : x ∈ r₂) : x < m :=
    (mem_rightParityLabels.mp ((mem_permutationsFinset.mp hr₂).mem_iff.mp hx)).1
  obtain ⟨_, hLeft₁, hRight₁⟩ := split_at_maximum l₁ r₁ m hL₁ hR₁
  obtain ⟨_, hLeft₂, hRight₂⟩ := split_at_maximum l₂ r₂ m hL₂ hR₂
  change l₁ ++ m :: r₁ = l₂ ++ m :: r₂ at he
  rw [he, hLeft₂] at hLeft₁
  rw [he, hRight₂] at hRight₁
  exact Prod.ext hLeft₁.symm hRight₁.symm

private theorem failedWords_eq_image (m : ℕ) (hm : 2 ≤ m) :
    (permutationsFinset (List.range (m + 1))).filter
      (fun w => (revstack^[m - 1]) w ≠ List.range (m + 1)) =
      ((permutationsFinset (leftParityLabels m)).product (permutationsFinset (rightParityLabels m))).image
        (joinAtMaximum m) := by
  ext word
  rw [Finset.mem_filter, mem_permutationsFinset, Finset.mem_image]
  constructor
  · rintro ⟨hWord, hFail⟩
    obtain ⟨left, right, hl, hr, hJoin⟩ := (alternating_word_shape m word).mp
      ⟨hWord, (penultimate_pass_failure_iff m hm word hWord).mp hFail⟩
    exact ⟨(left, right), Finset.mem_product.mpr
      ⟨mem_permutationsFinset.mpr hl, mem_permutationsFinset.mpr hr⟩, hJoin.symm⟩
  · rintro ⟨⟨left, right⟩, hp, hJoin⟩
    obtain ⟨hl, hr⟩ := Finset.mem_product.mp hp
    obtain ⟨hWord, hAlt⟩ := (alternating_word_shape m word).mpr
      ⟨left, right, mem_permutationsFinset.mp hl, mem_permutationsFinset.mp hr, hJoin.symm⟩
    exact ⟨hWord, (penultimate_pass_failure_iff m hm word hWord).mpr hAlt⟩

private theorem sum_permutationsFinset_weight (labels : List ℕ) (hn : labels.Nodup) :
    (∑ w ∈ permutationsFinset labels, wordWeight w : R[X]) = wordEulerian labels := by
  unfold permutationsFinset wordEulerian
  exact (sum_list_map_eq_finset wordWeight _ (List.nodup_permutations _ hn)).symm

private theorem shiftedWeighted_failedWords (m : ℕ) (hm : 2 ≤ m) :
    (∑ w ∈ (permutationsFinset (List.range (m + 1))).filter
        (fun w => (revstack^[m - 1]) w ≠ List.range (m + 1)),
      X * wordWeight w : R[X]) = X ^ 2 * (eulerian (m / 2) * eulerian ((m + 1) / 2)) := by
  let lSet := permutationsFinset (leftParityLabels m)
  let rSet := permutationsFinset (rightParityLabels m)
  rw [failedWords_eq_image m hm, Finset.sum_image (joinAtMaximum_injOn m)]
  change (∑ lr ∈ lSet.product rSet, X * wordWeight (joinAtMaximum m lr)) = _
  calc
    _ = ∑ lr ∈ lSet.product rSet, (X : R[X]) ^ 2 * wordWeight lr.1 * wordWeight lr.2 := by
      apply Finset.sum_congr rfl
      rintro ⟨left, right⟩ hMem
      obtain ⟨hl, hr⟩ := Finset.mem_product.mp hMem
      have hp := mem_permutationsFinset.mp hr
      have hL (x : ℕ) (hx : x ∈ left) : x < m :=
        (mem_leftParityLabels.mp ((mem_permutationsFinset.mp hl).mem_iff.mp hx)).1
      have hR (x : ℕ) (hx : x ∈ right) : x < m :=
        (mem_rightParityLabels.mp (hp.mem_iff.mp hx)).1
      have hNonempty : right ≠ [] := by
        have hLen := hp.length_eq
        simp [rightParityLabels] at hLen
        intro h
        rw [h, List.length_nil] at hLen
        omega
      unfold wordWeight joinAtMaximum
      rw [wordDescents_split _ _ _ hL hR hNonempty, pow_add, pow_add, pow_one]
      ring
    _ = X ^ 2 * ((∑ left ∈ lSet, wordWeight left) * (∑ right ∈ rSet, wordWeight right)) := by
      change (∑ lr ∈ lSet ×ˢ rSet, (X : R[X]) ^ 2 * wordWeight lr.1 * wordWeight lr.2) = _
      rw [Finset.sum_product]
      simp only [← Finset.mul_sum, ← Finset.sum_mul]
      ring
    _ = _ := by
      rw [sum_permutationsFinset_weight (leftParityLabels m) (nodup_leftParityLabels m),
        sum_permutationsFinset_weight (rightParityLabels m) (nodup_rightParityLabels m),
        wordEulerian_leftParity, wordEulerian_rightParity]

/-- The literal descent polynomial of the words sorted in n−2 passes is
the Eulerian formula, including the base at order three. -/
theorem revstackDescentPolynomial_eq (n : ℕ) (hn : 3 ≤ n) :
    (revstackDescentPolynomial (R := R) n (n - 2) : R[X]) = X * reducedRevstack n := by
  obtain ⟨m, rfl⟩ : ∃ m, n = m + 1 := ⟨n - 1, by omega⟩
  have hm : 2 ≤ m := by omega
  have hTime : m + 1 - 2 = m - 1 := by omega
  let all := permutationsFinset (List.range (m + 1))
  let sorted (w : List ℕ) := (revstack^[m - 1]) w = List.range (m + 1)
  have hGood : (revstackDescentPolynomial (R := R) (m + 1) (m + 1 - 2) : R[X]) =
      ∑ w ∈ all.filter sorted, X * wordWeight w := by
    unfold revstackDescentPolynomial
    rw [hTime, sum_list_map_eq_finset _ _ ((List.nodup_permutations _ List.nodup_range).filter _),
      List.toFinset_filter]
    apply Finset.sum_congr
    · ext w
      simp [isRevstackSortable, all, sorted, permutationsFinset]
    · intro w _
      rw [wordWeight, pow_add, pow_one]
  have hAll : (∑ w ∈ all, X * wordWeight w : R[X]) = X * eulerian (m + 1) := by
    rw [← Finset.mul_sum, sum_permutationsFinset_weight _ List.nodup_range, wordEulerian_range]
  have hSplit := Finset.sum_filter_add_sum_filter_not all sorted (fun w => (X : R[X]) * wordWeight w)
  rw [hAll, ← hGood, shiftedWeighted_failedWords m hm] at hSplit
  rw [reducedRevstack, show leftSize (m + 1) = m / 2 by simp [leftSize], rightSize]
  rw [eq_sub_of_add_eq hSplit]
  ring

end DukesRevstack
