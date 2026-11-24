import Conjectures.GravgaardLeeUpperLowerLinked

/-! # Gravgaard–Lee's mixed upper/lower Lüroth conjecture

Actual finite-digit cylinders for the interval-refinement proof. Every cylinder
is defined using genuine infinite Lüroth series. The compactness claims here
apply only to the bounded-digit side, not to the lower-bounded-digit side.
-/

open Filter Finset Set
open scoped Topology Pointwise

namespace GravgaardLeeUpperLower

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth

noncomputable section

/-- The first upper digit is between `p` and `k`; every later digit is in `2..k`. -/
def upperTail (k p : ℕ) : Set ℝ :=
  {x | ∃ d, p ≤ d ∧ d ≤ k ∧ ∃ y ∈ smallDigitSet k, branch d y = x}

theorem upperTail_mono {k p q : ℕ} (hpq : p ≤ q) : upperTail k q ⊆ upperTail k p := by
  rintro x ⟨d, hqd, hdk, y, hy, rfl⟩
  exact ⟨d, hpq.trans hqd, hdk, y, hy, rfl⟩

theorem branch_subset_upperTail {k p d : ℕ} (hpd : p ≤ d) (hdk : d ≤ k) :
    branch d '' smallDigitSet k ⊆ upperTail k p := by
  rintro x ⟨y, hy, rfl⟩
  exact ⟨d, hpd, hdk, y, hy, rfl⟩

theorem upperTail_subset_small {k p : ℕ} (hp : 2 ≤ p) :
    upperTail k p ⊆ smallDigitSet k := by
  rintro x ⟨d, hpd, hdk, y, hy, rfl⟩
  exact prepend_smallDigitSet ⟨hp.trans hpd, hdk⟩ hy

theorem upperTail_of_digits {k p : ℕ} (d : ℕ → ℕ)
    (hd : ∀ i, 2 ≤ d i ∧ d i ≤ k) (hp : p ≤ d 0) : value d ∈ upperTail k p := by
  refine ⟨d 0, hp, (hd 0).2, value (fun i => d (i + 1)), ?_, ?_⟩
  · exact mem_smallDigitSet.mpr ⟨_, fun i => hd (i + 1), rfl⟩
  · exact (value_head d fun i => (hd i).1).symm

theorem upperTail_two (k : ℕ) : upperTail k 2 = smallDigitSet k := by
  apply Subset.antisymm (upperTail_subset_small le_rfl)
  intro x hx
  obtain ⟨d, hd, rfl⟩ := mem_smallDigitSet.mp hx
  exact upperTail_of_digits d hd (hd 0).1

theorem upperTail_singleton (k : ℕ) : upperTail k k = branch k '' smallDigitSet k := by
  ext x
  constructor
  · rintro ⟨d, hkd, hdk, y, hy, heq⟩
    have : d = k := by omega
    subst d
    exact ⟨y, hy, heq⟩
  · exact fun hx => branch_subset_upperTail (k := k) (p := k) (d := k) le_rfl le_rfl hx

theorem upperTail_compact {k p : ℕ} (hk : 2 ≤ k) : IsCompact (upperTail k p) := by
  have heq : upperTail k p = ⋃ d ∈ Finset.Icc p k, branch d '' smallDigitSet k := by
    ext x
    simp only [upperTail, Set.mem_ofPred_eq, mem_iUnion, Finset.mem_Icc, Set.mem_image]
    constructor
    · rintro ⟨d, hpd, hdk, y, hy, heq⟩
      exact ⟨d, ⟨hpd, hdk⟩, y, hy, heq⟩
    · rintro ⟨d, ⟨hpd, hdk⟩, y, hy, heq⟩
      exact ⟨d, hpd, hdk, y, hy, heq⟩
  rw [heq]
  exact (Finset.Icc p k).isCompact_biUnion fun d _ =>
    (smallDigitSet_compact hk).image (by unfold branch; fun_prop)

theorem endpoint_mem_upperTail {k p : ℕ} (hk : 2 ≤ k) (hpk : p ≤ k) :
    endpoint k ∈ upperTail k p :=
  ⟨k, hpk, le_rfl, endpoint k, endpoint_mem_small hk, endpoint_fixed hk⟩

