import Conjectures.GravgaardLeeUpperLowerOrbit

/-! # Gravgaard–Lee's mixed upper/lower Lüroth conjecture

The finite endpoint repair from section 2 of `DIRECT-REFINEMENT.md`.
The sibling cylinder and every repeated digit 2 are actual upper digit
cylinders. The lower digit is chosen by the floor of the positive ratio.
-/

open Set Finset Filter Topology

namespace GravgaardLeeUpperLower

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth

noncomputable section

theorem dyadic_scale_between {L T : ℝ} (hL : 0 < L) (hT : L ≤ T) :
    ∃ m : ℕ, L ≤ T * (1 / 2 : ℝ) ^ m ∧ T * (1 / 2 : ℝ) ^ m ≤ 2 * L := by
  have hlim := (tendsto_pow_atTop_nhds_zero_of_lt_one
    (by norm_num : (0 : ℝ) ≤ 1 / 2) (by norm_num : (1 / 2 : ℝ) < 1)).const_mul T
  simp only [mul_zero] at hlim
  have hex : ∃ m : ℕ, T * (1 / 2 : ℝ) ^ m ≤ 2 * L := by
    obtain ⟨m, hm⟩ := ((tendsto_order.1 hlim).2 (2 * L) (by positivity)).exists
    exact ⟨m, hm.le⟩
  refine ⟨Nat.find hex, ?_, Nat.find_spec hex⟩
  by_cases hm : Nat.find hex = 0
  · simpa only [hm, pow_zero, mul_one] using hT
  · obtain ⟨m, hmeq⟩ := Nat.exists_eq_succ_of_ne_zero hm
    have hp := Nat.find_min hex (show m < Nat.find hex by omega)
    have hp' : 2 * L < T * (1 / 2 : ℝ) ^ m := lt_of_not_ge hp
    rw [hmeq, pow_succ]
    nlinarith

theorem repeated_two_mem {k : ℕ} (hk : 2 ≤ k) {y : ℝ} (hy : y ∈ smallDigitSet k)
    (m : ℕ) : 1 + (1 / 2 : ℝ) ^ m * (y - 1) ∈ smallDigitSet k := by
  induction m with
  | zero => simpa using hy
  | succ m ih =>
    have h := prepend_smallDigitSet (d := 2) ⟨le_rfl, hk⟩ ih
    convert h using 1
    norm_num [width, pow_succ]
    ring

/-- The floor choice gives a lower digit beyond the requested cutoff and a
next-branch scale smaller than the available sibling cylinder. -/
theorem repair_digit_exists {k e d : ℕ} (hk : 3 ≤ k) (hd : 2 ≤ d) (hdk : d < k)
    {P Q c : ℝ} (hP : 0 < P) (hQ : 0 < Q) (hc : 0 < c) (hcP : c ≤ P)
    (hsmall : P < Q / ((max e (k * (k - 1) + 3) : ℕ) + 1 : ℝ)) :
    ∃ j : ℕ, e ≤ j ∧ 3 ≤ j ∧ Q / ((j : ℝ) + 1) < c ∧ c ≤ Q / j ∧
      Q * width (j + 1) ≤ P * width (d + 1) := by
  let M := max e (k * (k - 1) + 3)
  let j := ⌊Q / c⌋₊
  have hM : (M : ℝ) < Q / c := by
    have h0 : (0 : ℝ) < M + 1 := by positivity
    have hmul := (lt_div_iff₀ h0).mp hsmall
    apply (lt_div_iff₀ hc).2
    have hMP := mul_le_mul_of_nonneg_left hcP (show 0 ≤ (M : ℝ) by positivity)
    nlinarith
  have hMj : M ≤ j := Nat.le_floor hM.le
  have hej : e ≤ j := (le_max_left _ _).trans hMj
  have hkj : k * (k - 1) + 3 ≤ j := (le_max_right _ _).trans hMj
  have hj3 : 3 ≤ j := by omega
  have hj : (0 : ℝ) < j := by exact_mod_cast (show 0 < j by omega)
  have hfloor : (j : ℝ) ≤ Q / c := Nat.floor_le (div_nonneg hQ.le hc.le)
  have hceil : Q / c < (j : ℝ) + 1 := Nat.lt_floor_add_one _
  have hlo : Q / ((j : ℝ) + 1) < c :=
    (div_lt_iff₀ (by positivity)).2 (by
      have := (div_lt_iff₀ hc).mp hceil
      nlinarith)
  have hhi : c ≤ Q / j := (le_div_iff₀ hj).2 (by
    have := (le_div_iff₀ hc).mp hfloor
    nlinarith)
  refine ⟨j, hej, hj3, hlo, hhi, ?_⟩
  have hkR : (3 : ℝ) ≤ k := by exact_mod_cast hk
  have hprod : (k : ℝ) * ((k : ℝ) - 1) ≤ j := by
    have hnat : k * (k - 1) ≤ j := by omega
    have hnatR : ((k * (k - 1) : ℕ) : ℝ) ≤ j := by exact_mod_cast hnat
    simpa only [Nat.cast_mul, Nat.cast_sub (show 1 ≤ k by omega), Nat.cast_one] using hnatR
  have hrec : 1 / (j : ℝ) ≤ width k :=
    one_div_le_one_div_of_le (by nlinarith) hprod
  calc
    Q * width (j + 1) = (Q / ((j : ℝ) + 1)) / j := by
      simp only [width, Nat.cast_add, Nat.cast_one, add_sub_cancel_right, div_div, mul_one_div]
    _ ≤ c / j := (div_le_div_of_nonneg_right hlo.le hj.le)
    _ ≤ c * width k := by
      simpa only [mul_one_div] using mul_le_mul_of_nonneg_left hrec hc.le
    _ ≤ P * width k := mul_le_mul_of_nonneg_right hcP (width_pos (by omega)).le
    _ ≤ P * width (d + 1) := mul_le_mul_of_nonneg_left
      (width_antitone (by omega) (by omega)) hP.le

