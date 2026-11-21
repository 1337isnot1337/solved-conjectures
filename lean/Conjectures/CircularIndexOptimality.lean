import Conjectures.CircularIndexReal

/-!
# Optimality for real circular edge colorings

Rounding the colors of a real `r`-coloring after multiplication by `k`
produces a `(ceil(k*r), k-1)`-coloring.  The finite window count applied
for arbitrarily large `k` gives the real lower bound without assuming
that the original colors or radius are rational.
-/

namespace CircularIndex

theorem floor_gap_bounds (k p : ℕ) (r a b : ℝ) (hk : 2 ≤ k)
    (ha : 0 ≤ a) (hb : b < r) (hab : a ≤ b)
    (hl : 1 ≤ b - a) (hu : b - a ≤ r - 1) (hp : (k : ℝ) * r ≤ p) :
    k - 1 ≤ ⌊(k : ℝ) * b⌋₊ - ⌊(k : ℝ) * a⌋₊ ∧
      k - 1 ≤ p - (⌊(k : ℝ) * b⌋₊ - ⌊(k : ℝ) * a⌋₊) := by
  have hk0 : (0 : ℝ) < k := by exact_mod_cast (show 0 < k by omega)
  have hka : 0 ≤ (k : ℝ) * a := mul_nonneg hk0.le ha
  have hkb : 0 ≤ (k : ℝ) * b := mul_nonneg hk0.le (ha.trans hab)
  have hAB : ⌊(k : ℝ) * a⌋₊ ≤ ⌊(k : ℝ) * b⌋₊ :=
    Nat.floor_mono (mul_le_mul_of_nonneg_left hab hk0.le)
  have hBp : ⌊(k : ℝ) * b⌋₊ < p :=
    (Nat.floor_lt hkb).mpr ((mul_lt_mul_of_pos_left hb hk0).trans_le hp)
  have hAl := Nat.floor_le hka
  have hAu := Nat.lt_floor_add_one ((k : ℝ) * a)
  have hBl := Nat.floor_le hkb
  have hBu := Nat.lt_floor_add_one ((k : ℝ) * b)
  have hmulL := mul_le_mul_of_nonneg_left hl hk0.le
  have hmulU := mul_le_mul_of_nonneg_left hu hk0.le
  have hk1 : 1 ≤ k := by omega
  constructor
  · have h : ((k - 1 : ℕ) : ℝ) ≤
        ((⌊(k : ℝ) * b⌋₊ - ⌊(k : ℝ) * a⌋₊ : ℕ) : ℝ) := by
      rw [Nat.cast_sub hk1, Nat.cast_one, Nat.cast_sub hAB]
      nlinarith
    exact_mod_cast h
  · have h : ((k - 1 : ℕ) : ℝ) ≤
        ((p - (⌊(k : ℝ) * b⌋₊ - ⌊(k : ℝ) * a⌋₊) : ℕ) : ℝ) := by
      rw [Nat.cast_sub hk1, Nat.cast_one,
        Nat.cast_sub (show ⌊(k : ℝ) * b⌋₊ - ⌊(k : ℝ) * a⌋₊ ≤ p by omega), Nat.cast_sub hAB]
      nlinarith
    exact_mod_cast h

