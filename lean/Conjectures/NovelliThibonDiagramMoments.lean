module
public import Conjectures.NovelliThibonCellResponse
public import Conjectures.NovelliThibonRowCounts

@[expose] public section
namespace NovelliThibon

open Classical

def attackingEdges (μ : YoungDiagram) : Finset (Cell μ × Cell μ) :=
  sameRowAttacks μ ∪ adjacentRowAttacks μ

theorem attackingEdges_distinct (μ : YoungDiagram) {p : Cell μ × Cell μ}
    (h : p ∈ attackingEdges μ) : p.1 ≠ p.2 := by
  obtain h | h := Finset.mem_union.mp h
  · exact fun e => (sameRowAttacks_oriented h).ne (congrArg (readingLabel μ) e)
  · exact fun e => (adjacentRowAttacks_oriented h).ne (congrArg (readingLabel μ) e)

theorem optionalVertical_distinct (μ : YoungDiagram) {p : Cell μ × Cell μ}
    (h : p ∈ optionalVertical μ) : p.1 ≠ p.2 :=
  fun e => (optionalVertical_oriented h).ne (congrArg (readingLabel μ) e)

variable {R : Type*} [CommRing R]

theorem sum_vertical_weights (μ : YoungDiagram) (f : Cell μ → R) :
    (∑ e ∈ optionalVertical μ, f e.1) = ∑ c : NonbottomCell μ,f c.val := by
  rw [← Finset.sum_coe_sort (optionalVertical μ) (fun e => f e.1)]
  exact Fintype.sum_equiv (vertical_edges_equiv μ) _ _ (fun _ => rfl)

theorem q_edge_total (μ : YoungDiagram) :
    ((attackingEdges μ).card:R) - (∑ e ∈ optionalVertical μ,(arm e.1:R)) =
      ∑ r : Fin (μ.colLen 0), ((μ.rowLen r.val).choose 2:R) := by
  rw [sum_vertical_weights μ (fun c => (arm c:R))]
  have h := congrArg (Int.castRingHom R) (q_arm_correction_count μ)
  simpa [attackingEdges] using h

theorem t_edge_total (μ : YoungDiagram) {j : ℕ} (hj : 0 < j) :
    (∑ e ∈ optionalVertical μ,if legLabel e.1=j then (1:R) else 0) = μ.rowLen j := by
  rw [sum_vertical_weights μ (fun c => if legLabel c=j then (1:R) else 0),← Finset.sum_filter]
  have h : (Finset.univ.filter fun c : NonbottomCell μ => legLabel c.val=j).card = μ.rowLen j := by
    rw [← Fintype.card_subtype,legLabel_card μ hj]
  rw [Finset.sum_const,h,nsmul_one]

variable {A : Type*} [LinearOrder A] [Fintype A]

noncomputable def qFillingExponent (μ : YoungDiagram) (w : Cell μ → A) : ℤ :=
  (∑ p ∈ attackingEdges μ, if w p.2 < w p.1 then 1 else 0) -
  ∑ p ∈ optionalVertical μ, if w p.2 < w p.1 then (arm p.1:ℤ) else 0

noncomputable def tFillingExponent (μ : YoungDiagram) (j : ℕ) (w : Cell μ → A) : ℤ :=
  ∑ p ∈ optionalVertical μ, if w p.2 < w p.1 ∧ legLabel p.1=j then 1 else 0

/-- The actual weighted q-exponent sum of the cell-filling expansion;
the cross-row part cancels the arm adjustment exactly. -/
theorem q_filling_first_moment (μ : YoungDiagram) (x : A → R) :
    (∑ w : (Cell μ → A),cellWordWeight x w*(qFillingExponent μ w:R)) =
      (∑ r : Fin (μ.colLen 0), ((μ.rowLen r.val).choose 2:R)) *
        (alphabetPairSum x*(alphabetSum x)^(μ.card-2)) := by
  classical
  unfold qFillingExponent
  push_cast
  simp_rw [mul_sub]
  rw [Finset.sum_sub_distrib]
  rw [cell_words_linear_response x (attackingEdges μ) (fun _ => 1) (fun _ h => attackingEdges_distinct μ h),
    cell_words_linear_response x (optionalVertical μ) (fun e => (arm e.1:R)) (fun _ h => optionalVertical_distinct μ h)]
  rw [← sub_mul,Finset.sum_const,nsmul_one,q_edge_total]

/-- The actual weighted first moment for each positive vertical parameter. -/
theorem t_filling_first_moment (μ : YoungDiagram) (x : A → R) {j : ℕ} (hj : 0<j) :
    (∑ w : (Cell μ → A),cellWordWeight x w*(tFillingExponent μ j w:R)) =
      (μ.rowLen j:R)*(alphabetPairSum x*(alphabetSum x)^(μ.card-2)) := by
  classical
  unfold tFillingExponent
  push_cast
  have h (w : Cell μ → A) (p : Cell μ×Cell μ) :
      (if w p.2 < w p.1 ∧ legLabel p.1=j then (1:R) else 0) =
      if w p.2 < w p.1 then (if legLabel p.1=j then (1:R) else 0) else 0 := by
    by_cases hc : w p.2 < w p.1 <;> simp [hc]
  simp_rw [h]
  rw [cell_words_linear_response x (optionalVertical μ)
    (fun p => if legLabel p.1=j then 1 else 0) (fun _ hp => optionalVertical_distinct μ hp),
    t_edge_total μ hj]

end NovelliThibon
