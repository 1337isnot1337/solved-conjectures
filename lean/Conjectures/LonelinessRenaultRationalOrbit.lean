import Conjectures.LonelinessRenaultPreliminaries
import Conjectures.LonelinessCoalescenceValue
import Conjectures.LonelinessProductFamily

/-!
The four-speed lower bound is an explicit input to these intermediate lemmas;
the final five-speed theorem supplies the verified unconditional bound. The
coprime phase-grid theorem handles four speeds divisible by a common modulus.
-/

namespace Loneliness.Renault

open CriticalFamilies

theorem exists_four_safe_on (hLRC4 : CoordinateSubspace.LonelyRunnerBound 4)
    (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i)
    (s : Finset (Fin 5)) (hcard : s.card ≤ 4) :
    ∃ t : ℝ, ∀ i ∈ s, (1 / 5 : ℝ) ≤ distance ((v i : ℝ) * t) := by
  classical
  by_cases hs : s.Nonempty
  · let ds : List ℕ := (s.image v).toList
    have hne : ds ≠ [] := by
      intro he
      obtain ⟨i, hi⟩ := hs
      have hm : v i ∈ ds := Finset.mem_toList.mpr (Finset.mem_image_of_mem v hi)
      rw [he] at hm
      exact List.not_mem_nil hm
    have hnodup : ds.Nodup := Finset.nodup_toList _
    have hlength : ds.length ≤ 4 := by
      dsimp [ds]
      rw [Finset.length_toList]
      exact (Finset.card_image_le).trans hcard
    have hpos : ∀ a ∈ ds, 0 < a := by
      intro a ha
      obtain ⟨i, _, rfl⟩ := Finset.mem_image.mp (Finset.mem_toList.mp ha)
      exact hpositive i
    have hbound := hLRC4 ds hne hnodup hlength hpos
    norm_num at hbound
    obtain ⟨t, _, hmax⟩ := value_max ds
    refine ⟨t, ?_⟩
    intro i hi
    calc
      (1 / 5 : ℝ) ≤ value ds := hbound
      _ = clearance ds t := hmax.symm
      _ ≤ distance ((v i : ℝ) * t) :=
        clearance_le_of_mem (Finset.mem_toList.mpr (Finset.mem_image_of_mem v hi)) t
  · refine ⟨0, ?_⟩
    intro i hi
    exact False.elim (hs ⟨i, hi⟩)

theorem exists_four_safe_except (hLRC4 : CoordinateSubspace.LonelyRunnerBound 4)
    (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i)
    (i : Fin 5) :
    ∃ t : ℝ, ∀ j, j ≠ i → (1 / 5 : ℝ) ≤ distance ((v j : ℝ) * t) := by
  obtain ⟨t, ht⟩ := exists_four_safe_on hLRC4 v hpositive (Finset.univ.erase i) (by simp)
  exact ⟨t, fun j hj => ht j (by simp [hj])⟩

theorem exists_strict_safe_except (hLRC4 : CoordinateSubspace.LonelyRunnerBound 4)
    (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i)
    (i : Fin 5) :
    ∃ t : ℝ, ∀ j, j ≠ i → (1 / 6 : ℝ) < distance ((v j : ℝ) * t) := by
  obtain ⟨t, ht⟩ := exists_four_safe_except hLRC4 v hpositive i
  refine ⟨t, ?_⟩
  intro j hj
  have h := ht j hj
  linarith

