import Mathlib.Combinatorics.Enumerative.Partition.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Multiset
import Mathlib.Data.Multiset.Filter
import Mathlib.Data.Fintype.Prod
import Mathlib.Data.Fintype.Pi
import Lean.Elab.Tactic.Omega

/-! The exact multiplicity loss when small parts are deleted from a family
of ordinary partitions. This is the counting input to the rectangle packing
injection; it holds for every finite family, without an asymptotic premise. -/
namespace RectangleFinite

def largeParts {T : ℕ} (a : ℕ) (p : Nat.Partition T) : Multiset ℕ :=
  p.parts.filter (fun b => a ≤ b)

theorem partition_count_le {T : ℕ} (p : Nat.Partition T) (b : ℕ) :
    p.parts.count b ≤ T := by
  have hc : p.parts.card ≤ p.parts.sum := by
    simpa using (Multiset.card_nsmul_le_sum (a := (1 : ℕ))
      (s := p.parts) (fun j hj => p.parts_pos hj))
  have hc' : p.parts.card ≤ T := by simpa only [p.parts_sum] using hc
  exact (Multiset.count_le_card b p.parts).trans hc'

def smallCode {T : ℕ} (a : ℕ) (p : Nat.Partition T) : Fin (a-1) → Fin (T+1) :=
  fun i => ⟨p.parts.count (i.val+1),by have := partition_count_le p (i.val+1); omega⟩

theorem largeParts_smallCode_injective {T a : ℕ} (ha : 0 < a) :
    Function.Injective (fun p : Nat.Partition T => (largeParts a p,smallCode a p)) := by
  intro p q he
  have hlarge : largeParts a p=largeParts a q := congrArg Prod.fst he
  have hsmall : smallCode a p=smallCode a q := congrArg Prod.snd he
  apply Nat.Partition.ext
  apply Multiset.ext.mpr
  intro b
  by_cases hb : b=0
  · subst b
    have hp : 0 ∉ p.parts := fun h => (Nat.lt_irrefl 0) (p.parts_pos h)
    have hq : 0 ∉ q.parts := fun h => (Nat.lt_irrefl 0) (q.parts_pos h)
    simp [hp,hq]
  · by_cases hba : a ≤ b
    · have hc := congrArg (Multiset.count b) hlarge
      simpa [largeParts,Multiset.count_filter,hba] using hc
    · let i : Fin (a-1) := ⟨b-1,by omega⟩
      have hc := congrArg (fun f : Fin (a-1) → Fin (T+1) => (f i).val) hsmall
      have hi : i.val+1=b := by dsimp [i]; omega
      simpa [smallCode,hi] using hc

/-- At most `(T+1)^(a-1)` original partitions have any one retained multiset.
The equivalent product bound avoids division and is exact in natural numbers. -/
theorem deletion_count_bound {T a : ℕ} (ha : 0 < a)
    (S : Finset (Nat.Partition T)) :
    S.card ≤ (S.image (largeParts a)).card * (T+1)^(a-1) := by
  classical
  let f : S → (S.image (largeParts a)) × (Fin (a-1) → Fin (T+1)) :=
    fun p => (⟨largeParts a p.val,Finset.mem_image.mpr ⟨p.val,p.property,rfl⟩⟩,
      smallCode a p.val)
  have hf : Function.Injective f := by
    intro p q he
    apply Subtype.ext
    apply largeParts_smallCode_injective ha
    have hl : largeParts a p.val=largeParts a q.val :=
      congrArg (fun x : (S.image (largeParts a)) × (Fin (a-1) → Fin (T+1)) => x.1.val) he
    have hs : smallCode a p.val=smallCode a q.val :=
      congrArg (fun x : (S.image (largeParts a)) × (Fin (a-1) → Fin (T+1)) => x.2) he
    exact Prod.ext hl hs
  have h := Fintype.card_le_of_injective f hf
  simpa using h

theorem largeParts_sum_le {T : ℕ} (a : ℕ) (p : Nat.Partition T) :
    (largeParts a p).sum ≤ T := by
  calc
    (largeParts a p).sum ≤ p.parts.sum := by
      have h := congrArg Multiset.sum (Multiset.filter_add_not (fun b => a ≤ b) p.parts)
      rw [Multiset.sum_add] at h
      change (p.parts.filter (fun b => a ≤ b)).sum ≤ p.parts.sum
      omega
    _ = T := p.parts_sum

theorem largeParts_bounds {T a M : ℕ} (p : Nat.Partition T)
    (hM : ∀ b ∈ p.parts, b ≤ M) {b : ℕ} (hb : b ∈ largeParts a p) :
    a ≤ b ∧ b ≤ M := by
  obtain ⟨hm,ha⟩ := Multiset.mem_filter.mp hb
  exact ⟨ha,hM b hm⟩

end RectangleFinite
