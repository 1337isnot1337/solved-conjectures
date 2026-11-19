import Conjectures.LonelinessSixPlaneDefs

/-! Exact finite coverage for the six-plane certificates. Lehmer ranks index
all 720 coordinate permutations in lexicographic order. A checked lookup maps
these to the 360 distinct permutations of each repeated-speed vector, avoiding
an existential search for each checked pair. Numerical tables are arguments. -/

namespace Loneliness.SixPlane

def permutationRankScore (p : Equiv.Perm (Fin 6)) : ℕ :=
  ((List.finRange 6).map fun i =>
    ((List.finRange 6).filter fun j => decide (i < j ∧ p j < p i)).length *
      Nat.factorial (5 - i.val)).sum

def permutationRank (p : Equiv.Perm (Fin 6)) : Fin 720 :=
  ⟨permutationRankScore p % 720, Nat.mod_lt _ (by decide)⟩

def permutationUnrank : ℕ → ℕ → List (Fin 6) → List (Fin 6)
  | 0, _, _ => []
  | n + 1, rank, available =>
      let digit := (available[rank / Nat.factorial n]?).getD 0
      digit :: permutationUnrank n (rank % Nat.factorial n) (available.erase digit)

def permutationAt (rank : Fin 720) (i : Fin 6) : Fin 6 :=
  ((permutationUnrank 6 rank.val (List.finRange 6))[i.val]?).getD 0

set_option maxRecDepth 100000 in
theorem permutation_rank_check :
    (permsOfList (List.finRange 6)).all (fun p =>
      (List.finRange 6).all (fun i => permutationAt (permutationRank p) i == p i)) = true := by
  decide +kernel

theorem permutationAt_rank (p : Equiv.Perm (Fin 6)) (i : Fin 6) :
    permutationAt (permutationRank p) i = p i := by
  have hp : p ∈ permsOfList (List.finRange 6) :=
    mem_permsOfList_of_mem (fun x _ => by simp)
  have hrow := List.all_eq_true.mp permutation_rank_check p hp
  have hi := List.all_eq_true.mp hrow i (by simp)
  simpa only [beq_iff_eq] using hi

def directionCoverageCheck (directionAt : Fin 10 → Fin 360 → Vector)
    (rankToRow : Fin 10 → Fin 720 → Fin 360) : Bool :=
  (List.finRange 10).all fun j =>
    (List.finRange 720).all fun rank =>
      (List.finRange 6).all fun i =>
        canonical j (permutationAt rank i) == directionAt j (rankToRow j rank) i

theorem directionCoverageCheck_sound (directionAt : Fin 10 → Fin 360 → Vector)
    (rankToRow : Fin 10 → Fin 720 → Fin 360)
    (hcheck : directionCoverageCheck directionAt rankToRow = true)
    (j : Fin 10) (p : Equiv.Perm (Fin 6)) :
    directionAt j (rankToRow j (permutationRank p)) = fun i => canonical j (p i) := by
  simp only [directionCoverageCheck, List.all_eq_true, beq_iff_eq] at hcheck
  funext i
  have hi := hcheck j (by simp) (permutationRank p) (by simp) i (by simp)
  rw [permutationAt_rank] at hi
  exact hi.symm

def rowCandidate (directionAt : Fin 10 → Fin 360 → Vector)
    (j : Fin 10) (row : Fin 360) (mask : Fin 32) : Vector :=
  fun i => signs mask i * directionAt j row i

theorem candidate_eq_rowCandidate (directionAt : Fin 10 → Fin 360 → Vector)
    (rankToRow : Fin 10 → Fin 720 → Fin 360)
    (hcheck : directionCoverageCheck directionAt rankToRow = true)
    (j : Fin 10) (p : Equiv.Perm (Fin 6)) (mask : Fin 32) :
    candidate j p mask = rowCandidate directionAt j (rankToRow j (permutationRank p)) mask := by
  exact congrArg (fun w : Vector => fun i => signs mask i * w i)
    (directionCoverageCheck_sound directionAt rankToRow hcheck j p).symm

def EnumeratedPairsChecked (directionAt : Fin 10 → Fin 360 → Vector) : Prop :=
  ∀ (i j : Fin 10) (row : Fin 360) (mask : Fin 32),
    ∃ certificate : PairCertificate,
      certificateCheck (canonical i) (rowCandidate directionAt j row mask) certificate = true

def certificateRowCheck (directionAt : Fin 10 → Fin 360 → Vector)
    (i j : Fin 10) (row : Fin 360) (certificates : Fin 32 → PairCertificate) : Bool :=
  (List.finRange 32).all fun mask =>
    certificateCheck (canonical i) (rowCandidate directionAt j row mask) (certificates mask)

theorem certificateRowCheck_sound (directionAt : Fin 10 → Fin 360 → Vector)
    (i j : Fin 10) (row : Fin 360) (certificates : Fin 32 → PairCertificate)
    (hcheck : certificateRowCheck directionAt i j row certificates = true) (mask : Fin 32) :
    certificateCheck (canonical i) (rowCandidate directionAt j row mask) (certificates mask) = true := by
  exact List.all_eq_true.mp hcheck mask (by simp)

def certificateBlockCheck (directionAt : Fin 10 → Fin 360 → Vector)
    (i j : Fin 10) (certificates : Fin 360 → Fin 32 → PairCertificate) : Bool :=
  (List.finRange 360).all fun row =>
    certificateRowCheck directionAt i j row (certificates row)

theorem certificateBlockCheck_sound (directionAt : Fin 10 → Fin 360 → Vector)
    (i j : Fin 10) (certificates : Fin 360 → Fin 32 → PairCertificate)
    (hcheck : certificateBlockCheck directionAt i j certificates = true)
    (row : Fin 360) (mask : Fin 32) :
    certificateCheck (canonical i) (rowCandidate directionAt j row mask)
      (certificates row mask) = true := by
  apply certificateRowCheck_sound directionAt i j row (certificates row)
  exact List.all_eq_true.mp hcheck row (by simp)

theorem enumeratedPairsChecked_of_blocks (directionAt : Fin 10 → Fin 360 → Vector)
    (certificates : Fin 10 → Fin 10 → Fin 360 → Fin 32 → PairCertificate)
    (hchecked : ∀ i j, certificateBlockCheck directionAt i j (certificates i j) = true) :
    EnumeratedPairsChecked directionAt := by
  intro i j row mask
  exact ⟨certificates i j row mask,
    certificateBlockCheck_sound directionAt i j (certificates i j) (hchecked i j) row mask⟩

theorem candidatePairsChecked_of_enumeration (directionAt : Fin 10 → Fin 360 → Vector)
    (rankToRow : Fin 10 → Fin 720 → Fin 360)
    (hcoverage : directionCoverageCheck directionAt rankToRow = true)
    (hchecked : EnumeratedPairsChecked directionAt) : CandidatePairsChecked := by
  intro i j p mask
  obtain ⟨certificate, hcertificate⟩ := hchecked i j (rankToRow j (permutationRank p)) mask
  refine ⟨certificate, ?_⟩
  rw [candidate_eq_rowCandidate directionAt rankToRow hcoverage j p mask]
  exact hcertificate

end Loneliness.SixPlane
