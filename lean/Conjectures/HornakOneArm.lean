import Conjectures.HornakSmallBalance

/-! Complete source-test consequence for tripods with a one-edge short arm. -/
namespace Hornak

/-- Every finite star graph has the partition into singleton vertices. -/
theorem singleton_vertices_partition {m p : ℕ} (arms : Fin m → ℕ)
    (hcard : p = Fintype.card (Vertex arms)) :
    Partitionable arms (fun _ : Fin p => 1) := by
  classical
  let e : Vertex arms ≃ Fin p := (Fintype.equivFin (Vertex arms)).trans (finCongr hcard.symm)
  refine ⟨e,?_⟩
  intro k
  let _ : Unique {v : Vertex arms // e v = k} := {
    default := ⟨e.symm k,e.apply_symm_apply k⟩
    uniq := by
      intro v
      apply Subtype.ext
      apply e.injective
      simp [v.property] }
  let _ : Nonempty {v : Vertex arms // e v = k} := ⟨⟨e.symm k, e.apply_symm_apply k⟩⟩
  constructor
  · exact Fintype.card_unique
  · exact @SimpleGraph.Connected.of_subsingleton {v : Vertex arms // e v = k} _ _ _

/-- With a one-edge shortest arm, tests 1 and 5 in the source range imply
arbitrary vertex decomposability of the tripod. -/
theorem one_edge_tripod_avd_from_tests (arms : Fin 3 → ℕ) (hshort : arms 2 = 1)
    (hcarry : ∀ k, 0 < k → k ≤ arms 1+arms 2 → (∑ j, arms j%k)/k ≤ 1)
    (hsource5 : ∀ i, 0 < i → i ≤ arms 1+arms 2 → ∀ a b : ℕ, a ≤ i → 1 ≤ b →
      a*i+b*(i+1) = 1+∑ j, arms j →
      (∑ j, arms j%(i+1))/(i+1) = 1 →
      ∃ p : Fin 3, (∑ j, arms j%(i+1))%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1)) : AVD arms := by
  classical
  intro p sizes hpos htotal
  by_cases hlarge : ∃ k, 1 < sizes k
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
    have hones : sizes = fun _ => 1 := by
      funext k
      have hp := hpos k
      have hh := hlarge k
      omega
    subst sizes
    have hc : p = Fintype.card (Vertex arms) := by
      simpa using htotal
    exact singleton_vertices_partition arms hc

end Hornak
