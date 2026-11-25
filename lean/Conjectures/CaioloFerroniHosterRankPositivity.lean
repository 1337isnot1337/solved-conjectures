import Conjectures.CaioloFerroniHosterRankGamma
import Mathlib.Data.Nat.Find
import Mathlib.Order.ConditionallyCompleteLattice.Basic
import Mathlib.Order.Lattice.Nat

/-!
# Flag h-numbers of a geometric lattice are nonnegative

The proof is the minimal-label shelling, organized as a recursion on flag h-numbers refined
by the label of the last step, so no chains have to be listed.
-/

set_option linter.unusedSectionVars false
set_option linter.unusedSimpArgs false

namespace CaioloFerroniHoster.Ranks

open Finset
open scoped Classical

noncomputable section

variable {P : Type*} [Fintype P] [PartialOrder P] [OrderBot P]

/-- What is used about the lattice of flats: flats are ordered by the points (labelled by
natural numbers) in them, and adding a point raises the rank by one. -/
structure FlatSystem (P : Type*) [PartialOrder P] [OrderBot P] where
  rk : P → ℕ
  mem : ℕ → P → Prop
  join : P → ℕ → P
  rk_mono : StrictMono rk
  rk_bot : rk ⊥ = 0
  le_iff : ∀ x y, x ≤ y ↔ ∀ e, mem e x → mem e y
  join_le : ∀ {x y e}, x ≤ y → mem e y → join x e ≤ y
  le_join : ∀ x e, x ≤ join x e
  mem_join : ∀ {x e y}, mem e y → mem e (join x e)
  rk_join : ∀ {x e y}, mem e y → ¬ mem e x → rk (join x e) = rk x + 1

variable (S : FlatSystem P)

namespace FlatSystem

/-- Smallest point of `x` that is not in `y`. -/
def lab (y x : P) : ℕ := sInf {e | S.mem e x ∧ ¬ S.mem e y}

theorem lab_nonempty {y x : P} (h : y < x) : {e | S.mem e x ∧ ¬ S.mem e y}.Nonempty := by
  by_contra hn
  refine h.not_ge ((S.le_iff x y).2 fun e he => ?_)
  by_contra hy
  exact hn ⟨e, he, hy⟩

theorem lab_mem {y x : P} (h : y < x) : S.mem (S.lab y x) x ∧ ¬ S.mem (S.lab y x) y :=
  Nat.sInf_mem (S.lab_nonempty h)

theorem lab_le {y x : P} {e : ℕ} (h1 : S.mem e x) (h2 : ¬ S.mem e y) : S.lab y x ≤ e :=
  Nat.sInf_le ⟨h1, h2⟩

theorem mem_mono {x y : P} (h : x ≤ y) {e : ℕ} (he : S.mem e x) : S.mem e y :=
  (S.le_iff x y).1 h e he

theorem eq_of_le_of_rk {x y : P} (h : x ≤ y) (hr : S.rk y ≤ S.rk x) : x = y := by
  by_contra hne
  exact absurd (S.rk_mono (lt_of_le_of_ne h hne)) (by omega)

theorem lt_of_le_of_rk {x y : P} (h : x ≤ y) (hr : S.rk x < S.rk y) : x < y :=
  lt_of_le_of_ne h (by rintro rfl; omega)

/-- Next flat in the increasing chain from `y` to `x`. -/
def up (y x : P) : P := S.join y (S.lab y x)

theorem up_le {y x : P} (h : y < x) : S.up y x ≤ x := S.join_le h.le (S.lab_mem h).1
theorem le_up (y x : P) : y ≤ S.up y x := S.le_join _ _
theorem mem_up {y x : P} (h : y < x) : S.mem (S.lab y x) (S.up y x) := S.mem_join (S.lab_mem h).1
theorem rk_up {y x : P} (h : y < x) : S.rk (S.up y x) = S.rk y + 1 :=
  S.rk_join (S.lab_mem h).1 (S.lab_mem h).2

/-- Last label of the increasing chain from `y` to `x`, when `rk x = rk y + k + 1`. -/
def lastAux : ℕ → P → P → ℕ
  | 0, y, x => S.lab y x
  | k + 1, y, x => lastAux k (S.up y x) x

def last (y x : P) : ℕ := S.lastAux (S.rk x - S.rk y - 1) y x

