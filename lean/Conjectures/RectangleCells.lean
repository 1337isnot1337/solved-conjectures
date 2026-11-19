import Conjectures.RectangleGuillotine
import Mathlib.Data.Multiset.Range
import Mathlib.Data.Multiset.Bind
import Mathlib.Algebra.Order.BigOperators.Group.Multiset

/-! General finite grid tilings. The multiset of covered cells equals the
board exactly, so each cell is covered once, including for arrangements
that cannot be obtained by successive full cuts. -/

namespace RectanglePartitions

abbrev Cell := ℕ × ℕ

def boxCells (x y h w : ℕ) : Multiset Cell :=
  (Multiset.range h).bind (fun i => (Multiset.range w).map (fun j => (x+i,y+j)))

def translateCell (x y : ℕ) (p : Cell) : Cell := (x+p.1,y+p.2)

theorem boxCells_zero_height (x y w : ℕ) : boxCells x y 0 w=0 := by
  simp [boxCells]

theorem boxCells_zero_width (x y h : ℕ) : boxCells x y h 0=0 := by
  simp [boxCells]

theorem mem_boxCells (x y h w : ℕ) (p : Cell) :
    p ∈ boxCells x y h w ↔ x ≤ p.1 ∧ p.1 < x+h ∧ y ≤ p.2 ∧ p.2 < y+w := by
  rcases p with ⟨u,v⟩
  simp only [boxCells,Multiset.mem_bind,Multiset.mem_range,Multiset.mem_map,Prod.mk.injEq]
  constructor
  · rintro ⟨i,hi,j,hj,hx,hy⟩
    omega
  · rintro ⟨hx,hxh,hy,hyw⟩
    exact ⟨u-x,by omega,v-y,by omega,by omega,by omega⟩

theorem card_boxCells (x y h w : ℕ) : (boxCells x y h w).card=h*w := by
  simp [boxCells,Function.comp_def,nsmul_eq_mul]

theorem boxCells_translate (x y h w X Y : ℕ) :
    boxCells (X+x) (Y+y) h w = (boxCells x y h w).map (translateCell X Y) := by
  simp only [boxCells,Multiset.map_bind,Multiset.map_map]
  apply Multiset.bind_congr
  intro i hi
  apply Multiset.map_congr rfl
  intro j hj
  simp only [Function.comp_def,translateCell,Nat.add_assoc]

theorem boxCells_height_add (h₁ h₂ w : ℕ) :
    boxCells 0 0 (h₁+h₂) w = boxCells 0 0 h₁ w +
      (boxCells 0 0 h₂ w).map (translateCell h₁ 0) := by
  simp only [boxCells,Multiset.range_add,Multiset.add_bind,Multiset.bind_map,
    Multiset.map_bind,Multiset.map_map]
  congr 1
  apply Multiset.bind_congr
  intro i hi
  apply Multiset.map_congr rfl
  intro j hj
  simp only [Function.comp_def,translateCell,Nat.zero_add]

theorem boxCells_width_add (h w₁ w₂ : ℕ) :
    boxCells 0 0 h (w₁+w₂) = boxCells 0 0 h w₁ +
      (boxCells 0 0 h w₂).map (translateCell 0 w₁) := by
  simp only [boxCells,Multiset.range_add,Multiset.map_add,Multiset.map_map,
    Multiset.bind_add,Multiset.map_bind]
  congr 1
  apply Multiset.bind_congr
  intro i hi
  apply Multiset.map_congr rfl
  intro j hj
  simp only [Function.comp_def,translateCell,Nat.zero_add]

structure PlacedRectangle where
  row : ℕ
  column : ℕ
  height : ℕ
  width : ℕ
  deriving DecidableEq

def PlacedRectangle.cells (r : PlacedRectangle) : Multiset Cell :=
  boxCells r.row r.column r.height r.width

def PlacedRectangle.blockType (r : PlacedRectangle) : BlockType :=
  canonicalBlock r.height r.width

