import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Data.Finset.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

namespace ChenKhareSahi

def orbit (a b c : ℕ) : Finset (ℕ × ℕ × ℕ) :=
  { (a,b,c), (a,c,b), (b,a,c), (b,c,a), (c,a,b), (c,b,a) }

def M (a b c : ℕ) (x y z : ℚ) : ℚ :=
  (∑ e ∈ orbit a b c, x^e.1 * y^e.2.1 * z^e.2.2) / (orbit a b c).card

def sep (f : ℚ → ℚ → ℚ → ℚ) : ℚ :=
  175*f 0 0 1 - (209/2)*f 0 1 1 + (87/5)*f 0 2 1 - (8/5)*f 0 3 1 -
    (33/4)*f 1 1 1 + (3/2)*f 1 2 1 + (1/4)*f 1 3 1

def P (a : ℕ × ℕ × ℕ) (x y z : ℚ) : ℚ := M a.1 a.2.1 a.2.2 x y z

def D (a b : ℕ × ℕ × ℕ) (x y z : ℚ) : ℚ := P a x y z - P b x y z

theorem sample : sep (fun x y z => (M 2 0 0 x y z - M 1 1 0 x y z) * M 4 0 0 x y z) = 5 := by
  norm_num [sep, M, orbit, Finset.sum_insert, Finset.sum_singleton]

def generatorValues : List ℚ :=
  [sep (fun x y z => D (2,0,0) (1,1,0) x y z * P (4,0,0) x y z),
   sep (fun x y z => D (2,0,0) (1,1,0) x y z * P (3,1,0) x y z),
   sep (fun x y z => D (2,0,0) (1,1,0) x y z * P (2,2,0) x y z),
   sep (fun x y z => D (2,0,0) (1,1,0) x y z * P (2,1,1) x y z),
   sep (fun x y z => D (3,0,0) (2,1,0) x y z * P (3,0,0) x y z),
   sep (fun x y z => D (3,0,0) (2,1,0) x y z * P (2,1,0) x y z),
   sep (fun x y z => D (3,0,0) (2,1,0) x y z * P (1,1,1) x y z),
   sep (fun x y z => D (2,1,0) (1,1,1) x y z * P (3,0,0) x y z),
   sep (fun x y z => D (2,1,0) (1,1,1) x y z * P (2,1,0) x y z),
   sep (fun x y z => D (2,1,0) (1,1,1) x y z * P (1,1,1) x y z),
   sep (fun x y z => D (4,0,0) (3,1,0) x y z * P (2,0,0) x y z),
   sep (fun x y z => D (4,0,0) (3,1,0) x y z * P (1,1,0) x y z),
   sep (fun x y z => D (3,1,0) (2,2,0) x y z * P (2,0,0) x y z),
   sep (fun x y z => D (3,1,0) (2,2,0) x y z * P (1,1,0) x y z),
   sep (fun x y z => D (2,2,0) (2,1,1) x y z * P (2,0,0) x y z),
   sep (fun x y z => D (2,2,0) (2,1,1) x y z * P (1,1,0) x y z),
   sep (fun x y z => D (5,0,0) (4,1,0) x y z * P (1,0,0) x y z),
   sep (fun x y z => D (4,1,0) (3,2,0) x y z * P (1,0,0) x y z),
   sep (fun x y z => D (3,2,0) (3,1,1) x y z * P (1,0,0) x y z),
   sep (fun x y z => D (3,1,1) (2,2,1) x y z * P (1,0,0) x y z),
   sep (fun x y z => D (6,0,0) (5,1,0) x y z * P (0,0,0) x y z),
   sep (fun x y z => D (5,1,0) (4,2,0) x y z * P (0,0,0) x y z),
   sep (fun x y z => D (4,2,0) (4,1,1) x y z * P (0,0,0) x y z),
   sep (fun x y z => D (4,2,0) (3,3,0) x y z * P (0,0,0) x y z),
   sep (fun x y z => D (4,1,1) (3,2,1) x y z * P (0,0,0) x y z),
   sep (fun x y z => D (3,3,0) (3,2,1) x y z * P (0,0,0) x y z),
   sep (fun x y z => D (3,2,1) (2,2,2) x y z * P (0,0,0) x y z),
   sep (fun x y z => D (2,0,0) (1,1,0) x y z * D (2,0,0) (1,1,0) x y z * P (2,0,0) x y z),
   sep (fun x y z => D (2,0,0) (1,1,0) x y z * D (2,0,0) (1,1,0) x y z * P (1,1,0) x y z),
   sep (fun x y z => D (2,0,0) (1,1,0) x y z * D (3,0,0) (2,1,0) x y z * P (1,0,0) x y z),
   sep (fun x y z => D (2,0,0) (1,1,0) x y z * D (2,1,0) (1,1,1) x y z * P (1,0,0) x y z),
   sep (fun x y z => D (2,0,0) (1,1,0) x y z * D (4,0,0) (3,1,0) x y z * P (0,0,0) x y z),
   sep (fun x y z => D (2,0,0) (1,1,0) x y z * D (3,1,0) (2,2,0) x y z * P (0,0,0) x y z),
   sep (fun x y z => D (2,0,0) (1,1,0) x y z * D (2,2,0) (2,1,1) x y z * P (0,0,0) x y z),
   sep (fun x y z => D (3,0,0) (2,1,0) x y z * D (3,0,0) (2,1,0) x y z * P (0,0,0) x y z),
   sep (fun x y z => D (3,0,0) (2,1,0) x y z * D (2,1,0) (1,1,1) x y z * P (0,0,0) x y z),
   sep (fun x y z => D (2,1,0) (1,1,1) x y z * D (2,1,0) (1,1,1) x y z * P (0,0,0) x y z),
   sep (fun x y z => (D (2,0,0) (1,1,0) x y z)^3)]

