module

public import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Data.Finset.Card
public import Mathlib.RingTheory.PowerSeries.Expand
public import Mathlib.Topology.Instances.Real.Lemmas
public import Mathlib.Tactic.Abel
public import Mathlib.Tactic.Ring

/-!
# Gawron–Miska–Ulas's sign-density conjecture

The coefficient of the square of the Thue–Morse series is the convolution
of its signed binary-digit sequence with itself. For each proposal about
the signs in residues 0 and 1 modulo 3, a signed exception occurs in every
block of 512 or 256 input indices, respectively. In particular neither
exception set has natural density zero.
-/

public section

namespace Conjectures.GawronMiskaUlasDensity

open scoped BigOperators

/-- The coefficient \((-1)^{s_2(n)}\) of the Thue–Morse product, obtained
by removing the least significant digit at each step. -/
def thueMorse (n : ℕ) : ℤ :=
  if _h : n = 0 then 1
  else if n % 2 = 0 then thueMorse (n / 2)
  else -thueMorse (n / 2)
termination_by n
decreasing_by all_goals omega

@[simp] theorem thueMorse_zero : thueMorse 0 = 1 := by
  rw [thueMorse]
  simp

@[simp] theorem thueMorse_even (m : ℕ) : thueMorse (2 * m) = thueMorse m := by
  by_cases h : m = 0
  · simp [h]
  · rw [thueMorse]
    have hn : 2 * m ≠ 0 := by omega
    have hd : (2 * m) / 2 = m := by omega
    have hm : (2 * m) % 2 = 0 := by omega
    rw [dite_eq_right hn, ite_eq_left hm, hd]

@[simp] theorem thueMorse_odd (m : ℕ) : thueMorse (2 * m + 1) = -thueMorse m := by
  rw [thueMorse]
  have hn : 2 * m + 1 ≠ 0 := by omega
  have hd : (2 * m + 1) / 2 = m := by omega
  have hm : (2 * m + 1) % 2 ≠ 0 := by omega
  rw [dite_eq_right hn, ite_eq_right hm, hd]

/-- Coefficient of the square of the signed-digit series. -/
def coeff (n : ℕ) : ℤ :=
  ∑ k ∈ Finset.range (n + 1), thueMorse k * thueMorse (n - k)

private theorem split_even (f : ℕ → ℤ) (n : ℕ) :
    ∑ k ∈ Finset.range (2*n+1), f k =
      (∑ k ∈ Finset.range (n+1), f (2*k)) +
      ∑ k ∈ Finset.range n, f (2*k+1) := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [show 2*(n+1)+1 = ((2*n+1)+1)+1 by omega,
        Finset.sum_range_succ f ((2*n+1)+1),
        Finset.sum_range_succ f (2*n+1), ih,
        Finset.sum_range_succ (fun k => f (2*k)) (n+1),
        Finset.sum_range_succ (fun k => f (2*k+1)) n]
    rw [show (2*n+1)+1=2*(n+1) by omega]
    abel

private theorem split_odd (f : ℕ → ℤ) (n : ℕ) :
    ∑ k ∈ Finset.range (2*n+2), f k =
      (∑ k ∈ Finset.range (n+1), f (2*k)) +
      ∑ k ∈ Finset.range (n+1), f (2*k+1) := by
  rw [show 2*n+2=(2*n+1)+1 by omega, Finset.sum_range_succ, split_even]
  rw [Finset.sum_range_succ (fun k => f (2*k+1))]
  abel

@[simp] theorem coeff_zero : coeff 0 = 1 := by simp [coeff]

