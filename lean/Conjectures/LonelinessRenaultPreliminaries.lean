import Conjectures.LonelinessContinuity
import Conjectures.LonelinessCriticalBase
import Mathlib.Data.Finset.Card
import Mathlib.Tactic.FinCases

/-!
Elementary perturbations and third-period shifts in Renault's five-speed
argument. Every phase statement below is quantified over all real times.
-/

namespace Loneliness.Renault

open CriticalFamilies

def AllSafe (v : Fin 5 → ℕ) (t : ℝ) : Prop :=
  ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t)

/-- Every point is within one sixth of a phase with the required clearance. -/
theorem exists_nearby_safe (x : ℝ) :
    ∃ y : ℝ, |x - y| ≤ 1 / 6 ∧ (1 / 6 : ℝ) ≤ distance y := by
  by_cases hx : (1 / 6 : ℝ) ≤ distance x
  · exact ⟨x, by norm_num, hx⟩
  have hsmall : |x - (round x : ℝ)| < 1 / 6 := lt_of_not_ge hx
  rcases le_or_gt (0 : ℝ) (x - round x) with hsign | hsign
  · refine ⟨(round x : ℝ) + 1 / 6, ?_, ?_⟩
    · rw [abs_of_nonneg hsign] at hsmall
      exact abs_le.mpr ⟨by linarith, by linarith⟩
    · apply distance_lower_of_cell (k := round x) <;> linarith
  · refine ⟨(round x : ℝ) - 1 / 6, ?_, ?_⟩
    · rw [abs_of_neg hsign] at hsmall
      exact abs_le.mpr ⟨by linarith, by linarith⟩
    · apply distance_lower_of_cell (k := round x - 1) <;>
        push_cast <;> linarith

theorem distance_rational_shift_of_dvd (a l : ℕ) (hl : 0 < l)
    (hdiv : l ∣ a) (t : ℝ) (j : ℤ) :
    distance ((a : ℝ) * (t + (j : ℝ) / l)) = distance ((a : ℝ) * t) := by
  obtain ⟨k, rfl⟩ := hdiv
  have hlR : (l : ℝ) ≠ 0 := by positivity
  have he : ((l * k : ℕ) : ℝ) * (t + (j : ℝ) / l) =
      ((l * k : ℕ) : ℝ) * t + (((k : ℤ) * j : ℤ) : ℝ) := by
    push_cast
    field_simp
  rw [he, distance_add_int]

theorem distance_third_shift_of_dvd (a : ℕ) (hdiv : 3 ∣ a)
    (t : ℝ) (j : Fin 3) :
    distance ((a : ℝ) * (t + (j : ℕ) / 3)) = distance ((a : ℝ) * t) := by
  simpa using distance_rational_shift_of_dvd a 3 (by decide) hdiv t (j : ℕ)

private theorem third_integer_unique (a : ℕ) (ha : a % 3 ≠ 0)
    (j k : Fin 3) (z : ℤ)
    (h : (a : ℤ) * (j : ℕ) - (a : ℤ) * (k : ℕ) = 3 * z) : j = k := by
  fin_cases j <;> fin_cases k <;> norm_num at h ⊢ <;> omega

