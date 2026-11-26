module
public import Mathlib.Algebra.Polynomial.BigOperators
public import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Algebra.Order.BigOperators.Ring.Finset
public import Mathlib.Data.Nat.ModEq
public import Mathlib.Data.Rat.Defs

@[expose] public section
namespace CyrusianKaplan

open Polynomial
open scoped BigOperators

/-- A genuine quasipolynomial on every positive genus, with
rational coefficients and a single finite period. A statement only
for sufficiently large genus does not imply this predicate. -/
def HasPositiveGenusQuasipolynomial (f : ℕ → ℚ) (degree : ℕ) : Prop :=
  ∃ p : ℕ, ∃ hp : 0<p, ∃ P : Fin p → ℚ[X],
    (∀ s, (P s).natDegree≤degree) ∧
    ∀ g : ℕ, 0<g → f g=(P ⟨g%p,Nat.mod_lt _ hp⟩).eval (g:ℚ)

theorem positive_genus_quasipolynomial_sum {ι : Type*} [Fintype ι]
    (f : ι → ℕ → ℚ) (D : ℕ) (hf : ∀ i,HasPositiveGenusQuasipolynomial (f i) D) :
    HasPositiveGenusQuasipolynomial (fun g => ∑ i,f i g) D := by
  classical
  choose p hp P hDegree hEval using hf
  let M := ∏ i,p i
  have hM : 0<M := by
    unfold M
    exact Finset.prod_pos (fun i _ => hp i)
  have hDiv (i : ι) : p i∣M := Finset.dvd_prod_of_mem p (Finset.mem_univ i)
  let Q (s : Fin M) : ℚ[X] :=
    ∑ i,P i ⟨s.val % p i,Nat.mod_lt _ (hp i)⟩
  refine ⟨M,hM,Q,?_,?_⟩
  · intro s
    exact Polynomial.natDegree_sum_le_of_forall_le _ _ (fun i _ => hDegree i _)
  · intro g hg
    change (∑ i,f i g)=((∑ i,P i ⟨(g%M)%p i,Nat.mod_lt _ (hp i)⟩).eval (g:ℚ))
    rw [Polynomial.eval_finsetSum]
    apply Finset.sum_congr rfl
    intro i _
    have hs : (⟨(g%M)%p i,Nat.mod_lt _ (hp i)⟩ : Fin (p i)) =
        ⟨g%p i,Nat.mod_lt _ (hp i)⟩ := Fin.ext (Nat.mod_mod_of_dvd g (hDiv i))
    rw [hs]
    exact hEval i g hg

end CyrusianKaplan
