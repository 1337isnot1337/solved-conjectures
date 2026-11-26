import Conjectures.CircularThreeBlockGraphs

/-! Three unused colour windows force the degree of a vertex strictly below
the general window bound. -/

namespace CircularIndex.Insertion.ThreeBlock

open SimpleGraph

theorem degree_lt_of_empty_windows {n p k d z : ℕ} [NeZero p] (S : ClassSchedule n p k)
    (v : Fin n) (hp : p=3*d+2) (hz : z+4<p)
    (miss : ∀ i : Fin p × Fin k, z ≤ i.1.val → i.1.val ≤ z+4 → v ∉ S.pair i) :
    S.graph.degree v<d := by
  classical
  let edge (e : S.graph.incidenceSet v) : S.graph.edgeSet := ⟨e.val,e.property.1⟩
  let start (a : S.graph.incidenceSet v × Fin 3) : ZMod p :=
    S.coloring.colors (edge a.1)-(a.2.val : ZMod p)
  let reserve (a : Fin 3) : ZMod p := ((z+a.val : ℕ) : ZMod p)
  have offset (a : S.graph.incidenceSet v × Fin 3) :
      (S.coloring.colors (edge a.1)-start a).val=a.2.val := by
    dsimp only [start]
    rw [sub_sub_cancel,ZMod.val_natCast_of_lt (a.2.isLt.trans_le (by omega))]
  have left : Function.Injective start := by
    intro a b h
    have e := S.coloring.window_matching (start a) (edge a.1) (edge b.1)
      (by rw [offset]; exact a.2.isLt) (by rw [h,offset]; exact b.2.isLt)
      ⟨v,a.1.property.2,b.1.property.2⟩
    apply Prod.ext
    · exact Subtype.ext (congrArg (fun x : S.graph.edgeSet => x.val) e)
    · apply Fin.ext
      rw [←offset a,←offset b,h,e]
  have right : Function.Injective reserve := by
    intro a b h
    have ev := congrArg ZMod.val h
    dsimp only [reserve] at ev
    rw [ZMod.val_natCast_of_lt (by omega : z+a.val<p),ZMod.val_natCast_of_lt (by omega : z+b.val<p)] at ev
    exact Fin.ext (by omega)
  have apart (a : S.graph.incidenceSet v × Fin 3) (r : Fin 3) : start a ≠ reserve r := by
    intro eq
    let i := S.edgeEquiv.symm (edge a.1)
    have val : ((i.1.val : ℕ) : ZMod p)=((z+r.val+a.2.val : ℕ) : ZMod p) := by
      rw [Nat.cast_add]
      exact sub_eq_iff_eq_add.mp eq
    have hv := congrArg ZMod.val val
    rw [ZMod.val_natCast_of_lt i.1.isLt,ZMod.val_natCast_of_lt (by omega : z+r.val+a.2.val<p)] at hv
    have ep : S.pair i=(edge a.1).val := congrArg Subtype.val (S.edgeEquiv.apply_symm_apply _)
    exact miss i (by omega) (by omega) (ep ▸ a.1.property.2)
  let assign := Sum.elim start reserve
  have inj : Function.Injective assign := by
    intro a b h
    cases a with
    | inl a =>
      cases b with
      | inl b => exact congrArg Sum.inl (left h)
      | inr b => exact False.elim (apart a b h)
    | inr a =>
      cases b with
      | inl b => exact False.elim (apart b a h.symm)
      | inr b => exact congrArg Sum.inr (right h)
  have count := Fintype.card_le_of_injective assign inj
  simp only [Fintype.card_sum,Fintype.card_prod,Fintype.card_fin,S.graph.card_incidenceSet_eq_degree,ZMod.card] at count
  omega

/-- Vertex 6, 7 or 8 is outside the consecutive copies of the same
three original class supports at the corresponding insertion. -/
theorem misses_support {g c x t : ℕ} (hg : 15≤g) (ht : t<3)
    (hc : 9*t≤c) (hd : c≤9*t+4) (hx : Support g (kind c) x) :
    rotate (vertexCount g) x (baseShift g (reference c)) ≠ 6+t := by
  rcases (show t=0 ∨ t=1 ∨ t=2 by omega) with rfl|rfl|rfl
  all_goals interval_cases c
  all_goals norm_num [Support,kind,reference,rotate,baseShift,vertexCount] at hx ⊢
  all_goals split_ifs <;> omega

theorem deficient {g : ℕ} (hg : 15≤g) (K : Packing g) (t : Fin 3) :
    (schedule hg K).graph.degree (⟨6+t.val,by unfold vertexCount; omega⟩ : Fin (vertexCount g)) < 4*g+3 := by
  let _ : NeZero (colours g) := ⟨by unfold colours vertexCount; omega⟩
  apply degree_lt_of_empty_windows (z := 9*t.val) _ _ (by unfold colours vertexCount; omega)
    (by unfold colours vertexCount; omega)
  intro i h₁ h₂ hv
  obtain ⟨_,_,ha,hb⟩ := rawPair_spec (K := K) (c := i.1.val) hg i.2.isLt
  rcases Sym2.mem_iff.mp hv with h|h
  · exact misses_support hg t.isLt h₁ h₂ ha (congrArg Fin.val h).symm
  · exact misses_support hg t.isLt h₁ h₂ hb (congrArg Fin.val h).symm

end CircularIndex.Insertion.ThreeBlock
