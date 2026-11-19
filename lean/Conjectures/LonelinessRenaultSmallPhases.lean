import Conjectures.LonelinessRenaultPhaseCells

/-! The multiplier obstruction and finite sixth-shift argument used in the
three-even-speed case of Renault's proof. -/

set_option maxRecDepth 16384
set_option maxHeartbeats 0

namespace Loneliness.Renault

theorem exists_small_multiplier_unsafe (x : ℝ) (hx : (1 / 6 : ℝ) < distance x) :
    ∃ a : ℕ, 2 ≤ a ∧ a ≤ 5 ∧ distance ((a : ℝ) * x) < 1 / 6 := by
  let r := distance x
  have hr : 1 / 6 < r := hx
  have hhalf : r ≤ 1 / 2 := distance_le_half x
  have transfer (a : ℕ) (k : ℤ) (h : |(a : ℝ) * r - k| < 1 / 6) :
      distance ((a : ℝ) * x) < 1 / 6 := by
    rw [← distance_nat_mul_distance a x]
    exact lt_of_le_of_lt (distance_le_int _ k) h
  by_cases hfirst : r < 7 / 30
  · refine ⟨5, by decide, by decide, transfer 5 1 ?_⟩
    norm_num only [Nat.cast_ofNat, Int.cast_one]
    exact abs_lt.mpr ⟨by linarith, by linarith⟩
  by_cases hsecond : r < 7 / 24
  · refine ⟨4, by decide, by decide, transfer 4 1 ?_⟩
    norm_num only [Nat.cast_ofNat, Int.cast_one]
    exact abs_lt.mpr ⟨by linarith, by linarith⟩
  by_cases hthird : r < 7 / 18
  · refine ⟨3, by decide, by decide, transfer 3 1 ?_⟩
    norm_num only [Nat.cast_ofNat, Int.cast_one]
    exact abs_lt.mpr ⟨by linarith, by linarith⟩
  by_cases hfourth : r < 13 / 30
  · refine ⟨5, by decide, by decide, transfer 5 2 ?_⟩
    norm_num only [Nat.cast_ofNat, Int.cast_ofNat]
    exact abs_lt.mpr ⟨by linarith, by linarith⟩
  · refine ⟨2, by decide, by decide, transfer 2 1 ?_⟩
    norm_num only [Nat.cast_ofNat, Int.cast_one]
    exact abs_lt.mpr ⟨by linarith, by linarith⟩

private def shiftActions (i : ℕ) : PhaseAction := ⟨1, i % 5 + 1, false⟩

-- BEGIN GENERATED RENAULT SMALL PHASE DATA
private def masksFullEven : List ℕ := [13, 22, 27]

private def coverFullEven : PhaseCover :=
  .next 0 60 27 27 (
  .next 60 120 13 13 (
  .next 120 180 13 13 (
  .next 180 240 13 22 (
  .next 240 300 22 22 (
  .next 300 360 13 27 (
  .single 360 27))))))

private theorem coverFullEven_checked :
    coverFullEven.check shiftActions 2 masksFullEven = true := by
  decide +kernel

private theorem coverFullEven_lower : coverFullEven.lower = 0 := rfl
private theorem coverFullEven_upper : coverFullEven.upper = 360 := rfl

private def masksLowEven : List ℕ := [27]

private def coverLowEven : PhaseCover :=
  .next 0 60 27 27 (
  .single 60 27)

private theorem coverLowEven_checked :
    coverLowEven.check shiftActions 2 masksLowEven = true := by
  decide +kernel

private theorem coverLowEven_lower : coverLowEven.lower = 0 := rfl
private theorem coverLowEven_upper : coverLowEven.upper = 60 := rfl

private def masksHighEven : List ℕ := [27]

private def coverHighEven : PhaseCover :=
  .next 300 360 27 27 (
  .single 360 27)

private theorem coverHighEven_checked :
    coverHighEven.check shiftActions 2 masksHighEven = true := by
  decide +kernel

private theorem coverHighEven_lower : coverHighEven.lower = 300 := rfl
private theorem coverHighEven_upper : coverHighEven.upper = 360 := rfl

private def masksFullOdd : List ℕ := [7, 19, 25, 28]

