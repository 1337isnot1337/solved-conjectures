module

public import Mathlib.Data.Fintype.EquivFin
public import Mathlib.Data.Nat.ModEq
public import Mathlib.Data.ZMod.Basic
public import Mathlib.Order.Interval.Finset.Nat
public import Mathlib.Tactic

/-! A three-generator Apéry certificate for the Waring symmetry disproof. -/

@[expose] public section

namespace BenfieldLippardSymmetry

open Finset

/-- The two residue-preserving reductions and determinant of an L-shaped
Apéry set for the three-generator monoid with generators `x, y, z`. -/
structure Shape where
  x : ℕ
  y : ℕ
  z : ℕ
  L : ℕ
  U : ℕ
  V : ℕ
  H : ℕ
  hx : 0 < x
  hy : 0 < y
  hz : 0 < z
  hV : 0 < V
  hU : 0 < U
  hVL : V < L
  hUH : U < H
  hcard : L * H - U * V = x
  hL : U * z < L * y
  hH : V * y < H * z
  hLmod : L * y ≡ U * z [MOD x]
  hHmod : H * z ≡ V * y [MOD x]
  hcop : Nat.gcd x (Nat.gcd y z) = 1

namespace Shape

variable (s : Shape)

def weight (i j : ℕ) : ℕ := i * s.y + j * s.z

def Represented (n : ℕ) : Prop := ∃ k i j : ℕ, n = s.x * k + s.weight i j

def Good (i j : ℕ) : Prop :=
  i < s.L ∧ j < s.H ∧ (i < s.L - s.V ∨ j < s.H - s.U)

theorem represented_zero : s.Represented 0 := ⟨0, 0, 0, by simp [weight]⟩

theorem represented_add {m n : ℕ} (hm : s.Represented m) (hn : s.Represented n) :
    s.Represented (m + n) := by
  obtain ⟨k, i, j, rfl⟩ := hm
  obtain ⟨k', i', j', rfl⟩ := hn
  refine ⟨k + k', i + i', j + j', ?_⟩
  unfold weight
  ring

theorem represented_mul {n : ℕ} (hn : s.Represented n) (r : ℕ) : s.Represented (n * r) := by
  obtain ⟨k, i, j, rfl⟩ := hn
  refine ⟨k * r, i * r, j * r, ?_⟩
  unfold weight
  ring

private theorem weight_add (i j i' j' : ℕ) :
    s.weight (i + i') (j + j') = s.weight i j + s.weight i' j' := by unfold weight; ring

private theorem exists_step {i j u v u' v' : ℕ} (hi : u ≤ i) (hj : v ≤ j)
    (hdec : s.weight u' v' < s.weight u v)
    (hmod : s.weight u' v' ≡ s.weight u v [MOD s.x]) :
    ∃ i' j' : ℕ, s.weight i' j' < s.weight i j ∧ s.weight i' j' ≡ s.weight i j [MOD s.x] := by
  have he : s.weight i j = s.weight (i - u) (j - v) + s.weight u v := by
    rw [← s.weight_add, Nat.sub_add_cancel hi, Nat.sub_add_cancel hj]
  refine ⟨i - u + u', j - v + v', ?_, ?_⟩
  · simpa only [he, s.weight_add] using Nat.add_lt_add_left hdec (s.weight (i - u) (j - v))
  · rw [he, s.weight_add]
    exact hmod.add_left _

private theorem corner_reduction :
    s.weight (s.L - s.V) (s.H - s.U) ≡ 0 [MOD s.x] := by
  have h : s.L * s.y + s.H * s.z ≡ s.V * s.y + s.U * s.z [MOD s.x] := by
    simpa [Nat.add_comm (s.U * s.z)] using s.hLmod.add s.hHmod
  have he : s.weight (s.L - s.V) (s.H - s.U) + (s.V * s.y + s.U * s.z) =
      s.L * s.y + s.H * s.z := by
    simpa [weight, Nat.sub_add_cancel s.hVL.le, Nat.sub_add_cancel s.hUH.le] using
      (s.weight_add (s.L - s.V) (s.H - s.U) s.V s.U).symm
  apply Nat.ModEq.add_right_cancel' (s.V * s.y + s.U * s.z)
  simpa only [he, zero_add] using h

