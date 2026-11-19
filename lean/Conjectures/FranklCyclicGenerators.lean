module

public import Conjectures.FranklCyclicWords
public import Conjectures.FranklLocalEnumerationMap

/-! Actual generators on a cyclic ground set and exact local window data.
The locality theorem permits wrapped positions to coincide. -/
@[expose] public section

namespace FranklCyclic

open Finset

def shapeOffsets (j : Fin 4) : Finset (Fin 4) :=
  match j.val with
  | 0 => {0,1,2}
  | 1 => {0,1,3}
  | 2 => {0,2,3}
  | _ => {0,1,2,3}

def tile {n : ℕ} (p : ZMod n) (R : Finset (Fin 4)) : Finset (ZMod n) :=
  R.image (fun q => p+(q.val:ZMod n))

def shapeTile {n : ℕ} (p : ZMod n) (j : Fin 4) : Finset (ZMod n) :=
  tile p (shapeOffsets j)

def generatedTiles {n : ℕ} [NeZero n] (word : ZMod n → Finset (Fin 4)) :
    Finset (Finset (ZMod n)) :=
  univ.biUnion (fun p => (word p).image (shapeTile p))

theorem mem_generatedTiles {n : ℕ} [NeZero n] (word : ZMod n → Finset (Fin 4))
    (g : Finset (ZMod n)) :
    g ∈ generatedTiles word ↔ ∃ p, ∃ j ∈ word p, shapeTile p j=g := by
  simp only [generatedTiles,mem_biUnion,mem_univ,true_and,mem_image]

def localShift (w : ℕ) (p : Fin (w+3)) : Fin 4 ↪ Fin (w+6) where
  toFun q := ⟨p.val+q.val,by omega⟩
  inj' := by
    intro i j h
    apply Fin.ext
    exact Nat.add_left_cancel (congrArg Fin.val h)

def localTile (w : ℕ) (p : Fin (w+3)) (j : Fin 4) : Finset (Fin (w+6)) :=
  (shapeOffsets j).map (localShift w p)

def localTiles (w : ℕ) (word : Fin (w+3) → Finset (Fin 4)) :
    Finset (Finset (Fin (w+6))) :=
  univ.biUnion (fun p => (word p).image (localTile w p))

theorem mem_localTiles (w : ℕ) (word : Fin (w+3) → Finset (Fin 4))
    (g : Finset (Fin (w+6))) :
    g ∈ localTiles w word ↔ ∃ p, ∃ j ∈ word p, localTile w p j=g := by
  simp only [localTiles,mem_biUnion,mem_univ,true_and,mem_image]

def rawPosition {n : ℕ} (start : ZMod n) {m : ℕ} (q : Fin m) : ZMod n :=
  start+(q.val:ZMod n)

def windowSchedule {n : ℕ} (word : ZMod n → Finset (Fin 4))
    (start : ZMod n) (w : ℕ) : Fin (w+3) → Finset (Fin 4) :=
  fun p => word (rawPosition start p)

def mappedLocalTiles {n : ℕ} (word : ZMod n → Finset (Fin 4))
    (start : ZMod n) (w : ℕ) : Finset (Finset (ZMod n)) :=
  FranklLocal.imageFamily (rawPosition start) (localTiles w (windowSchedule word start w))

def mappedCore {n : ℕ} (start : ZMod n) (w : ℕ) : Finset (ZMod n) :=
  (windowCore w).image (rawPosition start)

theorem localTile_image {n : ℕ} (start : ZMod n) (w : ℕ) (p : Fin (w+3)) (j : Fin 4) :
    (localTile w p j).image (rawPosition start)=shapeTile (rawPosition start p) j := by
  simp [localTile,shapeTile,tile,Finset.map_eq_image,Finset.image_image,
    Function.comp_def,rawPosition,localShift,Nat.cast_add,add_assoc]

theorem mappedLocalTiles_subset {n : ℕ} [NeZero n]
    (word : ZMod n → Finset (Fin 4)) (start : ZMod n) (w : ℕ) :
    mappedLocalTiles word start w ⊆ generatedTiles word := by
  intro g hg
  obtain ⟨L,hL,rfl⟩ := mem_image.mp hg
  obtain ⟨p,j,hj,rfl⟩ := (mem_localTiles w (windowSchedule word start w) L).mp hL
  rw [localTile_image]
  exact (mem_generatedTiles word _).mpr ⟨rawPosition start p,j,hj,rfl⟩

