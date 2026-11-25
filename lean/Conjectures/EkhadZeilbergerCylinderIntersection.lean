import Conjectures.EkhadZeilbergerEndpointProduct

open scoped BigOperators
namespace EkhadZeilberger
noncomputable section

variable {ι κ τ α : Type*} [Fintype ι] [DecidableEq ι]
  [Fintype κ] [Fintype τ] [Fintype α] [DecidableEq α] [Nonempty α]

def MatchesCylinder (e : κ ↪ ι) (A : κ→α) (x : ι→α) : Prop :=
  ∀ i,x (e i)=A i

omit [Fintype ι] [DecidableEq ι] [Fintype τ] [Fintype α] [Nonempty α] in
theorem wordCylinder_true (e : κ↪ι) (A : κ→α) (x : ι→α)
    (h : MatchesCylinder e A x) : wordCylinder e A x = 1 := by
  unfold wordCylinder
  exact Finset.prod_eq_one (fun i _ => by simp [letterIndicator,h i])

omit [Fintype ι] [DecidableEq ι] [Fintype τ] [Fintype α] [Nonempty α] in
theorem wordCylinder_false (e : κ↪ι) (A : κ→α) (x : ι→α)
    (h : ¬MatchesCylinder e A x) : wordCylinder e A x = 0 := by
  have hh : ∃ i,x (e i)≠A i := not_forall.mp h
  obtain ⟨i,hi⟩ := hh
  unfold wordCylinder
  exact Finset.prod_eq_zero (Finset.mem_univ i) (by simp [letterIndicator,hi])

omit [Fintype τ] in
theorem uniformAverage_wordCylinder (e : κ↪ι) (A : κ→α) :
    uniformAverage (wordCylinder e A) = (letterWeight α)^Fintype.card κ := by
  unfold wordCylinder
  rw [uniformAverage_product_embedding e (fun i => letterIndicator (A i))]
  simp only [sum_letterIndicator,one_div,letterWeight,Finset.prod_const,Finset.card_univ]

def Compatibility (e : κ↪ι) (f : τ↪ι) (A : κ→α) (B : τ→α) : Prop :=
  ∀ i j, e i=f j → A i=B j

instance (e : κ↪ι) (f : τ↪ι) (A : κ→α) (B : τ→α) :
    Decidable (Compatibility e f A B) := by
  unfold Compatibility
  infer_instance

def unionCoordinates (e : κ↪ι) (f : τ↪ι) : Finset ι :=
  Finset.univ.map e ∪ Finset.univ.map f

def unionCoefficient (e : κ↪ι) (f : τ↪ι) (A : κ→α) (B : τ→α)
    (c : ↥(unionCoordinates e f)) : α := by
  classical
  by_cases h : ∃ i,e i=c.val
  · exact A h.choose
  · have hf : ∃ j,f j=c.val := by
      rcases Finset.mem_union.mp c.property with h1 | h2
      · obtain ⟨i,_,hi⟩ := Finset.mem_map.mp h1
        exact False.elim (h ⟨i,hi⟩)
      · obtain ⟨j,_,hj⟩ := Finset.mem_map.mp h2
        exact ⟨j,hj⟩
    exact B hf.choose

omit [Fintype ι] [Fintype α] [DecidableEq α] [Nonempty α] in
theorem unionCoefficient_left (e : κ↪ι) (f : τ↪ι) (A : κ→α) (B : τ→α)
    (i : κ) (hi : e i ∈ unionCoordinates e f) :
    unionCoefficient e f A B ⟨e i,hi⟩ = A i := by
  classical
  have h : ∃ k,e k=e i := ⟨i,rfl⟩
  unfold unionCoefficient
  rw [dite_eq_left h]
  exact congrArg A (e.injective h.choose_spec)

omit [Fintype ι] [Fintype α] [DecidableEq α] [Nonempty α] in
theorem unionCoefficient_right (e : κ↪ι) (f : τ↪ι) (A : κ→α) (B : τ→α)
    (hcomp : Compatibility e f A B) (j : τ) (hj : f j ∈ unionCoordinates e f) :
    unionCoefficient e f A B ⟨f j,hj⟩ = B j := by
  classical
  unfold unionCoefficient
  split
  · next h => exact hcomp _ _ h.choose_spec
  · next h =>
    have hh : ∃ i,f i=f j := ⟨j,rfl⟩
    exact congrArg B (f.injective hh.choose_spec)

