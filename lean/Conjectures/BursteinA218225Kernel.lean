import Conjectures.BursteinA218225Series
import Mathlib.RingTheory.PowerSeries.NoZeroDivisors
import Mathlib.Tactic.LinearCombination

/-!
# Burstein's A218225 Enumeration Conjecture — Section 3b: Kernel Method and Cubic Equation

Evaluates `P_tree = U(0, 0) - 1` entirely within `PowerSeries ℤ` and `PowerSeries (PowerSeries ℤ)`
(no Laurent series required), using an explicit finite-sum `AlgHom` substitution `evalAt`,
and proves uniqueness of the formal cubic solution.
-/

namespace Conjectures.BursteinA218225

/-- Bivariate series `α(u) = ∑_{a ≥ 0} α_a u^a` in `PowerSeries (PowerSeries ℤ)`. -/
noncomputable def αu : PowerSeries (PowerSeries ℤ) :=
  PowerSeries.mk αSeries

/-- Bivariate series `β(u) = ∑_{a ≥ 0} β_a u^a` in `PowerSeries (PowerSeries ℤ)`. -/
noncomputable def βu : PowerSeries (PowerSeries ℤ) :=
  PowerSeries.mk βSeries

/-- The catalytic kernel `K(u)` in `PowerSeries (PowerSeries ℤ)`. -/
noncomputable def kernelU : PowerSeries (PowerSeries ℤ) :=
  PowerSeries.X ^ 2 * (1 - PowerSeries.X) * (PowerSeries.C vSeries * PowerSeries.X - 1) +
  2 * PowerSeries.C PowerSeries.X * PowerSeries.X * (1 - PowerSeries.X) -
  PowerSeries.C (PowerSeries.X ^ 2)

/-- The cubic factor `u^3 + (2x - 2)u^2 + (1 - x)u + (x^2 - x)` in `PowerSeries (PowerSeries ℤ)`. -/
noncomputable def cubicU : PowerSeries (PowerSeries ℤ) :=
  PowerSeries.X ^ 3 +
  PowerSeries.C (2 * PowerSeries.X - 2) * PowerSeries.X ^ 2 +
  PowerSeries.C (1 - PowerSeries.X) * PowerSeries.X +
  PowerSeries.C (PowerSeries.X ^ 2 - PowerSeries.X)

/-- Nonempty generating series of the abstract generating tree: `P = U(0, 0) - 1`. -/
noncomputable def P_tree : PowerSeries ℤ :=
  U 0 0 - 1

private theorem coeff_X_mul_succ {R : Type*} [CommRing R] (f : PowerSeries R) (n : ℕ) :
    PowerSeries.coeff (n + 1) (PowerSeries.X * f) = PowerSeries.coeff n f := by
  rw [PowerSeries.coeff_mul, Finset.sum_eq_single (1, n)]
  · simp [PowerSeries.coeff_X]
  · rintro ⟨a, b⟩ hab hne
    rw [Finset.mem_antidiagonal] at hab
    have ha : a ≠ 1 := by
      intro h1
      subst h1
      exact hne (Prod.ext rfl (by omega))
    simp [PowerSeries.coeff_X, ha]
  · intro hmem
    exact False.elim (hmem (Finset.mem_antidiagonal.2 (by omega)))

private theorem coeff_X_mul_zero {R : Type*} [CommRing R] (f : PowerSeries R) :
    PowerSeries.coeff 0 (PowerSeries.X * f) = 0 := by
  simp [PowerSeries.coeff_mul]

private theorem coeff_two_mul {R : Type*} [CommRing R] (f : PowerSeries R) (n : ℕ) :
    PowerSeries.coeff n (2 * f) = 2 * PowerSeries.coeff n f := by
  rw [two_mul, map_add, two_mul]

private theorem coeff_pow_eq_zero_of_lt {s : PowerSeries ℤ}
    (hs : PowerSeries.constantCoeff s = 0) :
    ∀ {k n : ℕ}, n < k → PowerSeries.coeff n (s ^ k) = 0 := by
  intro k
  induction k with
  | zero =>
    intro n hn
    omega
  | succ k ih =>
    intro n hn
    rw [pow_succ, PowerSeries.coeff_mul]
    apply Finset.sum_eq_zero
    rintro ⟨a, b⟩ hab
    rw [Finset.mem_antidiagonal] at hab
    by_cases hb : b = 0
    · subst hb
      simp [hs]
    · rw [ih (by omega : a < k), zero_mul]

