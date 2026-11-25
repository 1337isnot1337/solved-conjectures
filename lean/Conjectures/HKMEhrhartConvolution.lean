module

public import Conjectures.HKMEhrhartLocalCount
public import Mathlib.Data.Fintype.Card
public import Mathlib.Data.Fin.Tuple.Basic
public import Mathlib.Tactic

public section
namespace HKMEhrhart
open Finset
open scoped BigOperators

def pairPosNat (w : ℤ × ℤ) : ℕ := (positiveMass w.1 + positiveMass w.2).toNat
def pairNegNat (w : ℤ × ℤ) : ℕ := (negativeMass w.1 + negativeMass w.2).toNat

theorem pairPosNat_cast (w : ℤ × ℤ) :
    ((pairPosNat w : ℕ) : ℤ) = positiveMass w.1+positiveMass w.2 := by
  unfold pairPosNat positiveMass
  omega

theorem pairNegNat_cast (w : ℤ × ℤ) :
    ((pairNegNat w : ℕ) : ℤ) = negativeMass w.1+negativeMass w.2 := by
  unfold pairNegNat negativeMass
  omega

theorem pair_signed_masses_eq_abs (w : ℤ × ℤ) :
    ((pairPosNat w+pairNegNat w:ℕ):ℤ)=|w.1|+|w.2| := by
  rw [Int.natCast_add,pairPosNat_cast,pairNegNat_cast]
  have h (a : ℤ) : positiveMass a+negativeMass a=|a| := by
    unfold positiveMass negativeMass
    by_cases ha : 0≤a
    · rw [max_eq_left ha,max_eq_right (neg_nonpos.mpr ha),abs_of_nonneg ha,add_zero]
    · have ha' : a<0 := lt_of_not_ge ha
      rw [max_eq_right ha'.le,max_eq_left (neg_nonneg.mpr ha'.le),abs_of_neg ha',zero_add]
  calc
    _ = (positiveMass w.1+negativeMass w.1)+(positiveMass w.2+negativeMass w.2) := by ring
    _ = _ := by rw [h,h]

theorem pairMass_iff_nat (w : ℤ × ℤ) (a b : ℕ) :
    pairMass w a b ↔ pairPosNat w=a ∧ pairNegNat w=b := by
  unfold pairMass
  rw [← pairPosNat_cast, ← pairNegNat_cast]
  norm_cast

abbrev BoundedPairs (M : ℕ) : Type := {w : ℤ × ℤ // pairPosNat w + pairNegNat w ≤ M}

noncomputable instance (M : ℕ) : Fintype (BoundedPairs M) := by
  classical
  let box := (Finset.Icc (-(M:ℤ)) (M:ℤ)).product (Finset.Icc (-(M:ℤ)) (M:ℤ))
  have h (w : BoundedPairs M) : w.val ∈ box := by
    have he := pair_signed_masses_eq_abs w.val
    have hb : ((pairPosNat w.val+pairNegNat w.val:ℕ):ℤ) ≤ (M:ℤ) := by exact_mod_cast w.property
    rw [he] at hb
    have h₁ : |w.val.1| ≤ (M:ℤ) := by linarith [abs_nonneg w.val.2]
    have h₂ : |w.val.2| ≤ (M:ℤ) := by linarith [abs_nonneg w.val.1]
    exact Finset.mem_product.mpr
      ⟨Finset.mem_Icc.mpr (abs_le.mp h₁), Finset.mem_Icc.mpr (abs_le.mp h₂)⟩
  exact Fintype.ofInjective (fun w => (⟨w.val,h w⟩ : ↥box))
    (fun _ _ h' => Subtype.ext (congrArg (fun x : ↥box => x.val) h'))

