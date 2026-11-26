import Conjectures.CircularIndexOptimality
import Mathlib.Combinatorics.SimpleGraph.DeleteEdges
import Mathlib.Data.Nat.Choose.Basic

/-! Finite certificates for circular colourings of a complete graph with specified deleted edges. -/

namespace CircularIndex.Deleted

open SimpleGraph

/-- The graph is the complete graph on the labelled vertices with exactly the listed edges deleted. -/
def graph (n : ℕ) (F : Finset (Sym2 (Fin n))) : SimpleGraph (Fin n) :=
  (⊤ : SimpleGraph (Fin n)).deleteEdges (F : Set (Sym2 (Fin n)))

@[simp] theorem graph_adj {n : ℕ} (F : Finset (Sym2 (Fin n))) (v w : Fin n) :
    (graph n F).Adj v w ↔ v ≠ w ∧ s(v,w) ∉ F := by simp [graph]

instance {n : ℕ} (F : Finset (Sym2 (Fin n))) : DecidableRel (graph n F).Adj :=
  fun v w => decidable_of_iff (v ≠ w ∧ s(v,w) ∉ F) (graph_adj F v w).symm

theorem card_edges {n : ℕ} (F : Finset (Sym2 (Fin n)))
    (hF : ∀ e ∈ F, ¬ e.IsDiag) :
    Fintype.card (graph n F).edgeSet = n.choose 2 - F.card := by
  have h : (graph n F).edgeFinset = (⊤ : SimpleGraph (Fin n)).edgeFinset \ F := by
    ext e
    simp only [Finset.mem_sdiff, SimpleGraph.mem_edgeFinset]
    rw [graph, SimpleGraph.edgeSet_deleteEdges]
    rfl
  have hs : F ⊆ (⊤ : SimpleGraph (Fin n)).edgeFinset := by
    intro e he
    simpa [SimpleGraph.mem_edgeFinset] using hF e he
  rw [SimpleGraph.card_edgeSet, h, Finset.card_sdiff_of_subset hs,
    SimpleGraph.card_edgeFinset_top_eq_card_choose_two, Fintype.card_fin]

theorem degree_at_uncovered {n : ℕ} (F : Finset (Sym2 (Fin n))) (v : Fin n)
    (hv : ∀ e ∈ F, v ∉ e) : (graph n F).degree v = n-1 := by
  have h : (graph n F).neighborFinset v = Finset.univ.erase v := by
    ext w
    simp only [SimpleGraph.mem_neighborFinset, graph_adj, Finset.mem_erase,
      Finset.mem_univ, and_true]
    constructor
    · exact fun h => h.1.symm
    · intro hw
      exact ⟨hw.symm, fun he => hv _ he (Sym2.mem_mk_left ..)⟩
  rw [SimpleGraph.degree, h, Finset.card_erase_of_mem (Finset.mem_univ _),
    Finset.card_univ, Fintype.card_fin]

/-- Each row stores eight-bit entries starting with the least significant byte. -/
def byteAt (rows : Array ℕ) (row column : ℕ) : ℕ :=
  ((rows[row]?.getD 0) >>> (8 * column)) % 256

/-- An edge colour depends only on the unordered pair of endpoints. -/
def colour (rows : Array ℕ) {n : ℕ} (v w : Fin n) : ℕ :=
  byteAt rows (min v.val w.val) (max v.val w.val)

theorem colour_comm (rows : Array ℕ) {n : ℕ} (v w : Fin n) :
    colour rows v w = colour rows w v := by simp only [colour, min_comm, max_comm]

def edgeColour {n : ℕ} (rows : Array ℕ) : Sym2 (Fin n) → ℕ :=
  Sym2.lift ⟨colour rows, colour_comm rows⟩

/-- At an incident colour the inverse row identifies the other endpoint. Its
next q-1 positions must be unoccupied, including positions across the wrap. -/
def ValidAt {n : ℕ} (G : SimpleGraph (Fin n)) (p q : ℕ) (rows inverse : Array ℕ)
    (v : Fin n) : Prop :=
  ∀ w : Fin n, G.Adj v w →
    let a := colour rows v w
    a < p ∧ byteAt inverse v.val a = w.val ∧
      ∀ i : Fin q, 0 < i.val → n ≤ byteAt inverse v.val ((a+i.val)%p)

instance {n : ℕ} (G : SimpleGraph (Fin n)) [DecidableRel G.Adj] (p q : ℕ)
    (rows inverse : Array ℕ) (v : Fin n) : Decidable (ValidAt G p q rows inverse v) := by
  unfold ValidAt
  infer_instance

