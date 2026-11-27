import Conjectures.ChenKhareSahiJackFamily

/-!
# Uniqueness of the degree-five Jack family at α = 2/3

Every family satisfying Stanley's characterization (monic, dominance-triangular in the
monomial basis, pairwise orthogonal for the power-sum scalar product) equals the exact
rational family `jackR`. The proof is Gram–Schmidt: orthogonality to the already
determined lower members gives a triangular linear system for each row.
-/

namespace ChenKhareSahi.Jack

noncomputable section

set_option maxRecDepth 32768
set_option maxHeartbeats 16000000

/-- The functional `v ↦ ⟨v, w⟩` in monomial coordinates. -/
def dualOf (w : Index → ℚ) (a : Index) : ℚ :=
  ∑ j, monomialInPower a j * (∑ b, w b * monomialInPower b j) * weightQ j

theorem jackForm_rat_right (v : Index → ℝ) (w : Index → ℚ) :
    jackForm v (fun k => (w k : ℝ)) = ∑ a, v a * (dualOf w a : ℝ) := by
  have hd : ∀ a, (dualOf w a : ℝ) =
      ∑ j, (monomialInPower a j : ℝ) * powerCoords (fun k => (w k : ℝ)) j * (weightQ j : ℝ) := by
    intro a
    simp only [dualOf, powerCoords]
    push_cast
    rfl
  simp only [hd, Finset.mul_sum, jackForm]
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl fun j _ => ?_
  rw [powerCoords, Finset.sum_mul, Finset.sum_mul]
  refine Finset.sum_congr rfl fun a _ => ?_
  ring

/-- Exact values of `⟨e_a, P_j⟩`. -/
def dualQ : Index → Index → ℚ :=
  ![![308/729, -440/243, 40/27, 40/27, -10/9, -10/9, 2/3],
    ![0, 520/1701, -130/189, -20/63, 50/63, 22/63, -10/21],
    ![0, 0, 175/594, -35/99, -7/22, 91/198, -5/66],
    ![0, 0, 0, 32/117, -64/195, -176/585, 16/39],
    ![0, 0, 0, 0, 7/25, -9/25, 1/15],
    ![0, 0, 0, 0, 0, 88/315, -8/21],
    ![0, 0, 0, 0, 0, 0, 256/693]]

theorem dualOf_jackQ : ∀ j, dualOf (jackQ j) = dualQ j := by
  decide +kernel

theorem orth_eq (F : Index → Index → ℝ) (hF : IsJackFamily F) (i j : Index) (hij : j < i)
    (hj : F j = jackR j) : ∑ a, F i a * (dualQ j a : ℝ) = 0 := by
  have h := hF.orthogonal i j (ne_of_gt hij)
  rw [hj] at h
  rw [← dualOf_jackQ, ← jackForm_rat_right]
  exact h

theorem IsJackFamily.upper {F : Index → Index → ℝ} (hF : IsJackFamily F) (i k : Index)
    (h : i < k) : F i k = 0 :=
  hF.triangular i k ((not_dominates_iff i k).mpr h)

/-- Stanley's characterization determines the whole degree-five family. -/
theorem family_unique (F : Index → Index → ℝ) (hF : IsJackFamily F) : F = jackR := by
  have up := hF.upper
  have mo := hF.monic
  have r0 : F 0 = jackR 0 := by
    funext k
    fin_cases k <;> simp [jackR, jackQ, up, mo]
  have r1 : F 1 = jackR 1 := by
    have e0 := orth_eq F hF 1 0 (by decide) r0
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e0
    funext k
    fin_cases k <;> simp [jackR, jackQ, up, mo]
    linarith
  have r2 : F 2 = jackR 2 := by
    have e0 := orth_eq F hF 2 0 (by decide) r0
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e0
    have e1 := orth_eq F hF 2 1 (by decide) r1
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e1
    funext k
    fin_cases k <;> simp [jackR, jackQ, up, mo] <;> linarith
  have r3 : F 3 = jackR 3 := by
    have e0 := orth_eq F hF 3 0 (by decide) r0
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e0
    have e1 := orth_eq F hF 3 1 (by decide) r1
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e1
    have e2 := orth_eq F hF 3 2 (by decide) r2
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e2
    funext k
    fin_cases k <;> simp [jackR, jackQ, up, mo] <;> linarith
  have r4 : F 4 = jackR 4 := by
    have e0 := orth_eq F hF 4 0 (by decide) r0
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e0
    have e1 := orth_eq F hF 4 1 (by decide) r1
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e1
    have e2 := orth_eq F hF 4 2 (by decide) r2
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e2
    have e3 := orth_eq F hF 4 3 (by decide) r3
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e3
    funext k
    fin_cases k <;> simp [jackR, jackQ, up, mo] <;> linarith
  have r5 : F 5 = jackR 5 := by
    have e0 := orth_eq F hF 5 0 (by decide) r0
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e0
    have e1 := orth_eq F hF 5 1 (by decide) r1
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e1
    have e2 := orth_eq F hF 5 2 (by decide) r2
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e2
    have e3 := orth_eq F hF 5 3 (by decide) r3
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e3
    have e4 := orth_eq F hF 5 4 (by decide) r4
    simp [Fin.sum_univ_succ, dualQ, up, mo] at e4
    funext k
    fin_cases k <;> simp [jackR, jackQ, up, mo] <;> linarith
  have r6 : F 6 = jackR 6 := by
    have e0 := orth_eq F hF 6 0 (by decide) r0
    simp [Fin.sum_univ_succ, dualQ, mo] at e0
    have e1 := orth_eq F hF 6 1 (by decide) r1
    simp [Fin.sum_univ_succ, dualQ, mo] at e1
    have e2 := orth_eq F hF 6 2 (by decide) r2
    simp [Fin.sum_univ_succ, dualQ, mo] at e2
    have e3 := orth_eq F hF 6 3 (by decide) r3
    simp [Fin.sum_univ_succ, dualQ, mo] at e3
    have e4 := orth_eq F hF 6 4 (by decide) r4
    simp [Fin.sum_univ_succ, dualQ, mo] at e4
    have e5 := orth_eq F hF 6 5 (by decide) r5
    simp [Fin.sum_univ_succ, dualQ, mo] at e5
    funext k
    fin_cases k <;> simp [jackR, jackQ, mo] <;> linarith
  funext i
  fin_cases i
  · exact r0
  · exact r1
  · exact r2
  · exact r3
  · exact r4
  · exact r5
  · exact r6

theorem family_exists_unique : ∃! F : Index → Index → ℝ, IsJackFamily F :=
  ⟨jackR, jackR_family, fun F hF => family_unique F hF⟩

end

end ChenKhareSahi.Jack
