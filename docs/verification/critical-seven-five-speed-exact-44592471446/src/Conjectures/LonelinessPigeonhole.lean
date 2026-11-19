import Mathlib.Basic.Real.Basic
import Mathlib.Data.Fintype.Card
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Data.Int.GCD
import Mathlib.Data.Fin.Tuple.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

/-! Elementary simultaneous approximation for primitive integer directions.
Pigeonholing exact rational residues gives an independent integer direction
near the original line. No lattice-volume theorem is used. -/

namespace Loneliness.Pigeonhole

theorem integer_scaling_gcd (ds : List ℕ) (t : ℝ)
    (h : ∀ a ∈ ds, ∃ z : ℤ, t * (a : ℝ) = (z : ℝ)) :
    ∃ z : ℤ, t * ((ds.foldr Nat.gcd 0 : ℕ) : ℝ) = (z : ℝ) := by
  induction ds with
  | nil => exact ⟨0, by simp⟩
  | cons a ds ih =>
    obtain ⟨x, hx⟩ := h a (by simp)
    obtain ⟨y, hy⟩ := ih (fun b hb => h b (by simp [hb]))
    let g := ds.foldr Nat.gcd 0
    have hbez : (Nat.gcd a g : ℝ) =
        (a : ℝ) * (Nat.gcdA a g : ℝ) + (g : ℝ) * (Nat.gcdB a g : ℝ) := by
      exact_mod_cast Nat.gcd_eq_gcd_ab a g
    refine ⟨x * Nat.gcdA a g + y * Nat.gcdB a g, ?_⟩
    change t * (Nat.gcd a g : ℝ) = _
    rw [hbez]
    calc
      _ = (t * (a : ℝ)) * (Nat.gcdA a g : ℝ) +
          (t * (g : ℝ)) * (Nat.gcdB a g : ℝ) := by ring
      _ = _ := by rw [hx, hy]; simp only [Int.cast_add, Int.cast_mul]

theorem integer_of_primitive_scaling {n : ℕ} (v : Fin n → ℕ)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (t : ℝ) (h : ∀ i, ∃ z : ℤ, t * (v i : ℝ) = (z : ℝ)) :
    ∃ z : ℤ, t = (z : ℝ) := by
  have hlist : ∀ a ∈ List.ofFn v, ∃ z : ℤ, t * (a : ℝ) = (z : ℝ) := by
    intro a ha
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
    exact h i
  simpa only [hprimitive, Nat.cast_one, mul_one] using integer_scaling_gcd (List.ofFn v) t hlist

