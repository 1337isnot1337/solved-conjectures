import Conjectures.CaioloFerroniHosterArithmetic
import Mathlib.Algebra.Order.Ring.Nat

/-! # Orders of growth of the flag counts -/

set_option linter.unusedSectionVars false
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false

namespace CaioloFerroniHoster.Ranks

open Finset

theorem gauss_zero (q : ℕ) : ∀ d, gaussian q d 0 = 1
  | 0 => rfl
  | _ + 1 => rfl

theorem gauss_big (q : ℕ) : ∀ d i, d < i → gaussian q d i = 0
  | 0, i, h => by simp [gaussian]; omega
  | d + 1, i + 1, h => by
    rw [gaussian, gauss_big q d i (by omega), gauss_big q d (i + 1) (by omega)]; simp

theorem gauss_self (q : ℕ) : ∀ d, gaussian q d d = 1
  | 0 => rfl
  | d + 1 => by rw [gaussian, gauss_self q d, gauss_big q d (d + 1) (by omega)]; simp

theorem gauss_lower (q : ℕ) (i : ℕ) : ∀ j, q ^ (i * j) ≤ gaussian q (i + j) i := by
  cases i with
  | zero => intro j; simp [gauss_zero]
  | succ i =>
    intro j
    induction j with
    | zero => simp [gauss_self]
    | succ j ih =>
      rw [show i + 1 + (j + 1) = (i + 1 + j) + 1 by omega, gaussian]
      calc q ^ ((i + 1) * (j + 1)) = q ^ (i + 1) * q ^ ((i + 1) * j) := by rw [← pow_add]; ring_nf
        _ ≤ q ^ (i + 1) * gaussian q (i + 1 + j) (i + 1) := Nat.mul_le_mul_left _ ih
        _ ≤ _ := Nat.le_add_left _ _

theorem gauss_shift (q i d : ℕ) : ∀ e, q ^ (i * e) * gaussian q d i ≤ gaussian q (d + e) i := by
  cases i with
  | zero => intro e; simp [gauss_zero]
  | succ i =>
    intro e
    induction e with
    | zero => simp
    | succ e ih =>
      rw [← add_assoc, gaussian]
      calc q ^ ((i + 1) * (e + 1)) * gaussian q d (i + 1)
          = q ^ (i + 1) * (q ^ ((i + 1) * e) * gaussian q d (i + 1)) := by
            rw [← mul_assoc, ← pow_add]; ring_nf
        _ ≤ q ^ (i + 1) * gaussian q (d + e) (i + 1) := Nat.mul_le_mul_left _ ih
        _ ≤ _ := Nat.le_add_left _ _

theorem gauss_upper {q : ℕ} (hq : 1 ≤ q) : ∀ d i j, i + j = d →
    gaussian q d i ≤ 2 ^ d * q ^ (i * j) := by
  intro d
  induction d with
  | zero => intro i j h; obtain ⟨rfl, rfl⟩ : i = 0 ∧ j = 0 := by omega
            simp [gaussian]
  | succ d ih =>
    intro i j h
    match i, j with
    | 0, j => simp [gaussian]; exact Nat.one_le_two_pow
    | i + 1, 0 =>
      obtain rfl : i = d := by omega
      rw [gauss_self]; simp; exact Nat.one_le_two_pow
    | i + 1, j + 1 =>
      rw [gaussian]
      have h1 := ih i (j + 1) (by omega)
      have h2 := ih (i + 1) j (by omega)
      have h3 : q ^ (i * (j + 1)) ≤ q ^ ((i + 1) * (j + 1)) :=
        Nat.pow_le_pow_right hq (Nat.mul_le_mul_right _ (by omega))
      have h4 : q ^ (i + 1) * q ^ ((i + 1) * j) = q ^ ((i + 1) * (j + 1)) := by
        rw [← pow_add]; ring_nf
      calc _ ≤ 2 ^ d * q ^ (i * (j + 1)) + q ^ (i + 1) * (2 ^ d * q ^ ((i + 1) * j)) :=
            Nat.add_le_add h1 (Nat.mul_le_mul_left _ h2)
        _ = 2 ^ d * q ^ (i * (j + 1)) + 2 ^ d * q ^ ((i + 1) * (j + 1)) := by rw [← h4]; ring
        _ ≤ 2 ^ d * q ^ ((i + 1) * (j + 1)) + 2 ^ d * q ^ ((i + 1) * (j + 1)) :=
            Nat.add_le_add_right (Nat.mul_le_mul_left _ h3) _
        _ = _ := by ring

