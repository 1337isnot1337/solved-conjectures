module
public import Conjectures.NovelliThibonSignedSource
public import Conjectures.NovelliThibonSourceShape
public import Conjectures.NovelliThibonHookCellProduct

@[expose] public section
namespace NovelliThibon

open Classical
variable {n : ℕ} {K : Type*} [Field K]

theorem markedGraphWeight_eq_filter
    (E U : Finset (LabelEdge (n+1))) (hE : OrientedForward E) (hU : OrientedForward U)
    (q : K) (t : LabelEdge (n+1) → K) (a : LabelEdge (n+1) → ℕ)
    (S : Finset (Fin (n+1))) :
    normalizedGraphWordWeight E U q t a (markedStandardize S) =
      q^(((E.filter fun e => e.2∈S).card:ℤ) -
        ∑ e ∈ U with e.2∈S,(a e:ℤ)) * ∏ e ∈ U with e.2∈S,t e := by
  unfold normalizedGraphWordWeight
  rw [marked_graphDescents_eq_head_count E hE]
  push_cast
  have hs :
      (∑ e ∈ U,if markedStandardize S e.2 < markedStandardize S e.1 then (a e:ℤ) else 0) =
        ∑ e ∈ U,if e.2∈S then (a e:ℤ) else 0 :=
    Finset.sum_congr rfl (fun e he => by simp only [markedStandardize_inversion_iff S (hU e he)])
  have ht :
      (∏ e ∈ U,if markedStandardize S e.2 < markedStandardize S e.1 then t e else 1) =
        ∏ e ∈ U,if e.2∈S then t e else 1 :=
    Finset.prod_congr rfl (fun e he => by simp only [markedStandardize_inversion_iff S (hU e he)])
  rw [hs,ht,Finset.sum_filter,Finset.prod_filter]

theorem indexEdges_filter_marks (μ : YoungDiagram) (h : μ.card=n+1)
    (E : Finset (Cell μ×Cell μ)) (S : Finset (Cell μ)) :
    (indexEdges μ h E).filter (fun e => e.2∈(indexCells μ h).finsetCongr S) =
      indexEdges μ h (E.filter fun e => e.2∈S) := by
  unfold indexEdges
  rw [Finset.filter_map]
  apply congrArg (fun s : Finset (Cell μ×Cell μ) =>
    s.map ((indexCells μ h).prodCongr (indexCells μ h)).toEmbedding)
  apply Finset.filter_congr
  intro e he
  change (indexCells μ h e.2)∈S.map (indexCells μ h).toEmbedding ↔ _
  simp

/-- Evaluate the original commutative graph expression with the
negative-first signed alphabet at the level of fundamental functions. -/
noncomputable def signedSourceShapeEvaluation (μ : YoungDiagram) (h : μ.card=n+1)
    (q z : K) (t : ℕ → K) : K :=
  signedSourceModifiedGraphSum (indexEdges μ h (attackingEdges μ))
    (indexEdges μ h (optionalVertical μ)) q z
    (fun e => t (legLabel ((indexCells μ h).symm e.1)))
    (fun e => arm ((indexCells μ h).symm e.1))

theorem signedSourceShapeEvaluation_eq_marked_diagram (μ : YoungDiagram) (h : μ.card=n+1)
    (q z : K) (hq : q≠0) (hq1 : q≠1) (t : ℕ → K) :
    signedSourceShapeEvaluation μ h q z t = markedDiagramEvaluation μ q z t := by
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
  rw [signedSourceShapeEvaluation,signedSourceModifiedGraphSum_eq_marked_sum _ _ ha hv hd q z hq hq1]
  unfold markedDiagramEvaluation
  rw [← Equiv.sum_comp (indexCells μ h).finsetCongr]
  apply Finset.sum_congr rfl
  intro S _
  rw [markedGraphWeight_eq_filter _ _ ha hv,indexEdges_filter_marks,indexEdges_filter_marks]
  have hcard : ((indexCells μ h).finsetCongr S).card=S.card := Finset.card_map _
  rw [hcard]
  unfold indexEdges markedCellExponent
  rw [Finset.card_map,Finset.sum_map,Finset.prod_map]
  have hfst (e : Cell μ×Cell μ) :
      (((indexCells μ h).prodCongr (indexCells μ h)).toEmbedding e).1 = indexCells μ h e.1 := rfl
  simp only [hfst,Equiv.symm_apply_apply]

/-- Complete product evaluation for the signed two-letter specialization
of the original commutative graph formula; the Schur hook extraction is separate. -/
theorem signedSourceShapeEvaluation_cell_product (μ : YoungDiagram) (h : μ.card=n+1)
    (q z : K) (hq : q≠0) (hq1 : q≠1) (t : ℕ → K) :
    signedSourceShapeEvaluation μ h q z t =
      ∏ b : Cell μ,(1-z*(q^col b*(if row b=0 then 1 else t (row b)))) := by
  rw [signedSourceShapeEvaluation_eq_marked_diagram μ h q z hq hq1,
    markedDiagramEvaluation_cell_product]

end NovelliThibon