/-- Renault's fast-speed perturbation, with no bound on the integer speeds. -/
theorem exists_allSafe_of_fast (hLRC4 : CoordinateSubspace.LonelyRunnerBound 4)
    (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hfast : ∃ i, ∀ j, j ≠ i → 5 * v j ≤ v i) :
    ∃ t : ℝ, AllSafe v t := by
  obtain ⟨i, hi⟩ := hfast
  obtain ⟨t, ht⟩ := exists_four_safe_except hLRC4 v hpositive i
  obtain ⟨y, hnear, hy⟩ := exists_nearby_safe ((v i : ℝ) * t)
  have hiR : (0 : ℝ) < v i := by exact_mod_cast hpositive i
  let u : ℝ := y / v i
  have hiu : (v i : ℝ) * u = y := by dsimp [u]; field_simp
  have hstep : (v i : ℝ) * |t - u| ≤ 1 / 6 := by
    calc
      (v i : ℝ) * |t - u| = |(v i : ℝ) * (t - u)| := by
        rw [abs_mul, abs_of_pos hiR]
      _ = |(v i : ℝ) * t - y| := by rw [mul_sub, hiu]
      _ ≤ 1 / 6 := hnear
  refine ⟨u, ?_⟩
  intro j
  by_cases hji : j = i
  · simpa only [hji, hiu] using hy
  · have hspeed : (5 : ℝ) * v j ≤ v i := by exact_mod_cast hi j hji
    have hmul := mul_le_mul_of_nonneg_right hspeed (abs_nonneg (t - u))
    have hperturb : |(v j : ℝ) * t - (v j : ℝ) * u| ≤ 1 / 30 := by
      rw [← mul_sub, abs_mul, abs_of_nonneg (Nat.cast_nonneg (v j))]
      nlinarith
    have htriangle := distance_le_add ((v j : ℝ) * t) ((v j : ℝ) * u)
    have hfour := ht j hji
    linarith

theorem exists_allSafe_of_four_multiples (hLRC4 : CoordinateSubspace.LonelyRunnerBound 4)
    (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (l : ℕ) (hl : 2 ≤ l) (i : Fin 5)
    (hdiv : ∀ j, j ≠ i → l ∣ v j) :
    ∃ t : ℝ, AllSafe v t := by
  have hcommon : Nat.gcd (v i) l ∣ (List.ofFn v).foldr Nat.gcd 0 := by
    apply dvd_gcd_fold
    intro a ha
    obtain ⟨j, rfl⟩ := List.mem_ofFn.mp ha
    by_cases hji : j = i
    · simpa only [hji] using Nat.gcd_dvd_left (v i) l
    · exact (Nat.gcd_dvd_right (v i) l).trans (hdiv j hji)
  rw [hprimitive] at hcommon
  have hcop : Nat.Coprime (v i) l := Nat.coprime_iff_gcd_eq_one.mpr (Nat.dvd_one.mp hcommon)
  obtain ⟨t, ht⟩ := exists_four_safe_except hLRC4 v hpositive i
  obtain ⟨u, k, hu, hiu⟩ :=
    ProductFamily.phase_grid_witness l (v i) (by omega) hcop ((l : ℝ) * t)
  have hlR : (2 : ℝ) ≤ l := by exact_mod_cast hl
  have hquarter : (1 : ℝ) / (2 * l) ≤ 1 / 4 :=
    one_div_le_one_div_of_le (by norm_num) (by nlinarith : (4 : ℝ) ≤ 2 * l)
  refine ⟨u, ?_⟩
  intro j
  by_cases hji : j = i
  · rw [hji]
    linarith
  · obtain ⟨a, ha⟩ := hdiv j hji
    have hphase : (v j : ℝ) * u = (v j : ℝ) * t + (((a : ℤ) * k : ℤ) : ℝ) := by
      rw [ha]
      calc
        ((l * a : ℕ) : ℝ) * u = (a : ℝ) * ((l : ℝ) * u) := by push_cast; ring
        _ = (a : ℝ) * ((l : ℝ) * t + k) := by rw [hu]
        _ = ((l * a : ℕ) : ℝ) * t + (((a : ℤ) * k : ℤ) : ℝ) := by push_cast; ring
    rw [hphase, distance_add_int]
    have hfour := ht j hji
    linarith

def divisibleIndices (v : Fin 5 → ℕ) (l : ℕ) : Finset (Fin 5) :=
  Finset.univ.filter fun i => l ∣ v i

theorem divisibility_card_le_three (hLRC4 : CoordinateSubspace.LonelyRunnerBound 4)
    (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hno : ¬∃ t : ℝ, AllSafe v t) (l : ℕ) (hl : 2 ≤ l) :
    (divisibleIndices v l).card ≤ 3 := by
  classical
  by_contra hcard
  have hfour : 4 ≤ (divisibleIndices v l).card := by omega
  have hcomplement : (Finset.univ \ divisibleIndices v l).card ≤ 1 := by
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ _)]
    norm_num
    omega
  obtain ⟨i, hi⟩ := Finset.card_le_one_iff_subset_singleton.mp hcomplement
  apply hno
  apply exists_allSafe_of_four_multiples hLRC4 v hpositive hprimitive l hl i
  intro j hji
  by_contra hj
  have hjmem : j ∈ Finset.univ \ divisibleIndices v l := by
    simp [divisibleIndices, hj]
  exact hji (Finset.mem_singleton.mp (hi hjmem))

