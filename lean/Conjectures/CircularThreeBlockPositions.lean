import Conjectures.CircularThreeBlockSeparation
import Conjectures.CircularInsertionPositions

/-! Cyclic locations of the three insertions and the starting points of
the two translated unit-edge blocks. -/

namespace CircularIndex.Insertion.ThreeBlock

def colours (g : ℕ) := 2*vertexCount g+9

def unitBlock (c : ℕ) : Prop := c<3 ∨ (9≤c ∧ c<12)
def lastBlock (c : ℕ) : Prop := 18≤c ∧ c<21

instance (c : ℕ) : Decidable (unitBlock c) := by unfold unitBlock; infer_instance
instance (c : ℕ) : Decidable (lastBlock c) := by unfold lastBlock; infer_instance

def reference (c : ℕ) :=
  if c<3 then c else if 21≤c then c-9 else if 12≤c then c-6 else c-3

theorem reference_lt {g c : ℕ} (hg : 15≤g) (hc : c<colours g) :
    reference c<2*vertexCount g := by
  unfold reference colours vertexCount at *
  split_ifs <;> omega

theorem original_position_inj {c d : ℕ} (hc : ¬unitBlock c) (hd : ¬unitBlock d)
    (hc' : ¬lastBlock c) (hd' : ¬lastBlock d) (he : reference c=reference d) : c=d := by
  unfold unitBlock at hc hd
  unfold lastBlock at hc' hd'
  unfold reference at he
  split_ifs at he <;> omega

theorem near_reference {g c d : ℕ} (hg : 15≤g) (hc : c<colours g) (hd : d<colours g)
    (hn : Near (colours g) c d) :
    NearBase g (reference c) (reference d) ∨ NearBase g (reference d) (reference c) := by
  unfold Near NearBase reference colours vertexCount at *
  split_ifs <;> omega

def parallelStart (g ε j : ℕ) := if j<3 then ε+2*j else 2*g+1+2*j

theorem parallel_support {g ε j : ℕ} (hg : 15≤g) (hε : ε<2) (hj : j<g) :
    Support g ε (parallelStart g ε j) ∧ Support g ε (parallelStart g ε j+1) ∧
    parallelStart g ε j+1<vertexCount g := by
  unfold Support parallelStart vertexCount
  split <;> omega

theorem parallel_matching {g ε i j : ℕ} (hg : 15≤g) (hε : ε<2)
    (h : parallelStart g ε i=parallelStart g ε j ∨ parallelStart g ε i=parallelStart g ε j+1 ∨
         parallelStart g ε i+1=parallelStart g ε j ∨ parallelStart g ε i+1=parallelStart g ε j+1) :
    i=j := by
  unfold parallelStart at h
  split_ifs at h <;> omega

def firstBlockStart (g r j : ℕ) :=
  if r=0 then (if j<3 then 2*j else 2*g+1+2*j)
  else if r=1 then (if j<3 then 2*g+1+2*j else 4*g+1+2*j)
  else (if j<3 then 4*g+1+2*j else 1+2*j)

theorem added_start {g c j : ℕ} (hg : 15≤g) (hj : j<g) (ha : unitBlock c) :
    rotate (vertexCount g) (parallelStart g (reference c%2) j) (baseShift g (reference c)) =
      firstBlockStart g (if c<3 then c else c-9) j + (if c<3 then 0 else 1) := by
  unfold unitBlock at ha
  have hc : c=0 ∨ c=1 ∨ c=2 ∨ c=9 ∨ c=10 ∨ c=11 := by omega
  rcases hc with rfl|rfl|rfl|rfl|rfl|rfl <;>
    norm_num [reference,baseShift,parallelStart,firstBlockStart,rotate,vertexCount] <;>
    split_ifs <;> omega

private theorem firstBlock_inj {g r s i j u v : ℕ} (hg : 15≤g) (hr : r<3) (hs : s<3)
    (hi : i<g) (hj : j<g) (hu : u<2) (hv : v<2)
    (he : firstBlockStart g r i+u=firstBlockStart g s j+v) : r=s ∧ i=j ∧ u=v := by
  unfold firstBlockStart at he
  split_ifs at he <;> omega

theorem added_start_inj {g c d i j : ℕ} (hg : 15≤g) (hi : i<g) (hj : j<g)
    (hc : unitBlock c) (hd : unitBlock d)
    (he : rotate (vertexCount g) (parallelStart g (reference c%2) i) (baseShift g (reference c)) =
          rotate (vertexCount g) (parallelStart g (reference d%2) j) (baseShift g (reference d))) :
    c=d ∧ i=j := by
  rw [added_start hg hi hc,added_start hg hj hd] at he
  obtain ⟨hr,hij,hu⟩ := firstBlock_inj hg (by unfold unitBlock at hc; split <;> omega)
    (by unfold unitBlock at hd; split <;> omega) hi hj (by split <;> omega) (by split <;> omega) he
  unfold unitBlock at hc hd
  split_ifs at hr hu <;> omega

end CircularIndex.Insertion.ThreeBlock
