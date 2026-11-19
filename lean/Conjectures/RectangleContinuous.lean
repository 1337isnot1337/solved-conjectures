import Conjectures.RectangleNaturalization
import Conjectures.RectangleCounting
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import Mathlib.Algebra.Order.Floor.Semiring

/-! Integer-grid tilings and arbitrary real-position integer-sided tilings
have exactly the same block multisets. -/

namespace RectanglePartitions

def PlacedRectangle.toReal (r : PlacedRectangle) : RealRectangle :=
  ⟨r.row,r.column,r.height,r.width⟩

noncomputable def RealTiling.of_grid_family {ι : Type} [Fintype ι] (h w : ℕ)
    (r : ι → PlacedRectangle)
    (hpos : ∀ i,0 < (r i).height ∧ 0 < (r i).width)
    (hbound : ∀ i,(r i).row+(r i).height ≤ h ∧ (r i).column+(r i).width ≤ w)
    (hcover : ∀ p : Cell,p ∈ boxCells 0 0 h w ↔ ∃ i,p ∈ (r i).cells)
    (hunique : ∀ i j (p : Cell),p ∈ (r i).cells → p ∈ (r j).cells → i=j) : RealTiling h w where
  Index := ι
  finiteIndex := inferInstance
  rectangle := fun i => (r i).toReal
  positive := hpos
  bounds := by
    intro i
    dsimp only [PlacedRectangle.toReal]
    refine ⟨by positivity,by positivity,?_,?_⟩
    · have hh := (hbound i).1
      exact_mod_cast hh
    · have hh := (hbound i).2
      exact_mod_cast hh
  disjoint := by
    intro i j hij x y hi
    rcases hi with ⟨⟨hix,hix',hiy,hiy'⟩,⟨hjx,hjx',hjy,hjy'⟩⟩
    change ((r i).row : ℝ) < x at hix
    change ((r i).column : ℝ) < y at hiy
    have hx0 : 0 ≤ x := (Nat.cast_nonneg (r i).row).trans hix.le
    have hy0 : 0 ≤ y := (Nat.cast_nonneg (r i).column).trans hiy.le
    let p : Cell := (⌊x⌋₊,⌊y⌋₊)
    have hcell (k : ι) (hx : ((r k).row : ℝ) < x)
        (hx' : x < ((r k).row : ℝ)+((r k).height : ℝ))
        (hy : ((r k).column : ℝ) < y)
        (hy' : y < ((r k).column : ℝ)+((r k).width : ℝ)) : p ∈ (r k).cells := by
      apply (mem_boxCells _ _ _ _ p).mpr
      refine ⟨Nat.le_floor hx.le,?_,Nat.le_floor hy.le,?_⟩
      · apply (Nat.floor_lt hx0).mpr
        simpa only [Nat.cast_add] using hx'
      · apply (Nat.floor_lt hy0).mpr
        simpa only [Nat.cast_add] using hy'
    exact hij (hunique i j p (hcell i hix hix' hiy hiy') (hcell j hjx hjx' hjy hjy'))
  cover := by
    intro x y hx0 hxh hy0 hyw
    let p : Cell := (⌊x⌋₊,⌊y⌋₊)
    have hp : p ∈ boxCells 0 0 h w := by
      apply (mem_boxCells 0 0 h w p).mpr
      exact ⟨Nat.zero_le _,by simpa using (Nat.floor_lt hx0.le).mpr hxh,
        Nat.zero_le _,by simpa using (Nat.floor_lt hy0.le).mpr hyw⟩
    obtain ⟨i,hi⟩ := (hcover p).mp hp
    obtain ⟨hix,hix',hiy,hiy'⟩ := (mem_boxCells _ _ _ _ p).mp hi
    refine ⟨i,?_,?_,?_,?_⟩
    · exact (Nat.cast_le.mpr hix).trans (Nat.floor_le hx0.le)
    · have hh := Nat.lt_of_floor_lt hix'
      simpa only [Nat.cast_add,PlacedRectangle.toReal] using hh.le
    · exact (Nat.cast_le.mpr hiy).trans (Nat.floor_le hy0.le)
    · have hh := Nat.lt_of_floor_lt hiy'
      simpa only [Nat.cast_add,PlacedRectangle.toReal] using hh.le

theorem placed_corner_mem (r : PlacedRectangle) (hp : 0 < r.height ∧ 0 < r.width) :
    (r.row,r.column) ∈ r.cells := by
  apply (mem_boxCells _ _ _ _ _).mpr
  dsimp
  omega

theorem grid_placed_bounds (h w : ℕ) (placed : Multiset PlacedRectangle)
    (hpos : ∀ r ∈ placed,0 < r.height ∧ 0 < r.width)
    (hcover : placed.bind PlacedRectangle.cells=boxCells 0 0 h w) :
    ∀ r ∈ placed,r.row+r.height ≤ h ∧ r.column+r.width ≤ w := by
  intro r hr
  have hp := hpos r hr
  have hm : (r.row+r.height-1,r.column+r.width-1) ∈ r.cells := by
    apply (mem_boxCells _ _ _ _ _).mpr
    dsimp
    omega
  have hh := Multiset.mem_bind.mpr ⟨r,hr,hm⟩
  rw [hcover,mem_boxCells] at hh
  dsimp at hh
  omega

theorem GridTiles.realTiles {h w : ℕ} {blocks : Multiset BlockType}
    (ht : GridTiles h w blocks) : RealTiles h w blocks := by
  classical
  obtain ⟨placed,hpos,hcover,htypes⟩ := ht
  have hnode : (placed.bind PlacedRectangle.cells).Nodup := by
    rw [hcover]
    exact boxCells_nodup 0 0 h w
  have hpairs := (Multiset.nodup_bind.mp hnode).2
  have hplaced : placed.Nodup := by
    obtain ⟨l,hl,hpairl⟩ := hpairs
    apply Multiset.nodup_iff_pairwise.mpr
    refine ⟨l,hl,hpairl.imp_of_mem ?_⟩
    intro a b ha hb hd he
    subst b
    have ham : a ∈ placed := by rw [hl]; exact ha
    have hc := placed_corner_mem a (hpos a ham)
    exact Multiset.disjoint_left.mp hd hc hc
  let I := placed.toFinset
  have hm (i : I) : i.val ∈ placed := Multiset.mem_toFinset.mp i.property
  have hc : ∀ p : Cell,p ∈ boxCells 0 0 h w ↔ ∃ i : I,p ∈ i.val.cells := by
    intro p
    rw [← hcover,Multiset.mem_bind]
    constructor
    · rintro ⟨r,hr,hp⟩
      exact ⟨⟨r,Multiset.mem_toFinset.mpr hr⟩,hp⟩
    · rintro ⟨i,hi⟩
      exact ⟨i.val,hm i,hi⟩
  have hu : ∀ i j : I,∀ p : Cell,p ∈ i.val.cells → p ∈ j.val.cells → i=j := by
    intro i j p hi hj
    apply Subtype.ext
    by_contra hne
    have hd : Disjoint i.val.cells j.val.cells := hpairs.forall (hm i) (hm j) hne
    exact Multiset.disjoint_left.mp hd hi hj
  let T := RealTiling.of_grid_family h w (fun i : I => i.val)
    (fun i => hpos i.val (hm i))
    (fun i => grid_placed_bounds h w placed hpos hcover i.val (hm i)) hc hu
  have hmap : ((Finset.univ : Finset I).val.map (fun i : I => i.val))=placed := by
    change placed.toFinset.val.attach.map Subtype.val=placed
    rw [Multiset.attach_map_val]
    exact hplaced.dedup
  refine ⟨T,?_⟩
  change (Finset.univ : Finset I).val.map (fun i : I => i.val.blockType)=blocks
  calc
    _ = ((Finset.univ : Finset I).val.map (fun i : I => i.val)).map
        PlacedRectangle.blockType := by rw [Multiset.map_map]; rfl
    _ = blocks := by rw [hmap,htypes]

theorem realTiles_iff_gridTiles (h w : ℕ) (blocks : Multiset BlockType) :
    RealTiles h w blocks ↔ GridTiles h w blocks :=
  ⟨RealTiles.gridTiles,GridTiles.realTiles⟩

noncomputable def realRectangleMultisets (h w : ℕ) : Finset (Multiset BlockType) := by
  classical
  exact (blockCandidates (h*w)).filter (RealTiles h w)

noncomputable def realRectangleCount (h w : ℕ) : ℕ := (realRectangleMultisets h w).card

theorem realRectangleMultisets_eq (h w : ℕ) : realRectangleMultisets h w=rectangleMultisets h w := by
  classical
  apply Finset.filter_congr
  intro blocks hb
  exact realTiles_iff_gridTiles h w blocks

theorem realRectangleCount_eq (h w : ℕ) : realRectangleCount h w=rectangleCount h w := by
  unfold realRectangleCount rectangleCount
  rw [realRectangleMultisets_eq]

end RectanglePartitions
