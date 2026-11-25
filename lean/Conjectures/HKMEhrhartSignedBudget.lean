module

public import Conjectures.HKMEhrhartStarsBars
public import Conjectures.HKMEhrhartPolynomialSum

public section
namespace HKMEhrhart
open Finset Polynomial
open scoped BigOperators Polynomial

abbrev BudgetData (n : ℕ) := (ℕ × ℕ) × (Fin n → ℤ)
@[expose] def budgetWeight {n : ℕ} (w : BudgetData n) : ℕ :=
  w.1.1 + w.1.2 + ∑ i,(w.2 i).natAbs
theorem budgetWeight_eq {n : ℕ} (w : BudgetData n) :
    budgetWeight w = w.1.1+w.1.2+∑ i,(w.2 i).natAbs := rfl

abbrev SignedBudget (n m : ℕ) := {w : BudgetData n // budgetWeight w < m}

theorem budgetWeight_tail {n : ℕ} (w : BudgetData (n+1)) :
    budgetWeight w = (w.2 0).natAbs + budgetWeight (w.1,fun i => w.2 i.succ) := by
  unfold budgetWeight
  rw [Fin.sum_univ_succ]
  simp only
  omega

theorem budgetWeight_cons {n : ℕ} (a : ℤ) (w : BudgetData n) :
    budgetWeight (w.1,Fin.cons a w.2) = a.natAbs + budgetWeight w := by
  rw [budgetWeight_tail]
  simp

noncomputable instance (n m : ℕ) : Fintype (SignedBudget n m) := by
  classical
  let natBox := Finset.range m
  let intBox := Finset.Icc (-(m:ℤ)) (m:ℤ)
  have h1 (w : SignedBudget n m) : w.val.1.1 ∈ natBox := by
    have h := w.property
    rw [budgetWeight_eq] at h
    exact Finset.mem_range.mpr (by omega)
  have h2 (w : SignedBudget n m) : w.val.1.2 ∈ natBox := by
    have h := w.property
    rw [budgetWeight_eq] at h
    exact Finset.mem_range.mpr (by omega)
  have h3 (w : SignedBudget n m) (i : Fin n) : w.val.2 i ∈ intBox := by
    have H := Finset.single_le_sum (fun j _ => Nat.zero_le (w.val.2 j).natAbs) (Finset.mem_univ i)
    have h := w.property
    rw [budgetWeight_eq] at h
    apply Finset.mem_Icc.mpr
    have h' : (w.val.2 i).natAbs ≤ m := by omega
    omega
  let f (w : SignedBudget n m) : (↥natBox × ↥natBox) × (Fin n → ↥intBox) :=
    ((⟨_,h1 w⟩,⟨_,h2 w⟩), fun i => ⟨_,h3 w i⟩)
  refine Fintype.ofInjective f (fun x y h => Subtype.ext ?_)
  apply Prod.ext
  · exact congrArg (fun v : (↥natBox × ↥natBox) × (Fin n → ↥intBox) =>
      (v.1.1.val,v.1.2.val)) h
  · exact congrArg (fun v : (↥natBox × ↥natBox) × (Fin n → ↥intBox) =>
      fun i => (v.2 i).val) h

def signedBudgetBaseEquiv (m : ℕ) : SignedBudget 0 (m+1) ≃ WeakComposition 3 m where
  toFun w := ⟨![w.val.1.1,w.val.1.2,m-(w.val.1.1+w.val.1.2)],by
    have h := w.property
    simp [budgetWeight] at h
    simp [Fin.sum_univ_succ]
    omega⟩
  invFun w := ⟨((w.val 0,w.val 1),Fin.elim0),by
    have h := w.property
    simp [Fin.sum_univ_succ] at h
    simp [budgetWeight]
    omega⟩
  left_inv w := by
    apply Subtype.ext
    apply Prod.ext
    · rfl
    · funext i
      exact Fin.elim0 i
  right_inv w := by
    apply Subtype.ext
    funext i
    have h := w.property
    simp [Fin.sum_univ_succ] at h
    fin_cases i
    · rfl
    · rfl
    · change m - (w.val 0 + w.val 1) = w.val 2
      omega

theorem signedBudget_card_zero_dim (m : ℕ) :
    Fintype.card (SignedBudget 0 m) = (m+1).choose 2 := by
  cases m with
  | zero =>
    have : IsEmpty (SignedBudget 0 0) := ⟨fun w => Nat.not_lt_zero _ w.property⟩
    rw [Fintype.card_of_isEmpty]
    decide
  | succ m =>
    rw [← Nat.card_eq_fintype_card,Nat.card_congr (signedBudgetBaseEquiv m),weakComposition_card]
    have h : 3+m-1=m+1+1 := by omega
    rw [h]
    have h' : m+1+1-m=2 := by omega
    simpa only [h'] using (Nat.choose_symm (n:=m+1+1) (k:=m) (by omega)).symm

def signedHead (negative : Bool) (k : ℕ) : ℤ :=
  if negative then -(k:ℤ) else (k:ℤ)

@[simp] theorem signedHead_natAbs (negative : Bool) (k : ℕ) :
    (signedHead negative k).natAbs = k := by
  cases negative <;> simp [signedHead]

theorem signedHead_is_negative (negative : Bool) {k : ℕ} (hk : 0 < k) :
    decide (signedHead negative k < 0) = negative := by
  cases negative <;> simp [signedHead,hk]

theorem signedHead_of_natAbs (a : ℤ) :
    signedHead (decide (a < 0)) a.natAbs = a := by
  unfold signedHead
  by_cases h : a < 0
  · simp only [h,decide_true,ite_true]
    omega
  · simp only [h,decide_false,Bool.false_eq_true,ite_false]
    omega

abbrev BudgetSplit (n m : ℕ) :=
  SignedBudget n m ⊕ (Σ r : Fin m, Bool × SignedBudget n r.val)

def budgetTail {n m : ℕ} (w : SignedBudget (n+1) m) : BudgetData n :=
  (w.val.1,fun i => w.val.2 i.succ)

def splitBudget {n m : ℕ} (w : SignedBudget (n+1) m) : BudgetSplit n m := by
  let k := (w.val.2 0).natAbs
  have h : k + budgetWeight (budgetTail w) < m := by
    simpa only [k,budgetTail,← budgetWeight_tail] using w.property
  by_cases hk : k = 0
  · exact Sum.inl ⟨budgetTail w,by omega⟩
  · exact Sum.inr ⟨⟨m-k,by omega⟩,decide (w.val.2 0 < 0),⟨budgetTail w,show budgetWeight (budgetTail w) < m-k by omega⟩⟩

def consBudgetData {n : ℕ} (a : ℤ) (w : BudgetData n) : BudgetData (n+1) :=
  (w.1,Fin.cons a w.2)

@[simp] theorem budgetWeight_consBudgetData {n : ℕ} (a : ℤ) (w : BudgetData n) :
    budgetWeight (consBudgetData a w) = a.natAbs+budgetWeight w :=
  budgetWeight_cons a w

def mergeBudget {n m : ℕ} : BudgetSplit n m → SignedBudget (n+1) m
  | Sum.inl w => ⟨consBudgetData 0 w.val,by simpa using w.property⟩
  | Sum.inr w =>
    ⟨consBudgetData (signedHead w.2.1 (m-w.1.val)) w.2.2.val,by
      rw [budgetWeight_consBudgetData,signedHead_natAbs]
      have h := w.2.2.property
      have h' := w.1.isLt
      omega⟩

theorem mergeBudget_splitBudget {n m : ℕ} (w : SignedBudget (n+1) m) :
    mergeBudget (splitBudget w) = w := by
  unfold splitBudget
  dsimp only
  split
  · next hh =>
    have hzero : w.val.2 0 = 0 := Int.natAbs_eq_zero.mp hh
    apply Subtype.ext
    apply Prod.ext
    · rfl
    · funext i
      refine Fin.cases ?_ (fun j => ?_) i
      · simpa [mergeBudget,consBudgetData] using hzero.symm
      · simp [mergeBudget,consBudgetData,budgetTail]
  · next hh =>
    have h := w.property
    rw [budgetWeight_tail] at h
    have hk : m-(m-(w.val.2 0).natAbs) = (w.val.2 0).natAbs := by omega
    apply Subtype.ext
    apply Prod.ext
    · rfl
    · funext i
      refine Fin.cases ?_ (fun j => ?_) i
      · simp [mergeBudget,consBudgetData,hk,signedHead_of_natAbs]
      · simp [mergeBudget,consBudgetData,budgetTail]

theorem splitBudget_mergeBudget {n m : ℕ} (w : BudgetSplit n m) :
    splitBudget (mergeBudget w) = w := by
  rcases w with w | ⟨r,b,w⟩
  · have htail : budgetTail (mergeBudget (Sum.inl w)) = w.val := by
      simp [budgetTail,mergeBudget,consBudgetData]
    have hzero : ((mergeBudget (Sum.inl w)).val.2 0).natAbs = 0 := by
      simp [mergeBudget,consBudgetData]
    unfold splitBudget
    simp only [hzero,dite_eq_left]
    exact congrArg Sum.inl (Subtype.ext htail)
  · let y : BudgetSplit n m := Sum.inr ⟨r,(b,w)⟩
    change splitBudget (mergeBudget y) = y
    have hr := r.isLt
    have hk : 0 < m-r.val := by omega
    have hhead : (mergeBudget y).val.2 0 = signedHead b (m-r.val) := by
      simp [y,mergeBudget,consBudgetData]
    have htail : budgetTail (mergeBudget y) = w.val := by
      simp [y,budgetTail,mergeBudget,consBudgetData]
    have hzero : ((mergeBudget y).val.2 0).natAbs ≠ 0 := by
      rw [hhead,signedHead_natAbs]
      omega
    unfold splitBudget
    simp only [dite_eq_right hzero]
    apply congrArg Sum.inr
    have heq : m-((mergeBudget y).val.2 0).natAbs = r.val := by
      rw [hhead,signedHead_natAbs]
      omega
    refine Sigma.ext (Fin.ext heq) ?_
    have hprod {a d : Fin m} (e : a.val = d.val)
        (u : Bool × SignedBudget n a.val) (v : Bool × SignedBudget n d.val)
        (h1 : u.1=v.1) (h2 : u.2.val=v.2.val) : HEq u v := by
      have h := Fin.ext e
      subst d
      exact heq_of_eq (Prod.ext h1 (Subtype.ext h2))
    apply hprod heq
    · change decide ((mergeBudget y).val.2 0 < 0) = b
      rw [hhead,signedHead_is_negative _ hk]
    · exact htail

def signedBudgetSuccEquiv (n m : ℕ) : SignedBudget (n+1) m ≃ BudgetSplit n m :=
  ⟨splitBudget,mergeBudget,mergeBudget_splitBudget,splitBudget_mergeBudget⟩

theorem signedBudget_card_succ_dim (n m : ℕ) :
    Fintype.card (SignedBudget (n+1) m) =
      Fintype.card (SignedBudget n m) + 2*(∑ j ∈ Finset.range m,Fintype.card (SignedBudget n j)) := by
  rw [Fintype.card_congr (signedBudgetSuccEquiv n m), Fintype.card_sum, Fintype.card_sigma]
  simp only [Fintype.card_prod,Fintype.card_bool,← Finset.mul_sum]
  exact congrArg (fun x : ℕ => Fintype.card (SignedBudget n m) + 2*x)
    (Fin.sum_univ_eq_sum_range (fun j => Fintype.card (SignedBudget n j)) m)

noncomputable def signedBudgetPolynomial : ℕ → ℚ[X]
  | 0 => (integerChoosePolynomial 2).comp (X+1)
  | n+1 => signedBudgetPolynomial n + (C 2) * prefixSumPolynomial (signedBudgetPolynomial n)

theorem signedBudgetPolynomial_eval (n m : ℕ) :
    (signedBudgetPolynomial n).eval (m:ℚ) = (Fintype.card (SignedBudget n m):ℚ) := by
  induction n generalizing m with
  | zero =>
    simp only [signedBudgetPolynomial,eval_comp,eval_add,eval_X,eval_one,signedBudget_card_zero_dim]
    rw [← Nat.cast_succ,integerChoosePolynomial_eval]
  | succ n ih =>
    rw [signedBudgetPolynomial,eval_add,eval_mul,eval_C,prefixSumPolynomial_eval,
      signedBudget_card_succ_dim]
    push_cast
    simp_rw [ih]

theorem signedBudgetPolynomial_degree (n : ℕ) :
    (signedBudgetPolynomial n).natDegree ≤ n+2 := by
  induction n with
  | zero =>
    apply natDegree_comp_le.trans
    calc
      _ ≤ 2 * 1 := Nat.mul_le_mul (integerChoosePolynomial_degree 2)
        (natDegree_add_le X 1 |>.trans (by simp))
      _ = 0+2 := rfl
  | succ n ih =>
    rw [signedBudgetPolynomial]
    apply (natDegree_add_le _ _).trans
    apply max_le
    · exact ih.trans (by omega)
    · refine natDegree_mul_le.trans ?_
      rw [natDegree_C,zero_add]
      exact (prefixSumPolynomial_degree _).trans (by omega)

end HKMEhrhart
