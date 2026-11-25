module

public import Conjectures.HKMEhrhartConvolution
public import Conjectures.HKMEhrhart
import all Conjectures.HKMEhrhart
public import Conjectures.HKMEhrhartSufficiency
import all Conjectures.HKMEhrhartGeometry
import all Conjectures.HKMEhrhartSufficiency
import all Conjectures.HKMEhrhartConvolution

public section
namespace HKMEhrhart
open Set Finset Polynomial
open scoped BigOperators

abbrev CocktailLattice (s M : ℕ) :=
  ↥(multipartiteLatticePoints (Prod.fst : Fin s × Fin 2 → Fin s) M)

noncomputable instance (s M : ℕ) : Fintype (CocktailLattice s M) :=
  (multipartiteLatticePoints_finite (Prod.fst : Fin s × Fin 2 → Fin s) M).fintype

def coordinatePair {s : ℕ} (z : Fin s × Fin 2 → ℤ) (i : Fin s) : ℤ × ℤ :=
  (z (i,0),z (i,1))

def flattenPairs {s : ℕ} (w : Fin s → ℤ × ℤ) : Fin s × Fin 2 → ℤ :=
  fun i => if i.2=0 then (w i.1).1 else (w i.1).2

@[simp] theorem coordinatePair_flattenPairs {s : ℕ} (w : Fin s → ℤ × ℤ) (i : Fin s) :
    coordinatePair (flattenPairs w) i = w i := by
  simp [coordinatePair,flattenPairs]

@[simp] theorem flattenPairs_coordinatePair {s : ℕ} (z : Fin s × Fin 2 → ℤ) :
    flattenPairs (coordinatePair z) = z := by
  funext i
  obtain ⟨a,b⟩ := i
  fin_cases b <;> simp [flattenPairs,coordinatePair]

theorem cocktail_has_two_parts {s : ℕ} (hs : 2≤s) :
    ∃ i j : Fin s × Fin 2, i.1 ≠ j.1 := by
  refine ⟨(⟨0,by omega⟩,0),(⟨1,by omega⟩,0),?_⟩
  intro h
  have h' : (0:ℕ)=1 := congrArg Fin.val h
  omega

theorem pair_masses_difference (w : ℤ × ℤ) :
    (pairPosNat w:ℤ)-(pairNegNat w:ℤ)=w.1+w.2 := by
  rw [pairPosNat_cast,pairNegNat_cast]
  unfold positiveMass negativeMass
  omega

theorem cocktail_total_sum {s : ℕ} (z : Fin s × Fin 2 → ℤ) :
    (∑ i,z i) =
      ((∑ j,pairPosNat (coordinatePair z j):ℕ):ℤ)-
      ((∑ j,pairNegNat (coordinatePair z j):ℕ):ℤ) := by
  rw [Fintype.sum_prod_type]
  push_cast
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro i _
  rw [Fin.sum_univ_two,pair_masses_difference]
  rfl

theorem cocktail_positive_sum {s : ℕ} (z : Fin s × Fin 2 → ℤ) :
    hkmPositiveSum z = ((∑ j,pairPosNat (coordinatePair z j):ℕ):ℤ) := by
  unfold hkmPositiveSum
  rw [Fintype.sum_prod_type]
  push_cast
  apply Finset.sum_congr rfl
  intro i _
  rw [Fin.sum_univ_two,pairPosNat_cast]
  rfl

theorem cocktail_part_abs_sum {s : ℕ} (z : Fin s × Fin 2 → ℤ) (j : Fin s) :
    hkmPartAbsSum Prod.fst z j =
      ((pairPosNat (coordinatePair z j)+pairNegNat (coordinatePair z j):ℕ):ℤ) := by
  unfold hkmPartAbsSum
  rw [Finset.sum_filter,Fintype.sum_prod_type,pair_signed_masses_eq_abs]
  simp_rw [Fin.sum_univ_two]
  rw [Finset.sum_eq_single j]
  · simp [coordinatePair]
  · intro i _ hi
    simp [hi]
  · simp

theorem cocktail_lattice_iff_pairs {s M : ℕ} (hs : 2≤s) (z : Fin s × Fin 2 → ℤ) :
    z ∈ multipartiteLatticePoints Prod.fst M ↔
      (∑ j,pairPosNat (coordinatePair z j))=(∑ j,pairNegNat (coordinatePair z j)) ∧
      (∑ j,pairPosNat (coordinatePair z j))≤M ∧
      ∀ j,pairPosNat (coordinatePair z j)+pairNegNat (coordinatePair z j)≤M := by
  rw [hkm_lattice_mass_iff Prod.fst (cocktail_has_two_parts hs)]
  rw [cocktail_total_sum,cocktail_positive_sum]
  simp_rw [cocktail_part_abs_sum]
  rw [sub_eq_zero]
  norm_cast

private theorem massConfig_heq_of_val {s M P Q P' Q' : ℕ}
    (hp : P=P') (hq : Q=Q') (x : MassConfig s M P Q) (y : MassConfig s M P' Q')
    (h : x.val=y.val) : HEq x y := by
  subst P'
  subst Q'
  exact heq_of_eq (Subtype.ext h)

noncomputable def cocktailConfigEquiv (s M : ℕ) (hs : 2≤s) :
    CocktailLattice s M ≃ Σ p : Fin (M+1), MassConfig s M p.val p.val where
  toFun z := by
    have h := (cocktail_lattice_iff_pairs hs z.val).1 z.property
    let p : Fin (M+1) := ⟨∑ j,pairPosNat (coordinatePair z.val j), Nat.lt_succ_of_le h.2.1⟩
    exact ⟨p,⟨fun j => ⟨coordinatePair z.val j,h.2.2 j⟩,rfl,h.1.symm⟩⟩
  invFun v := by
    let w : Fin s→ℤ×ℤ := fun j => (v.2.val j).val
    refine ⟨flattenPairs w,(cocktail_lattice_iff_pairs hs _).2 ?_⟩
    simp only [coordinatePair_flattenPairs, w]
    exact ⟨v.2.property.1.trans v.2.property.2.symm,
      v.2.property.1.trans_le (Nat.le_of_lt_succ v.1.isLt),fun j => (v.2.val j).property⟩
  left_inv z := by
    apply Subtype.ext
    exact flattenPairs_coordinatePair z.val
  right_inv v := by
    obtain ⟨p,w⟩ := v
    have hEq : (∑ j,pairPosNat (coordinatePair (flattenPairs (fun i => (w.val i).val)) j)) = p.val := by
      simp only [coordinatePair_flattenPairs,w.property.1]
    refine Sigma.ext (Fin.ext hEq) ?_
    apply massConfig_heq_of_val hEq hEq
    funext i
    apply Subtype.ext
    change coordinatePair (flattenPairs (fun j => (w.val j).val)) i = (w.val i).val
    exact coordinatePair_flattenPairs _ _

theorem computedDiagonalLatticeCount_eq_literal (s M : ℕ) (hs : 2≤s) :
    computedDiagonalLatticeCount s M = Fintype.card (CocktailLattice s M) := by
  rw [computedDiagonalLatticeCount_eq_sum,Fintype.card_congr (cocktailConfigEquiv s M hs),
    Fintype.card_sigma]


end HKMEhrhart
