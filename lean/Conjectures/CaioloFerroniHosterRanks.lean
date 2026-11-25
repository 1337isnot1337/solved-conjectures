import Conjectures.CaioloFerroniHosterRankWitness
import Conjectures.CaioloFerroniHosterRankBridge

/-!
# Dual Chow real-rootedness holds exactly in ranks at most four

Caiolo-Ferroni-Hoster Conjecture 7.3 (arXiv:2605.28474v1), rank by rank. The rank-five
counterexample is due to Cinna Davis (github.com/1337isnot1337/solved-conjectures); the
coalescence method is due to Berczi-Coron-Eur-Li (arXiv:2610.17135).
-/

set_option linter.unusedSectionVars false
set_option linter.unusedSimpArgs false

namespace CaioloFerroniHoster.Ranks

open Polynomial
open scoped Classical

noncomputable section

open FlatSystem (Good)

theorem FlatSystem.Good.lt {n : ℕ} : ∀ {s : List ℕ}, Good n s → ∀ r ∈ s, r < n
  | [], _, r, h => by simp at h
  | m :: t, ⟨h1, _, h3⟩, r, h => by
    rcases List.mem_cons.1 h with rfl | h
    · exact h1
    · exact (FlatSystem.Good.lt h3 r h).trans h1

theorem good_full : ∀ n, Good (n + 1) (full n)
  | 0 => trivial
  | n + 1 => ⟨by omega, by omega, good_full n⟩

theorem good_special : ∀ n, Good (n + 4) (special n)
  | 0 => ⟨by omega, by omega, trivial⟩
  | n + 1 => ⟨by omega, by omega, good_special n⟩

/-- Single deletions. -/
def del : List ℕ → List (List ℕ)
  | [] => []
  | m :: t => t :: (del t).map (m :: ·)

theorem del_good {n : ℕ} : ∀ {t : List ℕ}, Good n t → ∀ s ∈ del t, Good n s ∧ s.length + 1 = t.length
  | [], _, s, h => by simp [del] at h
  | m :: t, ⟨h1, h2, h3⟩, s, h => by
    simp only [del, List.mem_cons, List.mem_map] at h
    rcases h with rfl | ⟨u, hu, rfl⟩
    · exact ⟨h3.mono h1.le, by simp⟩
    · obtain ⟨a, b⟩ := del_good h3 u hu
      exact ⟨⟨h1, h2, a⟩, by simp [b]⟩

theorem stab_form : ∀ m, ∀ p ∈ stab m, Good (m + 1) p.1 ∧ p.1.length + p.2 = m ∧
    (0 < m → ∃ s, p.1 = m :: s ∧ Good m s)
  | 0, p, h => by simp [stab] at h; subst h; simp [Good]
  | 1, p, h => by simp [stab] at h; subst h; simp [Good]
  | m + 2, p, h => by
    simp only [stab, List.mem_append, List.mem_map] at h
    rcases h with ⟨a, ha, rfl⟩ | ⟨a, ha, rfl⟩
    · obtain ⟨h1, h2, _⟩ := stab_form (m + 1) a ha
      exact ⟨⟨by omega, by omega, h1⟩, by simp only [List.length_cons]; omega, fun _ => ⟨_, rfl, h1⟩⟩
    · obtain ⟨h1, h2, _⟩ := stab_form m a ha
      have h1' : Good (m + 2) a.1 := h1.mono (by omega)
      exact ⟨⟨by omega, by omega, h1'⟩, by simp only [List.length_cons]; omega, fun _ => ⟨_, rfl, h1'⟩⟩

theorem special_mem : ∀ n, ((n + 4) :: special n, 2) ∈ stab (n + 4)
  | 0 => by simp [stab, special]
  | n + 1 => by
    rw [show n + 1 + 4 = (n + 3) + 2 by omega, stab, List.mem_append, List.mem_map]
    exact Or.inl ⟨_, special_mem n, rfl⟩

theorem sum_stab_zero (b : List ℕ → ℝ) : ∀ m,
    ((stab m).map fun p => if p.2 = 0 then b p.1 else 0).sum = b (full m)
  | 0 => by simp [stab, full]
  | 1 => by simp [stab, full]
  | m + 2 => by
    have h := sum_stab_zero (fun t => b ((m + 2) :: t)) (m + 1)
    simp only [stab, List.map_append, List.sum_append, List.map_map, Function.comp_def] at h ⊢
    rw [h]
    simp [full]

