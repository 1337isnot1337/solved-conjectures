import Conjectures.LonelinessRenaultPhaseCells

/-! Universal real phase lemmas 5.1, 6.1 and 6.4 from Renault's 2004 proof.
The finite payload covers both open intervals and every endpoint. Its masks
refer to affine transformations, not sample points. -/

set_option maxRecDepth 16384
set_option maxHeartbeats 0

namespace Loneliness.Renault

private def actions51 (i : ℕ) : PhaseAction :=
  if i < 20 then ⟨i / 5 + 2, i % 5 + 1, false⟩
  else ⟨1, if i = 20 then 1 else if i = 21 then 2 else 4, true⟩

private def actions61 (i : ℕ) : PhaseAction :=
  if i < 20 then ⟨i / 5 + 2, i % 5 + 1, false⟩
  else ⟨1, if i = 20 then 1 else if i = 21 then 2 else if i = 22 then 3 else 4, true⟩

private def actions64 (i : ℕ) : PhaseAction :=
  if i = 0 then ⟨2, 0, true⟩
  else if i < 3 then ⟨1, if i = 1 then 1 else 5, true⟩
  else ⟨if i < 9 then 3 else 5, (i - 3) % 6, false⟩

-- BEGIN GENERATED RENAULT PHASE DATA
private def masks51 : List ℕ := [4693625, 4846067, 5042675, 5044467, 5127417, 5142771, 5185145, 6541116, 6934332, 6940476, 6940572, 7137180, 3391385, 3404030, 3404414, 3406739, 3663100, 3666739, 3776473, 3784601, 3973081, 4083196, 4154620, 4158259, 5498823, 5754759, 6168367, 6168463, 6246279, 7140254, 7238558, 7982311, 8178919, 8179303, 8185447, 8283751, 3799678, 6078255, 7576815, 7970031, 1965951]

