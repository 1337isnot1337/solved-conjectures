module

public import Conjectures.GesselZhuangBlocks

/-!
# Gessel–Zhuang conjecture

Lengths, literal-word preservation, and inverse laws for insertion into
the nonempty block representation of internal gaps.
-/

@[expose] public section

namespace GesselZhuang

theorem blocks_split_at {B : Blocks} {i : ℕ} (hi : i ≤ B.length) :
    ∃ A C : Blocks, B = A ++ C ∧ A.length = i := by
  exact ⟨B.take i, B.drop i, (List.take_append_drop i B).symm,
    by simp [List.length_take, Nat.min_eq_left hi]⟩

theorem blocks_split_one {B : Blocks} {i : ℕ} (hi : i < B.length) :
    ∃ (A C : Blocks) (b : List ℕ), B = A ++ b :: C ∧ A.length = i := by
  refine ⟨B.take i, B.drop (i + 1), B[i], ?_, ?_⟩
  · rw [← List.drop_eq_getElem_cons hi, List.take_append_drop]
  · simp [List.length_take, Nat.min_eq_left (by omega : i ≤ B.length)]

theorem blocks_split_two {B : Blocks} {i : ℕ} (hi : i + 1 < B.length) :
    ∃ (A C : Blocks) (b c : List ℕ), B = A ++ b :: c :: C ∧ A.length = i := by
  refine ⟨B.take i, B.drop (i + 2), B[i]'(by omega), B[i + 1], ?_, ?_⟩
  · rw [show i + 2 = (i + 1) + 1 by omega, ← List.drop_eq_getElem_cons hi,
      ← List.drop_eq_getElem_cons (by omega : i < B.length), List.take_append_drop]
  · simp [List.length_take, Nat.min_eq_left (by omega : i ≤ B.length)]

theorem upBlocks_length {B : Blocks} {i x : ℕ} (hi : i ≤ B.length) :
    (upBlocks B i x).length = B.length + 1 := by
  rcases blocks_split_at hi with ⟨A, C, rfl, rfl⟩
  simp [upBlocks_append, Nat.add_assoc]

theorem flatBlocks_length {B : Blocks} {i x : ℕ} (hi : i < B.length) (e : Bool) :
    (flatBlocks B i x e).length = B.length := by
  rcases blocks_split_one hi with ⟨A, C, b, rfl, rfl⟩
  simp [flatBlocks_append]

theorem downBlocks_length {B : Blocks} {i x : ℕ} (hi : i + 1 < B.length) :
    (downBlocks B i x).length + 1 = B.length := by
  rcases blocks_split_two hi with ⟨A, C, b, c, rfl, rfl⟩
  simp [downBlocks_append]
  omega

theorem upBlocks_nonempty {B : Blocks} {i x : ℕ}
    (hB : NonemptyBlocks B) (hi : i ≤ B.length) : NonemptyBlocks (upBlocks B i x) := by
  rcases blocks_split_at hi with ⟨A, C, rfl, rfl⟩
  rw [upBlocks_append]
  simp only [nonemptyBlocks_append] at hB ⊢
  exact ⟨⟨hB.1, by simp [NonemptyBlocks]⟩, hB.2⟩

theorem flatBlocks_nonempty {B : Blocks} {i x : ℕ}
    (hB : NonemptyBlocks B) (hi : i < B.length) (e : Bool) :
    NonemptyBlocks (flatBlocks B i x e) := by
  rcases blocks_split_one hi with ⟨A, C, b, rfl, rfl⟩
  rw [flatBlocks_append]
  have hA := (nonemptyBlocks_append.mp hB).1
  have hC : NonemptyBlocks C := fun c hc => hB c (by simp [hc])
  apply nonemptyBlocks_append.mpr
  refine ⟨nonemptyBlocks_append.mpr ⟨hA, ?_⟩, hC⟩
  cases e <;> simp [NonemptyBlocks]

theorem downBlocks_nonempty {B : Blocks} {i x : ℕ}
    (hB : NonemptyBlocks B) (hi : i + 1 < B.length) : NonemptyBlocks (downBlocks B i x) := by
  rcases blocks_split_two hi with ⟨A, C, b, c, rfl, rfl⟩
  rw [downBlocks_append]
  have hA := (nonemptyBlocks_append.mp hB).1
  have hC : NonemptyBlocks C := fun d hd => hB d (by simp [hd])
  apply nonemptyBlocks_append.mpr
  refine ⟨nonemptyBlocks_append.mpr ⟨hA, ?_⟩, hC⟩
  simp [NonemptyBlocks]

theorem upBlocks_flatten_perm {B : Blocks} {i x : ℕ} (hi : i ≤ B.length) :
    (upBlocks B i x).flatten.Perm (x :: B.flatten) := by
  rcases blocks_split_at hi with ⟨A, C, rfl, rfl⟩
  rw [upBlocks_append]
  simp

