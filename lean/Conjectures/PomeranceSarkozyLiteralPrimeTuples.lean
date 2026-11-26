module
public import Conjectures.PomeranceSarkozyPrimeProduct

@[expose] public section
namespace PomeranceSarkozy

open Finset
open scoped BigOperators

def shiftResidue (p : ℕ) (hp : 0<p) (h : ℕ) : Fin p :=
  ⟨h%p,Nat.mod_lt _ hp⟩

theorem shiftResidue_injOn (I : Finset ℕ) {p : ℕ} (hp : 0<p)
    (hI : ∀ h∈I,h<p) :
    Set.InjOn (shiftResidue p hp) (↑I : Set ℕ) := by
  intro a ha b hb he
  have hv := congrArg Fin.val he
  simpa [shiftResidue,Nat.mod_eq_of_lt (hI _ ha),Nat.mod_eq_of_lt (hI _ hb)] using hv

/-- Splitting the literal independent-residue incidence mask by prime
gives the offset observations of the categorical product comparison. -/
theorem modelObservation_cartesian (I P : Finset ℕ)
    (hp : ∀ p∈P,0<p) (hI : ∀ h∈I,∀ p∈P,h<p)
    (r : ∀ p : ↥P,Fin p.val) :
    modelObservation (I×ˢP) r =
      (Finset.univ : Finset ↥P).biUnion fun p =>
        (primeObservation I (shiftResidue p.val (hp _ p.property)) (r p)).image
          (fun h => (h,p.val)) := by
  classical
  ext e
  obtain ⟨h,p⟩ := e
  simp only [modelObservation,Finset.mem_filter,Finset.mem_product,independentIncidence,
    Finset.mem_biUnion,Finset.mem_univ,true_and,Finset.mem_image,primeObservation,
    Prod.mk.injEq]
  constructor
  · rintro ⟨⟨hh,_⟩,hP,hr⟩
    refine ⟨⟨p,hP⟩,h,⟨hh,?_⟩,rfl,rfl⟩
    apply Fin.ext
    exact (Nat.mod_eq_of_lt (hI _ hh _ hP)).trans hr.symm
  · rintro ⟨q,h',⟨hh,hq⟩,rfl,hv⟩
    have hP : p∈P := hv ▸ q.property
    have he : q=(⟨p,hP⟩ : ↥P) := Subtype.ext hv
    subst q
    refine ⟨⟨hh,hP⟩,hP,?_⟩
    exact (congrArg Fin.val hq).symm.trans (Nat.mod_eq_of_lt (hI _ hh _ hP))

/-- Exact categorical-to-Bernoulli estimate for all true shifted
residue coordinates numbered by a finite tuple of moduli. -/
theorem shift_residue_tuple_bernoulli_l1 {n : ℕ} (I : Finset ℕ) (p : Fin n→ℕ)
    (hp : ∀ i,0<p i) (hI : ∀ h∈I,∀ i,h<p i) :
    finiteLawL1 (residueTupleMass I p (fun i => shiftResidue (p i) (hp i)))
      (bernoulliTupleMass I p) ≤
      ∑ i,2*(I.card:ℚ)*((I.card-1:ℕ):ℚ)*(1/(p i:ℚ))^2 :=
  prime_residue_bernoulli_tuple_l1 I p _ hp
    (fun i => shiftResidue_injOn I (hp i) (fun h hh => hI h hh i))

end PomeranceSarkozy