private theorem coeff_mul_pow_eq_zero_of_lt {s : PowerSeries ℤ}
    (hs : PowerSeries.constantCoeff s = 0) (a : PowerSeries ℤ) {k n : ℕ} (hk : n < k) :
    PowerSeries.coeff n (a * s ^ k) = 0 := by
  rw [PowerSeries.coeff_mul]
  apply Finset.sum_eq_zero
  rintro ⟨i, j⟩ hij
  rw [Finset.mem_antidiagonal] at hij
  rw [coeff_pow_eq_zero_of_lt hs (by omega : j < k), mul_zero]

private theorem evalAt_sum_extend {s : PowerSeries ℤ}
    (hs : PowerSeries.constantCoeff s = 0) (f : PowerSeries (PowerSeries ℤ))
    {n N : ℕ} (hN : n ≤ N) :
    ∑ k ∈ Finset.range (n + 1), PowerSeries.coeff n (PowerSeries.coeff k f * s ^ k) =
    ∑ k ∈ Finset.range (N + 1), PowerSeries.coeff n (PowerSeries.coeff k f * s ^ k) := by
  apply Finset.sum_subset (Finset.range_mono (by omega))
  intro k _ hk
  rw [Finset.mem_range] at hk
  exact coeff_mul_pow_eq_zero_of_lt hs _ (by omega)

/-- Explicit ring homomorphism evaluation `f ↦ f(s)` on `PowerSeries (PowerSeries ℤ)`
for any `s : PowerSeries ℤ` with zero constant term, via finite coefficient sums. -/
noncomputable def evalAt (s : PowerSeries ℤ) (hs : PowerSeries.constantCoeff s = 0) :
    PowerSeries (PowerSeries ℤ) →+* PowerSeries ℤ where
  toFun f := PowerSeries.mk fun n =>
    ∑ k ∈ Finset.range (n + 1), PowerSeries.coeff n (PowerSeries.coeff k f * s ^ k)
  map_one' := by
    apply PowerSeries.ext
    intro n
    simp only [PowerSeries.coeff_mk, PowerSeries.coeff_one]
    rw [Finset.sum_eq_single 0]
    · simp [PowerSeries.coeff_one]
    · intro k _ hk
      simp [hk]
    · intro h0
      exact False.elim (h0 (Finset.mem_range.2 (Nat.zero_lt_succ n)))
  map_mul' := by
    intro f g
    apply PowerSeries.ext
    intro n
    rw [PowerSeries.coeff_mk, PowerSeries.coeff_mul]
    simp only [PowerSeries.coeff_mk]
    let F : ℕ × ℕ → ℤ := fun p =>
      PowerSeries.coeff n ((PowerSeries.coeff p.1 f * PowerSeries.coeff p.2 g) * s ^ (p.1 + p.2))
    have hR :
        ∑ p ∈ Finset.antidiagonal n,
          (∑ i ∈ Finset.range (p.1 + 1), PowerSeries.coeff p.1 (PowerSeries.coeff i f * s ^ i)) *
          (∑ j ∈ Finset.range (p.2 + 1), PowerSeries.coeff p.2 (PowerSeries.coeff j g * s ^ j)) =
        ∑ p ∈ Finset.range (n + 1) ×ˢ Finset.range (n + 1), F p := by
      calc
        _ = ∑ p ∈ Finset.antidiagonal n,
              (∑ i ∈ Finset.range (n + 1), PowerSeries.coeff p.1 (PowerSeries.coeff i f * s ^ i)) *
              (∑ j ∈ Finset.range (n + 1), PowerSeries.coeff p.2 (PowerSeries.coeff j g * s ^ j)) := by
            refine Finset.sum_congr rfl fun p hp => ?_
            rw [Finset.mem_antidiagonal] at hp
            rw [evalAt_sum_extend hs f (N := n) (by omega),
              evalAt_sum_extend hs g (N := n) (by omega)]
        _ = ∑ p ∈ Finset.antidiagonal n,
              ∑ i ∈ Finset.range (n + 1), ∑ j ∈ Finset.range (n + 1),
                PowerSeries.coeff p.1 (PowerSeries.coeff i f * s ^ i) *
                PowerSeries.coeff p.2 (PowerSeries.coeff j g * s ^ j) := by
            refine Finset.sum_congr rfl fun p _ => ?_
            rw [Finset.sum_mul]
            refine Finset.sum_congr rfl fun i _ => ?_
            rw [Finset.mul_sum]
        _ = ∑ i ∈ Finset.range (n + 1), ∑ j ∈ Finset.range (n + 1),
              ∑ p ∈ Finset.antidiagonal n,
                PowerSeries.coeff p.1 (PowerSeries.coeff i f * s ^ i) *
                PowerSeries.coeff p.2 (PowerSeries.coeff j g * s ^ j) := by
            rw [Finset.sum_comm]
            refine Finset.sum_congr rfl fun i _ => ?_
            rw [Finset.sum_comm]
        _ = ∑ i ∈ Finset.range (n + 1), ∑ j ∈ Finset.range (n + 1), F (i, j) := by
            refine Finset.sum_congr rfl fun i _ => Finset.sum_congr rfl fun j _ => ?_
            rw [← PowerSeries.coeff_mul]
            dsimp [F]
            congr 1
            rw [pow_add]
            ring
        _ = ∑ p ∈ Finset.range (n + 1) ×ˢ Finset.range (n + 1), F p := by
            rw [Finset.sum_product]
    have hL :
        ∑ k ∈ Finset.range (n + 1), PowerSeries.coeff n (PowerSeries.coeff k (f * g) * s ^ k) =
        ∑ k ∈ Finset.range (n + 1), ∑ q ∈ Finset.antidiagonal k, F q := by
      refine Finset.sum_congr rfl fun k _ => ?_
      rw [PowerSeries.coeff_mul k f g, Finset.sum_mul, map_sum]
      refine Finset.sum_congr rfl fun q hq => ?_
      rw [Finset.mem_antidiagonal] at hq
      dsimp [F]
      rw [hq]
    rw [hL, hR]
    have hfilt :
        ∑ p ∈ Finset.range (n + 1) ×ˢ Finset.range (n + 1), F p =
        ∑ p ∈ (Finset.range (n + 1) ×ˢ Finset.range (n + 1)).filter (fun p => p.1 + p.2 ≤ n), F p := by
      symm
      apply Finset.sum_subset (Finset.filter_subset _ _)
      intro p hp hnot
      rw [Finset.mem_filter] at hnot
      have hgt : n < p.1 + p.2 := by
        have : ¬ p.1 + p.2 ≤ n := fun hle => hnot ⟨hp, hle⟩
        omega
      exact coeff_mul_pow_eq_zero_of_lt hs _ hgt
    rw [hfilt, ← Finset.sum_sigma (Finset.range (n + 1)) (fun k => Finset.antidiagonal k)
      (fun x => F x.2)]
    refine Finset.sum_nbij (fun x => x.2) ?_ ?_ ?_ ?_
    · rintro ⟨k, ⟨i, j⟩⟩ hx
      simp only [Finset.mem_sigma, Finset.mem_range, Finset.mem_antidiagonal] at hx
      simp only [Finset.mem_filter, Finset.mem_product, Finset.mem_range]
      omega
    · rintro ⟨k₁, q₁⟩ h₁ ⟨k₂, q₂⟩ h₂ hEq
      simp only [Finset.mem_coe, Finset.mem_sigma, Finset.mem_antidiagonal] at h₁ h₂
      dsimp at hEq
      subst hEq
      have hk : k₁ = k₂ := by rw [← h₁.2, ← h₂.2]
      subst hk
      rfl
    · intro p hp
      simp only [Finset.mem_coe, Finset.mem_filter, Finset.mem_product, Finset.mem_range] at hp
      refine ⟨⟨p.1 + p.2, p⟩, ?_, rfl⟩
      simp only [Finset.mem_coe, Finset.mem_sigma, Finset.mem_range, Finset.mem_antidiagonal]
      exact ⟨by omega, trivial⟩
    · intro _ _
      rfl
  map_zero' := by
    apply PowerSeries.ext
    intro n
    simp
  map_add' := by
    intro f g
    apply PowerSeries.ext
    intro n
    simp [add_mul, Finset.sum_add_distrib]

