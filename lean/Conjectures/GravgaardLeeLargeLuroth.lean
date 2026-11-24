import Mathlib.Algebra.Order.Floor.Semiring
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Topology.Algebra.InfiniteSum.ENNReal
import Mathlib.Topology.Order.MonotoneConvergence
import Mathlib.Tactic

/-! The large-digit Lüroth sumset theorem of Gravgaard–Lee, Conjecture 2.12.
The witnesses have strictly increasing interleaved digits. -/

open Filter Finset
open scoped Topology Pointwise

namespace GravgaardLeeLargeLuroth

noncomputable section

/-- Scale of a Lüroth cylinder relative to its parent cylinder. -/
def width (d : ℕ) : ℝ := 1 / ((d : ℝ) * ((d : ℝ) - 1))

theorem width_pos {d : ℕ} (hd : 2 ≤ d) : 0 < width d := by
  have h : (2 : ℝ) ≤ d := by exact_mod_cast hd
  have hd1 : 0 < (d : ℝ) - 1 := by linarith
  unfold width
  positivity

theorem digitTop {d : ℕ} (hd : 2 ≤ d) :
    1 / (d : ℝ) + width d = 1 / ((d : ℝ) - 1) := by
  have h : (2 : ℝ) ≤ d := by exact_mod_cast hd
  have hd0 : (d : ℝ) ≠ 0 := by linarith
  have hd1 : (d : ℝ) - 1 ≠ 0 := by linarith
  unfold width
  field_simp [hd0, hd1]
  ring

/-- Truncated version of the source's Lüroth series. -/
def truncation (a : ℕ → ℕ) (n : ℕ) : ℝ :=
  ∑ i ∈ range n, (∏ j ∈ range i, width (a j)) / (a i : ℝ)

theorem prefix_succ (a : ℕ → ℕ) (n : ℕ) :
    truncation a (n + 1) = truncation a n + (∏ j ∈ range n, width (a j)) / (a n : ℝ) := by
  simp [truncation, sum_range_succ]