theorem quantized_ordered_separation (k p : ℕ) [NeZero p] (r a b : ℝ)
    (hk : 2 ≤ k) (ha : 0 ≤ a) (hb : b < r) (hab : a ≤ b)
    (hl : 1 ≤ b - a) (hu : b - a ≤ r - 1) (hp : (k : ℝ) * r ≤ p) :
    k - 1 ≤ ((⌊(k : ℝ) * b⌋₊ : ZMod p) - (⌊(k : ℝ) * a⌋₊ : ZMod p)).val ∧
      k - 1 ≤ ((⌊(k : ℝ) * a⌋₊ : ZMod p) - (⌊(k : ℝ) * b⌋₊ : ZMod p)).val := by
  have hk0 : (0 : ℝ) < k := by exact_mod_cast (show 0 < k by omega)
  have hb0 : 0 ≤ b := ha.trans hab
  have hap : ⌊(k : ℝ) * a⌋₊ < p := (Nat.floor_lt (mul_nonneg hk0.le ha)).mpr
    ((mul_lt_mul_of_pos_left (hab.trans_lt hb) hk0).trans_le hp)
  have hbp : ⌊(k : ℝ) * b⌋₊ < p := (Nat.floor_lt (mul_nonneg hk0.le hb0)).mpr
    ((mul_lt_mul_of_pos_left hb hk0).trans_le hp)
  have hAB : ⌊(k : ℝ) * a⌋₊ ≤ ⌊(k : ℝ) * b⌋₊ :=
    Nat.floor_mono (mul_le_mul_of_nonneg_left hab hk0.le)
  obtain ⟨hl', hu'⟩ := floor_gap_bounds k p r a b hk ha hb hab hl hu hp
  have hval : (⌊(k : ℝ) * a⌋₊ : ZMod p).val ≤ (⌊(k : ℝ) * b⌋₊ : ZMod p).val := by
    rwa [ZMod.val_natCast_of_lt hap, ZMod.val_natCast_of_lt hbp]
  have hne : (⌊(k : ℝ) * b⌋₊ : ZMod p) ≠ (⌊(k : ℝ) * a⌋₊ : ZMod p) := by
    intro h
    have hh := natCast_injective_below p _ _ hbp hap h
    omega
  constructor
  · rwa [ZMod.val_sub hval, ZMod.val_natCast_of_lt hap, ZMod.val_natCast_of_lt hbp]
  · rwa [zmod_val_sub_wrap _ _ hval hne, ZMod.val_natCast_of_lt hap, ZMod.val_natCast_of_lt hbp]

theorem ceil_scaled_radius_ge (k : ℕ) (r : ℝ) (hr : 1 ≤ r) :
    k ≤ ⌈(k : ℝ) * r⌉₊ := by
  have h : (k : ℝ) ≤ (⌈(k : ℝ) * r⌉₊ : ℕ) := by
    calc
      (k : ℝ) = (k : ℝ) * 1 := by simp
      _ ≤ (k : ℝ) * r := mul_le_mul_of_nonneg_left hr (Nat.cast_nonneg _)
      _ ≤ ⌈(k : ℝ) * r⌉₊ := Nat.le_ceil _
  exact_mod_cast h

noncomputable def RealCircularEdgeColoring.quantize {V : Type*} {G : SimpleGraph V}
    {r : ℝ} (C : RealCircularEdgeColoring G r) (k : ℕ) (hk : 2 ≤ k) :
    IntegerCircularEdgeColoring G ⌈(k : ℝ) * r⌉₊ (k - 1) where
  colors e := (⌊(k : ℝ) * C.colors e⌋₊ : ZMod ⌈(k : ℝ) * r⌉₊)
  separated e f hef hv := by
    have hkceil := ceil_scaled_radius_ge k r C.one_le
    have hp : NeZero ⌈(k : ℝ) * r⌉₊ := ⟨by omega⟩
    let _ := hp
    have hpr : (k : ℝ) * r ≤ ⌈(k : ℝ) * r⌉₊ := Nat.le_ceil _
    obtain ⟨hl, hu⟩ := C.separated e f hef hv
    rcases le_total (C.colors e) (C.colors f) with h | h
    · rw [abs_of_nonneg (sub_nonneg.mpr h)] at hl hu
      exact (quantized_ordered_separation k _ r (C.colors e) (C.colors f) hk
        (C.nonneg e) (C.lt_radius f) h hl hu hpr).1
    · rw [abs_sub_comm, abs_of_nonneg (sub_nonneg.mpr h)] at hl hu
      exact (quantized_ordered_separation k _ r (C.colors f) (C.colors e) hk
        (C.nonneg f) (C.lt_radius e) h hl hu hpr).2

