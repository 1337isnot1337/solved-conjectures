import Conjectures.LonelinessSevenCoordinateDefs
import Conjectures.LonelinessRationalSubspace
import Conjectures.LonelinessSubspaceDensity

/-! Necessary tangent equations below the explicit rational witness level.
A failed equation gives an explicit rational point whose clearance is at
least `229/1596`, strictly greater than `1/7`. Only the small baseline phase
table is finite; the direction coordinates remain universally quantified. -/

namespace Loneliness.SevenCoordinateCritical

open CoordinateSubspace SubspaceDensity

noncomputable section

private def tangentTime (a : Fin 6) : ℤ := ![1,4,5,2,3,6] a

private def tangentShift (k a : Fin 6) (i : Fin 7) : ℤ :=
  (tangentTime a * canonical k i) / 7

private def tangentPhase (k a : Fin 6) (i : Fin 7) : ℤ :=
  tangentTime a * canonical k i - 7 * tangentShift k a i

private theorem canonical_pair_values : ∀ (k a : Fin 6),
    canonical k a.castSucc = (a.val : ℤ)+1 ∧
      canonical k a.rev.castSucc = 6-(a.val : ℤ) := by
  decide +kernel

private theorem canonical_phase_cells : ∀ (k a : Fin 6), k ≠ a → k ≠ a.rev →
    ∀ i : Fin 7,
      if i = a.castSucc then tangentPhase k a i = 1 else
      if i = a.rev.castSucc then tangentPhase k a i = 6 else
        2 ≤ tangentPhase k a i ∧ tangentPhase k a i ≤ 5 := by
  decide +kernel

