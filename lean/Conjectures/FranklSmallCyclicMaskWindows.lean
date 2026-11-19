module

public import Conjectures.FranklCyclicCertificates
public import Conjectures.FranklLocalMaskDomains
public import Conjectures.FranklLocalFiniteSupport

/-! Checked masks for literal cyclic windows, including short-cycle aliases.

Each generator is first encoded on the actual modulo-n ground. Only then
is its decoded support transported into the cyclic family. The point map
is injective on range n, even when several unwrapped positions coincide.
The final theorem applies the certificate to the full generated family.
-/
@[expose] public section

namespace FranklSmallCyclic.MaskWindows

open FranklCyclic FranklLocal Frankl.FC.BitCode
open scoped BigOperators

theorem decode_two_pow {n k : ℕ} (hk : k < n) : decode n (2 ^ k) = {k} := by
  ext i
  simp only [mem_decode, Nat.testBit_two_pow, decide_eq_true_eq, Finset.mem_singleton]
  constructor
  · rintro ⟨_, h⟩
    exact h.symm
  · rintro rfl
    exact ⟨hk, rfl⟩

theorem mem_decode_maskUnion (n : ℕ) (codes : List ℕ) (x : ℕ) :
    x ∈ decode n (maskUnion codes) ↔ ∃ a ∈ codes, x ∈ decode n a := by
  rw [decode_maskUnion]
  simp [Frankl.generatedUnion, decodedGenerators]

theorem maskUnion_lt {n : ℕ} (codes : List ℕ)
    (hcodes : ∀ a ∈ codes, a < 2 ^ n) : maskUnion codes < 2 ^ n := by
  induction codes with
  | nil => exact Nat.two_pow_pos n
  | cons a rest ih =>
      exact Nat.or_lt_two_pow (hcodes a (List.mem_cons_self))
        (ih (fun b hb => hcodes b (List.mem_cons_of_mem _ hb)))

/-- A tile is encoded after reducing every occupied position modulo n. -/
def tileMask (n : ℕ) (p : Fin 7) (j : Fin 4) : ℕ :=
  maskUnion (((List.finRange 4).filter (fun q => decide (q ∈ shapeOffsets j))).map
    (fun q => 2 ^ ((p.val + q.val) % n)))

theorem tileMask_lt {n : ℕ} [NeZero n] (p : Fin 7) (j : Fin 4) :
    tileMask n p j < 2 ^ n := by
  apply maskUnion_lt
  intro a ha
  obtain ⟨q, _, rfl⟩ := List.mem_map.mp ha
  exact Nat.pow_lt_pow_right (by decide) (Nat.mod_lt _ (NeZero.pos n))

theorem mem_decode_tileMask {n : ℕ} [NeZero n] (p : Fin 7) (j : Fin 4) (x : ℕ) :
    x ∈ decode n (tileMask n p j) ↔
      ∃ q ∈ shapeOffsets j, (p.val + q.val) % n = x := by
  unfold tileMask
  rw [mem_decode_maskUnion]
  constructor
  · rintro ⟨a, ha, hxa⟩
    obtain ⟨q, hq, rfl⟩ := List.mem_map.mp ha
    rw [decode_two_pow (Nat.mod_lt _ (NeZero.pos n))] at hxa
    exact ⟨q, of_decide_eq_true (List.mem_filter.mp hq).2,
      (Finset.mem_singleton.mp hxa).symm⟩
  · rintro ⟨q, hq, hqx⟩
    refine ⟨2 ^ ((p.val + q.val) % n), List.mem_map.mpr
      ⟨q, List.mem_filter.mpr ⟨by simp, decide_eq_true hq⟩, rfl⟩, ?_⟩
    rw [decode_two_pow (Nat.mod_lt _ (NeZero.pos n))]
    exact Finset.mem_singleton.mpr hqx.symm

theorem tileMask_decode {n : ℕ} [NeZero n] (p : Fin 7) (j : Fin 4) :
    decode n (tileMask n p j) =
      (shapeOffsets j).image (fun q => (p.val + q.val) % n) := by
  ext x
  exact (mem_decode_tileMask p j x).trans Finset.mem_image.symm

