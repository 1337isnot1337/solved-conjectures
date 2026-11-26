module
public import Conjectures.PomeranceSarkozyLiteralPrimeTuples
public import Conjectures.PomeranceSarkozyWindowCounts
public import Conjectures.PomeranceSarkozyBernoulliMatrix
public import Conjectures.PomeranceSarkozyUniformPush

@[expose] public section
namespace PomeranceSarkozy

open Finset
open scoped BigOperators

def sampledSubsets {n : ℕ} (I : Finset ℕ) (p : Fin n→ℕ) (hp : ∀ i,0<p i)
    (r : ∀ i,Fin (p i)) (i : Fin n) : ↥I.powerset :=
  ⟨primeObservation I (shiftResidue (p i) (hp i)) (r i),
    Finset.mem_powerset.mpr (Finset.filter_subset _ _)⟩

/-- The tuple probabilities are exactly the distribution of the
literal observation maps on independent uniform residue choices. -/
theorem residueTupleMass_eq_uniformImageMass {n : ℕ} (I : Finset ℕ) (p : Fin n→ℕ)
    (hp : ∀ i,0<p i) :
    residueTupleMass I p (fun i => shiftResidue (p i) (hp i)) =
      uniformImageMass (sampledSubsets I p hp) := by
  classical
  funext s
  unfold residueTupleMass uniformImageMass
  congr 1
  apply congrArg (fun k : ℕ => (k:ℚ))
  apply congrArg Finset.card
  ext r
  simp only [Finset.mem_filter,Finset.mem_univ,true_and]
  constructor
  · intro h
    funext i
    exact Subtype.ext (congrFun h i)
  · intro h
    funext i
    exact congrArg Subtype.val (congrFun h i)

/-- Reindexing the genuine independent-residue observation by a
prime enumeration preserves every offset count, not just its law. -/
theorem residue_offset_count_eq_matrix {n : ℕ} (I P : Finset ℕ) (e : Fin n≃↥P)
    (hp : ∀ p∈P,0<p) (hI : ∀ h∈I,∀ p∈P,h<p)
    (r : ∀ p : ↥P,Fin p.val) (h : ↥I) :
    (offsetCounts I P (modelObservation (I×ˢP) r) h).val =
      sumMatrix (setTupleMatrix I (sampledSubsets I (fun i => (e i).val)
        (fun i => hp _ (e i).property) (fun i => r (e i)))) h := by
  classical
  unfold offsetCounts sumMatrix setTupleMatrix
  dsimp only
  rw [Finset.card_eq_sum_ones,Finset.sum_filter]
  rw [← Finset.sum_coe_sort P (fun p =>
    if (h.val,p)∈modelObservation (I×ˢP) r then (1:ℕ) else 0)]
  symm
  refine Fintype.sum_equiv e _ _ ?_
  intro i
  have he : h.val∈(sampledSubsets I (fun i => (e i).val)
      (fun i => hp _ (e i).property) (fun i => r (e i)) i).val ↔
      (h.val,(e i).val)∈modelObservation (I×ˢP) r := by
    simp only [sampledSubsets,primeObservation,Finset.mem_filter,modelObservation,
      Finset.mem_product,h.property,true_and,independentIncidence,(e i).property]
    constructor
    · intro hobs
      exact ⟨True.intro,(congrArg Fin.val hobs).symm.trans (Nat.mod_eq_of_lt
        (hI _ h.property _ (e i).property))⟩
    · rintro ⟨_,hr⟩
      apply Fin.ext
      exact (Nat.mod_eq_of_lt (hI _ h.property _ (e i).property)).trans hr.symm
  by_cases hb : (h.val,(e i).val)∈modelObservation (I×ˢP) r
  · rw [ite_eq_left (he.mpr hb),ite_eq_left hb]
  · rw [ite_eq_right (fun hh => hb (he.mp hh)),ite_eq_right hb]

end PomeranceSarkozy
