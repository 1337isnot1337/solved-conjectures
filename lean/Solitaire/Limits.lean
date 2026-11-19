import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
import Solitaire.Counterexample

open Filter
open scoped Topology
noncomputable section
namespace SolitaireCounterexample

theorem mass_tendsto : Tendsto (fun n : Nat => (mass n : ℝ)) atTop atTop := by
  apply Filter.tendsto_atTop_mono' atTop _
    (Filter.tendsto_atTop_add_const_right atTop (-1 : ℝ) tendsto_natCast_atTop_atTop)
  filter_upwards [eventually_ge_atTop 5] with n hn
  have hb := (stable_mass_bounds n hn).1
  have hn' : n ≤ mass n + 1 := by simp only [mass]; omega
  have hr : (n : ℝ) ≤ (mass n : ℝ) + 1 := by exact_mod_cast hn'
  linarith

theorem ratio_bounds (n : Nat) (hn : 5 ≤ n) :
    (3:ℝ)/4 - 2/(mass n : ℝ) ≤ (h n : ℝ)/(mass n : ℝ) ∧
    (h n : ℝ)/(mass n : ℝ) ≤ (3:ℝ)/4 + 2/(mass n : ℝ) := by
  have hposN : 0 < mass n := by
    have hs := (stable_mass_bounds n hn).1
    simp only [mass] at *
    omega
  have hpos : 0 < (mass n : ℝ) := by exact_mod_cast hposN
  have hloN := (stable_ratio_error n hn).1
  have hhiN := (stable_ratio_error n hn).2
  have hlo : 3*(mass n : ℝ) ≤ 4*(h n : ℝ) + 6 := by exact_mod_cast hloN
  have hhi : 4*(h n : ℝ) ≤ 3*(mass n : ℝ) + 6 := by exact_mod_cast hhiN
  have hmul : (2:ℝ)/(mass n : ℝ) * (mass n : ℝ) = 2 := by field_simp
  constructor
  · apply (le_div_iff₀ hpos).2
    nlinarith
  · apply (div_le_iff₀ hpos).2
    nlinarith

theorem stable_first_tendsto :
    Tendsto (fun n : Nat => (h n : ℝ)/(mass n : ℝ)) atTop (𝓝 ((3:ℝ)/4)) := by
  have hz : Tendsto (fun n : Nat => (2:ℝ)/(mass n : ℝ)) atTop (𝓝 0) :=
    mass_tendsto.const_div_atTop 2
  have hl : Tendsto (fun n : Nat => (3:ℝ)/4 - 2/(mass n : ℝ)) atTop (𝓝 ((3:ℝ)/4)) := by
    simpa using (tendsto_const_nhds.sub hz)
  have hu : Tendsto (fun n : Nat => (3:ℝ)/4 + 2/(mass n : ℝ)) atTop (𝓝 ((3:ℝ)/4)) := by
    simpa using (tendsto_const_nhds.add hz)
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le' hl hu
  · filter_upwards [eventually_ge_atTop 5] with n hn
    exact (ratio_bounds n hn).1
  · filter_upwards [eventually_ge_atTop 5] with n hn
    exact (ratio_bounds n hn).2
#print axioms stable_first_tendsto
end SolitaireCounterexample

namespace SolitaireCounterexample

theorem stable_second_tendsto :
    Tendsto (fun n : Nat => ((h n-b n : Nat) : ℝ)/(mass n : ℝ)) atTop (𝓝 ((1:ℝ)/4)) := by
  have ht : Tendsto (fun n : Nat => (1:ℝ) - (h n : ℝ)/(mass n : ℝ)) atTop (𝓝 ((1:ℝ)/4)) := by
    convert tendsto_const_nhds.sub stable_first_tendsto using 1
    norm_num
  apply Filter.Tendsto.congr' _ ht
  filter_upwards [eventually_ge_atTop 5] with n hn
  have hposN : 0 < mass n := by have hs := (stable_mass_bounds n hn).1; simp only [mass] at *; omega
  have hne : (mass n : ℝ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hposN)
  have hsum : (mass n : ℝ) = (h n : ℝ) + ((h n-b n : Nat) : ℝ) := by simp [mass]
  field_simp
  linarith

