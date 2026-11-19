import Conjectures.LineSizeGeometry
import Mathlib.Data.Set.Finite.Basic

/-! Intersections of distinct actual lines form a finite forbidden set. -/
namespace LineSize

theorem line_inter_subsingleton (a b c d : Point)
    (hne : line[ℝ, a, b] ≠ line[ℝ, c, d]) :
    ((line[ℝ, a, b] : Set Point) ∩ (line[ℝ, c, d] : Set Point)).Subsingleton := by
  intro x hx y hy
  by_contra hxy
  have h₁ := affineSpan_pair_eq_of_mem_of_mem_of_ne hx.1 hy.1 hxy
  have h₂ := affineSpan_pair_eq_of_mem_of_mem_of_ne hx.2 hy.2 hxy
  exact hne (h₁.symm.trans h₂)

noncomputable def lineCrossing (a b c d : Point) : Finset Point := by
  classical
  exact if h : line[ℝ, a, b] = line[ℝ, c, d] then ∅ else
    (line_inter_subsingleton a b c d h).finite.toFinset

theorem mem_lineCrossing (a b c d p : Point)
    (hne : line[ℝ, a, b] ≠ line[ℝ, c, d]) :
    p ∈ lineCrossing a b c d ↔ p ∈ line[ℝ, a, b] ∧ p ∈ line[ℝ, c, d] := by
  classical
  simp [lineCrossing,hne]

noncomputable def forbiddenCrossings (P : Finset Point) (a b : Point) : Finset Point := by
  classical
  exact P.biUnion fun p => P.biUnion fun q => lineCrossing a b p q

theorem secant_forbidden (P : Finset Point) (a b p q x : Point)
    (hp : p ∈ P) (hq : q ∈ P)
    (hne : line[ℝ, a, b] ≠ line[ℝ, p, q])
    (hx : x ∈ line[ℝ, a, b]) (hsec : x ∈ line[ℝ, p, q]) :
    x ∈ forbiddenCrossings P a b := by
  classical
  apply Finset.mem_biUnion.mpr
  refine ⟨p,hp,Finset.mem_biUnion.mpr ⟨q,hq,?_⟩⟩
  exact (mem_lineCrossing a b p q x hne).mpr ⟨hx,hsec⟩

end LineSize
