import Conjectures.CircularInsertionRotations

/-! Locations of the inserted matching classes in the cyclic colour order. -/

namespace CircularIndex.Insertion

def classCount (g blocks : Nat) := 2*vertexCount g+3*blocks

/-- The first three positions form the first inserted block. In the two-block
schedule, positions 9, 10 and 11 give the translate of the first block. -/
def added (blocks c : Nat) : Prop := c<3 ∨ (blocks=2 ∧ 9≤c ∧ c<12)

instance (blocks c : Nat) : Decidable (added blocks c) := by unfold added; infer_instance

/-- The original class with the same allowed vertices as the scheduled class. -/
def reference (blocks c : Nat) :=
  if c<3 then c else if blocks=2 ∧ 12≤c then c-6 else c-3

theorem reference_lt {g blocks c : Nat} (hg : 7≤g) (hb : blocks=1 ∨ blocks=2)
    (hc : c<classCount g blocks) : reference blocks c < 2*vertexCount g := by
  unfold reference classCount vertexCount at *
  split_ifs <;> omega

theorem original_position_inj {blocks c d : Nat} (hc : ¬added blocks c)
    (hd : ¬added blocks d) (h : reference blocks c = reference blocks d) : c=d := by
  unfold added at hc hd
  unfold reference at h
  split_ifs at h <;> omega

def Near (p c d : Nat) : Prop := d=c+1 ∨ d=c+2 ∨ d+p=c+1 ∨ d+p=c+2

theorem near_reference {g blocks c d : Nat} (hg : 7≤g) (hb : blocks=1 ∨ blocks=2)
    (hc : c<classCount g blocks) (hd : d<classCount g blocks)
    (hn : Near (classCount g blocks) c d) :
    NearBase g (reference blocks c) (reference blocks d) ∨
    NearBase g (reference blocks d) (reference blocks c) := by
  unfold Near NearBase reference classCount vertexCount at *
  split_ifs <;> omega

def parallelStart (g ε j : Nat) := if j=0 then ε else 2*g+1+2*j

theorem parallel_support {g ε j : Nat} (hg : 7≤g) (hε : ε<2) (hj : j<g) :
    Support g ε (parallelStart g ε j) ∧ Support g ε (parallelStart g ε j+1) ∧
    parallelStart g ε j+1 < vertexCount g := by
  unfold Support parallelStart vertexCount
  split <;> omega

theorem parallel_matching {g ε i j : Nat} (hε : ε<2)
    (h : parallelStart g ε i=parallelStart g ε j ∨
         parallelStart g ε i=parallelStart g ε j+1 ∨
         parallelStart g ε i+1=parallelStart g ε j ∨
         parallelStart g ε i+1=parallelStart g ε j+1) : i=j := by
  unfold parallelStart at h
  split_ifs at h <;> omega

def firstBlockStart (g r j : Nat) :=
  if r=0 then (if j=0 then 0 else 2*g+1+2*j)
  else if r=1 then (if j=0 then 2*g+1 else 4*g+1+2*j)
  else (if j=0 then 4*g+1 else 1+2*j)

/-- Explicit starting point of each oriented unit edge in either block. -/
theorem added_start {g blocks c j : Nat} (hg : 7≤g) (hj : j<g) (ha : added blocks c) :
    rotate (vertexCount g) (parallelStart g (reference blocks c%2) j)
        (baseShift g (reference blocks c)) =
      firstBlockStart g (if c<3 then c else c-9) j + (if c<3 then 0 else 1) := by
  unfold added at ha
  rcases ha with h|⟨rfl,hl,hu⟩
  · have h' : c=0 ∨ c=1 ∨ c=2 := by omega
    rcases h' with rfl|rfl|rfl <;>
      norm_num [reference,baseShift,parallelStart,firstBlockStart,rotate,vertexCount] <;>
      split_ifs <;> omega
  · have h' : c=9 ∨ c=10 ∨ c=11 := by omega
    rcases h' with rfl|rfl|rfl <;>
      norm_num [reference,baseShift,parallelStart,firstBlockStart,rotate,vertexCount] <;>
      split_ifs <;> omega

theorem firstBlock_inj {g r s i j u v : Nat} (hg : 7≤g) (hr : r<3) (hs : s<3)
    (hi : i<g) (hj : j<g) (hu : u<2) (hv : v<2)
    (he : firstBlockStart g r i+u=firstBlockStart g s j+v) : r=s ∧ i=j ∧ u=v := by
  unfold firstBlockStart at he
  split_ifs at he <;> omega

theorem added_start_inj {g blocks c d i j : Nat} (hg : 7≤g) (hi : i<g) (hj : j<g)
    (hc : added blocks c) (hd : added blocks d)
    (he : rotate (vertexCount g) (parallelStart g (reference blocks c%2) i) (baseShift g (reference blocks c)) =
          rotate (vertexCount g) (parallelStart g (reference blocks d%2) j) (baseShift g (reference blocks d))) :
    c=d ∧ i=j := by
  rw [added_start hg hi hc,added_start hg hj hd] at he
  obtain ⟨hr,hij,hu⟩ := firstBlock_inj hg (by unfold added at hc; split <;> omega)
    (by unfold added at hd; split <;> omega) hi hj (by split <;> omega) (by split <;> omega) he
  unfold added at hc hd
  split_ifs at hr hu <;> omega

end CircularIndex.Insertion
