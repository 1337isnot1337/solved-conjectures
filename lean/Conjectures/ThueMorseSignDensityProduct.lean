module

public import Init

@[expose] public section

/-!
Coefficientwise integer formal-polynomial model for the source
T(q)^m = ∏_{i≥0} (1 - q^(2^i))^m.
Multiplication by (1-q^d) is defined by its exact coefficient formula.
Finite prefixes use the ordinary increasing order of factors. Stabilization
and the functional equation are proved, not assumed.
-/

namespace ThueMorseSignDensityProduct

abbrev Coeff := Nat → Int

def one : Coeff := fun n => if n = 0 then 1 else 0

def shift (d : Nat) (f : Coeff) : Coeff :=
  fun n => if d ≤ n then f (n-d) else 0

def factor (d : Nat) (f : Coeff) : Coeff :=
  fun n => f n - shift d f n

def factorPower (d : Nat) : Nat → Coeff → Coeff
  | 0, f => f
  | m+1, f => factor d (factorPower d m f)

/-- Exact coefficients of the product of the first L factors, each raised
to power m, with the usual polynomial product convention. -/
def prefix (m : Nat) : Nat → Coeff
  | 0 => one
  | L+1 => factorPower (2^L) m (prefix m L)

def inflate (f : Coeff) : Coeff :=
  fun n => if n % 2 = 0 then f (n/2) else 0

theorem shift_sub (d : Nat) (f g : Coeff) (n : Nat) :
    shift d (fun i => f i - g i) n = shift d f n - shift d g n := by
  unfold shift
  split <;> simp_all

theorem shift_shift (d e : Nat) (f : Coeff) (n : Nat) :
    shift d (shift e f) n = shift (d+e) f n := by
  by_cases h : d+e ≤ n
  · have hd : d ≤ n := by omega
    have he : e ≤ n-d := by omega
    simp only [shift, if_pos hd, if_pos he, if_pos h]
    rw [show n-d-e=n-(d+e) by omega]
  · by_cases hd : d ≤ n
    · have he : ¬ e ≤ n-d := by omega
      simp [shift, hd, he, h]
    · simp [shift, hd, h]

theorem factor_comm (d e : Nat) (f : Coeff) :
    factor d (factor e f) = factor e (factor d f) := by
  funext n
  change f n - shift e f n - shift d (fun i => f i - shift e f i) n =
    f n - shift d f n - shift e (fun i => f i - shift d f i) n
  rw [shift_sub, shift_sub, shift_shift, shift_shift, Nat.add_comm d e]
  omega

theorem factor_power_comm (d e m : Nat) (f : Coeff) :
    factor d (factorPower e m f) = factorPower e m (factor d f) := by
  induction m with
  | zero => rfl
  | succ m ih =>
    simp only [factorPower]
    rw [factor_comm d e, ih]

theorem powers_comm (d e a b : Nat) (f : Coeff) :
    factorPower d a (factorPower e b f) = factorPower e b (factorPower d a f) := by
  induction a with
  | zero => rfl
  | succ a ih =>
    simp only [factorPower]
    rw [ih, factor_power_comm]

theorem inflate_one : inflate one = one := by
  funext n
  by_cases h : n = 0
  · subst n
    rfl
  · by_cases he : n%2=0
    · have hn : n/2 ≠ 0 := by omega
      simp [inflate, one, h, he, hn]
    · simp [inflate, one, h, he]

theorem inflate_factor (d : Nat) (f : Coeff) :
    inflate (factor d f) = factor (2*d) (inflate f) := by
  funext n
  by_cases he : n%2=0
  · by_cases hd : d ≤ n/2
    · have h2d : 2*d ≤ n := by omega
      have h2e : (n-2*d)%2=0 := by omega
      have hdiv : (n-2*d)/2=n/2-d := by omega
      simp [inflate, factor, shift, he, hd, h2d, h2e, hdiv]
    · have h2d : ¬ 2*d ≤ n := by omega
      simp [inflate, factor, shift, he, hd, h2d]
  · by_cases hd : 2*d ≤ n
    · have ho : (n-2*d)%2 ≠ 0 := by omega
      simp [inflate, factor, shift, he, hd, ho]
    · simp [inflate, factor, shift, he, hd]

theorem inflate_power (d m : Nat) (f : Coeff) :
    inflate (factorPower d m f) = factorPower (2*d) m (inflate f) := by
  induction m with
  | zero => rfl
  | succ m ih =>
    simp only [factorPower]
    rw [inflate_factor, ih]

/-- The functional equation of the actual finite polynomial products,
obtained by commuting the polynomial factors. -/
theorem prefix_step (m L : Nat) :
    prefix m (L+1) = factorPower 1 m (inflate (prefix m L)) := by
  induction L with
  | zero =>
    change factorPower 1 m one = factorPower 1 m (inflate one)
    rw [inflate_one]
  | succ L ih =>
    change factorPower (2^(L+1)) m (prefix m (L+1)) =
      factorPower 1 m (inflate (factorPower (2^L) m (prefix m L)))
    rw [ih, inflate_power, Nat.pow_succ, Nat.mul_comm (2^L) 2, powers_comm]

theorem factorPower_below (d m : Nat) (f : Coeff) (n : Nat) (hn : n<d) :
    factorPower d m f n = f n := by
  induction m with
  | zero => rfl
  | succ m ih =>
    have hd : ¬ d≤n := by omega
    simp [factorPower, factor, shift, hd, ih]

