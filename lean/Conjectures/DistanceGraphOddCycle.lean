import Conjectures.NonmixedGapPeriodic

/-! The two-difference endpoint used when k=1. The upper bound is a bound
on the actual symmetric limsup density, and the explicit periodic set attains it. -/
namespace DistanceGraph

open NonmixedGap

theorem adjacent_pair_count (A : Set ℤ)
    (hA : ∀ t ∈ A, t+1 ∉ A) (u : ℤ) : count A u (u+2) ≤ 1 := by
  classical
  have hc := count_add A (show u ≤ u+1 by omega) (show u+1 ≤ u+2 by omega)
  have he : u+2 = (u+1)+1 := by ring
  rw [he,count_unit,count_unit] at hc
  rw [he]
  by_cases hu : u ∈ A
  · have hn := hA u hu
    simp only [hu,hn,ite_true,ite_false] at hc
    omega
  · by_cases hn : u+1 ∈ A
    · simp only [hu,hn,ite_true,ite_false] at hc
      omega
    · simp only [hu,hn,ite_false] at hc
      omega

theorem adjacent_even_count (A : Set ℤ)
    (hA : ∀ t ∈ A, t+1 ∉ A) (n : ℕ) (u : ℤ) :
    count A u (u+2*(n:ℤ)) ≤ n := by
  induction n generalizing u with
  | zero => simp only [Nat.cast_zero,mul_zero,add_zero,count_self,le_refl]
  | succ n ih =>
    have hpair := adjacent_pair_count A hA u
    have htail := ih (u+2)
    have hc := count_add A (show u ≤ u+2 by omega)
      (show u+2 ≤ u+2*((n+1:ℕ):ℤ) by omega)
    have he : u+2*((n+1:ℕ):ℤ) = (u+2)+2*(n:ℤ) := by omega
    rw [he] at hc ⊢
    omega

theorem odd_cycle_anchor_count (A : Set ℤ) (l : ℕ)
    (hA : ∀ t ∈ A, t+1 ∉ A) (hB : ∀ t ∈ A, t+2*(l:ℤ) ∉ A)
    (u : ℤ) (hu : u ∈ A) : count A u (u+((2*l+1:ℕ):ℤ)) ≤ l := by
  classical
  have he : u+((2*l+1:ℕ):ℤ) = (u+2*(l:ℤ))+1 := by omega
  rw [he]
  have hc := count_add A (show u ≤ u+2*(l:ℤ) by omega)
    (show u+2*(l:ℤ) ≤ (u+2*(l:ℤ))+1 by omega)
  rw [count_unit,ite_eq_right (hB u hu),add_zero] at hc
  rw [hc]
  exact adjacent_even_count A hA l u

theorem odd_cycle_upperDensity (A : Set ℤ) (l : ℕ)
    (hA : ∀ t ∈ A, t+1 ∉ A) (hB : ∀ t ∈ A, t+2*(l:ℤ) ∉ A) :
    upperDensity A ≤ (l:ℝ)/(2*(l:ℝ)+1) := by
  apply uniform_count_upper A ((l:ℝ)/(2*(l:ℝ)+1)) ((2*l+1:ℕ):ℝ)
  apply local_block_uniform_upper A ((l:ℝ)/(2*(l:ℝ)+1)) (by positivity) (2*l+1)
  intro u hu
  refine ⟨2*l+1,by omega,le_refl _,?_⟩
  have hc := odd_cycle_anchor_count A l hA hB u hu
  have hcR : (count A u (u+((2*l+1:ℕ):ℤ)):ℝ) ≤ l := by exact_mod_cast hc
  have hP : 2*(l:ℝ)+1 ≠ 0 := by positivity
  simpa only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
    div_mul_cancel₀ _ hP] using hcR

theorem odd_cycle_window (l : ℕ) (hl : 0 < l) :
    let A := modularWindow (2*(l:ℤ)+1) l l
    IsPeriodic A (2*(l:ℤ)+1) ∧
    (∀ t ∈ A, t+1 ∉ A ∧ t+2*(l:ℤ) ∉ A) ∧
    upperDensity A = (l:ℝ)/(2*(l:ℝ)+1) := by
  dsimp only
  have hlZ : 0 < (l:ℤ) := by exact_mod_cast hl
  have hP : 0 < 2*(l:ℤ)+1 := by omega
  have h1 : ((l:ℤ)*1)%(2*(l:ℤ)+1) = l := by
    rw [mul_one,Int.emod_eq_of_lt (by omega) (by omega)]
  have h2 : ((l:ℤ)*(2*(l:ℤ)))%(2*(l:ℤ)+1) = (l:ℤ)+1 := by
    have he : (l:ℤ)*(2*(l:ℤ)) = (l+1)+(2*l+1)*(l-1) := by ring
    rw [he,Int.add_mul_emod_self_left,Int.emod_eq_of_lt (by omega) (by omega)]
  refine ⟨window_periodic _ _ _,?_,?_⟩
  · intro t ht
    constructor
    · exact window_avoids_step hP (by rw [h1]) (by rw [h1]; omega) ht
    · exact window_avoids_step hP (by rw [h2]; omega) (by rw [h2]; omega) ht
  · have hh := window_upperDensity (P:=2*(l:ℤ)+1) (p:=(l:ℤ)) (H:=(l:ℤ))
      (U:=-2) (V:=1) hP (by omega) (by omega) (by ring)
    simpa only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_one,Int.cast_natCast] using hh

/-- A maximum-density periodic avoiding set, together with its universal
limsup upper bound. This covers D={1,6} and D={1,8}. -/
theorem odd_cycle_optimal (l : ℕ) (hl : 0 < l) :
    ∃ A : Set ℤ, IsPeriodic A (2*(l:ℤ)+1) ∧
      (∀ t ∈ A, t+1 ∉ A ∧ t+2*(l:ℤ) ∉ A) ∧
      upperDensity A = (l:ℝ)/(2*(l:ℝ)+1) ∧
      ∀ B : Set ℤ, (∀ t ∈ B, t+1 ∉ B ∧ t+2*(l:ℤ) ∉ B) →
        upperDensity B ≤ upperDensity A := by
  obtain ⟨hper,havoid,hden⟩ := odd_cycle_window l hl
  refine ⟨modularWindow (2*(l:ℤ)+1) l l,hper,havoid,hden,?_⟩
  intro B hB
  rw [hden]
  exact odd_cycle_upperDensity B l (fun t ht => (hB t ht).1) (fun t ht => (hB t ht).2)

end DistanceGraph
