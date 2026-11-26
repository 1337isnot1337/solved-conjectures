import Init

/-!
Exact rational certificates for results/kovalev-hardy-duality/PROOF.md,
Sections 3--5.  The analytic estimates connecting these comparisons to
Gaussian moments and Hardy norms are not asserted here.
-/

namespace KovalevRationalCertificate
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 0

def logLower (q : Rat) : Rat :=
  2 * ((List.range 10).foldl
    (fun s j => s + q ^ (2*j+1) / ((2*j+1 : Nat) : Rat)) 0)

def logUpper (q : Rat) : Rat :=
  logLower q + 2*q^21 / (21*(1-q*q))

def atanLower (q : Rat) : Rat :=
  (List.range 10).foldl
    (fun s j => s + (if j % 2 = 0 then 1 else -1) *
      q ^ (2*j+1) / ((2*j+1 : Nat) : Rat)) 0

def atanUpper (q : Rat) : Rat := atanLower q + q^21/21

def piLower : Rat := 16*atanLower (1/5) - 4*atanUpper (1/239)
def piUpper : Rat := 16*atanUpper (1/5) - 4*atanLower (1/239)
def log320Lower : Rat := 8*logLower (1/3) + logLower (1/9)
def log320Upper : Rat := 8*logUpper (1/3) + logUpper (1/9)
def log30Lower : Rat := 5*logLower (1/3) - logUpper (1/31)
def log30Upper : Rat := 5*logUpper (1/3) - logLower (1/31)
def h30 : Rat := (List.range 30).foldl (fun s j => s + 1 / ((j+1 : Nat) : Rat)) 0
def gammaLower : Rat := h30 - log30Upper - 1/60
def gammaUpper : Rat := h30 - log30Lower - 1/62

theorem pi_comparison : 3 < piLower ∧ piLower < piUpper ∧ piUpper < 355/113 := by decide +kernel
theorem log320_comparison : 721/125 < log320Lower ∧ log320Lower < log320Upper ∧ log320Upper < 5769/1000 := by decide +kernel
theorem gamma_comparison : 577/1000 < gammaLower ∧ gammaLower < gammaUpper ∧ gammaUpper < 289/500 := by decide +kernel

def lowerL : Rat := 519/100
def upperL : Rat := 649/125

theorem L_lower_comparison : lowerL < log320Lower - gammaUpper := by decide +kernel
theorem L_upper_comparison : log320Upper - gammaLower < upperL := by decide +kernel

def rootBound : Rat := 250663/100000
theorem root_comparison : 2*(355/113 : Rat) < rootBound^2 := by decide +kernel

def c : Rat := 1/40
def z : Rat := 1/160
def w : Rat := z*z/4
def i0Upper : Rat := 1/(1-w)
def i0PrimeUpper : Rat := 2*w/(z*(1-w)^2)
def sUpper : Rat := w/(1-w)^2
def sPrimeUpper : Rat := 2*w*(1+w)/(z*(1-w)^3)
def kDifferenceLower : Rat :=
  1/z - upperL*(i0Upper+i0PrimeUpper) - sUpper - sPrimeUpper

theorem k_difference_positive : 0 < kDifferenceLower := by decide +kernel

def aLower : Rat := c*(1+z)*kDifferenceLower/(2*rootBound)
def bLower : Rat := (1+z)*lowerL/rootBound
def a0 : Rat := 7767/10000
def b0 : Rat := 2083/1000

theorem a_comparison : 0 < a0 ∧ a0 < aLower := by decide +kernel
theorem b_comparison : 0 < b0 ∧ b0 < bLower := by decide +kernel
theorem dimension_threshold : (2*500000 : Nat) = 1000^2 := by decide

def factor : Rat := 1-1/1000
def vLower : Rat := (a0*a0+c*(factor*b0)^2)^2+2*a0^4
def gap : Rat := vLower - (355/113 : Rat)^2/8

theorem quartic_exact : vLower = 1974576784456084845603270321/1600000000000000000000000000 := by decide +kernel
theorem gap_exact : gap = 8370960719747393508158728849/20430400000000000000000000000000 := by decide +kernel
theorem gap_positive : 0 < gap := by decide +kernel

#print axioms pi_comparison
#print axioms log320_comparison
#print axioms gamma_comparison
#print axioms L_lower_comparison
#print axioms L_upper_comparison
#print axioms root_comparison
#print axioms k_difference_positive
#print axioms a_comparison
#print axioms b_comparison
#print axioms dimension_threshold
#print axioms quartic_exact
#print axioms gap_exact
#print axioms gap_positive
end
end KovalevRationalCertificate