theorem gam_coeff (l : List (ℝ × ℕ)) (i : ℕ) :
    (gam l).coeff i = (l.map fun p => if p.2 = i then p.1 else 0).sum := by
  induction l with
  | nil => simp [gam]
  | cons p l ih =>
    simp only [gam, List.map_cons, List.sum_cons, coeff_add] at ih ⊢
    rw [ih, coeff_C_mul_X_pow]
    simp [eq_comm]

section Ineq

variable {E : Type} [Finite E] (M : Matroid E)

theorem beta_le_alpha : ∀ (t : List ℕ) (x : Flats M), Good (flatRk M x) t →
    beta (flatRk M) x t ≤ alpha (flatRk M) x t
  | [], x, _ => by simp [beta, alpha]
  | m :: t, x, ⟨h1, h2, h3⟩ => by
    rw [beta, alpha]
    have h := matroid_beta_nonneg M (F := x) (h3.mono h1.le)
    have : ∑ y ∈ layer (flatRk M) x m, beta (flatRk M) y t ≤
        ∑ y ∈ layer (flatRk M) x m, alpha (flatRk M) y t :=
      Finset.sum_le_sum fun y hy => beta_le_alpha t y (by rw [(mem_layer.1 hy).2]; exact h3)
    linarith

theorem sum_list_comm (x : Flats M) (m : ℕ) (l : List (List ℕ)) :
    ∑ y ∈ layer (flatRk M) x m, (l.map (alpha (flatRk M) y)).sum =
      (l.map fun s => alpha (flatRk M) x (m :: s)).sum := by
  induction l with
  | nil => simp
  | cons a l ih => simp [Finset.sum_add_distrib, ih, alpha]

/-- Bonferroni: flags with rank set `t` are few more than flag h-number plus deletions. -/
theorem bonferroni : ∀ (t : List ℕ) (x : Flats M), Good (flatRk M x) t →
    alpha (flatRk M) x t ≤ beta (flatRk M) x t + ((del t).map (alpha (flatRk M) x)).sum
  | [], x, _ => by simp [beta, alpha, del]
  | m :: t, x, ⟨h1, h2, h3⟩ => by
    have h : ∑ y ∈ layer (flatRk M) x m, alpha (flatRk M) y t ≤
        ∑ y ∈ layer (flatRk M) x m,
          (beta (flatRk M) y t + ((del t).map (alpha (flatRk M) y)).sum) :=
      Finset.sum_le_sum fun y hy => bonferroni t y (by rw [(mem_layer.1 hy).2]; exact h3)
    rw [Finset.sum_add_distrib, sum_list_comm] at h
    have h' := beta_le_alpha M t x (h3.mono h1.le)
    rw [alpha, beta, del, List.map_cons, List.sum_cons, List.map_map]
    have e : ((del t).map (alpha (flatRk M) x ∘ fun s => m :: s)).sum =
      ((del t).map fun s => alpha (flatRk M) x (m :: s)).sum := rfl
    rw [e]
    linarith

end Ineq

/-- A uniform bound for a finite list of rank sets. -/
theorem list_bound (k e : ℕ) (L : List (List ℕ))
    (h : ∀ s ∈ L, ∃ C, ∀ q f, 1 ≤ q → IsCount q k f → q ^ e * f s ≤ C * q ^ deg k) :
    ∃ C, ∀ q f, 1 ≤ q → IsCount q k f → q ^ e * (L.map f).sum ≤ C * q ^ deg k := by
  induction L with
  | nil => exact ⟨0, by simp⟩
  | cons a L ih =>
    obtain ⟨C1, h1⟩ := h a List.mem_cons_self
    obtain ⟨C2, h2⟩ := ih fun s hs => h s (List.mem_cons_of_mem _ hs)
    refine ⟨C1 + C2, fun q f hq hf => ?_⟩
    rw [List.map_cons, List.sum_cons, mul_add, add_mul]
    exact Nat.add_le_add (h1 q f hq hf) (h2 q f hq hf)

