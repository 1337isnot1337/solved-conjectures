import Conjectures.LonelinessRenaultPreliminaries
import Conjectures.LonelinessNormalization
import Mathlib.Logic.Equiv.Basic

/-! Relabeling preserves the real-time statement, primitive speeds, and counts. -/

namespace Loneliness.Renault

theorem allSafe_reindex_iff (v : Fin 5 → ℕ) (σ : Equiv.Perm (Fin 5)) (t : ℝ) :
    AllSafe (v ∘ σ) t ↔ AllSafe v t := by
  constructor
  · intro h i
    simpa only [Function.comp_apply, Equiv.apply_symm_apply] using h (σ.symm i)
  · intro h i
    exact h (σ i)

theorem exists_allSafe_reindex_iff (v : Fin 5 → ℕ) (σ : Equiv.Perm (Fin 5)) :
    (∃ t : ℝ, AllSafe (v ∘ σ) t) ↔ ∃ t : ℝ, AllSafe v t := by
  exact exists_congr fun t => allSafe_reindex_iff v σ t

theorem foldr_gcd_ofFn_reindex {n : ℕ} (v : Fin n → ℕ) (σ : Equiv.Perm (Fin n)) :
    (List.ofFn (v ∘ σ)).foldr Nat.gcd 0 = (List.ofFn v).foldr Nat.gcd 0 := by
  apply Nat.dvd_antisymm
  · apply CriticalFamilies.dvd_gcd_fold
    intro a ha
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
    apply Normalization.gcd_dvd_mem
    exact List.mem_ofFn.mpr ⟨σ.symm i, by simp⟩
  · apply CriticalFamilies.dvd_gcd_fold
    intro a ha
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
    apply Normalization.gcd_dvd_mem
    exact List.mem_ofFn.mpr ⟨σ i, rfl⟩

theorem primitive_reindex_iff {n : ℕ} (v : Fin n → ℕ) (σ : Equiv.Perm (Fin n)) :
    (List.ofFn (v ∘ σ)).foldr Nat.gcd 0 = 1 ↔ (List.ofFn v).foldr Nat.gcd 0 = 1 := by
  rw [foldr_gcd_ofFn_reindex]

theorem card_filter_equiv {α β : Type*} [Fintype α] [Fintype β]
    [DecidableEq α] [DecidableEq β] (σ : α ≃ β) (p : β → Prop) [DecidablePred p] :
    (Finset.univ.filter fun i : α => p (σ i)).card =
      (Finset.univ.filter p).card := by
  exact Finset.card_bijective σ σ.bijective (by intro i; simp)

theorem exists_reindex_two (i j : Fin 5) (hij : i ≠ j) :
    ∃ σ : Equiv.Perm (Fin 5), σ 0 = i ∧ σ 1 = j := by
  let p : Equiv.Perm (Fin 5) := Equiv.swap 0 i
  let k : Fin 5 := p j
  have hp0 : p 0 = i := Equiv.swap_apply_left 0 i
  have hpk : p k = j := Equiv.swap_apply_self 0 i j
  have hk0 : k ≠ 0 := by
    intro h
    have hp := congrArg p h
    rw [hpk, hp0] at hp
    exact hij hp.symm
  let q : Equiv.Perm (Fin 5) := Equiv.swap 1 k
  have hq0 : q 0 = 0 := Equiv.swap_apply_of_ne_of_ne (by decide) (Ne.symm hk0)
  have hq1 : q 1 = k := Equiv.swap_apply_left 1 k
  refine ⟨q.trans p, ?_, ?_⟩
  · change p (q 0) = i
    rw [hq0, hp0]
  · change p (q 1) = j
    rw [hq1, hpk]

end Loneliness.Renault
