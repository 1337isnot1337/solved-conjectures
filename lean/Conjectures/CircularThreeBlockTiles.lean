import Conjectures.CircularThreeBlockBase

/-! Match the two intervals of a third-block class by edges of lengths three
and five. The long interval is partitioned into six- and ten-vertex pieces. -/

namespace CircularIndex.Insertion.ThreeBlock

def triples (g : ℕ) := (2*(g-3))%5
def quintuples (g : ℕ) := (g-3-3*triples g)/5

theorem packing {g : ℕ} (hg : 15≤g) : 3*triples g+5*quintuples g=g-3 := by
  unfold triples quintuples
  unfold triples
  omega

/-- Both block sizes are arbitrary subject to the equation of Section 5. -/
structure Packing (g : ℕ) where
  six : ℕ
  ten : ℕ
  count : 3*six+5*ten=g-3

def canonicalPacking {g : ℕ} (hg : 15≤g) : Packing g := ⟨triples g,quintuples g,packing hg⟩

inductive Tile (g : ℕ) (K : Packing g) (ε : ℕ) : ℕ → ℕ → ℕ → Prop where
  | short (j : ℕ) (hj : j<3) : Tile g K ε j (ε+j) (ε+j+3)
  | triple (k r : ℕ) (hk : k<K.six) (hr : r<3) :
      Tile g K ε (3+3*k+r) (2*g+7+6*k+r) (2*g+7+6*k+r+3)
  | quintuple (k r : ℕ) (hk : k<K.ten) (hr : r<5) :
      Tile g K ε (3+3*K.six+5*k+r)
        (2*g+7+6*K.six+10*k+r) (2*g+7+6*K.six+10*k+r+5)

theorem tile_exists {g ε j : ℕ} {K : Packing g} (_hg : 15≤g) (hj : j<g) : ∃ a b, Tile g K ε j a b := by
  by_cases h : j<3
  · exact ⟨_,_,.short j h⟩
  have count := K.count
  by_cases h' : j-3<3*K.six
  · let k := (j-3)/3
    let r := (j-3)%3
    have e : j=3+3*k+r := by dsimp [k,r]; omega
    rw [e]
    exact ⟨_,_,.triple k r (by dsimp [k]; omega) (Nat.mod_lt _ (by decide))⟩
  · let k := (j-3-3*K.six)/5
    let r := (j-3-3*K.six)%5
    have e : j=3+3*K.six+5*k+r := by dsimp [k,r]; omega
    rw [e]
    exact ⟨_,_,.quintuple k r (by dsimp [k]; omega) (Nat.mod_lt _ (by decide))⟩

theorem tile_bounds {g ε j a b : ℕ} {K : Packing g} (hg : 15≤g) (hε : ε<2) (h : Tile g K ε j a b) :
    a<b ∧ b<vertexCount g ∧ Support g ε a ∧ Support g ε b ∧ (b=a+3 ∨ b=a+5) := by
  have count := K.count
  unfold vertexCount Support
  cases h <;> omega

theorem tile_matching {g ε i j a b c d : ℕ} {K : Packing g} (hg : 15≤g) (hε : ε<2)
    (h : Tile g K ε i a b) (k : Tile g K ε j c d) (hv : a=c ∨ a=d ∨ b=c ∨ b=d) : i=j := by
  cases h <;> cases k <;> omega

theorem tile_unique {g ε j a b c d : ℕ} {K : Packing g} (h : Tile g K ε j a b) (k : Tile g K ε j c d) :
    a=c ∧ b=d := by
  generalize he : j=j' at k
  cases h <;> cases k <;> omega

theorem tile_length {g ε j a b : ℕ} {K : Packing g} (hg : 15≤g) (hε : ε<2) (h : Tile g K ε j a b) :
    cyclicLength (vertexCount g) a b=3 ∨ cyclicLength (vertexCount g) a b=5 := by
  obtain ⟨_,_,_,_,hl⟩ := tile_bounds hg hε h
  unfold cyclicLength vertexCount
  omega

end CircularIndex.Insertion.ThreeBlock