theorem coeff_odd (n : ℕ) : coeff (2*n+1) = -2 * coeff n := by
  unfold coeff
  rw [show 2*n+1+1=2*n+2 by omega, split_odd]
  have h1 : ∀ k ∈ Finset.range (n+1),
      thueMorse (2*k) * thueMorse (2*n+1-2*k) =
        -(thueMorse k * thueMorse (n-k)) := by
    intro k hk
    have h : k < n+1 := Finset.mem_range.mp hk
    rw [show 2*n+1-2*k=2*(n-k)+1 by omega, thueMorse_even, thueMorse_odd]
    ring
  have h2 : ∀ k ∈ Finset.range (n+1),
      thueMorse (2*k+1) * thueMorse (2*n+1-(2*k+1)) =
        -(thueMorse k * thueMorse (n-k)) := by
    intro k hk
    have h : k < n+1 := Finset.mem_range.mp hk
    rw [show 2*n+1-(2*k+1)=2*(n-k) by omega, thueMorse_odd, thueMorse_even]
    ring
  rw [Finset.sum_congr rfl h1, Finset.sum_congr rfl h2]
  simp only [Finset.sum_neg_distrib]
  ring

theorem coeff_even_succ (n : ℕ) : coeff (2*(n+1)) = coeff (n+1) + coeff n := by
  unfold coeff
  rw [split_even]
  have h1 : ∀ k ∈ Finset.range (n+1+1),
      thueMorse (2*k) * thueMorse (2*(n+1)-2*k) =
        thueMorse k * thueMorse ((n+1)-k) := by
    intro k hk
    have h : k < n+1+1 := Finset.mem_range.mp hk
    rw [show 2*(n+1)-2*k=2*((n+1)-k) by omega, thueMorse_even, thueMorse_even]
  have h2 : ∀ k ∈ Finset.range (n+1),
      thueMorse (2*k+1) * thueMorse (2*(n+1)-(2*k+1)) =
        thueMorse k * thueMorse (n-k) := by
    intro k hk
    have h : k < n+1 := Finset.mem_range.mp hk
    rw [show 2*(n+1)-(2*k+1)=2*(n-k)+1 by omega, thueMorse_odd, thueMorse_odd]
    ring
  rw [Finset.sum_congr rfl h1, Finset.sum_congr rfl h2]

private theorem coeff_parity (n : ℕ) : coeff n % 2 = if n % 2 = 0 then 1 else 0 := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases he : n % 2 = 0
    · by_cases hn : n = 0
      · subst n
        simp
      · have h : n = 2 * (n / 2 - 1 + 1) := by omega
        have hm1 : n / 2 - 1 + 1 < n := by omega
        have hm2 : n / 2 - 1 < n := by omega
        have h1 := ih _ hm1
        have h2 := ih _ hm2
        rw [ite_eq_left he, h, coeff_even_succ]
        by_cases ha : (n / 2 - 1) % 2 = 0
        · have hb : (n / 2 - 1 + 1) % 2 ≠ 0 := by omega
          rw [ite_eq_right hb] at h1
          rw [ite_eq_left ha] at h2
          omega
        · have hb : (n / 2 - 1 + 1) % 2 = 0 := by omega
          rw [ite_eq_left hb] at h1
          rw [ite_eq_right ha] at h2
          omega
    · rw [ite_eq_right he, show n=2*(n/2)+1 by omega, coeff_odd]
      omega

theorem coeff_ne_zero (n : ℕ) : coeff n ≠ 0 := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases he : n % 2 = 0
    · have p := coeff_parity n
      rw [ite_eq_left he] at p
      omega
    · have h : n / 2 < n := by omega
      rw [show n = 2*(n/2)+1 by omega, coeff_odd]
      have hn := ih _ h
      omega

private def vec (n : ℕ) : ℤ × ℤ :=
  (coeff n, if n = 0 then 0 else coeff (n - 1))

private def digit (b : Bool) (v : ℤ × ℤ) : ℤ × ℤ :=
  if b then (-2 * v.1, v.1 + v.2) else (v.1 + v.2, -2 * v.2)

private theorem vec_zeroBit (n : ℕ) : vec (2*n) = digit false (vec n) := by
  cases n with
  | zero => simp [vec, digit]
  | succ n =>
    have h1 : 2*(n+1) ≠ 0 := by omega
    simp [vec, digit, coeff_even_succ, h1,
      show 2*(n+1)-1=2*n+1 by omega, coeff_odd]

