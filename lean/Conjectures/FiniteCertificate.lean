import Mathlib.Data.List.Range

/-! Small proof-carrying lists certify complete finite families. -/
namespace FiniteCertificate

/-- A checked list of indexed proofs covers a finite family when its index
projection is exactly the complete range. This avoids deeply nested dependent
finite eliminators in large generated certificates. -/
theorem checked_list_rows {n : Nat} {P : Fin n → Prop}
    (rows : List {q : Fin n // P q})
    (hindices : rows.map (fun r => r.val.val)=List.range n) : ∀ q, P q := by
  intro q
  have hm : q.val∈rows.map (fun r => r.val.val) := by
    rw [hindices]
    exact List.mem_range.mpr q.isLt
  obtain ⟨r,hr,hval⟩ := List.mem_map.mp hm
  have heq : r.val=q := Fin.ext hval
  rw [←heq]
  exact r.property

end FiniteCertificate
