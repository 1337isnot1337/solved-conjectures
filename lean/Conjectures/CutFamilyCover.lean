import Conjectures.CutFamilyBase

namespace CutFamily

theorem block_first_eq (x r : Nat) (hr : r ≤ x) : block x r=(r+1)%2 := by
  simp only [block,ite_eq_left hr]

theorem block_second_eq (x r : Nat) (hl : x < r) (hu : r ≤ 2*x) :
    block x r=2+(r+1)%2 := by
  simp only [block,ite_eq_right (by omega : ¬ r ≤ x),ite_eq_left hu]

theorem block_third_eq (x r : Nat) (hl : 2*x+1 < r) (hu : r ≤ 3*x) :
    block x r=if r%2=0 then 4 else 5 := by
  simp only [block,ite_eq_right (by omega : ¬ r ≤ x),
    ite_eq_right (by omega : ¬ r ≤ 2*x),ite_eq_left hu,
    ite_eq_right (by omega : r ≠ 2*x+1)]

theorem binary_residue_one (x r z : Nat) (hx : 4 ≤ x) (hr : 1 < r)
    (hv : block x (r-1)=z) :
    ∃ a b : Nat, 0 < a ∧ 0 < b ∧ a+b=r ∧ block x a ^^^ block x b=z := by
  refine ⟨1,r-1,by omega,by omega,by omega,?_⟩
  rw [block_first_eq x 1 (by omega),hv]
  simp

theorem binary_residue_x (x r z : Nat) (hx : 4 ≤ x) (heven : x%2=0)
    (hr : x < r) (hv : 1 ^^^ block x (r-x)=z) :
    ∃ a b : Nat, 0 < a ∧ 0 < b ∧ a+b=r ∧ block x a ^^^ block x b=z := by
  refine ⟨x,r-x,by omega,by omega,by omega,?_⟩
  rw [block_first_eq x x le_rfl]
  have hp : (x+1)%2=1 := by omega
  simpa only [hp] using hv

theorem binary_residue_x_one (x r z : Nat) (hx : 4 ≤ x) (heven : x%2=0)
    (hr : x+1 < r) (hv : 2 ^^^ block x (r-(x+1))=z) :
    ∃ a b : Nat, 0 < a ∧ 0 < b ∧ a+b=r ∧ block x a ^^^ block x b=z := by
  refine ⟨x+1,r-(x+1),by omega,by omega,by omega,?_⟩
  rw [block_second_eq x (x+1) (by omega) (by omega)]
  have hp : (x+1+1)%2=0 := by omega
  simpa only [hp,Nat.add_zero] using hv

set_option maxHeartbeats 1000000 in
theorem first_period_large_cover (x r z : Nat) (hx : 4 ≤ x)
    (hl : 3*x < r) (hu : r ≤ 6*x) (hz : z < block x r) :
    x+1+cost x (z ^^^ ((r+1)%2)) ≤ r := by
  have hz8 : z < 8 := lt_trans hz (block_lt_eight x r)
  have hp : (r+1)%2 < 2 := Nat.mod_lt _ (by decide)
  interval_cases z <;> interval_cases hpar : (r+1)%2
  all_goals
    unfold block at hz
    split_ifs at hz
  all_goals first | omega | (norm_num [cost] at *; omega)

/-- Every missing value in the first period has an explicit binary split, or
fits the general x+1-pile witness.  Only the three left parts 1, x, x+1 occur. -/
theorem first_period_cover (x r z : Nat) (hx : 4 ≤ x) (heven : x%2=0)
    (hr : 0 < r) (hru : r ≤ 6*x) (hz : z < block x r) :
    (∃ a b : Nat, 0 < a ∧ 0 < b ∧ a+b=r ∧ block x a ^^^ block x b=z) ∨
      x+1+cost x (z ^^^ ((r+1)%2)) ≤ r := by
  by_cases h1 : r ≤ x
  · rw [block_first_eq x r h1] at hz
    have hz0 : z=0 := by omega
    have hp : r%2=0 := by omega
    subst z
    left
    apply binary_residue_one x r 0 hx (by omega)
    rw [block_first_eq x (r-1) (by omega)]
    omega
  by_cases h2 : r ≤ 2*x
  · rw [block_second_eq x r (by omega) h2] at hz
    by_cases hp0 : r%2=0
    · have hp : (r+1)%2=1 := by omega
      rw [hp] at hz
      interval_cases z
      · left
        apply binary_residue_x x r 0 hx heven (by omega)
        rw [block_first_eq x (r-x) (by omega)]
        have hh : (r-x+1)%2=1 := by omega
        rw [hh]
        decide
      · right
        norm_num [hp,cost]
        omega
      · left
        apply binary_residue_one x r 2 hx (by omega)
        rw [block_second_eq x (r-1) (by omega) (by omega)]
        omega
    · have hp : (r+1)%2=0 := by omega
      rw [hp] at hz
      interval_cases z
      · right
        norm_num [hp,cost]
        omega
      · left
        apply binary_residue_x x r 1 hx heven (by omega)
        rw [block_first_eq x (r-x) (by omega)]
        have hh : (r-x+1)%2=0 := by omega
        rw [hh]
        decide
  by_cases h3 : r ≤ 3*x
  · by_cases hspecial : r=2*x+1
    · have hb : block x r=1 := by
        unfold block
        split_ifs; omega
      rw [hb] at hz
      have hz0 : z=0 := by omega
      subst z
      right
      have hp : (r+1)%2=0 := by omega
      norm_num [hp,cost]
      omega
    rw [block_third_eq x r (by omega) h3] at hz
    by_cases hp0 : r%2=0
    · rw [ite_eq_left hp0] at hz
      have hp : (r+1)%2=1 := by omega
      interval_cases z
      · left
        apply binary_residue_x_one x r 0 hx heven (by omega)
        rw [block_second_eq x (r-(x+1)) (by omega) (by omega)]
        have hh : (r-(x+1)+1)%2=0 := by omega
        rw [hh]
        decide
      · right
        norm_num [hp,cost]
        omega
      · left
        apply binary_residue_x x r 2 hx heven (by omega)
        rw [block_second_eq x (r-x) (by omega) (by omega)]
        have hh : (r-x+1)%2=1 := by omega
        rw [hh]
        decide
      · right
        norm_num [hp,cost]
        omega
    · rw [ite_eq_right hp0] at hz
      have hp : (r+1)%2=0 := by omega
      interval_cases z
      · right
        norm_num [hp,cost]
        omega
      · left
        apply binary_residue_x_one x r 1 hx heven (by omega)
        rw [block_second_eq x (r-(x+1)) (by omega) (by omega)]
        have hh : (r-(x+1)+1)%2=1 := by omega
        rw [hh]
        decide
      · right
        norm_num [hp,cost]
        omega
      · left
        apply binary_residue_x x r 3 hx heven (by omega)
        rw [block_second_eq x (r-x) (by omega) (by omega)]
        have hh : (r-x+1)%2=0 := by omega
        rw [hh]
        decide
      · left
        apply binary_residue_one x r 4 hx (by omega)
        rw [block_third_eq x (r-1) (by omega) (by omega)]
        have hh : (r-1)%2=0 := by omega
        simp only [hh,ite_true]
  exact Or.inr (first_period_large_cover x r z hx (by omega) hru hz)

end CutFamily
