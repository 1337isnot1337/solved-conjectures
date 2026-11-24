module

public import Conjectures.GesselZhuangHistories
public import Conjectures.GesselZhuangBlockOperations
public import Mathlib.Data.List.Range

/-!
# Gessel–Zhuang conjecture

The actual ordered blocks constructed by every finite internal-gap
history. Their flattened word is a permutation of all the exposed
labels, and deleting the latest label recovers the preceding blocks.
-/

@[expose] public section

namespace GesselZhuang

theorem cons_range_perm (n : ℕ) : (n :: List.range n).Perm (List.range (n + 1)) := by
  rw [List.range_succ]
  exact List.perm_append_comm (l₁ := [n]) (l₂ := List.range n)

namespace History

/-- Exposed values are zero-based internally; the source's labels are these values plus one. -/
def blocks : {n h : ℕ} → (p : HeightPath n h) → History p → Blocks
  | _, _, .start, _ => [[0]]
  | n + 1, _, .up p, H => upBlocks (blocks p H.1) H.2.val (n + 1)
  | n + 1, _, .flat p, H => flatBlocks (blocks p H.1) H.2.1.val (n + 1) H.2.2
  | n + 1, _, .down p, H => downBlocks (blocks p H.1) H.2.val (n + 1)

@[simp] theorem blocks_length {n h : ℕ} (p : HeightPath n h) (H : History p) :
    (blocks p H).length = h + 1 := by
  induction p with
  | start => rfl
  | @up n h p ih =>
    rw [blocks, upBlocks_length, ih]
    rw [ih]
    have := H.2.isLt
    omega
  | @flat n h p ih =>
    rw [blocks, flatBlocks_length, ih]
    rw [ih]
    exact H.2.1.isLt
  | @down n h p ih =>
    have hb := downBlocks_length (B := blocks p H.1) (x := n + 1)
      (i := H.2.val) (by rw [ih]; have := H.2.isLt; omega)
    rw [ih] at hb
    change (downBlocks (blocks p H.1) H.2.val (n + 1)).length = h + 1
    omega

theorem blocks_nonempty {n h : ℕ} (p : HeightPath n h) (H : History p) :
    NonemptyBlocks (blocks p H) := by
  induction p with
  | start => simp [blocks, NonemptyBlocks]
  | up p ih =>
    apply upBlocks_nonempty (ih H.1)
    rw [blocks_length]
    have := H.2.isLt
    omega
  | flat p ih =>
    apply flatBlocks_nonempty (ih H.1)
    rw [blocks_length]
    exact H.2.1.isLt
  | down p ih =>
    apply downBlocks_nonempty (ih H.1)
    rw [blocks_length]
    have := H.2.isLt
    omega

theorem blocks_flatten_perm {n h : ℕ} (p : HeightPath n h) (H : History p) :
    (blocks p H).flatten.Perm (List.range (n + 1)) := by
  induction p with
  | start => simp [blocks]
  | @up n h p ih =>
    apply (upBlocks_flatten_perm (B := blocks p H.1) (x := n + 1)
      (i := H.2.val) (by rw [blocks_length]; have := H.2.isLt; omega)).trans
    exact ((ih H.1).cons (n + 1)).trans (cons_range_perm (n + 1))
  | @flat n h p ih =>
    apply (flatBlocks_flatten_perm (B := blocks p H.1) (x := n + 1)
      (i := H.2.1.val) (by rw [blocks_length]; exact H.2.1.isLt) H.2.2).trans
    exact ((ih H.1).cons (n + 1)).trans (cons_range_perm (n + 1))
  | @down n h p ih =>
    apply (downBlocks_flatten_perm (B := blocks p H.1) (x := n + 1)
      (i := H.2.val) (by rw [blocks_length]; have := H.2.isLt; omega)).trans
    exact ((ih H.1).cons (n + 1)).trans (cons_range_perm (n + 1))

theorem mem_blocks_iff {n h : ℕ} (p : HeightPath n h) (H : History p) {x : ℕ} :
    x ∈ (blocks p H).flatten ↔ x < n + 1 := by
  rw [(blocks_flatten_perm p H).mem_iff]
  exact List.mem_range

theorem blocks_avoid_next {n h : ℕ} (p : HeightPath n h) (H : History p) :
    Avoids (n + 1) (blocks p H) := by
  rw [Avoids, mem_blocks_iff]
  omega

theorem blocks_recent {n h : ℕ} (p : HeightPath n h) (H : History p) :
    blockIndex n (blocks p H) = (recent p H).val := by
  cases p with
  | start => simp [blocks, recent, blockIndex]
  | up p =>
    apply blockIndex_upBlocks (blocks_avoid_next p H.1)
    rw [blocks_length]
    have := H.2.isLt
    omega
  | flat p =>
    apply blockIndex_flatBlocks (blocks_avoid_next p H.1)
    rw [blocks_length]
    exact H.2.1.isLt
  | down p =>
    apply blockIndex_downBlocks (blocks_avoid_next p H.1)
    rw [blocks_length]
    have := H.2.isLt
    omega

theorem erase_blocks_up {n h : ℕ} (p : HeightPath n h) (H : History p.up) :
    eraseBlocks (blocks p.up H) (n + 1) = blocks p H.1 := by
  apply eraseBlocks_upBlocks (blocks_nonempty p H.1) (blocks_avoid_next p H.1)
  rw [blocks_length]
  have := H.2.isLt
  omega

theorem erase_blocks_flat {n h : ℕ} (p : HeightPath n h) (H : History p.flat) :
    eraseBlocks (blocks p.flat H) (n + 1) = blocks p H.1 := by
  apply eraseBlocks_flatBlocks (blocks_nonempty p H.1) (blocks_avoid_next p H.1)
  rw [blocks_length]
  exact H.2.1.isLt

theorem erase_blocks_down {n h : ℕ} (p : HeightPath n (h + 1)) (H : History p.down) :
    eraseBlocks (blocks p.down H) (n + 1) = blocks p H.1 := by
  apply eraseBlocks_downBlocks (blocks_nonempty p H.1) (blocks_avoid_next p H.1)
  rw [blocks_length]
  have := H.2.isLt
  omega

end History

end GesselZhuang
