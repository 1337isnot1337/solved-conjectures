module
public import Conjectures.NovelliThibonTableauVertical

@[expose] public section
namespace NovelliThibon

structure ParameterPowers where
  qPower : ℤ
  tPower : ℕ → ℤ

variable (m : ℕ) (μ : YoungDiagram)

noncomputable def fillingPowers (w : Cell μ → Fin (m+2)) : ParameterPowers :=
  ⟨qFillingExponent μ w,fun j => tFillingExponent μ j w⟩

open Classical in
noncomputable def fillingPowerSupport : Finset ParameterPowers :=
  Finset.univ.image (fillingPowers m μ)

open Classical in
/-- The signed Schur coefficient of a single Laurent monomial in the
normalized finite filling sum, collected over its exact exponent fiber. -/
noncomputable def powerSchurCoefficient (lam : YoungDiagram) (s : ParameterPowers) : ℤ :=
  schurExtract (m:=m) lam (∑ w : Cell μ → Fin (m+2) with fillingPowers m μ w=s,
    cellWordWeight MvPolynomial.X w)

theorem powerSchur_moment (lam : YoungDiagram) (f : ParameterPowers → ℤ) :
    (∑ s ∈ fillingPowerSupport m μ,f s * powerSchurCoefficient m μ lam s) =
      schurExtract (m:=m) lam
        (∑ w : Cell μ → Fin (m+2), (f (fillingPowers m μ w) : MvPolynomial (Fin (m+2)) ℤ) *
          cellWordWeight MvPolynomial.X w) := by
  classical
  unfold powerSchurCoefficient
  simp_rw [map_sum,Finset.mul_sum]
  have hf (s : ParameterPowers) :
      (∑ w : Cell μ → Fin (m+2) with fillingPowers m μ w=s,
        f s * schurExtract (m:=m) lam (cellWordWeight MvPolynomial.X w)) =
      ∑ w : Cell μ → Fin (m+2) with fillingPowers m μ w=s,
        f (fillingPowers m μ w) * schurExtract (m:=m) lam (cellWordWeight MvPolynomial.X w) := by
    apply Finset.sum_congr rfl
    intro w hw
    rw [(Finset.mem_filter.mp hw).2]
  simp_rw [hf]
  have hmap : ∀ w ∈ (Finset.univ : Finset (Cell μ → Fin (m+2))),
      fillingPowers m μ w ∈ fillingPowerSupport m μ :=
    fun w hw => Finset.mem_image_of_mem _ hw
  let wf (w : Cell μ → Fin (m+2)) : ℤ :=
    f (fillingPowers m μ w) * schurExtract (m:=m) lam (cellWordWeight MvPolynomial.X w)
  change (∑ s ∈ fillingPowerSupport m μ,
      ∑ w : Cell μ → Fin (m+2) with fillingPowers m μ w=s, wf w) = _
  rw [Finset.sum_fiberwise_of_maps_to (g:=fillingPowers m μ) hmap wf]
  apply Finset.sum_congr rfl
  intro w _
  rw [← zsmul_eq_mul,map_smul,zsmul_eq_mul]
  simp [wf]

theorem q_powerSchur_moment (lam : BoundedDiagram (m+2)) :
    (∑ s ∈ fillingPowerSupport m μ,s.qPower * powerSchurCoefficient m μ lam.val s) =
      (∑ r : Fin (μ.colLen 0),((μ.rowLen r.val).choose 2:ℤ)) *
        (Fintype.card (VerticalStandardTableau (μ.card-2) lam.val):ℤ) := by
  rw [powerSchur_moment]
  simp_rw [fillingPowers,mul_comm (↑(qFillingExponent μ _) : MvPolynomial (Fin (m+2)) ℤ)]
  rw [q_schur_filling_moment_eq_diagramChains,diagramChains_eq_verticalStandardTableau_card]

theorem t_powerSchur_moment (lam : BoundedDiagram (m+2)) {j : ℕ} (hj : 0<j) :
    (∑ s ∈ fillingPowerSupport m μ,s.tPower j * powerSchurCoefficient m μ lam.val s) =
      (μ.rowLen j:ℤ) * (Fintype.card (VerticalStandardTableau (μ.card-2) lam.val):ℤ) := by
  rw [powerSchur_moment]
  simp_rw [fillingPowers,mul_comm (↑(tFillingExponent μ j _) : MvPolynomial (Fin (m+2)) ℤ)]
  rw [t_schur_filling_moment_eq_diagramChains m μ lam hj,diagramChains_eq_verticalStandardTableau_card]

theorem zpow_sum_finset {G ι : Type*} [CommGroup G] (q : G) (s : Finset ι) (f : ι → ℤ) :
    q^(∑ i ∈ s,f i) = ∏ i ∈ s,q^f i := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | insert a s ha ih => rw [Finset.sum_insert ha,Finset.prod_insert ha,zpow_add,ih]

/-- Signed monomial product formula for the actual normalized filling
polynomial: arbitrary independent units specialize all the Laurent
parameters, and the scalar exponent is the literal tableau cardinal. -/
theorem normalized_filling_monomial_product {G : Type*} [CommGroup G] (lam : BoundedDiagram (m+2))
    (q : G) (t : ℕ → G) :
    (∏ s ∈ fillingPowerSupport m μ,
      (q^s.qPower * ∏ j ∈ activeLegs μ,t j^s.tPower j) ^ powerSchurCoefficient m μ lam.val s) =
      (q^(∑ r : Fin (μ.colLen 0),((μ.rowLen r.val).choose 2:ℤ)) *
        ∏ j ∈ activeLegs μ,t j^(μ.rowLen j:ℤ)) ^
          (Fintype.card (VerticalStandardTableau (μ.card-2) lam.val):ℤ) := by
  classical
  simp_rw [mul_zpow,← Finset.prod_zpow,← zpow_mul,Finset.prod_mul_distrib]
  rw [Finset.prod_comm (s:=fillingPowerSupport m μ) (t:=activeLegs μ)]
  simp_rw [← zpow_sum_finset]
  rw [q_powerSchur_moment]
  congr 1
  apply Finset.prod_congr rfl
  intro j hj
  rw [t_powerSchur_moment m μ lam ((mem_activeLegs μ).mp hj).1]

end NovelliThibon
