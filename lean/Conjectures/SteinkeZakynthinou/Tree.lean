module

public import Conjectures.SteinkeZakynthinou.Branch
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Data.Fintype.Sum

/-!
A binary tree carrying the exact leaf law for the shifted threshold learner.
Local increases in the minimum telescope in expectation.
-/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

inductive Tree where
  | leaf : ℕ → Tree
  | fork : Tree → Tree → Tree

namespace Tree

/-- A leaf addressed by its path in the tree. -/
abbrev Path : Tree → Type
  | .leaf _ => Unit
  | .fork l r => Sum l.Path r.Path

instance pathFintype : (t : Tree) → Fintype t.Path
  | .leaf _ => inferInstanceAs (Fintype Unit)
  | .fork l r =>
    letI := pathFintype l
    letI := pathFintype r
    inferInstanceAs (Fintype (Sum l.Path r.Path))

def position : (t : Tree) → t.Path → ℕ
  | .leaf i, _ => i
  | .fork l _, .inl p => l.position p
  | .fork _ r, .inr p => r.position p

noncomputable def minimum (cost : ℕ → ℝ) : Tree → ℝ
  | .leaf i => cost i
  | .fork l r => min (l.minimum cost) (r.minimum cost)

theorem minimum_le (t : Tree) (cost : ℕ → ℝ) (p : t.Path) :
    t.minimum cost ≤ cost (t.position p) := by
  induction t with
  | leaf => exact le_rfl
  | fork l r il ir =>
    change Sum l.Path r.Path at p
    cases p with
    | inl p => exact (min_le_left _ _).trans (il p)
    | inr p => exact (min_le_right _ _).trans (ir p)

theorem exists_minimum (t : Tree) (cost : ℕ → ℝ) :
    ∃ p : t.Path, cost (t.position p) = t.minimum cost := by
  induction t with
  | leaf => exact ⟨(), rfl⟩
  | fork l r il ir =>
    rcases il with ⟨p, hp⟩
    rcases ir with ⟨q, hq⟩
    by_cases h : l.minimum cost ≤ r.minimum cost
    · exact ⟨Sum.inl p, hp.trans (min_eq_left h).symm⟩
    · exact ⟨Sum.inr q, hq.trans (min_eq_right (le_of_not_ge h)).symm⟩

theorem abs_minimum_sub_le (t : Tree) {c d : ℕ → ℝ} {e : ℝ}
    (h : ∀ p : t.Path, |c (t.position p) - d (t.position p)| ≤ e) :
    |t.minimum c - t.minimum d| ≤ e := by
  obtain ⟨p, hp⟩ := t.exists_minimum c
  obtain ⟨q, hq⟩ := t.exists_minimum d
  exact abs_le.mpr ⟨by linarith [t.minimum_le d p, (abs_le.mp (h p)).1],
    by linarith [t.minimum_le c q, (abs_le.mp (h q)).2]⟩

noncomputable def probability (cost : ℕ → ℝ) (scale : ℕ → ℝ) :
    (t : Tree) → ℕ → t.Path → ℝ
  | .leaf _, _, _ => 1
  | .fork l r, j, .inl p =>
    choice ((l.minimum cost - r.minimum cost) / scale j) * l.probability cost scale (j + 1) p
  | .fork l r, j, .inr p =>
    choice ((r.minimum cost - l.minimum cost) / scale j) * r.probability cost scale (j + 1) p

theorem probability_pos (t : Tree) (cost scale : ℕ → ℝ) (j : ℕ) (p : t.Path) :
    0 < t.probability cost scale j p := by
  induction t generalizing j with
  | leaf => exact zero_lt_one
  | fork l r il ir =>
    change Sum l.Path r.Path at p
    cases p with
    | inl p => exact mul_pos (choice_pos _) (il _ p)
    | inr p => exact mul_pos (choice_pos _) (ir _ p)

theorem sum_probability (t : Tree) (cost scale : ℕ → ℝ) (j : ℕ) :
    ∑ p : t.Path, t.probability cost scale j p = 1 := by
  induction t generalizing j with
  | leaf => simp [probability]
  | fork l r il ir =>
    change (∑ p : Sum l.Path r.Path, (Tree.fork l r).probability cost scale j p) = 1
    rw [Fintype.sum_sum_type]
    simp only [probability, ← Finset.mul_sum, il, ir, mul_one]
    rw [← neg_sub (l.minimum cost) (r.minimum cost), neg_div]
    exact choice_add_neg _

