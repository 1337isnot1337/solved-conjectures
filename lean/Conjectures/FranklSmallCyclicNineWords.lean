module

public import Conjectures.FranklSmallCyclicResidual
public import Conjectures.FranklSmallCyclicMasks

/-! Exhaustive nine-site prefixes of the residual graph. Only two extension
steps are needed after the first seven-letter edge. The completeness proof
works for every literal cyclic word, without taking rotation classes. -/
@[expose] public section

namespace FranklSmallCyclic

def extendResidualWord (w : List ℕ) : Finset (List ℕ) :=
  ((Finset.range 16).filter
    (fun a => w.drop (w.length - 6) ++ [a] ∈ residualEdges)).image
      (fun a => w ++ [a])

def extendResidualWords (words : Finset (List ℕ)) : Finset (List ℕ) :=
  words.biUnion extendResidualWord

def nineCandidates : Finset (List ℕ) :=
  extendResidualWords (extendResidualWords residualEdges)

def nonzeroNineCandidates : Finset (List ℕ) :=
  nineCandidates.erase (List.replicate 9 0)

theorem nineCandidates_card : nineCandidates.card = 64 := by decide +kernel

theorem nonzeroNineCandidates_card : nonzeroNineCandidates.card = 63 := by decide +kernel

theorem nineCandidates_length : ∀ w ∈ nineCandidates, w.length = 9 := by decide +kernel

def linearPrefix (word : ZMod 9 → ℕ) (m : ℕ) : List ℕ :=
  List.ofFn (fun i : Fin m => word (i.val : ZMod 9))

theorem linearPrefix_succ (word : ZMod 9 → ℕ) (m : ℕ) :
    linearPrefix word (m + 1) = linearPrefix word m ++ [word (m : ZMod 9)] := by
  simp only [linearPrefix, List.ofFn_succ_last, Fin.val_castSucc, Fin.val_last]

theorem linearPrefix_seven (word : ZMod 9 → ℕ) :
    linearPrefix word 7 = residualWindow word 0 := by
  simp only [linearPrefix, residualWindow, zero_add]

private theorem residual_first_bound : ∀ w ∈ residualEdges, w.getD 0 0 < 16 := by
  decide +kernel

theorem residual_letter_bound (word : ZMod 9 → ℕ)
    (hw : ∀ q, residualWindow word q ∈ residualEdges) (q : ZMod 9) : word q < 16 := by
  have h := residual_first_bound _ (hw q)
  simpa only [residualWindow_getD word q 0 (by decide), Nat.cast_zero, add_zero] using h

private theorem seven_suffix (word : ZMod 9 → ℕ) :
    (linearPrefix word 7).drop 1 ++ [word 7] = residualWindow word 1 := by rfl

private theorem eight_suffix (word : ZMod 9 → ℕ) :
    (linearPrefix word 8).drop 2 ++ [word 8] = residualWindow word 2 := by rfl

theorem extendResidualWord_mem {w : List ℕ} {a : ℕ} (ha : a < 16)
    (he : w.drop (w.length - 6) ++ [a] ∈ residualEdges) :
    w ++ [a] ∈ extendResidualWord w :=
  Finset.mem_image.mpr ⟨a, Finset.mem_filter.mpr ⟨Finset.mem_range.mpr ha, he⟩, rfl⟩

/-- Every cyclic period-nine residual word appears in the finite list of
64 prefixes, even before its remaining wraparound windows are checked. -/
theorem nineCandidates_complete (word : ZMod 9 → ℕ)
    (hw : ∀ q, residualWindow word q ∈ residualEdges) :
    linearPrefix word 9 ∈ nineCandidates := by
  have h7 : linearPrefix word 7 ∈ residualEdges := by
    rw [linearPrefix_seven]
    exact hw 0
  have h8 : linearPrefix word 8 ∈ extendResidualWords residualEdges := by
    apply Finset.mem_biUnion.mpr
    refine ⟨linearPrefix word 7, h7, ?_⟩
    rw [linearPrefix_succ word 7]
    apply extendResidualWord_mem (residual_letter_bound word hw 7)
    have he : (linearPrefix word 7).length = 7 := by simp [linearPrefix]
    rw [he, seven_suffix]
    exact hw 1
  apply Finset.mem_biUnion.mpr
  refine ⟨linearPrefix word 8, h8, ?_⟩
  rw [linearPrefix_succ word 8]
  apply extendResidualWord_mem (residual_letter_bound word hw 8)
  have he : (linearPrefix word 8).length = 8 := by simp [linearPrefix]
  rw [he, eight_suffix]
  exact hw 2

def tileMaskNine (p t : ℕ) : ℕ :=
  maskUnion ((match t with
    | 0 => [0, 1, 2]
    | 1 => [0, 1, 3]
    | 2 => [0, 2, 3]
    | _ => [0, 1, 2, 3]).map (fun j => 2 ^ ((p + j) % 9)))

def wordMasksNine (w : List ℕ) : List ℕ :=
  (List.range 9).flatMap (fun p =>
    ((List.range 4).filter (fun t => (w.getD p 0).testBit t)).map (tileMaskNine p))

end FranklSmallCyclic
