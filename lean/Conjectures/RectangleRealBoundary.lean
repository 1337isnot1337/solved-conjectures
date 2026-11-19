import Conjectures.RectangleNaturalization
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import Mathlib.Algebra.Order.Floor.Semiring

/-! The real tiling model covers the closed board, including its boundary,
whenever both board dimensions are positive. -/

namespace RectanglePartitions

theorem exists_grid_interval (H : ℕ) (hH : 0 < H) (x : ℝ)
    (hx0 : 0 ≤ x) (hxH : x ≤ H) :
    ∃ k : ℕ,k < H ∧ (k : ℝ) ≤ x ∧ x ≤ (k : ℝ)+1 := by
  by_cases hx : x < H
  · exact ⟨⌊x⌋₊,(Nat.floor_lt hx0).mpr hx,Nat.floor_le hx0,(Nat.lt_floor_add_one x).le⟩
  · have he : x=(H : ℝ) := le_antisymm hxH (le_of_not_gt hx)
    refine ⟨H-1,by omega,?_,?_⟩
    · rw [he]
      exact_mod_cast (show H-1 ≤ H by omega)
    · have hh : ((H-1 : ℕ) : ℝ)+1=(H : ℝ) := by
        exact_mod_cast (show H-1+1=H by omega)
      rw [he,hh]

theorem RealTiling.cover_closed {h w : ℕ} (T : RealTiling h w)
    (hh : 0 < h) (hw : 0 < w) (x y : ℝ)
    (hx0 : 0 ≤ x) (hxh : x ≤ h) (hy0 : 0 ≤ y) (hyw : y ≤ w) :
    ∃ i,(T.rectangle i).closedAt x y := by
  obtain ⟨r,hr,hrx,hxr⟩ := exists_grid_interval h hh x hx0 hxh
  obtain ⟨c,hc,hcy,hyc⟩ := exists_grid_interval w hw y hy0 hyw
  have hr0 : (0 : ℝ) < (r : ℝ)+1/2 := by positivity
  have hc0 : (0 : ℝ) < (c : ℝ)+1/2 := by positivity
  obtain ⟨i,hi⟩ := T.cover _ _ hr0 ((center_lt_nat_iff r h).mpr hr)
    hc0 ((center_lt_nat_iff c w).mpr hc)
  have hcell := (T.natural_cells_iff_closed i (r,c)).mpr hi
  obtain ⟨hir,hir',hic,hic'⟩ := (mem_boxCells _ _ _ _ (r,c)).mp hcell
  have hlr : ((T.naturalRectangle i).row : ℝ) ≤ r := by exact_mod_cast hir
  have hlc : ((T.naturalRectangle i).column : ℝ) ≤ c := by exact_mod_cast hic
  have hrr : (r : ℝ)+1 ≤ ((T.naturalRectangle i).row : ℝ)+((T.naturalRectangle i).height : ℝ) := by
    exact_mod_cast (show r+1 ≤ (T.naturalRectangle i).row+(T.naturalRectangle i).height by omega)
  have hrc : (c : ℝ)+1 ≤ ((T.naturalRectangle i).column : ℝ)+((T.naturalRectangle i).width : ℝ) := by
    exact_mod_cast (show c+1 ≤ (T.naturalRectangle i).column+(T.naturalRectangle i).width by omega)
  rw [T.natural_row_cast] at hlr hrr
  rw [T.natural_column_cast] at hlc hrc
  exact ⟨i,hlr.trans hrx,hxr.trans hrr,hlc.trans hcy,hyc.trans hrc⟩

end RectanglePartitions
