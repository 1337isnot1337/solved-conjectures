import Conjectures.RectangleCells
import Conjectures.RectanglePartitionBounds
import Mathlib.Data.Multiset.Powerset
import Mathlib.Data.Finset.Prod
import Mathlib.Algebra.BigOperators.Group.Multiset.Basic

/-! Finite enumeration of all grid-tileable rectangle multisets and an
injection from independent cumulative width partitions into that set. -/

namespace RectanglePartitions

def blockTypes (N : ℕ) : Finset BlockType := Finset.range (N+1) ×ˢ Finset.range (N+1)

noncomputable def blockCandidates (N : ℕ) : Finset (Multiset BlockType) :=
  (N • (blockTypes N).val).powerset.toFinset

theorem card_le_totalArea (blocks : Multiset BlockType)
    (hpos : ∀ b ∈ blocks, 0 < b.1 ∧ b.1 ≤ b.2) : blocks.card ≤ totalArea blocks := by
  have hh := Multiset.card_nsmul_le_sum (s:=blocks.map blockArea) (a:=1) (by
    intro n hn
    obtain ⟨b,hb,rfl⟩ := Multiset.mem_map.mp hn
    obtain ⟨hp,hle⟩ := hpos b hb
    dsimp [blockArea]
    exact Nat.mul_pos hp (lt_of_lt_of_le hp hle))
  simpa only [Multiset.card_map,nsmul_eq_mul,Nat.cast_id,mul_one,totalArea] using hh

theorem mem_blockCandidates (N : ℕ) (blocks : Multiset BlockType)
    (hpos : ∀ b ∈ blocks, 0 < b.1 ∧ b.1 ≤ b.2) (harea : totalArea blocks=N) :
    blocks ∈ blockCandidates N := by
  apply Multiset.mem_toFinset.mpr
  apply Multiset.mem_powerset.mpr
  apply Multiset.le_iff_count.mpr
  intro b
  by_cases hb : b ∈ blocks
  · have ha : blockArea b ≤ N := by
      rw [← harea]
      exact Multiset.le_sum_of_mem (Multiset.mem_map.mpr ⟨b,hb,rfl⟩)
    obtain ⟨hp,hle⟩ := hpos b hb
    have hb₂ : b.2 ≤ N := by
      have hh := Nat.mul_le_mul_right b.2 (show 1 ≤ b.1 by omega)
      dsimp [blockArea] at ha
      omega
    have hb₁ : b.1 ≤ N := hle.trans hb₂
    have hmem : b ∈ (blockTypes N).val := by
      change b ∈ blockTypes N
      simp only [blockTypes,Finset.mem_product,Finset.mem_range]
      omega
    rw [Multiset.count_nsmul,Multiset.count_eq_one_of_mem (blockTypes N).nodup hmem,mul_one]
    exact (Multiset.count_le_card b blocks).trans (by simpa [harea] using card_le_totalArea blocks hpos)
  · rw [Multiset.count_eq_zero_of_notMem hb]
    exact Nat.zero_le _

noncomputable def rectangleMultisets (h w : ℕ) : Finset (Multiset BlockType) := by
  classical
  exact (blockCandidates (h*w)).filter (GridTiles h w)

noncomputable def rectangleCount (h w : ℕ) : ℕ := (rectangleMultisets h w).card

theorem mem_rectangleMultisets (h w : ℕ) (blocks : Multiset BlockType) :
    blocks ∈ rectangleMultisets h w ↔ GridTiles h w blocks := by
  classical
  constructor
  · exact fun hh => (Finset.mem_filter.mp hh).2
  · intro ht
    exact Finset.mem_filter.mpr ⟨mem_blockCandidates _ _ ht.blocks_positive ht.area,ht⟩

noncomputable def areaMultisets (h N : ℕ) : Finset (Multiset BlockType) := by
  classical
  exact (blockCandidates N).filter (fun blocks => totalArea blocks=N ∧
    ∀ b ∈ blocks, 0 < b.1 ∧ b.1 ≤ b.2 ∧ b.1 ≤ h)

theorem rectangleCount_le_areaMultisets (h w : ℕ) :
    rectangleCount h w ≤ (areaMultisets h (h*w)).card := by
  classical
  apply Finset.card_le_card
  intro blocks hb
  have ht := (mem_rectangleMultisets h w blocks).mp hb
  refine Finset.mem_filter.mpr ⟨mem_blockCandidates _ _ ht.blocks_positive ht.area,ht.area,?_⟩
  intro b hb
  exact ⟨(ht.blocks_positive b hb).1,(ht.blocks_positive b hb).2,
    ht.small_side_le_height b hb⟩

