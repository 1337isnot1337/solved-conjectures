import Conjectures.LonelinessRenaultTwoMultiplesCase
import Conjectures.LonelinessRenaultRationalOrbit
import Conjectures.LonelinessRenaultReindex

/-! Assembly of the two-multiples-of-three case from exact phase maxima. -/

namespace Loneliness.Renault

theorem fiveSafe_iff_allSafe (a b c d e : ℕ) (t : ℝ) :
    FiveSafe a b c d e t ↔ AllSafe ![a, b, c, d, e] t := by
  constructor
  · rintro ⟨ha, hb, hc, hd, he⟩ i
    fin_cases i
    · exact ha
    · exact hb
    · exact hc
    · exact hd
    · exact he
  · intro h
    exact ⟨h 0, h 1, h 2, h 3, h 4⟩

private theorem two_multiple_endpoint_completion (a b c d e : ℕ)
    (ha₃ : 3 ∣ a) (hb₃ : 3 ∣ b) (hc₃ : ¬3 ∣ c) (hd₃ : ¬3 ∣ d) (he₃ : ¬3 ∣ e)
    (t : ℝ) (ha : (1 / 6 : ℝ) ≤ distance ((a : ℝ) * t))
    (hb : (1 / 6 : ℝ) ≤ distance ((b : ℝ) * t))
    (hc : distance ((c : ℝ) * t) = (1 / 6 : ℝ)) :
    ∃ u : ℝ, FiveSafe a b c d e u := by
  let v : Fin 5 → ℕ := ![a, b, c, d, e]
  have hsafe : ∀ j : Fin 3, ∀ i ∈ ({0, 1} : Finset (Fin 5)),
      (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * (t + (j : ℕ) / 3)) := by
    intro j i hi
    have hi' : i = 0 ∨ i = 1 := by simpa using hi
    rcases hi' with hi | hi
    · subst i
      change (1 / 6 : ℝ) ≤ distance ((a : ℝ) * (t + (j : ℕ) / 3))
      rw [distance_third_shift_of_dvd a ha₃]
      exact ha
    · subst i
      change (1 / 6 : ℝ) ≤ distance ((b : ℝ) * (t + (j : ℕ) / 3))
      rw [distance_third_shift_of_dvd b hb₃]
      exact hb
  have hnondiv : ∀ i ∉ ({0, 1} : Finset (Fin 5)), ¬3 ∣ v i := by
    intro i hi
    fin_cases i
    · simp at hi
    · simp at hi
    · exact hc₃
    · exact hd₃
    · exact he₃
  obtain ⟨j, hj⟩ := exists_third_shift_of_endpoint v {0, 1} t hsafe hnondiv
    (by decide) 2 (by decide) (Or.inl hc)
  exact ⟨_, (fiveSafe_iff_allSafe a b c d e _).mpr hj⟩

