import Conjectures.Loneliness
import Mathlib.Tactic.IntervalCases

/-!
# Shifted Lonely Runner certificates

A track is a positive integer speed paired with a shift numerator. The common
denominator is also used for the candidate radius. An arc is a track index and
an integer approached by that track. All cover comparisons are integer
inequalities, including when the first interval starts before zero.
-/

namespace ShiftedLonelyRunner

abbrev Track := ℕ × ℕ

structure Row where
  tracks : List Track
  scale : ℕ
  radius : ℕ
  time : ℚ

abbrev RealTrack := ℕ × ℝ

/-- The least distance to an integer at t. The empty-list value is immaterial
for the positive sizes in the theorem. -/
noncomputable def score (t : ℝ) : List RealTrack → ℝ
  | [] => 1 / 2
  | (v, s) :: rest => min (Loneliness.distance (s + v * t)) (score t rest)

noncomputable def realTracks (q : ℕ) (tracks : List Track) : List RealTrack :=
  tracks.map fun p => (p.1, (p.2 : ℝ) / q)

noncomputable def clearance (q : ℕ) (t : ℝ) (tracks : List Track) : ℝ :=
  score t (realTracks q tracks)

/-- Fixed-configuration maximum, with all real times allowed. -/
noncomputable def gamma (tracks : List RealTrack) : ℝ :=
  sSup (Set.range fun t : ℝ => score t tracks)

/-- Zhang's infimum over all speed lists of size n and all real starting positions. -/
noncomputable def Gamma (n : ℕ) : ℝ :=
  sInf {g | ∃ tracks : List RealTrack, tracks.length = n ∧
    (tracks.map Prod.fst).Nodup ∧ (∀ p ∈ tracks, 0 < p.1 ∧ p.2 ∈ Set.Ico 0 1) ∧
    g = gamma tracks}

private theorem score_bounds (t : ℝ) (tracks : List RealTrack) :
    0 ≤ score t tracks ∧ score t tracks ≤ 1 / 2 := by
  induction tracks with
  | nil => exact ⟨by norm_num [score], le_rfl⟩
  | cons p rest ih =>
    exact ⟨le_min (Loneliness.distance_nonneg _) ih.1, (min_le_right _ _).trans ih.2⟩

private theorem gamma_nonneg (tracks : List RealTrack) : 0 ≤ gamma tracks := by
  apply (score_bounds 0 tracks).1.trans
  apply le_csSup (s := Set.range fun t : ℝ => score t tracks) _ ⟨0, rfl⟩
  exact ⟨1 / 2, by rintro _ ⟨t, rfl⟩; exact (score_bounds t tracks).2⟩

private theorem clearance_le_track {q : ℕ} {t : ℝ} {tracks : List Track} {p : Track}
    (hp : p ∈ tracks) :
    clearance q t tracks ≤ Loneliness.distance ((p.2 : ℝ) / q + p.1 * t) := by
  induction tracks with
  | nil => simp at hp
  | cons a rest ih =>
    rcases List.mem_cons.mp hp with rfl | hm
    · exact min_le_left _ _
    · exact (min_le_right _ _).trans (ih hm)

private theorem le_clearance {q : ℕ} {t r : ℝ} (hh : r ≤ 1 / 2) {tracks : List Track}
    (h : ∀ p ∈ tracks, r ≤ Loneliness.distance ((p.2 : ℝ) / q + p.1 * t)) :
    r ≤ clearance q t tracks := by
  induction tracks with
  | nil => exact hh
  | cons a rest ih =>
    exact le_min (h a (by simp)) (ih fun p hp => h p (by simp [hp]))

/-- The previous right endpoint in scaled time is the signed ratio left/den.
For arc (i,k) the two endpoints are (k*q-a-r)/v and (k*q-a+r)/v. -/
def cover (tracks : List Track) (q r : ℕ) (left : ℤ) (den : ℕ) :
    List (ℕ × ℕ) → Bool
  | [] => decide ((q : ℤ) * den ≤ left)
  | (i, k) :: tail =>
    match tracks[i]? with
    | none => false
    | some (v, a) =>
      let center := (k : ℤ) * q - a
      decide (0 < v ∧ (center - r) * den ≤ left * v) &&
        cover tracks q r (center + r) v tail

