import Conjectures.LonelinessNormalization
import Conjectures.LonelinessModularWitness

/-! Arithmetic reduction for a primitive list consisting of a scaled base
and one additional speed. A coprime phase grid keeps all base phases fixed
and places the additional phase within `1/(2*A)` of one half. -/

namespace Loneliness.ProductFamily

open CriticalFamilies Normalization

def speeds (W : List ℕ) (A b : ℕ) : List ℕ := W.map (fun w => A*w) ++ [b]

theorem gcd_append_singleton (W : List ℕ) (b : ℕ) :
    gcd (W ++ [b]) = Nat.gcd (gcd W) b := by
  induction W with
  | nil => simp [gcd]
  | cons w W ih =>
    change Nat.gcd w (gcd (W ++ [b])) = Nat.gcd (Nat.gcd w (gcd W)) b
    rw [ih, Nat.gcd_assoc]

theorem primitive_product_coprime (W : List ℕ) (hW : gcd W = 1) (A b : ℕ)
    (hprimitive : gcd (speeds W A b) = 1) : Nat.Coprime b A := by
  have h := hprimitive
  rw [speeds, gcd_append_singleton, gcd_scale, hW, Nat.mul_one] at h
  exact (Nat.coprime_iff_gcd_eq_one.mpr h).symm

/-- The integer phase shift need not lie in a fixed interval. The actual
real-time value is periodic, so every resulting time remains valid. -/
theorem phase_grid_witness (A b : ℕ) (hA : 0 < A) (hcop : Nat.Coprime b A)
    (t₀ : ℝ) :
    ∃ (u : ℝ) (j : ℤ), (A : ℝ)*u = t₀ + (j : ℝ) ∧
      (1/2 - 1/(2*(A : ℝ))) ≤ distance ((b : ℝ)*u) := by
  let z : ℤ := round ((A : ℝ)/2 - (b : ℝ)*t₀)
  let j : ℤ := z * Nat.gcdA b A
  let k : ℤ := -z * Nat.gcdB b A
  have hbezout : (1 : ℤ) = (b : ℤ)*Nat.gcdA b A + (A : ℤ)*Nat.gcdB b A := by
    simpa [hcop.gcd_eq_one] using Nat.gcd_eq_gcd_ab b A
  have hmul : (b : ℤ)*j = z + (A : ℤ)*k := by
    dsimp [j,k]
    nlinarith [congrArg (fun q : ℤ => z*q) hbezout]
  have hmulR : (b : ℝ)*(j : ℝ) = (z : ℝ) + (A : ℝ)*(k : ℝ) := by
    exact_mod_cast hmul
  have hAR : (0 : ℝ) < A := by exact_mod_cast hA
  let u : ℝ := (t₀ + (j : ℝ))/(A : ℝ)
  have hAu : (A : ℝ)*u = t₀ + (j : ℝ) := by
    dsimp [u]
    field_simp
  have hbu : (b : ℝ)*u - (k : ℝ) = ((b : ℝ)*t₀ + (z : ℝ))/(A : ℝ) := by
    dsimp [u]
    field_simp
    nlinarith [hmulR]
  have hround : |(A : ℝ)/2 - (b : ℝ)*t₀ - (z : ℝ)| ≤ 1/2 :=
    abs_sub_round _
  have hlo := (abs_le.mp hround).1
  have hhi := (abs_le.mp hround).2
  have hleft : (1/2 - 1/(2*(A : ℝ)))*(A : ℝ) = (A : ℝ)/2 - 1/2 := by
    field_simp
  have hright : (1 - (1/2 - 1/(2*(A : ℝ))))*(A : ℝ) = (A : ℝ)/2 + 1/2 := by
    field_simp
    ring
  refine ⟨u,j,hAu,distance_lower_of_cell (k := k) ?_ ?_⟩
  · rw [hbu]
    apply (le_div_iff₀ hAR).mpr
    rw [hleft]
    linarith
  · rw [hbu]
    apply (div_le_iff₀ hAR).mpr
    rw [hright]
    linarith

/-- A lower bound for the actual supremum, at every chosen base time. -/
theorem phase_grid_value_lower (W : List ℕ) (A b : ℕ) (hA : 0 < A)
    (hcop : Nat.Coprime b A) (t₀ : ℝ) :
    min (clearance W t₀) (1/2 - 1/(2*(A : ℝ))) ≤ value (speeds W A b) := by
  obtain ⟨u,j,hAu,hbu⟩ := phase_grid_witness A b hA hcop t₀
  apply le_trans (b := clearance (speeds W A b) u)
  · apply le_clearance ((min_le_left _ _).trans (clearance_le_half W t₀))
    intro d hd
    rcases List.mem_append.mp hd with hd | hd
    · obtain ⟨w,hw,rfl⟩ := List.mem_map.mp hd
      have he : ((A*w : ℕ) : ℝ)*u = (w : ℝ)*t₀ + (((w : ℤ)*j : ℤ) : ℝ) := by
        calc
          _ = (w : ℝ)*((A : ℝ)*u) := by push_cast; ring
          _ = (w : ℝ)*(t₀ + (j : ℝ)) := by rw [hAu]
          _ = _ := by push_cast; ring
      rw [he, distance_add_int]
      exact (min_le_left _ _).trans (clearance_le_of_mem hw t₀)
    · have hdb : d = b := List.mem_singleton.mp hd
      subst d
      exact (min_le_right _ _).trans hbu
  · exact le_value_any _ u