/-- The generators belonging to the seven specified starts. Duplicate masks
are harmless: decodedGenerators counts each generator once. -/
def windowMasks (n : ℕ) (v : Fin 7 → Finset (Fin 4)) : List ℕ :=
  (List.finRange 7).flatMap (fun p =>
    ((List.finRange 4).filter (fun j => decide (j ∈ v p))).map (tileMask n p))

theorem mem_windowMasks (n : ℕ) (v : Fin 7 → Finset (Fin 4)) (a : ℕ) :
    a ∈ windowMasks n v ↔ ∃ p, ∃ j ∈ v p, tileMask n p j = a := by
  simp [windowMasks]

theorem windowMasks_bounded {n : ℕ} [NeZero n] (v : Fin 7 → Finset (Fin 4)) :
    ∀ a ∈ windowMasks n v, a < 2 ^ n := by
  intro a ha
  obtain ⟨p, j, _, rfl⟩ := (mem_windowMasks n v a).mp ha
  exact tileMask_lt p j

def position {n : ℕ} (start : ZMod n) (x : ℕ) : ZMod n := start + (x : ZMod n)

theorem tileMask_image {n : ℕ} [NeZero n] (start : ZMod n) (p : Fin 7) (j : Fin 4) :
    (decode n (tileMask n p j)).image (position start) =
      (localTile 4 p j).image (rawPosition start) := by
  simp [tileMask_decode, position, localTile, Finset.map_eq_image, Finset.image_image,
    Function.comp_def, rawPosition, localShift, ZMod.natCast_mod]

theorem decoded_windowMasks_image {n : ℕ} [NeZero n]
    (v : Fin 7 → Finset (Fin 4)) (start : ZMod n) :
    imageFamily (position start) (decodedGenerators n (windowMasks n v)) =
      imageFamily (rawPosition start) (localTiles 4 v) := by
  ext U
  constructor
  · intro hU
    obtain ⟨g, hg, rfl⟩ := Finset.mem_image.mp hU
    obtain ⟨a, ha, rfl⟩ := Finset.mem_image.mp hg
    obtain ⟨p, j, hj, rfl⟩ := (mem_windowMasks n v a).mp (List.mem_toFinset.mp ha)
    exact Finset.mem_image.mpr ⟨localTile 4 p j,
      (mem_localTiles 4 v _).mpr ⟨p, j, hj, rfl⟩, (tileMask_image start p j).symm⟩
  · intro hU
    obtain ⟨g, hg, rfl⟩ := Finset.mem_image.mp hU
    obtain ⟨p, j, hj, rfl⟩ := (mem_localTiles 4 v g).mp hg
    apply Finset.mem_image.mpr
    refine ⟨decode n (tileMask n p j), ?_, tileMask_image start p j⟩
    exact Finset.mem_image.mpr ⟨tileMask n p j,
      List.mem_toFinset.mpr ((mem_windowMasks n v _).mpr ⟨p, j, hj, rfl⟩), rfl⟩

theorem decode_stable {m n a : ℕ} (hmn : m ≤ n) (ha : a < 2 ^ m) :
    decode n a = decode m a := by
  ext i
  simp only [mem_decode]
  constructor
  · rintro ⟨_, hbit⟩
    have him : i < m := by
      by_contra h
      have hpow : 2 ^ m ≤ 2 ^ i := Nat.pow_le_pow_right (by decide) (by omega)
      have hfalse := Nat.testBit_lt_two_pow (ha.trans_le hpow)
      simp only [hbit] at hfalse
      cases hfalse
    exact ⟨him, hbit⟩
  · rintro ⟨him, hbit⟩
    exact ⟨him.trans_le hmn, hbit⟩

theorem decode_core {n : ℕ} (hn : 7 ≤ n) :
    decode n 120 = (windowCore 4).image Fin.val := by
  rw [decode_stable hn (by decide : 120 < 2 ^ 7)]
  decide +kernel

theorem core_image {n : ℕ} (hn : 7 ≤ n) (start : ZMod n) :
    (decode n 120).image (position start) = mappedCore start 4 := by
  rw [decode_core hn, Finset.image_image]
  rfl

theorem position_injOn {n : ℕ} [NeZero n] (start : ZMod n) :
    Set.InjOn (position start) (Finset.range n) := by
  intro a ha b hb hab
  change start + (a : ZMod n) = start + (b : ZMod n) at hab
  have h := congrArg ZMod.val (add_left_cancel hab)
  simpa only [ZMod.val_natCast, Nat.mod_eq_of_lt (Finset.mem_range.mp ha),
    Nat.mod_eq_of_lt (Finset.mem_range.mp hb)] using h

