module
public import Conjectures.PomeranceSarkozyJointCountComparison
public import Conjectures.PomeranceSarkozyReciprocalTail

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory
open scoped ENNReal NNReal BigOperators

noncomputable def reciprocalRates {n : ℕ} (p : Fin n→ℕ) (i : Fin n) : ℝ≥0 :=
  ⟨1/(p i:ℝ),by positivity⟩

noncomputable def independentPoissonOffsetMass {n : ℕ} (I : Finset ℕ) (p : Fin n→ℕ)
    (s : ↥I→ℕ) : ℝ :=
  (Measure.pi (fun _ : ↥I => poissonMeasure (∑ i,reciprocalRates p i))).real {s}

theorem bern_poisson_offset_atomic_le {n : ℕ} (I : Finset ℕ) (p : Fin n→ℕ) (hp : ∀ i,0<p i) :
    atomicL1 (bernOffsetMass I p) (independentPoissonOffsetMass I p)≤
      ∑ _h : ↥I,∑ i,ENNReal.ofReal (2*(1/(p i:ℝ))^2) := by
  have hb (i : Fin n) : (reciprocalRates p i:ℝ)≤1 := by
    unfold reciprocalRates
    exact div_le_one_of_le₀ (by exact_mod_cast hp i) (by positivity)
  unfold bernOffsetMass
  rw [← bernoulli_count_push_eq_subset_encoding I p hp]
  exact bernoulli_to_joint_poisson_counts_le (K:=↥I) (reciprocalRates p) hb

/-- End-to-end finite L1 bound on the actual shifted divisibility count
vector and a product of genuine Poisson laws. The CRT, categorical and
Poisson replacement costs are all explicit. -/
theorem arithmetic_poisson_offset_atomic_le {n : ℕ} (I P : Finset ℕ) (e : Fin n≃↥P)
    (L N R : ℕ) (hN : 0<N) (hP : ∀ p∈P,p.Prime)
    (hI : ∀ h∈I,∀ p∈P,h<p) (hL : ∀ h∈I,h≤L) :
    let p (i : Fin n) := (e i).val
    atomicL1 (arithOffsetMass I P L N) (independentPoissonOffsetMass I p)≤
      ENNReal.ofReal (crtWindowL1Bound (I×ˢP) N R:ℝ) +
      ENNReal.ofReal ((∑ i,2*(I.card:ℚ)*((I.card-1:ℕ):ℚ)*(1/(p i:ℚ))^2 : ℚ):ℝ) +
      ∑ _h : ↥I,∑ i,ENNReal.ofReal (2*(1/(p i:ℝ))^2) := by
  classical
  let p (i : Fin n) := (e i).val
  have hp (p₀ : ℕ) (h : p₀∈P) : 0<p₀ := (hP _ h).pos
  change atomicL1 (arithOffsetMass I P L N) (independentPoissonOffsetMass I p) ≤ _
  refine (atomicL1_triangle _ (bernOffsetMass I p) _).trans ?_
  apply add_le_add
  · exact (atomicL1_triangle _ (modelOffsetMass I P) _).trans
      (add_le_add (arith_model_offset_atomic_le I P L N R hN hP hI hL)
        (model_bern_offset_atomic_le I P e hp hI))
  · exact bern_poisson_offset_atomic_le I p (fun i => hp _ (e i).property)

/-- Both distribution replacement errors are at most twice the
squared offset-window size times the reciprocal of the prime cutoff. -/
theorem distribution_replacement_error_le {n : ℕ} (I P : Finset ℕ) (e : Fin n≃↥P)
    (y : ℕ) (hy : 0<y) (hP : ∀ p∈P,y<p) :
    let p (i : Fin n) := (e i).val
    ENNReal.ofReal ((∑ i,2*(I.card:ℚ)*((I.card-1:ℕ):ℚ)*(1/(p i:ℚ))^2 : ℚ):ℝ) +
      (∑ _h : ↥I,∑ i,ENNReal.ofReal (2*(1/(p i:ℝ))^2))
      ≤ ENNReal.ofReal (2*(I.card:ℝ)^2/(y:ℝ)) := by
  classical
  let H : ℕ := I.card
  let M (p : ℕ) : ℝ := (1/(p:ℝ))^2
  let S : ℝ := ∑ i : Fin n,M (e i).val
  have hs : S≤1/(y:ℝ) := by
    have he : S=∑ p ∈ P,M p := by
      unfold S
      rw [← Finset.sum_coe_sort P M]
      exact Fintype.sum_equiv e _ _ (fun _ => rfl)
    rw [he]
    unfold M
    have hr : ((∑ p ∈ P,(1/(p:ℚ))^2:ℚ):ℝ)≤((1/(y:ℚ):ℚ):ℝ) := by
      exact_mod_cast sum_reciprocal_sq_le_cutoff P y hy hP
    push_cast at hr
    exact hr
  have hs₀ : 0≤S := by unfold S M; positivity
  have hq : ((∑ i : Fin n,2*(I.card:ℚ)*((I.card-1:ℕ):ℚ)*
        (1/((e i).val:ℚ))^2 : ℚ):ℝ) = 2*(H:ℝ)*((H-1:ℕ):ℝ)*S := by
    unfold S M H
    push_cast
    rw [Finset.mul_sum]
  have hp : (∑ _h : ↥I,∑ i : Fin n,ENNReal.ofReal (2*M (e i).val)) =
      ENNReal.ofReal (2*(H:ℝ)*S) := by
    have hi : (∑ i : Fin n,ENNReal.ofReal (2*M (e i).val))=ENNReal.ofReal (2*S) := by
      rw [← ENNReal.ofReal_sum_of_nonneg (f:=fun i : Fin n => 2*M (e i).val)
        (fun _ _ => by unfold M; positivity),Finset.mul_sum]
    simp_rw [hi]
    rw [Finset.sum_const,Finset.card_univ,Fintype.card_coe,nsmul_eq_mul]
    rw [← ENNReal.ofReal_natCast,← ENNReal.ofReal_mul (Nat.cast_nonneg I.card)]
    congr 1
    unfold H
    ring
  change ENNReal.ofReal _+(∑ _h : ↥I,∑ i : Fin n,ENNReal.ofReal (2*M (e i).val))≤_
  rw [hq,hp,← ENNReal.ofReal_add (by positivity) (by positivity)]
  apply ENNReal.ofReal_le_ofReal
  have hsum : 2*(H:ℝ)*((H-1:ℕ):ℝ)*S+2*(H:ℝ)*S=2*(H:ℝ)^2*S := by
    by_cases hz : H=0
    · simp [hz]
    · rw [Nat.cast_sub (by omega : 1≤H),Nat.cast_one]
      ring
  rw [hsum,div_eq_mul_inv]
  exact mul_le_mul_of_nonneg_left (by simpa [one_div] using hs) (by positivity)

end PomeranceSarkozy
