import Conjectures.GravgaardLeeDiameterDigits

/-!
# Lüroth cylinders and unreduced denominators for the revised Tan–Zhou problem

A word is stored by appending one digit index at a time. Index `d` denotes
digit `d + 2`. The length-zero word has interval `(0, 1]`.
-/

open Set Finset Filter
open scoped Topology

namespace RevisedTanZhou

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth GravgaardLeeDiameter

noncomputable section

abbrev Word : ℕ → Type
  | 0 => Unit
  | n + 1 => Word n × ℕ

instance (n : ℕ) : Countable (Word n) := by
  induction n with
  | zero => change Countable Unit; infer_instance
  | succ n ih => change Countable (Word n × ℕ); infer_instance

def A : (n : ℕ) → Word n → ℕ
  | 0, _ => 1
  | n + 1, w => A n w.1 * (w.2 + 2) * (w.2 + 1)

def Q (n : ℕ) (w : Word (n + 1)) : ℕ := A n w.1 * (w.2 + 2)

def center : (n : ℕ) → Word n → ℝ
  | 0, _ => 0
  | n + 1, w => center n w.1 + 1 / (Q n w : ℝ)

def lengthOf {n : ℕ} (w : Word n) : ℝ := 1 / (A n w : ℝ)

def cylinder {n : ℕ} (w : Word n) : Set ℝ :=
  Set.Ioc (center n w) (center n w + lengthOf w)

theorem two_pow_le_A (n : ℕ) (w : Word n) : 2 ^ n ≤ A n w := by
  induction n with
  | zero => simp [A]
  | succ n ih =>
      rw [pow_succ]
      exact (Nat.mul_le_mul (ih w.1) (by omega)).trans (Nat.le_mul_of_pos_right _ (by omega))

theorem A_pos {n : ℕ} (w : Word n) : 0 < A n w :=
  (pow_pos (by decide : 0 < (2 : ℕ)) _).trans_le (two_pow_le_A n w)

theorem two_pow_le_Q (n : ℕ) (w : Word (n + 1)) : 2 ^ (n + 1) ≤ Q n w := by
  rw [pow_succ]
  exact Nat.mul_le_mul (two_pow_le_A _ w.1) (by omega)

theorem Q_pos {n : ℕ} (w : Word (n + 1)) : 0 < Q n w :=
  (pow_pos (by decide : 0 < (2 : ℕ)) _).trans_le (two_pow_le_Q n w)

theorem Q_le_A (n : ℕ) (w : Word (n + 1)) : Q n w ≤ A (n + 1) w :=
  Nat.le_mul_of_pos_right _ (by omega)

theorem length_pos {n : ℕ} (w : Word n) : 0 < lengthOf w :=
  one_div_pos.mpr (by exact_mod_cast A_pos w)

theorem length_snoc {n : ℕ} (w : Word n) (d : ℕ) :
    lengthOf (show Word (n + 1) from (w, d)) = lengthOf w * width (d + 2) := by
  have ha : (0 : ℝ) < A n w := by exact_mod_cast A_pos w
  have hd : (0 : ℝ) < (d : ℝ) + 1 := by positivity
  have hd' : (0 : ℝ) < (d : ℝ) + 2 := by positivity
  change 1 / ((A n w * (d + 2) * (d + 1) : ℕ) : ℝ) =
    (1 / (A n w : ℝ)) * width (d + 2)
  simp only [width, Nat.cast_mul, Nat.cast_add, Nat.cast_one, Nat.cast_ofNat]
  rw [show (d : ℝ) + 2 - 1 = (d : ℝ) + 1 by ring]
  field_simp

theorem center_snoc {n : ℕ} (w : Word n) (d : ℕ) :
    center (n + 1) (w, d) = center n w + lengthOf w / ((d : ℝ) + 2) := by
  simp only [center, Q, lengthOf, Nat.cast_mul, Nat.cast_add, Nat.cast_ofNat, div_div]