def profile (piles : List Nat) (x : ℝ) : ℝ :=
  ((piles.getD (Nat.floor x) 0 : Nat) : ℝ) / (piles.sum : ℝ)

def reference (n : Nat) : List Nat := [h n,h n-b n]
def recurrent (n : Nat) : List Nat := [n]
def stableLimit (x : ℝ) : ℝ := if x < 1 then 3/4 else if x < 2 then 1/4 else 0
def recurrentLimit (x : ℝ) : ℝ := if x < 1 then 1 else 0

-- The statement applies at every positive x, including x = 1 and x = 2.
theorem reference_profile_limit (x : ℝ) (hx : 0 < x) :
    Tendsto (fun n => profile (reference n) x) atTop (𝓝 (stableLimit x)) := by
  by_cases hx1 : x < 1
  · have hf : Nat.floor x = 0 := Nat.floor_eq_zero.mpr hx1
    simp only [stableLimit, hx1, ↓reduceIte]
    apply Filter.Tendsto.congr' _ stable_first_tendsto
    filter_upwards [eventually_ge_atTop 5] with n hn
    simp [profile, reference, hf, mass]
  · by_cases hx2 : x < 2
    · have hf : Nat.floor x = 1 := (Nat.floor_eq_iff (le_of_lt hx)).2 (by constructor <;> norm_num at * <;> linarith)
      simp only [stableLimit, hx1, hx2, ↓reduceIte]
      apply Filter.Tendsto.congr' _ stable_second_tendsto
      filter_upwards [eventually_ge_atTop 5] with n hn
      simp [profile, reference, hf, mass]
    · have hf : 2 ≤ Nat.floor x := Nat.le_floor (by norm_num; linarith)
      simp only [stableLimit, hx1, hx2, ↓reduceIte]
      apply Filter.Tendsto.congr' _ tendsto_const_nhds
      filter_upwards [] with n
      have hnth : (reference n)[Nat.floor x]? = none := by
        apply List.getElem?_eq_none
        simpa [reference] using hf
      simp [profile, List.getD, hnth]
#print axioms reference_profile_limit
end SolitaireCounterexample

namespace SolitaireCounterexample

theorem recurrent_profile_limit (x : ℝ) (_hx : 0 < x) :
    Tendsto (fun n => profile (recurrent n) x) atTop (𝓝 (recurrentLimit x)) := by
  by_cases hx1 : x < 1
  · have hf : Nat.floor x = 0 := Nat.floor_eq_zero.mpr hx1
    simp only [recurrentLimit, hx1, ↓reduceIte]
    apply Filter.Tendsto.congr' _ tendsto_const_nhds
    filter_upwards [eventually_ge_atTop 1] with n hn
    have hne : (n : ℝ) ≠ 0 := by exact_mod_cast (show n ≠ 0 by omega)
    simp [profile, recurrent, hf, hne]
  · have hf : 1 ≤ Nat.floor x := Nat.le_floor (by norm_num; linarith)
    simp only [recurrentLimit, hx1, ↓reduceIte]
    apply Filter.Tendsto.congr' _ tendsto_const_nhds
    filter_upwards [] with n
    have hnth : (recurrent n)[Nat.floor x]? = none := by
      apply List.getElem?_eq_none
      simpa [recurrent] using hf
    simp [profile, List.getD, hnth]

theorem limits_differ : stableLimit (1/2) ≠ recurrentLimit (1/2) := by
  norm_num [stableLimit, recurrentLimit]
#print axioms recurrent_profile_limit
#print axioms limits_differ
end SolitaireCounterexample

namespace SolitaireCounterexample

def IsPositivePartition (xs : List Nat) : Prop :=
  xs.Pairwise (· ≥ ·) ∧ ∀ x ∈ xs, 0 < x

def IsStableReference (n : Nat) (xs : List Nat) : Prop :=
  IsPositivePartition xs ∧ step (b n) xs = xs ∧ xs.sum ≤ n ∧
  ∀ ys, IsPositivePartition ys → step (b n) ys = ys → ys.sum ≤ n → ys.sum ≤ xs.sum

