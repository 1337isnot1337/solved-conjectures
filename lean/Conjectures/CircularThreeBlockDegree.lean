import Conjectures.CircularThreeBlockDeficit

/-! Summing the vertex degrees shows that the three deficient vertices each
miss exactly one edge relative to the maximum. Every other vertex attains it. -/

namespace CircularIndex.Insertion.ThreeBlock

theorem degree_formula {g : ℕ} (hg : 15≤g) (K : Packing g) (v : Fin (vertexCount g)) :
    (schedule hg K).graph.degree v =
      if v.val=6 ∨ v.val=7 ∨ v.val=8 then 4*g+2 else 4*g+3 := by
  classical
  let S := schedule hg K
  let x : Fin (vertexCount g) := ⟨6,by unfold vertexCount; omega⟩
  let y : Fin (vertexCount g) := ⟨7,by unfold vertexCount; omega⟩
  let z : Fin (vertexCount g) := ⟨8,by unfold vertexCount; omega⟩
  have hxy : x≠y := by simp [x,y]
  have hxz : x≠z := by simp [x,z]
  have hyz : y≠z := by simp [y,z]
  have hx : S.graph.degree x<4*g+3 := deficient hg K 0
  have hy : S.graph.degree y<4*g+3 := deficient hg K 1
  have hz : S.graph.degree z<4*g+3 := deficient hg K 2
  let adjusted (w : Fin (vertexCount g)) := S.graph.degree w +
    (if w=x then 1 else 0) + (if w=y then 1 else 0) + (if w=z then 1 else 0)
  have upper (w : Fin (vertexCount g)) : adjusted w≤4*g+3 := by
    have max := (graph_degree_and_index hg K).1 w
    change S.graph.degree w≤4*g+3 at max
    by_cases hw : w=x
    · subst w; simp [adjusted,hxy,hxz]; omega
    by_cases hw' : w=y
    · subst w; simp [adjusted,hw,hyz]; omega
    by_cases hw'' : w=z
    · subst w; simp [adjusted,hw,hw']; omega
    simp [adjusted,hw,hw',hw'',max]
  have total : (∑ w, adjusted w)=∑ _w : Fin (vertexCount g), (4*g+3) := by
    simp only [adjusted,Finset.sum_add_distrib,Finset.sum_ite_eq',Finset.mem_univ,ite_true,
      Finset.sum_const,Finset.card_univ,Fintype.card_fin,smul_eq_mul]
    rw [S.graph.sum_degrees_eq_twice_card_edges,← S.graph.card_edgeSet,S.card_edges]
    unfold colours vertexCount
    ring
  have eq : adjusted v=4*g+3 := by
    apply le_antisymm (upper v)
    by_contra! h
    have lt := Finset.sum_lt_sum (s := (Finset.univ : Finset (Fin (vertexCount g))))
      (fun w _ => upper w) ⟨v,Finset.mem_univ v,h⟩
    omega
  change S.graph.degree v=_
  have ex : v=x ↔ v.val=6 := Fin.ext_iff
  have ey : v=y ↔ v.val=7 := Fin.ext_iff
  have ez : v=z ↔ v.val=8 := Fin.ext_iff
  simp only [adjusted,ex,ey,ez] at eq
  split_ifs at eq ⊢ <;> omega

end CircularIndex.Insertion.ThreeBlock