private def coverFullOdd : PhaseCover :=
  .next 0 60 7 7 (
  .next 60 120 7 7 (
  .next 120 180 7 19 (
  .next 180 240 19 25 (
  .next 240 300 25 28 (
  .next 300 360 28 28 (
  .single 360 7))))))

private theorem coverFullOdd_checked :
    coverFullOdd.check shiftActions 1 masksFullOdd = true := by
  decide +kernel

private theorem coverFullOdd_lower : coverFullOdd.lower = 0 := rfl
private theorem coverFullOdd_upper : coverFullOdd.upper = 360 := rfl

private def masksLowOdd : List ℕ := [15, 30]

private def coverLowOdd : PhaseCover :=
  .next 0 60 15 15 (
  .single 60 15)

private theorem coverLowOdd_checked :
    coverLowOdd.check shiftActions 1 masksLowOdd = true := by
  decide +kernel

private theorem coverLowOdd_lower : coverLowOdd.lower = 0 := rfl
private theorem coverLowOdd_upper : coverLowOdd.upper = 60 := rfl

private def masksHighOdd : List ℕ := [15, 30]

private def coverHighOdd : PhaseCover :=
  .next 300 360 30 30 (
  .single 360 15)

private theorem coverHighOdd_checked :
    coverHighOdd.check shiftActions 1 masksHighOdd = true := by
  decide +kernel

private theorem coverHighOdd_lower : coverHighOdd.lower = 300 := rfl
private theorem coverHighOdd_upper : coverHighOdd.upper = 360 := rfl

private theorem shiftTriplesEven_checked :
    phaseTripleCheck masksLowEven masksFullEven masksFullOdd = true := by
  decide +kernel

private theorem shiftTriplesOdd_checked :
    phaseTripleCheck masksFullEven masksFullEven masksLowOdd = true := by
  decide +kernel
-- END GENERATED RENAULT SMALL PHASE DATA

private theorem cover_mask (coefficient : ℕ) (cover : PhaseCover) (masks : List ℕ)
    (hcheck : cover.check shiftActions coefficient masks = true) (x : ℝ)
    (hl : (cover.lower : ℝ) ≤ 360 * Int.fract x)
    (hu : 360 * Int.fract x ≤ cover.upper) :
    ∃ mask ∈ masks, PhaseMaskGood shiftActions coefficient mask x := by
  obtain ⟨mask, hm, hg⟩ := cover.check_sound shiftActions coefficient masks (Int.fract x)
    hcheck hl hu
  refine ⟨mask, hm, ?_⟩
  intro i hi
  exact ((shiftActions i).good_fract_iff _ _).mp (hg i hi)

private theorem full_cover_mask (coefficient : ℕ) (cover : PhaseCover) (masks : List ℕ)
    (hcheck : cover.check shiftActions coefficient masks = true)
    (hl : cover.lower = 0) (hu : cover.upper = 360) (x : ℝ) :
    ∃ mask ∈ masks, PhaseMaskGood shiftActions coefficient mask x := by
  apply cover_mask coefficient cover masks hcheck x
  · rw [hl, Nat.cast_zero]
    positivity
  · rw [hu]
    norm_num only [Nat.cast_ofNat]
    nlinarith [Int.fract_lt_one x]

private theorem unsafe_cover_mask (coefficient : ℕ) (low high : PhaseCover) (masks : List ℕ)
    (hlcheck : low.check shiftActions coefficient masks = true)
    (hhcheck : high.check shiftActions coefficient masks = true)
    (hllower : low.lower = 0) (hlupper : low.upper = 60)
    (hhlower : high.lower = 300) (hhupper : high.upper = 360)
    (x : ℝ) (hx : distance x ≤ (1 / 6 : ℝ)) :
    ∃ mask ∈ masks, PhaseMaskGood shiftActions coefficient mask x := by
  by_cases hlow : Int.fract x ≤ 1 / 6
  · apply cover_mask coefficient low masks hlcheck x
    · rw [hllower, Nat.cast_zero]
      positivity
    · rw [hlupper]
      norm_num only [Nat.cast_ofNat]
      linarith
  · have hhigh : 5 / 6 ≤ Int.fract x := by
      rw [distance_eq_min_fract, min_le_iff] at hx
      rcases hx with h | h
      · exact False.elim (hlow h)
      · linarith
    apply cover_mask coefficient high masks hhcheck x
    · rw [hhlower]
      norm_num only [Nat.cast_ofNat]
      linarith
    · rw [hhupper]
      norm_num only [Nat.cast_ofNat]
      nlinarith [Int.fract_lt_one x]