abbrev PairCell (M a b : ℕ) : Type :=
  {w : BoundedPairs M // pairPosNat w.val = a ∧ pairNegNat w.val = b}

noncomputable instance (M a b : ℕ) : Fintype (PairCell M a b) := by
  classical
  unfold PairCell
  infer_instance

theorem card_PairCell (M a b : ℕ) :
    Fintype.card (PairCell M a b) = if a+b≤M then (pairs a b).card else 0 := by
  classical
  by_cases h : a+b≤M
  · rw [ite_eq_left h]
    let I : PairCell M a b ≃ ↥(pairs a b) :=
      { toFun := fun w => ⟨w.val.val,(mem_pairs_iff _ _ _).2 ((pairMass_iff_nat _ _ _).2 w.property)⟩
        invFun := fun w =>
          let hp := (pairMass_iff_nat _ _ _).1 ((mem_pairs_iff _ _ _).1 w.property)
          ⟨⟨w.val, by rw [hp.1,hp.2];exact h⟩,hp⟩
        left_inv := fun _ => rfl
        right_inv := fun _ => rfl }
    exact (Fintype.card_congr I).trans (Fintype.card_coe _)
  · rw [ite_eq_right h]
    have : IsEmpty (PairCell M a b) := ⟨fun w => h (by simpa [w.property.1,w.property.2] using w.val.property)⟩
    exact Fintype.card_of_isEmpty

abbrev MassConfig (s M P Q : ℕ) : Type :=
  {w : Fin s → BoundedPairs M //
    (∑ i, pairPosNat (w i).val)=P ∧ (∑ i, pairNegNat (w i).val)=Q}

noncomputable instance (s M P Q : ℕ) : Fintype (MassConfig s M P Q) := by
  classical
  unfold MassConfig
  infer_instance

theorem card_MassConfig_zero (M P Q : ℕ) :
    Fintype.card (MassConfig 0 M P Q) = if P=0 ∧ Q=0 then 1 else 0 := by
  by_cases h : P=0 ∧ Q=0
  · have : Unique (MassConfig 0 M P Q) :=
      ⟨⟨⟨Fin.elim0,by simp [h.1,h.2]⟩⟩,fun w => Subtype.ext (funext fun i => Fin.elim0 i)⟩
    rw [ite_eq_left h]
    exact Fintype.card_unique
  · have : IsEmpty (MassConfig 0 M P Q) := ⟨fun w => h (by
      simpa [eq_comm] using w.property)⟩
    rw [ite_eq_right h]
    exact Fintype.card_of_isEmpty


abbrev MassConfigSplit (s M P Q : ℕ) : Type :=
  Σ ab : Fin (P+1) × Fin (Q+1),
    PairCell M ab.1.val ab.2.val × MassConfig s M (P-ab.1.val) (Q-ab.2.val)

noncomputable def massConfigSplitEquiv (s M P Q : ℕ) :
    MassConfig (s+1) M P Q ≃ MassConfigSplit s M P Q where
  toFun w := by
    have hP := w.property.1
    have hQ := w.property.2
    rw [Fin.sum_univ_succ] at hP hQ
    let a : Fin (P+1) := ⟨pairPosNat (w.val 0).val, by omega⟩
    let b : Fin (Q+1) := ⟨pairNegNat (w.val 0).val, by omega⟩
    refine ⟨(a,b),⟨w.val 0,rfl,rfl⟩,⟨fun i => w.val i.succ,?_⟩⟩
    exact ⟨by change (∑ i : Fin s, pairPosNat (w.val i.succ).val) = P-pairPosNat (w.val 0).val; omega,
      by change (∑ i : Fin s, pairNegNat (w.val i.succ).val) = Q-pairNegNat (w.val 0).val; omega⟩
  invFun w := by
    refine ⟨Fin.cons w.2.1.val w.2.2.val,?_⟩
    constructor
    · rw [Fin.sum_univ_succ]
      simp only [Fin.cons_zero,Fin.cons_succ,w.2.1.property.1,w.2.2.property.1]
      exact Nat.add_sub_of_le (Nat.le_of_lt_succ w.1.1.isLt)
    · rw [Fin.sum_univ_succ]
      simp only [Fin.cons_zero,Fin.cons_succ,w.2.1.property.2,w.2.2.property.2]
      exact Nat.add_sub_of_le (Nat.le_of_lt_succ w.1.2.isLt)
  left_inv w := by
    apply Subtype.ext
    exact Fin.cons_self_tail _
  right_inv w := by
    obtain ⟨⟨a,b⟩,h,t⟩ := w
    obtain ⟨h,ha,hb⟩ := h
    cases a with | mk a h_lt =>
    cases b with | mk b h_lt' =>
    dsimp only [Fin.val_mk] at ha hb
    subst a
    subst b
    congr 1

theorem card_MassConfig_succ (s M P Q : ℕ) :
    Fintype.card (MassConfig (s+1) M P Q) =
      ∑ ab : Fin (P+1) × Fin (Q+1),
        (if ab.1.val+ab.2.val≤M then (pairs ab.1.val ab.2.val).card else 0) *
          Fintype.card (MassConfig s M (P-ab.1.val) (Q-ab.2.val)) := by
  rw [Fintype.card_congr (massConfigSplitEquiv s M P Q)]
  unfold MassConfigSplit
  simp only [Fintype.card_sigma,Fintype.card_prod,card_PairCell]


def pairCellCount (M a b : ℕ) : ℕ :=
  if a+b≤M then (if a=0 ∨ b=0 then a+b+1 else 2) else 0

theorem pairCellCount_eq (M a b : ℕ) :
    Fintype.card (PairCell M a b) = pairCellCount M a b := by
  rw [card_PairCell,card_pairs]
  rfl

def convolutionCount (M : ℕ) : ℕ → ℕ → ℕ → ℕ
  | 0,P,Q => if P=0 ∧ Q=0 then 1 else 0
  | s+1,P,Q => ∑ ab : Fin (P+1) × Fin (Q+1), pairCellCount M ab.1.val ab.2.val *
      convolutionCount M s (P-ab.1.val) (Q-ab.2.val)

theorem card_MassConfig_eq_convolutionCount (s M P Q : ℕ) :
    Fintype.card (MassConfig s M P Q) = convolutionCount M s P Q := by
  induction s generalizing P Q with
  | zero => exact card_MassConfig_zero _ _ _
  | succ s ih =>
    rw [card_MassConfig_succ,convolutionCount]
    apply Finset.sum_congr rfl
    intro ab _
    rw [ih, ← card_PairCell,pairCellCount_eq]

abbrev PairConvolutionTable (M : ℕ) := Vector (Vector ℕ (M+1)) (M+1)

def initialConvolutionTable (M : ℕ) : PairConvolutionTable M :=
  Vector.ofFn fun p => Vector.ofFn fun q => if p.val=0 ∧ q.val=0 then 1 else 0

def stepConvolutionTable (M : ℕ) (prev : PairConvolutionTable M) : PairConvolutionTable M :=
  Vector.ofFn fun p => Vector.ofFn fun q =>
    (List.ofFn fun a : Fin (p.val+1) => (List.ofFn fun b : Fin (q.val+1) =>
      pairCellCount M a.val b.val * prev[p.val-a.val][q.val-b.val]).sum).sum

def makeConvolutionTable (M : ℕ) : ℕ → PairConvolutionTable M
  | 0 => initialConvolutionTable M
  | s+1 => stepConvolutionTable M (makeConvolutionTable M s)

theorem makeConvolutionTable_correct (M s : ℕ) (p q : Fin (M+1)) :
    (makeConvolutionTable M s)[p.val][q.val] = convolutionCount M s p.val q.val := by
  induction s generalizing p q with
  | zero => simp [makeConvolutionTable,initialConvolutionTable,convolutionCount]
  | succ s ih =>
    simp only [makeConvolutionTable,stepConvolutionTable,Vector.getElem_ofFn,
      List.sum_ofFn,convolutionCount,Fintype.sum_prod_type]
    refine Finset.sum_congr rfl fun a _ => Finset.sum_congr rfl fun b _ => ?_
    congr 1
    exact ih ⟨p.val-a.val,by omega⟩ ⟨q.val-b.val,by omega⟩

def computedDiagonalLatticeCount (s M : ℕ) : ℕ :=
  let t := makeConvolutionTable M s
  (List.ofFn fun p : Fin (M+1) => t[p.val][p.val]).sum

theorem computedDiagonalLatticeCount_eq_sum (s M : ℕ) :
    computedDiagonalLatticeCount s M = ∑ p : Fin (M+1), Fintype.card (MassConfig s M p.val p.val) := by
  unfold computedDiagonalLatticeCount
  simp only [List.sum_ofFn]
  apply Finset.sum_congr rfl
  intro p _
  rw [makeConvolutionTable_correct,card_MassConfig_eq_convolutionCount]

end HKMEhrhart
