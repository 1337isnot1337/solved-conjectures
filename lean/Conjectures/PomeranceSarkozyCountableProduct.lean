module
public import Conjectures.PomeranceSarkozyCountableVariation

@[expose] public section
namespace PomeranceSarkozy

open scoped ENNReal BigOperators

variable {A : Type*}

def realTupleMass {n : ℕ} (p : Fin n→A→ℝ) (z : Fin n→A) : ℝ :=
  ∏ i,p i (z i)

theorem realTupleMass_nonneg {n : ℕ} (p : Fin n→A→ℝ)
    (hp : ∀ i a,0≤p i a) (z : Fin n→A) : 0≤realTupleMass p z :=
  Finset.prod_nonneg fun _ _ => hp _ _

theorem realTupleMass_cons {n : ℕ} (p : Fin (n+1)→A→ℝ) (z : A×(Fin n→A)) :
    realTupleMass p (Fin.consEquiv (fun _ => A) z) =
      p 0 z.1*realTupleMass (fun i => p i.succ) z.2 := by
  unfold realTupleMass
  rw [Fin.prod_univ_succ]
  simp

theorem realTupleMass_atomicMass {n : ℕ} (p : Fin n→A→ℝ)
    (hp : ∀ i a,0≤p i a) (hp₁ : ∀ i,atomicMass (p i)=1) :
    atomicMass (realTupleMass p)=1 := by
  induction n with
  | zero =>
    let _ : Unique (Fin 0→A) :=
      { default := Fin.elim0
        uniq := fun a => funext fun i => Fin.elim0 i }
    simp [atomicMass,realTupleMass]
  | succ n ih =>
    calc
      _ = atomicMass (fun z : A×(Fin n→A) => p 0 z.1*realTupleMass (fun i => p i.succ) z.2) := by
        unfold atomicMass
        rw [← (Fin.consEquiv (fun _ => A)).tsum_eq]
        simp_rw [realTupleMass_cons]
      _ = _ := by rw [pair_atomicMass _ _ (hp 0),hp₁,ih _ (fun i => hp i.succ)
        (fun i => hp₁ i.succ),mul_one]

theorem realTupleMass_atomicL1_le {n : ℕ} (p q : Fin n→A→ℝ)
    (hp : ∀ i a,0≤p i a) (hq : ∀ i a,0≤q i a)
    (hp₁ : ∀ i,atomicMass (p i)=1) (hq₁ : ∀ i,atomicMass (q i)=1) :
    atomicL1 (realTupleMass p) (realTupleMass q) ≤ ∑ i,atomicL1 (p i) (q i) := by
  induction n with
  | zero => simp [atomicL1,realTupleMass]
  | succ n ih =>
    let pTail := fun i : Fin n => p i.succ
    let qTail := fun i : Fin n => q i.succ
    calc
      _ = atomicL1 (fun z : A×(Fin n→A) => p 0 z.1*realTupleMass pTail z.2)
                   (fun z => q 0 z.1*realTupleMass qTail z.2) := by
        unfold atomicL1
        rw [← (Fin.consEquiv (fun _ => A)).tsum_eq]
        simp_rw [realTupleMass_cons]
        rfl
      _ ≤ atomicL1 (p 0) (q 0) + atomicL1 (realTupleMass pTail) (realTupleMass qTail) :=
        pair_atomicL1_le _ _ _ _ (hq 0) (realTupleMass_nonneg _ (fun i => hp i.succ))
          (hq₁ 0) (realTupleMass_atomicMass _ (fun i => hp i.succ) (fun i => hp₁ i.succ))
      _ ≤ _ := by
        rw [Fin.sum_univ_succ]
        exact add_le_add_right (ih pTail qTail (fun i=>hp i.succ) (fun i=>hq i.succ)
          (fun i=>hp₁ i.succ) (fun i=>hq₁ i.succ)) _

end PomeranceSarkozy