/-- Every global generator touching the core starts at one of the w+3
local origins. This remains true for short cycles and coinciding positions. -/
theorem local_generators_exact {n : ℕ} [NeZero n]
    (word : ZMod n → Finset (Fin 4)) (start : ZMod n) (w : ℕ) :
    FranklLocal.localGenerators (generatedTiles word) (mappedCore start w)=
      FranklLocal.localGenerators (mappedLocalTiles word start w) (mappedCore start w) := by
  ext g
  simp only [FranklLocal.localGenerators,mem_filter]
  constructor
  · rintro ⟨hg,htouch⟩
    refine ⟨?_,htouch⟩
    obtain ⟨origin,j,hj,rfl⟩ := (mem_generatedTiles word g).mp hg
    have hex : ∃ x, x ∈ shapeTile origin j ∧ x ∈ mappedCore start w := by
      by_contra hnone
      apply htouch
      apply disjoint_left.mpr
      intro x hxg hxW
      exact hnone ⟨x,hxg,hxW⟩
    obtain ⟨x,hxg,hxW⟩ := hex
    obtain ⟨q,hq,hqx⟩ := mem_image.mp hxg
    obtain ⟨r,hr,hrx⟩ := mem_image.mp hxW
    have hrange := (mem_windowCore w r).mp hr
    have hqle : q.val ≤ r.val := by have hq4 := q.isLt; omega
    let p : Fin (w+3) := ⟨r.val-q.val,by omega⟩
    have hadd : (p.val:ZMod n)+(q.val:ZMod n)=(r.val:ZMod n) := by
      rw [← Nat.cast_add]
      exact congrArg (fun v : ℕ => (v:ZMod n)) (Nat.sub_add_cancel hqle)
    have horigin : origin=rawPosition start p := by
      have heq : origin+(q.val:ZMod n)=(start+(p.val:ZMod n))+(q.val:ZMod n) := by
        rw [add_assoc,hadd]
        exact hqx.trans hrx.symm
      exact add_right_cancel heq
    apply mem_image.mpr
    refine ⟨localTile w p j,?_,?_⟩
    · apply (mem_localTiles w (windowSchedule word start w) _).mpr
      refine ⟨p,j,?_,rfl⟩
      change j ∈ word (rawPosition start p)
      rw [← horigin]
      exact hj
    · rw [localTile_image,← horigin]
  · rintro ⟨hg,htouch⟩
    exact ⟨mappedLocalTiles_subset word start w hg,htouch⟩

/-- Every subset of four positions having at least three points is one of
the four shapes, possibly shifted one position to the right. -/
theorem normalize_offsets : ∀ R : Finset (Fin 4), 3 ≤ R.card →
    ∃ d : Fin 2, ∃ j : Fin 4,
      R.image Fin.val=(shapeOffsets j).image (fun q => d.val+q.val) := by
  decide +kernel

theorem tile_normal_form {n : ℕ} (p : ZMod n) (R : Finset (Fin 4))
    (hR : 3 ≤ R.card) : ∃ origin : ZMod n, ∃ j : Fin 4, tile p R=shapeTile origin j := by
  obtain ⟨d,j,hdj⟩ := normalize_offsets R hR
  refine ⟨p+(d.val:ZMod n),j,?_⟩
  have hmap : tile p R=(R.image Fin.val).image (fun q : ℕ => p+(q:ZMod n)) := by
    simp [tile,Finset.image_image,Function.comp_def]
  rw [hmap,hdj]
  simp [shapeTile,tile,Finset.image_image,Function.comp_def,Nat.cast_add,add_assoc]

def scheduleFor {n : ℕ} (G : Finset (Finset (ZMod n))) (p : ZMod n) : Finset (Fin 4) :=
  univ.filter (fun j => shapeTile p j ∈ G)

/-- Arbitrary generators of size at least three that fit in four consecutive
cyclic positions have an exact schedule in the four-shape alphabet. -/
theorem generatedTiles_scheduleFor {n : ℕ} [NeZero n]
    (G : Finset (Finset (ZMod n)))
    (hspan : ∀ g ∈ G, ∃ p : ZMod n, ∃ R : Finset (Fin 4), tile p R=g)
    (hsize : ∀ g ∈ G, 3 ≤ g.card) : generatedTiles (scheduleFor G)=G := by
  ext g
  constructor
  · intro hg
    obtain ⟨p,j,hj,rfl⟩ := (mem_generatedTiles (scheduleFor G) g).mp hg
    exact (mem_filter.mp hj).2
  · intro hg
    obtain ⟨p,R,rfl⟩ := hspan g hg
    have hR : 3 ≤ R.card := (hsize _ hg).trans (card_image_le (f:=fun q : Fin 4 => p+(q.val:ZMod n)))
    obtain ⟨origin,j,hj⟩ := tile_normal_form p R hR
    apply (mem_generatedTiles (scheduleFor G) _).mpr
    exact ⟨origin,j,mem_filter.mpr ⟨mem_univ _,by simpa only [← hj] using hg⟩,hj.symm⟩

end FranklCyclic
