import Conjectures.CircularThreeBlockCross

/-! The two indexed base matchings for the uniform three-block construction. -/

namespace CircularIndex.Insertion.ThreeBlock

def Support (g ε v : ℕ) : Prop := (ε≤v ∧ v<ε+6) ∨ (2*g+7≤v ∧ v≤4*g)

def halfGap (g j : ℕ) := if j+1=g then g-5 else j-5

theorem halfGap_range {g j : ℕ} (hg : 15≤g) (h : 6≤j) (hj : j<g) :
    1≤halfGap g j ∧ halfGap g j≤(g-3)-2 ∧ halfGap g j≠(g-3)-3 := by
  unfold halfGap
  split <;> omega

theorem halfGap_inj {g i j : ℕ} (hi : 6≤i) (hi' : i<g) (hj : 6≤j) (hj' : j<g)
    (he : halfGap g i=halfGap g j) : i=j := by
  unfold halfGap at he
  split_ifs at he <;> omega

inductive Pair (g : ℕ) : ℕ → ℕ → ℕ → ℕ → Prop where
  | firstCross (j : ℕ) (hj : j<6) : Pair g 0 j j (3*g+6-j)
  | firstNest (j : ℕ) (h : 6≤j) (hj : j<g) : Pair g 0 j (3*g+6-j) (3*g+1+j)
  | secondCross {j x l : ℕ} (row : Cross g j x l) : Pair g 1 j (j+1) (2*g+7+x)
  | secondNest {j a b : ℕ} (h : 6≤j) (hj : j<g)
      (row : Internal (g-3) (halfGap g j) a b) : Pair g 1 j (2*g+7+a) (2*g+7+b)

theorem pair_exists {g ε j : ℕ} (hg : 15≤g) (hε : ε<2) (hj : j<g) :
    ∃ a b, Pair g ε j a b := by
  rcases (show ε=0 ∨ ε=1 by omega) with rfl|rfl
  · by_cases h : j<6
    · exact ⟨_,_,.firstCross _ h⟩
    · exact ⟨_,_,.firstNest _ (by omega) hj⟩
  · by_cases h : j<6
    · obtain ⟨x,l,hr⟩ := cross_exists (g := g) h
      exact ⟨_,_,.secondCross hr⟩
    · have h' : 6≤j := by omega
      obtain ⟨h₁,h₂,h₃⟩ := halfGap_range hg h' hj
      obtain ⟨a,b,hr⟩ := internal_exists (by omega) h₁ h₂ h₃
      exact ⟨_,_,.secondNest h' hj hr⟩

theorem pair_bounds {g ε j a b : ℕ} (hg : 15≤g) (h : Pair g ε j a b) :
    a<b ∧ b<vertexCount g ∧ Support g ε a ∧ Support g ε b := by
  unfold Support vertexCount
  cases h with
  | firstCross | firstNest => omega
  | secondCross r => obtain ⟨_,_,_,_,_⟩ := cross_bounds hg r; omega
  | secondNest _ _ r => obtain ⟨_,_,_⟩ := internal_bounds (by omega) r; omega

private theorem two_cross_meet {g i j a b l m : ℕ} (hg : 15≤g)
    (r : Cross g i a l) (s : Cross g j b m)
    (hv : i+1=j+1 ∨ i+1=2*g+7+b ∨ 2*g+7+a=j+1 ∨ 2*g+7+a=2*g+7+b) : i=j := by
  obtain ⟨_,_,_,_,_⟩ := cross_bounds hg r
  obtain ⟨_,_,_,_,_⟩ := cross_bounds hg s
  rcases hv with h|h|h|h
  · omega
  · omega
  · omega
  · exact cross_injective hg r s (Or.inl (by omega))

private theorem cross_nest_disjoint {g i j x l a b : ℕ} (hg : 15≤g)
    (r : Cross g i x l) (s : Internal (g-3) (halfGap g j) a b) :
    i+1≠2*g+7+a ∧ i+1≠2*g+7+b ∧ 2*g+7+x≠2*g+7+a ∧ 2*g+7+x≠2*g+7+b := by
  obtain ⟨_,_,_,_,_⟩ := cross_bounds hg r
  obtain ⟨_,_⟩ := internal_avoids_holes (by omega) s (cross_hole hg r)
  omega

theorem pair_matching {g ε i j a b c d : ℕ} (hg : 15≤g)
    (h : Pair g ε i a b) (k : Pair g ε j c d) (hv : a=c ∨ a=d ∨ b=c ∨ b=d) : i=j := by
  cases h <;> cases k
  all_goals try omega
  case secondCross.secondCross => exact two_cross_meet hg (by assumption) (by assumption) hv
  case secondCross.secondNest =>
    obtain ⟨_,_,_,_⟩ := cross_nest_disjoint (i := i) (j := j) hg (by assumption) (by assumption)
    omega
  case secondNest.secondCross =>
    obtain ⟨_,_,_,_⟩ := cross_nest_disjoint (i := j) (j := i) hg (by assumption) (by assumption)
    omega
  case secondNest.secondNest =>
    apply halfGap_inj (by assumption) (by assumption) (by assumption) (by assumption)
    apply internal_matching (N := g-3) (by omega) (by assumption) (by assumption)
    omega

