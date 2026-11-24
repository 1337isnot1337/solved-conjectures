import Mathlib.Algebra.Group.Submonoid.Defs
import Mathlib.Algebra.Group.Nat.Defs
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Range
import Mathlib.Order.Bounds.Defs
import Lean.Elab.Tactic.Omega

/-!
# Almirón–Moyano-Fernández, Question 4.8

The numerical semigroup `{0} ∪ [5,8] ∪ [10,∞)` has Wilf threshold two,
but no gap has a nonnegative two-generator module Wilf number. The second
part checks the normalized all-module threshold and the characterization at
the minimal generator count in Question 4.13.
-/

namespace AlmironMoyanoWilf

/-- `c` is the least starting point of a full tail. -/
def IsConductor (P : ℕ → Prop) (c : ℕ) : Prop :=
  (∀ n, c ≤ n → P n) ∧ ∀ k, k < c → ∃ n, k ≤ n ∧ ¬ P n

/-- The elements strictly below a proposed conductor. -/
def leftCount (P : ℕ → Prop) [DecidablePred P] (c : ℕ) : ℕ :=
  ((Finset.range c).filter P).card

/-- The normalized gap module `S ∪ (g + S)`. -/
def gapModule (P : ℕ → Prop) (g n : ℕ) : Prop :=
  P n ∨ (g ≤ n ∧ P (n - g))

instance (P : ℕ → Prop) [DecidablePred P] (g : ℕ) :
    DecidablePred (gapModule P g) :=
  fun n => inferInstanceAs (Decidable (P n ∨ (g ≤ n ∧ P (n - g))))

theorem gapModule_iff (P : ℕ → Prop) (g n : ℕ) :
    gapModule P g n ↔ P n ∨ ∃ s, P s ∧ n = g + s := by
  constructor
  · rintro (h | ⟨h, hs⟩)
    · exact Or.inl h
    · exact Or.inr ⟨n - g, hs, by omega⟩
  · rintro (h | ⟨s, hs, rfl⟩)
    · exact Or.inl h
    · exact Or.inr ⟨by omega, by rwa [Nat.add_sub_cancel_left]⟩

/-- Numerical semigroup witness, as an actual additive submonoid. -/
def witnessPred (n : ℕ) : Prop :=
  n = 0 ∨ (5 ≤ n ∧ n ≤ 8) ∨ 10 ≤ n

instance : DecidablePred witnessPred := fun n =>
  inferInstanceAs (Decidable (n = 0 ∨ (5 ≤ n ∧ n ≤ 8) ∨ 10 ≤ n))

def witness : AddSubmonoid ℕ where
  carrier := {n | witnessPred n}
  zero_mem' := Or.inl rfl
  add_mem' := by
    intro a b ha hb
    change witnessPred (a + b)
    change witnessPred a at ha
    change witnessPred b at hb
    unfold witnessPred at *
    omega

theorem isConductor_unique {P : ℕ → Prop} {c d : ℕ}
    (hc : IsConductor P c) (hd : IsConductor P d) : c = d := by
  rcases Nat.lt_trichotomy c d with h | h | h
  · obtain ⟨n, hn, hnot⟩ := hd.2 c h
    exact (hnot (hc.1 n hn)).elim
  · exact h
  · obtain ⟨n, hn, hnot⟩ := hc.2 d h
    exact (hnot (hd.1 n hn)).elim

theorem isConductor_of_last_gap {P : ℕ → Prop} (c : ℕ)
    (htail : ∀ n, c ≤ n → P n) (hgap : ¬ P (c - 1)) :
    IsConductor P c := by
  exact ⟨htail, fun k hk => ⟨c - 1, by omega, hgap⟩⟩

theorem witness_conductor : IsConductor witnessPred 10 :=
  isConductor_of_last_gap 10 (fun _ h => Or.inr (Or.inr h)) (by decide)

theorem witness_leftCount : leftCount witnessPred 10 = 5 := by decide

/-- The least natural `k` such that `W_S(k) ≥ 0` is 2. -/
theorem witness_wilf_threshold : IsLeast {k : ℕ | 10 ≤ k * leftCount witnessPred 10} 2 := by
  rw [witness_leftCount]
  refine ⟨by decide, ?_⟩
  intro k hk
  change 10 ≤ k * 5 at hk
  omega