theorem two_multiple_forced_divisibility (a b c d e : ℕ) (hcpos : 0 < c)
    (ha₃ : 3 ∣ a) (hb₃ : 3 ∣ b) (hc₃ : ¬3 ∣ c) (hd₃ : ¬3 ∣ d) (he₃ : ¬3 ∣ e)
    (hsix : 6 ∣ a ∨ 6 ∣ b)
    (hparity : 2 ∣ a → 2 ∣ b → 2 ∣ c → Odd d ∧ Odd e)
    (hno : ∀ u : ℝ, ¬ FiveSafe a b c d e u) :
    6 * c ∣ a ∨ 6 * c ∣ b := by
  obtain ⟨t, ht, hmax⟩ := exists_phase_fiber_maximum [a, b] c hcpos
  have hclear (s : ℝ) : clearance [a, b] s =
      min (distance ((a : ℝ) * s)) (distance ((b : ℝ) * s)) := by
    change min (distance ((a : ℝ) * s)) (min (distance ((b : ℝ) * s)) (1 / 2)) = _
    rw [min_eq_left (distance_le_half _)]
  have hmax' : ∀ s : ℝ, distance ((c : ℝ) * s + 1 / 6) = 0 →
      min (distance ((a : ℝ) * s)) (distance ((b : ℝ) * s)) ≤
        min (distance ((a : ℝ) * t)) (distance ((b : ℝ) * t)) := by
    intro s hs
    simpa only [hclear] using hmax s hs
  have hsmall : min (distance ((a : ℝ) * t)) (distance ((b : ℝ) * t)) < 1 / 6 := by
    by_contra hn
    have hsafe := le_min_iff.mp (le_of_not_gt hn)
    have hcphase := phase_fiber_multiplier_distance c t ht 1
    have hc : distance ((c : ℝ) * t) = (1 / 6 : ℝ) := by
      calc
        distance ((c : ℝ) * t) = distance (1 / 6 : ℝ) := by simpa using hcphase
        _ = 1 / 6 := by
          rw [distance_of_unit_interval (by norm_num) (by norm_num)]
          norm_num
    obtain ⟨u, hu⟩ :=
      two_multiple_endpoint_completion a b c d e ha₃ hb₃ hc₃ hd₃ he₃ t hsafe.1 hsafe.2 hc
    exact hno u hu
  have hcmod : c % 3 ≠ 0 := fun hz => hc₃ (Nat.dvd_of_mod_eq_zero hz)
  have hzero : min (distance ((a : ℝ) * t)) (distance ((b : ℝ) * t)) = 0 := by
    rcases le_or_gt (distance ((a : ℝ) * t)) (distance ((b : ℝ) * t)) with hord | hord
    · have ha := ordered_phase_fiber_zero a b c d e ha₃ hb₃ hcmod hsix hparity t ht
        (by simpa only [min_eq_left hord] using hsmall) hord
        (by intro s hs; simpa only [min_eq_left hord] using hmax' s hs) hno
      rw [min_eq_left hord, ha]
    · have hno' : ∀ u : ℝ, ¬ FiveSafe b a c d e u := by
        intro u hu
        exact hno u ⟨hu.2.1, hu.1, hu.2.2⟩
      have hb := ordered_phase_fiber_zero b a c d e hb₃ ha₃ hcmod hsix.symm
        (fun hb ha hc => hparity ha hb hc) t ht
        (by simpa only [min_eq_right hord.le] using hsmall) hord.le
        (by
          intro s hs
          rw [min_comm]
          simpa only [min_eq_right hord.le] using hmax' s hs) hno'
      rw [min_eq_right hord.le, hb]
  apply phase_fiber_zero_divisibility a b c hcpos
  intro s hs
  have hs' : distance ((c : ℝ) * s + 1 / 6) = 0 := by
    rw [hs]
    norm_num [distance]
  have hle := hmax' s hs'
  rw [hzero] at hle
  rcases le_or_gt (distance ((a : ℝ) * s)) (distance ((b : ℝ) * s)) with hord | hord
  · left
    apply le_antisymm _ (distance_nonneg _)
    simpa only [min_eq_left hord] using hle
  · right
    apply le_antisymm _ (distance_nonneg _)
    simpa only [min_eq_right hord.le] using hle

private theorem odd_outside_three_even (v : Fin 5 → ℕ)
    (hcount : (divisibleIndices v 2).card ≤ 3)
    (i j : Fin 5) (hi₀ : i ≠ 0) (hi₁ : i ≠ 1)
    (hj₀ : j ≠ 0) (hj₁ : j ≠ 1) (hij : i ≠ j)
    (h₀ : 2 ∣ v 0) (h₁ : 2 ∣ v 1) (hi : 2 ∣ v i) : Odd (v j) := by
  have hnot : ¬2 ∣ v j := by
    intro hj
    have hcard : ({0, 1, i, j} : Finset (Fin 5)).card = 4 := by
      simp [Ne.symm hi₀, Ne.symm hi₁, Ne.symm hj₀, Ne.symm hj₁, hij]
    have hsub : ({0, 1, i, j} : Finset (Fin 5)) ⊆ divisibleIndices v 2 := by
      intro k hk
      simp only [Finset.mem_insert, Finset.mem_singleton] at hk
      rcases hk with hk | hk | hk | hk
      · rw [hk]
        exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, h₀⟩
      · rw [hk]
        exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, h₁⟩
      · rw [hk]
        exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hi⟩
      · rw [hk]
        exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hj⟩
    have hle := Finset.card_le_card hsub
    omega
  have hmod : v j % 2 ≠ 0 := fun h => hnot (Nat.dvd_of_mod_eq_zero h)
  have hmodlt := Nat.mod_lt (v j) (by decide : 0 < 2)
  have hdecomp := Nat.mod_add_div (v j) 2
  exact ⟨v j / 2, by omega⟩

theorem exists_allSafe_of_first_two_multiples (hLRC4 : CoordinateSubspace.LonelyRunnerBound 4)
    (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (h₀ : 3 ∣ v 0) (h₁ : 3 ∣ v 1)
    (hnondiv : ∀ i ∉ ({0, 1} : Finset (Fin 5)), ¬3 ∣ v i) :
    ∃ t : ℝ, AllSafe v t := by
  classical
  by_contra hno
  have hn₂ : ¬3 ∣ v 2 := hnondiv 2 (by decide)
  have hn₃ : ¬3 ∣ v 3 := hnondiv 3 (by decide)
  have hn₄ : ¬3 ∣ v 4 := hnondiv 4 (by decide)
  have hsix : 6 ∣ v 0 ∨ 6 ∣ v 1 := by
    have hc := divisibility_card_pos v hno 6 (by decide) (by decide)
    obtain ⟨i, hi⟩ := Finset.card_pos.mp (show 0 < (divisibleIndices v 6).card by omega)
    have hdiv : 6 ∣ v i := (Finset.mem_filter.mp hi).2
    fin_cases i
    · exact Or.inl hdiv
    · exact Or.inr hdiv
    · exact False.elim (hn₂ ((by decide : 3 ∣ 6).trans hdiv))
    · exact False.elim (hn₃ ((by decide : 3 ∣ 6).trans hdiv))
    · exact False.elim (hn₄ ((by decide : 3 ∣ 6).trans hdiv))
  have heven := divisibility_card_le_three hLRC4 v hpositive hprimitive hno 2 (by decide)
  have hnoFive : ∀ t : ℝ, ¬ FiveSafe (v 0) (v 1) (v 2) (v 3) (v 4) t := by
    intro t ht
    rcases ht with ⟨h0, h1, h2, h3, h4⟩
    apply hno
    refine ⟨t, ?_⟩
    intro i
    fin_cases i
    · exact h0
    · exact h1
    · exact h2
    · exact h3
    · exact h4
  have hf₂ : 6 * v 2 ∣ v 0 ∨ 6 * v 2 ∣ v 1 := by
    apply two_multiple_forced_divisibility (v 0) (v 1) (v 2) (v 3) (v 4)
      (hpositive 2) h₀ h₁ hn₂ hn₃ hn₄ hsix
    · intro h0 h1 h2
      exact ⟨odd_outside_three_even v heven 2 3 (by decide) (by decide)
        (by decide) (by decide) (by decide) h0 h1 h2,
        odd_outside_three_even v heven 2 4 (by decide) (by decide)
        (by decide) (by decide) (by decide) h0 h1 h2⟩
    · exact hnoFive
  have hf₃ : 6 * v 3 ∣ v 0 ∨ 6 * v 3 ∣ v 1 := by
    apply two_multiple_forced_divisibility (v 0) (v 1) (v 3) (v 2) (v 4)
      (hpositive 3) h₀ h₁ hn₃ hn₂ hn₄ hsix
    · intro h0 h1 h3
      exact ⟨odd_outside_three_even v heven 3 2 (by decide) (by decide)
        (by decide) (by decide) (by decide) h0 h1 h3,
        odd_outside_three_even v heven 3 4 (by decide) (by decide)
        (by decide) (by decide) (by decide) h0 h1 h3⟩
    · intro t ht
      rcases ht with ⟨h0, h1, h3, h2, h4⟩
      exact hnoFive t ⟨h0, h1, h2, h3, h4⟩
  have hf₄ : 6 * v 4 ∣ v 0 ∨ 6 * v 4 ∣ v 1 := by
    apply two_multiple_forced_divisibility (v 0) (v 1) (v 4) (v 2) (v 3)
      (hpositive 4) h₀ h₁ hn₄ hn₂ hn₃ hsix
    · intro h0 h1 h4
      exact ⟨odd_outside_three_even v heven 4 2 (by decide) (by decide)
        (by decide) (by decide) (by decide) h0 h1 h4,
        odd_outside_three_even v heven 4 3 (by decide) (by decide)
        (by decide) (by decide) (by decide) h0 h1 h4⟩
    · intro t ht
      rcases ht with ⟨h0, h1, h4, h2, h3⟩
      exact hnoFive t ⟨h0, h1, h2, h3, h4⟩
  have hb₂ : 6 * v 2 ≤ v 0 ∨ 6 * v 2 ≤ v 1 :=
    hf₂.imp (Nat.le_of_dvd (hpositive 0)) (Nat.le_of_dvd (hpositive 1))
  have hb₃ : 6 * v 3 ≤ v 0 ∨ 6 * v 3 ≤ v 1 :=
    hf₃.imp (Nat.le_of_dvd (hpositive 0)) (Nat.le_of_dvd (hpositive 1))
  have hb₄ : 6 * v 4 ≤ v 0 ∨ 6 * v 4 ≤ v 1 :=
    hf₄.imp (Nat.le_of_dvd (hpositive 0)) (Nat.le_of_dvd (hpositive 1))
  have h01 : v 0 < 5 * v 1 := by
    by_contra hn
    have hge : 5 * v 1 ≤ v 0 := le_of_not_gt hn
    apply hno
    apply exists_allSafe_of_fast hLRC4 v hpositive
    refine ⟨0, ?_⟩
    intro i hi
    fin_cases i
    · simp at hi
    · exact hge
    · rcases hb₂ with h | h <;> omega
    · rcases hb₃ with h | h <;> omega
    · rcases hb₄ with h | h <;> omega
  have h10 : v 1 < 5 * v 0 := by
    by_contra hn
    have hge : 5 * v 0 ≤ v 1 := le_of_not_gt hn
    apply hno
    apply exists_allSafe_of_fast hLRC4 v hpositive
    refine ⟨1, ?_⟩
    intro i hi
    fin_cases i
    · exact hge
    · simp at hi
    · rcases hb₂ with h | h <;> omega
    · rcases hb₃ with h | h <;> omega
    · rcases hb₄ with h | h <;> omega
  have finish (p q : Fin 5) (hpq : p ≠ q)
      (hpair : (6 * v p ∣ v 0 ∧ 6 * v q ∣ v 0) ∨
        (6 * v p ∣ v 1 ∧ 6 * v q ∣ v 1)) : False := by
    have witness : ∃ t : ℝ,
        (1 / 6 : ℝ) ≤ distance ((v 0 : ℝ) * t) ∧
        (1 / 6 : ℝ) ≤ distance ((v 1 : ℝ) * t) ∧
        distance ((v p : ℝ) * t) < (1 / 6 : ℝ) ∧
        distance ((v q : ℝ) * t) < (1 / 6 : ℝ) := by
      rcases hpair with ⟨hp, hq⟩ | ⟨hp, hq⟩
      · exact two_multiple_final_times (v 0) (v 1) (v p) (v q)
          (hpositive 0) (hpositive 1) (hpositive p) (hpositive q)
          (Nat.le_of_dvd (hpositive 0) hp) (Nat.le_of_dvd (hpositive 0) hq) h01 h10
      · obtain ⟨t, h1, h0, hp', hq'⟩ := two_multiple_final_times (v 1) (v 0) (v p) (v q)
          (hpositive 1) (hpositive 0) (hpositive p) (hpositive q)
          (Nat.le_of_dvd (hpositive 1) hp) (Nat.le_of_dvd (hpositive 1) hq) h10 h01
        exact ⟨t, h0, h1, hp', hq'⟩
    obtain ⟨t, h0, h1, hp, hq⟩ := witness
    have hsafe : ∀ j : Fin 3, ∀ i ∈ ({0, 1} : Finset (Fin 5)),
        (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * (t + (j : ℕ) / 3)) := by
      intro j i hi
      have hi' : i = 0 ∨ i = 1 := by simpa using hi
      rcases hi' with hi | hi
      · subst i
        rw [distance_third_shift_of_dvd (v 0) h₀]
        exact h0
      · subst i
        rw [distance_third_shift_of_dvd (v 1) h₁]
        exact h1
    obtain ⟨j, hj⟩ := exists_third_shift_of_two_unsafe v {0, 1} t hsafe hnondiv
      (by decide) p q hpq hp hq
    exact hno ⟨_, hj⟩
  rcases hf₂ with h20 | h21
  · rcases hf₃ with h30 | h31
    · exact finish 2 3 (by decide) (Or.inl ⟨h20, h30⟩)
    · rcases hf₄ with h40 | h41
      · exact finish 2 4 (by decide) (Or.inl ⟨h20, h40⟩)
      · exact finish 3 4 (by decide) (Or.inr ⟨h31, h41⟩)
  · rcases hf₃ with h30 | h31
    · rcases hf₄ with h40 | h41
      · exact finish 3 4 (by decide) (Or.inl ⟨h30, h40⟩)
      · exact finish 2 4 (by decide) (Or.inr ⟨h21, h41⟩)
    · exact finish 2 3 (by decide) (Or.inr ⟨h21, h31⟩)

theorem exists_allSafe_of_two_multiples (hLRC4 : CoordinateSubspace.LonelyRunnerBound 4)
    (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (htwo : 2 ≤ (divisibleIndices v 3).card) :
    ∃ t : ℝ, AllSafe v t := by
  classical
  by_cases hthree : 3 ≤ (divisibleIndices v 3).card
  · exact exists_allSafe_of_three_multiples hLRC4 v hpositive hprimitive hthree
  have hcard : (divisibleIndices v 3).card = 2 := by omega
  obtain ⟨i, hi, j, hj, hij⟩ := Finset.one_lt_card.mp
    (show 1 < (divisibleIndices v 3).card by omega)
  obtain ⟨σ, hσ₀, hσ₁⟩ := exists_reindex_two i j hij
  let w : Fin 5 → ℕ := v ∘ σ
  have hwpos : ∀ k, 0 < w k := fun k => hpositive (σ k)
  have hwprim : (List.ofFn w).foldr Nat.gcd 0 = 1 :=
    (primitive_reindex_iff v σ).mpr hprimitive
  have hw₀ : 3 ∣ w 0 := by
    simpa only [w, Function.comp_apply, hσ₀] using (Finset.mem_filter.mp hi).2
  have hw₁ : 3 ∣ w 1 := by
    simpa only [w, Function.comp_apply, hσ₁] using (Finset.mem_filter.mp hj).2
  have hwcard : (divisibleIndices w 3).card = 2 := by
    change (Finset.univ.filter fun k => 3 ∣ v (σ k)).card = 2
    rw [card_filter_equiv σ (fun k => 3 ∣ v k)]
    exact hcard
  have hsub : ({0, 1} : Finset (Fin 5)) ⊆ divisibleIndices w 3 := by
    intro k hk
    have hk' : k = 0 ∨ k = 1 := by simpa using hk
    rcases hk' with hk | hk
    · rw [hk]
      exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hw₀⟩
    · rw [hk]
      exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hw₁⟩
  have heq : ({0, 1} : Finset (Fin 5)) = divisibleIndices w 3 :=
    Finset.eq_of_subset_of_card_le hsub (by rw [hwcard]; decide)
  have hnondiv : ∀ k ∉ ({0, 1} : Finset (Fin 5)), ¬3 ∣ w k := by
    intro k hk hd
    apply hk
    rw [heq]
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hd⟩
  obtain ⟨t, ht⟩ := exists_allSafe_of_first_two_multiples hLRC4 w hwpos hwprim hw₀ hw₁ hnondiv
  exact ⟨t, (allSafe_reindex_iff v σ t).mp ht⟩

end Loneliness.Renault
