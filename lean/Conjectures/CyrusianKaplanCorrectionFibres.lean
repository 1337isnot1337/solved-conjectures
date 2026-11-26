module
public import Conjectures.CyrusianKaplanIntegerCorrection
public import Conjectures.CyrusianKaplanBaselineSigns
public import Conjectures.CyrusianKaplanTileUniformTop

@[expose] public section
namespace CyrusianKaplan
open Set

def realCorrectionRegion (r : ℕ) (g : ℝ) (positive : Bool) : Set (TupleSpace r) :=
  if positive then admissibleTupleRegion r g \ baselineTupleRegion r g
  else baselineTupleRegion r g \ admissibleTupleRegion r g

theorem mem_integerCorrectionRegion_iff {g r : ℕ} {positive : Bool}
    (z : IntegerTupleSpace r) :
    z∈integerCorrectionRegion g r positive ↔
      integerTupleCast r z∈realCorrectionRegion r (g:ℝ) positive := by
  cases positive <;> rfl

theorem realCorrectionRegion_sign_invariant {r : ℕ} (g : ℝ) (positive : Bool)
    {x y : TupleSpace r}
    (h : affineSignCode (tupleAffineForm g) x = affineSignCode (tupleAffineForm g) y) :
    x∈realCorrectionRegion r g positive ↔ y∈realCorrectionRegion r g positive := by
  cases positive <;> simp [realCorrectionRegion,admissibleTupleRegion_sign_invariant g h,
    baselineTupleRegion_sign_invariant g h]

theorem realCorrectionRegion_scale_iff {r : ℕ} {c : ℝ} (hc : 0<c)
    (g : ℝ) (x : TupleSpace r) (positive : Bool) :
    c • x∈realCorrectionRegion r (c*g) positive ↔ x∈realCorrectionRegion r g positive := by
  cases positive <;> simp [realCorrectionRegion,admissibleTupleRegion_scale_iff hc,
    baselineTupleRegion_scale_iff hc]

abbrev NormalizedCorrectionSigns (r : ℕ) (positive : Bool) :=
  {s : TupleAffineTest r→Ordering // ∃ x∈realCorrectionRegion r 1 positive,
    affineSignCode (tupleAffineForm 1) x=s}

noncomputable instance normalizedCorrectionSigns_fintype (r : ℕ) (positive : Bool) :
    Fintype (NormalizedCorrectionSigns r positive) := Fintype.ofFinite _