private theorem cover_sound {tracks : List Track} {q r : ℕ} {chain : List (ℕ × ℕ)}
    {left : ℤ} {den : ℕ} (hc : cover tracks q r left den chain = true)
    (hd : 0 < den) {u : ℝ} (hl : (left : ℝ) ≤ u * den) (hu : u < q) :
    ∃ p ∈ tracks, ∃ k : ℕ, |(p.2 : ℝ) + p.1 * u - k * (q : ℝ)| ≤ r := by
  induction chain generalizing left den with
  | nil =>
    have h := of_decide_eq_true hc
    have hq : (q : ℝ) * den ≤ left := by exact_mod_cast h
    exact False.elim ((not_lt_of_ge (hq.trans hl))
      (mul_lt_mul_of_pos_right hu (by exact_mod_cast hd)))
  | cons e tail ih =>
    obtain ⟨i, k⟩ := e
    cases hget : tracks[i]? with
    | none => simp [cover, hget] at hc
    | some p =>
      obtain ⟨v, a⟩ := p
      simp only [cover, hget, Bool.and_eq_true, decide_eq_true_eq] at hc
      obtain ⟨⟨hv, hstart⟩, htail⟩ := hc
      have hs : ((k : ℝ) * q - a - r) * den ≤ (left : ℝ) * v := by exact_mod_cast hstart
      have hd' : (0 : ℝ) < den := by exact_mod_cast hd
      have hv' : (0 : ℝ) < v := by exact_mod_cast hv
      by_cases hstop : (v : ℝ) * u ≤ (k : ℝ) * q - a + r
      · refine ⟨(v, a), List.mem_of_getElem? hget, k, abs_le.mpr ⟨?_, ?_⟩⟩
        · have hstart' : (k : ℝ) * q - a - r ≤ v * u := by
            apply le_of_mul_le_mul_right _ hd'
            calc
              _ ≤ (left : ℝ) * v := hs
              _ ≤ (u * den) * v := mul_le_mul_of_nonneg_right hl hv'.le
              _ = _ := by ring
          dsimp
          linarith
        · dsimp
          linarith
      · apply ih htail hv
        push_cast
        linarith