/-- A speed not divisible by three is unsafe at at most one of the three shifts. -/
theorem third_unsafe_unique (a : ℕ) (ha : ¬3 ∣ a) (t : ℝ) (j k : Fin 3)
    (hj : distance ((a : ℝ) * (t + (j : ℕ) / 3)) < (1 / 6 : ℝ))
    (hk : distance ((a : ℝ) * (t + (k : ℕ) / 3)) < (1 / 6 : ℝ)) : j = k := by
  let nj : ℤ := round ((a : ℝ) * (t + (j : ℕ) / 3))
  let nk : ℤ := round ((a : ℝ) * (t + (k : ℕ) / 3))
  have hj' : |(a : ℝ) * (t + (j : ℕ) / 3) - nj| < 1 / 6 := hj
  have hk' : |(a : ℝ) * (t + (k : ℕ) / 3) - nk| < 1 / 6 := hk
  obtain ⟨hjlo, hjhi⟩ := abs_lt.mp hj'
  obtain ⟨hklo, hkhi⟩ := abs_lt.mp hk'
  let z : ℤ := (a : ℤ) * (j : ℕ) - (a : ℤ) * (k : ℕ) - 3 * (nj - nk)
  have hzlo : (-1 : ℝ) < z := by dsimp [z]; push_cast; nlinarith
  have hzhi : (z : ℝ) < 1 := by dsimp [z]; push_cast; nlinarith
  have hzlo' : (-1 : ℤ) < z := by exact_mod_cast hzlo
  have hzhi' : z < (1 : ℤ) := by exact_mod_cast hzhi
  have hzero : (a : ℤ) * (j : ℕ) - (a : ℤ) * (k : ℕ) - 3 * (nj - nk) = 0 := by
    change z = 0
    omega
  have hmod : a % 3 ≠ 0 := fun h => ha (Nat.dvd_of_mod_eq_zero h)
  exact third_integer_unique a hmod j k (nj - nk) (by omega)

/-- Sixth-grid odd endpoints remain safe under every integer third shift. -/
theorem endpoint_third_shift_safe (x : ℝ)
    (hx : distance x = (1 / 6 : ℝ) ∨ distance x = (1 / 2 : ℝ)) (q : ℤ) :
    (1 / 6 : ℝ) ≤ distance (x + (q : ℝ) / 3) := by
  by_contra hsafe
  have hsmall : |x + (q : ℝ) / 3 - (round (x + (q : ℝ) / 3) : ℝ)| < 1 / 6 :=
    lt_of_not_ge hsafe
  obtain ⟨hlo, hhi⟩ := abs_lt.mp hsmall
  let z : ℤ := 3 * (round x - round (x + (q : ℝ) / 3)) + q
  rcases le_or_gt (0 : ℝ) (x - round x) with hsign | hsign
  · rcases hx with hx | hx
    · have hx' : x - (round x : ℝ) = 1 / 6 := by
        simpa only [distance, abs_of_nonneg hsign] using hx
      have hzlo : (-1 : ℝ) < 2 * (z : ℝ) + 1 := by
        dsimp [z]; push_cast; linarith
      have hzhi : 2 * (z : ℝ) + 1 < 1 := by
        dsimp [z]; push_cast; linarith
      have hzlo' : (-1 : ℤ) < 2 * z + 1 := by exact_mod_cast hzlo
      have hzhi' : 2 * z + 1 < (1 : ℤ) := by exact_mod_cast hzhi
      omega
    · have hx' : x - (round x : ℝ) = 1 / 2 := by
        simpa only [distance, abs_of_nonneg hsign] using hx
      have hzlo : (-1 : ℝ) < 2 * (z : ℝ) + 3 := by
        dsimp [z]; push_cast; linarith
      have hzhi : 2 * (z : ℝ) + 3 < 1 := by
        dsimp [z]; push_cast; linarith
      have hzlo' : (-1 : ℤ) < 2 * z + 3 := by exact_mod_cast hzlo
      have hzhi' : 2 * z + 3 < (1 : ℤ) := by exact_mod_cast hzhi
      omega
  · rcases hx with hx | hx
    · have hx' : x - (round x : ℝ) = -(1 / 6 : ℝ) := by
        have h := hx
        rw [distance, abs_of_neg hsign] at h
        linarith
      have hzlo : (-1 : ℝ) < 2 * (z : ℝ) - 1 := by
        dsimp [z]; push_cast; linarith
      have hzhi : 2 * (z : ℝ) - 1 < 1 := by
        dsimp [z]; push_cast; linarith
      have hzlo' : (-1 : ℤ) < 2 * z - 1 := by exact_mod_cast hzlo
      have hzhi' : 2 * z - 1 < (1 : ℤ) := by exact_mod_cast hzhi
      omega
    · have hx' : x - (round x : ℝ) = -(1 / 2 : ℝ) := by
        have h := hx
        rw [distance, abs_of_neg hsign] at h
        linarith
      have hzlo : (-1 : ℝ) < 2 * (z : ℝ) - 3 := by
        dsimp [z]; push_cast; linarith
      have hzhi : 2 * (z : ℝ) - 3 < 1 := by
        dsimp [z]; push_cast; linarith
      have hzlo' : (-1 : ℤ) < 2 * z - 3 := by exact_mod_cast hzlo
      have hzhi' : 2 * z - 3 < (1 : ℤ) := by exact_mod_cast hzhi
      omega

