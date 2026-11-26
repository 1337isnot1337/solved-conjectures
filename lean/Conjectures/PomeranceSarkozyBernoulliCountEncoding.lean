module
public import Conjectures.PomeranceSarkozyBernoulliMatrix
public import Conjectures.PomeranceSarkozySupportedPush

@[expose] public section
namespace PomeranceSarkozy

open scoped NNReal ENNReal BigOperators

variable {A : Type*} [DecidableEq A] {n : ℕ}

/-- The natural-valued Bernoulli count law in the Poisson comparison
is exactly the count law of the original finite subset model. -/
theorem bernoulli_count_push_eq_subset_encoding (I : Finset A) (p : Fin n→ℕ)
    (hp : ∀ i,0<p i) :
    atomicPush (sumMatrix (K:=↥I) (J:=Fin n))
      (realMatrixMass (fun i => bernoulliNatMass (1/(p i:ℝ)))) =
      atomicPush (sumMatrix ∘ setTupleMatrix I) (fun s => (bernoulliTupleMass I p s:ℝ)) := by
  let b (i : Fin n) : ℝ := 1/(p i:ℝ)
  have h₀ (i : Fin n) : 0≤b i := by unfold b; positivity
  have h₁ (i : Fin n) : b i≤1 := by
    unfold b
    exact div_le_one_of_le₀ (by exact_mod_cast hp i) (by positivity)
  let q (i : Fin n) := bernoulliNatMass (b i)
  have hq (i : Fin n) : ∀ k,0≤q i k := bernoulliNatMass_nonneg (h₀ i) (h₁ i)
  have hmass : atomicMass (realMatrixMass (K:=↥I) q)=1 :=
    realMatrixMass_atomicMass q hq (fun i => bernoulliNatMass_atomicMass (h₀ i) (h₁ i))
  have hnonneg (x : ↥I→Fin n→ℕ) : 0≤realMatrixMass q x :=
    Finset.prod_nonneg fun _ _ => Finset.prod_nonneg fun _ _ => hq _ _
  have hs := atomicMass_summable_of_ne_top hnonneg (by rw [hmass]; simp)
  exact atomicPush_supported_encoding _ (setTupleMatrix_injective I)
    _ _ _ hs (bernoulli_matrix_mass_eq_subset_tuple I p)
    (bernoulli_matrix_mass_eq_zero_outside I p)

end PomeranceSarkozy
