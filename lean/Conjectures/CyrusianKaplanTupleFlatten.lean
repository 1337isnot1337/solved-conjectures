module
public import Conjectures.CyrusianKaplanIntegerLattice
public import Mathlib.Data.Fin.Tuple.Basic
public import Mathlib.LinearAlgebra.AffineSpace.FiniteDimensional
public import Mathlib.LinearAlgebra.Dimension.Free

@[expose] public section
namespace CyrusianKaplan

def tupleFlatten (r : ℕ) (α : Type*) :
    ((Fin r→α) × (Fin r→α)) ≃ (Fin (r+r)→α) where
  toFun z := Fin.append z.1 z.2
  invFun z := (fun i => z (Fin.castAdd r i),fun i => z (Fin.natAdd r i))
  left_inv z := by
    apply Prod.ext <;> funext i
    · exact Fin.append_left _ _ _
    · exact Fin.append_right _ _ _
  right_inv z := Fin.append_castAdd_natAdd

def tupleFlattenLinear (r : ℕ) : TupleSpace r ≃ₗ[ℝ] (Fin (r+r)→ℝ) where
  toEquiv := tupleFlatten r ℝ
  map_add' x y := by
    funext i
    refine Fin.addCases (fun j => ?_) (fun j => ?_) i
    · simp [tupleFlatten,Fin.append_left]
    · simp only [tupleFlatten, Fin.append_right, Prod.fst_add, Prod.snd_add, Pi.add_apply]
  map_smul' a x := by
    funext i
    refine Fin.addCases (fun j => ?_) (fun j => ?_) i
    · simp [tupleFlatten,Fin.append_left]
    · simp only [tupleFlatten, Fin.append_right, Prod.smul_snd, Pi.smul_apply, RingHom.id_apply]

theorem tupleFlatten_cast_int {r : ℕ} (z : (Fin r → ℤ) × (Fin r → ℤ)) (i : Fin (r+r)) :
    tupleFlattenLinear r (integerTupleCast r z) i = ((tupleFlatten r ℤ z i:ℤ):ℝ) := by
  refine Fin.addCases (fun j => ?_) (fun j => ?_) i
  · simp [tupleFlattenLinear,tupleFlatten,Fin.append_left,integerTupleCast]
  · change Fin.append (fun i => (z.1 i:ℝ)) (fun i => (z.2 i:ℝ)) (Fin.natAdd r j) =
      (Fin.append z.1 z.2 (Fin.natAdd r j):ℤ)
    rw [Fin.append_right,Fin.append_right]

theorem tupleFlatten_cast_rat {r : ℕ} (a b : Fin r→ℚ) (i : Fin (r+r)) :
    tupleFlattenLinear r ((fun j => (a j:ℝ)),fun j => (b j:ℝ)) i =
      (tupleFlatten r ℚ (a,b) i:ℝ) := by
  refine Fin.addCases (fun j => ?_) (fun j => ?_) i
  · simp [tupleFlattenLinear,tupleFlatten,Fin.append_left]
  · change Fin.append (fun i => (a i:ℝ)) (fun i => (b i:ℝ)) (Fin.natAdd r j) =
      (Fin.append a b (Fin.natAdd r j):ℚ)
    rw [Fin.append_right,Fin.append_right]

theorem integerTupleCast_injective (r : ℕ) : Function.Injective (integerTupleCast r) := by
  intro z z' h
  apply Prod.ext
  · exact funext fun i => Int.cast_injective (congrFun (congrArg Prod.fst h) i)
  · exact funext fun i => Int.cast_injective (congrFun (congrArg Prod.snd h) i)

theorem affineIndependent_tuple_fin_card_le {r n : ℕ} {p : Fin n→TupleSpace r}
    (hp : AffineIndependent ℝ p) : n≤r+r+1 := by
  have hp' := hp.card_le_finrank_succ
  rw [Fintype.card_fin] at hp'
  have hD : Module.finrank ℝ (TupleSpace r)=r+r := by
    rw [(tupleFlattenLinear r).finrank_eq,Module.finrank_pi_fintype]
    simp
  have hl := Submodule.finrank_le (vectorSpan ℝ (Set.range p))
  rw [hD] at hl
  exact hp'.trans (Nat.add_le_add_right hl 1)

end CyrusianKaplan
