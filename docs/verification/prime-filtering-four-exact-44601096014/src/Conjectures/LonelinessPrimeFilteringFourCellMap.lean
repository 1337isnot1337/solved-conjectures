import Conjectures.LonelinessPrimeFilteringFourProfiles

namespace Loneliness.PrimeFilteringFourProfiles

set_option maxRecDepth 100000
set_option maxHeartbeats 0

def fractionIndex (c : Fin 60) : Fin 10 :=
  if c.val < 12 then 0 else if c.val < 15 then 1 else
  if c.val < 20 then 2 else if c.val < 24 then 3 else
  if c.val < 30 then 4 else if c.val < 36 then 5 else
  if c.val < 40 then 6 else if c.val < 45 then 7 else
  if c.val < 48 then 8 else 9

def profileOfCell (c : Fin 420) (r : Fin 3) : Fin 210 :=
  ⟨3 * (10 * (c.val / 60) +
      (fractionIndex ⟨c.val % 60, Nat.mod_lt _ (by decide)⟩).val) + r.val, by
    have h := (fractionIndex ⟨c.val % 60, Nat.mod_lt _ (by decide)⟩).isLt
    omega⟩

def residueValue (r : Fin 3) : ℕ := match r.val with
  | 0 => 1
  | 1 => 2
  | _ => 4

def sampleQuotient (c : Fin 420) (j : Fin 5) : ℕ := ((j.val + 1) * c.val / 60) % 7

theorem represented_quotient : ∀ (c : Fin 420) (r : Fin 3) (j : Fin 5),
    quotient (profileOfCell c r) j = sampleQuotient c j := by decide

theorem represented_residue : ∀ (c : Fin 420) (r : Fin 3),
    residue (profileOfCell c r) = residueValue r := by decide

def reflectSample (c : Fin 420) : Fin 420 := ⟨419 - c.val, by omega⟩

theorem reflected_quotient : ∀ (c : Fin 420) (j : Fin 5),
    sampleQuotient (reflectSample c) j = 6 - sampleQuotient c j := by decide

def positiveResidue (r : Fin 6) : Bool := decide (r.val = 0 ∨ r.val = 1 ∨ r.val = 3)

def residueIndex (r : Fin 6) : Fin 3 :=
  if r.val = 0 ∨ r.val = 5 then 0 else if r.val = 1 ∨ r.val = 4 then 1 else 2

theorem residue_acceptance : ∀ (r : Fin 6) (q k : Fin 7),
    (((if positiveResidue r then q.val else 6 - q.val) + k.val * residueValue (residueIndex r)) % 7 ≠ 0 ∧
      ((if positiveResidue r then q.val else 6 - q.val) + k.val * residueValue (residueIndex r)) % 7 ≠ 6) ↔
    ((q.val + k.val * (r.val + 1)) % 7 ≠ 0 ∧ (q.val + k.val * (r.val + 1)) % 7 ≠ 6) := by
  decide

def profileFor (c : Fin 420) (r : Fin 6) : Fin 210 :=
  if positiveResidue r then profileOfCell c (residueIndex r)
  else profileOfCell (reflectSample c) (residueIndex r)

theorem profileFor_accepts (c : Fin 420) (r : Fin 6) (j : Fin 5) (k : Fin 7) :
    Accepts (profileFor c r) j k ↔
    ((sampleQuotient c j + k.val * (r.val + 1)) % 7 ≠ 0 ∧
      (sampleQuotient c j + k.val * (r.val + 1)) % 7 ≠ 6) := by
  have hq : quotient (profileFor c r) j =
      if positiveResidue r then sampleQuotient c j else 6 - sampleQuotient c j := by
    unfold profileFor
    split <;> simp_all only [represented_quotient, reflected_quotient]
  have hr : residue (profileFor c r) = residueValue (residueIndex r) := by
    unfold profileFor
    split <;> simp only [represented_residue]
  unfold Accepts
  rw [hq, hr]
  exact residue_acceptance r ⟨sampleQuotient c j, Nat.mod_lt _ (by decide)⟩ k

end Loneliness.PrimeFilteringFourProfiles
