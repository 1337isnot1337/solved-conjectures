module
public import Conjectures.CyrusianKaplanCorrectionFibres
public import Conjectures.CyrusianKaplanCommonTopTransfer
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan
open Set Polynomial

private noncomputable def correctionTileSumEquiv {r N g : ℕ}
    {s : TupleAffineTest r→Ordering} (hg : 0<g) (v : Fin N→RationalSimplexTile r)
    (hv : IsSignFibreTriangulation s v) :
    (Σ j : Fin N,(v j).lattice g) ≃ IntegerSignLattice g r s := by
  have hp : (0:ℝ)<(g:ℝ) := by exact_mod_cast hg
  let F (u : Σ j : Fin N,(v j).lattice g) : IntegerSignLattice g r s := ⟨u.2.val,by
    have h : integerTupleCast r u.2.val∈affineSignFibre (tupleAffineForm (g:ℝ)) s := by
      rw [tuple_sign_fibre_is_dilation hp]
      obtain ⟨x,hx,he⟩ := u.2.property
      exact ⟨x,(hv.2.1 x).mpr ⟨u.1,hx⟩,he⟩
    exact h⟩
  apply Equiv.ofBijective F
  constructor
  · rintro ⟨j,z⟩ ⟨k,w⟩ he
    have hzw : z.val=w.val := congrArg Subtype.val he
    obtain ⟨a,ha,ea⟩ := z.property
    obtain ⟨b,hb,eb⟩ := w.property
    have hS : (g:ℝ) • a=(g:ℝ) • b := ea.trans ((congrArg (integerTupleCast r) hzw).trans eb.symm)
    have hV := congrArg (fun u : TupleSpace r => (g:ℝ)⁻¹ • u) hS
    have hab : a=b := by simpa [smul_smul,inv_mul_cancel₀ hp.ne'] using hV
    have hjk : j=k := by
      by_contra hne
      exact Set.disjoint_left.mp (hv.2.2 hne) ha (hab.symm ▸ hb)
    subst k
    have e : z=w := Subtype.ext hzw
    cases e
    rfl
  · intro p
    have h : integerTupleCast r p.val∈affineSignFibre (tupleAffineForm (g:ℝ)) s := p.property
    rw [tuple_sign_fibre_is_dilation hp] at h
    obtain ⟨x,hx,he⟩ := h
    obtain ⟨j,hj⟩ := (hv.2.1 x).mp hx
    exact ⟨⟨j,⟨p.val,x,hj,he⟩⟩,rfl⟩

private theorem cardinality_signLattice_sum_tiles {r N g : ℕ} {s : TupleAffineTest r→Ordering}
    (hg : 0<g) (hF : Finite (IntegerSignLattice g r s)) (v : Fin N→RationalSimplexTile r)
    (hv : IsSignFibreTriangulation s v) :
    Nat.card (IntegerSignLattice g r s) = ∑ j,Nat.card ((v j).lattice g) := by
  classical
  let e := correctionTileSumEquiv hg v hv
  have hFinite : Finite (Σ j : Fin N,(v j).lattice g) := Finite.of_equiv _ e.symm
  let (j : Fin N) : Fintype ((v j).lattice g) := @Fintype.ofFinite _
    (Finite.of_injective (fun z => (⟨j,z⟩ : Σ k : Fin N,(v k).lattice g))
      (fun _ _ h => eq_of_heq (Sigma.mk.inj h).2))
  rw [← Nat.card_congr e]
  simp only [Nat.card_eq_fintype_card,Fintype.card_sigma]

/-- A normalized sign fibre supporting the signed correction has
a uniform top coefficient in degree at most 2r−1. This applies
to every positive genus and retains the literal integer count. -/
theorem correctionSignLattice_uniform_top {r : ℕ} (hr : 1≤r) {positive : Bool}
    (s : NormalizedCorrectionSigns r positive) :
    HasUniformTopGenusQuasipolynomial
      (fun g => (Nat.card (IntegerSignLattice g r s.val):ℚ)) (2*r-1) := by
  obtain ⟨hc,hn,t,ht,hrow⟩ := correction_signFibre_compact_primitive s
  obtain ⟨N,v,hv⟩ := compact_tupleSignFibre_triangulation s.val hc hn
  have hDense (j : Fin N) :
      HasUniformTopGenusQuasipolynomial (fun g => (Nat.card ((v j).lattice g):ℚ)) (2*r-1) := by
    rw [two_mul]
    apply (v j).lattice_uniform_top_of_primitive_row t ht
    intro i
    rw [tupleAffineMap_apply]
    have h := (mem_weak_sign_iff_specializes.mp (hv.1 j i)) t
    exact (affineTestSign_eq_eq _).mp (h.elim (fun hh => hh.trans hrow) id)
  have hSum := uniform_top_positive_genus_signed_sum (fun _ : Fin N => (1:ℚ)) _ _ hDense
  obtain ⟨p,hp,C,P,hD,hC,hEq⟩ := hSum
  refine ⟨p,hp,C,P,hD,hC,fun g hg => ?_⟩
  have hCard := cardinality_signLattice_sum_tiles hg (integerSignLattice_finite hg hr s) v hv
  change (Nat.card (IntegerSignLattice g r s.val):ℚ) = _
  simpa only [one_mul,← Nat.cast_sum,hCard] using hEq g hg

theorem one_sided_integerCorrection_uniform_top (r : ℕ) (hr : 1≤r) (positive : Bool) :
    HasUniformTopGenusQuasipolynomial
      (fun g => (Nat.card (IntegerCorrectionPoints g r positive):ℚ)) (2*r-1) := by
  classical
  have hFam (s : NormalizedCorrectionSigns r positive) := correctionSignLattice_uniform_top hr s
  have h := uniform_top_positive_genus_signed_sum (fun _ : NormalizedCorrectionSigns r positive => (1:ℚ))
    _ _ hFam
  obtain ⟨p,hp,C,P,hD,hC,hEq⟩ := h
  refine ⟨p,hp,C,P,hD,hC,fun g hg => ?_⟩
  have he := card_integerCorrection_sum_sign_lattices g r positive hg hr
  change (Nat.card (IntegerCorrectionPoints g r positive):ℚ)=_
  simpa only [one_mul,← Nat.cast_sum,he] using hEq g hg

/-- All residues of the signed correction share the coefficient
of degree 2r−1, with no extrapolation from sampled genera. -/
theorem exact_ordinarization_correction_uniform_top (r : ℕ) (hr : 1≤r) :
    HasUniformTopGenusQuasipolynomial
      (fun g => (Nat.card (ExactOrdinarizationClass g r):ℚ)-((baselinePairs g r).card:ℚ)) (2*r-1) := by
  let w : Bool→ℚ := fun s => if s then 1 else -1
  have he (s : Bool) := one_sided_integerCorrection_uniform_top r hr s
  obtain ⟨p,hp,C,P,hD,hC,hEq⟩ := uniform_top_positive_genus_signed_sum w _ _ he
  refine ⟨p,hp,C,P,hD,hC,fun g hg => ?_⟩
  change (Nat.card (ExactOrdinarizationClass g r):ℚ)-((baselinePairs g r).card:ℚ)=_
  rw [exact_signed_integerCorrection g r hr]
  simpa [w,Fintype.sum_bool,sub_eq_add_neg,add_comm] using hEq g hg

/-- For each fixed positive r, the actual numerical-semigroup
ordinarization count eventually increases strictly in the genus. -/
theorem exact_ordinarization_count_eventually_strictly_increasing (r : ℕ) (hr : 1≤r) :
    ∃ m : ℕ,∀ g : ℕ,m≤g →
      Nat.card (ExactOrdinarizationClass g r)<Nat.card (ExactOrdinarizationClass (g+1) r) := by
  obtain ⟨p,hp,C,P,hD,hC,hE⟩ := exact_ordinarization_correction_uniform_top r hr
  let Q (s : Fin p) := (P s).map (algebraMap ℚ ℝ)
  apply exact_ordinarization_eventually_increasing_of_common_correction_coeff
    r p 1 hr hp Q (C:ℝ)
  · intro s
    simpa only [Q,Polynomial.natDegree_map_eq_of_injective (algebraMap ℚ ℝ).injective] using hD s
  · intro s
    simp only [Q,Polynomial.coeff_map,hC,show (algebraMap ℚ ℝ) C=(C:ℝ) from rfl]
  · intro g hg
    let i : Fin p := ⟨g%p,Nat.mod_lt _ hp⟩
    have he := congrArg (algebraMap ℚ ℝ) (hE g (Nat.zero_lt_of_lt hg))
    change (algebraMap ℚ ℝ) ((Nat.card (ExactOrdinarizationClass g r):ℚ) -
      ((baselinePairs g r).card:ℚ)) = (algebraMap ℚ ℝ) ((P i).eval (g:ℚ)) at he
    rw [map_sub,map_natCast,map_natCast] at he
    have hEval := Polynomial.eval_map_apply (f:=algebraMap ℚ ℝ) (p:=P i) (g:ℚ)
    rw [map_natCast] at hEval
    exact he.trans hEval.symm

end CyrusianKaplan