theorem evalAt_X (s : PowerSeries ℤ) (hs : PowerSeries.constantCoeff s = 0) :
    evalAt s hs PowerSeries.X = s := by
  apply PowerSeries.ext
  intro n
  simp only [evalAt, RingHom.coe_mk, MonoidHom.coe_mk, OneHom.coe_mk, PowerSeries.coeff_mk]
  cases n with
  | zero =>
    simp [hs]
  | succ n =>
    rw [Finset.sum_eq_single 1]
    · simp [PowerSeries.coeff_X]
    · intro k _ hk
      simp [PowerSeries.coeff_X, hk]
    · intro h1
      exact False.elim (h1 (Finset.mem_range.2 (by omega)))

theorem evalAt_C (s : PowerSeries ℤ) (hs : PowerSeries.constantCoeff s = 0) (c : PowerSeries ℤ) :
    evalAt s hs (PowerSeries.C c) = c := by
  apply PowerSeries.ext
  intro n
  simp only [evalAt, RingHom.coe_mk, MonoidHom.coe_mk, OneHom.coe_mk, PowerSeries.coeff_mk]
  rw [Finset.sum_eq_single 0]
  · simp [PowerSeries.coeff_C]
  · intro k _ hk
    simp [PowerSeries.coeff_C, hk]
  · intro h0
    exact False.elim (h0 (Finset.mem_range.2 (Nat.zero_lt_succ n)))