theorem nonzero_residue_clearance (n : ℕ) (hn : 2 ≤ n) (W : List ℕ)
    (hres : ∀ w ∈ W, w%n ≠ 0) :
    (1 : ℝ)/n ≤ clearance W (1/(n : ℝ)) := by
  have hnpos : 0 < n := by omega
  have hw : Modular.Witness n n 1 W := by
    intro w hw
    have hlt := Nat.mod_lt w hnpos
    have hne := hres w hw
    have hf : 1 ≤ Modular.folded n w := by unfold Modular.folded; omega
    simpa only [Nat.one_mul, Nat.mul_one] using Nat.mul_le_mul_left n hf
  simpa only [Nat.cast_one] using Modular.witness_clearance_lower hn hnpos hw

theorem nonzero_residue_value (n : ℕ) (hn : 2 ≤ n) (W : List ℕ)
    (hres : ∀ w ∈ W, w%n ≠ 0) : (1 : ℝ)/n ≤ value W :=
  (nonzero_residue_clearance n hn W hres).trans (le_value_any W (1/(n : ℝ)))

theorem dilation_value_lower (n : ℕ) (hn : 4 ≤ n) (W : List ℕ)
    (hres : ∀ w ∈ W, w%n ≠ 0) (A b : ℕ) (hA : 2 ≤ A)
    (hcop : Nat.Coprime b A) : (1 : ℝ)/n ≤ value (speeds W A b) := by
  have hnr : (4 : ℝ) ≤ n := by exact_mod_cast hn
  have hAr : (2 : ℝ) ≤ A := by exact_mod_cast hA
  have hnquarter : (1 : ℝ)/n ≤ 1/4 :=
    one_div_le_one_div_of_le (by norm_num) hnr
  have hAquarter : (1 : ℝ)/(2*(A : ℝ)) ≤ 1/4 :=
    one_div_le_one_div_of_le (by norm_num) (by nlinarith : (4 : ℝ) ≤ 2*(A : ℝ))
  apply le_trans (b := min (clearance W (1/(n : ℝ))) (1/2 - 1/(2*(A : ℝ))))
  · exact le_min (nonzero_residue_clearance n (by omega) W hres) (by linarith)
  · exact phase_grid_value_lower W A b (by omega) hcop (1/(n : ℝ))

/-- In a positive primitive product family below `1/n`, the scale factor
is one and the additional speed is divisible by `n`. All parameters are
unbounded; the proof uses no modular search table. -/
theorem below_threshold_reduction (n : ℕ) (hn : 4 ≤ n)
    (W : List ℕ) (hW : gcd W = 1) (hres : ∀ w ∈ W, w%n ≠ 0)
    (A b : ℕ) (hA : 0 < A) (_hb : 0 < b)
    (hprimitive : gcd (speeds W A b) = 1)
    (hbelow : value (speeds W A b) < (1 : ℝ)/n) : A = 1 ∧ n ∣ b := by
  have hcop := primitive_product_coprime W hW A b hprimitive
  have hAone : A = 1 := by
    by_contra hne
    have hbound := dilation_value_lower n hn W hres A b (by omega) hcop
    exact (not_le_of_gt hbelow) hbound
  refine ⟨hAone,?_⟩
  by_contra hdiv
  have hbmod : b%n ≠ 0 := fun hz => hdiv (Nat.dvd_of_mod_eq_zero hz)
  have hspeeds : speeds W A b = W ++ [b] := by simp [speeds,hAone]
  rw [hspeeds] at hbelow
  apply (not_le_of_gt hbelow)
  apply nonzero_residue_value n (by omega) (W ++ [b])
  intro w hw
  rcases List.mem_append.mp hw with hw | hw
  · exact hres w hw
  · simpa only [List.mem_singleton.mp hw] using hbmod

theorem below_threshold_parameters (n : ℕ) (hn : 4 ≤ n)
    (W : List ℕ) (hW : gcd W = 1) (hres : ∀ w ∈ W, w%n ≠ 0)
    (A b : ℕ) (hA : 0 < A) (hb : 0 < b)
    (hprimitive : gcd (speeds W A b) = 1)
    (hbelow : value (speeds W A b) < (1 : ℝ)/n) :
    A = 1 ∧ ∃ s : ℕ, 1 ≤ s ∧ b = n*s := by
  obtain ⟨hAone,s,hs⟩ := below_threshold_reduction n hn W hW hres A b hA hb hprimitive hbelow
  refine ⟨hAone,s,?_,hs⟩
  by_contra h
  have hz : s = 0 := by omega
  rw [hz,Nat.mul_zero] at hs
  omega

end Loneliness.ProductFamily
