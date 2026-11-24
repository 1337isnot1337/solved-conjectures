import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Tactic

/-!
# Dual Chow polynomials of a ranked poset and their gamma expansion

`Fstar` and `Hstar` are defined by the recursions of Caiolo-Ferroni-Hoster
(arXiv:2605.28474v1), Propositions 4.6 and 4.7. `Fstar_eq` and `Hstar_eq` are Theorem 4.9
in every rank, stated with flag h-numbers `beta`.
-/

set_option linter.unusedSectionVars false
set_option linter.unusedSimpArgs false

namespace CaioloFerroniHoster.Ranks

open Finset Polynomial
open scoped Classical

noncomputable section

variable {P : Type*} [Fintype P] [PartialOrder P] [OrderBot P]

/-- `1 + X + ... + X^(n-1)`. -/
def geo (n : ℕ) : ℤ[X] := ∑ j ∈ range n, X ^ j

/-- Elements of rank `m` below `x`. -/
def layer (ρ : P → ℕ) (x : P) (m : ℕ) : Finset P := univ.filter fun y => y ≤ x ∧ ρ y = m

@[simp] theorem mem_layer {ρ : P → ℕ} {x y : P} {m : ℕ} :
    y ∈ layer ρ x m ↔ y ≤ x ∧ ρ y = m := by simp [layer]

