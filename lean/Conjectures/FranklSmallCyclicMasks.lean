module

public import Conjectures.FranklFCBitCode

/-! Exact tables of distinct generated unions, checked using natural-number
bit masks. Closure under adjoining one generator proves one inclusion;
an explicit covering union proves the other. Thus the table is complete
without enumerating all selections of generators. -/
@[expose] public section

namespace FranklSmallCyclic

open Frankl Frankl.FC.BitCode

def maskUnion : List ℕ → ℕ
  | [] => 0
  | a :: rest => a ||| maskUnion rest

def decodedGenerators (n : ℕ) (gs : List ℕ) : Finset (Finset ℕ) :=
  gs.toFinset.image (decode n)

def decodedTable (n : ℕ) (table : Finset ℕ) : Finset (Finset ℕ) :=
  table.image (decode n)

def coveringMasks (gs : List ℕ) (a : ℕ) : List ℕ :=
  gs.filter (fun g => decide (g &&& a = g))

abbrev ValidMaskTable (gs : List ℕ) (table : Finset ℕ) : Prop :=
  0 ∈ table ∧
    (∀ a ∈ table, ∀ g ∈ gs, a ||| g ∈ table) ∧
    ∀ a ∈ table, maskUnion (coveringMasks gs a) = a

def maskFrequency (table : Finset ℕ) (i : ℕ) : ℕ :=
  (table.filter (fun a => a.testBit i = true)).card

def maskCertificate (n : ℕ) (gs : List ℕ) (table : Finset ℕ) (i : ℕ) : Bool :=
  decide (table ⊆ domain n ∧ i < n ∧
    table.card ≤ 2 * maskFrequency table i ∧ ValidMaskTable gs table)

theorem decode_maskUnion (n : ℕ) (gs : List ℕ) :
    decode n (maskUnion gs) = generatedUnion (decodedGenerators n gs) := by
  induction gs with
  | nil => simp [maskUnion, decodedGenerators, generatedUnion, decode]
  | cons a rest ih =>
      simp only [maskUnion, decode_or, ih, decodedGenerators, List.toFinset_cons,
        Finset.image_insert, generatedUnion, Finset.biUnion_insert, id_eq]

theorem coveringMasks_subset (n : ℕ) (gs : List ℕ) (a : ℕ) :
    decodedGenerators n (coveringMasks gs a) ⊆ decodedGenerators n gs := by
  apply Finset.image_subset_image
  intro g hg
  simp only [List.mem_toFinset, coveringMasks, List.mem_filter] at hg ⊢
  exact hg.1

/-- The verified table is exactly the family of distinct generated unions. -/
theorem validMaskTable_eq {gs : List ℕ} {table : Finset ℕ}
    (n : ℕ) (hc : ValidMaskTable gs table) :
    decodedTable n table = generatedUnions (decodedGenerators n gs) := by
  obtain ⟨hzero, hjoin, hcover⟩ := hc
  apply Finset.Subset.antisymm
  · intro U hU
    obtain ⟨a, ha, rfl⟩ := Finset.mem_image.mp hU
    rw [← hcover a ha, decode_maskUnion]
    exact generatedUnion_mem_generatedUnions (coveringMasks_subset n gs a)
  · intro U hU
    obtain ⟨H, hHG, rfl⟩ := mem_generatedUnions.mp hU
    clear hU
    change generatedUnion H ∈ decodedTable n table
    revert hHG
    induction H using Finset.induction_on with
    | empty =>
        intro _
        have h := Finset.mem_image_of_mem (decode n) hzero
        simpa [decodedTable, decode] using h
    | @insert g H _ ih =>
        intro hHG
        obtain ⟨a, ha, rfl⟩ := Finset.mem_image.mp
          (hHG (Finset.mem_insert_self g H))
        have hH : H ⊆ decodedGenerators n gs :=
          fun b hb => hHG (Finset.mem_insert_of_mem hb)
        obtain ⟨u, hu, hude⟩ := Finset.mem_image.mp (ih hH)
        refine Finset.mem_image.mpr ⟨u ||| a,
          hjoin u hu a (List.mem_toFinset.mp ha), ?_⟩
        rw [decode_or, hude]
        simp [generatedUnion, Finset.union_comm]

theorem decodedTable_card (n : ℕ) (table : Finset ℕ) (h : table ⊆ domain n) :
    (decodedTable n table).card = table.card := by
  apply Finset.card_image_of_injOn
  intro a ha b hb hab
  exact decode_injOn n (h ha) (h hb) hab

theorem decodedTable_frequency (n : ℕ) (table : Finset ℕ)
    (h : table ⊆ domain n) (i : ℕ) (hi : i < n) :
    frequency (decodedTable n table) i = maskFrequency table i := by
  unfold frequency decodedTable maskFrequency
  rw [Finset.filter_image]
  simp only [mem_decode, hi, true_and]
  apply Finset.card_image_of_injOn
  intro a ha b hb hab
  exact decode_injOn n (h (Finset.mem_filter.mp ha).1)
    (h (Finset.mem_filter.mp hb).1) hab

theorem maskCertificate_abundant {n : ℕ} {gs : List ℕ} {table : Finset ℕ} {i : ℕ}
    (hc : maskCertificate n gs table i = true) :
    Abundant (generatedUnions (decodedGenerators n gs)) i := by
  obtain ⟨hbound, hi, hfreq, htable⟩ := of_decide_eq_true hc
  rw [← validMaskTable_eq n htable]
  change (decodedTable n table).card ≤ 2 * frequency (decodedTable n table) i
  rw [decodedTable_card n table hbound, decodedTable_frequency n table hbound i hi]
  exact hfreq

end FranklSmallCyclic