theorem generatorValues_exact : generatorValues =
  [5, 4, 4, 3, 9, 9, 7, 4, 2, 2, 16, 15, 14/3, 14/3, 5/3, 2/3, 24, 11, 0, 3, 34, 19, 0, 7, 7, 0, 2, 2/3, 1/3, 2/3, 2/3, 1, 0, 1, 0, 2, 0, 1/3] := by
  norm_num [generatorValues, sep, D, P, M, orbit, Finset.sum_insert, Finset.sum_singleton]


def monomial (a b c : ℕ) (x y z : ℚ) : ℚ := (orbit a b c).card * M a b c x y z

def P420 (x y z : ℚ) : ℚ :=
  monomial 4 2 0 x y z + (11/91)*(monomial 4 1 1 x y z + monomial 3 3 0 x y z) +
    (1143098/9092629)*monomial 3 2 1 x y z + (27053496033/90189787051)*monomial 2 2 2 x y z

def P411 (x y z : ℚ) : ℚ :=
  monomial 4 1 1 x y z + (111/991)*monomial 3 2 1 x y z + (1221/90181)*monomial 2 2 2 x y z

theorem separation_exact : sep (fun x y z => P420 x y z / P420 1 1 1 - P411 x y z / P411 1 1 1) =
    -(4538292661539/106631184392870 : ℚ) := by
  norm_num [sep, P420, P411, monomial, M, orbit, Finset.sum_insert, Finset.sum_singleton]

theorem separation_negative : sep (fun x y z => P420 x y z / P420 1 1 1 - P411 x y z / P411 1 1 1) < 0 := by
  rw [separation_exact]
  norm_num


theorem normalized_basis_values :
    [sep (M 6 0 0), sep (M 5 1 0), sep (M 4 2 0), sep (M 4 1 1),
     sep (M 3 3 0), sep (M 3 2 1), sep (M 2 2 2)] = [62, 28, 9, 9, 2, 2, 0] := by
  norm_num [sep, M, orbit, Finset.sum_insert, Finset.sum_singleton]

theorem separator_basis_values :
    [sep (monomial 6 0 0), sep (monomial 5 1 0), sep (monomial 4 2 0),
     sep (monomial 4 1 1), sep (monomial 3 3 0), sep (monomial 3 2 1),
     sep (monomial 2 2 2)] = [186, 168, 54, 27, 6, 12, 0] := by
  norm_num [sep, monomial, M, orbit, Finset.sum_insert, Finset.sum_singleton]

def clearedOperator (f : ℚ → ℚ → ℚ → ℚ) (x y z : ℚ) : ℚ :=
  (y-z)*((9/10)*x-y)*((9/10)*x-z)*f ((1/10)*x) y z -
  (x-z)*((9/10)*y-x)*((9/10)*y-z)*f x ((1/10)*y) z +
  (x-y)*((9/10)*z-x)*((9/10)*z-y)*f x y ((1/10)*z)

def delta (x y z : ℚ) : ℚ := (x-y)*(x-z)*(y-z)

theorem P420_eigen (x y z : ℚ) :
    clearedOperator P420 x y z = (1009081/1000000)*delta x y z * P420 x y z := by
  norm_num [clearedOperator, delta, P420, monomial, M, orbit, Finset.sum_insert, Finset.sum_singleton]
  ring

theorem P411_eigen (x y z : ℚ) :
    clearedOperator P411 x y z = (190081/1000000)*delta x y z * P411 x y z := by
  norm_num [clearedOperator, delta, P411, monomial, M, orbit, Finset.sum_insert, Finset.sum_singleton]
  ring


theorem generatorValues_nonnegative : ∀ v ∈ generatorValues, 0 ≤ v := by
  rw [generatorValues_exact]
  norm_num

end ChenKhareSahi