private theorem full_even_mask (x : ℝ) :
    ∃ mask ∈ masksFullEven, PhaseMaskGood shiftActions 2 mask x :=
  full_cover_mask 2 coverFullEven masksFullEven coverFullEven_checked
    coverFullEven_lower coverFullEven_upper x

private theorem full_odd_mask (x : ℝ) :
    ∃ mask ∈ masksFullOdd, PhaseMaskGood shiftActions 1 mask x :=
  full_cover_mask 1 coverFullOdd masksFullOdd coverFullOdd_checked
    coverFullOdd_lower coverFullOdd_upper x

private theorem unsafe_even_mask (x : ℝ) (hx : distance x ≤ (1 / 6 : ℝ)) :
    ∃ mask ∈ masksLowEven, PhaseMaskGood shiftActions 2 mask x :=
  unsafe_cover_mask 2 coverLowEven coverHighEven masksLowEven
    coverLowEven_checked coverHighEven_checked
    coverLowEven_lower coverLowEven_upper coverHighEven_lower coverHighEven_upper x hx

private theorem unsafe_odd_mask (x : ℝ) (hx : distance x ≤ (1 / 6 : ℝ)) :
    ∃ mask ∈ masksLowOdd, PhaseMaskGood shiftActions 1 mask x :=
  unsafe_cover_mask 1 coverLowOdd coverHighOdd masksLowOdd
    coverLowOdd_checked coverHighOdd_checked
    coverLowOdd_lower coverLowOdd_upper coverHighOdd_lower coverHighOdd_upper x hx

private theorem shift_choice (x : Fin 3 → ℝ) (a b c : ℕ)
    (ha : PhaseMaskGood shiftActions 2 a (x 0))
    (hb : PhaseMaskGood shiftActions 2 b (x 1))
    (hc : PhaseMaskGood shiftActions 1 c (x 2))
    (hbit : ∃ k, a.testBit k = true ∧ b.testBit k = true ∧ c.testBit k = true) :
    ∃ n : ℕ, 1 ≤ n ∧ n ≤ 5 ∧ ∀ i,
      (1 / 6 : ℝ) ≤ distance (x i + (if i = 2 then (1 : ℝ) else 2) * (n : ℝ) / 6) := by
  obtain ⟨k, hka, hkb, hkc⟩ := hbit
  refine ⟨k % 5 + 1, by omega, by omega, ?_⟩
  intro i
  have hi : i = 0 ∨ i = 1 ∨ i = 2 := by omega
  rcases hi with rfl | rfl | rfl
  · simpa [shiftActions, PhaseAction.Good] using ha k hka
  · simpa [shiftActions, PhaseAction.Good] using hb k hkb
  · simpa [shiftActions, PhaseAction.Good] using hc k hkc

private theorem unsigned_shift_phase (x : Fin 3 → ℝ)
    (hclose : ∃ i, distance (x i) ≤ (1 / 6 : ℝ)) :
    ∃ b : ℕ, 1 ≤ b ∧ b ≤ 5 ∧ ∀ i,
      (1 / 6 : ℝ) ≤ distance (x i + (if i = 2 then (1 : ℝ) else 2) * (b : ℝ) / 6) := by
  obtain ⟨i, hi⟩ := hclose
  have hi' : i = 0 ∨ i = 1 ∨ i = 2 := by omega
  rcases hi' with rfl | rfl | rfl
  · obtain ⟨a, ha, hag⟩ := unsafe_even_mask (x 0) hi
    obtain ⟨b, hb, hbg⟩ := full_even_mask (x 1)
    obtain ⟨c, hc, hcg⟩ := full_odd_mask (x 2)
    exact shift_choice x a b c hag hbg hcg
      (phaseTripleCheck_sound _ _ _ shiftTriplesEven_checked a b c ha hb hc)
  · obtain ⟨a, ha, hag⟩ := full_even_mask (x 0)
    obtain ⟨b, hb, hbg⟩ := unsafe_even_mask (x 1) hi
    obtain ⟨c, hc, hcg⟩ := full_odd_mask (x 2)
    obtain ⟨k, hkb, hka, hkc⟩ :=
      phaseTripleCheck_sound _ _ _ shiftTriplesEven_checked b a c hb ha hc
    exact shift_choice x a b c hag hbg hcg ⟨k, hka, hkb, hkc⟩
  · obtain ⟨a, ha, hag⟩ := full_even_mask (x 0)
    obtain ⟨b, hb, hbg⟩ := full_even_mask (x 1)
    obtain ⟨c, hc, hcg⟩ := unsafe_odd_mask (x 2) hi
    exact shift_choice x a b c hag hbg hcg
      (phaseTripleCheck_sound _ _ _ shiftTriplesOdd_checked a b c ha hb hc)

