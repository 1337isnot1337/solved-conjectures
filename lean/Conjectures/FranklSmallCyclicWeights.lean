module

public import Conjectures.FranklSmallCyclicMaskWindows

/-! Batches of literal short-cycle window certificates.

Each row records all seven shape letters and the four weights at sites
three through six. The batch check validates these dimensions and checks
the actual modulo-n generators through MaskWindows.windowCheck.
-/
@[expose] public section

namespace FranklSmallCyclic.Weights

open FranklCyclic FranklLocal

structure Entry where
  word : List ℕ
  weights : List ℕ
  deriving DecidableEq

abbrev WellFormed (e : Entry) : Prop :=
  e.word.length = 7 ∧ e.weights.length = 4 ∧ ∀ a ∈ e.word, a < 16

def shapeWord (e : Entry) (p : Fin 7) : Finset (Fin 4) :=
  Finset.univ.filter (fun j => (e.word.getD p.val 0).testBit j.val = true)

def siteWeights (e : Entry) (i : ℕ) : ℕ :=
  if 3 ≤ i ∧ i < 7 then e.weights.getD (i - 3) 0 else 0

def entryCheck (n : ℕ) (e : Entry) : Bool :=
  decide (WellFormed e) && MaskWindows.windowCheck n (shapeWord e) (siteWeights e)

def batchCheck (n : ℕ) (entries : List Entry) : Bool :=
  entries.all (entryCheck n)

theorem batchCheck_wellFormed {n : ℕ} {entries : List Entry}
    (hc : batchCheck n entries = true) {e : Entry} (he : e ∈ entries) :
    WellFormed e := by
  have h := List.all_eq_true.mp hc e he
  exact of_decide_eq_true (Bool.and_eq_true_iff.mp h).1

theorem batchCheck_entry {n : ℕ} {entries : List Entry}
    (hc : batchCheck n entries = true) {e : Entry} (he : e ∈ entries) :
    MaskWindows.windowCheck n (shapeWord e) (siteWeights e) = true :=
  (Bool.and_eq_true_iff.mp (List.all_eq_true.mp hc e he)).2

theorem batchCheck_certificate {n : ℕ} [NeZero n] (hn : 7 ≤ n)
    {entries : List Entry} (hc : batchCheck n entries = true)
    {e : Entry} (he : e ∈ entries) (start : ZMod n) :
    WeightCertificate (imageFamily (rawPosition start) (localTiles 4 (shapeWord e)))
      (mappedCore start 4) (MaskWindows.shiftedWeights start (siteWeights e)) :=
  MaskWindows.checked_window_certificate hn (shapeWord e) start (siteWeights e)
    (batchCheck_entry hc he)

theorem batchCheck_global {n : ℕ} [NeZero n] (hn : 7 ≤ n)
    {entries : List Entry} (hc : batchCheck n entries = true)
    {e : Entry} (he : e ∈ entries)
    (word : ZMod n → Finset (Fin 4)) (start : ZMod n)
    (hword : windowSchedule word start 4 = shapeWord e) :
    ∃ x ∈ mappedCore start 4, Abundant (family (generatedTiles word)) x := by
  apply MaskWindows.windowCheck_global hn word start (siteWeights e)
  rw [hword]
  exact batchCheck_entry hc he

end FranklSmallCyclic.Weights
