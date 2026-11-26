module
public import Conjectures.PomeranceSarkozyActualCountLaw
public import Conjectures.PomeranceSarkozyFullFiniteComparison

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory
open scoped ENNReal NNReal BigOperators

def literalOffsetCount (I P : Finset ℕ) (L N : ℕ) (j : Fin N) (h : ↥I) : ℕ :=
  (P.filter fun p => p ∣ L+j.val-h.val).card

noncomputable def arithmeticOffsetCountMeasure (I P : Finset ℕ) (L N : ℕ) : Measure (↥I→ℕ) :=
  (Measure.uniformOfFinset (Finset.univ : Finset (Fin N))).map (literalOffsetCount I P L N)

theorem arithmeticOffsetCountMeasure_real_singleton (I P : Finset ℕ) (L N : ℕ) (s : ↥I→ℕ) :
    (arithmeticOffsetCountMeasure I P L N).real {s}=arithOffsetMass I P L N s := by
  classical
  rw [measureReal_def,arithmeticOffsetCountMeasure,Measure.map_apply (.of_discrete)
    (measurableSet_singleton s),Measure.uniformOfFinset_apply,
    ENNReal.toReal_div,ENNReal.toReal_natCast,ENNReal.toReal_natCast,
    Finset.card_univ,Fintype.card_fin,arithOffsetMass_eq_count_ratio]
  congr 1
  apply congrArg (fun k : ℕ => (k:ℝ))
  apply congrArg Finset.card
  ext j
  simp only [Finset.mem_filter,Finset.mem_univ,true_and,Set.mem_preimage,Set.mem_singleton_iff]
  rfl

/-- Direct measure-level comparison of the uniform arithmetic
sample and the true independent Poisson offset-count law. -/
theorem arithmetic_measure_poisson_count_l1 {n : ℕ} (I P : Finset ℕ) (e : Fin n≃↥P)
    (L N R y : ℕ) (hN : 0<N) (hy : 0<y)
    (hP : ∀ p∈P,p.Prime) (hPy : ∀ p∈P,y<p)
    (hI : ∀ h∈I,∀ p∈P,h<p) (hL : ∀ h∈I,h≤L) :
    let p (i : Fin n) := (e i).val
    atomicL1 (fun s : ↥I→ℕ => (arithmeticOffsetCountMeasure I P L N).real {s})
      (fun s : ↥I→ℕ => (Measure.pi (fun _ : ↥I =>
        poissonMeasure (∑ i,reciprocalRates p i))).real {s}) ≤
      ENNReal.ofReal (crtWindowL1Bound (I×ˢP) N R:ℝ)+ENNReal.ofReal (2*(I.card:ℝ)^2/(y:ℝ)) := by
  dsimp only
  simp_rw [arithmeticOffsetCountMeasure_real_singleton]
  change atomicL1 (arithOffsetMass I P L N) (independentPoissonOffsetMass I (fun i => (e i).val))≤_
  refine (arithmetic_poisson_offset_atomic_le I P e L N R hN hP hI hL).trans ?_
  rw [add_assoc]
  exact add_le_add le_rfl (distribution_replacement_error_le I P e y hy hPy)

end PomeranceSarkozy