namespace Scene

variable {k : ℕ}

/-- Both suffix digit ranges have been reset after actual digit appends. -/
def fullScene (hk : 3 ≤ k) (P Q u v : ℝ) (hP : 0 < P) (hQ : 0 < Q) : Scene k where
  P := P
  Q := Q
  p := 2
  e := k
  P_pos := hP
  Q_pos := hQ
  p_ge_two := le_rfl
  p_lt_k := by omega
  e_ge_k := le_rfl
  u := u
  v := v

theorem fullScene_linked (hk : 3 ≤ k) {P Q u v : ℝ} (hP : 0 < P) (hQ : 0 < Q)
    (hupper : P ≤ 2 * Q) (hlower : Q * width (k + 1) ≤ P) :
    (fullScene hk P Q u v hP hQ).toFrame.Linked := by
  have ha := endpoint_pos (k := k) (by omega)
  have hW := sub_pos.mpr (endpoint_lt_one hk)
  change P * endpoint k * width 2 ≤ Q * branch k (endpoint k) ∧
    Q * (1 - endpoint k) * width (k + 1) ≤ P * (1 / ((2 : ℝ) - 1) - endpoint k)
  rw [endpoint_fixed (by omega)]
  norm_num only [show width 2 = (1 : ℝ) / 2 by norm_num [width],
    show (1 / ((2 : ℝ) - 1)) = 1 by norm_num]
  constructor
  · nlinarith [mul_le_mul_of_nonneg_right hupper ha.le]
  · nlinarith [mul_le_mul_of_nonneg_right hlower hW.le]

theorem fullScene_valid (hk : 3 ≤ k) {P Q u v x : ℝ} (hP : 0 < P) (hQ : 0 < Q)
    (hupper : P ≤ 2 * Q) (hlower : Q * width (k + 1) ≤ P)
    (hpos : 0 < x - u - v - P * endpoint k)
    (hbound : x - u - v - P * endpoint k ≤ P * (1 - endpoint k) + Q * endpoint k) :
    (fullScene hk P Q u v hP hQ).Valid x := by
  refine ⟨fullScene_linked hk hP hQ hupper hlower, hpos, ?_⟩
  change x - u - v - P * endpoint k ≤
    P * (1 / ((2 : ℝ) - 1) - endpoint k) + Q * branch k (endpoint k)
  simpa only [endpoint_fixed (show 2 ≤ k by omega),
    show (1 / ((2 : ℝ) - 1)) = 1 by norm_num] using hbound

/-- The sibling cylinder followed by any number of digit-2 branches stays
inside the actual original upper cylinder. -/
theorem sibling_cylinder_subset (s : Scene k) {d : ℕ}
    (hpd : s.p ≤ d) (hdk : d < k) (m : ℕ) :
    (fun y => (s.u + s.P / d) - (s.P * width (d + 1) * (1 / 2 : ℝ) ^ m) +
      (s.P * width (d + 1) * (1 / 2 : ℝ) ^ m) * y) '' smallDigitSet k ⊆
      s.upperCylinder := by
  rintro z ⟨y, hy, rfl⟩
  have hd : 2 ≤ d := s.p_ge_two.trans hpd
  have hmem := repeated_two_mem (k := k) (by omega) hy m
  refine ⟨branch (d + 1) (1 + (1 / 2 : ℝ) ^ m * (y - 1)),
    ⟨d + 1, by omega, by omega, _, hmem, rfl⟩, ?_⟩
  have htop := digitTop (d := d + 1) (by omega)
  simp only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] at htop
  have htopP := congrArg (fun a : ℝ => s.P * a) htop
  dsimp [branch]
  simp only [Nat.cast_add, Nat.cast_one]
  simp only [mul_one_div] at htopP
  nlinarith

