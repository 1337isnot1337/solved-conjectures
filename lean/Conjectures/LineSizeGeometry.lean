import Conjectures.LineSizeCost
import Mathlib.LinearAlgebra.AffineSpace.AffineSubspace.Basic
import Mathlib.Basic.Real.Basic

/-! Actual real-plane lines satisfy the abstract incidence cost bound. -/
namespace LineSize
open Finset
abbrev Point := ℝ × ℝ

noncomputable def linePoints (P : Finset Point) (a b : Point) : Finset Point := by
  classical
  exact P.filter (fun x => x ∈ line[ℝ, a, b])

@[simp] theorem mem_linePoints (P : Finset Point) (a b x : Point) :
    x ∈ linePoints P a b ↔ x ∈ P ∧ x ∈ line[ℝ, a, b] := by
  classical
  simp [linePoints]

theorem linePoints_subset (P : Finset Point) (a b : Point) :
    linePoints P a b ⊆ P := by
  intro x hx
  exact (mem_linePoints P a b x).mp hx |>.1

theorem linePoints_inter_le_one (P : Finset Point) (a b c d : Point)
    (hne : line[ℝ, a, b] ≠ line[ℝ, c, d]) :
    (linePoints P a b ∩ linePoints P c d).card ≤ 1 := by
  classical
  apply card_le_one.mpr
  intro x hx y hy
  by_contra hxy
  obtain ⟨hxab,hxcd⟩ := mem_inter.mp hx
  obtain ⟨hyab,hycd⟩ := mem_inter.mp hy
  have h₁ := affineSpan_pair_eq_of_mem_of_mem_of_ne
    ((mem_linePoints P a b x).mp hxab).2
    ((mem_linePoints P a b y).mp hyab).2 hxy
  have h₂ := affineSpan_pair_eq_of_mem_of_mem_of_ne
    ((mem_linePoints P c d x).mp hxcd).2
    ((mem_linePoints P c d y).mp hycd).2 hxy
  exact hne (h₁.symm.trans h₂)

theorem line_size_cost_le (P : Finset Point) (a b : ℕ → Point) (n : ℕ)
    (hdistinct : ∀ i j, i < j → j < n →
      (linePoints P (a i) (b i)).card ≠ (linePoints P (a j) (b j)).card) :
    pointCost (fun i => (linePoints P (a i) (b i)).card) n ≤ P.card := by
  classical
  apply pointCost_le_card P (fun i => linePoints P (a i) (b i)) n
  · exact fun i _ => linePoints_subset P (a i) (b i)
  · intro i j hij hj
    apply linePoints_inter_le_one
    intro heq
    apply hdistinct i j hij hj
    unfold linePoints
    rw [heq]

def HasLineSize (P : Finset Point) (d : ℕ) : Prop :=
  ∃ a ∈ P, ∃ b ∈ P, a ≠ b ∧ (linePoints P a b).card=d

theorem realizable_cost_le (P : Finset Point) (d : ℕ → ℕ) (n : ℕ)
    (hsize : ∀ i < n, HasLineSize P (d i))
    (hdistinct : ∀ i j, i < j → j < n → d i ≠ d j) :
    pointCost d n ≤ P.card := by
  classical
  have hw : ∀ i, ∃ a b : Point, i < n → (linePoints P a b).card=d i := by
    intro i
    by_cases hi : i < n
    · obtain ⟨a,_,b,_,_,hab⟩ := hsize i hi
      exact ⟨a,b,fun _ => hab⟩
    · exact ⟨(0,0),(0,0),fun h => (hi h).elim⟩
  choose a b hab using hw
  have hc := line_size_cost_le P a b n (by
    intro i j hij hj
    rw [hab i (by omega),hab j hj]
    exact hdistinct i j hij hj)
  convert hc using 1
  unfold pointCost
  apply sum_congr rfl
  intro i hi
  change d i-i=(linePoints P (a i) (b i)).card-i
  rw [hab i (mem_range.mp hi)]

end LineSize