theorem RealCircularEdgeColoring.counting_bound {V : Type*} [Fintype V]
    {G : SimpleGraph V} [Fintype G.edgeSet] {r : ℝ} (C : RealCircularEdgeColoring G r) :
    (Fintype.card G.edgeSet : ℝ) ≤ r * ((Fintype.card V / 2 : ℕ) : ℝ) := by
  by_contra hn
  let E : ℝ := Fintype.card G.edgeSet
  let M : ℝ := (Fintype.card V / 2 : ℕ)
  have hgap : 0 < E - r * M := by dsimp [E, M]; linarith
  obtain ⟨k, hk⟩ := exists_nat_gt (max 2 ((E + M) / (E - r * M)))
  have hk2real : (2 : ℝ) < k := lt_of_le_of_lt (le_max_left _ _) hk
  have hk2 : 2 ≤ k := by exact_mod_cast hk2real.le
  have hkbig : (E + M) / (E - r * M) < k := lt_of_le_of_lt (le_max_right _ _) hk
  have hbig : E + M < (k : ℝ) * (E - r * M) := (div_lt_iff₀ hgap).mp hkbig
  have hkceil := ceil_scaled_radius_ge k r C.one_le
  have hp : NeZero ⌈(k : ℝ) * r⌉₊ := ⟨by omega⟩
  let _ := hp
  have hcount := (C.quantize k hk2).counting_bound (show k - 1 ≤ ⌈(k : ℝ) * r⌉₊ by omega)
  have hcount' : (((k - 1) * Fintype.card G.edgeSet : ℕ) : ℝ) ≤
      ((⌈(k : ℝ) * r⌉₊ * (Fintype.card V / 2) : ℕ) : ℝ) := by exact_mod_cast hcount
  rw [Nat.cast_mul, Nat.cast_mul, Nat.cast_sub (show 1 ≤ k by omega), Nat.cast_one] at hcount'
  have hceil : (⌈(k : ℝ) * r⌉₊ : ℝ) ≤ (k : ℝ) * r + 1 :=
    (Nat.ceil_lt_add_one (mul_nonneg (Nat.cast_nonneg _) (by linarith [C.one_le]))).le
  have hM : 0 ≤ M := Nat.cast_nonneg _
  have hceilM := mul_le_mul_of_nonneg_right hceil hM
  change ((k : ℝ) - 1) * E ≤ (⌈(k : ℝ) * r⌉₊ : ℝ) * M at hcount'
  nlinarith

theorem circulant_realColoring_lower_bound (g : ℕ) (hg : 2 ≤ g) {r : ℝ}
    (C : RealCircularEdgeColoring (graph g) r) : (2 * order g : ℝ) / 3 ≤ r := by
  classical
  let _ := Fintype.ofFinite (graph g).edgeSet
  have h := C.counting_bound
  have he : Fintype.card (graph g).edgeSet = 2 * g * order g := by
    rw [← Nat.card_eq_fintype_card]
    exact card_edges g hg
  have hv : Fintype.card (ZMod (order g)) / 2 = 3 * g := by
    rw [ZMod.card]
    simp only [order]
    omega
  rw [he, hv] at h
  push_cast at h
  have hgpos : (0 : ℝ) < g := by exact_mod_cast (show 0 < g by omega)
  apply (div_le_iff₀ (by norm_num : (0 : ℝ) < 3)).mpr
  nlinarith

theorem circulant_circularChromaticIndex (g : ℕ) (hg : 2 ≤ g) :
    circularChromaticIndex (graph g) = (2 * order g : ℝ) / 3 := by
  apply le_antisymm (circulant_circularChromaticIndex_upper_bound g hg)
  apply le_csInf
  · exact ⟨_, ⟨(circulantColoring g hg).toReal (by omega : 0 < 3)
      (by simp only [order]; omega)⟩⟩
  · intro r hr
    exact circulant_realColoring_lower_bound g hg hr.some

theorem circulant_circularChromaticIndex_closed_form (g : ℕ) (hg : 2 ≤ g) :
    circularChromaticIndex (graph g) = 4 * (g : ℝ) + 2 / 3 := by
  rw [circulant_circularChromaticIndex g hg]
  simp only [order, Nat.cast_add, Nat.cast_mul, Nat.cast_one, Nat.cast_ofNat]
  ring

end CircularIndex
