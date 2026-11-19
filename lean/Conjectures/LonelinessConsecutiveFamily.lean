import Conjectures.LonelinessFiveFamily
import Mathlib.Data.List.Range

/-! Symbolic interval certificates for the infinite consecutive-speed families.

The parameter `s` is never enumerated. A certificate covers the half period
simultaneously for every `r` between `1/(n+1)` and `1/n`; its high-speed
intervals are valid whenever `(n*s+1)*r=s`. The certificate data are checked
by ordinary kernel reduction, and the conclusion concerns every real time.
-/

namespace Loneliness.ConsecutiveFamily

def speeds (n s : ℕ) : List ℕ := List.range' 1 (n - 1) ++ [n * s]

theorem mem_speeds {n s d : ℕ} (hn : 1 ≤ n) :
    d ∈ speeds n s ↔ (1 ≤ d ∧ d < n) ∨ d = n * s := by
  simp only [speeds, List.mem_append, List.mem_range'_1, List.mem_singleton]
  omega

abbrev Affine := ℚ × ℚ

def eval (a : Affine) (r : ℝ) : ℝ := a.1 + a.2 * r

def evalQ (a : Affine) (r : ℚ) : ℚ := a.1 + a.2 * r

def Ordered (n : ℕ) (a b : Affine) : Prop :=
  evalQ a (1 / (n + 1)) ≤ evalQ b (1 / (n + 1)) ∧
    evalQ a (1 / n) ≤ evalQ b (1 / n)

instance (n : ℕ) (a b : Affine) : Decidable (Ordered n a b) :=
  inferInstanceAs (Decidable (_ ∧ _))

theorem affine_le_between (a b c d lo hi r : ℝ)
    (hl : lo ≤ r) (hu : r ≤ hi)
    (hlo : a + b * lo ≤ c + d * lo)
    (hhi : a + b * hi ≤ c + d * hi) :
    a + b * r ≤ c + d * r := by
  by_cases h : 0 ≤ b - d
  · have hp := mul_nonneg h (sub_nonneg.mpr hu)
    nlinarith
  · have hp := mul_nonneg (show 0 ≤ d - b by linarith) (sub_nonneg.mpr hl)
    nlinarith

theorem ordered_sound {n : ℕ} {a b : Affine} {r : ℝ}
    (h : Ordered n a b)
    (hl : 1 / ((n : ℝ) + 1) ≤ r) (hu : r ≤ 1 / (n : ℝ)) :
    eval a r ≤ eval b r := by
  have hlo : eval a (1 / ((n : ℝ) + 1)) ≤ eval b (1 / ((n : ℝ) + 1)) := by
    dsimp [eval]
    have h' := h.1
    dsimp [evalQ] at h'
    have hcast := (Rat.cast_le (K := ℝ)).mpr h'
    norm_num at hcast ⊢
    exact hcast
  have hhi : eval a (1 / (n : ℝ)) ≤ eval b (1 / (n : ℝ)) := by
    dsimp [eval]
    have h' := h.2
    dsimp [evalQ] at h'
    have hcast := (Rat.cast_le (K := ℝ)).mpr h'
    norm_num at hcast ⊢
    exact hcast
  exact affine_le_between _ _ _ _ _ _ _ hl hu hlo hhi

/-- The speed `n` labels the variable speed `n*s`; all smaller speeds are literal. -/
abbrev Interval := ℕ × ℕ

def left (n : ℕ) (c : Interval) : Affine :=
  if c.1 = n then (((c.2 : ℚ) - 1) / n, 1) else ((c.2 : ℚ) / c.1, -1 / c.1)

def right (n : ℕ) (c : Interval) : Affine :=
  if c.1 = n then (((c.2 : ℚ) + 1) / n, -1) else ((c.2 : ℚ) / c.1, 1 / c.1)

def Cover (n : ℕ) : Affine → List Interval → Prop
  | a, [] => Ordered n (1 / 2, 0) a
  | a, c :: cs =>
      0 < c.1 ∧ c.1 ≤ n ∧ Ordered n (left n c) a ∧ Cover n (right n c) cs

instance (n : ℕ) (a : Affine) (cs : List Interval) : Decidable (Cover n a cs) := by
  induction cs generalizing a with
  | nil => exact inferInstanceAs (Decidable (Ordered n (1 / 2, 0) a))
  | cons c cs ih =>
    unfold Cover
    exact @instDecidableAnd _ _ inferInstance
      (@instDecidableAnd _ _ inferInstance (@instDecidableAnd _ _ inferInstance (ih _)))

theorem interval_upper {n s : ℕ} (hn : 1 ≤ n) {c : Interval}
    (hc : 0 < c.1) (hcn : c.1 ≤ n) {r t : ℝ}
    (hr : ((n : ℝ) * s + 1) * r = s)
    (hl : eval (left n c) r ≤ t) (hu : t ≤ eval (right n c) r) :
    clearance (speeds n s) t ≤ r := by
  have hnp : (0 : ℝ) < n := by exact_mod_cast (show 0 < n by omega)
  have hdp : (0 : ℝ) < c.1 := by exact_mod_cast hc
  by_cases hdn : c.1 = n
  · have hm : n * s ∈ speeds n s := (mem_speeds hn).mpr (Or.inr rfl)
    have hleft : (n : ℝ) * s * eval (left n c) r = (c.2 : ℝ) * s - r := by
      simp [left, hdn, eval]
      field_simp
      nlinarith [hr]
    have hright : (n : ℝ) * s * eval (right n c) r = (c.2 : ℝ) * s + r := by
      simp [right, hdn, eval]
      field_simp
      nlinarith [hr]
    apply clearance_le_if_near hm (k := (c.2 : ℤ) * s)
    · have h := mul_le_mul_of_nonneg_left hl (show 0 ≤ (n : ℝ) * s by positivity)
      rw [hleft] at h
      simpa only [Nat.cast_mul, Int.cast_mul, Int.cast_natCast] using h
    · have h := mul_le_mul_of_nonneg_left hu (show 0 ≤ (n : ℝ) * s by positivity)
      rw [hright] at h
      simpa only [Nat.cast_mul, Int.cast_mul, Int.cast_natCast] using h
  · have hm : c.1 ∈ speeds n s :=
      (mem_speeds hn).mpr (Or.inl ⟨hc, lt_of_le_of_ne hcn hdn⟩)
    have hleft : (c.1 : ℝ) * eval (left n c) r = (c.2 : ℝ) - r := by
      simp [left, hdn, eval]
      field_simp
      ring
    have hright : (c.1 : ℝ) * eval (right n c) r = (c.2 : ℝ) + r := by
      simp [right, hdn, eval]
      field_simp
    apply clearance_le_if_near hm (k := (c.2 : ℤ))
    · have h := mul_le_mul_of_nonneg_left hl hdp.le
      rw [hleft] at h
      simpa only [Int.cast_natCast] using h
    · have h := mul_le_mul_of_nonneg_left hu hdp.le
      rw [hright] at h
      simpa only [Int.cast_natCast] using h

theorem cover_upper {n s : ℕ} (hn : 1 ≤ n) {cs : List Interval}
    {a : Affine} (hc : Cover n a cs) {r t : ℝ}
    (hr : ((n : ℝ) * s + 1) * r = s)
    (hlo : 1 / ((n : ℝ) + 1) ≤ r) (hhi : r ≤ 1 / (n : ℝ))
    (ht : eval a r < t) (htu : t ≤ 1 / 2) : clearance (speeds n s) t ≤ r := by
  induction cs generalizing a with
  | nil =>
    have h := ordered_sound hc hlo hhi
    norm_num [eval] at h
    dsimp [eval] at ht
    linarith
  | cons c cs ih =>
    rcases hc with ⟨hcpos, hcle, hcstart, hcrest⟩
    by_cases htc : t ≤ eval (right n c) r
    · exact interval_upper hn hcpos hcle hr
        ((ordered_sound hcstart hlo hhi).trans ht.le) htc
    · exact ih hcrest (lt_of_not_ge htc)

theorem parameter_bounds {n s : ℕ} (hn : 2 ≤ n) (hs : 1 ≤ s) :
    1 / ((n : ℝ) + 1) ≤ (s : ℝ) / ((n : ℝ) * s + 1) ∧
      (s : ℝ) / ((n : ℝ) * s + 1) ≤ 1 / (n : ℝ) := by
  have hn' : (2 : ℝ) ≤ n := by exact_mod_cast hn
  have hs' : (1 : ℝ) ≤ s := by exact_mod_cast hs
  have hnp : (0 : ℝ) < n := by linarith
  have hsp : (0 : ℝ) < n * s + 1 := by positivity
  constructor
  · apply (div_le_div_iff₀ (by positivity) hsp).mpr
    nlinarith
  · apply (div_le_div_iff₀ hsp hnp).mpr
    nlinarith

theorem family_lower (n s : ℕ) (hn : 2 ≤ n) (hs : 1 ≤ s) :
    (s : ℝ) / ((n : ℝ) * s + 1) ≤
      clearance (speeds n s) ((s : ℝ) / ((n : ℝ) * s + 1)) := by
  let r : ℝ := (s : ℝ) / ((n : ℝ) * s + 1)
  have hn' : (2 : ℝ) ≤ n := by exact_mod_cast hn
  have hs' : (1 : ℝ) ≤ s := by exact_mod_cast hs
  have hnp : (0 : ℝ) < n := by linarith
  have hden : (0 : ℝ) < n * s + 1 := by positivity
  have hr : ((n : ℝ) * s + 1) * r = s := by dsimp [r]; field_simp
  have hrn : 0 ≤ r := by dsimp [r]; positivity
  have hnr : (n : ℝ) * r ≤ 1 := by
    have hhi := (parameter_bounds hn hs).2
    simpa only [r, mul_comm] using (le_div_iff₀ hnp).mp hhi
  have hhalf : r ≤ 1 / 2 := by nlinarith
  apply le_clearance hhalf
  intro d hd
  rcases (mem_speeds (by omega : 1 ≤ n)).mp hd with hbase | rfl
  · have hd1 : (1 : ℝ) ≤ d := by exact_mod_cast hbase.1
    have hdn : (d : ℝ) + 1 ≤ n := by exact_mod_cast hbase.2
    apply distance_lower_of_cell (k := 0) <;> norm_num <;> nlinarith
  · apply distance_lower_of_cell (k := (s : ℤ) - 1) <;> push_cast <;> nlinarith

theorem value_of_cover (n s : ℕ) (hn : 2 ≤ n) (hs : 1 ≤ s)
    (cs : List Interval) (hc : Cover n (0, 0) cs) :
    value (speeds n s) = (s : ℝ) / ((n : ℝ) * s + 1) := by
  let r : ℝ := (s : ℝ) / ((n : ℝ) * s + 1)
  have hr : ((n : ℝ) * s + 1) * r = s := by
    dsimp [r]
    field_simp
  have hrn : 0 ≤ r := by dsimp [r]; positivity
  have hhalf : r ≤ 1 / 2 := by
    have hnr := (parameter_bounds hn hs).2
    have hn' : (2 : ℝ) ≤ n := by exact_mod_cast hn
    have hnp : (0 : ℝ) < n := by linarith
    have hnr' := (le_div_iff₀ hnp).mp hnr
    have hnr'' : (n : ℝ) * r ≤ 1 := by simpa only [r, mul_comm] using hnr'
    nlinarith
  have hupper {t : ℝ} (ht : 0 ≤ t) (htu : t ≤ 1 / 2) :
      clearance (speeds n s) t ≤ r := by
    rcases eq_or_lt_of_le ht with htz | htz
    · have hm : 1 ∈ speeds n s := (mem_speeds (by omega)).mpr (Or.inl ⟨by omega, hn⟩)
      apply (clearance_le_of_mem hm t).trans
      apply (distance_le_int _ 0).trans
      simp [← htz, hrn]
    · exact cover_upper (by omega) hc hr (parameter_bounds hn hs).1
        (parameter_bounds hn hs).2 (by simpa [eval] using htz) htu
  apply le_antisymm
  · apply value_le
    intro t ht
    by_cases hth : t ≤ 1 / 2
    · exact hupper ht.1 hth
    · rw [← clearance_reflection _ t]
      apply hupper <;> linarith [ht.1, ht.2]
  · exact (family_lower n s hn hs).trans (le_value ⟨hrn, by linarith⟩)

theorem distance_sub_int (x : ℝ) (k : ℤ) : distance (x - k) = distance x := by
  calc
    distance (x - k) = distance ((-k : ℤ) - (-x)) := by
      congr 1
      push_cast
      ring
    _ = distance (-x) := distance_int_sub (-k) (-x)
    _ = distance x := by simpa using distance_int_sub 0 x

theorem clearance_sub_int (ds : List ℕ) (t : ℝ) (k : ℤ) :
    clearance ds (t - k) = clearance ds t := by
  induction ds with
  | nil => rfl
  | cons d ds ih =>
    simp only [clearance, ih]
    congr 1
    have h : (d : ℝ) * (t - k) = (d : ℝ) * t - ((d : ℤ) * k : ℤ) := by
      push_cast
      ring
    rw [h, distance_sub_int]

theorem clearance_le_value (ds : List ℕ) (t : ℝ) : clearance ds t ≤ value ds := by
  have hl : 0 ≤ t - (⌊t⌋ : ℝ) := sub_nonneg.mpr (Int.floor_le t)
  have hu : t - (⌊t⌋ : ℝ) ≤ 1 := by linarith [Int.lt_floor_add_one t]
  have h := le_value (ds := ds) ⟨hl, hu⟩
  simpa only [clearance_sub_int] using h

theorem maximum_of_cover (n s : ℕ) (hn : 2 ≤ n) (hs : 1 ≤ s)
    (cs : List Interval) (hc : Cover n (0, 0) cs) :
    clearance (speeds n s) ((s : ℝ) / ((n : ℝ) * s + 1)) =
        (s : ℝ) / ((n : ℝ) * s + 1) ∧
      ∀ t : ℝ, clearance (speeds n s) t ≤ (s : ℝ) / ((n : ℝ) * s + 1) := by
  have hv := value_of_cover n s hn hs cs hc
  have hu (t : ℝ) : clearance (speeds n s) t ≤ (s : ℝ) / ((n : ℝ) * s + 1) := by
    rw [← hv]
    exact clearance_le_value _ t
  exact ⟨le_antisymm (hu _) (family_lower n s hn hs), hu⟩

theorem speeds_length (n s : ℕ) (hn : 1 ≤ n) : (speeds n s).length = n := by
  simp only [speeds, List.length_append, List.length_range', List.length_singleton]
  omega

theorem speeds_positive (n s : ℕ) (hn : 2 ≤ n) (hs : 1 ≤ s) :
    ∀ d ∈ speeds n s, 0 < d := by
  intro d hd
  rcases (mem_speeds (by omega : 1 ≤ n)).mp hd with h | rfl
  · omega
  · positivity

theorem speeds_distinct (n s : ℕ) (hn : 2 ≤ n) (hs : 1 ≤ s) :
    (speeds n s).Nodup := by
  have hmul : n ≤ n * s := by nlinarith
  apply List.nodup_append'.mpr
  refine ⟨List.nodup_range', by simp, List.disjoint_singleton.mpr ?_⟩
  intro h
  simp only [List.mem_range'_1] at h
  omega

theorem speeds_primitive (n s : ℕ) (hn : 2 ≤ n) :
    (speeds n s).foldr Nat.gcd 0 = 1 := by
  have hn' : n - 1 = (n - 2) + 1 := by omega
  simp [speeds, hn', List.range'_succ]

theorem value_below_threshold (n s : ℕ) (hn : 2 ≤ n) (hs : 1 ≤ s)
    (cs : List Interval) (hc : Cover n (0, 0) cs) :
    value (speeds n s) < 1 / (n : ℝ) := by
  rw [value_of_cover n s hn hs cs hc]
  have hnp : (0 : ℝ) < n := by exact_mod_cast (show 0 < n by omega)
  apply (div_lt_div_iff₀ (by positivity) hnp).mpr
  nlinarith

end Loneliness.ConsecutiveFamily