def IsRecurrent (n : Nat) (xs : List Nat) : Prop :=
  ∃ k : Nat, 0 < k ∧ ((step (b n))^[k]) xs = xs

theorem reference_partition (n : Nat) (hn : 5 ≤ n) : IsPositivePartition (reference n) := by
  have hb : b n < h n := by simp [h,b]; omega
  have hp : 0 < h n-b n := by omega
  have hh : 0 < h n := by omega
  simp [IsPositivePartition, reference, hh, hp]

theorem reference_is_unique_maximal (n : Nat) (hn : 5 ≤ n) :
    IsStableReference n (reference n) ∧
      ∀ xs, IsStableReference n xs → xs = reference n := by
  have hr : IsStableReference n (reference n) := by
    refine ⟨reference_partition n hn, displayed_stable n hn, ?_, ?_⟩
    · simpa [reference] using (stable_mass_bounds n hn).2.1
    · intro ys _ hfix hmass
      simpa [reference] using stable_mass_maximal n hn ys hfix hmass
  refine ⟨hr, ?_⟩
  intro xs ⟨_, hfix, hmass, hmax⟩
  have ha : xs.sum ≤ (reference n).sum := by
    simpa [reference] using stable_mass_maximal n hn xs hfix hmass
  have hb : (reference n).sum ≤ xs.sum :=
    hmax (reference n) (reference_partition n hn) (displayed_stable n hn) (by simpa [reference] using (stable_mass_bounds n hn).2.1)
  have heq : xs.sum = h n + (h n-b n) := by simpa [reference] using Nat.le_antisymm ha hb
  simpa [reference] using stable_mass_unique n hn xs hfix heq

theorem recurrence_is_valid (n : Nat) (hn : 5 ≤ n) :
    IsPositivePartition (recurrent n) ∧ (recurrent n).sum = n ∧ IsRecurrent n (recurrent n) := by
  have hc := two_cycle n (by omega)
  refine ⟨?_, by simp [recurrent], ⟨2, by decide, ?_⟩⟩
  · simp [IsPositivePartition, recurrent, show 0 < n by omega]
  · simp [recurrent, Function.iterate_succ_apply, hc.1, hc.2]

theorem fixed_scale_counterexample :
    (∀ n ≥ 5, IsStableReference n (reference n) ∧ IsRecurrent n (recurrent n) ∧
      IsPositivePartition (recurrent n) ∧ (recurrent n).sum = n) ∧
    (∀ x > 0, Tendsto (fun n => profile (reference n) x) atTop (𝓝 (stableLimit x))) ∧
    (∀ x > 0, Tendsto (fun n => profile (recurrent n) x) atTop (𝓝 (recurrentLimit x))) ∧
    stableLimit (1/2) ≠ recurrentLimit (1/2) := by
  refine ⟨?_, reference_profile_limit, recurrent_profile_limit, limits_differ⟩
  intro n hn
  have hs := (reference_is_unique_maximal n hn).1
  have hr := recurrence_is_valid n hn
  exact ⟨hs, hr.2.2, hr.1, hr.2.1⟩
#print axioms fixed_scale_counterexample
end SolitaireCounterexample

namespace SolitaireCounterexample

-- For the finitely many initial deck sizes, use the rule that picks every
-- card. This gives a valid stable/recurrent configuration for every n ≥ 1.
def rule (n : Nat) : Nat := if n < 5 then n else b n
def stableSeq (n : Nat) : List Nat := if n < 5 then [n] else reference n

def StableFor (r n : Nat) (xs : List Nat) : Prop :=
  IsPositivePartition xs ∧ step r xs = xs ∧ xs.sum ≤ n ∧
    ∀ ys, IsPositivePartition ys → step r ys = ys → ys.sum ≤ n → ys.sum ≤ xs.sum

def RecurrentFor (r : Nat) (xs : List Nat) : Prop :=
  ∃ k : Nat, 0 < k ∧ ((step r)^[k]) xs = xs

theorem small_rule_stable (n : Nat) (hn : 0 < n) : step n [n] = [n] := by
  simp [step, normalize, insertPile, Nat.ne_of_gt hn]