theorem upperTail_bounds {k p : ℕ} (hp : 2 ≤ p) {x : ℝ}
    (hx : x ∈ upperTail k p) : x ∈ Icc (endpoint k) (1 / ((p : ℝ) - 1)) := by
  obtain ⟨d, hpd, hdk, y, hy, rfl⟩ := hx
  have hd := hp.trans hpd
  have hk := hd.trans hdk
  refine ⟨(smallDigitSet_endpoint_bounds hk (prepend_smallDigitSet ⟨hd, hdk⟩ hy)).1, ?_⟩
  calc
    branch d y ≤ branch d 1 := branch_mono hd (smallDigitSet_bounds hy).2
    _ ≤ branch p 1 := branch_antitone_digit hp hpd (by norm_num)
    _ = _ := by simpa [branch] using digitTop hp

/-- A scene records both affine prefix translations in addition to its frame. -/
structure Scene (k : ℕ) extends Frame k where
  u : ℝ
  v : ℝ

namespace Scene

variable {k : ℕ} (s : Scene k)

def upperCylinder : Set ℝ := (fun y => s.u + s.P * y) '' upperTail k s.p
def residual (x : ℝ) : ℝ := x - s.u - s.v - s.P * endpoint k
def Valid (x : ℝ) : Prop := s.toFrame.Valid (s.residual x)

theorem upperCylinder_compact : IsCompact s.upperCylinder :=
  (upperTail_compact (by have := s.toFrame.k_ge_three; omega)).image (by fun_prop)

theorem minimum_mem : s.u + s.P * endpoint k ∈ s.upperCylinder := by
  exact ⟨endpoint k, endpoint_mem_upperTail
    (by have := s.toFrame.k_ge_three; omega) s.p_lt_k.le, rfl⟩

theorem upperCylinder_bounds {y : ℝ} (hy : y ∈ s.upperCylinder) :
    y ∈ Icc (s.u + s.P * endpoint k)
      (s.u + s.P * endpoint k + s.toFrame.upperWidth) := by
  obtain ⟨a, ha, rfl⟩ := hy
  have hb := upperTail_bounds s.p_ge_two ha
  have hmin := mul_le_mul_of_nonneg_left hb.1 s.P_pos.le
  have hmax := mul_le_mul_of_nonneg_left hb.2 s.P_pos.le
  dsimp [Frame.upperWidth]
  constructor <;> nlinarith

def appendUpper : Scene k where
  toFrame := s.toFrame.appendUpper
  u := s.u + s.P / s.p
  v := s.v

def appendLower : Scene k where
  toFrame := s.toFrame.appendLower
  u := s.u
  v := s.v + s.Q / s.e

def discardLower : Scene k where
  toFrame := s.toFrame.discardLower
  u := s.u
  v := s.v

def discardUpper (e' : ℕ) (he : s.e ≤ e') : Scene k where
  toFrame := s.toFrame.discardUpper e' he
  u := if s.p + 1 < k then s.u else s.u + s.P / k
  v := s.v

theorem appendUpper_residual (x : ℝ) :
    s.appendUpper.residual x = s.residual x -
      (s.toFrame.upperLeftWidth + s.toFrame.upperGap) := by
  dsimp [appendUpper, residual, Frame.appendUpper, Frame.upperLeftWidth, Frame.upperGap]
  ring

theorem appendLower_residual (x : ℝ) :
    s.appendLower.residual x = s.residual x - s.Q / s.e := by
  dsimp [appendLower, residual, Frame.appendLower]
  ring

theorem discardLower_residual (x : ℝ) : s.discardLower.residual x = s.residual x := rfl

