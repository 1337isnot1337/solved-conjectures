import Conjectures.CircularCompleteMinusEdgeAcyclic
import Mathlib.Combinatorics.SimpleGraph.DeleteEdges
import Mathlib.Data.Nat.Choose.Basic

/-!
# The actual complete graph with one deleted edge

Definitions, cardinalities, degrees, and the explicit upper circular coloring
for Mazák–Zrubák Conjecture 2. Vertex labels are arbitrary throughout.
-/

namespace CircularCompleteMinusEdge

open CircularIndex

def graph {V : Type*} (u v : V) : SimpleGraph V :=
  (⊤ : SimpleGraph V).deleteEdges {s(u, v)}

instance {V : Type*} [DecidableEq V] (u v : V) : DecidableRel (graph u v).Adj := by
  unfold graph
  infer_instance

@[simp] theorem graph_adj {V : Type*} (u v x y : V) :
    (graph u v).Adj x y ↔ x ≠ y ∧ s(x, y) ≠ s(u, v) := by
  simp [graph]

theorem graph_swap {V : Type*} (u v : V) : graph u v = graph v u := by
  simp [graph, Sym2.eq_swap]

theorem graph_adj_normal {V : Type*} {u v x y : V} (hxu : x ≠ u) (hxv : x ≠ v) :
    (graph u v).Adj x y ↔ x ≠ y := by
  simp [graph_adj, hxu, hxv]

theorem graph_adj_special {V : Type*} {u v y : V} (huv : u ≠ v) :
    (graph u v).Adj u y ↔ y ≠ u ∧ y ≠ v := by
  simp [graph_adj, huv, ne_comm]

theorem graph_edge_card {V : Type*} [Fintype V] (u v : V) (huv : u ≠ v) :
    Nat.card (graph u v).edgeSet = (Fintype.card V).choose 2 - 1 := by
  classical
  let := Fintype.ofFinite (graph u v).edgeSet
  rw [Nat.card_eq_fintype_card, SimpleGraph.card_edgeSet]
  have hedge : (graph u v).edgeFinset = (⊤ : SimpleGraph V).edgeFinset.erase s(u, v) := by
    ext e
    rw [SimpleGraph.mem_edgeFinset, Finset.mem_erase, SimpleGraph.mem_edgeFinset]
    simp [graph, and_comm]
  rw [hedge, Finset.card_erase_of_mem]
  · rw [SimpleGraph.card_edgeFinset_top_eq_card_choose_two]
  · simpa using huv

theorem graph_edge_card_parameter {V : Type*} [Fintype V] (u v : V) (huv : u ≠ v)
    (h : ℕ) (hh : 2 ≤ h) (hv : Fintype.card V = 2 * h - 1) :
    Nat.card (graph u v).edgeSet = (2 * h - 1) * (h - 1) - 1 := by
  rw [graph_edge_card u v huv, hv, Nat.choose_two_right]
  have hprod : (2 * h - 1) * (2 * h - 1 - 1) = ((2 * h - 1) * (h - 1)) * 2 := by
    have ha : 2 * h - 1 - 1 = 2 * (h - 1) := by omega
    rw [ha]
    ring
  rw [hprod, Nat.mul_div_cancel _ (by decide : 0 < 2)]

theorem graph_normal_degree {V : Type*} [Fintype V] [DecidableEq V] {u v x : V}
    (hxu : x ≠ u) (hxv : x ≠ v) : (graph u v).degree x = Fintype.card V - 1 := by
  classical
  have heq : (graph u v).neighborFinset x = Finset.univ.erase x := by
    ext y
    simp only [SimpleGraph.mem_neighborFinset, graph_adj_normal hxu hxv,
      Finset.mem_erase, Finset.mem_univ, and_true, ne_comm]
  rw [SimpleGraph.degree, heq, Finset.card_erase_of_mem (Finset.mem_univ _), Finset.card_univ]

theorem graph_special_degree {V : Type*} [Fintype V] [DecidableEq V] {u v : V} (huv : u ≠ v) :
    (graph u v).degree u = Fintype.card V - 2 := by
  classical
  have heq : (graph u v).neighborFinset u = (Finset.univ.erase u).erase v := by
    ext y
    simp only [SimpleGraph.mem_neighborFinset, graph_adj_special huv,
      Finset.mem_erase, Finset.mem_univ, true_and, and_comm]
  rw [SimpleGraph.degree, heq,
    Finset.card_erase_of_mem (by simp [huv.symm]),
    Finset.card_erase_of_mem (Finset.mem_univ _), Finset.card_univ]
  omega

def endpointSum {V : Type*} {n : ℕ} (label : V → ZMod n) : Sym2 V → ZMod n :=
  Sym2.lift ⟨fun x y => label x + label y, fun _ _ => add_comm _ _⟩

theorem endpointSum_ne_of_incident {V : Type*} {G : SimpleGraph V} {n : ℕ}
    (label : V → ZMod n) (hinj : Function.Injective label)
    {e f : G.edgeSet} (hef : e ≠ f) (hinc : Incident e f) :
    endpointSum label e.val ≠ endpointSum label f.val := by
  rcases hinc with ⟨x, he, hf⟩
  obtain ⟨y, hy⟩ := Sym2.mem_iff_exists.mp he
  obtain ⟨z, hz⟩ := Sym2.mem_iff_exists.mp hf
  intro h
  rw [hy, hz] at h
  change label x + label y = label x + label z at h
  have hyz : y = z := hinj (add_left_cancel h)
  apply hef
  apply Subtype.ext
  rw [hy, hz, hyz]

noncomputable def labelColoring {V : Type*} (G : SimpleGraph V) {n : ℕ} [NeZero n]
    (label : V → ZMod n) (hinj : Function.Injective label) :
    IntegerCircularEdgeColoring G n 1 where
  colors e := endpointSum label e.val
  separated e f hef hinc := by
    have hne := endpointSum_ne_of_incident label hinj hef hinc
    have hval : (endpointSum label f.val - endpointSum label e.val).val ≠ 0 := by
      intro hz
      have heq : endpointSum label f.val - endpointSum label e.val = 0 := by
        simpa only [ZMod.val_eq_zero] using hz
      exact hne (sub_eq_zero.mp heq).symm
    omega

theorem exists_real_coloring_card {V : Type*} [Fintype V] (G : SimpleGraph V)
    {n : ℕ} (hn : 1 ≤ n) (hcard : Fintype.card V = n) :
    Nonempty (RealCircularEdgeColoring G (n : ℝ)) := by
  classical
  let : NeZero n := ⟨by omega⟩
  let label : V ≃ ZMod n := Fintype.equivOfCardEq (by simpa only [ZMod.card] using hcard)
  have C := (labelColoring G label label.injective).toReal (by decide : 0 < 1) hn
  have C' : RealCircularEdgeColoring G (n : ℝ) := by
    simpa only [Nat.cast_one, div_one] using C
  exact ⟨C'⟩

theorem circularChromaticIndex_le_card {V : Type*} [Fintype V] (G : SimpleGraph V)
    {n : ℕ} (hn : 1 ≤ n) (hcard : Fintype.card V = n) :
    circularChromaticIndex G ≤ n :=
  circularChromaticIndex_le_of_coloring (exists_real_coloring_card G hn hcard).some

end CircularCompleteMinusEdge
