module

public import Conjectures.WachsCompleteGraphLaguerreNormalization
public import Mathlib.RingTheory.PowerSeries.WellKnown

@[expose] public section
namespace WachsCompleteGraph

variable {K : Type*} [Field K]

/-- Formal exponential moments of a Gamma factor with integer shape n
and rate alpha. No probability identification is needed for this series. -/
noncomputable def gammaMomentFactor (n : ℕ) (α : K) : PowerSeries K :=
  PowerSeries.rescale α⁻¹ (PowerSeries.invOneSubPow K n).val

theorem gammaMomentFactor_coeff (n j : ℕ) (hn : 0<n) (α : K) :
    PowerSeries.coeff j (gammaMomentFactor n α) =
      ((n-1+j).choose j:K)*(α⁻¹)^j := by
  rw [gammaMomentFactor,PowerSeries.coeff_rescale,
    PowerSeries.invOneSubPow_val_eq_mk_sub_one_add_choose_of_pos (S:=K) n hn,PowerSeries.coeff_mk,
    Nat.choose_symm_add,mul_comm]

noncomputable def linearFactor (a : K) : PowerSeries K :=
  1+PowerSeries.C a*PowerSeries.X

theorem rescale_invOneSubPow_mul (n : ℕ) (t : K) :
    (linearFactor t)^n * PowerSeries.rescale (-t) (PowerSeries.invOneSubPow K n).val = 1 := by
  have h := (PowerSeries.invOneSubPow K n).inv_val
  rw [PowerSeries.invOneSubPow_inv_eq_one_sub_pow] at h
  have h' := congrArg (PowerSeries.rescale (-t)) h
  simp only [map_mul,map_pow,map_one,map_sub,PowerSeries.rescale_X,map_neg] at h'
  simpa [linearFactor,sub_eq_add_neg] using h'

theorem rescale_gammaMomentFactor_mul (n : ℕ) (t α : K) :
    (linearFactor (t/α))^n * PowerSeries.rescale (-t) (gammaMomentFactor n α)=1 := by
  unfold gammaMomentFactor
  have h : α⁻¹*(-t)=-(t/α) := by ring
  have he : PowerSeries.rescale (-(t/α))
      (PowerSeries.invOneSubPow K n).val =
        PowerSeries.rescale (-t) (PowerSeries.rescale α⁻¹
          (PowerSeries.invOneSubPow K n).val) := by
    rw [←h,PowerSeries.rescale_mul]
    rfl
  rw [←he]
  exact rescale_invOneSubPow_mul n (t/α)

end WachsCompleteGraph
