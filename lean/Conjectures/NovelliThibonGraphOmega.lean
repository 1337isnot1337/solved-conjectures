module
public import Conjectures.NovelliThibonGraphLLT
public import Mathlib.Algebra.Field.Basic

@[expose] public section
namespace NovelliThibon

open Classical

variable {n : ℕ} {A K : Type*} [LinearOrder A] [Fintype A] [Field K]

/-- In fundamental coordinates the QSym omega involution sends a
descent set to its complement. The modified function uses the same
(q^{|E|}) and inversion of (q) as Lemma 4.2 of Novelli–Thibon. -/
noncomputable def modifiedOmegaGraphLLT (x : A → K)
    (E : Finset (Fin (n+1) × Fin (n+1))) (q : K) : K :=
  ∑ S : Finset (Fin n), q^E.card * graphLLTCoordinate E q⁻¹ Sᶜ * fundamentalAt S x

theorem graphLLTCoordinate_complement (E : Finset (Fin (n+1) × Fin (n+1)))
    (q : K) (S : Finset (Fin n)) :
    graphLLTCoordinate E q Sᶜ =
      ∑ σ : Equiv.Perm (Fin (n+1)) with inverseDescentSet σ=S, q^graphAscents E σ := by
  unfold graphLLTCoordinate
  simp only [compl_inj_iff]

/-- Commutative form of the source graph-LLT formula after inverse q and omega.
It is derived from the ordinary strict-ascent word definition. -/
theorem modifiedOmegaGraphLLT_eq_descent_expansion (x : A → K)
    (E : Finset (Fin (n+1) × Fin (n+1))) (hE : OrientedForward E)
    (q : K) (hq : q ≠ 0) :
    modifiedOmegaGraphLLT x E q =
      ∑ σ : Equiv.Perm (Fin (n+1)), q^graphDescents E σ * fundamentalEvaluation σ x := by
  classical
  unfold modifiedOmegaGraphLLT
  simp_rw [graphLLTCoordinate_complement,Finset.mul_sum,Finset.sum_mul]
  have hf (S : Finset (Fin n)) :
      (∑ σ : Equiv.Perm (Fin (n+1)) with inverseDescentSet σ=S,
        (q^E.card*(q⁻¹)^graphAscents E σ)*fundamentalAt S x) =
        ∑ σ : Equiv.Perm (Fin (n+1)) with inverseDescentSet σ=S,
          (q^E.card*(q⁻¹)^graphAscents E σ)*fundamentalAt (inverseDescentSet σ) x := by
    apply Finset.sum_congr rfl
    intro σ hs
    rw [(Finset.mem_filter.mp hs).2]
  simp_rw [hf]
  rw [Finset.sum_fiberwise]
  simp_rw [fundamentalAt_inverseDescent]
  apply Finset.sum_congr rfl
  intro σ _
  rw [← graphAscents_add_graphDescents E hE σ,pow_add,inv_pow]
  have hn : q ^ graphAscents E σ ≠ 0 := pow_ne_zero _ hq
  calc
    _ = ((q^graphAscents E σ)*(q^graphAscents E σ)⁻¹) *
          (q^graphDescents E σ * fundamentalEvaluation σ x) := by ac_rfl
    _ = _ := by rw [mul_inv_cancel₀ hn,one_mul]

end NovelliThibon
