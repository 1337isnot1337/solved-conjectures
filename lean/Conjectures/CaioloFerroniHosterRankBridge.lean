import Conjectures.CaioloFerroniHosterRankFlats
import Mathlib.Combinatorics.Enumerative.IncidenceAlgebra
import Mathlib.Algebra.Polynomial.Reverse
import Mathlib.Algebra.Polynomial.Div

/-!
# Agreement with the kernel definitions

Caiolo-Ferroni-Hoster (arXiv:2605.28474v1) define the dual Chow function as the Chow function of
the kernel `(χ^rev)^sgn` (Definitions 2.4, 2.8 and 3.1), and the dual right augmented Chow
function as `H* (f*)^rev`, where `f*` is the right Kazhdan-Lusztig-Stanley function of that kernel
(Theorem 2.3 and Definition 2.7). This file states those definitions and proves that they give
`Hstar` and `Fstar` on every interval `[⊥, x]`.
-/

set_option linter.unusedSectionVars false
set_option linter.unusedSimpArgs false

namespace CaioloFerroniHoster.Ranks

open Finset Polynomial
open scoped Classical

noncomputable section

variable {P : Type*} [Fintype P] [PartialOrder P]

/-- Moebius function of a finite poset. -/
def moeb (s t : P) : ℤ :=
  letI : LocallyFiniteOrder P := Fintype.toLocallyFiniteOrder
  IncidenceAlgebra.mu ℤ s t

/-- The interval `[s, t]`. -/
def ival (s t : P) : Finset P := univ.filter fun w => s ≤ w ∧ w ≤ t

@[simp] theorem mem_ival {s t w : P} : w ∈ ival s t ↔ s ≤ w ∧ w ≤ t := by simp [ival]

/-- Product in the incidence algebra. -/
def conv (a b : P → P → ℤ[X]) (s t : P) : ℤ[X] := ∑ w ∈ ival s t, a s w * b w t

/-- `a^rev`, with `a^rev_{st}(x) = x^{ρ_{st}} a_{st}(x⁻¹)`. -/
def revF (ρ : P → ℕ) (a : P → P → ℤ[X]) (s t : P) : ℤ[X] := reflect (ρ t - ρ s) (a s t)

/-- `a^sgn`. -/
def sgnF (ρ : P → ℕ) (a : P → P → ℤ[X]) (s t : P) : ℤ[X] := (-1) ^ (ρ t - ρ s) * a s t

/-- The characteristic function (Definition 2.8). -/
def chi (ρ : P → ℕ) (s t : P) : ℤ[X] := ∑ w ∈ ival s t, C (moeb s w) * X ^ (ρ t - ρ w)

/-- The kernel `(χ^rev)^sgn`. -/
def dualKernel (ρ : P → ℕ) : P → P → ℤ[X] := sgnF ρ (revF ρ (chi ρ))

/-- The reduced kernel (section 2.3): divide by `x - 1` off the diagonal, `-1` on it. -/
def reduced (κ : P → P → ℤ[X]) (s t : P) : ℤ[X] :=
  if s = t then -1 else κ s t /ₘ (X - C 1)

/-- `H = -(κ̄)⁻¹` (Definition 2.4). -/
def IsChow (κ H : P → P → ℤ[X]) : Prop :=
  ∀ s t, s ≤ t → conv H (reduced κ) s t = if s = t then -1 else 0

/-- Right Kazhdan-Lusztig-Stanley functions (Theorem 2.3); `κ = f^rev f⁻¹` is written
`κ f = f^rev`. -/
structure IsRightKLS (ρ : P → ℕ) (κ f : P → P → ℤ[X]) : Prop where
  diag : ∀ s, f s s = 1
  degree : ∀ s t, s < t → 2 * (f s t).natDegree < ρ t - ρ s
  kernel : ∀ s t, s ≤ t → conv κ f s t = revF ρ f s t

/-! ### Moebius inversion -/

theorem sum_moeb_right (s t : P) : ∑ w ∈ ival s t, moeb s w = if s = t then 1 else 0 := by
  let : LocallyFiniteOrder P := Fintype.toLocallyFiniteOrder
  rw [← IncidenceAlgebra.sum_Icc_mu_right (𝕜 := ℤ) s t]
  apply sum_congr _ (fun _ _ => rfl)
  ext w; simp

