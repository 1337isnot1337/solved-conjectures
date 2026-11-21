import Conjectures.HornakSubsetList

/-! Iterating the large-part balancing transformations in Barth's tripod
reduction. -/
namespace Hornak

def partEnergy (center : ℕ) (parts : List ℕ) : ℕ :=
  center^2+(parts.map (fun x => x^2)).sum

theorem part_energy_perm (center : ℕ) {left right : List ℕ} (hp : left.Perm right) :
    partEnergy center left = partEnergy center right := by
  unfold partEnergy
  rw [(hp.map (fun x => x^2)).sum_eq]

theorem singleton_partition {m : ℕ} (arms : Fin m → ℕ) (n : ℕ)
    (htotal : n = 1+∑ j, arms j) :
    Partitionable arms (fun _ : Fin 1 => n) := by
  refine ⟨fun _ => 0,?_⟩
  intro k
  have hk : k = 0 := Subsingleton.elim _ _
  subst k
  constructor
  · have hset : {v : Vertex arms | (0 : Fin 1) = 0} = Set.univ := by ext v; simp
    have hcard : Fintype.card {v : Vertex arms // (0 : Fin 1) = 0} = Fintype.card (Vertex arms) := by
      exact Fintype.card_congr (Equiv.subtypeUnivEquiv (fun _ => rfl))
    rw [hcard,vertex_card,← htotal]
  · have hset : {v : Vertex arms | (0 : Fin 1) = 0} = Set.univ := by ext v; simp
    rw [hset]
    exact (SimpleGraph.induceUnivIso (graph arms)).connected_iff.2 (graph_connected arms)

theorem list_two_distinct_to_front (parts : List ℕ) (small large : ℕ)
    (hs : small ∈ parts) (hl : large ∈ parts) (hne : large ≠ small) :
    ∃ rest, parts.Perm (small::large::rest) := by
  have hp := List.perm_cons_erase hs
  have hl' : large ∈ parts.erase small := (List.mem_erase_of_ne hne).2 hl
  exact ⟨(parts.erase small).erase large, hp.trans ((List.perm_cons_erase hl').cons small)⟩

theorem list_exists_minimum (parts : List ℕ) (hne : parts ≠ []) :
    ∃ x, x ∈ parts ∧ ∀ y ∈ parts, x ≤ y := by
  refine ⟨parts.min hne, List.min_mem hne,?_⟩
  intro y hy
  exact List.min_le_of_mem hy

/-- If all consecutive-size partitions are realizable, every partition
whose parts are all larger than the shortest arm is realizable. -/
theorem large_parts_from_consecutive (arms : Fin 3 → ℕ) (hshortpos : 0 < arms 2)
    (hbalanced : ∀ i : ℕ, 0 < i → ∀ rest : List ℕ,
      (∀ x ∈ rest, x = i ∨ x = i+1) →
      (i+1)+rest.sum = 1+∑ j, arms j →
      Partitionable arms (Fin.cases (i+1) rest.get)) :
    ∀ largest : ℕ, ∀ parts : List ℕ,
      (∀ x ∈ parts, x ≤ largest) →
      arms 2 < largest → (∀ x ∈ parts, arms 2 < x) →
      largest+parts.sum = 1+∑ j, arms j →
      Partitionable arms (Fin.cases largest parts.get) := by
  have main : ∀ fuel : ℕ, ∀ largest : ℕ, ∀ parts : List ℕ,
      partEnergy largest parts = fuel →
      (∀ x ∈ parts, x ≤ largest) →
      arms 2 < largest → (∀ x ∈ parts, arms 2 < x) →
      largest+parts.sum = 1+∑ j, arms j →
      Partitionable arms (Fin.cases largest parts.get) := by
    intro fuel
    induction fuel using Nat.strong_induction_on with
    | h fuel ih =>
      intro largest parts henergy hmax hlargest hsmall htotal
      by_cases hempty : parts = []
      · subst parts
        have ht : largest = 1+∑ j, arms j := by simpa using htotal
        have hs : (Fin.cases largest ([] : List ℕ).get : Fin 1 → ℕ) = fun _ => largest := by
          funext k
          fin_cases k
          rfl
        change Partitionable arms (Fin.cases largest ([] : List ℕ).get : Fin 1 → ℕ)
        rw [hs]
        exact singleton_partition arms largest ht
      · obtain ⟨small,hmem,hmin⟩ := list_exists_minimum parts hempty
        have hsmall0 : arms 2 < small := hsmall small hmem
        have hmax0 : small ≤ largest := hmax small hmem
        by_cases hgap : ∃ large ∈ parts, small+2 ≤ large
        · obtain ⟨large,hlmem,horder⟩ := hgap
          have hlarge : large ≤ largest := hmax large hlmem
          obtain ⟨rest,hperm⟩ := list_two_distinct_to_front parts small large hmem hlmem (by omega)
          have hrestmax : ∀ x ∈ rest, x ≤ largest := by
            intro x hx
            apply hmax x
            apply hperm.mem_iff.mpr
            simp [hx]
          have hrestsmall : ∀ x ∈ rest, arms 2 < x := by
            intro x hx
            apply hsmall x
            apply hperm.mem_iff.mpr
            simp [hx]
          have ht : largest+(small::large::rest).sum = 1+∑ j, arms j := by
            rw [← hperm.sum_eq]
            exact htotal
          have hnewenergy : partEnergy largest ((small+1)::(large-1)::rest) < fuel := by
            have he : partEnergy largest (small::large::rest) = fuel :=
              (part_energy_perm largest hperm).symm.trans henergy
            have hm := (balance_parts_measure small large horder).2
            dsimp [partEnergy] at he ⊢
            simp only [List.map_cons, List.sum_cons] at he ⊢
            omega
          have hnewmax : ∀ x ∈ (small+1)::(large-1)::rest, x ≤ largest := by
            intro x hx
            simp only [List.mem_cons] at hx
            rcases hx with hx | hx | hx
            · subst x; omega
            · subst x; omega
            · exact hrestmax x hx
          have hnewsmall : ∀ x ∈ (small+1)::(large-1)::rest, arms 2 < x := by
            intro x hx
            simp only [List.mem_cons] at hx
            rcases hx with hx | hx | hx
            · subst x; omega
            · subst x; omega
            · exact hrestsmall x hx
          have htnew : largest+((small+1)::(large-1)::rest).sum = 1+∑ j, arms j := by
            simp only [List.sum_cons] at ht ⊢
            omega
          have hnew := ih _ hnewenergy largest ((small+1)::(large-1)::rest) rfl
            hnewmax hlargest hnewsmall htnew
          have hold := tripod_balance_noncentral arms largest small large rest hsmall0 horder hlarge
            hrestmax hrestsmall ht hnew
          exact (tripod_partition_list_perm arms largest parts (small::large::rest) hperm).2 hold
        · have hclose : ∀ x ∈ parts, x = small ∨ x = small+1 := by
            intro x hx
            have hl := hmin x hx
            have hn : ¬ small+2 ≤ x := by intro h; exact hgap ⟨x,hx,h⟩
            omega
          by_cases hc : largest = small
          · subst largest
            have hi : 0 < small-1 := by omega
            have he : small-1+1 = small := by omega
            have hall : ∀ x ∈ parts, x = small-1 ∨ x = small-1+1 := by
              intro x hx
              have hxmax := hmax x hx
              have hxmin := hmin x hx
              right
              omega
            have ht : (small-1+1)+parts.sum = 1+∑ j, arms j := by omega
            have hp := hbalanced (small-1) hi parts hall ht
            rw [he] at hp
            exact hp
          · by_cases hnext : largest = small+1
            · subst largest
              exact hbalanced small (by omega) parts hclose htotal
            · have hlargegap : small+2 ≤ largest := by omega
              let rest := parts.erase small
              have hperm : parts.Perm (small::rest) := List.perm_cons_erase hmem
              have hrestmax : ∀ x ∈ rest, x ≤ largest-1 := by
                intro x hx
                have hxp : x ∈ parts := hperm.mem_iff.mpr (by simp [hx])
                rcases hclose x hxp with h | h <;> omega
              have hrestsmall : ∀ x ∈ rest, arms 2 < x := by
                intro x hx
                apply hsmall x
                apply hperm.mem_iff.mpr
                simp [hx]
              have ht : largest+(small::rest).sum = 1+∑ j, arms j := by
                rw [← hperm.sum_eq]
                exact htotal
              have hnewenergy : partEnergy (largest-1) ((small+1)::rest) < fuel := by
                have he : partEnergy largest (small::rest) = fuel :=
                  (part_energy_perm largest hperm).symm.trans henergy
                have hm := (balance_parts_measure small largest hlargegap).2
                dsimp [partEnergy] at he ⊢
                simp only [List.map_cons, List.sum_cons] at he ⊢
                omega
              have hnewmax : ∀ x ∈ (small+1)::rest, x ≤ largest-1 := by
                intro x hx
                simp only [List.mem_cons] at hx
                rcases hx with hx | hx
                · subst x; omega
                · exact hrestmax x hx
              have hnewsmall : ∀ x ∈ (small+1)::rest, arms 2 < x := by
                intro x hx
                simp only [List.mem_cons] at hx
                rcases hx with hx | hx
                · subst x; omega
                · exact hrestsmall x hx
              have htnew : largest-1+((small+1)::rest).sum = 1+∑ j, arms j := by
                simp only [List.sum_cons] at ht ⊢
                omega
              have hnew := ih _ hnewenergy (largest-1) ((small+1)::rest) rfl
                hnewmax (by omega) hnewsmall htnew
              have hold := tripod_balance_largest arms largest small rest hsmall0 hlargegap
                hrestmax hrestsmall ht hnew
              exact (tripod_partition_list_perm arms largest parts (small::rest) hperm).2 hold
  intro largest parts hmax hlargest hsmall htotal
  exact main (partEnergy largest parts) largest parts rfl hmax hlargest hsmall htotal

end Hornak
