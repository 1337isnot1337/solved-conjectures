import Conjectures.HornakAssignment

/-! Subset-sum characterization ingredients for the tripod reduction. -/
namespace Hornak

/-- If every part is larger than the short arm, any realizable partition
has a subset of noncentral parts in the Barth middle-arm window. -/
theorem tripod_partition_has_middle_subset {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+1) → ℕ) (t : Fin (q+1))
    (hmax : ∀ k, sizes k ≤ sizes t)
    (hshort : ∀ k, arms 2 < sizes k)
    (htotal : (∑ k, sizes k) = 1+∑ j, arms j)
    (hpart : Partitionable arms sizes) :
    ∃ chosen : Finset {k : Fin (q+1) // k ≠ t},
      InMiddleWindow (arms 1) (arms 2) (sizes t) (∑ k ∈ chosen, sizes k.val) := by
  classical
  obtain ⟨host,hfit⟩ := partition_assigns_with_largest_center arms sizes t hmax hpart
  let I := {k : Fin (q+1) // k ≠ t}
  let chosen : Finset I := Finset.univ.filter (fun k => host k = 1)
  have hno : IsEmpty {k : I // host k = 2} := by
    constructor
    rintro ⟨k,hk⟩
    have hh : (∑ u : {u : I // host u = 2}, sizes u.val.val) ≤ arms 2 := hfit 2
    have hsingle : sizes k.val ≤ ∑ u : {u : I // host u = 2}, sizes u.val.val := by
      have hu : (⟨k,hk⟩ : {u : I // host u = 2}) ∈ Finset.univ := Finset.mem_univ _
      exact Finset.single_le_sum (f := fun u : {u : I // host u = 2} => sizes u.val.val)
        (fun _ _ => Nat.zero_le _) hu
    have h := hshort k.val
    omega
  have hzero : (∑ k : {k : I // host k = 2}, sizes k.val.val) = 0 := by
    exact Fintype.sum_empty _
  have hrest : (∑ k : I, sizes k.val)+sizes t = ∑ k, sizes k := by
    have he := Finset.sum_erase_add Finset.univ sizes (Finset.mem_univ t)
    have hs : (∑ k ∈ Finset.univ.erase t, sizes k) = ∑ k : I, sizes k.val := by
      apply Finset.sum_subtype
      intro k
      simp
    omega
  have hall : (∑ k : I, sizes k.val) = ∑ j : Fin 3, ∑ k : {k : I // host k = j}, sizes k.val.val := by
    calc
      (∑ k : I, sizes k.val) = ∑ z : (Σ j : Fin 3, {k : I // host k = j}), sizes z.2.val.val :=
        ((Equiv.sigmaFiberEquiv host).sum_comp (fun k : I => sizes k.val)).symm
      _ = ∑ j : Fin 3, ∑ k : {k : I // host k = j}, sizes k.val.val :=
        Fintype.sum_sigma _
  have hchosen : (∑ k ∈ chosen, sizes k.val) =
      ∑ k : {k : I // host k = 1}, sizes k.val.val := by
    apply Finset.sum_subtype
    intro k
    simp [chosen]
  refine ⟨chosen,?_⟩
  unfold InMiddleWindow
  rw [hchosen]
  have hm : (∑ k : {k : I // host k = 1}, sizes k.val.val) ≤ arms 1 := hfit 1
  have hl : (∑ k : {k : I // host k = 0}, sizes k.val.val) ≤ arms 0 := hfit 0
  rw [Fin.sum_univ_three] at hall
  rw [hzero] at hall
  have ht := htotal
  rw [Fin.sum_univ_three] at ht
  omega

/-- A middle-window subset gives a capacity-respecting assignment on the
two longer arms and hence a connected tripod partition. -/
theorem middle_subset_realizes_tripod {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+1) → ℕ) (t : Fin (q+1))
    (hpos : ∀ k, 0 < sizes k)
    (htotal : (∑ k, sizes k) = 1+∑ j, arms j)
    (chosen : Finset {k : Fin (q+1) // k ≠ t})
    (hwindow : InMiddleWindow (arms 1) (arms 2) (sizes t) (∑ k ∈ chosen, sizes k.val)) :
    Partitionable arms sizes := by
  classical
  let I := {k : Fin (q+1) // k ≠ t}
  let e : Fin q ≃ I := otherLabelsEquiv t
  let rest : Fin q → ℕ := fun k => sizes (e k).val
  let host : Fin q → Fin 3 := fun k => if e k ∈ chosen then 1 else 0
  have hrest : (∑ k, rest k)+sizes t = ∑ k, sizes k := by
    have he := Finset.sum_erase_add Finset.univ sizes (Finset.mem_univ t)
    have hs : (∑ k ∈ Finset.univ.erase t, sizes k) = ∑ k : I, sizes k.val := by
      apply Finset.sum_subtype
      intro k
      simp
    have hr : (∑ k, rest k) = ∑ k : I, sizes k.val := e.sum_comp (fun k => sizes k.val)
    omega
  have hchosen : (∑ k : {k // host k = 1}, rest k.val) = ∑ k ∈ chosen, sizes k.val := by
    let ej : {k // host k = 1} ≃ {k : I // k ∈ chosen} :=
      Equiv.subtypeEquiv e (by intro k; simp [host])
    calc
      (∑ k : {k // host k = 1}, rest k.val) = ∑ k : {k : I // k ∈ chosen}, sizes k.val.val := by
        apply Fintype.sum_equiv ej
        intro k
        rfl
      _ = ∑ k ∈ chosen, sizes k.val := by
        symm
        exact Finset.sum_subtype chosen (by intro k; rfl) (fun k => sizes k.val)
  have hsum : (∑ k : {k // host k = 0}, rest k.val) +
      (∑ k : {k // host k = 1}, rest k.val) = ∑ k, rest k := by
    have he := (Equiv.sigmaFiberEquiv host).sum_comp rest
    rw [Fintype.sum_sigma, Fin.sum_univ_three] at he
    have hz : IsEmpty {k // host k = 2} := by
      constructor
      rintro ⟨k,hk⟩
      dsimp [host] at hk
      split_ifs at hk <;> contradiction
    have hzsum : (∑ k : {k // host k = 2}, rest k.val) = 0 := Fintype.sum_empty _
    change (∑ k : {k // host k = 0}, rest k.val) +
      (∑ k : {k // host k = 1}, rest k.val) +
      (∑ k : {k // host k = 2}, rest k.val) = ∑ k, rest k at he
    rw [hzsum] at he
    omega
  have hf : ∀ j, (∑ k : {k // host k = j}, rest k.val) ≤ arms j := by
    intro j
    fin_cases j
    · change (∑ k : {k // host k = 0}, rest k.val) ≤ arms 0
      unfold InMiddleWindow at hwindow
      have ht := htotal
      rw [Fin.sum_univ_three] at ht
      omega
    · change (∑ k : {k // host k = 1}, rest k.val) ≤ arms 1
      unfold InMiddleWindow at hwindow
      omega
    · change (∑ k : {k // host k = 2}, rest k.val) ≤ arms 2
      have hz : IsEmpty {k // host k = 2} := by
        constructor
        rintro ⟨k,hk⟩
        dsimp [host] at hk
        split_ifs at hk <;> contradiction
      simp
  have ht : sizes t+(∑ k, rest k) = 1+∑ j, arms j := by omega
  have hp : ∀ k, 0 < rest k := fun k => hpos _
  have hpart := partition_from_assignment arms (sizes t) rest host hp hf ht
  let full : Fin (q+1) ≃ Fin (q+1) := (finSuccEquiv q).trans (finSuccEquiv' t).symm
  apply partitionable_relabel arms (Fin.cases (sizes t) rest) sizes full _ hpart
  intro k
  cases k using Fin.cases with
  | zero => rfl
  | succ k => rfl

/-- Barth's middle-window criterion for tripod partitions whose parts all
exceed the shortest arm, with an arbitrary choice of a largest part. -/
theorem tripod_middle_subset_iff {q : ℕ} (arms : Fin 3 → ℕ)
    (sizes : Fin (q+1) → ℕ) (t : Fin (q+1))
    (hmax : ∀ k, sizes k ≤ sizes t)
    (hshort : ∀ k, arms 2 < sizes k)
    (htotal : (∑ k, sizes k) = 1+∑ j, arms j) :
    Partitionable arms sizes ↔
      ∃ chosen : Finset {k : Fin (q+1) // k ≠ t},
        InMiddleWindow (arms 1) (arms 2) (sizes t) (∑ k ∈ chosen, sizes k.val) := by
  constructor
  · exact tripod_partition_has_middle_subset arms sizes t hmax hshort htotal
  · rintro ⟨chosen,hwindow⟩
    exact middle_subset_realizes_tripod arms sizes t (fun k => by have h := hshort k; omega)
      htotal chosen hwindow

end Hornak
