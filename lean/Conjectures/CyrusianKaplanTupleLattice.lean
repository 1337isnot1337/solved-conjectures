module
public import Conjectures.CyrusianKaplanTupleArrangement
public import Conjectures.CyrusianKaplanDilation

@[expose] public section
namespace CyrusianKaplan

open Finset Set

private theorem indexedFinset_cast {r : ℕ} (a : Fin r → ℕ) :
    indexedFinset (fun i => (a i : ℝ)) = (indexedFinset a).map natRealEmbedding := by
  ext x
  constructor
  · intro hx
    obtain ⟨i,rfl⟩ := (mem_indexedFinset_iff _ _).mp hx
    exact Finset.mem_map.mpr ⟨a i,(mem_indexedFinset_iff _ _).mpr ⟨i,rfl⟩,rfl⟩
  · intro hx
    obtain ⟨n,hn,rfl⟩ := Finset.mem_map.mp hx
    obtain ⟨i,rfl⟩ := (mem_indexedFinset_iff _ _).mp hn
    exact (mem_indexedFinset_iff _ _).mpr ⟨i,rfl⟩

def natTupleCast (r : ℕ) (z : (Fin r → ℕ) × (Fin r → ℕ)) : TupleSpace r :=
  (fun i => z.1 i,fun i => z.2 i)

