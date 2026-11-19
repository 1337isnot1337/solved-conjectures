module

public import Conjectures.FranklSpanFourCyclicInjective
public import Conjectures.FranklSpanFourIrredundant

/-! Cardinal admissibility conditions and their transport to literal windows. -/
@[expose] public section

namespace FranklSpanFour

open FranklLocal FranklCyclic

variable {α β : Type*} [DecidableEq α] [DecidableEq β]

def TripleSparse (G : Finset (Finset α)) : Prop :=
  ∀ x, (G.filter (fun A => A.card = 3 ∧ x ∈ A)).card ≤ 2

def FourSparse (G : Finset (Finset α)) : Prop :=
  ∀ Q ∈ G, Q.card = 4 → (G.filter (fun A => A.card = 3 ∧ A ⊆ Q)).card ≤ 1

def AdmissibleGenerators (G : Finset (Finset α)) : Prop := TripleSparse G ∧ FourSparse G

instance [Fintype α] (G : Finset (Finset α)) : Decidable (TripleSparse G) := by
  unfold TripleSparse
  infer_instance

instance (G : Finset (Finset α)) : Decidable (FourSparse G) := by
  unfold FourSparse
  infer_instance

instance [Fintype α] (G : Finset (Finset α)) : Decidable (AdmissibleGenerators G) := by
  unfold AdmissibleGenerators
  infer_instance

/-- This explicit premise is discharged by the Vaughan theorem in the final module. -/
def ThreeTriplesShortcut (G : Finset (Finset α)) : Prop :=
  ∀ (A B C : Finset α) (p : α), A ∈ G → B ∈ G → C ∈ G →
    A.card = 3 → B.card = 3 → C.card = 3 → A ≠ B → A ≠ C → B ≠ C →
    p ∈ A → p ∈ B → p ∈ C → ∃ x, Abundant (family G) x

theorem tripleSparse_of_shortcut {G : Finset (Finset α)}
    (hV : ThreeTriplesShortcut G) (hno : ∀ x, ¬ Abundant (family G) x) :
    TripleSparse G := by
  intro p
  by_contra hcard
  have hlt : 2 < (G.filter (fun A => A.card = 3 ∧ p ∈ A)).card := by omega
  obtain ⟨A, hA, B, hB, C, hC, hAB, hAC, hBC⟩ := Finset.two_lt_card.mp hlt
  obtain ⟨hAG, hAc, hpA⟩ := Finset.mem_filter.mp hA
  obtain ⟨hBG, hBc, hpB⟩ := Finset.mem_filter.mp hB
  obtain ⟨hCG, hCc, hpC⟩ := Finset.mem_filter.mp hC
  obtain ⟨x, hx⟩ := hV A B C p hAG hBG hCG hAc hBc hCc hAB hAC hBC hpA hpB hpC
  exact hno x hx

theorem fourSparse_of_needed {G : Finset (Finset α)}
    (hneed : NeededGenerators G) : FourSparse G := by
  intro Q hQ hQc
  apply Finset.card_le_one.mpr
  intro A hA B hB
  obtain ⟨hAG, hAc, hAQ⟩ := Finset.mem_filter.mp hA
  obtain ⟨hBG, hBc, hBQ⟩ := Finset.mem_filter.mp hB
  exact needed_four_contains_at_most_one_triple hneed hAG hBG hQ hAc hBc hQc hAQ hBQ

