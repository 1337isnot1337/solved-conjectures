module

public import Conjectures.FranklSpanFourResidualExtensions
public import Conjectures.FranklLocalMaskDomains
public import Conjectures.FranklLocalMaskEquivalence

/-! Exact literal eleven-point mask certificates for the residual tail.
Reconstructed candidate; no earlier source-hash correspondence is assumed. -/
@[expose] public section

namespace FranklSpanFour.Assembly.ResidualTail

open FranklLocal FranklCyclic Frankl.FC.BitCode FranklSmallCyclic

structure Entry where
  row : List ℕ
  generators : List ℕ
  weights : List ℕ
  deriving DecidableEq, Inhabited

def entryWord (e : Entry) : Word 8 := decodeWindow 8 e.row

def point (i : ℕ) : Fin 11 := ⟨i % 11, Nat.mod_lt _ (by decide)⟩

theorem point_val_of_lt {i : ℕ} (hi : i < 11) : (point i).val = i := by
  simp only [point, Nat.mod_eq_of_lt hi]

theorem point_injOn : Set.InjOn point (Finset.range 11 : Set ℕ) := by
  intro a ha b hb hab
  have h := congrArg Fin.val hab
  simpa only [point_val_of_lt (Finset.mem_range.mp ha),
    point_val_of_lt (Finset.mem_range.mp hb)] using h

theorem point_core_image : (decode 11 248).image point = windowCore 5 := by
  decide +kernel

def weightAt (weights : List ℕ) (i : ℕ) : ℕ :=
  if 3 ≤ i ∧ i < 8 then weights.getD (i - 3) 0 else 0

def siteWeights (e : Entry) (i : Fin 11) : ℕ := weightAt e.weights i.val

abbrev Metadata (e : Entry) : Prop :=
  e.row.length = 8 ∧ e.weights.length = 5 ∧
    encodeWindow (entryWord e) = e.row ∧
    (∀ g ∈ e.generators, g < 2 ^ 11) ∧
    imageFamily point (decodedGenerators 11 e.generators) = localTiles 5 (entryWord e)

def metadataCheck (e : Entry) : Bool := decide (Metadata e)

def maskCheck (e : Entry) : Bool :=
  Mask.check 11 e.generators 248 (Mask.submasks 11 248)
    (Mask.submasks 11 (Mask.boundaryCode e.generators 248)) (weightAt e.weights)

def entryCheck (e : Entry) : Bool := metadataCheck e && maskCheck e

theorem entryCheck_metadata {e : Entry} (hc : entryCheck e = true) : Metadata e :=
  of_decide_eq_true (Bool.and_eq_true_iff.mp hc).1

theorem entryCheck_certificate {e : Entry} (hc : entryCheck e = true) :
    certificateCheck (localTiles 5 (entryWord e)) (windowCore 5) (siteWeights e) = true := by
  have hm := entryCheck_metadata hc
  have hd := Mask.validDomains_submasks (n := 11) (core := 248)
    (gs := e.generators) (by decide) hm.2.2.2.1
  have hmask : Mask.check 11 e.generators 248 (Mask.submasks 11 248)
      (Mask.submasks 11 (Mask.boundaryCode e.generators 248)) (weightAt e.weights) = true :=
    (Bool.and_eq_true_iff.mp hc).2
  have hnat := Mask.check_certificateCheck hd hmask
  have hG : ∀ g ∈ decodedGenerators 11 e.generators, g ⊆ Finset.range 11 := by
    intro g hg
    change g ∈ e.generators.toFinset.image (decode 11) at hg
    obtain ⟨code, _, rfl⟩ := Finset.mem_image.mp hg
    exact decode_subset 11 code
  have h := certificateCheck_image_on hnat (Finset.range 11) hG
    (decode_subset 11 248) point point_injOn (siteWeights e) (by
      intro x hx
      have hx11 : x < 11 := Finset.mem_range.mp ((decode_subset 11 248) hx)
      simp only [siteWeights, point_val_of_lt hx11])
  simpa only [hm.2.2.2.2, point_core_image] using h

end FranklSpanFour.Assembly.ResidualTail
