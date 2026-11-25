import Init

/-!
# Ma–Tang's random subset-sum threshold conjecture
Integer bookkeeping for the Erdős–Rényi finite upper bound. The
group-theoretic moment and shift identities are inputs to this module,
not assumptions of a purported complete conjecture proof.
-/

namespace MaTangCoreUpperDyadic

def threshold (i : Nat) : Nat := 2^(2^i+i+4)

def badCount (n scale : Nat) (xs : List Nat) : Nat :=
  (xs.filter (fun x => decide (n < scale*x))).length

theorem badCount_mul_le (n scale : Nat) (xs : List Nat) :
    badCount n scale xs*n ≤ scale*xs.sum := by
  induction xs with
  | nil => simp [badCount]
  | cons x xs ih =>
    by_cases hx : n < scale*x
    · change (List.filter (fun a => decide (n < scale*a)) (x::xs)).length*n ≤
        scale*(x+xs.sum)
      rw [List.filter_cons]
      simp only [hx, decide_true, ite_true, List.length_cons, Nat.add_mul, Nat.one_mul,
        Nat.mul_add]
      change badCount n scale xs*n+n ≤ scale*x+scale*xs.sum
      omega
    · change (List.filter (fun a => decide (n < scale*a)) (x::xs)).length*n ≤
        scale*(x+xs.sum)
      rw [List.filter_cons]
      simp only [hx, decide_false, Nat.mul_add]
      change badCount n scale xs*n ≤ scale*x+scale*xs.sum
      omega

theorem threshold_step (i : Nat) :
    threshold (i+1)*2^(i+3) = threshold i*threshold i := by
  unfold threshold
  rw [← Nat.pow_add, ← Nat.pow_add]
  congr 1
  rw [Nat.pow_succ]
  omega

/-- The second-moment estimate gives a bound on bad initial prefixes. -/
theorem initial_bad (n : Nat) (hn : 0 < n) (xs : List Nat)
    (hmoment : 512*xs.sum ≤ xs.length*n) :
    16*badCount n (threshold 0) xs ≤ xs.length := by
  have h := Nat.mul_le_mul_left 16 (badCount_mul_le n (threshold 0) xs)
  apply Nat.le_of_mul_le_mul_right _ hn
  calc
    (16*badCount n (threshold 0) xs)*n =
        16*(badCount n (threshold 0) xs*n) := by ac_rfl
    _ ≤ 16*(threshold 0*xs.sum) := h
    _ = 512*xs.sum := by
      change 16*(32*xs.sum) = (16*32)*xs.sum
      ac_rfl
    _ ≤ xs.length*n := hmoment

/-- Given the exact shift second moment, bound the bad child fraction
on a good prefix. All counts and scaling factors are natural numbers. -/
theorem child_bad (n i m : Nat) (hn : 0 < n) (xs : List Nat)
    (hgood : threshold i*m ≤ n) (hshift : xs.sum = m*m) :
    2^(i+3)*badCount n (threshold (i+1)) xs ≤ n := by
  have h := Nat.mul_le_mul_left (2^(i+3)) (badCount_mul_le n (threshold (i+1)) xs)
  apply Nat.le_of_mul_le_mul_right _ hn
  calc
    (2^(i+3)*badCount n (threshold (i+1)) xs)*n =
        2^(i+3)*(badCount n (threshold (i+1)) xs*n) := by ac_rfl
    _ ≤ 2^(i+3)*(threshold (i+1)*xs.sum) := h
    _ = (threshold (i+1)*2^(i+3))*(m*m) := by rw [hshift]; ac_rfl
    _ = (threshold i*m)*(threshold i*m) := by rw [threshold_step]; ac_rfl
    _ ≤ n*n := Nat.mul_le_mul hgood hgood

def failureWeight : Nat → Nat
  | 0 => 1
  | i+1 => 2*failureWeight i+4

theorem failureWeight_closed (i : Nat) : failureWeight i+4 = 5*2^i := by
  induction i with
  | zero => decide
  | succ i ih =>
    rw [failureWeight, Nat.pow_succ]
    omega

/-- Carry all bad prefixes forward by their N extensions, and charge
new failures only at the first bad step. The fresh bound uses the full
sample-space size, so it also applies to a subset of good prefixes. -/
theorem failure_accumulation (n total : Nat) (bad fresh : Nat → Nat)
    (hinit : 16*bad 0 ≤ total)
    (hstep : ∀ i, bad (i+1) ≤ n*bad i+fresh i)
    (hfresh : ∀ i, 2^(i+3)*fresh i ≤ total*n^(i+1))
    (j : Nat) :
    2^(j+4)*bad j ≤ failureWeight j*(total*n^j) := by
  induction j with
  | zero => simpa [failureWeight] using hinit
  | succ i ih =>
    let D := 2^(i+4)
    let E := 2^(i+3)
    have hD : 2^(i+1+4) = 2*D := by
      dsimp [D]
      rw [show i+1+4 = (i+4)+1 by omega, Nat.pow_succ, Nat.mul_comm]
    have hE : 2^(i+1+4) = 4*E := by
      dsimp [E]
      rw [show i+1+4 = (i+3)+2 by omega, Nat.pow_add, Nat.mul_comm]
    calc
      2^(i+1+4)*bad (i+1) ≤ 2^(i+1+4)*(n*bad i+fresh i) :=
        Nat.mul_le_mul_left _ (hstep i)
      _ = (2*n)*(D*bad i)+4*(E*fresh i) := by
        rw [Nat.mul_add]
        congr 1
        · rw [hD]; ac_rfl
        · rw [hE]; ac_rfl
      _ ≤ (2*n)*(failureWeight i*(total*n^i))+4*(total*n^(i+1)) :=
        Nat.add_le_add (Nat.mul_le_mul_left _ ih) (Nat.mul_le_mul_left _ (hfresh i))
      _ = failureWeight (i+1)*(total*n^(i+1)) := by
        rw [failureWeight, Nat.add_mul, Nat.pow_succ]
        congr 1 <;> ac_rfl

