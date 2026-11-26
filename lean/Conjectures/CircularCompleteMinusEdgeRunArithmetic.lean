import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Algebra.Order.BigOperators.Ring.Finset

/-! The exact gap sum and saturation in the recorded run argument.
This layer is arithmetic; actual edge-position hypotheses are passed
explicitly and must be proved at the graph-level application. -/

namespace CircularCompleteMinusEdge

open scoped BigOperators

def runStep {m : ℕ} (p : Fin (m+1)→ℕ) (i : Fin m) : ℕ :=
  p i.succ - p i.castSucc

def stepQuotient {m : ℕ} (n : ℕ) (p : Fin (m+1)→ℕ) (i : Fin m) : ℕ :=
  runStep p i / n

private theorem castSucc_lt_succ_index {m : ℕ} (i : Fin m) : i.castSucc<i.succ := by
  exact Nat.lt_succ_self i.val

theorem position_span_eq_sum_runStep {m : ℕ} (p : Fin (m+1)→ℕ) (hp : StrictMono p) :
    p (Fin.last m)-p 0 = ∑ i,runStep p i := by
  have hApply (i : Fin m) : runStep p i + p i.castSucc = p i.succ :=
    Nat.sub_add_cancel (hp (castSucc_lt_succ_index i)).le
  have h : (∑ i : Fin m,(runStep p i + p i.castSucc)) = ∑ i : Fin m,p i.succ :=
    Finset.sum_congr rfl (fun i _ => hApply i)
  rw [Finset.sum_add_distrib] at h
  have he : p 0 + (∑ i : Fin m,p i.succ) =
      (∑ i : Fin m,p i.castSucc) + p (Fin.last m) := by
    rw [← Fin.sum_univ_succ p, ← Fin.sum_univ_castSucc p]
  omega

theorem position_span_eq_quotient_sum {n m : ℕ} (p : Fin (m+1)→ℕ)
    (hp : StrictMono p) (hm : ∀ i,runStep p i % n=1) :
    p (Fin.last m)-p 0 = m+n*(∑ i,stepQuotient n p i) := by
  rw [position_span_eq_sum_runStep p hp]
  have he (i : Fin m) : runStep p i=1+n*stepQuotient n p i := by
    have h := Nat.mod_add_div (runStep p i) n
    rw [hm i] at h
    exact h.symm
  simp only [he,Finset.sum_add_distrib,← Finset.mul_sum,Finset.sum_const,
    Finset.card_univ,Fintype.card_fin,smul_eq_mul,mul_one]

def jumpCount {m : ℕ} (n : ℕ) (p : Fin (m+1)→ℕ) : ℕ :=
  (Finset.univ.filter fun i => 0<stepQuotient n p i).card

theorem jumpCount_le_quotient_sum {n m : ℕ} (p : Fin (m+1)→ℕ) :
    jumpCount n p≤∑ i,stepQuotient n p i := by
  rw [jumpCount,Finset.card_filter]
  apply Finset.sum_le_sum
  intro i _
  split_ifs <;> omega

theorem saturation_steps_one_or_next_period {n m : ℕ} (p : Fin (m+1)→ℕ)
    (hm : ∀ i,runStep p i % n=1)
    (he : jumpCount n p=∑ i,stepQuotient n p i) :
    ∀ i,runStep p i=1 ∨ runStep p i=1+n := by
  intro i
  have hp : ∀ j : Fin m,(if 0<stepQuotient n p j then (1:ℕ) else 0)≤stepQuotient n p j :=
    fun j => by split_ifs <;> omega
  let f (j : Fin m) := if 0<stepQuotient n p j then (1:ℕ) else 0
  have hQ : stepQuotient n p i≤1 := by
    by_contra! hn
    have hL : f i<stepQuotient n p i := by
      dsimp [f]
      split_ifs <;> omega
    have hs : (∑ j,f j)<∑ j,stepQuotient n p j :=
      Finset.sum_lt_sum (fun j _ => hp j) ⟨i,Finset.mem_univ _,hL⟩
    rw [jumpCount,Finset.card_filter] at he
    exact (ne_of_lt hs) he
  have hMod := Nat.mod_add_div (runStep p i) n
  rw [hm i] at hMod
  change 1+n*stepQuotient n p i=runStep p i at hMod
  have hz : stepQuotient n p i=0 ∨ stepQuotient n p i=1 := by omega
  rcases hz with h|h
  · exact Or.inl (by simpa [h] using hMod.symm)
  · exact Or.inr (by simpa [h] using hMod.symm)

/-- Genus-independent arithmetic of a normal vertex's run slack:
under the exact ambient length, the first/last boundary slack is a
multiple of the color period and subtracts from the run capacity. -/
theorem run_slack_and_capacity {n m N M : ℕ} (hn : 0<n) (p : Fin (m+1)→ℕ)
    (hp : StrictMono p) (hEnd : p (Fin.last m)≤N)
    (hm : ∀ i,runStep p i % n=1) (hSize : N=m+n*M) :
    ∃ q : ℕ, p 0+(N-p (Fin.last m))=n*q ∧ jumpCount n p+1≤M+1-q := by
  let T := ∑ i,stepQuotient n p i
  have hSpan : p (Fin.last m)-p 0=m+n*T := position_span_eq_quotient_sum p hp hm
  have hProd : n*T≤n*M := by omega
  have hT : T≤M := Nat.le_of_mul_le_mul_left hProd hn
  refine ⟨M-T,?_,?_⟩
  · rw [Nat.mul_sub_left_distrib]
    have hP : p 0≤p (Fin.last m) := hp.monotone (Fin.zero_le _)
    omega
  · have hj : jumpCount n p≤T := jumpCount_le_quotient_sum p
    omega

theorem run_steps_of_saturated_capacity {n m N M q : ℕ} (hn : 0<n)
    (p : Fin (m+1)→ℕ) (hp : StrictMono p) (hEnd : p (Fin.last m)≤N)
    (hm : ∀ i,runStep p i % n=1) (hSize : N=m+n*M)
    (hSlack : p 0+(N-p (Fin.last m))=n*q)
    (hRun : jumpCount n p+1=M+1-q) :
    ∀ i,runStep p i=1 ∨ runStep p i=1+n := by
  let T := ∑ i,stepQuotient n p i
  have hp0 : p 0≤p (Fin.last m) := hp.monotone (Fin.zero_le _)
  have hSpan : p (Fin.last m)-p 0=m+n*T := position_span_eq_quotient_sum p hp hm
  have hmT : n*T≤n*M := by omega
  have hT : T≤M := Nat.le_of_mul_le_mul_left hmT hn
  have he : n*q=n*(M-T) := by
    rw [Nat.mul_sub_left_distrib]
    omega
  have hq : q=M-T := le_antisymm (Nat.le_of_mul_le_mul_left he.le hn)
    (Nat.le_of_mul_le_mul_left he.ge hn)
  apply saturation_steps_one_or_next_period p hm
  change jumpCount n p=T
  omega

end CircularCompleteMinusEdge
