module

public import Conjectures.McNamaraSteingrimssonBlockAssembly
public import Conjectures.McNamaraSteingrimssonIntrinsicOmission

@[expose] public section
namespace McNamaraSteingrimsson

def replacedWidths {n : ℕ} (miss : Fin (n+1)) (A K r : ℕ) : Fin (n+2)→ℕ :=
  Fin.cases A (fun i => if i=miss then r else K)

@[simp] theorem replacedWidths_head {n A K r : ℕ} (miss : Fin (n+1)) :
    replacedWidths miss A K r 0=A := rfl

theorem replacedWidths_absent {n A K r : ℕ} (miss : Fin (n+1)) :
    replacedWidths miss A K r miss.succ=r := by
  change (if miss=miss then r else K)=r
  exact ite_eq_left rfl

theorem replacedWidths_present {n A K r : ℕ} (miss i : Fin (n+1)) (h : i≠miss) :
    replacedWidths miss A K r i.succ=K := by
  change (if i=miss then r else K)=K
  exact ite_eq_right h

theorem replacedWidths_at_eq {n A K r : ℕ} (miss i : Fin (n+1)) (h : i=miss) :
    replacedWidths miss A K r i.succ=r :=
  (congrArg (fun j => replacedWidths miss A K r j.succ) h).trans (replacedWidths_absent miss)

def replacedOrder {n A K r : ℕ} (miss : Fin (n+1))
    (a : Equiv.Perm (Fin A)) (p : Equiv.Perm (Fin K)) (x : Equiv.Perm (Fin r)) :
    BlockOrder (replacedWidths miss A K r) :=
  Fin.cases (motive := fun i => Equiv.Perm (Fin (replacedWidths miss A K r i))) a
    (fun i =>
      if h : i=miss then castPermutation (replacedWidths_at_eq miss i h).symm x
      else castPermutation (replacedWidths_present miss i h).symm p)

theorem replacedOrder_absent {n A K r : ℕ} (miss : Fin (n+1))
    (a : Equiv.Perm (Fin A)) (p : Equiv.Perm (Fin K)) (x : Equiv.Perm (Fin r)) :
    castPermutation (replacedWidths_absent miss) (replacedOrder miss a p x miss.succ)=x := by
  change castPermutation (replacedWidths_absent miss)
    (if h : miss=miss then castPermutation (replacedWidths_at_eq miss miss h).symm x
      else castPermutation (replacedWidths_present miss miss h).symm p)=x
  rw [dite_eq_left rfl,castPermutation_symm]

theorem replacedOrder_present {n A K r : ℕ} (miss i : Fin (n+1)) (h : i≠miss)
    (a : Equiv.Perm (Fin A)) (p : Equiv.Perm (Fin K)) (x : Equiv.Perm (Fin r)) :
    castPermutation (replacedWidths_present miss i h) (replacedOrder miss a p x i.succ)=p := by
  change castPermutation (replacedWidths_present miss i h)
    (if he : i=miss then castPermutation (replacedWidths_at_eq miss i he).symm x
      else castPermutation (replacedWidths_present miss i he).symm p)=p
  rw [dite_eq_right h,castPermutation_symm]

theorem replacedWidths_le {n A K r : ℕ} (miss : Fin (n+1)) (hAK : A≤K)
    (hrK : r≤K) : ∀ i,replacedWidths miss A K r i≤K := by
  intro i
  refine Fin.cases (motive := fun i => replacedWidths miss A K r i≤K) hAK
    (fun j => ?_) i
  by_cases h : j=miss
  · subst j
    rwa [replacedWidths_absent]
  · rw [replacedWidths_present miss j h]

theorem replacedWidths_card {n A K r : ℕ} (miss : Fin (n+1)) :
    Fintype.card (BlockPosition (replacedWidths miss A K r))=A+n*K+r := by
  have hc := repeatedFactor_sizes miss (rfl :
    Fintype.card (BlockPosition (replacedWidths miss A K r)) =
      Fintype.card (BlockPosition (replacedWidths miss A K r)))
    (fun j hj => replacedWidths_present miss j hj)
  simpa [replacedWidths_absent] using hc

def skipBlockLabel {n : ℕ} (miss : Fin (n+1)) : Fin (n+1)→Fin (n+2) :=
  Fin.cases 0 (fun i => (miss.succAbove i).succ)

theorem skipBlockLabel_strictMono {n : ℕ} (miss : Fin (n+1)) : StrictMono (skipBlockLabel miss) := by
  intro i j
  refine Fin.cases (motive := fun i => i<j → skipBlockLabel miss i<skipBlockLabel miss j) ?_
    (fun i => ?_) i
  · refine Fin.cases (motive := fun j => (0 : Fin (n+1)) < j →
        skipBlockLabel miss 0<skipBlockLabel miss j) (fun h => (lt_irrefl _ h).elim)
      (fun j _ => Fin.succ_pos _) j
  · refine Fin.cases (motive := fun j => i.succ < j →
        skipBlockLabel miss i.succ<skipBlockLabel miss j)
      (fun h => ((not_lt_of_ge (Fin.zero_le _)) h).elim) (fun j h => ?_) j
    exact Fin.succ_lt_succ_iff.mpr (Fin.strictMono_succAbove miss (Fin.succ_lt_succ_iff.mp h))

end McNamaraSteingrimsson
