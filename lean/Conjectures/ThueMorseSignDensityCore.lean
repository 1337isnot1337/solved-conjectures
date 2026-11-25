module

public import Init

@[expose] public section

/-!
# Gawron–Miska–Ulas's Thue–Morse sign-density conjecture

Core arithmetic reduction, from the two digit recurrences to the sign
exceptions and the finite-prefix counting bounds in the existing proof
of Conjecture 5.8 (arXiv:1703.01955). This module intentionally depends
only on the pinned Lean toolchain's core library. The separate bridge to
the coefficients of the Thue–Morse product is in ThueMorseSignDensity.
-/

namespace ThueMorseSignDensityCore

structure Recurrence (a p : Nat → Int) : Prop where
  zero : a 0 = 1
  prev_zero : p 0 = 0
  even : ∀ n, a (2*n) = a n + p n
  odd : ∀ n, a (2*n+1) = -2 * a n
  prev_even : ∀ n, p (2*n) = -2 * p n
  prev_odd : ∀ n, p (2*n+1) = a n + p n

variable {a p : Nat → Int}

theorem parity_pair (r : Recurrence a p) (n : Nat) :
    a n % 2 + p n % 2 = 1 := by
  induction n using Nat.strongRecOn with
  | ind n ih =>
    by_cases hz : n = 0
    · subst n
      rw [r.zero, r.prev_zero]
      decide
    · let k := n / 2
      have hk : k < n := by dsimp [k]; omega
      have h := ih k hk
      by_cases he : n % 2 = 0
      · have hn : n = 2*k := by dsimp [k]; omega
        rw [hn, r.even, r.prev_even]
        omega
      · have hn : n = 2*k+1 := by dsimp [k]; omega
        rw [hn, r.odd, r.prev_odd]
        omega

theorem nonzero (r : Recurrence a p) (n : Nat) : a n ≠ 0 := by
  induction n using Nat.strongRecOn with
  | ind n ih =>
    by_cases he : n % 2 = 0
    · let k := n / 2
      have hn : n = 2*k := by dsimp [k]; omega
      have h := parity_pair r k
      rw [hn, r.even]
      omega
    · let k := n / 2
      have hn : n = 2*k+1 := by dsimp [k]; omega
      have hk : k < n := by dsimp [k]; omega
      have h := ih k hk
      rw [hn, r.odd]
      omega

theorem row_512_0 (r : Recurrence a p) (n : Nat) :
    a (512*n+0) = 1*a n + 171*p n := by
  have hn : 512*n+0 = (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * n))))))))) := by omega
  rw [hn]
  simp only [r.even, r.prev_even]
  omega

theorem row_512_30 (r : Recurrence a p) (n : Nat) :
    a (512*n+30) = 11*a n - 39*p n := by
  have hn : 512*n+30 = (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * n)))) + 1) + 1) + 1) + 1)) := by omega
  rw [hn]
  simp only [r.even, r.odd, r.prev_even, r.prev_odd]
  omega

theorem row_512_324 (r : Recurrence a p) (n : Nat) :
    a (512*n+324) = -3*a n + 7*p n := by
  have hn : 512*n+324 = (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * n + 1)) + 1)))) + 1))) := by omega
  rw [hn]
  simp only [r.even, r.odd, r.prev_even, r.prev_odd]
  omega

theorem row_256_1 (r : Recurrence a p) (n : Nat) :
    a (256*n+1) = -2*a n - 86*p n := by
  have hn : 256*n+1 = (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * n))))))) + 1) := by omega
  rw [hn]
  simp only [r.even, r.odd, r.prev_even]
  omega

theorem row_256_16 (r : Recurrence a p) (n : Nat) :
    a (256*n+16) = -7*a n + 19*p n := by
  have hn : 256*n+16 = (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * n))) + 1))))) := by omega
  rw [hn]
  simp only [r.even, r.odd, r.prev_even, r.prev_odd]
  omega

theorem row_256_166 (r : Recurrence a p) (n : Nat) :
    a (256*n+166) = 3*a n - 7*p n := by
  have hn : 256*n+166 = (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * n + 1)) + 1))) + 1) + 1)) := by omega
  rw [hn]
  simp only [r.even, r.odd, r.prev_even, r.prev_odd]
  omega

theorem identity0 (r : Recurrence a p) (n : Nat) :
    a (512*n+0) + 13*a (512*n+30) + 48*a (512*n+324) = 0 := by
  rw [row_512_0 r, row_512_30 r, row_512_324 r]
  omega

theorem identity1 (r : Recurrence a p) (n : Nat) :
    a (256*n+1) + 34*a (256*n+16) + 80*a (256*n+166) = 0 := by
  rw [row_256_1 r, row_256_16 r, row_256_166 r]
  omega

theorem block0 (r : Recurrence a p) (h : Nat) :
    ∃ s : Nat, s < 512 ∧ a (3*(512*h+s)) < 0 := by
  by_cases hex : ∃ s : Nat, s < 512 ∧ a (3*(512*h+s)) < 0
  · exact hex
  · have hn (s : Nat) (hs : s < 512) : 0 ≤ a (3*(512*h+s)) := by
      by_cases ha : a (3*(512*h+s)) < 0
      · exact False.elim (hex ⟨s, hs, ha⟩)
      · omega
    have h0 := hn 0 (by decide)
    have h1 := hn 10 (by decide)
    have h2 := hn 108 (by decide)
    rw [show 3*(512*h+0) = 512*(3*h)+0 by omega] at h0
    rw [show 3*(512*h+10) = 512*(3*h)+30 by omega] at h1
    rw [show 3*(512*h+108) = 512*(3*h)+324 by omega] at h2
    have hid := identity0 r (3*h)
    have hne := nonzero r (512*(3*h)+0)
    omega

