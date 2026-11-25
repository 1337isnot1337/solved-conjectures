module

public import Conjectures.HKMEhrhartViolationBudget
import all Conjectures.HKMEhrhartCountBridge
import all Conjectures.HKMEhrhartConvolution
import all Conjectures.HKMEhrhartUnclippedPolynomial
import all Conjectures.HKMEhrhartSupportShells

@[expose] public section
namespace HKMEhrhart
open Finset Polynomial
open scoped BigOperators Polynomial

abbrev CocktailCoordinates := Fin 6 × Fin 2

def remainderEquiv : Fin 5 × Fin 2 ≃ Fin 10 := finProdFinEquiv (m:=5) (n:=2)
def pairRemainder (j : Fin 6) (z : CocktailCoordinates → ℤ) (i : Fin 10) : ℤ :=
  let p : Fin 5 × Fin 2 := remainderEquiv.symm i
  z (j.succAbove p.1,p.2)

def restoreRemainder (j : Fin 6) (u : ℤ×ℤ) (w : Fin 10 → ℤ) : CocktailCoordinates → ℤ :=
  flattenPairs (Fin.insertNth j u (fun k => (w (remainderEquiv (k,0)), w (remainderEquiv (k,1)))))

@[simp] theorem coordinatePair_restoreRemainder (j : Fin 6) (u : ℤ×ℤ) (w : Fin 10 → ℤ) :
    coordinatePair (restoreRemainder j u w) j = u := by
  simp [restoreRemainder]

@[simp] theorem pairRemainder_restoreRemainder (j : Fin 6) (u : ℤ×ℤ) (w : Fin 10 → ℤ) :
    pairRemainder j (restoreRemainder j u w) = w := by
  funext i
  rcases he : remainderEquiv.symm i with ⟨a,b⟩
  have hh : remainderEquiv (a,b) = i := by rw [← he]; exact Equiv.apply_symm_apply _ _
  fin_cases b
  · change remainderEquiv (a,0) = i at hh
    simp [pairRemainder,restoreRemainder,flattenPairs,he,hh]
  · change remainderEquiv (a,1) = i at hh
    simp [pairRemainder,restoreRemainder,flattenPairs,he,hh]

@[simp] theorem restoreRemainder_coordinatePair (j : Fin 6) (z : CocktailCoordinates → ℤ) :
    restoreRemainder j (coordinatePair z j) (pairRemainder j z) = z := by
  funext i
  obtain ⟨a,b⟩ := i
  refine Fin.succAboveCases j ?_ (fun k => ?_) a
  · fin_cases b <;> simp [restoreRemainder,flattenPairs,coordinatePair]
  · fin_cases b <;> simp [restoreRemainder,flattenPairs,pairRemainder]

theorem sum_coordinatePair (f : ℤ → ℕ) (z : CocktailCoordinates → ℤ) :
    (∑ i,f (z i)) = ∑ k,(f (coordinatePair z k).1+f (coordinatePair z k).2) := by
  rw [Fintype.sum_prod_type]
  simp only [Fin.sum_univ_two,coordinatePair]

theorem sum_splitPair (f : ℤ → ℕ) (j : Fin 6) (z : CocktailCoordinates → ℤ) :
    (∑ i,f (z i)) =
      (f (coordinatePair z j).1+f (coordinatePair z j).2)+(∑ i,f (pairRemainder j z i)) := by
  rw [sum_coordinatePair,Fin.sum_univ_succAbove _ j]
  congr 1
  let g : Fin 5 × Fin 2 → ℕ := fun a => f (z (j.succAbove a.1,a.2))
  have h := Equiv.sum_comp (remainderEquiv.symm : Fin 10 ≃ Fin 5 × Fin 2) g
  rw [Fintype.sum_prod_type] at h
  simp only [Fin.sum_univ_two] at h
  exact h.symm

theorem pairPosNat_eq_natPositiveMass (p : ℤ×ℤ) :
    pairPosNat p = natPositiveMass p.1+natPositiveMass p.2 := by
  unfold pairPosNat natPositiveMass positiveMass
  omega

theorem pairNegNat_eq_natNegativeMass (p : ℤ×ℤ) :
    pairNegNat p = natNegativeMass p.1+natNegativeMass p.2 := by
  unfold pairNegNat natNegativeMass negativeMass
  omega

