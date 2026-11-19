import Conjectures.LonelinessConsecutiveFamily

/-! Symbolic covers for the two exceptional eight-speed product families.
The parameter is arbitrary above one; no local-maxima classification is used.
-/

namespace Loneliness.ExceptionalEightFamily

open ConsecutiveFamily

def Ordered (a b : Affine) : Prop :=
  evalQ a (2 / 17) ≤ evalQ b (2 / 17) ∧ evalQ a (1 / 8) ≤ evalQ b (1 / 8)

instance (a b : Affine) : Decidable (Ordered a b) :=
  inferInstanceAs (Decidable (_ ∧ _))

theorem ordered_sound {a b : Affine} {r : ℝ} (h : Ordered a b)
    (hl : 2 / 17 ≤ r) (hu : r ≤ 1 / 8) : eval a r ≤ eval b r := by
  have hlo : eval a (2 / 17) ≤ eval b (2 / 17) := by
    have h' := h.1
    dsimp [evalQ] at h'
    have hcast := (Rat.cast_le (K := ℝ)).mpr h'
    norm_num [eval] at hcast ⊢
    exact hcast
  have hhi : eval a (1 / 8) ≤ eval b (1 / 8) := by
    have h' := h.2
    dsimp [evalQ] at h'
    have hcast := (Rat.cast_le (K := ℝ)).mpr h'
    norm_num [eval] at hcast ⊢
    exact hcast
  exact affine_le_between _ _ _ _ _ _ _ hl hu hlo hhi

def Cover (base : List ℕ) : Affine → List Interval → Prop
  | a, [] => Ordered (1 / 2, 0) a
  | a, c :: cs => 0 < c.1 ∧ (c.1 ∈ base ∨ c.1 = 8) ∧
      Ordered (left 8 c) a ∧ Cover base (right 8 c) cs

instance (base : List ℕ) (a : Affine) (cs : List Interval) :
    Decidable (Cover base a cs) := by
  induction cs generalizing a with
  | nil => exact inferInstanceAs (Decidable (Ordered (1 / 2, 0) a))
  | cons c cs ih =>
    unfold Cover
    exact @instDecidableAnd _ _ inferInstance
      (@instDecidableAnd _ _ inferInstance (@instDecidableAnd _ _ inferInstance (ih _)))

theorem interval_upper (base : List ℕ) (s : ℕ) {c : Interval}
    (hc : 0 < c.1) (hcmem : c.1 ∈ base ∨ c.1 = 8) {r t : ℝ}
    (hr : (8 * (s : ℝ) + 1) * r = s)
    (hl : eval (left 8 c) r ≤ t) (hu : t ≤ eval (right 8 c) r) :
    clearance (base ++ [8 * s]) t ≤ r := by
  have hdp : (0 : ℝ) < c.1 := by exact_mod_cast hc
  by_cases hdn : c.1 = 8
  · have hm : 8 * s ∈ base ++ [8 * s] := by simp
    have hleft : 8 * (s : ℝ) * eval (left 8 c) r = (c.2 : ℝ) * s - r := by
      simp [left, hdn, eval]
      nlinarith [hr]
    have hright : 8 * (s : ℝ) * eval (right 8 c) r = (c.2 : ℝ) * s + r := by
      simp [right, hdn, eval]
      nlinarith [hr]
    apply clearance_le_if_near hm (k := (c.2 : ℤ) * s)
    · have h := mul_le_mul_of_nonneg_left hl (show 0 ≤ 8 * (s : ℝ) by positivity)
      rw [hleft] at h
      simpa only [Nat.cast_mul, Nat.cast_ofNat, Int.cast_mul, Int.cast_natCast] using h
    · have h := mul_le_mul_of_nonneg_left hu (show 0 ≤ 8 * (s : ℝ) by positivity)
      rw [hright] at h
      simpa only [Nat.cast_mul, Nat.cast_ofNat, Int.cast_mul, Int.cast_natCast] using h
  · have hm : c.1 ∈ base ++ [8 * s] := by
      exact List.mem_append_left _ (hcmem.resolve_right hdn)
    have hleft : (c.1 : ℝ) * eval (left 8 c) r = (c.2 : ℝ) - r := by
      simp [left, hdn, eval]
      field_simp
      ring
    have hright : (c.1 : ℝ) * eval (right 8 c) r = (c.2 : ℝ) + r := by
      simp [right, hdn, eval]
      field_simp
    apply clearance_le_if_near hm (k := (c.2 : ℤ))
    · have h := mul_le_mul_of_nonneg_left hl hdp.le
      rw [hleft] at h
      simpa only [Int.cast_natCast] using h
    · have h := mul_le_mul_of_nonneg_left hu hdp.le
      rw [hright] at h
      simpa only [Int.cast_natCast] using h

theorem cover_upper (base : List ℕ) (s : ℕ) {cs : List Interval}
    {a : Affine} (hc : Cover base a cs) {r t : ℝ}
    (hr : (8 * (s : ℝ) + 1) * r = s)
    (hlo : 2 / 17 ≤ r) (hhi : r ≤ 1 / 8)
    (ht : eval a r < t) (htu : t ≤ 1 / 2) : clearance (base ++ [8 * s]) t ≤ r := by
  induction cs generalizing a with
  | nil =>
    have h := ordered_sound hc hlo hhi
    norm_num [eval] at h
    dsimp [eval] at ht
    linarith
  | cons c cs ih =>
    rcases hc with ⟨hcpos, hcmem, hcstart, hcrest⟩
    by_cases htc : t ≤ eval (right 8 c) r
    · exact interval_upper base s hcpos hcmem hr
        ((ordered_sound hcstart hlo hhi).trans ht.le) htc
    · exact ih hcrest (lt_of_not_ge htc)