/-! ## Bivariate Kernel Equations -/

theorem β_diff_eq (a : ℕ) :
    βSeries (a + 1) - vSeries * βSeries a = - PowerSeries.X * αSeries (a + 2) := by
  rw [βSeries_eq (a + 1), βSeries_eq a]
  have hsum : ∑ h ∈ Finset.Icc 1 (a + 2), αSeries h * vSeries ^ (a + 2 - h) =
      (∑ h ∈ Finset.Icc 1 (a + 1), αSeries h * vSeries ^ (a + 2 - h)) +
        αSeries (a + 2) * vSeries ^ (a + 2 - (a + 2)) := by
    rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ a + 2)]
  rw [hsum]
  have hshift : ∑ h ∈ Finset.Icc 1 (a + 1), αSeries h * vSeries ^ (a + 2 - h) =
      vSeries * ∑ h ∈ Finset.Icc 1 (a + 1), αSeries h * vSeries ^ (a + 1 - h) := by
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl fun h hh => ?_
    rw [Finset.mem_Icc] at hh
    have hpow : a + 2 - h = (a + 1 - h) + 1 := by omega
    rw [hpow, pow_succ]
    ring
  rw [hshift, Nat.sub_self, pow_zero, mul_one]
  ring

theorem α_diff_eq (a : ℕ) :
    (αSeries (a + 1) + 2 * βSeries (a + 1)) - (αSeries a + 2 * βSeries a) =
      PowerSeries.X * βSeries (a + 2) := by
  have h1 := αSeries_eq (a + 1)
  have h0 := αSeries_eq a
  have hsum : ∑ h ∈ Finset.Icc 1 (a + 2), βSeries h =
      (∑ h ∈ Finset.Icc 1 (a + 1), βSeries h) + βSeries (a + 2) := by
    rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ a + 2)]
  rw [show a + 1 + 1 = a + 2 from rfl, hsum] at h1
  linear_combination h1 - h0

theorem βu_eq :
    PowerSeries.X * (1 - PowerSeries.C vSeries * PowerSeries.X) * βu =
      - PowerSeries.C PowerSeries.X * (αu - PowerSeries.C (αSeries 0)) := by
  have hL : PowerSeries.X * (1 - PowerSeries.C vSeries * PowerSeries.X) * βu =
      PowerSeries.X * βu - PowerSeries.C vSeries * (PowerSeries.X * (PowerSeries.X * βu)) := by
    ring
  have hR : - PowerSeries.C PowerSeries.X * (αu - PowerSeries.C (αSeries 0)) =
      PowerSeries.C (- PowerSeries.X) * (αu - PowerSeries.C (αSeries 0)) := by
    rw [map_neg]
  rw [hL, hR]
  apply PowerSeries.ext
  intro n
  cases n with
  | zero =>
    simp [αu, βu]
  | succ n =>
    cases n with
    | zero =>
      rw [map_sub, coeff_X_mul_succ, PowerSeries.coeff_C_mul, coeff_X_mul_succ, coeff_X_mul_zero,
        PowerSeries.coeff_C_mul, map_sub]
      simp only [αu, βu, PowerSeries.coeff_mk, PowerSeries.coeff_C, Nat.succ_ne_zero, ↓reduceIte,
        sub_zero, mul_zero]
      have h0 := βSeries_eq 0
      simpa using h0
    | succ a =>
      rw [map_sub, coeff_X_mul_succ, PowerSeries.coeff_C_mul, coeff_X_mul_succ, coeff_X_mul_succ,
        PowerSeries.coeff_C_mul, map_sub]
      simp only [αu, βu, PowerSeries.coeff_mk, PowerSeries.coeff_C, Nat.succ_ne_zero, ↓reduceIte,
        sub_zero]
      exact β_diff_eq a

