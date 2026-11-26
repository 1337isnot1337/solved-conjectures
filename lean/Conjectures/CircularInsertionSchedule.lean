import Conjectures.CircularIndexOptimality
import Mathlib.Combinatorics.SimpleGraph.DegreeSum

/-! Counting and optimality for a cyclic list of equally large edge classes. -/

namespace CircularIndex.Insertion

open SimpleGraph

theorem incident_colour_bound {n p q : ℕ} [NeZero p] (G : SimpleGraph (Fin n))
    [DecidableRel G.Adj] (C : IntegerCircularEdgeColoring G p q) (hqp : q ≤ p) (v : Fin n) :
    G.degree v*q ≤ p := by
  classical
  let edge (e : G.incidenceSet v) : G.edgeSet := ⟨e.val,e.property.1⟩
  let start (a : G.incidenceSet v × Fin q) : ZMod p := C.colors (edge a.1) - (a.2.val : ZMod p)
  have offset (a : G.incidenceSet v × Fin q) : (C.colors (edge a.1) - start a).val = a.2.val := by
    dsimp only [start]
    rw [sub_sub_cancel, ZMod.val_natCast_of_lt (a.2.isLt.trans_le hqp)]
  have hinj : Function.Injective start := by
    intro a b h
    have he := C.window_matching (start a) (edge a.1) (edge b.1)
      (by rw [offset]; exact a.2.isLt) (by rw [h,offset]; exact b.2.isLt)
      ⟨v,a.1.property.2,b.1.property.2⟩
    apply Prod.ext
    · exact Subtype.ext (congrArg (fun z : G.edgeSet => z.val) he)
    · apply Fin.ext
      rw [← offset a, ← offset b, h, he]
  have h := Fintype.card_le_of_injective start hinj
  simpa only [Fintype.card_prod, G.card_incidenceSet_eq_degree, Fintype.card_fin,ZMod.card] using h

structure ClassSchedule (n p k : ℕ) where
  pair : Fin p × Fin k → Sym2 (Fin n)
  loopless : ∀ i, ¬ (pair i).IsDiag
  pairs_injective : Function.Injective pair
  separated : ∀ i j, i ≠ j → (∃ v, v ∈ pair i ∧ v ∈ pair j) →
    3 ≤ ((j.1.val : ZMod p) - (i.1.val : ZMod p)).val

namespace ClassSchedule

variable {n p k : ℕ} (S : ClassSchedule n p k)

def graph : SimpleGraph (Fin n) := SimpleGraph.fromEdgeSet (Set.range S.pair)

noncomputable instance : DecidableRel S.graph.Adj := Classical.decRel _

theorem edgeSet_eq : S.graph.edgeSet = Set.range S.pair := by
  rw [graph, SimpleGraph.edgeSet_fromEdgeSet]
  ext e
  constructor
  · exact fun h => h.1
  · rintro ⟨i,rfl⟩
    exact ⟨⟨i,rfl⟩,S.loopless i⟩

noncomputable def edgeEquiv : (Fin p × Fin k) ≃ S.graph.edgeSet :=
  Equiv.ofBijective (fun i => ⟨S.pair i, by rw [S.edgeSet_eq]; exact ⟨i,rfl⟩⟩)
    ⟨fun _ _ h => S.pairs_injective (congrArg Subtype.val h), by
      intro e
      have he : e.val ∈ Set.range S.pair :=
        (congrArg (fun A : Set (Sym2 (Fin n)) => e.val ∈ A) S.edgeSet_eq).mp e.property
      obtain ⟨i,hi⟩ := he
      exact ⟨i,Subtype.ext hi⟩⟩

theorem card_edges : Fintype.card S.graph.edgeSet = p*k := by
  rw [← Fintype.card_congr S.edgeEquiv,Fintype.card_prod,Fintype.card_fin,Fintype.card_fin]

noncomputable def coloring : IntegerCircularEdgeColoring S.graph p 3 where
  colors e := (S.edgeEquiv.symm e).1.val
  separated e f hef hv := by
    obtain ⟨v,hve,hvf⟩ := hv
    apply S.separated _ _ (fun h => hef (S.edgeEquiv.symm.injective h))
    have ev (x : S.graph.edgeSet) : S.pair (S.edgeEquiv.symm x) = x.val :=
      congrArg Subtype.val (S.edgeEquiv.apply_symm_apply x)
    exact ⟨v,(ev e) ▸ hve,(ev f) ▸ hvf⟩

theorem exact_index [NeZero p] (hk : 0 < k) (hn : n=6*k+1) (hp : 3 ≤ p) :
    circularChromaticIndex S.graph = (p : ℝ)/3 := by
  let C := S.coloring.toReal (by decide : 0 < 3) hp
  apply le_antisymm (circularChromaticIndex_le_of_coloring C)
  apply le_csInf
  · exact ⟨_,⟨C⟩⟩
  · intro r hr
    have hi := hr.some.counting_bound
    rw [S.card_edges,Fintype.card_fin,hn,show (6*k+1)/2=3*k by omega] at hi
    push_cast at hi
    have hkk : (0 : ℝ)<k := by exact_mod_cast hk
    apply (div_le_iff₀ (by norm_num : (0 : ℝ)<3)).mpr
    apply (mul_le_mul_iff_left₀ hkk).mp
    linarith only [hi]

/-- The window bound controls each degree. The degree sum forces some vertex to attain d. -/
theorem max_degree [NeZero p] (d : ℕ) (hp : p=3*d+2) (h3 : 3 ≤ p)
    (havg : n*(d-1)<2*(p*k)) :
    (∀ v, S.graph.degree v ≤ d) ∧ ∃ v, S.graph.degree v = d := by
  have upper (v : Fin n) : S.graph.degree v ≤ d := by
    have hv := incident_colour_bound S.graph S.coloring h3 v
    omega
  refine ⟨upper,?_⟩
  by_contra! h
  have hsum : ∑ v : Fin n, S.graph.degree v ≤ ∑ _v : Fin n, (d-1) :=
    Finset.sum_le_sum fun v _ => by have := upper v; have := h v; omega
  rw [S.graph.sum_degrees_eq_twice_card_edges,← S.graph.card_edgeSet,S.card_edges] at hsum
  simp only [Finset.sum_const,Finset.card_univ,Fintype.card_fin,smul_eq_mul] at hsum
  omega

end ClassSchedule
end CircularIndex.Insertion
