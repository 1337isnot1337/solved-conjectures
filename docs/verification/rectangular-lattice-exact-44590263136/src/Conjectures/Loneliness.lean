import Mathlib.Algebra.Order.Round
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import Mathlib.Data.Rat.Cast.Order
import Mathlib.Order.ConditionallyCompleteLattice.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FieldSimp

/-!
# Exact real-time loneliness certificates

The distance is the distance to the nearest integer. `clearance` takes the
minimum over a finite speed list; its value on an empty list is one half.
`value` is the supremum over the real unit interval.

The upper certificate consists of rational intervals, each with a speed and
an integer that is close throughout the interval. A checked overlapping
chain covers every real time in the unit interval. The lower certificate is
one rational time, with exact bounds between consecutive integers. Thus a
certificate proves the actual real-time maximum, not a sampled maximum.
-/

namespace Loneliness

noncomputable section

def distance (x : ℝ) : ℝ := |x - (round x : ℝ)|

def clearance : List ℕ → ℝ → ℝ
  | [], _ => 1 / 2
  | d :: ds, t => min (distance (d * t)) (clearance ds t)

def value (ds : List ℕ) : ℝ :=
  sSup (clearance ds '' Set.Icc (0 : ℝ) 1)

theorem distance_nonneg (x : ℝ) : 0 ≤ distance x := abs_nonneg _

theorem distance_le_half (x : ℝ) : distance x ≤ 1 / 2 := abs_sub_round x

theorem distance_le_int (x : ℝ) (k : ℤ) : distance x ≤ |x - k| := round_le x k

theorem clearance_nonneg (ds : List ℕ) (t : ℝ) : 0 ≤ clearance ds t := by
  induction ds with
  | nil => norm_num [clearance]
  | cons d ds ih => exact le_min (distance_nonneg _) ih

theorem clearance_le_half (ds : List ℕ) (t : ℝ) : clearance ds t ≤ 1 / 2 := by
  cases ds with
  | nil => exact le_rfl
  | cons d ds => exact (min_le_left _ _).trans (distance_le_half _)

theorem clearance_le_of_mem {ds : List ℕ} {d : ℕ} (hd : d ∈ ds) (t : ℝ) :
    clearance ds t ≤ distance (d * t) := by
  induction ds with
  | nil => simp at hd
  | cons e es ih =>
    rcases List.mem_cons.mp hd with rfl | h
    · exact min_le_left _ _
    · exact (min_le_right _ _).trans (ih h)

theorem le_clearance {ds : List ℕ} {t r : ℝ} (hr : r ≤ 1 / 2)
    (h : ∀ d ∈ ds, r ≤ distance (d * t)) : r ≤ clearance ds t := by
  induction ds with
  | nil => exact hr
  | cons d ds ih =>
    exact le_min (h d (by simp)) (ih (fun e he => h e (by simp [he])))

theorem image_nonempty (ds : List ℕ) :
    (clearance ds '' Set.Icc (0 : ℝ) 1).Nonempty := by
  exact ⟨clearance ds 0, 0, by norm_num, rfl⟩

theorem image_bddAbove (ds : List ℕ) :
    BddAbove (clearance ds '' Set.Icc (0 : ℝ) 1) := by
  refine ⟨1 / 2, ?_⟩
  rintro y ⟨t, _, rfl⟩
  exact clearance_le_half ds t

theorem value_le {ds : List ℕ} {r : ℝ}
    (h : ∀ t ∈ Set.Icc (0 : ℝ) 1, clearance ds t ≤ r) : value ds ≤ r := by
  apply csSup_le (image_nonempty ds)
  rintro y ⟨t, ht, rfl⟩
  exact h t ht

theorem le_value {ds : List ℕ} {t : ℝ} (ht : t ∈ Set.Icc (0 : ℝ) 1) :
    clearance ds t ≤ value ds :=
  le_csSup (image_bddAbove ds) ⟨t, ht, rfl⟩