theorem divisibility_card_pos (v : Fin 5 → ℕ)
    (hno : ¬∃ t : ℝ, AllSafe v t) (l : ℕ) (hl : 2 ≤ l) (hl6 : l ≤ 6) :
    1 ≤ (divisibleIndices v l).card := by
  classical
  by_contra hcard
  have hz : (divisibleIndices v l).card = 0 := by omega
  have hempty : divisibleIndices v l = ∅ := Finset.card_eq_zero.mp hz
  have hres : ∀ a ∈ List.ofFn v, a % l ≠ 0 := by
    intro a ha hzero
    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha
    have hi : i ∈ divisibleIndices v l := by
      simp [divisibleIndices, Nat.dvd_of_mod_eq_zero hzero]
    rw [hempty] at hi
    simpa using hi
  have hclear := ProductFamily.nonzero_residue_clearance l hl (List.ofFn v) hres
  have hlR : (0 : ℝ) < l := by exact_mod_cast (show 0 < l by omega)
  have hl6R : (l : ℝ) ≤ 6 := by exact_mod_cast hl6
  have hfraction : (1 / 6 : ℝ) ≤ 1 / l :=
    one_div_le_one_div_of_le hlR hl6R
  apply hno
  refine ⟨1 / l, ?_⟩
  intro i
  exact hfraction.trans (hclear.trans (clearance_le_of_mem (List.mem_ofFn.mpr ⟨i, rfl⟩) _))

theorem divisibility_card_bounds (hLRC4 : CoordinateSubspace.LonelyRunnerBound 4)
    (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hno : ¬∃ t : ℝ, AllSafe v t) (l : ℕ) (hl : 2 ≤ l) (hl6 : l ≤ 6) :
    1 ≤ (divisibleIndices v l).card ∧ (divisibleIndices v l).card ≤ 3 :=
  ⟨divisibility_card_pos v hno l hl hl6,
    divisibility_card_le_three hLRC4 v hpositive hprimitive hno l hl⟩

theorem exists_allSafe_of_three_multiples (hLRC4 : CoordinateSubspace.LonelyRunnerBound 4)
    (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hthree : 3 ≤ (divisibleIndices v 3).card) :
    ∃ t : ℝ, AllSafe v t := by
  classical
  by_contra hno
  have hupper := divisibility_card_le_three hLRC4 v hpositive hprimitive hno 3 (by decide)
  obtain ⟨t, ht⟩ := exists_four_safe_on hLRC4 v hpositive (divisibleIndices v 3) (by omega)
  have hsafe : ∀ j : Fin 3, ∀ i ∈ divisibleIndices v 3,
      (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * (t + (j : ℕ) / 3)) := by
    intro j i hi
    have hdiv : 3 ∣ v i := (Finset.mem_filter.mp hi).2
    rw [distance_third_shift_of_dvd (v i) hdiv t j]
    have hfour := ht i hi
    linarith
  have hnondiv : ∀ i ∉ divisibleIndices v 3, ¬3 ∣ v i := by
    intro i hi
    simpa [divisibleIndices] using hi
  have hcard : (Finset.univ \ divisibleIndices v 3).card ≤ 2 := by
    rw [Finset.card_sdiff_of_subset (Finset.subset_univ _)]
    norm_num
    omega
  obtain ⟨j, hj⟩ :=
    exists_third_shift_of_at_most_two v (divisibleIndices v 3) t hsafe hnondiv hcard
  exact hno ⟨_, hj⟩

end Loneliness.Renault
