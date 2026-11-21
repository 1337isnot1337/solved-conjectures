module

public import Conjectures.GrochenigDensityDefinitions
public import Mathlib.Data.Int.Interval
public import Mathlib.Data.Nat.Cast.Order.Field
public import Mathlib.Order.Interval.Set.Card
public import Mathlib.Order.Filter.AtTopBot.Archimedean
public import Mathlib.Topology.Instances.ENNReal.Lemmas
public import Mathlib.Topology.Order.LiminfLimsup
public import Mathlib.Tactic.NormNum
public import Lean.Elab.Tactic.Omega

/-!
# Counting lemmas for Gröchenig's counterexample

Even support bounds the translation-uniform coefficient sign-change density
by one half. Arbitrarily long alternating blocks give the matching lower
bound. A separate real-window lemma converts the distinct IVT zero witnesses
into a lower bound of one for the real zero-set density.

The estimates use the source densities directly. The real-window lower
bound is transported along natural lengths tending to infinity, with a
proved limsup comparison; no change of density definition is assumed.
-/

@[expose] public section

namespace Grochenig

open Filter Set
open scoped ENNReal Topology

noncomputable section

theorem coefficientSignChanges_nonzero {c : ℤ → ℝ} {j : ℤ}
    (hj : j ∈ coefficientSignChanges c) : c j ≠ 0 := by
  obtain ⟨r, _, hneg, _⟩ := (mem_coefficientSignChanges c j).mp hj
  intro hz
  rw [hz, zero_mul] at hneg
  exact (lt_irrefl 0) hneg

theorem mem_coefficientSignChanges_of_step_two (c : ℤ → ℝ) (j : ℤ)
    (hneg : c j * c (j + 2) < 0) (hzero : c (j + 1) = 0) :
    j ∈ coefficientSignChanges c := by
  refine (mem_coefficientSignChanges c j).mpr ⟨2, by decide, ?_, ?_⟩
  · simpa only [Nat.cast_ofNat] using hneg
  · intro l hl hl2
    have heq : l = 1 := by omega
    simpa only [heq, Nat.cast_one] using hzero

theorem card_le_intervalCount {N : ℕ} (E : Set ℝ) (a R : ℝ)
    (z : Fin N → ℝ) (hz : Function.Injective z)
    (hzE : ∀ i, z i ∈ E) (hzI : ∀ i, z i ∈ Icc a (a + R)) :
    (N : ℝ≥0∞) ≤ intervalCount E a R := by
  have hsub : range z ⊆ E ∩ Icc a (a + R) := by
    rintro x ⟨i, rfl⟩
    exact ⟨hzE i, hzI i⟩
  have h := ENat.toENNReal_mono (Set.encard_mono hsub)
  rw [hz.encard_range] at h
  simpa only [ENat.card_eq_coe_fintype_card, Fintype.card_fin,
    ENat.toENNReal_coe, intervalCount] using h

theorem card_le_intIntervalCount {N : ℕ} (S : Set ℤ) (a : ℤ) (n : ℕ)
    (z : Fin N → ℤ) (hz : Function.Injective z)
    (hzS : ∀ i, z i ∈ S) (hzI : ∀ i, z i ∈ Icc a (a + (n : ℤ))) :
    (N : ℝ≥0∞) ≤ intIntervalCount S a n := by
  have hsub : range z ⊆ S ∩ Icc a (a + (n : ℤ)) := by
    rintro x ⟨i, rfl⟩
    exact ⟨hzS i, hzI i⟩
  have h := ENat.toENNReal_mono (Set.encard_mono hsub)
  rw [hz.encard_range] at h
  simpa only [ENat.card_eq_coe_fintype_card, Fintype.card_fin,
    ENat.toENNReal_coe, intIntervalCount] using h

/-- A uniform finite-window bound; the fixed endpoint allowance disappears
after division by the window length. -/
theorem intIntervalCount_le_of_even (S : Set ℤ) (hS : ∀ j ∈ S, Even j)
    (a : ℤ) (n : ℕ) : intIntervalCount S a n ≤ ((n / 2 + 2 : ℕ) : ℝ≥0∞) := by
  have hmap : MapsTo (fun j : ℤ => j / 2) (S ∩ Icc a (a + (n : ℤ)))
      (Icc (a / 2) ((a + (n : ℤ)) / 2)) := by
    intro j hj
    change a / 2 ≤ j / 2 ∧ j / 2 ≤ (a + (n : ℤ)) / 2
    exact ⟨Int.ediv_le_ediv (by norm_num) hj.2.1,
      Int.ediv_le_ediv (by norm_num) hj.2.2⟩
  have hinj : InjOn (fun j : ℤ => j / 2) (S ∩ Icc a (a + (n : ℤ))) := by
    intro i hi j hj hij
    obtain ⟨u, hu⟩ := hS i hi.1
    obtain ⟨v, hv⟩ := hS j hj.1
    change i = u + u at hu
    change j = v + v at hv
    change i / 2 = j / 2 at hij
    omega
  have hcard : (Finset.Icc (a / 2) ((a + (n : ℤ)) / 2)).card ≤ n / 2 + 2 := by
    rw [Int.card_Icc]
    omega
  have henc : (S ∩ Icc a (a + (n : ℤ))).encard ≤ ((n / 2 + 2 : ℕ) : ℕ∞) := by
    refine (Set.encard_le_encard_of_injOn hmap hinj).trans ?_
    rw [Set.encard_Icc]
    exact_mod_cast hcard
  exact (ENat.toENNReal_le_natCast).2 henc

