import Conjectures.JohnsonPfaffianScaling
import Conjectures.GilmoreCrossingNesting
namespace JohnsonPfaffian
open GilmoreCrossingNesting

noncomputable def matchingPfaffian (u : ℕ) (w : ℕ → ℕ → ℝ) : ℝ :=
  ∑ M ∈ matchingFinset u, (-1:ℝ)^(pairCount crossContribution M) * edgeProduct w M

theorem matchingPfaffian_diagonal_scale (u : ℕ) (d : ℕ → ℝ) (w : ℕ → ℕ → ℝ) :
    matchingPfaffian u (fun i j => d i*d j*w i j) =
      ((List.range (2*u)).map d).prod * matchingPfaffian u w := by
  unfold matchingPfaffian
  apply diagonal_signed_matching_sum_scale
  intro M hM
  have hh := ((mem_matchingFinset (u := u) (arcs := M)).mp hM).1
  exact hh
end JohnsonPfaffian