theorem endpoint_runner_third_shift_safe (a : ℕ) (t : ℝ)
    (hx : distance ((a : ℝ) * t) = (1 / 6 : ℝ) ∨
      distance ((a : ℝ) * t) = (1 / 2 : ℝ)) (j : Fin 3) :
    (1 / 6 : ℝ) ≤ distance ((a : ℝ) * (t + (j : ℕ) / 3)) := by
  have h := endpoint_third_shift_safe ((a : ℝ) * t) hx ((a : ℤ) * (j : ℕ))
  have he : (a : ℝ) * (t + (j : ℕ) / 3) =
      (a : ℝ) * t + (((a : ℤ) * (j : ℕ) : ℤ) : ℝ) / 3 := by
    push_cast
    ring
  simpa only [he] using h

/-- Two possible obstructing runners cannot cover three distinct shifts. -/
theorem exists_third_shift_of_at_most_two (v : Fin 5 → ℕ) (s : Finset (Fin 5))
    (t : ℝ)
    (hsafe : ∀ j : Fin 3, ∀ i ∈ s,
      (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * (t + (j : ℕ) / 3)))
    (hnondiv : ∀ i ∉ s, ¬3 ∣ v i)
    (hcard : (Finset.univ \ s).card ≤ 2) :
    ∃ j : Fin 3, AllSafe v (t + (j : ℕ) / 3) := by
  classical
  by_contra hn
  have hbad : ∀ j : Fin 3, ∃ i : Fin 5,
      distance ((v i : ℝ) * (t + (j : ℕ) / 3)) < (1 / 6 : ℝ) := by
    simpa only [not_exists, AllSafe, not_forall, not_le] using hn
  choose f hf using hbad
  have hout : ∀ j, f j ∉ s := by
    intro j hj
    exact (not_lt_of_ge (hsafe j (f j) hj)) (hf j)
  have hinj : Function.Injective f := by
    intro j k h
    apply third_unsafe_unique (v (f j)) (hnondiv (f j) (hout j)) t j k (hf j)
    simpa only [h] using hf k
  have hsub : Finset.univ.image f ⊆ Finset.univ \ s := by
    intro i hi
    obtain ⟨j, _, rfl⟩ := Finset.mem_image.mp hi
    exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hout j⟩
  have hle := Finset.card_le_card hsub
  rw [Finset.card_image_of_injective _ hinj] at hle
  norm_num at hle
  omega

