import Conjectures.LonelinessRenaultPreliminaries

/-! The closed-endpoint version of Renault's third-shift obstruction argument. -/

namespace Loneliness.Renault

theorem third_shift_safe_of_initial_le (a : ℕ) (ha : ¬3 ∣ a) (t : ℝ)
    (hx : distance ((a : ℝ) * t) ≤ (1 / 6 : ℝ)) (j : Fin 3) (hj : j ≠ 0) :
    (1 / 6 : ℝ) ≤ distance ((a : ℝ) * (t + (j : ℕ) / 3)) := by
  by_cases he : distance ((a : ℝ) * t) = (1 / 6 : ℝ)
  · exact endpoint_runner_third_shift_safe a t (Or.inl he) j
  have hlt : distance ((a : ℝ) * t) < (1 / 6 : ℝ) := by
    by_contra hn
    exact he (le_antisymm hx (le_of_not_gt hn))
  by_contra hn
  exact hj (third_unsafe_unique a ha t j 0 (lt_of_not_ge hn) (by simpa using hlt))

/-- Three distinct close runners cannot obstruct both nonzero third shifts. -/
theorem exists_third_shift_of_three_close (v : Fin 5 → ℕ) (s : Finset (Fin 5))
    (t : ℝ)
    (hsafe : ∀ j : Fin 3, ∀ i ∈ s,
      (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * (t + (j : ℕ) / 3)))
    (hnondiv : ∀ i ∉ s, ¬3 ∣ v i)
    (hcard : (Finset.univ \ s).card ≤ 4)
    (a b c : Fin 5) (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (haout : a ∉ s) (hbout : b ∉ s) (hcout : c ∉ s)
    (ha : distance ((v a : ℝ) * t) ≤ (1 / 6 : ℝ))
    (hb : distance ((v b : ℝ) * t) ≤ (1 / 6 : ℝ))
    (hc : distance ((v c : ℝ) * t) ≤ (1 / 6 : ℝ)) :
    ∃ j : Fin 3, AllSafe v (t + (j : ℕ) / 3) := by
  classical
  by_contra hn
  have hbad : ∀ j : Fin 3, ∃ i : Fin 5,
      distance ((v i : ℝ) * (t + (j : ℕ) / 3)) < (1 / 6 : ℝ) := by
    simpa only [not_exists, AllSafe, not_forall, not_le] using hn
  obtain ⟨d, hd⟩ := hbad 1
  obtain ⟨e, he⟩ := hbad 2
  have outside (i : Fin 5) (j : Fin 3)
      (hi : distance ((v i : ℝ) * (t + (j : ℕ) / 3)) < (1 / 6 : ℝ)) : i ∉ s := by
    intro his
    exact (not_lt_of_ge (hsafe j i his)) hi
  have different (i k : Fin 5) (hi : i ∉ s)
      (hclose : distance ((v i : ℝ) * t) ≤ (1 / 6 : ℝ))
      (j : Fin 3) (hj : j ≠ 0)
      (hbadj : distance ((v k : ℝ) * (t + (j : ℕ) / 3)) < (1 / 6 : ℝ)) : i ≠ k := by
    intro hik
    subst k
    exact (not_lt_of_ge (third_shift_safe_of_initial_le (v i) (hnondiv i hi) t hclose j hj)) hbadj
  have had : a ≠ d := different a d haout ha 1 (by decide) hd
  have hae : a ≠ e := different a e haout ha 2 (by decide) he
  have hbd : b ≠ d := different b d hbout hb 1 (by decide) hd
  have hbe : b ≠ e := different b e hbout hb 2 (by decide) he
  have hcd : c ≠ d := different c d hcout hc 1 (by decide) hd
  have hce : c ≠ e := different c e hcout hc 2 (by decide) he
  have hde : d ≠ e := by
    intro h
    have he' : distance ((v d : ℝ) * (t + ((2 : Fin 3) : ℕ) / 3)) < (1 / 6 : ℝ) := by
      simpa only [h] using he
    have h12 := third_unsafe_unique (v d) (hnondiv d (outside d 1 hd)) t 1 2 hd he'
    norm_num at h12
  have hfive : ({a, b, c, d, e} : Finset (Fin 5)).card = 5 := by
    simp [hab, hac, had, hae, hbc, hbd, hbe, hcd, hce, hde]
  have hsub : ({a, b, c, d, e} : Finset (Fin 5)) ⊆ Finset.univ \ s := by
    intro i hi
    simp only [Finset.mem_insert, Finset.mem_singleton] at hi
    rcases hi with hia | hib | hic | hid | hie
    · rw [hia]
      exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, haout⟩
    · rw [hib]
      exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hbout⟩
    · rw [hic]
      exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, hcout⟩
    · rw [hid]
      exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, outside d 1 hd⟩
    · rw [hie]
      exact Finset.mem_sdiff.mpr ⟨Finset.mem_univ _, outside e 2 he⟩
  have hle := Finset.card_le_card hsub
  omega

end Loneliness.Renault
