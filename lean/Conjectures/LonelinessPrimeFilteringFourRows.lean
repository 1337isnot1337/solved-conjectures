import Conjectures.LonelinessPrimeFilteringFourProfiles

namespace Loneliness.PrimeFilteringFourProfiles

set_option maxRecDepth 100000
set_option maxHeartbeats 0

def extractRow (w : ℕ) (j : ℕ) : ℕ := (w >>> (7 * j)) % 128

theorem row_intersection : ∀ a b : Fin 128,
    3 ≤ rowCount a.val → 5 ≤ rowCount b.val → a.val &&& b.val ≠ 0 := by
  decide

theorem good_row_count : ∀ (i : Fin 210) (j : Fin 5),
    5 ≤ rowCount (extractRow (goodMask i) j.val) := by
  decide

theorem good_mask_lt : ∀ i : Fin 210, goodMask i < 2 ^ 35 := by
  decide

theorem extractRow_lt (w j : ℕ) : extractRow w j < 128 :=
  Nat.mod_lt _ (by decide)

theorem extractRow_and (w v j : ℕ) :
    extractRow (w &&& v) j = extractRow w j &&& extractRow v j := by
  unfold extractRow
  rw [Nat.shiftRight_and_distrib]
  exact Nat.and_mod_two_pow (n := 7)

theorem safe_row_forces_intersection (w : ℕ) (i : Fin 210) (j : Fin 5)
    (h : rowSafe (extractRow w j.val) = true) : w &&& goodMask i ≠ 0 := by
  have hcount : 3 ≤ rowCount (extractRow w j.val) := of_decide_eq_true h
  have hn := row_intersection
    ⟨extractRow w j.val, extractRow_lt w j.val⟩
    ⟨extractRow (goodMask i) j.val, extractRow_lt (goodMask i) j.val⟩
    hcount (good_row_count i j)
  intro hz
  apply hn
  change extractRow w j.val &&& extractRow (goodMask i) j.val = 0
  rw [← extractRow_and, hz]
  simp [extractRow]

end Loneliness.PrimeFilteringFourProfiles
