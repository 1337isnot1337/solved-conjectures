module
public import Conjectures.CyrusianKaplanTileLattice
public import Conjectures.CyrusianKaplanTupleScale
public import Conjectures.CyrusianKaplanExactDegreeReduction

@[expose] public section
namespace CyrusianKaplan
open Set Polynomial

private theorem tuplePositiveSMul_injective {r : ℕ} {c : ℝ} (hc : 0<c) :
    Function.Injective (fun x : TupleSpace r => c • x) := by
  intro x y h
  have e : c⁻¹ • (c • x) = c⁻¹ • (c • y) := congrArg (fun z : TupleSpace r => c⁻¹ • z) h
  simpa [smul_smul,inv_mul_cancel₀ hc.ne'] using e

private noncomputable def tileLatticeSumEquiv {r N g : ℕ}
    {s : TupleAffineTest r→Ordering}
    (hg : 0<g) (v : Fin N→RationalSimplexTile r) (hv : IsSignFibreTriangulation s v)
    (hA : ∃ x∈admissibleTupleRegion r 1,x∈affineSignFibre (tupleAffineForm 1) s) :
    (Σ j : Fin N,(v j).lattice g) ≃ tupleLatticeFibre g r s := by
  let x₀ := hA.choose
  have hx₀ := hA.choose_spec.1
  have hs₀ := hA.choose_spec.2
  have hp : (0:ℝ)<(g:ℝ) := by exact_mod_cast hg
  have hAd (x : TupleSpace r) (hx : x∈affineSignFibre (tupleAffineForm 1) s) :
      x∈admissibleTupleRegion r 1 :=
    (admissibleTupleRegion_sign_invariant 1 ((show _=s from hx).trans (show _=s from hs₀).symm)).mpr hx₀
  let F (u : Σ j : Fin N,(v j).lattice g) : tupleLatticeFibre g r s := by
    let x := u.2.property.choose
    have hx := u.2.property.choose_spec.1
    have he : (g:ℝ) • x = integerTupleCast r u.2.val := u.2.property.choose_spec.2
    have hS := (hv.2.1 x).mpr ⟨u.1,hx⟩
    have hA' : integerTupleCast r u.2.val∈admissibleTupleRegion r (g:ℝ) := by
      rw [← he]
      simpa only [mul_one] using (admissibleTupleRegion_scale_iff hp 1 x).mpr (hAd x hS)
    refine ⟨⟨_,hA',(integer_lattice_iff_natural_in_admissible_region hA').mp (mem_range_self _)⟩,?_⟩
    change affineSignCode (tupleAffineForm (g:ℝ)) (integerTupleCast r u.2.val)=s
    have h := tuple_sign_code_scale (1:ℝ) hp x
    rwa [mul_one,he,hS] at h
  apply Equiv.ofBijective F
  constructor
  · rintro ⟨j,z⟩ ⟨k,w⟩ e
    have hI : integerTupleCast r z.val = integerTupleCast r w.val :=
      congrArg (fun p : tupleLatticeFibre g r s => p.val.val) e
    obtain ⟨x,hx,hxe⟩ := z.property
    obtain ⟨y,hy,hye⟩ := w.property
    have he : x=y := tuplePositiveSMul_injective hp (hxe.trans (hI.trans hye.symm))
    have hjk : j=k := by
      by_contra hn
      exact Set.disjoint_left.mp (hv.2.2 hn) hx (he.symm ▸ hy)
    subst k
    have hz : z=w := Subtype.ext (integerTupleCast_injective r hI)
    cases hz
    rfl
  · intro p
    have hZ := (integer_lattice_iff_natural_in_admissible_region p.val.property.1).mpr p.val.property.2
    obtain ⟨z,hz⟩ := hZ
    have hpS : p.val.val∈affineSignFibre (tupleAffineForm (g:ℝ)) s := p.property
    rw [tuple_sign_fibre_is_dilation hp] at hpS
    obtain ⟨x,hx,he⟩ := hpS
    obtain ⟨j,hj⟩ := (hv.2.1 x).mp hx
    let q : (v j).lattice g := ⟨z,x,hj,he.trans hz.symm⟩
    exact ⟨⟨j,q⟩,Subtype.ext (Subtype.ext hz)⟩

