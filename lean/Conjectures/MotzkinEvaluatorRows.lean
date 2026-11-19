import Conjectures.MotzkinFloorSum
import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-! Exact counting of admissible second residues, and its evaluation by two
Euclidean floor sums. -/
namespace Motzkin.Evaluator

open scoped BigOperators

def row (N M s h i : ℕ) : Finset ℕ :=
  (Finset.Icc h (N-h)).filter (fun y => M ∣ y+s*i)

theorem index_bounds (N M s h i q : ℕ) (hM : 0 < M) (hh : 0 < h)
    (hq : q ∈ Finset.Icc ((h-1+s*i)/M+1) ((N-h+s*i)/M)) :
    s*i ≤ M*q ∧ h ≤ M*q-s*i ∧ M*q-s*i ≤ N-h := by
  obtain ⟨hl,hu⟩ := Finset.mem_Icc.mp hq
  have hl' : h-1+s*i < q*M := (Nat.div_lt_iff_lt_mul hM).mp (by omega)
  have hu' : q*M ≤ N-h+s*i := (Nat.le_div_iff_mul_le hM).mp hu
  rw [mul_comm q M] at hl' hu'
  omega

theorem row_card (N M s h i : ℕ) (hM : 0 < M) (hh : 0 < h) :
    (row N M s h i).card=(N-h+s*i)/M-(h-1+s*i)/M := by
  let T := Finset.Icc ((h-1+s*i)/M+1) ((N-h+s*i)/M)
  have hcard : (row N M s h i).card=T.card := by
    apply Finset.card_bij'
      (fun y _ => (y+s*i)/M) (fun q _ => M*q-s*i)
    · intro y hy
      obtain ⟨hy,hdiv⟩ := Finset.mem_filter.mp hy
      obtain ⟨hyl,hyu⟩ := Finset.mem_Icc.mp hy
      apply Finset.mem_Icc.mpr
      constructor
      · have he : ((y+s*i)/M)*M=y+s*i := Nat.div_mul_cancel hdiv
        have hlt : (h-1+s*i)/M < (y+s*i)/M := by
          apply (Nat.div_lt_iff_lt_mul hM).mpr
          rw [he]
          omega
        omega
      · exact Nat.div_le_div_right (Nat.add_le_add_right hyu (s*i))
    · intro q hq
      obtain ⟨hmq,hl,hu⟩ := index_bounds N M s h i q hM hh hq
      apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_Icc.mpr ⟨hl,hu⟩,?_⟩
      exact ⟨q,Nat.sub_add_cancel hmq⟩
    · intro y hy
      have hdiv := (Finset.mem_filter.mp hy).2
      rw [Nat.mul_div_cancel' hdiv,Nat.add_sub_cancel]
    · intro q hq
      have hmq := (index_bounds N M s h i q hM hh hq).1
      rw [Nat.sub_add_cancel hmq,Nat.mul_div_cancel_left q hM]
  rw [hcard]
  dsimp only [T]
  rw [Nat.card_Icc]
  omega

def countPairs (N M s h I J : ℕ) : ℕ :=
  FloorSum.eval (J+1-I) M s (N-h+s*I)-
    FloorSum.eval (J+1-I) M s (h-1+s*I)

theorem floorSum_mono_offset (n M A : ℕ) {B C : ℕ} (hBC : B ≤ C) :
    FloorSum.eval n M A B ≤ FloorSum.eval n M A C := by
  rw [FloorSum.eval_eq_spec,FloorSum.eval_eq_spec]
  apply Finset.sum_le_sum
  intro i _
  exact Nat.div_le_div_right (Nat.add_le_add_left hBC (A*i))

theorem countPairs_eq_sum_rows (N M s h I J : ℕ) (hM : 0 < M) (hh : 0 < h) :
    countPairs N M s h I J=∑ i ∈ Finset.Icc I J, (row N M s h i).card := by
  have hI : Finset.Icc I J=Finset.Ico I (J+1) := by
    ext i
    simp only [Finset.mem_Icc,Finset.mem_Ico]
    omega
  by_cases hle : h-1 ≤ N-h
  · rw [countPairs,FloorSum.eval_eq_spec,FloorSum.eval_eq_spec]
    simp only [FloorSum.spec]
    rw [← Finset.sum_tsub_distrib (Finset.range (J+1-I))
      (fun i _ => Nat.div_le_div_right (Nat.add_le_add_left
        (Nat.add_le_add_right hle (s*I)) (s*i)))]
    rw [hI,Finset.sum_Ico_eq_sum_range]
    apply Finset.sum_congr rfl
    intro i _
    rw [row_card N M s h (I+i) hM hh]
    have hu : s*i+(N-h+s*I)=N-h+s*(I+i) := by ring
    have hl : s*i+(h-1+s*I)=h-1+s*(I+i) := by ring
    rw [hu,hl]
  · have hlt : N-h < h := by omega
    have hmono := floorSum_mono_offset (J+1-I) M s
      (show N-h+s*I ≤ h-1+s*I by omega)
    rw [countPairs,Nat.sub_eq_zero_of_le hmono]
    symm
    apply Finset.sum_eq_zero
    intro i _
    simp only [row,Finset.Icc_eq_empty_of_lt hlt,Finset.filter_empty,Finset.card_empty]

def pairs (N M s h I J : ℕ) : Finset (ℕ × ℕ) :=
  (Finset.Icc I J ×ˢ Finset.Icc h (N-h)).filter
    (fun p => M ∣ p.2+s*p.1)

theorem countPairs_eq_card (N M s h I J : ℕ) (hM : 0 < M) (hh : 0 < h) :
    countPairs N M s h I J=(pairs N M s h I J).card := by
  rw [countPairs_eq_sum_rows N M s h I J hM hh,pairs,Finset.card_filter,Finset.sum_product]
  apply Finset.sum_congr rfl
  intro i _
  exact Finset.card_filter _ _

theorem countPairs_pos_iff (N M s h I J : ℕ) (hM : 0 < M) (hh : 0 < h) :
    0 < countPairs N M s h I J ↔
      ∃ i y : ℕ, I ≤ i ∧ i ≤ J ∧ h ≤ y ∧ y ≤ N-h ∧ M ∣ y+s*i := by
  rw [countPairs_eq_card N M s h I J hM hh,Finset.card_pos]
  constructor
  · rintro ⟨p,hp⟩
    obtain ⟨hp,hdiv⟩ := Finset.mem_filter.mp hp
    obtain ⟨hi,hy⟩ := Finset.mem_product.mp hp
    obtain ⟨hiI,hiJ⟩ := Finset.mem_Icc.mp hi
    obtain ⟨hyh,hyN⟩ := Finset.mem_Icc.mp hy
    exact ⟨p.1,p.2,hiI,hiJ,hyh,hyN,hdiv⟩
  · rintro ⟨i,y,hiI,hiJ,hyh,hyN,hdiv⟩
    exact ⟨(i,y),Finset.mem_filter.mpr ⟨Finset.mem_product.mpr
      ⟨Finset.mem_Icc.mpr ⟨hiI,hiJ⟩,Finset.mem_Icc.mpr ⟨hyh,hyN⟩⟩,hdiv⟩⟩

end Motzkin.Evaluator
