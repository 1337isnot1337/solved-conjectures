import Conjectures.RectangleRealIntervals
import Conjectures.RectangleCells
import Mathlib.Order.Interval.Set.Infinite

/-! Finite axis-parallel rectangle tilings at arbitrary real positions.
The side lengths are positive integers, and interiors are disjoint.
Horizontal and vertical slices force all positions to be integral. -/

namespace RectanglePartitions

structure RealRectangle where
  row : ℝ
  column : ℝ
  height : ℕ
  width : ℕ

def RealRectangle.closedAt (r : RealRectangle) (x y : ℝ) : Prop :=
  r.row ≤ x ∧ x ≤ r.row+(r.height : ℝ) ∧
    r.column ≤ y ∧ y ≤ r.column+(r.width : ℝ)

def RealRectangle.openAt (r : RealRectangle) (x y : ℝ) : Prop :=
  r.row < x ∧ x < r.row+(r.height : ℝ) ∧
    r.column < y ∧ y < r.column+(r.width : ℝ)

def RealRectangle.transpose (r : RealRectangle) : RealRectangle :=
  ⟨r.column,r.row,r.width,r.height⟩

def RealRectangle.blockType (r : RealRectangle) : BlockType :=
  canonicalBlock r.height r.width

/-- Coverage is required at every point in the interior of the board by
closed tiles. Tile boundaries may meet; tile interiors must be disjoint. -/
structure RealTiling (h w : ℕ) where
  Index : Type
  finiteIndex : Fintype Index
  rectangle : Index → RealRectangle
  positive : ∀ i,0 < (rectangle i).height ∧ 0 < (rectangle i).width
  bounds : ∀ i,0 ≤ (rectangle i).row ∧ 0 ≤ (rectangle i).column ∧
    (rectangle i).row+((rectangle i).height : ℝ) ≤ h ∧
    (rectangle i).column+((rectangle i).width : ℝ) ≤ w
  disjoint : ∀ i j,i ≠ j → ∀ x y : ℝ,
    ¬ ((rectangle i).openAt x y ∧ (rectangle j).openAt x y)
  cover : ∀ x y : ℝ,0 < x → x < h → 0 < y → y < w →
    ∃ i,(rectangle i).closedAt x y

attribute [instance] RealTiling.finiteIndex

noncomputable def RealTiling.blocks {h w : ℕ} (T : RealTiling h w) : Multiset BlockType :=
  (Finset.univ : Finset T.Index).val.map (fun i => (T.rectangle i).blockType)

def RealTiles (h w : ℕ) (blocks : Multiset BlockType) : Prop :=
  ∃ T : RealTiling h w,T.blocks=blocks

def RealTiling.transpose {h w : ℕ} (T : RealTiling h w) : RealTiling w h where
  Index := T.Index
  finiteIndex := T.finiteIndex
  rectangle := fun i => (T.rectangle i).transpose
  positive := fun i => ⟨(T.positive i).2,(T.positive i).1⟩
  bounds := fun i => ⟨(T.bounds i).2.1,(T.bounds i).1,(T.bounds i).2.2.2,(T.bounds i).2.2.1⟩
  disjoint := by
    intro i j hij x y hi
    apply T.disjoint i j hij y x
    rcases hi with ⟨⟨hix,hix',hiy,hiy'⟩,⟨hjx,hjx',hjy,hjy'⟩⟩
    exact ⟨⟨hiy,hiy',hix,hix'⟩,⟨hjy,hjy',hjx,hjx'⟩⟩
  cover := by
    intro x y hx hxw hy hyh
    obtain ⟨i,hiy,hiy',hix,hix'⟩ := T.cover y x hy hyh hx hxw
    exact ⟨i,hix,hix',hiy,hiy'⟩

theorem RealTiling.column_natural {h w : ℕ} (T : RealTiling h w) (i : T.Index) :
    ∃ n : ℕ,(T.rectangle i).column=(n : ℝ) := by
  classical
  let edges : Finset ℝ :=
    (Finset.univ.image (fun j : T.Index => (T.rectangle j).row)) ∪
      (Finset.univ.image (fun j : T.Index =>
        (T.rectangle j).row+((T.rectangle j).height : ℝ)))
  have hp : (0 : ℝ) < (T.rectangle i).height := by exact_mod_cast (T.positive i).1
  have hinf := Set.Ioo_infinite (show (T.rectangle i).row <
    (T.rectangle i).row+((T.rectangle i).height : ℝ) by linarith)
  obtain ⟨y,hy,hyedge⟩ := hinf.exists_notMem_finite edges.finite_toSet
  have hy0 : 0 < y := (T.bounds i).1.trans_lt hy.1
  have hyh : y < h := hy.2.trans_le (T.bounds i).2.2.1
  let active : Finset T.Index := Finset.univ.filter (fun j =>
    (T.rectangle j).row < y ∧ y < (T.rectangle j).row+((T.rectangle j).height : ℝ))
  have hi : i ∈ active := Finset.mem_filter.mpr ⟨Finset.mem_univ _,hy⟩
  apply interval_left_natural active (fun j => (T.rectangle j).column)
    (fun j => (T.rectangle j).width) (w : ℝ)
    (fun j hj => (T.positive j).2)
    (fun j hj => ⟨(T.bounds j).2.1,(T.bounds j).2.2.2⟩) ?_ ?_ i hi
  · intro x hx0 hxw
    obtain ⟨j,hjy,hjy',hjx,hjx'⟩ := T.cover y x hy0 hyh hx0 hxw
    have hne₁ : y ≠ (T.rectangle j).row := by
      intro he
      apply hyedge
      apply Finset.mem_union_left
      exact Finset.mem_image.mpr ⟨j,Finset.mem_univ _,he.symm⟩
    have hne₂ : y ≠ (T.rectangle j).row+((T.rectangle j).height : ℝ) := by
      intro he
      apply hyedge
      apply Finset.mem_union_right
      exact Finset.mem_image.mpr ⟨j,Finset.mem_univ _,he.symm⟩
    refine ⟨j,Finset.mem_filter.mpr ⟨Finset.mem_univ _,?_,?_⟩,hjx,hjx'⟩
    · exact lt_of_le_of_ne hjy hne₁.symm
    · exact lt_of_le_of_ne hjy' hne₂
  · intro j hj k hk hjk x hx
    have hjy := (Finset.mem_filter.mp hj).2
    have hky := (Finset.mem_filter.mp hk).2
    apply T.disjoint j k hjk y x
    exact ⟨⟨hjy.1,hjy.2,hx.1,hx.2.1⟩,⟨hky.1,hky.2,hx.2.2.1,hx.2.2.2⟩⟩

theorem RealTiling.row_natural {h w : ℕ} (T : RealTiling h w) (i : T.Index) :
    ∃ n : ℕ,(T.rectangle i).row=(n : ℝ) :=
  T.transpose.column_natural i

theorem RealTiling.positions_natural {h w : ℕ} (T : RealTiling h w) :
    ∀ i,∃ r c : ℕ,(T.rectangle i).row=(r : ℝ) ∧ (T.rectangle i).column=(c : ℝ) := by
  intro i
  obtain ⟨r,hr⟩ := T.row_natural i
  obtain ⟨c,hc⟩ := T.column_natural i
  exact ⟨r,c,hr,hc⟩

end RectanglePartitions