theorem sum_moeb_left (s t : P) : ∑ w ∈ ival s t, moeb w t = if s = t then 1 else 0 := by
  let : LocallyFiniteOrder P := Fintype.toLocallyFiniteOrder
  rw [← IncidenceAlgebra.sum_Icc_mu_left (𝕜 := ℤ) s t]
  apply sum_congr _ (fun _ _ => rfl)
  ext w; simp

theorem moeb_self (s : P) : moeb s s = 1 := by
  have h := sum_moeb_right s s
  have e : ival s s = {s} := by
    ext w; simp only [mem_ival, mem_singleton]
    exact ⟨fun h => le_antisymm h.2 h.1, fun h => h ▸ ⟨le_rfl, le_rfl⟩⟩
  simpa [e] using h

/-- Exchanging the two sums in a product of three incidence functions. -/
theorem sum_exchange (s t : P) (f : P → P → ℤ[X]) :
    ∑ w ∈ ival s t, ∑ u ∈ ival s w, f w u = ∑ u ∈ ival s t, ∑ w ∈ ival u t, f w u := by
  apply sum_comm'
  intro w u
  simp only [mem_ival]
  constructor
  · rintro ⟨⟨h1, h2⟩, h3, h4⟩; exact ⟨⟨h4, h2⟩, h3, h4.trans h2⟩
  · rintro ⟨⟨h1, h2⟩, h3, h4⟩; exact ⟨⟨h3.trans h1, h2⟩, h3, h1⟩

section Ranked

variable {ρ : P → ℕ} (hρ : StrictMono ρ)

include hρ

theorem rank_add {s w t : P} (h1 : s ≤ w) (h2 : w ≤ t) :
    (ρ w - ρ s) + (ρ t - ρ w) = ρ t - ρ s := by
  have := hρ.monotone h1
  have := hρ.monotone h2
  omega

private theorem reflect_sum {ι : Type*} (N : ℕ) (I : Finset ι) (f : ι → ℤ[X]) :
    reflect N (∑ i ∈ I, f i) = ∑ i ∈ I, reflect N (f i) := by
  induction I using Finset.induction_on with
  | empty => simp
  | insert a I ha ih => rw [sum_insert ha, sum_insert ha, reflect_add, ih]

/-- The dual kernel, written out. -/
theorem dualKernel_eq (s t : P) : dualKernel ρ s t =
    (-1) ^ (ρ t - ρ s) * ∑ w ∈ ival s t, C (moeb s w) * X ^ (ρ w - ρ s) := by
  rw [dualKernel, sgnF, revF, chi, reflect_sum hρ]
  congr 1
  apply sum_congr rfl
  intro w hw
  rw [mem_ival] at hw
  have h1 := hρ.monotone hw.1
  have h2 := hρ.monotone hw.2
  rw [reflect_C_mul_X_pow, revAt_le (by omega), show ρ t - ρ s - (ρ t - ρ w) = ρ w - ρ s by omega]

theorem dualKernel_self (s : P) : dualKernel ρ s s = 1 := by
  have e : ival s s = {s} := by
    ext w; simp only [mem_ival, mem_singleton]
    exact ⟨fun h => le_antisymm h.2 h.1, fun h => h ▸ ⟨le_rfl, le_rfl⟩⟩
  rw [dualKernel_eq hρ, e]
  simp [moeb_self]

theorem dualKernel_root {s t : P} (h : s < t) : (dualKernel ρ s t).IsRoot 1 := by
  rw [IsRoot, dualKernel_eq hρ, eval_mul, eval_finsetSum]
  have : ∑ w ∈ ival s t, (C (moeb s w) * X ^ (ρ w - ρ s) : ℤ[X]).eval 1 = 0 := by
    have := sum_moeb_right s t
    rw [ite_eq_right h.ne] at this
    simpa using this
  rw [this, mul_zero]

