import Conjectures.ChenKhareSahiGraded
import Mathlib.Tactic.Linarith

namespace ChenKhareSahi

noncomputable def realClearedOperator (f : SymFun) (x y z : ℝ) : ℝ :=
  (y-z)*((9/10)*x-y)*((9/10)*x-z)*f ((1/10)*x) y z -
  (x-z)*((9/10)*y-x)*((9/10)*y-z)*f x ((1/10)*y) z +
  (x-y)*((9/10)*z-x)*((9/10)*z-y)*f x y ((1/10)*z)

noncomputable def realDelta (x y z : ℝ) : ℝ := (x-y)*(x-z)*(y-z)

noncomputable def candidate420 (a b c d : ℝ) : SymFun := fun x y z =>
  realMonomial 4 2 0 x y z + a*realMonomial 4 1 1 x y z + b*realMonomial 3 3 0 x y z +
  c*realMonomial 3 2 1 x y z + d*realMonomial 2 2 2 x y z

noncomputable def candidate411 (a b : ℝ) : SymFun := fun x y z =>
  realMonomial 4 1 1 x y z + a*realMonomial 3 2 1 x y z + b*realMonomial 2 2 2 x y z

theorem realP420_eigen (x y z : ℝ) :
    realClearedOperator realP420 x y z = (1009081/1000000)*realDelta x y z * realP420 x y z := by
  norm_num [realClearedOperator, realDelta, realP420, realMonomial, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  ring

theorem realP411_eigen (x y z : ℝ) :
    realClearedOperator realP411 x y z = (190081/1000000)*realDelta x y z * realP411 x y z := by
  norm_num [realClearedOperator, realDelta, realP411, realMonomial, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  ring

theorem candidate420_unique (a b c d : ℝ)
    (h : ∀ x y z : ℝ, realClearedOperator (candidate420 a b c d) x y z =
      (1009081/1000000)*realDelta x y z * candidate420 a b c d x y z) :
    a=11/91 ∧ b=11/91 ∧ c=1143098/9092629 ∧ d=27053496033/90189787051 := by
  have h1 := h 1 2 3
  have h2 := h 1 2 4
  have h3 := h 1 3 5
  have h4 := h 2 3 5
  norm_num [realClearedOperator, realDelta, candidate420, realMonomial, realM, orbit,
    Finset.sum_insert, Finset.sum_singleton] at h1 h2 h3 h4
  constructor
  · linarith
  constructor
  · linarith
  constructor <;> linarith

theorem candidate411_unique (a b : ℝ)
    (h : ∀ x y z : ℝ, realClearedOperator (candidate411 a b) x y z =
      (190081/1000000)*realDelta x y z * candidate411 a b x y z) :
    a=111/991 ∧ b=1221/90181 := by
  have h1 := h 1 2 3
  have h2 := h 1 2 4
  norm_num [realClearedOperator, realDelta, candidate411, realMonomial, realM, orbit,
    Finset.sum_insert, Finset.sum_singleton] at h1 h2
  constructor <;> linarith


def IsMonicEigen420 (f : SymFun) : Prop :=
  (∃ a b c d, f = candidate420 a b c d) ∧
  ∀ x y z, realClearedOperator f x y z = (1009081/1000000)*realDelta x y z * f x y z

def IsMonicEigen411 (f : SymFun) : Prop :=
  (∃ a b, f = candidate411 a b) ∧
  ∀ x y z, realClearedOperator f x y z = (190081/1000000)*realDelta x y z * f x y z

theorem candidate420_eq : candidate420 (11/91) (11/91) (1143098/9092629) (27053496033/90189787051) = realP420 := by
  funext x y z
  simp [candidate420, realP420]
  ring

theorem candidate411_eq : candidate411 (111/991) (1221/90181) = realP411 := by
  funext x y z
  simp [candidate411, realP411]

theorem monicEigen420_unique : ∃! f : SymFun, IsMonicEigen420 f := by
  refine ⟨realP420, ?_, ?_⟩
  · exact ⟨⟨11/91, 11/91, 1143098/9092629, 27053496033/90189787051, candidate420_eq.symm⟩, realP420_eigen⟩
  · intro f ⟨⟨a,b,c,d,hf⟩, heigen⟩
    rw [hf] at heigen ⊢
    obtain ⟨rfl,rfl,rfl,rfl⟩ := candidate420_unique a b c d heigen
    exact candidate420_eq

theorem monicEigen411_unique : ∃! f : SymFun, IsMonicEigen411 f := by
  refine ⟨realP411, ?_, ?_⟩
  · exact ⟨⟨111/991,1221/90181,candidate411_eq.symm⟩, realP411_eigen⟩
  · intro f ⟨⟨a,b,hf⟩, heigen⟩
    rw [hf] at heigen ⊢
    obtain ⟨rfl,rfl⟩ := candidate411_unique a b heigen
    exact candidate411_eq

theorem dominance_support_420 :
    (partitions 6).filter (fun p => decide (dominates (4,2,0) p)) =
      [(4,2,0),(4,1,1),(3,3,0),(3,2,1),(2,2,2)] := by decide

theorem dominance_support_411 :
    (partitions 6).filter (fun p => decide (dominates (4,1,1) p)) =
      [(4,1,1),(3,2,1),(2,2,2)] := by decide

end ChenKhareSahi
