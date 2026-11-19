import Conjectures.LonelinessPlaneWitness

/-! Logical soundness and complete permutation coverage for the short
finite-plane certificates. All numerical certificates are checked separately. -/

namespace Loneliness.PlaneCertificate

theorem witnessCheck_sound (q c : Vector) (r : Option Rejection)
    (h : witnessCheck q c r = true) : pairTest q c = true := by
  cases r with
  | none =>
    change productTest q c = true at h
    simp [pairTest, h]
  | some r =>
    have hparts : r.first < r.second ∧
        (∀ k, r.values k = repeatedLine q c r.first r.second (rejectionSign r) k) ∧
        nonzeroTest r.values = true ∧ criticalSupportTest r.values = false := by
      simpa [witnessCheck, List.all_eq_true, and_assoc] using h
    obtain ⟨hlt, hvalues, hnz, hcrit⟩ := hparts
    have heq : r.values = repeatedLine q c r.first r.second (rejectionSign r) :=
      funext hvalues
    have hline : lineTest r.values = false := by simp [lineTest, hnz, hcrit]
    cases ha : admissibleTest q c with
    | false => simp [pairTest, ha]
    | true =>
      simp only [admissibleTest, List.all_eq_true] at ha
      have hh := ha r.first (by simp) r.second (by simp)
      rw [ite_eq_left hlt] at hh
      have hh' : lineTest (repeatedLine q c r.first r.second 1) = true ∧
          lineTest (repeatedLine q c r.first r.second (-1)) = true := by simpa using hh
      have hgood : lineTest (repeatedLine q c r.first r.second (rejectionSign r)) = true := by
        cases hp : r.positive
        · simpa [rejectionSign, hp] using hh'.2
        · simpa [rejectionSign, hp] using hh'.1
      rw [← heq, hline] at hgood
      contradiction

theorem witnessBlockCheck_sound (i j : Fin 8)
    (cert : Fin 120 → Fin 16 → Option Rejection)
    (h : witnessBlockCheck i j cert = true) (n : Fin 120) (mask : Fin 16) :
    pairTest (canonical i) (tableCandidate j (permutationAt n) mask) = true := by
  apply witnessCheck_sound _ _ (cert n mask)
  simp only [witnessBlockCheck, List.all_eq_true] at h
  exact h n (by simp) mask (by simp)

theorem witnessRowCheck_sound (i j : Fin 8) (n : Fin 120)
    (cert : Fin 16 → Option Rejection)
    (h : witnessRowCheck i j n cert = true) (mask : Fin 16) :
    pairTest (canonical i) (tableCandidate j (permutationAt n) mask) = true := by
  apply witnessCheck_sound _ _ (cert mask)
  simp only [witnessRowCheck, List.all_eq_true] at h
  exact h mask (by simp)

theorem permutationAt_covers (p : Equiv.Perm (Fin 5)) :
    ∃ n : Fin 120, permutationAt n = fun i => p i := by
  have hp : (fun i => p i) ∈ permutationTable := by
    rw [← permutationTable_eq]
    apply List.mem_map.mpr
    refine ⟨p, ?_, rfl⟩
    exact mem_permsOfList_of_mem (fun x _ => by simp)
  obtain ⟨n, hn⟩ := List.mem_iff_get.mp hp
  let k : Fin 120 := Fin.cast permutationTable_length n
  refine ⟨k, ?_⟩
  simpa [permutationAt, k] using hn

theorem staticCaseCheck_sound (i j : Fin 8)
    (h : staticCaseCheck i j = true) (n : Fin 120) (mask : Fin 16) :
    pairTest (canonical i) (tableCandidate j (permutationAt n) mask) = true := by
  simp only [staticCaseCheck, List.all_eq_true] at h
  exact h (permutationAt n) (List.getElem_mem _) mask (by simp)

theorem certificate_covers_permutation (i j : Fin 8)
    (cert : Fin 120 → Fin 16 → Option Rejection)
    (h : witnessBlockCheck i j cert = true)
    (p : Equiv.Perm (Fin 5)) (mask : Fin 16) :
    pairTest (canonical i) (candidate j p mask) = true := by
  obtain ⟨n, hn⟩ := permutationAt_covers p
  have ht := witnessBlockCheck_sound i j cert h n mask
  rw [hn] at ht
  exact ht

end Loneliness.PlaneCertificate
