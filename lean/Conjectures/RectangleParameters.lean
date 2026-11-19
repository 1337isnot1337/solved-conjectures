import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-! Shared parameters for the uniform growing-rectangle asymptotic and
the fixed-exponent lower reservations. -/

namespace RectangleAsymptotics

noncomputable def area (h w : ℕ) : ℝ := ((h*w : ℕ) : ℝ)

noncomputable def U (h w : ℕ) : ℝ := min (h : ℝ) ((area h w)^(1/4 : ℝ))

noncomputable def scale (h w : ℕ) : ℝ := Real.sqrt (area h w*Real.log (U h w))

noncomputable def a0 (ε : ℝ) (h : ℕ) : ℕ := ⌈(h : ℝ)^ε⌉₊

noncomputable def M (ε : ℝ) (h w : ℕ) : ℕ := ⌊(U h w)^(1-2*ε)⌋₊

noncomputable def active (ε : ℝ) (h w : ℕ) : Finset ℕ := Finset.Icc (a0 ε h) (M ε h w)

noncomputable def L (ε : ℝ) (h w : ℕ) : ℝ := ∑ a ∈ active ε h w,1/(a : ℝ)

def smallAspect (ε : ℝ) (h w : ℕ) : Prop := (w : ℝ) ≤ (h : ℝ)^(1+ε)

noncomputable instance smallAspectDecidable (ε : ℝ) (h w : ℕ) : Decidable (smallAspect ε h w) :=
  Classical.propDecidable _

noncomputable def Q (ε : ℝ) (h w a : ℕ) : ℕ :=
  if smallAspect ε h w then ⌊(h : ℝ)/(L ε h w*(a : ℝ)^2)⌋₊ else ⌊(h : ℝ)/(a : ℝ)⌋₊

noncomputable def B (ε : ℝ) (h w a : ℕ) : ℕ :=
  if smallAspect ε h w then w else ⌊(w : ℝ)/(L ε h w*(a : ℝ))⌋₊

noncomputable def C (ε : ℝ) (h w a : ℕ) : ℕ := ⌊ε*(B ε h w a : ℝ)⌋₊

noncomputable def T (ε : ℝ) (h w a : ℕ) : ℕ := Q ε h w a*(B ε h w a-C ε h w a)

end RectangleAsymptotics
