module

public import Conjectures.McNamaraSteingrimssonCanonicalComponents

@[expose] public section
namespace McNamaraSteingrimsson

@[simp] theorem blockOffset_head {s : ℕ} (w : Fin (s+1)→ℕ) : blockOffset w 0=0 := by
  simp [blockOffset]

theorem blockOffset_first_tail {s : ℕ} (w : Fin (s+2)→ℕ) :
    blockOffset w (0 : Fin (s+1)).succ=w 0 := by
  unfold blockOffset
  have h : (Finset.univ.filter (· < (0 : Fin (s+1)).succ) : Finset (Fin (s+2))) = {0} := by
    ext j
    simp only [Finset.mem_filter,Finset.mem_univ,true_and,Finset.mem_singleton]
    rw [Fin.lt_def,Fin.val_succ,Fin.val_zero]
    constructor
    · intro h
      apply Fin.ext
      change j.val=0
      omega
    · rintro rfl
      exact Nat.zero_lt_one
  rw [h,Finset.sum_singleton]

/-- Given a positive interior rank, retaining both variable initial
fibers cannot produce a full long canonical component at the usual
start of the first long block. This separates first-omission elements
from every later-omission family. -/
theorem first_omission_no_component_at_short_width {n A K r : ℕ}
    {w : Fin (n+2)→ℕ} (hB : ∀ i,w i≤K) (p : BlockOrder w)
    (hAK : A<K) (hr : 0<r) (hK : r<K)
    (hhead : w 0≤A) (hwidth : w 0+w (0 : Fin (n+1)).succ=A+r) :
    ¬CanonicalComponent (blockPermutation hB p) A (A+K) := by
  intro h
  obtain ⟨i,hi,hstart⟩ := canonicalComponent_width_max hB p h
  let first : Fin (n+2) := (0 : Fin (n+1)).succ
  by_cases h0 : i=0
  · rw [h0] at hi
    omega
  by_cases h1 : i=first
  · rw [h1] at hi hstart
    change blockOffset w (0 : Fin (n+1)).succ=A at hstart
    rw [blockOffset_first_tail] at hstart
    change w (0 : Fin (n+1)).succ=K at hi
    omega
  have hlt : first < i := by
    change 1 < i.val
    have hne : i.val≠0 := fun e => h0 (Fin.ext e)
    have hne' : i.val≠1 := fun e => h1 (Fin.ext e)
    omega
  have hn := blockOffset_add_le_next w hlt
  change blockOffset w (0 : Fin (n+1)).succ+w (0 : Fin (n+1)).succ ≤ _ at hn
  rw [blockOffset_first_tail, hwidth,hstart] at hn
  omega

theorem later_omission_component_at_short_width {n A K : ℕ} {w : Fin (n+2)→ℕ}
    (hB : ∀ i,w i≤K) (p : BlockOrder w) (hK : 0<K)
    (hhead : w 0=A) (hfirst : w (0 : Fin (n+1)).succ=K)
    (hp : BeginsWithMaximum (p (0 : Fin (n+1)).succ)) :
    CanonicalComponent (blockPermutation hB p) A (A+K) := by
  have h := canonicalComponent_full_firstMax_block hB p (0 : Fin (n+1)).succ
    (hfirst.symm ▸ hK) hp
  rwa [blockOffset_first_tail,hhead,hfirst] at h

end McNamaraSteingrimsson