theorem block1 (r : Recurrence a p) (h : Nat) :
    ∃ s : Nat, s < 256 ∧ 0 < a (3*(256*h+s)+1) := by
  by_cases hex : ∃ s : Nat, s < 256 ∧ 0 < a (3*(256*h+s)+1)
  · exact hex
  · have hn (s : Nat) (hs : s < 256) : a (3*(256*h+s)+1) ≤ 0 := by
      by_cases ha : 0 < a (3*(256*h+s)+1)
      · exact False.elim (hex ⟨s, hs, ha⟩)
      · omega
    have h0 := hn 0 (by decide)
    have h1 := hn 5 (by decide)
    have h2 := hn 55 (by decide)
    rw [show 3*(256*h+0)+1 = 256*(3*h)+1 by omega] at h0
    rw [show 3*(256*h+5)+1 = 256*(3*h)+16 by omega] at h1
    rw [show 3*(256*h+55)+1 = 256*(3*h)+166 by omega] at h2
    have hid := identity1 r (3*h)
    have hne := nonzero r (256*(3*h)+1)
    omega

/-- Count the satisfying indices in the half-open prefix [0,X). -/
def countPrefix (b : Nat → Bool) : Nat → Nat
  | 0 => 0
  | n+1 => countPrefix b n + if b n then 1 else 0

theorem count_step (b : Nat → Bool) (n : Nat) :
    countPrefix b n ≤ countPrefix b (n+1) := by
  simp only [countPrefix]
  omega

theorem count_mono (b : Nat → Bool) (x y : Nat) (h : x ≤ y) :
    countPrefix b x ≤ countPrefix b y := by
  induction y with
  | zero =>
    have hx : x = 0 := by omega
    simp [hx]
  | succ y ih =>
    by_cases hx : x ≤ y
    · have h1 := ih hx
      have h2 := count_step b y
      omega
    · have he : x = y+1 := by omega
      simp [he]

theorem count_increase (b : Nat → Bool) (x y i : Nat)
    (hx : x ≤ i) (hy : i < y) (hb : b i = true) :
    countPrefix b x + 1 ≤ countPrefix b y := by
  have h1 := count_mono b x i hx
  have h2 := count_mono b (i+1) y (by omega)
  rw [countPrefix, hb] at h2
  simp at h2
  omega

theorem count_at_multiples (b : Nat → Bool) (L : Nat)
    (hit : ∀ h : Nat, ∃ s : Nat, s < L ∧ b (L*h+s) = true)
    (k : Nat) : k ≤ countPrefix b (L*k) := by
  induction k with
  | zero => omega
  | succ k ih =>
    obtain ⟨s, hs, hb⟩ := hit k
    have hx : L*k ≤ L*k+s := by omega
    have hy : L*k+s < L*(k+1) := by rw [Nat.mul_succ]; omega
    have hi := count_increase b (L*k) (L*(k+1)) (L*k+s) hx hy hb
    omega

theorem count_from_blocks (b : Nat → Bool) (L X : Nat)
    (hit : ∀ h : Nat, ∃ s : Nat, s < L ∧ b (L*h+s) = true) :
    X/L ≤ countPrefix b X := by
  have h1 := count_at_multiples b L hit (X/L)
  have h2 := count_mono b (L*(X/L)) X
    (by rw [Nat.mul_comm]; exact Nat.div_mul_le_self X L)
  omega

theorem lower_bound0 (r : Recurrence a p) (X : Nat) :
    X/512 ≤ countPrefix (fun n => decide (a (3*n) < 0)) X := by
  apply count_from_blocks
  intro h
  obtain ⟨s, hs, ha⟩ := block0 r h
  exact ⟨s, hs, by simpa using ha⟩

theorem lower_bound1 (r : Recurrence a p) (X : Nat) :
    X/256 ≤ countPrefix (fun n => decide (0 < a (3*n+1))) X := by
  apply count_from_blocks
  intro h
  obtain ⟨s, hs, ha⟩ := block1 r h
  exact ⟨s, hs, by simpa using ha⟩

/-- Natural density zero in rational epsilon form: for every k>0 the
fraction of hits eventually is strictly smaller than 1/k.
The separate real-valued bridge uses the same finite-prefix count. -/
def ZeroDensity (b : Nat → Bool) : Prop :=
  ∀ k : Nat, 0 < k → ∃ N : Nat, ∀ X : Nat, N ≤ X →
    k * countPrefix b X < X

theorem not_zero_density0 (r : Recurrence a p) :
    ¬ ZeroDensity (fun n => decide (a (3*n) < 0)) := by
  intro hz
  obtain ⟨N, hN⟩ := hz 512 (by decide)
  let X := 512*(N+1)
  have hX : N ≤ X := by dsimp [X]; omega
  have hc := lower_bound0 r X
  have hd : X/512 = N+1 := by dsimp [X]; omega
  rw [hd] at hc
  have hbad := hN X hX
  dsimp [X] at hc hbad
  omega

theorem not_zero_density1 (r : Recurrence a p) :
    ¬ ZeroDensity (fun n => decide (0 < a (3*n+1))) := by
  intro hz
  obtain ⟨N, hN⟩ := hz 256 (by decide)
  let X := 256*(N+1)
  have hX : N ≤ X := by dsimp [X]; omega
  have hc := lower_bound1 r X
  have hd : X/256 = N+1 := by dsimp [X]; omega
  rw [hd] at hc
  have hbad := hN X hX
  dsimp [X] at hc hbad
  omega

end ThueMorseSignDensityCore
