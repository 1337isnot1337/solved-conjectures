import Conjectures.HornakGrouping

/-! Finite-index encoding of greedy groups for graph refinement. -/
namespace Hornak

/-- The fiber over an index of a dependent sum is the corresponding type. -/
noncomputable def sigmaFirstFiberEquiv {α : Type*} (β : α → Type*) (a : α) :
    {z : (Σ x, β x) // z.1 = a} ≃ β a where
  toFun z := z.property ▸ z.val.2
  invFun b := ⟨⟨a,b⟩,rfl⟩
  left_inv := by
    rintro ⟨⟨x,b⟩,h⟩
    dsimp at h
    subst x
    rfl
  right_inv := by intro b; rfl

/-- Flattening a list of finite groups and reindexing its members
preserves the sum of each group. -/
theorem indexed_group_sum (groups : List (ℕ × List ℕ))
    (j : Fin groups.length) :
    let labels := Σ u : Fin groups.length, Fin (groupPieces (groups.get u)).length
    let e := Fintype.equivFin labels
    let size : Fin (Fintype.card labels) → ℕ := fun k =>
      (groupPieces (groups.get (e.symm k).1)).getD (e.symm k).2.val 0
    let group : Fin (Fintype.card labels) → Fin groups.length := fun k => (e.symm k).1
    (∑ k : {k // group k = j}, size k.val) = groupSize (groups.get j) := by
  classical
  dsimp only
  let labels := Σ u : Fin groups.length, Fin (groupPieces (groups.get u)).length
  let e := Fintype.equivFin labels
  let group : Fin (Fintype.card labels) → Fin groups.length := fun k => (e.symm k).1
  let size : Fin (Fintype.card labels) → ℕ := fun k =>
    (groupPieces (groups.get (e.symm k).1)).getD (e.symm k).2.val 0
  let f : Fin (groupPieces (groups.get j)).length → {k // group k = j} := fun k =>
    ⟨e ⟨j,k⟩, by simp [group]⟩
  have hf : Function.Bijective f := by
    constructor
    · intro a b hab
      have hh := congrArg Subtype.val hab
      apply e.injective at hh
      exact Fin.ext ((Fin.heq_ext_iff rfl).mp (Sigma.mk.inj_iff.mp hh).2)
    · rintro ⟨k,hk⟩
      rcases hval : e.symm k with ⟨u,v⟩
      have hz : u = j := by simpa [group,hval] using hk
      subst u
      refine ⟨v,?_⟩
      apply Subtype.ext
      have hh := e.apply_symm_apply k
      rw [hval] at hh
      exact hh
  let ef := Equiv.ofBijective f hf
  have hsum : (∑ k : {k // group k = j}, size k.val) =
      ∑ k : Fin (groupPieces (groups.get j)).length, (groupPieces (groups.get j)).get k := by
    symm
    apply Fintype.sum_equiv ef
    intro k
    change (groupPieces (groups.get j)).get k =
      (groupPieces (groups.get (e.symm (e ⟨j,k⟩)).1)).getD (e.symm (e ⟨j,k⟩)).2.val 0
    have he : e.symm (e ⟨j,k⟩) = ⟨j,k⟩ := e.symm_apply_apply _
    have hidx := congrArg (fun z : labels => z.2.val) he
    have hfst := congrArg (fun z : labels => z.1) he
    change (e.symm (e ⟨j,k⟩)).2.val = k.val at hidx
    change (e.symm (e ⟨j,k⟩)).1 = j at hfst
    rw [hidx,hfst]
    simp [List.getD_eq_getElem?_getD]
  rw [hsum, ← List.sum_ofFn, List.ofFn_get]
  cases groups.get j with
  | mk anchor extras => simp [groupPieces,groupSize]


theorem indexed_group_weight_sum (weight : ℕ → ℕ) (groups : List (ℕ × List ℕ))
    (j : Fin groups.length) :
    let labels := Σ u : Fin groups.length, Fin (groupPieces (groups.get u)).length
    let e := Fintype.equivFin labels
    let size : Fin (Fintype.card labels) → ℕ := fun k =>
      (groupPieces (groups.get (e.symm k).1)).getD (e.symm k).2.val 0
    let group : Fin (Fintype.card labels) → Fin groups.length := fun k => (e.symm k).1
    (∑ k : {k // group k = j}, weight (size k.val)) =
      ((groupPieces (groups.get j)).map weight).sum := by
  classical
  dsimp only
  let labels := Σ u : Fin groups.length, Fin (groupPieces (groups.get u)).length
  let e := Fintype.equivFin labels
  let group : Fin (Fintype.card labels) → Fin groups.length := fun k => (e.symm k).1
  let size : Fin (Fintype.card labels) → ℕ := fun k =>
    (groupPieces (groups.get (e.symm k).1)).getD (e.symm k).2.val 0
  let f : Fin (groupPieces (groups.get j)).length → {k // group k = j} := fun k =>
    ⟨e ⟨j,k⟩, by simp [group]⟩
  have hf : Function.Bijective f := by
    constructor
    · intro a b hab
      have hh := congrArg Subtype.val hab
      apply e.injective at hh
      exact Fin.ext ((Fin.heq_ext_iff rfl).mp (Sigma.mk.inj_iff.mp hh).2)
    · rintro ⟨k,hk⟩
      rcases hval : e.symm k with ⟨u,v⟩
      have hz : u = j := by simpa [group,hval] using hk
      subst u
      refine ⟨v,?_⟩
      apply Subtype.ext
      have hh := e.apply_symm_apply k
      rw [hval] at hh
      exact hh
  let ef := Equiv.ofBijective f hf
  have hsum : (∑ k : {k // group k = j}, weight (size k.val)) =
      ∑ k : Fin (groupPieces (groups.get j)).length, weight ((groupPieces (groups.get j)).get k) := by
    symm
    apply Fintype.sum_equiv ef
    intro k
    change weight ((groupPieces (groups.get j)).get k) =
      weight ((groupPieces (groups.get (e.symm (e ⟨j,k⟩)).1)).getD (e.symm (e ⟨j,k⟩)).2.val 0)
    have he : e.symm (e ⟨j,k⟩) = ⟨j,k⟩ := e.symm_apply_apply _
    have hidx := congrArg (fun z : labels => z.2.val) he
    have hfst := congrArg (fun z : labels => z.1) he
    change (e.symm (e ⟨j,k⟩)).2.val = k.val at hidx
    change (e.symm (e ⟨j,k⟩)).1 = j at hfst
    rw [hidx,hfst]
    simp [List.getD_eq_getElem?_getD]
  rw [hsum, ← List.sum_ofFn]
  congr 1
  rw [List.ofFn_eq_map]
  change (List.finRange (groupPieces (groups.get j)).length).map (weight ∘ (groupPieces (groups.get j)).get) = _
  rw [← List.map_map, List.map_get_finRange]

theorem list_count_indicator (xs : List ℕ) (n : ℕ) :
    (xs.map (fun x => if x=n then 1 else 0)).sum = xs.count n := by
  induction xs with
  | nil => simp
  | cons x xs ih =>
    by_cases h : x=n <;> simp [h,ih, Nat.add_comm]

/-- Reindexing all members of a list of groups preserves their multiset
of piece sizes. -/
theorem indexed_groups_perm_flatten (groups : List (ℕ × List ℕ)) :
    let labels := Σ u : Fin groups.length, Fin (groupPieces (groups.get u)).length
    let e := Fintype.equivFin labels
    let size : Fin (Fintype.card labels) → ℕ := fun k =>
      (groupPieces (groups.get (e.symm k).1)).getD (e.symm k).2.val 0
    (List.ofFn size).Perm (groups.flatMap groupPieces) := by
  classical
  dsimp only
  let labels := Σ u : Fin groups.length, Fin (groupPieces (groups.get u)).length
  let e := Fintype.equivFin labels
  let size : Fin (Fintype.card labels) → ℕ := fun k =>
    (groupPieces (groups.get (e.symm k).1)).getD (e.symm k).2.val 0
  let group : Fin (Fintype.card labels) → Fin groups.length := fun k => (e.symm k).1
  apply List.perm_iff_count.mpr
  intro n
  have hf : (List.ofFn size).count n = ∑ k, if size k=n then 1 else 0 := by
    rw [← list_count_indicator]
    rw [List.map_ofFn, List.sum_ofFn]
    rfl
  rw [hf, ← Fintype.sum_fiberwise group (fun k => if size k=n then 1 else 0)]
  have hgroups : (∑ j, ∑ k : {k // group k = j}, if size k.val=n then 1 else 0) =
      ∑ j : Fin groups.length, (groupPieces (groups.get j)).count n := by
    apply Finset.sum_congr rfl
    intro j _
    rw [← list_count_indicator]
    exact indexed_group_weight_sum (fun x => if x=n then 1 else 0) groups j
  rw [hgroups, List.count_flatMap]
  rw [← List.sum_ofFn]
  congr 1
  rw [List.ofFn_eq_map]
  change (List.finRange groups.length).map ((List.count n ∘ groupPieces) ∘ groups.get) = _
  rw [← List.map_map, List.map_get_finRange]

/-- A permutation of a complete list of part sizes preserves graph
realizability, including a change in which label is first. -/
theorem partitionable_list_perm {m : ℕ} (arms : Fin m → ℕ) (left right : List ℕ)
    (hp : left.Perm right) : Partitionable arms left.get ↔ Partitionable arms right.get := by
  constructor <;> intro hpart
  · apply partitionable_reorder arms left.get right.get _ hpart
    intro n
    change Nat.card {k : Fin left.length // left[k] = n} = Nat.card {k : Fin right.length // right[k] = n}
    rw [list_fiber_card, list_fiber_card]
    exact hp.count_eq n
  · apply partitionable_reorder arms right.get left.get _ hpart
    intro n
    change Nat.card {k : Fin right.length // right[k] = n} = Nat.card {k : Fin left.length // left[k] = n}
    rw [list_fiber_card, list_fiber_card]
    exact (hp.count_eq n).symm

theorem partitionable_ofFn {m n : ℕ} (arms : Fin m → ℕ) (sizes : Fin n → ℕ)
    (hpart : Partitionable arms sizes) : Partitionable arms (List.ofFn sizes).get := by
  let e : Fin n ≃ Fin (List.ofFn sizes).length := (finCongr List.length_ofFn).symm
  apply partitionable_relabel arms sizes (List.ofFn sizes).get e _ hpart
  intro k
  rw [List.get_ofFn]
  congr 1

/-- A realizable partition into grouped parts can be refined to the
original pieces when the central group's non-anchor pieces fit in the
short arm and all other coarse groups exceed that arm. -/
theorem refine_grouped_tripod (arms : Fin 3 → ℕ) (central : ℕ × List ℕ)
    (groups : List (ℕ × List ℕ))
    (hpos : ∀ g ∈ groups, ∀ x ∈ groupPieces g, 0 < x)
    (hepos : ∀ x ∈ central.2, 0 < x)
    (hshort : ∀ g ∈ groups, arms 2 < groupSize g)
    (hefit : central.2.sum ≤ arms 2)
    (hmax : ∀ g ∈ groups, groupSize g ≤ groupSize central)
    (htotal : groupSize central+(groups.map groupSize).sum = 1+∑ j, arms j)
    (hcoarse : Partitionable arms (Fin.cases (groupSize central) (fun j => groupSize (groups.get j)))) :
    Partitionable arms (central.1::(groups.flatMap groupPieces++central.2)).get := by
  classical
  let labels := Σ u : Fin groups.length, Fin (groupPieces (groups.get u)).length
  let e := Fintype.equivFin labels
  let size : Fin (Fintype.card labels) → ℕ := fun k =>
    (groupPieces (groups.get (e.symm k).1)).getD (e.symm k).2.val 0
  let group : Fin (Fintype.card labels) → Fin groups.length := fun k => (e.symm k).1
  let extra : Fin central.2.length → ℕ := central.2.get
  have hp : ∀ k, 0 < size k := by
    intro k
    have hg : groups.get (e.symm k).1 ∈ groups := List.get_mem _ _
    have hv := hpos _ hg _ (List.get_mem (groupPieces (groups.get (e.symm k).1)) (e.symm k).2)
    dsimp [size]
    simpa [List.getD_eq_getElem?_getD, (e.symm k).2.isLt] using hv
  have hep : ∀ k, 0 < extra k := fun k => hepos _ (List.get_mem _ _)
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
  have hesum : (∑ k, extra k) = central.2.sum := by
    rw [← List.sum_ofFn, List.ofFn_get]
  have hs : ∀ j : Fin groups.length, arms 2 < ∑ k : {k // group k = j}, size k.val := by
    intro j
    rw [hsumGroup]
    exact hshort _ (List.get_mem _ _)
  have hm : ∀ j : Fin groups.length, (∑ k : {k // group k = j}, size k.val) ≤ central.1+∑ k, extra k := by
    intro j
    rw [hsumGroup,hesum]
    exact hmax _ (List.get_mem _ _)
  have ht : central.1+(∑ k, size k)+(∑ k, extra k) = 1+∑ j, arms j := by
    rw [hsg,hesum]
    dsimp [groupSize] at htotal
    omega
  have hc : Partitionable arms (Fin.cases (central.1+∑ k, extra k)
      (fun j => ∑ k : {k // group k = j}, size k.val)) := by
    simp only [hesum, hsumGroup]
    exact hcoarse
  have hp' := refine_all_parts_with_short_arm arms central.1 size extra group hp hep hs
    (by simpa [hesum] using hefit) hm ht hc
  let joined : Fin (Fintype.card labels+central.2.length) → ℕ := fun k =>
    Sum.elim size extra (finSumFinEquiv.symm k)
  have hlist := partitionable_ofFn arms (Fin.cases central.1 joined) hp'
  have hperm : (List.ofFn (Fin.cases central.1 joined)).Perm
      (central.1::(groups.flatMap groupPieces++central.2)) := by
    rw [List.ofFn_succ]
    change (central.1::List.ofFn joined).Perm (central.1::(groups.flatMap groupPieces++central.2))
    apply List.Perm.cons
    rw [List.ofFn_add]
    have heqL : (List.ofFn fun i : Fin (Fintype.card labels) => joined (Fin.castLE (Nat.le_add_right _ _) i)) = List.ofFn size := by
      congr 1
      funext i
      have hc : Fin.castLE (Nat.le_add_right _ _) i = Fin.castAdd central.2.length i := by apply Fin.ext; rfl
      rw [hc]
      simp [joined, ← finSumFinEquiv_apply_left]
    have heqR : (List.ofFn fun i : Fin central.2.length => joined (Fin.natAdd (Fintype.card labels) i)) = central.2 := by
      calc
        (List.ofFn fun i : Fin central.2.length => joined (Fin.natAdd (Fintype.card labels) i)) = List.ofFn extra := by
          congr 1
          funext i
          simp [joined, ← finSumFinEquiv_apply_right]
        _ = central.2 := List.ofFn_get central.2
    rw [heqL,heqR]
    exact (indexed_groups_perm_flatten groups).append_right central.2
  exact (partitionable_list_perm arms _ _ hperm).1 hlist

theorem group_flat_sum (groups : List (ℕ × List ℕ)) :
    (groups.flatMap groupPieces).sum = (groups.map groupSize).sum := by
  induction groups with
  | nil => rfl
  | cons g gs ih =>
    cases g with
    | mk a xs => simp [groupPieces,groupSize,ih,Nat.add_assoc]

/-- Choose a group with largest total size. -/
theorem exists_largest_group (groups : List (ℕ × List ℕ)) (hne : groups ≠ []) :
    ∃ central ∈ groups, ∀ g ∈ groups, groupSize g ≤ groupSize central := by
  let values := groups.map groupSize
  have hv : values ≠ [] := by simpa [values] using hne
  have hm : values.max hv ∈ values := List.max_mem hv
  obtain ⟨central,hcentral,heq⟩ := List.mem_map.mp hm
  refine ⟨central,hcentral,?_⟩
  intro g hg
  have h : groupSize g ≤ values.max hv := by
    apply List.le_max_of_mem
    exact List.mem_map.mpr ⟨g,hg,rfl⟩
  rw [heq]
  exact h

/-- Source tests 1 and 5 realize every positive tripod partition that
contains at least one part larger than the shortest arm. -/
theorem tripod_with_large_part_from_source (arms : Fin 3 → ℕ) (hshortpos : 0 < arms 2)
    (hcarry : ∀ k, 0 < k → k ≤ arms 1+arms 2 → (∑ j, arms j%k)/k ≤ 1)
    (hsource5 : ∀ i, 0 < i → i ≤ arms 1+arms 2 → ∀ a b : ℕ, a ≤ i → 1 ≤ b →
      a*i+b*(i+1) = 1+∑ j, arms j →
      (∑ j, arms j%(i+1))/(i+1) = 1 →
      ∃ p : Fin 3, (∑ j, arms j%(i+1))%(i+1) < arms p%(i+1) ∧
        i+1 ≤ arms p/i+arms p%(i+1))
    (sentinel : ℕ) (parts : List ℕ) (hsentinel : arms 2 < sentinel)
    (hpos : ∀ x ∈ parts, 0 < x)
    (htotal : sentinel+parts.sum = 1+∑ j, arms j) :
    Partitionable arms (Fin.cases sentinel parts.get) := by
  classical
  obtain ⟨groups,hperm,hgroups⟩ := greedy_groups (arms 2) [] parts sentinel (by simp) hsentinel
  have hperm : (groups.flatMap groupPieces).Perm (parts++[sentinel]) := by simpa using hperm
  have hne : groups ≠ [] := by
    intro he
    subst groups
    have hh := hperm.length_eq
    simp at hh
  obtain ⟨central,hcentral,hmax⟩ := exists_largest_group groups hne
  let others := groups.erase central
  have hgroupperm : groups.Perm (central::others) := List.perm_cons_erase hcentral
  have hother (g) (hg : g ∈ others) : g ∈ groups :=
    hgroupperm.mem_iff.mpr (by simp [hg])
  have hpieces (g) (hg : g ∈ groups) (x) (hx : x ∈ groupPieces g) : 0 < x := by
    have hflat : x ∈ groups.flatMap groupPieces := List.mem_flatMap.mpr ⟨g,hg,hx⟩
    have horig := hperm.mem_iff.mp hflat
    simp only [List.mem_append, List.mem_cons, List.not_mem_nil, or_false] at horig
    rcases horig with h | h
    · exact hpos x h
    · subst x; omega
  have hotherpos : ∀ g ∈ others, ∀ x ∈ groupPieces g, 0 < x := by
    intro g hg x hx
    exact hpieces g (hother g hg) x hx
  have hcentralpos : ∀ x ∈ central.2, 0 < x := by
    intro x hx
    apply hpieces central hcentral x
    simp [groupPieces,hx]
  have hothershort : ∀ g ∈ others, arms 2 < groupSize g := by
    intro g hg
    exact (hgroups g (hother g hg)).1
  have hcenterfit : central.2.sum ≤ arms 2 := (hgroups central hcentral).2
  have hcentershort : arms 2 < groupSize central := (hgroups central hcentral).1
  have hothermax : ∀ g ∈ others, groupSize g ≤ groupSize central := by
    intro g hg
    exact hmax g (hother g hg)
  have htotalGroups : groupSize central+(others.map groupSize).sum = 1+∑ j, arms j := by
    have hs := hperm.sum_eq
    rw [group_flat_sum] at hs
    have hgs := (hgroupperm.map groupSize).sum_eq
    simp only [List.map_cons, List.sum_cons] at hgs
    simp only [List.sum_append, List.sum_cons, List.sum_nil, add_zero] at hs
    omega
  let coarseParts := others.map groupSize
  have hcoarsemax : ∀ x ∈ coarseParts, x ≤ groupSize central := by
    intro x hx
    obtain ⟨g,hg,rfl⟩ := List.mem_map.mp hx
    exact hothermax g hg
  have hcoarseshort : ∀ x ∈ coarseParts, arms 2 < x := by
    intro x hx
    obtain ⟨g,hg,rfl⟩ := List.mem_map.mp hx
    exact hothershort g hg
  have hcoarse' := large_parts_from_index_range arms hshortpos hcarry hsource5
    (groupSize central) coarseParts hcoarsemax hcentershort hcoarseshort htotalGroups
  have hcoarse : Partitionable arms (Fin.cases (groupSize central) (fun j => groupSize (others.get j))) := by
    let len : coarseParts.length+1 = others.length+1 := by simp [coarseParts]
    let ee : Fin (coarseParts.length+1) ≃ Fin (others.length+1) := finCongr len
    apply partitionable_relabel arms (Fin.cases (groupSize central) coarseParts.get)
      (Fin.cases (groupSize central) (fun j => groupSize (others.get j))) ee _ hcoarse'
    intro k
    cases k using Fin.cases with
    | zero => simp [ee]
    | succ k =>
      simp [ee, coarseParts, finCongr_apply, List.getElem_map]
  have hrefined := refine_grouped_tripod arms central others hotherpos hcentralpos hothershort
    hcenterfit hothermax htotalGroups hcoarse
  have hflatperm : (central.1::(others.flatMap groupPieces++central.2)).Perm (sentinel::parts) := by
    have hgflat := hgroupperm.flatMap (fun g _ => List.Perm.refl (groupPieces g))
    have hswap : (central.1::(others.flatMap groupPieces++central.2)).Perm
        ((central::others).flatMap groupPieces) := by
      simp only [List.flatMap_cons,groupPieces]
      exact (List.perm_append_comm (l₁ := others.flatMap groupPieces) (l₂ := central.2)).cons central.1
    have hend : (parts++[sentinel]).Perm (sentinel::parts) := by
      simp
    exact hswap.trans (hgflat.symm.trans (hperm.trans hend))
  have hp := (partitionable_list_perm arms _ _ hflatperm).1 hrefined
  have heq : (sentinel::parts).get = (Fin.cases sentinel parts.get : Fin (parts.length+1) → ℕ) := by
    funext k
    cases k using Fin.cases with
    | zero => rfl
    | succ k => rfl
  rw [heq] at hp
  exact hp

end Hornak
