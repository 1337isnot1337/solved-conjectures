module

public import Mathlib.Algebra.Group.Fin.Basic
public import Mathlib.Data.Finset.Card
public import Mathlib.Data.Finset.Union
public import Mathlib.Data.Fintype.Powerset
public meta import Lean.Elab.Tactic.Omega

/-! Literal cyclic generators and their normalized four-shape encoding. -/
@[expose] public section

namespace FranklSpanFour

open scoped Fin.NatCast

/-- The four shapes with at least three sites and with leftmost site zero. -/
def shapeOffsets (t : Fin 4) : Finset (Fin 4) :=
  match t.val with
  | 0 => {0, 1, 2}
  | 1 => {0, 1, 3}
  | 2 => {0, 2, 3}
  | _ => {0, 1, 2, 3}

theorem shapeOffsets_zero : ∀ t : Fin 4, 0 ∈ shapeOffsets t := by decide

theorem shapeOffsets_injective : Function.Injective shapeOffsets := by decide

theorem shapeOffsets_card : ∀ t : Fin 4,
    (shapeOffsets t).card = if t = 3 then 4 else 3 := by decide

theorem large_four_subset : ∀ S : Finset (Fin 4), 3 ≤ S.card →
    S = {1, 2, 3} ∨ ∃ t : Fin 4, S = shapeOffsets t := by decide

section Cycle

variable {n : ℕ} [NeZero n]

def cyclicPoint (s : Fin n) (k : ℕ) : Fin n := s + (k : Fin n)

def site (s : Fin n) (i : Fin 4) : Fin n := cyclicPoint s i.val

def cyclicTile (s : Fin n) (t : Fin 4) : Finset (Fin n) :=
  (shapeOffsets t).image (site s)

def fourSites (s : Fin n) : Finset (Fin n) :=
  (Finset.univ : Finset (Fin 4)).image (site s)

def CyclicSpanFour (G : Finset (Finset (Fin n))) : Prop :=
  ∀ g ∈ G, ∃ s : Fin n, g ⊆ fourSites s

/-- A letter records precisely which normalized tiles start at a site. -/
def normalizedWord (G : Finset (Finset (Fin n))) (s : Fin n) : Finset (Fin 4) :=
  Finset.univ.filter (fun t => cyclicTile s t ∈ G)

@[simp] theorem cyclicPoint_zero (s : Fin n) : cyclicPoint s 0 = s := by
  simp [cyclicPoint]

theorem cyclicPoint_add (s : Fin n) (a b : ℕ) :
    cyclicPoint (cyclicPoint s a) b = cyclicPoint s (a + b) := by
  simp [cyclicPoint, Nat.cast_add, add_assoc]

theorem shifted_threeSites (s : Fin n) :
    ({1, 2, 3} : Finset (Fin 4)).image (site s) =
      cyclicTile (cyclicPoint s 1) 0 := by
  simp [cyclicTile, shapeOffsets, site, cyclicPoint_add]

theorem normalize_subset {s : Fin n} {g : Finset (Fin n)}
    (hsub : g ⊆ fourSites s) (hcard : 3 ≤ g.card) :
    ∃ s' : Fin n, ∃ t : Fin 4, g = cyclicTile s' t := by
  let S := (Finset.univ : Finset (Fin 4)).filter (fun i => site s i ∈ g)
  have himage : S.image (site s) = g := by
    apply Finset.Subset.antisymm
    · intro x hx
      obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp hx
      exact (Finset.mem_filter.mp hi).2
    · intro x hx
      obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp (hsub hx)
      exact Finset.mem_image.mpr ⟨i, Finset.mem_filter.mpr ⟨hi, hx⟩, rfl⟩
  have hS : 3 ≤ S.card := by
    rw [← himage] at hcard
    exact hcard.trans Finset.card_image_le
  rcases large_four_subset S hS with hshift | ⟨t, ht⟩
  · refine ⟨cyclicPoint s 1, 0, ?_⟩
    rw [← himage, hshift, shifted_threeSites]
  · exact ⟨s, t, by rw [← himage, ht]; rfl⟩

theorem normalize_generator {G : Finset (Finset (Fin n))}
    (hspan : CyclicSpanFour G) (hlarge : ∀ g ∈ G, 3 ≤ g.card)
    {g : Finset (Fin n)} (hg : g ∈ G) :
    ∃ s : Fin n, ∃ t : Fin 4, g = cyclicTile s t := by
  obtain ⟨s, hsub⟩ := hspan g hg
  exact normalize_subset hsub (hlarge g hg)

