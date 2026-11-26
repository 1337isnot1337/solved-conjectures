import Conjectures.CircularCompleteMinusEdgeActualColumnCounts
import Conjectures.CircularCompleteMinusEdgeRunBoundary

/-! The actual normal starts are in bijection with the
nonspecial columns. Their last occurrence lies in the
column shifted by exactly half a period. -/

namespace CircularCompleteMinusEdge

open scoped BigOperators

variable {V : Type*} [Fintype V] [DecidableEq V]
    {u v : V} [Fintype (graph u v).edgeSet] {h : ℕ} [NeZero (2*h-1)]
    {C : ProperColoring (graph u v) (2*h-1)}

omit [Fintype (graph u v).edgeSet] [NeZero (2*h-1)] in
private theorem card_normal_nonendpoint (hV : Fintype.card V=2*h-1)
    {b : V} (huv : u≠v) (hbu : b≠u) (hbv : b≠v) :
    Fintype.card {x : V // x≠u ∧ x≠v ∧ x≠b}=2*h-1-3 := by
  classical
  let A : Finset V := ((Finset.univ.erase u).erase v).erase b
  have he : (Finset.univ.filter fun x : V => x≠u ∧ x≠v ∧ x≠b)=A := by
    ext x
    simp [A,and_comm,and_assoc]
  rw [Fintype.card_subtype,he]
  unfold A
  rw [Finset.card_erase_of_mem (by simp [hbu,hbv]),
    Finset.card_erase_of_mem (by simp [huv.symm]),
    Finset.card_erase_of_mem (Finset.mem_univ u),Finset.card_univ,hV]
  omega

theorem actual_normal_column_labeling (L : LinearEdgeOrder C) (huv : u≠v)
    (hh : 4≤h) (hV : Fintype.card V=2*h-1) :
    ∃ (b : V) (S : Fin (2*h)→Prop), b≠u ∧ b≠v ∧
      (∀ i : Fin (Fintype.card (graph u v).edgeSet),
        S ⟨i.val%(2*h),Nat.mod_lt _ (by omega)⟩ ↔
          (u∈L.verticesAt i ∨ v∈L.verticesAt i)) ∧
      Nat.card {a : Fin (2*h) // S a ∧ a.val<h}=2 ∧
      Nat.card {a : Fin (2*h) // S a ∧ h≤a.val}=2 ∧
      ∃ E : {x : V // x≠u ∧ x≠v ∧ x≠b} ≃ {c : Fin (2*h) // ¬S c},
        ∀ x, (∃ i : Fin (Fintype.card (graph u v).edgeSet),
          i.val=(E x).val.val ∧ x.val∈L.verticesAt i ∧
          ∀ j : Fin (Fintype.card (graph u v).edgeSet), j.val < i.val → x.val∉L.verticesAt j) ∧
          ¬S ⟨((E x).val.val+h)%(2*h),Nat.mod_lt _ (by omega)⟩ := by
  classical
  let N := Fintype.card (graph u v).edgeSet
  let w := 2*h
  let m := 2*h-1-2
  have hw : 0<w := by omega
  let n := 2*h-1
  have he : N=n*(h-1)-1 := by
    have e := graph_edge_card_parameter u v huv h (by omega) hV
    rw [Nat.card_eq_fintype_card] at e
    exact e
  have hN : N=w*(h-2)+h := by
    have hn : n+1=w := by omega
    have h₁ : h-1=(h-2)+1 := by omega
    rw [h₁,Nat.mul_add,mul_one] at he
    rw [← hn,Nat.add_mul,one_mul]
    omega
  obtain ⟨S,hS,hA,hB⟩ := actual_two_special_columns_each_half L huv hh hV
  obtain ⟨b,hbu,hbv,_,_,_,hU,hW,hAll⟩ := actual_deleted_edge_run_rigidity L huv hh hV
  let X := {x : V // x≠u ∧ x≠v ∧ x≠b}
  have hAt {x : V} {i : Fin N} (hm : i∈L.incidentPositions x) : x∈L.verticesAt i :=
    (L.mem_verticesAt _ _).mpr ((L.mem_incidentPositions _ _).mp hm)
  have hInc {x : V} {i : Fin N} (hm : x∈L.verticesAt i) : i∈L.incidentPositions x :=
    (L.mem_incidentPositions _ _).mpr ((L.mem_verticesAt _ _).mp hm)
  have hB₀ (i : Fin N) (he : i.val=0) : b∈L.verticesAt i := by
    obtain ⟨p,_,hIn,_,_,hB,_⟩ := hAll b hbu hbv
    have e : p 0=i := Fin.ext ((hB rfl).1.trans he.symm)
    exact e ▸ hAt (hIn 0)
  have hBLast (i : Fin N) (he : i.val+1=N) : b∈L.verticesAt i := by
    obtain ⟨p,_,hIn,_,_,hB,_⟩ := hAll b hbu hbv
    have hh := (hB rfl).2
    change (p (Fin.last m)).val+1=N at hh
    have e : p (Fin.last m)=i := Fin.ext (by omega)
    exact e ▸ hAt (hIn _)
  have hChoice (x : X) :
      ∃ p : Fin (m+1)→Fin N, StrictMono p ∧
        (∀ j,x.val∈L.verticesAt (p j)) ∧
        (∀ i,x.val∈L.verticesAt i → ∃ j,p j=i) ∧ (p 0).val<w ∧
        (p (Fin.last m)).val=(p 0).val+N-2*h := by
    obtain ⟨p,hp,hIn,hCover,_,_,hOther⟩ := hAll x.val x.property.1 x.property.2.1
    have hFirst := (hOther x.property.2.2).2.1
    exact ⟨p,hp,fun j => hAt (hIn j),fun i hi => hCover _ (hInc hi),by omega,
      (hOther x.property.2.2).2.2⟩
  choose p hP hPIn hPCover hFirst hLast using hChoice
  have hRun (x : X) : x.val∈L.runStartsAt (p x 0) :=
    L.first_occurrence_starts_run x.val (p x) (hP x) (hPIn x 0) (hPCover x)
  have hNonSpecial (x : X) : ¬S ⟨(p x 0).val,hFirst x⟩ := by
    intro h
    have hh' : ¬(u∈L.verticesAt (p x 0) ∨ v∈L.verticesAt (p x 0)) :=
      fun hh' => hh'.elim
        (L.nonendpoint_first_pos_not_special _ x.property.2.2 x.property.1 hbu (hRun x)
          (hB₀ _) hU)
        (L.nonendpoint_first_pos_not_special _ x.property.2.2 x.property.2.1 hbv (hRun x)
          (hB₀ _) hW)
    have hEq : (⟨(p x 0).val%w,Nat.mod_lt _ hw⟩ : Fin w)=⟨(p x 0).val,hFirst x⟩ :=
      Fin.ext (Nat.mod_eq_of_lt (hFirst x))
    exact hh' ((hS (p x 0)).mp (hEq.symm ▸ h))
  let f (x : X) : {c : Fin w // ¬S c} := ⟨⟨(p x 0).val,hFirst x⟩,hNonSpecial x⟩
  have hf : Function.Injective f := by
    intro x y e
    have hv : (p x 0).val=(p y 0).val := congrArg (fun c : {c : Fin w // ¬S c} => c.val.val) e
    have he : p x 0=p y 0 := Fin.ext hv
    apply Subtype.ext
    exact L.first_positions_of_nonendpoint_distinct _ (hRun x) (he.symm ▸ hRun y)
      x.property.2.2 y.property.2.2 (hB₀ _)
  have hCount : Fintype.card {a : Fin w // S a}=4 := by
    let A : Finset (Fin w) := Finset.univ.filter S
    have hL : (A.filter fun a => a.val<h).card=2 := by
      rw [Nat.card_eq_fintype_card,Fintype.card_subtype] at hA
      have e : (A.filter fun a => a.val<h) =
          Finset.univ.filter (fun a : Fin w => S a ∧ a.val<h) := by
        ext a
        simp [A]
      rw [e]
      exact hA
    have hR : (A.filter fun a => ¬a.val<h).card=2 := by
      rw [Nat.card_eq_fintype_card,Fintype.card_subtype] at hB
      have e : (A.filter fun a => ¬a.val<h) =
          Finset.univ.filter (fun a : Fin w => S a ∧ h≤a.val) := by
        ext a
        simp [A]
      rw [e]
      exact hB
    rw [Fintype.card_subtype]
    change A.card=4
    have he := Finset.card_filter_add_card_filter_not (s:=A) (p:=fun a : Fin w => a.val<h)
    omega
  have hEq : Fintype.card X=Fintype.card {c : Fin w // ¬S c} := by
    rw [Fintype.card_subtype_compl S,hCount,Fintype.card_fin]
    change Fintype.card {x : V // x≠u ∧ x≠v ∧ x≠b}=w-4
    rw [card_normal_nonendpoint hV huv hbu hbv]
    omega
  let E := Equiv.ofBijective f ((Fintype.bijective_iff_injective_and_card f).mpr ⟨hf,hEq⟩)
  refine ⟨b,S,hbu,hbv,hS,hA,hB,E,?_⟩
  intro x
  constructor
  · refine ⟨p x 0,rfl,hPIn x 0,?_⟩
    intro j hj hHere
    obtain ⟨k,hk⟩ := hPCover x j hHere
    have hLe := (hP x).monotone (Fin.zero_le k)
    rw [hk] at hLe
    exact (not_le_of_gt hj) hLe
  · let i := p x (Fin.last m)
    have hAfter (j : Fin N) (hio : i.val<j.val) : x.val∉L.verticesAt j :=
      L.no_occurrence_after_last x.val (p x) (hP x) (hPCover x) hio
    have hNo : ¬(u∈L.verticesAt i ∨ v∈L.verticesAt i) := fun he => he.elim
      (L.nonendpoint_last_pos_not_special i x.property.2.2 x.property.1 hbu
        (hPIn x _) (hBLast i) hAfter hU)
      (L.nonendpoint_last_pos_not_special i x.property.2.2 x.property.2.1 hbv
        (hPIn x _) (hBLast i) hAfter hW)
    have hPos : i.val=(p x 0).val+h+w*(h-3) := by
      have e : i.val=(p x 0).val+N-2*h := hLast x
      have hR : h-2=(h-3)+1 := by omega
      have hN' : N=w*(h-3)+w+h := by simpa only [hR,Nat.mul_add,mul_one] using hN
      omega
    have hMod : i.val%w=((p x 0).val+h)%w := by
      rw [hPos,Nat.add_mul_mod_self_left]
    intro hSX
    apply hNo
    apply (hS i).mp
    have he : (⟨i.val%w,Nat.mod_lt _ hw⟩ : Fin w)=
        ⟨((p x 0).val+h)%w,Nat.mod_lt _ hw⟩ := Fin.ext hMod
    exact he.symm ▸ hSX

end CircularCompleteMinusEdge