/-- The two active coordinates at an unaffected seventh-period maximum must
have proportional coefficients in every bounded integer direction of the
plane. The duplicate coordinate is excluded only from this active pair. -/
theorem canonical_plane_pair_proportional_of_lt
    (E : Submodule ℚ (Fin 7 → ℚ)) (k : Fin 6) (b : Vector)
    (hcanonical : (fun i => (canonical k i : ℚ)) ∈ E)
    (hb : (fun i => (b i : ℚ)) ∈ E)
    (hbound : ∀ i, |b i| ≤ 6)
    (hlow : spaceValue (realSpan E) < (229 / 1596 : ℝ))
    (a : Fin 6) (hka : k ≠ a) (hka' : k ≠ a.rev) :
    (6-(a.val : ℤ)) * b a.castSucc =
      ((a.val : ℤ)+1) * b a.rev.castSucc := by
  by_contra hne
  let δ : ℤ := (6-(a.val : ℤ)) * b a.castSucc -
    ((a.val : ℤ)+1) * b a.rev.castSucc
  have hδ : δ ≠ 0 := sub_ne_zero.mpr hne
  let s : ℤ := if 0 < δ then 1 else -1
  have hs : s = 1 ∨ s = -1 := by
    dsimp [s]
    split_ifs <;> simp
  have hsabs : |s| = 1 := by rcases hs with h | h <;> simp [h]
  have hsd : 1 ≤ s * δ := by
    by_cases hpos : 0 < δ
    · simp only [s, ite_eq_left hpos, one_mul]
      omega
    · have hneg : δ < 0 := by omega
      simp only [s, ite_eq_right hpos, neg_one_mul]
      omega
  let z : Vector := fun i =>
    s * (-(b a.castSucc + b a.rev.castSucc) * canonical k i + 7 * b i)
  have hzfirst : z a.castSucc = s * δ := by
    dsimp [z, δ]
    rw [(canonical_pair_values k a).1]
    ring
  have hzsecond : z a.rev.castSucc = -(s * δ) := by
    dsimp [z, δ]
    rw [(canonical_pair_values k a).2]
    ring
  have hsum : |b a.castSucc + b a.rev.castSucc| ≤ 12 := by
    have h := abs_add_le (b a.castSucc) (b a.rev.castSucc)
    linarith [hbound a.castSucc, hbound a.rev.castSucc]
  have hzbound (i : Fin 7) : |z i| ≤ 114 := by
    dsimp [z]
    rw [abs_mul, hsabs, one_mul]
    calc
      _ ≤ |-(b a.castSucc + b a.rev.castSucc) * canonical k i| + |7 * b i| :=
        abs_add_le _ _
      _ = |b a.castSucc + b a.rev.castSucc| * |canonical k i| + 7 * |b i| := by
        rw [abs_mul, abs_neg, abs_mul]
        norm_num
      _ ≤ 12 * 6 + 7 * 6 :=
        add_le_add
          (mul_le_mul hsum (canonical_abs_le_six k i) (abs_nonneg _) (by norm_num))
          (mul_le_mul_of_nonneg_left (hbound i) (by norm_num))
      _ = 114 := by norm_num
  have hcells (i : Fin 7) :
      229 ≤ 228 * tangentPhase k a i + z i ∧
        228 * tangentPhase k a i + z i ≤ 1367 := by
    have hzb := abs_le.mp (hzbound i)
    have hphase := canonical_phase_cells k a hka hka' i
    by_cases hfirst : i = a.castSucc
    · have hp : tangentPhase k a i = 1 := by
        simpa only [ite_eq_left hfirst] using hphase
      have hz : z i = s * δ := by simpa [hfirst] using hzfirst
      omega
    · by_cases hsecond : i = a.rev.castSucc
      · have hp : tangentPhase k a i = 6 := by
          simpa only [ite_eq_right hfirst, ite_eq_left hsecond] using hphase
        have hz : z i = -(s * δ) := by simpa [hsecond] using hzsecond
        omega
      · have hp : 2 ≤ tangentPhase k a i ∧ tangentPhase k a i ≤ 5 := by
          simpa only [ite_eq_right hfirst, ite_eq_right hsecond] using hphase
        omega
  have hzformula : (fun i => (z i : ℚ)) =
      ((-s * (b a.castSucc + b a.rev.castSucc) : ℤ) : ℚ) •
        (fun i => (canonical k i : ℚ)) +
      ((7 * s : ℤ) : ℚ) • (fun i => (b i : ℚ)) := by
    ext i
    simp only [z, Pi.add_apply, Pi.smul_apply, smul_eq_mul]
    push_cast
    ring
  have hzE : (fun i => (z i : ℚ)) ∈ E := by
    rw [hzformula]
    exact E.add_mem (E.smul_mem _ hcanonical) (E.smul_mem _ hb)
  let x : Fin 7 → ℚ :=
    ((tangentTime a : ℚ) / 7) • (fun i => (canonical k i : ℚ)) +
      (1 / 1596 : ℚ) • (fun i => (z i : ℚ))
  have hx : x ∈ E := E.add_mem (E.smul_mem _ hcanonical) (E.smul_mem _ hzE)
  have hcoordinate (i : Fin 7) :
      rationalVector x i - (tangentShift k a i : ℝ) =
        ((228 * tangentPhase k a i + z i : ℤ) : ℝ) / 1596 := by
    dsimp [x, rationalVector, tangentPhase]
    push_cast
    ring
  have hclearance : (229 / 1596 : ℝ) ≤ pointClearance (rationalVector x) := by
    apply le_point
    intro i
    apply distance_lower_of_cell (k := tangentShift k a i)
    · rw [hcoordinate]
      apply div_le_div_of_nonneg_right _ (by norm_num : (0 : ℝ) ≤ 1596)
      exact_mod_cast (hcells i).1
    · rw [hcoordinate]
      calc
        _ ≤ (1367 / 1596 : ℝ) :=
          div_le_div_of_nonneg_right (by exact_mod_cast (hcells i).2) (by norm_num)
        _ = 1 - 229 / 1596 := by norm_num
  have hbad := hclearance.trans (point_le_spaceValue (rationalVector_mem_realSpan hx))
  exact (not_lt_of_ge hbad) hlow

end

end Loneliness.SevenCoordinateCritical