theorem expected_cost_le (t : Tree) (cost scale budget : ℕ → ℝ)
    (hs : ∀ j, 0 < scale j) (hb : ∀ j, 0 ≤ budget j)
    (hstep : ∀ j, scale j / 2 + budget (j + 1) ≤ budget j) (j : ℕ) :
    (∑ p : t.Path, t.probability cost scale j p * cost (t.position p)) ≤
      t.minimum cost + budget j := by
  induction t generalizing j with
  | leaf i => simpa [pathFintype, probability, minimum, position] using hb j
  | fork l r il ir =>
    let x := l.minimum cost
    let y := r.minimum cost
    let p := choice ((x - y) / scale j)
    let q := choice ((y - x) / scale j)
    have hp : 0 < p := choice_pos _
    have hq : 0 < q := choice_pos _
    have hpq : p + q = 1 := by
      change choice ((x - y) / scale j) + choice ((y - x) / scale j) = 1
      rw [← neg_sub x y, neg_div]
      exact choice_add_neg _
    have hlocal := choice_mul_excess_le (x := x) (y := y) (hs j)
    change p * (x - min x y) + q * (y - min x y) ≤ scale j / 2 at hlocal
    change (∑ p : Sum l.Path r.Path,
      (Tree.fork l r).probability cost scale j p * cost ((Tree.fork l r).position p)) ≤
        min x y + budget j
    rw [Fintype.sum_sum_type]
    simp only [probability, position, mul_assoc, ← Finset.mul_sum]
    change p * (∑ a : l.Path, l.probability cost scale (j + 1) a * cost (l.position a)) +
      q * (∑ a : r.Path, r.probability cost scale (j + 1) a * cost (r.position a)) ≤ _
    calc
      _ ≤ p * (x + budget (j + 1)) + q * (y + budget (j + 1)) :=
        add_le_add (mul_le_mul_of_nonneg_left (il _) hp.le)
          (mul_le_mul_of_nonneg_left (ir _) hq.le)
      _ = p * (x - min x y) + q * (y - min x y) + min x y + budget (j + 1) := by
        calc
          _ = p * (x - min x y) + q * (y - min x y) +
              (p + q) * (min x y + budget (j + 1)) := by ring
          _ = _ := by rw [hpq, one_mul]; ring
      _ ≤ _ := by linarith [hstep j]

/-- The successive log probabilities telescope to the log of leaf mass. -/
noncomputable def logCharges (cost other scale : ℕ → ℝ) :
    (t : Tree) → ℕ → t.Path → List ℝ
  | .leaf _, _, _ => []
  | .fork l r, j, .inl p =>
    (Real.log (choice ((l.minimum cost - r.minimum cost) / scale j)) -
      Real.log (choice ((l.minimum other - r.minimum other) / scale j))) ::
      l.logCharges cost other scale (j + 1) p
  | .fork l r, j, .inr p =>
    (Real.log (choice ((r.minimum cost - l.minimum cost) / scale j)) -
      Real.log (choice ((r.minimum other - l.minimum other) / scale j))) ::
      r.logCharges cost other scale (j + 1) p

theorem sum_logCharges (t : Tree) (cost other scale : ℕ → ℝ) (j : ℕ) (p : t.Path) :
    (t.logCharges cost other scale j p).sum =
      Real.log (t.probability cost scale j p) - Real.log (t.probability other scale j p) := by
  induction t generalizing j with
  | leaf => simp [logCharges, probability]
  | fork l r il ir =>
    change Sum l.Path r.Path at p
    cases p with
    | inl p =>
      simp only [logCharges, probability, List.sum_cons, il,
        Real.log_mul (choice_pos _).ne' (probability_pos _ _ _ _ _).ne']
      ring
    | inr p =>
      simp only [logCharges, probability, List.sum_cons, ir,
        Real.log_mul (choice_pos _).ne' (probability_pos _ _ _ _ _).ne']
      ring

end Tree
end SteinkeZakynthinou