theorem prefix_head (a : ℕ → ℕ) (n : ℕ) :
    truncation a (n + 1) = 1 / (a 0 : ℝ) + width (a 0) * truncation (fun i => a (i + 1)) n := by
  unfold truncation
  rw [sum_range_succ']
  simp only [range_zero, prod_empty]
  rw [mul_sum, add_comm]
  congr 1
  apply sum_congr rfl
  intro i _
  rw [prod_range_succ']
  ring

theorem prefix_mem (a : ℕ → ℕ) (ha : ∀ i, 2 ≤ a i) (n : ℕ) : truncation a n ∈ Set.Icc 0 1 := by
  induction n generalizing a with
  | zero => simp [truncation]
  | succ n ih =>
    have h := ih (fun i => a (i + 1)) (fun i => ha (i + 1))
    have hd : (2 : ℝ) ≤ a 0 := by exact_mod_cast ha 0
    have hw := width_pos (ha 0)
    rw [prefix_head]
    constructor
    · exact add_nonneg (by positivity) (mul_nonneg hw.le h.1)
    · calc
        _ ≤ 1 / (a 0 : ℝ) + width (a 0) * 1 :=
          add_le_add_right (mul_le_mul_of_nonneg_left h.2 hw.le) _
        _ = 1 / ((a 0 : ℝ) - 1) := by rw [mul_one, digitTop (ha 0)]
        _ ≤ 1 := (div_le_iff₀ (by linarith)).2 (by linarith)

/-- The series value of a Lüroth digit string. -/
def value (a : ℕ → ℕ) : ℝ := ⨆ n, truncation a n

theorem prefix_le_value (a : ℕ → ℕ) (ha : ∀ i, 2 ≤ a i) (n : ℕ) :
    truncation a n ≤ value a :=
  le_ciSup ⟨1, by rintro _ ⟨i, rfl⟩; exact (prefix_mem a ha i).2⟩ n

theorem value_mem (a : ℕ → ℕ) (ha : ∀ i, 2 ≤ a i) : value a ∈ Set.Ioc 0 1 := by
  constructor
  · have hd : (2 : ℝ) ≤ a 0 := by exact_mod_cast ha 0
    have hp : truncation a 1 = 1 / (a 0 : ℝ) := by simp [truncation]
    exact lt_of_lt_of_le (show 0 < truncation a 1 by rw [hp]; positivity) (prefix_le_value a ha 1)
  · exact ciSup_le (fun n => (prefix_mem a ha n).2)

theorem tendsto_prefix (a : ℕ → ℕ) (ha : ∀ i, 2 ≤ a i) :
    Tendsto (truncation a) atTop (𝓝 (value a)) := by
  apply tendsto_atTop_ciSup (monotone_nat_of_le_succ ?_)
    ⟨1, by rintro _ ⟨i, rfl⟩; exact (prefix_mem a ha i).2⟩
  intro n
  rw [prefix_succ]
  have hd : (2 : ℝ) ≤ a n := by exact_mod_cast ha n
  exact le_add_of_nonneg_right
    (div_nonneg (prod_nonneg fun j _ => (width_pos (ha j)).le) (by linarith))

theorem value_head (a : ℕ → ℕ) (ha : ∀ i, 2 ≤ a i) :
    value a = 1 / (a 0 : ℝ) + width (a 0) * value (fun i => a (i + 1)) := by
  apply tendsto_nhds_unique ((tendsto_prefix a ha).comp (tendsto_add_atTop_nat 1))
  have h := (tendsto_const_nhds (x := 1 / (a 0 : ℝ))).add
    ((tendsto_prefix (fun i => a (i + 1)) (fun i => ha (i + 1))).const_mul (width (a 0)))
  change Tendsto (fun n => truncation a (n + 1)) atTop _
  simpa only [prefix_head] using h

/-- The digit and affine tail recursion on the half-open source cylinders. -/
def IsExpansion (a : ℕ → ℕ) (y : ℝ) : Prop :=
  ∃ tails : ℕ → ℝ, tails 0 = y ∧ ∀ i,
    tails i ∈ Set.Ioc (1 / (a i : ℝ)) (1 / ((a i : ℝ) - 1)) ∧
      tails i = 1 / (a i : ℝ) + width (a i) * tails (i + 1)

theorem value_isExpansion (a : ℕ → ℕ) (ha : ∀ i, 2 ≤ a i) :
    IsExpansion a (value a) := by
  refine ⟨fun i => value (fun j => a (i + j)), by simp, ?_⟩
  intro i
  have htail := value_mem (fun j => a ((i + 1) + j)) (fun j => ha ((i + 1) + j))
  have heq : value (fun j => a (i + j)) =
      1 / (a i : ℝ) + width (a i) * value (fun j => a ((i + 1) + j)) := by
    have hshift : (fun j => a (i + (j + 1))) = fun j => a ((i + 1) + j) := by
      funext j
      congr 1
      omega
    simpa only [Nat.add_zero, hshift] using
      value_head (fun j => a (i + j)) (fun j => ha (i + j))
  refine ⟨?_, heq⟩
  change value (fun j => a (i + j)) ∈ _
  rw [heq]
  exact ⟨lt_add_of_pos_right _ (mul_pos (width_pos (ha i)) htail.1),
    (add_le_add_right (mul_le_of_le_one_right (width_pos (ha i)).le htail.2) _).trans_eq
      (digitTop (ha i))⟩

private structure State where
  residual : ℝ
  active : ℝ
  waiting : ℝ

private def State.valid (s : State) : Prop :=
  0 < s.residual ∧ s.residual ≤ s.active ∧ s.residual ≤ s.waiting

private def digit (s : State) : ℕ := ⌊s.active / s.residual⌋₊ + 1

private def step (s : State) : State :=
  ⟨s.residual - s.active / (digit s : ℝ), s.waiting, s.active * width (digit s)⟩

private theorem floor_bounds {s : State} (hs : s.valid) :
    2 ≤ digit s ∧
    ((digit s : ℝ) - 1) * s.residual ≤ s.active ∧
    s.active < (digit s : ℝ) * s.residual := by
  obtain ⟨hz, hp, _⟩ := hs
  have hratio : (1 : ℝ) ≤ s.active / s.residual := by
    exact (le_div_iff₀ hz).2 (by simpa using hp)
  have hnonneg := zero_le_one.trans hratio
  have hlo := Nat.floor_le hnonneg
  have hhi := Nat.lt_floor_add_one (s.active / s.residual)
  have hd : 1 ≤ ⌊s.active / s.residual⌋₊ := Nat.le_floor (by simpa using hratio)
  refine ⟨by unfold digit; omega, ?_, ?_⟩
  · simpa [digit] using (le_div_iff₀ hz).1 hlo
  · simpa [digit] using (div_lt_iff₀ hz).1 hhi

private theorem step_bounds {s : State} (hs : s.valid) :
    (step s).valid ∧ (step s).residual ≤ s.residual / (digit s : ℝ) := by
  obtain ⟨hd, hlo, hhi⟩ := floor_bounds hs
  obtain ⟨hz, _, hq⟩ := hs
  have hdR : (2 : ℝ) ≤ digit s := by exact_mod_cast hd
  have hd0 : 0 < (digit s : ℝ) := by linarith
  have hd1 : 0 < (digit s : ℝ) - 1 := by linarith
  have hres : 0 < (step s).residual := by
    change 0 < s.residual - s.active / (digit s : ℝ)
    exact sub_pos.mpr ((div_lt_iff₀ hd0).2 (by rwa [mul_comm]))
  have hcontract : (step s).residual ≤ s.residual / (digit s : ℝ) := by
    change s.residual - s.active / (digit s : ℝ) ≤ s.residual / (digit s : ℝ)
    apply (le_div_iff₀ hd0).2
    rw [sub_mul, div_mul_cancel₀ _ hd0.ne']
    nlinarith
  have hscale : s.residual / (digit s : ℝ) ≤ s.active * width (digit s) := by
    change s.residual / (digit s : ℝ) ≤ s.active * (1 / ((digit s : ℝ) * ((digit s : ℝ) - 1)))
    rw [mul_one_div]
    apply (le_div_iff₀ (mul_pos hd0 hd1)).2
    rw [← mul_assoc, div_mul_cancel₀ _ hd0.ne', mul_comm s.residual]
    exact hlo
  refine ⟨⟨hres, ?_, hcontract.trans hscale⟩, hcontract⟩
  exact hcontract.trans ((div_le_self hz.le (by linarith)).trans hq)

private theorem digit_increases {s : State} (hs : s.valid) :
    digit s < digit (step s) := by
  have hnext := step_bounds hs
  have hd : (0 : ℝ) ≤ digit s := Nat.cast_nonneg _
  have hmul : (digit s : ℝ) * (step s).residual ≤ s.residual := by
    rw [mul_comm]
    exact (le_div_iff₀ (by
      have h : (2 : ℝ) ≤ digit s := by exact_mod_cast (floor_bounds hs).1
      linarith)).1 hnext.2
  have hf : digit s ≤ ⌊(step s).active / (step s).residual⌋₊ :=
    Nat.le_floor ((le_div_iff₀ hnext.1.1).2 (hmul.trans hs.2.2))
  change digit s < _ + 1
  omega

private def states (x : ℝ) (n : ℕ) : State := (step^[n]) ⟨x, 1, 1⟩

private theorem states_succ (x : ℝ) (n : ℕ) : states x (n + 1) = step (states x n) := by
  simp [states, Function.iterate_succ_apply']

private theorem states_valid {x : ℝ} (hx : 0 < x) (hx1 : x ≤ 1) (n : ℕ) :
    (states x n).valid := by
  induction n with
  | zero => exact ⟨hx, hx1, hx1⟩
  | succ n ih => rw [states_succ]; exact (step_bounds ih).1

private theorem states_scale (x : ℝ) (n : ℕ) :
    (states x (n + 2)).active =
      (states x n).active * width (digit (states x n)) := by
  rw [states_succ, states_succ x n]
  rfl

private theorem residual_halves {x : ℝ} (hx : 0 < x) (hx1 : x ≤ 1) (n : ℕ) :
    (states x (n + 1)).residual ≤ (states x n).residual / 2 := by
  rw [states_succ]
  have hv := states_valid hx hx1 n
  have hd : (2 : ℝ) ≤ digit (states x n) := by exact_mod_cast (floor_bounds hv).1
  exact (step_bounds hv).2.trans (div_le_div_of_nonneg_left hv.1.le (by norm_num) hd)

private theorem residual_tendsto {x : ℝ} (hx : 0 < x) (hx1 : x ≤ 1) :
    Tendsto (fun n => (states x n).residual) atTop (𝓝 0) := by
  have hbound (n : ℕ) : (states x n).residual ≤ x * (1 / 2 : ℝ) ^ n := by
    induction n with
    | zero => simp [states]
    | succ n ih =>
      calc
        _ ≤ (states x n).residual / 2 := residual_halves hx hx1 n
        _ ≤ (x * (1 / 2 : ℝ) ^ n) / 2 := by linarith
        _ = _ := by rw [pow_succ]; ring
  have hlim := (tendsto_pow_atTop_nhds_zero_of_lt_one
    (by norm_num : (0 : ℝ) ≤ 1 / 2) (by norm_num : (1 / 2 : ℝ) < 1)).const_mul x
  rw [mul_zero] at hlim
  exact tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hlim
    (fun n => (states_valid hx hx1 n).1.le) hbound

private def digits (x : ℝ) (offset n : ℕ) : ℕ := digit (states x (2 * n + offset))

private theorem prefix_scale (x : ℝ) {offset : ℕ} (hoffset : offset ≤ 1) (n : ℕ) :
    (states x (2 * n + offset)).active = ∏ j ∈ range n, width (digits x offset j) := by
  induction n with
  | zero =>
    have h : offset = 0 ∨ offset = 1 := by omega
    rcases h with rfl | rfl
    · simp [states]
    · simp [states, step]
  | succ n ih =>
    rw [show 2 * (n + 1) + offset = 2 * n + offset + 2 by omega,
      states_scale, ih, prod_range_succ, digits]

private theorem prefix_sum (x : ℝ) (n : ℕ) :
    truncation (digits x 0) n + truncation (digits x 1) n + (states x (2 * n)).residual = x := by
  induction n with
  | zero => simp [truncation, states]
  | succ n ih =>
    have h0 := prefix_scale x (offset := 0) (by omega) n
    have h1 := prefix_scale x (offset := 1) (by omega) n
    have hstep (j : ℕ) : (states x (j + 1)).residual =
        (states x j).residual - (states x j).active / (digit (states x j) : ℝ) := by
      rw [states_succ]
      rfl
    rw [prefix_succ, prefix_succ, ← h0, ← h1,
      show 2 * (n + 1) = 2 * n + 1 + 1 by omega, hstep, hstep]
    simp only [digits, Nat.add_zero]
    linarith

/-- Every point of the claimed interval is a sum of two Lüroth series
with digits at least `k`, and their interleaved digits strictly increase. -/
theorem interleaved_decomposition {k : ℕ} (hk : 2 ≤ k) {x : ℝ}
    (hx : 0 < x) (hmax : x ≤ 1 / ((k : ℝ) - 1)) :
    ∃ a b : ℕ → ℕ, (∀ i, k ≤ a i ∧ a i < b i ∧ b i < a (i + 1)) ∧
      IsExpansion a (value a) ∧ IsExpansion b (value b) ∧ value a + value b = x := by
  have hkR : (2 : ℝ) ≤ k := by exact_mod_cast hk
  have hk1 : 0 < (k : ℝ) - 1 := by linarith
  have hx1 : x ≤ 1 := hmax.trans ((div_le_iff₀ hk1).2 (by linarith))
  have hstrict : StrictMono (fun n => digit (states x n)) := by
    apply strictMono_nat_of_lt_succ
    intro n
    rw [states_succ]
    exact digit_increases (states_valid hx hx1 n)
  have hinit : k ≤ digit (states x 0) := by
    have hbound : ((k : ℝ) - 1) ≤ 1 / x :=
      (le_div_iff₀ hx).2 (by simpa [mul_comm] using (le_div_iff₀ hk1).1 hmax)
    have hfloor : k - 1 ≤ ⌊1 / x⌋₊ := Nat.le_floor (by
      simpa [Nat.cast_sub (by omega : 1 ≤ k)] using hbound)
    change k ≤ ⌊1 / x⌋₊ + 1
    omega
  have ha (n : ℕ) : k ≤ digits x 0 n :=
    hinit.trans (hstrict.monotone (Nat.zero_le _))
  have hb (n : ℕ) : k ≤ digits x 1 n := ha n |>.trans (hstrict (by omega)).le
  have ha2 (n : ℕ) : 2 ≤ digits x 0 n := hk.trans (ha n)
  have hb2 (n : ℕ) : 2 ≤ digits x 1 n := hk.trans (hb n)
  refine ⟨digits x 0, digits x 1, fun i => ⟨ha i, hstrict (by omega), hstrict (by omega)⟩,
    value_isExpansion _ ha2, value_isExpansion _ hb2, ?_⟩
  have hsub := (residual_tendsto hx hx1).comp (tendsto_atTop_mono (fun n => show n ≤ 2 * n by omega)
    tendsto_id)
  have hlim := ((tendsto_prefix _ ha2).add (tendsto_prefix _ hb2)).add hsub
  simp only [add_zero, Function.comp_apply] at hlim
  have heq : (fun n => truncation (digits x 0) n + truncation (digits x 1) n +
      (states x (2 * n)).residual) = fun _ => x := funext (prefix_sum x)
  rw [heq] at hlim
  exact tendsto_nhds_unique hlim tendsto_const_nhds

/-- The `i`-th term of the source's series, using zero-based indexing. -/
def sourceTerm (a : ℕ → ℕ) (i : ℕ) : ℝ :=
  1 / ((a i : ℝ) * ∏ j ∈ range i, ((a j : ℝ) * ((a j : ℝ) - 1)))

theorem value_hasSum (a : ℕ → ℕ) (ha : ∀ i, 2 ≤ a i) :
    HasSum (sourceTerm a) (value a) := by
  have hterm (i : ℕ) :
      sourceTerm a i = (∏ j ∈ range i, width (a j)) / (a i : ℝ) := by
    simp only [sourceTerm, width, div_eq_mul_inv, one_mul]
    rw [mul_inv, ← Finset.prod_inv_distrib]
    exact mul_comm _ _
  apply (hasSum_iff_tendsto_nat_of_nonneg (fun i => ?_) _).2
  · have hpartial : (fun n => ∑ i ∈ range n, sourceTerm a i) = truncation a := by
      funext n
      unfold truncation
      exact sum_congr rfl (fun i _ => hterm i)
    rw [hpartial]
    exact tendsto_prefix a ha
  · rw [hterm]
    exact div_nonneg (prod_nonneg fun j _ => (width_pos (ha j)).le) (Nat.cast_nonneg _)

/-- The source's set of values of infinite digit strings bounded below by `k`. -/
def largeDigitSet (k : ℕ) : Set ℝ :=
  {y | ∃ a : ℕ → ℕ, (∀ i, k ≤ a i) ∧ HasSum (sourceTerm a) y}

/-- The stronger interval containment asserted in the repository proof. -/
theorem interval_subset_sum {k : ℕ} (hk : 2 ≤ k) :
    Set.Ioc (0 : ℝ) (1 / ((k : ℝ) - 1)) ⊆ largeDigitSet k + largeDigitSet k := by
  intro x hx
  obtain ⟨a, b, hd, _, _, hsum⟩ := interleaved_decomposition hk hx.1 hx.2
  have ha (i : ℕ) := (hd i).1
  have hb (i : ℕ) := (ha i).trans (hd i).2.1.le
  exact ⟨value a, ⟨a, ha, value_hasSum a fun i => hk.trans (ha i)⟩,
    value b, ⟨b, hb, value_hasSum b fun i => hk.trans (hb i)⟩, hsum⟩

/-- Gravgaard–Lee, Conjecture 2.12, in its stated positive-length form. -/
theorem conjecture_2_12 {k : ℕ} (hk : 2 ≤ k) :
    ∃ l u : ℝ, l < u ∧ Set.Ioc l u ⊆ largeDigitSet k + largeDigitSet k := by
  refine ⟨0, 1 / ((k : ℝ) - 1), ?_, interval_subset_sum hk⟩
  have hkR : (2 : ℝ) ≤ k := by exact_mod_cast hk
  exact one_div_pos.mpr (by linarith)

end

end GravgaardLeeLargeLuroth
