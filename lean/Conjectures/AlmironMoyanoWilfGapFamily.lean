import Conjectures.AlmironMoyanoWilf
import Mathlib.Order.Interval.Finset.Nat

/-! The threshold-two counterexample family for Almirón–Moyano-Fernández
Question 4.8, including the largest Wilf number among all gaps. -/

namespace AlmironMoyanoWilf

/-- Zero, the interval from m through 2m-2, and the tail from 2m. -/
def familyMember (m n : ℕ) : Prop :=
  n = 0 ∨ (m ≤ n ∧ n + 1 < 2 * m) ∨ 2 * m ≤ n

instance (m : ℕ) : DecidablePred (familyMember m) := fun n =>
  inferInstanceAs (Decidable (n = 0 ∨ (m ≤ n ∧ n + 1 < 2 * m) ∨ 2 * m ≤ n))

def gapFamily (m : ℕ) : AddSubmonoid ℕ where
  carrier := {n | familyMember m n}
  zero_mem' := Or.inl rfl
  add_mem' := by
    intro a b ha hb
    change familyMember m a at ha
    change familyMember m b at hb
    change familyMember m (a + b)
    unfold familyMember at *
    omega

theorem gapFamily_semigroup {m : ℕ} (hm : 5 ≤ m) :
    IsMultiplicity (gapFamily m) m ∧ IsConductor (familyMember m) (2 * m) ∧
    (∀ x ≤ 2 * m - 1, familyMember m x ↔ ¬familyMember m (2 * m - 1 - x)) := by
  refine ⟨⟨by omega, ?_, ?_⟩, isConductor_of_last_gap _ ?_ ?_, ?_⟩
  · change familyMember m m
    unfold familyMember
    omega
  · intro b hb hb'
    change familyMember m b at hb'
    unfold familyMember at hb'
    omega
  · exact fun _ hn => Or.inr (Or.inr hn)
  · unfold familyMember
    omega
  · intro x hx
    unfold familyMember
    omega

theorem gapFamily_leftCount {m : ℕ} (hm : 5 ≤ m) :
    leftCount (familyMember m) (2 * m) = m := by
  have hset : (Finset.range (2 * m)).filter (familyMember m) =
      insert 0 (Finset.Ico m (2 * m - 1)) := by
    ext n
    simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_insert, Finset.mem_Ico,
      familyMember]
    omega
  have h0 : 0 ∉ Finset.Ico m (2 * m - 1) := by simp [show ¬m ≤ 0 by omega]
  rw [leftCount, hset, Finset.card_insert_of_notMem h0, Nat.card_Ico]
  omega

theorem gapFamily_threshold {m : ℕ} (hm : 5 ≤ m) :
    IsLeast {k : ℕ | 2 * m ≤ k * leftCount (familyMember m) (2 * m)} 2 := by
  rw [gapFamily_leftCount hm]
  refine ⟨show 2 * m ≤ 2 * m from le_rfl, ?_⟩
  intro k hk
  change 2 * m ≤ k * m at hk
  exact Nat.le_of_mul_le_mul_right hk (by omega)

private theorem gapFamily_module_iff {m g n : ℕ} (hm : 5 ≤ m) (hg : ¬familyMember m g) :
    gapModule (familyMember m) g n ↔ n = 0 ∨ n = g ∨ m ≤ n := by
  unfold gapModule familyMember at *
  omega

/-- The exceptional gap m-1 shifts the conductor one place to the left. -/
theorem gapFamily_module_rows {m g : ℕ} (hm : 5 ≤ m) (hg : ¬familyMember m g) :
    let c := if g + 1 = m then m - 1 else m
    IsConductor (gapModule (familyMember m) g) c ∧
      leftCount (gapModule (familyMember m) g) c = (if g + 1 < m then 2 else 1) := by
  have hpos : 0 < g := by unfold familyMember at hg; omega
  dsimp only
  constructor
  · apply isConductor_of_last_gap
    · intro n hn
      rw [gapFamily_module_iff hm hg]
      split at hn <;> omega
    · rw [gapFamily_module_iff hm hg]
      split <;> omega
  · unfold leftCount
    by_cases h : g + 1 < m
    · have hg0 : (0 : ℕ) ≠ g := by omega
      have he : g + 1 ≠ m := by omega
      rw [ite_eq_right he, ite_eq_left h]
      have hset : (Finset.range m).filter (gapModule (familyMember m) g) = {0, g} := by
        ext n
        simp only [Finset.mem_filter, Finset.mem_range, gapFamily_module_iff hm hg,
          Finset.mem_insert, Finset.mem_singleton]
        omega
      rw [hset, Finset.card_pair hg0]
    · rw [ite_eq_right h]
      suffices hset : (Finset.range (if g + 1 = m then m - 1 else m)).filter
          (gapModule (familyMember m) g) = {0} by simp [hset]
      ext n
      simp only [Finset.mem_filter, Finset.mem_range, gapFamily_module_iff hm hg,
        Finset.mem_singleton]
      split <;> omega

/-- At every multiplicity m ≥ 5, the largest two-generator gap Wilf number
is exactly 4-m while the semigroup itself has threshold two. -/
theorem gapFamily_wilf_maximum {m : ℕ} (hm : 5 ≤ m) :
    IsGreatest {z : ℤ | ∃ g c : ℕ, ¬familyMember m g ∧
      IsConductor (gapModule (familyMember m) g) c ∧
      z = 2 * (leftCount (gapModule (familyMember m) g) c : ℤ) - c}
      (4 - (m : ℤ)) := by
  constructor
  · have hg : ¬familyMember m 1 := by unfold familyMember; omega
    have hrows := gapFamily_module_rows hm hg
    simp only [show 1 + 1 ≠ m by omega, ite_false, show 1 + 1 < m by omega, ite_true] at hrows
    refine ⟨1, m, hg, hrows.1, ?_⟩
    rw [hrows.2]
    omega
  · rintro z ⟨g, c, hg, hc, rfl⟩
    obtain ⟨hc', hd⟩ := gapFamily_module_rows hm hg
    have he := isConductor_unique hc hc'
    subst c
    rw [hd]
    split <;> split <;> omega

end AlmironMoyanoWilf
