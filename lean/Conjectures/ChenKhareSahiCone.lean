import Conjectures.ChenKhareSahiCovers
import Conjectures.ChenKhareSahiReal

namespace ChenKhareSahi

set_option maxHeartbeats 2000000 in
theorem one_cover_nonnegative (n : ℕ) (hn : 2 ≤ n ∧ n ≤ 6)
    (e : (ℕ × ℕ × ℕ) × (ℕ × ℕ × ℕ)) (p : ℕ × ℕ × ℕ)
    (he : e ∈ covers n) (hp : p ∈ partitions (6-n)) :
    0 ≤ realSep (fun x y z => realD e.1 e.2 x y z * realP p x y z) := by
  apply realGeneratorValues_nonnegative
  have hmin := hn.1
  have hmax := hn.2
  interval_cases n
  all_goals simp only [covers_exact.1, covers_exact.2.1, covers_exact.2.2.1,
    covers_exact.2.2.2.1, covers_exact.2.2.2.2, Nat.reduceSub, partitions,
    List.mem_cons, List.not_mem_nil, or_false] at he hp
  all_goals rcases he with rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals rcases hp with rfl | rfl | rfl | rfl
  all_goals simp [realGeneratorValues]


set_option maxHeartbeats 2000000 in
theorem two_cover_nonnegative (n m : ℕ) (hn : 2 ≤ n) (hm : 2 ≤ m) (hnm : n ≤ m) (h : n+m ≤ 6)
    (e f : (ℕ × ℕ × ℕ) × (ℕ × ℕ × ℕ)) (p : ℕ × ℕ × ℕ)
    (he : e ∈ covers n) (hf : f ∈ covers m) (hp : p ∈ partitions (6-n-m)) :
    0 ≤ realSep (fun x y z => realD e.1 e.2 x y z * realD f.1 f.2 x y z * realP p x y z) := by
  apply realGeneratorValues_nonnegative
  have hnu : n ≤ 6 := by omega
  have hmu : m ≤ 6 := by omega
  interval_cases n <;> interval_cases m
  all_goals try omega
  all_goals simp only [covers_exact.1, covers_exact.2.1, covers_exact.2.2.1,
    Nat.reduceSub, partitions,
    List.mem_cons, List.not_mem_nil, or_false] at he hf hp
  all_goals rcases he with rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals rcases hf with rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals rcases hp with rfl | rfl
  all_goals simp [realGeneratorValues, mul_comm, mul_left_comm]

theorem three_cover_nonnegative :
    0 ≤ realSep (fun x y z => (realD (2,0,0) (1,1,0) x y z)^3) := by
  apply realGeneratorValues_nonnegative
  simp [realGeneratorValues]


theorem six_monomial_nonnegative (p : ℕ × ℕ × ℕ) (hp : p ∈ partitions 6) :
    0 ≤ realSep (fun x y z => realP p x y z) := by
  simp only [partitions, List.mem_cons, List.not_mem_nil, or_false] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    norm_num [realSep, realP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]

theorem three_cover_nonnegative_general (n m k : ℕ) (hn : 2 ≤ n) (hm : 2 ≤ m) (hk : 2 ≤ k)
    (h : n+m+k ≤ 6) (e f g : (ℕ × ℕ × ℕ) × (ℕ × ℕ × ℕ))
    (he : e ∈ covers n) (hf : f ∈ covers m) (hg : g ∈ covers k) :
    0 ≤ realSep (fun x y z => realD e.1 e.2 x y z * realD f.1 f.2 x y z * realD g.1 g.2 x y z) := by
  have : n=2 ∧ m=2 ∧ k=2 := by omega
  obtain ⟨rfl,rfl,rfl⟩ := this
  simp only [covers_exact.1, List.mem_singleton] at he hf hg
  subst e
  subst f
  subst g
  simpa [pow_succ, pow_two, mul_assoc] using three_cover_nonnegative