abbrev IntegerSignLattice (g r : ℕ) (s : TupleAffineTest r→Ordering) :=
  {z : IntegerTupleSpace r // affineSignCode (tupleAffineForm (g:ℝ)) (integerTupleCast r z)=s}

private theorem integer_sign_lattice_mem_correction {r g : ℕ} {positive : Bool}
    (hg : 0<g) (s : NormalizedCorrectionSigns r positive) (z : IntegerSignLattice g r s.val) :
    z.val∈integerCorrectionRegion g r positive := by
  apply (mem_integerCorrectionRegion_iff _).mpr
  obtain ⟨x,hx,hs⟩ := s.property
  have hp : (0:ℝ)<(g:ℝ) := by exact_mod_cast hg
  have hc : affineSignCode (tupleAffineForm (g:ℝ)) ((g:ℝ) • x) = s.val := by
    have he := tuple_sign_code_scale (1:ℝ) hp x
    rwa [mul_one,hs] at he
  apply (realCorrectionRegion_sign_invariant (g:ℝ) positive (hc.trans z.property.symm)).mp
  have he := (realCorrectionRegion_scale_iff hp (1:ℝ) x positive).mpr hx
  rwa [mul_one] at he

private theorem integer_correction_to_normalized_sign {r g : ℕ} {positive : Bool}
    (hg : 0<g) (z : IntegerCorrectionPoints g r positive) :
    ∃ x∈realCorrectionRegion r 1 positive,
      affineSignCode (tupleAffineForm 1) x =
        affineSignCode (tupleAffineForm (g:ℝ)) (integerTupleCast r z.val) := by
  have hp : (0:ℝ)<(g:ℝ) := by exact_mod_cast hg
  let x := (g:ℝ)⁻¹ • integerTupleCast r z.val
  have hx : (g:ℝ) • x=integerTupleCast r z.val := by
    simp [x,smul_smul,mul_inv_cancel₀ hp.ne']
  refine ⟨x,?_,?_⟩
  · apply (realCorrectionRegion_scale_iff hp (1:ℝ) x positive).mp
    rw [mul_one,hx]
    exact (mem_integerCorrectionRegion_iff _).mp z.property
  · have h := tuple_sign_code_scale (1:ℝ) hp x
    rw [mul_one,hx] at h
    exact h.symm

private noncomputable def correctionSignEquiv (r g : ℕ) (positive : Bool) (hg : 0<g) :
    IntegerCorrectionPoints g r positive ≃
      Σ s : NormalizedCorrectionSigns r positive,IntegerSignLattice g r s.val where
  toFun z := ⟨⟨_,integer_correction_to_normalized_sign hg z⟩,z.val,rfl⟩
  invFun z := ⟨z.2.val,integer_sign_lattice_mem_correction hg z.1 z.2⟩
  left_inv _ := rfl
  right_inv := by
    rintro ⟨⟨s,hs⟩,z,hz⟩
    change affineSignCode (tupleAffineForm (g:ℝ)) (integerTupleCast r z)=s at hz
    subst s
    rfl

theorem integerCorrectionPoints_finite (g r : ℕ) (positive : Bool) (hr : 1≤r) :
    Finite (IntegerCorrectionPoints g r positive) := by
  cases positive
  · let f : IntegerCorrectionPoints g r false → BaselineIntegerPoints g r :=
      fun z => ⟨z.val,z.property.1⟩
    exact @Finite.of_injective _ _ (Finite.of_equiv _ (baselineIntegerPairsEquiv g r hr).symm) f
      (fun _ _ e => Subtype.ext (congrArg (fun q : BaselineIntegerPoints g r => q.val) e))
  · let f : IntegerCorrectionPoints g r true → TrueIntegerPoints g r :=
      fun z => ⟨z.val,z.property.1⟩
    exact Finite.of_injective f
      (fun _ _ e => Subtype.ext (congrArg (fun q : TrueIntegerPoints g r => q.val) e))

theorem integerSignLattice_finite {g r : ℕ} {positive : Bool}
    (hg : 0<g) (hr : 1≤r) (s : NormalizedCorrectionSigns r positive) :
    Finite (IntegerSignLattice g r s.val) := by
  let f : IntegerSignLattice g r s.val → IntegerCorrectionPoints g r positive :=
    fun z => ⟨z.val,integer_sign_lattice_mem_correction hg s z⟩
  exact @Finite.of_injective _ _ (integerCorrectionPoints_finite g r positive hr) f
    (fun _ _ e => Subtype.ext (congrArg (fun q : IntegerCorrectionPoints g r positive => q.val) e))

theorem card_integerCorrection_sum_sign_lattices (g r : ℕ) (positive : Bool)
    (hg : 0<g) (hr : 1≤r) :
    Nat.card (IntegerCorrectionPoints g r positive) =
      ∑ s : NormalizedCorrectionSigns r positive,Nat.card (IntegerSignLattice g r s.val) := by
  classical
  let := integerCorrectionPoints_finite g r positive hr
  let (s : NormalizedCorrectionSigns r positive) : Fintype (IntegerSignLattice g r s.val) :=
    @Fintype.ofFinite _ (integerSignLattice_finite hg hr s)
  rw [Nat.card_congr (correctionSignEquiv r g positive hg)]
  simp only [Nat.card_eq_fintype_card,Fintype.card_sigma]

/-- Each active one-sided correction fibre at genus one is
compact in closure and lies in one primitive arrangement plane. -/
theorem correction_signFibre_compact_primitive {r : ℕ} {positive : Bool}
    (s : NormalizedCorrectionSigns r positive) :
    IsCompact (weakTupleSignPolyhedron 1 s.val) ∧
    (affineSignFibre (tupleAffineForm 1) s.val).Nonempty ∧
    ∃ t : TupleAffineTest r, standardPrimitiveRow t ∧ s.val t=.eq := by
  obtain ⟨x,hx,hs⟩ := s.property
  have hp : x∈admissibleTupleRegion r 1 ∧ x∉baselineTupleRegion r 1 ∨
      x∈baselineTupleRegion r 1 ∧ x∉admissibleTupleRegion r 1 := by
    cases positive
    · exact Or.inr hx
    · exact Or.inl hx
  obtain ⟨t,ht,hRow⟩ := primitive_row_of_correctionPoint zero_lt_one hp
  refine ⟨?_,⟨x,hs⟩,t,ht,?_⟩
  · rcases hp with h|h
    · exact isCompact_admissibleWeakSignRegion 1 s.val x h.1 hs
    · exact isCompact_baselineWeakSignRegion 1 s.val x h.1 hs
  · exact (congrFun hs t).symm.trans ((affineTestSign_eq_eq _).mpr hRow)

end CyrusianKaplan