abbrev RowValid {n : ℕ} (F : Finset (Sym2 (Fin n))) := ValidAt (graph n F)

private theorem add_residue {p a b : ℕ} [NeZero p] (hb : b < p) :
    (a + ((b : ZMod p) - (a : ZMod p)).val) % p = b := by
  have h : (a : ZMod p) + ((b : ZMod p) - (a : ZMod p)) = (b : ZMod p) := by abel
  have hh := congrArg ZMod.val h
  simpa only [ZMod.val_add, ZMod.val_natCast, Nat.mod_add_mod, Nat.mod_eq_of_lt hb] using hh

def integerColoring {n p q : ℕ} [NeZero p] {G : SimpleGraph (Fin n)} {rows inverse : Array ℕ}
    (h : ∀ v, ValidAt G p q rows inverse v) : IntegerCircularEdgeColoring G p q where
  colors e := edgeColour rows e.val
  separated e f hef hv := by
    obtain ⟨v,hve,hvf⟩ := hv
    let u := Sym2.Mem.other hve
    let w := Sym2.Mem.other hvf
    have heu : s(v,u) = e.val := Sym2.other_spec hve
    have hfw : s(v,w) = f.val := Sym2.other_spec hvf
    have hvu : G.Adj v u := by
      rw [← G.mem_edgeSet, heu]
      exact e.property
    have hvw : G.Adj v w := by
      rw [← G.mem_edgeSet, hfw]
      exact f.property
    obtain ⟨ha, hia, hgap⟩ := h v u hvu
    obtain ⟨hb, hib, _⟩ := h v w hvw
    rw [←heu, ←hfw]
    change q ≤ ((colour rows v w : ZMod p) - (colour rows v u : ZMod p)).val
    let i := ((colour rows v w : ZMod p) - (colour rows v u : ZMod p)).val
    have hi : (colour rows v u+i)%p = colour rows v w := add_residue hb
    by_contra! hlt
    change i < q at hlt
    by_cases hz : i = 0
    · rw [hz, Nat.add_zero, Nat.mod_eq_of_lt ha] at hi
      rw [hi, hib] at hia
      have hw : w=u := Fin.ext hia
      exact hef (Subtype.ext (heu.symm.trans (hw ▸ hfw)))
    · have hbad := hgap ⟨i,hlt⟩ (Nat.pos_of_ne_zero hz)
      change n ≤ byteAt inverse v.val ((colour rows v u+i)%p) at hbad
      rw [hi, hib] at hbad
      exact (Nat.not_le_of_gt w.isLt) hbad

theorem bounds_of_card {n p q e : ℕ} [NeZero p] {G : SimpleGraph (Fin n)}
    [Fintype G.edgeSet] {rows inverse : Array ℕ}
    (h : ∀ v, ValidAt G p q rows inverse v) (hn : 2 ≤ n) (hq : 0 < q) (hqp : q ≤ p)
    (he : Fintype.card G.edgeSet = e) :
    (e : ℝ)/((n/2 : ℕ) : ℝ) ≤ circularChromaticIndex G ∧
    circularChromaticIndex G ≤ (p : ℝ)/q := by
  let c := (integerColoring h).toReal hq hqp
  refine ⟨?_,circularChromaticIndex_le_of_coloring c⟩
  apply le_csInf
  · exact ⟨_, ⟨c⟩⟩
  · intro r hr
    have hi := hr.some.counting_bound
    rw [he, Fintype.card_fin] at hi
    have hm : 0 < ((n/2 : ℕ) : ℝ) := by exact_mod_cast (show 0<n/2 by omega)
    exact (div_le_iff₀ hm).mpr hi

theorem index_bounds {n p q : ℕ} [NeZero p] {F : Finset (Sym2 (Fin n))} {rows inverse : Array ℕ}
    (h : ∀ v, RowValid F p q rows inverse v) (hn : 2 ≤ n) (hq : 0 < q) (hqp : q ≤ p)
    (hF : ∀ e ∈ F, ¬ e.IsDiag) :
    ((n.choose 2 - F.card : ℕ) : ℝ)/((n/2 : ℕ) : ℝ) ≤ circularChromaticIndex (graph n F) ∧
    circularChromaticIndex (graph n F) ≤ (p : ℝ)/q :=
  bounds_of_card h hn hq hqp (card_edges F hF)

end CircularIndex.Deleted
