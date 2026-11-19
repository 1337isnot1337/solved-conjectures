module

public import Conjectures.FranklCyclicRank
public import Mathlib.Data.ZMod.Basic
public import Mathlib.Data.Fintype.Pi

/-! Literal cyclic windows and their overlap transitions. Local point
positions embed into the cycle whenever the window support fits in it. -/
@[expose] public section

namespace FranklCyclic

variable {A : Type*}

def window (word : ℕ → A) (start length : ℕ) : Fin length → A :=
  fun j => word (start+j.val)

def wordPrefix {k : ℕ} (v : Fin (k+1) → A) : Fin k → A := fun j => v j.castSucc

def wordSuffix {k : ℕ} (v : Fin (k+1) → A) : Fin k → A := fun j => v j.succ

@[simp] theorem prefix_window (word : ℕ → A) (start k : ℕ) :
    wordPrefix (window word start (k+1))=window word start k := rfl

@[simp] theorem suffix_window (word : ℕ → A) (start k : ℕ) :
    wordSuffix (window word start (k+1))=window word (start+1) k := by
  funext j
  apply congrArg word
  change start+(j.val+1)=(start+1)+j.val
  omega

theorem window_periodic (word : ℕ → A) (n : ℕ)
    (hperiod : ∀ i, word (i+n)=word i) (start k : ℕ) :
    window word (start+n) k=window word start k := by
  funext j
  change word ((start+n)+j.val)=word (start+j.val)
  rw [Nat.add_right_comm start n j.val]
  exact hperiod (start+j.val)

def cyclicLift {n : ℕ} [NeZero n] (word : Fin n → A) (i : ℕ) : A :=
  word ⟨i % n,Nat.mod_lt _ (NeZero.pos n)⟩

@[simp] theorem cyclicLift_at {n : ℕ} [NeZero n] (word : Fin n → A) (i : Fin n) :
    cyclicLift word i.val=word i := by
  apply congrArg word
  apply Fin.ext
  exact Nat.mod_eq_of_lt i.isLt

theorem cyclicLift_periodic {n : ℕ} [NeZero n] (word : Fin n → A) (i : ℕ) :
    cyclicLift word (i+n)=cyclicLift word i := by
  apply congrArg word
  apply Fin.ext
  simp

theorem cyclic_windows_closed {n : ℕ} [NeZero n] (word : Fin n → A) (k : ℕ) :
    window (cyclicLift word) n k=window (cyclicLift word) 0 k := by
  simpa only [Nat.zero_add] using
    window_periodic (cyclicLift word) n (cyclicLift_periodic word) 0 k

theorem cyclic_edge_is_window_transition {n : ℕ} [NeZero n]
    (word : Fin n → A) (i k : ℕ) :
    (wordPrefix (window (cyclicLift word) i (k+1)),wordSuffix (window (cyclicLift word) i (k+1)))=
      (window (cyclicLift word) i k,window (cyclicLift word) (i+1) k) := by
  rw [prefix_window,suffix_window]

variable [DecidableEq A]

/-- A checked rank certificate on the literal overlap graph applies to a
cyclic word of any positive length; no upper bound on that length is used. -/
theorem cyclic_word_zero_of_checked_edges {n k : ℕ} [NeZero n]
    (hk : 0 < k) (word : Fin n → A) (z : A)
    (edges : Finset ((Fin k → A) × (Fin k → A))) (rank : (Fin k → A) → ℕ)
    (hc : rankCertificateCheck edges {((fun _ => z),(fun _ => z))} rank=true)
    (hwalk : ∀ i < n,
      (window (cyclicLift word) i k,window (cyclicLift word) (i+1) k) ∈ edges) :
    ∀ i, word i=z := by
  have hzero := checked_closed_walk_single_loop (fun _ : Fin k => z) hc
    (fun i => window (cyclicLift word) i k) n (cyclic_windows_closed word k) hwalk
  intro i
  have hcoord := congrFun (hzero i.val i.isLt).1 ⟨0,hk⟩
  simpa only [window,Nat.add_zero,cyclicLift_at] using hcoord

/-- If the word is not identically zero, the checked graph certificate
forces one of the successful local transitions. -/
theorem cyclic_word_has_success {n k : ℕ} [NeZero n]
    (hk : 0 < k) (word : Fin n → A) (z : A)
    (edges : Finset ((Fin k → A) × (Fin k → A)))
    (success : (Fin k → A) × (Fin k → A) → Prop) [DecidablePred success]
    (rank : (Fin k → A) → ℕ)
    (hc : rankCertificateCheck (edges.filter (fun e => ¬ success e))
      {((fun _ => z),(fun _ => z))} rank=true)
    (hwalk : ∀ i < n,
      (window (cyclicLift word) i k,window (cyclicLift word) (i+1) k) ∈ edges)
    (hnonzero : ∃ i, word i ≠ z) :
    ∃ i < n, success
      (window (cyclicLift word) i k,window (cyclicLift word) (i+1) k) := by
  apply checked_closed_walk_has_success edges success rank (fun _ : Fin k => z) hc
    (fun i => window (cyclicLift word) i k) n (cyclic_windows_closed word k) hwalk
  obtain ⟨i,hi⟩ := hnonzero
  refine ⟨i.val,i.isLt,?_⟩
  intro h
  apply hi
  have hcoord := congrFun h ⟨0,hk⟩
  simpa only [window,Nat.add_zero,cyclicLift_at] using hcoord

/-- Consecutive positions of a support window remain distinct after
wrapping around a cycle of at least the support length. -/
def positionEmbedding {n m : ℕ} (start : ZMod n) (hm : m ≤ n) : Fin m ↪ ZMod n where
  toFun j := start+(j.val:ZMod n)
  inj' := by
    intro i j h
    apply Fin.ext
    have hv := congrArg ZMod.val (add_left_cancel h)
    simpa only [ZMod.val_natCast_of_lt (lt_of_lt_of_le i.isLt hm),
      ZMod.val_natCast_of_lt (lt_of_lt_of_le j.isLt hm)] using hv

@[simp] theorem positionEmbedding_apply {n m : ℕ} (start : ZMod n) (hm : m ≤ n)
    (j : Fin m) : positionEmbedding start hm j=start+(j.val:ZMod n) := rfl

def coreEmbedding (w : ℕ) : Fin w ↪ Fin (w+6) where
  toFun i := ⟨i.val+3,by omega⟩
  inj' := by intro i j h; apply Fin.ext; have hv := congrArg Fin.val h; simp at hv; omega

def windowCore (w : ℕ) : Finset (Fin (w+6)) := Finset.univ.map (coreEmbedding w)

@[simp] theorem windowCore_card (w : ℕ) : (windowCore w).card=w := by
  simp [windowCore]

theorem mem_windowCore (w : ℕ) (j : Fin (w+6)) :
    j ∈ windowCore w ↔ 3 ≤ j.val ∧ j.val < w+3 := by
  constructor
  · intro hj
    obtain ⟨i,_,rfl⟩ := Finset.mem_map.mp hj
    change 3 ≤ i.val+3 ∧ i.val+3 < w+3
    omega
  · intro hj
    refine Finset.mem_map.mpr ⟨⟨j.val-3,by omega⟩,Finset.mem_univ _,?_⟩
    apply Fin.ext
    change j.val-3+3=j.val
    omega

theorem exterior_windowCore_card (w : ℕ) :
    ((Finset.univ:Finset (Fin (w+6))) \ windowCore w).card=6 := by
  rw [Finset.card_sdiff_of_subset (Finset.subset_univ _),Finset.card_univ,windowCore_card]
  simp

end FranklCyclic
