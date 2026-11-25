module

public import Conjectures.McNamaraSteingrimssonPrefixFamilies
public import Mathlib.SetTheory.Cardinal.Finite

@[expose] public section
namespace McNamaraSteingrimsson

abbrev PatternDownsetAt {n : ℕ} (q : Equiv.Perm (Fin n)) (r : ℕ) :=
  {p : Equiv.Perm (Fin r) // ClassicalPattern p q}

abbrev AbsoluteInterval {m n : ℕ} (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n)) (d : ℕ) :=
  {s : Equiv.Perm (Fin d) // ClassicalPattern p s ∧ ClassicalPattern s q}

abbrev FullFamilySubtype {m n : ℕ} (α : Equiv.Perm (Fin (m+1)))
    (π : Equiv.Perm (Fin n)) (r : ℕ) :=
  {p : Equiv.Perm (Fin (m+1+r)) // FullPrefixFamily α π p}

abbrev ProperFamilySubtype {m n : ℕ} (α : Equiv.Perm (Fin (m+1)))
    (π : Equiv.Perm (Fin n)) (d : ℕ) :=
  {p : Equiv.Perm (Fin d) // ProperPrefixFamily α π p}

abbrev ProperFamilyData {m n : ℕ} (α : Equiv.Perm (Fin (m+1)))
    (π : Equiv.Perm (Fin n)) (d : ℕ) :=
  Σ k : Fin (m+1), PatternDownsetAt α k.val × AbsoluteInterval α π (d-k.val)

def fullFamilyMap {m n : ℕ} (α : Equiv.Perm (Fin (m+1)))
    (π : Equiv.Perm (Fin n)) (r : ℕ) (pR : PatternDownsetAt π r) :
    FullFamilySubtype α π r :=
  ⟨directSumPermutation α pR.val,⟨r,rfl,pR.val,rfl,pR.property⟩⟩

noncomputable def fullFamilyEquiv {m n : ℕ} (α : Equiv.Perm (Fin (m+1)))
    (π : Equiv.Perm (Fin n)) (r : ℕ) :
    PatternDownsetAt π r ≃ FullFamilySubtype α π r := by
  apply Equiv.ofBijective (fullFamilyMap α π r)
  constructor
  · intro p q h
    apply Subtype.ext
    exact ((directSum_cases_injective α α p.val q.val).mp
      (congrArg (fun p : FullFamilySubtype α π r => p.val) h)).2
  · rintro ⟨β,⟨s,h,pR,hβ,hR⟩⟩
    have hs : s=r := by omega
    subst s
    refine ⟨⟨pR,hR⟩,Subtype.ext ?_⟩
    exact hβ

theorem castPermutation_injective {m n : ℕ} (h : m=n) :
    Function.Injective (castPermutation h) := by
  subst n
  exact fun _ _ h => h

def properFamilyMap {m n d : ℕ} (α : Equiv.Perm (Fin (m+1)))
    (π : Equiv.Perm (Fin n)) (hd : m+1≤d) (x : ProperFamilyData α π d) :
    ProperFamilySubtype α π d := by
  obtain ⟨k,pL,pR⟩ := x
  have h : k.val+(d-k.val)=d := Nat.add_sub_of_le (k.isLt.le.trans hd)
  refine ⟨castPermutation h (directSumPermutation pL.val pR.val),
    ⟨k.val,d-k.val,h,pL.val,pR.val,k.isLt,rfl,pL.property,pR.property.1,pR.property.2⟩⟩

theorem properFamilyMap_surjective {m n d : ℕ} (α : Equiv.Perm (Fin (m+1)))
    (π : Equiv.Perm (Fin n)) (hd : m+1≤d) :
    Function.Surjective (properFamilyMap α π hd) := by
  rintro ⟨β,⟨k,l,h,pL,pR,hk,hβ,hL,hlo,hR⟩⟩
  have hl : l=d-k := by omega
  subst l
  exact ⟨⟨⟨k,hk⟩,⟨pL,hL⟩,⟨pR,hlo,hR⟩⟩,Subtype.ext hβ⟩

theorem properFamilyMap_injective {a b : List Bool} {d : ℕ}
    (ha : 2≤a.length) (hd : Fintype.card (LayerPosition a)+1≤d) :
    let α := pointedPermutation (layerPermutation a)
    let π := pointedPermutation (layerPermutation b)
    Function.Injective (properFamilyMap α π hd) := by
  dsimp only
  let α := pointedPermutation (layerPermutation a)
  let π := pointedPermutation (layerPermutation b)
  rintro ⟨k,pL,pR⟩ ⟨j,qL,qR⟩ h
  obtain ⟨hp,hpmax⟩ := rightFactor_beginsWithMaximum ha pR.property.1 pR.property.2
  obtain ⟨hq,hqmax⟩ := rightFactor_beginsWithMaximum ha qR.property.1 qR.property.2
  let hk : k.val+(d-k.val)=d := Nat.add_sub_of_le (k.isLt.le.trans hd)
  let hj : j.val+(d-j.val)=d := Nat.add_sub_of_le (j.isLt.le.trans hd)
  obtain ⟨x,hx,hpx⟩ := castSum_at_rightMaximum hk pL.val pR.val hp hpmax
  obtain ⟨y,hy,hqy⟩ := castSum_at_rightMaximum hj qL.val qR.val hq hqmax
  have he := congrArg (fun p : ProperFamilySubtype α π d => p.val) h
  change castPermutation hk (directSumPermutation pL.val pR.val) =
    castPermutation hj (directSumPermutation qL.val qR.val) at he
  rw [← he] at hqy
  have hxy : x=y := by
    apply (castPermutation hk (directSumPermutation pL.val pR.val)).injective
    apply Fin.ext
    omega
  have hkj : k=j := Fin.ext (hx.symm.trans (hxy ▸ hy))
  subst j
  have he' := castPermutation_injective hk he
  obtain ⟨hLeft,hRight⟩ := (directSum_cases_injective pL.val qL.val pR.val qR.val).mp he'
  exact Sigma.ext rfl (heq_of_eq (Prod.ext (Subtype.ext hLeft) (Subtype.ext hRight)))

noncomputable def properFamilyEquiv {a b : List Bool} {d : ℕ}
    (ha : 2≤a.length) (hd : Fintype.card (LayerPosition a)+1≤d) :
    let α := pointedPermutation (layerPermutation a)
    let π := pointedPermutation (layerPermutation b)
    ProperFamilyData α π d ≃ ProperFamilySubtype α π d :=
  Equiv.ofBijective (properFamilyMap _ _ hd)
    ⟨properFamilyMap_injective ha hd,properFamilyMap_surjective _ _ hd⟩

noncomputable def twoSummandFamiliesEquiv {a b : List Bool} (ha : 2≤a.length)
    {r : ℕ} (hr : 0<r) :
    let α := pointedPermutation (layerPermutation a)
    let π := pointedPermutation (layerPermutation b)
    FullFamilySubtype α π r ⊕ ProperFamilySubtype α π (Fintype.card (LayerPosition a)+1+r) ≃
      AbsoluteInterval α (directSumPermutation α π) (Fintype.card (LayerPosition a)+1+r) := by
  dsimp only
  let α := pointedPermutation (layerPermutation a)
  let π := pointedPermutation (layerPermutation b)
  let n := Fintype.card (LayerPosition a)+1
  let F := FullFamilySubtype α π r
  let P := ProperFamilySubtype α π (n+r)
  let I := AbsoluteInterval α (directSumPermutation α π) (n+r)
  let q : F⊕P → I := fun x => match x with
    | Sum.inl p =>
      ⟨p.val,(classicalPattern_twoSummandInterval_iff (layerPermutation a) π p.val).mpr
        (Or.inl p.property)⟩
    | Sum.inr p =>
      ⟨p.val,(classicalPattern_twoSummandInterval_iff (layerPermutation a) π p.val).mpr
        (Or.inr p.property)⟩
  have hd : Fintype.card (LayerPosition a)+1<n+r := by dsimp [n]; omega
  refine Equiv.ofBijective q ⟨?_,?_⟩
  · intro x y h
    cases x with
    | inl x =>
      cases y with
      | inl y =>
        have he : x.val=y.val := congrArg (fun p : I => p.val) h
        exact congrArg Sum.inl (Subtype.ext he)
      | inr y =>
        have he : x.val=y.val := congrArg (fun p : I => p.val) h
        exact (twoSummand_families_disjoint ha hd x.property (he.symm ▸ y.property)).elim
    | inr x =>
      cases y with
      | inl y =>
        have he : x.val=y.val := congrArg (fun p : I => p.val) h
        exact (twoSummand_families_disjoint ha hd y.property (he ▸ x.property)).elim
      | inr y =>
        have he : x.val=y.val := congrArg (fun p : I => p.val) h
        exact congrArg Sum.inr (Subtype.ext he)
  · rintro ⟨p,hp⟩
    rcases (classicalPattern_twoSummandInterval_iff (layerPermutation a) π p).mp hp with h|h
    · exact ⟨Sum.inl ⟨p,h⟩,Subtype.ext rfl⟩
    · exact ⟨Sum.inr ⟨p,h⟩,Subtype.ext rfl⟩

/-- The exact positive-rank convolution in the first two-summand
interval, expressed using counts of actual distinct permutations. -/
theorem twoSummand_rank_count {a b : List Bool} (ha : 2≤a.length) {r : ℕ} (hr : 0<r) :
    let α := pointedPermutation (layerPermutation a)
    let π := pointedPermutation (layerPermutation b)
    let n := Fintype.card (LayerPosition a)+1
    Nat.card (AbsoluteInterval α (directSumPermutation α π) (n+r)) =
      Nat.card (PatternDownsetAt π r) + ∑ k : Fin n,
        Nat.card (PatternDownsetAt α k.val) * Nat.card (AbsoluteInterval α π (n+r-k.val)) := by
  dsimp only
  let α := pointedPermutation (layerPermutation a)
  let π := pointedPermutation (layerPermutation b)
  let n := Fintype.card (LayerPosition a)+1
  have hn : Fintype.card (LayerPosition a)+1≤n+r := by dsimp [n]; omega
  rw [← Nat.card_congr (twoSummandFamiliesEquiv (b := b) ha hr),Nat.card_sum,
    ← Nat.card_congr (fullFamilyEquiv α π r),← Nat.card_congr (properFamilyEquiv (b := b) ha hn)]
  congr 1
  rw [Nat.card_sigma]
  simp only [Nat.card_prod]
  rfl

end McNamaraSteingrimsson
