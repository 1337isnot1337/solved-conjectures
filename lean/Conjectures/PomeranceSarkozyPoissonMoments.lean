module
public import Conjectures.PomeranceSarkozyPoissonAtom

@[expose] public section
namespace PomeranceSarkozy

open scoped NNReal
open ProbabilityTheory

private theorem descFactorial_poisson_shift (b : ℝ≥0) (a k : ℕ) :
    ((k+a).descFactorial a:ℝ)*poissonNatMass b (k+a)=(b:ℝ)^a*poissonNatMass b k := by
  have h := Nat.factorial_mul_descFactorial (n:=k+a) (k:=a) (by omega)
  rw [Nat.add_sub_cancel] at h
  have h' : (k.factorial:ℝ)*((k+a).descFactorial a:ℝ)=((k+a).factorial:ℝ) := by
    exact_mod_cast h
  have hk : (k.factorial:ℝ)≠0 := by positivity
  have hk' : ((k+a).factorial:ℝ)≠0 := by positivity
  unfold poissonNatMass
  rw [poissonMeasure_real_singleton,poissonMeasure_real_singleton,pow_add]
  field_simp
  rw [← h']
  ring

set_option maxHeartbeats 1000000 in
/-- All factorial moments of the actual Mathlib Poisson measure.
The initially missing terms vanish, and the positive tail reduces
termwise to another copy of the normalized Poisson series. -/
theorem poisson_descFactorial_hasSum (b : ℝ≥0) (a : ℕ) :
    HasSum (fun k : ℕ => (k.descFactorial a:ℝ)*poissonNatMass b k) ((b:ℝ)^a) := by
  let f : ℕ→ℝ := fun k => (k.descFactorial a:ℝ)*poissonNatMass b k
  have hz : (∑ k ∈ Finset.range a,f k)=0 := by
    apply Finset.sum_eq_zero
    intro k hk
    change (k.descFactorial a:ℝ)*poissonNatMass b k=0
    rw [Nat.descFactorial_of_lt (Finset.mem_range.mp hk),Nat.cast_zero,zero_mul]
  have he : (fun k : ℕ => f (k+a))=fun k => (b:ℝ)^a*poissonNatMass b k :=
    funext (descFactorial_poisson_shift b a)
  change HasSum f ((b:ℝ)^a)
  rw [← hasSum_nat_add_iff' a,hz,sub_zero,he]
  simpa only [mul_one] using (poissonNatMass_hasSum b).mul_left ((b:ℝ)^a)

theorem poisson_mean_hasSum (b : ℝ≥0) :
    HasSum (fun k : ℕ => (k:ℝ)*poissonNatMass b k) (b:ℝ) := by
  simpa [Nat.descFactorial_one] using poisson_descFactorial_hasSum b 1

end PomeranceSarkozy