theorem same_box_close (B N r s : ℕ) (hB : 0 < B) (hN : 0 < N)
    (hbox : B * r / N = B * s / N) :
    |(r : ℝ) / (N : ℝ) - (s : ℝ) / (N : ℝ)| < 1 / (B : ℝ) := by
  have hB' : (0 : ℝ) < B := by exact_mod_cast hB
  have hN' : (0 : ℝ) < N := by exact_mod_cast hN
  have hrlow : ((B * r / N : ℕ) : ℝ) * (N : ℝ) ≤ (B : ℝ) * (r : ℝ) := by
    exact_mod_cast Nat.div_mul_le_self (B * r) N
  have hrhigh : (B : ℝ) * (r : ℝ) < ((B * r / N : ℕ) : ℝ) * (N : ℝ) + (N : ℝ) := by
    exact_mod_cast Nat.lt_div_mul_add (a := B * r) hN
  have hslow : ((B * r / N : ℕ) : ℝ) * (N : ℝ) ≤ (B : ℝ) * (s : ℝ) := by
    rw [hbox]
    exact_mod_cast Nat.div_mul_le_self (B * s) N
  have hshigh : (B : ℝ) * (s : ℝ) < ((B * r / N : ℕ) : ℝ) * (N : ℝ) + (N : ℝ) := by
    rw [hbox]
    exact_mod_cast Nat.lt_div_mul_add (a := B * s) hN
  rw [← sub_div, abs_div, abs_of_pos hN']
  apply (div_lt_div_iff₀ hN' hB').mpr
  rw [one_mul]
  rcases le_total (s : ℝ) (r : ℝ) with hrs | hrs
  · rw [abs_of_nonneg (sub_nonneg.mpr hrs)]
    calc
      ((r : ℝ) - (s : ℝ)) * (B : ℝ) = (B : ℝ) * (r : ℝ) - (B : ℝ) * (s : ℝ) := by ring
      _ < ((B * r / N : ℕ) : ℝ) * (N : ℝ) + (N : ℝ) - (B : ℝ) * (s : ℝ) :=
        sub_lt_sub_right hrhigh _
      _ ≤ ((B * r / N : ℕ) : ℝ) * (N : ℝ) + (N : ℝ) -
          ((B * r / N : ℕ) : ℝ) * (N : ℝ) := sub_le_sub_left hslow _
      _ = (N : ℝ) := by ring
  · rw [abs_of_nonpos (sub_nonpos.mpr hrs)]
    calc
      (-((r : ℝ) - (s : ℝ))) * (B : ℝ) = (B : ℝ) * (s : ℝ) - (B : ℝ) * (r : ℝ) := by ring
      _ < ((B * r / N : ℕ) : ℝ) * (N : ℝ) + (N : ℝ) - (B : ℝ) * (r : ℝ) :=
        sub_lt_sub_right hshigh _
      _ ≤ ((B * r / N : ℕ) : ℝ) * (N : ℝ) + (N : ℝ) -
          ((B * r / N : ℕ) : ℝ) * (N : ℝ) := sub_le_sub_left hrlow _
      _ = (N : ℝ) := by ring

theorem equal_boxes {n : ℕ} (v : Fin (n + 1) → ℕ) (B : ℕ) (hB : 0 < B)
    (hlarge : B ^ n < v (Fin.last n)) :
    ∃ k l : ℕ, k < l ∧ l < v (Fin.last n) ∧
      ∀ i : Fin n,
        B * (k * v i.castSucc % v (Fin.last n)) / v (Fin.last n) =
          B * (l * v i.castSucc % v (Fin.last n)) / v (Fin.last n) := by
  let N := v (Fin.last n)
  have hN : 0 < N := (pow_pos hB n).trans hlarge
  let code : Fin N → Fin n → Fin B := fun k i =>
    ⟨B * (k.val * v i.castSucc % N) / N, by
      apply (Nat.div_lt_iff_lt_mul hN).mpr
      exact Nat.mul_lt_mul_of_pos_left (Nat.mod_lt _ hN) hB⟩
  have hcard : Fintype.card (Fin n → Fin B) < Fintype.card (Fin N) := by
    simpa only [Fintype.card_pi_const, Fintype.card_fin] using hlarge
  obtain ⟨k, l, hcode, hne⟩ := Function.not_injective_iff.mp
    (Fintype.not_injective_of_card_lt code hcard)
  have ordered : ∃ k l : Fin N, k < l ∧ code k = code l := by
    rcases lt_or_gt_of_ne hne with hlt | hlt
    · exact ⟨k, l, hlt, hcode⟩
    · exact ⟨l, k, hlt, hcode.symm⟩
  obtain ⟨k, l, hlt, hcode⟩ := ordered
  refine ⟨k.val, l.val, hlt, l.is_lt, ?_⟩
  intro i
  exact congrArg Fin.val (congrFun hcode i)

theorem independent_integer_approximation {n : ℕ} (v : Fin (n + 1) → ℕ)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (B : ℕ) (hB : 0 < B) (hlarge : B ^ n < v (Fin.last n)) :
    ∃ (w : Fin (n + 1) → ℤ) (t : ℝ),
      0 < t ∧ t < 1 ∧
      (∀ i, |(w i : ℝ) - t * (v i : ℝ)| < 1 / (B : ℝ)) ∧
      ¬∃ r : ℝ, ∀ i, (w i : ℝ) = r * (v i : ℝ) := by
  let N := v (Fin.last n)
  have hN : 0 < N := (pow_pos hB n).trans hlarge
  have hN' : (0 : ℝ) < N := by exact_mod_cast hN
  obtain ⟨k, l, hkl, hlN, hbox⟩ := equal_boxes v B hB hlarge
  let t : ℝ := ((l : ℝ) - (k : ℝ)) / (N : ℝ)
  let w : Fin (n + 1) → ℤ := fun i =>
    ((l * v i / N : ℕ) : ℤ) - ((k * v i / N : ℕ) : ℤ)
  have hkl' : (k : ℝ) < l := by exact_mod_cast hkl
  have hlN' : (l : ℝ) < N := by exact_mod_cast hlN
  have htpos : 0 < t := div_pos (sub_pos.mpr hkl') hN'
  have htlt : t < 1 := by
    apply (div_lt_one hN').mpr
    exact (sub_le_self (l : ℝ) (Nat.cast_nonneg k)).trans_lt hlN'
  have hlast : (w (Fin.last n) : ℝ) = (l : ℝ) - (k : ℝ) := by
    simp only [w, Int.cast_sub, Int.cast_natCast]
    change ((l * N / N : ℕ) : ℝ) - ((k * N / N : ℕ) : ℝ) = (l : ℝ) - (k : ℝ)
    rw [Nat.mul_div_cancel l hN, Nat.mul_div_cancel k hN]
  have herror (i : Fin (n + 1)) :
      (w i : ℝ) - t * (v i : ℝ) =
        ((k * v i % N : ℕ) : ℝ) / (N : ℝ) -
          ((l * v i % N : ℕ) : ℝ) / (N : ℝ) := by
    have hk : (N : ℝ) * ((k * v i / N : ℕ) : ℝ) + ((k * v i % N : ℕ) : ℝ) =
        (k : ℝ) * (v i : ℝ) := by exact_mod_cast Nat.div_add_mod (k * v i) N
    have hl : (N : ℝ) * ((l * v i / N : ℕ) : ℝ) + ((l * v i % N : ℕ) : ℝ) =
        (l : ℝ) * (v i : ℝ) := by exact_mod_cast Nat.div_add_mod (l * v i) N
    have hkdiv : (k : ℝ) * (v i : ℝ) / (N : ℝ) =
        ((k * v i / N : ℕ) : ℝ) + ((k * v i % N : ℕ) : ℝ) / (N : ℝ) := by
      rw [← hk, add_div]
      simp [ne_of_gt hN']
    have hldiv : (l : ℝ) * (v i : ℝ) / (N : ℝ) =
        ((l * v i / N : ℕ) : ℝ) + ((l * v i % N : ℕ) : ℝ) / (N : ℝ) := by
      rw [← hl, add_div]
      simp [ne_of_gt hN']
    have hscale : t * (v i : ℝ) =
        (((l * v i / N : ℕ) : ℝ) + ((l * v i % N : ℕ) : ℝ) / (N : ℝ)) -
          (((k * v i / N : ℕ) : ℝ) + ((k * v i % N : ℕ) : ℝ) / (N : ℝ)) := by
      calc
        _ = (l : ℝ) * (v i : ℝ) / (N : ℝ) - (k : ℝ) * (v i : ℝ) / (N : ℝ) := by
          dsimp [t]
          ring
        _ = _ := by rw [hldiv, hkdiv]
    rw [hscale]
    simp only [w, Int.cast_sub, Int.cast_natCast]
    ring
  refine ⟨w, t, htpos, htlt, ?_, ?_⟩
  · intro i
    rw [herror i]
    refine Fin.lastCases ?_ (fun j => ?_) i
    · change |((k * N % N : ℕ) : ℝ) / (N : ℝ) -
        ((l * N % N : ℕ) : ℝ) / (N : ℝ)| < 1 / (B : ℝ)
      simp only [Nat.mul_mod_left, Nat.cast_zero, zero_div, sub_zero, abs_zero]
      positivity
    · exact same_box_close B N _ _ hB hN (hbox j)
  · rintro ⟨r, hr⟩
    have hr_t : r = t := by
      have h := hr (Fin.last n)
      rw [hlast] at h
      apply (eq_div_iff (ne_of_gt hN')).mpr
      exact h.symm
    obtain ⟨z, hz⟩ := integer_of_primitive_scaling v hprimitive r
      (fun i => ⟨w i, (hr i).symm⟩)
    have hzpos : (0 : ℤ) < z := by exact_mod_cast (show (0 : ℝ) < z by rw [← hz, hr_t]; exact htpos)
    have hzlt : z < (1 : ℤ) := by exact_mod_cast (show (z : ℝ) < 1 by rw [← hz, hr_t]; exact htlt)
    omega

end Loneliness.Pigeonhole
