import Conjectures.HornakOneArm

/-! Complete source-test consequence for short arms of length at most two. -/
namespace Hornak

theorem short_le_two_tripod_avd_from_tests (arms : Fin 3 → ℕ)
    (hshort : 0 < arms 2) (hshort2 : arms 2 ≤ 2)
    (hcarry : ∀ k, 0 < k → k ≤ arms 1+arms 2 → (∑ j, arms j%k)/k ≤ 1)
    (hsource5 : ∀ i, 0 < i → i ≤ arms 1+arms 2 → ∀ a b : ℕ, a ≤ i → 1 ≤ b →
      a*i+b*(i+1) = 1+∑ j, arms j →
      (∑ j, arms j%(i+1))/(i+1) = 1 →
      ∃ p : Fin 3, (∑ j, arms j%(i+1))%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1)) : AVD arms := by
  classical
  intro p sizes hpos htotal
  by_cases hlarge : ∃ k, arms 2 < sizes k
  · obtain ⟨k,hk⟩ := hlarge
    let xs := List.ofFn sizes
    have hmem : sizes k ∈ xs := List.mem_ofFn.mpr ⟨k,rfl⟩
    let rest := xs.erase (sizes k)
    have hperm : xs.Perm (sizes k::rest) := List.perm_cons_erase hmem
    have hrest : ∀ x ∈ rest, 0 < x := by
      intro x hx
      have hx' : x ∈ xs := hperm.mem_iff.mpr (by simp [hx])
      obtain ⟨j,hj⟩ := List.mem_ofFn.mp hx'
      rw [← hj]
      exact hpos j
    have hs : (sizes k)+rest.sum = 1+∑ j, arms j := by
      have hh := hperm.sum_eq
      simp only [List.sum_cons, xs, List.sum_ofFn] at hh
      rw [vertex_card] at htotal
      omega
    have hp := tripod_with_large_part_from_source arms (by omega) hcarry hsource5
      (sizes k) rest (by omega) hrest hs
    have hp' : Partitionable arms (sizes k::rest).get := by
      convert hp using 1
      funext i
      cases i using Fin.cases with
      | zero => rfl
      | succ i => rfl
    have hx := (partitionable_list_perm arms _ _ hperm).2 hp'
    exact partitionable_from_ofFn arms sizes hx
  · push Not at hlarge
    by_cases heq : ∃ k, sizes k = arms 2
    · obtain ⟨k,hk⟩ := heq
      let xs := List.ofFn sizes
      have hmem : arms 2 ∈ xs := by
        rw [← hk]
        exact List.mem_ofFn.mpr ⟨k,rfl⟩
      have hxspos : ∀ x ∈ xs, 0 < x := by
        intro x hx
        obtain ⟨j,hj⟩ := List.mem_ofFn.mp hx
        rw [← hj]
        exact hpos j
      have hxsum : xs.sum = 1+∑ j, arms j := by
        dsimp [xs]
        rw [List.sum_ofFn, ← vertex_card]
        exact htotal
      have hsub : [arms 2].Sublist xs := List.singleton_sublist.mpr hmem
      have hp := tripod_partition_of_short_arm_sublist arms xs [arms 2] hsub
        (by simp) hxspos hxsum
      exact partitionable_from_ofFn arms sizes hp
    · push Not at heq
      have hones : sizes = fun _ => 1 := by
        funext k
        have hp := hpos k
        have hh := hlarge k
        have hn := heq k
        omega
      subst sizes
      have hc : p = Fintype.card (Vertex arms) := by simpa using htotal
      exact singleton_vertices_partition arms hc

end Hornak
