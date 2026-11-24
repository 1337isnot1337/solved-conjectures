import Init

/-! Exact polynomial coefficient computation for Kauers--Koutschan,
    PROOF.md sections 4--5. The permutation-counting argument and the
    derivation of the Schur moment recurrence remain outside this file.
    Coefficients are in ascending order; six state components are
    handled as independent formal basis vectors.
-/
namespace KauersKoutschanCertificate
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 0

abbrev Poly := List Rat

def add : Poly → Poly → Poly
  | [], q => q
  | p, [] => p
  | a::p, b::q => (a+b)::add p q

def scale (c : Rat) (p : Poly) : Poly := p.map (c * ·)
def sub (p q : Poly) : Poly := add p (scale (-1) q)
def mul : Poly → Poly → Poly
  | [], _ => []
  | a::p, q => add (scale a q) (0 :: mul p q)

def constant (r : Rat) : Poly := [r]
def nPoly (t : Nat) : Poly := [(t : Rat), 2]
def zeroPoly (p : Poly) : Bool := p.all (fun r => r == 0)
def signed (k : Nat) : Rat := if k % 2 = 0 then 1 else -1

def operatorCoeffs : List Poly := [
  [0, 262711, 1387742, -824875, -1855253, -111530, 680983, 364242, 84992, 10332, 640, 16],
  [0, -1050844, -9705192, -7414683, 3536494, 6459004, 3326393, 903534, 144684, 13756, 720, 16],
  [3492344, -2212342, -8507169, -11544227, -12034116, -8216995, -3442049, -890050, -142300, -13660, -720, -16],
  [19817984, 45323852, 825228, -57004661, -57059306, -28077270, -8398637, -1631510, -207980, -16828, -784, -16],
  [9586160, 6680237, -13772613, -27689586, -22162455, -9855085, -2629562, -427656, -41332, -2176, -48],
  [22192864, 44710768, -2924668, -52385912, -45161616, -18784740, -4549208, -674256, -60400, -3008, -64],
  [557152, -2032472, -2937392, -1594200, -517688, -122032, -19856, -1792, -64],
  [3786960, 7105324, -1191064, -8059160, -5938996, -2073752, -402736, -44528, -2624, -64],
  [-598208, -943004, 414196, 1213772, 728648, 203584, 29616, 2176, 64]]

def operatorAt (n : Poly) (cs : Poly) : Poly :=
  cs.foldr (fun c p => add (constant c) (mul n p)) []

def bit (mask i : Nat) : Nat := mask / 2^i % 2

def cells (t mask : Nat) : Nat × Int :=
  let a := bit mask 0
  let b := bit mask 1
  let c := bit mask 2
  let d := bit mask 3
  let p := Int.ofNat ((t+1)/2)
  let q := Int.ofNat (t/2)
  (t+1-a-b-c-d, min (min (p-(Int.ofNat a)-(Int.ofNat b)) (q-(Int.ofNat c)-(Int.ofNat d))) (min (p-(Int.ofNat a)-(Int.ofNat c)) (q-(Int.ofNat b)-(Int.ofNat d))))

def basis (i j : Nat) : Poly := if i=j then [1] else []

structure State where
  D : List Poly
  U : List Poly
  E : List Poly
  T : List Poly

def advance (i : Nat) (st : State) (k : Nat) : State :=
  let d := add (mul (nPoly (k+1)) (st.D[k]!)) (scale (signed (k+1)) (basis i 5))
  let u := sub d (st.U[k]!)
  let e := add (scale (-1) (mul [((k+1 : Nat) : Rat), 1] (st.E[k]!))) (basis i 5)
  let center := if k%2=0 then st.E[k/2]! else []
  let t := add d (scale (1/2) (add (sub (scale (-1) (mul (nPoly (k+2)) (st.T[k]!))) (st.U[k]!)) center))
  ⟨st.D ++ [d], st.U ++ [u], st.E ++ [e], st.T ++ [t]⟩

