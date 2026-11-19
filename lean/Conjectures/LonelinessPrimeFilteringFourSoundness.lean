import Conjectures.LonelinessPrimeFilteringFourCanonicalCheck
import Conjectures.LonelinessPrimeFilteringFourActions
import Conjectures.LonelinessPrimeFilteringFourRows

namespace Loneliness.PrimeFilteringFourProfiles

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem tripleCheck_intersection (w : ℕ) (h : tripleCheck w = true) (l : Fin 210) :
    w &&& goodMask l ≠ 0 := by
  rcases Bool.or_eq_true_iff.mp h with hs | hl
  · obtain ⟨j, hj, hrow⟩ := List.any_eq_true.mp hs
    exact safe_row_forces_intersection w l ⟨j, List.mem_range.mp hj⟩ hrow
  · exact of_decide_eq_true (List.all_eq_true.mp hl l (List.mem_finRange l))

theorem goodFour_of_mask_ne {a b c d : Fin 210}
    (h : goodMask a &&& goodMask b &&& goodMask c &&& goodMask d ≠ 0) :
    GoodFour a b c d := by
  obtain ⟨t, ht⟩ := Nat.exists_testBit_of_ne_zero h
  have hw : goodMask a &&& goodMask b &&& goodMask c &&& goodMask d < 2 ^ 35 :=
    Nat.and_lt_two_pow _ (good_mask_lt d)
  have htlt : t < 35 := by
    by_cases hlt : t < 35
    · exact hlt
    · have hp : 2 ^ 35 ≤ 2 ^ t := Nat.pow_le_pow_right (by decide) (by omega)
      have hz := Nat.testBit_lt_two_pow (hw.trans_le hp)
      rw [hz] at ht
      contradiction
  let j : Fin 5 := ⟨t / 7, by omega⟩
  let k : Fin 7 := ⟨t % 7, Nat.mod_lt _ (by decide)⟩
  have he : 7 * j.val + k.val = t := by dsimp [j, k]; omega
  have convertBit (i : Fin 210) (hi : (goodMask i).testBit t = true) : Accepts i j k := by
    have hm := goodMask_correct i j k
    rw [he] at hm
    exact of_decide_eq_true (hm.symm.trans hi)
  simp only [Nat.testBit_and, Bool.and_eq_true] at ht
  obtain ⟨⟨⟨ha, hb⟩, hc⟩, hd⟩ := ht
  exact ⟨j, k, convertBit a ha, convertBit b hb, convertBit c hc, convertBit d hd⟩

theorem canonical_goodFour (f : Fin 10) (h : canonicalCheck f = true)
    (b c d : Fin 210) : GoodFour (canonicalIndex f) b c d := by
  rcases le_total b c with hbc | hcb
  · exact goodFour_of_mask_ne
      (tripleCheck_intersection _ (canonicalCheck_triple f h b c hbc) d)
  · have hg := goodFour_of_mask_ne
      (tripleCheck_intersection _ (canonicalCheck_triple f h c b hcb) d)
    obtain ⟨j, k, ha, hc, hb, hd⟩ := hg
    exact ⟨j, k, ha, hb, hc, hd⟩

theorem goodFour_of_canonical_checks
    (h : ∀ f : Fin 10, canonicalCheck f = true) (a b c d : Fin 210) :
    GoodFour a b c d := by
  apply goodFour_of_normalize a
  obtain ⟨f, hf⟩ := canonical_value a
  have he : canonical a = canonicalIndex f := Fin.ext hf
  rw [normalize_pivot, he]
  exact canonical_goodFour f (h f) (normalize a b) (normalize a c) (normalize a d)

end Loneliness.PrimeFilteringFourProfiles