theorem αu_eq :
    PowerSeries.X * (1 - PowerSeries.X) * (αu + 2 * βu) =
      PowerSeries.X + PowerSeries.C PowerSeries.X * (βu - PowerSeries.C (βSeries 0)) := by
  have hL : PowerSeries.X * (1 - PowerSeries.X) * (αu + 2 * βu) =
      PowerSeries.X * (αu + 2 * βu) - PowerSeries.X * (PowerSeries.X * (αu + 2 * βu)) := by
    ring
  rw [hL]
  apply PowerSeries.ext
  intro n
  cases n with
  | zero =>
    simp [αu, βu]
  | succ n =>
    cases n with
    | zero =>
      rw [map_sub, coeff_X_mul_succ, coeff_X_mul_succ, coeff_X_mul_zero, map_add, map_add,
        PowerSeries.coeff_C_mul, map_sub, coeff_two_mul]
      simp only [αu, βu, PowerSeries.coeff_mk, PowerSeries.coeff_C, PowerSeries.coeff_X,
        Nat.succ_ne_zero, ↓reduceIte, sub_zero]
      have h0 := αSeries_eq 0
      simp only [Nat.zero_add, Finset.Icc_self, Finset.sum_singleton] at h0
      linear_combination h0
    | succ a =>
      rw [map_sub, coeff_X_mul_succ, coeff_X_mul_succ, coeff_X_mul_succ, map_add, map_add, map_add,
        PowerSeries.coeff_C_mul, map_sub, coeff_two_mul, coeff_two_mul]
      have hne : a + 2 ≠ 1 := by omega
      simp only [αu, βu, PowerSeries.coeff_mk, PowerSeries.coeff_C, PowerSeries.coeff_X,
        Nat.succ_ne_zero, hne, ↓reduceIte, sub_zero, zero_add]
      exact α_diff_eq a

theorem kernel_eq :
    kernelU * βu =
      PowerSeries.C PowerSeries.X * PowerSeries.X -
      PowerSeries.C (PowerSeries.X ^ 2 * βSeries 0) -
      PowerSeries.C PowerSeries.X * PowerSeries.X * (1 - PowerSeries.X) *
        PowerSeries.C (αSeries 0) := by
  have hα := αu_eq
  have hβ := βu_eq
  unfold kernelU
  rw [map_mul, map_pow]
  linear_combination PowerSeries.C PowerSeries.X * hα - PowerSeries.X * (1 - PowerSeries.X) * hβ

theorem kernel_factorization :
    PowerSeries.C (PowerSeries.X - 1) * kernelU =
      (PowerSeries.X - PowerSeries.C PowerSeries.X) * cubicU := by
  have hv : (PowerSeries.C PowerSeries.X - 1) * PowerSeries.C vSeries = -1 := by
    have h1 := one_sub_X_mul_vSeries
    have h2 : (PowerSeries.X - 1) * vSeries = -1 := by linear_combination -h1
    have h3 := congrArg (PowerSeries.C (R := PowerSeries ℤ)) h2
    simpa [map_mul, map_sub, map_one, map_neg] using h3
  unfold kernelU cubicU
  simp only [map_sub, map_mul, map_pow, map_ofNat, map_one]
  linear_combination PowerSeries.X ^ 3 * (1 - PowerSeries.X) * hv

/-! ## Formal Root `r(x)` and Cubic Equation for `P_tree` -/

private noncomputable def rSeq : ℕ → ℤ
  | 0 => 0
  | 1 => 1
  | n + 2 =>
    (if n = 0 then -1 else 0) +
    rSeq (n + 1) +
    2 * ∑ p ∈ Finset.antidiagonal (n + 2),
      (if _ : p.1 < n + 2 then rSeq p.1 else 0) * (if _ : p.2 < n + 2 then rSeq p.2 else 0) -
    2 * ∑ p ∈ Finset.antidiagonal (n + 1),
      (if _ : p.1 < n + 2 then rSeq p.1 else 0) * (if _ : p.2 < n + 2 then rSeq p.2 else 0) -
    ∑ p ∈ Finset.antidiagonal (n + 2),
      (∑ q ∈ Finset.antidiagonal p.1,
        (if _ : q.1 < n + 2 then rSeq q.1 else 0) * (if _ : q.2 < n + 2 then rSeq q.2 else 0)) *
      (if _ : p.2 < n + 2 then rSeq p.2 else 0)

private theorem rSeq_zero : rSeq 0 = 0 := by rw [rSeq]

private theorem rSeq_one : rSeq 1 = 1 := by rw [rSeq]