theorem distance_lower_of_cell {x r : ℝ} {k : ℤ}
    (hl : r ≤ x - k) (hu : x - k ≤ 1 - r) : r ≤ distance x := by
  rcases le_or_gt (round x) k with hk | hk
  · have hk' : (round x : ℝ) ≤ k := by exact_mod_cast hk
    exact le_trans (by linarith : r ≤ x - round x) (le_abs_self _)
  · have hki : k + 1 ≤ round x := by omega
    have hk' : (k : ℝ) + 1 ≤ round x := by exact_mod_cast hki
    exact le_trans (by linarith : r ≤ -(x - round x)) (neg_le_abs _)

end

structure Segment where
  left : ℚ
  right : ℚ
  speed : ℕ
  shift : ℤ
  deriving DecidableEq, Repr

def Segment.Valid (ds : List ℕ) (r : ℚ) (c : Segment) : Prop :=
  c.speed ∈ ds ∧
    -r ≤ (c.speed : ℚ) * c.left - c.shift ∧
    (c.speed : ℚ) * c.right - c.shift ≤ r

instance (ds : List ℕ) (r : ℚ) (c : Segment) : Decidable (c.Valid ds r) :=
  inferInstanceAs (Decidable (_ ∧ _ ∧ _))

def coversFrom : ℚ → List Segment → Prop
  | x, [] => 1 ≤ x
  | x, c :: cs => c.left ≤ x ∧ x ≤ c.right ∧ coversFrom c.right cs

instance (x : ℚ) (cs : List Segment) : Decidable (coversFrom x cs) := by
  induction cs generalizing x with
  | nil => exact inferInstanceAs (Decidable (1 ≤ x))
  | cons c cs ih =>
    unfold coversFrom
    exact @instDecidableAnd _ _ inferInstance (@instDecidableAnd _ _ inferInstance (ih _))

def LowerCertificate : List ℕ → ℚ → ℚ → List ℤ → Prop
  | [], _, _, [] => True
  | d :: ds, r, t, k :: ks =>
    r ≤ (d : ℚ) * t - k ∧ (d : ℚ) * t - k ≤ 1 - r ∧ LowerCertificate ds r t ks
  | _, _, _, _ => False

instance (ds : List ℕ) (r t : ℚ) (ks : List ℤ) :
    Decidable (LowerCertificate ds r t ks) := by
  induction ds generalizing ks with
  | nil => cases ks <;> simp only [LowerCertificate] <;> infer_instance
  | cons d ds ih =>
    cases ks with
    | nil => exact isFalse id
    | cons k ks =>
      unfold LowerCertificate
      exact @instDecidableAnd _ _ inferInstance (@instDecidableAnd _ _ inferInstance (ih ks))

theorem segment_upper {ds : List ℕ} {r : ℚ} {c : Segment}
    (hc : c.Valid ds r) {t : ℝ} (hl : (c.left : ℝ) ≤ t) (hu : t ≤ c.right) :
    clearance ds t ≤ (r : ℝ) := by
  rcases hc with ⟨hm, h₁, h₂⟩
  have h₁' : -(r : ℝ) ≤ (c.speed : ℝ) * c.left - c.shift := by exact_mod_cast h₁
  have h₂' : (c.speed : ℝ) * c.right - c.shift ≤ (r : ℝ) := by exact_mod_cast h₂
  have hs : (0 : ℝ) ≤ c.speed := Nat.cast_nonneg _
  have hx₁ := mul_le_mul_of_nonneg_left hl hs
  have hx₂ := mul_le_mul_of_nonneg_left hu hs
  apply (clearance_le_of_mem hm t).trans
  apply (distance_le_int _ c.shift).trans
  exact abs_le.mpr ⟨by linarith, by linarith⟩