private theorem card_tileLatticeSum {r N g : ℕ} {s : TupleAffineTest r→Ordering}
    (hg : 0<g) (v : Fin N→RationalSimplexTile r) (hv : IsSignFibreTriangulation s v)
    (hA : ∃ x∈admissibleTupleRegion r 1,x∈affineSignFibre (tupleAffineForm 1) s) :
    Nat.card (tupleLatticeFibre g r s) = ∑ j,Nat.card ((v j).lattice g) := by
  classical
  let e := tileLatticeSumEquiv hg v hv hA
  have : Finite (tupleLatticePoints g r) := Finite.of_equiv _ (ordinarizationTupleLatticeEquiv g r)
  have hF : Finite (tupleLatticeFibre g r s) := by unfold tupleLatticeFibre; infer_instance
  have hFinite : Finite (Σ j : Fin N,(v j).lattice g) := Finite.of_equiv _ e.symm
  let (j : Fin N) : Fintype ((v j).lattice g) := @Fintype.ofFinite _
    (Finite.of_injective (fun z => (⟨j,z⟩ : Σ k : Fin N,(v k).lattice g))
      (fun _ _ h => eq_of_heq (Sigma.mk.inj h).2))
  rw [← Nat.card_congr e]
  simp only [Nat.card_eq_fintype_card,Fintype.card_sigma]

/-- The actual sign fibre count (zero for inactive sign patterns)
is a genuine quasi-polynomial on every positive genus. -/
theorem literal_tuple_stratum_quasipolynomial (r : ℕ) (s : TupleAffineTest r→Ordering) :
    HasPositiveGenusQuasipolynomial
      (fun g => (Nat.card (tupleLatticeFibre g r s):ℚ)) (2*r) := by
  classical
  by_cases hA : ∃ x∈admissibleTupleRegion r 1,x∈affineSignFibre (tupleAffineForm 1) s
  · obtain ⟨x,hAd,hS⟩ := hA
    have hA : ∃ x∈admissibleTupleRegion r 1,x∈affineSignFibre (tupleAffineForm 1) s := ⟨x,hAd,hS⟩
    obtain ⟨N,v,hv⟩ := compact_tupleSignFibre_triangulation s
      (isCompact_admissibleWeakSignRegion 1 s x hAd hS) ⟨x,hS⟩
    have hh := positive_genus_quasipolynomial_sum
      (fun j : Fin N => fun g => (Nat.card ((v j).lattice g):ℚ)) (r+r)
      (fun j => (v j).lattice_quasipolynomial)
    rw [← two_mul] at hh
    obtain ⟨p,hp,P,hD,hE⟩ := hh
    refine ⟨p,hp,P,hD,fun g hg => ?_⟩
    change (Nat.card (tupleLatticeFibre g r s):ℚ)=_
    calc
      _ = ∑ j,(Nat.card ((v j).lattice g):ℚ) := by exact_mod_cast card_tileLatticeSum hg v hv hA
      _ = _ := hE g hg
  · refine ⟨1,Nat.one_pos,fun _ => 0,by simp,?_⟩
    intro g hg
    have hpos : (0:ℝ)<(g:ℝ) := by exact_mod_cast hg
    have hEmpty : IsEmpty (tupleLatticeFibre g r s) := ⟨fun p => hA (by
      have hS : p.val.val∈affineSignFibre (tupleAffineForm (g:ℝ)) s := p.property
      rw [tuple_sign_fibre_is_dilation hpos] at hS
      obtain ⟨x,hx,he⟩ := hS
      refine ⟨x,?_,hx⟩
      apply (admissibleTupleRegion_scale_iff hpos (1:ℝ) x).mp
      change (g:ℝ) • x=p.val.val at he
      rw [mul_one,he]
      exact p.val.property.1)⟩
    simp

/-- The actual ordinarization count is a single quasi-polynomial
with exact degree 2r in every residue class, for each r≥1. -/
theorem exact_ordinarization_quasipolynomial (r : ℕ) (hr : 1≤r) :
    ∃ p : ℕ, ∃ hp : 0<p, ∃ P : Fin p → ℚ[X],
      (∀ s, (P s).natDegree=2*r) ∧
      ∀ g : ℕ, 0<g →
        (Nat.card (ExactOrdinarizationClass g r):ℚ)=
          (P ⟨g%p,Nat.mod_lt _ hp⟩).eval (g:ℚ) := by
  exact ordinarization_exact_degree_of_quasipolynomial r hr
    (ordinarization_quasipolynomial_of_literal_strata r (literal_tuple_stratum_quasipolynomial r))

end CyrusianKaplan
