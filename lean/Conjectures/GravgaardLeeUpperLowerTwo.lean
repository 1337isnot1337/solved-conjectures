import Conjectures.GravgaardLeeUpperLowerBasic

/-!
# Gravgaard–Lee's mixed upper/lower Lüroth conjecture

The threshold-two boundary in the existing `DIRECT-REFINEMENT.md` proof,
using the infinite-series and digit-map conventions in Gravgaard and Lee,
arXiv:2506.12513v2, §1.2 and Conjecture 2.6.
Every point of `(0,1]` has an actual infinite source Lüroth expansion. The
canonical digit is `floor (1/x) + 1`; using the strict lower endpoint retains
positive tails even when `1/x` is an integer. This is supporting work for the
all-threshold conjecture, not a separate counted result.
-/

open Filter Finset Set
open scoped Topology Pointwise

namespace GravgaardLeeUpperLower

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth

noncomputable section

private def unrestrictedDigit (x : ℝ) : ℕ := ⌊1 / x⌋₊ + 1

private theorem unrestrictedDigit_bounds {x : ℝ} (hx : x ∈ Ioc (0 : ℝ) 1) :
    2 ≤ unrestrictedDigit x ∧
      1 / (unrestrictedDigit x : ℝ) < x ∧
      x ≤ 1 / ((unrestrictedDigit x : ℝ) - 1) := by
  have hratio : (1 : ℝ) ≤ 1 / x :=
    (le_div_iff₀ hx.1).mpr (by simpa using hx.2)
  have hfloor : 1 ≤ ⌊1 / x⌋₊ := Nat.le_floor (by simpa using hratio)
  have hd : 2 ≤ unrestrictedDigit x := by unfold unrestrictedDigit; omega
  have hdR : (2 : ℝ) ≤ unrestrictedDigit x := by exact_mod_cast hd
  have hlo : ((unrestrictedDigit x : ℝ) - 1) ≤ 1 / x := by
    simpa [unrestrictedDigit] using Nat.floor_le (zero_le_one.trans hratio)
  have hhi : 1 / x < (unrestrictedDigit x : ℝ) := by
    simpa [unrestrictedDigit] using Nat.lt_floor_add_one (1 / x)
  refine ⟨hd, ?_, ?_⟩
  · apply (div_lt_iff₀ (by linarith : (0 : ℝ) < unrestrictedDigit x)).mpr
    simpa [mul_comm] using (div_lt_iff₀ hx.1).mp hhi
  · apply (le_div_iff₀ (by linarith : 0 < (unrestrictedDigit x : ℝ) - 1)).mpr
    simpa [mul_comm] using (le_div_iff₀ hx.1).mp hlo

private def unrestrictedTail (x : ℝ) : ℝ :=
  (x - 1 / (unrestrictedDigit x : ℝ)) / width (unrestrictedDigit x)

private theorem unrestrictedTail_mem {x : ℝ} (hx : x ∈ Ioc (0 : ℝ) 1) :
    unrestrictedTail x ∈ Ioc (0 : ℝ) 1 := by
  obtain ⟨hd, hlo, hhi⟩ := unrestrictedDigit_bounds hx
  have hw := width_pos hd
  refine ⟨div_pos (sub_pos.mpr hlo) hw, ?_⟩
  apply (div_le_iff₀ hw).mpr
  have htop := digitTop hd
  linarith

private theorem unrestrictedTail_eq {x : ℝ} (hx : x ∈ Ioc (0 : ℝ) 1) :
    x = 1 / (unrestrictedDigit x : ℝ) +
      width (unrestrictedDigit x) * unrestrictedTail x := by
  have hw := (width_pos (unrestrictedDigit_bounds hx).1).ne'
  unfold unrestrictedTail
  rw [mul_div_cancel₀ _ hw]
  ring

private def unrestrictedTails (x : ℝ) (n : ℕ) : ℝ :=
  (unrestrictedTail^[n]) x

