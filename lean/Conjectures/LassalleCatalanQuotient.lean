module

public import Conjectures.LassalleStackSorting
public import Mathlib.Combinatorics.Enumerative.Catalan.Basic

@[expose] public section
namespace LassalleRefinement

/-- Binomial coefficient by its factorial formula for kernel evaluation. -/
def chooseFast (n j : ℕ) : ℕ :=
  if j≤n then n.factorial / (j.factorial*(n-j).factorial) else 0

theorem chooseFast_eq (n j : ℕ) : chooseFast n j=n.choose j := by
  unfold chooseFast
  split_ifs with h
  · exact (Nat.choose_eq_factorial_div_factorial h).symm
  · exact (Nat.choose_eq_zero_of_lt (Nat.lt_of_not_ge h)).symm

def signedCatalan (n : ℕ) : ℤ :=
  (-1)^n * (chooseFast (2*n) n / (n+1) : ℕ)

theorem signedCatalan_eq (n : ℕ) : signedCatalan n = (-1)^n * (catalan n : ℤ) := by
  rw [signedCatalan,chooseFast_eq,catalan_eq_centralBinom_div,Nat.centralBinom,Nat.two_mul]

/-- Exact inverse-series recurrence in the even exponential normalization. -/
def inverseCatalan (k : ℕ) : ℤ :=
  if _h : k=0 then 1 else
    -∑ i : Fin k, ((chooseFast (2*k) (2*(i.val+1)) : ℕ) : ℤ) *
      signedCatalan (i.val+1) * inverseCatalan (k-(i.val+1))
termination_by k
decreasing_by omega

theorem inverseCatalan_zero : inverseCatalan 0 = 1 := by rw [inverseCatalan,dite_eq_left rfl]

theorem inverseCatalan_succ (k : ℕ) :
    inverseCatalan (k+1) =
      -∑ i : Fin (k+1), ((chooseFast (2*(k+1)) (2*(i.val+1)) : ℕ) : ℤ) *
       signedCatalan (i.val+1) * inverseCatalan (k+1-(i.val+1)) := by
  rw [inverseCatalan,dite_eq_right (Nat.succ_ne_zero k)]

/-- The coefficient of the written quotient F(x) F(y) / F(x+y),
after multiplying by the ordinary exponential factorials. -/
def quotientRow (k a : ℕ) : ℤ :=
  ∑ i ∈ Finset.range (a/2+1), ∑ j ∈ Finset.range ((2*k-a)/2+1),
    (chooseFast a (2*i):ℤ)*(chooseFast (2*k-a) (2*j):ℤ)*
    signedCatalan i * signedCatalan j * inverseCatalan (k-i-j)

/-- Source-dependent bridge: matching orientations and the generating
function count the actual West stack-sorting refinement. -/
def RefinedCoefficientBridge : Prop :=
  ∀ k a, a≤2*k → (refinement k a:ℤ) = quotientRow k a

theorem exactLogConcavity_of_coefficients
    (h : RefinedCoefficientBridge)
    (hg : ∀ k a, 0<a → a<2*k →
      quotientRow k (a-1)*quotientRow k (a+1)≤quotientRow k a^2) :
    ExactLassalleConjecture := by
  intro k a hp ha
  have hh := hg k a hp ha
  rw [←h k (a-1) (by omega),←h k (a+1) (by omega),←h k a (by omega)] at hh
  exact_mod_cast hh

end LassalleRefinement