private theorem vec_oneBit (n : ℕ) : vec (2*n+1) = digit true (vec n) := by
  cases n with
  | zero =>
    have hz : coeff 1 = -2 := by simpa using coeff_odd 0
    simp [vec, digit, hz]
  | succ n =>
    simp [vec, digit, coeff_even_succ,
      show 2*(n+1)+1-1=2*(n+1) by omega, coeff_odd]

private def appendIndex (bits : List Bool) (n : ℕ) : ℕ :=
  bits.foldl (fun i b => 2*i + if b then 1 else 0) n

private def appendVec (bits : List Bool) (v : ℤ × ℤ) : ℤ × ℤ :=
  bits.foldl (fun w b => digit b w) v

private theorem vec_append (bits : List Bool) (n : ℕ) :
    vec (appendIndex bits n) = appendVec bits (vec n) := by
  induction bits generalizing n with
  | nil => rfl
  | cons b bs ih =>
    cases b
    · simpa [appendIndex, appendVec, List.foldl_cons, vec_zeroBit] using ih (2*n)
    · simpa [appendIndex, appendVec, List.foldl_cons, vec_oneBit] using ih (2*n+1)

private theorem row_9_0 (n : ℕ) :
    coeff (512*n+0) = (1 : ℤ)*(vec n).1 + (171 : ℤ)*(vec n).2 := by
  have h := congrArg Prod.fst (vec_append [false, false, false, false, false, false, false, false, false] n)
  have hi : appendIndex [false, false, false, false, false, false, false, false, false] n = 512*n+0 := by
    simp only [appendIndex, List.foldl_cons, List.foldl_nil, Bool.false_eq_true,
      ite_false]
    omega
  rw [hi] at h
  simp only [vec, appendVec, List.foldl_cons, List.foldl_nil, digit,
    Bool.false_eq_true, ite_false] at h ⊢
  rw [h]
  ring

private theorem row_9_30 (n : ℕ) :
    coeff (512*n+30) = (11 : ℤ)*(vec n).1 + (-39 : ℤ)*(vec n).2 := by
  have h := congrArg Prod.fst (vec_append [false, false, false, false, true, true, true, true, false] n)
  have hi : appendIndex [false, false, false, false, true, true, true, true, false] n = 512*n+30 := by
    simp only [appendIndex, List.foldl_cons, List.foldl_nil, Bool.false_eq_true,
      ite_false, ite_true]
    omega
  rw [hi] at h
  simp only [vec, appendVec, List.foldl_cons, List.foldl_nil, digit,
    Bool.false_eq_true, ite_false, ite_true] at h ⊢
  rw [h]
  ring

private theorem row_9_324 (n : ℕ) :
    coeff (512*n+324) = (-3 : ℤ)*(vec n).1 + (7 : ℤ)*(vec n).2 := by
  have h := congrArg Prod.fst (vec_append [true, false, true, false, false, false, true, false, false] n)
  have hi : appendIndex [true, false, true, false, false, false, true, false, false] n = 512*n+324 := by
    simp only [appendIndex, List.foldl_cons, List.foldl_nil, Bool.false_eq_true,
      ite_false, ite_true]
    omega
  rw [hi] at h
  simp only [vec, appendVec, List.foldl_cons, List.foldl_nil, digit,
    Bool.false_eq_true, ite_false, ite_true] at h ⊢
  rw [h]
  ring

private theorem row_8_1 (n : ℕ) :
    coeff (256*n+1) = (-2 : ℤ)*(vec n).1 + (-86 : ℤ)*(vec n).2 := by
  have h := congrArg Prod.fst (vec_append [false, false, false, false, false, false, false, true] n)
  have hi : appendIndex [false, false, false, false, false, false, false, true] n = 256*n+1 := by
    simp only [appendIndex, List.foldl_cons, List.foldl_nil, Bool.false_eq_true,
      ite_false, ite_true]
    omega
  rw [hi] at h
  simp only [vec, appendVec, List.foldl_cons, List.foldl_nil, digit,
    Bool.false_eq_true, ite_false, ite_true] at h ⊢
  rw [h]
  ring