/-- Given the small sibling cylinder, one of the two adjacent lower digits
restores both links and the strictly positive target interval. -/
theorem repair_from_cylinder (s : Scene k) {x t P' : ℝ} (hP' : 0 < P')
    (hcyl : (fun y => t - P' + P' * y) '' smallDigitSet k ⊆ s.upperCylinder)
    {j : ℕ} (hej : s.e ≤ j) (hj : 3 ≤ j)
    (hlo : s.Q / ((j : ℝ) + 1) < x - s.v - t)
    (hhi : x - s.v - t ≤ s.Q / j)
    (hscale : s.Q * width (j + 1) ≤ P')
    (hscale' : P' ≤ 2 * (s.Q * width (j + 1))) : s.CanAdvance x := by
  let a := endpoint k
  let W := 1 - a
  let c := x - s.v - t
  let Q'' := s.Q * width (j + 1)
  let Q' := s.Q * width j
  have hk := s.toFrame.k_ge_three
  have ha : 0 < a := endpoint_pos (by omega)
  have hW : 0 < W := sub_pos.mpr (endpoint_lt_one hk)
  have hQ'' : 0 < Q'' := mul_pos s.Q_pos (width_pos (by omega))
  have hQ' : 0 < Q' := mul_pos s.Q_pos (width_pos (by omega))
  have hwidth : width (k + 1) ≤ 1 / 2 := width_le_half (by omega)
  have hQQ : Q'' ≤ Q' := mul_le_mul_of_nonneg_left
    (width_antitone (by omega) (by omega)) s.Q_pos.le
  have hQQ' : Q' ≤ 2 * Q'' := by
    have h := mul_le_mul_of_nonneg_left (consecutive_width_bound hj) s.Q_pos.le
    dsimp [Q', Q'']
    nlinarith
  have hsplit : s.Q / j = s.Q / ((j : ℝ) + 1) + Q'' := by
    have h := digitTop (d := j + 1) (by omega)
    simp only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] at h
    have h' := congrArg (fun a : ℝ => s.Q * a) h
    dsimp [Q'']
    rw [mul_add, mul_one_div] at h'
    simpa only [mul_one_div] using h'.symm
  have hcyl' (d : ℕ) (hd : 2 ≤ d) :
      (fullScene hk P' (s.Q * width d) (t - P') (s.v + s.Q / d)
        hP' (mul_pos s.Q_pos (width_pos hd))).upperCylinder ⊆ s.upperCylinder := by
    simpa only [upperCylinder, fullScene, upperTail_two] using hcyl
  by_cases hcase : c ≤ s.Q / ((j : ℝ) + 1) + a * Q''
  · let r := fullScene hk P' Q'' (t - P') (s.v + s.Q / (j + 1 : ℕ)) hP' hQ''
    refine ⟨r, ?_, j + 1, by omega, rfl, rfl, rfl, hcyl' _ (by omega)⟩
    apply fullScene_valid hk hP' hQ'' hscale'
    · have hm := mul_le_mul_of_nonneg_left hwidth hQ''.le
      dsimp [Q''] at *
      nlinarith
    · change 0 < x - (t - P') - (s.v + s.Q / (j + 1 : ℕ)) - P' * a
      simp only [Nat.cast_add, Nat.cast_one]
      have hpos := mul_pos hP' hW
      dsimp [c, W] at *
      nlinarith
    · change x - (t - P') - (s.v + s.Q / (j + 1 : ℕ)) - P' * a ≤ P' * W + Q'' * a
      simp only [Nat.cast_add, Nat.cast_one]
      dsimp [c, W] at *
      nlinarith
  · let r := fullScene hk P' Q' (t - P') (s.v + s.Q / j) hP' hQ'
    refine ⟨r, ?_, j, hej, rfl, rfl, rfl, hcyl' _ (by omega)⟩
    apply fullScene_valid hk hP' hQ'
    · nlinarith
    · have hm := mul_le_mul_of_nonneg_left hwidth hQ'.le
      nlinarith
    · have hcase' : s.Q / ((j : ℝ) + 1) + a * Q'' < c := lt_of_not_ge hcase
      have hWP : W * Q'' ≤ W * P' := mul_le_mul_of_nonneg_left hscale hW.le
      change 0 < x - (t - P') - (s.v + s.Q / j) - P' * a
      dsimp [c, W] at *
      nlinarith
    · change x - (t - P') - (s.v + s.Q / j) - P' * a ≤ P' * W + Q' * a
      have hQa := mul_pos hQ' ha
      dsimp [c, W] at *
      nlinarith

end Scene

end
end GravgaardLeeUpperLower