theorem lastAux_mem (k : ℕ) : ∀ y x : P, y ≤ x → S.rk x = S.rk y + k + 1 →
    S.mem (S.lastAux k y x) x ∧ ¬ S.mem (S.lastAux k y x) y := by
  induction k with
  | zero => intro y x h hr; exact S.lab_mem (S.lt_of_le_of_rk h (by omega))
  | succ k ih =>
    intro y x h hr
    have hlt := S.lt_of_le_of_rk h (by omega)
    have h1 := ih (S.up y x) x (S.up_le hlt) (by rw [S.rk_up hlt]; omega)
    exact ⟨h1.1, fun hm => h1.2 (S.mem_mono (S.le_up y x) hm)⟩

/-- The increasing chain is the only one with increasing labels, last step version. -/
theorem unique_last (k : ℕ) : ∀ y x : P, y ≤ x → S.rk x = S.rk y + k + 2 →
    ∃ z, (y ≤ z ∧ z ≤ x ∧ S.rk z + 1 = S.rk x) ∧ S.lab z x = S.lastAux (k + 1) y x ∧
      ∀ w, (y ≤ w ∧ w ≤ x ∧ S.rk w + 1 = S.rk x) →
        (S.lastAux k y w < S.lab w x ↔ w = z) := by
  induction k with
  | zero =>
    intro y x h hr
    have hlt := S.lt_of_le_of_rk h (by omega)
    refine ⟨S.up y x, ⟨S.le_up y x, S.up_le hlt, by rw [S.rk_up hlt]; omega⟩, rfl, ?_⟩
    rintro w ⟨hyw, hwx, hwr⟩
    have hwlt : w < x := S.lt_of_le_of_rk hwx (by omega)
    have hyw' : y < w := S.lt_of_le_of_rk hyw (by omega)
    by_cases he : S.mem (S.lab y x) w
    · have hw : S.up y x = w := S.eq_of_le_of_rk (S.join_le hyw he) (by rw [S.rk_up hlt]; omega)
      have hm := S.lab_mem hwlt
      have h1 : S.lab y w ≤ S.lab y x := S.lab_le he (S.lab_mem hlt).2
      have h2 : S.lab y x ≤ S.lab w x := S.lab_le hm.1 fun h => hm.2 (S.mem_mono hyw h)
      have h3 : S.lab y x ≠ S.lab w x := fun h => hm.2 (h ▸ he)
      refine iff_of_true ?_ hw.symm
      change S.lab y w < _
      omega
    · have h1 : S.lab w x ≤ S.lab y x := S.lab_le (S.lab_mem hlt).1 he
      have hm := S.lab_mem hyw'
      have h2 : S.lab y x ≤ S.lab y w := S.lab_le (S.mem_mono hwx hm.1) hm.2
      refine iff_of_false ?_ ?_
      · change ¬ S.lab y w < _
        omega
      · rintro rfl
        exact he (S.mem_up hlt)
  | succ k ih =>
    intro y x h hr
    have hlt := S.lt_of_le_of_rk h (by omega)
    obtain ⟨z, ⟨hz1, hz2, hz3⟩, hz4, hz5⟩ := ih (S.up y x) x (S.up_le hlt)
      (by rw [S.rk_up hlt]; omega)
    refine ⟨z, ⟨(S.le_up y x).trans hz1, hz2, hz3⟩, hz4, ?_⟩
    rintro w ⟨hyw, hwx, hwr⟩
    have hwlt : w < x := S.lt_of_le_of_rk hwx (by omega)
    have hyw' : y < w := S.lt_of_le_of_rk hyw (by omega)
    by_cases he : S.mem (S.lab y x) w
    · have hm := S.lab_mem hyw'
      have h1 : S.lab y w = S.lab y x :=
        le_antisymm (S.lab_le he (S.lab_mem hlt).2) (S.lab_le (S.mem_mono hwx hm.1) hm.2)
      have hup : S.up y w = S.up y x := by rw [up, up, h1]
      have := hz5 w ⟨S.join_le hyw he, hwx, hwr⟩
      rw [← this]
      change S.lastAux k (S.up y w) w < _ ↔ _
      rw [hup]
    · have h1 : S.lab w x ≤ S.lab y x := S.lab_le (S.lab_mem hlt).1 he
      have hm := S.lastAux_mem (k + 1) y w hyw (by omega)
      have h2 : S.lab y x ≤ S.lastAux (k + 1) y w := S.lab_le (S.mem_mono hwx hm.1) hm.2
      refine iff_of_false (by omega) ?_
      rintro rfl
      exact he (S.mem_mono hz1 (S.mem_up hlt))

/-- Coatoms of `x` above `y`. -/
def coat (x : P) : Finset P := univ.filter fun z => z ≤ x ∧ S.rk z + 1 = S.rk x