omit [Fintype ι] [Fintype α] [DecidableEq α] [Nonempty α] in
theorem matches_union_iff (e : κ↪ι) (f : τ↪ι) (A : κ→α) (B : τ→α)
    (hcomp : Compatibility e f A B) (x : ι→α) :
    MatchesCylinder (Function.Embedding.subtype (·∈unionCoordinates e f))
      (unionCoefficient e f A B) x ↔ MatchesCylinder e A x ∧ MatchesCylinder f B x := by
  constructor
  · intro h
    constructor
    · intro i
      have hi : e i ∈ unionCoordinates e f := Finset.mem_union_left _
        (Finset.mem_map.mpr ⟨i,Finset.mem_univ _,rfl⟩)
      exact (h ⟨e i,hi⟩).trans (unionCoefficient_left e f A B i hi)
    · intro j
      have hj : f j ∈ unionCoordinates e f := Finset.mem_union_right _
        (Finset.mem_map.mpr ⟨j,Finset.mem_univ _,rfl⟩)
      exact (h ⟨f j,hj⟩).trans (unionCoefficient_right e f A B hcomp j hj)
  · rintro ⟨hx,hy⟩ ⟨c,hc⟩
    rcases Finset.mem_union.mp hc with h1 | h2
    · obtain ⟨i,_,rfl⟩ := Finset.mem_map.mp h1
      exact (hx i).trans (unionCoefficient_left e f A B i hc).symm
    · obtain ⟨j,_,rfl⟩ := Finset.mem_map.mp h2
      exact (hy j).trans (unionCoefficient_right e f A B hcomp j hc).symm

/-- Joint probability for actual finite partial words. Inconsistent letters
give zero; otherwise every distinct prescribed coordinate contributes a
single factor of the reciprocal alphabet size. -/
theorem wordCylinder_joint (e : κ↪ι) (f : τ↪ι) (A : κ→α) (B : τ→α) :
    uniformAverage (fun x => wordCylinder e A x*wordCylinder f B x) =
      if Compatibility e f A B then (letterWeight α)^(unionCoordinates e f).card else 0 := by
  classical
  by_cases h : Compatibility e f A B
  · simp only [h,ite_true]
    let g := Function.Embedding.subtype (·∈unionCoordinates e f)
    let G := unionCoefficient e f A B
    have hf : (fun x => wordCylinder e A x*wordCylinder f B x) = wordCylinder g G := by
      funext x
      have hh := matches_union_iff e f A B h x
      by_cases ha : MatchesCylinder e A x <;> by_cases hb : MatchesCylinder f B x
      · rw [wordCylinder_true _ _ _ ha,wordCylinder_true _ _ _ hb,
          wordCylinder_true _ _ _ (hh.2 ⟨ha,hb⟩),one_mul]
      · rw [wordCylinder_false _ _ _ hb,mul_zero,
          wordCylinder_false _ _ _ (fun hu => hb (hh.1 hu).2)]
      · rw [wordCylinder_false _ _ _ ha,zero_mul,
          wordCylinder_false _ _ _ (fun hu => ha (hh.1 hu).1)]
      · rw [wordCylinder_false _ _ _ ha,zero_mul,
          wordCylinder_false _ _ _ (fun hu => ha (hh.1 hu).1)]
    rw [hf,uniformAverage_wordCylinder,Fintype.card_coe]
  · simp only [h,ite_false]
    have hf : (fun x => wordCylinder e A x*wordCylinder f B x) = (fun _ => 0) := by
      funext x
      by_cases ha : MatchesCylinder e A x
      · have hb : ¬MatchesCylinder f B x := fun hb =>
          h (fun i j hj => (ha i).symm.trans ((congrArg x hj).trans (hb j)))
        rw [wordCylinder_false _ _ _ hb,mul_zero]
      · rw [wordCylinder_false _ _ _ ha,zero_mul]
    rw [hf]
    simp [uniformAverage]

end
end EkhadZeilberger
