module
public import Conjectures.CyrusianKaplanIntegerRayQuasipolynomial
public import Conjectures.CyrusianKaplanRationalSimplexChart

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

/-- Integral ambient points at height g in the g-dilate of the
positive barycentric simplex. Rats enter as the exact ratios
of a genuinely integral numerator and the selected height. -/
def openRationalSimplexLatticePoints {m d : ℕ}
    (A : Fin m → Fin d → ℤ) (ell : Fin m) (g : ℕ) :=
  {z : Fin m → ℤ // z ell=(g:ℤ) ∧ ∃ u : Fin d → ℝ,
    (∀ i,0<u i) ∧ (∑ i,u i)=1 ∧
    ∀ j,(z j:ℝ)=(g:ℝ)*(∑ i,((A j i:ℝ)/(A ell i:ℝ))*u i)}

noncomputable def simplexLatticePointOfRaySlice {m d : ℕ}
    (A : Fin m → Fin d → ℤ) (ell : Fin m) (g : ℕ)
    (h : ∀ i,0<A ell i) (hg : 0<g)
    (x : integerRayHeightSlice A ell g) :
    openRationalSimplexLatticePoints A ell g := by
  let z := x.val.property.1.choose
  have hz (j : Fin m) : (z j:ℝ)=∑ i,(A j i:ℝ)*x.val.val i :=
    congrFun x.val.property.1.choose_spec j
  have hHeight : (∑ i,(A ell i:ℝ)*x.val.val i)=(g:ℝ) := x.property
  have hzH : z ell=(g:ℤ) := by exact_mod_cast (hz ell).trans hHeight
  refine ⟨z,hzH,?_⟩
  exact (positive_ray_coefficients_iff_barycentric
    (fun j i => (A j i:ℝ)) (fun i => (A ell i:ℝ)) (g:ℝ)
    (fun i => by exact_mod_cast h i) (by exact_mod_cast hg) (fun j => (z j:ℝ))).mp
      ⟨x.val.val,x.val.property.2,hHeight,hz⟩

/-- The lattice count of the barycentric simplex is the height
slice of the same injective integral ray cone, with both
directions verified on the actual ambient integer coordinates. -/
noncomputable def openRationalSimplexLatticeEquiv {m d : ℕ}
    (A : Fin m → Fin d → ℤ) (ell : Fin m) (g : ℕ)
    (h : ∀ i,0<A ell i) (hg : 0<g)
    (hA : Function.Injective (coneRayCoordinateHom m d (fun j i => (A j i:ℝ)))) :
    integerRayHeightSlice A ell g ≃ openRationalSimplexLatticePoints A ell g := by
  apply Equiv.ofBijective (simplexLatticePointOfRaySlice A ell g h hg)
  constructor
  · intro x y hxy
    have hInt : x.val.property.1.choose=y.val.property.1.choose := congrArg Subtype.val hxy
    apply Subtype.ext
    apply Subtype.ext
    apply hA
    rw [← x.val.property.1.choose_spec,← y.val.property.1.choose_spec,hInt]
  · intro z
    obtain ⟨x,hX,hHeight,hz⟩ := (positive_ray_coefficients_iff_barycentric
      (fun j i => (A j i:ℝ)) (fun i => (A ell i:ℝ)) (g:ℝ)
      (fun i => by exact_mod_cast h i) (by exact_mod_cast hg)
        (fun j => (z.val j:ℝ))).mpr z.property.2
    have hL : x ∈ rayCoordinateLattice m d (fun j i => (A j i:ℝ)) :=
      ⟨z.val,funext hz⟩
    let X : integerRayHeightSlice A ell g := ⟨⟨x,hL,hX⟩,hHeight⟩
    refine ⟨X,Subtype.ext ?_⟩
    funext j
    have h := congrFun X.val.property.1.choose_spec j
    change (X.val.property.1.choose j:ℝ)=∑ i,(A j i:ℝ)*x i at h
    exact_mod_cast h.trans (hz j).symm

/-- Direct open-simplex Ehrhart count in a rational ray chart,
on all positive integral dilations and of degree at most k.
The missing bridge for the repository result is an exact
triangulation of its actual compact weak-sign regions. -/
theorem openRationalSimplex_lattice_quasipolynomial {m k : ℕ}
    (A : Fin m → Fin (k+1) → ℤ) (ell : Fin m)
    (h : ∀ i,0<A ell i)
    (hA : Function.Injective (coneRayCoordinateHom m (k+1) (fun j i => (A j i:ℝ)))) :
    HasPositiveGenusQuasipolynomial (fun g => (Nat.card (openRationalSimplexLatticePoints A ell g):ℚ)) k := by
  obtain ⟨p,hp,W,hDeg,hEval⟩ := integerRayHeightSlice_has_quasipolynomial A ell h hA
  refine ⟨p,hp,W,hDeg,fun g hg => ?_⟩
  change (Nat.card (openRationalSimplexLatticePoints A ell g):ℚ)=
    (W ⟨g%p,Nat.mod_lt _ hp⟩).eval (g:ℚ)
  rw [← Nat.card_congr (openRationalSimplexLatticeEquiv A ell g h hg hA)]
  exact hEval g hg

end CyrusianKaplan
