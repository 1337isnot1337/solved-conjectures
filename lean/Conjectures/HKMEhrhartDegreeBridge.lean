module

public import Conjectures.HKMEhrhartEhrhartViaAssembly
public import Conjectures.HKMEhrhartLiteralCounts

public section
namespace HKMEhrhart
open Polynomial
open scoped Polynomial

/-- The literal Ehrhart counts of the symmetric edge polytope of the complete multipartite
graph with six parts of size two extend to a polynomial with a root off the canonical line. -/
theorem cocktailSixEhrhart_off_line :
    ∃ z : ℂ, cocktailSixEhrhart.IsRoot z ∧ z.re ≠ -(1/2:ℝ) :=
  off_line_of_literal_lattice_counts _ cocktailSixEhrhart_degree cocktailSixEhrhart_eval

/-- In particular the six-pair Ehrhart polynomial cannot interlace any polynomial
along the canonical line: such interlacing requires all its own roots on that line. -/
theorem cocktailSix_no_canonical_line_interlacing (Q : ℂ[X]) :
    ¬ ((∀ z : ℂ, cocktailSixEhrhart.IsRoot z → z.re = -(1/2:ℝ)) ∧
       (∀ z : ℂ, Q.IsRoot z → z.re = -(1/2:ℝ))) := by
  rintro ⟨h,_⟩
  obtain ⟨z,hz,hn⟩ := cocktailSixEhrhart_off_line
  exact hn (h z hz)

/-- The actual lattice counts of the complete multipartite graph with six two-vertex
parts determine a polynomial that violates Conjecture 4.10(i). Its off-line root also
obstructs the canonical-line interlacing in Conjecture 4.10(ii), regardless of the
polynomial of the graph obtained by decreasing one largest part. -/
theorem conjecture_4_10_counterexample :
    ∃ P : ℂ[X], (∀ m : ℕ, P.eval (m:ℂ) = (Fintype.card (CocktailLattice 6 m):ℂ)) ∧
      (∃ z : ℂ, P.IsRoot z ∧ z.re ≠ -(1/2:ℝ)) ∧
      (∀ Q : ℂ[X], ¬ ((∀ z : ℂ, P.IsRoot z → z.re = -(1/2:ℝ)) ∧
        (∀ z : ℂ, Q.IsRoot z → z.re = -(1/2:ℝ)))) :=
  ⟨cocktailSixEhrhart,cocktailSixEhrhart_eval,cocktailSixEhrhart_off_line,
    cocktailSix_no_canonical_line_interlacing⟩

end HKMEhrhart
