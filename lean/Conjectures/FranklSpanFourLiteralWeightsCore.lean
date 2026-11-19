module

public import Conjectures.FranklSmallCyclicWeights
public import Conjectures.FranklLocalMaskEquivalence

/-! Literal ten-point windows agree with the four-site local certificate.
The point map is injective only on the finite ten-point domain. These
generic statements do not assert that any numerical weight table passes. -/
@[expose] public section

namespace FranklSpanFour.LiteralWeights

open FranklLocal FranklCyclic Frankl.FC.BitCode FranklSmallCyclic

def point (i : ℕ) : Fin 10 := ⟨i % 10, Nat.mod_lt _ (by decide)⟩

theorem point_val_of_lt {i : ℕ} (hi : i < 10) : (point i).val = i := by
  simp only [point, Nat.mod_eq_of_lt hi]

theorem point_injOn : Set.InjOn point (Finset.range 10 : Set ℕ) := by
  intro a ha b hb hab
  have h := congrArg Fin.val hab
  simpa only [point_val_of_lt (Finset.mem_range.mp ha),
    point_val_of_lt (Finset.mem_range.mp hb)] using h

theorem point_core_image : (decode 10 120).image point = windowCore 4 := by
  decide +kernel

theorem tileMask_point_image (p : Fin 7) (j : Fin 4) :
    (decode 10 (MaskWindows.tileMask 10 p j)).image point = localTile 4 p j := by
  simp only [MaskWindows.tileMask_decode, localTile, Finset.map_eq_image,
    Finset.image_image]
  apply Finset.image_congr
  intro q _
  apply Fin.ext
  change ((p.val + q.val) % 10) % 10 = p.val + q.val
  have hlt : p.val + q.val < 10 := by omega
  simp only [Nat.mod_eq_of_lt hlt]

theorem decoded_windowMasks_image (v : Fin 7 → Finset (Fin 4)) :
    imageFamily point (decodedGenerators 10 (MaskWindows.windowMasks 10 v)) =
      localTiles 4 v := by
  ext U
  constructor
  · intro hU
    obtain ⟨g, hg, rfl⟩ := Finset.mem_image.mp hU
    obtain ⟨a, ha, rfl⟩ := Finset.mem_image.mp hg
    obtain ⟨p, j, hj, rfl⟩ := (MaskWindows.mem_windowMasks 10 v a).mp
      (List.mem_toFinset.mp ha)
    exact (mem_localTiles 4 v _).mpr
      ⟨p, j, hj, (tileMask_point_image p j).symm⟩
  · intro hU
    obtain ⟨p, j, hj, rfl⟩ := (mem_localTiles 4 v U).mp hU
    apply Finset.mem_image.mpr
    refine ⟨decode 10 (MaskWindows.tileMask 10 p j), ?_, tileMask_point_image p j⟩
    exact Finset.mem_image.mpr ⟨MaskWindows.tileMask 10 p j,
      List.mem_toFinset.mpr ((MaskWindows.mem_windowMasks 10 v _).mpr
        ⟨p, j, hj, rfl⟩), rfl⟩

theorem windowCheck_certificate {v : Fin 7 → Finset (Fin 4)} {w : ℕ → ℕ}
    (hc : MaskWindows.windowCheck 10 v w = true) :
    certificateCheck (localTiles 4 v) (windowCore 4)
      (fun i : Fin 10 => w i.val) = true := by
  have hd := Mask.validDomains_submasks (n := 10) (core := 120)
    (gs := MaskWindows.windowMasks 10 v) (by decide)
    (MaskWindows.windowMasks_bounded v)
  have hnat := Mask.check_certificateCheck hd hc
  have hG : ∀ g ∈ decodedGenerators 10 (MaskWindows.windowMasks 10 v),
      g ⊆ Finset.range 10 := by
    intro g hg
    obtain ⟨code, _, rfl⟩ := Finset.mem_image.mp hg
    exact decode_subset 10 code
  have h := certificateCheck_image_on hnat (Finset.range 10) hG
    (decode_subset 10 120) point point_injOn (fun i : Fin 10 => w i.val) (by
      intro x hx
      have hx10 : x < 10 := Finset.mem_range.mp ((decode_subset 10 120) hx)
      simp only [point_val_of_lt hx10])
  simpa only [decoded_windowMasks_image, point_core_image] using h

theorem entryCheck_certificate {e : Weights.Entry}
    (hc : Weights.entryCheck 10 e = true) :
    certificateCheck (localTiles 4 (Weights.shapeWord e)) (windowCore 4)
      (fun i : Fin 10 => Weights.siteWeights e i.val) = true :=
  windowCheck_certificate (Bool.and_eq_true_iff.mp hc).2

theorem batchCheck_certificate {rows : List Weights.Entry}
    (hc : Weights.batchCheck 10 rows = true)
    {e : Weights.Entry} (he : e ∈ rows) :
    certificateCheck (localTiles 4 (Weights.shapeWord e)) (windowCore 4)
      (fun i : Fin 10 => Weights.siteWeights e i.val) = true :=
  windowCheck_certificate (Weights.batchCheck_entry hc he)

end FranklSpanFour.LiteralWeights
