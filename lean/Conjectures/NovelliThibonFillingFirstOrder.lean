module
public import Conjectures.NovelliThibonDiagramMoments
public import Conjectures.NovelliThibonDualResponse

@[expose] public section
namespace NovelliThibon

open Classical

variable {R A : Type*} [CommRing R] [LinearOrder A] [Fintype A]

omit [LinearOrder A] in
theorem cell_words_total_weight (μ : YoungDiagram) (x : A → R) :
    (∑ w : (Cell μ → A),cellWordWeight x w) = (alphabetSum x)^μ.card := by
  classical
  unfold cellWordWeight alphabetSum
  have h := Finset.prod_univ_sum (t:=fun _ : Cell μ => (Finset.univ : Finset A)) (fun _ a => x a)
  simpa only [Fintype.piFinset_univ,Finset.prod_const,Finset.card_univ,Fintype.card_coe] using h.symm

noncomputable def fillingDirectionEvaluation (μ : YoungDiagram) (x : A → R)
    (J : Finset ℕ) (qDirection : R) (tDirection : ℕ → R) : DualNumber R :=
  laurentDirections (insert none (J.image some))
    (cellWordWeight (μ:=μ) x)
    (fun j w => j.elim (qFillingExponent μ w) (fun j => tFillingExponent μ j w))
    (fun j => j.elim qDirection tDirection)

theorem fillingDirectionEvaluation_constant (μ : YoungDiagram) (x : A → R) (J : Finset ℕ)
    (qDirection : R) (tDirection : ℕ → R) :
    (fillingDirectionEvaluation μ x J qDirection tDirection).fst = (alphabetSum x)^μ.card := by
  rw [fillingDirectionEvaluation,laurentDirections_fst,cell_words_total_weight]

/-- Literal independent first-order directions of the normalized
cell-filling expansion, with the exact French row and leg counts. -/
theorem fillingDirectionEvaluation_linear (μ : YoungDiagram) (x : A → R) (J : Finset ℕ)
    (hJ : ∀ j∈J,0 < j) (qDirection : R) (tDirection : ℕ → R) :
    (fillingDirectionEvaluation μ x J qDirection tDirection).snd =
      ((∑ r : Fin (μ.colLen 0), ((μ.rowLen r.val).choose 2:R))*qDirection +
        ∑ j ∈ J,(μ.rowLen j:R)*tDirection j) *
          (alphabetPairSum x*(alphabetSum x)^(μ.card-2)) := by
  rw [fillingDirectionEvaluation,laurentDirections_snd,
    Finset.sum_insert (by simp),Finset.sum_image (fun _ _ _ _ e => Option.some.inj e)]
  change qDirection*(∑ w : (Cell μ → A),cellWordWeight x w*(qFillingExponent μ w:R)) +
    (∑ j ∈ J,tDirection j*(∑ w : (Cell μ → A),cellWordWeight x w*(tFillingExponent μ j w:R))) = _
  let E := alphabetPairSum x*(alphabetSum x)^(μ.card-2)
  rw [q_filling_first_moment,add_mul,
    Finset.sum_mul (s:=J) (f:=fun j => (μ.rowLen j:R)*tDirection j) (a:=E)]
  congr 1
  · ac_rfl
  · apply Finset.sum_congr rfl
    intro j hj
    rw [t_filling_first_moment μ x (hJ j hj)]
    dsimp [E]
    ac_rfl

/-- A shape has no vertical parameter with an index outside this set. -/
def activeLegs (μ : YoungDiagram) : Finset ℕ :=
  (Finset.range (μ.colLen 0)).erase 0

theorem mem_activeLegs (μ : YoungDiagram) {j : ℕ} :
    j ∈ activeLegs μ ↔ 0 < j ∧ j < μ.colLen 0 := by
  simp only [activeLegs,Finset.mem_erase,Finset.mem_range]
  omega

theorem optional_leg_mem_activeLegs (μ : YoungDiagram) {e : Cell μ × Cell μ}
    (he : e ∈ optionalVertical μ) : legLabel e.1 ∈ activeLegs μ := by
  have hcol := cell_mem_col e.1
  have hbound := μ.colLen_anti 0 (col e.1) (Nat.zero_le _)
  have hr := (mem_optionalVertical.mp he).1
  apply (mem_activeLegs μ).mpr
  unfold legLabel
  omega

omit [Fintype A] in
theorem t_filling_exponent_outside_activeLegs (μ : YoungDiagram) (w : Cell μ → A)
    {j : ℕ} (hj : j ∉ activeLegs μ) : tFillingExponent μ j w = 0 := by
  unfold tFillingExponent
  apply Finset.sum_eq_zero
  intro e he
  have hne : legLabel e.1 ≠ j := fun h => hj (h ▸ optional_leg_mem_activeLegs μ he)
  simp [hne]

/-- The first-order formula using the shape's entire set of relevant
vertical parameters; directions are arbitrary and simultaneous. -/
theorem full_fillingDirectionEvaluation_linear (μ : YoungDiagram) (x : A → R)
    (qDirection : R) (tDirection : ℕ → R) :
    (fillingDirectionEvaluation μ x (activeLegs μ) qDirection tDirection).snd =
      ((∑ r : Fin (μ.colLen 0), ((μ.rowLen r.val).choose 2:R))*qDirection +
        ∑ j ∈ activeLegs μ,(μ.rowLen j:R)*tDirection j) *
          (alphabetPairSum x*(alphabetSum x)^(μ.card-2)) :=
  fillingDirectionEvaluation_linear μ x (activeLegs μ)
    (fun _ hj => ((mem_activeLegs μ).mp hj).1) qDirection tDirection

end NovelliThibon