/-- Two distinct obstructions at the initial time leave a safe third shift. -/
theorem exists_third_shift_of_two_unsafe (v : Fin 5 → ℕ) (s : Finset (Fin 5))
    (t : ℝ)
    (hsafe : ∀ j : Fin 3, ∀ i ∈ s,
      (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * (t + (j : ℕ) / 3)))
    (hnondiv : ∀ i ∉ s, ¬3 ∣ v i)
    (hcard : (Finset.univ \ s).card ≤ 3)
    (a b : Fin 5) (hab : a ≠ b)
    (ha : distance ((v a : ℝ) * t) < (1 / 6 : ℝ))
    (hb : distance ((v b : ℝ) * t) < (1 / 6 : ℝ)) :
    ∃ j : Fin 3, AllSafe v (t + (j : ℕ) / 3) := by
  classical
  by_contra hn
  have hbad : ∀ j : Fin 3, ∃ i : Fin 5,
      distance ((v i : ℝ) * (t + (j : ℕ) / 3)) < (1 / 6 : ℝ) := by
    simpa only [not_exists, AllSafe, not_forall, not_le] using hn
  obtain ⟨c, hc⟩ := hbad 1
  obtain ⟨d, hd⟩ := hbad 2
  have outside (i : Fin 5) (j : Fin 3)
      (hi : distance ((v i : ℝ) * (t + (j : ℕ) / 3)) < (1 / 6 : ℝ)) : i ∉ s := by
    intro his
    exact (not_lt_of_ge (hsafe j i his)) hi
  have ha0 : distance ((v a : ℝ) * (t + ((0 : Fin 3) : ℕ) / 3)) < (1 / 6 : ℝ) := by
    simpa using ha
  have hb0 : distance ((v b : ℝ) * (t + ((0 : Fin 3) : ℕ) / 3)) < (1 / 6 : ℝ) := by
    simpa using hb
  have different (i k : Fin 5) (j l : Fin 3) (hjl : j ≠ l)
      (hi : distance ((v i : ℝ) * (t + (j : ℕ) / 3)) < (1 / 6 : ℝ))
      (hk : distance ((v k : ℝ) * (t + (l : ℕ) / 3)) < (1 / 6 : ℝ)) : i ≠ k := by
    intro hik
    subst k
    exact hjl (third_unsafe_unique (v i) (hnondiv i (outside i j hi)) t j l hi hk)
  have hac : a ≠ c := different a c 0 1 (by decide) ha0 hc
  have had : a ≠ d := different a d 0 2 (by decide) ha0 hd
  have hbc : b ≠ c := different b c 0 1 (by decide) hb0 hc
  have hbd : b ≠ d := different b d 0 2 (by decide) hb0 hd
  have hcd : c ≠ d := different c d 1 2 (by decide) hc hd
  have hfour : ({a, b, c, d} : Finset (Fin 5)).card = 4 := by
    simp [hab, hac, had, hbc, hbd, hcd]
  have hsub : ({a, b, c, d} : Finset (Fin 5)) ⊆ Finset.univ \ s := by
    intro i hi
    simp only [Finset.mem_insert, Finset.mem_singleton] at hi
    rcases hi with hia | hib | hic | hid
    · rw [hia]
      exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, outside a 0 ha0⟩
    · rw [hib]
      exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, outside b 0 hb0⟩
    · rw [hic]
      exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, outside c 1 hc⟩
    · rw [hid]
      exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, outside d 2 hd⟩
  have hle := Finset.card_le_card hsub
  omega

theorem exists_third_shift_of_endpoint (v : Fin 5 → ℕ) (s : Finset (Fin 5))
    (t : ℝ)
    (hsafe : ∀ j : Fin 3, ∀ i ∈ s,
      (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * (t + (j : ℕ) / 3)))
    (hnondiv : ∀ i ∉ s, ¬3 ∣ v i)
    (hcard : (Finset.univ \ s).card ≤ 3)
    (a : Fin 5) (ha : a ∉ s)
    (hendpoint : distance ((v a : ℝ) * t) = (1 / 6 : ℝ) ∨
      distance ((v a : ℝ) * t) = (1 / 2 : ℝ)) :
    ∃ j : Fin 3, AllSafe v (t + (j : ℕ) / 3) := by
  classical
  apply exists_third_shift_of_at_most_two v (insert a s) t
  · intro j i hi
    rcases Finset.mem_insert.mp hi with hia | hi
    · rw [hia]
      exact endpoint_runner_third_shift_safe (v a) t hendpoint j
    · exact hsafe j i hi
  · intro i hi
    exact hnondiv i (fun his => hi (Finset.mem_insert_of_mem his))
  · have hsub : s ⊆ Finset.univ := Finset.subset_univ _
    have hsub' : insert a s ⊆ Finset.univ := Finset.subset_univ _
    rw [Finset.card_sdiff_of_subset hsub] at hcard
    rw [Finset.card_sdiff_of_subset hsub', Finset.card_insert_of_notMem ha]
    norm_num at hcard ⊢
    omega

end Loneliness.Renault