theorem totalPos_eq_sum_pairs (z : CocktailCoordinates → ℤ) :
    (∑ i,natPositiveMass (z i)) = ∑ j,pairPosNat (coordinatePair z j) := by
  simpa only [pairPosNat_eq_natPositiveMass] using sum_coordinatePair natPositiveMass z

theorem totalNeg_eq_sum_pairs (z : CocktailCoordinates → ℤ) :
    (∑ i,natNegativeMass (z i)) = ∑ j,pairNegNat (coordinatePair z j) := by
  simpa only [pairNegNat_eq_natNegativeMass] using sum_coordinatePair natNegativeMass z

theorem totalPos_splitPair (j : Fin 6) (z : CocktailCoordinates → ℤ) :
    (∑ i,natPositiveMass (z i)) =
      pairPosNat (coordinatePair z j) + restPos (pairRemainder j z) := by
  simpa only [restPos,pairPosNat_eq_natPositiveMass] using sum_splitPair natPositiveMass j z

theorem totalNeg_splitPair (j : Fin 6) (z : CocktailCoordinates → ℤ) :
    (∑ i,natNegativeMass (z i)) =
      pairNegNat (coordinatePair z j) + restNeg (pairRemainder j z) := by
  simpa only [restNeg,pairNegNat_eq_natNegativeMass] using sum_splitPair natNegativeMass j z

def capMass (j : Fin 6) (z : CocktailCoordinates → ℤ) : ℕ :=
  pairPosNat (coordinatePair z j)+pairNegNat (coordinatePair z j)

