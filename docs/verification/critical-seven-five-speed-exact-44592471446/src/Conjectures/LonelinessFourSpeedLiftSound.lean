import Conjectures.LonelinessModularFoldedSearch
import Conjectures.LonelinessFourSpeedFoldedGeometry
import Conjectures.LonelinessFourSpeedLiftDirections
import Mathlib.Data.List.GetD

/-! Connecting finite folded-lift trees to the unconditional four-speed
geometry, primitive recovery, and the exact rational leaf exclusions. -/

namespace Loneliness.Modular.FourSpeed.Lifts

open FoldedSearch

def sortedPrimitive (v : Fin 4 → ℕ) : List ℕ :=
  (Normalization.normalize (List.ofFn v)).mergeSort (· ≤ ·)

/-- A terminal records its direction index as well as its multiplier. This
keeps the trusted check local to one direction rather than searching a table. -/
def shortTerminal (m : ℕ) (x : Fin 4 → ℕ) (code : ℕ) : Bool :=
  decide (0<code%m ∧ code%m<m ∧ (∀ i, 18*folded m ((code%m)*x i)≤m) ∧
    code/m<directions.length ∧
      (Normalization.normalize (List.ofFn (fun i => folded m ((code%m)*x i)))).Perm
        (directions.getD (code/m) []))

theorem shortTerminal_sound : TerminalSound 2 9 shortTerminal
    (fun v => (∀ i, 0<v i) → ∃ ds∈directions, (List.ofFn v).Perm ds) := by
  intro m x code hm hcheck v hrep hp hlow hv
  have hc : 0<code%m ∧ code%m<m ∧ (∀ i, 18*folded m ((code%m)*x i)≤m) ∧
      code/m<directions.length ∧
        (Normalization.normalize (List.ofFn (fun i => folded m ((code%m)*x i)))).Perm
          (directions.getD (code/m) []) :=
    of_decide_eq_true hcheck
  obtain ⟨a,b,hab,hrep⟩ := hrep
  have he := FourSpeedFoldedGeometry.recover_folded_primitive_vector v hv hp
    m a b (by omega) hab x hrep (code%m) hc.1 hc.2.1 hc.2.2.1 hlow
  refine ⟨directions.getD (code/m) [],?_,he ▸ hc.2.2.2.2⟩
  rw [List.getD_eq_getElem _ _ hc.2.2.2.1]
  exact List.getElem_mem _

theorem checked_direction {m : ℕ} (hm : 1<m) (x : Fin 4 → ℕ) (tree : Tree 4)
    (hcheck : check 2 9 shortTerminal tree m x=true)
    (v : Fin 4 → ℕ) (hv : ∀ i, 0<v i) (hrep : Represents m x v)
    (hp : Search.Primitive v) (hlow : value (List.ofFn v)<(2/9 : ℝ)) :
    ∃ ds∈directions, (List.ofFn v).Perm ds :=
  check_sound (by decide) (by decide) shortTerminal _ shortTerminal_sound tree
    m x hm hcheck v hrep hp hlow hv

theorem sortedPrimitive_of_primitive (v : Fin 4 → ℕ) (hp : Search.Primitive v) :
    sortedPrimitive v=(List.ofFn v).mergeSort (· ≤ ·) := by
  unfold sortedPrimitive Normalization.normalize
  rw [hp]
  simp

theorem checked_classification {m : ℕ} (hm : 1<m) (x : Fin 4 → ℕ) (tree : Tree 4)
    (hcheck : check 2 9 shortTerminal tree m x=true)
    (v : Fin 4 → ℕ) (hv : ∀ i, 0<v i) (hrep : Represents m x v)
    (hp : Search.Primitive v) (hlow : value (List.ofFn v)<(2/9 : ℝ)) :
    (List.ofFn v).Perm [1,2,3,4] ∨ (List.ofFn v).Perm [1,3,4,7] := by
  obtain ⟨ds,hdir,hperm⟩ := checked_direction hm x tree hcheck v hv hrep hp hlow
  have hval : value ds=value (List.ofFn v) :=
    (CriticalFamilies.value_perm hperm).symm
  rcases directions_classified ds hdir (by rwa [hval]) with rfl | rfl
  · exact Or.inl hperm
  · exact Or.inr hperm

end Loneliness.Modular.FourSpeed.Lifts
