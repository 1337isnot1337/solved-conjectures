module

public import Conjectures.FranklSmallCyclicTheorem
public import Mathlib.Data.ZMod.Basic

/-! The small-cycle theorem in the shared residue-coordinate API.
For a positive period, Lean's residue type is the corresponding finite
coordinate type. The generated-family and frequency definitions coincide. -/
@[expose] public section

namespace FranklSmallCyclic

theorem cyclic_abundance_le_six_zmod {n : ℕ} [NeZero n] (hn : n ≤ 6)
    {G : Finset (Finset (ZMod n))}
    (hspan : ∀ g ∈ G, ∃ p : ZMod n,
      g ⊆ (Finset.univ : Finset (Fin 4)).image (fun j => p + (j.val : ZMod n)))
    (hG : ∃ g ∈ G, g.Nonempty) :
    ∃ x, Frankl.Abundant (Frankl.generatedUnions G) x := by
  cases n with
  | zero => exact False.elim (NeZero.ne 0 rfl)
  | succ m =>
      change ∃ x : Fin (m + 1), Frankl.Abundant (Frankl.generatedUnions G) x
      exact cyclic_abundance_le_six hn hspan hG

end FranklSmallCyclic