abbrev ViolatingCocktail (m : ℕ) (j : Fin 6) :=
  {z : UnclippedCocktail CocktailCoordinates m // m < capMass j z.val}

def violatingCocktailEquiv (m : ℕ) (j : Fin 6) : ViolatingCocktail m j ≃ PairViolationData (Fin 10) m where
  toFun z := ⟨(coordinatePair z.val.val j,pairRemainder j z.val.val),by
    have h := z.val.property
    rw [totalPos_splitPair j,totalNeg_splitPair j] at h
    exact ⟨h.1,h.2,z.property⟩⟩
  invFun v := by
    let z := restoreRemainder j v.val.1 v.val.2
    have h := v.property
    refine ⟨⟨z,?_⟩,?_⟩
    · rw [totalPos_splitPair j,totalNeg_splitPair j]
      simpa only [z,coordinatePair_restoreRemainder,pairRemainder_restoreRemainder] using And.intro h.1 h.2.1
    · simpa only [z,capMass,coordinatePair_restoreRemainder] using h.2.2
  left_inv z := by
    apply Subtype.ext
    apply Subtype.ext
    exact restoreRemainder_coordinatePair _ _
  right_inv v := by
    apply Subtype.ext
    exact Prod.ext (coordinatePair_restoreRemainder _ _ _) (pairRemainder_restoreRemainder _ _ _)

theorem cocktail_cap_unique {m : ℕ} (z : UnclippedCocktail CocktailCoordinates m)
    {j k : Fin 6} (hj : m < capMass j z.val) (hk : m < capMass k z.val) : j=k := by
  by_contra h
  have hst : ({j,k} : Finset (Fin 6)) ⊆ Finset.univ := fun _ _ => Finset.mem_univ _
  have hle := Finset.sum_le_sum_of_subset_of_nonneg hst
    (f := fun i => capMass i z.val) (fun i _ _ => Nat.zero_le _)
  rw [Finset.sum_pair h] at hle
  unfold capMass at hle hj hk
  rw [Finset.sum_add_distrib,← totalPos_eq_sum_pairs,← totalNeg_eq_sum_pairs] at hle
  have hh := z.property
  omega

def cocktailAsUnclipped {m : ℕ} (z : CocktailLattice 6 m) :
    UnclippedCocktail CocktailCoordinates m := by
  have h := (cocktail_lattice_iff_pairs (by decide) z.val).1 z.property
  refine ⟨z.val,?_⟩
  rw [totalPos_eq_sum_pairs,totalNeg_eq_sum_pairs]
  exact ⟨h.1,h.2.1⟩

def unclippedToCocktail {m : ℕ} (z : UnclippedCocktail CocktailCoordinates m)
    (hc : ∀ j, capMass j z.val ≤ m) : CocktailLattice 6 m := by
  refine ⟨z.val,(cocktail_lattice_iff_pairs (by decide) z.val).2 ?_⟩
  have h := z.property
  rw [totalPos_eq_sum_pairs,totalNeg_eq_sum_pairs] at h
  exact ⟨h.1,h.2,hc⟩

noncomputable def splitCocktail {m : ℕ} (z : UnclippedCocktail CocktailCoordinates m) :
    CocktailLattice 6 m ⊕ (Σ j : Fin 6,ViolatingCocktail m j) := by
  classical
  by_cases h : ∀ j,capMass j z.val ≤ m
  · exact Sum.inl (unclippedToCocktail z h)
  · have he : ∃ j,m < capMass j z.val := by push Not at h; exact h
    exact Sum.inr ⟨he.choose,⟨z,he.choose_spec⟩⟩

def mergeCocktail {m : ℕ} :
    CocktailLattice 6 m ⊕ (Σ j : Fin 6,ViolatingCocktail m j) →
      UnclippedCocktail CocktailCoordinates m
  | Sum.inl z => cocktailAsUnclipped z
  | Sum.inr z => z.2.val

theorem merge_splitCocktail {m : ℕ} (z : UnclippedCocktail CocktailCoordinates m) :
    mergeCocktail (splitCocktail z) = z := by
  classical
  unfold splitCocktail
  split <;> exact Subtype.ext rfl

theorem split_mergeCocktail {m : ℕ}
    (v : CocktailLattice 6 m ⊕ (Σ j : Fin 6,ViolatingCocktail m j)) :
    splitCocktail (mergeCocktail v) = v := by
  classical
  rcases v with z | ⟨j,z⟩
  · have hv : ∀ j, capMass j (cocktailAsUnclipped z).val ≤ m :=
      ((cocktail_lattice_iff_pairs (by decide) z.val).1 z.property).2.2
    change splitCocktail (cocktailAsUnclipped z) = Sum.inl z
    rw [splitCocktail,dite_eq_left hv]
    rfl
  · let v : CocktailLattice 6 m ⊕ (Σ j : Fin 6,ViolatingCocktail m j) := Sum.inr ⟨j,z⟩
    change splitCocktail (mergeCocktail v) = v
    have hbad : ¬∀ k,capMass k (mergeCocktail v).val ≤ m := fun hc =>
      (Nat.not_le_of_lt z.property) (hc j)
    unfold splitCocktail
    simp only [dite_eq_right hbad]
    apply congrArg Sum.inr
    let h : ∃ k,m < capMass k (mergeCocktail v).val := by push Not at hbad; exact hbad
    change (⟨h.choose,⟨mergeCocktail v,h.choose_spec⟩⟩ : Σ k, ViolatingCocktail m k) = ⟨j,z⟩
    have hj : h.choose = j := cocktail_cap_unique z.val h.choose_spec z.property
    refine Sigma.ext hj ?_
    have heq {a b : Fin 6} (hab : a=b) (x : ViolatingCocktail m a)
        (y : ViolatingCocktail m b) (hxy : x.val=y.val) : HEq x y := by
      subst b
      exact heq_of_eq (Subtype.ext hxy)
    exact heq hj _ _ rfl

noncomputable def splitCocktailEquiv (m : ℕ) :
    UnclippedCocktail CocktailCoordinates m ≃ CocktailLattice 6 m ⊕ (Σ j : Fin 6,ViolatingCocktail m j) :=
  ⟨splitCocktail,mergeCocktail,merge_splitCocktail,split_mergeCocktail⟩

theorem unclipped_card_eq_clipped_add_violations (m : ℕ) :
    Fintype.card (UnclippedCocktail CocktailCoordinates m) =
      Fintype.card (CocktailLattice 6 m) + 6*Nat.card (PairViolationData (Fin 10) m) := by
  classical
  let (j : Fin 6) : Fintype (ViolatingCocktail m j) := Fintype.ofFinite _
  rw [Fintype.card_congr (splitCocktailEquiv m),Fintype.card_sum,Fintype.card_sigma]
  have hj (j : Fin 6) :
      Fintype.card (ViolatingCocktail m j) = Nat.card (PairViolationData (Fin 10) m) := by
    rw [← Nat.card_eq_fintype_card,Nat.card_congr (violatingCocktailEquiv m j)]
  simp only [hj,Finset.sum_const,Finset.card_univ,Fintype.card_fin,nsmul_eq_mul]
  rfl


end HKMEhrhart
