import Conjectures.HaralambisCounting

/-! A three-speed maximum occurs at a rational time whose denominator is a
pair sum. The proof uses intersecting affine intervals at a genuine maximizer,
including the value-one-half case. -/

namespace Haralambis

theorem distance_cell_bounds (x r : ℝ) (h : r ≤ Loneliness.distance x) :
    r ≤ x - (⌊x⌋ : ℝ) ∧ x - (⌊x⌋ : ℝ) ≤ 1-r := by
  have hf := Int.floor_le x
  have hc := Int.lt_floor_add_one x
  have hl := Loneliness.distance_le_int x ⌊x⌋
  rw [abs_of_nonneg (by linarith only [hf])] at hl
  have hu := Loneliness.distance_le_int x (⌊x⌋+1)
  rw [Int.cast_add, Int.cast_one, abs_of_nonpos (by linarith only [hc])] at hu
  exact ⟨h.trans hl, by linarith only [h, hu]⟩

theorem pair_sum_maximum (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i) :
    ∃ i j : Fin 3, i ≠ j ∧ ∃ m : ℤ,
      Loneliness.value (speeds d) =
        Loneliness.clearance (speeds d) ((m : ℝ) / (d i + d j : ℕ)) := by
  obtain ⟨t, _, hval⟩ := Loneliness.value_max (speeds d)
  let M := Loneliness.value (speeds d)
  let k (i : Fin 3) : ℤ := ⌊(d i : ℝ)*t⌋
  have hdR : ∀ i, 0 < (d i : ℝ) := fun i => by exact_mod_cast hd i
  have hcell : ∀ i, M ≤ (d i : ℝ)*t-k i ∧ (d i : ℝ)*t-k i ≤ 1-M := by
    intro i
    apply distance_cell_bounds
    change Loneliness.value (speeds d) ≤ _
    rw [←hval]
    exact Loneliness.clearance_le_of_mem (mem_speeds d i) t
  let lo (i : Fin 3) : ℝ := ((k i : ℝ)+M)/d i
  let hi (i : Fin 3) : ℝ := ((k i : ℝ)+1-M)/d i
  have htime : ∀ i, lo i ≤ t ∧ t ≤ hi i := by
    intro i
    constructor
    · apply (div_le_iff₀ (hdR i)).2
      linarith only [(hcell i).1]
    · apply (le_div_iff₀ (hdR i)).2
      linarith only [(hcell i).2]
  obtain ⟨i, _, hmax⟩ := Finset.exists_max_image (Finset.univ : Finset (Fin 3)) lo (by simp)
  obtain ⟨j, _, hmin⟩ := Finset.exists_min_image (Finset.univ : Finset (Fin 3)) hi (by simp)
  let x := lo i
  let y := hi j
  have hxy : x ≤ y := (htime i).1.trans (htime j).2
  have heq : x = y := by
    by_contra hne
    have hgap : 0 < y-x := sub_pos.mpr (lt_of_le_of_ne hxy hne)
    let η := (y-x)/2
    let z := (x+y)/2
    have hη : 0 < η := div_pos hgap (by norm_num)
    have hphase : ∀ a, M+η ≤ (d a : ℝ)*z-k a ∧
        (d a : ℝ)*z-k a ≤ 1-(M+η) := by
      intro a
      have hl := (div_le_iff₀ (hdR a)).mp (hmax a (by simp))
      have hu := (le_div_iff₀ (hdR a)).mp (hmin a (by simp))
      have hd1 : (1 : ℝ) ≤ d a := by exact_mod_cast hd a
      have hp : 0 ≤ ((d a : ℝ)-1)*(y-x) :=
        mul_nonneg (by linarith only [hd1]) (le_of_lt hgap)
      change (k a : ℝ)+M ≤ x*(d a : ℝ) at hl
      change y*(d a : ℝ) ≤ (k a : ℝ)+1-M at hu
      constructor <;> dsimp [z, η] <;> nlinarith only [hl, hu, hp]
    have hhalf : M+η ≤ 1/2 := by
      have h0 := hphase 0
      linarith only [h0.1, h0.2]
    have hbetter : M+η ≤ Loneliness.clearance (speeds d) z := by
      apply Loneliness.le_clearance hhalf
      intro v hv
      simp only [speeds, List.mem_cons, List.not_mem_nil, or_false] at hv
      rcases hv with rfl | rfl | rfl
      · exact Loneliness.distance_lower_of_cell (hphase 0).1 (hphase 0).2
      · exact Loneliness.distance_lower_of_cell (hphase 1).1 (hphase 1).2
      · exact Loneliness.distance_lower_of_cell (hphase 2).1 (hphase 2).2
    have hbound := hbetter.trans (Loneliness.CriticalFamilies.le_value_any (speeds d) z)
    change M+η ≤ M at hbound
    linarith only [hbound, hη]
  have hxt : x = t := le_antisymm (htime i).1 (by rw [heq]; exact (htime j).2)
  have hyt : y = t := heq.symm.trans hxt
  have hiEq : (k i : ℝ)+M = t*(d i : ℝ) :=
    (div_eq_iff (ne_of_gt (hdR i))).mp hxt
  have hjEq : (k j : ℝ)+1-M = t*(d j : ℝ) :=
    (div_eq_iff (ne_of_gt (hdR j))).mp hyt
  have hfinish : ∀ a b : Fin 3, a ≠ b →
      (k a : ℝ)+(k b : ℝ)+1 = t*((d a+d b : ℕ) : ℝ) →
      ∃ a b : Fin 3, a ≠ b ∧ ∃ m : ℤ,
        Loneliness.value (speeds d) =
          Loneliness.clearance (speeds d) ((m : ℝ)/(d a+d b : ℕ)) := by
    intro a b hab hsum
    refine ⟨a, b, hab, k a+k b+1, ?_⟩
    have hpos : (0 : ℝ) < (d a+d b : ℕ) := by
      have ha := hd a
      positivity
    have hf : ((k a+k b+1 : ℤ) : ℝ)/((d a+d b : ℕ) : ℝ) = t := by
      apply (div_eq_iff (ne_of_gt hpos)).2
      push_cast
      simpa only [Nat.cast_add] using hsum
    rw [hf]
    exact hval.symm
  by_cases hij : i=j
  · subst j
    have hM : M=1/2 := by linarith only [hiEq, hjEq]
    have h0 : (d 0 : ℝ)*t = (k 0 : ℝ)+1/2 := by
      have h0 := hcell 0
      linarith only [h0.1, h0.2, hM]
    have h1 : (d 1 : ℝ)*t = (k 1 : ℝ)+1/2 := by
      have h1 := hcell 1
      linarith only [h1.1, h1.2, hM]
    apply hfinish 0 1 (by decide)
    push_cast
    nlinarith only [h0, h1]
  · apply hfinish i j hij
    push_cast
    nlinarith only [hiEq, hjEq]

theorem pair_sum_packing (d : Fin 3 → ℕ) (hd : ∀ i, 0 < d i) :
    ∃ i j : Fin 3, i ≠ j ∧ ∃ A : Set ℤ,
      NonmixedGap.IsPeriodic A (d i+d j : ℕ) ∧
      Loneliness.Packing.Avoids (speeds d) A ∧
      NonmixedGap.upperDensity A = Loneliness.value (speeds d) := by
  obtain ⟨i,j,hij,m,hm⟩ := pair_sum_maximum d hd
  have hp : (0 : ℤ) < (d i+d j : ℕ) := by
    have hi := hd i
    positivity
  obtain ⟨A,hP,hA,hv⟩ := Loneliness.Packing.rational_packing_fraction (speeds d)
    (by simp [speeds]) (d i+d j : ℕ) m hp
  exact ⟨i,j,hij,A,hP,hA,hv.trans hm.symm⟩

end Haralambis
