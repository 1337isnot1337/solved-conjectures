import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.Tactic.NormNum.Prime
import Mathlib.Tactic.NormNum

/-! Exact arithmetic inputs for the order-479 Hadamard automorphism obstruction.

These declarations do not assume the cyclotomic splitting or descent arguments.
The bounded norm certificates are reduced by Lean's kernel.
-/

set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace HadamardAutomorphism

theorem prime_599 : Nat.Prime 599 := by norm_num

theorem prime_479 : Nat.Prime 479 := by norm_num

theorem prime_239 : Nat.Prime 239 := by norm_num

theorem order_parameters : 2396 = 4 * 599 ∧ 2396 = 5 * 479 + 1 := by norm_num

theorem residue_power : (599 : ZMod 479) ^ 239 = 1 := by decide

theorem residue_ne_one : (599 : ZMod 479) ≠ 1 := by decide

theorem residue_order : orderOf (599 : ZMod 479) = 239 := by
  let : Fact (Nat.Prime 239) := ⟨prime_239⟩
  exact orderOf_eq_prime residue_power residue_ne_one

def residueUnit : (ZMod 479)ˣ := ZMod.unitOfCoprime 599 (by decide)

@[simp] theorem coe_residueUnit : (residueUnit : ZMod 479) = 599 := by
  exact ZMod.coe_unitOfCoprime 599 _

theorem unit_order : orderOf residueUnit = 239 := by
  let : Fact (Nat.Prime 239) := ⟨prime_239⟩
  apply orderOf_eq_prime
  · apply Units.ext
    simpa using residue_power
  · intro h
    have hh := congrArg (fun u : (ZMod 479)ˣ => (u : ZMod 479)) h
    exact residue_ne_one (by simpa using hh)

end HadamardAutomorphism