theorem failure_fraction (n total : Nat) (bad fresh : Nat → Nat)
    (hinit : 16*bad 0 ≤ total)
    (hstep : ∀ i, bad (i+1) ≤ n*bad i+fresh i)
    (hfresh : ∀ i, 2^(i+3)*fresh i ≤ total*n^(i+1))
    (j : Nat) :
    16*bad j ≤ 5*(total*n^j) := by
  have h := failure_accumulation n total bad fresh hinit hstep hfresh j
  have hw : failureWeight j ≤ 5*2^j := by
    have he := failureWeight_closed j
    omega
  have he : 2^j*(16*bad j) ≤ 2^j*(5*(total*n^j)) := by
    calc
      2^j*(16*bad j) = 2^(j+4)*bad j := by
        rw [Nat.pow_add, Nat.mul_assoc]
      _ ≤ failureWeight j*(total*n^j) := h
      _ ≤ (5*2^j)*(total*n^j) := Nat.mul_le_mul_right _ hw
      _ = 2^j*(5*(total*n^j)) := by ac_rfl
  exact Nat.le_of_mul_le_mul_left he (Nat.two_pow_pos _)

def upperSteps (n : Nat) : Nat := (n.log2+1).log2+1

def upperSampleSize (n : Nat) : Nat := n.log2+10+upperSteps n

theorem terminal_threshold (n : Nat) (hn : n ≠ 0) : n < threshold (upperSteps n) := by
  have h₁ := ((Nat.log2_eq_iff hn).mp (rfl : n.log2 = n.log2)).2
  have h₂ := ((Nat.log2_eq_iff (show n.log2+1 ≠ 0 by omega)).mp
    (rfl : (n.log2+1).log2 = (n.log2+1).log2)).2
  unfold threshold
  apply Nat.lt_of_lt_of_le h₁
  apply Nat.pow_le_pow_right (by decide)
  change n.log2+1 ≤ 2^upperSteps n + upperSteps n + 4
  change n.log2+1 < 2^upperSteps n at h₂
  omega

theorem good_terminal_is_zero (n m : Nat) (hn : n ≠ 0)
    (h : threshold (upperSteps n)*m ≤ n) : m = 0 := by
  by_cases hm : m = 0
  · exact hm
  have h₁ : 1 ≤ m := by omega
  have h₂ := Nat.mul_le_mul_left (threshold (upperSteps n)) h₁
  rw [Nat.mul_one] at h₂
  have ht := terminal_threshold n hn
  omega

theorem square_step (x : Nat) (hx : 5 ≤ x) : (x+2)*(x+2) ≤ 2*(x*x) := by
  have h := Nat.mul_le_mul_right x hx
  rw [Nat.add_mul, Nat.mul_add, Nat.mul_add]
  omega

theorem square_log_budget (L : Nat) (hL : 16 ≤ L) :
    4*((2*L+12)*(2*L+12)) ≤ 2^L := by
  induction L with
  | zero => omega
  | succ L ih =>
    by_cases hb : L = 15
    · subst L; decide
    have h₀ : 16 ≤ L := by omega
    have hs := square_step (2*L+12) (by omega)
    have he : 2*(L+1)+12 = (2*L+12)+2 := by omega
    rw [he, Nat.pow_succ]
    calc
      4*((2*L+12+2)*(2*L+12+2)) ≤ 4*(2*((2*L+12)*(2*L+12))) :=
        Nat.mul_le_mul_left _ hs
      _ = (4*((2*L+12)*(2*L+12)))*2 := by ac_rfl
      _ ≤ 2^L*2 := Nat.mul_le_mul_right _ (ih h₀)

theorem upper_birthday_budget (n : Nat) (hn : 2^16 ≤ n) :
    4*(upperSampleSize n*upperSampleSize n) ≤ n := by
  have hpos : n ≠ 0 := by omega
  have hL : 16 ≤ n.log2 := (Nat.le_log2 hpos).mpr hn
  have hlog := Nat.log2_le_self (n.log2+1)
  have hk : upperSampleSize n ≤ 2*n.log2+12 := by unfold upperSampleSize upperSteps; omega
  calc
    4*(upperSampleSize n*upperSampleSize n) ≤ 4*((2*n.log2+12)*(2*n.log2+12)) :=
      Nat.mul_le_mul_left _ (Nat.mul_le_mul hk hk)
    _ ≤ 2^n.log2 := square_log_budget n.log2 hL
    _ ≤ n := (Nat.le_log2 hpos).mp (Nat.le_refl _)

/-- Divide the iid failure estimate by the surviving distinct fraction. -/
theorem conditioned_failure (total bad distinct badDistinct : Nat)
    (hbad : 16*bad ≤ 5*total) (hlarge : 7*total ≤ 8*distinct)
    (hsub : badDistinct ≤ bad) :
    14*badDistinct ≤ 5*distinct := by omega

end MaTangCoreUpperDyadic

