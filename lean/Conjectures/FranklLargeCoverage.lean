module

public import Conjectures.FranklLargeNeighbors
public import Mathlib.Data.Fintype.BigOperators

/-! Exact enumeration of local covering selections. The disjoint two-element
incident pairs give three choices per point, hence `3^k` choices in total. -/

@[expose] public section

namespace Frankl.Large

open Finset

section FiberCounting

variable {A : Type*} [Fintype A] [DecidableEq A]
  {B : A → Type*} [∀ a, Fintype (B a)] [∀ a, DecidableEq (B a)]

def HitsEveryFiber (s : Finset (Σ a, B a)) : Prop := ∀ a, ∃ b, Sigma.mk a b ∈ s

def fiberSelectionsEquiv : {s : Finset (Σ a, B a) // HitsEveryFiber s} ≃
    ((a : A) → {t : Finset (B a) // t.Nonempty}) where
  toFun s a := ⟨univ.filter (fun b => Sigma.mk a b ∈ s.1), by
    obtain ⟨b, hb⟩ := s.2 a
    exact ⟨b, mem_filter.mpr ⟨mem_univ _, hb⟩⟩⟩
  invFun f := ⟨univ.sigma (fun a => (f a).1), by
    intro a
    obtain ⟨b, hb⟩ := (f a).2
    exact ⟨b, mem_sigma.mpr ⟨mem_univ a, hb⟩⟩⟩
  left_inv s := by
    apply Subtype.ext
    ext x
    rcases x with ⟨a, b⟩
    simp
  right_inv f := by
    funext a
    apply Subtype.ext
    ext b
    simp

theorem card_nonempty_finsets_of_two (X : Type*) [Fintype X] [DecidableEq X]
    (hX : Fintype.card X = 2) : Fintype.card {s : Finset X // s.Nonempty} = 3 := by
  rw [Fintype.card_congr (Equiv.subtypeEquivRight
    (fun s : Finset X => nonempty_iff_ne_empty))]
  rw [Fintype.card_subtype_compl (fun s : Finset X => s = ∅),
    Fintype.card_subtype_eq (∅ : Finset X), Fintype.card_finset, hX]

theorem card_hitsEveryFiber (hB : ∀ a, Fintype.card (B a) = 2) :
    Fintype.card {s : Finset (Σ a, B a) // HitsEveryFiber s} = 3 ^ Fintype.card A := by
  classical
  rw [Fintype.card_congr fiberSelectionsEquiv, Fintype.card_pi]
  simp_rw [card_nonempty_finsets_of_two _ (hB _)]
  simp

end FiberCounting

variable {α ι : Type*} [DecidableEq α] [Fintype ι] [DecidableEq ι]

abbrev NeighborOccurrence (G : ι → Finset α) (e : ι) :=
  Σ a : ↑(G e), ↑(otherIncident G e a.1)

def occurrenceToNeighbor (G : ι → Finset α) (e : ι)
    (p : NeighborOccurrence G e) : ↑(neighbors G e) :=
  ⟨p.2.1, by
    obtain ⟨hfe, haf⟩ := (mem_otherIncident G e p.1.1 p.2.1).mp p.2.2
    exact (mem_neighbors G e p.2.1).mpr
      ⟨hfe, p.1.1, mem_inter.mpr ⟨p.1.2, haf⟩⟩⟩

theorem occurrenceToNeighbor_injective (G : ι → Finset α) (e : ι)
    (hlinear : ∀ e f, e ≠ f → (G e ∩ G f).card ≤ 1) :
    Function.Injective (occurrenceToNeighbor G e) := by
  rintro ⟨a, f⟩ ⟨b, g⟩ h
  have hfg : (f : ι) = g := congrArg Subtype.val h
  obtain ⟨hfe, haf⟩ := (mem_otherIncident G e a.1 f.1).mp f.2
  obtain ⟨_, hbg⟩ := (mem_otherIncident G e b.1 g.1).mp g.2
  have hbf : b.1 ∈ G f.1 := by rw [hfg]; exact hbg
  have hab : a = b := Subtype.ext
    (card_le_one.mp (hlinear e f.1 hfe.symm) a.1 (mem_inter.mpr ⟨a.2, haf⟩)
      b.1 (mem_inter.mpr ⟨b.2, hbf⟩))
  subst b
  have hfg' : f = g := Subtype.ext hfg
  subst g
  rfl

theorem occurrenceToNeighbor_surjective (G : ι → Finset α) (e : ι) :
    Function.Surjective (occurrenceToNeighbor G e) := by
  intro f
  obtain ⟨hfe, a, ha⟩ := (mem_neighbors G e f.1).mp f.2
  obtain ⟨hae, haf⟩ := mem_inter.mp ha
  refine ⟨⟨⟨a, hae⟩, ⟨f.1, (mem_otherIncident G e a f.1).mpr ⟨hfe, haf⟩⟩⟩, ?_⟩
  rfl

noncomputable def occurrenceEquiv (G : ι → Finset α) (e : ι)
    (hlinear : ∀ e f, e ≠ f → (G e ∩ G f).card ≤ 1) :
    NeighborOccurrence G e ≃ ↑(neighbors G e) :=
  Equiv.ofBijective (occurrenceToNeighbor G e)
    ⟨occurrenceToNeighbor_injective G e hlinear, occurrenceToNeighbor_surjective G e⟩

theorem occurrence_generator_iff (G : ι → Finset α) (e : ι)
    (hlinear : ∀ e f, e ≠ f → (G e ∩ G f).card ≤ 1)
    (p : NeighborOccurrence G e) (a : ↑(G e)) :
    a.1 ∈ G (occurrenceToNeighbor G e p).1 ↔ p.1 = a := by
  obtain ⟨hfe, hpf⟩ := (mem_otherIncident G e p.1.1 p.2.1).mp p.2.2
  constructor
  · intro haf
    exact Subtype.ext
      (card_le_one.mp (hlinear e p.2.1 hfe.symm) p.1.1 (mem_inter.mpr ⟨p.1.2, hpf⟩)
        a.1 (mem_inter.mpr ⟨a.2, haf⟩))
  · intro ha
    subst a
    exact hpf

theorem coveringNeighbors_iff_hits (G : ι → Finset α) (e : ι)
    (hlinear : ∀ e f, e ≠ f → (G e ∩ G f).card ≤ 1)
    (n : Finset ↑(neighbors G e)) :
    n ∈ coveringNeighbors G e ↔
      HitsEveryFiber (n.map (occurrenceEquiv G e hlinear).symm.toEmbedding) := by
  let E := occurrenceEquiv G e hlinear
  simp only [coveringNeighbors, mem_filter, mem_univ, true_and]
  constructor
  · intro hcov a
    obtain ⟨f, hf, haf⟩ := (mem_generated G (localSelection G e n) a.1).mp (hcov a.2)
    obtain ⟨f', hf', hval⟩ := mem_map.mp hf
    change f'.1 = f at hval
    subst f
    let p := E.symm f'
    have hpin : a.1 ∈ G (occurrenceToNeighbor G e p).1 := by
      change a.1 ∈ G (E p).1
      simpa only [p, Equiv.apply_symm_apply] using haf
    have hpa := (occurrence_generator_iff G e hlinear p a).mp hpin
    have hps : p ∈ n.map E.symm.toEmbedding := mem_map_of_mem E.symm.toEmbedding hf'
    rcases p with ⟨a', b⟩
    change a' = a at hpa
    subst a
    exact ⟨b, hps⟩
  · intro hhit a ha
    obtain ⟨b, hb⟩ := hhit ⟨a, ha⟩
    let p : NeighborOccurrence G e := ⟨⟨a, ha⟩, b⟩
    have hp : E p ∈ n := by
      rw [mem_map_equiv] at hb
      exact hb
    have hloc : (E p).1 ∈ localSelection G e n :=
      mem_map_of_mem (Function.Embedding.subtype _) hp
    have hgen : a ∈ G (E p).1 :=
      (occurrence_generator_iff G e hlinear p ⟨a, ha⟩).mpr rfl
    exact (mem_generated G (localSelection G e n) a).mpr ⟨(E p).1, hloc, hgen⟩

/-- There are exactly three local choices at each point of a generator. -/
theorem card_coveringNeighbors (G : ι → Finset α) (k : ℕ)
    (hsize : ∀ e, (G e).card = k)
    (hregular : ∀ a, (incident G a).card = 3)
    (hlinear : ∀ e f, e ≠ f → (G e ∩ G f).card ≤ 1) (e : ι) :
    (coveringNeighbors G e).card = 3 ^ k := by
  classical
  let E := occurrenceEquiv G e hlinear
  let F : {n : Finset ↑(neighbors G e) // n ∈ coveringNeighbors G e} ≃
      {s : Finset (NeighborOccurrence G e) // HitsEveryFiber s} :=
    (Equiv.finsetCongr E.symm).subtypeEquiv (coveringNeighbors_iff_hits G e hlinear)
  calc
    (coveringNeighbors G e).card =
        Fintype.card {n : Finset ↑(neighbors G e) // n ∈ coveringNeighbors G e} :=
      (Fintype.card_coe _).symm
    _ = Fintype.card {s : Finset (NeighborOccurrence G e) // HitsEveryFiber s} :=
      Fintype.card_congr F
    _ = 3 ^ Fintype.card ↑(G e) := card_hitsEveryFiber (fun a => by
      rw [Fintype.card_coe, card_otherIncident G hregular a.2])
    _ = 3 ^ k := by rw [Fintype.card_coe, hsize e]

end Frankl.Large