private theorem nat_half_cast_le (n : ℕ) :
    ((n / 2 : ℕ) : ℝ≥0∞) ≤ (n : ℝ≥0∞) / 2 := by
  have h := ENNReal.ofReal_le_ofReal (Nat.cast_div_le (α := ℝ) (m := n) (n := 2))
  simp only [Nat.cast_ofNat] at h
  rw [ENNReal.ofReal_div_of_pos (by norm_num : (0 : ℝ) < 2)] at h
  simpa only [ENNReal.ofReal_natCast, ENNReal.ofReal_ofNat] using h

private theorem half_div_nat (n : ℕ) (hn : 0 < n) :
    ((n : ℝ≥0∞) / 2) / (n : ℝ≥0∞) = (1 : ℝ≥0∞) / 2 := by
  have hn0 : (n : ℝ≥0∞) ≠ 0 := by exact_mod_cast hn.ne'
  calc
    _ = ((1 / 2 : ℝ≥0∞) * (n : ℝ≥0∞)) / (n : ℝ≥0∞) := by
      congr 1
      simp only [div_eq_mul_inv, one_mul, mul_comm]
    _ = _ := ENNReal.mul_div_cancel_right hn0 (by simp)

theorem upperIntegerDensity_le_half_of_even (S : Set ℤ)
    (hS : ∀ j ∈ S, Even j) : upperIntegerDensity S ≤ (1 : ℝ≥0∞) / 2 := by
  have hbound : ∀ᶠ n : ℕ in atTop,
      (⨆ a : ℤ, intIntervalCount S a n / (n : ℝ≥0∞)) ≤
        (1 : ℝ≥0∞) / 2 + 2 / (n : ℝ≥0∞) := by
    filter_upwards [eventually_ge_atTop 1] with n hn
    have hnpos : 0 < n := by omega
    apply iSup_le
    intro a
    have hc : intIntervalCount S a n ≤ (n : ℝ≥0∞) / 2 + 2 := by
      refine (intIntervalCount_le_of_even S hS a n).trans ?_
      simpa only [Nat.cast_add, Nat.cast_ofNat] using
        add_le_add (nat_half_cast_le n) (le_refl (2 : ℝ≥0∞))
    calc
      _ ≤ ((n : ℝ≥0∞) / 2 + 2) / (n : ℝ≥0∞) := ENNReal.div_le_div_right hc _
      _ = _ := by rw [ENNReal.add_div, half_div_nat n hnpos]
  have hvanish : Tendsto (fun n : ℕ => (2 : ℝ≥0∞) / (n : ℝ≥0∞)) atTop (𝓝 0) := by
    simpa only [div_eq_mul_inv, mul_zero] using
      (ENNReal.Tendsto.const_mul (a := (2 : ℝ≥0∞)) ENNReal.tendsto_inv_nat_nhds_zero
        (by simp))
  have hlim : Tendsto (fun n : ℕ => (1 : ℝ≥0∞) / 2 + 2 / (n : ℝ≥0∞)) atTop
      (𝓝 ((1 : ℝ≥0∞) / 2)) := by
    simpa only [add_zero] using (tendsto_const_nhds.add hvanish)
  calc
    upperIntegerDensity S ≤ Filter.limsup
        (fun n : ℕ => (1 : ℝ≥0∞) / 2 + 2 / (n : ℝ≥0∞)) atTop :=
      Filter.limsup_le_limsup hbound
    _ = _ := hlim.limsup_eq

theorem upperCoefficientDensity_le_half (c : ℤ → ℝ)
    (hEven : ∀ j, c j ≠ 0 → Even j) : upperCoefficientDensity c ≤ (1 : ℝ≥0∞) / 2 :=
  upperIntegerDensity_le_half_of_even (coefficientSignChanges c)
    (fun j hj => hEven j (coefficientSignChanges_nonzero hj))