theorem count_last {y x : P} (h : y ≤ x) (hr : S.rk y + 2 ≤ S.rk x) (l : ℕ) :
    (∑ z ∈ S.coat x, if y ≤ z ∧ S.lab z x = l ∧ S.last y z < l then (1 : ℤ) else 0) =
      if S.last y x = l then 1 else 0 := by
  obtain ⟨k, hk⟩ : ∃ k, S.rk x = S.rk y + k + 2 := ⟨S.rk x - S.rk y - 2, by omega⟩
  obtain ⟨z, ⟨hz1, hz2, hz3⟩, hz4, hz5⟩ := S.unique_last k y x h hk
  have hl : S.last y x = S.lab z x := by rw [hz4, last, show S.rk x - S.rk y - 1 = k + 1 by omega]
  rw [sum_eq_single z]
  · have hzz := (hz5 z ⟨hz1, hz2, hz3⟩).2 rfl
    have hlz : S.last y z = S.lastAux k y z := by rw [last, show S.rk z - S.rk y - 1 = k by omega]
    rw [hl]
    by_cases he : S.lab z x = l
    · rw [ite_eq_left he, ite_eq_left ⟨hz1, he, by rw [hlz, ← he]; exact hzz⟩]
    · rw [ite_eq_right he, ite_eq_right fun hh => he hh.2.1]
  · intro w hw hne
    rw [coat, mem_filter] at hw
    rw [ite_eq_right]
    rintro ⟨h1, h2, h3⟩
    apply hne
    refine (hz5 w ⟨h1, hw.2.1, hw.2.2⟩).1 ?_
    rw [last, show S.rk w - S.rk y - 1 = k by omega] at h3
    omega
  · intro hz
    exact absurd (by rw [coat, mem_filter]; exact ⟨mem_univ _, hz2, hz3⟩) hz

/-- Flag h-numbers refined by the last label. -/
def bl (x : P) : List ℕ → ℕ → ℤ
  | [], l => if S.last ⊥ x = l then 1 else 0
  | m :: t, l => (∑ y ∈ layer S.rk x m, if S.last y x = l then beta S.rk y t else 0) - bl x t l

/-- Ranks are positive, decreasing and below `n`. -/
def Good : ℕ → List ℕ → Prop
  | _, [] => True
  | n, m :: t => m < n ∧ 0 < m ∧ Good m t

theorem Good.mono {n m : ℕ} (h : n ≤ m) : ∀ {t : List ℕ}, Good n t → Good m t
  | [], _ => trivial
  | _ :: _, ⟨a, b, c⟩ => ⟨a.trans_le h, b, c⟩

theorem layer_top {x : P} {m : ℕ} (h : m + 1 = S.rk x) : layer S.rk x m = S.coat x := by
  ext z; simp only [mem_layer, coat, mem_filter, mem_univ, true_and]; constructor <;>
    rintro ⟨a, b⟩ <;> exact ⟨a, by omega⟩

/-- Below the last rank, the last step must go up. -/
theorem bl_low (x : P) (n : ℕ) (hx : S.rk x = n + 2) : ∀ (t : List ℕ), Good (n + 1) t → ∀ l,
    S.bl x t l = ∑ z ∈ S.coat x, if S.lab z x = l then
      ∑ l' ∈ range l, S.bl z t l' else 0 := by
  intro t
  induction t with
  | nil =>
    intro _ l
    rw [bl, ← S.count_last bot_le (by rw [S.rk_bot]; omega)]
    apply sum_congr rfl
    intro z _
    by_cases h : S.lab z x = l
    · simp [bl, h]
    · simp [h]
  | cons m t ih =>
    rintro ⟨hm, hm0, ht⟩ l
    rw [bl, ih (ht.mono hm.le) l]
    simp only [bl, sum_sub_distrib]
    have e : ∀ z ∈ S.coat x, (if S.lab z x = l then
        (∑ l' ∈ range l, ∑ y ∈ layer S.rk z m, if S.last y z = l' then beta S.rk y t else 0) -
          ∑ l' ∈ range l, S.bl z t l' else 0) =
        (∑ y ∈ layer S.rk x m, beta S.rk y t *
          if y ≤ z ∧ S.lab z x = l ∧ S.last y z < l then (1 : ℤ) else 0) -
        if S.lab z x = l then ∑ l' ∈ range l, S.bl z t l' else 0 := by
      intro z hz
      rw [coat, mem_filter] at hz
      by_cases h : S.lab z x = l
      · rw [ite_eq_left h, ite_eq_left h]
        congr 1
        rw [sum_comm]
        have hs : layer S.rk z m ⊆ layer S.rk x m := fun y hy => by
          rw [mem_layer] at hy ⊢; exact ⟨hy.1.trans hz.2.1, hy.2⟩
        rw [← sum_subset hs]
        · apply sum_congr rfl
          intro y hy
          rw [mem_layer] at hy
          by_cases hlt : S.last y z < l
          · simp [h, hy.1, hlt]
          · simp [hlt]
        · intro y hy hn
          rw [mem_layer] at hy hn
          rw [ite_eq_right fun hh => hn ⟨hh.1, hy.2⟩, mul_zero]
      · simp [h]
    rw [sum_congr rfl e, sum_sub_distrib, sum_comm]
    congr 1
    apply sum_congr rfl
    intro y hy
    rw [mem_layer] at hy
    rw [← mul_sum, S.count_last hy.1 (by omega)]
    simp