theorem stableSeq_valid (n : Nat) (hn : 0 < n) : StableFor (rule n) n (stableSeq n) := by
  by_cases hsmall : n < 5
  · simp only [rule, stableSeq, hsmall, ↓reduceIte]
    refine ⟨?_, small_rule_stable n hn, by simp, ?_⟩
    · simp [IsPositivePartition, hn]
    · intro ys _ _ hmass
      simpa using hmass
  · have hlarge : 5 ≤ n := by omega
    simpa [rule, stableSeq, hsmall, IsStableReference, StableFor] using
      (reference_is_unique_maximal n hlarge).1

theorem recurrentSeq_valid (n : Nat) (hn : 0 < n) :
    IsPositivePartition (recurrent n) ∧ (recurrent n).sum = n ∧ RecurrentFor (rule n) (recurrent n) := by
  by_cases hsmall : n < 5
  · simp only [rule, hsmall, ↓reduceIte]
    refine ⟨?_, by simp [recurrent], ⟨1, by decide, ?_⟩⟩
    · simp [IsPositivePartition, recurrent, hn]
    · simpa [recurrent] using small_rule_stable n hn
  · have hlarge : 5 ≤ n := by omega
    simpa [rule, hsmall, IsRecurrent, RecurrentFor] using recurrence_is_valid n hlarge

theorem stableSeq_profile_limit (x : ℝ) (hx : 0 < x) :
    Tendsto (fun n => profile (stableSeq n) x) atTop (𝓝 (stableLimit x)) := by
  apply Filter.Tendsto.congr' _ (reference_profile_limit x hx)
  filter_upwards [eventually_ge_atTop 5] with n hn
  simp [stableSeq, show ¬n < 5 by omega]

theorem not_stable_shape_for_all_recurrent :
    ¬ (∀ seq : Nat → List Nat,
      (∀ n > 0, IsPositivePartition (seq n) ∧ (seq n).sum = n ∧ RecurrentFor (rule n) (seq n)) →
      ∀ x > 0, Tendsto (fun n => profile (seq n) x) atTop (𝓝 (stableLimit x))) := by
  intro hall
  have hstable := hall recurrent recurrentSeq_valid (1/2) (by norm_num)
  have hother := recurrent_profile_limit (1/2) (by norm_num)
  exact limits_differ (tendsto_nhds_unique hstable hother)

theorem published_fixed_scale_counterexample :
    (∀ n > 0, 0 < rule n ∧ StableFor (rule n) n (stableSeq n)) ∧
    (∀ x > 0, Tendsto (fun n => profile (stableSeq n) x) atTop (𝓝 (stableLimit x))) ∧
    ¬ (∀ seq : Nat → List Nat,
      (∀ n > 0, IsPositivePartition (seq n) ∧ (seq n).sum = n ∧ RecurrentFor (rule n) (seq n)) →
      ∀ x > 0, Tendsto (fun n => profile (seq n) x) atTop (𝓝 (stableLimit x))) := by
  refine ⟨?_, stableSeq_profile_limit, not_stable_shape_for_all_recurrent⟩
  intro n hn
  refine ⟨?_, stableSeq_valid n hn⟩
  by_cases hs : n < 5
  · simpa [rule, hs] using hn
  · simp [rule, hs, b]
#print axioms published_fixed_scale_counterexample
end SolitaireCounterexample

namespace SolitaireCounterexample

def downscaled (a : ℝ) (piles : List Nat) (x : ℝ) : ℝ :=
  (a / (piles.sum : ℝ)) * ((piles.getD (Nat.floor (a*x)) 0 : Nat) : ℝ)

theorem downscaled_one (piles : List Nat) (x : ℝ) : downscaled 1 piles x = profile piles x := by
  simp [downscaled, profile, div_eq_mul_inv, mul_comm]

def LayerStableFor (cutoff n : Nat) (xs : List Nat) : Prop :=
  IsPositivePartition xs ∧ layerStep cutoff xs = xs ∧ xs.sum ≤ n ∧
    ∀ ys, IsPositivePartition ys → layerStep cutoff ys = ys → ys.sum ≤ n → ys.sum ≤ xs.sum

def LayerRecurrentFor (cutoff : Nat) (xs : List Nat) : Prop :=
  ∃ k : Nat, 0 < k ∧ ((layerStep cutoff)^[k]) xs = xs