private theorem sign_shift_distance (e : ℤ) (he : e = 1 ∨ e = -1) (x y : ℝ) :
    distance ((e : ℝ) * x + y) = distance (x + (e : ℝ) * y) := by
  rcases he with rfl | rfl
  · simp
  · calc
      distance (((-1 : ℤ) : ℝ) * x + y) =
          distance (-(x + ((-1 : ℤ) : ℝ) * y)) := by
        congr 1
        push_cast
        ring
      _ = distance (x + ((-1 : ℤ) : ℝ) * y) := CriticalFamilies.distance_neg _

theorem three_even_shift_phase (x : Fin 3 → ℝ) (e : Fin 3 → ℤ)
    (he0 : e 0 = 2 ∨ e 0 = -2) (he1 : e 1 = 2 ∨ e 1 = -2)
    (he2 : e 2 = 1 ∨ e 2 = -1)
    (hclose : ∃ i, distance (x i) ≤ (1 / 6 : ℝ)) :
    ∃ b : ℕ, 1 ≤ b ∧ b ≤ 5 ∧
      ∀ i, (1 / 6 : ℝ) ≤ distance (x i + (e i : ℝ) * (b : ℝ) / 6) := by
  let signs : Fin 3 → ℤ := fun i => if i = 2 then e i else e i / 2
  have hsigns (i : Fin 3) : signs i = 1 ∨ signs i = -1 := by
    have hi : i = 0 ∨ i = 1 ∨ i = 2 := by omega
    rcases hi with rfl | rfl | rfl
    · rcases he0 with h | h <;> norm_num [signs, h]
    · rcases he1 with h | h <;> norm_num [signs, h]
    · simpa [signs] using he2
  have he (i : Fin 3) :
      (signs i : ℝ) * (if i = 2 then (1 : ℝ) else 2) = (e i : ℝ) := by
    have hi : i = 0 ∨ i = 1 ∨ i = 2 := by omega
    rcases hi with rfl | rfl | rfl
    · rcases he0 with h | h <;> norm_num [signs, h]
    · rcases he1 with h | h <;> norm_num [signs, h]
    · simp [signs]
  have hclose' : ∃ i, distance ((signs i : ℝ) * x i) ≤ (1 / 6 : ℝ) := by
    obtain ⟨i, hi⟩ := hclose
    refine ⟨i, ?_⟩
    have hd := sign_shift_distance (signs i) (hsigns i) (x i) 0
    simp only [add_zero, mul_zero] at hd
    rw [hd]
    exact hi
  obtain ⟨b, hbl, hbu, hb⟩ := unsigned_shift_phase (fun i => (signs i : ℝ) * x i) hclose'
  refine ⟨b, hbl, hbu, ?_⟩
  intro i
  have h := hb i
  rw [sign_shift_distance (signs i) (hsigns i)] at h
  have heq : (signs i : ℝ) * ((if i = 2 then (1 : ℝ) else 2) * (b : ℝ) / 6) =
      (e i : ℝ) * (b : ℝ) / 6 := by
    calc
      _ = ((signs i : ℝ) * (if i = 2 then (1 : ℝ) else 2)) * (b : ℝ) / 6 := by ring
      _ = _ := by rw [he]
  rwa [heq] at h

end Loneliness.Renault