theorem reduced_mul {s t : P} (h : s ≤ t) : (X - 1) * reduced (dualKernel ρ) s t =
    dualKernel ρ s t - if s = t then X else 0 := by
  by_cases he : s = t
  · subst he
    rw [reduced, ite_eq_left rfl, ite_eq_left rfl, dualKernel_self hρ]; ring
  · have hr := mul_divByMonic_eq_iff_isRoot.2 (dualKernel_root hρ (lt_of_le_of_ne h he))
    rw [reduced, ite_eq_right he, ite_eq_right he, sub_zero]
    simpa using hr

/-- `Σ (-x)^{ρ_{sw}} κ_{wt} = (-1)^{ρ_{st}}`. -/
theorem char_kernel {s t : P} (h : s ≤ t) :
    ∑ w ∈ ival s t, (-X) ^ (ρ w - ρ s) * dualKernel ρ w t = (-1) ^ (ρ t - ρ s) := by
  have e : ∀ w ∈ ival s t, (-X : ℤ[X]) ^ (ρ w - ρ s) * dualKernel ρ w t =
      ∑ u ∈ ival w t, (-1) ^ (ρ t - ρ s) * (C (moeb w u) * X ^ (ρ u - ρ s)) := by
    intro w hw
    rw [mem_ival] at hw
    rw [dualKernel_eq hρ, neg_pow, ← mul_sum, mul_sum, mul_sum, mul_sum]
    apply sum_congr rfl
    intro u hu
    rw [mem_ival] at hu
    rw [← rank_add hρ hw.1 hw.2, ← rank_add hρ hw.1 hu.1, pow_add, pow_add]; ring
  rw [sum_congr rfl e, ← sum_exchange s t
    (fun u w => (-1) ^ (ρ t - ρ s) * (C (moeb w u) * X ^ (ρ u - ρ s)))]
  have e2 : ∀ u ∈ ival s t, ∑ w ∈ ival s u,
      ((-1) ^ (ρ t - ρ s) * (C (moeb w u) * X ^ (ρ u - ρ s)) : ℤ[X]) =
      if s = u then (-1) ^ (ρ t - ρ s) else 0 := by
    intro u _
    rw [← mul_sum, ← sum_mul, ← map_sum, sum_moeb_left]
    by_cases hsu : s = u
    · subst hsu; simp
    · simp [hsu]
  rw [sum_congr rfl e2, sum_ite_eq, ite_eq_left (by simp [h])]

