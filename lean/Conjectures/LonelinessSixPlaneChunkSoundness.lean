import Conjectures.LonelinessSixPlaneDataDefs

/-! Join arbitrary positive-size chunks of the finite pair certificate. Every
row is recovered by quotient and remainder, so chunking does not discard any
candidate. The numerical coverage and chunk checks remain explicit inputs. -/

namespace Loneliness.SixPlane.Data

theorem partialCheck_sound (i j : Fin 10) (start count : ℕ)
    (hcheck : partialCheck i j start count = true)
    (offset : ℕ) (hoffset : offset < count) (mask : Fin 32) :
    let row : Fin 360 := ⟨(start + offset) % 360, Nat.mod_lt _ (by decide)⟩
    certificateCheck (canonical i) (rowCandidate directionAt j row mask)
      (rowCertificates i j row mask) = true := by
  exact certificateRowCheck_sound directionAt i j _ _
    (List.all_eq_true.mp hcheck offset (List.mem_range.mpr hoffset)) mask

theorem enumeratedPairsChecked_of_partialChecks (size : ℕ) (hsize : 0 < size)
    (hchecked : ∀ (i j : Fin 10) (block : ℕ), block * size < 360 →
      partialCheck i j (block * size) size = true) : EnumeratedPairsChecked directionAt := by
  intro i j row mask
  have hsum : (row.val / size) * size + row.val % size = row.val := by
    simpa only [Nat.add_comm, Nat.mul_comm] using Nat.mod_add_div row.val size
  have hle := Nat.le_add_right ((row.val / size) * size) (row.val % size)
  rw [hsum] at hle
  have hblock : (row.val / size) * size < 360 := hle.trans_lt row.isLt
  have htest := partialCheck_sound i j ((row.val / size) * size) size
    (hchecked i j (row.val / size) hblock) (row.val % size) (Nat.mod_lt _ hsize) mask
  let selectedRow : Fin 360 :=
    ⟨((row.val / size) * size + row.val % size) % 360, Nat.mod_lt _ (by decide)⟩
  have heq : selectedRow = row := by
    apply Fin.ext
    change ((row.val / size) * size + row.val % size) % 360 = row.val
    rw [hsum, Nat.mod_eq_of_lt row.isLt]
  change certificateCheck (canonical i) (rowCandidate directionAt j selectedRow mask)
    (rowCertificates i j selectedRow mask) = true at htest
  rw [heq] at htest
  exact ⟨rowCertificates i j row mask, htest⟩

theorem enumeratedPairsChecked_of_fixed_chunks (size blocks : ℕ) (hsize : 0 < size)
    (hcover : blocks * size = 360)
    (hchecked : ∀ (i j : Fin 10) (block : Fin blocks),
      partialCheck i j (block.val * size) size = true) : EnumeratedPairsChecked directionAt := by
  apply enumeratedPairsChecked_of_partialChecks size hsize
  intro i j block hblock
  have hbound : block < blocks := by
    by_contra hn
    have hle := Nat.mul_le_mul_right size (Nat.le_of_not_gt hn)
    rw [hcover] at hle
    exact (not_lt_of_ge hle) hblock
  exact hchecked i j ⟨block, hbound⟩

theorem candidatePairsChecked_of_fixed_chunks
    (hcoverage : directionCoverageCheck directionAt rankToRow = true)
    (size blocks : ℕ) (hsize : 0 < size) (hcover : blocks * size = 360)
    (hchecked : ∀ (i j : Fin 10) (block : Fin blocks),
      partialCheck i j (block.val * size) size = true) : CandidatePairsChecked :=
  candidatePairsChecked_of_enumeration directionAt rankToRow hcoverage
    (enumeratedPairsChecked_of_fixed_chunks size blocks hsize hcover hchecked)

end Loneliness.SixPlane.Data