private theorem row_8_16 (n : ℕ) :
    coeff (256*n+16) = (-7 : ℤ)*(vec n).1 + (19 : ℤ)*(vec n).2 := by
  have h := congrArg Prod.fst (vec_append [false, false, false, true, false, false, false, false] n)
  have hi : appendIndex [false, false, false, true, false, false, false, false] n = 256*n+16 := by
    simp only [appendIndex, List.foldl_cons, List.foldl_nil, Bool.false_eq_true,
      ite_false, ite_true]
    omega
  rw [hi] at h
  simp only [vec, appendVec, List.foldl_cons, List.foldl_nil, digit,
    Bool.false_eq_true, ite_false, ite_true] at h ⊢
  rw [h]
  ring

private theorem row_8_166 (n : ℕ) :
    coeff (256*n+166) = (3 : ℤ)*(vec n).1 + (-7 : ℤ)*(vec n).2 := by
  have h := congrArg Prod.fst (vec_append [true, false, true, false, false, true, true, false] n)
  have hi : appendIndex [true, false, true, false, false, true, true, false] n = 256*n+166 := by
    simp only [appendIndex, List.foldl_cons, List.foldl_nil, Bool.false_eq_true,
      ite_false, ite_true]
    omega
  rw [hi] at h
  simp only [vec, appendVec, List.foldl_cons, List.foldl_nil, digit,
    Bool.false_eq_true, ite_false, ite_true] at h ⊢
  rw [h]
  ring

theorem relation_zero (n : ℕ) :
    coeff (512*n) + 13*coeff (512*n+30) + 48*coeff (512*n+324) = 0 := by
  rw [show 512*n=512*n+0 by omega, row_9_0, row_9_30, row_9_324]
  ring

theorem relation_one (n : ℕ) :
    coeff (256*n+1) + 34*coeff (256*n+16) + 80*coeff (256*n+166) = 0 := by
  rw [row_8_1, row_8_16, row_8_166]
  ring

def ExceptionZero (n : ℕ) : Prop := coeff (3*n) < 0

def ExceptionOne (n : ℕ) : Prop := 0 < coeff (3*n+1)

instance : DecidablePred ExceptionZero := fun n => inferInstanceAs (Decidable (coeff (3*n) < 0))
instance : DecidablePred ExceptionOne := fun n => inferInstanceAs (Decidable (0 < coeff (3*n+1)))

theorem exception_zero_every_block (h : ℕ) :
    ∃ j, 512*h ≤ j ∧ j < 512*(h+1) ∧ ExceptionZero j := by
  have hr := relation_zero (3*h)
  have h0 := coeff_ne_zero (512*(3*h))
  rcases lt_or_ge (coeff (512*(3*h))) 0 with hz | hz
  · exact ⟨512*h, by omega, by omega, by
      unfold ExceptionZero
      rw [show 3*(512*h)=512*(3*h) by omega]
      exact hz⟩
  rcases lt_or_ge (coeff (512*(3*h)+30)) 0 with hz' | hz'
  · exact ⟨512*h+10, by omega, by omega, by
      unfold ExceptionZero
      rw [show 3*(512*h+10)=512*(3*h)+30 by omega]
      exact hz'⟩
  · refine ⟨512*h+108, by omega, by omega, ?_⟩
    unfold ExceptionZero
    rw [show 3*(512*h+108)=512*(3*h)+324 by omega]
    omega

