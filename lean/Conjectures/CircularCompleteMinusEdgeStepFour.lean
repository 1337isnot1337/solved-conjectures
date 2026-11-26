import Conjectures.CircularCompleteMinusEdgeNormalPositions
import Conjectures.CircularCompleteMinusEdgeRunSaturation
import Conjectures.CircularCompleteMinusEdgeSpecialRuns

/-! Step 4 of the recorded proof, applied to the actual all-edge
order of a deleted-edge complete graph. The table argument is
not included in this module. -/

namespace CircularCompleteMinusEdge
open scoped BigOperators

variable {V : Type*} [Fintype V] [DecidableEq V]
    {u v : V} [Fintype (graph u v).edgeSet] {h : ℕ} [NeZero (2*h-1)]
    {C : ProperColoring (graph u v) (2*h-1)}

private theorem close_run_budget (h : ℕ) (hh : 4≤h) :
    (2*h-1)*(h-1)=(2*h-1-2)*(h-2)+2*(2*h-1-2)+1 := by
  have h₁ : 2*h-1=2*(h-2)+3 := by omega
  have h₂ : 2*h-1-2=2*(h-2)+1 := by omega
  have h₃ : h-1=(h-2)+1 := by omega
  rw [h₂,h₁,h₃]
  ring

/-- The actual run rigidity conclusion of Step 4. The unique
normal endpoint vertex is given explicitly, as are all normal
run counts and lengths of nonconsecutive steps. The two special
vertices cannot appear at consecutive positions. -/
theorem actual_deleted_edge_run_rigidity (L : LinearEdgeOrder C) (huv : u≠v)
    (hh : 4≤h) (hV : Fintype.card V=2*h-1) :
    ∃ b : V, b≠u ∧ b≠v ∧
      L.runCount b=h-1 ∧
      L.runCount u=2*h-1-2 ∧ L.runCount v=2*h-1-2 ∧
      (∀ i j : Fin (Fintype.card (graph u v).edgeSet), j.val=i.val+1 →
        u∈L.verticesAt i → u∉L.verticesAt j) ∧
      (∀ i j : Fin (Fintype.card (graph u v).edgeSet), j.val=i.val+1 →
        v∈L.verticesAt i → v∉L.verticesAt j) ∧
      ∀ x : V, x≠u → x≠v →
        ∃ p : Fin ((2*h-1-2)+1)→Fin (Fintype.card (graph u v).edgeSet),
          StrictMono p ∧ (∀ i,p i∈L.incidentPositions x) ∧
          (∀ j∈L.incidentPositions x,∃ i,p i=j) ∧
          (∀ i,runStep (fun j => (p j).val) i=1 ∨ runStep (fun j => (p j).val) i=2*h) ∧
          (x=b → (p 0).val=0 ∧ (p (Fin.last (2*h-1-2))).val+1=Fintype.card (graph u v).edgeSet) ∧
          (x≠b → L.runCount x=h-2 ∧ (p 0).val≤2*h-1 ∧
            (p (Fin.last (2*h-1-2))).val=(p 0).val+Fintype.card (graph u v).edgeSet-2*h) := by
  classical
  let n := 2*h-1
  let m := n-2
  let N := Fintype.card (graph u v).edgeSet
  let R := h-2
  have hn : 0<n := by omega
  have hn2 : 2≤n := by omega
  have hm : n=m+2 := by omega
  have hR : 0<R := by omega
  have he : N=n*(h-1)-1 := by
    have he := graph_edge_card_parameter u v huv h (by omega) hV
    rw [Nat.card_eq_fintype_card] at he
    exact he
  have hnMul : 21≤n*(h-1) :=
    Nat.mul_le_mul (show 7≤n by omega) (show 3≤h-1 by omega)
  have hN : 1<N := by omega
  have hSize : N-1=m+n*R := by
    have hH : h-1=R+1 := by omega
    rw [hH,Nat.mul_add,mul_one] at he
    omega
  let I : Finset V := (Finset.univ.erase u).erase v
  have hI (x : ↥I) : x.val≠u ∧ x.val≠v := by
    have hx := x.property
    simp only [I,Finset.mem_erase,Finset.mem_univ,and_true] at hx
    exact hx.symm
  have hMemV : v∈(Finset.univ : Finset V).erase u := by simp [huv.symm]
  have hCardI : Fintype.card ↥I=m := by
    rw [Fintype.card_coe,Finset.card_erase_of_mem hMemV,
      Finset.card_erase_of_mem (Finset.mem_univ u),Finset.card_univ,hV]
    omega
  have hP (x : ↥I) := L.normal_positions_gap_mod x.val hm (by
    rw [graph_normal_degree (hI x).1 (hI x).2,hV])
  choose p hMono hIn hAll hMod using hP
  let t (x : ↥I) (j : Fin (m+1)) := (p x j).val
  have ht (x : ↥I) : StrictMono (t x) := (fun _ _ hij => hMono x hij)
  have hLast (x : ↥I) : t x (Fin.last m)≤N-1 := by
    have := (p x (Fin.last m)).isLt
    change t x (Fin.last m)<N at this
    omega
  have hQ (x : ↥I) := run_slack_and_capacity hn (t x) (ht x) (hLast x) (hMod x) hSize
  choose q hSlack hCapacity using hQ
  have hK (x : ↥I) := L.runCount_eq_one_add_jumpCount x.val hn2 (p x)
    (hMono x) (hIn x) (hAll x) (hMod x)
  let lo : Fin N := ⟨0,by omega⟩
  let hi : Fin N := ⟨N-1,by omega⟩
  have hEnd (x : ↥I) (hx : q x=0) :
      t x 0=0 ∧ t x (Fin.last m)=N-1 := by
    have hs := hSlack x
    have hl := hLast x
    rw [hx,mul_zero] at hs
    omega
  have hGapZero (x y : ↥I) (hx : q x=0) (hy : q y=0) : x=y := by
    have hx' := hEnd x hx
    have hy' := hEnd y hy
    have hAt (z : ↥I) (j : Fin (m+1)) : z.val∈L.verticesAt (p z j) :=
      (L.mem_verticesAt _ _).mpr ((L.mem_incidentPositions _ _).mp (hIn z j))
    have hN' : lo≠hi := by
      intro hz
      have he' := congrArg Fin.val hz
      change 0=N-1 at he'
      omega
    have ex₀ : p x 0=lo := Fin.ext hx'.1
    have ex₁ : p x (Fin.last m)=hi := Fin.ext hx'.2
    have ey₀ : p y 0=lo := Fin.ext hy'.1
    have ey₁ : p y (Fin.last m)=hi := Fin.ext hy'.2
    apply Subtype.ext
    exact L.commonVertex_unique_of_distinct_positions hN'
      (ex₀ ▸ hAt x 0) (ex₁ ▸ hAt x (Fin.last m))
      (ey₀ ▸ hAt y 0) (ey₁ ▸ hAt y (Fin.last m))
  have hZero : (Finset.univ.filter fun x : ↥I => q x=0).card≤1 := by
    apply Finset.card_le_one.mpr
    intro x hx y hy
    exact hGapZero x y (Finset.mem_filter.mp hx).2 (Finset.mem_filter.mp hy).2
  have hDu : (graph u v).degree u=m := by rw [graph_special_degree huv,hV]
  have hDv : (graph u v).degree v=m := by
    rw [← SimpleGraph.ncard_neighborSet]
    have e := congrArg (fun A : SimpleGraph V => (A.neighborSet v).ncard) (graph_swap u v)
    rw [e,SimpleGraph.ncard_neighborSet,graph_special_degree huv.symm,hV]
  have hU := (L.runCount_le_degree u).trans (le_of_eq hDu)
  have hW := (L.runCount_le_degree v).trans (le_of_eq hDv)
  have hSum : (∑ x : ↥I,L.runCount x.val)+L.runCount u+L.runCount v=N+1 := by
    have hs := L.sum_runCount (by omega : 0<N)
    have h₁ := Finset.sum_erase_add _ L.runCount hMemV
    have h₂ := Finset.sum_erase_add _ L.runCount (Finset.mem_univ u)
    have h₃ : (∑ x : ↥I,L.runCount x.val)=∑ x∈I,L.runCount x := Finset.sum_attach I _
    rw [h₃,Nat.add_right_comm]
    have h₄ : (∑ x∈I,L.runCount x)+L.runCount v =
        ∑ x∈(Finset.univ : Finset V).erase u,L.runCount x := h₁
    rw [h₄,h₂]
    exact hs
  have hTotal : (∑ x : ↥I,L.runCount x.val)+L.runCount u+L.runCount v=
      Fintype.card ↥I*R+2*m+1 := by
    rw [hSum,hCardI]
    have he' : N+1=n*(h-1) := by omega
    rw [he']
    exact close_run_budget h hh
  obtain ⟨⟨b,hb,hUnique⟩,hu,hv,hExact⟩ :=
    saturate_all_run_capacities q (fun x : ↥I => L.runCount x.val) R m
      (L.runCount u) (L.runCount v) hR (fun x => (hK x).trans_le (hCapacity x))
      hZero hU hW hTotal
  have hbK : L.runCount b.val=h-1 := by
    rcases hExact b with hh'|hh' <;> omega
  refine ⟨b.val,(hI b).1,(hI b).2,hbK,hu,hv,?_,?_,?_⟩
  · exact fun i j hij => L.no_consecutive_occurrence_of_runCount_eq_degree u (hu.trans hDu.symm) hij
  · exact fun i j hij => L.no_consecutive_occurrence_of_runCount_eq_degree v (hv.trans hDv.symm) hij
  · intro x hxu hxv
    let z : ↥I := ⟨x,by simp [I,hxu,hxv]⟩
    have hKz : jumpCount n (t z)+1=R+1-q z := by
      rw [← hK z]
      rcases hExact z with hh'|hh' <;> omega
    have hStep := run_steps_of_saturated_capacity hn (t z) (ht z) (hLast z) (hMod z)
      hSize (hSlack z) hKz
    refine ⟨p z,hMono z,hIn z,hAll z,?_,?_,?_⟩
    · intro j
      have hs := hStep j
      exact hs.imp id (fun eq => (eq.trans (by omega)))
    · intro hx
      have hz : z=b := Subtype.ext hx
      obtain ⟨he₀,heN⟩ := hEnd z (hz.symm ▸ hb)
      change t z 0=0 ∧ t z (Fin.last m)+1=N
      exact ⟨he₀,by omega⟩
    · intro hx
      have hq₁ : q z=1 := by
        rcases hExact z with hz|hz
        · exact (hx (congrArg Subtype.val (hUnique z hz.1))).elim
        · exact hz.1
      have hs := hSlack z
      have hl := hLast z
      rw [hq₁,mul_one] at hs
      have hr : L.runCount z.val=R := by
        rcases hExact z with hz|hz <;> omega
      change L.runCount z.val=R ∧ t z 0≤n ∧ t z (Fin.last m)=t z 0+N-2*h
      exact ⟨hr,by omega,by omega⟩

end CircularCompleteMinusEdge
