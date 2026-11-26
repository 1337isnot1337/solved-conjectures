module
public import Conjectures.CyrusianKaplanTileLattice
public import Conjectures.CyrusianKaplanHyperplaneSimplex
public import Conjectures.CyrusianKaplanPrimitiveCorrection
public import Conjectures.CyrusianKaplanQuasiUniformSum
public import Conjectures.CyrusianKaplanAffineLatticeUnit

@[expose] public section
namespace CyrusianKaplan
open Polynomial

/-- The primitive-containing-plane case yields a fixed common top
coefficient for the actual integer lattice count of the tile. -/
theorem RationalSimplexTile.lattice_uniform_top_of_primitive_row {r : ℕ}
    (v : RationalSimplexTile r) (t : TupleAffineTest r) (ht : standardPrimitiveRow t)
    (hv : ∀ i,tupleAffineMap 1 t (v.vertices i)=0) :
    HasUniformTopGenusQuasipolynomial (fun g => (Nat.card (v.lattice g):ℚ)) (r+r-1) := by
  obtain ⟨x,hx⟩ := primitive_row_genus_one_nonzero_somewhere t ht
  obtain ⟨z,hz⟩ := primitive_row_integral_genus_one_point t ht
  have hD : Module.finrank ℝ (TupleSpace r)=r+r := by
    rw [(tupleFlattenLinear r).finrank_eq,Module.finrank_pi_fintype]
    simp
  obtain ⟨hSize,hAffine⟩ :=
    affineIndependent_hyperplane_size_and_weights v.independent (tupleAffineMap 1 t) 0 hx hv
  rw [hD] at hSize hAffine
  by_cases h : v.size=r+r
  · obtain ⟨w,hw,he⟩ := hAffine h (integerTupleCast r z) (by rwa [tupleAffineMap_apply])
    obtain ⟨κ,q,hq,e⟩ := v.lattice_coordinates
    have hInd : AffineIndependent ℝ (fun i j => (q i j:ℝ)) := by
      simp_rw [hq]
      exact (tupleFlattenLinear r).toAffineEquiv.affineIndependent_iff.mpr
        (v.independent.comp_embedding κ.toEmbedding)
    let w' (i : Fin (v.size-1+1)) := w (κ i)
    have hw' : (∑ i,w' i)=1 := (Equiv.sum_comp κ w).trans hw
    let z' : Fin (r+r+1)→ℤ := Fin.cases (1:ℤ) (tupleFlatten r ℤ z)
    let A := rationalVertexRayMatrix q
    have hA := rationalVertexRayMatrix_height_positive q
    have hX (j : Fin (r+r+1)) :
        (z' j:ℝ)=∑ i,((A j i:ℝ)/(A 0 i:ℝ))*w' i := by
      refine Fin.cases ?_ (fun j => ?_) j
      · have hNZ (i : Fin (v.size-1+1)) : (A 0 i:ℝ)≠0 := by
          exact_mod_cast (hA i).ne'
        change ((1:ℤ):ℝ) = ∑ i,((A 0 i:ℝ)/(A 0 i:ℝ))*w' i
        simp_rw [Int.cast_one,div_self (hNZ _),one_mul,hw']
      · change ((tupleFlatten r ℤ z j:ℤ):ℝ) = ∑ i,((A j.succ i:ℝ)/(A 0 i:ℝ))*w' i
        simp only [A,rationalVertexRayMatrix_ratio,hq]
        rw [← tupleFlatten_cast_int,he,← Equiv.sum_comp κ (fun i => w i • v.vertices i),
          map_sum,Finset.sum_apply]
        simp only [map_smul,Pi.smul_apply,smul_eq_mul,w',mul_comm]
    obtain ⟨p,hp,C,P,hP,hC,hEq⟩ :=
      openRationalSimplex_lattice_quasipolynomial_uniform_top A 0 hA
        (rationalVertexRayMatrix_injective q hInd) z' w' hw' hX
    refine ⟨p,hp,C,P,fun j => (hP j).trans_eq (congrArg (fun k : ℕ => k-1) h),?_,?_⟩
    · intro j
      simpa only [h] using hC j
    · intro g hg
      obtain ⟨eg⟩ := e g
      change (Nat.card (v.lattice g):ℚ) = _
      rw [Nat.card_congr (eg.trans (rationalBarycentricLatticeEquiv q g))]
      exact hEq g hg
  · have hp := v.positive
    exact uniform_top_of_lower_degree v.lattice_quasipolynomial_dimension (by omega)

end CyrusianKaplan