def PlacedRectangle.shift (x y : ℕ) (r : PlacedRectangle) : PlacedRectangle :=
  ⟨x+r.row,y+r.column,r.height,r.width⟩

theorem PlacedRectangle.shift_cells (x y : ℕ) (r : PlacedRectangle) :
    (r.shift x y).cells = r.cells.map (translateCell x y) :=
  boxCells_translate _ _ _ _ _ _

@[simp] theorem PlacedRectangle.shift_type (x y : ℕ) (r : PlacedRectangle) :
    (r.shift x y).blockType=r.blockType := rfl

/-- Arbitrary positive rectangular blocks covering the board exactly once.
Rotations are identified only in the resulting multiset of block types. -/
def GridTiles (h w : ℕ) (blocks : Multiset BlockType) : Prop :=
  ∃ placed : Multiset PlacedRectangle,
    (∀ r ∈ placed, 0 < r.height ∧ 0 < r.width) ∧
    placed.bind PlacedRectangle.cells = boxCells 0 0 h w ∧
    placed.map PlacedRectangle.blockType=blocks

theorem shifted_placed_cells (x y : ℕ) (placed : Multiset PlacedRectangle) :
    (placed.map (PlacedRectangle.shift x y)).bind PlacedRectangle.cells =
      (placed.bind PlacedRectangle.cells).map (translateCell x y) := by
  rw [Multiset.bind_map,Multiset.map_bind]
  apply Multiset.bind_congr
  intro r hr
  exact r.shift_cells x y

theorem shifted_placed_types (x y : ℕ) (placed : Multiset PlacedRectangle) :
    (placed.map (PlacedRectangle.shift x y)).map PlacedRectangle.blockType =
      placed.map PlacedRectangle.blockType := by
  rw [Multiset.map_map]
  rfl

theorem GridTiles.emptyHeight (w : ℕ) : GridTiles 0 w 0 := by
  refine ⟨0,?_,?_,?_⟩ <;> simp [boxCells]

theorem GridTiles.emptyWidth (h : ℕ) : GridTiles h 0 0 := by
  refine ⟨0,?_,?_,?_⟩ <;> simp [boxCells]

theorem GridTiles.block (h w : ℕ) (hh : 0 < h) (hw : 0 < w) :
    GridTiles h w {canonicalBlock h w} := by
  refine ⟨{⟨0,0,h,w⟩},?_,?_,?_⟩
  · simpa using And.intro hh hw
  · simp [PlacedRectangle.cells]
  · simp [PlacedRectangle.blockType]

theorem GridTiles.beside {h w₁ w₂ : ℕ} {s₁ s₂ : Multiset BlockType}
    (t₁ : GridTiles h w₁ s₁) (t₂ : GridTiles h w₂ s₂) :
    GridTiles h (w₁+w₂) (s₁+s₂) := by
  obtain ⟨p₁,hp₁,hc₁,ht₁⟩ := t₁
  obtain ⟨p₂,hp₂,hc₂,ht₂⟩ := t₂
  refine ⟨p₁+p₂.map (PlacedRectangle.shift 0 w₁),?_,?_,?_⟩
  · intro r hr
    rcases Multiset.mem_add.mp hr with hr|hr
    · exact hp₁ r hr
    · obtain ⟨q,hq,rfl⟩ := Multiset.mem_map.mp hr
      exact hp₂ q hq
  · rw [Multiset.add_bind,shifted_placed_cells,hc₁,hc₂,boxCells_width_add]
  · rw [Multiset.map_add,shifted_placed_types,ht₁,ht₂]

