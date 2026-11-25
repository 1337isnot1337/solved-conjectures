module

public import Conjectures.McNamaraSteingrimssonDirectSum
public import Conjectures.McNamaraSteingrimssonNormalize

@[expose] public section
namespace McNamaraSteingrimsson

/-- Distinct permutations in one rank of the closed classical pattern
interval. This is a subtype of permutations, not a subtype of occurrences. -/
def IntervalRank {m n : ℕ} (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n)) (r : ℕ) :=
  {x : Equiv.Perm (Fin (m+r)) // ClassicalPattern p x ∧ ClassicalPattern x q}

noncomputable def intervalRankCard {m n : ℕ} (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n))
    (r : ℕ) : ℕ :=
  Nat.card (IntervalRank p q r)

/-- Weak unimodality, with adjacent equalities permitted on either side of a mode. -/
def IsRankUnimodal (a : ℕ→ℕ) (d : ℕ) : Prop :=
  ∃ peak : ℕ, peak ≤ d ∧ (∀ i < peak, a i ≤ a (i+1)) ∧
    ∀ i : ℕ, peak ≤ i → i < d → a (i+1) ≤ a i

theorem rank_dip_not_unimodal {a : ℕ→ℕ} {r d : ℕ} (hr : r+2≤d)
    (hL : a (r+1)<a r) (hR : a (r+1)<a (r+2)) :
    ¬IsRankUnimodal a d := by
  rintro ⟨peak,hpeak,hinc,hdec⟩
  by_cases h : r<peak
  · exact (not_le_of_gt hL) (hinc r h)
  · exact (not_le_of_gt hR) (hdec (r+1) (by omega) (by omega))

def orderedSumPower {n : ℕ} (p : Equiv.Perm (Fin n)) :
    (t : ℕ) → Equiv.Perm (Fin (t*n))
  | 0 => Equiv.refl _
  | t+1 => (Nat.succ_mul t n).symm ▸ directSumPermutation (orderedSumPower p t) p

theorem source_rank_dip {m : ℕ} {p : Equiv.Perm (Fin m)}
    {q : Equiv.Perm (Fin (m+67))}
    (h44 : intervalRankCard p q 44=8598793292661)
    (h45 : intervalRankCard p q 45=8598464986146)
    (h46 : intervalRankCard p q 46=8599053474845) :
    ¬IsRankUnimodal (intervalRankCard p q) 67 := by
  apply rank_dip_not_unimodal (r := 44) (by decide)
  · rw [h44,h45]
    decide
  · rw [h45,h46]
    decide

end McNamaraSteingrimsson
