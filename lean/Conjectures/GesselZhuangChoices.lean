module

public import Conjectures.GesselZhuangBlockOperations

/-!
# Gessel–Zhuang conjecture

All one-step insertions into a fixed nonempty block state are distinct.
The latest block index determines the chosen position; at a flat step,
the old block is nonempty and avoids the new value, so its two ends differ.
-/

@[expose] public section

namespace GesselZhuang

theorem flatBlocks_bool_injective {B : Blocks} {i x : ℕ}
    (hne : NonemptyBlocks B) (hx : Avoids x B) (hi : i < B.length) :
    Function.Injective (flatBlocks B i x) := by
  rcases blocks_split_one hi with ⟨A, C, b, rfl, rfl⟩
  intro e f heq
  rw [flatBlocks_append, flatBlocks_append] at heq
  have hnew := List.singleton_inj.mp
    (List.append_cancel_left (List.append_cancel_right heq))
  have hb : b ≠ [] := hne b (by simp)
  have hxb : x ∉ b := (avoids_iff.mp hx) b (by simp)
  rcases List.exists_cons_of_ne_nil hb with ⟨a, b, rfl⟩
  cases e <;> cases f
  · rfl
  · have hax : a = x := (List.cons.inj hnew).1
    exact False.elim (hxb (by simp [hax]))
  · have hxa : x = a := (List.cons.inj hnew).1
    exact False.elim (hxb (by simp [hxa]))
  · rfl

theorem downBlocks_length_eq {B : Blocks} {i x : ℕ} (hi : i + 1 < B.length) :
    (downBlocks B i x).length = B.length - 1 := by
  have h := downBlocks_length (x := x) hi
  omega

inductive InsertionChoice (h : ℕ) : Type
  | up : Fin (h + 2) → InsertionChoice h
  | flat : Fin (h + 1) → Bool → InsertionChoice h
  | down : Fin h → InsertionChoice h
  deriving DecidableEq

namespace InsertionChoice

def act {h : ℕ} (B : Blocks) (x : ℕ) : InsertionChoice h → Blocks
  | .up i => upBlocks B i.val x
  | .flat i e => flatBlocks B i.val x e
  | .down i => downBlocks B i.val x

theorem erase_act {h : ℕ} {B : Blocks} {x : ℕ} (hlen : B.length = h + 1)
    (hne : NonemptyBlocks B) (hx : Avoids x B) (c : InsertionChoice h) :
    eraseBlocks (c.act B x) x = B := by
  cases c with
  | up i => exact eraseBlocks_upBlocks hne hx (by rw [hlen]; have := i.isLt; omega)
  | flat i e => exact eraseBlocks_flatBlocks hne hx (by rw [hlen]; exact i.isLt) e
  | down i => exact eraseBlocks_downBlocks hne hx (by rw [hlen]; have := i.isLt; omega)

theorem act_injective {h : ℕ} {B : Blocks} {x : ℕ} (hlen : B.length = h + 1)
    (hne : NonemptyBlocks B) (hx : Avoids x B) : Function.Injective (act (h := h) B x) := by
  have hu (i : Fin (h + 2)) : i.val ≤ B.length := by rw [hlen]; have := i.isLt; omega
  have hf (i : Fin (h + 1)) : i.val < B.length := by rw [hlen]; exact i.isLt
  have hd (i : Fin h) : i.val + 1 < B.length := by rw [hlen]; have := i.isLt; omega
  intro c d heq
  have hl := congrArg List.length heq
  have hi := congrArg (blockIndex x) heq
  cases c with
  | up i =>
    cases d with
    | up j =>
      have hij : i = j := by
        apply Fin.ext
        simpa only [act, blockIndex_upBlocks hx (hu i),
          blockIndex_upBlocks hx (hu j)] using hi
      exact congrArg InsertionChoice.up hij
    | flat j e =>
      simp only [act, upBlocks_length (hu i), flatBlocks_length (hf j)] at hl
      omega
    | down j =>
      simp only [act, upBlocks_length (hu i), downBlocks_length_eq (hd j)] at hl
      omega
  | flat i e =>
    cases d with
    | up j =>
      simp only [act, flatBlocks_length (hf i), upBlocks_length (hu j)] at hl
      omega
    | flat j f =>
      have hij : i = j := by
        apply Fin.ext
        simpa only [act, blockIndex_flatBlocks hx (hf i),
          blockIndex_flatBlocks hx (hf j)] using hi
      subst j
      have hef := flatBlocks_bool_injective hne hx (hf i) heq
      cases hef
      rfl
    | down j =>
      simp only [act, flatBlocks_length (hf i), downBlocks_length_eq (hd j)] at hl
      omega
  | down i =>
    cases d with
    | up j =>
      simp only [act, downBlocks_length_eq (hd i), upBlocks_length (hu j)] at hl
      omega
    | flat j e =>
      simp only [act, downBlocks_length_eq (hd i), flatBlocks_length (hf j)] at hl
      omega
    | down j =>
      have hij : i = j := by
        apply Fin.ext
        simpa only [act, blockIndex_downBlocks hx (hd i),
          blockIndex_downBlocks hx (hd j)] using hi
      exact congrArg InsertionChoice.down hij

end InsertionChoice

end GesselZhuang
