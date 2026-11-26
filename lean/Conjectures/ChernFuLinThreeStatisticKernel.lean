import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Ring

/-! # Fraction-free elimination for the weighted tail kernel

These are polynomial identities over an integral domain. In particular the
elimination can be used directly in the power series ring: neither a Laurent
series coercion nor division by a positive-order formal series is needed.
Here `k = xtz` in the combinatorial specialization.
-/

namespace Conjectures.ChernFuLinThreeStatistic.Kernel

variable {R : Type*} [CommRing R]

def cubic (s x k z : R) : R :=
  -(k^2*s*(z+1)) - k*s^2*(2*z+1) + 2*k*s*x*z + 2*k*s*z + k*s - k*x*z
    - s^3*z + s^2*x*z + 2*s^2*z - 2*s*x*z - s*z + x*z

def D (s k : R) : R := 1-k-2*s+2*k*s+s^2

def baseNum (s k z : R) : R := k*s*z-k*s-k*z-s*z+z

def momentNum (s k z : R) : R :=
  2*k^2*s*z-k^2*z+2*k*s^2*z-k*s^2-4*k*s*z+k*s+2*k*z-s^2*z+2*s*z-z

/-- Common denominator of the original two-by-two kernel. -/
def H (s k z : R) : R := s*z*(s-1)*(k+s-1)

def k11 (s x k z : R) : R := (s-x)*z*(s-1)*(k+s-1)+k*s*(s-1)-x*z*k*s
def k12 (s x k z : R) : R := x*k*z*(k+s-1)
def k21 (s k z : R) : R := -k*s*(s*z-s+1)
def k22 (s x k z : R) : R := (s-x)*z*(s-1)*(k+s-1)+k*s*z*(k+s-1)

theorem determinant (s x k z : R) :
    k11 s x k z * k22 s x k z - k12 s x k z * k21 s k z =
      (x-s)*z*(s-1)*(k+s-1)*cubic s x k z := by
  unfold k11 k22 k12 k21 cubic; ring

theorem cubic_at_x (x k z : R) : cubic x x k z = -k*x*(k*z+k+x-z-1) := by
  unfold cubic; ring

/-- Kernel equations after multiplying through by `H` and the common terminal
weight denominator `e`. `a,b` are the unknown coefficients at index zero. -/
def System (s x k z a b f g e : R) : Prop :=
  ∃ A B : R,
    e*(k11 s x k z*A+k12 s x k z*B) = H s k z*(x*g-e*a) ∧
    e*(k21 s k z*A+k22 s x k z*B) = H s k z*(f-e*b)

private def elim (s x k z a b f g e : R) : R :=
  k11 s x k z*(f-e*b) - k21 s k z*(x*g-e*a)

private theorem eliminate [IsDomain R] {s x k z a b f g e : R}
    (hs : s = x ∨ cubic s x k z = 0) (hH : H s k z ≠ 0)
    (h : System s x k z a b f g e) : elim s x k z a b f g e = 0 := by
  obtain ⟨A, B, h₁, h₂⟩ := h
  have hd : k11 s x k z*k22 s x k z-k12 s x k z*k21 s k z = 0 := by
    rw [determinant]; rcases hs with rfl | hc <;> simp [*]
  apply (mul_eq_zero.mp (show H s k z * elim s x k z a b f g e = 0 by
    unfold elim
    linear_combination k21 s k z * h₁ - k11 s x k z * h₂ + e*B*hd)).resolve_left hH

private theorem at_x (x k z a b : R) (moment : Bool) :
    elim x x k z a b (if moment then 1-k else 1) 1 (if moment then 1-k-x else 1-x) =
      -k*x*(x*z-x+1)*(if moment then 1-k-x else 1-x)*(a-b+1) := by
  cases moment <;> simp [elim,k11,k21] <;> ring

private theorem at_root_base (s x k z b : R) :
    elim s x k z (b-1) b 1 1 (1-s) = (x-s)*(1-s)*(z*D s k*b-baseNum s k z) := by
  unfold elim k11 k21 D baseNum; ring

