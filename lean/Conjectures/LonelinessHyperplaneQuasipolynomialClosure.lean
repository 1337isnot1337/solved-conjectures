import Conjectures.LonelinessHyperplaneBoxQuasipolynomial

/-! Closure of exact quasipolynomial formulas under period refinement
and finite rational linear combinations. The definition retains all
nonnegative arguments, including zero. -/

namespace Loneliness.Hyperplane.QuasipolynomialArithmetic

open Polynomial
open scoped BigOperators

noncomputable section

def HasProgressionPolynomials (f : ℕ → ℚ) (M d : ℕ) : Prop :=
  ∃ P : Fin M → ℚ[X],
    (∀ r, (P r).natDegree ≤ d) ∧
      ∀ (r : Fin M) (n : ℕ), f (M * n + r) = (P r).eval (n : ℚ)

def IsQuasipolynomial (f : ℕ → ℚ) (d : ℕ) : Prop :=
  ∃ M : ℕ, 0 < M ∧ HasProgressionPolynomials f M d

theorem HasProgressionPolynomials.refine
    {f : ℕ → ℚ} {M L d : ℕ} (hf : HasProgressionPolynomials f M d)
    (hM : 0 < M) (hdiv : M ∣ L) : HasProgressionPolynomials f L d := by
  obtain ⟨P, hdegree, heval⟩ := hf
  let phase : Fin L → Fin M := fun r => ⟨(r : ℕ) % M, Nat.mod_lt _ hM⟩
  let linear : Fin L → ℚ[X] := fun r =>
    C ((L / M : ℕ) : ℚ) * X + C (((r : ℕ) / M : ℕ) : ℚ)
  refine ⟨fun r => (P (phase r)).comp (linear r), ?_, ?_⟩
  · intro r
    have hlinear : (linear r).natDegree ≤ 1 := by
      apply natDegree_add_le_of_degree_le
      · exact (natDegree_C_mul_le _ _).trans natDegree_X_le
      · simp only [natDegree_C]
        omega
    calc
      _ ≤ (P (phase r)).natDegree * (linear r).natDegree := natDegree_comp_le
      _ ≤ d * 1 := Nat.mul_le_mul (hdegree _) hlinear
      _ = d := Nat.mul_one _
  · intro r n
    have harg : L * n + (r : ℕ) =
        M * ((L / M) * n + (r : ℕ) / M) + (phase r : ℕ) := by
      have hquot := Nat.mul_div_cancel' hdiv
      have hrem := Nat.mod_add_div (r : ℕ) M
      dsimp only [phase]
      calc
        _ = (M * (L / M)) * n + ((r : ℕ) % M + M * ((r : ℕ) / M)) := by
          rw [hquot, hrem]
        _ = _ := by ring
    rw [harg, heval]
    simp only [linear, eval_comp, eval_add, eval_mul, eval_C, eval_X,
      Nat.cast_add, Nat.cast_mul]

theorem IsQuasipolynomial.mono_degree
    {f : ℕ → ℚ} {d e : ℕ} (hf : IsQuasipolynomial f d) (hde : d ≤ e) :
    IsQuasipolynomial f e := by
  obtain ⟨M, hM, P, hdegree, heval⟩ := hf
  exact ⟨M, hM, P, fun r => (hdegree r).trans hde, heval⟩

theorem IsQuasipolynomial.congr
    {f g : ℕ → ℚ} {d : ℕ} (hf : IsQuasipolynomial f d)
    (hfg : ∀ n, f n = g n) : IsQuasipolynomial g d := by
  obtain ⟨M, hM, P, hdegree, heval⟩ := hf
  exact ⟨M, hM, P, hdegree, fun r n => (hfg _).symm.trans (heval r n)⟩

/-- A common period is constructed as the product of the finitely
many component periods. -/
theorem IsQuasipolynomial.finite_linear_combination
    {κ : Type*} [Fintype κ] (f : κ → ℕ → ℚ) (c : κ → ℚ) (d : ℕ)
    (hf : ∀ i, IsQuasipolynomial (f i) d) :
    IsQuasipolynomial (fun n => ∑ i, c i * f i n) d := by
  classical
  choose M hM hP using hf
  let L := ∏ i, M i
  have hL : 0 < L := Finset.prod_pos (fun i _ => hM i)
  have hdiv : ∀ i, M i ∣ L := fun i =>
    Finset.dvd_prod_of_mem M (Finset.mem_univ i)
  choose P hdegree heval using fun i =>
    (hP i).refine (hM i) (hdiv i)
  refine ⟨L, hL, fun r => ∑ i, C (c i) * P i r, ?_, ?_⟩
  · intro r
    apply natDegree_sum_le_of_forall_le
    intro i _
    exact (natDegree_C_mul_le _ _).trans (hdegree i r)
  · intro r n
    rw [eval_finsetSum]
    apply Finset.sum_congr rfl
    intro i _
    rw [eval_mul, eval_C, heval i r n]

theorem closedRelationBox_isQuasipolynomial
    {ι : Type*} [Fintype ι] [DecidableEq ι] (m : ι → ℤ) :
    IsQuasipolynomial (fun N => (Nat.card (closedRelationBox m N) : ℚ))
      (if m = 0 then Fintype.card ι else Fintype.card ι - 1) :=
  closedRelationBox_quasipolynomial m

end

end Loneliness.Hyperplane.QuasipolynomialArithmetic