private theorem unrestrictedTails_succ (x : ℝ) (n : ℕ) :
    unrestrictedTails x (n+1) = unrestrictedTail (unrestrictedTails x n) := by
  simp [unrestrictedTails, Function.iterate_succ_apply']

private theorem unrestrictedTails_mem {x : ℝ} (hx : x ∈ Ioc (0 : ℝ) 1) (n : ℕ) :
    unrestrictedTails x n ∈ Ioc (0 : ℝ) 1 := by
  induction n with
  | zero => exact hx
  | succ n ih => rw [unrestrictedTails_succ]; exact unrestrictedTail_mem ih

private def unrestrictedDigits (x : ℝ) (n : ℕ) : ℕ :=
  unrestrictedDigit (unrestrictedTails x n)

private theorem unrestrictedDigits_ge {x : ℝ} (hx : x ∈ Ioc (0 : ℝ) 1) (n : ℕ) :
    2 ≤ unrestrictedDigits x n :=
  (unrestrictedDigit_bounds (unrestrictedTails_mem hx n)).1

private theorem unrestrictedPrefix {x : ℝ} (hx : x ∈ Ioc (0 : ℝ) 1) (n : ℕ) :
    truncation (unrestrictedDigits x) n +
      (∏ j ∈ range n, width (unrestrictedDigits x j)) * unrestrictedTails x n = x := by
  induction n with
  | zero => simp [truncation, unrestrictedTails]
  | succ n ih =>
    have hstep : unrestrictedTails x n = 1 / (unrestrictedDigits x n : ℝ) +
        width (unrestrictedDigits x n) * unrestrictedTails x (n+1) := by
      simpa only [unrestrictedDigits, unrestrictedTails_succ] using
        unrestrictedTail_eq (unrestrictedTails_mem hx n)
    rw [prefix_succ, prod_range_succ]
    calc
      _ = truncation (unrestrictedDigits x) n +
          (∏ j ∈ range n, width (unrestrictedDigits x j)) *
            (1 / (unrestrictedDigits x n : ℝ) +
              width (unrestrictedDigits x n) * unrestrictedTails x (n+1)) := by ring
      _ = _ := by rw [← hstep]; exact ih

/-- Every positive real at most one is the value of an actual infinite Lüroth
series with digits at least two. The recursion never uses a zero tail. -/
theorem exists_unrestricted_value {x : ℝ} (hx : x ∈ Ioc (0 : ℝ) 1) :
    ∃ d : ℕ → ℕ, (∀ n, 2 ≤ d n) ∧ value d = x := by
  let d := unrestrictedDigits x
  have hd : ∀ n, 2 ≤ d n := unrestrictedDigits_ge hx
  have hbounds (n : ℕ) :
      x - (1 / 2 : ℝ)^n ≤ truncation d n ∧ truncation d n ≤ x := by
    have hprefix := unrestrictedPrefix hx n
    have htail := unrestrictedTails_mem hx n
    have hscale : 0 ≤ ∏ j ∈ range n, width (d j) :=
      prod_nonneg (fun j _ => (width_pos (hd j)).le)
    have herror : (∏ j ∈ range n, width (d j)) * unrestrictedTails x n ≤
        (1 / 2 : ℝ)^n :=
      (mul_le_of_le_one_right hscale htail.2).trans (scale_le d hd n)
    have hnonneg : 0 ≤ (∏ j ∈ range n, width (d j)) * unrestrictedTails x n :=
      mul_nonneg hscale htail.1.le
    change truncation d n + _ = x at hprefix
    constructor <;> linarith
  have hpow := tendsto_pow_atTop_nhds_zero_of_lt_one
    (by norm_num : (0 : ℝ) ≤ 1 / 2) (by norm_num : (1 / 2 : ℝ) < 1)
  have hlower : Tendsto (fun n : ℕ => x - (1 / 2 : ℝ)^n) atTop (𝓝 x) := by
    simpa only [sub_zero] using tendsto_const_nhds.sub hpow
  have hlim : Tendsto (truncation d) atTop (𝓝 x) :=
    tendsto_of_tendsto_of_tendsto_of_le_of_le hlower tendsto_const_nhds
      (fun n => (hbounds n).1) (fun n => (hbounds n).2)
  exact ⟨d, hd, tendsto_nhds_unique (tendsto_prefix d hd) hlim⟩

theorem largeDigitSet_two : largeDigitSet 2 = Ioc (0 : ℝ) 1 := by
  ext x
  constructor
  · intro hx
    have h := largeDigitSet_endpoint_bounds (by decide : 2 ≤ 2) hx
    norm_num [endpoint] at h
    exact h
  · intro hx
    obtain ⟨d, hd, he⟩ := exists_unrestricted_value hx
    exact (mem_largeDigitSet (by decide : 2 ≤ 2)).mpr ⟨d, hd, he⟩

theorem smallDigitSet_two : smallDigitSet 2 = ({1} : Set ℝ) := by
  ext x
  constructor
  · intro hx
    have h := smallDigitSet_endpoint_bounds (by decide : 2 ≤ 2) hx
    norm_num [endpoint] at h
    exact Set.mem_singleton_iff.mpr h
  · intro hx
    have he : x = 1 := Set.mem_singleton_iff.mp hx
    rw [he]
    have h := endpoint_mem_small (k := 2) (by decide)
    norm_num [endpoint] at h
    exact h

end

end GravgaardLeeUpperLower