private theorem at_root_moment (s x k z b : R) :
    elim s x k z (b-1) b (1-k) 1 (1-k-s) =
      -(x-s)*(z*(k+s-1)*D s k*b-momentNum s k z) := by
  unfold elim k11 k21 D momentNum; ring

theorem moment_certificate (s x k z : R) :
    x*z*D s k*(momentNum s k z-(k+s-1)*baseNum s k z) -
      k*(k+s-1)*(baseNum s k z-z*D s k)^2 =
    k*s*(k*z+k+s*z-z)*cubic s x k z := by
  unfold cubic D baseNum momentNum; ring

private theorem first_root [IsDomain R] {x k z a b : R} (moment : Bool)
    (hH : H x k z ≠ 0) (hk : k ≠ 0) (hc : x*z-x+1 ≠ 0)
    (hs : System x x k z a b (if moment then 1-k else 1) 1 (if moment then 1-k-x else 1-x)) :
    a = b-1 := by
  have he := eliminate (Or.inl rfl) hH hs
  rw [at_x _ _ _ _ _ moment] at he
  have hprod := hH
  simp only [H, ne_eq, mul_eq_zero, not_or] at hprod
  have he' : (if moment then 1-k-x else 1-x) ≠ 0 := by
    cases moment <;> dsimp <;> intro hz
    · apply hprod.1.2; linear_combination -hz
    · apply hprod.2; linear_combination -hz
  have hf := (mul_eq_zero.mp he).resolve_left (mul_ne_zero
    (mul_ne_zero (mul_ne_zero (neg_ne_zero.mpr hk) hprod.1.1.1) hc) he')
  linear_combination hf

/-- At the two roots, the ordinary and moment systems imply the tail moment
identity. Every cancellation that needs a nonzero factor is explicit. -/
theorem two_root_moment [IsDomain R] {r x k z a b a' m : R}
    (hr : cubic r x k z = 0) (hrx : r ≠ x) (hHr : H r k z ≠ 0) (hHx : H x k z ≠ 0)
    (hk : k ≠ 0) (hc : x*z-x+1 ≠ 0) (hD : D r k ≠ 0)
    (h₁ : System x x k z a b 1 1 (1-x)) (h₂ : System r x k z a b 1 1 (1-r))
    (h₃ : System x x k z a' m (1-k) 1 (1-k-x)) (h₄ : System r x k z a' m (1-k) 1 (1-k-r)) :
    x*(m-b) = k*(b-1)^2 := by
  have ha : a = b-1 := first_root false hHx hk hc h₁
  have ha' : a' = m-1 := first_root true hHx hk hc h₃
  have hB := eliminate (Or.inr hr) hHr h₂
  have hM := eliminate (Or.inr hr) hHr h₄
  rw [ha, at_root_base] at hB
  rw [ha', at_root_moment] at hM
  have hprod := hHr
  simp only [H, ne_eq, mul_eq_zero, not_or] at hprod
  have h1r : 1-r ≠ 0 := sub_ne_zero.mpr (Ne.symm (sub_ne_zero.mp hprod.1.2))
  have hB' := sub_eq_zero.mp ((mul_eq_zero.mp hB).resolve_left
    (mul_ne_zero (sub_ne_zero.mpr hrx.symm) h1r))
  have hM' := sub_eq_zero.mp ((mul_eq_zero.mp hM).resolve_left (neg_ne_zero.mpr (sub_ne_zero.mpr hrx.symm)))
  have h := moment_certificate r x k z
  rw [hr, mul_zero, ← hM', ← hB'] at h
  apply sub_eq_zero.mp
  apply (mul_eq_zero.mp (show (r+k-1)*(z*D r k)^2 * (x*(m-b)-k*(b-1)^2) = 0 by
    linear_combination h)).resolve_left
  rw [add_comm r k]
  exact mul_ne_zero hprod.2 (pow_ne_zero _ (mul_ne_zero hprod.1.1.2 hD))

end Conjectures.ChernFuLinThreeStatistic.Kernel
