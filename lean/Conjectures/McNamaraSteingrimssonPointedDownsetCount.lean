module

public import Conjectures.McNamaraSteingrimssonLayerFirstMax
public import Conjectures.McNamaraSteingrimssonPointedDownset
public import Conjectures.McNamaraSteingrimssonRepeatedPatternShape

@[expose] public section
namespace McNamaraSteingrimsson

open Polynomial

theorem pointedPermutation_injective {n : ℕ} : Function.Injective (@pointedPermutation n) := by
  intro p q h
  apply Equiv.ext
  intro i
  have he := congrArg (fun x : Equiv.Perm (Fin (n+1)) => x i.succ) h
  simpa only [pointed_succ,Fin.castSucc_inj] using he

theorem classicalPattern_pointed_target_of_tail {m n : ℕ}
    {p : Equiv.Perm (Fin m)} {q : Equiv.Perm (Fin n)}
    (h : ClassicalPattern p q) : ClassicalPattern p (pointedPermutation q) := by
  obtain ⟨f,hf,ho⟩ := h
  refine ⟨fun i => (f i).succ,fun _ _ hij => Fin.succ_lt_succ_iff.mpr (hf hij),?_⟩
  intro i j
  simpa only [pointed_succ,Fin.castSucc_lt_castSucc_iff] using ho i j

/-- For patterns of length at least three, the middle pattern either
omits the leading maximum or retains it, and the two families of
literal permutations are disjoint. -/
noncomputable def literalPointedDownsetEquiv (v : List Bool) (m : ℕ) (hm : 2≤m) :
    (PatternDownsetAt (layerPermutation v) (m+1) ⊕ PatternDownsetAt (layerPermutation v) m) ≃
      PatternDownsetAt (pointedPermutation (layerPermutation v)) (m+1) := by
  let f : (PatternDownsetAt (layerPermutation v) (m+1) ⊕
      PatternDownsetAt (layerPermutation v) m) →
        PatternDownsetAt (pointedPermutation (layerPermutation v)) (m+1) :=
    fun x => match x with
    | Sum.inl p => ⟨p.val,classicalPattern_pointed_target_of_tail p.property⟩
    | Sum.inr p => ⟨pointedPermutation p.val,pointedPattern_lift p.property⟩
  have hdis (p : PatternDownsetAt (layerPermutation v) (m+1))
      (q : PatternDownsetAt (layerPermutation v) m) :
      p.val≠pointedPermutation q.val := by
    intro he
    have hp : BeginsWithMaximum p.val := he.symm ▸ pointed_beginsWithMaximum q.val
    have hle := layered_firstMaximum_pattern_size hp p.property
    omega
  refine Equiv.ofBijective f ⟨?_,?_⟩
  · rintro (p|p) (q|q) h
    · have hv := congrArg (fun z :
        PatternDownsetAt (pointedPermutation (layerPermutation v)) (m+1) => z.val) h
      exact congrArg Sum.inl (Subtype.ext hv)
    · exact (hdis p q (congrArg Subtype.val h)).elim
    · exact (hdis q p (congrArg Subtype.val h).symm).elim
    · exact congrArg Sum.inr (Subtype.ext (pointedPermutation_injective (congrArg Subtype.val h)))
  · intro x
    obtain ⟨g,hg,ho⟩ := x.property
    by_cases hz : g 0=0
    · have hm := firstMaximum_of_selection g ho hz
      let p := unpoint x.val hm
      have hep := pointed_unpoint x.val hm
      have hop : ∀ i j, pointedPermutation p i < pointedPermutation p j ↔
          pointedPermutation (layerPermutation v) (g i) < pointedPermutation (layerPermutation v) (g j) := by
        simpa only [p,hep] using ho
      exact ⟨Sum.inr ⟨p,pointedPattern_project g hg hop hz⟩,Subtype.ext hep⟩
    · have h := pointedPattern_omit g hg ho (fun i =>
        Fin.pos_iff_ne_zero.mp ((Fin.pos_iff_ne_zero.mpr hz).trans_le (hg.monotone (Fin.zero_le i))))
      exact ⟨Sum.inl ⟨x.val,h⟩,Subtype.ext rfl⟩

/-- These are the two row coefficients at every length relevant to
the three critical ranks; the small overlap corrections have degree below 3. -/
theorem literalPointedDownset_count_middle (v : List Bool) (m : ℕ) (hm : 2≤m) :
    (Nat.card (PatternDownsetAt (pointedPermutation (layerPermutation v)) (m+1)) : ℤ) =
      ((1+X)*layerPolynomial v-X-X^2).coeff (m+1) := by
  rw [← Nat.card_congr (literalPointedDownsetEquiv v m hm),Nat.card_sum,Nat.cast_add,
    literalLayerDownset_count,literalLayerDownset_count,add_mul,one_mul]
  simp only [coeff_sub,coeff_add,coeff_X_mul,coeff_X,coeff_X_pow]
  have h0 : m≠0 := by omega
  have h2 : m+1≠2 := by omega
  simp [h0,h2]

end McNamaraSteingrimsson
