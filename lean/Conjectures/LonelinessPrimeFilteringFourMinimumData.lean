import Mathlib.Data.Nat.PadicValNat
import Mathlib.Data.Finset.Sort

/-!+# Arithmetic data for four minimum-level speeds and two higher speeds

The four speeds at the minimum 7-adic level are enumerated through their
finite set. The two higher speeds are ordered by valuation. Every unit part
is the actual `Nat.divMaxPow` of the corresponding positive speed.
-/

namespace Loneliness.PrimeFilteringFourMinimumData

private theorem unitPart_mod_ne_zero {n : ℕ} (hn : 0 < n) :
    Nat.divMaxPow n 7 % 7 ≠ 0 := by
  intro hmod
  exact (Nat.not_dvd_divMaxPow (by decide : 1 < 7) (Nat.ne_of_gt hn))
    (Nat.dvd_of_mod_eq_zero hmod)

private theorem factor_at_minimum {n r : ℕ} (hr : r ≤ padicValNat 7 n) :
    n = 7 ^ r * (7 ^ (padicValNat 7 n - r) * Nat.divMaxPow n 7) := by
  rw [← Nat.mul_assoc, ← pow_add, Nat.add_sub_of_le hr]
  exact (Nat.pow_padicValNat_mul_divMaxPow 7 n).symm

/-- Actual positive list entries with exactly four minimum-level speeds and
two higher speeds supply all unit and valuation premises of the `4 + 2` case.
The upper offsets may be equal. Repeated list entries do not change the
finite-set cardinality assumptions. -/
theorem exists_four_low_two_high_data (ds : List ℕ) (r : ℕ)
    (hpos : ∀ d ∈ ds, 0 < d)
    (hminimum : ∀ d ∈ ds, r ≤ padicValNat 7 d)
    (hlowcard : (ds.toFinset.filter (fun d => padicValNat 7 d = r)).card = 4)
    (hhighcard : (ds.toFinset.filter (fun d => r < padicValNat 7 d)).card = 2) :
    ∃ ns : Fin 4 → ℕ, ∃ i m u v : ℕ,
      1 ≤ i ∧ i ≤ m ∧ (∀ x, ns x % 7 ≠ 0) ∧
      u % 7 ≠ 0 ∧ v % 7 ≠ 0 ∧
      ∀ d ∈ ds, (∃ x, d = 7 ^ r * ns x) ∨
        d = 7 ^ r * (7 ^ i * u) ∨ d = 7 ^ r * (7 ^ m * v) := by
  let low := ds.toFinset.filter (fun d => padicValNat 7 d = r)
  let high := ds.toFinset.filter (fun d => r < padicValNat 7 d)
  let e : Fin 4 ≃o low := low.orderIsoOfFin hlowcard
  let ns : Fin 4 → ℕ := fun x => Nat.divMaxPow (e x).val 7
  have hlow (x : Fin 4) : (e x).val ∈ ds ∧ padicValNat 7 (e x).val = r := by
    have hx := Finset.mem_filter.mp (e x).property
    exact ⟨List.mem_toFinset.mp hx.1, hx.2⟩
  have hns : ∀ x, ns x % 7 ≠ 0 := by
    intro x
    exact unitPart_mod_ne_zero (hpos _ (hlow x).1)
  have hordered : ∃ a b : ℕ, high = {a, b} ∧ padicValNat 7 a ≤ padicValNat 7 b := by
    obtain ⟨a, b, _, hab⟩ := Finset.card_eq_two.mp hhighcard
    rcases le_total (padicValNat 7 a) (padicValNat 7 b) with hle | hle
    · exact ⟨a, b, hab, hle⟩
    · exact ⟨b, a, hab.trans (Finset.pair_comm a b), hle⟩
  obtain ⟨a, b, hab, horder⟩ := hordered
  have ha : a ∈ high := by simp [hab]
  have hb : b ∈ high := by simp [hab]
  have ha_data := Finset.mem_filter.mp ha
  have hb_data := Finset.mem_filter.mp hb
  have ha_level : r < padicValNat 7 a := ha_data.2
  have hb_level : r < padicValNat 7 b := hb_data.2
  have ha_pos : 0 < a := hpos a (List.mem_toFinset.mp ha_data.1)
  have hb_pos : 0 < b := hpos b (List.mem_toFinset.mp hb_data.1)
  refine ⟨ns, padicValNat 7 a - r, padicValNat 7 b - r,
    Nat.divMaxPow a 7, Nat.divMaxPow b 7, ?_, ?_, hns,
    unitPart_mod_ne_zero ha_pos, unitPart_mod_ne_zero hb_pos, ?_⟩
  · omega
  · omega
  · intro d hd
    by_cases hlevel : padicValNat 7 d = r
    · have hd_low : d ∈ low := Finset.mem_filter.mpr ⟨List.mem_toFinset.mpr hd, hlevel⟩
      obtain ⟨x, hx⟩ := e.surjective ⟨d, hd_low⟩
      refine Or.inl ⟨x, ?_⟩
      change d = 7 ^ r * Nat.divMaxPow (e x).val 7
      have hvalue : (e x).val = d := congrArg Subtype.val hx
      rw [hvalue]
      simpa only [hlevel] using (Nat.pow_padicValNat_mul_divMaxPow 7 d).symm
    · have hd_above : r < padicValNat 7 d := by
        have := hminimum d hd
        omega
      have hd_high : d ∈ high := Finset.mem_filter.mpr ⟨List.mem_toFinset.mpr hd, hd_above⟩
      have hcases : d = a ∨ d = b := by
        simpa only [hab, Finset.mem_insert, Finset.mem_singleton] using hd_high
      rcases hcases with rfl | rfl
      · exact Or.inr (Or.inl (factor_at_minimum (Nat.le_of_lt ha_level)))
      · exact Or.inr (Or.inr (factor_at_minimum (Nat.le_of_lt hb_level)))

end Loneliness.PrimeFilteringFourMinimumData