def state (i : Nat) : State :=
  (List.range 19).foldl (advance i)
    ⟨[basis i 2], [basis i 3], [basis i 4], [basis i 0,basis i 1]⟩

def count (st : State) (t : Nat) : Poly :=
  (List.range 16).foldl (fun acc mask =>
    let (s,j) := cells t mask
    let low := j.toNat+1
    let part := (List.range ((s+1)/2-low)).foldl (fun p r =>
      let k := low+r
      sub p (scale (signed s / ((s-2*k : Nat) : Rat)) (sub (st.E[s-k]!) (st.E[k]!))))
      (st.T[s]!)
    add acc part) []

def originalResidual (n : Poly) (values : List Poly) : Poly :=
  (operatorCoeffs.zip values).foldl
    (fun p (cs,v) => add p (mul (operatorAt n cs) v)) []

def zeilbergerResidual (n : Poly) (a : List Poly) : Poly :=
  let b := (List.range 11).map (fun (i : Nat) =>
    let k := add n (constant (i : Rat))
    add (add a[i+3]! a[i+2]!)
      (scale (1/2) (add (mul (add k [4]) a[i+1]!) (mul (sub k [1]) a[i]!))))
  let c := (List.range 7).map (fun (i : Nat) =>
    let k := add n (constant (i : Rat))
    add b[i+4]! (scale (1/2) (add (sub (mul (add k [4]) b[i+2]!) b[i+1]!) (mul (sub [1] k) b[i]!))))
  sub (sub (sub (add (sub (sub (scale 4 c[6]!) (scale 4 (mul (add n [11]) c[5]!)))
      (mul (add (scale 8 n) [75]) c[4]!)) (mul (sub [3] n) c[3]!))
      (scale 2 c[2]!)) (mul (add (scale 7 n) [22]) c[1]!)) (scale 4 (mul n c[0]!))

def originalCheck (t i : Nat) : Bool :=
  let st := state i
  zeroPoly (originalResidual (nPoly t) ((List.range 9).map (fun j => count st (t+j))))

def zeilbergerCheck (t i : Nat) : Bool :=
  let st := state i
  zeroPoly (zeilbergerResidual (nPoly t) ((List.range 14).map (fun j => count st (t+j))))

def directD (n : Nat) : List Rat :=
  (List.range (n+1)).foldl (fun ds k => ds ++ [((k+1 : Nat) : Rat)*ds[k]! + signed (k+1)]) [1]

def directCount (n : Nat) : Rat :=
  let ds := directD n
  (List.range 16).foldl (fun acc mask =>
    let (m, cutoff) := cells n mask
    if cutoff < 0 then acc else
    acc + ((List.range (cutoff.toNat+1)).foldl (fun v j =>
      let k := m-j
      v + (signed j*ds[k]! - signed k*ds[j]!) / ((k-j : Nat) : Rat)) 0)) 0

def initialOriginal (n : Nat) : Bool :=
  zeroPoly (originalResidual (constant (n : Rat)) ((List.range 9).map (fun j => constant (directCount (n+j)))))

def initialZeilberger (n : Nat) : Bool :=
  zeroPoly (zeilbergerResidual (constant (n : Rat)) ((List.range 14).map (fun j => constant (directCount (n+j)))))

theorem original_even : (List.range 6).all (originalCheck 4) = true := by decide +kernel
theorem original_odd : (List.range 6).all (originalCheck 5) = true := by decide +kernel
theorem zeilberger_even : (List.range 6).all (zeilbergerCheck 4) = true := by decide +kernel
theorem zeilberger_odd : (List.range 6).all (zeilbergerCheck 5) = true := by decide +kernel
theorem original_initial : (List.range 4).all initialOriginal = true := by decide +kernel
theorem zeilberger_initial : (List.range 4).all initialZeilberger = true := by decide +kernel

#print axioms original_even
#print axioms original_odd
#print axioms zeilberger_even
#print axioms zeilberger_odd
#print axioms original_initial
#print axioms zeilberger_initial
end
end KauersKoutschanCertificate
