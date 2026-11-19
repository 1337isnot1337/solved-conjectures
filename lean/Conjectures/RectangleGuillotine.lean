import Conjectures.RectangleEncoding
import Conjectures.RectangleShelfPacking
import Mathlib.Data.Multiset.Replicate

/-! Explicit rectangular tilings obtained by successive horizontal and
vertical cuts. These certificates will be mapped to arbitrary cell tilings;
the constructor restriction is used only for the counting lower bound. -/

namespace RectanglePartitions

inductive GuillotineTiles : ℕ → ℕ → Multiset BlockType → Prop
  | emptyHeight (w : ℕ) : GuillotineTiles 0 w 0
  | emptyWidth (h : ℕ) : GuillotineTiles h 0 0
  | block (h w : ℕ) (hh : 0 < h) (hw : 0 < w) :
      GuillotineTiles h w {canonicalBlock h w}
  | beside {h w₁ w₂ : ℕ} {s₁ s₂ : Multiset BlockType} :
      GuillotineTiles h w₁ s₁ → GuillotineTiles h w₂ s₂ →
      GuillotineTiles h (w₁+w₂) (s₁+s₂)
  | atop {h₁ h₂ w : ℕ} {s₁ s₂ : Multiset BlockType} :
      GuillotineTiles h₁ w s₁ → GuillotineTiles h₂ w s₂ →
      GuillotineTiles (h₁+h₂) w (s₁+s₂)

def unitBlocks (n : ℕ) : Multiset BlockType := Multiset.replicate n (1,1)

@[simp] theorem unitBlocks_zero : unitBlocks 0 = 0 := rfl

theorem unitBlocks_add (m n : ℕ) : unitBlocks (m+n)=unitBlocks m+unitBlocks n := by
  exact Multiset.replicate_add _ _ _

theorem guillotine_unit_grid (h w : ℕ) : GuillotineTiles h w (unitBlocks (h*w)) := by
  have row : ∀ w, GuillotineTiles 1 w (unitBlocks w) := by
    intro w
    induction w with
    | zero => exact GuillotineTiles.emptyWidth 1
    | succ w ih =>
      have hb := GuillotineTiles.block 1 1 (by omega) (by omega)
      have hh := GuillotineTiles.beside ih hb
      simpa only [unitBlocks,Multiset.replicate_succ,canonicalBlock,
        min_self,max_self,← Multiset.singleton_add,add_comm] using hh
  induction h with
  | zero => simpa using GuillotineTiles.emptyHeight w
  | succ h ih =>
    have hh := GuillotineTiles.atop ih (row w)
    simpa only [Nat.succ_mul,unitBlocks_add] using hh

def TilesWithUnits (h w : ℕ) (payload : Multiset BlockType) : Prop :=
  ∃ n, GuillotineTiles h w (payload+unitBlocks n)

theorem TilesWithUnits.of_guillotine {h w : ℕ} {payload : Multiset BlockType}
    (hh : GuillotineTiles h w payload) : TilesWithUnits h w payload := by
  exact ⟨0,by simpa using hh⟩

theorem TilesWithUnits.empty (h w : ℕ) : TilesWithUnits h w 0 := by
  exact ⟨h*w,by simpa using guillotine_unit_grid h w⟩

theorem TilesWithUnits.beside {h w₁ w₂ : ℕ} {s₁ s₂ : Multiset BlockType}
    (h₁ : TilesWithUnits h w₁ s₁) (h₂ : TilesWithUnits h w₂ s₂) :
    TilesWithUnits h (w₁+w₂) (s₁+s₂) := by
  obtain ⟨n₁,h₁⟩ := h₁
  obtain ⟨n₂,h₂⟩ := h₂
  refine ⟨n₁+n₂,?_⟩
  simpa only [unitBlocks_add,add_assoc,add_left_comm,add_comm] using
    GuillotineTiles.beside h₁ h₂

theorem TilesWithUnits.atop {h₁ h₂ w : ℕ} {s₁ s₂ : Multiset BlockType}
    (t₁ : TilesWithUnits h₁ w s₁) (t₂ : TilesWithUnits h₂ w s₂) :
    TilesWithUnits (h₁+h₂) w (s₁+s₂) := by
  obtain ⟨n₁,t₁⟩ := t₁
  obtain ⟨n₂,t₂⟩ := t₂
  refine ⟨n₁+n₂,?_⟩
  simpa only [unitBlocks_add,add_assoc,add_left_comm,add_comm] using
    GuillotineTiles.atop t₁ t₂

