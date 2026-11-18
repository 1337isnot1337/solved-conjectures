import Conjectures.FiniteCertificate

namespace FiniteCertificate

/-- A short indexed proof list certifies its numerical interval inside a
larger finite type, without constructing one list for the entire type. -/
theorem checked_interval_rows {n lo len : Nat} {P : Fin n → Prop}
    (rows : List {q : Fin n // P q})
    (hindices : rows.map (fun r => r.val.val)=List.range' lo len) :
    ∀ q : Fin n, lo≤q.val → q.val<lo+len → P q := by
  intro q hlo hhi
  have hm : q.val∈rows.map (fun r => r.val.val) := by
    rw [hindices,List.mem_range']
    refine ⟨q.val-lo,by omega,?_⟩
    simp only [Nat.one_mul]
    omega
  obtain ⟨r,hr,heq⟩ := List.mem_map.mp hm
  have hq : r.val=q := Fin.ext heq
  exact hq ▸ r.property

end FiniteCertificate
