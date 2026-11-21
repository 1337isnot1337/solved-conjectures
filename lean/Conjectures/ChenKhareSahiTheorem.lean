import Conjectures.ChenKhareSahiEigen
import Conjectures.ChenKhareSahiMixed

namespace ChenKhareSahi

/-- The exact source Conjecture 5 implication fails for q = 1/10, t = 9/10,
    λ = (4,2,0), μ = (4,1,1). The two functions are specified by the
    source's monic dominance-triangular eigenfunction characterization. -/
theorem conjecture_counterexample :
    (0 : ℝ) < 1/10 ∧ (1/10 : ℝ) < 1 ∧ (0 : ℝ) < 9/10 ∧ (9/10 : ℝ) < 1 ∧
    dominates (4,2,0) (4,1,1) ∧
    ∀ p q : SymFun, IsMonicEigen420 p → IsMonicEigen411 q →
      ¬ FullSemiring (fun x y z => p x y z / p 1 1 1 - q x y z / q 1 1 1) := by
  refine ⟨by norm_num, by norm_num, by norm_num, by norm_num, by decide, ?_⟩
  intro p q hp hq
  have hp0 : IsMonicEigen420 realP420 :=
    ⟨⟨11/91,11/91,1143098/9092629,27053496033/90189787051,candidate420_eq.symm⟩, realP420_eigen⟩
  have hq0 : IsMonicEigen411 realP411 :=
    ⟨⟨111/991,1221/90181,candidate411_eq.symm⟩, realP411_eigen⟩
  have hp' := monicEigen420_unique.unique hp hp0
  have hq' := monicEigen411_unique.unique hq hq0
  rw [hp', hq']
  exact FullSemiring.excludes_counterexample

end ChenKhareSahi
