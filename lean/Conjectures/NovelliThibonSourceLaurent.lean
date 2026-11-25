module
public import Conjectures.NovelliThibonSourceShape
public import Conjectures.NovelliThibonSourcePrefactors

@[expose] public section
namespace NovelliThibon

open Classical

variable {A K : Type*} [LinearOrder A] [Field K]

noncomputable def tFillingNatural (μ : YoungDiagram) (j : ℕ) (w : Cell μ → A) : ℕ :=
  ∑ e ∈ (optionalVertical μ).filter (fun e => legLabel e.1=j), if w e.2<w e.1 then 1 else 0

theorem tFillingExponent_as_filtered_sum (μ : YoungDiagram) (j : ℕ) (w : Cell μ → A) :
    tFillingExponent μ j w = (tFillingNatural μ j w : ℤ) := by
  unfold tFillingExponent tFillingNatural
  rw [Nat.cast_sum,Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro e he
  by_cases hl : legLabel e.1=j <;> by_cases hw : w e.2<w e.1 <;> simp [hl,hw]

theorem vertical_product_by_parameter (μ : YoungDiagram) (t : ℕ → K) (w : Cell μ → A) :
    (∏ e ∈ optionalVertical μ,if w e.2<w e.1 then t (legLabel e.1) else 1) =
      ∏ j ∈ activeLegs μ,t j^tFillingExponent μ j w := by
  let f (e : Cell μ × Cell μ) := if w e.2<w e.1 then t (legLabel e.1) else 1
  have hf : ∀ e∈optionalVertical μ,legLabel e.1∈activeLegs μ :=
    fun e he => optional_leg_mem_activeLegs μ he
  change (∏ e ∈ optionalVertical μ,f e) = _
  rw [← Finset.prod_fiberwise_of_maps_to (g:=fun e => legLabel e.1) hf f]
  apply Finset.prod_congr rfl
  intro j hj
  rw [tFillingExponent_as_filtered_sum,zpow_natCast,tFillingNatural,← Finset.prod_pow_eq_pow_sum]
  apply Finset.prod_congr rfl
  intro e he
  have hlabel := (Finset.mem_filter.mp he).2
  by_cases hh : w e.2<w e.1 <;> simp [f,hlabel,hh]

theorem shape_has_positive_height (μ : YoungDiagram) (h : 0<μ.card) : 0<μ.colLen 0 := by
  obtain ⟨p,hp⟩ := Finset.card_pos.mp h
  have hh : p.1<μ.colLen p.2 := YoungDiagram.mem_iff_lt_colLen.mp hp
  have hh' := μ.colLen_anti 0 p.2 (Nat.zero_le _)
  omega

theorem indexed_source_prefactors {n : ℕ} (μ : YoungDiagram) (h : μ.card=n+1) :
    (indexEdges μ h (optionalVertical μ)).card = μ.card - μ.rowLen 0 ∧
    (∑ e ∈ indexEdges μ h (optionalVertical μ),arm ((indexCells μ h).symm e.1)) =
      (∑ r : Fin (μ.colLen 0),(μ.rowLen r.val).choose 2) - (μ.rowLen 0).choose 2 := by
  constructor
  · rw [indexEdges,Finset.card_map,source_optional_card]
  · rw [indexEdges,Finset.sum_map]
    change (∑ e ∈ optionalVertical μ,arm ((indexCells μ h).symm ((indexCells μ h) e.1))) = _
    simp only [Equiv.symm_apply_apply]
    rw [← Finset.sum_coe_sort]
    have hm : (∑ e : ↥(optionalVertical μ),arm e.val.1) =
        ∑ c : NonbottomCell μ,arm c.val :=
      Fintype.sum_equiv (vertical_edges_equiv μ) _ _ (fun _ => rfl)
    rw [hm,source_arm_prefactor]
    exact shape_has_positive_height μ (by omega)

/-- The source's Definition 5.3 in the commutative finite alphabet
is the normalized Laurent filling sum of Eq. (5), with the exact
claimed (q) and (t_j) exponent functions. -/
theorem sourceShapeEvaluation_eq_Laurent_fillings [Fintype A] {n : ℕ} (μ : YoungDiagram)
    (h : μ.card=n+1) (x : A → K) (q : K) (hq : q≠0) (hq1 : q≠1) (t : ℕ → K) :
    sourceShapeEvaluation μ h x q t =
      ∑ w : Cell μ → A,
        (q^qFillingExponent μ w * ∏ j ∈ activeLegs μ,t j^tFillingExponent μ j w) *
          cellWordWeight x w := by
  rw [sourceShapeEvaluation_eq_edge_filling μ h x q hq hq1 t]
  simp_rw [vertical_product_by_parameter]

end NovelliThibon
