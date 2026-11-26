import Conjectures.CircularInsertionBaseDisjoint
import Conjectures.CircularInsertionPositions

/-! Raw and rotated endpoints of the actual matching classes. -/

namespace CircularIndex.Insertion

noncomputable def chosenPair (g ε j : Nat) : Nat × Nat :=
  Classical.epsilon (fun z : Nat × Nat => BasePair g ε j z.1 z.2)

theorem chosenPair_spec {g ε j : Nat} (hg : 7≤g) (hε : ε<2) (hj : j<g) :
    BasePair g ε j (chosenPair g ε j).1 (chosenPair g ε j).2 := by
  apply Classical.epsilon_spec (p := fun z : Nat × Nat => BasePair g ε j z.1 z.2)
  obtain ⟨a,b,h⟩ := basePair_exists hg hε hj
  exact ⟨(a,b),h⟩

def kind (blocks c : Nat) := reference blocks c%2

noncomputable def rawPair (g blocks c j : Nat) : Nat × Nat :=
  if added blocks c then
    let a := parallelStart g (kind blocks c) j
    (a,a+1)
  else chosenPair g (kind blocks c) j

theorem rawPair_spec {g blocks c j : Nat} (hg : 7≤g) (hj : j<g) :
    let z := rawPair g blocks c j
    z.1<z.2 ∧ z.2<vertexCount g ∧ Support g (kind blocks c) z.1 ∧
      Support g (kind blocks c) z.2 := by
  dsimp only
  have he : kind blocks c < 2 := Nat.mod_lt _ (by decide)
  by_cases h : added blocks c
  · rw [rawPair,ite_eq_left h]
    obtain ⟨ha,hb,hn⟩ := parallel_support hg he hj
    exact ⟨Nat.lt_succ_self _,hn,ha,hb⟩
  · rw [rawPair,ite_eq_right h]
    exact basePair_bounds hg (chosenPair_spec hg he hj)

def SameEnds (a b c d : Nat) : Prop := (a=c ∧ b=d) ∨ (a=d ∧ b=c)

theorem same_distance {n a b c d : Nat} (h : SameEnds a b c d) :
    distance n a b = distance n c d := by
  rcases h with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩
  · rfl
  · exact distance_swap ..

theorem unit_start {n a b s t : Nat} (hn : 2<n) (ha : a+1<n) (_hb : b+1<n)
    (hs : s<n) (_ht : t<n)
    (h : SameEnds (rotate n a s) (rotate n (a+1) s) (rotate n b t) (rotate n (b+1) t)) :
    rotate n a s = rotate n b t := by
  rcases h with h | ⟨h₁,h₂⟩
  · exact h.1
  · unfold rotate at h₁ h₂
    split_ifs at h₁ h₂ <;> omega

noncomputable def rotatedPair (g blocks c j : Nat) : Nat × Nat :=
  let z := rawPair g blocks c j
  let t := baseShift g (reference blocks c)
  (rotate (vertexCount g) z.1 t,rotate (vertexCount g) z.2 t)

theorem rotatedPair_bounds {g blocks c j : Nat} (hg : 7≤g) (hb : blocks=1 ∨ blocks=2)
    (hc : c<classCount g blocks) (hj : j<g) :
    let z := rotatedPair g blocks c j
    z.1<vertexCount g ∧ z.2<vertexCount g ∧ z.1≠z.2 := by
  obtain ⟨hab,hr,_,_⟩ := rawPair_spec (blocks := blocks) (c := c) hg hj
  have hs := baseShift_lt (reference_lt hg hb hc)
  exact ⟨rotate_lt (hab.trans hr) hs,rotate_lt hr hs,
    fun h => hab.ne (rotate_left_inj (hab.trans hr) hr hs h)⟩

theorem rotatedPair_distance {g blocks c j : Nat} (hg : 7≤g) (hb : blocks=1 ∨ blocks=2)
    (hc : c<classCount g blocks) (hj : j<g) :
    let z := rotatedPair g blocks c j
    let r := rawPair g blocks c j
    distance (vertexCount g) z.1 z.2 = cyclicLength (vertexCount g) r.1 r.2 := by
  obtain ⟨hab,hr,_,_⟩ := rawPair_spec (blocks := blocks) (c := c) hg hj
  exact rotated_distance hab hr (baseShift_lt (reference_lt hg hb hc))

theorem rawPair_unit {g blocks c j : Nat} (hg : 7≤g) (hc : added blocks c) :
    let r := rawPair g blocks c j
    cyclicLength (vertexCount g) r.1 r.2 = 1 := by
  dsimp only
  rw [rawPair,ite_eq_left hc]
  change min ((parallelStart g (kind blocks c) j + 1) - parallelStart g (kind blocks c) j)
    (6*g+1-((parallelStart g (kind blocks c) j+1)-parallelStart g (kind blocks c) j)) = 1
  omega

theorem rawPair_long {g blocks c j : Nat} (hg : 7≤g) (hj : j<g) (hc : ¬added blocks c) :
    let r := rawPair g blocks c j
    2 ≤ cyclicLength (vertexCount g) r.1 r.2 := by
  dsimp only
  rw [rawPair,ite_eq_right hc]
  exact (basePair_length_range hg (chosenPair_spec hg (Nat.mod_lt _ (by decide)) hj)).1

end CircularIndex.Insertion
