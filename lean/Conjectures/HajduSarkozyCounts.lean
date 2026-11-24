import Conjectures.HajduSarkozyArithmetic
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics
import Mathlib.Data.Set.Finite.Basic
import Mathlib.Data.Set.SymmDiff

/-!
# Hajdu–Sárközy's shifted-power perturbation conjecture

The actual counting functions of subsets of the positive integers, the
source's little-oh hypothesis, and its finite-modification convention.
`count S X` counts precisely the members of `S` in the real interval `[1,X]`.
-/

open Classical Filter Finset Asymptotics
open scoped symmDiff

namespace Conjectures.HajduSarkozy

noncomputable section

def positivePrefix (S : Set ℕ) (N : ℕ) : Finset ℕ :=
  (Icc 1 N).filter fun n => n ∈ S

def realPrefix (S : Set ℕ) (X : ℝ) : Finset ℕ := positivePrefix S ⌊X⌋₊

def count (S : Set ℕ) (X : ℝ) : ℝ := (realPrefix S X).card

@[simp] theorem mem_positivePrefix {S : Set ℕ} {N n : ℕ} :
    n ∈ positivePrefix S N ↔ 0 < n ∧ n ≤ N ∧ n ∈ S := by
  simp only [positivePrefix, mem_filter, mem_Icc, Nat.succ_le_iff, and_assoc]

@[simp] theorem mem_realPrefix {S : Set ℕ} {X : ℝ} {n : ℕ} :
    n ∈ realPrefix S X ↔ 0 < n ∧ (n : ℝ) ≤ X ∧ n ∈ S := by
  rw [realPrefix, mem_positivePrefix]
  constructor
  · rintro ⟨hn, hN, hS⟩
    exact ⟨hn, (Nat.le_floor_iff' (Nat.ne_of_gt hn)).mp hN, hS⟩
  · rintro ⟨hn, hN, hS⟩
    exact ⟨hn, (Nat.le_floor_iff' (Nat.ne_of_gt hn)).mpr hN, hS⟩

theorem count_nonneg (S : Set ℕ) (X : ℝ) : 0 ≤ count S X := Nat.cast_nonneg _

theorem realPrefix_mono {S T : Set ℕ} {X Y : ℝ} (hST : S ⊆ T) (hXY : X ≤ Y) :
    realPrefix S X ⊆ realPrefix T Y := by
  intro n hn
  obtain ⟨hn, hX, hS⟩ := mem_realPrefix.mp hn
  exact mem_realPrefix.mpr ⟨hn, hX.trans hXY, hST hS⟩

theorem count_mono {S T : Set ℕ} {X Y : ℝ} (hST : S ⊆ T) (hXY : X ≤ Y) :
    count S X ≤ count T Y := by
  unfold count
  exact_mod_cast card_le_card (realPrefix_mono hST hXY)

theorem realPrefix_union (S T : Set ℕ) (X : ℝ) :
    realPrefix (S ∪ T) X = realPrefix S X ∪ realPrefix T X := by
  ext n
  simp only [mem_realPrefix, Set.mem_union, mem_union]
  tauto

theorem count_union_le (S T : Set ℕ) (X : ℝ) :
    count (S ∪ T) X ≤ count S X + count T X := by
  unfold count
  rw [realPrefix_union]
  exact_mod_cast card_union_le (realPrefix S X) (realPrefix T X)

theorem count_split_le (S T : Set ℕ) (X : ℝ) :
    count S X ≤ count (S ∩ T) X + count (S \ T) X := by
  have h : S = (S ∩ T) ∪ (S \ T) := by
    ext n
    simp only [Set.mem_union, Set.mem_inter_iff, Set.mem_sdiff]
    tauto
  simpa only [← h] using count_union_le (S ∩ T) (S \ T) X

theorem count_finite_le {S : Set ℕ} (hS : S.Finite) (X : ℝ) :
    count S X ≤ hS.toFinset.card := by
  apply Nat.cast_le.mpr
  apply card_le_card
  intro n hn
  exact hS.mem_toFinset.mpr (mem_realPrefix.mp hn).2.2

/-- The source's error scale, with a real variable tending to positive infinity. -/
def Sparse (k : ℕ) (S : Set ℕ) : Prop :=
  count S =o[atTop] fun X : ℝ => X ^ (1 / (k : ℝ))

theorem sparse_mono {k : ℕ} {S T : Set ℕ} (hST : S ⊆ T) (hT : Sparse k T) :
    Sparse k S := by
  apply (IsBigO.of_bound 1 ?_).trans_isLittleO hT
  filter_upwards [] with X
  rw [one_mul, Real.norm_of_nonneg (count_nonneg S X),
    Real.norm_of_nonneg (count_nonneg T X)]
  exact count_mono hST le_rfl

theorem sparse_union {k : ℕ} {S T : Set ℕ} (hS : Sparse k S) (hT : Sparse k T) :
    Sparse k (S ∪ T) := by
  have hh := hS.add hT
  apply (IsBigO.of_bound 1 ?_).trans_isLittleO hh
  filter_upwards [] with X
  rw [one_mul, Real.norm_of_nonneg (count_nonneg (S ∪ T) X),
    Real.norm_of_nonneg (add_nonneg (count_nonneg S X) (count_nonneg T X))]
  exact count_union_le S T X

theorem sparse_finite {k : ℕ} (hk : 0 < k) {S : Set ℕ} (hS : S.Finite) :
    Sparse k S := by
  have hpow : Tendsto (fun X : ℝ => X^(1/(k : ℝ))) atTop atTop :=
    tendsto_rpow_atTop (by positivity)
  have hconst : (fun _ : ℝ => (hS.toFinset.card : ℝ)) =o[atTop]
      fun X : ℝ => X^(1/(k : ℝ)) := by
    apply isLittleO_const_left.mpr
    exact Or.inr (tendsto_norm_atTop_atTop.comp hpow)
  apply (IsBigO.of_bound 1 ?_).trans_isLittleO hconst
  filter_upwards [] with X
  rw [one_mul, Real.norm_of_nonneg (count_nonneg S X),
    Real.norm_of_nonneg (Nat.cast_nonneg _)]
  exact count_finite_le hS X

theorem sparse_symmDiff_trans {k : ℕ} {R S T : Set ℕ}
    (hRS : Sparse k (R ∆ S)) (hST : Sparse k (S ∆ T)) : Sparse k (R ∆ T) := by
  apply sparse_mono _ (sparse_union hRS hST)
  intro n hn
  simp only [Set.mem_symmDiff, Set.mem_union] at *
  tauto

def Positive (S : Set ℕ) : Prop := ∀ n ∈ S, 0 < n

def productSet (A B : Set ℕ) : Set ℕ := {n | ∃ a ∈ A, ∃ b ∈ B, a*b = n}

/-- Multiplicative decomposition into two positive-integer sets with at least two elements. -/
def HasNontrivialProduct (R : Set ℕ) : Prop :=
  ∃ A B : Set ℕ, Positive A ∧ Positive B ∧ A.Nontrivial ∧ B.Nontrivial ∧ R = productSet A B

/-- Hajdu and Sárközy's total m-primitivity includes every finite modification. -/
def TotallyMPrimitive (R : Set ℕ) : Prop :=
  ∀ T : Set ℕ, Positive T → (T ∆ R).Finite → ¬ HasNontrivialProduct T

end

end Conjectures.HajduSarkozy