omit [DecidableEq α] in
theorem card_filter_le_of_image {S : Finset α} {T : Finset β}
    (f : α → β) (hmap : ∀ a ∈ S, f a ∈ T) (hinj : Set.InjOn f (S : Set α))
    (P : α → Prop) (Q : β → Prop) [DecidablePred P] [DecidablePred Q]
    (hPQ : ∀ a ∈ S, P a → Q (f a)) :
    (S.filter P).card ≤ (T.filter Q).card := by
  have hinj' : Set.InjOn f (S.filter P : Set α) := by
    intro a ha b hb hab
    exact hinj (Finset.mem_filter.mp ha).1 (Finset.mem_filter.mp hb).1 hab
  have hsub : (S.filter P).image f ⊆ T.filter Q := by
    intro b hb
    obtain ⟨a, ha, rfl⟩ := Finset.mem_image.mp hb
    obtain ⟨haS, haP⟩ := Finset.mem_filter.mp ha
    exact Finset.mem_filter.mpr ⟨hmap a haS, hPQ a haS haP⟩
  calc
    (S.filter P).card = ((S.filter P).image f).card :=
      (Finset.card_image_of_injOn hinj').symm
    _ ≤ (T.filter Q).card := Finset.card_le_card hsub

/-- Only injectivity on the selected generators is needed here. The point
map itself may identify boundary positions. -/
theorem admissible_pullback {H : Finset (Finset α)} {G : Finset (Finset β)}
    (f : α → β) (hmap : ∀ A ∈ H, A.image f ∈ G)
    (hinj : Set.InjOn (Finset.image f) (H : Set (Finset α)))
    (hcard : ∀ A ∈ H, (A.image f).card = A.card)
    (hG : AdmissibleGenerators G) : AdmissibleGenerators H := by
  constructor
  · intro x
    have hcount := card_filter_le_of_image (Finset.image f) hmap hinj
      (fun A => A.card = 3 ∧ x ∈ A) (fun A => A.card = 3 ∧ f x ∈ A) (by
        intro A hA hP
        exact ⟨(hcard A hA).trans hP.1, Finset.mem_image_of_mem f hP.2⟩)
    exact hcount.trans (hG.1 (f x))
  · intro Q hQ hQc
    have hcount := card_filter_le_of_image (Finset.image f) hmap hinj
      (fun A => A.card = 3 ∧ A ⊆ Q) (fun A => A.card = 3 ∧ A ⊆ Q.image f) (by
        intro A hA hP
        exact ⟨(hcard A hA).trans hP.1, Finset.image_subset_image hP.2⟩)
    exact hcount.trans (hG.2 (Q.image f) (hmap Q hQ) ((hcard Q hQ).trans hQc))

def windowAdmissibleCheck (w : ℕ) (v : Fin (w + 3) → Finset (Fin 4)) : Bool :=
  decide (AdmissibleGenerators (localTiles w v))

@[simp] theorem windowAdmissibleCheck_eq_true (w : ℕ)
    (v : Fin (w + 3) → Finset (Fin 4)) :
    windowAdmissibleCheck w v = true ↔ AdmissibleGenerators (localTiles w v) := by
  simp [windowAdmissibleCheck]

section Cycle

variable {n : ℕ} [NeZero n]

theorem window_admissible_of_global (hn : 7 ≤ n) (w : ℕ) (hstarts : w + 3 ≤ n)
    (word : ZMod n → Finset (Fin 4)) (start : ZMod n)
    (hG : AdmissibleGenerators (generatedTiles word)) :
    AdmissibleGenerators (localTiles w (windowSchedule word start w)) := by
  apply admissible_pullback (rawPosition start)
  · intro A hA
    exact mappedLocalTiles_subset word start w
      (Finset.mem_image_of_mem (Finset.image (rawPosition start)) hA)
  · exact local_tiles_image_injOn hn w hstarts (windowSchedule word start w) start
  · intro A hA
    obtain ⟨p, t, _, rfl⟩ := (mem_localTiles w (windowSchedule word start w) A).mp hA
    exact local_tile_image_card (by omega) start w p t
  · exact hG

theorem literal_six_window_admissible_of_shortcut (hn : 7 ≤ n)
    (word : ZMod n → Finset (Fin 4)) (start : ZMod n)
    (hV : ThreeTriplesShortcut (generatedTiles word))
    (hneed : NeededGenerators (generatedTiles word))
    (hno : ∀ x, ¬ Abundant (family (generatedTiles word)) x) :
    AdmissibleGenerators (localTiles 3 (windowSchedule word start 3)) :=
  window_admissible_of_global hn 3 (by omega) word start
    ⟨tripleSparse_of_shortcut hV hno, fourSparse_of_needed hneed⟩

end Cycle

end FranklSpanFour