/-- Independent width partitions are recoverable from the block multiset.
This theorem uses any actual tiling construction satisfying the stated
family interface; the number of unit squares may vary with all choices. -/
theorem choice_product_le_rectangleCount (I : Finset ℕ) (C T : ℕ → ℕ) (h w : ℕ)
    (hI : ∀ a ∈ I, 1 < a)
    (htile : ∀ parts : I → Multiset ℕ,
      (∀ a : I, parts a ∈ boundedParts a.val (C a.val) (T a.val)) →
      TilesWithUnits h w (familyBlocks I parts)) :
    (∏ a : I, (boundedParts a.val (C a.val) (T a.val)).card) ≤ rectangleCount h w := by
  classical
  let Choice := ∀ a : I, {parts // parts ∈ boundedParts a.val (C a.val) (T a.val)}
  have hex : ∀ p : Choice, ∃ n, GridTiles h w (filledFamily I (fun a => (p a).val) n) := by
    intro p
    obtain ⟨n,hn⟩ := htile (fun a => (p a).val) (fun a => (p a).property)
    exact ⟨n,hn.gridTiles⟩
  let chooseTiles : Choice → {blocks // blocks ∈ rectangleMultisets h w} := fun p =>
    ⟨filledFamily I (fun a => (p a).val) (Classical.choose (hex p)),
      (mem_rectangleMultisets h w _).mpr (Classical.choose_spec (hex p))⟩
  have hinj : Function.Injective chooseTiles := by
    intro p q he
    funext a
    apply Subtype.ext
    have hh := congrArg (fun s : {blocks // blocks ∈ rectangleMultisets h w} =>
      recoverWidths a.val s.val) he
    simpa only [chooseTiles,recover_filledFamily I _ _ hI] using hh
  have hc := Fintype.card_le_of_injective chooseTiles hinj
  simpa only [Choice,Fintype.card_pi,Fintype.card_coe,rectangleCount] using hc

theorem stacked_choice_product_le_rectangleCount (I : Finset ℕ)
    (Q C T : ℕ → ℕ) (h w : ℕ) (hI : ∀ a ∈ I, 1 < a)
    (hcap : ∀ a ∈ I, C a ≤ w)
    (hbudget : ∀ a ∈ I, T a ≤ Q a*(w-C a))
    (hheight : (∑ a : I,a.val*Q a.val) ≤ h) :
    (∏ a : I,(boundedParts a.val (C a.val) (T a.val)).card) ≤ rectangleCount h w := by
  apply choice_product_le_rectangleCount I C T h w hI
  intro parts hp
  have ht : ∀ a : I, TilesWithUnits (a.val*Q a.val) w (tagWidths a.val (parts a)) := by
    intro a
    have ha : 0 < a.val := by have := hI a.val a.property; omega
    obtain ⟨hs,hparts⟩ := (mem_boundedParts_iff _ _ _ ha _).mp (hp a)
    exact shelf_tiling a.val (Q a.val) w (C a.val) (parts a) ha hparts
      (hcap a.val a.property) (hs.trans (hbudget a.val a.property))
  have hs := stack_tilings (Finset.univ : Finset I) (fun a => a.val*Q a.val) w
    (fun a => tagWidths a.val (parts a)) (fun a _ => ht a)
  exact hs.pad hheight le_rfl

theorem column_choice_product_le_rectangleCount (I : Finset ℕ)
    (Q B C T : ℕ → ℕ) (h w : ℕ) (hI : ∀ a ∈ I, 1 < a)
    (hcap : ∀ a ∈ I, C a ≤ B a)
    (hbudget : ∀ a ∈ I, T a ≤ Q a*(B a-C a))
    (hheight : ∀ a ∈ I, a*Q a ≤ h)
    (hwidth : (∑ a : I,B a.val) ≤ w) :
    (∏ a : I,(boundedParts a.val (C a.val) (T a.val)).card) ≤ rectangleCount h w := by
  apply choice_product_le_rectangleCount I C T h w hI
  intro parts hp
  have ht : ∀ a : I, TilesWithUnits h (B a.val) (tagWidths a.val (parts a)) := by
    intro a
    have ha : 0 < a.val := by have := hI a.val a.property; omega
    obtain ⟨hs,hparts⟩ := (mem_boundedParts_iff _ _ _ ha _).mp (hp a)
    exact (shelf_tiling a.val (Q a.val) (B a.val) (C a.val) (parts a) ha hparts
      (hcap a.val a.property) (hs.trans (hbudget a.val a.property))).pad
        (hheight a.val a.property) le_rfl
  have hs := column_tilings (Finset.univ : Finset I) h (fun a => B a.val)
    (fun a => tagWidths a.val (parts a)) (fun a _ => ht a)
  exact hs.pad le_rfl hwidth

end RectanglePartitions
