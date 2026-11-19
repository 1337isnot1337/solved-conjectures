module

public import Conjectures.FranklSmallCyclicWeightTransport

/-! A mask-level checker for literal window transport witnesses.

Generator images are compared as natural-number masks. Generic decoding
lemmas convert those computations into the frozen semantic witness, including
its exact finite support, injectivity, core image, and natural weights. -/
@[expose] public section

namespace FranklSmallCyclic.MaskTransport

open FranklLocal Frankl.FC.BitCode Weights

def maskPoints (n a : ℕ) : List ℕ :=
  (List.range n).filter (fun x => a.testBit x)

def pointsMask (xs : List ℕ) : ℕ := maskUnion (xs.map (fun x => 2 ^ x))

def renameMask (n : ℕ) (f : ℕ → ℕ) (a : ℕ) : ℕ :=
  pointsMask ((maskPoints n a).map f)

theorem maskPoints_toFinset (n a : ℕ) : (maskPoints n a).toFinset = decode n a := by
  ext x
  simp [maskPoints, decode]

theorem mem_maskPoints {n a x : ℕ} : x ∈ maskPoints n a ↔ x ∈ decode n a := by
  rw [← List.mem_toFinset, maskPoints_toFinset]

theorem decode_pointsMask (n : ℕ) (xs : List ℕ)
    (hbound : ∀ x ∈ xs, x < n) : decode n (pointsMask xs) = xs.toFinset := by
  ext x
  rw [pointsMask, MaskWindows.mem_decode_maskUnion]
  constructor
  · rintro ⟨a, ha, hx⟩
    obtain ⟨y, hy, rfl⟩ := List.mem_map.mp ha
    rw [MaskWindows.decode_two_pow (hbound y hy)] at hx
    obtain rfl := Finset.mem_singleton.mp hx
    exact List.mem_toFinset.mpr hy
  · intro hx
    have hx' := List.mem_toFinset.mp hx
    refine ⟨2 ^ x, List.mem_map.mpr ⟨x, hx', rfl⟩, ?_⟩
    rw [MaskWindows.decode_two_pow (hbound x hx')]
    exact Finset.mem_singleton_self x

theorem decode_renameMask (n m : ℕ) (f : ℕ → ℕ) (a : ℕ)
    (hbound : ∀ x ∈ decode n a, f x < m) :
    decode m (renameMask n f a) = (decode n a).image f := by
  have hmap : ∀ y ∈ (maskPoints n a).map f, y < m := by
    intro y hy
    obtain ⟨x, hx, rfl⟩ := List.mem_map.mp hy
    exact hbound x (mem_maskPoints.mp hx)
  rw [renameMask, decode_pointsMask m _ hmap]
  ext y
  simp only [List.mem_toFinset, List.mem_map, Finset.mem_image, mem_maskPoints]

theorem decodedGenerators_rename (n m : ℕ) (f : ℕ → ℕ) (gs : List ℕ)
    (hbound : ∀ a ∈ gs, ∀ x ∈ decode n a, f x < m) :
    decodedGenerators m (gs.map (renameMask n f)) = imageFamily f (decodedGenerators n gs) := by
  unfold decodedGenerators imageFamily
  have hmap : (gs.map (renameMask n f)).toFinset = gs.toFinset.image (renameMask n f) := by
    ext a
    simp only [List.mem_toFinset, List.mem_map, Finset.mem_image]
  rw [hmap, Finset.image_image, Finset.image_image]
  apply Finset.image_congr
  intro a ha
  exact decode_renameMask n m f a (hbound a (List.mem_toFinset.mp ha))

def localCodes (n : ℕ) (entry : Entry) : List ℕ :=
  Mask.localCodes (MaskWindows.windowMasks n (shapeWord entry)) 120

def supportCode (n : ℕ) (entry : Entry) : ℕ :=
  120 ||| maskUnion (localCodes n entry)

theorem decoded_localCodes {n : ℕ} [NeZero n] (entry : Entry) :
    decodedGenerators n (localCodes n entry) = WeightTransport.localFamily n entry :=
  Mask.decoded_localCodes n (MaskWindows.windowMasks n (shapeWord entry)) 120
    (MaskWindows.windowMasks_bounded (shapeWord entry))

theorem decode_supportCode {n : ℕ} [NeZero n] (entry : Entry) :
    decode n (supportCode n entry) = WeightTransport.support n entry := by
  calc
    decode n (supportCode n entry) =
        decode n 120 ∪ unionOf (decodedGenerators n (localCodes n entry)) := by
      rw [supportCode, decode_or, decode_maskUnion]
      rfl
    _ = WeightTransport.support n entry :=
      congrArg (fun G => decode n 120 ∪ unionOf G) (decoded_localCodes entry)

theorem decode_localCode_subset_support {n : ℕ} [NeZero n] (entry : Entry)
    {a : ℕ} (ha : a ∈ localCodes n entry) :
    decode n a ⊆ WeightTransport.support n entry := by
  intro x hx
  apply Finset.mem_union_right
  apply mem_unionOf.mpr
  refine ⟨decode n a, ?_, hx⟩
  rw [← decoded_localCodes entry]
  exact Finset.mem_image_of_mem (decode n) (List.mem_toFinset.mpr ha)

def pointKeys (points : List (ℕ × ℕ)) : List ℕ := points.map Prod.fst

/-- The image tests operate on mask codes and point lists. They contain no
enumeration of compatible patterns or nested decoded generator images. -/
abbrev Witness (n : ℕ) (source : Entry) (m : ℕ) (target : Entry)
    (points : List (ℕ × ℕ)) : Prop :=
  7 ≤ n ∧ 7 ≤ m ∧ WellFormed source ∧ WellFormed target ∧
    (pointKeys points).Nodup ∧
    (∀ x ∈ pointKeys points, x < n) ∧
    pointsMask (pointKeys points) = supportCode n source ∧
    ((pointKeys points).map (WeightTransport.pointMap points)).Nodup ∧
    (∀ x ∈ pointKeys points, WeightTransport.pointMap points x < m) ∧
    ((localCodes n source).map (renameMask n (WeightTransport.pointMap points))).toFinset =
      (localCodes m target).toFinset ∧
    renameMask n (WeightTransport.pointMap points) 120 = 120 ∧
    (∀ x ∈ maskPoints n 120,
      siteWeights target (WeightTransport.pointMap points x) = siteWeights source x)

def maskTransportCheck (n : ℕ) (source : Entry) (m : ℕ) (target : Entry)
    (points : List (ℕ × ℕ)) : Bool :=
  decide (Witness n source m target points)

theorem maskTransportCheck_iff {n m : ℕ} {source target : Entry}
    {points : List (ℕ × ℕ)} :
    maskTransportCheck n source m target points = true ↔ Witness n source m target points :=
  ⟨of_decide_eq_true, decide_eq_true⟩

/-- Every successful mask witness supplies all conditions of the frozen
semantic checker, with the same explicit point map and target weights. -/
theorem maskTransportCheck_sound {n m : ℕ} {source target : Entry}
    {points : List (ℕ × ℕ)}
    (hc : maskTransportCheck n source m target points = true) :
    WeightTransport.transportCheck n source m target points = true := by
  obtain ⟨hn, hm, hsource, htarget, hnodup, hkeysBound, hkeysCode,
    himagesNodup, htargetBound, hcodes, hcore, hweights⟩ := maskTransportCheck_iff.mp hc
  let : NeZero n := ⟨by omega⟩
  let : NeZero m := ⟨by omega⟩
  have hkeys : (pointKeys points).toFinset = WeightTransport.support n source := by
    calc
      (pointKeys points).toFinset = decode n (pointsMask (pointKeys points)) :=
        (decode_pointsMask n _ hkeysBound).symm
      _ = decode n (supportCode n source) := congrArg (decode n) hkeysCode
      _ = WeightTransport.support n source := decode_supportCode source
  have hbound : ∀ x ∈ WeightTransport.support n source,
      WeightTransport.pointMap points x < m := by
    intro x hx
    rw [← hkeys] at hx
    exact htargetBound x (List.mem_toFinset.mp hx)
  have hboundG : ∀ a ∈ localCodes n source, ∀ x ∈ decode n a,
      WeightTransport.pointMap points x < m := by
    intro a ha x hx
    exact hbound x (decode_localCode_subset_support source ha hx)
  have hboundW : ∀ x ∈ decode n 120, WeightTransport.pointMap points x < m := by
    intro x hx
    exact hbound x (Finset.mem_union_left _ hx)
  apply WeightTransport.transportCheck_iff.mpr
  refine ⟨hn, hm, hsource, htarget, hnodup, hkeys, ?_, ?_, ?_, ?_⟩
  · intro x hx y hy hxy
    rw [← hkeys] at hx hy
    exact List.inj_on_of_nodup_map himagesNodup
      (List.mem_toFinset.mp hx) (List.mem_toFinset.mp hy) hxy
  · calc
      imageFamily (WeightTransport.pointMap points) (WeightTransport.localFamily n source) =
          imageFamily (WeightTransport.pointMap points)
            (decodedGenerators n (localCodes n source)) := by
        rw [decoded_localCodes source]
      _ = decodedGenerators m ((localCodes n source).map
          (renameMask n (WeightTransport.pointMap points))) :=
        (decodedGenerators_rename n m _ _ hboundG).symm
      _ = decodedGenerators m (localCodes m target) :=
        congrArg (fun codes : Finset ℕ => codes.image (decode m)) hcodes
      _ = WeightTransport.localFamily m target := decoded_localCodes target
  · calc
      (WeightTransport.core n).image (WeightTransport.pointMap points) =
          decode m (renameMask n (WeightTransport.pointMap points) 120) :=
        (decode_renameMask n m _ 120 hboundW).symm
      _ = WeightTransport.core m := congrArg (decode m) hcore
  · intro x hx
    exact hweights x (mem_maskPoints.mpr hx)

theorem maskTransportCheck_window {n m : ℕ} {source target : Entry}
    {points : List (ℕ × ℕ)}
    (hc : maskTransportCheck n source m target points = true)
    (hs : MaskWindows.windowCheck n (shapeWord source) (siteWeights source) = true) :
    MaskWindows.windowCheck m (shapeWord target) (siteWeights target) = true :=
  WeightTransport.transportCheck_sound (maskTransportCheck_sound hc) hs

theorem maskTransportCheck_entryCheck {n m : ℕ} {source target : Entry}
    {points : List (ℕ × ℕ)}
    (hc : maskTransportCheck n source m target points = true)
    (hs : MaskWindows.windowCheck n (shapeWord source) (siteWeights source) = true) :
    entryCheck m target = true :=
  WeightTransport.transportCheck_entryCheck (maskTransportCheck_sound hc) hs

end FranklSmallCyclic.MaskTransport
