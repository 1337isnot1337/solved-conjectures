import Conjectures.LonelinessCriticalFamilies

/-! Dilation invariance and gcd normalization of finite integer-speed lists. -/

namespace Loneliness.Normalization

def gcd (ds : List ℕ) : ℕ := ds.foldr Nat.gcd 0

def normalize (ds : List ℕ) : List ℕ := ds.map (fun a => a / gcd ds)

theorem clearance_scale (ds : List ℕ) (d : ℕ) (t : ℝ) :
    clearance (ds.map (fun a => d * a)) t = clearance ds ((d : ℝ) * t) := by
  induction ds with
  | nil => rfl
  | cons a ds ih =>
    simp only [List.map_cons, clearance, ih]
    congr 1
    congr 1
    push_cast
    ring

theorem value_scale (ds : List ℕ) (d : ℕ) (hd : 0 < d) :
    value (ds.map (fun a => d * a)) = value ds := by
  have hd' : (0 : ℝ) < d := by exact_mod_cast hd
  have hd₁ : (1 : ℝ) ≤ d := by exact_mod_cast (show 1 ≤ d by omega)
  apply le_antisymm
  · apply value_le
    intro t ht
    rw [clearance_scale]
    exact CriticalFamilies.le_value_any ds ((d : ℝ) * t)
  · apply value_le
    intro t ht
    have htu : t / (d : ℝ) ∈ Set.Icc (0 : ℝ) 1 := by
      refine ⟨div_nonneg ht.1 hd'.le, ?_⟩
      apply (div_le_one hd').mpr
      exact ht.2.trans hd₁
    have hdu : (d : ℝ) * (t / d) = t := by field_simp
    have heq := clearance_scale ds d (t / (d : ℝ))
    rw [hdu] at heq
    rw [← heq]
    exact le_value htu

theorem gcd_dvd_mem {ds : List ℕ} {a : ℕ} (ha : a ∈ ds) : gcd ds ∣ a := by
  induction ds with
  | nil => simp at ha
  | cons b ds ih =>
    rcases List.mem_cons.mp ha with rfl | ha
    · exact Nat.gcd_dvd_left _ _
    · exact (Nat.gcd_dvd_right b (gcd ds)).trans (ih ha)

theorem gcd_pos {ds : List ℕ} (hne : ds ≠ []) (hpos : ∀ a ∈ ds, 0 < a) :
    0 < gcd ds := by
  cases ds with
  | nil => exact False.elim (hne rfl)
  | cons a ds => exact Nat.gcd_pos_of_pos_left (gcd ds) (hpos a (by simp))

theorem gcd_scale (ds : List ℕ) (d : ℕ) :
    gcd (ds.map (fun a => d * a)) = d * gcd ds := by
  induction ds with
  | nil => simp [gcd]
  | cons a ds ih =>
    change Nat.gcd (d * a) (gcd (ds.map (fun a => d * a))) = d * Nat.gcd a (gcd ds)
    rw [ih, Nat.gcd_mul_left]

theorem rescale_normalize (ds : List ℕ) :
    (normalize ds).map (fun a => gcd ds * a) = ds := by
  unfold normalize
  rw [List.map_map]
  calc
    _ = ds.map id := by
      apply List.map_congr_left
      intro a ha
      exact Nat.mul_div_cancel' (gcd_dvd_mem ha)
    _ = ds := List.map_id ds

theorem value_normalize (ds : List ℕ) (hne : ds ≠ [])
    (hpos : ∀ a ∈ ds, 0 < a) : value (normalize ds) = value ds := by
  have h := value_scale (normalize ds) (gcd ds) (gcd_pos hne hpos)
  rw [rescale_normalize] at h
  exact h.symm

theorem normalize_primitive (ds : List ℕ) (hne : ds ≠ [])
    (hpos : ∀ a ∈ ds, 0 < a) : gcd (normalize ds) = 1 := by
  have hg := gcd_pos hne hpos
  have h := gcd_scale (normalize ds) (gcd ds)
  rw [rescale_normalize] at h
  apply (mul_right_injective₀ (ne_of_gt hg))
  simpa using h.symm

@[simp] theorem normalize_length (ds : List ℕ) : (normalize ds).length = ds.length := by
  simp [normalize]

theorem normalize_positive (ds : List ℕ) (hpos : ∀ a ∈ ds, 0 < a) :
    ∀ a ∈ normalize ds, 0 < a := by
  intro a ha
  obtain ⟨b, hb, rfl⟩ := List.mem_map.mp ha
  have hcancel := Nat.mul_div_cancel' (gcd_dvd_mem hb)
  have hbpos := hpos b hb
  by_contra hn
  have hz : b / gcd ds = 0 := Nat.eq_zero_of_not_pos hn
  rw [hz, Nat.mul_zero] at hcancel
  omega

theorem normalize_nodup {ds : List ℕ} (hdistinct : ds.Nodup) :
    (normalize ds).Nodup := by
  apply List.Nodup.map_on ?_ hdistinct
  intro a ha b hb hab
  calc
    a = gcd ds * (a / gcd ds) := (Nat.mul_div_cancel' (gcd_dvd_mem ha)).symm
    _ = gcd ds * (b / gcd ds) := congrArg (fun n => gcd ds * n) hab
    _ = b := Nat.mul_div_cancel' (gcd_dvd_mem hb)

theorem primitive_representative (ds : List ℕ) (hne : ds ≠ [])
    (hpos : ∀ a ∈ ds, 0 < a) (hdistinct : ds.Nodup) :
    ∃ ns : List ℕ, ns.length = ds.length ∧ ns.Nodup ∧
      (∀ a ∈ ns, 0 < a) ∧ ns.foldr Nat.gcd 0 = 1 ∧ value ns = value ds := by
  exact ⟨normalize ds, normalize_length ds, normalize_nodup hdistinct,
    normalize_positive ds hpos, normalize_primitive ds hne hpos,
    value_normalize ds hne hpos⟩

theorem normalize_dilation_subset {base ds : List ℕ} (h₁ : 1 ∈ base)
    (hpos : ∀ a ∈ ds, 0 < a) (d : ℕ)
    (hsub : base.map (fun m => d * m) ⊆ ds) :
    base.map (fun m => (d / gcd ds) * m) ⊆ normalize ds := by
  have hdmem : d ∈ ds := hsub (List.mem_map.mpr ⟨1, h₁, by simp⟩)
  have hgne : 0 < gcd ds := gcd_pos (by intro h; simp [h] at hdmem) hpos
  have hgdd := gcd_dvd_mem hdmem
  intro a ha
  obtain ⟨m, hm, rfl⟩ := List.mem_map.mp ha
  apply List.mem_map.mpr
  refine ⟨d * m, hsub (List.mem_map.mpr ⟨m, hm, rfl⟩), ?_⟩
  apply (mul_right_injective₀ (ne_of_gt hgne))
  calc
    gcd ds * (d * m / gcd ds) = d * m :=
      Nat.mul_div_cancel' (dvd_mul_of_dvd_left hgdd m)
    _ = (gcd ds * (d / gcd ds)) * m := by rw [Nat.mul_div_cancel' hgdd]
    _ = gcd ds * (d / gcd ds * m) := by ring

theorem normalize_critical {ds : List ℕ} (hpos : ∀ a ∈ ds, 0 < a)
    (hcrit : CriticalFamilies.ContainsCriticalQuadruple ds) :
    CriticalFamilies.ContainsCriticalQuadruple (normalize ds) := by
  obtain ⟨d, hd, hsub | hsub⟩ := hcrit
  · have hdmem : d ∈ ds := hsub (by simp)
    have hnd : 0 < d / gcd ds :=
      normalize_positive ds hpos _ (List.mem_map.mpr ⟨d, hdmem, rfl⟩)
    exact ⟨d / gcd ds, hnd, Or.inl (normalize_dilation_subset (by simp) hpos d hsub)⟩
  · have hdmem : d ∈ ds := hsub (by simp)
    have hnd : 0 < d / gcd ds :=
      normalize_positive ds hpos _ (List.mem_map.mpr ⟨d, hdmem, rfl⟩)
    exact ⟨d / gcd ds, hnd, Or.inr (normalize_dilation_subset (by simp) hpos d hsub)⟩

theorem critical_family_below_threshold {ds : List ℕ}
    (hlen : ds.length = 5) (hpos : ∀ a ∈ ds, 0 < a)
    (hcrit : CriticalFamilies.ContainsCriticalQuadruple ds)
    (hbelow : value ds < 1 / 5) :
    ∃ s : ℕ, 1 ≤ s ∧ value ds = (s : ℝ) / (5 * (s : ℝ) + 1) := by
  have hne : ds ≠ [] := by intro h; simp [h] at hlen
  have hv := value_normalize ds hne hpos
  have h := CriticalFamilies.critical_family_below_threshold
    (ds := normalize ds) (by simpa using hlen) (normalize_positive ds hpos)
    (normalize_primitive ds hne hpos) (normalize_critical hpos hcrit)
    (by simpa [hv] using hbelow)
  simpa only [hv] using h

end Loneliness.Normalization