/-- Arbitrarily long blocks of sign changes at spacing two give the exact
lower bound, regardless of the distances between blocks. -/
theorem half_le_upperCoefficientDensity (c : ℤ → ℝ)
    (hblocks : ∀ N : ℕ, 0 < N → ∃ L : ℤ,
      ∀ k : Fin N, L + 2 * (k.val : ℤ) ∈ coefficientSignChanges c) :
    (1 : ℝ≥0∞) / 2 ≤ upperCoefficientDensity c := by
  let u (n : ℕ) : ℝ≥0∞ := ⨆ a : ℤ,
    intIntervalCount (coefficientSignChanges c) a n / (n : ℝ≥0∞)
  have hdouble : Tendsto (fun n : ℕ => 2 * n) atTop atTop := by
    refine tendsto_atTop.2 fun b => ?_
    filter_upwards [eventually_ge_atTop b] with n hn
    omega
  have hbound : ∀ᶠ N : ℕ in atTop, (1 : ℝ≥0∞) / 2 ≤ u (2 * N) := by
    filter_upwards [eventually_ge_atTop 1] with N hN
    have hNpos : 0 < N := by omega
    obtain ⟨L, hL⟩ := hblocks N hNpos
    have hcount : (N : ℝ≥0∞) ≤ intIntervalCount (coefficientSignChanges c) L (2 * N) := by
      apply card_le_intIntervalCount _ _ _ (fun k : Fin N => L + 2 * (k.val : ℤ))
      · intro i j hij
        change L + 2 * (i.val : ℤ) = L + 2 * (j.val : ℤ) at hij
        apply Fin.ext
        omega
      · exact hL
      · intro i
        constructor <;> omega
    have hN0 : (N : ℝ≥0∞) ≠ 0 := by exact_mod_cast hNpos.ne'
    have hratio : (N : ℝ≥0∞) / ((2 * N : ℕ) : ℝ≥0∞) = (1 : ℝ≥0∞) / 2 := by
      rw [Nat.cast_mul, Nat.cast_ofNat]
      simpa only [one_mul] using
        (ENNReal.mul_div_mul_right (c := (N : ℝ≥0∞)) 1 2 hN0 (by simp))
    calc
      _ = (N : ℝ≥0∞) / ((2 * N : ℕ) : ℝ≥0∞) := hratio.symm
      _ ≤ intIntervalCount (coefficientSignChanges c) L (2 * N) /
          ((2 * N : ℕ) : ℝ≥0∞) := ENNReal.div_le_div_right hcount _
      _ ≤ u (2 * N) :=
        le_iSup (fun a : ℤ => intIntervalCount (coefficientSignChanges c) a (2 * N) /
          ((2 * N : ℕ) : ℝ≥0∞)) L
  have hlow : (1 : ℝ≥0∞) / 2 ≤ Filter.limsup (fun N => u (2 * N)) atTop :=
    Filter.le_limsup_of_frequently_le hbound.frequently
  have hcomp : Filter.limsup (fun N => u (2 * N)) atTop ≤ Filter.limsup u atTop :=
    hdouble.limsup_comp_le_limsup (u := u)
  rw [upperCoefficientDensity_eq, upperIntegerDensity_eq]
  exact hlow.trans hcomp

/-- Integer lengths form an unbounded sequence of legitimate real windows.
The conclusion is the density with arbitrary real lengths and translations. -/
theorem one_le_upperBeurlingDensity_of_windows (E : Set ℝ)
    (h : ∀ N : ℕ, 0 < N → ∃ a : ℝ, (N : ℝ≥0∞) ≤ intervalCount E a (N : ℝ)) :
    1 ≤ upperBeurlingDensity E := by
  let u (R : ℝ) : ℝ≥0∞ := ⨆ a : ℝ, intervalCount E a R / ENNReal.ofReal R
  have hbound : ∀ᶠ N : ℕ in atTop, 1 ≤ u (N : ℝ) := by
    filter_upwards [eventually_ge_atTop 1] with N hN
    have hNpos : 0 < N := by omega
    obtain ⟨a, ha⟩ := h N hNpos
    have hN0 : (N : ℝ≥0∞) ≠ 0 := by exact_mod_cast hNpos.ne'
    calc
      1 = (N : ℝ≥0∞) / (N : ℝ≥0∞) := (ENNReal.div_self hN0 (by simp)).symm
      _ ≤ intervalCount E a (N : ℝ) / (N : ℝ≥0∞) := ENNReal.div_le_div_right ha _
      _ = intervalCount E a (N : ℝ) / ENNReal.ofReal (N : ℝ) := by
        rw [ENNReal.ofReal_natCast]
      _ ≤ u (N : ℝ) :=
        le_iSup (fun a : ℝ => intervalCount E a (N : ℝ) /
          ENNReal.ofReal (N : ℝ)) a
  have hcast : Tendsto (fun N : ℕ => (N : ℝ)) atTop atTop := tendsto_natCast_atTop_atTop
  have hlow : 1 ≤ Filter.limsup (fun N : ℕ => u (N : ℝ)) atTop :=
    Filter.le_limsup_of_frequently_le hbound.frequently
  have hcomp : Filter.limsup (fun N : ℕ => u (N : ℝ)) atTop ≤ Filter.limsup u atTop :=
    hcast.limsup_comp_le_limsup (u := u)
  rw [upperBeurlingDensity_eq]
  exact hlow.trans hcomp

end

end Grochenig
