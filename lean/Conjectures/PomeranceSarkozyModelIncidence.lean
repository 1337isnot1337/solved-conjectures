module
public import Conjectures.PomeranceSarkozyIndependentResidues

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical

def independentIncidence {P : Finset ℕ} (r : ∀ p : ↥P,Fin p.val) (e : Incidence) :=
  ∃ hp : e.2∈P,(r ⟨e.2,hp⟩).val=e.1

abbrev IndependentIncidenceEvent (P : Finset ℕ) (S : Finset Incidence) :=
  {r : ∀ p : ↥P,Fin p.val // ∀ e∈S,independentIncidence r e}

noncomputable instance (P : Finset ℕ) (S : Finset Incidence) :
    Fintype (IndependentIncidenceEvent P S) := by classical exact Subtype.fintype _

def prescribedPrimes (P : Finset ℕ) (S : Finset Incidence) : Finset ↥P :=
  Finset.univ.filter fun p => ∃ e∈S,e.2=p.val

theorem mem_prescribedPrimes (P : Finset ℕ) (S : Finset Incidence) (p : ↥P) :
    p∈prescribedPrimes P S ↔ ∃ e∈S,e.2=p.val := by simp [prescribedPrimes]

noncomputable def prescribedResidues (P : Finset ℕ) (S : Finset Incidence)
    (hP : ∀ p∈P,p.Prime) (hsmall : ∀ e∈S,e.1 < e.2) (p : ↥P) : Fin p.val :=
  if h : ∃ e∈S,e.2=p.val then
    ⟨h.choose.1,lt_of_lt_of_eq (hsmall _ h.choose_spec.1) h.choose_spec.2⟩
  else ⟨0,(hP _ p.property).pos⟩

theorem prescribedResidues_val_of_mem (P : Finset ℕ) (S : Finset Incidence)
    (hP : ∀ p∈P,p.Prime) (hsmall : ∀ e∈S,e.1 < e.2) (hc : compatible S)
    (p : ↥P) (e : Incidence) (he : e∈S) (hp : e.2=p.val) :
    (prescribedResidues P S hP hsmall p).val=e.1 := by
  have h : ∃ f∈S,f.2=p.val := ⟨e,he,hp⟩
  unfold prescribedResidues
  rw [dite_eq_left h]
  exact congrArg Prod.fst (hc _ h.choose_spec.1 e he (h.choose_spec.2.trans hp.symm))

noncomputable def incidenceModelEquiv (P : Finset ℕ) (S : Finset Incidence)
    (hP : ∀ p∈P,p.Prime) (hsub : ∀ e∈S,e.2∈P)
    (hsmall : ∀ e∈S,e.1 < e.2) (hc : compatible S) :
    IndependentIncidenceEvent P S ≃
      FixedCoordinates (prescribedPrimes P S) (prescribedResidues P S hP hsmall) where
  toFun r := ⟨r.val,by
    intro p hp
    obtain ⟨e,he,hv⟩ := (mem_prescribedPrimes P S p).mp hp
    obtain ⟨heP,hr⟩ := r.property e he
    have hpe : (⟨e.2,heP⟩ : ↥P)=p := Subtype.ext hv
    apply Fin.ext
    rw [prescribedResidues_val_of_mem P S hP hsmall hc p e he hv]
    exact congrArg (fun j : ↥P => (r.val j).val) hpe |>.symm.trans hr⟩
  invFun r := ⟨r.val,by
    intro e he
    let p : ↥P := ⟨e.2,hsub e he⟩
    refine ⟨p.property,?_⟩
    have hp := (mem_prescribedPrimes P S p).mpr ⟨e,he,rfl⟩
    have hr := r.property p hp
    exact (congrArg Fin.val hr).trans (prescribedResidues_val_of_mem P S hP hsmall hc p e he rfl)⟩
  left_inv _ := rfl
  right_inv _ := rfl

end PomeranceSarkozy
