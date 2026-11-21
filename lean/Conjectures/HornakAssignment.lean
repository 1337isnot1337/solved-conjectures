import Conjectures.HornakReductionGraph

/-! Converting a finite arm assignment into lists of pieces. -/
namespace Hornak

noncomputable def hostPieceList {m q : ℕ} (host : Fin q → Fin m)
    (sizes : Fin q → ℕ) (j : Fin m) : List ℕ :=
  List.ofFn (fun k : Fin (Fintype.card {t // host t = j}) =>
    sizes ((Fintype.equivFin {t // host t = j}).symm k).val)

theorem host_piece_list_sum {m q : ℕ} (host : Fin q → Fin m)
    (sizes : Fin q → ℕ) (j : Fin m) :
    (hostPieceList host sizes j).sum = ∑ t : {t // host t = j}, sizes t.val := by
  classical
  unfold hostPieceList
  rw [List.sum_ofFn]
  exact Fintype.sum_equiv (Fintype.equivFin {t // host t = j}).symm _ _ (by intro k; rfl)

theorem host_piece_list_positive {m q : ℕ} (host : Fin q → Fin m)
    (sizes : Fin q → ℕ) (hpos : ∀ t, 0 < sizes t) (j : Fin m) :
    ∀ x ∈ hostPieceList host sizes j, 0 < x := by
  intro x hx
  rcases List.mem_ofFn.mp hx with ⟨k,rfl⟩
  exact hpos _

noncomputable def hostPieceIndexEquiv {m q : ℕ} (host : Fin q → Fin m)
    (sizes : Fin q → ℕ) (j : Fin m) :
    Fin (hostPieceList host sizes j).length ≃ {t // host t = j} := by
  let hc : (hostPieceList host sizes j).length = Fintype.card {t // host t = j} := by
    simp [hostPieceList]
  exact (finCongr hc).trans (Fintype.equivFin {t // host t = j}).symm

theorem host_piece_index_value {m q : ℕ} (host : Fin q → Fin m)
    (sizes : Fin q → ℕ) (j : Fin m) (k : Fin (hostPieceList host sizes j).length) :
    (hostPieceList host sizes j).getD k.val 0 = sizes (hostPieceIndexEquiv host sizes j k).val := by
  classical
  rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem k.isLt]
  simp only [Option.getD_some]
  unfold hostPieceList at *
  rw [List.getElem_ofFn]
  congr 2

/-- Reindexing piece labels by a bijection preserves graph realizability. -/
theorem partitionable_relabel {m p q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin p → ℕ) (sizes' : Fin q → ℕ) (e : Fin p ≃ Fin q)
    (he : ∀ k, sizes' (e k) = sizes k)
    (hpart : Partitionable arms sizes) : Partitionable arms sizes' := by
  obtain ⟨color,hcolor⟩ := hpart
  refine ⟨fun v => e (color v),?_⟩
  intro k
  have hset : {v : Vertex arms | e (color v) = k} = {v | color v = e.symm k} := by
    ext v
    constructor
    · intro h
      apply e.injective
      simpa using h
    · intro h
      change color v = e.symm k at h
      change e (color v) = k
      rw [h,e.apply_symm_apply]
  have hcard : Fintype.card {v : Vertex arms // e (color v) = k} =
      Fintype.card {v : Vertex arms // color v = e.symm k} :=
    Fintype.card_congr (Set.equivOfEq hset)
  have hs : sizes' k = sizes (e.symm k) := by simpa using he (e.symm k)
  constructor
  · rw [hcard, (hcolor (e.symm k)).1, hs]
  · rw [hset]
    exact (hcolor (e.symm k)).2

/-- Any capacity-respecting assignment of positive noncentral parts to
arms gives a connected graph partition with the requested central size. -/
theorem partition_from_assignment {m q : ℕ} (arms : Fin m → ℕ)
    (center : ℕ) (sizes : Fin q → ℕ) (host : Fin q → Fin m)
    (hpos : ∀ k, 0 < sizes k)
    (hfit : ∀ j, (∑ t : {t // host t = j}, sizes t.val) ≤ arms j)
    (htotal : center+(∑ k, sizes k) = 1+∑ j, arms j) :
    Partitionable arms (Fin.cases center sizes) := by
  classical
  let pieces := hostPieceList host sizes
  let cut : Fin m → ℕ := fun j => arms j-(pieces j).sum
  let labels := Σ j, Fin (pieces j).length
  let e := Fintype.equivFin labels
  have hp : ∀ j x, x ∈ pieces j → 0 < x := host_piece_list_positive host sizes hpos
  have hf : ∀ j, (pieces j).sum ≤ arms j := by
    intro j
    rw [host_piece_list_sum]
    exact hfit j
  have hpSum : (∑ j, (pieces j).sum) = ∑ k, sizes k := by
    simp only [pieces, host_piece_list_sum]
    calc
      (∑ j, ∑ t : {t // host t = j}, sizes t.val) =
          ∑ z : (Σ j, {t // host t = j}), sizes z.2.val :=
        (Fintype.sum_sigma (fun z : (Σ j, {t // host t = j}) => sizes z.2.val)).symm
      _ = ∑ k, sizes k := (Equiv.sigmaFiberEquiv host).sum_comp sizes
  have hc : 1+∑ j, cut j = center := by
    have hsum : (∑ j, cut j)+(∑ j, (pieces j).sum) = ∑ j, arms j := by
      rw [← Finset.sum_add_distrib]
      apply Finset.sum_congr rfl
      intro j _
      dsimp [cut]
      exact Nat.sub_add_cancel (hf j)
    omega
  have hpart := realize_list_allocations arms pieces hp hf
  change Partitionable arms (Fin.cases (1+∑ j, cut j)
    (fun k => (pieces (e.symm k).1).getD (e.symm k).2.val 0)) at hpart
  let labelsEquiv : labels ≃ Fin q :=
    (Equiv.sigmaCongrRight (hostPieceIndexEquiv host sizes)).trans (Equiv.sigmaFiberEquiv host)
  let indexEquiv : Fin (Fintype.card labels) ≃ Fin q := e.symm.trans labelsEquiv
  let fullEquiv : Fin (Fintype.card labels+1) ≃ Fin (q+1) :=
    (finSuccEquiv _).trans ((Equiv.optionCongr indexEquiv).trans (finSuccEquiv _).symm)
  apply partitionable_relabel arms _ (Fin.cases center sizes) fullEquiv _ hpart
  intro k
  cases k using Fin.cases with
  | zero =>
    change center = 1+∑ j, cut j
    exact hc.symm
  | succ k =>
    change sizes (indexEquiv k) = (pieces (e.symm k).1).getD (e.symm k).2.val 0
    change sizes (hostPieceIndexEquiv host sizes (e.symm k).1 (e.symm k).2).val = _
    exact (host_piece_index_value host sizes (e.symm k).1 (e.symm k).2).symm

/-- A connected partition whose first part contains the center induces a
capacity-respecting assignment of all other parts. -/
theorem centered_partition_to_assignment {m q : ℕ} (arms : Fin m → ℕ)
    (center : ℕ) (sizes : Fin q → ℕ)
    (color : Vertex arms → Fin (q+1))
    (hcolor : ∀ k, Fintype.card {v : Vertex arms // color v = k} = Fin.cases center sizes k ∧
      ((graph arms).induce {v | color v = k}).Connected)
    (hcenter : color none = 0) :
    ∃ host : Fin q → Fin m, ∀ j,
      (∑ t : {t // host t = j}, sizes t.val) ≤ arms j := by
  classical
  have hhost (k : {k : Fin (q+1) // k ≠ color none}) :
      ∃ i : Fin m, ∀ v, color v = k.val → branch v = some i := by
    apply connected_piece_has_arm {v | color v = k.val}
    · change color none ≠ k.val
      exact Ne.symm k.property
    · exact (hcolor k.val).2
  choose host0 hhost using hhost
  let step : Fin q → {k : Fin (q+1) // k ≠ color none} := fun k =>
    ⟨k.succ, by rw [hcenter]; exact Fin.succ_ne_zero k⟩
  have hstep : Function.Bijective step := by
    constructor
    · intro a b hab
      have hh := congrArg Subtype.val hab
      exact (Fin.succ_injective q) hh
    · rintro ⟨k,hk⟩
      cases k using Fin.cases with
      | zero => exact (hk hcenter.symm).elim
      | succ k => exact ⟨k,Subtype.ext rfl⟩
  let e : Fin q ≃ {k : Fin (q+1) // k ≠ color none} := Equiv.ofBijective step hstep
  let host : Fin q → Fin m := fun k => host0 (e k)
  refine ⟨host,?_⟩
  intro j
  let ej : {t // host t = j} ≃ {k : {k : Fin (q+1) // k ≠ color none} // host0 k = j} :=
    Equiv.subtypeEquiv e (fun _ => Iff.rfl)
  have hh := hosted_classes_fit arms (Fin.cases center sizes) color
    (fun k => (hcolor k).1) host0 hhost j
  have heq : (∑ t : {t // host t = j}, sizes t.val) =
      ∑ k : {k : {k : Fin (q+1) // k ≠ color none} // host0 k = j},
        Fin.cases center sizes k.val.val := by
    apply Fintype.sum_equiv ej
    intro t
    rfl
  rw [heq]
  exact hh

/-- Replacing one assigned part by a no-larger former center part keeps
every arm within capacity and transfers the size difference to the center. -/
theorem assignment_swap_larger_center {m q : ℕ} (arms : Fin m → ℕ)
    (center : ℕ) (sizes : Fin q → ℕ) (host : Fin q → Fin m) (t : Fin q)
    (hlarge : center ≤ sizes t)
    (hfit : ∀ j, (∑ k : {k // host k = j}, sizes k.val) ≤ arms j) :
    (∀ j, (∑ k : {k // host k = j}, (Function.update sizes t center) k.val) ≤ arms j) ∧
    sizes t+(∑ k, (Function.update sizes t center) k) = center+∑ k, sizes k := by
  classical
  constructor
  · intro j
    calc
      (∑ k : {k // host k = j}, (Function.update sizes t center) k.val) ≤
          ∑ k : {k // host k = j}, sizes k.val := by
        apply Finset.sum_le_sum
        intro k _
        by_cases h : k.val=t
        · subst t
          simpa using hlarge
        · simp [Function.update_of_ne h]
      _ ≤ arms j := hfit j
  · have hh := sum_update_balance Finset.univ sizes t (Finset.mem_univ t) center
    change (∑ k, Function.update sizes t center k)+sizes t = (∑ k, sizes k)+center at hh
    omega

/-- Label the indices other than a chosen center by a standard finite type. -/
noncomputable def otherLabelsEquiv {q : ℕ} (c : Fin (q+1)) :
    Fin q ≃ {k : Fin (q+1) // k ≠ c} := by
  let f : Fin q → {k : Fin (q+1) // k ≠ c} := fun k => ⟨c.succAbove k, Fin.succAbove_ne c k⟩
  apply Equiv.ofBijective f
  constructor
  · intro a b hab
    have hh := congrArg Subtype.val hab
    exact Fin.succAbove_right_injective hh
  · rintro ⟨k,hk⟩
    let e := finSuccEquiv' c
    cases he : e k with
    | none =>
      have hh := e.symm_apply_apply k
      rw [he, finSuccEquiv'_symm_none] at hh
      exact (hk hh.symm).elim
    | some t =>
      refine ⟨t,?_⟩
      apply Subtype.ext
      have hh := e.symm_apply_apply k
      rw [he, finSuccEquiv'_symm_some] at hh
      exact hh

/-- Every connected partition can be encoded as a finite arm assignment,
with the actual central class singled out. -/
theorem partition_assignment_at_center {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+1) → ℕ) (hpart : Partitionable arms sizes) :
    ∃ c : Fin (q+1), ∃ host : Fin q → Fin m,
      ∀ j, (∑ t : {t // host t = j}, sizes (otherLabelsEquiv c t.val).val) ≤ arms j := by
  classical
  obtain ⟨color,hcolor,host0,hhost⟩ := partition_hosts arms sizes hpart
  let c := color none
  let e := otherLabelsEquiv c
  let host : Fin q → Fin m := fun k => host0 (e k)
  refine ⟨c,host,?_⟩
  intro j
  let ej : {t // host t = j} ≃ {k : {k : Fin (q+1) // k ≠ color none} // host0 k = j} :=
    Equiv.subtypeEquiv e (fun _ => Iff.rfl)
  have hh := hosted_classes_fit arms sizes color (fun k => (hcolor k).1) host0 hhost j
  have heq : (∑ t : {t // host t = j}, sizes (e t.val).val) =
      ∑ k : {k : {k : Fin (q+1) // k ≠ color none} // host0 k = j}, sizes k.val.val := by
    apply Fintype.sum_equiv ej
    intro t
    rfl
  exact heq.trans_le hh

/-- Swapping the former center label with a target label reindexes the
remaining labels without losing or duplicating any part. -/
noncomputable def swapOtherLabels {q : ℕ} (c t : Fin (q+1)) :
    {k : Fin (q+1) // k ≠ c} ≃ {k : Fin (q+1) // k ≠ t} := by
  classical
  apply Equiv.subtypeEquiv (Equiv.swap c t)
  intro k
  simp only [ne_eq, Equiv.swap_apply_eq_iff, Equiv.swap_apply_right]

/-- When the target part is no smaller than the old central part, the
old arm allocation can be reindexed to reserve the target for the center. -/
theorem assignment_reserve_target {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+1) → ℕ) (c t : Fin (q+1))
    (host : {k : Fin (q+1) // k ≠ c} → Fin m)
    (hlarge : sizes c ≤ sizes t)
    (hfit : ∀ j, (∑ k : {k : {k : Fin (q+1) // k ≠ c} // host k = j}, sizes k.val.val) ≤ arms j) :
    ∃ host' : {k : Fin (q+1) // k ≠ t} → Fin m,
      ∀ j, (∑ k : {k : {k : Fin (q+1) // k ≠ t} // host' k = j}, sizes k.val.val) ≤ arms j := by
  classical
  let e := swapOtherLabels c t
  let host' : {k : Fin (q+1) // k ≠ t} → Fin m := fun k => host (e.symm k)
  refine ⟨host',?_⟩
  intro j
  let ej : {k : {k : Fin (q+1) // k ≠ c} // host k = j} ≃
      {k : {k : Fin (q+1) // k ≠ t} // host' k = j} :=
    Equiv.subtypeEquiv e (by intro k; simp [host'])
  have hs : (∑ k : {k : {k : Fin (q+1) // k ≠ t} // host' k = j}, sizes k.val.val) =
      ∑ k : {k : {k : Fin (q+1) // k ≠ c} // host k = j}, sizes (e k.val).val := by
    symm
    exact Fintype.sum_equiv ej _ _ (by intro k; rfl)
  rw [hs]
  calc
    (∑ k : {k : {k : Fin (q+1) // k ≠ c} // host k = j}, sizes (e k.val).val) ≤
        ∑ k : {k : {k : Fin (q+1) // k ≠ c} // host k = j}, sizes k.val.val := by
      apply Finset.sum_le_sum
      intro k _
      change sizes ((Equiv.swap c t) k.val.val) ≤ sizes k.val.val
      by_cases ht : k.val.val=t
      · subst t
        simpa using hlarge
      · have hc : k.val.val ≠ c := k.val.property
        rw [Equiv.swap_apply_of_ne_of_ne hc ht]
    _ ≤ arms j := hfit j

/-- The arm assignment induced by any partition can reserve any largest
part for the center. -/
theorem partition_assigns_with_largest_center {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+1) → ℕ) (t : Fin (q+1))
    (hmax : ∀ k, sizes k ≤ sizes t) (hpart : Partitionable arms sizes) :
    ∃ host : {k : Fin (q+1) // k ≠ t} → Fin m,
      ∀ j, (∑ k : {k : {k : Fin (q+1) // k ≠ t} // host k = j}, sizes k.val.val) ≤ arms j := by
  classical
  obtain ⟨color,hcolor,host,hhost⟩ := partition_hosts arms sizes hpart
  have hfit := hosted_classes_fit arms sizes color (fun k => (hcolor k).1) host hhost
  exact assignment_reserve_target arms sizes (color none) t host (hmax (color none)) hfit

end Hornak