/-- `μ^sgn` is a right Kazhdan-Lusztig-Stanley function of the dual kernel. -/
theorem moeb_isRightKLS :
    IsRightKLS ρ (dualKernel ρ) (fun s t => (-1) ^ (ρ t - ρ s) * C (moeb s t)) where
  diag s := by simp [moeb_self]
  degree s t h := by
    have h1 := hρ h
    have e : ((-1 : ℤ[X]) ^ (ρ t - ρ s) * C (moeb s t)) = C ((-1) ^ (ρ t - ρ s) * moeb s t) := by
      simp
    rw [e, natDegree_C]; omega
  kernel s t h := by
    have e : ((-1 : ℤ[X]) ^ (ρ t - ρ s) * C (moeb s t)) = C ((-1) ^ (ρ t - ρ s) * moeb s t) := by
      simp
    rw [conv, revF, e, reflect_C]
    have e1 : ∀ w ∈ ival s t, dualKernel ρ s w * ((-1) ^ (ρ t - ρ w) * C (moeb w t)) =
        ∑ u ∈ ival s w, (-1) ^ (ρ t - ρ s) * (C (moeb s u) * X ^ (ρ u - ρ s)) * C (moeb w t) := by
      intro w hw
      rw [mem_ival] at hw
      rw [dualKernel_eq hρ, ← rank_add hρ hw.1 hw.2, pow_add, ← sum_mul, ← mul_sum]; ring
    rw [sum_congr rfl e1, sum_exchange s t
      (fun w u => (-1) ^ (ρ t - ρ s) * (C (moeb s u) * X ^ (ρ u - ρ s)) * C (moeb w t))]
    have e2 : ∀ u ∈ ival s t, ∑ w ∈ ival u t,
        ((-1) ^ (ρ t - ρ s) * (C (moeb s u) * X ^ (ρ u - ρ s)) * C (moeb w t) : ℤ[X]) =
        if u = t then (-1) ^ (ρ t - ρ s) * (C (moeb s t) * X ^ (ρ t - ρ s)) else 0 := by
      intro u _
      rw [← mul_sum, ← map_sum, sum_moeb_left]
      by_cases hut : u = t
      · subst hut; simp
      · simp [hut]
    rw [sum_congr rfl e2, sum_ite_eq', ite_eq_left (by simp [h])]
    simp; ring

/-- A polynomial of degree less than half its reflection bound that is self-reflected is zero. -/
private theorem eq_zero_of_reflect {N : ℕ} {g : ℤ[X]} (hd : 2 * g.natDegree < N)
    (hr : reflect N g = g) : g = 0 := by
  ext i
  rw [coeff_zero]
  by_cases hi : i ≤ g.natDegree
  · have := congrArg (fun p => p.coeff i) hr
    simp only [coeff_reflect] at this
    rw [← this, revAt_le (by omega)]
    exact coeff_eq_zero_of_natDegree_lt (by omega)
  · exact coeff_eq_zero_of_natDegree_lt (by omega)

/-- Right Kazhdan-Lusztig-Stanley functions of the dual kernel are unique. -/
theorem rightKLS_unique {f g : P → P → ℤ[X]} (hf : IsRightKLS ρ (dualKernel ρ) f)
    (hg : IsRightKLS ρ (dualKernel ρ) g) {s t : P} (h : s ≤ t) : f s t = g s t := by
  obtain ⟨n, hn⟩ : ∃ n, n = ρ t - ρ s := ⟨_, rfl⟩
  induction n using Nat.strong_induction_on generalizing s with
  | _ n ih =>
    by_cases he : s = t
    · subst he; rw [hf.diag, hg.diag]
    have hlt := lt_of_le_of_ne h he
    have hs : s ∈ ival s t := by simp [h]
    have key : f s t - revF ρ f s t = g s t - revF ρ g s t := by
      have h1 := hf.kernel s t h
      have h2 := hg.kernel s t h
      rw [conv, ← add_sum_erase _ _ hs, dualKernel_self hρ, one_mul] at h1 h2
      have h3 : ∑ w ∈ (ival s t).erase s, dualKernel ρ s w * f w t =
          ∑ w ∈ (ival s t).erase s, dualKernel ρ s w * g w t := by
        apply sum_congr rfl
        intro w hw
        simp only [mem_erase, mem_ival] at hw
        have hsw := hρ (lt_of_le_of_ne hw.2.1 (Ne.symm hw.1))
        have hwt := hρ.monotone hw.2.2
        rw [ih (ρ t - ρ w) (by omega) hw.2.2 rfl]
      rw [h3] at h1
      rw [← h1, ← h2]; ring
    have hz : f s t - g s t = 0 := by
      apply eq_zero_of_reflect (N := ρ t - ρ s) hρ
      · have a := hf.degree s t hlt
        have b := hg.degree s t hlt
        have := natDegree_sub_le (f s t) (g s t)
        omega
      · rw [reflect_sub]
        simp only [revF] at key
        linear_combination -key
    exact sub_eq_zero.1 hz

end Ranked

/-! ### Existence of the Chow function -/

/-- The Chow function, by recursion on the upper end. -/
def chowRec (κ : P → P → ℤ[X]) (s t : P) : ℤ[X] :=
  if s = t then 1 else ∑ w : {w : P // s ≤ w ∧ w < t}, chowRec κ s w.1 * reduced κ w.1 t
termination_by (univ.filter fun w => w < t).card
decreasing_by
  apply card_lt_card
  refine ⟨fun z hz => ?_, fun h => ?_⟩
  · simp only [mem_filter, mem_univ, true_and] at hz ⊢
    exact hz.trans w.2.2
  · have := h (show w.1 ∈ _ by simpa using w.2.2)
    simp at this

theorem exists_isChow (κ : P → P → ℤ[X]) : ∃ H, IsChow κ H := by
  refine ⟨chowRec κ, fun s t h => ?_⟩
  have ht : t ∈ ival s t := by simp [h]
  have hd : reduced κ t t = -1 := by simp [reduced]
  rw [conv, ← add_sum_erase _ _ ht, hd]
  by_cases he : s = t
  · subst he
    have e : (ival s s).erase s = ∅ := by
      ext w; simp only [mem_erase, mem_ival, notMem_empty, iff_false]
      rintro ⟨h1, h2⟩; exact h1 (le_antisymm h2.2 h2.1)
    rw [e, chowRec]; simp
  · rw [chowRec, ite_eq_right he, ite_eq_right he]
    have : ∑ w ∈ (ival s t).erase t, chowRec κ s w * reduced κ w t =
        ∑ w : {w : P // s ≤ w ∧ w < t}, chowRec κ s w.1 * reduced κ w.1 t :=
      sum_subtype _ (by
        intro w; simp only [mem_erase, mem_ival]
        exact ⟨fun h => ⟨h.2.1, lt_of_le_of_ne h.2.2 h.1⟩, fun h => ⟨h.2.ne, h.1, h.2.le⟩⟩)
        (fun w => chowRec κ s w * reduced κ w t)
    rw [this]; ring

/-- Chow functions are unique. -/
theorem isChow_unique {κ H K : P → P → ℤ[X]} (hH : IsChow κ H) (hK : IsChow κ K) {s t : P}
    (h : s ≤ t) : H s t = K s t := by
  obtain ⟨n, hn⟩ : ∃ n, n = (univ.filter fun w => w < t).card := ⟨_, rfl⟩
  induction n using Nat.strong_induction_on generalizing t with
  | _ n ih =>
    have ht : t ∈ ival s t := by simp [h]
    have hd : reduced κ t t = -1 := by simp [reduced]
    have h1 := hH s t h
    have h2 := hK s t h
    rw [conv, ← add_sum_erase _ _ ht, hd] at h1 h2
    have h3 : ∑ w ∈ (ival s t).erase t, H s w * reduced κ w t =
        ∑ w ∈ (ival s t).erase t, K s w * reduced κ w t := by
      apply sum_congr rfl
      intro w hw
      simp only [mem_erase, mem_ival] at hw
      have hwt := lt_of_le_of_ne hw.2.2 hw.1
      rw [ih (univ.filter fun v => v < w).card ?_ hw.2.1 rfl]
      rw [hn]
      apply card_lt_card
      refine ⟨fun z hz => ?_, fun hh => ?_⟩
      · simp only [mem_filter, mem_univ, true_and] at hz ⊢; exact hz.trans hwt
      · have := hh (show w ∈ _ by simpa using hwt)
        simp at this
    rw [h3] at h1
    have := h1.trans h2.symm
    linear_combination -this

/-! ### The bridge -/

section Bot

variable [OrderBot P] {ρ : P → ℕ} (hρ : StrictMono ρ)

include hρ

theorem ival_bot (t : P) : ival ⊥ t = univ.filter fun w => w ≤ t := by ext; simp

/-- The recursion of Proposition 4.6, as one sum. -/
theorem Fstar_sum (t : P) : ∑ w ∈ ival ⊥ t, Fstar ρ w * ((-1) ^ (ρ t - ρ w) *
    geo (ρ t - ρ w + 1)) = if t = ⊥ then 1 else 0 := by
  by_cases ht : t = ⊥
  · subst ht
    have e : ival (⊥ : P) ⊥ = {⊥} := by ext; simp
    rw [e, sum_singleton, Fstar_bot, ite_eq_left rfl]; simp [geo]
  · have hsplit : ival ⊥ t = insert t (univ.filter fun w => w < t) := by
      ext y; simp only [mem_ival, bot_le, true_and, mem_insert, mem_filter, mem_univ]
      exact le_iff_eq_or_lt
    rw [hsplit, sum_insert (by simp), ite_eq_right ht, Fstar_rec ρ ht]
    simp only [Nat.sub_self, pow_zero, zero_add, one_mul]
    have : geo 1 = 1 := by simp [geo]
    rw [this, mul_one, neg_add_eq_zero]
    exact sum_congr rfl fun w _ => by ring

/-- Our `Hstar` is the bottom row of the Chow function of the dual kernel. -/
theorem Hstar_row (t : P) : ∑ w ∈ ival ⊥ t, Hstar ρ w * reduced (dualKernel ρ) w t =
    if t = ⊥ then -1 else 0 := by
  have hX : (X - 1 : ℤ[X]) ≠ 0 := by
    have := X_sub_C_ne_zero (1 : ℤ); simpa using this
  apply mul_left_cancel₀ hX
  have e1 : ∀ w ∈ ival ⊥ t, (X - 1) * (Hstar ρ w * reduced (dualKernel ρ) w t) =
      Hstar ρ w * dualKernel ρ w t - if w = t then Hstar ρ t * X else 0 := by
    intro w hw
    rw [mem_ival] at hw
    have := reduced_mul hρ hw.2
    by_cases hwt : w = t
    · subst hwt
      rw [ite_eq_left rfl] at this ⊢
      linear_combination Hstar ρ w * this
    · rw [ite_eq_right hwt] at this ⊢
      linear_combination Hstar ρ w * this
  rw [mul_sum, sum_congr rfl e1, sum_sub_distrib, sum_ite_eq', ite_eq_left (by simp)]
  have e2 : ∑ w ∈ ival ⊥ t, Hstar ρ w * dualKernel ρ w t =
      ∑ u ∈ ival ⊥ t, Fstar ρ u * (-1) ^ (ρ t - ρ u) := by
    have e3 : ∀ w ∈ ival ⊥ t, Hstar ρ w * dualKernel ρ w t =
        ∑ u ∈ ival ⊥ w, Fstar ρ u * ((-X) ^ (ρ w - ρ u) * dualKernel ρ w t) := by
      intro w _
      rw [Hstar, ← ival_bot hρ, sum_mul]
      exact sum_congr rfl fun u _ => by ring
    rw [sum_congr rfl e3, sum_exchange ⊥ t
      (fun w u => Fstar ρ u * ((-X) ^ (ρ w - ρ u) * dualKernel ρ w t))]
    apply sum_congr rfl
    intro u hu
    rw [mem_ival] at hu
    rw [← mul_sum, char_kernel hρ hu.2]
  rw [e2, Hstar, ← ival_bot hρ, sum_mul, ← sum_sub_distrib]
  have e4 : ∀ u ∈ ival ⊥ t, Fstar ρ u * (-1) ^ (ρ t - ρ u) -
      Fstar ρ u * (-X) ^ (ρ t - ρ u) * X =
      -(X - 1) * (Fstar ρ u * ((-1) ^ (ρ t - ρ u) * geo (ρ t - ρ u + 1))) := by
    intro u _
    have hg : geo (ρ t - ρ u + 1) * (X - 1) = X ^ (ρ t - ρ u + 1) - 1 := by
      rw [geo, geom_sum_mul]
    rw [neg_pow (X : ℤ[X])]
    linear_combination Fstar ρ u * (-1) ^ (ρ t - ρ u) * hg
  rw [sum_congr rfl e4, ← mul_sum, Fstar_sum hρ]
  split_ifs <;> ring

/-- **Bridge, dual Chow function.** -/
theorem chow_eq_Hstar {H : P → P → ℤ[X]} (hH : IsChow (dualKernel ρ) H) (x : P) :
    H ⊥ x = Hstar ρ x := by
  obtain ⟨n, hn⟩ : ∃ n, n = ρ x := ⟨_, rfl⟩
  induction n using Nat.strong_induction_on generalizing x with
  | _ n ih =>
    have hx : x ∈ ival ⊥ x := by simp
    have hd : reduced (dualKernel ρ) x x = -1 := by simp [reduced]
    have h1 := hH ⊥ x bot_le
    have h2 := Hstar_row hρ x
    rw [conv, ← add_sum_erase _ _ hx, hd] at h1
    rw [← add_sum_erase _ _ hx, hd] at h2
    have h3 : ∑ w ∈ (ival ⊥ x).erase x, H ⊥ w * reduced (dualKernel ρ) w x =
        ∑ w ∈ (ival ⊥ x).erase x, Hstar ρ w * reduced (dualKernel ρ) w x := by
      apply sum_congr rfl
      intro w hw
      simp only [mem_erase, mem_ival] at hw
      have := hρ (lt_of_le_of_ne hw.2.2 hw.1)
      rw [ih (ρ w) (by omega) w rfl]
    rw [h3] at h1
    have h4 : (if (⊥ : P) = x then (-1 : ℤ[X]) else 0) = if x = ⊥ then -1 else 0 := by
      simp only [eq_comm]
    rw [h4] at h1
    have := h1.trans h2.symm
    linear_combination -this

/-- **Bridge, dual right augmented Chow function.** -/
theorem augmented_eq_Fstar {H f : P → P → ℤ[X]} (hH : IsChow (dualKernel ρ) H)
    (hf : IsRightKLS ρ (dualKernel ρ) f) (x : P) : conv H (revF ρ f) ⊥ x = Fstar ρ x := by
  have e1 : ∀ w ∈ ival ⊥ x, H ⊥ w * revF ρ f w x =
      ∑ u ∈ ival ⊥ w, Fstar ρ u * ((-X) ^ (ρ w - ρ u) * ((-X) ^ (ρ x - ρ w) * C (moeb w x))) := by
    intro w hw
    rw [mem_ival] at hw
    have hfw : f w x = C ((-1) ^ (ρ x - ρ w) * moeb w x) := by
      rw [rightKLS_unique hρ hf (moeb_isRightKLS hρ) hw.2]; simp
    rw [chow_eq_Hstar hρ hH, revF, hfw, reflect_C, Hstar, ← ival_bot hρ, sum_mul]
    apply sum_congr rfl
    intro u _
    rw [neg_pow (X : ℤ[X]) (ρ x - ρ w)]
    simp only [C_mul, C_pow, C_neg, C_1]; ring
  rw [conv, sum_congr rfl e1, sum_exchange ⊥ x (fun w u => Fstar ρ u *
    ((-X) ^ (ρ w - ρ u) * ((-X) ^ (ρ x - ρ w) * C (moeb w x))))]
  have e2 : ∀ u ∈ ival ⊥ x, ∑ w ∈ ival u x, Fstar ρ u *
      ((-X) ^ (ρ w - ρ u) * ((-X) ^ (ρ x - ρ w) * C (moeb w x))) =
      if u = x then Fstar ρ x else 0 := by
    intro u hu
    have e3 : ∀ w ∈ ival u x, Fstar ρ u *
        ((-X) ^ (ρ w - ρ u) * ((-X) ^ (ρ x - ρ w) * C (moeb w x))) =
        Fstar ρ u * (-X) ^ (ρ x - ρ u) * C (moeb w x) := by
      intro w hw
      rw [mem_ival] at hw
      rw [← rank_add hρ hw.1 hw.2, pow_add]; ring
    rw [sum_congr rfl e3, ← mul_sum, ← map_sum, sum_moeb_left]
    by_cases hux : u = x
    · subst hux; simp
    · simp [hux]
  rw [sum_congr rfl e2, sum_ite_eq', ite_eq_left (by simp)]

end Bot

/-! ### Matroids -/

variable {E : Type*} [Finite E] (M : Matroid E)

/-- The dual Chow polynomial of the lattice of flats, by the kernel definition. -/
theorem dualChow_eq_kernel {H : Flats M → Flats M → ℤ[X]}
    (hH : IsChow (dualKernel (flatRk M)) H) : H ⊥ ⊤ = dualChow M :=
  chow_eq_Hstar (flatSystem M).rk_mono hH ⊤

/-- The dual right augmented Chow polynomial, by the kernel definition. -/
theorem dualAug_eq_kernel {H f : Flats M → Flats M → ℤ[X]}
    (hH : IsChow (dualKernel (flatRk M)) H) (hf : IsRightKLS (flatRk M) (dualKernel (flatRk M)) f) :
    conv H (revF (flatRk M) f) ⊥ ⊤ = dualAug M :=
  augmented_eq_Fstar (flatSystem M).rk_mono hH hf ⊤

/-- The objects in the two statements above exist. -/
theorem exists_kernel_functions : ∃ H f : Flats M → Flats M → ℤ[X],
    IsChow (dualKernel (flatRk M)) H ∧ IsRightKLS (flatRk M) (dualKernel (flatRk M)) f := by
  obtain ⟨H, hH⟩ := exists_isChow (dualKernel (flatRk M))
  exact ⟨H, _, hH, moeb_isRightKLS (flatSystem M).rk_mono⟩

end
end CaioloFerroniHoster.Ranks
