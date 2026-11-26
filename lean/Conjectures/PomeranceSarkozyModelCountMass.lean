module
public import Conjectures.PomeranceSarkozyResidueCountEncoding

@[expose] public section
namespace PomeranceSarkozy

open Finset

noncomputable def modelObservationSubtype (I P : Finset ℕ) (r : ∀ p : ↥P,Fin p.val) :
    ↥(I×ˢP).powerset :=
  open Classical in ⟨modelObservation (I×ˢP) r, Finset.mem_powerset.mpr (Finset.filter_subset _ _)⟩

theorem modelObservation_mass_eq_uniform (I P : Finset ℕ) :
    (fun S : ↥(I×ˢP).powerset => observationLaw (modelObservation (I×ˢP) (P:=P)) S.val)
      = uniformImageMass (modelObservationSubtype I P) := by
  classical
  funext S
  unfold observationLaw uniformImageMass
  congr 1
  apply congrArg (fun k : ℕ => (k:ℚ))
  apply congrArg Finset.card
  ext r
  simp only [Finset.mem_filter,Finset.mem_univ,true_and]
  constructor
  · intro h
    exact Subtype.ext h
  · intro h
    exact congrArg Subtype.val h

/-- The original independent-residue comparison and the split
per-prime comparison use exactly the same offset-count atom law. -/
theorem model_count_mass_eq_residue_tuple_push {n : ℕ} (I P : Finset ℕ) (e : Fin n≃↥P)
    (hp : ∀ p∈P,0<p) (hI : ∀ h∈I,∀ p∈P,h<p) :
    pushFiniteLaw (fun S : ↥(I×ˢP).powerset => fun h : ↥I => (offsetCounts I P S.val h).val)
      (fun S : ↥(I×ˢP).powerset => observationLaw (modelObservation (I×ˢP) (P:=P)) S.val)
     =
    pushFiniteLaw (sumMatrix ∘ setTupleMatrix I)
      (residueTupleMass I (fun i => (e i).val)
        (fun i => shiftResidue (e i).val (hp _ (e i).property))) := by
  classical
  rw [modelObservation_mass_eq_uniform,residueTupleMass_eq_uniformImageMass,
    push_uniformImageMass,push_uniformImageMass]
  let E : (∀ p : ↥P,Fin p.val) ≃ (∀ i : Fin n,Fin (e i).val) :=
    Equiv.piCongrLeft' (fun p : ↥P => Fin p.val) e.symm
  have hE (r : ∀ p : ↥P,Fin p.val) (i : Fin n) : E r i=r (e i) := rfl
  rw [← uniformImageMass_reindex E]
  congr 1
  funext r h
  change (offsetCounts I P (modelObservation (I×ˢP) r) h).val =
    sumMatrix (setTupleMatrix I (sampledSubsets I (fun i => (e i).val)
      (fun i => hp _ (e i).property) (E r))) h
  rw [show (E r)=(fun i => r (e i)) from funext (hE r)]
  exact residue_offset_count_eq_matrix I P e hp hI r h

end PomeranceSarkozy
