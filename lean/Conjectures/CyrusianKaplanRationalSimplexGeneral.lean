module
public import Conjectures.CyrusianKaplanRationalRayChart

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

/-- Actual integer points in the positive-barycentric dilate of
a family of rational vertices. There is no extra height coordinate
in the defining set. -/
def rationalBarycentricLatticePoints {d m : ℕ} (v : Fin d → Fin m → ℚ) (g : ℕ) :=
  {z : Fin m → ℤ // ∃ u : Fin d → ℝ,(∀ i,0<u i) ∧ (∑ i,u i)=1 ∧
    ∀ j,(z j:ℝ)=(g:ℝ)*(∑ i,(v i j:ℝ)*u i)}

/-- Passing to the homogeneous chart gives an exact bijection
of actual ambient lattice points, with the height row fixed to g. -/
def rationalBarycentricLatticeEquiv {d m : ℕ} (v : Fin d → Fin m → ℚ) (g : ℕ) :
    rationalBarycentricLatticePoints v g ≃
      openRationalSimplexLatticePoints (rationalVertexRayMatrix v) 0 g where
  toFun z := by
    refine ⟨Fin.cases (g:ℤ) z.val,rfl,?_⟩
    obtain ⟨u,hU,hSum,hz⟩ := z.property
    refine ⟨u,hU,hSum,?_⟩
    intro j
    refine Fin.cases ?_ (fun j => ?_) j
    · change ((g:ℤ):ℝ) = (g:ℝ)*
        (∑ i,((rationalVertexRayMatrix v 0 i:ℝ)/(rationalVertexRayMatrix v 0 i:ℝ))*u i)
      have hNZ (i : Fin d) : (rationalVertexRayMatrix v 0 i:ℝ)≠0 := by
        exact_mod_cast (rationalVertexRayMatrix_height_positive v i).ne'
      simp_rw [Int.cast_natCast,div_self (hNZ _),one_mul,hSum,mul_one]
    · change (z.val j:ℝ)=(g:ℝ)*
        (∑ i,((rationalVertexRayMatrix v j.succ i:ℝ)/(rationalVertexRayMatrix v 0 i:ℝ))*u i)
      simp_rw [rationalVertexRayMatrix_ratio]
      exact hz j
  invFun z := by
    refine ⟨fun j => z.val j.succ,?_⟩
    obtain ⟨u,hU,hSum,hz⟩ := z.property.2
    refine ⟨u,hU,hSum,fun j => ?_⟩
    have h := hz j.succ
    simp_rw [rationalVertexRayMatrix_ratio] at h
    exact h
  left_inv _ := rfl
  right_inv z := by
    apply Subtype.ext
    funext j
    refine Fin.cases ?_ (fun _ => rfl) j
    exact z.property.1.symm

/-- The all-positive-genus open-simplex counting step in the
literal rational vertex formulation: no ray chart is assumed
in the statement. The construction clears denominators and
uses affine independence to check the chart's injectivity. -/
theorem rationalBarycentric_lattice_quasipolynomial {m k : ℕ}
    (v : Fin (k+1) → Fin m → ℚ)
    (hv : AffineIndependent ℝ (fun i j => (v i j:ℝ))) :
    HasPositiveGenusQuasipolynomial (fun g => (Nat.card (rationalBarycentricLatticePoints v g):ℚ)) k := by
  have he : (fun g => (Nat.card (rationalBarycentricLatticePoints v g):ℚ)) =
      fun g => (Nat.card (openRationalSimplexLatticePoints (rationalVertexRayMatrix v) 0 g):ℚ) := by
    funext g
    exact_mod_cast (Nat.card_congr (rationalBarycentricLatticeEquiv v g))
  rw [he]
  exact openRationalSimplex_lattice_quasipolynomial (rationalVertexRayMatrix v) 0
    (rationalVertexRayMatrix_height_positive v) (rationalVertexRayMatrix_injective v hv)

end CyrusianKaplan
