import Conjectures.CircularIndexColoring
import Mathlib.Data.Fintype.BigOperators

/-!
# Counting windows in a circular edge coloring

The lower bound is proved by counting all pairs consisting of an edge and
a length-`q` color window containing its color.  Each window is a matching,
so at most half the vertices can support its edges.
-/

namespace CircularIndex

noncomputable def edgeEndpoint {V : Type*} {G : SimpleGraph V}
    (e : G.edgeSet) (side : Bool) : V :=
  if side then e.val.out.2 else e.val.out.1

theorem edgeEndpoint_mem {V : Type*} {G : SimpleGraph V}
    (e : G.edgeSet) (side : Bool) : edgeEndpoint e side ∈ e.val := by
  cases side
  · exact Sym2.out_fst_mem e.val
  · exact Sym2.out_snd_mem e.val

theorem edgeEndpoint_injective {V : Type*} {G : SimpleGraph V}
    (e : G.edgeSet) : Function.Injective (edgeEndpoint e) := by
  have hne : e.val.out.1 ≠ e.val.out.2 := by
    intro h
    apply G.not_isDiag_of_mem_edgeSet e.property
    rw [← Sym2.mk_fst_out_snd_out e.val, h]
    exact Sym2.mk_isDiag_iff.mpr rfl
  intro a b h
  cases a <;> cases b
  · rfl
  · exact False.elim (hne h)
  · exact False.elim (hne h.symm)
  · rfl

