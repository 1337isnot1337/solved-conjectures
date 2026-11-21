import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Tactic.NormNum

/-! Exact finite integer-list certificates for the credited Newton-kernel argument. -/
namespace CKZCertificates

def add : List ℤ → List ℤ → List ℤ
  | [], ys => ys
  | xs, [] => xs
  | x::xs, y::ys => (x+y)::add xs ys

def scale (c : ℤ) (xs : List ℤ) : List ℤ := xs.map (c*·)

def mul : List ℤ → List ℤ → List ℤ
  | [], _ => []
  | x::xs, ys => add (scale x ys) (0::mul xs ys)

def power (xs : List ℤ) : ℕ → List ℤ
  | 0 => [1]
  | n+1 => mul xs (power xs n)

def derivativeAux : ℕ → List ℤ → List ℤ
  | _, [] => []
  | k, x::xs => ((k : ℤ)*x)::derivativeAux (k+1) xs

def derivative : List ℤ → List ℤ
  | [] => []
  | _::xs => derivativeAux 1 xs

def a : List ℤ := [0,3,2]
def b : List ℤ := [0,1,3,3,1]
def E1 : List ℤ := mul (power [1,1] 2) [1,-1,-2,3]
def E2 : List ℤ := mul (power [1,1] 2) [1,-2,-2,4]

def T (r : ℕ) : List ℤ :=
  (List.range (r/2+1)).foldl (fun acc j =>
    add acc (scale (((2*j).choose j / (j+1) * r.choose (2*j) : ℕ) : ℤ)
      (mul (power a (r-2*j)) (power b j)))) []

def G (r : ℕ) : List ℤ :=
  add (mul (power [1,1] 2) (add (T r) (T (r+1))))
    (scale (-1) (mul [0,1,0,-1] (add (T r) (add (scale 2 (T (r+1))) (T (r+2))))))

def numerator (f : List ℤ) : List ℤ := mul (power [1,1] 2) (derivative f)

def certPrefix (xs : List ℤ) : List ℤ :=
  (xs.foldl (fun st p => let v := p+2*st.1+st.2.1; (v,st.1,v::st.2.2)) (0,0,[])).2.2

def certOK (f : List ℤ) : Bool :=
  (0 ≤ f.headD 0) && (certPrefix (numerator f)).all (fun v => 0 ≤ v)

theorem cert_G0 : certOK (G 0) = true := by decide +kernel

theorem cert_G1 : certOK (G 1) = true := by decide +kernel
theorem cert_G2 : certOK (G 2) = true := by decide +kernel
theorem cert_G3 : certOK (G 3) = true := by decide +kernel
theorem cert_G4 : certOK (G 4) = true := by decide +kernel
theorem cert_G5 : certOK (G 5) = true := by decide +kernel
theorem cert_G6 : certOK (G 6) = true := by decide +kernel
theorem cert_G7 : certOK (G 7) = true := by decide +kernel
theorem cert_G8 : certOK (G 8) = true := by decide +kernel
theorem cert_G9 : certOK (G 9) = true := by decide +kernel
theorem cert_G10 : certOK (G 10) = true := by decide +kernel
theorem cert_G11 : certOK (G 11) = true := by decide +kernel
theorem cert_E1T1 : certOK (mul E1 (T 1)) = true := by decide +kernel
theorem cert_E1T2 : certOK (mul E1 (T 2)) = true := by decide +kernel
theorem cert_E2T13 : certOK (mul E2 (T 13)) = true := by decide +kernel
theorem cert_E2T14 : certOK (mul E2 (T 14)) = true := by decide +kernel

def trim : List ℤ → List ℤ
  | [] => []
  | x::xs => let ys := trim xs; if x = 0 ∧ ys = [] then [] else x::ys

def certificateIdentity (f : List ℤ) : Bool :=
  let N := numerator f
  let state := N.foldl (fun st p => let v := p+2*st.1+st.2.1; (v,st.1,v::st.2.2)) (0,0,[])
  let v := state.2.2.reverse
  let tail := List.replicate N.length 0 ++ [2*state.1+state.2.1,state.1]
  decide (trim (add (mul [1,-2,-1] v) tail) = trim N)

theorem identity_G0 : certificateIdentity (G 0) = true := by decide +kernel

theorem identity_G1 : certificateIdentity (G 1) = true := by decide +kernel
theorem identity_G2 : certificateIdentity (G 2) = true := by decide +kernel
theorem identity_G3 : certificateIdentity (G 3) = true := by decide +kernel
theorem identity_G4 : certificateIdentity (G 4) = true := by decide +kernel
theorem identity_G5 : certificateIdentity (G 5) = true := by decide +kernel
theorem identity_G6 : certificateIdentity (G 6) = true := by decide +kernel
theorem identity_G7 : certificateIdentity (G 7) = true := by decide +kernel
theorem identity_G8 : certificateIdentity (G 8) = true := by decide +kernel
theorem identity_G9 : certificateIdentity (G 9) = true := by decide +kernel
theorem identity_G10 : certificateIdentity (G 10) = true := by decide +kernel
theorem identity_G11 : certificateIdentity (G 11) = true := by decide +kernel
theorem identity_E1T1 : certificateIdentity (mul E1 (T 1)) = true := by decide +kernel
theorem identity_E1T2 : certificateIdentity (mul E1 (T 2)) = true := by decide +kernel
theorem identity_E2T13 : certificateIdentity (mul E2 (T 13)) = true := by decide +kernel
theorem identity_E2T14 : certificateIdentity (mul E2 (T 14)) = true := by decide +kernel

end CKZCertificates