theorem two_covers_any_order (n m : ℕ) (hn : 2 ≤ n) (hm : 2 ≤ m) (h : n+m ≤ 6)
    (e f : (ℕ × ℕ × ℕ) × (ℕ × ℕ × ℕ)) (p : ℕ × ℕ × ℕ)
    (he : e ∈ covers n) (hf : f ∈ covers m) (hp : p ∈ partitions (6-n-m)) :
    0 ≤ realSep (fun x y z => realD e.1 e.2 x y z * realD f.1 f.2 x y z * realP p x y z) := by
  by_cases hnm : n ≤ m
  · exact two_cover_nonnegative n m hn hm hnm h e f p he hf hp
  · have hmn : m ≤ n := by omega
    have hp' : p ∈ partitions (6-m-n) := by
      have heq : 6-m-n = 6-n-m := by omega
      rw [heq]
      exact hp
    have ht := two_cover_nonnegative m n hm hn hmn (by omega) f e p hf he hp'
    simpa [mul_comm, mul_left_comm, mul_assoc] using ht

theorem realSep_add (f g : ℝ → ℝ → ℝ → ℝ) :
    realSep (fun x y z => f x y z + g x y z) = realSep f + realSep g := by
  simp only [realSep]
  ring

theorem realSep_scale (a : ℝ) (f : ℝ → ℝ → ℝ → ℝ) :
    realSep (fun x y z => a * f x y z) = a * realSep f := by
  simp only [realSep]
  ring


inductive ReducedCone : (ℝ → ℝ → ℝ → ℝ) → Prop
  | monomial (p) : p ∈ partitions 6 →
      ReducedCone (fun x y z => realP p x y z)
  | one (n e p) : 2 ≤ n → n ≤ 6 → e ∈ covers n → p ∈ partitions (6-n) →
      ReducedCone (fun x y z => realD e.1 e.2 x y z * realP p x y z)
  | two (n m e f p) : 2 ≤ n → 2 ≤ m → n+m ≤ 6 → e ∈ covers n → f ∈ covers m →
      p ∈ partitions (6-n-m) →
      ReducedCone (fun x y z => realD e.1 e.2 x y z * realD f.1 f.2 x y z * realP p x y z)
  | three (n m k e f g) : 2 ≤ n → 2 ≤ m → 2 ≤ k → n+m+k ≤ 6 →
      e ∈ covers n → f ∈ covers m → g ∈ covers k →
      ReducedCone (fun x y z => realD e.1 e.2 x y z * realD f.1 f.2 x y z * realD g.1 g.2 x y z)
  | add {f g} : ReducedCone f → ReducedCone g → ReducedCone (fun x y z => f x y z + g x y z)
  | scale (a : ℝ) {f} : 0 ≤ a → ReducedCone f → ReducedCone (fun x y z => a * f x y z)

theorem ReducedCone.separator_nonnegative {f : ℝ → ℝ → ℝ → ℝ} (hf : ReducedCone f) : 0 ≤ realSep f := by
  induction hf with
  | monomial p hp => exact six_monomial_nonnegative p hp
  | one n e p hn hmax he hp => exact one_cover_nonnegative n ⟨hn,hmax⟩ e p he hp
  | two n m e f p hn hm h he hf hp => exact two_covers_any_order n m hn hm h e f p he hf hp
  | three n m k e f g hn hm hk h he hf hg =>
    exact three_cover_nonnegative_general n m k hn hm hk h e f g he hf hg
  | add f g ihf ihg => rw [realSep_add]; exact add_nonneg ihf ihg
  | scale a ha f ih => rw [realSep_scale]; exact mul_nonneg ha ih


theorem reduced_cone_excludes_counterexample :
    ¬ ReducedCone (fun x y z => realP420 x y z / realP420 1 1 1 - realP411 x y z / realP411 1 1 1) := by
  intro h
  have hp := h.separator_nonnegative
  have hn := real_separation_negative
  exact (not_lt_of_ge hp) hn

end ChenKhareSahi