theorem reduce_weight (i j : ℕ) :
    ∃ i' j' : ℕ, s.Good i' j' ∧ s.weight i' j' ≤ s.weight i j ∧
      s.weight i' j' ≡ s.weight i j [MOD s.x] := by
  suffices h : ∀ n : ℕ, ∀ i j : ℕ, s.weight i j = n →
      ∃ i' j' : ℕ, s.Good i' j' ∧ s.weight i' j' ≤ n ∧ s.weight i' j' ≡ n [MOD s.x] by
    exact h _ _ _ rfl
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro i j hn
    by_cases h : s.Good i j
    · exact ⟨i, j, h, hn.le, hn ▸ Nat.ModEq.refl _⟩
    have hstep :
        ∃ i' j' : ℕ, s.weight i' j' < s.weight i j ∧ s.weight i' j' ≡ s.weight i j [MOD s.x] := by
      by_cases hi : s.L ≤ i
      · exact s.exists_step hi (Nat.zero_le _) (u' := 0) (v' := s.U)
          (by simpa [weight] using s.hL) (by simpa [weight] using s.hLmod.symm)
      by_cases hj : s.H ≤ j
      · exact s.exists_step (Nat.zero_le _) hj (u' := s.V) (v' := 0)
          (by simpa [weight] using s.hH) (by simpa [weight] using s.hHmod.symm)
      have hcorner : s.L - s.V ≤ i ∧ s.H - s.U ≤ j := by
        by_contra! h'
        exact h ⟨by omega, by omega, by omega⟩
      exact s.exists_step hcorner.1 hcorner.2 (u' := 0) (v' := 0)
        (by
          have hp := Nat.mul_pos (Nat.sub_pos_of_lt s.hVL) s.hy
          simp only [weight, zero_mul, zero_add]
          omega)
        (by simpa [weight] using s.corner_reduction.symm)
    obtain ⟨i', j', hij, hmod⟩ := hstep
    obtain ⟨a, b, hab, hle, hmod'⟩ := ih _ (hij.trans_le hn.le) _ _ rfl
    exact ⟨a, b, hab, hle.trans (hij.trans_le hn.le).le, hmod'.trans (hn ▸ hmod)⟩

private def rectangle : Finset (ℕ × ℕ) :=
  (range s.L ×ˢ range s.H) \ (Ico (s.L - s.V) s.L ×ˢ Ico (s.H - s.U) s.H)

private theorem mem_rectangle (i j : ℕ) : (i, j) ∈ s.rectangle ↔ s.Good i j := by
  simp only [rectangle, mem_sdiff, mem_product, mem_range, Finset.mem_Ico, Good]
  omega

private theorem card_rectangle : s.rectangle.card = s.x := by
  unfold rectangle
  rw [card_sdiff_of_subset]
  · rw [card_product, card_product, card_range, card_range, Nat.card_Ico, Nat.card_Ico,
      Nat.sub_sub_self s.hVL.le, Nat.sub_sub_self s.hUH.le, Nat.mul_comm s.V s.U, s.hcard]
  · intro p hp
    simp only [mem_product, Finset.mem_Ico, mem_range] at hp ⊢
    exact ⟨hp.1.2, hp.2.2⟩