private theorem rSeq_succ_succ (n : ℕ) :
    rSeq (n + 2) =
      (if n = 0 then -1 else 0) +
      rSeq (n + 1) +
      2 * ∑ p ∈ Finset.antidiagonal (n + 2), rSeq p.1 * rSeq p.2 -
      2 * ∑ p ∈ Finset.antidiagonal (n + 1), rSeq p.1 * rSeq p.2 -
      ∑ p ∈ Finset.antidiagonal (n + 2),
        (∑ q ∈ Finset.antidiagonal p.1, rSeq q.1 * rSeq q.2) * rSeq p.2 := by
  have h2 : ∑ p ∈ Finset.antidiagonal (n + 2),
      (if _ : p.1 < n + 2 then rSeq p.1 else 0) * (if _ : p.2 < n + 2 then rSeq p.2 else 0) =
      ∑ p ∈ Finset.antidiagonal (n + 2), rSeq p.1 * rSeq p.2 := by
    refine Finset.sum_congr rfl fun p hp => ?_
    rw [Finset.mem_antidiagonal] at hp
    by_cases hp1 : p.1 = 0
    · simp [hp1, rSeq_zero]
    · by_cases hp2 : p.2 = 0
      · simp [hp2, rSeq_zero]
      · have hlt1 : p.1 < n + 2 := by omega
        have hlt2 : p.2 < n + 2 := by omega
        simp [hlt1, hlt2]
  have h3 : ∑ p ∈ Finset.antidiagonal (n + 1),
      (if _ : p.1 < n + 2 then rSeq p.1 else 0) * (if _ : p.2 < n + 2 then rSeq p.2 else 0) =
      ∑ p ∈ Finset.antidiagonal (n + 1), rSeq p.1 * rSeq p.2 := by
    refine Finset.sum_congr rfl fun p hp => ?_
    rw [Finset.mem_antidiagonal] at hp
    have hlt1 : p.1 < n + 2 := by omega
    have hlt2 : p.2 < n + 2 := by omega
    simp [hlt1, hlt2]
  have h4 : ∑ p ∈ Finset.antidiagonal (n + 2),
      (∑ q ∈ Finset.antidiagonal p.1,
        (if _ : q.1 < n + 2 then rSeq q.1 else 0) * (if _ : q.2 < n + 2 then rSeq q.2 else 0)) *
      (if _ : p.2 < n + 2 then rSeq p.2 else 0) =
      ∑ p ∈ Finset.antidiagonal (n + 2),
        (∑ q ∈ Finset.antidiagonal p.1, rSeq q.1 * rSeq q.2) * rSeq p.2 := by
    refine Finset.sum_congr rfl fun p hp => ?_
    rw [Finset.mem_antidiagonal] at hp
    by_cases hp1 : p.1 = 0
    · simp [hp1, rSeq_zero]
    · by_cases hp2 : p.2 = 0
      · simp [hp2, rSeq_zero]
      · have hlt2 : p.2 < n + 2 := by omega
        have hlt1 : p.1 < n + 2 := by omega
        simp only [hlt2, ↓reduceDIte]
        congr 1
        refine Finset.sum_congr rfl fun q hq => ?_
        rw [Finset.mem_antidiagonal] at hq
        have hq1 : q.1 < n + 2 := by omega
        have hq2 : q.2 < n + 2 := by omega
        simp [hq1, hq2]
  conv_lhs => rw [rSeq]
  rw [h2, h3, h4]

