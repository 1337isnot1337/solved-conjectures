import Conjectures.LiEliminate
import Conjectures.LiChromatic

/-!
# Bridge between the leaf-elimination partition function and `aeval`

The elimination module `LiEliminate` works with colourings of a finite subtype
`{v // v ∈ S}`.  This file identifies the case `S = univ` with the
`MvPolynomial.aeval` evaluation of the three-variable chromatic polynomial.
-/

open scoped BigOperators

namespace LiBridge

variable {V : Type*} [Fintype V] [DecidableEq V]
variable {A : Type*} [CommRing A]

/-- The partition function on the whole vertex set, as an `if`-sum. -/
theorem partFunOn_univ (G : SimpleGraph V) [DecidableRel G.Adj]
    (w : V → Fin 3 → A) :
    LiElim.partFunOn G Finset.univ w =
      ∑ κ : V → Fin 3, if Li.proper3 G κ then ∏ v : V, w v (κ v) else 0 := by
  classical
  rw [LiElim.partFunOn]
  let e : ({v // v ∈ (Finset.univ : Finset V)} → Fin 3) ≃ (V → Fin 3) :=
    Equiv.arrowCongr (Equiv.subtypeUnivEquiv (fun _ => Finset.mem_univ _))
      (Equiv.refl (Fin 3))
  -- Each summand only involves the colouring through its composite with `e`.
  have hterm : ∀ x : ({v // v ∈ (Finset.univ : Finset V)} → Fin 3),
      (if (∀ u v : {v // v ∈ (Finset.univ : Finset V)}, G.Adj u v → x u ≠ x v) then
        (Finset.univ).attach.prod (fun v => w v.1 (x v))
      else 0) =
      (if Li.proper3 G (fun v => x ⟨v, Finset.mem_univ v⟩) then
        ∏ v : V, w v (x ⟨v, Finset.mem_univ v⟩)
      else 0) := by
    intro x
    by_cases h : (∀ u v : {v // v ∈ (Finset.univ : Finset V)}, G.Adj u v → x u ≠ x v)
    · have h' : Li.proper3 G (fun v => x ⟨v, Finset.mem_univ v⟩) := by
        intro u v huv
        exact h ⟨u, Finset.mem_univ u⟩ ⟨v, Finset.mem_univ v⟩ huv
      rw [ite_eq_left h, ite_eq_left h']
      rw [Finset.prod_attach_univ]
    · have h' : ¬ Li.proper3 G (fun v => x ⟨v, Finset.mem_univ v⟩) := by
        intro hh
        apply h
        intro u v huv
        exact hh u.1 v.1 huv
      rw [ite_eq_right h, ite_eq_right h']
  simp only [hterm]
  refine Fintype.sum_equiv e _ _ (fun x => ?_)
  have hx : e x = fun v => x ⟨v, Finset.mem_univ v⟩ := by
    funext v
    simp [e, Equiv.arrowCongr]
  rw [hx]

end LiBridge
