module
public import Conjectures.NovelliThibonSourceFilling
public import Conjectures.NovelliThibonFillingFirstOrder

@[expose] public section
namespace NovelliThibon

open Classical

variable {n : ℕ}

noncomputable def indexCells (μ : YoungDiagram) (h : μ.card=n+1) : Cell μ ≃ Fin (n+1) :=
  (readingLabel μ).trans (Equiv.cast (congrArg Fin h))

theorem indexCells_lt_iff (μ : YoungDiagram) (h : μ.card=n+1) (a b : Cell μ) :
    indexCells μ h a < indexCells μ h b ↔ readingLabel μ a < readingLabel μ b := by
  have hcast {j k : ℕ} (hk : j=k) (i l : Fin j) :
      Equiv.cast (congrArg Fin hk) i < Equiv.cast (congrArg Fin hk) l ↔ i<l := by
    subst k
    rfl
  exact hcast h (readingLabel μ a) (readingLabel μ b)

noncomputable def indexEdges (μ : YoungDiagram) (h : μ.card=n+1)
    (S : Finset (Cell μ × Cell μ)) : Finset (LabelEdge (n+1)) :=
  S.map ((indexCells μ h).prodCongr (indexCells μ h)).toEmbedding

theorem indexEdges_oriented (μ : YoungDiagram) (h : μ.card=n+1)
    (S : Finset (Cell μ × Cell μ))
    (hs : ∀ p∈S,readingLabel μ p.1 < readingLabel μ p.2) :
    OrientedForward (indexEdges μ h S) := by
  intro p hp
  obtain ⟨e,he,rfl⟩ := Finset.mem_map.mp hp
  exact (indexCells_lt_iff μ h _ _).mpr (hs e he)

theorem attacking_optional_disjoint (μ : YoungDiagram) :
    Disjoint (attackingEdges μ) (optionalVertical μ) := by
  rw [Finset.disjoint_left]
  intro p hA hU
  obtain ⟨hr,hc⟩ := mem_optionalVertical.mp hU
  obtain he|he := Finset.mem_union.mp hA
  · have := (mem_sameRowAttacks.mp he).1
    omega
  · exact (mem_adjacentRowAttacks.mp he).2.ne hc.symm

theorem indexing_descents_card {A : Type*} [LinearOrder A]
    (μ : YoungDiagram) (h : μ.card=n+1) (S : Finset (Cell μ × Cell μ))
    (w : Cell μ → A) :
    graphDescents (indexEdges μ h S) (w ∘ (indexCells μ h).symm) =
      (S.filter fun e => w e.2 < w e.1).card := by
  unfold graphDescents indexEdges
  rw [Finset.filter_map,Finset.card_map]
  have he (e : Cell μ × Cell μ) :
      (((w ∘ (indexCells μ h).symm) (((indexCells μ h).prodCongr
        (indexCells μ h)) e).2) <
        ((w ∘ (indexCells μ h).symm) (((indexCells μ h).prodCongr
        (indexCells μ h)) e).1)) ↔ w e.2<w e.1 := by simp
  congr 1
  apply Finset.filter_congr
  intro e ne
  exact he e

variable {A K : Type*} [LinearOrder A] [Fintype A] [Field K]

/-- Source formula specialized to the literal French diagram. -/
noncomputable def sourceShapeEvaluation (μ : YoungDiagram) (h : μ.card=n+1)
    (x : A → K) (q : K) (t : ℕ → K) : K :=
  sourceModifiedGraphSum x (indexEdges μ h (attackingEdges μ))
    (indexEdges μ h (optionalVertical μ)) q
    (fun e => t (legLabel ((indexCells μ h).symm e.1)))
    (fun e => arm ((indexCells μ h).symm e.1))

theorem sourceShapeEvaluation_eq_edge_filling (μ : YoungDiagram) (h : μ.card=n+1)
    (x : A → K) (q : K) (hq : q≠0) (hq1 : q≠1) (t : ℕ → K) :
    sourceShapeEvaluation μ h x q t =
      ∑ w : Cell μ → A, (q^qFillingExponent μ w *
        (∏ e ∈ optionalVertical μ,if w e.2 < w e.1 then t (legLabel e.1) else 1)) *
          cellWordWeight x w := by
  unfold sourceShapeEvaluation
  have ha : OrientedForward (indexEdges μ h (attackingEdges μ)) := by
    apply indexEdges_oriented
    intro e he
    obtain he | he := Finset.mem_union.mp he
    · exact sameRowAttacks_oriented he
    · exact adjacentRowAttacks_oriented he
  have hv : OrientedForward (indexEdges μ h (optionalVertical μ)) :=
    indexEdges_oriented μ h _ (fun _ hp => optionalVertical_oriented hp)
  have hd : Disjoint (indexEdges μ h (attackingEdges μ)) (indexEdges μ h (optionalVertical μ)) :=
    (Finset.disjoint_map _).mpr (attacking_optional_disjoint μ)
  rw [sourceModifiedGraphSum_eq_word_sum x _ _ ha hv hd q hq hq1]
  let f : (Cell μ → A) ≃ (Fin (n+1) → A) :=
    Equiv.arrowCongr (indexCells μ h) (Equiv.refl A)
  rw [← Equiv.sum_comp f]
  apply Finset.sum_congr rfl
  intro w _
  have hf : f w = w ∘ (indexCells μ h).symm := rfl
  have hweight : wordWeight x (f w) = cellWordWeight x w := by
    unfold wordWeight cellWordWeight
    rw [← Equiv.prod_comp (indexCells μ h)]
    simp only [hf,Function.comp_apply,Equiv.symm_apply_apply]
  rw [hweight,hf,normalizedGraphWordWeight,indexing_descents_card]
  unfold indexEdges
  rw [Finset.sum_map,Finset.prod_map]
  simp only [Equiv.toEmbedding_apply,Equiv.prodCongr_apply,Function.comp_apply]
  have hfst (e : Cell μ × Cell μ) : (Prod.map (indexCells μ h) (indexCells μ h) e).1 = indexCells μ h e.1 := rfl
  have hsnd (e : Cell μ × Cell μ) : (Prod.map (indexCells μ h) (indexCells μ h) e).2 = indexCells μ h e.2 := rfl
  simp only [hfst,hsnd,Equiv.symm_apply_apply]
  have hc : ((Finset.filter (fun e => w e.2<w e.1) (attackingEdges μ)).card:ℤ) =
      ∑ e ∈ attackingEdges μ,if w e.2<w e.1 then 1 else 0 := by
    rw [← Finset.sum_filter]
    simp
  rw [hc,qFillingExponent]
  push_cast
  rfl

end NovelliThibon
