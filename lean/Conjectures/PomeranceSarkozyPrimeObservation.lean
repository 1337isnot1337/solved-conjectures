module
public import Conjectures.PomeranceSarkozyPrimeCategorical
public import Conjectures.PomeranceSarkozyObservationLaws

@[expose] public section
namespace PomeranceSarkozy

open Finset
open scoped BigOperators

variable {A : Type*} [DecidableEq A]

def primeObservation {p : ℕ} (I : Finset A) (f : A→Fin p) (r : Fin p) : Finset A :=
  I.filter fun x => f x=r

omit [DecidableEq A] in
theorem primeObservation_card_le_one {p : ℕ} (I : Finset A) (f : A→Fin p)
    (hinj : Set.InjOn f (↑I : Set A)) (r : Fin p) :
    (primeObservation I f r).card≤1 := by
  apply Finset.card_le_one.mpr
  intro a ha b hb
  obtain ⟨haI,haF⟩ := Finset.mem_filter.mp ha
  obtain ⟨hbI,hbF⟩ := Finset.mem_filter.mp hb
  exact hinj haI hbI (haF.trans hbF.symm)

omit [DecidableEq A] in
theorem primeObservation_singleton {p : ℕ} (I : Finset A) (f : A→Fin p)
    (hinj : Set.InjOn f (↑I : Set A)) {x : A} (hx : x∈I) (r : Fin p) :
    primeObservation I f r={x} ↔ r=f x := by
  constructor
  · intro h
    have hm : x ∈ primeObservation I f r := by rw [h]; simp
    exact (Finset.mem_filter.mp hm).2.symm
  · intro h
    ext y
    rw [Finset.mem_singleton]
    constructor
    · intro hy
      exact hinj (Finset.mem_filter.mp hy).1 hx ((Finset.mem_filter.mp hy).2.trans h)
    · rintro rfl
      exact Finset.mem_filter.mpr ⟨hx,h.symm⟩

theorem prime_observation_law {p : ℕ} (hp : 0<p) (I : Finset A) (f : A→Fin p)
    (hinj : Set.InjOn f (↑I : Set A)) {S : Finset A} (hS : S⊆I) :
    observationLaw (primeObservation I f) S=categoricalAtoms I.card (1/(p:ℚ)) S := by
  classical
  have hp' : (p:ℚ)≠0 := by exact_mod_cast hp.ne'
  unfold observationLaw categoricalAtoms
  by_cases h₀ : S.card=0
  · rw [ite_eq_left h₀,Finset.card_eq_zero.mp h₀,Fintype.card_fin]
    have hfilter : (Finset.univ.filter fun r : Fin p => primeObservation I f r=∅)
        = Finset.univ \ I.image f := by
      ext r
      simp only [Finset.mem_filter,Finset.mem_univ,true_and,Finset.mem_sdiff,Finset.mem_image]
      constructor
      · intro he h
        obtain ⟨x,hx,hf⟩ := h
        have hm : x∈primeObservation I f r := Finset.mem_filter.mpr ⟨hx,hf⟩
        rw [he] at hm
        exact Finset.notMem_empty x hm
      · intro hn
        apply Finset.eq_empty_iff_forall_notMem.mpr
        intro x hx
        exact hn ⟨x,(Finset.mem_filter.mp hx).1,(Finset.mem_filter.mp hx).2⟩
    have himage : (I.image f).card = I.card := Finset.card_image_of_injOn hinj
    have hIp : I.card ≤ p := by
      rw [← himage]
      exact (Finset.card_le_univ _).trans_eq (Fintype.card_fin p)
    rw [hfilter,Finset.card_sdiff_of_subset (Finset.subset_univ _),Finset.card_univ,Fintype.card_fin,
      himage,Nat.cast_sub hIp]
    field_simp
  · rw [ite_eq_right h₀]
    by_cases h₁ : S.card=1
    · rw [ite_eq_left h₁]
      obtain ⟨x,rfl⟩ := Finset.card_eq_one.mp h₁
      have hx : x∈I := hS (Finset.mem_singleton_self x)
      have he : ((Finset.univ : Finset (Fin p)).filter fun r => primeObservation I f r={x}) =
          {f x} := by ext r; simp [primeObservation_singleton I f hinj hx]
      rw [he]
      simp
    · rw [ite_eq_right h₁]
      have hfilter : (Finset.univ.filter fun r : Fin p => primeObservation I f r=S)=∅ := by
        apply Finset.eq_empty_iff_forall_notMem.mpr
        intro r hr
        have he := (Finset.mem_filter.mp hr).2
        have hl := primeObservation_card_le_one I f hinj r
        rw [he] at hl
        omega
      simp [hfilter]

theorem prime_observation_bernoulli_l1 {p : ℕ} (hp : 0<p) (I : Finset A) (f : A→Fin p)
    (hinj : Set.InjOn f (↑I : Set A)) :
    (∑ S ∈ I.powerset, |observationLaw (primeObservation I f) S-
      bernoulliAtoms I.card (1/(p:ℚ)) S|) ≤
      2*(I.card:ℚ)*((I.card-1:ℕ):ℚ)*(1/(p:ℚ))^2 := by
  have he (S : Finset A) (hS : S∈I.powerset) :
      |observationLaw (primeObservation I f) S-bernoulliAtoms I.card (1/(p:ℚ)) S| =
      |categoricalAtoms I.card (1/(p:ℚ)) S-bernoulliAtoms I.card (1/(p:ℚ)) S| := by
    rw [prime_observation_law hp I f hinj (Finset.mem_powerset.mp hS)]
  rw [Finset.sum_congr rfl he]
  apply categorical_bernoulli_l1 I _ (by positivity)
  exact div_le_one_of_le₀ (by exact_mod_cast hp) (by positivity)

end PomeranceSarkozy
