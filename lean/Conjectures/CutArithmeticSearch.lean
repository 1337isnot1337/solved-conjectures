import Conjectures.CutArithmeticTest
import Conjectures.BinaryTailArithmetic
import Mathlib.Logic.Encodable.Pi

/-! Exhaustive, effective search over all finite prefixes and arithmetic tails.
Every bounded search terminates. If a representation exists, some bounded
search returns a representation whose equality with the game is proved here. -/
namespace BinaryAutomata

instance : Encodable Tail :=
  Encodable.ofEquiv
    (List Nat × (Σ p : {p : Nat // 0<p}, (Fin p.val → Nat) × Nat)) {
      toFun := fun T => (T.initialValues,⟨⟨T.period,T.period_pos⟩,T.block,T.saltus⟩)
      invFun := fun d => ⟨d.1,d.2.1.val,d.2.1.property,d.2.2.1,d.2.2.2⟩
      left_inv := by intro T; cases T; rfl
      right_inv := by rintro ⟨l,⟨⟨p,hp⟩,b,s⟩⟩; rfl
    }

end BinaryAutomata

namespace CutPeriod.Decision
open BinaryAutomata CutFamily

def testedCandidate (cuts : Finset Nat) (code : Nat) : Option Tail :=
  (Encodable.decode (α:=Tail) code).filter (fun T => finiteSetTest T cuts)

theorem testedCandidate_correct (cuts : Finset Nat) (code : Nat) (T : Tail) :
    testedCandidate cuts code=some T ↔ Encodable.decode (α:=Tail) code=some T ∧
      ∀ n, 0<n → T.value n=gameValue (↑cuts : Set Nat) n := by
  rw [testedCandidate,Option.filter_eq_some_iff,finiteSetTest_iff_gameValue]

/-- Test candidates with codes strictly below `bound`, returning the first
candidate accepted by the complete arithmetic-periodicity test. -/
def searchBound (cuts : Finset Nat) (bound : Nat) : Option Tail :=
  (List.range bound).findSome? (testedCandidate cuts)

theorem searchBound_sound (cuts : Finset Nat) (bound : Nat) (T : Tail)
    (h : searchBound cuts bound=some T) :
    ∀ n, 0<n → T.value n=gameValue (↑cuts : Set Nat) n := by
  obtain ⟨code,_,hc⟩ := List.exists_of_findSome?_eq_some h
  exact ((testedCandidate_correct cuts code T).mp hc).2

theorem searchBound_complete (cuts : Finset Nat) (T : Tail)
    (h : ∀ n, 0<n → T.value n=gameValue (↑cuts : Set Nat) n) :
    (searchBound cuts (Encodable.encode T+1)).isSome=true := by
  have hc : testedCandidate cuts (Encodable.encode T)=some T :=
    (testedCandidate_correct cuts _ T).mpr ⟨Encodable.encodek T,h⟩
  apply List.findSome?_isSome_iff.mpr
  refine ⟨Encodable.encode T,List.mem_range.mpr (Nat.lt_succ_self _),?_⟩
  rw [hc]
  rfl

/-- A finite search succeeds exactly when some finite prefix and arithmetic
tail represents the game's values on every positive pile. -/
theorem search_eventually_iff (cuts : Finset Nat) :
    (∃ bound T, searchBound cuts bound=some T) ↔
      ∃ T : Tail, ∀ n, 0<n → T.value n=gameValue (↑cuts : Set Nat) n := by
  constructor
  · rintro ⟨bound,T,hT⟩
    exact ⟨T,searchBound_sound cuts bound T hT⟩
  · rintro ⟨T,hT⟩
    have hsome := searchBound_complete cuts T hT
    cases he : searchBound cuts (Encodable.encode T+1) with
    | none => simp only [he,Option.isSome_none,Bool.false_eq_true] at hsome
    | some S => exact ⟨Encodable.encode T+1,S,he⟩

theorem search_eventually_iff_arithmetic (cuts : Finset Nat) :
    (∃ bound T, searchBound cuts bound=some T) ↔
      UltimatelyArithmetic (gameValue (↑cuts : Set Nat)) :=
  (search_eventually_iff cuts).trans
    (ultimatelyArithmetic_iff_representation _).symm

#print axioms searchBound_sound
#print axioms searchBound_complete
#print axioms search_eventually_iff
#print axioms search_eventually_iff_arithmetic
end CutPeriod.Decision
