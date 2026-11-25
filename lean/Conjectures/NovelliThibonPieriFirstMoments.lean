module
public import Conjectures.NovelliThibonSchurMoments
public import Conjectures.NovelliThibonDiagramChains

@[expose] public section
namespace NovelliThibon

def boundedVerticalTwo (m : ℕ) : BoundedDiagram (m+2) :=
  ⟨verticalTwoDiagram,verticalTwoDiagram_height.trans (Nat.le_add_left _ _)⟩

theorem vertical_exponentChains_eq_diagramChains {m : ℕ} (n : ℕ) (lam : BoundedDiagram (m+2)) :
    exponentChains n (verticalTwoExponents m) (shapeExponents lam.val) =
      diagramChains n (boundedVerticalTwo m) lam := by
  rw [← shapeExponents_verticalTwoDiagram]
  exact exponentChains_eq_diagramChains n (boundedVerticalTwo m) lam

/-- The Pieri coefficient counts the chains of literal Young diagrams from
the vertical two-box starting shape. There is no abstract Pieri axiom. -/
theorem schurExtract_e2_p1_pow_eq_diagramChains (m n : ℕ) (lam : BoundedDiagram (m+2)) :
    schurExtract (m:=m) lam.val (MvPolynomial.esymm (Fin (m+2)) ℤ 2 *
      (MvPolynomial.psum (Fin (m+2)) ℤ 1)^n) =
      (diagramChains n (boundedVerticalTwo m) lam:ℤ) := by
  rw [schurExtract_e2_p1_pow,vertical_exponentChains_eq_diagramChains]

theorem q_schur_filling_moment_eq_diagramChains (m : ℕ) (μ : YoungDiagram)
    (lam : BoundedDiagram (m+2)) :
    schurExtract (m:=m) lam.val
      (∑ w : Cell μ → Fin (m+2), cellWordWeight MvPolynomial.X w *
        (qFillingExponent μ w : MvPolynomial (Fin (m+2)) ℤ)) =
        (∑ r : Fin (μ.colLen 0),((μ.rowLen r.val).choose 2:ℤ)) *
          (diagramChains (μ.card-2) (boundedVerticalTwo m) lam:ℤ) := by
  rw [q_schur_filling_moment,vertical_exponentChains_eq_diagramChains]

theorem t_schur_filling_moment_eq_diagramChains (m : ℕ) (μ : YoungDiagram)
    (lam : BoundedDiagram (m+2)) {j : ℕ} (hj : 0<j) :
    schurExtract (m:=m) lam.val
      (∑ w : Cell μ → Fin (m+2), cellWordWeight MvPolynomial.X w *
        (tFillingExponent μ j w : MvPolynomial (Fin (m+2)) ℤ)) =
        (μ.rowLen j :ℤ) * (diagramChains (μ.card-2) (boundedVerticalTwo m) lam:ℤ) := by
  rw [t_schur_filling_moment m μ lam.val hj,vertical_exponentChains_eq_diagramChains]

end NovelliThibon
