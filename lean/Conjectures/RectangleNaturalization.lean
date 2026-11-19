import Conjectures.RectangleRealTiles
import Conjectures.RectangleGridFamilies
import Mathlib.Tactic.Positivity

/-! Every finite real-position integer-sided tiling gives an exact grid
tiling of the same unordered block multiset. -/

namespace RectanglePartitions

noncomputable def RealTiling.naturalRectangle {h w : ℕ} (T : RealTiling h w)
    (i : T.Index) : PlacedRectangle :=
  ⟨Classical.choose (T.row_natural i),Classical.choose (T.column_natural i),
    (T.rectangle i).height,(T.rectangle i).width⟩

theorem RealTiling.natural_row_cast {h w : ℕ} (T : RealTiling h w) (i : T.Index) :
    ((T.naturalRectangle i).row : ℝ)=(T.rectangle i).row :=
  (Classical.choose_spec (T.row_natural i)).symm

theorem RealTiling.natural_column_cast {h w : ℕ} (T : RealTiling h w) (i : T.Index) :
    ((T.naturalRectangle i).column : ℝ)=(T.rectangle i).column :=
  (Classical.choose_spec (T.column_natural i)).symm

theorem RealTiling.natural_bounds {h w : ℕ} (T : RealTiling h w) (i : T.Index) :
    (T.naturalRectangle i).row+(T.naturalRectangle i).height ≤ h ∧
      (T.naturalRectangle i).column+(T.naturalRectangle i).width ≤ w := by
  constructor
  · have hh : ((T.naturalRectangle i).row : ℝ)+((T.naturalRectangle i).height : ℝ) ≤ h := by
      rw [T.natural_row_cast]
      exact (T.bounds i).2.2.1
    exact_mod_cast hh
  · have hh : ((T.naturalRectangle i).column : ℝ)+((T.naturalRectangle i).width : ℝ) ≤ w := by
      rw [T.natural_column_cast]
      exact (T.bounds i).2.2.2
    exact_mod_cast hh

theorem RealTiling.natural_cells_iff_closed {h w : ℕ} (T : RealTiling h w)
    (i : T.Index) (p : Cell) :
    p ∈ (T.naturalRectangle i).cells ↔
      (T.rectangle i).closedAt ((p.1 : ℝ)+1/2) ((p.2 : ℝ)+1/2) := by
  rw [PlacedRectangle.cells,mem_boxCells]
  unfold RealRectangle.closedAt
  rw [← T.natural_row_cast i,← T.natural_column_cast i]
  rw [← Nat.cast_add,← Nat.cast_add]
  change _ ↔ ((T.naturalRectangle i).row : ℝ) ≤ (p.1 : ℝ)+1/2 ∧
    (p.1 : ℝ)+1/2 ≤ ((T.naturalRectangle i).row+(T.naturalRectangle i).height : ℕ) ∧
    ((T.naturalRectangle i).column : ℝ) ≤ (p.2 : ℝ)+1/2 ∧
    (p.2 : ℝ)+1/2 ≤ ((T.naturalRectangle i).column+(T.naturalRectangle i).width : ℕ)
  simp only [nat_le_center_iff,center_le_nat_iff]

theorem RealTiling.natural_cells_iff_open {h w : ℕ} (T : RealTiling h w)
    (i : T.Index) (p : Cell) :
    p ∈ (T.naturalRectangle i).cells ↔
      (T.rectangle i).openAt ((p.1 : ℝ)+1/2) ((p.2 : ℝ)+1/2) := by
  rw [PlacedRectangle.cells,mem_boxCells]
  unfold RealRectangle.openAt
  rw [← T.natural_row_cast i,← T.natural_column_cast i]
  rw [← Nat.cast_add,← Nat.cast_add]
  change _ ↔ ((T.naturalRectangle i).row : ℝ) < (p.1 : ℝ)+1/2 ∧
    (p.1 : ℝ)+1/2 < ((T.naturalRectangle i).row+(T.naturalRectangle i).height : ℕ) ∧
    ((T.naturalRectangle i).column : ℝ) < (p.2 : ℝ)+1/2 ∧
    (p.2 : ℝ)+1/2 < ((T.naturalRectangle i).column+(T.naturalRectangle i).width : ℕ)
  simp only [nat_lt_center_iff,center_lt_nat_iff]

theorem RealTiling.gridTiles {h w : ℕ} (T : RealTiling h w) : GridTiles h w T.blocks := by
  apply GridTiles.of_family h w T.naturalRectangle (fun i => T.positive i)
  · intro p
    constructor
    · intro hp
      have hp' := (mem_boxCells 0 0 h w p).mp hp
      simp only [Nat.zero_add,Nat.zero_le,true_and] at hp'
      have hx0 : (0 : ℝ) < (p.1 : ℝ)+1/2 := by positivity
      have hy0 : (0 : ℝ) < (p.2 : ℝ)+1/2 := by positivity
      have hxh := (center_lt_nat_iff p.1 h).mpr hp'.1
      have hyw := (center_lt_nat_iff p.2 w).mpr hp'.2
      obtain ⟨i,hi⟩ := T.cover _ _ hx0 hxh hy0 hyw
      exact ⟨i,(T.natural_cells_iff_closed i p).mpr hi⟩
    · rintro ⟨i,hi⟩
      have hi' := (mem_boxCells _ _ _ _ p).mp hi
      have hb := T.natural_bounds i
      apply (mem_boxCells 0 0 h w p).mpr
      omega
  · intro i j p hi hj
    by_contra hij
    exact T.disjoint i j hij _ _
      ⟨(T.natural_cells_iff_open i p).mp hi,(T.natural_cells_iff_open j p).mp hj⟩

theorem RealTiles.gridTiles {h w : ℕ} {blocks : Multiset BlockType}
    (ht : RealTiles h w blocks) : GridTiles h w blocks := by
  obtain ⟨T,rfl⟩ := ht
  exact T.gridTiles

end RectanglePartitions
