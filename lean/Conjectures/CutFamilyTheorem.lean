import Conjectures.CutFamilyCover
import Conjectures.CutFamilyGame
import Mathlib.Data.List.Basic

namespace CutFamily

/-- The explicit formula satisfies the actual mex rule for any set consisting
of 1 and even cuts whose least member is x.  This includes infinite cut sets. -/
theorem even_base_mex (x : Nat) (hx : 4 ≤ x) (heven : x%2=0)
    (cuts : Set Nat) (h1 : 1 ∈ cuts) (hxcut : x ∈ cuts)
    (hcuts : ∀ d ∈ cuts, d=1 ∨ (x ≤ d ∧ d%2=0)) :
    SatisfiesMex cuts (value x) := by
  intro n hn
  constructor
  · rintro ⟨l,hpos,hlen,hcut,hsum,hxor⟩
    rcases hcuts _ hcut with hd | ⟨hd,he⟩
    · have hlen2 : l.length=2 := by omega
      obtain ⟨a,b,rfl⟩ := List.length_eq_two.mp hlen2
      have ha := hpos a (by simp)
      have hb := hpos b (by simp)
      simp only [List.sum_cons, List.sum_nil, Nat.add_zero] at hsum
      simp only [List.map_cons, List.map_nil, xorList, Nat.xor_zero] at hxor
      exact binary_cut_excludes x hx a b ha hb (by simpa only [hsum] using hxor)
    · have hh := even_cut_excludes x hx l hpos (by omega) (by omega)
      exact hh (by simpa only [hsum] using hxor)
  · intro v hv
    let q := (n-1)/(6*x)
    let r := (n-1)%(6*x)+1
    let j := v/8
    let z := v%8
    have hD : 0 < 6*x := by omega
    have hr : 0 < r := by dsimp [r]; omega
    have hru : r ≤ 6*x := by
      have hh := Nat.mod_lt (n-1) hD
      dsimp [r]
      omega
    have hnr : n=6*x*q+r := by
      have hh := Nat.mod_add_div (n-1) (6*x)
      dsimp [q,r]
      omega
    have hz : z < 8 := by dsimp [z]; omega
    have hvj : v=8*j+z := by
      have hh := Nat.mod_add_div v 8
      dsimp [j,z]
      omega
    have hval : value x n=8*q+block x r := by rw [hnr]; exact value_period x q r hx hr hru
    have hj : j ≤ q := by
      have hb := block_lt_eight x r
      omega
    have hpar : (n+1)%2=(r+1)%2 := by rw [hnr]; simp [Nat.add_mod,Nat.mul_mod]
    have realize : ∀ j, 6*x*j+x+1+cost x (z ^^^ ((n+1)%2)) ≤ n →
        OptionValue cuts (value x) n (8*j+z) := by
      intro j hs
      obtain ⟨l,hp,hl,hs,hv⟩ := many_pile_witness x n j z hx heven hz hs
      exact ⟨l,hp,by omega,by simpa only [hl, Nat.add_sub_cancel] using hxcut,hs,hv⟩
    by_cases hjlt : j < q
    · have hc := cost_le_five x (z ^^^ ((n+1)%2)) (by omega)
        (Nat.xor_lt_two_pow (n := 3) hz (by omega))
      have hmul : 6*x*j+6*x ≤ 6*x*q := by nlinarith
      rw [hvj]
      apply realize j
      omega
    · have hjq : j=q := by omega
      have hzb : z < block x r := by omega
      rcases first_period_cover x r z hx heven hr hru hzb with
        ⟨a,b,ha,hb,hab,habxor⟩ | hcost
      · have hau : a ≤ 6*x := by omega
        have hbu : b ≤ 6*x := by omega
        refine ⟨[6*x*q+a,b],?_,by simp,?_,?_,?_⟩
        · simp only [List.mem_cons, List.not_mem_nil, or_false]
          intro t ht
          rcases ht with rfl|rfl <;> omega
        · simpa using h1
        · simp only [List.sum_cons,List.sum_nil,Nat.add_zero]
          omega
        · simp only [List.map_cons,List.map_nil,xorList,Nat.xor_zero]
          rw [value_period x q a hx ha hau, value_first_period x b hb hbu,
            xor_low q (block x a) (block x b) (block_lt_eight x a) (block_lt_eight x b),
            habxor]
          omega
      · rw [hvj,hjq]
        apply realize q
        rw [hpar]
        omega

/-- Family B, with the base formula and preservation under every additional
even cut proved internally. -/
theorem family_b_threshold (x y : Nat) (hx : 4 ≤ x) (heven : x%2=0)
    (hy : 5 ≤ y) (hodd : y%2=1) (base extra : Set Nat)
    (h1 : 1 ∈ base) (hxbase : x ∈ base)
    (hbasecuts : ∀ d ∈ base, d=1 ∨ (x ≤ d ∧ d%2=0))
    (hyextra : y ∈ extra) (hmin : ∀ d ∈ extra, y ≤ d)
    (G : Nat → Nat) (hG : SatisfiesMex (base ∪ extra) G) :
    (∀ n, 0 < n → G n=value x n) ↔ 3*x < y := by
  exact family_b_threshold_of_base_formula x y hx heven hy hodd base extra
    hyextra hmin (even_base_mex x hx heven base h1 hxbase hbasecuts) G hG