theorem TilesWithUnits.pad {h w H W : ℕ} {s : Multiset BlockType}
    (ht : TilesWithUnits h w s) (hh : h ≤ H) (hw : w ≤ W) : TilesWithUnits H W s := by
  have ht' := ht.atop (TilesWithUnits.empty (H-h) w)
  simp only [Nat.add_sub_of_le hh,add_zero] at ht'
  have ht'' := ht'.beside (TilesWithUnits.empty H (W-w))
  simpa only [Nat.add_sub_of_le hh,Nat.add_sub_of_le hw,add_zero] using ht''

theorem guillotine_row (a : ℕ) (widths : List ℕ) (ha : 0 < a)
    (hw : ∀ b ∈ widths, a ≤ b) :
    GuillotineTiles a widths.sum (tagWidths a (widths : Multiset ℕ)) := by
  induction widths with
  | nil => simpa [tagWidths] using GuillotineTiles.emptyWidth a
  | cons b widths ih =>
    have hab := hw b (by simp)
    have ht := GuillotineTiles.block a b ha (lt_of_lt_of_le ha hab)
    have hrest := ih (fun c hc => hw c (by simp [hc]))
    simpa [tagWidths,canonicalBlock_of_le hab] using GuillotineTiles.beside ht hrest

theorem shelves_tiling (a B : ℕ) (shelves : List (List ℕ)) (ha : 0 < a)
    (hparts : ∀ shelf ∈ shelves, ∀ b ∈ shelf, a ≤ b)
    (hwidth : ∀ shelf ∈ shelves, shelf.sum ≤ B) :
    TilesWithUnits (a*shelves.length) B (tagWidths a (shelves.flatten : Multiset ℕ)) := by
  induction shelves with
  | nil => simpa [tagWidths] using TilesWithUnits.empty 0 B
  | cons shelf shelves ih =>
    have hr := (TilesWithUnits.of_guillotine
      (guillotine_row a shelf ha (hparts shelf (by simp)))).pad le_rfl
        (hwidth shelf (by simp))
    have ht := ih (fun s hs => hparts s (by simp [hs]))
      (fun s hs => hwidth s (by simp [hs]))
    have hh := hr.atop ht
    simpa only [List.length_cons,List.flatten_cons,← Multiset.coe_add,tagWidths,
      Multiset.map_add,Nat.mul_add,Nat.mul_one,Nat.add_comm] using hh

/-- Every width multiset satisfying the next-fit budget is realized by
actual successive cuts inside `Q` shelves, with unit squares as filler. -/
theorem shelf_tiling (a Q B C : ℕ) (parts : Multiset ℕ) (ha : 0 < a)
    (hparts : ∀ b ∈ parts, a ≤ b ∧ b ≤ C) (hC : C ≤ B)
    (hbudget : parts.sum ≤ Q*(B-C)) :
    TilesWithUnits (a*Q) B (tagWidths a parts) := by
  obtain ⟨shelves,hflatten,hlen,hsum⟩ := shelf_packing Q B C parts.toList
    (fun b hb => ⟨lt_of_lt_of_le ha (hparts b (by simpa using hb)).1,
      (hparts b (by simpa using hb)).2⟩) hC (by simpa using hbudget)
  have hh := shelves_tiling a B shelves ha (by
    intro shelf hs b hb
    have hmem : b ∈ shelves.flatten := List.mem_flatten.mpr ⟨shelf,hs,hb⟩
    rw [hflatten] at hmem
    exact (hparts b (by simpa using hmem)).1) hsum
  have hh' := hh.pad (Nat.mul_le_mul_left a hlen) le_rfl
  simpa only [hflatten,Multiset.coe_toList] using hh'

theorem stack_tilings {ι : Type*} [DecidableEq ι] (I : Finset ι)
    (height : ι → ℕ) (w : ℕ) (payload : ι → Multiset BlockType)
    (ht : ∀ i ∈ I, TilesWithUnits (height i) w (payload i)) :
    TilesWithUnits (∑ i ∈ I,height i) w (∑ i ∈ I,payload i) := by
  induction I using Finset.induction_on with
  | empty => simpa using TilesWithUnits.empty 0 w
  | @insert i I hi ih =>
    have hh := (ht i (by simp)).atop (ih (fun j hj => ht j (by simp [hj])))
    simpa only [Finset.sum_insert hi] using hh

theorem column_tilings {ι : Type*} [DecidableEq ι] (I : Finset ι)
    (h : ℕ) (width : ι → ℕ) (payload : ι → Multiset BlockType)
    (ht : ∀ i ∈ I, TilesWithUnits h (width i) (payload i)) :
    TilesWithUnits h (∑ i ∈ I,width i) (∑ i ∈ I,payload i) := by
  induction I using Finset.induction_on with
  | empty => simpa using TilesWithUnits.empty h 0
  | @insert i I hi ih =>
    have hh := (ht i (by simp)).beside (ih (fun j hj => ht j (by simp [hj])))
    simpa only [Finset.sum_insert hi] using hh

end RectanglePartitions
