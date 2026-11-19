import Conjectures.LonelinessSixPlaneDataDefs

/-! Assemble bounded coordinate-permutation coverage checks. The quotient and
remainder proof covers every rank; the numerical blocks remain explicit inputs. -/

namespace Loneliness.SixPlane.Data

def partialDirectionCheck (j : Fin 10) (start count : ℕ) : Bool :=
  (List.range count).all fun offset =>
    let rank : Fin 720 := ⟨(start + offset) % 720, Nat.mod_lt _ (by decide)⟩
    (List.finRange 6).all fun i =>
      canonical j (permutationAt rank i) == directionAt j (rankToRow j rank) i

theorem directionCoverageCheck_of_fixed_chunks (size blocks : ℕ) (hsize : 0 < size)
    (hcover : blocks * size = 720)
    (hchecked : ∀ (j : Fin 10) (block : Fin blocks),
      partialDirectionCheck j (block.val * size) size = true) :
    directionCoverageCheck directionAt rankToRow = true := by
  apply List.all_eq_true.mpr
  intro j _
  apply List.all_eq_true.mpr
  intro rank _
  have hsum : (rank.val / size) * size + rank.val % size = rank.val := by
    simpa only [Nat.add_comm, Nat.mul_comm] using Nat.mod_add_div rank.val size
  have hle := Nat.le_add_right ((rank.val / size) * size) (rank.val % size)
  rw [hsum] at hle
  have hblock : (rank.val / size) * size < 720 := hle.trans_lt rank.isLt
  have hbound : rank.val / size < blocks := by
    by_contra hn
    have hlarge := Nat.mul_le_mul_right size (Nat.le_of_not_gt hn)
    rw [hcover] at hlarge
    exact (not_lt_of_ge hlarge) hblock
  let block : Fin blocks := ⟨rank.val / size, hbound⟩
  have htest := List.all_eq_true.mp (hchecked j block) (rank.val % size)
    (List.mem_range.mpr (Nat.mod_lt _ hsize))
  let selectedRank : Fin 720 :=
    ⟨((rank.val / size) * size + rank.val % size) % 720, Nat.mod_lt _ (by decide)⟩
  have heq : selectedRank = rank := by
    apply Fin.ext
    change ((rank.val / size) * size + rank.val % size) % 720 = rank.val
    rw [hsum, Nat.mod_eq_of_lt rank.isLt]
  change (List.finRange 6).all (fun i =>
    canonical j (permutationAt selectedRank i) ==
      directionAt j (rankToRow j selectedRank) i) = true at htest
  rw [heq] at htest
  exact htest

end Loneliness.SixPlane.Data