theorem cylinder_snoc {n : ℕ} (w : Word n) (d : ℕ) :
    cylinder (show Word (n + 1) from (w, d)) =
      Set.Ioc (center n w + lengthOf w / ((d : ℝ) + 2))
        (center n w + lengthOf w / ((d : ℝ) + 1)) := by
  unfold cylinder
  rw [center_snoc, length_snoc]
  have h := digitTop (d := d + 2) (by omega)
  push_cast at h
  rw [show (d : ℝ) + 2 - 1 = (d : ℝ) + 1 by ring] at h
  congr 1
  linear_combination lengthOf w * h

theorem cylinder_snoc_subset {n : ℕ} (w : Word n) (d : ℕ) :
    cylinder (show Word (n + 1) from (w, d)) ⊆ cylinder w := by
  rw [cylinder_snoc]
  apply Set.Ioc_subset_Ioc
  · exact le_add_of_nonneg_right (div_nonneg (length_pos w).le (by positivity))
  · exact add_le_add_right (div_le_self (length_pos w).le (by have := Nat.cast_nonneg (α := ℝ) d; linarith)) _

theorem cylinder_subset_unit {n : ℕ} (w : Word n) : cylinder w ⊆ Ioc (0 : ℝ) 1 := by
  induction n with
  | zero => simp [cylinder, center, lengthOf, A]
  | succ n ih => exact (cylinder_snoc_subset w.1 w.2).trans (ih w.1)

theorem cylinder_disjoint (n : ℕ) {u v : Word n} (hne : u ≠ v) :
    Disjoint (cylinder u) (cylinder v) := by
  induction n with
  | zero =>
      change (u : Unit) ≠ (v : Unit) at hne
      exact (hne (Subsingleton.elim (α := Unit) u v)).elim
  | succ n ih =>
      obtain ⟨u, a⟩ := u
      obtain ⟨v, b⟩ := v
      by_cases h : u = v
      · subst v
        have hab : a ≠ b := fun hab => hne (by rw [hab])
        rw [cylinder_snoc, cylinder_snoc, Set.disjoint_left]
        intro x hx hy
        obtain hlt | hlt := lt_or_gt_of_ne hab
        · have hcast : (a : ℝ) + 2 ≤ b + 1 := by exact_mod_cast (show a + 2 ≤ b + 1 by omega)
          have hh := div_le_div_of_nonneg_left (length_pos u).le (by positivity) hcast
          exact (not_lt_of_ge (hy.2.trans (by linarith))) hx.1
        · have hcast : (b : ℝ) + 2 ≤ a + 1 := by exact_mod_cast (show b + 2 ≤ a + 1 by omega)
          have hh := div_le_div_of_nonneg_left (length_pos u).le (by positivity) hcast
          exact (not_lt_of_ge (hx.2.trans (by linarith))) hy.1
      · exact (ih h).mono (cylinder_snoc_subset u a) (cylinder_snoc_subset v b)

/-- The word formed by the first `n` digits of the infinite string indexed from zero. -/
def wordOf (a : ℕ → ℕ) : (n : ℕ) → Word n
  | 0 => ()
  | n + 1 => (wordOf a n, a n)

theorem length_prefix (a : ℕ → ℕ) (n : ℕ) :
    lengthOf (wordOf a n) = ∏ i ∈ range n, width (a i + 2) := by
  induction n with
  | zero => simp [lengthOf, A]
  | succ n ih => rw [wordOf, length_snoc, ih, prod_range_succ]

theorem center_prefix (a : ℕ → ℕ) (n : ℕ) :
    center n (wordOf a n) = truncation (fun i => a i + 2) n := by
  induction n with
  | zero => simp [center, truncation]
  | succ n ih => rw [wordOf, center_snoc, ih, length_prefix, prefix_succ, Nat.cast_add, Nat.cast_ofNat]

theorem value_mem_cylinder (a : ℕ → ℕ) (n : ℕ) :
    value (fun i => a i + 2) ∈ cylinder (wordOf a n) := by
  have ht := value_mem (fun i => a (n + i) + 2) (fun i => by omega)
  have hl := length_pos (wordOf a n)
  have h := value_truncation (fun i => a i + 2) (fun i => by omega) n
  rw [← center_prefix, ← length_prefix] at h
  rw [h]
  exact ⟨lt_add_of_pos_right _ (mul_pos hl ht.1),
    add_le_add_right (mul_le_of_le_one_right hl.le ht.2) _⟩