theorem coversFrom_upper {ds : List ℕ} {r x : ℚ} {cs : List Segment}
    (hvalid : ∀ c ∈ cs, c.Valid ds r) (hcover : coversFrom x cs)
    {t : ℝ} (hl : (x : ℝ) < t) (hu : t ≤ 1) : clearance ds t ≤ (r : ℝ) := by
  induction cs generalizing x with
  | nil =>
    have hx : (1 : ℝ) ≤ x := by exact_mod_cast hcover
    linarith
  | cons c cs ih =>
    rcases hcover with ⟨hc₁, hc₂, htail⟩
    by_cases htc : t ≤ (c.right : ℝ)
    · have hc₁' : (c.left : ℝ) ≤ x := by exact_mod_cast hc₁
      exact segment_upper (hvalid c (by simp)) (hc₁'.trans hl.le) htc
    · exact ih (fun a ha => hvalid a (by simp [ha])) htail (lt_of_not_ge htc)

theorem cover_upper {ds : List ℕ} {r : ℚ} {cs : List Segment}
    (hvalid : ∀ c ∈ cs, c.Valid ds r) (hcover : coversFrom 0 cs)
    {t : ℝ} (ht : t ∈ Set.Icc (0 : ℝ) 1) : clearance ds t ≤ (r : ℝ) := by
  rcases eq_or_lt_of_le ht.1 with ht0 | ht0
  · cases cs with
    | nil => norm_num [coversFrom] at hcover
    | cons c cs =>
      rcases hcover with ⟨hl, hu, _⟩
      apply segment_upper (hvalid c (by simp))
      · rw [← ht0]
        exact_mod_cast hl
      · rw [← ht0]
        exact_mod_cast hu
  · exact coversFrom_upper hvalid hcover (by simpa using ht0) ht.2

theorem lowerCertificate_sound {ds : List ℕ} {r t : ℚ} {ks : List ℤ}
    (h : LowerCertificate ds r t ks) :
    ∀ d ∈ ds, (r : ℝ) ≤ distance (d * (t : ℝ)) := by
  induction ds generalizing ks with
  | nil => simp
  | cons d ds ih =>
    cases ks with
    | nil => exact False.elim h
    | cons k ks =>
      rcases h with ⟨hl, hu, htail⟩
      intro e he
      rcases List.mem_cons.mp he with rfl | he
      · apply distance_lower_of_cell (k := k)
        · exact_mod_cast hl
        · exact_mod_cast hu
      · exact ih htail e he

theorem certified_value {ds : List ℕ} {r t : ℚ} {cs : List Segment} {ks : List ℤ}
    (hvalid : ∀ c ∈ cs, c.Valid ds r) (hcover : coversFrom 0 cs)
    (hlower : LowerCertificate ds r t ks) (hr : r ≤ 1 / 2)
    (ht : 0 ≤ t ∧ t ≤ 1) : value ds = (r : ℝ) := by
  have ht' : (t : ℝ) ∈ Set.Icc (0 : ℝ) 1 := by
    constructor
    · exact_mod_cast ht.1
    · exact_mod_cast ht.2
  have hr' : (r : ℝ) ≤ 1 / 2 := by
    have h := (Rat.cast_le (K := ℝ)).mpr hr
    norm_num at h ⊢
    exact h
  apply le_antisymm
  · exact value_le (fun u hu => cover_upper hvalid hcover hu)
  · exact (le_clearance hr' (lowerCertificate_sound hlower)).trans
      (le_value ht')

theorem certified_maximum {ds : List ℕ} {r t : ℚ} {cs : List Segment} {ks : List ℤ}
    (hvalid : ∀ c ∈ cs, c.Valid ds r) (hcover : coversFrom 0 cs)
    (hlower : LowerCertificate ds r t ks) (hr : r ≤ 1 / 2)
    (ht : 0 ≤ t ∧ t ≤ 1) :
    clearance ds (t : ℝ) = (r : ℝ) ∧
      ∀ u ∈ Set.Icc (0 : ℝ) 1, clearance ds u ≤ clearance ds (t : ℝ) := by
  have ht' : (t : ℝ) ∈ Set.Icc (0 : ℝ) 1 := by
    constructor
    · exact_mod_cast ht.1
    · exact_mod_cast ht.2
  have hr' : (r : ℝ) ≤ 1 / 2 := by
    have h := (Rat.cast_le (K := ℝ)).mpr hr
    norm_num at h ⊢
    exact h
  have heq : clearance ds (t : ℝ) = (r : ℝ) := le_antisymm
    (cover_upper hvalid hcover ht')
    (le_clearance hr' (lowerCertificate_sound hlower))
  refine ⟨heq, fun u hu => ?_⟩
  rw [heq]
  exact cover_upper hvalid hcover hu

end Loneliness