/-- Bound on all labels below `x`. -/
def lbd (x : P) : ℕ := (univ.sup fun y : P => S.last y x) + 1

theorem last_lt (y x : P) : S.last y x < S.lbd x :=
  Nat.lt_succ_of_le (le_sup (f := fun y : P => S.last y x) (mem_univ y))

theorem sum_bl (x : P) (N : ℕ) (hN : S.lbd x ≤ N) (t : List ℕ) :
    ∑ l ∈ range N, S.bl x t l = beta S.rk x t := by
  induction t with
  | nil => simp [bl, beta, (S.last_lt ⊥ x).trans_le hN]
  | cons m t ih =>
    simp only [bl, sum_sub_distrib, ih, beta]
    rw [sum_comm]
    congr 1
    apply sum_congr rfl
    intro y _
    simp [(S.last_lt y x).trans_le hN]

/-- At the last rank, the last step must go down. -/
theorem bl_top (x : P) (n : ℕ) (hx : S.rk x = n + 2) (t : List ℕ) (ht : Good (n + 1) t) (l : ℕ) :
    S.bl x ((n + 1) :: t) l = ∑ z ∈ S.coat x, if S.lab z x = l then
      ∑ l' ∈ Ico l (max l (S.lbd z)), S.bl z t l' else 0 := by
  rw [bl, S.bl_low x n hx t ht l, S.layer_top (by omega), ← sum_sub_distrib]
  apply sum_congr rfl
  intro z hz
  rw [coat, mem_filter] at hz
  rw [last, show S.rk x - S.rk z - 1 = 0 by omega, lastAux]
  by_cases h : S.lab z x = l
  · rw [ite_eq_left h, ite_eq_left h, ite_eq_left h, ← S.sum_bl z (max l (S.lbd z)) (le_max_right _ _) t,
      sum_Ico_eq_sub _ (le_max_left _ _)]
  · simp [h]

theorem bl_nonneg (n : ℕ) : ∀ x : P, S.rk x = n + 1 → ∀ t, Good (n + 1) t → ∀ l,
    0 ≤ S.bl x t l := by
  induction n with
  | zero =>
    intro x _ t ht l
    match t, ht with
    | [], _ => rw [bl]; split_ifs <;> norm_num
    | m :: t, ⟨h1, h2, _⟩ => omega
  | succ n ih =>
    intro x hx t ht l
    have hc : ∀ z ∈ S.coat x, S.rk z = n + 1 := fun z hz => by
      rw [coat, mem_filter] at hz; omega
    have low : ∀ t, Good (n + 1) t → 0 ≤ S.bl x t l := fun t ht => by
      rw [S.bl_low x n hx t ht]
      refine sum_nonneg fun z hz => ?_
      split_ifs
      · exact sum_nonneg fun _ _ => ih z (hc z hz) t ht _
      · exact le_rfl
    match t, ht with
    | [], _ => exact low [] trivial
    | m :: t, ⟨h1, h2, h3⟩ =>
      by_cases hm : m = n + 1
      · subst hm
        rw [S.bl_top x n hx t h3]
        refine sum_nonneg fun z hz => ?_
        split_ifs
        · exact sum_nonneg fun _ _ => ih z (hc z hz) t h3 _
        · exact le_rfl
      · exact low _ ⟨by omega, h2, h3⟩

/-- Flag h-numbers are nonnegative. -/
theorem beta_nonneg {x : P} {t : List ℕ} (h : Good (S.rk x) t) : 0 ≤ beta S.rk x t := by
  match hx : S.rk x with
  | 0 =>
    rw [hx] at h
    match t, h with
    | [], _ => simp [beta]
    | m :: t, ⟨h1, _⟩ => omega
  | n + 1 =>
    rw [hx] at h
    rw [← S.sum_bl x _ le_rfl t]
    exact sum_nonneg fun l _ => S.bl_nonneg n x hx t h l

