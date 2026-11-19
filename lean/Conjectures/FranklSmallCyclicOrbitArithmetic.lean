module

public import Conjectures.FranklSmallCyclicWeights
public import Conjectures.FranklLocalMaskCached

/-! Evaluate representative arithmetic with the cached mask checker and
return exactly the existing entry and batch checks. These equalities have
no validity or certificate hypotheses. -/
@[expose] public section

namespace FranklSmallCyclic.OrbitArithmetic

open FranklLocal

def cachedWindowCheck (n : ℕ) (entry : Weights.Entry) : Bool :=
  let gs := MaskWindows.windowMasks n (Weights.shapeWord entry)
  Mask.cachedCheck n gs 120 (Mask.submasks n 120)
    (Mask.submasks n (Mask.boundaryCode gs 120)) (Weights.siteWeights entry)

theorem cachedWindowCheck_eq (n : ℕ) (entry : Weights.Entry) :
    cachedWindowCheck n entry =
      MaskWindows.windowCheck n (Weights.shapeWord entry) (Weights.siteWeights entry) := by
  simp only [cachedWindowCheck, MaskWindows.windowCheck, Mask.cachedCheck_eq]

def cachedEntryCheck (n : ℕ) (entry : Weights.Entry) : Bool :=
  decide (Weights.WellFormed entry) && cachedWindowCheck n entry

theorem cachedEntryCheck_eq (n : ℕ) (entry : Weights.Entry) :
    cachedEntryCheck n entry = Weights.entryCheck n entry := by
  simp only [cachedEntryCheck, Weights.entryCheck, cachedWindowCheck_eq]

def cachedBatchCheck (n : ℕ) (entries : List Weights.Entry) : Bool :=
  entries.all (cachedEntryCheck n)

theorem cachedBatchCheck_eq (n : ℕ) (entries : List Weights.Entry) :
    cachedBatchCheck n entries = Weights.batchCheck n entries := by
  exact congrArg (fun test => entries.all test) (funext (cachedEntryCheck_eq n))

theorem cachedEntryCheck_sound {n : ℕ} {entry : Weights.Entry}
    (hc : cachedEntryCheck n entry = true) : Weights.entryCheck n entry = true := by
  simpa only [cachedEntryCheck_eq] using hc

theorem cachedBatchCheck_sound {n : ℕ} {entries : List Weights.Entry}
    (hc : cachedBatchCheck n entries = true) : Weights.batchCheck n entries = true := by
  simpa only [cachedBatchCheck_eq] using hc

theorem cachedBatchCheck_append (n : ℕ) (left right : List Weights.Entry) :
    cachedBatchCheck n (left ++ right) =
      (cachedBatchCheck n left && cachedBatchCheck n right) := by
  simp only [cachedBatchCheck, List.all_append]

end FranklSmallCyclic.OrbitArithmetic
