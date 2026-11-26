import Mathlib.Algebra.Order.Ring.Nat

/-! A predicate closed in both directions under the table period
is exactly a union of full columns in the finite initial interval. -/

namespace CircularCompleteMinusEdge

private def columnRepresentative {N : ℕ} (period : ℕ) (i : Fin N) : Fin N :=
  ⟨i.val%period,(Nat.mod_le _ _).trans_lt i.isLt⟩

/-- Forward and backward one-period closure suffice for a predicate
to be constant on every column, even when the final row is partial. -/
theorem predicate_constant_on_table_columns {N period : ℕ} (hp : 0<period)
    (S : Fin N→Prop)
    (hStep : ∀ i j : Fin N,j.val=i.val+period → (S i ↔ S j)) :
    ∀ i j : Fin N,i.val%period=j.val%period → (S i ↔ S j) := by
  have go (k : ℕ) (i : Fin N) (hk : i.val=k) :
      S i ↔ S (columnRepresentative period i) := by
    induction k using Nat.strong_induction_on generalizing i with
    | h k ih =>
      by_cases ho : i.val<period
      · have he : columnRepresentative period i=i :=
          Fin.ext (Nat.mod_eq_of_lt ho)
        rw [he]
      · have hn : period≤i.val := by omega
        let j : Fin N := ⟨i.val-period,(Nat.sub_le _ _).trans_lt i.isLt⟩
        have hEq : i.val=j.val+period := by
          change i.val=(i.val-period)+period
          omega
        have hj : j.val<k := by
          change i.val-period<k
          omega
        have hRem : columnRepresentative period j=columnRepresentative period i := by
          apply Fin.ext
          change j.val%period=i.val%period
          rw [hEq,Nat.add_mod_right]
        exact (hStep j i hEq).symm.trans ((ih j.val hj j rfl).trans (hRem ▸ Iff.rfl))
  intro i j h
  have he : columnRepresentative period i=columnRepresentative period j := Fin.ext h
  exact (go i.val i rfl).trans (he.symm ▸ (go j.val j rfl).symm)

end CircularCompleteMinusEdge