theorem GridTiles.atop {h₁ h₂ w : ℕ} {s₁ s₂ : Multiset BlockType}
    (t₁ : GridTiles h₁ w s₁) (t₂ : GridTiles h₂ w s₂) :
    GridTiles (h₁+h₂) w (s₁+s₂) := by
  obtain ⟨p₁,hp₁,hc₁,ht₁⟩ := t₁
  obtain ⟨p₂,hp₂,hc₂,ht₂⟩ := t₂
  refine ⟨p₁+p₂.map (PlacedRectangle.shift h₁ 0),?_,?_,?_⟩
  · intro r hr
    rcases Multiset.mem_add.mp hr with hr|hr
    · exact hp₁ r hr
    · obtain ⟨q,hq,rfl⟩ := Multiset.mem_map.mp hr
      exact hp₂ q hq
  · rw [Multiset.add_bind,shifted_placed_cells,hc₁,hc₂,boxCells_height_add]
  · rw [Multiset.map_add,shifted_placed_types,ht₁,ht₂]

theorem GuillotineTiles.gridTiles {h w : ℕ} {blocks : Multiset BlockType}
    (ht : GuillotineTiles h w blocks) : GridTiles h w blocks := by
  induction ht with
  | emptyHeight w => exact GridTiles.emptyHeight w
  | emptyWidth h => exact GridTiles.emptyWidth h
  | block h w hh hw => exact GridTiles.block h w hh hw
  | beside _ _ ih₁ ih₂ => exact ih₁.beside ih₂
  | atop _ _ ih₁ ih₂ => exact ih₁.atop ih₂

def blockArea (b : BlockType) : ℕ := b.1*b.2

def totalArea (blocks : Multiset BlockType) : ℕ := (blocks.map blockArea).sum

theorem canonicalBlock_area (h w : ℕ) : blockArea (canonicalBlock h w)=h*w := by
  rcases le_total h w with hh|hh
  · simp [blockArea,canonicalBlock,min_eq_left hh,max_eq_right hh]
  · simp [blockArea,canonicalBlock,min_eq_right hh,max_eq_left hh,Nat.mul_comm]

theorem GridTiles.area {h w : ℕ} {blocks : Multiset BlockType}
    (ht : GridTiles h w blocks) : totalArea blocks=h*w := by
  obtain ⟨placed,hpos,hcover,rfl⟩ := ht
  have hc := congrArg Multiset.card hcover
  simp only [Multiset.card_bind,card_boxCells,Function.comp_def,
    PlacedRectangle.cells] at hc
  simpa only [totalArea,Multiset.map_map,Function.comp_def,
    PlacedRectangle.blockType,canonicalBlock_area] using hc

theorem GridTiles.blocks_positive {h w : ℕ} {blocks : Multiset BlockType}
    (ht : GridTiles h w blocks) : ∀ b ∈ blocks, 0 < b.1 ∧ b.1 ≤ b.2 := by
  obtain ⟨placed,hpos,hcover,rfl⟩ := ht
  intro b hb
  obtain ⟨r,hr,rfl⟩ := Multiset.mem_map.mp hb
  obtain ⟨hh,hw⟩ := hpos r hr
  change 0 < min r.height r.width ∧ min r.height r.width ≤ max r.height r.width
  exact ⟨lt_min hh hw,min_le_max⟩

theorem GridTiles.small_side_le_height {h w : ℕ} {blocks : Multiset BlockType}
    (ht : GridTiles h w blocks) : ∀ b ∈ blocks, b.1 ≤ h := by
  obtain ⟨placed,hpos,hcover,rfl⟩ := ht
  intro b hb
  obtain ⟨r,hr,rfl⟩ := Multiset.mem_map.mp hb
  obtain ⟨hh,hw⟩ := hpos r hr
  have hm : (r.row+r.height-1,r.column) ∈ r.cells := by
    apply (mem_boxCells _ _ _ _ _).mpr
    dsimp
    omega
  have hm' := Multiset.mem_bind.mpr ⟨r,hr,hm⟩
  rw [hcover,mem_boxCells] at hm'
  have hrh : r.height ≤ h := by dsimp at hm'; omega
  exact (min_le_left r.height r.width).trans hrh

end RectanglePartitions
