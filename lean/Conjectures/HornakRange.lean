import Conjectures.HornakLargeReduction

/-! Handling indices outside the source admissibility range. -/
namespace Hornak

/-- If all noncentral parts fit on the first arm, assign them there and
put the rest of the graph in the central part. -/
theorem all_parts_on_first_arm (arms : Fin 3 → ℕ) (center : ℕ) (parts : List ℕ)
    (hpos : ∀ x ∈ parts, 0 < x) (hfit : parts.sum ≤ arms 0)
    (htotal : center+parts.sum = 1+∑ j, arms j) :
    Partitionable arms (Fin.cases center parts.get) := by
  classical
  let host : Fin parts.length → Fin 3 := fun _ => 0
  have hp : ∀ k, 0 < parts.get k := fun k => hpos _ (List.get_mem _ _)
  have hf : ∀ j, (∑ k : {k // host k = j}, parts.get k.val) ≤ arms j := by
    intro j
    fin_cases j
    · change (∑ k : {k : Fin parts.length // (0 : Fin 3) = 0}, parts.get k.val) ≤ arms 0
      have hs : (∑ k : {k : Fin parts.length // (0 : Fin 3) = 0}, parts.get k.val) = parts.sum := by
        calc
          (∑ k : {k : Fin parts.length // (0 : Fin 3) = 0}, parts.get k.val) =
              ∑ k : Fin parts.length, parts.get k :=
            (Equiv.subtypeUnivEquiv (fun _ : Fin parts.length => rfl)).sum_comp parts.get
          _ = parts.sum := by rw [← List.sum_ofFn, List.ofFn_get]
      omega
    · change (∑ k : {k : Fin parts.length // (0 : Fin 3) = 1}, parts.get k.val) ≤ arms 1
      have hz : IsEmpty {k : Fin parts.length // (0 : Fin 3) = 1} := ⟨fun k => by have h := k.property; contradiction⟩
      have hs : (∑ k : {k : Fin parts.length // (0 : Fin 3) = 1}, parts.get k.val) = 0 := Fintype.sum_empty _
      rw [hs]
      omega
    · change (∑ k : {k : Fin parts.length // (0 : Fin 3) = 2}, parts.get k.val) ≤ arms 2
      have hz : IsEmpty {k : Fin parts.length // (0 : Fin 3) = 2} := ⟨fun k => by have h := k.property; contradiction⟩
      have hs : (∑ k : {k : Fin parts.length // (0 : Fin 3) = 2}, parts.get k.val) = 0 := Fintype.sum_empty _
      rw [hs]
      omega
  have ht : center+(∑ k : Fin parts.length, parts.get k) = 1+∑ j, arms j := by
    rw [← List.sum_ofFn, List.ofFn_get]
    exact htotal
  exact partition_from_assignment arms center parts.get host hp hf ht

theorem large_center_realizes_tripod (arms : Fin 3 → ℕ) (center : ℕ) (parts : List ℕ)
    (hpos : ∀ x ∈ parts, 0 < x)
    (hcenter : 1+arms 1+arms 2 ≤ center)
    (htotal : center+parts.sum = 1+∑ j, arms j) :
    Partitionable arms (Fin.cases center parts.get) := by
  apply all_parts_on_first_arm arms center parts hpos _ htotal
  rw [Fin.sum_univ_three] at htotal
  omega

/-- Only consecutive-size tests up to the sum of the two shorter arms
are needed for the large-part tripod reduction. -/
theorem large_parts_from_bounded_consecutive (arms : Fin 3 → ℕ) (hshortpos : 0 < arms 2)
    (hbalanced : ∀ i : ℕ, 0 < i → i ≤ arms 1+arms 2 → ∀ rest : List ℕ,
      (∀ x ∈ rest, x = i ∨ x = i+1) →
      (i+1)+rest.sum = 1+∑ j, arms j →
      Partitionable arms (Fin.cases (i+1) rest.get)) :
    ∀ largest : ℕ, ∀ parts : List ℕ,
      (∀ x ∈ parts, x ≤ largest) →
      arms 2 < largest → (∀ x ∈ parts, arms 2 < x) →
      largest+parts.sum = 1+∑ j, arms j →
      Partitionable arms (Fin.cases largest parts.get) := by
  apply large_parts_from_consecutive arms hshortpos
  intro i hi rest hvalues htotal
  by_cases hbound : i ≤ arms 1+arms 2
  · exact hbalanced i hi hbound rest hvalues htotal
  · apply large_center_realizes_tripod arms (i+1) rest
    · intro x hx
      rcases hvalues x hx with h | h <;> omega
    · omega
    · exact htotal

end Hornak