private theorem first_cross_length {g j : ℕ} (hg : 15≤g) (hj : j<6) :
    cyclicLength (6*g+1) j (3*g+6-j) =
      (if j<3 then 3*g-5+2*j else 3*g+6-2*j) := by
  unfold cyclicLength
  split <;> omega

private theorem first_nest_length {g j : ℕ} (hg : 15≤g) (h : 6≤j) (hj : j<g) :
    cyclicLength (6*g+1) (3*g+6-j) (3*g+1+j)=2*j-5 := by
  unfold cyclicLength
  omega

private theorem second_nest_length {g j a b : ℕ} (hg : 15≤g) (h : 6≤j) (hj : j<g)
    (r : Internal (g-3) (halfGap g j) a b) :
    cyclicLength (6*g+1) (2*g+7+a) (2*g+7+b)=2*halfGap g j := by
  obtain ⟨_,_,_⟩ := internal_bounds (by omega) r
  obtain ⟨_,_,_⟩ := halfGap_range hg h hj
  unfold cyclicLength
  omega

/-- The four disjoint length ranges. The first six cross lengths alternate
parity when the direct distance passes half the circle. -/
private inductive LengthAt (g : ℕ) : ℕ → ℕ → ℕ → Prop where
  | low (j : ℕ) (h : j<3) : LengthAt g 0 j (3*g-5+2*j)
  | high (j : ℕ) (h : 3≤j) (hj : j<6) : LengthAt g 0 j (3*g+6-2*j)
  | odd (j : ℕ) (h : 6≤j) (hj : j<g) : LengthAt g 0 j (2*j-5)
  | cross {j x l : ℕ} (row : Cross g j x l) (hl : 2*g<l) (hu : l≤3*g-6) : LengthAt g 1 j l
  | even (j : ℕ) (h : 6≤j) (hj : j<g) (hu : halfGap g j≤g-5) : LengthAt g 1 j (2*halfGap g j)

private theorem length_at {g ε j a b : ℕ} (hg : 15≤g) (h : Pair g ε j a b) :
    LengthAt g ε j (cyclicLength (6*g+1) a b) := by
  cases h with
  | firstCross j h =>
    rw [first_cross_length hg h]
    split
    · exact .low j (by omega)
    · exact .high j (by omega) h
  | firstNest j h hj => rw [first_nest_length hg h hj]; exact .odd j h hj
  | secondCross r =>
    obtain ⟨_,_,hl,hu,he⟩ := cross_bounds hg r
    rw [he]
    exact .cross r hl hu
  | secondNest h hj r =>
    rw [second_nest_length hg h hj r]
    obtain ⟨_,hu,_⟩ := halfGap_range hg h hj
    exact .even _ h hj (by omega)

theorem pair_length_injective {g ε η i j a b c d : ℕ} (hg : 15≤g)
    (h : Pair g ε i a b) (k : Pair g η j c d)
    (he : cyclicLength (6*g+1) a b=cyclicLength (6*g+1) c d) : ε=η ∧ i=j := by
  generalize hL : cyclicLength (6*g+1) a b=L at he
  generalize hM : cyclicLength (6*g+1) c d=M at he
  have h₁ : LengthAt g ε i L := hL ▸ length_at hg h
  have h₂ : LengthAt g η j M := hM ▸ length_at hg k
  clear hL hM h k
  cases h₁ <;> cases h₂
  all_goals try omega
  case cross.cross => exact ⟨rfl,cross_injective hg (by assumption) (by assumption) (Or.inr he)⟩
  case even.even => exact ⟨rfl,halfGap_inj (g := g) (by assumption) (by assumption)
    (by assumption) (by assumption) (by omega)⟩

theorem pair_avoids_blocks {g ε j a b : ℕ} (hg : 15≤g) (h : Pair g ε j a b) :
    let d := cyclicLength (6*g+1) a b
    d≠1 ∧ d≠3 ∧ d≠5 := by
  dsimp only
  cases h with
  | firstCross j h => rw [first_cross_length hg h]; split <;> omega
  | firstNest j h hj => rw [first_nest_length hg h hj]; omega
  | secondCross r => obtain ⟨_,_,_,_,he⟩ := cross_bounds hg r; rw [he]; omega
  | secondNest h hj r => rw [second_nest_length hg h hj r]; omega

end CircularIndex.Insertion.ThreeBlock
