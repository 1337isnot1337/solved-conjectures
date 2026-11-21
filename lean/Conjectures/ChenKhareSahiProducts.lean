import Conjectures.ChenKhareSahiCovers
import Conjectures.ChenKhareSahiReal
import Mathlib.Tactic.Positivity

namespace ChenKhareSahi

abbrev Part := ℕ × ℕ × ℕ

noncomputable def realMP (a : Part) (x y z : ℝ) : ℝ := realM a.1 a.2.1 a.2.2 x y z

def addPart (a b : Part) : Part := (a.1+b.1, a.2.1+b.2.1, a.2.2+b.2.2)

noncomputable def realCoeff (a b c : Part) : ℝ :=
  ((∑ e ∈ orbit a.1 a.2.1 a.2.2, ∑ f ∈ orbit b.1 b.2.1 b.2.2,
      if addPart e f = c then (1 : ℝ) else 0) * (orbit c.1 c.2.1 c.2.2).card) /
      ((orbit a.1 a.2.1 a.2.2).card * (orbit b.1 b.2.1 b.2.2).card)

theorem realCoeff_nonnegative (a b c : Part) : 0 ≤ realCoeff a b c := by
  unfold realCoeff
  positivity

set_option maxHeartbeats 5000000 in
set_option maxRecDepth 4096 in
theorem product_decomposition (n m : ℕ) (h : n+m ≤ 6) (a b : Part)
    (ha : a ∈ partitions n) (hb : b ∈ partitions m) (x y z : ℝ) :
    realMP a x y z * realMP b x y z =
      ((partitions (n+m)).map (fun c => realCoeff a b c * realMP c x y z)).sum := by
  have hn : n ≤ 6 := by omega
  have hm : m ≤ 6 := by omega
  interval_cases n <;> interval_cases m
  all_goals try omega
  all_goals simp only [partitions, List.mem_cons, List.not_mem_nil, or_false] at ha hb
  all_goals rcases ha with rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals rcases hb with rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals norm_num [realMP, realM, realCoeff, addPart, partitions, orbit, Finset.sum_insert, Finset.sum_singleton, Finset.filter_insert, Finset.filter_singleton] <;> ring

end ChenKhareSahi