private def cover51 : PhaseCover :=
  .next 0 12 4693625 7576815 (
  .next 12 15 7576815 7576815 (
  .next 15 20 7576815 7576815 (
  .next 20 24 7576815 7576815 (
  .next 24 30 7576815 7970031 (
  .next 30 36 7982311 7982311 (
  .next 36 40 7982311 8178919 (
  .next 40 45 8178919 8179303 (
  .next 45 48 8179303 8185447 (
  .next 48 60 8185447 8283751 (
  .next 60 72 4158259 4158259 (
  .next 72 75 3666739 3666739 (
  .next 75 80 3666739 3666739 (
  .next 80 84 3406739 3406739 (
  .next 84 90 3406739 3406739 (
  .next 90 96 3391385 3391385 (
  .next 96 100 3391385 3784601 (
  .next 100 105 3776473 3776473 (
  .next 105 108 3776473 3776473 (
  .next 108 120 3776473 3973081 (
  .next 120 132 3973081 4083196 (
  .next 132 135 4083196 4083196 (
  .next 135 140 4083196 4154620 (
  .next 140 144 4154620 4154620 (
  .next 144 150 3663100 3663100 (
  .next 150 156 3404030 3404030 (
  .next 156 160 3404030 3404030 (
  .next 160 165 3404030 3404414 (
  .next 165 168 3404414 3404414 (
  .next 168 180 3404414 3799678 (
  .next 180 192 1965951 6078255 (
  .next 192 195 6168367 6168367 (
  .next 195 200 6168367 6168367 (
  .next 200 204 6168367 6168463 (
  .next 204 210 6168463 6168463 (
  .next 210 216 6168463 6246279 (
  .next 216 220 5754759 5754759 (
  .next 220 225 5754759 5754759 (
  .next 225 228 5498823 5498823 (
  .next 228 240 5498823 5498823 (
  .next 240 252 4846067 4846067 (
  .next 252 255 4846067 5042675 (
  .next 255 260 5042675 5042675 (
  .next 260 264 5042675 5044467 (
  .next 264 270 5044467 5142771 (
  .next 270 276 5127417 5127417 (
  .next 276 280 5127417 5127417 (
  .next 280 285 5127417 5185145 (
  .next 285 288 5185145 5185145 (
  .next 288 300 4693625 4693625 (
  .next 300 312 4693625 6541116 (
  .next 312 315 6541116 6934332 (
  .next 315 320 6934332 6940476 (
  .next 320 324 6940476 6940572 (
  .next 324 330 6940572 7137180 (
  .next 330 336 7137180 7140254 (
  .next 336 340 7140254 7238558 (
  .next 340 345 7238558 7238558 (
  .next 345 348 7238558 7238558 (
  .next 348 360 7238558 7238558 (
  .single 360 4693625))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

private theorem cover51_checked :
    cover51.check actions51 1 masks51 = true := by
  decide +kernel

private theorem cover51_lower : cover51.lower = 0 := rfl
private theorem cover51_upper : cover51.upper = 360 := rfl

private def masks61Odd : List ℕ := [3404030, 3404414, 3663100, 4083196, 4154620, 9693127, 9949063, 10362671, 10362767, 10440583, 13082233, 13234675, 13431283, 13433075, 13516025, 13531379, 13573753, 14929724, 15322940, 15329084, 15329180, 15525788, 3799678, 7585689, 7601043, 7861043, 7970777, 7978905, 8167385, 8352563, 10272559, 15528862, 15627166, 16370919, 16567527, 16567911, 16574055, 16672359, 15965423, 16358639, 9172983, 1965951]

private def cover61Odd : PhaseCover :=
  .next 0 12 13082233 15965423 (
  .next 12 15 15965423 15965423 (
  .next 15 20 15965423 15965423 (
  .next 20 24 15965423 15965423 (
  .next 24 30 15965423 16358639 (
  .next 30 36 16370919 16370919 (
  .next 36 40 16370919 16567527 (
  .next 40 45 16567527 16567911 (
  .next 45 48 16567911 16574055 (
  .next 48 60 16574055 16672359 (
  .next 60 72 8352563 8352563 (
  .next 72 75 7861043 7861043 (
  .next 75 80 7861043 7861043 (
  .next 80 84 7601043 7601043 (
  .next 84 90 7601043 7601043 (
  .next 90 96 7585689 7585689 (
  .next 96 100 7585689 7978905 (
  .next 100 105 7970777 7970777 (
  .next 105 108 7970777 7970777 (
  .next 108 120 7970777 8167385 (
  .next 120 132 4083196 4083196 (
  .next 132 135 4083196 4083196 (
  .next 135 140 4083196 4154620 (
  .next 140 144 4154620 4154620 (
  .next 144 150 3663100 3663100 (
  .next 150 156 3404030 3404030 (
  .next 156 160 3404030 3404030 (
  .next 160 165 3404030 3404414 (
  .next 165 168 3404414 3404414 (
  .next 168 180 3404414 3799678 (
  .next 180 192 1965951 10272559 (
  .next 192 195 10362671 10362671 (
  .next 195 200 10362671 10362671 (
  .next 200 204 10362671 10362767 (
  .next 204 210 10362767 10362767 (
  .next 210 216 10362767 10440583 (
  .next 216 220 9949063 9949063 (
  .next 220 225 9949063 9949063 (
  .next 225 228 9693127 9693127 (
  .next 228 240 9693127 9693127 (
  .next 240 252 9172983 13234675 (
  .next 252 255 13234675 13431283 (
  .next 255 260 13431283 13431283 (
  .next 260 264 13431283 13433075 (
  .next 264 270 13433075 13531379 (
  .next 270 276 13516025 13516025 (
  .next 276 280 13516025 13516025 (
  .next 280 285 13516025 13573753 (
  .next 285 288 13573753 13573753 (
  .next 288 300 13082233 13082233 (
  .next 300 312 13082233 14929724 (
  .next 312 315 14929724 15322940 (
  .next 315 320 15322940 15329084 (
  .next 320 324 15329084 15329180 (
  .next 324 330 15329180 15525788 (
  .next 330 336 15525788 15528862 (
  .next 336 340 15528862 15627166 (
  .next 340 345 15627166 15627166 (
  .next 345 348 15627166 15627166 (
  .next 348 360 15627166 15627166 (
  .single 360 13082233))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

private theorem cover61Odd_checked :
    cover61Odd.check actions61 1 masks61Odd = true := by
  decide +kernel

private theorem cover61Odd_lower : cover61Odd.lower = 0 := rfl
private theorem cover61Odd_upper : cover61Odd.upper = 360 := rfl

private def masks61Even : List ℕ := [6740845, 7026395, 7035757, 7040429, 7040438, 7189942, 7190221, 11974061, 11974358, 11983574, 12268973, 12278189, 12278486, 7040731, 7040877, 7190235, 7190381, 7199597, 7204278, 11974075, 12278491, 14071670, 14080443, 14085837, 14085846, 14366582, 14539190, 14539469, 3127286, 11974523, 12278651, 14085563, 14086006, 14530422, 14539195, 14539638, 14544589, 10476525, 11988859, 12283771, 5238779, 12447611]

private def cover61Even : PhaseCover :=
  .next 0 12 12447611 12447611 (
  .next 12 15 11988859 11988859 (
  .next 15 20 11974523 11974523 (
  .next 20 24 11974075 11974075 (
  .next 24 30 11974075 11974075 (
  .next 30 36 11974061 11974061 (
  .next 36 40 11974061 12268973 (
  .next 40 45 12268973 12268973 (
  .next 45 48 12268973 12278189 (
  .next 48 60 12278189 12278189 (
  .next 60 72 10476525 14539469 (
  .next 72 75 14539469 14539469 (
  .next 75 80 14539469 14544589 (
  .next 80 84 14544589 14544589 (
  .next 84 90 14085837 14085837 (
  .next 90 96 14085837 14085846 (
  .next 96 100 14085846 14085846 (
  .next 100 105 14085846 14086006 (
  .next 105 108 14071670 14071670 (
  .next 108 120 14071670 14366582 (
  .next 120 132 14366582 14366582 (
  .next 132 135 14071670 14530422 (
  .next 135 140 14530422 14539638 (
  .next 140 144 14539190 14539190 (
  .next 144 150 14539190 14539190 (
  .next 150 156 14539190 14539195 (
  .next 156 160 14080443 14080443 (
  .next 160 165 14080443 14080443 (
  .next 165 168 14080443 14085563 (
  .next 168 180 14085563 14085563 (
  .next 180 192 5238779 7040731 (
  .next 192 195 7040731 7040731 (
  .next 195 200 7026395 7026395 (
  .next 200 204 7026395 7026395 (
  .next 204 210 7026395 7190235 (
  .next 210 216 7190221 7190221 (
  .next 216 220 7190221 7190221 (
  .next 220 225 7190221 7190381 (
  .next 225 228 7190381 7199597 (
  .next 228 240 6740845 6740845 (
  .next 240 252 6740845 6740845 (
  .next 252 255 6740845 7035757 (
  .next 255 260 7035757 7040877 (
  .next 260 264 7040429 7040429 (
  .next 264 270 7040429 7040429 (
  .next 270 276 7040429 7040438 (
  .next 276 280 7040438 7204278 (
  .next 280 285 7204278 7204278 (
  .next 285 288 7189942 7189942 (
  .next 288 300 7189942 7189942 (
  .next 300 312 3127286 11974358 (
  .next 312 315 11974358 11974358 (
  .next 315 320 11974358 11983574 (
  .next 320 324 11983574 11983574 (
  .next 324 330 11983574 12278486 (
  .next 330 336 12278486 12278491 (
  .next 336 340 12278491 12278491 (
  .next 340 345 12278491 12278651 (
  .next 345 348 12278651 12283771 (
  .next 348 360 11988859 12447611 (
  .single 360 12447611))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

private theorem cover61Even_checked :
    cover61Even.check actions61 2 masks61Even = true := by
  decide +kernel

private theorem cover61Even_lower : cover61Even.lower = 0 := rfl
private theorem cover61Even_upper : cover61Even.upper = 360 := rfl

private def masks64 : List ℕ := [7806, 7998, 8139, 15486, 15677, 15771, 15819, 20213, 20286, 20427, 20451, 26237, 26357, 26526, 26595, 29309, 29598, 29646, 30845, 31037, 31131, 31182, 8167, 15847, 29431, 30967]

private def cover64 : PhaseCover :=
  .next 60 72 31131 31131 (
  .next 72 75 15771 15771 (
  .next 75 80 15771 15771 (
  .next 80 84 15771 15819 (
  .next 84 90 8139 8139 (
  .next 90 96 8139 8139 (
  .next 96 100 8139 20427 (
  .next 100 105 20427 20451 (
  .next 105 108 20451 20451 (
  .next 108 120 20451 26595 (
  .next 120 132 26595 29431 (
  .next 132 135 29431 30967 (
  .next 135 140 30967 30967 (
  .next 140 144 30845 30845 (
  .next 144 150 15486 15486 (
  .next 150 156 15486 15486 (
  .next 156 160 7806 7806 (
  .next 160 165 7806 7998 (
  .next 165 168 7998 7998 (
  .next 168 180 7998 20286 (
  .next 180 192 20286 26526 (
  .next 192 195 26526 29598 (
  .next 195 200 29598 29598 (
  .next 200 204 29598 29646 (
  .next 204 210 29646 31182 (
  .next 210 216 31182 31182 (
  .next 216 220 15819 15819 (
  .next 220 225 15819 15847 (
  .next 225 228 15847 15847 (
  .next 228 240 8167 8167 (
  .next 240 252 20213 20213 (
  .next 252 255 20213 26357 (
  .next 255 260 26357 26357 (
  .next 260 264 26237 26237 (
  .next 264 270 26237 29309 (
  .next 270 276 29309 29309 (
  .next 276 280 29309 30845 (
  .next 280 285 30845 31037 (
  .next 285 288 31037 31037 (
  .next 288 300 15677 15677 (
  .single 300 15677))))))))))))))))))))))))))))))))))))))))

private theorem cover64_checked :
    cover64.check actions64 1 masks64 = true := by
  decide +kernel

private theorem cover64_lower : cover64.lower = 60 := rfl
private theorem cover64_upper : cover64.upper = 300 := rfl

private theorem triples51_checked :
    phaseTripleCheck masks51 masks51 masks51 = true := by
  decide +kernel

private theorem triples61_checked :
    phaseTripleCheck masks61Even masks61Odd masks61Odd = true := by
  decide +kernel

private theorem triples64_checked :
    phaseTripleCheck masks64 masks64 masks64 = true := by
  decide +kernel
-- END GENERATED RENAULT PHASE DATA

theorem phase_lemma_5_1 (x : Fin 3 → ℝ) :
    (∃ a b : ℕ, 2 ≤ a ∧ a ≤ 5 ∧ 1 ≤ b ∧ b ≤ 5 ∧
      ∀ i, (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (b : ℝ) / 6)) ∨
    (∃ b : ℕ, (b = 1 ∨ b = 2 ∨ b = 4) ∧
      ∀ i, (1 / 6 : ℝ) < distance (x i + (b : ℝ) / 6)) := by
  obtain ⟨a, ha⟩ := phase_three_covers actions51 (fun _ => 1)
    (fun _ => cover51) (fun _ => masks51) x (fun _ => cover51_checked)
    triples51_checked
    (by intro i; rw [cover51_lower, Nat.cast_zero]; positivity)
    (by
      intro i
      rw [cover51_upper]
      norm_num only [Nat.cast_ofNat]
      nlinarith [Int.fract_lt_one (x i)])
  by_cases h : a < 20
  · refine Or.inl ⟨a / 5 + 2, a % 5 + 1, by omega, by omega, by omega, by omega, ?_⟩
    intro i
    simpa [actions51, h, PhaseAction.Good] using ha i
  · let b := if a = 20 then 1 else if a = 21 then 2 else 4
    refine Or.inr ⟨b, ?_, ?_⟩
    · dsimp [b]
      split_ifs <;> omega
    · intro i
      simpa [actions51, h, PhaseAction.Good, b] using ha i

private theorem signed_affine_distance (e : ℤ) (he : e = 1 ∨ e = -1)
    (a x y : ℝ) : distance (a * ((e : ℝ) * x) + y) = distance (a * x + (e : ℝ) * y) := by
  rcases he with rfl | rfl
  · simp
  · calc
      distance (a * (((-1 : ℤ) : ℝ) * x) + y) =
          distance (-(a * x + ((-1 : ℤ) : ℝ) * y)) := by
        congr 1
        push_cast
        ring
      _ = distance (a * x + ((-1 : ℤ) : ℝ) * y) := CriticalFamilies.distance_neg _

private theorem complement_phase (a b : ℕ) (hb : b ≤ 6) (e : ℤ) (x : ℝ) :
    distance ((a : ℝ) * (-x) + (e : ℝ) * (b : ℝ) / 6) =
      distance ((a : ℝ) * x + (e : ℝ) * ((6 - b : ℕ) : ℝ) / 6) := by
  have hbR : ((6 - b : ℕ) : ℝ) = 6 - (b : ℝ) := by
    rw [Nat.cast_sub hb]
    norm_num
  rw [hbR]
  symm
  calc
    distance ((a : ℝ) * x + (e : ℝ) * (6 - (b : ℝ)) / 6) =
        distance ((e : ℝ) - ((a : ℝ) * (-x) + (e : ℝ) * (b : ℝ) / 6)) := by
      congr 1
      ring
    _ = distance ((a : ℝ) * (-x) + (e : ℝ) * (b : ℝ) / 6) := distance_int_sub e _

theorem phase_lemma_5_2 (x : Fin 3 → ℝ) (e : Fin 3 → ℤ)
    (he : ∀ i, e i = 1 ∨ e i = -1) :
    (∃ a b : ℕ, 2 ≤ a ∧ a ≤ 5 ∧ 1 ≤ b ∧ b ≤ 5 ∧
      ∀ i, (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6)) ∨
    (∃ b : ℕ, (b = 1 ∨ b = 2 ∨ b = 4) ∧
      ∀ i, (1 / 6 : ℝ) < distance (x i + (e i : ℝ) * (b : ℝ) / 6)) := by
  rcases phase_lemma_5_1 (fun i => (e i : ℝ) * x i) with h | h
  · obtain ⟨a, b, hal, hau, hbl, hbu, hab⟩ := h
    refine Or.inl ⟨a, b, hal, hau, hbl, hbu, ?_⟩
    intro i
    have hd := signed_affine_distance (e i) (he i) (a : ℝ) (x i) ((b : ℝ) / 6)
    have h := hab i
    rw [hd] at h
    simpa only [mul_div_assoc] using h
  · obtain ⟨b, hb, hgood⟩ := h
    refine Or.inr ⟨b, hb, ?_⟩
    intro i
    have hd := signed_affine_distance (e i) (he i) 1 (x i) ((b : ℝ) / 6)
    simp only [one_mul] at hd
    have h := hgood i
    rw [hd] at h
    simpa only [mul_div_assoc] using h

theorem phase_lemma_5_3 (x : Fin 3 → ℝ) (e : Fin 3 → ℤ)
    (he : ∀ i, e i = 1 ∨ e i = -1) :
    (∃ a b : ℕ, 2 ≤ a ∧ a ≤ 5 ∧ 1 ≤ b ∧ b ≤ 5 ∧
      ∀ i, (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6)) ∨
    (∃ b : ℕ, (b = 2 ∨ b = 4 ∨ b = 5) ∧
      ∀ i, (1 / 6 : ℝ) < distance (x i + (e i : ℝ) * (b : ℝ) / 6)) := by
  rcases phase_lemma_5_2 (fun i => -x i) e he with h | h
  · obtain ⟨a, b, hal, hau, hbl, hbu, hab⟩ := h
    refine Or.inl ⟨a, 6 - b, hal, hau, by omega, by omega, ?_⟩
    intro i
    rw [← complement_phase a b (by omega) (e i) (x i)]
    exact hab i
  · obtain ⟨b, hb, hgood⟩ := h
    refine Or.inr ⟨6 - b, by omega, ?_⟩
    intro i
    have hd := complement_phase 1 b (by omega) (e i) (x i)
    simp only [Nat.cast_one, one_mul] at hd
    rw [← hd]
    exact hgood i

theorem phase_lemma_6_1 (x : Fin 3 → ℝ) :
    (∃ a b : ℕ, 2 ≤ a ∧ a ≤ 5 ∧ 1 ≤ b ∧ b ≤ 5 ∧
      ∀ i, (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i +
        (if i = 0 then (2 : ℝ) else 1) * (b : ℝ) / 6)) ∨
    (∃ b : ℕ, (b = 1 ∨ b = 2 ∨ b = 3 ∨ b = 4) ∧
      ∀ i, (1 / 6 : ℝ) < distance (x i +
        (if i = 0 then (2 : ℝ) else 1) * (b : ℝ) / 6)) := by
  let coefficients : Fin 3 → ℕ := fun i => if i = 0 then 2 else 1
  let covers : Fin 3 → PhaseCover := fun i => if i = 0 then cover61Even else cover61Odd
  let masks : Fin 3 → List ℕ := fun i => if i = 0 then masks61Even else masks61Odd
  have hcover : ∀ i, (covers i).check actions61 (coefficients i) (masks i) = true := by
    intro i
    by_cases hi : i = 0
    · simpa [covers, coefficients, masks, hi] using cover61Even_checked
    · simpa [covers, coefficients, masks, hi] using cover61Odd_checked
  obtain ⟨a, ha⟩ := phase_three_covers actions61 coefficients covers masks x hcover
    triples61_checked
    (by
      intro i
      by_cases hi : i = 0
      · simp only [covers, ite_eq_left hi, cover61Even_lower, Nat.cast_zero]
        positivity
      · simp only [covers, ite_eq_right hi, cover61Odd_lower, Nat.cast_zero]
        positivity)
    (by
      intro i
      have h1 := Int.fract_lt_one (x i)
      by_cases hi : i = 0
      · simp only [covers, ite_eq_left hi, cover61Even_upper]
        norm_num only [Nat.cast_ofNat]
        nlinarith
      · simp only [covers, ite_eq_right hi, cover61Odd_upper]
        norm_num only [Nat.cast_ofNat]
        nlinarith)
  by_cases h : a < 20
  · refine Or.inl ⟨a / 5 + 2, a % 5 + 1, by omega, by omega, by omega, by omega, ?_⟩
    intro i
    by_cases hi : i = 0 <;> simpa [actions61, h, PhaseAction.Good, coefficients, hi] using ha i
  · let b := if a = 20 then 1 else if a = 21 then 2 else if a = 22 then 3 else 4
    refine Or.inr ⟨b, ?_, ?_⟩
    · dsimp [b]
      split_ifs <;> omega
    · intro i
      by_cases hi : i = 0 <;> simpa [actions61, h, PhaseAction.Good, coefficients, hi, b] using ha i

theorem phase_lemma_6_2 (x : Fin 3 → ℝ) (e : Fin 3 → ℤ)
    (heven : e 0 = 2 ∨ e 0 = -2)
    (hodd : ∀ i, i ≠ 0 → e i = 1 ∨ e i = -1) :
    (∃ a b : ℕ, 2 ≤ a ∧ a ≤ 5 ∧ 1 ≤ b ∧ b ≤ 5 ∧
      ∀ i, (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6)) ∨
    (∃ b : ℕ, (b = 1 ∨ b = 2 ∨ b = 3 ∨ b = 4) ∧
      ∀ i, (1 / 6 : ℝ) < distance (x i + (e i : ℝ) * (b : ℝ) / 6)) := by
  let signs : Fin 3 → ℤ := fun i => if i = 0 then e i / 2 else e i
  have hsigns (i : Fin 3) : signs i = 1 ∨ signs i = -1 := by
    by_cases hi : i = 0
    · subst i
      rcases heven with h | h <;> norm_num [signs, h]
    · simpa [signs, hi] using hodd i hi
  have he (i : Fin 3) :
      (signs i : ℝ) * (if i = 0 then (2 : ℝ) else 1) = (e i : ℝ) := by
    by_cases hi : i = 0
    · subst i
      rcases heven with h | h <;> norm_num [signs, h]
    · simp [signs, hi]
  have hphase (a b : ℕ) (i : Fin 3) :
      distance ((a : ℝ) * ((signs i : ℝ) * x i) +
        (if i = 0 then (2 : ℝ) else 1) * (b : ℝ) / 6) =
      distance ((a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6) := by
    rw [signed_affine_distance (signs i) (hsigns i)]
    congr 1
    calc
      (a : ℝ) * x i + (signs i : ℝ) * ((if i = 0 then (2 : ℝ) else 1) * (b : ℝ) / 6) =
          (a : ℝ) * x i + ((signs i : ℝ) * (if i = 0 then (2 : ℝ) else 1)) * (b : ℝ) / 6 := by ring
      _ = (a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6 := by rw [he]
  rcases phase_lemma_6_1 (fun i => (signs i : ℝ) * x i) with h | h
  · obtain ⟨a, b, hal, hau, hbl, hbu, hab⟩ := h
    refine Or.inl ⟨a, b, hal, hau, hbl, hbu, ?_⟩
    intro i
    rw [← hphase a b i]
    exact hab i
  · obtain ⟨b, hb, hgood⟩ := h
    refine Or.inr ⟨b, hb, ?_⟩
    intro i
    have hd := hphase 1 b i
    simp only [Nat.cast_one, one_mul] at hd
    rw [← hd]
    exact hgood i

theorem phase_lemma_6_3 (x : Fin 3 → ℝ) (e : Fin 3 → ℤ)
    (heven : e 0 = 2 ∨ e 0 = -2)
    (hodd : ∀ i, i ≠ 0 → e i = 1 ∨ e i = -1) :
    (∃ a b : ℕ, 2 ≤ a ∧ a ≤ 5 ∧ 1 ≤ b ∧ b ≤ 5 ∧
      ∀ i, (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6)) ∨
    (∃ b : ℕ, (b = 2 ∨ b = 3 ∨ b = 4 ∨ b = 5) ∧
      ∀ i, (1 / 6 : ℝ) < distance (x i + (e i : ℝ) * (b : ℝ) / 6)) := by
  rcases phase_lemma_6_2 (fun i => -x i) e heven hodd with h | h
  · obtain ⟨a, b, hal, hau, hbl, hbu, hab⟩ := h
    refine Or.inl ⟨a, 6 - b, hal, hau, by omega, by omega, ?_⟩
    intro i
    rw [← complement_phase a b (by omega) (e i) (x i)]
    exact hab i
  · obtain ⟨b, hb, hgood⟩ := h
    refine Or.inr ⟨6 - b, by omega, ?_⟩
    intro i
    have hd := complement_phase 1 b (by omega) (e i) (x i)
    simp only [Nat.cast_one, one_mul] at hd
    rw [← hd]
    exact hgood i

theorem phase_lemma_6_4 (x : Fin 3 → ℝ)
    (hx : ∀ i, (1 / 6 : ℝ) ≤ distance (x i)) :
    (∀ i, (1 / 6 : ℝ) < distance (2 * x i)) ∨
    (∃ b : ℕ, (b = 1 ∨ b = 5) ∧
      ∀ i, (1 / 6 : ℝ) < distance (x i + (b : ℝ) / 6)) ∨
    (∃ a b : ℕ, (a = 3 ∨ a = 5) ∧ b ≤ 5 ∧
      ∀ i, (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (b : ℝ) / 6)) := by
  have hfrac (i : Fin 3) : (1 / 6 : ℝ) ≤ Int.fract (x i) ∧ Int.fract (x i) ≤ 5 / 6 := by
    have h := hx i
    rw [distance_eq_min_fract, le_min_iff] at h
    exact ⟨h.1, by linarith [h.2]⟩
  obtain ⟨a, ha⟩ := phase_three_covers actions64 (fun _ => 1)
    (fun _ => cover64) (fun _ => masks64) x (fun _ => cover64_checked)
    triples64_checked
    (by intro i; rw [cover64_lower]; norm_num only [Nat.cast_ofNat]; linarith [(hfrac i).1])
    (by intro i; rw [cover64_upper]; norm_num only [Nat.cast_ofNat]; linarith [(hfrac i).2])
  by_cases hzero : a = 0
  · left
    intro i
    simpa [actions64, hzero, PhaseAction.Good] using ha i
  by_cases hsmall : a < 3
  · right; left
    let b := if a = 1 then 1 else 5
    refine ⟨b, ?_, ?_⟩
    · dsimp [b]
      split_ifs <;> omega
    · intro i
      simpa [actions64, hzero, hsmall, PhaseAction.Good, b] using ha i
  · right; right
    let n := if a < 9 then 3 else 5
    refine ⟨n, (a - 3) % 6, ?_, by omega, ?_⟩
    · dsimp [n]
      split_ifs <;> omega
    · intro i
      simpa [actions64, hzero, hsmall, PhaseAction.Good, n] using ha i

theorem phase_lemma_6_5 (x : Fin 3 → ℝ) (e : Fin 3 → ℤ)
    (he : ∀ i, e i = 1 ∨ e i = -1)
    (hx : ∀ i, (1 / 6 : ℝ) ≤ distance (x i)) :
    (∀ i, (1 / 6 : ℝ) < distance (2 * x i)) ∨
    (∃ b : ℕ, (b = 1 ∨ b = 5) ∧
      ∀ i, (1 / 6 : ℝ) < distance (x i + (e i : ℝ) * (b : ℝ) / 6)) ∨
    (∃ a b : ℕ, (a = 3 ∨ a = 5) ∧ b ≤ 5 ∧
      ∀ i, (1 / 6 : ℝ) ≤ distance ((a : ℝ) * x i + (e i : ℝ) * (b : ℝ) / 6)) := by
  have hsafe (i : Fin 3) : (1 / 6 : ℝ) ≤ distance ((e i : ℝ) * x i) := by
    have hd := signed_affine_distance (e i) (he i) 1 (x i) 0
    simp only [one_mul, add_zero, mul_zero] at hd
    rw [hd]
    exact hx i
  rcases phase_lemma_6_4 (fun i => (e i : ℝ) * x i) hsafe with h | h | h
  · left
    intro i
    have hd := signed_affine_distance (e i) (he i) 2 (x i) 0
    simp only [add_zero, mul_zero] at hd
    rw [← hd]
    exact h i
  · obtain ⟨b, hb, hgood⟩ := h
    right; left
    refine ⟨b, hb, ?_⟩
    intro i
    have hd := signed_affine_distance (e i) (he i) 1 (x i) ((b : ℝ) / 6)
    simp only [one_mul] at hd
    have h := hgood i
    rw [hd] at h
    simpa only [mul_div_assoc] using h
  · obtain ⟨a, b, ha, hb, hgood⟩ := h
    right; right
    refine ⟨a, b, ha, hb, ?_⟩
    intro i
    have hd := signed_affine_distance (e i) (he i) (a : ℝ) (x i) ((b : ℝ) / 6)
    have h := hgood i
    rw [hd] at h
    simpa only [mul_div_assoc] using h

end Loneliness.Renault