/-- Comparison with the original two-cut game, stated through its actual mex
equations rather than through the displayed six-block expression. -/
theorem family_b_game_comparison (x y : Nat) (hx : 4 ≤ x) (heven : x%2=0)
    (hy : 5 ≤ y) (hodd : y%2=1) (base extra : Set Nat)
    (h1 : 1 ∈ base) (hxbase : x ∈ base)
    (hbasecuts : ∀ d ∈ base, d=1 ∨ (x ≤ d ∧ d%2=0))
    (hyextra : y ∈ extra) (hmin : ∀ d ∈ extra, y ≤ d)
    (G H : Nat → Nat) (hG : SatisfiesMex (base ∪ extra) G)
    (hH : SatisfiesMex {d | d=1 ∨ d=x} H) :
    (∀ n, 0 < n → G n=H n) ↔ 3*x < y := by
  have hformula : ∀ n, 0 < n → H n=value x n := by
    apply grundy_unique _ _ _ hH
    apply even_base_mex x hx heven _ (by simp) (by simp)
    intro d hd
    rcases hd with rfl|rfl
    · exact Or.inl rfl
    · exact Or.inr ⟨le_rfl,heven⟩
  have heq : (∀ n, 0 < n → G n=H n) ↔ (∀ n, 0 < n → G n=value x n) := by
    constructor <;> intro h n hn
    · rw [h n hn, hformula n hn]
    · rw [h n hn, hformula n hn]
  rw [heq]
  exact family_b_threshold x y hx heven hy hodd base extra h1 hxbase hbasecuts
    hyextra hmin G hG

#print axioms even_base_mex
#print axioms family_b_threshold
#print axioms family_b_game_comparison

theorem game_base_formula (x : Nat) (hx : 4 ≤ x) (heven : x%2=0) :
    ∀ n, 0 < n → gameValue ({1,x} : Set Nat) n=value x n := by
  apply grundy_unique _ _ _ (gameValue_mex _)
  apply even_base_mex x hx heven _ (by simp) (by simp)
  intro d hd
  have hh : d=1 ∨ d=x := by simpa using hd
  rcases hh with rfl|rfl
  · exact Or.inl rfl
  · exact Or.inr ⟨le_rfl,heven⟩

/-- The complete Family B theorem for the recursively defined CUT games.
The sets of even and odd cuts can both be infinite. -/
theorem family_b (X Y : Set Nat) (x y : Nat)
    (hxmem : x ∈ X) (hyMem : y ∈ Y)
    (hX : ∀ d ∈ X, 4 ≤ d ∧ d%2=0)
    (hY : ∀ d ∈ Y, 5 ≤ d ∧ d%2=1)
    (hxMin : ∀ d ∈ X, x ≤ d) (hyMin : ∀ d ∈ Y, y ≤ d) :
    (∀ n, 0 < n → gameValue ({1} ∪ X ∪ Y) n=gameValue ({1,x} : Set Nat) n) ↔
      3*x < y := by
  obtain ⟨hx,heven⟩ := hX x hxmem
  obtain ⟨hy,hodd⟩ := hY y hyMem
  have hb : ∀ d ∈ ({1} ∪ X : Set Nat), d=1 ∨ (x ≤ d ∧ d%2=0) := by
    intro d hd
    rcases hd with hd|hd
    · exact Or.inl (by simpa using hd)
    · exact Or.inr ⟨hxMin d hd,(hX d hd).2⟩
  have htwo : ({1,x} : Set Nat) = {d | d=1 ∨ d=x} := by ext d; simp
  apply family_b_game_comparison x y hx heven hy hodd ({1} ∪ X) Y
    (by simp) (Or.inr hxmem) hb hyMem hyMin _ _ (gameValue_mex _)
  rw [← htwo]
  exact gameValue_mex _

/-- The sharpness witness forces a difference no later than pile size 4x. -/
theorem family_b_difference_by_four_x (X Y : Set Nat) (x y : Nat)
    (hxmem : x ∈ X) (hyMem : y ∈ Y)
    (hX : ∀ d ∈ X, 4 ≤ d ∧ d%2=0)
    (hY : ∀ d ∈ Y, 5 ≤ d ∧ d%2=1) (hylt : y < 3*x) :
    ∃ n, 0 < n ∧ n ≤ 4*x ∧
      gameValue ({1} ∪ X ∪ Y) n ≠ gameValue ({1,x} : Set Nat) n := by
  obtain ⟨hx,heven⟩ := hX x hxmem
  obtain ⟨hy,hodd⟩ := hY y hyMem
  obtain ⟨n,hn,hnu,hne⟩ := small_odd_cut_forces_difference x y hx heven hy hodd
    hylt ({1} ∪ X ∪ Y) (Or.inr hyMem) _ (gameValue_mex _)
  refine ⟨n,hn,hnu,?_⟩
  simpa only [game_base_formula x hx heven n hn] using hne

#print axioms family_b
#print axioms family_b_difference_by_four_x

end CutFamily