theorem exists_digit_string {x : ℝ} (hx : x ∈ Ioc (0 : ℝ) 1) :
    ∃ a : ℕ → ℕ, value (fun i => a i + 2) = x := by
  have hm : x ∈ largeDigitSet 2 := largeDigitSet_two.symm ▸ hx
  obtain ⟨d, hd, heq⟩ := (GravgaardLeeUpperLower.mem_largeDigitSet (by decide)).mp hm
  let a (i : ℕ) := d i - 2
  have hh : (fun i => a i + 2) = d := funext fun i => by dsimp [a]; have := hd i; omega
  exact ⟨a, by rwa [hh]⟩

/-- Membership in the cylinder gives the actual prefix of any expansion of the point. -/
theorem prefix_eq_of_mem {n : ℕ} (a : ℕ → ℕ) (w : Word n)
    (h : value (fun i => a i + 2) ∈ cylinder w) : wordOf a n = w := by
  by_contra hne
  exact Set.disjoint_left.mp (cylinder_disjoint n hne) (value_mem_cylinder a n) h

def target (ψ : ℕ → ℝ) {n : ℕ} (w : Word (n + 1)) : Set ℝ :=
  cylinder w ∩ Ioo (center (n + 1) w) (center (n + 1) w + ψ (Q n w) / Q n w)

/-- The approximation set, indexed by arbitrarily late convergents. -/
def approxSet (ψ : ℕ → ℝ) : Set ℝ :=
  {x | ∀ N, ∃ n ≥ N, ∃ w : Word (n + 1), x ∈ target ψ w}

theorem approxSet_subset_unit (ψ : ℕ → ℝ) : approxSet ψ ⊆ Ioc (0 : ℝ) 1 := by
  intro x hx
  obtain ⟨_, _, w, hw⟩ := hx 0
  exact cylinder_subset_unit w hw.1

theorem prefix_Q_formula (a : ℕ → ℕ) (n : ℕ) :
    Q n (wordOf a (n + 1)) = (∏ i ∈ range n, (a i + 2) * (a i + 1)) * (a n + 2) := by
  have he (j : ℕ) : A j (wordOf a j) = ∏ i ∈ range j, (a i + 2) * (a i + 1) := by
    induction j with
    | zero => simp [A]
    | succ j ih =>
        change A j (wordOf a j) * (a j + 2) * (a j + 1) = _
        rw [prod_range_succ, ih, Nat.mul_assoc]
  rw [Q, wordOf, he]

/-- The cylinder definition uses the actual series convergents and their
literal unreduced denominators. The index `n` corresponds to convergent `n+1`. -/
theorem mem_approxSet_iff {ψ : ℕ → ℝ} {x : ℝ} :
    x ∈ approxSet ψ ↔ ∃ a : ℕ → ℕ, value (fun i => a i + 2) = x ∧
      ∀ N, ∃ n ≥ N,
        |x - truncation (fun i => a i + 2) (n + 1)| <
          ψ (Q n (wordOf a (n + 1))) / Q n (wordOf a (n + 1)) := by
  constructor
  · intro hx
    obtain ⟨a, rfl⟩ := exists_digit_string (approxSet_subset_unit ψ hx)
    refine ⟨a, rfl, fun N => ?_⟩
    obtain ⟨n, hn, w, hw⟩ := hx N
    rw [← prefix_eq_of_mem a w hw.1] at hw
    have hp := hw.2.1
    refine ⟨n, hn, ?_⟩
    rw [← center_prefix, abs_of_pos (sub_pos.mpr hp)]
    have hi := hw.2.2
    linarith
  · rintro ⟨a, rfl, h⟩ N
    obtain ⟨n, hn, hp⟩ := h N
    have hc := value_mem_cylinder a (n + 1)
    refine ⟨n, hn, wordOf a (n + 1), hc, hc.1, ?_⟩
    rw [← center_prefix, abs_of_pos (sub_pos.mpr hc.1)] at hp
    linarith

end
end RevisedTanZhou
