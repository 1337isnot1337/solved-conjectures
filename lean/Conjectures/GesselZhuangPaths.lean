module

public import Mathlib.Data.Fintype.Vector
public import Mathlib.Data.Finset.Basic

/-!
# Gessel–Zhuang conjecture

Height paths for the internal-gap construction in the existing entry
`results/gessel-zhuang-pinnacle-gamma/PROOF.md`. A path with `n` steps
describes a permutation of `n+1` labels, starting with the first label
and no internal gaps. Down steps are permitted only at positive height.
-/

@[expose] public section

namespace GesselZhuang

/-- A valid sequence of changes in the number of internal gaps. -/
inductive HeightPath : ℕ → ℕ → Type
  | start : HeightPath 0 0
  | up {n h : ℕ} : HeightPath n h → HeightPath (n + 1) (h + 1)
  | flat {n h : ℕ} : HeightPath n h → HeightPath (n + 1) h
  | down {n h : ℕ} : HeightPath n (h + 1) → HeightPath (n + 1) h
  deriving DecidableEq

namespace HeightPath

/-- Reverse chronological step tags, used only to supply finite enumeration. -/
def code : {n h : ℕ} → HeightPath n h → List (Fin 3)
  | _, _, .start => []
  | _, _, .up p => 0 :: p.code
  | _, _, .flat p => 1 :: p.code
  | _, _, .down p => 2 :: p.code

@[simp] theorem code_length {n h : ℕ} (p : HeightPath n h) : p.code.length = n := by
  induction p <;> simp_all [code]

theorem code_injective {n h : ℕ} : Function.Injective (@code n h) := by
  intro p q heq
  induction p with
  | start => cases q; rfl
  | up p ih =>
    cases q with
    | up q => exact congrArg HeightPath.up (ih (List.cons.inj heq).2)
    | flat q => simp [code] at heq
    | down q => simp [code] at heq
  | flat p ih =>
    cases q with
    | up q => simp [code] at heq
    | flat q => exact congrArg HeightPath.flat (ih (List.cons.inj heq).2)
    | down q => simp [code] at heq
  | down p ih =>
    cases q with
    | up q => simp [code] at heq
    | flat q => simp [code] at heq
    | down q => exact congrArg HeightPath.down (ih (List.cons.inj heq).2)

instance {n h : ℕ} : Finite (HeightPath n h) :=
  Finite.of_injective (β := List.Vector (Fin 3) n)
    (fun p : HeightPath n h => ⟨p.code, p.code_length⟩)
    (fun _ _ h => code_injective (congrArg Subtype.val h))

noncomputable instance {n h : ℕ} : Fintype (HeightPath n h) := Fintype.ofFinite _

theorem height_le_steps {n h : ℕ} (p : HeightPath n h) : h ≤ n := by
  induction p with
  | start => rfl
  | up p ih => omega
  | flat p ih => omega
  | down p ih => omega

/-- Original one-based labels attached to down steps. -/
def downLabels : {n h : ℕ} → HeightPath n h → Finset ℕ
  | _, _, .start => ∅
  | _, _, .up p => p.downLabels
  | _, _, .flat p => p.downLabels
  | n + 1, _, .down p => insert (n + 2) p.downLabels

theorem downLabels_bounds {n h : ℕ} (p : HeightPath n h) {i : ℕ}
    (hi : i ∈ p.downLabels) : 2 ≤ i ∧ i ≤ n + 1 := by
  induction p with
  | start => simp [downLabels] at hi
  | up p ih => have h := ih hi; omega
  | flat p ih => have h := ih hi; omega
  | down p ih =>
    simp only [downLabels, Finset.mem_insert] at hi
    rcases hi with rfl | hi
    · omega
    · have h := ih hi; omega

end HeightPath

end GesselZhuang
