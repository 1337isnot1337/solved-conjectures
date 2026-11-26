module
public import Conjectures.CyrusianKaplanUniformRayTop
public import Conjectures.CyrusianKaplanRationalSimplexCount
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

/-- An integer point of the normalized affine span supplies a
unit-height lattice vector. Its affine coefficients need not be
nonnegative, so it need not lie inside the open simplex. -/
theorem unit_height_from_integral_affine_point {m d : ℕ}
    (A : Fin m → Fin d → ℤ) (ell : Fin m) (h : ∀ i,0<A ell i)
    (z : Fin m → ℤ) (u : Fin d → ℝ)
    (hu : (∑ i,u i)=1)
    (hz : ∀ j,(z j:ℝ)=∑ i,((A j i:ℝ)/(A ell i:ℝ))*u i) :
    ∃ v : rayCoordinateLattice m d (fun j i => (A j i:ℝ)),
      actualRayHeightHom A ell v=1 := by
  let q (i : Fin d) : ℝ := u i/(A ell i:ℝ)
  have hq : integerCoordinatesHom m z=coneRayCoordinateHom m d (fun j i => (A j i:ℝ)) q := by
    funext j
    change (z j:ℝ)=∑ i,(A j i:ℝ)*q i
    rw [hz]
    apply Finset.sum_congr rfl
    intro i _
    unfold q
    simp only [div_eq_mul_inv]
    ring
  have hz₁ : z ell=1 := by
    have hzR := hz ell
    have hNZ (i : Fin d) : (A ell i:ℝ)≠0 := by exact_mod_cast (h i).ne'
    simp_rw [div_self (hNZ _),one_mul,hu] at hzR
    exact_mod_cast hzR
  let v : rayCoordinateLattice m d (fun j i => (A j i:ℝ)) := ⟨q,⟨z,hq⟩⟩
  refine ⟨v,?_⟩
  have hV := actualRayHeightOfPoint_cast A ell v
  change (actualRayHeightHom A ell v:ℝ)=
    coneRayCoordinateHom m d (fun j i => (A j i:ℝ)) q ell at hV
  rw [← hq] at hV
  change (actualRayHeightHom A ell v:ℝ)=(z ell:ℝ) at hV
  exact (by exact_mod_cast hV : actualRayHeightHom A ell v=z ell).trans hz₁

/-- Exact open-simplex quasipolynomial with uniform top coefficient
when the actual affine span has an integer point. This is the
local count used for top-dimensional primitive correction cells. -/
theorem openRationalSimplex_lattice_quasipolynomial_uniform_top {m k : ℕ}
    (A : Fin m → Fin (k+1) → ℤ) (ell : Fin m) (h : ∀ i,0<A ell i)
    (hA : Function.Injective (coneRayCoordinateHom m (k+1) (fun j i => (A j i:ℝ))))
    (z : Fin m → ℤ) (u : Fin (k+1) → ℝ)
    (hu : (∑ i,u i)=1)
    (hz : ∀ j,(z j:ℝ)=∑ i,((A j i:ℝ)/(A ell i:ℝ))*u i) :
    ∃ p : ℕ, ∃ hp : 0<p, ∃ C : ℚ, ∃ Q : Fin p→Polynomial ℚ,
      (∀ s,(Q s).natDegree≤k) ∧ (∀ s,(Q s).coeff k=C) ∧
      ∀ g : ℕ,0<g →
        (Nat.card (openRationalSimplexLatticePoints A ell g):ℚ)=
          (Q ⟨g%p,Nat.mod_lt _ hp⟩).eval (g:ℚ) := by
  obtain ⟨v,hv⟩ := unit_height_from_integral_affine_point A ell h z u hu hz
  obtain ⟨p,hp,C,Q,hD,hC,hEval⟩ := integerRayHeightSlice_has_uniform_top_quasipolynomial A ell h hA v hv
  refine ⟨p,hp,C,Q,hD,hC,fun g hg => ?_⟩
  rw [← Nat.card_congr (openRationalSimplexLatticeEquiv A ell g h hg hA)]
  exact hEval g hg

end CyrusianKaplan
