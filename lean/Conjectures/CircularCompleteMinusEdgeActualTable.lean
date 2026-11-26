import Conjectures.CircularCompleteMinusEdgeSpecialIntervals
import Conjectures.CircularCompleteMinusEdgeSpecialColumnPairs

/-! Lemma 5(3) for the actual chronological order. This is still
before the comparison of left-hand boundary rows in Steps 6–8. -/

namespace CircularCompleteMinusEdge

variable {V : Type*} [Fintype V] [DecidableEq V]
    {u v : V} [Fintype (graph u v).edgeSet] {h : ℕ} [NeZero (2*h-1)]
    {C : ProperColoring (graph u v) (2*h-1)}

/-- The exact normal occurrence intervals, their transition sites,
and the singleton intervals at the four special columns. -/
theorem actual_normal_occurrence_intervals (L : LinearEdgeOrder C) (huv : u≠v)
    (hh : 4≤h) (hV : Fintype.card V=2*h-1) :
    ∃ b : V, b≠u ∧ b≠v ∧ L.runCount b=h-1 ∧
      ∃ S : Fin (2*h) → Prop,
      (∀ s : Fin (Fintype.card (graph u v).edgeSet),
         S ⟨s.val%(2*h),Nat.mod_lt _ (by omega)⟩ ↔
           u∈L.verticesAt s ∨ v∈L.verticesAt s) ∧
      Nat.card {c : Fin (2*h) // S c ∧ c.val<h}=2 ∧
      Nat.card {c : Fin (2*h) // S c ∧ h≤c.val}=2 ∧
      (∀ c : Fin (2*h), S c ↔ S (tableHalfShift (by omega : 0<h) c)) ∧
      ∀ x : V, x≠u → x≠v →
        let G := if x=b then h-1 else h
        ∃ α : ℕ, ∃ lo hi : ℕ → ℕ,
          α<2*h ∧ (x=b → α=0) ∧
          (∃ s ∈ L.incidentPositions x, s.val=α) ∧
          (∀ s ∈ L.incidentPositions x, α≤s.val) ∧
          lo 0=0 ∧ hi G=L.runCount x-1 ∧
          (∀ g≤G, lo g≤hi g) ∧
          (∀ g<G, hi g=lo (g+1)) ∧
          (∀ q : ℕ, (∃ s ∈ L.incidentPositions x,s.val=q) ↔
            ∃ g k, g≤G ∧ lo g≤k ∧ k≤hi g ∧ q=α+g+2*h*k) ∧
          (∀ q : ℕ,
            (∃ s t : Fin (Fintype.card (graph u v).edgeSet),
              s∈L.incidentPositions x ∧ t∈L.incidentPositions x ∧ s.val=q ∧ t.val=q+1) ↔
            ∃ g<G, q=α+g+2*h*hi g) ∧
          (∀ g≤G, S ⟨(α+g)%(2*h),Nat.mod_lt _ (by omega)⟩ → lo g=hi g) := by
  classical
  obtain ⟨b,hbu,hbv,hb,_,_,hu,hv,hOrder⟩ := actual_deleted_edge_run_rigidity L huv hh hV
  obtain ⟨S,hS,hSL,hSR,hShift⟩ := actual_special_column_halfShift L huv hh hV
  refine ⟨b,hbu,hbv,hb,S,hS,hSL,hSR,hShift,?_⟩
  intro x hxu hxv
  let n := 2*h-1
  let m := n-2
  let G := if x=b then h-1 else h
  change ∃ (α : ℕ) (lo hi : ℕ → ℕ), α<2*h ∧ (x=b → α=0) ∧ _
  obtain ⟨p,hp,hIn,hAll,hG,hB,hN⟩ := hOrder x hxu hxv
  let f : Fin (m+1) → ℕ := fun i => (p i).val
  have hf : StrictMono f := fun _ _ e => hp e
  have hG' : ∀ i, runStep f i=1 ∨ runStep f i=1+n :=
    fun i => (hG i).imp id (fun e => e.trans (by dsimp [n]; omega))
  obtain ⟨hMod,hSat⟩ := two_gap_mod_and_saturation f (by dsimp [n]; omega) hG'
  have hJump := edgeStepPrefix_last_eq_jumpCount f hf (by dsimp [n]; omega) hMod hSat
  have hRun := L.runCount_eq_one_add_jumpCount x (by omega : 2≤2*h-1) p hp hIn hAll hMod
  change L.runCount x=jumpCount n f+1 at hRun
  have hLast : edgeStepPrefix f true (Fin.last m)=L.runCount x-1 := by rw [hJump,hRun]; omega
  have eCount := (exact_two_gap_prefix_position f hf hG (by omega : 2≤2*h) (Fin.last m)).1
  change edgeStepPrefix f false (Fin.last m)+edgeStepPrefix f true (Fin.last m)=m at eCount
  rw [hLast] at eCount
  have hm : m=2*h-3 := by dsimp [m,n]; omega
  have hShort : edgeStepPrefix f false (Fin.last m)=G := by
    by_cases e : x=b
    · have bRun : L.runCount x=h-1 := e ▸ hb
      simp only [G,e,ite_true]
      omega
    · have eRun := (hN e).1
      simp only [G,e,ite_false]
      omega
  obtain ⟨lo,hi,hL,hR,hI,hA,hVisits,hCross⟩ := two_gap_prefix_table f hf hG (by omega : 2≤2*h)
  rw [hShort,hLast] at hR
  simp only [hShort] at hI hA hVisits hCross
  have hSmall : f 0<2*h := by
    by_cases e : x=b
    · have h₀ := (hB e).1
      change (p 0).val < 2*h
      omega
    · have h₀ := (hN e).2.1
      change (p 0).val < 2*h
      omega
  have hα : x=b → f 0=0 := fun e => (hB e).1
  refine ⟨f 0,lo,hi,hSmall,hα,⟨p 0,hIn 0,rfl⟩,?_,hL,hR,?_,hA,?_,?_,?_⟩
  · intro s hs
    obtain ⟨j,rfl⟩ := hAll s hs
    exact hf.monotone (Fin.zero_le j)
  · intro g hg
    exact (hI g hg).1
  · intro q
    rw [← hVisits q]
    exact ⟨fun ⟨s,hs,e⟩ => by obtain ⟨j,rfl⟩ := hAll s hs; exact ⟨j,e⟩,
      fun ⟨i,e⟩ => ⟨p i,hIn i,e⟩⟩
  · intro q
    rw [← hCross q]
    constructor
    · rintro ⟨s,t,hs,ht,es,et⟩
      obtain ⟨j,rfl⟩ := hAll s hs
      obtain ⟨k,rfl⟩ := hAll t ht
      have e : f k=f j+1 := by change f j=q at es; change f k=q+1 at et; omega
      obtain ⟨i,rfl,rfl⟩ := StrictMono.fin_adjacent_indices_of_nat_image hf e
      exact ⟨i,es,et⟩
    · exact fun ⟨i,es,et⟩ => ⟨p i.castSucc,p i.succ,hIn _,hIn _,es,et⟩
  · intro g hg hs
    let T : ℕ → Prop := fun c => ∃ hc : c<2*h, S ⟨c,hc⟩
    have hT (s : Fin (Fintype.card (graph u v).edgeSet)) :
        T (s.val%(2*h)) ↔ u∈L.verticesAt s ∨ v∈L.verticesAt s := by
      change (∃ hc : s.val%(2*h)<2*h, S ⟨_,hc⟩) ↔ _
      exact ⟨fun ⟨_,e⟩ => (hS s).mp e,
        fun e => ⟨Nat.mod_lt _ (by omega),(hS s).mpr e⟩⟩
    exact L.special_row_interval_singleton hxu hxv hu hv p hp (by omega) hIn hAll hG T hT
      (hI g hg).1 (hI g hg).2 ⟨Nat.mod_lt _ (by omega),hs⟩

end CircularCompleteMinusEdge