theorem prefix_stable_step (m L n : Nat) (hn : n < 2^L) :
    prefix m (L+1) n = prefix m L n :=
  factorPower_below (2^L) m (prefix m L) n hn

theorem pow_mono (a b : Nat) (h : a ≤ b) : 2^a ≤ 2^b := by
  induction b with
  | zero =>
    have ha : a=0 := by omega
    simp [ha]
  | succ b ih =>
    by_cases hb : a ≤ b
    · have h1 := ih hb
      rw [Nat.pow_succ]
      omega
    · have ha : a=b+1 := by omega
      rw [ha]

theorem lt_two_pow (n : Nat) : n < 2^n := by
  induction n with
  | zero => decide
  | succ n ih =>
    rw [Nat.pow_succ]
    omega

theorem prefix_stable (m n d e : Nat) (hn : n < 2^d) (hde : d≤e) :
    prefix m e n = prefix m d n := by
  induction e with
  | zero =>
    have hd : d=0 := by omega
    rw [hd]
  | succ e ih =>
    by_cases h : d≤e
    · have hpow := pow_mono d e h
      rw [prefix_stable_step m e n (by omega), ih h]
    · have hd : d=e+1 := by omega
      rw [hd]

/-- Coefficient of the infinite product: the n-factor polynomial prefix
already suffices because n < 2^n. -/
def t (m n : Nat) : Int := prefix m n n

theorem t_eq_prefix (m n L : Nat) (h : n<2^L) :
    t m n = prefix m L n := by
  unfold t
  by_cases hn : L≤n
  · exact prefix_stable m n L n h hn
  · exact (prefix_stable m n n L (lt_two_pow n) (by omega)).symm

theorem t_zero (m : Nat) : t m 0 = 1 := rfl

theorem inflate_even (f : Coeff) (n : Nat) : inflate f (2*n) = f n := by
  simp [inflate, show (2*n)%2=0 by omega, show (2*n)/2=n by omega]

theorem inflate_odd (f : Coeff) (n : Nat) : inflate f (2*n+1) = 0 := by
  simp [inflate, show (2*n+1)%2≠0 by omega]

theorem factor_even (f : Coeff) (n : Nat) : factor 1 (inflate f) (2*n) = f n := by
  by_cases hn : n=0
  · subst n
    rfl
  · have hd : 1≤2*n := by omega
    have he : 2*n-1=2*(n-1)+1 := by omega
    simp [factor, shift, hd, he, inflate_even, inflate_odd]

theorem factor_odd (f : Coeff) (n : Nat) : factor 1 (inflate f) (2*n+1) = -f n := by
  have hd : 1≤2*n+1 := by omega
  have he : 2*n+1-1=2*n := by omega
  simp [factor, shift, hd, he, inflate_even, inflate_odd]

theorem square_even (f : Coeff) (n : Nat) :
    factorPower 1 2 (inflate f) (2*n) =
      f n + if n=0 then 0 else f (n-1) := by
  change factor 1 (factor 1 (inflate f)) (2*n) = _
  by_cases hn : n=0
  · subst n
    simp [factor, shift, inflate]
  · have hd : 1≤2*n := by omega
    have he : 2*n-1=2*(n-1)+1 := by omega
    change factor 1 (inflate f) (2*n) - shift 1 (factor 1 (inflate f)) (2*n) = _
    simp [shift, hd, he, factor_even, factor_odd, hn]

theorem square_odd (f : Coeff) (n : Nat) :
    factorPower 1 2 (inflate f) (2*n+1) = -2*f n := by
  change factor 1 (inflate f) (2*n+1) - shift 1 (factor 1 (inflate f)) (2*n+1) = _
  have hd : 1≤2*n+1 := by omega
  have he : 2*n+1-1=2*n := by omega
  simp only [shift, if_pos hd, he, factor_even, factor_odd]
  omega

def prev (n : Nat) : Int := if n=0 then 0 else t 2 (n-1)

theorem t_even (n : Nat) : t 2 (2*n) = t 2 n + prev n := by
  have hp : n < 2^n := lt_two_pow n
  have hp' : n-1 < 2^n := by omega
  have hbig : 2*n < 2^(n+1) := by rw [Nat.pow_succ]; omega
  rw [t_eq_prefix 2 (2*n) (n+1) hbig, prefix_step, square_even,
    ← t_eq_prefix 2 n n hp, ← t_eq_prefix 2 (n-1) n hp']
  rfl

theorem t_odd (n : Nat) : t 2 (2*n+1) = -2*t 2 n := by
  have hp : n < 2^n := lt_two_pow n
  have hbig : 2*n+1 < 2^(n+1) := by rw [Nat.pow_succ]; omega
  rw [t_eq_prefix 2 (2*n+1) (n+1) hbig, prefix_step, square_odd,
    ← t_eq_prefix 2 n n hp]

theorem prev_even (n : Nat) : prev (2*n) = -2*prev n := by
  by_cases hn : n=0
  · subst n
    rfl
  · have h2n : 2*n≠0 := by omega
    have he : 2*n-1=2*(n-1)+1 := by omega
    simp [prev, hn, h2n, he, t_odd]

theorem prev_odd (n : Nat) : prev (2*n+1) = t 2 n + prev n := by
  have h2n : 2*n+1≠0 := by omega
  have he : 2*n+1-1=2*n := by omega
  rw [prev, if_neg h2n, he, t_even]

end ThueMorseSignDensityProduct