private theorem all_residues (r : ℕ) :
    ∃ i j : ℕ, s.weight i j ≡ r [MOD s.x] := by
  let _ : NeZero s.x := ⟨s.hx.ne'⟩
  let g := Nat.gcd s.y s.z
  have e₁ := Nat.gcd_eq_gcd_ab s.x g
  have e₂ := Nat.gcd_eq_gcd_ab s.y s.z
  change (Nat.gcd s.x g : ℤ) = _ at e₁
  have hc : Nat.gcd s.x g = 1 := s.hcop
  rw [hc] at e₁
  have e₃ :
      (1 : ℤ) = (s.x : ℤ) * s.x.gcdA g + (s.y : ℤ) * (s.y.gcdA s.z * s.x.gcdB g) +
        (s.z : ℤ) * (s.y.gcdB s.z * s.x.gcdB g) := by
    change ((1 : ℕ) : ℤ) = _
    rw [e₁, show (g : ℤ) = _ from e₂]
    ring
  have e₄ := congrArg (fun n : ℤ => (n : ZMod s.x)) e₃
  push_cast at e₄
  simp only [ZMod.natCast_self, zero_mul, zero_add] at e₄
  let i : ZMod s.x := (r : ZMod s.x) * (s.y.gcdA s.z : ZMod s.x) * (s.x.gcdB g : ZMod s.x)
  let j : ZMod s.x := (r : ZMod s.x) * (s.y.gcdB s.z : ZMod s.x) * (s.x.gcdB g : ZMod s.x)
  refine ⟨i.val, j.val, (ZMod.natCast_eq_natCast_iff _ _ _).mp ?_⟩
  simp only [weight, Nat.cast_add, Nat.cast_mul, ZMod.natCast_zmod_val]
  dsimp [i, j]
  calc
    _ = (r : ZMod s.x) * ((s.y : ZMod s.x) * (↑(s.y.gcdA s.z) * ↑(s.x.gcdB g)) +
      (s.z : ZMod s.x) * (↑(s.y.gcdB s.z) * ↑(s.x.gcdB g))) := by ring
    _ = r := by rw [← e₄, mul_one]

private def residue (q : s.rectangle) : Fin s.x :=
  ⟨s.weight q.val.1 q.val.2 % s.x, Nat.mod_lt _ s.hx⟩

private theorem residue_bijective : Function.Bijective s.residue := by
  apply (Fintype.bijective_iff_surjective_and_card _).mpr
  refine ⟨?_, by simp [s.card_rectangle]⟩
  intro r
  obtain ⟨i, j, hj⟩ := s.all_residues r
  obtain ⟨i', j', hgood, _, hmod⟩ := s.reduce_weight i j
  refine ⟨⟨(i', j'), (s.mem_rectangle _ _).mpr hgood⟩, Fin.ext ?_⟩
  exact Eq.trans (hmod.trans hj) (Nat.mod_eq_of_lt r.isLt)

private theorem good_eq_of_mod {i j a b : ℕ} (h1 : s.Good i j) (h2 : s.Good a b)
    (he : s.weight i j ≡ s.weight a b [MOD s.x]) : (i, j) = (a, b) := by
  let q : s.rectangle := ⟨(i, j), (s.mem_rectangle _ _).mpr h1⟩
  let r : s.rectangle := ⟨(a, b), (s.mem_rectangle _ _).mpr h2⟩
  exact congrArg Subtype.val (s.residue_bijective.injective (show s.residue q = s.residue r from Fin.ext he))

private theorem exists_good_mod (n : ℕ) :
    ∃ i j : ℕ, s.Good i j ∧ s.weight i j ≡ n [MOD s.x] := by
  obtain ⟨i, j, hmod⟩ := s.all_residues n
  obtain ⟨a, b, hgood, _, he⟩ := s.reduce_weight i j
  exact ⟨a, b, hgood, he.trans hmod⟩

