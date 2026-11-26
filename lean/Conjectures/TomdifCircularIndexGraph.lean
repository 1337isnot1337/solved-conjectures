import Conjectures.TomdifCircularIndexSound
import Conjectures.CircularIndexOptimality

namespace CircularIndex.Tomdif
open SimpleGraph
open scoped Classical

abbrev Entry (es : List ColoredEdge) := {e : ColoredEdge // e ∈ es}

variable {d n : ℕ} {es : List ColoredEdge}

def certifiedEndpoints (h : verified d n es = true) (e : Entry es) : Fin n × Fin n :=
  let hr := verified_ranges h e.property
  (⟨e.val.left,hr.1.trans hr.2.1⟩,⟨e.val.right,hr.2.1⟩)

def certifiedPair (h : verified d n es = true) (e : Entry es) : Sym2 (Fin n) :=
  s((certifiedEndpoints h e).1,(certifiedEndpoints h e).2)

theorem certifiedPair_inj (h : verified d n es = true) : Function.Injective (certifiedPair h) := by
  intro a b he
  have ha := (verified_ranges h a.property).1
  have hb := (verified_ranges h b.property).1
  rcases Sym2.eq_iff.mp he with h₁ | h₁
  · apply Subtype.ext
    apply distinct_ids (verified_ids h) a.property b.property
    have hl : a.val.left=b.val.left := congrArg (fun x : Fin n => x.val) h₁.1
    have hr : a.val.right=b.val.right := congrArg (fun x : Fin n => x.val) h₁.2
    exact congrArg₂ (fun x y : ℕ => x*n+y) hl hr
  · have hl : a.val.left=b.val.right := congrArg (fun x : Fin n => x.val) h₁.1
    have hr : a.val.right=b.val.left := congrArg (fun x : Fin n => x.val) h₁.2
    omega

def certifiedGraph (h : verified d n es = true) : SimpleGraph (Fin n) :=
  SimpleGraph.fromEdgeSet (Set.range (certifiedPair h))

noncomputable instance (h : verified d n es = true) : DecidableRel (certifiedGraph h).Adj :=
  Classical.decRel _

theorem certifiedGraph_edgeSet (h : verified d n es = true) :
    (certifiedGraph h).edgeSet = Set.range (certifiedPair h) := by
  rw [certifiedGraph, SimpleGraph.edgeSet_fromEdgeSet]
  ext x
  constructor
  · exact fun hx => hx.1
  · rintro ⟨e,rfl⟩
    refine ⟨⟨e,rfl⟩,?_⟩
    intro hh
    have he : (certifiedEndpoints h e).1=(certifiedEndpoints h e).2 := by
      simpa [certifiedPair, Sym2.mem_diagSet] using hh
    have hl := congrArg (fun x : Fin n => x.val) he
    exact (verified_ranges h e.property).1.ne hl

def certifiedEdgeMap (h : verified d n es = true) (e : Entry es) :
    (certifiedGraph h).edgeSet :=
  ⟨certifiedPair h e,by rw [certifiedGraph_edgeSet]; exact ⟨e,rfl⟩⟩

noncomputable def certifiedEdgeEquiv (h : verified d n es = true) :
    Entry es ≃ (certifiedGraph h).edgeSet :=
  Equiv.ofBijective (certifiedEdgeMap h) ⟨by
    intro a b he
    exact certifiedPair_inj h (congrArg Subtype.val he), by
    intro f
    have hf : f.val ∈ Set.range (certifiedPair h) :=
      (congrArg (fun s : Set (Sym2 (Fin n)) => f.val ∈ s) (certifiedGraph_edgeSet h)).mp f.property
    obtain ⟨e,he⟩ := hf
    exact ⟨e, Subtype.ext he⟩⟩

theorem certifiedEdgeEquiv_val (h : verified d n es = true) (e : Entry es) :
    (certifiedEdgeEquiv h e).val = certifiedPair h e := rfl

theorem certifiedPair_hasVertex (h : verified d n es = true) (v : Fin n) (e : Entry es) :
    v ∈ certifiedPair h e ↔ occurs v.val e.val = true := by
  rw [certifiedPair, Sym2.mem_iff, occurs_iff]
  constructor
  · intro hh
    exact hh.imp (congrArg fun x : Fin n => x.val) (congrArg fun x : Fin n => x.val)
  · intro hh
    exact hh.imp Fin.ext Fin.ext

theorem nodup_certified_edges (h : verified d n es = true) : es.Nodup :=
  (verified_ids h).imp (fun hlt he => hlt.ne (congrArg _ he))

noncomputable instance entryFintype (es : List ColoredEdge) : Fintype (Entry es) :=
  Fintype.ofFinset es.toFinset (fun _ => List.mem_toFinset)

theorem entries_card (h : verified d n es = true) : Fintype.card (Entry es) = es.length := by
  have he : Entry es ≃ (es.toFinset : Type) :=
    Equiv.subtypeEquivRight (fun _ => List.mem_toFinset.symm)
  rw [Fintype.card_congr he, Fintype.card_coe]
  exact List.toFinset_card_of_nodup (nodup_certified_edges h)

theorem certifiedGraph_card_edges (h : verified d n es = true) :
    Fintype.card (certifiedGraph h).edgeSet = es.length := by
  rw [← Fintype.card_congr (certifiedEdgeEquiv h), entries_card h]

noncomputable def incident_equiv_degree (h : verified d n es = true) (v : Fin n) :
    Entry (incident es v.val) ≃ (certifiedGraph h).incidenceSet v := by
  let e := certifiedEdgeEquiv h
  let f : Entry (incident es v.val) ≃ {a : Entry es // occurs v.val a.val = true} :=
    { toFun := fun a =>
        ⟨⟨a.val, (List.mem_filter.mp a.property).1⟩,(List.mem_filter.mp a.property).2⟩
      invFun := fun a => ⟨a.val.val,List.mem_filter.mpr ⟨a.val.property,a.property⟩⟩
      left_inv := fun _ => rfl
      right_inv := fun _ => rfl }
  let g := e.subtypeEquiv (q := fun a => v ∈ a.val) (fun a =>
    (certifiedPair_hasVertex h v a).symm)
  let j : {a : (certifiedGraph h).edgeSet // v ∈ a.val} ≃ (certifiedGraph h).incidenceSet v :=
    { toFun := fun a => ⟨a.val.val, (edge_mem_incidenceSet_iff (G := certifiedGraph h) (e := a.val)).mpr a.property⟩
      invFun := fun a => ⟨⟨a.val, a.property.1⟩, a.property.2⟩
      left_inv := fun _ => rfl
      right_inv := fun _ => rfl }
  exact f.trans (g.trans j)

theorem certifiedGraph_degree (h : verified d n es = true) (v : Fin n) :
    (certifiedGraph h).degree v = (incident es v.val).length := by
  have hnd : (incident es v.val).Nodup :=
    (nodup_certified_edges h).filter _
  have he : Entry (incident es v.val) ≃ ((incident es v.val).toFinset : Type) :=
    Equiv.subtypeEquivRight (fun _ => List.mem_toFinset.symm)
  rw [← SimpleGraph.card_incidenceSet_eq_degree, ← Fintype.card_congr (incident_equiv_degree h v),
    Fintype.card_congr he, Fintype.card_coe]
  exact List.toFinset_card_of_nodup hnd

/-- In the modulus representing the submitted number of colours, the
positive residue is the ordinary `(a+p-b)%p` with no accidental NAT truncation. -/
theorem color_nat_sub_val {p a b : ℕ} [NeZero p] (hb : b<p) :
    ((a : ZMod p)-(b : ZMod p)).val=(a+p-b)%p := by
  have hi : ((a+p:ℕ) : ZMod p)=(a:ZMod p) := by simp
  rw [← hi, ← Nat.cast_sub (show b≤a+p by omega), ZMod.val_natCast]

noncomputable def certifiedColoring (h : verified d n es = true) :
    IntegerCircularEdgeColoring (certifiedGraph h) (3*d+2) 3 where
  colors e := ((certifiedEdgeEquiv h).symm e).val.color
  separated e f hef hv := by
    obtain ⟨v,hve,hvf⟩ := hv
    let a := (certifiedEdgeEquiv h).symm e
    let b := (certifiedEdgeEquiv h).symm f
    have haeq := (certifiedEdgeEquiv h).apply_symm_apply e
    have hbeq := (certifiedEdgeEquiv h).apply_symm_apply f
    have ha : v ∈ certifiedPair h a := by
      rw [← certifiedEdgeEquiv_val, haeq]
      exact hve
    have hb : v ∈ certifiedPair h b := by
      rw [← certifiedEdgeEquiv_val, hbeq]
      exact hvf
    have ha' : a.val ∈ incident es v.val := List.mem_filter.mpr
      ⟨a.property,(certifiedPair_hasVertex h v a).mp ha⟩
    have hb' : b.val ∈ incident es v.val := List.mem_filter.mpr
      ⟨b.property,(certifiedPair_hasVertex h v b).mp hb⟩
    have hab : a.val≠b.val := fun eq => hef ((certifiedEdgeEquiv h).symm.injective (Subtype.ext eq))
    have hs := (verified_separation h v ha' hb' hab).2
    change 3 ≤ ((b.val.color : ZMod (3*d+2))-(a.val.color : ZMod (3*d+2))).val
    rw [color_nat_sub_val (verified_ranges h a.property).2.2]
    exact hs

end CircularIndex.Tomdif
