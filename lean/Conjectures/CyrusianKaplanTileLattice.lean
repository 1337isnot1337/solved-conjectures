module
public import Conjectures.CyrusianKaplanActualTriangulation
public import Conjectures.CyrusianKaplanTupleFlatten
public import Conjectures.CyrusianKaplanRationalSimplexGeneral

@[expose] public section
namespace CyrusianKaplan
open Set

/-- The exact lattice points in a positive dilate of an open tile. -/
def RationalSimplexTile.lattice {r : ℕ} (v : RationalSimplexTile r) (g : ℕ) :=
  {z : (Fin r→ℤ) × (Fin r→ℤ) //
    integerTupleCast r z ∈ (fun x : TupleSpace r => (g:ℝ) • x) '' v.carrier}

theorem RationalSimplexTile.lattice_coordinates {r : ℕ} (v : RationalSimplexTile r) :
    ∃ (κ : Fin (v.size-1+1) ≃ Fin v.size) (q : Fin (v.size-1+1) → Fin (r+r) → ℚ),
      (∀ i j,(q i j:ℝ)=tupleFlattenLinear r (v.vertices (κ i)) j) ∧
      ∀ g : ℕ, Nonempty (v.lattice g ≃ rationalBarycentricLatticePoints q g) := by
  classical
  have hpos := v.positive
  have hN : v.size-1+1 = v.size := by omega
  let κ : Fin (v.size-1+1) ≃ Fin v.size := Fin.castOrderIso hN |>.toEquiv
  let v' (i : Fin (v.size-1+1)) := v.vertices (κ i)
  choose a b hab using v.rational
  let q : Fin (v.size-1+1) → Fin (r+r) → ℚ :=
    fun i => tupleFlatten r ℚ (a (κ i),b (κ i))
  have hq (i : Fin (v.size-1+1)) (j : Fin (r+r)) :
      (q i j:ℝ)=tupleFlattenLinear r (v' i) j := by
    unfold q v'
    rw [← tupleFlatten_cast_rat, hab]
  have e (g : ℕ) : v.lattice g ≃ rationalBarycentricLatticePoints q g := by
    apply Equiv.subtypeEquiv (tupleFlatten r ℤ)
    intro z
    have hSum (u : Fin v.size→ℝ) :
        (∑ i : Fin (v.size-1+1),u (κ i)) = ∑ i,u i :=
      Equiv.sum_comp κ u
    have hVec (u : Fin v.size→ℝ) :
        (∑ i : Fin (v.size-1+1),u (κ i) • v' i) = ∑ i,u i • v.vertices i :=
      Equiv.sum_comp κ (fun i => u i • v.vertices i)
    have hCast (u : Fin (v.size-1+1)→ℝ) :
        ((g:ℝ) • (∑ i,u i • v' i) = integerTupleCast r z) ↔
          ∀ j,((tupleFlatten r ℤ z j:ℤ):ℝ)=(g:ℝ)*(∑ i,(q i j:ℝ)*u i) := by
      rw [← (tupleFlattenLinear r).injective.eq_iff]
      rw [map_smul,map_sum]
      constructor
      · intro h j
        have hh := congrFun h j
        simp only [Pi.smul_apply,Finset.sum_apply,map_smul,smul_eq_mul,
          tupleFlatten_cast_int,← hq] at hh
        simpa only [mul_comm (u _)] using hh.symm
      · intro h
        funext j
        have hh := (h j).symm
        simp only [Pi.smul_apply,Finset.sum_apply,map_smul,smul_eq_mul,
          tupleFlatten_cast_int,← hq]
        simpa only [mul_comm (u _)] using hh
    constructor
    · rintro ⟨x,⟨u,hu,hs,hV⟩,hz⟩
      refine ⟨fun i => u (κ i),fun i=>hu (κ i),(hSum u).trans hs,?_⟩
      apply (hCast _).mp
      rw [hVec u,hV]
      exact hz
    · rintro ⟨u,hu,hs,hZ⟩
      let w := u ∘ κ.symm
      have hUW : (fun i => w (κ i)) = u := funext fun i => by simp [w]
      have hW : ∑ i,w i=1 := by
        rw [← hSum w,hUW,hs]
      let x := ∑ i,w i • v.vertices i
      refine ⟨x,⟨w,fun i => hu (κ.symm i),hW,rfl⟩,?_⟩
      have hV := hVec w
      have hValue := (hCast u).mpr hZ
      change (g:ℝ) • (∑ i,w i • v.vertices i)=integerTupleCast r z
      rw [← hV]
      simpa [w] using hValue
  exact ⟨κ,q,hq,fun g => ⟨e g⟩⟩

theorem RationalSimplexTile.lattice_quasipolynomial_dimension {r : ℕ} (v : RationalSimplexTile r) :
    HasPositiveGenusQuasipolynomial (fun g => (Nat.card (v.lattice g):ℚ)) (v.size-1) := by
  obtain ⟨κ,q,hq,e⟩ := v.lattice_coordinates
  have hInd : AffineIndependent ℝ (fun i j => (q i j:ℝ)) := by
    simp_rw [hq]
    exact (tupleFlattenLinear r).toAffineEquiv.affineIndependent_iff.mpr
      (v.independent.comp_embedding κ.toEmbedding)
  have heq : (fun g => (Nat.card (v.lattice g):ℚ)) =
      fun g => (Nat.card (rationalBarycentricLatticePoints q g):ℚ) := by
    funext g
    obtain ⟨hg⟩ := e g
    exact_mod_cast Nat.card_congr hg
  rw [heq]
  exact rationalBarycentric_lattice_quasipolynomial q hInd

theorem RationalSimplexTile.lattice_quasipolynomial {r : ℕ} (v : RationalSimplexTile r) :
    HasPositiveGenusQuasipolynomial (fun g => (Nat.card (v.lattice g):ℚ)) (r+r) := by
  obtain ⟨p,hp,P,hP,hEval⟩ := v.lattice_quasipolynomial_dimension
  have hd := affineIndependent_tuple_fin_card_le v.independent
  exact ⟨p,hp,P,fun j => (hP j).trans (by omega),hEval⟩

end CyrusianKaplan
