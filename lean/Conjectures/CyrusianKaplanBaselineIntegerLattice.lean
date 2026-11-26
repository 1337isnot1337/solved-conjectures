module
public import Conjectures.CyrusianKaplanBaselineTuplePairs
public import Conjectures.CyrusianKaplanTupleFlatten

@[expose] public section
namespace CyrusianKaplan
open Set

def BaselineIntegerPoints (g r : ℕ) :=
  {z : (Fin r→ℤ) × (Fin r→ℤ) // integerTupleCast r z∈baselineTupleRegion r (g:ℝ)}

def natBaselinePoint (g r : ℕ) :=
  {z : (Fin r→ℕ) × (Fin r→ℕ) // natTupleCast r z∈baselineTupleRegion r (g:ℝ)}

def liftNatPair {r : ℕ} (z : (Fin r→ℕ) × (Fin r→ℕ)) : (Fin r→ℤ) × (Fin r→ℤ) :=
  (fun i => z.1 i,fun i => z.2 i)

theorem integerTupleCast_liftNatPair {r : ℕ} (z : (Fin r→ℕ) × (Fin r→ℕ)) :
    integerTupleCast r (liftNatPair z)=natTupleCast r z := by
  apply Prod.ext <;> funext i
  · exact Int.cast_natCast (z.1 i)
  · exact Int.cast_natCast (z.2 i)

def baselineNatIntEquiv (g r : ℕ) : natBaselinePoint g r ≃ BaselineIntegerPoints g r where
  toFun z := ⟨liftNatPair z.val,(integerTupleCast_liftNatPair z.val).symm ▸ z.property⟩
  invFun z := by
    let u : (Fin r→ℕ) × (Fin r→ℕ) := (fun i => (z.val.1 i).toNat,fun i => (z.val.2 i).toNat)
    have h0 (i : Fin r) : 0≤z.val.1 i := by
      have h : (0:ℝ)≤(z.val.1 i:ℝ) := (Nat.cast_nonneg g).trans (z.property.2.2.1 i).1.le
      exact_mod_cast h
    have h1 (i : Fin r) : 0≤z.val.2 i := by
      have h : (0:ℝ)≤(z.val.2 i:ℝ) := (z.property.2.2.2.1 i).1.le
      exact_mod_cast h
    have h : liftNatPair u=z.val := by
      apply Prod.ext <;> funext i
      · exact Int.toNat_of_nonneg (h0 i)
      · exact Int.toNat_of_nonneg (h1 i)
    refine ⟨u,?_⟩
    rw [← integerTupleCast_liftNatPair,h]
    exact z.property
  left_inv z := by
    apply Subtype.ext
    apply Prod.ext <;> funext i
    · exact Int.toNat_natCast (z.val.1 i)
    · exact Int.toNat_natCast (z.val.2 i)
  right_inv z := by
    apply Subtype.ext
    apply Prod.ext <;> funext i
    · have h : (0:ℝ)≤(z.val.1 i:ℝ) := (Nat.cast_nonneg g).trans (z.property.2.2.1 i).1.le
      exact Int.toNat_of_nonneg (by exact_mod_cast h)
    · have h : (0:ℝ)≤(z.val.2 i:ℝ) := (z.property.2.2.2.1 i).1.le
      exact Int.toNat_of_nonneg (by exact_mod_cast h)

noncomputable def baselineNatPairsEquiv (g r : ℕ) (hr : 1≤r) :
    natBaselinePoint g r ≃ ↥(baselinePairs g r) := by
  let f (p : natBaselinePoint g r) : ↥(baselinePairs g r) :=
    ⟨(indexedFinset p.val.1,indexedFinset p.val.2),
      ((natTupleCast_mem_baseline_iff hr _ _).mp p.property).2.2⟩
  apply Equiv.ofBijective f
  constructor
  · intro a b h
    obtain ⟨ha,ha',_⟩ := (natTupleCast_mem_baseline_iff hr _ _).mp a.property
    obtain ⟨hb,hb',_⟩ := (natTupleCast_mem_baseline_iff hr _ _).mp b.property
    have he := congrArg Subtype.val h
    apply Subtype.ext
    apply Prod.ext
    · exact congrArg Subtype.val ((sortedCoordinateEquiv r ℕ).injective
        (Subtype.ext (congrArg Prod.fst he) :
          sortedCoordinateEquiv r ℕ ⟨a.val.1,ha⟩=sortedCoordinateEquiv r ℕ ⟨b.val.1,hb⟩))
    · exact congrArg Subtype.val ((sortedCoordinateEquiv r ℕ).injective
        (Subtype.ext (congrArg Prod.snd he) :
          sortedCoordinateEquiv r ℕ ⟨a.val.2,ha'⟩=sortedCoordinateEquiv r ℕ ⟨b.val.2,hb'⟩))
  · intro p
    obtain ⟨hA,hB,_,_⟩ := (baselinePairs_mem_iff hr _ _).mp p.property
    let a := (sortedCoordinateEquiv r ℕ).symm ⟨p.val.1,hA⟩
    let b := (sortedCoordinateEquiv r ℕ).symm ⟨p.val.2,hB⟩
    have ha : indexedFinset a.val = p.val.1 :=
      congrArg Subtype.val ((sortedCoordinateEquiv r ℕ).apply_symm_apply ⟨p.val.1,hA⟩)
    have hb : indexedFinset b.val = p.val.2 :=
      congrArg Subtype.val ((sortedCoordinateEquiv r ℕ).apply_symm_apply ⟨p.val.2,hB⟩)
    have h : (indexedFinset a.val,indexedFinset b.val)=p.val := Prod.ext ha hb
    exact ⟨⟨(a.val,b.val),(natTupleCast_mem_baseline_iff hr _ _).mpr
      ⟨a.property,b.property,h.symm ▸ p.property⟩⟩,Subtype.ext h⟩

/-- The closed-boundary baseline of the signed lattice correction
has exactly the Pascal-sum cardinality used in the written proof. -/
noncomputable def baselineIntegerPairsEquiv (g r : ℕ) (hr : 1≤r) :
    BaselineIntegerPoints g r ≃ ↥(baselinePairs g r) :=
  (baselineNatIntEquiv g r).symm.trans (baselineNatPairsEquiv g r hr)

theorem card_baselineIntegerPoints (g r : ℕ) (hr : 1≤r) :
    Nat.card (BaselineIntegerPoints g r) = (baselinePairs g r).card := by
  rw [Nat.card_congr (baselineIntegerPairsEquiv g r hr)]
  simp [Nat.card_eq_fintype_card]

end CyrusianKaplan