theorem exception_one_every_block (h : ℕ) :
    ∃ j, 256*h ≤ j ∧ j < 256*(h+1) ∧ ExceptionOne j := by
  have hr := relation_one (3*h)
  have h0 := coeff_ne_zero (256*(3*h)+1)
  rcases lt_or_ge 0 (coeff (256*(3*h)+1)) with hz | hz
  · exact ⟨256*h, by omega, by omega, by
      unfold ExceptionOne
      rw [show 3*(256*h)+1=256*(3*h)+1 by omega]
      exact hz⟩
  rcases lt_or_ge 0 (coeff (256*(3*h)+16)) with hz' | hz'
  · exact ⟨256*h+5, by omega, by omega, by
      unfold ExceptionOne
      rw [show 3*(256*h+5)+1=256*(3*h)+16 by omega]
      exact hz'⟩
  · refine ⟨256*h+55, by omega, by omega, ?_⟩
    unfold ExceptionOne
    rw [show 3*(256*h+55)+1=256*(3*h)+166 by omega]
    omega

def Count (S : ℕ → Prop) [DecidablePred S] (x : ℕ) : ℕ :=
  ((Finset.range x).filter S).card

/-- Equivalent to vanishing natural density, using positive-integer reciprocal tolerances. -/
def DensityZero (S : ℕ → Prop) [DecidablePred S] : Prop :=
  ∀ d : ℕ, 0 < d → ∃ R : ℕ, ∀ x ≥ R, d * Count S x < x

theorem count_blocks (S : ℕ → Prop) [DecidablePred S] (d n : ℕ)
    (hS : ∀ i, ∃ j, d*i ≤ j ∧ j < d*(i+1) ∧ S j) :
    n ≤ Count S (d*n) := by
  let w := fun i => Classical.choose (hS i)
  have hw : ∀ i, d*i ≤ w i ∧ w i < d*(i+1) ∧ S (w i) :=
    fun i => Classical.choose_spec (hS i)
  refine Finset.le_card_of_inj_on_range w ?_ ?_
  · intro i hi
    exact Finset.mem_filter.mpr ⟨Finset.mem_range.mpr
      ((hw i).2.1.trans_le (Nat.mul_le_mul_left d (by omega))), (hw i).2.2⟩
  · intro i hi j hj he
    rcases lt_trichotomy i j with hij | hij | hij
    · have hm := Nat.mul_le_mul_left d (show i + 1 ≤ j by omega)
      have hx := (hw i).2.1
      have hy := (hw j).1
      omega
    · exact hij
    · have hm := Nat.mul_le_mul_left d (show j + 1 ≤ i by omega)
      have hx := (hw j).2.1
      have hy := (hw i).1
      omega

theorem count_zero (n : ℕ) : n ≤ Count ExceptionZero (512*n) :=
  count_blocks ExceptionZero 512 n exception_zero_every_block

theorem count_one (n : ℕ) : n ≤ Count ExceptionOne (256*n) :=
  count_blocks ExceptionOne 256 n exception_one_every_block

theorem not_zero_density_residue_zero : ¬ DensityZero ExceptionZero := by
  intro h
  obtain ⟨R, hR⟩ := h 512 (by decide)
  have ha := hR (512*(R+1)) (by omega)
  have hb := Nat.mul_le_mul_left 512 (count_zero (R+1))
  omega

theorem not_zero_density_residue_one : ¬ DensityZero ExceptionOne := by
  intro h
  obtain ⟨R, hR⟩ := h 256 (by decide)
  have ha := hR (256*(R+1)) (by omega)
  have hb := Nat.mul_le_mul_left 256 (count_one (R+1))
  omega

/-- The formal power series from the source definition. -/
def series : PowerSeries ℤ := PowerSeries.mk thueMorse

noncomputable def partialProduct (m : ℕ) : PowerSeries ℤ :=
  ∏ i ∈ Finset.range m, (1 - PowerSeries.X ^ (2^i))