private theorem clearance_upper (w : Row) {chain : List (ℕ × ℕ)}
    (hq : 0 < w.scale) (hc : cover w.tracks w.scale w.radius 0 1 chain = true)
    (t : ℝ) : clearance w.scale t w.tracks ≤ (w.radius : ℝ) / w.scale := by
  have hq' : (0 : ℝ) < w.scale := by exact_mod_cast hq
  let u : ℝ := Int.fract t * w.scale
  have hu : u < w.scale := by
    simpa [u] using mul_lt_mul_of_pos_right (Int.fract_lt_one t) hq'
  have hz : (0 : ℝ) ≤ u * (1 : ℕ) := by
    simp [u, mul_nonneg (Int.fract_nonneg t) hq'.le]
  obtain ⟨p, hp, k, hk⟩ := cover_sound hc Nat.one_pos (by simpa using hz) hu
  refine (clearance_le_track hp).trans ((Loneliness.distance_le_int _
    ((k : ℤ) + (p.1 : ℤ) * ⌊t⌋)).trans ?_)
  rw [show (p.2 : ℝ) / w.scale + p.1 * t - (↑((k : ℤ) + (p.1 : ℤ) * ⌊t⌋) : ℝ) =
        ((p.2 : ℝ) + p.1 * u - k * (w.scale : ℝ)) / w.scale by
    simp only [u, Int.fract, Int.cast_add, Int.cast_mul, Int.cast_natCast]
    field_simp [ne_of_gt hq']
    ring]
  rw [abs_div, abs_of_pos hq']
  exact div_le_div_of_nonneg_right hk hq'.le

/-- Check the cell between two consecutive integers at the attaining time. -/
def lower (w : Row) (p : Track) : Bool :=
  let x : ℚ := (p.2 : ℚ) / w.scale + p.1 * w.time
  let d : ℚ := (w.radius : ℚ) / w.scale
  decide (d ≤ x - ⌊x⌋ ∧ x - ⌊x⌋ ≤ 1 - d)

def Row.check (w : Row) (n : ℕ) : Bool :=
  decide (w.tracks.length = n ∧ (w.tracks.map Prod.fst).Nodup ∧
    0 < w.scale ∧ 0 ≤ w.time ∧ w.time < 1 ∧ 2 * w.radius ≤ w.scale ∧ w.radius * (n + 1) < w.scale) &&
    w.tracks.all (fun p => decide (0 < p.1 ∧ p.2 < w.scale) && lower w p)

/-- The list supplies n distinct positive integer speeds with rational shifts in [0,1).
The recorded radius is the global maximum over all real times, attained at the
recorded rational time, and strictly below the conjectured bound. -/
structure Row.Verified (w : Row) (n : ℕ) : Prop where
  size : w.tracks.length = n
  distinct : (w.tracks.map Prod.fst).Nodup
  positiveScale : 0 < w.scale
  admissible : ∀ p ∈ w.tracks, 0 < p.1 ∧ (p.2 : ℚ) / w.scale ∈ Set.Ico 0 1
  maximum : IsGreatest (Set.range fun t : ℝ => clearance w.scale t w.tracks)
    ((w.radius : ℝ) / w.scale)
  timeInPeriod : w.time ∈ Set.Ico 0 1
  attains : clearance w.scale w.time w.tracks = (w.radius : ℝ) / w.scale
  strict : (w.radius : ℝ) / w.scale < 1 / ((n : ℝ) + 1)

theorem verified_of_checks {w : Row} {n : ℕ} {chain : List (ℕ × ℕ)}
    (h : w.check n = true) (hc : cover w.tracks w.scale w.radius 0 1 chain = true) :
    w.Verified n := by
  simp only [Row.check, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true] at h
  obtain ⟨⟨hsize, hdistinct, hq, ht0, ht1, hhalf, hstrict⟩, hrows⟩ := h
  have hq' : (0 : ℝ) < w.scale := by exact_mod_cast hq
  have hhalf' : (w.radius : ℝ) / w.scale ≤ 1 / 2 := by
    rw [div_le_div_iff₀ hq' (by norm_num)]
    have : (2 : ℝ) * w.radius ≤ w.scale := by exact_mod_cast hhalf
    linarith
  have upper := clearance_upper w hq hc
  have heq : clearance w.scale w.time w.tracks = (w.radius : ℝ) / w.scale := by
    apply le_antisymm (upper _) (le_clearance hhalf' ?_)
    intro p hp
    have hh := (hrows p hp).2
    let x : ℚ := (p.2 : ℚ) / w.scale + p.1 * w.time
    have hh' : (w.radius : ℚ) / w.scale ≤ x - ⌊x⌋ ∧
        x - ⌊x⌋ ≤ 1 - (w.radius : ℚ) / w.scale := of_decide_eq_true hh
    apply Loneliness.distance_lower_of_cell (k := ⌊x⌋)
    · simpa only [x, Rat.cast_div, Rat.cast_natCast, Rat.cast_intCast, Rat.cast_add,
        Rat.cast_mul, Rat.cast_sub, Rat.cast_one] using (Rat.cast_le (K := ℝ)).2 hh'.1
    · simpa only [x, Rat.cast_div, Rat.cast_natCast, Rat.cast_intCast, Rat.cast_add,
        Rat.cast_mul, Rat.cast_sub, Rat.cast_one] using (Rat.cast_le (K := ℝ)).2 hh'.2
  refine ⟨hsize, hdistinct, hq, ?_, ⟨⟨w.time, heq⟩, ?_⟩, ⟨ht0, ht1⟩, heq, ?_⟩
  · intro p hp
    obtain ⟨⟨hv, ha⟩, _⟩ := hrows p hp
    refine ⟨hv, div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _), ?_⟩
    rw [div_lt_one (by exact_mod_cast hq)]
    exact_mod_cast ha
  · rintro _ ⟨t, rfl⟩
    exact upper t
  · rw [div_lt_div_iff₀ hq' (by positivity), one_mul]
    exact_mod_cast hstrict

theorem Row.Verified.gamma_eq {w : Row} {n : ℕ} (h : w.Verified n) :
    gamma (realTracks w.scale w.tracks) = (w.radius : ℝ) / w.scale :=
  h.maximum.csSup_eq

theorem Row.Verified.Gamma_lt {w : Row} {n : ℕ} (h : w.Verified n) :
    Gamma n < 1 / ((n : ℝ) + 1) := by
  apply lt_of_le_of_lt _ h.strict
  apply csInf_le
  · refine ⟨0, ?_⟩
    rintro _ ⟨tracks, _, _, _, rfl⟩
    exact gamma_nonneg tracks
  · refine ⟨realTracks w.scale w.tracks, ?_, ?_, ?_, h.gamma_eq.symm⟩
    · simpa [realTracks] using h.size
    · simpa [realTracks, List.map_map, Function.comp_def] using h.distinct
    · intro p hp
      obtain ⟨a, ha, rfl⟩ := List.mem_map.mp hp
      obtain ⟨hv, _, hhi⟩ := h.admissible a ha
      refine ⟨hv, div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _), ?_⟩
      simpa only [Rat.cast_one, Rat.cast_div, Rat.cast_natCast] using
        (Rat.cast_lt (K := ℝ)).2 hhi

end ShiftedLonelyRunner