theorem layer_stable_iff (cutoff n : Nat) (xs : List Nat) :
    LayerStableFor cutoff n xs ↔ StableFor cutoff n xs := by
  simp [LayerStableFor, StableFor, layerStep_eq_step]

theorem layer_recurrent_iff (cutoff : Nat) (xs : List Nat) :
    LayerRecurrentFor cutoff xs ↔ RecurrentFor cutoff xs := by
  have hfun : layerStep cutoff = step cutoff := funext (layerStep_eq_step cutoff)
  simp [LayerRecurrentFor, RecurrentFor, hfun]

theorem layer_scale_one_counterexample :
    (∀ n > 0, 0 < rule n ∧ LayerStableFor (rule n) n (stableSeq n)) ∧
    (∀ x > 0, Tendsto (fun n => downscaled 1 (stableSeq n) x) atTop (𝓝 (stableLimit x))) ∧
    ¬ (∀ seq : Nat → List Nat,
      (∀ n > 0, IsPositivePartition (seq n) ∧ (seq n).sum = n ∧ LayerRecurrentFor (rule n) (seq n)) →
      ∀ x > 0, Tendsto (fun n => downscaled 1 (seq n) x) atTop (𝓝 (stableLimit x))) := by
  simpa only [layer_stable_iff, layer_recurrent_iff, downscaled_one] using
    published_fixed_scale_counterexample
#print axioms layer_scale_one_counterexample
end SolitaireCounterexample

namespace SolitaireCounterexample

theorem stableSeq_unique (n : Nat) (hn : 0 < n) (xs : List Nat)
    (hxs : LayerStableFor (rule n) n xs) : xs = stableSeq n := by
  have hs : StableFor (rule n) n xs := (layer_stable_iff _ _ _).1 hxs
  by_cases hsmall : n < 5
  · simp only [rule, hsmall, ↓reduceIte] at hs
    obtain ⟨_, hfix, hmass, hmax⟩ := hs
    have hpart : IsPositivePartition [n] := by simp [IsPositivePartition, hn]
    have hge : n ≤ xs.sum := by simpa using hmax [n] hpart (small_rule_stable n hn) (by simp)
    have heq : xs.sum = n := Nat.le_antisymm hmass hge
    simpa [stableSeq,hsmall] using full_pick_fixed_unique n hn xs hfix heq
  · have hlarge : 5 ≤ n := by omega
    have hs' : IsStableReference n xs := by simpa [rule,hsmall,StableFor,IsStableReference] using hs
    simpa [stableSeq,hsmall] using (reference_is_unique_maximal n hlarge).2 xs hs'

theorem stableLimit_nonnegative (x : ℝ) : 0 ≤ stableLimit x := by
  unfold stableLimit
  split <;> norm_num
  split <;> norm_num

theorem eriksson_jonsson_sjoestrand_conjecture1_counterexample :
    (∀ n > 0, 0 < rule n ∧ LayerStableFor (rule n) n (stableSeq n) ∧
      ∀ xs, LayerStableFor (rule n) n xs → xs = stableSeq n) ∧
    (∀ x > 0, 0 ≤ stableLimit x ∧
      Tendsto (fun n => downscaled 1 (stableSeq n) x) atTop (𝓝 (stableLimit x))) ∧
    ¬ (∀ seq : Nat → List Nat,
      (∀ n > 0, IsPositivePartition (seq n) ∧ (seq n).sum = n ∧ LayerRecurrentFor (rule n) (seq n)) →
      ∀ x > 0, Tendsto (fun n => downscaled 1 (seq n) x) atTop (𝓝 (stableLimit x))) := by
  have h := layer_scale_one_counterexample
  refine ⟨?_, ?_, h.2.2⟩
  · intro n hn
    exact ⟨(h.1 n hn).1, (h.1 n hn).2, fun xs hs => stableSeq_unique n hn xs hs⟩
  · intro x hx
    exact ⟨stableLimit_nonnegative x, h.2.1 x hx⟩
#print axioms eriksson_jonsson_sjoestrand_conjecture1_counterexample
end SolitaireCounterexample