theorem module_rows (g : ℕ) (hg : ¬ witnessPred g) :
    ∃ c, IsConductor (gapModule witnessPred g) c ∧
        2 * leftCount (gapModule witnessPred g) c < c := by
  have ht (n : ℕ) (hn : 10 ≤ n) : gapModule witnessPred g n :=
    Or.inl (Or.inr (Or.inr hn))
  have casesG : g = 1 ∨ g = 2 ∨ g = 3 ∨ g = 4 ∨ g = 9 := by
    unfold witnessPred at hg
    omega
  have table (g c : ℕ) (htail : ∀ n, 10 ≤ n → gapModule witnessPred g n)
      (hsmall : ∀ n, c ≤ n → n < 10 → gapModule witnessPred g n)
      (hgap : ¬ gapModule witnessPred g (c - 1))
      (hneg : 2 * leftCount (gapModule witnessPred g) c < c) :
      ∃ c, IsConductor (gapModule witnessPred g) c ∧
        2 * leftCount (gapModule witnessPred g) c < c := by
    refine ⟨c, isConductor_of_last_gap c ?_ hgap, hneg⟩
    intro n hn
    by_cases hh : 10 ≤ n
    · exact htail n hh
    · exact hsmall n hn (by omega)
  rcases casesG with rfl | rfl | rfl | rfl | rfl
  · exact table 1 5 ht (by unfold gapModule witnessPred; omega) (by decide) (by decide)
  · exact table 2 5 ht (by unfold gapModule witnessPred; omega) (by decide) (by decide)
  · exact table 3 5 ht (by unfold gapModule witnessPred; omega) (by decide) (by decide)
  · exact table 4 4 ht (by unfold gapModule witnessPred; omega) (by decide) (by decide)
  · exact table 9 5 ht (by unfold gapModule witnessPred; omega) (by decide) (by decide)

/-- Literal counterexample to the universal small-threshold gap assertion.
The conductor witness certifies that the additive submonoid has finite complement. -/
theorem question_4_8_false :
    ¬ (∀ (S : AddSubmonoid ℕ) [DecidablePred (fun n => n ∈ S)]
        (c μ : ℕ),
        IsConductor (fun n => n ∈ S) c →
        IsLeast {k : ℕ | c ≤ k * leftCount (fun n => n ∈ S) c} μ →
        μ ≤ 4 →
        ∃ g, g ∉ S ∧ ∃ b, IsConductor (gapModule (fun n => n ∈ S) g) b ∧
          b ≤ 2 * leftCount (gapModule (fun n => n ∈ S) g) b) := by
  intro h
  obtain ⟨g, hg, b, hb, hw⟩ :=
    @h witness (inferInstanceAs (DecidablePred witnessPred)) 10 2
      witness_conductor witness_wilf_threshold (by decide)
  obtain ⟨c, hc, hneg⟩ := module_rows g hg
  have heq := isConductor_unique hb hc
  subst b
  exact (Nat.not_le_of_lt hneg) hw

/-- A normalized semimodule contains zero and is closed under addition by `S`. -/
def IsNormalizedModule (S : AddSubmonoid ℕ) (P : ℕ → Prop) : Prop :=
  P 0 ∧ ∀ a b, P a → b ∈ S → P (a + b)

theorem conductor_exists_of_tail {P : ℕ → Prop} {c : ℕ}
    (hc : ∀ n, c ≤ n → P n) : ∃ d, IsConductor P d := by
  classical
  induction c using Nat.strongRecOn with
  | ind c ih =>
    by_cases h : IsConductor P c
    · exact ⟨c, h⟩
    · unfold IsConductor at h
      have hs : ¬ (∀ k, k < c → ∃ n, k ≤ n ∧ ¬ P n) :=
        fun hh => h ⟨hc, hh⟩
      obtain ⟨k, hk⟩ := Classical.not_forall.mp hs
      have hklt : k < c := by
        refine Classical.byContradiction fun hnot => ?_
        exact hk fun hh => (hnot hh).elim
      refine ih k hklt fun n hn => ?_
      refine Classical.byContradiction fun hnot => ?_
      exact hk fun _ => ⟨n, hn, hnot⟩

