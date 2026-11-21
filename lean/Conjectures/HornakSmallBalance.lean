import Conjectures.HornakMerge

/-! Initial steps of the all-small branch of the tripod reduction. -/
namespace Hornak

/-- Balancing the unique largest part with a smaller part is reversible:
reserve the reduced largest part centrally and shrink the increased part. -/
theorem balance_unique_largest {m : ℕ} (arms : Fin m → ℕ)
    (largest small : ℕ) (rest : List ℕ)
    (hsmall : 0 < small) (hgap : small+2 ≤ largest)
    (hrestpos : ∀ x ∈ rest, 0 < x) (hrestmax : ∀ x ∈ rest, x ≤ largest-1)
    (htotal : largest+small+rest.sum = 1+∑ j, arms j)
    (hnew : Partitionable arms ((largest-1)::(small+1)::rest).get) :
    Partitionable arms (largest::small::rest).get := by
  classical
  let newSizes : Fin (rest.length+1) → ℕ := Fin.cases (small+1) rest.get
  let oldSizes : Fin (rest.length+1) → ℕ := Fin.cases small rest.get
  have hmax : ∀ k, newSizes k ≤ largest-1 := by
    intro k
    cases k using Fin.cases with
    | zero => change small+1 ≤ largest-1; omega
    | succ k => exact hrestmax _ (List.get_mem _ _)
  have hpnew : Partitionable arms (Fin.cases (largest-1) newSizes) := by
    convert hnew using 1
    funext k
    cases k using Fin.cases with
    | zero => rfl
    | succ k =>
      cases k using Fin.cases with
      | zero => rfl
      | succ k => rfl
  obtain ⟨host,hfit⟩ := largest_first_to_assignment arms (largest-1) newSizes hmax hpnew
  have holdle : ∀ k, oldSizes k ≤ newSizes k := by
    intro k
    cases k using Fin.cases with
    | zero => change small ≤ small+1; omega
    | succ k => exact le_rfl
  have hf : ∀ j, (∑ k : {k // host k = j}, oldSizes k.val) ≤ arms j := by
    intro j
    calc
      (∑ k : {k // host k = j}, oldSizes k.val) ≤ ∑ k : {k // host k = j}, newSizes k.val := by
        exact Finset.sum_le_sum (fun k _ => holdle k.val)
      _ ≤ arms j := hfit j
  have hpos : ∀ k, 0 < oldSizes k := by
    intro k
    cases k using Fin.cases with
    | zero => exact hsmall
    | succ k => exact hrestpos _ (List.get_mem _ _)
  have ht : largest+(∑ k, oldSizes k) = 1+∑ j, arms j := by
    rw [Fin.sum_univ_succ]
    change largest+(small+∑ k : Fin rest.length, rest.get k) = _
    rw [← List.sum_ofFn,List.ofFn_get]
    omega
  have hp := partition_from_assignment arms largest oldSizes host hpos hf ht
  convert hp using 1
  funext k
  cases k using Fin.cases with
  | zero => rfl
  | succ k =>
    cases k using Fin.cases with
    | zero => rfl
    | succ k => rfl

end Hornak
