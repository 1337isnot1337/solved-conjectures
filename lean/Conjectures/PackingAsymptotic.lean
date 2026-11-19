import Conjectures.PackingPeriodic
import Mathlib.Topology.Order.LiminfLimsup
import Mathlib.Topology.Algebra.Ring.Real
import Mathlib.Order.Filter.AtTopBot.Archimedean

/-! Actual upper and lower asymptotic densities on the integer line, using
the symmetric windows `[-n,n]`.  Uniform finite-window bounds imply the
corresponding `limsup` and `liminf` statements. -/
namespace PackingFourPoint

open Filter
open scoped Topology

noncomputable def windowDensity (x : ℤ → ℤ) (n : ℕ) : ℝ :=
  (intervalSum x (-(n : ℤ)) (2*n+1) : ℝ) / (2*n+1 : ℕ)

noncomputable def upperDensity (x : ℤ → ℤ) : ℝ := limsup (windowDensity x) atTop
noncomputable def lowerDensity (x : ℤ → ℤ) : ℝ := liminf (windowDensity x) atTop

theorem windowDensity_nonneg (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (n : ℕ) :
    0 ≤ windowDensity x n := by
  apply div_nonneg
  · exact_mod_cast intervalSum_nonneg x hx (-(n : ℤ)) (2*n+1)
  · positivity

theorem windowDensity_le_one (x : ℤ → ℤ) (hx : ∀ t, x t ≤ 1) (n : ℕ) :
    windowDensity x n ≤ 1 := by
  apply (div_le_one (by positivity : (0 : ℝ) < (2*n+1 : ℕ))).mpr
  exact_mod_cast intervalSum_le_length x hx (-(n : ℤ)) (2*n+1)

theorem windowDensity_bounded_below (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) :
    atTop.IsBoundedUnder (· ≥ ·) (windowDensity x) :=
  isBoundedUnder_of ⟨0, windowDensity_nonneg x hx⟩

theorem windowDensity_bounded_above (x : ℤ → ℤ) (hx : ∀ t, x t ≤ 1) :
    atTop.IsBoundedUnder (· ≤ ·) (windowDensity x) :=
  isBoundedUnder_of ⟨1, windowDensity_le_one x hx⟩

theorem odd_window_length_tendsto : Tendsto (fun n : ℕ => 2*n+1) atTop atTop := by
  apply tendsto_atTop.2
  intro n
  exact eventually_atTop.2 ⟨n, fun k hk => by omega⟩

theorem upperDensity_le_of_count_bound
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (A B C : ℤ) (hA : 0 < A)
    (h : ∀ start n, A*intervalSum x start n ≤ B*n+C) :
    upperDensity x ≤ (B : ℝ)/A := by
  have hAr : (0 : ℝ) < A := by exact_mod_cast hA
  let g : ℕ → ℝ := fun n => (B : ℝ)/A+((C : ℝ)/A)/(2*n+1 : ℕ)
  have hle : ∀ n, windowDensity x n ≤ g n := by
    intro n
    have hn : (0 : ℝ) < (2*n+1 : ℕ) := by positivity
    have hc : (A : ℝ)*(intervalSum x (-(n : ℤ)) (2*n+1) : ℝ) ≤
        (B : ℝ)*(2*n+1 : ℕ)+C := by exact_mod_cast h (-(n : ℤ)) (2*n+1)
    apply (div_le_iff₀ hn).mpr
    apply (mul_le_mul_iff_right₀ hAr).mp
    calc
      (A : ℝ)*(intervalSum x (-(n : ℤ)) (2*n+1) : ℝ)
        ≤ (B : ℝ)*(2*n+1 : ℕ)+C := hc
      _ = (A : ℝ)*(g n*(2*n+1 : ℕ)) := by
        dsimp [g]
        field_simp
  have hlen : Tendsto (fun n : ℕ => ((2*n+1 : ℕ) : ℝ)) atTop atTop :=
    tendsto_natCast_atTop_atTop.comp odd_window_length_tendsto
  have hg0 := hlen.const_div_atTop ((C : ℝ)/A)
  have hg : Tendsto g atTop (𝓝 ((B : ℝ)/A)) := by
    simpa only [g, add_zero] using tendsto_const_nhds.add hg0
  calc
    upperDensity x ≤ limsup g atTop :=
      limsup_le_limsup (Eventually.of_forall hle)
        (windowDensity_bounded_below x hx).isCobounded_le hg.isBoundedUnder_le
    _ = (B : ℝ)/A := hg.limsup_eq

theorem le_lowerDensity_of_count_bound
    (x : ℤ → ℤ) (hx : ∀ t, x t ≤ 1) (A B C : ℤ) (hA : 0 < A)
    (h : ∀ start n, B*n-C ≤ A*intervalSum x start n) :
    (B : ℝ)/A ≤ lowerDensity x := by
  have hAr : (0 : ℝ) < A := by exact_mod_cast hA
  let g : ℕ → ℝ := fun n => (B : ℝ)/A-((C : ℝ)/A)/(2*n+1 : ℕ)
  have hle : ∀ n, g n ≤ windowDensity x n := by
    intro n
    have hn : (0 : ℝ) < (2*n+1 : ℕ) := by positivity
    have hc : (B : ℝ)*(2*n+1 : ℕ)-C ≤
        (A : ℝ)*(intervalSum x (-(n : ℤ)) (2*n+1) : ℝ) := by
      exact_mod_cast h (-(n : ℤ)) (2*n+1)
    apply (le_div_iff₀ hn).mpr
    apply (mul_le_mul_iff_right₀ hAr).mp
    calc
      (A : ℝ)*(g n*(2*n+1 : ℕ)) = (B : ℝ)*(2*n+1 : ℕ)-C := by
        dsimp [g]
        field_simp
      _ ≤ (A : ℝ)*(intervalSum x (-(n : ℤ)) (2*n+1) : ℝ) := hc
  have hlen : Tendsto (fun n : ℕ => ((2*n+1 : ℕ) : ℝ)) atTop atTop :=
    tendsto_natCast_atTop_atTop.comp odd_window_length_tendsto
  have hg0 := hlen.const_div_atTop ((C : ℝ)/A)
  have hg : Tendsto g atTop (𝓝 ((B : ℝ)/A)) := by
    simpa only [g, sub_zero] using tendsto_const_nhds.sub hg0
  calc
    (B : ℝ)/A = liminf g atTop := hg.liminf_eq.symm
    _ ≤ lowerDensity x :=
      liminf_le_liminf (Eventually.of_forall hle) hg.isBoundedUnder_ge
        (windowDensity_bounded_above x hx).isCobounded_ge

theorem periodicCenters_densities {ι : Type*} [Fintype ι] {P : ℕ} [NeZero P]
    (centers : ι → ZMod P) (hc : Function.Injective centers) :
    upperDensity (periodicCenters centers) = (Fintype.card ι : ℝ)/P ∧
    lowerDensity (periodicCenters centers) = (Fintype.card ι : ℝ)/P := by
  have h0 := fun t : ℤ => fiberCount_nonneg centers (t : ZMod P)
  have h1 := fun t : ℤ => fiberCount_le_one centers hc (t : ZMod P)
  have hP : (0 : ℤ) < P := by exact_mod_cast Nat.pos_of_ne_zero (NeZero.ne P)
  have hu := upperDensity_le_of_count_bound (periodicCenters centers) h0 P
    (Fintype.card ι) ((P : ℤ)^2) hP
    (fun s n => (periodicCenters_count_bounds centers hc s n).2)
  have hl := le_lowerDensity_of_count_bound (periodicCenters centers) h1 P
    (Fintype.card ι) ((P : ℤ)^2) hP
    (fun s n => (periodicCenters_count_bounds centers hc s n).1)
  have hmid : lowerDensity (periodicCenters centers) ≤ upperDensity (periodicCenters centers) :=
    liminf_le_limsup (windowDensity_bounded_above _ h1) (windowDensity_bounded_below _ h0)
  push_cast at hu hl
  constructor <;> linarith

noncomputable def packingDensity (a b : ℤ) : ℝ := sSup
  {d : ℝ | ∃ x : ℤ → ℤ, (∀ t, 0 ≤ x t) ∧
    (∀ t, multiplicity x a b t ≤ 1) ∧ upperDensity x = d}

noncomputable def coveringDensity (a b : ℤ) : ℝ := sInf
  {d : ℝ | ∃ x : ℤ → ℤ, (∀ t, 0 ≤ x t) ∧ (∀ t, x t ≤ 1) ∧
    (∀ t, 1 ≤ multiplicity x a b t) ∧ lowerDensity x = d}

end PackingFourPoint
