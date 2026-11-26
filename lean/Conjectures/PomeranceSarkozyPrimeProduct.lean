module
public import Conjectures.PomeranceSarkozyPrimeObservation
public import Conjectures.PomeranceSarkozyManyProduct
public import Conjectures.PomeranceSarkozyCoordinateLaws

@[expose] public section
namespace PomeranceSarkozy

open Finset
open scoped BigOperators

variable {A : Type*} [DecidableEq A] {n : ℕ}

noncomputable def residueTupleMass (I : Finset A) (p : Fin n→ℕ)
    (f : ∀ i,A→Fin (p i)) (s : Fin n→↥I.powerset) : ℚ :=
  open Classical in
  ((Finset.univ.filter fun r : (∀ i,Fin (p i)) =>
    (fun i => primeObservation I (f i) (r i))=(fun i => (s i).val)).card:ℚ)/
    (Fintype.card (∀ i,Fin (p i)):ℚ)

noncomputable def bernoulliTupleMass (I : Finset A) (p : Fin n→ℕ)
    (s : Fin n→↥I.powerset) : ℚ :=
  tupleWeight (fun i (S : ↥I.powerset) => bernoulliAtoms I.card (1/(p i:ℚ)) S.val) s

theorem residueTupleMass_eq (I : Finset A) (p : Fin n→ℕ) (f : ∀ i,A→Fin (p i))
    (s : Fin n→↥I.powerset) :
    residueTupleMass I p f s =
      tupleWeight (fun i (S : ↥I.powerset) => observationLaw (primeObservation I (f i)) S.val) s := by
  exact coordinate_observation_mass (fun i => primeObservation I (f i)) (fun i => (s i).val)

theorem prime_residue_bernoulli_tuple_l1 (I : Finset A) (p : Fin n→ℕ) (f : ∀ i,A→Fin (p i))
    (hp : ∀ i,0<p i) (hinj : ∀ i,Set.InjOn (f i) (↑I : Set A)) :
    finiteLawL1 (residueTupleMass I p f) (bernoulliTupleMass I p) ≤
      ∑ i, 2*(I.card:ℚ)*((I.card-1:ℕ):ℚ)*(1/(p i:ℚ))^2 := by
  classical
  let a (i : Fin n) (S : ↥I.powerset) := observationLaw (primeObservation I (f i)) S.val
  let b (i : Fin n) (S : ↥I.powerset) := bernoulliAtoms I.card (1/(p i:ℚ)) S.val
  have ha : residueTupleMass I p f=tupleWeight a := funext (residueTupleMass_eq I p f)
  have ha₁ (i : Fin n) : (∑ S,a i S)=1 := by
    have he (S : ↥I.powerset) : a i S=categoricalAtoms I.card (1/(p i:ℚ)) S.val :=
      prime_observation_law (hp i) I (f i) (hinj i) (Finset.mem_powerset.mp S.property)
    simp_rw [he]
    rw [Finset.sum_coe_sort]
    exact categoricalAtoms_sum I _
  have hb₁ (i : Fin n) : (∑ S,b i S)=1 := by
    unfold b
    rw [Finset.sum_coe_sort]
    exact bernoulliAtoms_sum I _
  have hpos (i : Fin n) : (0:ℚ)≤1/(p i:ℚ) := by positivity
  have hle (i : Fin n) : (1:ℚ)/(p i:ℚ)≤1 :=
    div_le_one_of_le₀ (by exact_mod_cast hp i) (by positivity)
  have hb (i : Fin n) (S : ↥I.powerset) : 0≤b i S := by
    unfold b bernoulliAtoms
    exact mul_nonneg (pow_nonneg (hpos i) _) (pow_nonneg (sub_nonneg.mpr (hle i)) _)
  rw [ha]
  change finiteLawL1 (tupleWeight a) (tupleWeight b) ≤ _
  refine (tupleWeight_l1_le a b (fun _ _ => observationLaw_nonneg _ _) hb ha₁ hb₁).trans ?_
  apply Finset.sum_le_sum
  intro i _
  unfold finiteLawL1 a b
  rw [Finset.sum_coe_sort I.powerset (fun S =>
    |observationLaw (primeObservation I (f i)) S - bernoulliAtoms I.card (1/(p i:ℚ)) S|)]
  exact prime_observation_bernoulli_l1 (hp i) I (f i) (hinj i)

end PomeranceSarkozy
