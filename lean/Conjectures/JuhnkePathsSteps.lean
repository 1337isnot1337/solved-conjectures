import Conjectures.JuhnkePathsBasic
import Mathlib.Data.List.OfFn

/-!
# Juhnke's conjecture

An explicit equivalence verifies that the path representation contains every
finite ordered list of positive east/north steps exactly once.
-/

namespace Juhnke

/-- Ordinary ordered positive E/N steps of total unit length `N`. -/
abbrev StepList (N : ℕ) :=
  {l : List (Bool × ℕ) // (∀ s ∈ l, 0 < s.2) ∧ (l.map Prod.snd).sum = N}

def literalPathOfSteps {N : ℕ} (l : StepList N) : LiteralPath N :=
  ⟨⟨l.val.map Prod.snd, by
      intro n hn
      obtain ⟨s, hs, rfl⟩ := List.mem_map.mp hn
      exact l.property.1 s hs,
    l.property.2⟩,
   fun i ↦ (l.val.get ⟨i.val, by
     simpa only [List.length_map] using
       (show i.val < (l.val.map Prod.snd).length from i.isLt)⟩).1⟩

theorem literalPathOfSteps_steps {N : ℕ} (l : StepList N) :
    (literalPathOfSteps l).steps = l.val := by
  apply List.ext_getElem
  · simp [LiteralPath.steps, literalPathOfSteps, Composition.length]
  · intro i hi hi'
    simp [LiteralPath.steps, literalPathOfSteps, Composition.blocksFun]

theorem literalPath_steps_injective (N : ℕ) :
    Function.Injective (fun p : LiteralPath N ↦ p.steps) := by
  rintro ⟨c, f⟩ ⟨d, g⟩ h
  have hc : c = d := by
    apply Composition.ext
    simpa [LiteralPath.steps, List.map_ofFn, Function.comp_def,
      Composition.ofFn_blocksFun] using congrArg (List.map Prod.snd) h
  subst d
  have hf : f = g := by
    apply List.ofFn_injective
    simpa [LiteralPath.steps, List.map_ofFn, Function.comp_def] using
      congrArg (List.map Prod.fst) h
  subst g
  rfl

/-- No paths are lost or duplicated by the composition-and-label representation. -/
def literalPathStepsEquiv (N : ℕ) : LiteralPath N ≃ StepList N where
  toFun p := ⟨p.steps, p.steps_positive, p.steps_total⟩
  invFun := literalPathOfSteps
  left_inv p := by
    apply literalPath_steps_injective N
    exact literalPathOfSteps_steps _
  right_inv l := by
    apply Subtype.ext
    exact literalPathOfSteps_steps l

theorem literalPathStepsEquiv_length {N : ℕ} (p : LiteralPath N) :
    ((literalPathStepsEquiv N) p).val.length = p.stepCount := p.steps_length

theorem literalPathStepsEquiv_east {N : ℕ} (p : LiteralPath N) :
    (((literalPathStepsEquiv N) p).val.map fun s ↦ if s.1 then s.2 else 0).sum = p.east := by
  simp [literalPathStepsEquiv, LiteralPath.steps, LiteralPath.east,
    List.map_ofFn, Function.comp_def, List.sum_ofFn]

theorem literalPathStepsEquiv_north {N : ℕ} (p : LiteralPath N) :
    (((literalPathStepsEquiv N) p).val.map fun s ↦ if s.1 then 0 else s.2).sum = p.north := by
  simp [literalPathStepsEquiv, LiteralPath.steps, LiteralPath.north,
    List.map_ofFn, Function.comp_def, List.sum_ofFn]

end Juhnke