theorem represented_iff_of_good_mod {n i j : ℕ} (hg : s.Good i j)
    (hmod : s.weight i j ≡ n [MOD s.x]) :
    s.Represented n ↔ s.weight i j ≤ n := by
  constructor
  · rintro ⟨k, a, b, rfl⟩
    obtain ⟨i', j', hg', hle, he⟩ := s.reduce_weight a b
    have hab : s.weight a b ≡ s.x * k + s.weight a b [MOD s.x] := by
      simp [Nat.ModEq, Nat.add_mod]
    obtain ⟨rfl, rfl⟩ := Prod.mk.inj (s.good_eq_of_mod hg hg' (hmod.trans (he.trans hab).symm))
    exact hle.trans (Nat.le_add_left _ _)
  · intro hn
    have hd : s.x ∣ n - s.weight i j := by
      have hh := Nat.ModEq.sub hn le_rfl hmod.symm (Nat.ModEq.refl (s.weight i j))
      simpa [Nat.modEq_zero_iff_dvd] using hh
    obtain ⟨k, hk⟩ := hd
    exact ⟨k, i, j, by omega⟩

/-- The two top corners of the irreducible L-shaped set. -/
def W₁ : ℕ := s.weight (s.L - 1) (s.H - s.U - 1)
def W₂ : ℕ := s.weight (s.L - s.V - 1) (s.H - 1)
def W : ℕ := max s.W₁ s.W₂

private theorem good₁ : s.Good (s.L - 1) (s.H - s.U - 1) := by
  have := s.hVL
  have := s.hUH
  unfold Good
  omega

private theorem good₂ : s.Good (s.L - s.V - 1) (s.H - 1) := by
  have := s.hVL
  have := s.hUH
  unfold Good
  omega

private theorem weight_le_W {i j : ℕ} (h : s.Good i j) : s.weight i j ≤ s.W := by
  obtain ⟨hi, hj, hr | hr⟩ := h
  · exact (Nat.add_le_add (Nat.mul_le_mul_right s.y (by omega : i ≤ s.L - s.V - 1))
      (Nat.mul_le_mul_right s.z (by omega : j ≤ s.H - 1))).trans (le_max_right _ _)
  · exact (Nat.add_le_add (Nat.mul_le_mul_right s.y (by omega : i ≤ s.L - 1))
      (Nat.mul_le_mul_right s.z (by omega : j ≤ s.H - s.U - 1))).trans (le_max_left _ _)

theorem represented_above {n : ℕ} (hn : s.W - s.x < n) (hW : s.x ≤ s.W) : s.Represented n := by
  obtain ⟨i, j, hgood, hmod⟩ := s.exists_good_mod n
  apply (s.represented_iff_of_good_mod hgood hmod).mpr
  by_contra! hlt
  have hd : s.x ∣ s.weight i j - n := by
    have hh := Nat.ModEq.sub hlt.le le_rfl hmod (Nat.ModEq.refl n)
    simpa [Nat.modEq_zero_iff_dvd] using hh
  have hbound := s.weight_le_W hgood
  have hdx := Nat.le_of_dvd (by omega : 0 < s.weight i j - n) hd
  omega

private theorem corner_gap {i j : ℕ} (hg : s.Good i j) (hpos : s.x < s.weight i j) :
    ¬ s.Represented (s.weight i j - s.x) := by
  have hmod : s.weight i j ≡ s.weight i j - s.x [MOD s.x] := by
    show s.weight i j % s.x = (s.weight i j - s.x) % s.x
    have he := Nat.sub_add_cancel hpos.le
    conv_lhs => rw [← he, Nat.add_mod_right]
  exact fun h => by
    have := (s.represented_iff_of_good_mod hg hmod).mp h
    have := s.hx
    omega

theorem W_gap (hW₁ : s.x < s.W₁) (hW₂ : s.x < s.W₂) : ¬ s.Represented (s.W - s.x) := by
  by_cases h : s.W₁ ≤ s.W₂
  · rw [W, max_eq_right h]
    exact s.corner_gap s.good₂ hW₂
  · rw [W, max_eq_left (le_of_not_ge h)]
    exact s.corner_gap s.good₁ hW₁

private theorem corners_difference : s.W₂ + s.V * s.y = s.W₁ + s.U * s.z := by
  have hL : s.L - 1 = s.L - s.V - 1 + s.V := by have := s.hVL; omega
  have hH : s.H - 1 = s.H - s.U - 1 + s.U := by have := s.hUH; omega
  rw [W₁, W₂, weight, weight, hL, hH]
  ring

private theorem gap_diff₂₁ (h : s.W₁ < s.W₂) : ¬ s.Represented (s.W₂ - s.W₁) := by
  let d := s.W₂ - s.W₁
  have he : d + s.V * s.y = s.U * s.z := by have := s.corners_difference; dsimp [d]; omega
  have hL : s.weight (s.L - s.V) 0 + s.V * s.y = s.L * s.y := by
    simp only [weight, zero_mul, add_zero]
    rw [← Nat.add_mul, Nat.sub_add_cancel s.hVL.le]
  have hmod : s.weight (s.L - s.V) 0 ≡ d [MOD s.x] := by
    apply Nat.ModEq.add_right_cancel' (s.V * s.y)
    rw [he, hL]
    exact s.hLmod
  have hg : s.Good (s.L - s.V) 0 := by
    have := s.hV
    have := s.hVL
    have := s.hUH
    unfold Good
    omega
  have hlt : d < s.weight (s.L - s.V) 0 := by
    exact Nat.lt_of_add_lt_add_right (show d + s.V * s.y < s.weight (s.L - s.V) 0 + s.V * s.y by
      rw [he, hL]
      exact s.hL)
  exact fun hr => (not_lt_of_ge ((s.represented_iff_of_good_mod hg hmod).mp hr)) hlt

private theorem gap_diff₁₂ (h : s.W₂ < s.W₁) : ¬ s.Represented (s.W₁ - s.W₂) := by
  let d := s.W₁ - s.W₂
  have he : d + s.U * s.z = s.V * s.y := by have := s.corners_difference; dsimp [d]; omega
  have hH : s.weight 0 (s.H - s.U) + s.U * s.z = s.H * s.z := by
    simp only [weight, zero_mul, zero_add]
    rw [← Nat.add_mul, Nat.sub_add_cancel s.hUH.le]
  have hmod : s.weight 0 (s.H - s.U) ≡ d [MOD s.x] := by
    apply Nat.ModEq.add_right_cancel' (s.U * s.z)
    rw [he, hH]
    exact s.hHmod
  have hg : s.Good 0 (s.H - s.U) := by
    have := s.hU
    have := s.hUH
    have := s.hVL
    unfold Good
    omega
  have hlt : d < s.weight 0 (s.H - s.U) := by
    exact Nat.lt_of_add_lt_add_right (show d + s.U * s.z < s.weight 0 (s.H - s.U) + s.U * s.z by
      rw [he, hH]
      exact s.hH)
  exact fun hr => (not_lt_of_ge ((s.represented_iff_of_good_mod hg hmod).mp hr)) hlt

/-- Two positive gaps add up to the largest gap. -/
theorem reflected_gaps (hW₁ : s.x < s.W₁) (hW₂ : s.x < s.W₂) (hd : s.W₁ ≠ s.W₂) :
    ∃ m n : ℕ, 0 < m ∧ 0 < n ∧ ¬ s.Represented m ∧ ¬ s.Represented n ∧ m + n = s.W - s.x := by
  rcases lt_or_gt_of_ne hd with h | h
  · refine ⟨s.W₁ - s.x, s.W₂ - s.W₁, by omega, by omega,
      s.corner_gap s.good₁ hW₁, s.gap_diff₂₁ h, ?_⟩
    rw [W, max_eq_right h.le]
    omega
  · refine ⟨s.W₂ - s.x, s.W₁ - s.W₂, by omega, by omega,
      s.corner_gap s.good₂ hW₂, s.gap_diff₁₂ h, ?_⟩
    rw [W, max_eq_left h.le]
    omega

end Shape
end BenfieldLippardSymmetry