theorem site_injective (hn : 4 ≤ n) (s : Fin n) : Function.Injective (site s) := by
  intro i j hij
  change s + (i.val : Fin n) = s + (j.val : Fin n) at hij
  have hcast := congrArg Fin.val (add_left_cancel hij)
  simp only [Fin.val_natCast] at hcast
  rw [Nat.mod_eq_of_lt (by omega : i.val < n),
    Nat.mod_eq_of_lt (by omega : j.val < n)] at hcast
  exact Fin.ext hcast

theorem cyclicTile_card (hn : 4 ≤ n) (s : Fin n) (t : Fin 4) :
    (cyclicTile s t).card = if t = 3 then 4 else 3 := by
  rw [cyclicTile, Finset.card_image_of_injective _ (site_injective hn s)]
  exact shapeOffsets_card t

theorem cyclicTile_start_mem (s : Fin n) (t : Fin 4) : s ∈ cyclicTile s t := by
  exact Finset.mem_image.mpr ⟨0, shapeOffsets_zero t, by simp [site]⟩

theorem cyclicTile_injective (hn : 7 ≤ n) :
    Function.Injective (fun p : Fin n × Fin 4 => cyclicTile p.1 p.2) := by
  rintro ⟨s, t⟩ ⟨s', t'⟩ h
  change cyclicTile s t = cyclicTile s' t' at h
  have hs : s ∈ cyclicTile s' t' := by rw [← h]; exact cyclicTile_start_mem s t
  have hs' : s' ∈ cyclicTile s t := by rw [h]; exact cyclicTile_start_mem s' t'
  obtain ⟨a, _, has⟩ := Finset.mem_image.mp hs
  obtain ⟨b, _, hbs⟩ := Finset.mem_image.mp hs'
  change cyclicPoint s' a.val = s at has
  change cyclicPoint s b.val = s' at hbs
  have hsum : cyclicPoint s (b.val + a.val) = s := by
    rw [← cyclicPoint_add, hbs, has]
  have hcast : ((b.val + a.val : ℕ) : Fin n) = 0 := by
    apply add_left_cancel (a := s)
    simpa only [cyclicPoint, add_zero] using hsum
  have hval := congrArg Fin.val hcast
  simp only [Fin.val_natCast, Fin.val_zero] at hval
  rw [Nat.mod_eq_of_lt (by omega : b.val + a.val < n)] at hval
  have hb : b.val = 0 := by omega
  have heq : s = s' := by simpa only [hb, cyclicPoint_zero] using hbs
  rw [← heq] at h ⊢
  have hshape : shapeOffsets t = shapeOffsets t' :=
    (Finset.image_injective (site_injective (by omega) s)) h
  exact Prod.ext rfl (shapeOffsets_injective hshape)

@[simp] theorem mem_normalizedWord {G : Finset (Finset (Fin n))}
    {s : Fin n} {t : Fin 4} : t ∈ normalizedWord G s ↔ cyclicTile s t ∈ G := by
  simp [normalizedWord]

theorem normalizedWord_recovers {G : Finset (Finset (Fin n))}
    (hspan : CyclicSpanFour G) (hlarge : ∀ g ∈ G, 3 ≤ g.card) :
    Finset.univ.biUnion (fun s : Fin n =>
      (normalizedWord G s).image (cyclicTile s)) = G := by
  ext g
  constructor
  · intro hg
    obtain ⟨s, _, hs⟩ := Finset.mem_biUnion.mp hg
    obtain ⟨t, ht, rfl⟩ := Finset.mem_image.mp hs
    exact mem_normalizedWord.mp ht
  · intro hg
    obtain ⟨s, t, rfl⟩ := normalize_generator hspan hlarge hg
    exact Finset.mem_biUnion.mpr ⟨s, Finset.mem_univ _,
      Finset.mem_image.mpr ⟨t, mem_normalizedWord.mpr hg, rfl⟩⟩

theorem normalizedWord_unique (hn : 7 ≤ n)
    {G : Finset (Finset (Fin n))} {s s' : Fin n} {t t' : Fin 4}
    (_ht : t ∈ normalizedWord G s) (_ht' : t' ∈ normalizedWord G s')
    (h : cyclicTile s t = cyclicTile s' t') : s = s' ∧ t = t' := by
  exact Prod.mk.inj (cyclicTile_injective hn h)

end Cycle

end FranklSpanFour
