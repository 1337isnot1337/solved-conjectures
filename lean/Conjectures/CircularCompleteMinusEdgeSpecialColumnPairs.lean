import Conjectures.CircularCompleteMinusEdgeNormalColumnLabels

/-! Translation by half the period permutes the actual special
columns, giving the paired form in the recorded argument. -/

namespace CircularCompleteMinusEdge

def tableHalfShift {h : ℕ} (hh : 0<h) (c : Fin (2*h)) : Fin (2*h) :=
  ⟨(c.val+h)%(2*h),Nat.mod_lt _ (by omega)⟩

theorem tableHalfShift_involutive {h : ℕ} (hh : 0<h) :
    Function.Involutive (tableHalfShift hh) := by
  intro c
  apply Fin.ext
  change (((c.val+h)%(2*h))+h)%(2*h)=c.val
  rw [Nat.mod_add_mod, Nat.add_assoc, show h+h=2*h by omega,
    Nat.add_mod_right,Nat.mod_eq_of_lt c.isLt]

variable {V : Type*} [Fintype V] [DecidableEq V]
    {u v : V} [Fintype (graph u v).edgeSet] {h : ℕ} [NeZero (2*h-1)]
    {C : ProperColoring (graph u v) (2*h-1)}

theorem actual_special_column_halfShift (L : LinearEdgeOrder C) (huv : u≠v)
    (hh : 4≤h) (hV : Fintype.card V=2*h-1) :
    ∃ S : Fin (2*h)→Prop,
      (∀ i : Fin (Fintype.card (graph u v).edgeSet),
        S ⟨i.val%(2*h),Nat.mod_lt _ (by omega)⟩ ↔
          (u∈L.verticesAt i ∨ v∈L.verticesAt i)) ∧
      Nat.card {a : Fin (2*h) // S a ∧ a.val<h}=2 ∧
      Nat.card {a : Fin (2*h) // S a ∧ h≤a.val}=2 ∧
      (∀ c : Fin (2*h), S c ↔ S (tableHalfShift (by omega : 0<h) c)) := by
  obtain ⟨b,S,_,_,hS,hA,hB,E,hE⟩ := actual_normal_column_labeling L huv hh hV
  let σ := tableHalfShift (by omega : 0<h)
  have hInv := tableHalfShift_involutive (by omega : 0<h)
  have hC (c : Fin (2*h)) (hc : ¬S c) : ¬S (σ c) := by
    obtain ⟨x,hx⟩ := E.surjective ⟨c,hc⟩
    have hy : (E x).val=c := congrArg Subtype.val hx
    have he : ¬S (σ (E x).val) := (hE x).2
    rwa [hy] at he
  refine ⟨S,hS,hA,hB,fun c => ?_⟩
  constructor
  · intro hc
    by_contra h
    have he := hC (σ c) h
    have e : σ (σ c)=c := hInv c
    exact he (e.symm ▸ hc)
  · intro hc
    by_contra h
    exact hC c h hc

end CircularCompleteMinusEdge