theorem normalizedModule_conductor {S : AddSubmonoid ℕ} {P : ℕ → Prop}
    {c : ℕ} (hc : IsConductor (fun n => n ∈ S) c)
    (hP : IsNormalizedModule S P) : ∃ d, IsConductor P d := by
  apply conductor_exists_of_tail (c := c)
  intro n hn
  simpa using hP.2 0 n hP.1 (hc.1 n hn)

/-- Multiplicity is the least positive member of the numerical semigroup. -/
def IsMultiplicity (S : AddSubmonoid ℕ) (m : ℕ) : Prop :=
  0 < m ∧ m ∈ S ∧ ∀ b, 0 < b → b ∈ S → m ≤ b

theorem multiple_mem {S : AddSubmonoid ℕ} {m : ℕ} (hm : m ∈ S) (i : ℕ) :
    i * m ∈ S := by
  induction i with
  | zero => simp
  | succ i ih => rw [Nat.succ_mul]; exact S.add_mem ih hm

/-- The multiples of `m` give the lower bound on the left count. -/
theorem wilf_nonneg_at_multiplicity {S : AddSubmonoid ℕ} {P : ℕ → Prop}
    [DecidablePred P] {m c : ℕ} (hm : IsMultiplicity S m)
    (hP : IsNormalizedModule S P) : c ≤ m * leftCount P c := by
  rcases Nat.eq_zero_or_pos c with rfl | hc
  · exact Nat.zero_le _
  let q := (c - 1) / m + 1
  have hcard : q ≤ leftCount P c := by
    rw [← Finset.card_range q]
    unfold leftCount
    refine Finset.card_le_card_of_injOn (fun i : ℕ => i * m) ?_ ?_
    · intro i hi
      change i ∈ Finset.range q at hi
      change i * m ∈ (Finset.range c).filter P
      refine Finset.mem_filter.mpr ⟨Finset.mem_range.mpr ?_, ?_⟩
      · have hle : i ≤ (c - 1) / m := Nat.lt_succ_iff.mp (Finset.mem_range.mp hi)
        have hcalc := (Nat.mul_le_mul_right m hle).trans (Nat.div_mul_le_self (c - 1) m)
        omega
      · have := hP.2 0 (i * m) hP.1 (multiple_mem hm.2.1 i)
        simpa using this
    · intro a _ b _ h
      exact Nat.eq_of_mul_eq_mul_right hm.1 h
  have hceil : c ≤ m * q := by
    have hh := Nat.lt_mul_div_succ (c - 1) hm.1
    change c ≤ m * ((c - 1) / m + 1)
    omega
  exact hceil.trans (Nat.mul_le_mul_left m hcard)

private def thresholdModule (m n : ℕ) : Prop := n = 0 ∨ m ≤ n

private instance (m : ℕ) : DecidablePred (thresholdModule m) :=
  fun n => inferInstanceAs (Decidable (n = 0 ∨ m ≤ n))

private theorem thresholdModule_isModule {S : AddSubmonoid ℕ} {m : ℕ}
    (hm : IsMultiplicity S m) : IsNormalizedModule S (thresholdModule m) := by
  refine ⟨Or.inl rfl, ?_⟩
  intro a b ha hb
  rcases ha with ha | ha
  · rcases Nat.eq_zero_or_pos b with rfl | hp
    · exact Or.inl (by omega)
    · exact Or.inr (by have := hm.2.2 _ hp hb; omega)
  · exact Or.inr (by omega)

private theorem thresholdModule_leftCount {m : ℕ} (hm : 1 < m) :
    leftCount (thresholdModule m) m = 1 := by
  unfold leftCount
  have heq : (Finset.range m).filter (thresholdModule m) = {0} := by
    ext n
    simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_singleton, thresholdModule]
    omega
  rw [heq, Finset.card_singleton]

