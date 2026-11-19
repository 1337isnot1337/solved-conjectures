module

public import Conjectures.FranklCyclicGenerators

/-! Uniqueness of normalized tile occurrences in the shared cyclic API. -/
@[expose] public section

namespace FranklSpanFour

open FranklCyclic

theorem cyclic_shape_zero : ∀ t : Fin 4, 0 ∈ FranklCyclic.shapeOffsets t := by
  decide +kernel

theorem cyclic_shapes_injective : Function.Injective FranklCyclic.shapeOffsets := by
  decide +kernel

variable {n : ℕ}

theorem cyclic_tile_site_injective (hn : 4 ≤ n) (s : ZMod n) :
    Function.Injective (fun i : Fin 4 => s + (i.val : ZMod n)) := by
  intro i j hij
  have hval := congrArg ZMod.val (add_left_cancel hij)
  apply Fin.ext
  simpa only [ZMod.val_natCast_of_lt (lt_of_lt_of_le i.isLt hn),
    ZMod.val_natCast_of_lt (lt_of_lt_of_le j.isLt hn)] using hval

theorem cyclic_tile_start_mem (s : ZMod n) (t : Fin 4) : s ∈ shapeTile s t := by
  exact Finset.mem_image.mpr ⟨0, cyclic_shape_zero t, by simp⟩

/-- No distinct start/type pairs represent the same normalized generator
on a cycle of at least seven sites. -/
theorem cyclic_tile_occurrence_injective (hn : 7 ≤ n) :
    Function.Injective (fun p : ZMod n × Fin 4 => shapeTile p.1 p.2) := by
  rintro ⟨s, t⟩ ⟨s', t'⟩ h
  change shapeTile s t = shapeTile s' t' at h
  have hs : s ∈ shapeTile s' t' := by rw [← h]; exact cyclic_tile_start_mem s t
  have hs' : s' ∈ shapeTile s t := by rw [h]; exact cyclic_tile_start_mem s' t'
  obtain ⟨a, _, has⟩ := Finset.mem_image.mp hs
  obtain ⟨b, _, hbs⟩ := Finset.mem_image.mp hs'
  change s' + (a.val : ZMod n) = s at has
  change s + (b.val : ZMod n) = s' at hbs
  have hsum : s + ((b.val + a.val : ℕ) : ZMod n) = s := by
    rw [Nat.cast_add, ← add_assoc, hbs, has]
  have hcast : ((b.val + a.val : ℕ) : ZMod n) = 0 := by
    apply add_left_cancel (a := s)
    simpa only [add_zero] using hsum
  have hval := congrArg ZMod.val hcast
  rw [ZMod.val_natCast_of_lt (by omega : b.val + a.val < n)] at hval
  have hb : b.val = 0 := by simp only [ZMod.val_zero] at hval; omega
  have heq : s = s' := by simpa only [hb, Nat.cast_zero, add_zero] using hbs
  rw [← heq] at h ⊢
  have hshape : FranklCyclic.shapeOffsets t = FranklCyclic.shapeOffsets t' :=
    (Finset.image_injective (cyclic_tile_site_injective (by omega) s)) h
  exact Prod.ext rfl (cyclic_shapes_injective hshape)

theorem cyclic_tile_card (hn : 4 ≤ n) (s : ZMod n) (t : Fin 4) :
    (shapeTile s t).card = (FranklCyclic.shapeOffsets t).card := by
  exact Finset.card_image_of_injective _ (cyclic_tile_site_injective hn s)

theorem local_tile_image_card (hn : 4 ≤ n) (start : ZMod n) (w : ℕ)
    (p : Fin (w + 3)) (t : Fin 4) :
    ((localTile w p t).image (rawPosition start)).card = (localTile w p t).card := by
  rw [localTile_image, cyclic_tile_card hn]
  exact (Finset.card_map (localShift w p)).symm

/-- A window may have repeated boundary points while its generator images
are still distinct: only the starts and normalized types need to be distinct. -/
theorem local_tiles_image_injOn (hn : 7 ≤ n) (w : ℕ) (hstarts : w + 3 ≤ n)
    (v : Fin (w + 3) → Finset (Fin 4)) (start : ZMod n) :
    Set.InjOn (Finset.image (rawPosition start))
      (localTiles w v : Set (Finset (Fin (w + 6)))) := by
  intro A hA B hB heq
  obtain ⟨p, t, _, rfl⟩ := (mem_localTiles w v A).mp hA
  obtain ⟨p', t', _, rfl⟩ := (mem_localTiles w v B).mp hB
  rw [localTile_image, localTile_image] at heq
  obtain ⟨hp, ht⟩ := Prod.mk.inj (cyclic_tile_occurrence_injective hn heq)
  have hp' : p = p' := (positionEmbedding start hstarts).injective hp
  rw [hp', ht]

end FranklSpanFour