private theorem partialProduct_succ (m : ℕ) :
    partialProduct (m+1) =
      (1 - PowerSeries.X) * PowerSeries.expand 2 (by decide) (partialProduct m) := by
  rw [partialProduct, Finset.prod_range_succ', partialProduct, map_prod]
  simp only [pow_zero, pow_one, map_sub, map_one, map_pow, PowerSeries.expand_X, ← pow_mul]
  rw [mul_comm]
  congr 1
  apply Finset.prod_congr rfl
  intro i hi
  rw [pow_succ']

/-- For every finite coefficient, sufficiently long products equal the binary-sign series. -/
theorem partialProduct_coeff (m n : ℕ) (h : n < 2^m) :
    PowerSeries.coeff n (partialProduct m) = thueMorse n := by
  induction m generalizing n with
  | zero =>
    have hn : n = 0 := by simpa using h
    subst n
    simp [partialProduct]
  | succ m ih =>
    rw [partialProduct_succ, sub_mul, one_mul, map_sub,
      mul_comm (PowerSeries.X (R := ℤ)), ← pow_one (PowerSeries.X (R := ℤ)),
      PowerSeries.coeff_mul_X_pow']
    simp only [PowerSeries.coeff_expand]
    have hd : n / 2 < 2^m := by rw [pow_succ'] at h; omega
    by_cases he : n % 2 = 0
    · have hp : 2 ∣ n := Nat.dvd_iff_mod_eq_zero.mpr he
      by_cases hz : n = 0
      · subst n
        simpa using ih 0 hd
      · have h1 : 1 ≤ n := by omega
        have hn : ¬ 2 ∣ n - 1 := by
          rw [Nat.dvd_iff_mod_eq_zero]
          omega
        rw [ite_eq_left hp, ite_eq_left h1, ite_eq_right hn, sub_zero, ih _ hd]
        calc
          thueMorse (n / 2) = thueMorse (2 * (n / 2)) := (thueMorse_even _).symm
          _ = thueMorse n := by congr 1; omega
    · have hp : ¬ 2 ∣ n := by rw [Nat.dvd_iff_mod_eq_zero]; exact he
      have h1 : 1 ≤ n := by omega
      have hn : 2 ∣ n - 1 := by rw [Nat.dvd_iff_mod_eq_zero]; omega
      have hs : (n-1)/2 = n/2 := by omega
      rw [ite_eq_right hp, ite_eq_left h1, ite_eq_left hn, hs, zero_sub, ih _ hd]
      calc
        -thueMorse (n / 2) = thueMorse (2 * (n / 2) + 1) := (thueMorse_odd _).symm
        _ = thueMorse n := by congr 1; omega

theorem coeff_series_sq (n : ℕ) :
    PowerSeries.coeff n (series^2) = coeff n := by
  rw [pow_two, PowerSeries.coeff_mul, Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  simp only [series, PowerSeries.coeff_mk, coeff]

private theorem count_congr {p q : ℕ → Prop} [DecidablePred p] [DecidablePred q]
    (h : ∀ n, p n ↔ q n) (x : ℕ) : Count p x = Count q x := by
  unfold Count
  congr 1
  ext n
  simp only [Finset.mem_filter]
  rw [h]

private theorem density_congr {p q : ℕ → Prop} [DecidablePred p] [DecidablePred q]
    (h : ∀ n, p n ↔ q n) : DensityZero p ↔ DensityZero q := by
  simp only [DensityZero, count_congr h]

theorem count_blocks_prefix (S : ℕ → Prop) [DecidablePred S] {d : ℕ}
    (hS : ∀ i, ∃ j, d*i ≤ j ∧ j < d*(i+1) ∧ S j) (x : ℕ) :
    x/d ≤ Count S x := by
  have h₀ := count_blocks S d (x/d) hS
  apply h₀.trans
  unfold Count
  apply Finset.card_le_card
  intro k hk
  simp only [Finset.mem_filter, Finset.mem_range] at hk ⊢
  exact ⟨hk.1.trans_le (Nat.mul_div_le _ _), hk.2⟩

/-- Clause (ii) of Gawron–Miska–Ulas Conjecture 5.8, stated with its actual signed coefficient. -/
def SourceDensityClause : Prop :=
  ∀ m : ℕ, 2 ≤ m → ∀ j : ℕ, j ≤ 1 →
    DensityZero (fun n => (PowerSeries.coeff (3*n+j) (series^m)).sign ≠ (-1 : ℤ)^j)

theorem count_zero_all (x : ℕ) : x / 512 ≤ Count ExceptionZero x :=
  count_blocks_prefix ExceptionZero exception_zero_every_block x

theorem count_one_all (x : ℕ) : x / 256 ≤ Count ExceptionOne x :=
  count_blocks_prefix ExceptionOne exception_one_every_block x

theorem not_source_density_residue_zero :
    ¬ DensityZero
      (fun n => (PowerSeries.coeff (3*n) (series^2)).sign ≠ 1) := by
  intro h
  apply not_zero_density_residue_zero
  apply (density_congr ?_).mp h
  intro n
  rw [coeff_series_sq]
  change (Int.sign (coeff (3*n)) ≠ 1) ↔ coeff (3*n) < 0
  rw [ne_eq, Int.sign_eq_one_iff_pos]
  have hz := coeff_ne_zero (3*n)
  omega

theorem not_source_density_residue_one :
    ¬ DensityZero
      (fun n => (PowerSeries.coeff (3*n+1) (series^2)).sign ≠ -1) := by
  intro h
  apply not_zero_density_residue_one
  apply (density_congr ?_).mp h
  intro n
  rw [coeff_series_sq]
  change (Int.sign (coeff (3*n+1)) ≠ -1) ↔ 0 < coeff (3*n+1)
  rw [ne_eq, Int.sign_eq_neg_one_iff_neg]
  have hz := coeff_ne_zero (3*n+1)
  omega

theorem source_conjecture_false : ¬ SourceDensityClause := by
  intro h
  apply not_source_density_residue_zero
  simpa only [Nat.add_zero, pow_zero] using h 2 (by decide) 0 (by decide)

open Filter in
theorem tendsto_implies_densityZero (S : ℕ → Prop) [DecidablePred S]
    (h : Tendsto (fun n : ℕ => (Count S n : ℝ) / (n : ℝ)) atTop (nhds (0 : ℝ))) :
    DensityZero S := by
  intro d hd
  have hdR : 0 < (d : ℝ) := by exact_mod_cast hd
  have hε : (0 : ℝ) < 1 / (d : ℝ) := one_div_pos.mpr hdR
  obtain ⟨N, hN⟩ := eventually_atTop.mp ((tendsto_order.mp h).2 _ hε)
  refine ⟨max N 1, ?_⟩
  intro n hn
  have hn0 : 0 < n := Nat.succ_le_iff.mp ((le_max_right N 1).trans hn)
  have hnR : 0 < (n : ℝ) := by exact_mod_cast hn0
  have hlt := hN n ((le_max_left N 1).trans hn)
  have hh := (div_lt_div_iff₀ hnR hdR).mp hlt
  rw [one_mul, mul_comm] at hh
  exact_mod_cast hh

open Filter in
theorem not_natural_density_zero_in_source :
    ¬ ∀ m : ℕ, 2 ≤ m → ∀ j : ℕ, j ≤ 1 →
      Tendsto (fun x : ℕ =>
        (Count (fun n => (PowerSeries.coeff (3*n+j) (series^m)).sign ≠ (-1 : ℤ)^j) x : ℝ)
        / (x : ℝ)) atTop (nhds (0 : ℝ)) := by
  intro h
  apply source_conjecture_false
  intro m hm j hj
  exact tendsto_implies_densityZero _ (h m hm j hj)

#print axioms not_zero_density_residue_zero
#print axioms not_zero_density_residue_one
#print axioms partialProduct_coeff
#print axioms source_conjecture_false
#print axioms not_natural_density_zero_in_source

end Conjectures.GawronMiskaUlasDensity