def shiftedWeights {n : ℕ} (start : ZMod n) (w : ℕ → ℕ) (x : ZMod n) : ℝ :=
  (w (x - start).val : ℝ)

theorem shiftedWeights_position {n : ℕ} [NeZero n] (start : ZMod n) (w : ℕ → ℕ)
    {x : ℕ} (hx : x ∈ Finset.range n) :
    shiftedWeights start w (position start x) = (w x : ℝ) := by
  simp [shiftedWeights, position, ZMod.val_natCast,
    Nat.mod_eq_of_lt (Finset.mem_range.mp hx)]

/-- The input word has seven starts; all masks use the actual modulo-n ground. -/
def windowCheck (n : ℕ) (v : Fin 7 → Finset (Fin 4)) (w : ℕ → ℕ) : Bool :=
  Mask.check n (windowMasks n v) 120 (Mask.submasks n 120)
    (Mask.submasks n (Mask.boundaryCode (windowMasks n v) 120)) w

theorem windowCheck_positive {n : ℕ} {v : Fin 7 → Finset (Fin 4)} {w : ℕ → ℕ}
    (hc : windowCheck n v w = true) : ∃ x ∈ decode n 120, 0 < w x :=
  of_decide_eq_true (Bool.and_eq_true_iff.mp hc).1

/-- A checked quotient mask row gives a weight certificate on the actual
window at any cyclic start. No global injection from naturals is assumed. -/
theorem checked_window_certificate {n : ℕ} [NeZero n] (hn : 7 ≤ n)
    (v : Fin 7 → Finset (Fin 4)) (start : ZMod n) (w : ℕ → ℕ)
    (hc : windowCheck n v w = true) :
    WeightCertificate (imageFamily (rawPosition start) (localTiles 4 v))
      (mappedCore start 4) (shiftedWeights start w) := by
  have hcore : 120 < 2 ^ n :=
    (by decide : 120 < 2 ^ 7).trans_le (Nat.pow_le_pow_right (by decide) hn)
  have hd := Mask.validDomains_submasks hcore (windowMasks_bounded v)
  have hcert := Mask.check_weightCertificate hd hc
  have hG : ∀ g ∈ decodedGenerators n (windowMasks n v), g ⊆ Finset.range n := by
    intro g hg
    obtain ⟨a, _, rfl⟩ := Finset.mem_image.mp hg
    exact decode_subset n a
  have h := hcert.image_on (Finset.range n) hG (decode_subset n 120)
    (position start) (position_injOn start) (shiftedWeights start w) (by
      intro x hx
      exact shiftedWeights_position start w (decode_subset n 120 hx))
  simpa only [decoded_windowMasks_image, core_image hn] using h

/-- The local quotient certificate proves abundance in the entire cyclic
family, with every distinct generated union counted once. -/
theorem windowCheck_global {n : ℕ} [NeZero n] (hn : 7 ≤ n)
    (word : ZMod n → Finset (Fin 4)) (start : ZMod n) (w : ℕ → ℕ)
    (hc : windowCheck n (windowSchedule word start 4) w = true) :
    ∃ x ∈ mappedCore start 4, Abundant (family (generatedTiles word)) x := by
  have hlocal := checked_window_certificate hn (windowSchedule word start 4) start w hc
  change WeightCertificate (mappedLocalTiles word start 4) (mappedCore start 4)
    (shiftedWeights start w) at hlocal
  have hglobal := hlocal.local_congr (local_generators_exact word start 4)
  apply abundant_of_total_imbalance (w := shiftedWeights start w)
  · intro x _
    exact Nat.cast_nonneg _
  · obtain ⟨x, hx, hpos⟩ := windowCheck_positive hc
    refine ⟨position start x, ?_, ?_⟩
    · rw [← core_image hn]
      exact Finset.mem_image_of_mem (position start) hx
    · rw [shiftedWeights_position start w (decode_subset n 120 hx)]
      exact_mod_cast hpos
  · exact weightCertificate_total hglobal

end FranklSmallCyclic.MaskWindows
