import Conjectures.LonelinessContinuity
import Conjectures.LonelinessCriticalBase
import Mathlib.Data.Finset.Lattice.Fold

/-!
Constrained maxima for Renault's five-speed argument.  The distinguished
coordinate is zero.  Strict feasibility is an explicit input, independent
of any lower-dimensional lonely-runner theorem.
-/

namespace Loneliness.Renault

noncomputable section

/-- The four coordinates other than the distinguished one are safe. -/
def GoodOthers (v : Fin 5 → ℕ) (t : ℝ) : Prop :=
  ∀ i, i ≠ 0 → (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t)

private theorem distance_eq_min_fract (x : ℝ) :
    distance x = min (Int.fract x) (1 - Int.fract x) :=
  abs_sub_round_eq_min x

private theorem distance_nat_mul_fract (d : ℕ) (t : ℝ) :
    distance ((d : ℝ) * Int.fract t) = distance ((d : ℝ) * t) := by
  have he : (d : ℝ) * t =
      (d : ℝ) * Int.fract t + (((d : ℤ) * ⌊t⌋ : ℤ) : ℝ) := by
    simp only [Int.fract, Int.cast_mul, Int.cast_natCast]
    ring
  rw [he, CriticalFamilies.distance_add_int]

private theorem goodOthers_fract {v : Fin 5 → ℕ} {t : ℝ}
    (h : GoodOthers v t) : GoodOthers v (Int.fract t) := by
  intro i hi
  rw [distance_nat_mul_fract]
  exact h i hi

private theorem goodOthers_neg {v : Fin 5 → ℕ} {t : ℝ}
    (h : GoodOthers v t) : GoodOthers v (-t) := by
  intro i hi
  simpa only [mul_neg, CriticalFamilies.distance_neg] using h i hi

private theorem isClosed_goodOthers (v : Fin 5 → ℕ) :
    IsClosed {t : ℝ | GoodOthers v t} := by
  have he : {t : ℝ | GoodOthers v t} =
      ⋂ (i : Fin 5) (_ : i ≠ 0),
        {t : ℝ | (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t)} := by
    ext t
    simp only [Set.mem_ofPred_eq, Set.mem_iInter, GoodOthers]
  rw [he]
  exact isClosed_iInter fun i => isClosed_iInter fun _ =>
    isClosed_le continuous_const
      (continuous_distance.comp (continuous_const.mul continuous_id))

/-- A feasible constrained maximum exists over all real times. -/
theorem exists_constrained_maximum (v : Fin 5 → ℕ)
    (hfeasible : ∃ t : ℝ, GoodOthers v t) :
    ∃ t : ℝ, GoodOthers v t ∧
      ∀ s : ℝ, GoodOthers v s →
        distance ((v 0 : ℝ) * s) ≤ distance ((v 0 : ℝ) * t) := by
  let S := Set.Icc (0 : ℝ) 1 ∩ {t : ℝ | GoodOthers v t}
  have hS : IsCompact S := isCompact_Icc.inter_right (isClosed_goodOthers v)
  have hSne : S.Nonempty := by
    obtain ⟨t, ht⟩ := hfeasible
    exact ⟨Int.fract t, ⟨Int.fract_nonneg t, (Int.fract_lt_one t).le⟩,
      goodOthers_fract ht⟩
  have hc : Continuous (fun t : ℝ => distance ((v 0 : ℝ) * t)) :=
    continuous_distance.comp (continuous_const.mul continuous_id)
  obtain ⟨t, ht, hmax⟩ := hS.exists_isMaxOn hSne hc.continuousOn
  refine ⟨t, ht.2, ?_⟩
  intro s hs
  rw [← distance_nat_mul_fract (v 0) s]
  exact hmax ⟨⟨Int.fract_nonneg s, (Int.fract_lt_one s).le⟩,
    goodOthers_fract hs⟩