theorem low_bound (k e : ℕ) (hek : e ≤ k) (s : List ℕ) (hs : s ≠ []) (hg : Good k s) :
    ∃ C, ∀ q f, 1 ≤ q → IsCount q k f → q ^ e * f s ≤ C * q ^ deg k := by
  obtain ⟨C, hC⟩ := low_upper k s hs hg.lt
  exact ⟨C, fun q f hq hf =>
    (Nat.mul_le_mul_right _ (Nat.pow_le_pow_right hq hek)).trans (hC q f hq hf)⟩

theorem high_bound_one (j : ℕ) (s : List ℕ) (hg : Good (j + 1) s) (hl : s.length + 1 ≤ j) :
    ∃ C, ∀ q f, 1 ≤ q → IsCount q (j + 1) f → q ^ 1 * f ((j + 1) :: s) ≤ C * q ^ deg (j + 1) :=
  high_upper j 1 s hg.lt (by omega) le_rfl fun t ht => by have := le_ch t; omega

theorem high_bound_two (j : ℕ) (s : List ℕ) (hg : Good (j + 1) s) (hl : s.length + 3 ≤ j) :
    ∃ C, ∀ q f, 1 ≤ q → IsCount q (j + 1) f → q ^ 2 * f ((j + 1) :: s) ≤ C * q ^ deg (j + 1) :=
  high_upper j 2 s hg.lt (by omega) (by omega) fun t ht => by
    have := le_ch t
    rcases Nat.lt_or_ge t 3 with h | h
    · obtain rfl : t = 2 := by omega
      have : ch 2 = 1 := rfl
      omega
    · omega

/-- Deletions from complete flags. -/
theorem del_full_bound (n : ℕ) : ∃ C, ∀ q f, 1 ≤ q → IsCount q (n + 4) f →
    q ^ 1 * ((del (full (n + 4))).map f).sum ≤ C * q ^ deg (n + 4) := by
  apply list_bound
  intro s hs
  simp only [full, del, List.mem_cons, List.mem_map] at hs
  rcases hs with rfl | ⟨u, hu, rfl⟩
  · exact low_bound _ _ (by omega) _ (by simp) (good_full (n + 3))
  · have hu' : u ∈ del (full (n + 3)) := by
      simp only [full, del, List.mem_cons, List.mem_map]; exact hu
    obtain ⟨a, b⟩ := del_good (good_full (n + 3)) u hu'
    rw [full_length] at b
    exact high_bound_one (n + 3) u a (by omega)

/-- Deletions from the special flags. -/
theorem del_special_bound (n : ℕ) : ∃ C, ∀ q f, 1 ≤ q → IsCount q (n + 4) f →
    q ^ 2 * ((del ((n + 4) :: special n)).map f).sum ≤ C * q ^ deg (n + 4) := by
  apply list_bound
  intro s hs
  simp only [del, List.mem_cons, List.mem_map] at hs
  rcases hs with rfl | ⟨u, hu, rfl⟩
  · exact low_bound _ _ (by omega) _ (by cases n <;> simp [special]) (good_special n)
  · obtain ⟨a, b⟩ := del_good (good_special n) u hu
    rw [special_length] at b
    exact high_bound_two (n + 3) u a (by omega)

/-- Rank sets contributing to the first gamma coefficient. -/
def ones (m : ℕ) (i : ℕ) : List (List ℕ) := ((stab m).filter fun p => p.2 = i).map Prod.fst

theorem ones_bound (n : ℕ) : ∃ C, ∀ q f, 1 ≤ q → IsCount q (n + 4) f →
    q ^ 1 * ((ones (n + 4) 1).map f).sum ≤ C * q ^ deg (n + 4) := by
  apply list_bound
  intro s hs
  simp only [ones, List.mem_map, List.mem_filter, decide_eq_true_eq] at hs
  obtain ⟨p, ⟨hp, hp1⟩, rfl⟩ := hs
  obtain ⟨_, h2, h3⟩ := stab_form _ p hp
  obtain ⟨u, hu, hg⟩ := h3 (by omega)
  rw [hu] at h2 ⊢
  simp only [List.length_cons] at h2
  exact high_bound_one (n + 3) u hg (by omega)

