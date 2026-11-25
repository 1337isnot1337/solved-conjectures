module

public import Conjectures.GesselZhuangPaths
public import Mathlib.Data.Fintype.Prod
public import Mathlib.Data.Fintype.Option

/-!
# Gessel–Zhuang conjecture

Finite internal-gap histories. Separators are viewed as gaps between
nonempty blocks. Up inserts a singleton block; flat prepends or appends
the new maximum to one block; down merges adjacent blocks around it.
The recent block index is the number of separators to the left of the
most recently exposed value, exactly as in the existing proof.
-/

@[expose] public section

namespace GesselZhuang

/-- The insertion choices along one fixed height path. `true` means prepend in a flat step. -/
def History : {n h : ℕ} → HeightPath n h → Type
  | _, _, .start => Unit
  | _, h + 1, .up p => History p × Fin (h + 2)
  | _, h, .flat p => History p × (Fin (h + 1) × Bool)
  | _, h, .down p => History p × Fin (h + 1)

noncomputable instance {n h : ℕ} (p : HeightPath n h) : Fintype (History p) := by
  induction p with
  | start => exact inferInstanceAs (Fintype Unit)
  | @up n h p ih => letI := ih; exact inferInstanceAs (Fintype (History p × Fin (h + 2)))
  | @flat n h p ih => letI := ih; exact inferInstanceAs (Fintype (History p × (Fin (h + 1) × Bool)))
  | @down n h p ih => letI := ih; exact inferInstanceAs (Fintype (History p × Fin (h + 1)))

namespace History

/-- Number of internal gaps to the left of the most recent label. -/
def recent : {n h : ℕ} → (p : HeightPath n h) → History p → Fin (h + 1)
  | _, _, .start, _ => 0
  | _, _, .up _, H => H.2
  | _, _, .flat _, H => H.2.1
  | _, _, .down _, H => H.2

/-- The inverse comparisons recorded by the literal insertion choices. -/
def inverseDescents : {n h : ℕ} → (p : HeightPath n h) → History p → ℕ
  | _, _, .start, _ => 0
  | _, _, .up p, H =>
      inverseDescents p H.1 + if H.2.val ≤ (recent p H.1).val then 1 else 0
  | _, _, .flat p, H =>
      inverseDescents p H.1 +
        if H.2.2 then
          (if H.2.1.val ≤ (recent p H.1).val then 1 else 0)
        else (if H.2.1.val < (recent p H.1).val then 1 else 0)
  | _, _, .down p, H =>
      inverseDescents p H.1 + if H.2.val < (recent p H.1).val then 1 else 0

theorem inverseDescents_le {n h : ℕ} (p : HeightPath n h) (H : History p) :
    inverseDescents p H ≤ n := by
  induction p with
  | start => rfl
  | up p ih =>
    have hb := ih H.1
    simp only [inverseDescents]
    split_ifs <;> omega
  | flat p ih =>
    have hb := ih H.1
    simp only [inverseDescents]
    split_ifs <;> omega
  | down p ih =>
    have hb := ih H.1
    simp only [inverseDescents]
    split_ifs <;> omega

end History

end GesselZhuang