/-- Existence of the formal power series root `r = x + 2x^2 + ⋯` of `cubicU` with `r ≠ x`. -/
theorem r_exists :
    ∃ r : PowerSeries ℤ,
      PowerSeries.constantCoeff r = 0 ∧
      r ^ 3 + (2 * PowerSeries.X - 2) * r ^ 2 + (1 - PowerSeries.X) * r +
        (PowerSeries.X ^ 2 - PowerSeries.X) = 0 ∧
      r ≠ PowerSeries.X := by
  let r : PowerSeries ℤ := PowerSeries.mk rSeq
  have hr0 : PowerSeries.constantCoeff r = 0 := by
    simpa [r] using rSeq_zero
  have hr1 : PowerSeries.coeff 1 r = 1 := by
    simpa [r] using rSeq_one
  have hr_fix : r = PowerSeries.X - PowerSeries.X ^ 2 + PowerSeries.X * r +
      2 * r ^ 2 - 2 * (PowerSeries.X * r ^ 2) - r ^ 3 := by
    apply PowerSeries.ext
    intro n
    cases n with
    | zero =>
      simp [r, rSeq_zero, pow_succ]
    | succ n =>
      cases n with
      | zero =>
        have hr2_0 : PowerSeries.coeff 0 (r ^ 2) = 0 := by
          simp [pow_two, hr0]
        have hr2_1 : PowerSeries.coeff 1 (r ^ 2) = 0 :=
          coeff_pow_eq_zero_of_lt hr0 (by omega)
        have hr3_1 : PowerSeries.coeff 1 (r ^ 3) = 0 :=
          coeff_pow_eq_zero_of_lt hr0 (by omega)
        rw [map_sub, map_sub, map_add, map_add, map_sub, coeff_X_mul_succ, coeff_two_mul,
          coeff_two_mul, coeff_X_mul_succ]
        simp only [PowerSeries.coeff_X, PowerSeries.coeff_X_pow, hr1, hr2_0, hr2_1, hr3_1]
        have h0' : PowerSeries.coeff 0 r = 0 := by
          simpa [PowerSeries.coeff_zero_eq_constantCoeff] using hr0
        rw [h0']
        norm_num
      | succ n =>
        have hX : PowerSeries.coeff (n + 2) (PowerSeries.X : PowerSeries ℤ) = 0 := by
          rw [PowerSeries.coeff_X]
          simp
        have hX2 : PowerSeries.coeff (n + 2) ((PowerSeries.X : PowerSeries ℤ) ^ 2) =
            if n = 0 then 1 else 0 := by
          rw [PowerSeries.coeff_X_pow]
          by_cases hn : n = 0 <;> simp [hn]
        have hr2 : ∀ m, PowerSeries.coeff m (r ^ 2) =
            ∑ p ∈ Finset.antidiagonal m, rSeq p.1 * rSeq p.2 := by
          intro m
          rw [pow_two, PowerSeries.coeff_mul]
          simp [r]
        have hr3 : PowerSeries.coeff (n + 2) (r ^ 3) =
            ∑ p ∈ Finset.antidiagonal (n + 2),
              (∑ q ∈ Finset.antidiagonal p.1, rSeq q.1 * rSeq q.2) * rSeq p.2 := by
          rw [show r ^ 3 = r ^ 2 * r by ring, PowerSeries.coeff_mul]
          refine Finset.sum_congr rfl fun p _ => ?_
          rw [hr2 p.1]
          simp [r]
        rw [map_sub, map_sub, map_add, map_add, map_sub, coeff_X_mul_succ, coeff_two_mul,
          coeff_two_mul, coeff_X_mul_succ]
        rw [hX, hX2, hr2 (n + 2), hr2 (n + 1), hr3]
        simp only [r, PowerSeries.coeff_mk]
        rw [rSeq_succ_succ n]
        by_cases hn : n = 0 <;> simp [hn]
  have hrcub : r ^ 3 + (2 * PowerSeries.X - 2) * r ^ 2 + (1 - PowerSeries.X) * r +
      (PowerSeries.X ^ 2 - PowerSeries.X) = 0 := by
    linear_combination hr_fix
  have hr2_val : rSeq 2 = 2 := by
    rw [rSeq_succ_succ 0]
    simp [Finset.Nat.sum_antidiagonal_succ, rSeq_zero, rSeq_one]
  have hrne : r ≠ PowerSeries.X := by
    intro hEq
    have h2 := congrArg (PowerSeries.coeff 2) hEq
    simp only [r, PowerSeries.coeff_mk, hr2_val, PowerSeries.coeff_X] at h2
    norm_num at h2
  exact ⟨r, hr0, hrcub, hrne⟩

private theorem X_ne_zero : (PowerSeries.X : PowerSeries ℤ) ≠ 0 := by
  intro h
  have h1 := congrArg (PowerSeries.coeff 1) h
  simp [PowerSeries.coeff_X] at h1

private theorem X_sub_one_ne_zero : (PowerSeries.X - 1 : PowerSeries ℤ) ≠ 0 := by
  intro h
  have h0 := congrArg PowerSeries.constantCoeff h
  simp at h0

/-- Substituting `u = X` into the kernel identity gives `1 - β_0 = (1 - X) α_0`. -/
theorem eval_at_X_eq :
    1 - βSeries 0 = (1 - PowerSeries.X) * αSeries 0 := by
  have hker := congrArg (fun z => PowerSeries.C (PowerSeries.X - 1) * z) kernel_eq
  rw [← mul_assoc, kernel_factorization] at hker
  have hev := congrArg (evalAt PowerSeries.X (by simp)) hker
  simp only [map_mul, map_sub, map_one, evalAt_X, evalAt_C] at hev
  have h0 : (PowerSeries.X - 1) * PowerSeries.X ^ 2 *
      (1 - βSeries 0 - (1 - PowerSeries.X) * αSeries 0) = 0 := by
    linear_combination -hev
  rcases mul_eq_zero.1 h0 with hfac | hres
  · rcases mul_eq_zero.1 hfac with h1 | h2
    · exact False.elim (X_sub_one_ne_zero h1)
    · exact False.elim (pow_ne_zero 2 X_ne_zero h2)
  · linear_combination hres

/-- Substituting `u = r` into the kernel identity gives `(1 - X - r) α_0 = 1`. -/
theorem eval_at_r_eq (r : PowerSeries ℤ)
    (hr0 : PowerSeries.constantCoeff r = 0)
    (hrcub : r ^ 3 + (2 * PowerSeries.X - 2) * r ^ 2 + (1 - PowerSeries.X) * r +
      (PowerSeries.X ^ 2 - PowerSeries.X) = 0)
    (hrne : r ≠ PowerSeries.X) :
    (1 - PowerSeries.X - r) * αSeries 0 = 1 := by
  have hker := congrArg (fun z => PowerSeries.C (PowerSeries.X - 1) * z) kernel_eq
  rw [← mul_assoc, kernel_factorization] at hker
  have hev := congrArg (evalAt r hr0) hker
  have hcub_ev : evalAt r hr0 cubicU = 0 := by
    unfold cubicU
    simp only [map_add, map_mul, map_pow, evalAt_X, evalAt_C]
    exact hrcub
  simp only [map_mul, map_sub, map_one, evalAt_X, evalAt_C, hcub_ev, mul_zero, zero_mul] at hev
  have hβ0 := eval_at_X_eq
  have hfact : (PowerSeries.X - 1) * (PowerSeries.X * (r - PowerSeries.X)) *
      (1 - (1 - PowerSeries.X - r) * αSeries 0) = 0 := by
    linear_combination -hev - (PowerSeries.X - 1) * PowerSeries.X ^ 2 * hβ0
  rcases mul_eq_zero.1 hfact with hfac | hres
  · rcases mul_eq_zero.1 hfac with h1 | h2
    · exact False.elim (X_sub_one_ne_zero h1)
    · rcases mul_eq_zero.1 h2 with hX | hrX
      · exact False.elim (X_ne_zero hX)
      · exact False.elim (hrne (sub_eq_zero.1 hrX))
  · linear_combination -hres

theorem P_tree_eq_X_mul_α0 :
    P_tree = PowerSeries.X * αSeries 0 := by
  unfold P_tree
  have hu := U_eq_ansatz 0 0 le_rfl
  simp only [Nat.sub_self, pow_zero, mul_one] at hu
  have hβ0 := eval_at_X_eq
  linear_combination hu - hβ0

/-- `P_tree` satisfies Chern–Fu–Lin equation (1.2) with zero constant term. -/
theorem P_tree_equation :
    PowerSeries.constantCoeff P_tree = 0 ∧
    P_tree = (1 + P_tree) * (PowerSeries.X + (1 - PowerSeries.X) * P_tree ^ 2) := by
  refine ⟨?_, ?_⟩
  · rw [P_tree_eq_X_mul_α0]
    simp
  · obtain ⟨r, hr0, hrcub, hrne⟩ := r_exists
    have hrel := eval_at_r_eq r hr0 hrcub hrne
    have hP := P_tree_eq_X_mul_α0
    have hrP : r * P_tree = (1 - PowerSeries.X) * P_tree - PowerSeries.X := by
      linear_combination -(PowerSeries.X * hrel) - (1 - PowerSeries.X - r) * hP
    have hmul : PowerSeries.X ^ 2 *
        (P_tree - (1 + P_tree) * (PowerSeries.X + (1 - PowerSeries.X) * P_tree ^ 2)) = 0 := by
      linear_combination
        P_tree ^ 3 * hrcub -
        ((r * P_tree) ^ 2 + (r * P_tree) * ((1 - PowerSeries.X) * P_tree - PowerSeries.X) +
          ((1 - PowerSeries.X) * P_tree - PowerSeries.X) ^ 2 +
          (2 * PowerSeries.X - 2) * P_tree *
            (r * P_tree + ((1 - PowerSeries.X) * P_tree - PowerSeries.X)) +
          (1 - PowerSeries.X) * P_tree ^ 2) * hrP
    rcases mul_eq_zero.1 hmul with hX2 | hres
    · exact False.elim (pow_ne_zero 2 X_ne_zero hX2)
    · linear_combination hres

/-- Uniqueness of the zero-constant-term solution to `Q = (1 + Q)(X + (1 - X)Q^2)`. -/
theorem cubic_solution_unique (Q₁ Q₂ : PowerSeries ℤ)
    (h10 : PowerSeries.constantCoeff Q₁ = 0)
    (h20 : PowerSeries.constantCoeff Q₂ = 0)
    (h1 : Q₁ = (1 + Q₁) * (PowerSeries.X + (1 - PowerSeries.X) * Q₁ ^ 2))
    (h2 : Q₂ = (1 + Q₂) * (PowerSeries.X + (1 - PowerSeries.X) * Q₂ ^ 2)) :
    Q₁ = Q₂ := by
  have hprod : (Q₁ - Q₂) *
      (1 - PowerSeries.X - (1 - PowerSeries.X) * (Q₁ + Q₂ + Q₁ ^ 2 + Q₁ * Q₂ + Q₂ ^ 2)) = 0 := by
    linear_combination h1 - h2
  rcases mul_eq_zero.1 hprod with hdiff | hunit
  · exact sub_eq_zero.1 hdiff
  · have hc := congrArg PowerSeries.constantCoeff hunit
    simp [h10, h20] at hc

end Conjectures.BursteinA218225
