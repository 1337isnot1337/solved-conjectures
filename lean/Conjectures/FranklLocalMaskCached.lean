module

public import Conjectures.FranklLocalMaskCertificate

/-!
Cache the local generators and the inside shares before checking boundary pairs.
The cached evaluator is equal to `Mask.check` for every input.
-/

@[expose] public section

namespace FranklLocal.Mask

/-- The inside masks and their weighted imbalances, computed once. -/
def shareCache (n core : ℕ) (inside : List ℕ) (w : ℕ → ℕ) : List (ℕ × ℤ) :=
  inside.map (fun s => (s, maskImbalance n core w s))

/-- A boundary row using the cached local generators and inside shares. -/
def rowOfCached (localGs : List ℕ) (scores : List (ℕ × ℤ)) (e : ℕ) :
    List (ℕ × ℕ × ℤ) :=
  scores.map (fun a =>
    (a.1, FranklSmallCyclic.maskUnion
      (FranklSmallCyclic.coveringMasks localGs (a.1 ||| e)), a.2))

theorem rowOfCached_eq (n core : ℕ) (gs inside : List ℕ) (w : ℕ → ℕ) (e : ℕ) :
    rowOfCached (localCodes gs core) (shareCache n core inside w) e =
      cachedRow n core gs inside w e := by
  simp only [rowOfCached, shareCache, cachedRow, List.map_map, Function.comp_def, coverCode]

/-- The original checker with loop-invariant calculations cached. -/
def cachedCheck (n : ℕ) (gs : List ℕ) (core : ℕ) (inside outside : List ℕ)
    (w : ℕ → ℕ) : Bool :=
  let localGs := localCodes gs core
  let scores := shareCache n core inside w
  decide (∃ x ∈ Frankl.FC.BitCode.decode n core, 0 < w x) &&
    outside.all (fun e =>
      let row := rowOfCached localGs scores e
      outside.all (fun m =>
        if m &&& e = m then decide (0 ≤ rowShare core row m) else true))

theorem cachedCheck_eq (n : ℕ) (gs : List ℕ) (core : ℕ) (inside outside : List ℕ)
    (w : ℕ → ℕ) : cachedCheck n gs core inside outside w =
      check n gs core inside outside w := by
  simp only [cachedCheck, rowOfCached_eq, check]

end FranklLocal.Mask