theorem flatBlocks_flatten_perm {B : Blocks} {i x : ℕ}
    (hi : i < B.length) (e : Bool) :
    (flatBlocks B i x e).flatten.Perm (x :: B.flatten) := by
  rcases blocks_split_one hi with ⟨A, C, b, rfl, rfl⟩
  rw [flatBlocks_append]
  cases e
  · simpa [List.append_assoc] using
      (List.perm_middle (a := x) (l₁ := A.flatten ++ b) (l₂ := C.flatten))
  · simp

theorem downBlocks_flatten_perm {B : Blocks} {i x : ℕ} (hi : i + 1 < B.length) :
    (downBlocks B i x).flatten.Perm (x :: B.flatten) := by
  rcases blocks_split_two hi with ⟨A, C, b, c, rfl, rfl⟩
  rw [downBlocks_append]
  simpa [List.append_assoc] using
    (List.perm_middle (a := x) (l₁ := A.flatten ++ b) (l₂ := c ++ C.flatten))

theorem eraseBlocks_upBlocks {B : Blocks} {i x : ℕ}
    (hB : NonemptyBlocks B) (hx : Avoids x B) (hi : i ≤ B.length) :
    eraseBlocks (upBlocks B i x) x = B := by
  rcases blocks_split_at hi with ⟨A, C, rfl, rfl⟩
  rw [upBlocks_append]
  exact eraseBlocks_up (nonemptyBlocks_append.mp hB).1 (nonemptyBlocks_append.mp hB).2
    (avoids_append.mp hx).1 (avoids_append.mp hx).2

theorem eraseBlocks_flatBlocks {B : Blocks} {i x : ℕ}
    (hB : NonemptyBlocks B) (hx : Avoids x B) (hi : i < B.length) (e : Bool) :
    eraseBlocks (flatBlocks B i x e) x = B := by
  rcases blocks_split_one hi with ⟨A, C, b, rfl, rfl⟩
  rw [flatBlocks_append]
  have hA := (nonemptyBlocks_append.mp hB).1
  have hC : NonemptyBlocks C := fun c hc => hB c (by simp [hc])
  have hb : b ≠ [] := hB b (by simp)
  have hxA := (avoids_append.mp hx).1
  have hxC : Avoids x C := avoids_iff.mpr fun c hc => (avoids_iff.mp hx) c (by simp [hc])
  have hxb : x ∉ b := (avoids_iff.mp hx) b (by simp)
  cases e
  · simpa using eraseBlocks_flat_right hA hC hb hxA hxC hxb
  · simpa using eraseBlocks_flat_left hA hC hb hxA hxC hxb

theorem eraseBlocks_downBlocks {B : Blocks} {i x : ℕ}
    (hB : NonemptyBlocks B) (hx : Avoids x B) (hi : i + 1 < B.length) :
    eraseBlocks (downBlocks B i x) x = B := by
  rcases blocks_split_two hi with ⟨A, C, b, c, rfl, rfl⟩
  rw [downBlocks_append]
  have hA := (nonemptyBlocks_append.mp hB).1
  have hC : NonemptyBlocks C := fun d hd => hB d (by simp [hd])
  have hb : b ≠ [] := hB b (by simp)
  have hc : c ≠ [] := hB c (by simp)
  have hxA := (avoids_append.mp hx).1
  have hxC : Avoids x C := avoids_iff.mpr fun d hd => (avoids_iff.mp hx) d (by simp [hd])
  have hxb : x ∉ b := (avoids_iff.mp hx) b (by simp)
  have hxc : x ∉ c := (avoids_iff.mp hx) c (by simp)
  simpa using eraseBlocks_down hA hC hb hc hxA hxC hxb hxc

theorem blockIndex_upBlocks {B : Blocks} {i x : ℕ}
    (hx : Avoids x B) (hi : i ≤ B.length) : blockIndex x (upBlocks B i x) = i := by
  rcases blocks_split_at hi with ⟨A, C, rfl, rfl⟩
  rw [upBlocks_append, List.append_assoc, List.singleton_append]
  exact blockIndex_append (avoids_append.mp hx).1 (by simp)

theorem blockIndex_flatBlocks {B : Blocks} {i x : ℕ}
    (hx : Avoids x B) (hi : i < B.length) (e : Bool) :
    blockIndex x (flatBlocks B i x e) = i := by
  rcases blocks_split_one hi with ⟨A, C, b, rfl, rfl⟩
  rw [flatBlocks_append, List.append_assoc, List.singleton_append]
  apply blockIndex_append (avoids_append.mp hx).1
  cases e <;> simp

theorem blockIndex_downBlocks {B : Blocks} {i x : ℕ}
    (hx : Avoids x B) (hi : i + 1 < B.length) : blockIndex x (downBlocks B i x) = i := by
  rcases blocks_split_two hi with ⟨A, C, b, c, rfl, rfl⟩
  rw [downBlocks_append, List.append_assoc, List.singleton_append]
  exact blockIndex_append (avoids_append.mp hx).1 (by simp)

end GesselZhuang