theorem discardUpper_residual (e' : ℕ) (he : s.e ≤ e') (x : ℝ) :
    (s.discardUpper e' he).residual x = s.residual x := by
  by_cases hp : s.p + 1 < k
  · simp [discardUpper, Frame.discardUpper, hp, residual]
  · have hf := endpoint_fixed (show 2 ≤ k by have := s.toFrame.k_ge_three; omega)
    dsimp [branch] at hf
    simp only [discardUpper, Frame.discardUpper, hp, ↓reduceDIte, ↓reduceIte, residual]
    have hm := congrArg (fun a : ℝ => s.P * a) hf
    simp only [div_eq_mul_inv, one_mul] at hm ⊢
    nlinarith

theorem appendUpper_subset : s.appendUpper.upperCylinder ⊆ s.upperCylinder := by
  rintro x ⟨y, hy, rfl⟩
  have hy' : y ∈ smallDigitSet k := by simpa [appendUpper, Frame.appendUpper, upperTail_two] using hy
  refine ⟨branch s.p y, branch_subset_upperTail le_rfl s.p_lt_k.le ⟨y, hy', rfl⟩, ?_⟩
  dsimp [appendUpper, Frame.appendUpper, branch]
  ring

theorem appendLower_upperCylinder : s.appendLower.upperCylinder = s.upperCylinder := rfl
theorem discardLower_upperCylinder : s.discardLower.upperCylinder = s.upperCylinder := rfl

theorem discardUpper_subset (e' : ℕ) (he : s.e ≤ e') :
    (s.discardUpper e' he).upperCylinder ⊆ s.upperCylinder := by
  by_cases hp : s.p + 1 < k
  · rintro x ⟨y, hy, rfl⟩
    refine ⟨y, ?_, ?_⟩
    · apply upperTail_mono (by omega : s.p ≤ s.p + 1)
      simpa [discardUpper, Frame.discardUpper, hp] using hy
    · simp [discardUpper, Frame.discardUpper, hp]
  · rintro x ⟨y, hy, rfl⟩
    have hy' : y ∈ smallDigitSet k := by
      simpa [discardUpper, Frame.discardUpper, hp, upperTail_two] using hy
    refine ⟨branch k y, branch_subset_upperTail s.p_lt_k.le le_rfl ⟨y, hy', rfl⟩, ?_⟩
    simp only [discardUpper, Frame.discardUpper, hp, ↓reduceDIte, ↓reduceIte, branch]
    ring

theorem appendUpper_valid {x : ℝ} (hx : s.Valid x)
    (hchoose : s.toFrame.lowerRightWidth < s.toFrame.upperGap)
    (hbranch : s.toFrame.upperLeftWidth + s.toFrame.upperGap < s.residual x) :
    s.appendUpper.Valid x := by
  change s.toFrame.appendUpper.Valid (s.appendUpper.residual x)
  rw [s.appendUpper_residual]
  exact s.toFrame.appendUpper_valid hx hchoose hbranch

theorem appendLower_valid {x : ℝ} (hx : s.Valid x)
    (hchoose : s.toFrame.upperGap ≤ s.toFrame.lowerRightWidth)
    (hbranch : s.Q / s.e < s.residual x) : s.appendLower.Valid x := by
  change s.toFrame.appendLower.Valid (s.appendLower.residual x)
  rw [s.appendLower_residual]
  exact s.toFrame.appendLower_valid hx hchoose hbranch

theorem discardLower_valid {x : ℝ} (hx : s.Valid x)
    (hchoose : s.toFrame.upperGap ≤ s.toFrame.lowerRightWidth)
    (hbranch : s.residual x ≤ s.Q / s.e) : s.discardLower.Valid x :=
  s.toFrame.discardLower_valid hx hchoose hbranch

theorem exists_discardUpper_valid {x : ℝ} (hx : s.Valid x)
    (hbranch : s.residual x ≤ s.toFrame.upperLeftWidth + s.toFrame.upperGap) :
    ∃ e' : ℕ, ∃ he : s.e ≤ e', (s.discardUpper e' he).Valid x := by
  obtain ⟨e', he, h⟩ := s.toFrame.exists_discardUpper_valid hx hbranch
  refine ⟨e', he, ?_⟩
  change (s.toFrame.discardUpper e' he).Valid ((s.discardUpper e' he).residual x)
  rwa [s.discardUpper_residual]

end Scene

end
end GravgaardLeeUpperLower
