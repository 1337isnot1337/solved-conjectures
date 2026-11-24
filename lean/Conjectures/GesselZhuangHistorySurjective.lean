module

public import Conjectures.GesselZhuangHistoryBlocks

/-!
# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

Every literal permutation word with nonempty internal blocks is constructed
by an insertion history. Deleting the maximum gives the four exhaustive cases:
a singleton block, its left end, its right end, or its strict interior.
-/

@[expose] public section

namespace GesselZhuang

private theorem surj_nonempty_cons {b : List ℕ} {B : Blocks}
    (hb : b ≠ []) (hB : NonemptyBlocks B) : NonemptyBlocks (b :: B) := by
  intro c hc
  rcases List.mem_cons.mp hc with rfl | hc
  · exact hb
  · exact hB c hc

private theorem surj_singleton_blocks {B : Blocks} (hne : NonemptyBlocks B)
    (hf : B.flatten = [0]) : B = [[0]] := by
  obtain ⟨A, C, rfl, hA, hC⟩ := List.flatten_eq_singleton_iff.mp hf
  have hAnil : A = [] := by
    cases A with
    | nil => rfl
    | cons a A => exact False.elim (hne a (by simp) (hA a (by simp)))
  have hCnil : C = [] := by
    cases C with
    | nil => rfl
    | cons c C => exact False.elim (hne c (by simp) (hC c (by simp)))
  simp [hAnil, hCnil]

private theorem surj_remove_max_perm {n : ℕ} (A C : Blocks) (L R : List ℕ)
    (hp : (A ++ (L ++ (n + 1) :: R) :: C).flatten.Perm (List.range (n + 2))) :
    (A.flatten ++ L ++ R ++ C.flatten).Perm (List.range (n + 1)) := by
  have hmove : ((n + 1) :: (A.flatten ++ L ++ R ++ C.flatten)).Perm
      (A ++ (L ++ (n + 1) :: R) :: C).flatten := by
    simpa [List.append_assoc] using
      (List.perm_middle (a := n + 1) (l₁ := A.flatten ++ L)
        (l₂ := R ++ C.flatten)).symm
  exact ((hmove.trans hp).trans (cons_range_perm (n + 1)).symm).cons_inv

/-- Constructive onto direction of the insertion-history correspondence. -/
theorem blocks_surjective {n : ℕ} (B : Blocks) (hne : NonemptyBlocks B)
    (hp : B.flatten.Perm (List.range (n + 1))) :
    ∃ h, ∃ p : HeightPath n h, ∃ H : History p, History.blocks p H = B := by
  induction n generalizing B with
  | zero =>
      have hf : B.flatten = [0] := List.Perm.eq_singleton (by simpa using hp)
      rw [surj_singleton_blocks hne hf]
      exact ⟨0, .start, (), rfl⟩
  | succ n ih =>
      have hx : n + 1 ∈ B.flatten := hp.mem_iff.mpr (List.mem_range.mpr (by omega))
      obtain ⟨b, hb, hxb⟩ := List.mem_flatten.mp hx
      obtain ⟨A, C, rfl⟩ := List.append_of_mem hb
      obtain ⟨L, R, rfl⟩ := List.append_of_mem hxb
      have hA : NonemptyBlocks A := fun a ha => hne a (by simp [ha])
      have hC : NonemptyBlocks C := fun c hc => hne c (by simp [hc])
      have hparent := surj_remove_max_perm A C L R hp
      by_cases hL : L = []
      · subst L
        by_cases hR : R = []
        · subst R
          have hne' : NonemptyBlocks (A ++ C) := nonemptyBlocks_append.mpr ⟨hA, hC⟩
          have hp' : (A ++ C).flatten.Perm (List.range (n + 1)) := by
            simpa using hparent
          obtain ⟨h, p, H, hblocks⟩ := ih (A ++ C) hne' hp'
          have hlen := History.blocks_length p H
          rw [hblocks, List.length_append] at hlen
          let i : Fin (h + 2) := ⟨A.length, by omega⟩
          refine ⟨h + 1, p.up, (H, i), ?_⟩
          change upBlocks (History.blocks p H) A.length (n + 1) = _
          rw [hblocks, upBlocks_append]
          simp
        · have hne' : NonemptyBlocks (A ++ R :: C) :=
            nonemptyBlocks_append.mpr ⟨hA, surj_nonempty_cons hR hC⟩
          have hp' : (A ++ R :: C).flatten.Perm (List.range (n + 1)) := by
            simpa [List.append_assoc] using hparent
          obtain ⟨h, p, H, hblocks⟩ := ih (A ++ R :: C) hne' hp'
          have hlen := History.blocks_length p H
          rw [hblocks, List.length_append, List.length_cons] at hlen
          let i : Fin (h + 1) := ⟨A.length, by omega⟩
          refine ⟨h, p.flat, (H, (i, true)), ?_⟩
          change flatBlocks (History.blocks p H) A.length (n + 1) true = _
          rw [hblocks, flatBlocks_append]
          simp
      · by_cases hR : R = []
        · subst R
          have hne' : NonemptyBlocks (A ++ L :: C) :=
            nonemptyBlocks_append.mpr ⟨hA, surj_nonempty_cons hL hC⟩
          have hp' : (A ++ L :: C).flatten.Perm (List.range (n + 1)) := by
            simpa [List.append_assoc] using hparent
          obtain ⟨h, p, H, hblocks⟩ := ih (A ++ L :: C) hne' hp'
          have hlen := History.blocks_length p H
          rw [hblocks, List.length_append, List.length_cons] at hlen
          let i : Fin (h + 1) := ⟨A.length, by omega⟩
          refine ⟨h, p.flat, (H, (i, false)), ?_⟩
          change flatBlocks (History.blocks p H) A.length (n + 1) false = _
          rw [hblocks, flatBlocks_append]
          simp
        · have hne' : NonemptyBlocks (A ++ L :: R :: C) :=
            nonemptyBlocks_append.mpr ⟨hA,
              surj_nonempty_cons hL (surj_nonempty_cons hR hC)⟩
          have hp' : (A ++ L :: R :: C).flatten.Perm (List.range (n + 1)) := by
            simpa [List.append_assoc] using hparent
          obtain ⟨h, p, H, hblocks⟩ := ih (A ++ L :: R :: C) hne' hp'
          have hlen := History.blocks_length p H
          rw [hblocks, List.length_append, List.length_cons, List.length_cons] at hlen
          cases h with
          | zero => omega
          | succ h =>
              let i : Fin (h + 1) := ⟨A.length, by omega⟩
              refine ⟨h, p.down, (H, i), ?_⟩
              change downBlocks (History.blocks p H) A.length (n + 1) = _
              rw [hblocks, downBlocks_append]
              simp

end GesselZhuang
