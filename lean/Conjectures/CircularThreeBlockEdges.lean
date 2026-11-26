import Conjectures.CircularThreeBlockPositions
import Conjectures.CircularThreeBlockTiles
import Conjectures.CircularInsertionWindows

/-! Every scheduled edge is obtained by rotating one of the two original
base matchings or one of the three inserted matchings. -/

namespace CircularIndex.Insertion.ThreeBlock

noncomputable def chosenPair (g ε j : ℕ) : ℕ × ℕ :=
  Classical.epsilon (fun z : ℕ × ℕ => Pair g ε j z.1 z.2)

theorem chosenPair_spec {g ε j : ℕ} (hg : 15≤g) (hε : ε<2) (hj : j<g) :
    Pair g ε j (chosenPair g ε j).1 (chosenPair g ε j).2 := by
  apply Classical.epsilon_spec (p := fun z : ℕ × ℕ => Pair g ε j z.1 z.2)
  obtain ⟨a,b,h⟩ := pair_exists hg hε hj
  exact ⟨(a,b),h⟩

noncomputable def chosenTile (g : ℕ) (K : Packing g) (ε j : ℕ) : ℕ × ℕ :=
  Classical.epsilon (fun z : ℕ × ℕ => Tile g K ε j z.1 z.2)

theorem chosenTile_spec {g ε j : ℕ} {K : Packing g} (hg : 15≤g) (hj : j<g) :
    Tile g K ε j (chosenTile g K ε j).1 (chosenTile g K ε j).2 := by
  apply Classical.epsilon_spec (p := fun z : ℕ × ℕ => Tile g K ε j z.1 z.2)
  obtain ⟨a,b,h⟩ := tile_exists (K := K) (ε := ε) hg hj
  exact ⟨(a,b),h⟩

def kind (c : ℕ) := reference c%2

noncomputable def rawPair (g : ℕ) (K : Packing g) (c j : ℕ) : ℕ × ℕ :=
  if unitBlock c then
    let a := parallelStart g (kind c) j
    (a,a+1)
  else if lastBlock c then chosenTile g K (kind c) j else chosenPair g (kind c) j

theorem rawPair_spec {g c j : ℕ} {K : Packing g} (hg : 15≤g) (hj : j<g) :
    let z := rawPair g K c j
    z.1<z.2 ∧ z.2<vertexCount g ∧ Support g (kind c) z.1 ∧ Support g (kind c) z.2 := by
  dsimp only
  have hε : kind c<2 := Nat.mod_lt _ (by decide)
  by_cases h : unitBlock c
  · rw [rawPair,ite_eq_left h]
    obtain ⟨ha,hb,hn⟩ := parallel_support hg hε hj
    exact ⟨Nat.lt_succ_self _,hn,ha,hb⟩
  · rw [rawPair,ite_eq_right h]
    by_cases k : lastBlock c
    · rw [ite_eq_left k]
      obtain ⟨hab,hn,ha,hb,_⟩ := tile_bounds hg hε (chosenTile_spec (K := K) hg hj)
      exact ⟨hab,hn,ha,hb⟩
    · rw [ite_eq_right k]
      exact pair_bounds hg (chosenPair_spec hg hε hj)

noncomputable def rotatedPair (g : ℕ) (K : Packing g) (c j : ℕ) : ℕ × ℕ :=
  let z := rawPair g K c j
  let t := baseShift g (reference c)
  (rotate (vertexCount g) z.1 t, rotate (vertexCount g) z.2 t)

theorem rotatedPair_bounds {g c j : ℕ} {K : Packing g} (hg : 15≤g) (hc : c<colours g) (hj : j<g) :
    let z := rotatedPair g K c j
    z.1<vertexCount g ∧ z.2<vertexCount g ∧ z.1≠z.2 := by
  obtain ⟨hab,hr,_,_⟩ := rawPair_spec (K := K) (c := c) hg hj
  have hs := baseShift_lt (reference_lt hg hc)
  exact ⟨rotate_lt (hab.trans hr) hs,rotate_lt hr hs,fun h => hab.ne (rotate_left_inj (hab.trans hr) hr hs h)⟩

theorem rotatedPair_distance {g c j : ℕ} {K : Packing g} (hg : 15≤g) (hc : c<colours g) (hj : j<g) :
    let z := rotatedPair g K c j
    let r := rawPair g K c j
    distance (vertexCount g) z.1 z.2=cyclicLength (vertexCount g) r.1 r.2 := by
  obtain ⟨hab,hr,_,_⟩ := rawPair_spec (K := K) (c := c) hg hj
  exact rotated_distance hab hr (baseShift_lt (reference_lt hg hc))


theorem unit_length {g c j : ℕ} {K : Packing g} (hg : 15≤g) (h : unitBlock c) :
    cyclicLength (vertexCount g) (rawPair g K c j).1 (rawPair g K c j).2=1 := by
  simp only [rawPair,ite_eq_left h]
  change min ((parallelStart g (kind c) j+1)-parallelStart g (kind c) j)
    (6*g+1-((parallelStart g (kind c) j+1)-parallelStart g (kind c) j))=1
  omega

theorem last_length {g c j : ℕ} {K : Packing g} (hg : 15≤g) (hj : j<g) (h : lastBlock c) :
    let z := rawPair g K c j
    cyclicLength (vertexCount g) z.1 z.2=3 ∨ cyclicLength (vertexCount g) z.1 z.2=5 := by
  have h' : ¬unitBlock c := by unfold lastBlock at h; unfold unitBlock; omega
  dsimp only
  simp only [rawPair,ite_eq_right h',ite_eq_left h]
  exact tile_length hg (show kind c<2 from Nat.mod_lt _ (by decide)) (chosenTile_spec (K := K) hg hj)

theorem original_length {g c j : ℕ} {K : Packing g} (hg : 15≤g) (hj : j<g) (h : ¬unitBlock c) (k : ¬lastBlock c) :
    let z := rawPair g K c j
    let d := cyclicLength (vertexCount g) z.1 z.2
    d≠1 ∧ d≠3 ∧ d≠5 := by
  dsimp only
  simp only [rawPair,ite_eq_right h,ite_eq_right k]
  exact pair_avoids_blocks hg (chosenPair_spec hg (show kind c<2 from Nat.mod_lt _ (by decide)) hj)

end CircularIndex.Insertion.ThreeBlock
