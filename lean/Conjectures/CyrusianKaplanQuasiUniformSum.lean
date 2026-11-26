module
public import Conjectures.CyrusianKaplanQuasipolynomial
public import Mathlib.Algebra.Polynomial.Degree.Lemmas

@[expose] public section
namespace CyrusianKaplan
open Polynomial

/-- Exact all-positive-genus quasi-polynomial with the same top
coefficient on every residue class (possibly zero). -/
def HasUniformTopGenusQuasipolynomial (f : ℕ→ℚ) (D : ℕ) : Prop :=
  ∃ p : ℕ, ∃ hp : 0<p, ∃ C : ℚ, ∃ P : Fin p → ℚ[X],
    (∀ s,(P s).natDegree≤D) ∧ (∀ s,(P s).coeff D=C) ∧
    ∀ g : ℕ, 0<g → f g=(P ⟨g%p,Nat.mod_lt _ hp⟩).eval (g:ℚ)

theorem uniform_top_of_lower_degree {f : ℕ→ℚ} {d D : ℕ}
    (h : HasPositiveGenusQuasipolynomial f d) (hlt : d<D) :
    HasUniformTopGenusQuasipolynomial f D := by
  obtain ⟨p,hp,P,hP,hEval⟩ := h
  refine ⟨p,hp,0,P,fun s => (hP s).trans hlt.le,fun s => ?_,hEval⟩
  exact coeff_eq_zero_of_natDegree_lt ((hP s).trans_lt hlt)

theorem uniform_top_positive_genus_signed_sum {ι : Type*} [Fintype ι]
    (w : ι→ℚ) (f : ι→ℕ→ℚ) (D : ℕ)
    (hf : ∀ i,HasUniformTopGenusQuasipolynomial (f i) D) :
    HasUniformTopGenusQuasipolynomial (fun g => ∑ i,w i*f i g) D := by
  classical
  choose p hp C P hDegree hCoeff hEval using hf
  let M := ∏ i,p i
  have hM : 0<M := by
    unfold M
    exact Finset.prod_pos (fun i _ => hp i)
  have hDiv (i : ι) : p i∣M := Finset.dvd_prod_of_mem p (Finset.mem_univ i)
  let Q (s : Fin M) : ℚ[X] :=
    ∑ i,w i • P i ⟨s.val % p i,Nat.mod_lt _ (hp i)⟩
  refine ⟨M,hM,∑ i,w i*C i,Q,?_,?_,?_⟩
  · intro s
    apply Polynomial.natDegree_sum_le_of_forall_le _ _
    intro i _
    exact (Polynomial.natDegree_smul_le _ _).trans (hDegree i _)
  · intro s
    change (∑ i,w i • P i ⟨s.val % p i,Nat.mod_lt _ (hp i)⟩).coeff D=_
    simp only [Polynomial.finsetSum_coeff,Polynomial.coeff_smul,smul_eq_mul,hCoeff]
  · intro g hg
    change (∑ i,w i*f i g)=((∑ i,w i • P i ⟨(g%M)%p i,Nat.mod_lt _ (hp i)⟩).eval (g:ℚ))
    rw [Polynomial.eval_finsetSum]
    apply Finset.sum_congr rfl
    intro i _
    have hs : (⟨(g%M)%p i,Nat.mod_lt _ (hp i)⟩ : Fin (p i)) =
        ⟨g%p i,Nat.mod_lt _ (hp i)⟩ := Fin.ext (Nat.mod_mod_of_dvd g (hDiv i))
    rw [hs,Polynomial.smul_eq_C_mul,Polynomial.eval_mul,Polynomial.eval_C,hEval i g hg]

end CyrusianKaplan