def Suitable (base : List ℕ) : Prop :=
  ∀ d ∈ base, (1 ≤ d ∧ d ≤ 7) ∨ (10 ≤ d ∧ d ≤ 15)

theorem family_lower (base : List ℕ) (hb : Suitable base) (s : ℕ) {r : ℝ}
    (hr : (8 * (s : ℝ) + 1) * r = s) (hlo : 2 / 17 ≤ r) (hhi : r ≤ 1 / 8) :
    r ≤ clearance (base ++ [8 * s]) r := by
  have hrn : 0 ≤ r := by linarith
  apply le_clearance (by linarith)
  intro d hd
  rcases List.mem_append.mp hd with hdb | hds
  · rcases hb d hdb with hsmall | hlarge
    · have hdlo : (1 : ℝ) ≤ d := by exact_mod_cast hsmall.1
      have hdhi : (d : ℝ) ≤ 7 := by exact_mod_cast hsmall.2
      apply distance_lower_of_cell (k := 0) <;> norm_num <;> nlinarith
    · have hdlo : (10 : ℝ) ≤ d := by exact_mod_cast hlarge.1
      have hdhi : (d : ℝ) ≤ 15 := by exact_mod_cast hlarge.2
      apply distance_lower_of_cell (k := 1) <;> norm_num <;> nlinarith
  · have he : d = 8 * s := List.mem_singleton.mp hds
    subst d
    apply distance_lower_of_cell (k := (s : ℤ) - 1) <;> push_cast <;> nlinarith

theorem value_of_cover (base : List ℕ) (hb : Suitable base) (hone : 1 ∈ base)
    (s : ℕ) (hs : 2 ≤ s) (cs : List Interval) (hc : Cover base (0, 0) cs) :
    value (base ++ [8 * s]) = (s : ℝ) / (8 * (s : ℝ) + 1) := by
  let r : ℝ := (s : ℝ) / (8 * (s : ℝ) + 1)
  have hs' : (2 : ℝ) ≤ s := by exact_mod_cast hs
  have hd : 0 < 8 * (s : ℝ) + 1 := by positivity
  have hr : (8 * (s : ℝ) + 1) * r = s := by dsimp [r]; field_simp
  have hlo : 2 / 17 ≤ r := by dsimp [r]; apply (le_div_iff₀ hd).mpr; linarith
  have hhi : r ≤ 1 / 8 := by dsimp [r]; apply (div_le_iff₀ hd).mpr; linarith
  have hrn : 0 ≤ r := by linarith
  have hupper {t : ℝ} (ht : 0 ≤ t) (htu : t ≤ 1 / 2) :
      clearance (base ++ [8 * s]) t ≤ r := by
    rcases eq_or_lt_of_le ht with htz | htz
    · have hm : 1 ∈ base ++ [8 * s] := List.mem_append_left _ hone
      apply (clearance_le_of_mem hm t).trans
      apply (distance_le_int _ 0).trans
      simp [← htz, hrn]
    · exact cover_upper base s hc hr hlo hhi (by simpa [eval] using htz) htu
  apply le_antisymm
  · apply value_le
    intro t ht
    by_cases hth : t ≤ 1 / 2
    · exact hupper ht.1 hth
    · rw [← clearance_reflection _ t]
      apply hupper <;> linarith [ht.1, ht.2]
  · exact (family_lower base hb s hr hlo hhi).trans (le_value ⟨hrn, by linarith⟩)

theorem maximum_of_cover (base : List ℕ) (hb : Suitable base) (hone : 1 ∈ base)
    (s : ℕ) (hs : 2 ≤ s) (cs : List Interval) (hc : Cover base (0, 0) cs) :
    clearance (base ++ [8 * s]) ((s : ℝ) / (8 * (s : ℝ) + 1)) =
        (s : ℝ) / (8 * (s : ℝ) + 1) ∧
      ∀ t : ℝ, clearance (base ++ [8 * s]) t ≤ (s : ℝ) / (8 * (s : ℝ) + 1) := by
  have hs' : (2 : ℝ) ≤ s := by exact_mod_cast hs
  have hd : 0 < 8 * (s : ℝ) + 1 := by positivity
  have hr : (8 * (s : ℝ) + 1) * ((s : ℝ) / (8 * (s : ℝ) + 1)) = s := by field_simp
  have hlo : 2 / 17 ≤ (s : ℝ) / (8 * (s : ℝ) + 1) := by
    apply (le_div_iff₀ hd).mpr
    linarith
  have hhi : (s : ℝ) / (8 * (s : ℝ) + 1) ≤ 1 / 8 := by
    apply (div_le_iff₀ hd).mpr
    linarith
  have hv := value_of_cover base hb hone s hs cs hc
  have hu (t : ℝ) : clearance (base ++ [8 * s]) t ≤ (s : ℝ) / (8 * (s : ℝ) + 1) := by
    rw [← hv]
    exact ConsecutiveFamily.clearance_le_value _ t
  exact ⟨le_antisymm (hu _) (family_lower base hb s hr hlo hhi), hu⟩

end Loneliness.ExceptionalEightFamily
