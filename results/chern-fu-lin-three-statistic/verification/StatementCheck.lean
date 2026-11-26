import Conjectures.ChernFuLinThreeStatistic

namespace ChernFuLinStatementCheck

open Conjectures.BursteinA218225 Conjectures.ChernFuLinThreeStatistic

private def inverseDescents : {n : ℕ} → Equiv.Perm (Fin n) → ℕ
  | 0, _ => 0
  | n+1, π => ∑ i : Fin n, if π.symm i.succ < π.symm i.castSucc then 1 else 0

private noncomputable def fibre (n : ℕ) (p : Fin 4 → ℕ) (L : Finset (Fin n)) (r d : ℕ) :=
  Nat.card {π : Equiv.Perm (Fin n) //
    (¬ ContainsPattern π p ∧
      ¬ ContainsPattern π (![4,2,1,5,3] : Fin 5 → ℕ) ∧
      ¬ ContainsPattern π (![2,4,1,5,3] : Fin 5 → ℕ)) ∧
    (Finset.univ.filter fun i => ∀ j < i, π i < π j) = L ∧
    (∑ i, if ∀ j > i, π j < π i then 1 else 0) = r ∧ inverseDescents π = d}

/-- This checks the public theorem against literal basis words and statistics;
there is no recurrence, nonemptiness, or other mathematical hypothesis. -/
example (n : ℕ) (L : Finset (Fin n)) (r d : ℕ) :
    fibre n ![2,1,3,4] L r d = fibre n ![3,1,2,4] L r d := by
  have h {m} (π : Equiv.Perm (Fin m)) : inverseDescents π = ides π := by cases m <;> rfl
  simpa only [fibre,fibreCount,InX,InZ,lmi,rma,pat2134,pat3124,pat24153,pat42153,h] using equidistribution n L r d

#print axioms Conjectures.ChernFuLinThreeStatistic.equidistribution

end ChernFuLinStatementCheck
