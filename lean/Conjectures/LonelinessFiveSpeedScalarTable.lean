import Conjectures.LonelinessFiveSpeedMaskArithmetic
import Init.Data.Array.Lemmas
import Init.Data.List.Nat.Range

/-! A reusable half-table of scalar masks. Entry `j` certifies multiplier
`j + 1`; multiplier zero uses the explicit empty mask. -/
namespace Loneliness.FiveSpeedCertificate

structure ScalarMaskEntry where
  inverse : ℕ
  mask : ℕ
  deriving DecidableEq, Repr

def scalarMaskLookup (table : Array ScalarMaskEntry) (u : ℕ) : ℕ :=
  if u = 0 then 0 else
    match table[u - 1]? with
    | none => 0
    | some entry => entry.mask

def scalarMask (p : ℕ) (table : Array ScalarMaskEntry) (u : ℕ) : ℕ :=
  scalarMaskLookup table (foldResidue p u)

def scalarTableCheck (p : ℕ) (table : Array ScalarMaskEntry) : Bool :=
  decide (2 ≤ p ∧ table.size = p / 2) &&
    (table.toList.zipIdx 1).all
      (fun entry => goodMaskCheck p entry.2 entry.1.inverse entry.1.mask)

theorem scalarTableCheck_half (p : ℕ) (table : Array ScalarMaskEntry)
    (hcheck : scalarTableCheck p table = true) (u : ℕ) (hu : u ≤ p / 2) :
    GoodMask p u (scalarMaskLookup table u) := by
  have hc : (2 ≤ p ∧ table.size = p / 2) ∧
      ∀ entry ∈ table.toList.zipIdx 1,
        goodMaskCheck p entry.2 entry.1.inverse entry.1.mask = true := by
    simpa only [scalarTableCheck, Bool.and_eq_true, decide_eq_true_eq,
      List.all_eq_true] using hcheck
  by_cases hu0 : u = 0
  · subst u
    simpa only [scalarMaskLookup, ↓reduceIte] using goodMask_zero p
  · have hi : u - 1 < table.size := by omega
    let entry := table[u - 1]
    have hmem : (entry, u) ∈ table.toList.zipIdx 1 := by
      apply List.mk_mem_zipIdx_iff_le_and_getElem?_sub.mpr
      refine ⟨by omega, ?_⟩
      exact (Array.getElem?_toList).trans (Array.getElem?_eq_getElem hi)
    have hm := goodMaskCheck_sound p u entry.inverse entry.mask (hc.2 _ hmem)
    simpa only [scalarMaskLookup, hu0, ↓reduceIte,
      Array.getElem?_eq_getElem hi] using hm

/-- A single checked half-table gives the full scalar-mask oracle, for every
natural multiplier. No primality assumption is used in this implication. -/
theorem scalarTableCheck_sound (p : ℕ) (table : Array ScalarMaskEntry)
    (hcheck : scalarTableCheck p table = true) (u : ℕ) :
    GoodMask p u (scalarMask p table u) := by
  have hc : (2 ≤ p ∧ table.size = p / 2) ∧
      (table.toList.zipIdx 1).all
        (fun entry => goodMaskCheck p entry.2 entry.1.inverse entry.1.mask) = true := by
    simpa only [scalarTableCheck, Bool.and_eq_true, decide_eq_true_eq] using hcheck
  exact goodMask_of_fold p u _ (by omega)
    (scalarTableCheck_half p table hcheck _ (foldResidue_le_half p u))

end Loneliness.FiveSpeedCertificate
