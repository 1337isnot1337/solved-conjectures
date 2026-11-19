import Conjectures.PackingDensity
import Mathlib.Logic.Equiv.Fin.Basic
import Mathlib.Data.ZMod.Basic

/-! Finite rectangular tilings used to construct the sharp periodic examples.
Every tiling identity is proved for arbitrary rectangle dimensions. -/
namespace PackingFourPoint

def gridEquiv (u v : ℕ) :
    ((Fin v × Fin u) × (Fin 2 × Fin 2)) ≃ Fin ((v*2)*(u*2)) :=
  (Equiv.prodProdProdComm (Fin v) (Fin u) (Fin 2) (Fin 2)).trans
    ((Equiv.prodCongr finProdFinEquiv finProdFinEquiv).trans finProdFinEquiv)

def gridCenter (u v : ℕ) (c : Fin v × Fin u) : ℕ :=
  (u*2)*(2*c.1.val)+2*c.2.val

def gridOffset (u : ℕ) (d : Fin 2 × Fin 2) : ℕ :=
  (u*2)*d.1.val+d.2.val

theorem gridEquiv_value (u v : ℕ) (e : (Fin v × Fin u) × (Fin 2 × Fin 2)) :
    (gridEquiv u v e).val = gridCenter u v e.1 + gridOffset u e.2 := by
  change (e.2.2.val+2*e.1.2.val)+(u*2)*(e.2.1.val+2*e.1.1.val) =
    (u*2)*(2*e.1.1.val)+2*e.1.2.val+((u*2)*e.2.1.val+e.2.2.val)
  ring

theorem grid_encode_injective (u v : ℕ) :
    Function.Injective (fun e : (Fin v × Fin u) × (Fin 2 × Fin 2) =>
      gridCenter u v e.1 + gridOffset u e.2) := by
  intro e e' he
  apply (gridEquiv u v).injective
  apply Fin.ext
  simpa only [gridEquiv_value] using he

theorem grid_encode_lt (u v : ℕ) (e : (Fin v × Fin u) × (Fin 2 × Fin 2)) :
    gridCenter u v e.1 + gridOffset u e.2 < (v*2)*(u*2) := by
  rw [← gridEquiv_value]
  exact (gridEquiv u v e).isLt

theorem grid_tiling (u v n : ℕ) (hn : n < (v*2)*(u*2)) :
    ∃! e : (Fin v × Fin u) × (Fin 2 × Fin 2),
      gridCenter u v e.1 + gridOffset u e.2 = n := by
  obtain ⟨e, he⟩ := (gridEquiv u v).surjective ⟨n, hn⟩
  have hv := congrArg Fin.val he
  refine ⟨e, ?_, ?_⟩
  · simpa only [gridEquiv_value] using hv
  · intro e' he'
    apply grid_encode_injective u v
    simpa only [gridEquiv_value] using he'.trans hv.symm

/-- Reducing a completely tiled rectangle modulo a larger period preserves
disjointness. -/
theorem grid_mod_injective (u v P : ℕ) (hP : (v*2)*(u*2) ≤ P) :
    Function.Injective (fun e : (Fin v × Fin u) × (Fin 2 × Fin 2) =>
      ((gridCenter u v e.1 + gridOffset u e.2 : ℕ) : ZMod P)) := by
  intro e e' he
  apply grid_encode_injective u v
  have h1 := (grid_encode_lt u v e).trans_le hP
  have h2 := (grid_encode_lt u v e').trans_le hP
  have hh := (ZMod.natCast_eq_natCast_iff' _ _ P).mp he
  simpa only [Nat.mod_eq_of_lt h1, Nat.mod_eq_of_lt h2] using hh

/-- Reducing a completely tiled rectangle modulo a smaller positive period
covers every residue. -/
theorem grid_mod_surjective (u v P : ℕ) [NeZero P] (hP : P ≤ (v*2)*(u*2)) :
    Function.Surjective (fun e : (Fin v × Fin u) × (Fin 2 × Fin 2) =>
      ((gridCenter u v e.1 + gridOffset u e.2 : ℕ) : ZMod P)) := by
  intro z
  obtain ⟨e, he, _⟩ := grid_tiling u v z.val ((ZMod.val_lt z).trans_le hP)
  refine ⟨e, ?_⟩
  change ((gridCenter u v e.1 + gridOffset u e.2 : ℕ) : ZMod P) = z
  rw [he, ZMod.natCast_zmod_val]

end PackingFourPoint
