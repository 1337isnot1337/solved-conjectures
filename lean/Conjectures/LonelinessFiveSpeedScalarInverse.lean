import Conjectures.LonelinessFiveSpeedScalarTable

/-! The checked scalar table also supplies the inverse witnesses needed by
the minimum-pair normalization argument. -/
namespace Loneliness.FiveSpeedCertificate

def scalarInverse (table : Array ScalarMaskEntry) (a : ℕ) : ℕ :=
  if a = 0 then 0 else
    match table[a - 1]? with
    | none => 0
    | some entry => entry.inverse

theorem scalarTableCheck_inverse (p : ℕ) (table : Array ScalarMaskEntry)
    (hcheck : scalarTableCheck p table = true) (a : ℕ)
    (ha : 0 < a) (hhalf : 2 * a ≤ p) :
    a * scalarInverse table a % p = 1 % p := by
  have hc : (2 ≤ p ∧ table.size = p / 2) ∧
      ∀ entry ∈ table.toList.zipIdx 1,
        goodMaskCheck p entry.2 entry.1.inverse entry.1.mask = true := by
    simpa only [scalarTableCheck, Bool.and_eq_true, decide_eq_true_eq,
      List.all_eq_true] using hcheck
  have ha0 : a ≠ 0 := by omega
  have hi : a - 1 < table.size := by omega
  let entry := table[a - 1]
  have hmem : (entry, a) ∈ table.toList.zipIdx 1 := by
    apply List.mk_mem_zipIdx_iff_le_and_getElem?_sub.mpr
    refine ⟨by omega, ?_⟩
    exact (Array.getElem?_toList).trans (Array.getElem?_eq_getElem hi)
  have he : (2 ≤ p ∧ Nat.Coprime entry.inverse p ∧ a * entry.inverse % p = 1) ∧
      geometricMaskCheck p entry.inverse ((p + 4) / 5) (4 * p / 5) entry.mask = true := by
    simpa only [goodMaskCheck, ha0, ↓reduceIte, Bool.and_eq_true,
      decide_eq_true_eq] using hc.2 _ hmem
  have hinv : scalarInverse table a = entry.inverse := by
    simp only [scalarInverse, ha0, ↓reduceIte, Array.getElem?_eq_getElem hi]
    rfl
  rw [hinv, he.1.2.2, Nat.mod_eq_of_lt (by omega : 1 < p)]

end Loneliness.FiveSpeedCertificate
