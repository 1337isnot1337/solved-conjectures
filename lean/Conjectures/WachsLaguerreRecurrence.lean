module
public import Conjectures.WachsCompleteGraphForcing
public import Mathlib.Tactic.FieldSimp

@[expose] public section
namespace WachsCompleteGraph

private theorem choose_laguerre_step (n j : ℕ) :
    ((n:ℚ)+3)*((n+2).choose (j+1):ℚ) =
      (2*(n:ℚ)+4)*((n+1).choose (j+1):ℚ) +
      ((j:ℚ)+2)*((n+1).choose j:ℚ) -
      ((n:ℚ)+1)*(n.choose (j+1):ℚ) := by
  by_cases h : j ≤ n
  · have h₁ := Nat.choose_mul_succ_eq n (j+1)
    have h₂ := Nat.choose_mul_succ_eq n j
    have h₃ := Nat.add_one_mul_choose_eq n j
    have H₁ : (n.choose (j+1):ℚ)*((n:ℚ)+1) =
        ((n+1).choose (j+1):ℚ)*((n:ℚ)-(j:ℚ)) := by
      have hc := congrArg (fun x : ℕ => (x:ℚ)) h₁
      push_cast [Nat.cast_sub h] at hc
      linear_combination hc
    have H₂ : ((n:ℚ)+1)*(n.choose j:ℚ) =
        ((n+1).choose j:ℚ)*((n:ℚ)+1-(j:ℚ)) := by
      have hc := congrArg (fun x : ℕ => (x:ℚ)) h₂
      push_cast [Nat.cast_sub (by omega : j ≤ n+1)] at hc
      linear_combination hc
    have H₃ : ((n:ℚ)+1)*(n.choose j:ℚ) =
        ((n+1).choose (j+1):ℚ)*((j:ℚ)+1) := by exact_mod_cast h₃
    rw [Nat.choose_succ_succ',Nat.cast_add]
    linear_combination H₁+H₃-H₂
  · by_cases he : j=n+1
    · subst j
      simp [Nat.choose_eq_zero_of_lt,show n < n+1+1 by omega]
      ring
    · have hj : n+1<j := by omega
      have h₁ : n+2<j+1 := by omega
      have h₂ : n+1<j+1 := by omega
      have h₃ : n<j+1 := by omega
      simp [Nat.choose_eq_zero_of_lt h₁,Nat.choose_eq_zero_of_lt h₂,
        Nat.choose_eq_zero_of_lt hj,Nat.choose_eq_zero_of_lt h₃]

/-- The normalized Laguerre polynomials actually used in the forcing
identity obey their exact three-term recurrence over the rationals. -/
theorem normalizedLaguerre_recurrence (n : ℕ) :
    Polynomial.C ((n:ℚ)+3) * normalizedLaguerre (n+2) =
      Polynomial.C (2*(n:ℚ)+4) * normalizedLaguerre (n+1) +
      Polynomial.X * normalizedLaguerre (n+1) -
      Polynomial.C ((n:ℚ)+1) * normalizedLaguerre n := by
  ext i
  simp only [Polynomial.coeff_sub,Polynomial.coeff_add,Polynomial.coeff_C_mul]
  cases i with
  | zero =>
    simp [normalizedLaguerre_coeff]
    ring
  | succ j =>
    rw [Polynomial.coeff_X_mul]
    simp only [normalizedLaguerre_coeff]
    have h := choose_laguerre_step n j
    have h₁ : ((j+1).factorial:ℚ) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero (j+1)
    have h₂ : ((j:ℚ)+2) ≠ 0 := by positivity
    rw [show ((j+1+1).factorial:ℚ) = ((j:ℚ)+2)*((j+1).factorial:ℚ) by
      rw [Nat.factorial_succ]; push_cast; ring]
    field_simp
    linear_combination h

end WachsCompleteGraph
