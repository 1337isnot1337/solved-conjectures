module
public import Conjectures.PomeranceSarkozyFactorialTail

@[expose] public section
namespace PomeranceSarkozy

def reciprocalPrimeMass (P : Finset ℕ) : ℚ :=
  ∑ p ∈ P,(p:ℚ)⁻¹

def arithmeticTailProbability (P : Finset ℕ) (L X h a : ℕ) : ℚ :=
  ((primeTailSamples P L X h a).card:ℚ)/((Finset.Icc L X).card:ℚ)

theorem primeTail_factorial_count (P : Finset ℕ) (hP : ∀ p∈P,p.Prime) (L X h a : ℕ) :
    ((primeTailSamples P L X h a).card:ℚ) ≤
      (X:ℚ)*(reciprocalPrimeMass P)^a/(a.factorial:ℚ) := by
  have h₀ := shifted_prime_tail_reciprocal P hP L X h a
  have h₁ := weightedSubsets_factorial_le P (fun p : ℕ => (p:ℚ)⁻¹)
    (fun p _ => by positivity) a
  have hp : (0:ℚ) < a.factorial := by exact_mod_cast Nat.factorial_pos a
  have h₂ : weightedSubsets P (fun p : ℕ => (p:ℚ)⁻¹) a ≤ (reciprocalPrimeMass P)^a/a.factorial :=
    (le_div_iff₀ hp).mpr (by simpa [mul_comm,reciprocalPrimeMass] using h₁)
  rw [mul_div_assoc]
  exact h₀.trans (mul_le_mul_of_nonneg_left h₂ (by positivity))

/-- Exact finite instance of the factorial probability bound in equation (2).
The same result covers all arithmetic shifts and every allowed prime set. -/
theorem primeTail_probability_le_two_factorial (P : Finset ℕ) (hP : ∀ p∈P,p.Prime)
    (L X h a : ℕ) (hN : 0 < (Finset.Icc L X).card)
    (hHalf : X≤2*(Finset.Icc L X).card) :
    arithmeticTailProbability P L X h a ≤ 2*(reciprocalPrimeMass P)^a/(a.factorial:ℚ) := by
  let N : ℚ := (Finset.Icc L X).card
  let b : ℚ := (reciprocalPrimeMass P)^a/(a.factorial:ℚ)
  have hNp : 0 < N := by
    change (0:ℚ) < ((Finset.Icc L X).card:ℚ)
    exact_mod_cast hN
  have hb : 0≤b := by unfold b reciprocalPrimeMass; positivity
  have hX : (X:ℚ)≤2*N := by dsimp [N]; exact_mod_cast hHalf
  have hEV := primeTail_factorial_count P hP L X h a
  have hEV' : ((primeTailSamples P L X h a).card:ℚ) ≤ (X:ℚ)*b := by
    simpa only [b,mul_div_assoc] using hEV
  unfold arithmeticTailProbability
  rw [mul_div_assoc]
  change ((primeTailSamples P L X h a).card:ℚ)/N ≤ 2*b
  apply (div_le_iff₀ hNp).mpr
  calc
    _ ≤ (X:ℚ)*b := hEV'
    _ ≤ (2*N)*b := mul_le_mul_of_nonneg_right hX hb
    _ = _ := by ring

end PomeranceSarkozy
