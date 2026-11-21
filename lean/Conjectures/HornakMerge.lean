import Conjectures.HornakPath

/-! Refining coarsened noncentral parts without changing a largest center. -/
namespace Hornak

/-- Any realizable coarsening whose central part is largest can be
refined into the positive pieces of its noncentral groups. -/
theorem refine_grouped_noncentral {m : ℕ} (arms : Fin m → ℕ) (center : ℕ)
    (groups : List (ℕ × List ℕ))
    (hpos : ∀ g ∈ groups, ∀ x ∈ groupPieces g, 0 < x)
    (hmax : ∀ g ∈ groups, groupSize g ≤ center)
    (htotal : center+(groups.map groupSize).sum = 1+∑ j, arms j)
    (hcoarse : Partitionable arms (Fin.cases center (fun j => groupSize (groups.get j)))) :
    Partitionable arms (center::groups.flatMap groupPieces).get := by
  classical
  let labels := Σ u : Fin groups.length, Fin (groupPieces (groups.get u)).length
  let e := Fintype.equivFin labels
  let size : Fin (Fintype.card labels) → ℕ := fun k =>
    (groupPieces (groups.get (e.symm k).1)).getD (e.symm k).2.val 0
  let group : Fin (Fintype.card labels) → Fin groups.length := fun k => (e.symm k).1
  have hp : ∀ k, 0 < size k := by
    intro k
    have hg : groups.get (e.symm k).1 ∈ groups := List.get_mem _ _
    have hv := hpos _ hg _ (List.get_mem (groupPieces (groups.get (e.symm k).1)) (e.symm k).2)
    dsimp [size]
    simpa [List.getD_eq_getElem?_getD, (e.symm k).2.isLt] using hv
  have hsumGroup : ∀ j : Fin groups.length,
      (∑ k : {k // group k = j}, size k.val) = groupSize (groups.get j) := indexed_group_sum groups
  have hsg : (∑ k, size k) = (groups.map groupSize).sum := by
    rw [← Fintype.sum_fiberwise group size]
    simp_rw [hsumGroup]
    rw [← List.sum_ofFn]
    congr 1
    rw [List.ofFn_eq_map]
    change (List.finRange groups.length).map (groupSize ∘ groups.get) = _
    rw [← List.map_map, List.map_get_finRange]
  have hm : ∀ j : Fin groups.length, (∑ k : {k // group k = j}, size k.val) ≤ center := by
    intro j
    rw [hsumGroup]
    exact hmax _ (List.get_mem _ _)
  have ht : center+(∑ k, size k) = 1+∑ j, arms j := by rw [hsg]; exact htotal
  have hc : Partitionable arms (Fin.cases center (fun j => ∑ k : {k // group k = j}, size k.val)) := by
    simp only [hsumGroup]
    exact hcoarse
  have hp' := refine_noncentral_parts arms center size group hp hm ht hc
  have hl := partitionable_ofFn arms _ hp'
  have hperm : (List.ofFn (Fin.cases center size)).Perm (center::groups.flatMap groupPieces) := by
    rw [List.ofFn_succ]
    simp only [Fin.cases_zero, Fin.cases_succ]
    exact (indexed_groups_perm_flatten groups).cons center
  exact (partitionable_list_perm arms _ _ hperm).1 hl

theorem partitionable_from_ofFn {m n : ℕ} (arms : Fin m → ℕ) (sizes : Fin n → ℕ)
    (hpart : Partitionable arms (List.ofFn sizes).get) : Partitionable arms sizes := by
  let e : Fin (List.ofFn sizes).length ≃ Fin n := finCongr List.length_ofFn
  apply partitionable_relabel arms (List.ofFn sizes).get sizes e _ hpart
  intro k
  rw [List.get_ofFn]
  rfl

/-- Two noncentral positive parts may be merged when their sum does not
exceed the largest part; realizing the coarsening realizes the original. -/
theorem tripod_merge_two_noncentral {m : ℕ} (arms : Fin m → ℕ)
    (center a b : ℕ) (rest : List ℕ)
    (ha : 0 < a) (hb : 0 < b) (hpos : ∀ x ∈ rest, 0 < x)
    (hab : a+b ≤ center) (hmax : ∀ x ∈ rest, x ≤ center)
    (htotal : center+a+b+rest.sum = 1+∑ j, arms j)
    (hcoarse : Partitionable arms (center::(a+b)::rest).get) :
    Partitionable arms (center::a::b::rest).get := by
  let groups : List (ℕ × List ℕ) := (a,[b])::rest.map (fun x => (x,[]))
  have hp : ∀ g ∈ groups, ∀ x ∈ groupPieces g, 0 < x := by
    intro g hg x hx
    simp only [groups, List.mem_cons, List.mem_map] at hg
    rcases hg with rfl | ⟨y,hy,rfl⟩
    · simp only [groupPieces, List.mem_cons, List.not_mem_nil, or_false] at hx
      rcases hx with rfl | rfl <;> assumption
    · simp only [groupPieces, List.mem_cons, List.not_mem_nil, or_false] at hx
      subst x
      exact hpos y hy
  have hm : ∀ g ∈ groups, groupSize g ≤ center := by
    intro g hg
    simp only [groups, List.mem_cons, List.mem_map] at hg
    rcases hg with rfl | ⟨y,hy,rfl⟩
    · simpa [groupSize] using hab
    · simpa [groupSize] using hmax y hy
  have ht : center+(groups.map groupSize).sum = 1+∑ j, arms j := by
    simpa [groups,groupSize,List.map_map, Function.comp_def, Nat.add_assoc] using htotal
  let coarse : Fin (groups.length+1) → ℕ := Fin.cases center (fun j => groupSize (groups.get j))
  have hlist : List.ofFn coarse = center::(a+b)::rest := by
    rw [List.ofFn_succ]
    change center::(List.ofFn fun j : Fin groups.length => groupSize (groups.get j)) = _
    have hs : (List.ofFn fun j : Fin groups.length => groupSize (groups.get j)) = groups.map groupSize := by
      rw [List.ofFn_eq_map]
      change (List.finRange groups.length).map (groupSize ∘ groups.get) = _
      rw [← List.map_map,List.map_get_finRange]
    rw [hs]
    simp [groups,groupSize, List.map_map, Function.comp_def]
  have hc : Partitionable arms coarse := by
    apply partitionable_from_ofFn arms coarse
    rw [hlist]
    exact hcoarse
  have hf := refine_grouped_noncentral arms center groups hp hm ht hc
  have hout : center::groups.flatMap groupPieces = center::a::b::rest := by
    simp [groups,groupPieces, List.flatMap_map]
  rw [hout] at hf
  exact hf

def NoMergeablePair (center : ℕ) (parts : List ℕ) : Prop :=
  ∀ a b rest, parts.Perm (a::b::rest) → center < a+b

/-- Repeatedly merge any two noncentral parts whose sum does not exceed
the largest part. This terminates and reduces to the no-mergeable-pair case. -/
theorem tripod_reduce_to_unmergeable {m : ℕ} (arms : Fin m → ℕ) (center : ℕ)
    (hbase : ∀ parts : List ℕ,
      (∀ x ∈ parts, 0 < x ∧ x ≤ center) →
      center+parts.sum = 1+∑ j, arms j →
      NoMergeablePair center parts → Partitionable arms (center::parts).get) :
    ∀ parts : List ℕ, (∀ x ∈ parts, 0 < x ∧ x ≤ center) →
      center+parts.sum = 1+∑ j, arms j → Partitionable arms (center::parts).get := by
  have main : ∀ n : ℕ, ∀ parts : List ℕ, parts.length = n →
      (∀ x ∈ parts, 0 < x ∧ x ≤ center) →
      center+parts.sum = 1+∑ j, arms j → Partitionable arms (center::parts).get := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro parts hn hbounds htotal
      by_cases hterminal : NoMergeablePair center parts
      · exact hbase parts hbounds htotal hterminal
      · unfold NoMergeablePair at hterminal
        push Not at hterminal
        obtain ⟨a,b,rest,hperm,hab⟩ := hterminal
        have ha : 0 < a ∧ a ≤ center := hbounds a (hperm.mem_iff.mpr (by simp))
        have hb : 0 < b ∧ b ≤ center := hbounds b (hperm.mem_iff.mpr (by simp))
        have hrest : ∀ x ∈ rest, 0 < x ∧ x ≤ center := by
          intro x hx
          exact hbounds x (hperm.mem_iff.mpr (by simp [hx]))
        have ht : center+a+b+rest.sum = 1+∑ j, arms j := by
          have hh := hperm.sum_eq
          simp only [List.sum_cons] at hh
          omega
        have hlt : ((a+b)::rest).length < n := by
          have hh := hperm.length_eq
          simp only [List.length_cons] at hh ⊢
          omega
        have hmerged : ∀ x ∈ (a+b)::rest, 0 < x ∧ x ≤ center := by
          intro x hx
          simp only [List.mem_cons] at hx
          rcases hx with rfl | hx
          · exact ⟨by omega,hab⟩
          · exact hrest x hx
        have htmerged : center+((a+b)::rest).sum = 1+∑ j, arms j := by
          simp only [List.sum_cons]
          omega
        have hc := ih _ hlt ((a+b)::rest) rfl hmerged htmerged
        have href := tripod_merge_two_noncentral arms center a b rest ha.1 hb.1
          (fun x hx => (hrest x hx).1) hab (fun x hx => (hrest x hx).2) ht hc
        exact (partitionable_list_perm arms _ _ (hperm.cons center)).2 href
  intro parts hbounds htotal
  exact main parts.length parts rfl hbounds htotal

end Hornak