/-- Dual right augmented Chow polynomial of `[⊥, x]` (CFH Proposition 4.6). -/
def Fstar (ρ : P → ℕ) (x : P) : ℤ[X] :=
  if x = ⊥ then 1 else
    -∑ y : {y : P // y < x}, (-1) ^ (ρ x - ρ y.1) * geo (ρ x - ρ y.1 + 1) * Fstar ρ y.1
termination_by (univ.filter fun y => y < x).card
decreasing_by
  apply card_lt_card
  refine ⟨fun z hz => ?_, fun h => ?_⟩
  · simp only [mem_filter, mem_univ, true_and] at hz ⊢
    exact hz.trans y.2
  · have := h (show y.1 ∈ _ by simpa using y.2)
    simp at this

/-- Dual Chow polynomial of `[⊥, x]` (CFH Proposition 4.7). -/
def Hstar (ρ : P → ℕ) (x : P) : ℤ[X] :=
  ∑ y ∈ univ.filter (fun y => y ≤ x), Fstar ρ y * (-X) ^ (ρ x - ρ y)

/-- Number of chains below `x` with the listed (decreasing) ranks. -/
def alpha (ρ : P → ℕ) (x : P) : List ℕ → ℤ
  | [] => 1
  | m :: t => ∑ y ∈ layer ρ x m, alpha ρ y t

/-- Flag h-numbers, for a decreasing list of ranks. -/
def beta (ρ : P → ℕ) (x : P) : List ℕ → ℤ
  | [] => 1
  | m :: t => (∑ y ∈ layer ρ x m, beta ρ y t) - beta ρ x t

/-- Rank lists `[m, ..., ]` with largest entry `m` whose complement in `[1,m]` is stable,
together with the size of that complement. -/
def stab : ℕ → List (List ℕ × ℕ)
  | 0 => [([], 0)]
  | 1 => [([1], 0)]
  | m + 2 => (stab (m + 1)).map (fun p => ((m + 2) :: p.1, p.2)) ++
      (stab m).map (fun p => ((m + 2) :: p.1, p.2 + 1))

/-- Gamma-type sum in degree `m`: the dual Chow polynomial when `m` is one less than the rank. -/
def gammaSum (ρ : P → ℕ) (x : P) (m : ℕ) : ℤ[X] :=
  ((stab m).map fun p => C (beta ρ x p.1) * (X ^ p.2 * (1 + X) ^ (m - 2 * p.2))).sum

/-- The degree `m` sum for the augmented polynomial. -/
def gammaSumAug (ρ : P → ℕ) (x : P) : ℕ → ℤ[X]
  | 0 => 0
  | 1 => (1 + X) * gammaSum ρ x 0
  | m + 2 => (1 + X) * gammaSum ρ x (m + 1) + X * gammaSum ρ x m

theorem stab_le : ∀ (m : ℕ), ∀ p ∈ stab m, 2 * p.2 ≤ m
  | 0, p, h => by simp [stab] at h; simp [h]
  | 1, p, h => by simp [stab] at h; simp [h]
  | m + 2, p, h => by
    simp only [stab, List.mem_append, List.mem_map] at h
    rcases h with ⟨a, ha, rfl⟩ | ⟨a, ha, rfl⟩
    · have := stab_le (m + 1) a ha; simp only; omega
    · have := stab_le m a ha; simp only; omega

/-- Auxiliary: the gamma sum with an arbitrary coefficient function. -/
private def gs (f : List ℕ → ℤ) (m : ℕ) : ℤ[X] :=
  ((stab m).map fun p => C (f p.1) * (X ^ p.2 * (1 + X) ^ (m - 2 * p.2))).sum

private theorem list_sum_sub {ι : Type*} (l : List ι) (f g : ι → ℤ[X]) :
    (l.map fun i => f i - g i).sum = (l.map f).sum - (l.map g).sum := by
  induction l with
  | nil => simp
  | cons a l ih => simp [ih]; ring

private theorem list_sum_finset {ι : Type*} (l : List ι) (s : Finset P) (f : P → ι → ℤ[X]) :
    (l.map fun i => ∑ y ∈ s, f y i).sum = ∑ y ∈ s, (l.map (f y)).sum := by
  induction l with
  | nil => simp
  | cons a l ih => simp [ih, sum_add_distrib]

private theorem gs_cons (f : List ℕ → ℤ) (m : ℕ) :
    gs f (m + 2) = (1 + X) * gs (fun t => f ((m + 2) :: t)) (m + 1) +
      X * gs (fun t => f ((m + 2) :: t)) m := by
  simp only [gs, stab, List.map_append, List.sum_append, List.map_map]
  congr 1
  · rw [← List.sum_map_mul_left]
    congr 1
    apply List.map_congr_left
    intro p hp
    have := stab_le _ p hp
    simp only [Function.comp]
    rw [show m + 2 - 2 * p.2 = (m + 1 - 2 * p.2) + 1 by omega]
    ring
  · rw [← List.sum_map_mul_left]
    congr 1
    apply List.map_congr_left
    intro p hp
    simp only [Function.comp]
    rw [show m + 2 - 2 * (p.2 + 1) = m - 2 * p.2 by omega]
    ring

private theorem gs_beta (ρ : P → ℕ) (x : P) (m k : ℕ) :
    gs (fun t => beta ρ x (m :: t)) k =
      (∑ y ∈ layer ρ x m, gammaSum ρ y k) - gammaSum ρ x k := by
  simp only [gs, gammaSum, beta, ← list_sum_finset, ← list_sum_sub]
  congr 1
  apply List.map_congr_left
  intro p _
  simp [sub_mul, sum_mul, map_sum]

theorem gammaSum_zero (ρ : P → ℕ) (x : P) : gammaSum ρ x 0 = 1 := by
  simp [gammaSum, stab, beta]

theorem gammaSum_succ (ρ : P → ℕ) (x : P) (m : ℕ) :
    gammaSum ρ x (m + 1) =
      (∑ y ∈ layer ρ x (m + 1), gammaSumAug ρ y (m + 1)) - gammaSumAug ρ x (m + 1) := by
  cases m with
  | zero =>
    simp [gammaSum, stab, gammaSumAug, beta]
    ring
  | succ m =>
    change gs (beta ρ x) (m + 2) = _
    rw [gs_cons, gs_beta, gs_beta]
    simp only [gammaSumAug, sum_add_distrib, ← mul_sum]
    ring

/-! ### The recursion -/

private def psi (c : ℕ) : ℤ[X] := -(-1) ^ c * geo c

private theorem geo_succ (n : ℕ) : geo (n + 1) = 1 + X * geo n := by
  simp only [geo, sum_range_succ', pow_succ', pow_zero, mul_sum]; ring

private theorem geo_succ' (n : ℕ) : geo (n + 1) = geo n + X ^ n := by
  simp [geo, sum_range_succ]

private theorem psi_rec (c : ℕ) : psi (c + 2) = -((1 + X) * psi (c + 1) + X * psi c) := by
  have h1 := geo_succ (c + 1)
  have h2 := geo_succ c
  simp only [psi, pow_succ]
  rw [h1, h2]
  ring

private theorem psi_one : psi 1 = 1 := by simp [psi, geo]
private theorem psi_zero : psi 0 = 0 := by simp [psi, geo]

/-- Solving the two-term recursion. -/
private theorem solve (A D : ℕ → ℤ[X]) (n : ℕ) (h0 : D 0 = A 0)
    (h1 : 1 ≤ n → D 1 = A 1 - (1 + X) * D 0)
    (h : ∀ m, m + 2 ≤ n → D (m + 2) = A (m + 2) - ((1 + X) * D (m + 1) + X * D m)) :
    ∀ m ≤ n, D m = ∑ j ∈ range (m + 1), A j * psi (m + 1 - j) := by
  intro m
  induction m using Nat.twoStepInduction with
  | zero => intro _; simp [h0, psi_one]
  | one =>
    intro hm
    rw [h1 hm, h0, sum_range_succ, sum_range_one]
    simp only [Nat.sub_zero, Nat.reduceAdd, Nat.add_sub_cancel, psi_one]
    rw [psi_rec 0, psi_one, psi_zero]; ring
  | more m ih0 ih1 =>
    intro hm
    rw [h m hm, ih0 (by omega), ih1 (by omega), sum_range_succ _ (m + 2),
      sum_range_succ _ (m + 1)]
    have key : ∑ j ∈ range (m + 1), A j * psi (m + 2 + 1 - j) =
        -((1 + X) * ∑ j ∈ range (m + 1), A j * psi (m + 1 + 1 - j) +
          X * ∑ j ∈ range (m + 1), A j * psi (m + 1 - j)) := by
      rw [mul_sum, mul_sum, ← sum_add_distrib, ← sum_neg_distrib]
      apply sum_congr rfl
      intro j hj
      have : j ≤ m := by simpa [Nat.lt_succ_iff] using hj
      rw [show m + 2 + 1 - j = (m + 1 - j) + 2 by omega, psi_rec,
        show m + 1 + 1 - j = (m + 1 - j) + 1 by omega]
      ring
    rw [sum_range_succ _ (m + 1)] 
    rw [key]
    rw [show m + 2 + 1 - (m + 2) = 1 by omega, show m + 2 + 1 - (m + 1) = 2 by omega,
      show m + 1 + 1 - (m + 1) = 1 by omega, psi_rec 0, psi_one, psi_zero]
    ring

/-- Splitting a sum over elements below `x` by rank. -/
theorem sum_lt_eq {M : Type*} [AddCommMonoid M] {ρ : P → ℕ} (hρ : StrictMono ρ) (x : P)
    (f : P → M) :
    ∑ y ∈ univ.filter (fun y => y < x), f y =
      ∑ j ∈ range (ρ x), ∑ y ∈ layer ρ x j, f y := by
  rw [← sum_fiberwise_of_maps_to (s := univ.filter (fun y => y < x)) (t := range (ρ x)) (g := ρ)]
  · apply sum_congr rfl
    intro j hj
    apply sum_congr _ (fun _ _ => rfl)
    ext y
    simp only [mem_filter, mem_univ, true_and, mem_layer]
    constructor
    · rintro ⟨h, rfl⟩; exact ⟨h.le, rfl⟩
    · rintro ⟨h, rfl⟩
      refine ⟨lt_of_le_of_ne h ?_, rfl⟩
      rintro rfl; simp at hj
  · intro y hy
    simp only [mem_filter, mem_univ, true_and] at hy
    exact mem_range.mpr (hρ hy)

theorem Fstar_bot (ρ : P → ℕ) : Fstar ρ (⊥ : P) = 1 := by rw [Fstar]; simp

theorem Fstar_rec (ρ : P → ℕ) {x : P} (hx : x ≠ ⊥) :
    Fstar ρ x = -∑ y ∈ univ.filter (fun y => y < x),
      (-1) ^ (ρ x - ρ y) * geo (ρ x - ρ y + 1) * Fstar ρ y := by
  rw [Fstar, ite_eq_right hx]
  congr 1
  exact (sum_subtype (univ.filter fun y => y < x) (by simp)
    (fun y => (-1) ^ (ρ x - ρ y) * geo (ρ x - ρ y + 1) * Fstar ρ y)).symm

private theorem both {ρ : P → ℕ} (hρ : StrictMono ρ) (h0 : ρ ⊥ = 0) (n : ℕ) :
    ∀ x : P, ρ x = n + 1 →
      Fstar ρ x = gammaSumAug ρ x (n + 1) ∧ Hstar ρ x = gammaSum ρ x n := by
  induction n using Nat.strong_induction_on with
  | _ n ih =>
    intro x hx
    have hxb : x ≠ ⊥ := by rintro rfl; omega
    have bot_layer : layer ρ x 0 = {⊥} := by
      ext y
      simp only [mem_layer, mem_singleton]
      constructor
      · rintro ⟨_, hy⟩
        by_contra hne
        have := hρ (bot_lt_iff_ne_bot.mpr hne)
        omega
      · rintro rfl; exact ⟨bot_le, h0⟩
    let A : ℕ → ℤ[X] := fun j => ∑ y ∈ layer ρ x j, Fstar ρ y
    have hA0 : A 0 = 1 := by simp [A, bot_layer, Fstar_bot]
    have hA (j : ℕ) (hj : j < n) :
        A (j + 1) = ∑ y ∈ layer ρ x (j + 1), gammaSumAug ρ y (j + 1) :=
      sum_congr rfl fun y hy => (ih j hj y (mem_layer.mp hy).2).1
    have hD := solve A (gammaSum ρ x) n (by rw [hA0, gammaSum_zero])
      (fun h => by rw [hA 0 h, gammaSum_succ]; rfl)
      (fun m hm => by rw [hA (m + 1) hm, gammaSum_succ]; rfl)
    constructor
    · rw [Fstar_rec ρ hxb, sum_lt_eq hρ, hx, ← sum_neg_distrib]
      have e1 : ∀ j ∈ range (n + 1),
          -∑ y ∈ layer ρ x j, (-1) ^ (n + 1 - ρ y) * geo (n + 1 - ρ y + 1) * Fstar ρ y =
            -(A j * psi (n + 2 - j)) := by
        intro j hj
        have : j ≤ n := by simpa [Nat.lt_succ_iff] using hj
        congr 1
        simp only [A, sum_mul]
        apply sum_congr rfl
        intro y hy
        rw [(mem_layer.mp hy).2, psi, show n + 2 - j = n + 1 - j + 1 by omega, pow_succ]
        ring
      rw [sum_congr rfl e1]
      cases n with
      | zero => simp [gammaSumAug, gammaSum_zero, hA0, psi_rec 0, psi_one, psi_zero]
      | succ n =>
        simp only [gammaSumAug]
        rw [hD (n + 1) le_rfl, hD n (by omega), sum_range_succ _ (n + 1), sum_range_succ _ (n + 1)]
        have key : ∑ j ∈ range (n + 1), -(A j * psi (n + 1 + 2 - j)) =
            (1 + X) * ∑ j ∈ range (n + 1), A j * psi (n + 1 + 1 - j) +
              X * ∑ j ∈ range (n + 1), A j * psi (n + 1 - j) := by
          rw [mul_sum, mul_sum, ← sum_add_distrib]
          apply sum_congr rfl
          intro j hj
          have : j ≤ n := by simpa [Nat.lt_succ_iff] using hj
          rw [show n + 1 + 2 - j = (n + 1 - j) + 2 by omega, psi_rec,
            show n + 1 + 1 - j = (n + 1 - j) + 1 by omega]
          ring
        rw [key, show n + 1 + 2 - (n + 1) = 2 by omega, show n + 1 + 1 - (n + 1) = 1 by omega,
          psi_rec 0, psi_one, psi_zero]
        ring
    · have hsplit : univ.filter (fun y => y ≤ x) = insert x (univ.filter fun y => y < x) := by
        ext y; simp [le_iff_eq_or_lt]
      rw [Hstar, hsplit, sum_insert (by simp), Nat.sub_self, pow_zero, mul_one,
        Fstar_rec ρ hxb, ← sum_neg_distrib, ← sum_add_distrib, sum_lt_eq hρ, hx, hD n le_rfl]
      apply sum_congr rfl
      intro j hj
      have : j ≤ n := by simpa [Nat.lt_succ_iff] using hj
      simp only [A, sum_mul]
      apply sum_congr rfl
      intro y hy
      rw [(mem_layer.mp hy).2, geo_succ', psi, neg_pow (X : ℤ[X])]
      ring

/-- CFH Theorem 4.9 for the dual right augmented Chow polynomial, in every rank. -/
theorem Fstar_eq {ρ : P → ℕ} (hρ : StrictMono ρ) (h0 : ρ ⊥ = 0) {n : ℕ} {x : P}
    (hx : ρ x = n + 1) : Fstar ρ x = gammaSumAug ρ x (n + 1) := (both hρ h0 n x hx).1

/-- CFH Theorem 4.9 for the dual Chow polynomial, in every rank. -/
theorem Hstar_eq {ρ : P → ℕ} (hρ : StrictMono ρ) (h0 : ρ ⊥ = 0) {n : ℕ} {x : P}
    (hx : ρ x = n + 1) : Hstar ρ x = gammaSum ρ x n := (both hρ h0 n x hx).2

end
end CaioloFerroniHoster.Ranks
