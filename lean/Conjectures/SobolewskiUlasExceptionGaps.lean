module

public import Conjectures.SobolewskiUlasExceptionEnumeration

@[expose] public section
namespace SobolewskiUlasException

/-- The lowest layer already gives a next exception within twelve of
every integer. -/
theorem base_between (y : ℕ) : ∃ z,y<baseValue z ∧ baseValue z≤y+12 := by
  let k := y/8
  have h₁ := (offset_bounds k).1
  have h₂ := (offset_bounds k).2
  have h₃ := (offset_bounds (k+1)).1
  have h₄ := (offset_bounds (k+1)).2
  have hq : 8*k≤y ∧ y<8*k+8 := by dsimp [k]; omega
  by_cases h : y<baseValue k
  · refine ⟨k,h,?_⟩
    change 8*k+layerOffset k≤y+12
    omega
  · have hbase : 8*k+layerOffset k≤y := le_of_not_gt h
    refine ⟨k+1,?_,?_⟩
    · change y<8*(k+1)+layerOffset (k+1)
      omega
    · change 8*(k+1)+layerOffset (k+1)≤y+12
      omega

theorem countExceptions_lt_of_mem_between {x y : ℕ} (hxy : x<y) (hy : inScaled y) :
    countExceptions x<countExceptions y := by
  have hm : y∉scaledUpTo x := fun hm => hxy.not_ge ((mem_scaledUpTo.mp hm).1)
  have hsub : insert y (scaledUpTo x) ⊆ scaledUpTo y := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl|hz
    · exact mem_scaledUpTo.mpr ⟨le_rfl,hy⟩
    · exact scaledUpTo_mono hxy.le hz
  have hc := Finset.card_le_card hsub
  rw [Finset.card_insert_of_notMem hm] at hc
  exact hc

/-- Every successive gap in the increasing actual enumeration is a
positive integer at most twelve. -/
theorem nthException_gap_bounds (n : ℕ) :
    1≤nthException (n+1)-nthException n ∧ nthException (n+1)-nthException n≤12 := by
  have hlt : nthException n<nthException (n+1) := nthException_strictMono (Nat.lt_succ_self n)
  obtain ⟨s,hlo,hhi⟩ := base_between (nthException n)
  have hmem : inScaled (baseValue s) := ⟨0,s,by simp⟩
  have hcard := countExceptions_lt_of_mem_between hlo hmem
  rw [countExceptions_nth] at hcard
  have hle : nthException (n+1)≤baseValue s := nthException_le_of_count (Nat.succ_le_of_lt hcard)
  omega

theorem inScaled_eq_enumeration (y : ℕ) :
    inScaled y ↔ ∃ n : ℕ,0<n ∧ nthException n=y := by
  classical
  constructor
  · intro hy
    have hpos : 0<y := by
      obtain ⟨j,s,rfl⟩ := hy
      have ho := (offset_bounds s).1
      apply Nat.mul_pos (by positivity)
      unfold baseValue
      omega
    let n := countExceptions y
    let z := y-1
    have hz : y=z+1 := by dsimp [z]; omega
    have hc : countExceptions y=countExceptions z+1 := by
      rw [hz,countExceptions_succ]
      rw [hz] at hy
      rw [ite_eq_left hy]
    have h1 : nthException n≤y := nthException_le_of_count le_rfl
    have h2 : y≤nthException n := by
      by_contra! h
      have hx := countExceptions_mono (show nthException n≤z by omega)
      rw [countExceptions_nth] at hx
      change countExceptions y≤countExceptions z at hx
      omega
    refine ⟨n,?_,le_antisymm h1 h2⟩
    change 0<countExceptions y
    omega
  · rintro ⟨n,hn,rfl⟩
    exact nthException_mem hn

end SobolewskiUlasException