/-- Second-order upper bound. -/
theorem gauss_upper' {q : ℕ} (hq : 1 ≤ q) (i : ℕ) : ∀ j,
    q * gaussian q (i + j) i ≤ q * q ^ (i * j) + 2 ^ (i + j) * q ^ (i * j) := by
  cases i with
  | zero => intro j; simp [gauss_zero]
  | succ i =>
    intro j
    induction j with
    | zero => simp [gauss_self]
    | succ j ih =>
      rw [show i + 1 + (j + 1) = (i + 1 + j) + 1 by omega, gaussian]
      have h1 := gauss_upper hq (i + 1 + j) i (j + 1) (by omega)
      have h4 : q ^ (i + 1) * q ^ ((i + 1) * j) = q ^ ((i + 1) * (j + 1)) := by
        rw [← pow_add]; ring_nf
      have h5 : q * q ^ (i * (j + 1)) ≤ q ^ ((i + 1) * (j + 1)) := by
        rw [← pow_succ']; exact Nat.pow_le_pow_right hq (by nlinarith)
      calc q * (gaussian q (i + 1 + j) i + q ^ (i + 1) * gaussian q (i + 1 + j) (i + 1))
          = q * gaussian q (i + 1 + j) i + q ^ (i + 1) * (q * gaussian q (i + 1 + j) (i + 1)) := by ring
        _ ≤ q * (2 ^ (i + 1 + j) * q ^ (i * (j + 1))) +
            q ^ (i + 1) * (q * q ^ ((i + 1) * j) + 2 ^ (i + 1 + j) * q ^ ((i + 1) * j)) :=
            Nat.add_le_add (Nat.mul_le_mul_left _ h1) (Nat.mul_le_mul_left _ ih)
        _ = 2 ^ (i + 1 + j) * (q * q ^ (i * (j + 1))) +
            (q * q ^ ((i + 1) * (j + 1)) + 2 ^ (i + 1 + j) * q ^ ((i + 1) * (j + 1))) := by
            rw [← h4]; ring
        _ ≤ 2 ^ (i + 1 + j) * q ^ ((i + 1) * (j + 1)) +
            (q * q ^ ((i + 1) * (j + 1)) + 2 ^ (i + 1 + j) * q ^ ((i + 1) * (j + 1))) :=
            Nat.add_le_add_right (Nat.mul_le_mul_left _ h5) _
        _ = _ := by ring

/-- `n choose 2`. -/
def ch (n : ℕ) : ℕ := n.choose 2

theorem ch_succ (n : ℕ) : ch (n + 1) = ch n + n := by
  rw [ch, ch, Nat.choose_succ_succ' n 1, Nat.choose_one_right, add_comm]

theorem ch_add (i j : ℕ) : ch (i + j) = ch i + ch j + i * j := by
  induction j with
  | zero => simp [ch]
  | succ j ih => rw [← add_assoc, ch_succ, ih, ch_succ]; ring

theorem le_ch (j : ℕ) : j ≤ ch j + 1 := by
  induction j with
  | zero => omega
  | succ j ih => rw [ch_succ]; cases j with
    | zero => simp [ch]
    | succ j => omega

theorem exists_sum_bound {ι : Type*} (s : Finset ι) (f : ι → ℕ → ℕ) (g : ℕ → ℕ)
    (h : ∀ i ∈ s, ∃ C, ∀ q, 1 ≤ q → f i q ≤ C * g q) :
    ∃ C, ∀ q, 1 ≤ q → ∑ i ∈ s, f i q ≤ C * g q := by
  classical
  induction s using Finset.induction_on with
  | empty => exact ⟨0, by simp⟩
  | insert a s ha ih =>
    obtain ⟨C1, h1⟩ := h a (mem_insert_self _ _)
    obtain ⟨C2, h2⟩ := ih fun i hi => h i (mem_insert_of_mem hi)
    refine ⟨C1 + C2, fun q hq => ?_⟩
    rw [sum_insert ha, add_mul]
    exact Nat.add_le_add (h1 q hq) (h2 q hq)

/-- Flags missing `d-1-|s|` dimensions lose that many factors of `q`. -/
theorem pf_upper (s : List ℕ) : ∀ d t, ∃ C, ∀ q, 1 ≤ q →
    q ^ (d - 1 - s.length) * productFlag q d t s ≤ C * q ^ ch d := by
  induction s with
  | nil =>
    intro d t
    refine ⟨1, fun q hq => ?_⟩
    simp only [productFlag, mul_one, one_mul, List.length_nil]
    exact Nat.pow_le_pow_right hq (by have := le_ch d; omega)
  | cons r s ih =>
    intro d t
    have := exists_sum_bound (range (r + 1))
      (fun i q => q ^ (d - 1 - (s.length + 1)) *
        (gaussian q d i * t.choose (r - i) * productFlag q i (r - i) s)) (fun q => q ^ ch d) ?_
    · obtain ⟨C, hC⟩ := this
      refine ⟨C, fun q hq => ?_⟩
      rw [productFlag, mul_sum]
      exact hC q hq
    · intro i _
      by_cases hid : d < i
      · exact ⟨0, fun q _ => by rw [gauss_big q d i hid]; simp⟩
      · obtain ⟨j, rfl⟩ : ∃ j, d = i + j := ⟨d - i, by omega⟩
        obtain ⟨C, hC⟩ := ih i (r - i)
        refine ⟨2 ^ (i + j) * t.choose (r - i) * C, fun q hq => ?_⟩
        have h1 := gauss_upper hq (i + j) i j rfl
        have h2 := hC q hq
        have h3 : q ^ (i + j - 1 - (s.length + 1)) ≤ q ^ ch j * q ^ (i - 1 - s.length) := by
          rw [← pow_add]
          exact Nat.pow_le_pow_right hq (by have := le_ch j; omega)
        calc _ ≤ (q ^ ch j * q ^ (i - 1 - s.length)) * (2 ^ (i + j) * q ^ (i * j) *
              t.choose (r - i) * productFlag q i (r - i) s) := by gcongr
          _ = 2 ^ (i + j) * t.choose (r - i) * q ^ (i * j) * q ^ ch j *
              (q ^ (i - 1 - s.length) * productFlag q i (r - i) s) := by ring
          _ ≤ 2 ^ (i + j) * t.choose (r - i) * q ^ (i * j) * q ^ ch j * (C * q ^ ch i) := by gcongr
          _ = _ := by rw [ch_add, pow_add, pow_add]; ring

/-- `[n, ..., 1]` -/
def full : ℕ → List ℕ
  | 0 => []
  | n + 1 => (n + 1) :: full n

theorem pf_term (q d t r i : ℕ) (s : List ℕ) (hi : i ≤ r) :
    gaussian q d i * t.choose (r - i) * productFlag q i (r - i) s ≤ productFlag q d t (r :: s) := by
  rw [productFlag]
  exact single_le_sum (f := fun i => gaussian q d i * t.choose (r - i) * productFlag q i (r - i) s)
    (fun _ _ => Nat.zero_le _) (mem_range.2 (by omega))

theorem pf_full (q : ℕ) : ∀ n t, q ^ ch (n + 1) ≤ productFlag q (n + 1) t (full n)
  | 0, t => by simp [full, productFlag, ch]
  | n + 1, t => by
    refine le_trans ?_ (pf_term q (n + 2) t (n + 1) (n + 1) (full n) le_rfl)
    have h1 := gauss_lower q (n + 1) 1
    have h2 := pf_full q n 0
    simp only [Nat.sub_self, Nat.choose_zero_right, mul_one] at *
    rw [ch_succ, pow_add, mul_comm]
    exact Nat.mul_le_mul h1 h2

/-- `[n+3, ..., 4, 2]` -/
def special : ℕ → List ℕ
  | 0 => [2]
  | n + 1 => (n + 4) :: special n

theorem pf_special {q : ℕ} : ∀ n, q ^ ch (n + 2) ≤ productFlag q (n + 2) 2 (special n)
  | 0 => by
    refine le_trans ?_ (pf_term q 2 2 2 1 [] (by norm_num))
    have h1 := gauss_lower q 1 1
    simp [productFlag, ch] at h1 ⊢
    omega
  | n + 1 => by
    refine le_trans ?_ (pf_term q (n + 3) 2 (n + 4) (n + 2) (special n) (by omega))
    have h1 := gauss_lower q (n + 2) 1
    have h2 := pf_special (q := q) n
    rw [show n + 4 - (n + 2) = 2 by omega]
    simp only [mul_one, Nat.choose_self] at *
    rw [show n + 1 + 2 = (n + 2) + 1 by omega, ch_succ, pow_add, mul_comm]
    exact Nat.mul_le_mul h1 h2

theorem full_length : ∀ n, (full n).length = n
  | 0 => rfl
  | n + 1 => by simp [full, full_length n]

theorem special_length : ∀ n, (special n).length = n + 1
  | 0 => rfl
  | n + 1 => by simp [special, special_length n]

/-- The flag counts of the rank `k+1` coalesced matroid. -/
structure IsCount (q k : ℕ) (f : List ℕ → ℕ) : Prop where
  low : ∀ s : List ℕ, (∀ r ∈ s, r < k) → f s = productFlag q (2 * k) (q ^ k) s
  high : ∀ s : List ℕ, (∀ r ∈ s, r < k) →
    f (k :: s) + q ^ (k * k) * productFlag q k 1 (k :: s) =
      productFlag q (2 * k) (q ^ k) (k :: s) + q ^ (k * k) * productFlag q k 1 s

/-- The degree of the total flag count. -/
def deg (k : ℕ) : ℕ := k * k + ch k

private theorem choose_le_pow' (m j : ℕ) : m.choose j ≤ m ^ j := Nat.choose_le_pow m j

/-- Flags avoiding the top rank are few. -/
theorem low_upper (k : ℕ) (s : List ℕ) (hs : s ≠ []) (hk : ∀ r ∈ s, r < k) :
    ∃ C, ∀ q f, 1 ≤ q → IsCount q k f → q ^ k * f s ≤ C * q ^ deg k := by
  obtain ⟨r, s, rfl⟩ := List.exists_cons_of_ne_nil hs
  have hr : r < k := hk r List.mem_cons_self
  have := exists_sum_bound (range (r + 1))
      (fun i q => q ^ k * (gaussian q (2 * k) i * (q ^ k).choose (r - i) *
        productFlag q i (r - i) s)) (fun q => q ^ deg k) ?_
  · obtain ⟨C, hC⟩ := this
    refine ⟨C, fun q f hq hf => ?_⟩
    rw [hf.low _ hk, productFlag, mul_sum]
    exact hC q hq
  · intro i hi
    have hir : i ≤ r := by simpa [Nat.lt_succ_iff] using hi
    obtain ⟨a, rfl⟩ : ∃ a, k = i + a := ⟨k - i, by omega⟩
    obtain ⟨C, hC⟩ := pf_upper s i (r - i)
    refine ⟨2 ^ (2 * (i + a)) * C, fun q hq => ?_⟩
    have h1 := gauss_upper hq (2 * (i + a)) i (i + 2 * a) (by omega)
    have h2 := (Nat.le_mul_of_pos_left _ (Nat.pow_pos (n := i - 1 - s.length) hq)).trans (hC q hq)
    have h3 := choose_le_pow' (q ^ (i + a)) (r - i)
    have h4 : q ^ (i + a) * (q ^ (i * (i + 2 * a)) * (q ^ (i + a)) ^ (r - i) * q ^ ch i) ≤
        q ^ deg (i + a) := by
      rw [← pow_mul, ← pow_add, ← pow_add, ← pow_add]
      refine Nat.pow_le_pow_right hq ?_
      rw [deg, ch_add]
      have : (i + a) * (r - i) + (i + a) ≤ (i + a) * a := by
        rw [← Nat.mul_succ]; exact Nat.mul_le_mul_left _ (by omega)
      nlinarith
    calc _ ≤ q ^ (i + a) * (2 ^ (2 * (i + a)) * q ^ (i * (i + 2 * a)) * (q ^ (i + a)) ^ (r - i) *
          (C * q ^ ch i)) := by gcongr
      _ = 2 ^ (2 * (i + a)) * C * (q ^ (i + a) * (q ^ (i * (i + 2 * a)) *
          (q ^ (i + a)) ^ (r - i) * q ^ ch i)) := by ring
      _ ≤ _ := Nat.mul_le_mul_left _ h4

/-- Splitting off the hyperplane types with at most one free point. -/
theorem pf_split (q k t : ℕ) (s : List ℕ) (d : ℕ) :
    productFlag q d t ((k + 1) :: s) =
      (∑ i ∈ range k, gaussian q d i * t.choose (k + 1 - i) * productFlag q i (k + 1 - i) s) +
      gaussian q d k * t * productFlag q k 1 s +
      gaussian q d (k + 1) * productFlag q (k + 1) 0 s := by
  rw [productFlag, sum_range_succ, sum_range_succ]
  simp

theorem block_split (q k : ℕ) (s : List ℕ) :
    productFlag q (k + 1) 1 ((k + 1) :: s) =
      gaussian q (k + 1) k * productFlag q k 1 s + productFlag q (k + 1) 0 s := by
  rw [pf_split, sum_eq_zero, gauss_self]
  · simp
  · intro i hi
    have : i < k := by simpa using hi
    rw [Nat.choose_eq_zero_of_lt (by omega)]; simp

private theorem removed_le (q k : ℕ) (s : List ℕ) :
    q ^ ((k + 1) * (k + 1)) * productFlag q (k + 1) 1 ((k + 1) :: s) ≤
      gaussian q (2 * (k + 1)) k * q ^ (k + 1) * productFlag q k 1 s +
      gaussian q (2 * (k + 1)) (k + 1) * productFlag q (k + 1) 0 s := by
  rw [block_split, mul_add]
  have h1 := gauss_shift q k (k + 1) (k + 1)
  have h2 := gauss_lower q (k + 1) (k + 1)
  rw [← two_mul] at h1 h2
  refine Nat.add_le_add ?_ (Nat.mul_le_mul_right _ h2)
  calc _ = (q ^ (k * (k + 1)) * gaussian q (k + 1) k) * q ^ (k + 1) * productFlag q k 1 s := by
        rw [show (k + 1) * (k + 1) = k * (k + 1) + (k + 1) by ring, pow_add]; ring
    _ ≤ _ := by gcongr

theorem high_lower_block {q k : ℕ} {f : List ℕ → ℕ} (hf : IsCount q (k + 1) f) (s : List ℕ)
    (hs : ∀ r ∈ s, r < k + 1) :
    q ^ ((k + 1) * (k + 1)) * productFlag q (k + 1) 1 s ≤ f ((k + 1) :: s) := by
  have h := hf.high s hs
  have h1 := removed_le q k s
  rw [pf_split q k (q ^ (k + 1)) s] at h
  omega

theorem high_lower_type {q k i : ℕ} {f : List ℕ → ℕ} (hf : IsCount q (k + 1) f) (s : List ℕ)
    (hs : ∀ r ∈ s, r < k + 1) (hi : i < k) :
    gaussian q (2 * (k + 1)) i * (q ^ (k + 1)).choose (k + 1 - i) * productFlag q i (k + 1 - i) s ≤
      f ((k + 1) :: s) := by
  have h := hf.high s hs
  have h1 := removed_le q k s
  rw [pf_split q k (q ^ (k + 1)) s] at h
  have h2 := single_le_sum (f := fun i => gaussian q (2 * (k + 1)) i *
    (q ^ (k + 1)).choose (k + 1 - i) * productFlag q i (k + 1 - i) s) (s := range k)
    (fun _ _ => Nat.zero_le _) (mem_range.2 hi)
  omega

/-- Upper bound for flags through a hyperplane. -/
theorem high_upper (k e : ℕ) (s : List ℕ) (hs : ∀ r ∈ s, r < k + 1) (ha : e + s.length ≤ k)
    (he : 1 ≤ e) (ht : ∀ t, 2 ≤ t → e ≤ ch t + (k - s.length - t)) :
    ∃ C, ∀ q f, 1 ≤ q → IsCount q (k + 1) f → q ^ e * f ((k + 1) :: s) ≤ C * q ^ deg (k + 1) := by
  have hT := exists_sum_bound (range k)
      (fun i q => q ^ e * (gaussian q (2 * (k + 1)) i * (q ^ (k + 1)).choose (k + 1 - i) *
        productFlag q i (k + 1 - i) s)) (fun q => q ^ deg (k + 1)) ?_
  · obtain ⟨CT, hCT⟩ := hT
    obtain ⟨C0, h0⟩ := pf_upper s (k + 1) 0
    obtain ⟨C1, h1⟩ := pf_upper s k 1
    obtain ⟨CB, hB⟩ := pf_upper s (k + 1) 1
    refine ⟨CT + 2 ^ (k + (k + 2)) * C1 + 2 ^ (k + 1 + (k + 1)) * C0 + CB, fun q f hq hf => ?_⟩
    have hT := hCT q hq
    have h0 := h0 q hq
    have h1 := h1 q hq
    have hB := hB q hq
    have h := hf.high s hs
    rw [pf_split q k (q ^ (k + 1)) s, block_split] at h
    -- second-order bounds for the two corrected multiplicities
    have g1 := gauss_upper' hq k (k + 2)
    have g0 := gauss_upper' hq (k + 1) (k + 1)
    rw [show k + (k + 2) = 2 * (k + 1) by omega] at g1
    rw [show k + 1 + (k + 1) = 2 * (k + 1) by omega] at g0
    have l1 := gauss_lower q k 1
    set N1 := gaussian q (2 * (k + 1)) k
    set N0 := gaussian q (2 * (k + 1)) (k + 1)
    set L := gaussian q (k + 1) k
    set P1 := productFlag q k 1 s
    set P0 := productFlag q (k + 1) 0 s
    set PB := productFlag q (k + 1) 1 s
    set T := ∑ i ∈ range k, gaussian q (2 * (k + 1)) i * (q ^ (k + 1)).choose (k + 1 - i) *
      productFlag q i (k + 1 - i) s
    set b := q ^ ((k + 1) * (k + 1))
    set G := 2 ^ (2 * (k + 1))
    have hT' : q ^ e * T ≤ CT * q ^ deg (k + 1) := by rw [mul_sum]; exact hT
    obtain ⟨e', rfl⟩ : ∃ e', e = e' + 1 := ⟨e - 1, by omega⟩
    simp only [mul_one] at l1
    -- type one
    have t1 : q ^ (e' + 1) * (N1 * q ^ (k + 1) * P1) ≤
        q ^ (e' + 1) * (b * (L * P1)) + G * C1 * q ^ deg (k + 1) := by
      have hb : b = q ^ (k * (k + 2)) * q := by
        rw [← pow_succ, show k * (k + 2) + 1 = (k + 1) * (k + 1) by ring]
      have a1 : q * N1 * q ^ (k + 1) ≤ q * (b * L) + G * q ^ (k * (k + 2)) * q ^ (k + 1) := by
        calc q * N1 * q ^ (k + 1) ≤ (q * q ^ (k * (k + 2)) + G * q ^ (k * (k + 2))) * q ^ (k + 1) :=
              Nat.mul_le_mul_right _ g1
          _ = q * (b * q ^ k) + G * q ^ (k * (k + 2)) * q ^ (k + 1) := by rw [hb, pow_succ]; ring
          _ ≤ _ := by gcongr
      have a2 : q ^ e' * (q ^ (k * (k + 2)) * q ^ (k + 1) * P1) ≤ C1 * q ^ deg (k + 1) := by
        have : q ^ e' * P1 ≤ C1 * q ^ ch k :=
          (Nat.mul_le_mul_right _ (Nat.pow_le_pow_right hq (by omega))).trans h1
        calc _ = q ^ (k * (k + 2)) * q ^ (k + 1) * (q ^ e' * P1) := by ring
          _ ≤ q ^ (k * (k + 2)) * q ^ (k + 1) * (C1 * q ^ ch k) := Nat.mul_le_mul_left _ this
          _ = C1 * q ^ deg (k + 1) := by
            rw [deg, ch_succ, show (k + 1) * (k + 1) + (ch k + k) = k * (k + 2) + (k + 1) + ch k by ring,
              pow_add, pow_add]; ring
      calc _ = q ^ e' * P1 * (q * N1 * q ^ (k + 1)) := by rw [pow_succ]; ring
        _ ≤ q ^ e' * P1 * (q * (b * L) + G * q ^ (k * (k + 2)) * q ^ (k + 1)) :=
            Nat.mul_le_mul_left _ a1
        _ = q ^ (e' + 1) * (b * (L * P1)) +
            G * (q ^ e' * (q ^ (k * (k + 2)) * q ^ (k + 1) * P1)) := by rw [pow_succ]; ring
        _ ≤ q ^ (e' + 1) * (b * (L * P1)) + G * (C1 * q ^ deg (k + 1)) := by gcongr
        _ = _ := by ring
    -- type zero
    have t0 : q ^ (e' + 1) * (N0 * P0) ≤ q ^ (e' + 1) * (b * P0) + G * C0 * q ^ deg (k + 1) := by
      have a2 : q ^ e' * (b * P0) ≤ C0 * q ^ deg (k + 1) := by
        have : q ^ e' * P0 ≤ C0 * q ^ ch (k + 1) :=
          (Nat.mul_le_mul_right _ (Nat.pow_le_pow_right hq (by omega))).trans h0
        calc _ = b * (q ^ e' * P0) := by ring
          _ ≤ b * (C0 * q ^ ch (k + 1)) := Nat.mul_le_mul_left _ this
          _ = _ := by rw [deg, pow_add]; ring
      calc _ = q ^ e' * P0 * (q * N0) := by rw [pow_succ]; ring
        _ ≤ q ^ e' * P0 * (q * b + G * b) := Nat.mul_le_mul_left _ g0
        _ = q ^ (e' + 1) * (b * P0) + G * (q ^ e' * (b * P0)) := by rw [pow_succ]; ring
        _ ≤ q ^ (e' + 1) * (b * P0) + G * (C0 * q ^ deg (k + 1)) := by gcongr
        _ = _ := by ring
    -- blocks
    have tb : q ^ (e' + 1) * (b * PB) ≤ CB * q ^ deg (k + 1) := by
      have : q ^ (e' + 1) * PB ≤ CB * q ^ ch (k + 1) :=
        (Nat.mul_le_mul_right _ (Nat.pow_le_pow_right hq (by omega))).trans hB
      calc _ = b * (q ^ (e' + 1) * PB) := by ring
        _ ≤ b * (CB * q ^ ch (k + 1)) := Nat.mul_le_mul_left _ this
        _ = _ := by rw [deg, pow_add]; ring
    have hmul := congrArg (fun x => q ^ (e' + 1) * x) h
    simp only [mul_add] at hmul
    have e1 : 2 ^ (k + (k + 2)) = G := by
      rw [show k + (k + 2) = 2 * (k + 1) by omega]
    have e2 : 2 ^ (k + 1 + (k + 1)) = G := by
      rw [show k + 1 + (k + 1) = 2 * (k + 1) by omega]
    rw [e1, e2]
    simp only [add_mul]
    omega
  · intro i hi
    have hik : i < k := by simpa using hi
    obtain ⟨t, rfl⟩ : ∃ t, k = i + t + 1 := ⟨k - i - 1, by omega⟩
    obtain ⟨C, hC⟩ := pf_upper s i (i + t + 1 + 1 - i)
    refine ⟨2 ^ (2 * (i + t + 1 + 1)) * C, fun q hq => ?_⟩
    have h1 := gauss_upper hq (2 * (i + t + 1 + 1)) i (i + 2 * (t + 2)) (by omega)
    have h2 := hC q hq
    rw [show i + t + 1 + 1 - i = t + 2 by omega] at h2 ⊢
    have h3 := choose_le_pow' (q ^ (i + t + 1 + 1)) (t + 2)
    have h5 : q ^ e ≤ q ^ ch (t + 2) * q ^ (i - 1 - s.length) := by
      rw [← pow_add]
      have := ht (t + 2) (by omega)
      exact Nat.pow_le_pow_right hq (by omega)
    calc _ ≤ (q ^ ch (t + 2) * q ^ (i - 1 - s.length)) * (2 ^ (2 * (i + t + 1 + 1)) *
          q ^ (i * (i + 2 * (t + 2))) * (q ^ (i + t + 1 + 1)) ^ (t + 2) *
          productFlag q i (t + 2) s) := by gcongr
      _ = 2 ^ (2 * (i + t + 1 + 1)) * (q ^ ch (t + 2) * q ^ (i * (i + 2 * (t + 2))) *
          (q ^ (i + t + 1 + 1)) ^ (t + 2)) * (q ^ (i - 1 - s.length) * productFlag q i (t + 2) s) := by
          ring
      _ ≤ 2 ^ (2 * (i + t + 1 + 1)) * (q ^ ch (t + 2) * q ^ (i * (i + 2 * (t + 2))) *
          (q ^ (i + t + 1 + 1)) ^ (t + 2)) * (C * q ^ ch i) := by gcongr
      _ = 2 ^ (2 * (i + t + 1 + 1)) * C * q ^ deg (i + t + 1 + 1) := by
          rw [← pow_mul, deg, show i + t + 1 + 1 = i + (t + 2) by omega, ch_add i (t + 2),
            show (i + (t + 2)) * (i + (t + 2)) + (ch i + ch (t + 2) + i * (t + 2)) =
              ch (t + 2) + i * (i + 2 * (t + 2)) + (i + (t + 2)) * (t + 2) + ch i by ring,
            pow_add, pow_add, pow_add]
          ring

/-- Lower bound for complete flags. -/
theorem full_lower {q k : ℕ} {f : List ℕ → ℕ} (hf : IsCount q (k + 1) f) :
    q ^ deg (k + 1) ≤ f (full (k + 1)) := by
  have hs : ∀ r ∈ full k, r < k + 1 := by
    intro r hr
    clear hf
    induction k with
    | zero => simp [full] at hr
    | succ k ih => simp only [full, List.mem_cons] at hr; rcases hr with rfl | hr
                   · omega
                   · have := ih hr; omega
  refine le_trans ?_ (high_lower_block hf (full k) hs)
  rw [deg, pow_add]
  exact Nat.mul_le_mul_left _ (pf_full q k 1)

theorem special_lt : ∀ n, ∀ r ∈ special n, r < n + 4
  | 0, r, h => by simp [special] at h; omega
  | n + 1, r, h => by
    simp only [special, List.mem_cons] at h
    rcases h with rfl | h
    · omega
    · have := special_lt n r h; omega

/-- Lower bound for flags omitting ranks one and three. -/
theorem special_lower {q n : ℕ} (hq : 2 ≤ q) {f : List ℕ → ℕ} (hf : IsCount q (n + 4) f) :
    q ^ deg (n + 4) ≤ 4 * (q * f ((n + 4) :: special n)) := by
  have h := high_lower_type (k := n + 3) (i := n + 2) hf (special n) (special_lt n) (by omega)
  rw [show n + 3 + 1 - (n + 2) = 2 by omega] at h
  have h1 := gauss_lower q (n + 2) (n + 6)
  rw [show n + 2 + (n + 6) = 2 * (n + 3 + 1) by omega] at h1
  have h2 := pf_special (q := q) n
  set m := q ^ (n + 3 + 1) with hm
  have hm2 : 2 ≤ m := hq.trans (Nat.le_self_pow (by omega) q)
  have h3 : m * m ≤ 4 * m.choose 2 := by
    obtain ⟨a, ha⟩ : ∃ a, m = a + 2 := ⟨m - 2, by omega⟩
    have hc : 2 * m.choose 2 = m * (m - 1) := by
      rw [Nat.choose_two_right, Nat.mul_div_cancel' (Nat.even_mul_pred_self m).two_dvd]
    rw [ha] at hc ⊢
    rw [show a + 2 - 1 = a + 1 by omega] at hc
    nlinarith
  calc q ^ deg (n + 4) = q * (q ^ ((n + 2) * (n + 6)) * (m * m) * q ^ ch (n + 2)) := by
        rw [hm, ← pow_add, ← pow_add, ← pow_add, ← pow_succ']
        congr 1
        rw [deg, show n + 4 = (n + 2) + 1 + 1 by omega, ch_succ, ch_succ]
        ring
    _ ≤ q * (gaussian q (2 * (n + 3 + 1)) (n + 2) * (4 * m.choose 2) *
          productFlag q (n + 2) 2 (special n)) := by gcongr
    _ = 4 * (q * (gaussian q (2 * (n + 3 + 1)) (n + 2) * m.choose 2 *
          productFlag q (n + 2) 2 (special n))) := by ring
    _ ≤ _ := by gcongr

end CaioloFerroniHoster.Ranks
