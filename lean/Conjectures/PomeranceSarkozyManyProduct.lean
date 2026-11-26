module
public import Conjectures.PomeranceSarkozyProductVariation

@[expose] public section
namespace PomeranceSarkozy

open Finset
open scoped BigOperators

variable {A : Type*} [Fintype A]

def tupleWeight {n : ℕ} (p : Fin n→A→ℚ) (a : Fin n→A) : ℚ :=
  ∏ i,p i (a i)

def tupleCons {n : ℕ} : A × (Fin n→A) ≃ (Fin (n+1)→A) :=
  Fin.consEquiv (fun _ => A)

omit [Fintype A] in
theorem tupleWeight_cons {n : ℕ} (p : Fin (n+1)→A→ℚ) (z : A × (Fin n→A)) :
    tupleWeight p (tupleCons z) =
      p 0 z.1*tupleWeight (fun i => p i.succ) z.2 := by
  unfold tupleWeight
  rw [Fin.prod_univ_succ]
  simp [tupleCons]

omit [Fintype A] in
theorem tupleWeight_nonneg {n : ℕ} (p : Fin n→A→ℚ) (hp : ∀ i a,0≤p i a) :
    ∀ a,0≤tupleWeight p a :=
  fun _ => Finset.prod_nonneg (fun _ _ => hp _ _)

theorem tupleWeight_sum {n : ℕ} (p : Fin n→A→ℚ)
    (hp : ∀ i,(∑ a,p i a)=1) : (∑ a,tupleWeight p a)=1 := by
  classical
  induction n with
  | zero =>
    let _ : Unique (Fin 0→A) :=
      { default := Fin.elim0
        uniq := fun a => funext fun i => Fin.elim0 i }
    simp [tupleWeight]
  | succ n ih =>
    trans ∑ z : A×(Fin n→A),p 0 z.1*tupleWeight (fun i => p i.succ) z.2
    · exact (Fintype.sum_equiv tupleCons _ _ (fun z => (tupleWeight_cons p z).symm)).symm
    · rw [pairWeight_sum (p 0) (tupleWeight (fun i => p i.succ)),hp,
        ih (fun i=>p i.succ) (fun i=>hp i.succ),mul_one]

theorem tupleWeight_l1_le {n : ℕ} (p q : Fin n→A→ℚ)
    (hp : ∀ i a,0≤p i a) (hq : ∀ i a,0≤q i a)
    (hp₁ : ∀ i,(∑ a,p i a)=1) (hq₁ : ∀ i,(∑ a,q i a)=1) :
    finiteLawL1 (tupleWeight p) (tupleWeight q)≤∑ i,finiteLawL1 (p i) (q i) := by
  classical
  induction n with
  | zero => simp [finiteLawL1,tupleWeight]
  | succ n ih =>
    let pTail := fun i : Fin n => p i.succ
    let qTail := fun i : Fin n => q i.succ
    calc
      _ = finiteLawL1 (fun z : A×(Fin n→A) => p 0 z.1*tupleWeight pTail z.2)
            (fun z => q 0 z.1*tupleWeight qTail z.2) := by
        unfold finiteLawL1
        symm
        refine Fintype.sum_equiv tupleCons _ _ ?_
        intro z
        rw [tupleWeight_cons,tupleWeight_cons]
      _ ≤ finiteLawL1 (p 0) (q 0)+finiteLawL1 (tupleWeight pTail) (tupleWeight qTail) :=
        product_finiteLawL1_le _ _ _ _ (hq 0) (tupleWeight_nonneg _ (fun i=>hp i.succ))
          (hq₁ 0) (tupleWeight_sum _ (fun i=>hp₁ i.succ))
      _ ≤ _ := by
        rw [Fin.sum_univ_succ]
        exact add_le_add_right (ih pTail qTail (fun i=>hp i.succ) (fun i=>hq i.succ)
          (fun i=>hp₁ i.succ) (fun i=>hq₁ i.succ)) _

end PomeranceSarkozy