/-- Exact uniform threshold for all normalized modules, over positive integers.
Each module is presented with its conductor. For a numerical semigroup such a
conductor exists, since a normalized module contains the whole semigroup. -/
theorem question_4_13_uniform_threshold {S : AddSubmonoid ℕ} {m : ℕ}
    (hm : IsMultiplicity S m) :
    IsLeast {k : ℕ | 0 < k ∧
      ∀ (P : ℕ → Prop) [DecidablePred P] (c : ℕ),
        IsNormalizedModule S P → IsConductor P c → c ≤ k * leftCount P c} m := by
  refine ⟨⟨hm.1, fun _ _ _ hP _ => wilf_nonneg_at_multiplicity hm hP⟩, ?_⟩
  intro k hk
  change (0 < k ∧ ∀ (P : ℕ → Prop) [DecidablePred P] (c : ℕ),
      IsNormalizedModule S P → IsConductor P c → c ≤ k * leftCount P c) at hk
  by_cases h : 1 < m
  · have hcond : IsConductor (thresholdModule m) m := by
      exact isConductor_of_last_gap (P := thresholdModule m) m
        (fun _ hn => Or.inr hn) (by change ¬ (m - 1 = 0 ∨ m ≤ m - 1); omega)
    have hp := hk.2 (thresholdModule m) m (thresholdModule_isModule hm) hcond
    simpa only [thresholdModule_leftCount h, Nat.mul_one] using hp
  · omega

/-- Every member of a normalized module is a generator plus an element of `S`. -/
def Generates (S : AddSubmonoid ℕ) (P : ℕ → Prop) (A : Finset ℕ) : Prop :=
  ∀ n, P n ↔ ∃ a ∈ A, ∃ b ∈ S, n = a + b

/-- The generator count includes zero. -/
def IsMinimalGenerating (S : AddSubmonoid ℕ) (P : ℕ → Prop) (A : Finset ℕ) : Prop :=
  Generates S P A ∧ ∀ B, Generates S P B → A.card ≤ B.card

private theorem semigroup_minimal_generating (S : AddSubmonoid ℕ) :
    IsMinimalGenerating S (fun n => n ∈ S) {0} := by
  constructor
  · intro n
    constructor
    · intro hn
      exact ⟨0, Finset.mem_singleton_self 0, n, hn, (Nat.zero_add n).symm⟩
    · rintro ⟨a, ha, b, hb, rfl⟩
      have hz : a = 0 := Finset.mem_singleton.mp ha
      simpa [hz] using hb
  · intro B hB
    obtain ⟨a, ha, _, _, _⟩ := (hB 0).mp S.zero_mem
    rw [Finset.card_singleton]
    exact Finset.card_pos.mpr ⟨a, ha⟩

/-- Every normalized module is Wilf-nonnegative at its own minimal generator
count exactly when the original semigroup is all of `ℕ`. This is Q4.13(6)
with the stated normalized-module, full generator-count convention. -/
theorem question_4_13_at_generator_count {S : AddSubmonoid ℕ} {s : ℕ}
    [DecidablePred (fun n => n ∈ S)] (hs : IsConductor (fun n => n ∈ S) s) :
    (∀ (P : ℕ → Prop) [DecidablePred P] (c : ℕ) (A : Finset ℕ),
      IsNormalizedModule S P → IsConductor P c → IsMinimalGenerating S P A →
      c ≤ A.card * leftCount P c) ↔ ∀ n, n ∈ S := by
  constructor
  · intro h n
    have hS : IsNormalizedModule S (fun n => n ∈ S) :=
      ⟨S.zero_mem, fun _ _ ha hb => S.add_mem ha hb⟩
    have hcard := h (fun n => n ∈ S) s {0} hS hs (semigroup_minimal_generating S)
    rw [Finset.card_singleton, Nat.one_mul] at hcard
    have heq : (Finset.range s).filter (fun n => n ∈ S) = Finset.range s := by
      apply Finset.eq_of_subset_of_card_le (Finset.filter_subset _ _)
      rw [Finset.card_range]
      exact hcard
    by_cases hn : n < s
    · have hmem : n ∈ (Finset.range s).filter (fun n => n ∈ S) := by
        rw [heq]
        exact Finset.mem_range.mpr hn
      exact (Finset.mem_filter.mp hmem).2
    · exact hs.1 n (by omega)
  · intro h P _ c A hP hc _
    have hall (n : ℕ) : P n := by simpa using hP.2 0 n hP.1 (h n)
    have hzero : IsConductor P 0 :=
      ⟨fun n _ => hall n, fun k hk => (Nat.not_lt_zero k hk).elim⟩
    have hz := isConductor_unique hc hzero
    subst c
    exact Nat.zero_le _

end AlmironMoyanoWilf
