import Conjectures.BursteinA218225

open Conjectures.BursteinA218225
namespace BursteinReview

noncomputable def literalX (n : ℕ) : ℕ :=
  Nat.card {π : Equiv.Perm (Fin n) //
      ¬ ContainsPattern π (![2, 1, 3, 4] : Fin 4 → ℕ) ∧
      ¬ ContainsPattern π (![4, 2, 1, 5, 3] : Fin 5 → ℕ) ∧
      ¬ ContainsPattern π (![2, 4, 1, 5, 3] : Fin 5 → ℕ)}

noncomputable def literalY (n : ℕ) : ℕ :=
  Nat.card {π : Equiv.Perm (Fin n) //
      ¬ ContainsPattern π (![2, 1, 4, 3] : Fin 4 → ℕ) ∧
      ¬ ContainsPattern π (![4, 2, 1, 3, 5] : Fin 5 → ℕ) ∧
      ¬ ContainsPattern π (![2, 4, 1, 3, 5] : Fin 5 → ℕ)}

theorem counts_match_primary_statement (n : ℕ) : literalX n = literalY n :=
  countX_eq_countY n

noncomputable def literalNonempty (f : ℕ → ℕ) : PowerSeries ℤ :=
  PowerSeries.mk fun n => if n = 0 then 0 else (f n : ℤ)

theorem univariate_series_match_primary_equation :
    let P := literalNonempty literalX
    let Q := literalNonempty literalY
    Q = P ∧ PowerSeries.constantCoeff P = 0 ∧
      P = (1 + P) * (PowerSeries.X + (1 - PowerSeries.X) * P ^ 2) :=
  ⟨seriesY_equation.1, seriesX_equation⟩

#print axioms counts_match_primary_statement
#print axioms univariate_series_match_primary_equation

end BursteinReview