theorem matching_card_bound {V : Type*} [Fintype V] {G : SimpleGraph V}
    (M : Finset G.edgeSet)
    (hM : ∀ e ∈ M, ∀ f ∈ M, (∃ v : V, v ∈ e.val ∧ v ∈ f.val) → e = f) :
    2 * M.card ≤ Fintype.card V := by
  classical
  let endpoint : {e // e ∈ M} × Bool → V := fun a => edgeEndpoint a.1.val a.2
  have hinj : Function.Injective endpoint := by
    rintro ⟨⟨e, he⟩, a⟩ ⟨⟨f, hf⟩, b⟩ h
    have hfm : edgeEndpoint e a ∈ f.val := by
      rw [show edgeEndpoint e a = edgeEndpoint f b from h]
      exact edgeEndpoint_mem f b
    have hef : e = f := hM e he f hf ⟨edgeEndpoint e a,
      edgeEndpoint_mem e a, hfm⟩
    subst f
    have hab : a = b := edgeEndpoint_injective e h
    subst b
    rfl
  have hc := Fintype.card_le_of_injective endpoint hinj
  simpa only [Fintype.card_prod, Fintype.card_coe, Fintype.card_bool, Nat.mul_comm] using hc

theorem same_window_close (p q : ℕ) [NeZero p] (x y c : ZMod p)
    (hx : (x - c).val < q) (hy : (y - c).val < q) :
    (x - y).val < q ∨ (y - x).val < q := by
  by_cases h : (x - c).val ≤ (y - c).val
  · right
    have he : y - x = (y - c) - (x - c) := by abel
    rw [he, ZMod.val_sub h]
    omega
  · left
    have he : x - y = (x - c) - (y - c) := by abel
    rw [he, ZMod.val_sub (by omega)]
    omega

theorem IntegerCircularEdgeColoring.window_matching {V : Type*} {G : SimpleGraph V}
    {p q : ℕ} [NeZero p] (C : IntegerCircularEdgeColoring G p q)
    (c : ZMod p) (e f : G.edgeSet)
    (he : (C.colors e - c).val < q) (hf : (C.colors f - c).val < q)
    (hv : ∃ v : V, v ∈ e.val ∧ v ∈ f.val) : e = f := by
  by_contra h
  obtain hl | hr := same_window_close p q (C.colors e) (C.colors f) c he hf
  · have hsep := C.separated f e (Ne.symm h) (by rcases hv with ⟨v, he, hf⟩; exact ⟨v, hf, he⟩)
    omega
  · have hsep := C.separated e f h hv
    omega

theorem IntegerCircularEdgeColoring.window_card_bound {V : Type*} [Fintype V]
    {G : SimpleGraph V} [Fintype G.edgeSet]
    {p q : ℕ} [NeZero p] (C : IntegerCircularEdgeColoring G p q) (c : ZMod p) :
    Fintype.card {e : G.edgeSet // (C.colors e - c).val < q} ≤ Fintype.card V / 2 := by
  classical
  let M := Finset.univ.filter (fun e : G.edgeSet => (C.colors e - c).val < q)
  have hm : ∀ e ∈ M, ∀ f ∈ M, (∃ v : V, v ∈ e.val ∧ v ∈ f.val) → e = f := by
    intro e he f hf hv
    exact C.window_matching c e f (Finset.mem_filter.mp he).2 (Finset.mem_filter.mp hf).2 hv
  have hcard := matching_card_bound M hm
  have heq : Fintype.card {e : G.edgeSet // (C.colors e - c).val < q} = M.card := by
    exact Fintype.card_subtype _
  rw [heq]
  omega

noncomputable def windowEquiv {V : Type*} {G : SimpleGraph V}
    {p q : ℕ} [NeZero p] (C : IntegerCircularEdgeColoring G p q) (hqp : q ≤ p) :
    (Σ c : ZMod p, {e : G.edgeSet // (C.colors e - c).val < q}) ≃
      (G.edgeSet × Fin q) where
  toFun a := (a.2.val, ⟨(C.colors a.2.val - a.1).val, a.2.property⟩)
  invFun a := ⟨C.colors a.1 - (a.2.val : ZMod p), a.1, by
    have he : C.colors a.1 - (C.colors a.1 - (a.2.val : ZMod p)) = (a.2.val : ZMod p) := by abel
    rw [he, ZMod.val_natCast_of_lt (lt_of_lt_of_le a.2.isLt hqp)]
    exact a.2.isLt⟩
  left_inv a := by
    rcases a with ⟨c, e, he⟩
    dsimp only
    have hc : C.colors e - ((C.colors e - c).val : ZMod p) = c := by
      rw [ZMod.natCast_zmod_val, sub_sub_cancel]
    apply Sigma.ext hc
    exact (Subtype.heq_iff_coe_eq (by
      intro x
      change (C.colors x - (C.colors e - ((C.colors e - c).val : ZMod p))).val < q ↔
        (C.colors x - c).val < q
      rw [hc])).mpr rfl
  right_inv a := by
    rcases a with ⟨e, i⟩
    dsimp only
    apply Prod.ext
    · rfl
    · apply Fin.ext
      dsimp only
      rw [sub_sub_cancel, ZMod.val_natCast_of_lt (lt_of_lt_of_le i.isLt hqp)]

theorem IntegerCircularEdgeColoring.counting_bound {V : Type*} [Fintype V]
    {G : SimpleGraph V} [Fintype G.edgeSet]
    {p q : ℕ} [NeZero p] (C : IntegerCircularEdgeColoring G p q) (hqp : q ≤ p) :
    q * Fintype.card G.edgeSet ≤ p * (Fintype.card V / 2) := by
  classical
  calc
    q * Fintype.card G.edgeSet =
        Fintype.card (Σ c : ZMod p, {e : G.edgeSet // (C.colors e - c).val < q}) := by
      rw [Fintype.card_congr (windowEquiv C hqp), Fintype.card_prod, Fintype.card_fin]
      exact Nat.mul_comm _ _
    _ = ∑ c : ZMod p, Fintype.card {e : G.edgeSet // (C.colors e - c).val < q} :=
      Fintype.card_sigma
    _ ≤ ∑ _c : ZMod p, Fintype.card V / 2 :=
      Finset.sum_le_sum (fun c _ => C.window_card_bound c)
    _ = p * (Fintype.card V / 2) := by simp [ZMod.card]

theorem circulant_integerColoring_lower_bound (g : ℕ) (hg : 2 ≤ g)
    {p q : ℕ} [NeZero p] (hqp : q ≤ p)
    (C : IntegerCircularEdgeColoring (graph g) p q) :
    q * (2 * g * order g) ≤ p * (3 * g) := by
  classical
  let _ := Fintype.ofFinite (graph g).edgeSet
  have h := C.counting_bound hqp
  have he : Fintype.card (graph g).edgeSet = 2 * g * order g := by
    rw [← Nat.card_eq_fintype_card]
    exact card_edges g hg
  have hv : Fintype.card (ZMod (order g)) / 2 = 3 * g := by
    rw [ZMod.card]
    simp only [order]
    omega
  rwa [he, hv] at h

end CircularIndex