private theorem exists_positive_step (v : Fin 5 → ℕ) (margin : Fin 5 → ℝ)
    (hmargin : ∀ i, 0 < margin i) :
    ∃ δ : ℝ, 0 < δ ∧ ∀ i, (v i : ℝ) * δ < margin i := by
  classical
  choose ε hεpos hε using fun i => exists_pos_mul_lt (hmargin i) (v i : ℝ)
  let δ := Finset.univ.inf' Finset.univ_nonempty ε
  have hδ : 0 < δ := (Finset.lt_inf'_iff _).2 fun i _ => hεpos i
  refine ⟨δ, hδ, ?_⟩
  intro i
  have hle : δ ≤ ε i := Finset.inf'_le _ (Finset.mem_univ i)
  exact (mul_le_mul_of_nonneg_left hle (Nat.cast_nonneg _)).trans_lt (hε i)

/-- Strict feasibility allows a time with positive distinguished distance. -/
theorem exists_positive_feasible (v : Fin 5 → ℕ) (hpos : 0 < v 0)
    (hstrict : ∃ t : ℝ, ∀ i, i ≠ 0 →
      (1 / 6 : ℝ) < distance ((v i : ℝ) * t)) :
    ∃ t : ℝ, GoodOthers v t ∧ 0 < distance ((v 0 : ℝ) * t) := by
  classical
  obtain ⟨t, ht⟩ := hstrict
  by_cases hzero : distance ((v 0 : ℝ) * t) = 0
  · let margin : Fin 5 → ℝ := fun i =>
      if i = 0 then 1 / 2 else distance ((v i : ℝ) * t) - 1 / 6
    have hmargin : ∀ i, 0 < margin i := by
      intro i
      by_cases hi : i = 0
      · simp [margin, hi]
      · simpa only [margin, ite_eq_right hi, sub_pos] using ht i hi
    obtain ⟨δ, hδ, hsmall⟩ := exists_positive_step v margin hmargin
    have hv0 : (0 : ℝ) < v 0 := by exact_mod_cast hpos
    have hstep : 0 < (v 0 : ℝ) * δ := mul_pos hv0 hδ
    have hstep_half : (v 0 : ℝ) * δ < 1 / 2 := by
      simpa only [margin, ite_eq_left rfl] using hsmall 0
    have hinteger : (v 0 : ℝ) * t = (round ((v 0 : ℝ) * t) : ℝ) := by
      exact sub_eq_zero.mp (abs_eq_zero.mp hzero)
    refine ⟨t + δ, ?_, ?_⟩
    · intro i hi
      have hs : (v i : ℝ) * δ < distance ((v i : ℝ) * t) - 1 / 6 := by
        simpa only [margin, ite_eq_right hi] using hsmall i
      have hd := distance_le_add ((v i : ℝ) * t) ((v i : ℝ) * (t + δ))
      have habs : |(v i : ℝ) * t - (v i : ℝ) * (t + δ)| =
          (v i : ℝ) * δ := by
        rw [show (v i : ℝ) * t - (v i : ℝ) * (t + δ) =
          -((v i : ℝ) * δ) by ring, abs_neg,
          abs_of_nonneg (mul_nonneg (Nat.cast_nonneg _) hδ.le)]
      rw [habs] at hd
      linarith
    · have hlower : (v 0 : ℝ) * δ ≤ distance ((v 0 : ℝ) * δ) := by
        apply distance_lower_of_cell (k := 0)
        · simp
        · simp only [Int.cast_zero, sub_zero]
          linarith
      have he : (v 0 : ℝ) * (t + δ) = (v 0 : ℝ) * δ +
          (round ((v 0 : ℝ) * t) : ℝ) := by
        nlinarith [hinteger]
      rw [he, CriticalFamilies.distance_add_int]
      exact hstep.trans_le hlower
  · exact ⟨t, fun i hi => (ht i hi).le,
      lt_of_le_of_ne (distance_nonneg _) (Ne.symm hzero)⟩

/-- In a counterexample, reflection puts a positive constrained maximum
in the first sixth of the distinguished runner's period. -/
theorem exists_positive_maximizer (v : Fin 5 → ℕ) (hpos : 0 < v 0)
    (hstrict : ∃ t : ℝ, ∀ i, i ≠ 0 →
      (1 / 6 : ℝ) < distance ((v i : ℝ) * t))
    (hno : ∀ t : ℝ, ¬ ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t)) :
    ∃ t : ℝ, GoodOthers v t ∧
      0 < Int.fract ((v 0 : ℝ) * t) ∧
      Int.fract ((v 0 : ℝ) * t) < 1 / 6 ∧
      ∀ s : ℝ, GoodOthers v s →
        distance ((v 0 : ℝ) * s) ≤ distance ((v 0 : ℝ) * t) := by
  obtain ⟨u, hu, hupos⟩ := exists_positive_feasible v hpos hstrict
  obtain ⟨t, ht, hmax⟩ := exists_constrained_maximum v ⟨u, hu⟩
  have htpos : 0 < distance ((v 0 : ℝ) * t) := hupos.trans_le (hmax u hu)
  have htsmall : distance ((v 0 : ℝ) * t) < 1 / 6 := by
    by_contra! h
    apply hno t
    intro i
    by_cases hi : i = 0
    · simpa only [hi] using h
    · exact ht i hi
  have hphasepos := lt_min_iff.mp ((distance_eq_min_fract _).symm ▸ htpos)
  rcases min_lt_iff.mp ((distance_eq_min_fract _).symm ▸ htsmall) with hleft | hright
  · exact ⟨t, ht, hphasepos.1, hleft, hmax⟩
  · have hneg : Int.fract ((v 0 : ℝ) * (-t)) =
        1 - Int.fract ((v 0 : ℝ) * t) := by
      rw [mul_neg, Int.fract_neg hphasepos.1.ne']
    refine ⟨-t, goodOthers_neg ht, ?_, ?_, ?_⟩
    · rw [hneg]
      exact hphasepos.2
    · rw [hneg]
      exact hright
    · intro s hs
      simpa only [mul_neg, CriticalFamilies.distance_neg] using hmax s hs

/-- A positive constrained maximum in the first sixth has another
coordinate at the upper safe boundary. -/
theorem maximizer_has_upper_boundary (v : Fin 5 → ℕ) (hpos : 0 < v 0)
    (t : ℝ) (ht : GoodOthers v t)
    (hphasepos : 0 < Int.fract ((v 0 : ℝ) * t))
    (hphasesmall : Int.fract ((v 0 : ℝ) * t) < 1 / 6)
    (hmax : ∀ s : ℝ, GoodOthers v s →
      distance ((v 0 : ℝ) * s) ≤ distance ((v 0 : ℝ) * t)) :
    ∃ j : Fin 5, j ≠ 0 ∧ Int.fract ((v j : ℝ) * t) = 5 / 6 := by
  classical
  by_contra! hboundary
  have hphase : ∀ i, i ≠ 0 →
      (1 / 6 : ℝ) ≤ Int.fract ((v i : ℝ) * t) ∧
        Int.fract ((v i : ℝ) * t) < 5 / 6 := by
    intro i hi
    have hb := le_min_iff.mp ((distance_eq_min_fract _).symm ▸ ht i hi)
    refine ⟨hb.1, ?_⟩
    exact lt_of_le_of_ne (by linarith [hb.2]) (hboundary i hi)
  let margin : Fin 5 → ℝ := fun i =>
    if i = 0 then 1 / 6 - Int.fract ((v 0 : ℝ) * t)
    else 5 / 6 - Int.fract ((v i : ℝ) * t)
  have hmargin : ∀ i, 0 < margin i := by
    intro i
    by_cases hi : i = 0
    · simpa only [margin, ite_eq_left hi, sub_pos] using hphasesmall
    · simpa only [margin, ite_eq_right hi, sub_pos] using (hphase i hi).2
  obtain ⟨δ, hδ, hsmall⟩ := exists_positive_step v margin hmargin
  have hnew : GoodOthers v (t + δ) := by
    intro i hi
    have hs : (v i : ℝ) * δ < 5 / 6 - Int.fract ((v i : ℝ) * t) := by
      simpa only [margin, ite_eq_right hi] using hsmall i
    have hb := (hphase i hi).1
    have hstep : 0 ≤ (v i : ℝ) * δ := mul_nonneg (Nat.cast_nonneg _) hδ.le
    apply distance_lower_of_cell (k := ⌊(v i : ℝ) * t⌋)
    · dsimp only [Int.fract] at hb
      nlinarith
    · dsimp only [Int.fract] at hs
      nlinarith
  have hv0 : (0 : ℝ) < v 0 := by exact_mod_cast hpos
  have hstep : 0 < (v 0 : ℝ) * δ := mul_pos hv0 hδ
  have hsmall0 : (v 0 : ℝ) * δ < 1 / 6 - Int.fract ((v 0 : ℝ) * t) := by
    simpa only [margin, ite_eq_left rfl] using hsmall 0
  have hlower : Int.fract ((v 0 : ℝ) * t) + (v 0 : ℝ) * δ ≤
      distance ((v 0 : ℝ) * (t + δ)) := by
    apply distance_lower_of_cell (k := ⌊(v 0 : ℝ) * t⌋)
    · dsimp only [Int.fract]
      nlinarith
    · dsimp only [Int.fract] at hsmall0 ⊢
      nlinarith
  have hold : distance ((v 0 : ℝ) * t) ≤ Int.fract ((v 0 : ℝ) * t) := by
    rw [distance_eq_min_fract]
    exact min_le_left _ _
  have hupper := hmax (t + δ) hnew
  linarith

/-- The constrained maximizer and its upper boundary are available together. -/
theorem exists_maximizer_with_upper_boundary (v : Fin 5 → ℕ) (hpos : 0 < v 0)
    (hstrict : ∃ t : ℝ, ∀ i, i ≠ 0 →
      (1 / 6 : ℝ) < distance ((v i : ℝ) * t))
    (hno : ∀ t : ℝ, ¬ ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t)) :
    ∃ t : ℝ, GoodOthers v t ∧
      0 < Int.fract ((v 0 : ℝ) * t) ∧
      Int.fract ((v 0 : ℝ) * t) < 1 / 6 ∧
      (∀ s : ℝ, GoodOthers v s →
        distance ((v 0 : ℝ) * s) ≤ distance ((v 0 : ℝ) * t)) ∧
      ∃ j : Fin 5, j ≠ 0 ∧ Int.fract ((v j : ℝ) * t) = 5 / 6 := by
  obtain ⟨t, ht, hp, hs, hm⟩ := exists_positive_maximizer v hpos hstrict hno
  exact ⟨t, ht, hp, hs, hm, maximizer_has_upper_boundary v hpos t ht hp hs hm⟩

end

end Loneliness.Renault
