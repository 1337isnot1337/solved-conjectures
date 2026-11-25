module

public import Conjectures.WachsCompleteGraphVandermonde
public import Mathlib.RingTheory.PowerSeries.Exp

@[expose] public section
namespace WachsCompleteGraph

/-- Coefficients of the normalized polynomial L_p^(1)(-z)/(p+1),
with the conventional Laguerre sign canceled by the minus argument. -/
noncomputable def normalizedLaguerre (p : ℕ) : Polynomial ℚ :=
  ∑ i ∈ Finset.range (p+1),Polynomial.monomial i ((p.choose i:ℚ)/((i+1).factorial:ℚ))

theorem normalizedLaguerre_coeff (p i : ℕ) :
    (normalizedLaguerre p).coeff i=(p.choose i:ℚ)/((i+1).factorial:ℚ) := by
  unfold normalizedLaguerre
  rw [Polynomial.finsetSum_coeff]
  simp only [Polynomial.coeff_monomial,Finset.sum_ite_eq',Finset.mem_range]
  by_cases h : i<p+1
  · simp [h]
  · have h' : p < i := by omega
    simp [h,Nat.choose_eq_zero_of_lt h']

noncomputable def forcingQuotient (p : ℕ) : PowerSeries ℚ :=
  PowerSeries.mk fun j => ((p+(j+1)).choose j:ℚ)/((j+1).factorial:ℚ)

/-- The exact formal Kummer/Vandermonde identity used in the written answer.
The source's number of equal variables is p+2. -/
theorem forcingQuotient_eq_exp_mul (p : ℕ) :
    forcingQuotient p=(normalizedLaguerre p).toPowerSeries * PowerSeries.exp ℚ := by
  apply PowerSeries.ext
  intro j
  rw [forcingQuotient,PowerSeries.coeff_mk,PowerSeries.coeff_mul,
    Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  simp only [Polynomial.coeff_coe,normalizedLaguerre_coeff,PowerSeries.coeff_exp,Algebra.algebraMap_self, RingHom.id_apply]
  exact (laguerre_exponential_coefficient p j).symm

/-- The formula persists after rescaling by any parameter and any base
commutative rational algebra, in particular the real parameters of the
complete-graph question. -/
theorem forcingQuotient_specialize {A : Type*} [CommRing A] [Algebra ℚ A]
    (p : ℕ) (t : A) :
    PowerSeries.rescale t (PowerSeries.map (algebraMap ℚ A) (forcingQuotient p)) =
      PowerSeries.rescale t (PowerSeries.map (algebraMap ℚ A) (normalizedLaguerre p).toPowerSeries) *
        PowerSeries.rescale t (PowerSeries.exp A) := by
  rw [forcingQuotient_eq_exp_mul,map_mul,PowerSeries.map_exp,map_mul]

noncomputable def completeGraphForcing {A : Type*} [CommRing A] [Algebra ℚ A]
    (p : ℕ) (t : A) : PowerSeries A :=
  PowerSeries.X * PowerSeries.rescale t (PowerSeries.map (algebraMap ℚ A) (forcingQuotient p))

theorem completeGraphForcing_explicit_coeff {A : Type*} [CommRing A] [Algebra ℚ A]
    (p : ℕ) (t : A) (j : ℕ) :
    PowerSeries.coeff (j+1) (completeGraphForcing p t) =
      algebraMap ℚ A (((p+(j+1)).choose j:ℚ)/((j+1).factorial:ℚ))*t^j := by
  rw [completeGraphForcing,PowerSeries.coeff_succ_X_mul,PowerSeries.coeff_rescale,
    PowerSeries.coeff_map,forcingQuotient,PowerSeries.coeff_mk]
  ring

end WachsCompleteGraph
