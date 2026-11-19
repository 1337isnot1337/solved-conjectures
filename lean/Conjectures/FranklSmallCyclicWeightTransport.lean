module

public import Conjectures.FranklLocalMaskEquivalence
public import Conjectures.FranklSmallCyclicWeights

/-! Finite witnesses transport literal cyclic window certificates.

The witness lists a map on every actual source support point. Its checker
verifies period bounds, row dimensions, map keys, injectivity, local-generator
and core images, and the target natural weights. The only separate proof
premise is the source window certificate already checked by Lean. -/
@[expose] public section

namespace FranklSmallCyclic.WeightTransport

open FranklLocal Frankl.FC.BitCode Weights

/-- Unlisted points map to zero. The witness checker requires every actual
source support point to be listed exactly once. -/
def pointMap (points : List (ℕ × ℕ)) (x : ℕ) : ℕ :=
  (points.lookup x).getD 0

def generators (n : ℕ) (entry : Entry) : Finset (Finset ℕ) :=
  decodedGenerators n (MaskWindows.windowMasks n (shapeWord entry))

def core (n : ℕ) : Finset ℕ := decode n 120

def localFamily (n : ℕ) (entry : Entry) : Finset (Finset ℕ) :=
  localGenerators (generators n entry) (core n)

def support (n : ℕ) (entry : Entry) : Finset ℕ :=
  core n ∪ unionOf (localFamily n entry)

/-- All conditions on an explicit point-map witness are finite. The target
weights are the supplied transported weights, which may differ from an older
candidate's weights for the same word. -/
abbrev Witness (n : ℕ) (source : Entry) (m : ℕ) (target : Entry)
    (points : List (ℕ × ℕ)) : Prop :=
  7 ≤ n ∧ 7 ≤ m ∧ WellFormed source ∧ WellFormed target ∧
    (points.map Prod.fst).Nodup ∧
    (points.map Prod.fst).toFinset = support n source ∧
    (∀ x ∈ support n source, ∀ y ∈ support n source,
      pointMap points x = pointMap points y → x = y) ∧
    imageFamily (pointMap points) (localFamily n source) = localFamily m target ∧
    (core n).image (pointMap points) = core m ∧
    (∀ x ∈ core n, siteWeights target (pointMap points x) = siteWeights source x)

def transportCheck (n : ℕ) (source : Entry) (m : ℕ) (target : Entry)
    (points : List (ℕ × ℕ)) : Bool :=
  decide (Witness n source m target points)

theorem transportCheck_iff {n m : ℕ} {source target : Entry}
    {points : List (ℕ × ℕ)} :
    transportCheck n source m target points = true ↔ Witness n source m target points :=
  ⟨of_decide_eq_true, decide_eq_true⟩

theorem transportCheck_periods {n m : ℕ} {source target : Entry}
    {points : List (ℕ × ℕ)} (hc : transportCheck n source m target points = true) :
    7 ≤ n ∧ 7 ≤ m :=
  ⟨(transportCheck_iff.mp hc).1, (transportCheck_iff.mp hc).2.1⟩

theorem transportCheck_wellFormed {n m : ℕ} {source target : Entry}
    {points : List (ℕ × ℕ)} (hc : transportCheck n source m target points = true) :
    WellFormed source ∧ WellFormed target :=
  ⟨(transportCheck_iff.mp hc).2.2.1, (transportCheck_iff.mp hc).2.2.2.1⟩

theorem transportCheck_keys {n m : ℕ} {source target : Entry}
    {points : List (ℕ × ℕ)} (hc : transportCheck n source m target points = true) :
    (points.map Prod.fst).Nodup ∧
      (points.map Prod.fst).toFinset = support n source :=
  ⟨(transportCheck_iff.mp hc).2.2.2.2.1, (transportCheck_iff.mp hc).2.2.2.2.2.1⟩

theorem transportCheck_injective {n m : ℕ} {source target : Entry}
    {points : List (ℕ × ℕ)} (hc : transportCheck n source m target points = true) :
    Set.InjOn (pointMap points) (↑(support n source) : Set ℕ) := by
  have h := (transportCheck_iff.mp hc).2.2.2.2.2.2.1
  intro x hx y hy hxy
  exact h x hx y hy hxy

theorem window_domains {n : ℕ} [NeZero n] (hn : 7 ≤ n) (entry : Entry) :
    Mask.ValidDomains n (MaskWindows.windowMasks n (shapeWord entry)) 120
      (Mask.submasks n 120)
      (Mask.submasks n (Mask.boundaryCode
        (MaskWindows.windowMasks n (shapeWord entry)) 120)) := by
  apply Mask.validDomains_submasks _ (MaskWindows.windowMasks_bounded (shapeWord entry))
  exact (by decide : 120 < 2 ^ 7).trans_le (Nat.pow_le_pow_right (by decide) hn)

/-- A checked finite map transfers the source arithmetic check to the actual
target quotient. Every set equality and weight agreement is inside hc. -/
theorem transportCheck_sound {n m : ℕ} {source target : Entry}
    {points : List (ℕ × ℕ)}
    (hc : transportCheck n source m target points = true)
    (hs : MaskWindows.windowCheck n (shapeWord source) (siteWeights source) = true) :
    MaskWindows.windowCheck m (shapeWord target) (siteWeights target) = true := by
  obtain ⟨hn, hm, _, _, _, _, hinj, hG, hW, hw⟩ := transportCheck_iff.mp hc
  let : NeZero n := ⟨by omega⟩
  let : NeZero m := ⟨by omega⟩
  apply Mask.check_image_local (window_domains hn source) (window_domains hm target)
    hs (pointMap points) ?_ hG hW hw
  intro x hx y hy hxy
  exact hinj x hx y hy hxy

theorem transportCheck_entryCheck {n m : ℕ} {source target : Entry}
    {points : List (ℕ × ℕ)}
    (hc : transportCheck n source m target points = true)
    (hs : MaskWindows.windowCheck n (shapeWord source) (siteWeights source) = true) :
    entryCheck m target = true :=
  Bool.and_eq_true_iff.mpr
    ⟨decide_eq_true (transportCheck_wellFormed hc).2, transportCheck_sound hc hs⟩

theorem transportCheck_of_batch {n m : ℕ} {source target : Entry}
    {points : List (ℕ × ℕ)} {entries : List Entry}
    (hc : transportCheck n source m target points = true)
    (hs : batchCheck n entries = true) (hsource : source ∈ entries) :
    MaskWindows.windowCheck m (shapeWord target) (siteWeights target) = true :=
  transportCheck_sound hc (batchCheck_entry hs hsource)

end FranklSmallCyclic.WeightTransport