/-- Integer lattice points inside the positivity box are exactly
lifts of natural coordinate vectors. Using natural coordinates
does not alter the lattice-point count in this region. -/
def tupleLatticePoints (g r : ℕ) :=
  {z : TupleSpace r // z ∈ admissibleTupleRegion r (g:ℝ) ∧ z ∈ Set.range (natTupleCast r)}

theorem tupleCast_mem_iff (g r : ℕ) (a b : Fin r → ℕ) :
    natTupleCast r (a,b) ∈ admissibleTupleRegion r (g:ℝ) ↔
      StrictMono a ∧ StrictMono b ∧ (indexedFinset a,indexedFinset b) ∈ admissibleEncodingPairs g r := by
  unfold admissibleTupleRegion
  change (StrictMono (fun i => (a i:ℝ)) ∧ StrictMono (fun i => (b i:ℝ)) ∧
    RealAdmissibleEncoding (g:ℝ) r (indexedFinset (fun i => (a i:ℝ)))
      (indexedFinset (fun i => (b i:ℝ)))) ↔ _
  rw [indexedFinset_cast,indexedFinset_cast,← mem_admissibleEncodingPairs_real_iff]
  simp only [StrictMono,Nat.cast_lt]

noncomputable def fromEncodingPair (g r : ℕ) (p : ↥(admissibleEncodingPairs g r)) :
    tupleLatticePoints g r := by
  obtain ⟨hA,hB,_⟩ := (mem_admissibleEncodingPairs_iff g r p.val.1 p.val.2).mp p.property
  let a := (sortedCoordinateEquiv r ℕ).symm ⟨p.val.1,hA.2⟩
  let b := (sortedCoordinateEquiv r ℕ).symm ⟨p.val.2,hB.2⟩
  have ea : indexedFinset a.val = p.val.1 :=
    congrArg Subtype.val ((sortedCoordinateEquiv r ℕ).apply_symm_apply ⟨p.val.1,hA.2⟩)
  have eb : indexedFinset b.val = p.val.2 :=
    congrArg Subtype.val ((sortedCoordinateEquiv r ℕ).apply_symm_apply ⟨p.val.2,hB.2⟩)
  refine ⟨natTupleCast r (a.val,b.val),(tupleCast_mem_iff g r _ _).mpr
    ⟨a.property,b.property,?_⟩,Set.mem_range_self _⟩
  rw [ea,eb]
  exact p.property

private noncomputable def toEncodingPair (g r : ℕ) (z : tupleLatticePoints g r) :
    ↥(admissibleEncodingPairs g r) := by
  let a := z.property.2.choose.1
  let b := z.property.2.choose.2
  have hz : natTupleCast r (a,b)=z.val := z.property.2.choose_spec
  have hm : natTupleCast r (a,b) ∈ admissibleTupleRegion r (g:ℝ) := hz ▸ z.property.1
  exact ⟨(indexedFinset a,indexedFinset b),((tupleCast_mem_iff g r a b).mp hm).2.2⟩

/-- Actual count-preserving equivalence to the fixed-dimensional
coordinate lattice, before applying any polytope counting theorem. -/
noncomputable def ordinarizationTupleLatticeEquiv (g r : ℕ) :
    ↥(admissibleEncodingPairs g r) ≃ tupleLatticePoints g r := by
  apply Equiv.ofBijective (fromEncodingPair g r)
  constructor
  · intro p q hpq
    have hc := congrArg Subtype.val hpq
    have hP := (mem_admissibleEncodingPairs_iff g r p.val.1 p.val.2).mp p.property
    have hQ := (mem_admissibleEncodingPairs_iff g r q.val.1 q.val.2).mp q.property
    let E := sortedCoordinateEquiv r ℕ
    let ap := E.symm ⟨p.val.1,hP.1.2⟩
    let bp := E.symm ⟨p.val.2,hP.2.1.2⟩
    let aq := E.symm ⟨q.val.1,hQ.1.2⟩
    let bq := E.symm ⟨q.val.2,hQ.2.1.2⟩
    change natTupleCast r (ap.val,bp.val) = natTupleCast r (aq.val,bq.val) at hc
    have ha : ap=aq := Subtype.ext (funext fun i =>
      Nat.cast_injective (congrFun (congrArg Prod.fst hc) i))
    have hb : bp=bq := Subtype.ext (funext fun i =>
      Nat.cast_injective (congrFun (congrArg Prod.snd hc) i))
    apply Subtype.ext
    apply Prod.ext
    · exact congrArg Subtype.val (E.symm.injective ha)
    · exact congrArg Subtype.val (E.symm.injective hb)
  · intro z
    let a := z.property.2.choose.1
    let b := z.property.2.choose.2
    have hz : natTupleCast r (a,b)=z.val := z.property.2.choose_spec
    have hm : natTupleCast r (a,b) ∈ admissibleTupleRegion r (g:ℝ) := hz ▸ z.property.1
    obtain ⟨ha,hb,hp⟩ := (tupleCast_mem_iff g r a b).mp hm
    let p : ↥(admissibleEncodingPairs g r) := ⟨(indexedFinset a,indexedFinset b),hp⟩
    refine ⟨p,Subtype.ext ?_⟩
    let E := sortedCoordinateEquiv r ℕ
    have ea := E.symm_apply_apply ⟨a,ha⟩
    have eb := E.symm_apply_apply ⟨b,hb⟩
    have h := (mem_admissibleEncodingPairs_iff g r p.val.1 p.val.2).mp p.property
    change natTupleCast r ((E.symm ⟨p.val.1,h.1.2⟩).val,
      (E.symm ⟨p.val.2,h.2.1.2⟩).val) = z.val
    change E.symm (⟨indexedFinset a,card_indexedFinset a ha⟩ : {A : Finset ℕ // A.card=r}) =
      ⟨a,ha⟩ at ea
    change E.symm (⟨indexedFinset b,card_indexedFinset b hb⟩ : {B : Finset ℕ // B.card=r}) =
      ⟨b,hb⟩ at eb
    change natTupleCast r ((E.symm ⟨indexedFinset a,card_indexedFinset a ha⟩).val,
      (E.symm ⟨indexedFinset b,card_indexedFinset b hb⟩).val) = z.val
    rw [ea,eb]
    exact hz

theorem exact_ordinarization_count_lattice (g r : ℕ) :
    Nat.card (ExactOrdinarizationClass g r)=Nat.card (tupleLatticePoints g r) :=
  Nat.card_congr ((exact_ordinarization_encoding_equiv g r).trans
    (ordinarizationTupleLatticeEquiv g r))

end CyrusianKaplan