theorem zeros_bound (n : ℕ) : ∃ C, ∀ q f, 1 ≤ q → IsCount q (n + 4) f →
    q ^ 1 * ((ones (n + 3) 0).map f).sum ≤ C * q ^ deg (n + 4) := by
  apply list_bound
  intro s hs
  simp only [ones, List.mem_map, List.mem_filter, decide_eq_true_eq] at hs
  obtain ⟨p, ⟨hp, hp1⟩, rfl⟩ := hs
  obtain ⟨h1, h2, _⟩ := stab_form _ p hp
  refine low_bound _ _ (by omega) _ ?_ h1
  intro h
  rw [h] at h2
  simp at h2
  omega

/-- The numerical contradiction with Newton's inequality. -/
theorem newton_fails {q Q c0 c1 c2 : ℝ} {C0 C1 C2 : ℝ} (hQ : 0 < Q)
    (h0 : q * Q ≤ q * c0 + C0 * Q) (h1 : q * c1 ≤ C1 * Q) (h1' : 0 ≤ c1)
    (h2 : q * Q ≤ 4 * (q ^ 2 * c2) + 4 * (C2 * Q))
    (hq0 : 1 ≤ q) (hqa : 2 * C0 ≤ q) (hqb : 8 * C2 ≤ q) (hqc : 8 * C1 ^ 2 < q) :
    0 < c0 ∧ c1 ^ 2 < 2 * c0 * c2 := by
  have hq : 0 < q := by linarith
  have a0 : Q ≤ 2 * c0 := by
    have : q * Q ≤ q * (2 * c0) := by nlinarith
    exact le_of_mul_le_mul_left this hq
  have a2 : Q ≤ 8 * (q * c2) := by
    have : q * Q ≤ q * (8 * (q * c2)) := by nlinarith
    exact le_of_mul_le_mul_left this hq
  refine ⟨by linarith, ?_⟩
  have a1 : (q * c1) ^ 2 ≤ (C1 * Q) ^ 2 := pow_le_pow_left₀ (by positivity) h1 2
  have b1 : 8 * (q * c1) ^ 2 < q * Q ^ 2 := by
    have : 8 * C1 ^ 2 * Q ^ 2 < q * Q ^ 2 := by
      exact mul_lt_mul_of_pos_right hqc (by positivity)
    nlinarith
  have b2 : Q * Q ≤ (2 * c0) * (8 * (q * c2)) := mul_le_mul a0 a2 hQ.le (by linarith)
  have b3 : 8 * q ^ 2 * c1 ^ 2 < 8 * q ^ 2 * (2 * c0 * c2) := by
    have : q * (Q * Q) ≤ q * ((2 * c0) * (8 * (q * c2))) := mul_le_mul_of_nonneg_left b2 hq.le
    nlinarith
  exact lt_of_mul_lt_mul_left b3 (by positivity)

private theorem list_sum_le {ι : Type*} (l : List ι) (f g : ι → ℝ) (h : ∀ i ∈ l, f i ≤ g i) :
    (l.map f).sum ≤ (l.map g).sum := List.sum_le_sum h

private theorem sum_filter_map (l : List (List ℕ × ℕ)) (i : ℕ) (b : List ℕ → ℝ) :
    (l.map fun p => if p.2 = i then b p.1 else 0).sum =
      (((l.filter fun p => p.2 = i).map Prod.fst).map b).sum := by
  induction l with
  | nil => simp
  | cons p l ih => by_cases h : p.2 = i <;> simp [h, ih]

private theorem cast_sum (l : List (List ℕ)) (f : List ℕ → ℕ) :
    ((l.map f).sum : ℝ) = (l.map fun s => (f s : ℝ)).sum := by
  induction l with
  | nil => simp
  | cons a l ih => simp [ih]

private theorem map_lsum (l : List ℤ[X]) :
    (l.sum).map (Int.castRingHom ℝ) = (l.map fun p => p.map (Int.castRingHom ℝ)).sum := by
  induction l with
  | nil => simp
  | cons a l ih => simp [ih]

set_option maxHeartbeats 1600000 in
/-- The dual Chow polynomials fail to be real-rooted once `q` is large. -/
theorem rank_fails (n : ℕ) : ∃ N, ∀ (E : Type) [Finite E] (M : Matroid E) (q : ℕ)
    (f : List ℕ → ℕ), N ≤ q → IsCount q (n + 4) f → M.eRank = (n + 5 : ℕ) →
    (∀ s, alpha (flatRk M) ⊤ s = (f s : ℤ)) →
    ¬ (realChow M).Splits ∧ ¬ (realAug M).Splits := by
  obtain ⟨C0, h0⟩ := del_full_bound n
  obtain ⟨C2, h2⟩ := del_special_bound n
  obtain ⟨C1, h1⟩ := ones_bound n
  obtain ⟨C3, h3⟩ := zeros_bound n
  refine ⟨2 + 2 * C0 + 8 * C2 + (8 * (C1 + C3) ^ 2 + 1), ?_⟩
  intro E _ M q f hN hf hr hα
  have hq2 : 2 ≤ q := by omega
  have hq1 : 1 ≤ q := by omega
  have hrk : flatRk M ⊤ = n + 5 := flatRk_top M hr
  let b : List ℕ → ℝ := fun t => (beta (flatRk M) ⊤ t : ℝ)
  have hb0 : ∀ t, Good (n + 5) t → 0 ≤ b t := fun t ht => by
    have := matroid_beta_nonneg M (F := ⊤) (t := t) (by rw [hrk]; exact ht)
    change (0 : ℝ) ≤ (beta (flatRk M) ⊤ t : ℝ)
    exact_mod_cast this
  have hbα : ∀ t, Good (n + 5) t → b t ≤ f t := fun t ht => by
    have := beta_le_alpha M t ⊤ (by rw [hrk]; exact ht)
    rw [hα] at this
    change (beta (flatRk M) ⊤ t : ℝ) ≤ (f t : ℝ)
    exact_mod_cast this
  have hbon : ∀ t, Good (n + 5) t → (f t : ℝ) ≤ b t + ((del t).map f).sum := fun t ht => by
    have := bonferroni M t ⊤ (by rw [hrk]; exact ht)
    rw [hα] at this
    have e : ((del t).map (alpha (flatRk M) ⊤)).sum = (((del t).map f).sum : ℕ) := by
      generalize del t = l
      induction l with
      | nil => simp
      | cons a l ih => simp [hα, ih]
    rw [e] at this
    have h' := (Int.cast_le (R := ℝ)).2 this
    rw [Int.cast_add, Int.cast_natCast, Int.cast_natCast] at h'
    exact h'
  set Q : ℝ := (q : ℝ) ^ deg (n + 4) with hQ
  have hqR : (1 : ℝ) ≤ q := by exact_mod_cast hq1
  have hQ0 : 0 < Q := by positivity
  -- coefficient estimates
  have g0 : (q : ℝ) * Q ≤ q * b (full (n + 4)) + C0 * Q := by
    have a := hbon _ (good_full (n + 4))
    have l : Q ≤ f (full (n + 4)) := by
      have := full_lower (k := n + 3) hf; rw [hQ]; exact_mod_cast this
    have u : (q : ℝ) * ((del (full (n + 4))).map f).sum ≤ C0 * Q := by
      have := h0 q f hq1 hf; rw [pow_one] at this; rw [hQ]; exact_mod_cast this
    nlinarith
  have g2 : (q : ℝ) * Q ≤ 4 * (q ^ 2 * b ((n + 4) :: special n)) + 4 * (C2 * Q) := by
    have a := hbon ((n + 4) :: special n) ⟨by omega, by omega, good_special n⟩
    have l : Q ≤ 4 * (q * f ((n + 4) :: special n)) := by
      have := special_lower hq2 hf; rw [hQ]; exact_mod_cast this
    have u : (q : ℝ) ^ 2 * ((del ((n + 4) :: special n)).map f).sum ≤ C2 * Q := by
      have := h2 q f hq1 hf; rw [hQ]; exact_mod_cast this
    have a' : (q : ℝ) ^ 2 * f ((n + 4) :: special n) ≤
        q ^ 2 * b ((n + 4) :: special n) + q ^ 2 * ((del ((n + 4) :: special n)).map f).sum := by
      rw [← mul_add]; exact mul_le_mul_of_nonneg_left a (by positivity)
    have l' : (q : ℝ) * Q ≤ q * (4 * (q * f ((n + 4) :: special n))) :=
      mul_le_mul_of_nonneg_left l (by positivity)
    nlinarith
  have sum_up : ∀ L : List (List ℕ), (∀ s ∈ L, Good (n + 5) s) →
      (L.map b).sum ≤ ((L.map f).sum : ℕ) := fun L hL => by
    rw [cast_sum]; exact list_sum_le L _ _ fun s hs => hbα s (hL s hs)
  have sum_nn : ∀ L : List (List ℕ), (∀ s ∈ L, Good (n + 5) s) → 0 ≤ (L.map b).sum :=
    fun L hL => List.sum_nonneg fun x hx => by
      obtain ⟨s, hs, rfl⟩ := List.mem_map.1 hx; exact hb0 s (hL s hs)
  have good1 : ∀ i, ∀ s ∈ ones (n + 4) i, Good (n + 5) s := fun i s hs => by
    simp only [ones, List.mem_map, List.mem_filter] at hs
    obtain ⟨p, ⟨hp, _⟩, rfl⟩ := hs
    exact (stab_form _ p hp).1
  have good3 : ∀ i, ∀ s ∈ ones (n + 3) i, Good (n + 5) s := fun i s hs => by
    simp only [ones, List.mem_map, List.mem_filter] at hs
    obtain ⟨p, ⟨hp, _⟩, rfl⟩ := hs
    exact (stab_form _ p hp).1.mono (by omega)
  have g1 : (q : ℝ) * ((ones (n + 4) 1).map b).sum ≤ C1 * Q := by
    have u : (q : ℝ) * ((ones (n + 4) 1).map f).sum ≤ C1 * Q := by
      have := h1 q f hq1 hf; rw [pow_one] at this; rw [hQ]; exact_mod_cast this
    exact (mul_le_mul_of_nonneg_left (sum_up _ (good1 1)) (by positivity)).trans u
  have g3 : (q : ℝ) * ((ones (n + 3) 0).map b).sum ≤ C3 * Q := by
    have u : (q : ℝ) * ((ones (n + 3) 0).map f).sum ≤ C3 * Q := by
      have := h3 q f hq1 hf; rw [pow_one] at this; rw [hQ]; exact_mod_cast this
    exact (mul_le_mul_of_nonneg_left (sum_up _ (good3 0)) (by positivity)).trans u
  have g2' : b ((n + 4) :: special n) ≤ ((ones (n + 4) 2).map b).sum := by
    have hm : (n + 4) :: special n ∈ ones (n + 4) 2 := by
      simp only [ones, List.mem_map, List.mem_filter]
      exact ⟨_, ⟨special_mem n, by simp⟩, rfl⟩
    refine List.single_le_sum ?_ _ (List.mem_map_of_mem hm)
    intro x hx
    obtain ⟨s, hs, rfl⟩ := List.mem_map.1 hx
    exact hb0 s (good1 2 s hs)
  have hNR : ((2 + 2 * C0 + 8 * C2 + (8 * (C1 + C3) ^ 2 + 1) : ℕ) : ℝ) ≤ q := by exact_mod_cast hN
  push_cast at hNR
  have p0 : (0 : ℝ) ≤ C0 := Nat.cast_nonneg _
  have p1 : (0 : ℝ) ≤ C1 := Nat.cast_nonneg _
  have p2 : (0 : ℝ) ≤ C2 := Nat.cast_nonneg _
  have p3 : (0 : ℝ) ≤ C3 := Nat.cast_nonneg _
  have sq : (C1 : ℝ) ^ 2 ≤ ((C1 : ℝ) + C3) ^ 2 := pow_le_pow_left₀ p1 (by linarith) 2
  have nn := sq_nonneg ((C1 : ℝ) + C3)
  let l1 : List (ℝ × ℕ) := (stab (n + 4)).map fun p => (b p.1, p.2)
  let l2 : List (ℝ × ℕ) := (stab (n + 3)).map fun p => (b p.1, p.2 + 1)
  have c0 : (gam l1).coeff 0 = b (full (n + 4)) := by
    rw [gam_coeff, List.map_map]; exact sum_stab_zero b (n + 4)
  have cc (i : ℕ) : (gam l1).coeff i = ((ones (n + 4) i).map b).sum := by
    rw [gam_coeff, List.map_map]; exact sum_filter_map (stab (n + 4)) i b
  have dd (i : ℕ) : (gam l2).coeff (i + 1) = ((ones (n + 3) i).map b).sum := by
    rw [gam_coeff, List.map_map]
    simp only [Function.comp_def, Nat.add_right_cancel_iff]
    exact sum_filter_map (stab (n + 3)) i b
  have dd0 : (gam l2).coeff 0 = 0 := by
    rw [gam_coeff, List.map_map]; simp [Function.comp_def]
  have sq2 : (q : ℝ) * Q ≤ 4 * (q ^ 2 * ((ones (n + 4) 2).map b).sum) + 4 * (C2 * Q) := by
    have : (q : ℝ) ^ 2 * b ((n + 4) :: special n) ≤ q ^ 2 * ((ones (n + 4) 2).map b).sum :=
      mul_le_mul_of_nonneg_left g2' (by positivity)
    linarith
  constructor
  · have e : realChow M = homog l1 (n + 4) := by
      rw [realChow, dualChow_eq M (n := n + 4) hr, gammaSum, homog, map_lsum,
        List.map_map, List.map_map]
      congr 1
      apply List.map_congr_left
      intro p _
      simp [b]
    rw [e]
    have key := newton_fails (c1 := ((ones (n + 4) 1).map b).sum) hQ0 g0 g1
      (sum_nn _ (good1 1)) sq2 hqR (by linarith) (by linarith) (by linarith)
    refine not_splits l1 (n + 4) ?_ ?_ ?_
    · intro p hp
      obtain ⟨a, ha, rfl⟩ := List.mem_map.1 hp
      exact stab_le _ a ha
    · rw [c0]; exact key.1
    · rw [c0, cc, cc]; exact key.2
  · have e : realAug M = homog (l1 ++ l2) (n + 5) := by
      rw [realAug, dualAug_eq M (n := n + 4) hr, gammaSumAug, gammaSum, gammaSum, homog,
        Polynomial.map_add, Polynomial.map_mul, Polynomial.map_mul, map_lsum,
        map_lsum, List.map_append, List.sum_append, ← List.sum_map_mul_left,
        ← List.sum_map_mul_left, List.map_map, List.map_map, List.map_map, List.map_map]
      congr 1
      · congr 1
        apply List.map_congr_left
        intro p hp
        have := stab_le _ p hp
        simp only [Function.comp, b, Polynomial.map_mul, Polynomial.map_pow, map_C, map_X,
          Polynomial.map_add, Polynomial.map_one]
        rw [show n + 5 - 2 * p.2 = (n + 3 + 1 - 2 * p.2) + 1 by omega, pow_succ]
        simp only [eq_intCast]
        ring
      · congr 1
        apply List.map_congr_left
        intro p hp
        have := stab_le _ p hp
        simp only [Function.comp, b, Polynomial.map_mul, Polynomial.map_pow, map_C, map_X,
          Polynomial.map_add, Polynomial.map_one]
        rw [show n + 5 - 2 * (p.2 + 1) = n + 3 - 2 * p.2 by omega]
        simp only [eq_intCast]
        ring
    rw [e]
    have hadd (i : ℕ) : (gam (l1 ++ l2)).coeff i = (gam l1).coeff i + (gam l2).coeff i := by
      rw [gam_coeff, gam_coeff, gam_coeff, List.map_append, List.sum_append]
    have u1 : (q : ℝ) * (((ones (n + 4) 1).map b).sum + ((ones (n + 3) 0).map b).sum) ≤
        (C1 + C3) * Q := by nlinarith
    have v2 : (q : ℝ) * Q ≤ 4 * (q ^ 2 * (((ones (n + 4) 2).map b).sum +
        ((ones (n + 3) 1).map b).sum)) + 4 * (C2 * Q) := by
      have := sum_nn _ (good3 1)
      have : 0 ≤ (q : ℝ) ^ 2 * ((ones (n + 3) 1).map b).sum := by positivity
      linarith
    have key := newton_fails hQ0 g0 u1
      (add_nonneg (sum_nn _ (good1 1)) (sum_nn _ (good3 0))) v2 hqR
      (by linarith) (by linarith) (by linarith)
    refine not_splits (l1 ++ l2) (n + 5) ?_ ?_ ?_
    · intro p hp
      rcases List.mem_append.1 hp with hp | hp
      · obtain ⟨a, ha, rfl⟩ := List.mem_map.1 hp
        have := stab_le _ a ha
        simp only; omega
      · obtain ⟨a, ha, rfl⟩ := List.mem_map.1 hp
        have := stab_le _ a ha
        simp only; omega
    · rw [hadd, c0, dd0, add_zero]; exact key.1
    · rw [hadd, hadd, hadd, c0, dd0, cc, cc, dd, dd, add_zero]; exact key.2

/-- In every rank at least five, for every sufficiently large prime power `q`, there is a simple
matroid whose dual Chow and dual right augmented Chow polynomials are not real-rooted. -/
theorem counterexamples {r : ℕ} (hr : 5 ≤ r) : ∃ N : ℕ, ∀ q : ℕ, N ≤ q → IsPrimePow q →
    ∃ (E : Type) (_ : Finite E) (M : Matroid E),
      IsSimple M ∧ M.eRank = r ∧ ¬ (realChow M).Splits ∧ ¬ (realAug M).Splits := by
  obtain ⟨n, rfl⟩ : ∃ n, r = n + 5 := ⟨r - 5, by omega⟩
  obtain ⟨N, hN⟩ := rank_fails n
  refine ⟨N, fun q hq hprime => ?_⟩
  obtain ⟨p, e, hp, he, hpe⟩ := hprime
  let : Fact p.Prime := ⟨Nat.prime_iff.mpr hp⟩
  let F := GaloisField p e
  let K := FiniteField.Extension F p (n + 4)
  let : Fintype F := Fintype.ofFinite F
  let : Fintype K := Fintype.ofFinite K
  have hF : Fintype.card F = q := by
    rw [← Nat.card_eq_fintype_card, GaloisField.card p e he.ne', hpe]
  have hK : Module.finrank F K = n + 3 + 1 := FiniteField.finrank_extension F p (n + 4)
  have hcardK : n + 3 + 2 ≤ Fintype.card K := by
    rw [Module.card_eq_pow_finrank (K := F), hK]
    calc n + 3 + 2 ≤ 2 ^ (n + 3 + 1) := Nat.lt_two_pow_self (n := n + 3 + 1)
      _ ≤ _ := Nat.pow_le_pow_left Fintype.one_lt_card _
  let M := witness (F := F) (K := K) (j := n + 3) (by omega) hK
  refine ⟨Point F (K × K) K, inferInstance, M, witness_simple _ hK, witness_rank _ hK hcardK, ?_⟩
  refine hN _ M q (fun s => Nat.card (FlatFlag M Set.univ s)) hq ?_
    (witness_rank _ hK hcardK) (fun s => alpha_eq_card M s ⊤)
  rw [← hF]
  exact witness_isCount _ hK

/-- **Main theorem.** The dual Chow polynomial of every finite matroid of rank `r` is real-rooted
if and only if `r ≤ 4`. -/
theorem dualChow_realRooted_iff (r : ℕ) :
    (∀ (E : Type) [Finite E] (M : Matroid E), M.eRank = r → (realChow M).Splits) ↔ r ≤ 4 := by
  constructor
  · intro h
    by_contra hr
    obtain ⟨N, hN⟩ := counterexamples (r := r) (by omega)
    obtain ⟨p, hp, hpp⟩ := Nat.exists_infinite_primes N
    obtain ⟨E, _, M, _, hM, hn, _⟩ := hN p hp hpp.isPrimePow
    exact hn (h E M hM)
  · intro hr E _ M hM
    exact (dualChow_negRooted_of_rank_le_four M hM hr).2.1

/-- The main theorem in terms of the kernel definition of the dual Chow function. -/
theorem kernel_realRooted_iff (r : ℕ) :
    (∀ (E : Type) [Finite E] (M : Matroid E) (H : Flats M → Flats M → ℤ[X]), M.eRank = r →
      IsChow (dualKernel (flatRk M)) H → ((H ⊥ ⊤).map (Int.castRingHom ℝ)).Splits) ↔ r ≤ 4 := by
  rw [← dualChow_realRooted_iff]
  constructor
  · intro h E _ M hM
    obtain ⟨H, hH⟩ := exists_isChow (dualKernel (flatRk M))
    have := h E M H hM hH
    rwa [dualChow_eq_kernel M hH] at this
  · intro h E _ M H hM hH
    rw [dualChow_eq_kernel M hH]
    exact h E M hM

end
end CaioloFerroniHoster.Ranks
