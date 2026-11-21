import Lean.Elab.Tactic.Omega

set_option autoImplicit false

/-!
A restricted certificate obstruction for Althoefer's game.

This does not prove that every position is determined. It proves that any total
Boolean outcome function satisfying the game's local rule cannot eventually be
constant on the residue class -1 modulo any positive integer.
-/

namespace AlthoeferPeriodicObstruction

/-- `true` means W and `false` means P. The hypotheses express that `lo` and
`hi` are respectively the odd parts of `3*n-1` and `3*n+1`. -/
def ValidOutcome (f : Nat → Bool) : Prop :=
  ∀ n lo hi e d : Nat, 1 < n → n % 2 = 1 → lo % 2 = 1 → hi % 2 = 1 →
    3 * n - 1 = 2 ^ e * lo → 3 * n + 1 = 2 ^ d * hi →
    f n = !(f lo && f hi)

theorem minusOne_family_rule (f : Nat → Bool) (hf : ValidOutcome f)
    (x : Nat) (hx : 0 < x) :
    f (8 * x - 1) = !(f (6 * x - 1) && f (12 * x - 1)) := by
  apply hf (8 * x - 1) (6 * x - 1) (12 * x - 1) 2 1
  · omega
  · omega
  · omega
  · omega
  · change 3 * (8 * x - 1) - 1 = 4 * (6 * x - 1)
    omega
  · change 3 * (8 * x - 1) + 1 = 2 * (12 * x - 1)
    omega

/-- In particular, a finite residue-class W/P certificate cannot cover all
sufficiently large odd positions. -/
theorem no_eventually_constant_minusOne_class (f : Nat → Bool)
    (hf : ValidOutcome f) (M : Nat) (hM : 0 < M) :
    ¬ ∃ K : Nat, ∃ b : Bool, ∀ k : Nat, K ≤ k →
      (k * M - 1) % 2 = 1 → f (k * M - 1) = b := by
  intro h
  cases h with
  | intro K h =>
    cases h with
    | intro b hb =>
      let x := (K + 1) * M
      have hx : 0 < x := Nat.mul_pos (Nat.succ_pos K) hM
      have h6 : f (6 * x - 1) = b := by
        have ho : (6 * x - 1) % 2 = 1 := by omega
        simpa [x, Nat.mul_assoc] using hb (6 * (K + 1)) (by omega)
          (by simpa [x, Nat.mul_assoc] using ho)
      have h8 : f (8 * x - 1) = b := by
        have ho : (8 * x - 1) % 2 = 1 := by omega
        simpa [x, Nat.mul_assoc] using hb (8 * (K + 1)) (by omega)
          (by simpa [x, Nat.mul_assoc] using ho)
      have h12 : f (12 * x - 1) = b := by
        have ho : (12 * x - 1) % 2 = 1 := by omega
        simpa [x, Nat.mul_assoc] using hb (12 * (K + 1)) (by omega)
          (by simpa [x, Nat.mul_assoc] using ho)
      have h := minusOne_family_rule f hf x hx
      rw [h6, h8, h12] at h
      cases b <;> simp at h

#print axioms minusOne_family_rule
#print axioms no_eventually_constant_minusOne_class

end AlthoeferPeriodicObstruction