/-- The full list `[n, n-1, ..., 1]`. -/
def full : ℕ → List ℕ
  | 0 => []
  | n + 1 => (n + 1) :: full n

theorem good_full : ∀ n, Good (n + 1) (full n)
  | 0 => trivial
  | n + 1 => ⟨by omega, by omega, good_full n⟩

/-- The top Moebius number is positive. -/
theorem beta_full_pos
    (hcoat : ∀ x e, S.mem e x → ¬ S.mem e ⊥ → ∃ z, z ≤ x ∧ S.rk z + 1 = S.rk x ∧ ¬ S.mem e z)
    (n : ℕ) (x : P) (hx : S.rk x = n + 1) : 0 < beta S.rk x (full n) := by
  have key : ∀ n, ∀ x : P, S.rk x = n + 1 → 0 < S.bl x (full n) (S.lab ⊥ x) := by
    intro n
    induction n with
    | zero =>
      intro x hx
      have : S.last ⊥ x = S.lab ⊥ x := by rw [last, hx, S.rk_bot]; rfl
      simp [full, bl, this]
    | succ n ih =>
      intro x hx
      have hlt : (⊥ : P) < x := S.lt_of_le_of_rk bot_le (by rw [S.rk_bot]; omega)
      obtain ⟨z, hzx, hzr, hze⟩ := hcoat x _ (S.lab_mem hlt).1 (S.lab_mem hlt).2
      have hz : S.rk z = n + 1 := by omega
      have hzlt : z < x := S.lt_of_le_of_rk hzx (by omega)
      have hbz : (⊥ : P) < z := S.lt_of_le_of_rk bot_le (by rw [S.rk_bot]; omega)
      have hlab : S.lab z x = S.lab ⊥ x := by
        refine le_antisymm (S.lab_le (S.lab_mem hlt).1 hze) (S.lab_le (S.lab_mem hzlt).1 fun h => ?_)
        exact (S.lab_mem hzlt).2 (S.mem_mono bot_le h)
      have hle : S.lab ⊥ x ≤ S.lab ⊥ z :=
        S.lab_le (S.mem_mono hzx (S.lab_mem hbz).1) (S.lab_mem hbz).2
      rw [full, S.bl_top x n hx _ (good_full n)]
      have nn : ∀ w ∈ S.coat x, 0 ≤ (if S.lab w x = S.lab ⊥ x then
          ∑ l' ∈ Ico (S.lab ⊥ x) (max (S.lab ⊥ x) (S.lbd w)), S.bl w (full n) l' else 0) := by
        intro w hw
        rw [coat, mem_filter] at hw
        split_ifs
        · exact sum_nonneg fun _ _ => S.bl_nonneg n w (by omega) _ (good_full n) _
        · exact le_rfl
      refine sum_pos' nn ⟨z, by rw [coat, mem_filter]; exact ⟨mem_univ _, hzx, hzr⟩, ?_⟩
      rw [ite_eq_left hlab]
      have hpos := ih z hz
      refine sum_pos' (fun l _ => S.bl_nonneg n z hz _ (good_full n) l) ⟨S.lab ⊥ z, ?_, hpos⟩
      rw [mem_Ico]
      refine ⟨hle, lt_of_lt_of_le ?_ (le_max_right _ _)⟩
      by_contra hge
      have hsum := S.sum_bl z (S.lbd z) le_rfl (full n)
      have hsum' := S.sum_bl z (S.lab ⊥ z + 1) (by omega) (full n)
      rw [sum_range_succ] at hsum'
      have hsub : ∑ l ∈ range (S.lbd z), S.bl z (full n) l ≤
          ∑ l ∈ range (S.lab ⊥ z), S.bl z (full n) l :=
        sum_le_sum_of_subset_of_nonneg (range_mono (by omega))
          fun l _ _ => S.bl_nonneg n z hz _ (good_full n) l
      omega
  rw [← S.sum_bl x (max (S.lbd x) (S.lab ⊥ x + 1)) (le_max_left _ _)]
  exact sum_pos' (fun l _ => S.bl_nonneg n x hx _ (good_full n) l)
    ⟨S.lab ⊥ x, by rw [mem_range]; exact lt_of_lt_of_le (Nat.lt_succ_self _) (le_max_right _ _), key n x hx⟩

end FlatSystem
end
end CaioloFerroniHoster.Ranks
