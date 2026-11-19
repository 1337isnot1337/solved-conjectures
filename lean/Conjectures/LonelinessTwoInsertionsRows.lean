import Conjectures.LonelinessTwoInsertionsInterval

/-! A finite row proves an unbounded second-speed statement. It stores one
good interval for the first speed and exact witnesses only below the
proved interval cutoff. -/

namespace Loneliness.TwoInsertions

structure BaseRow where
  interval : IntervalCertificate
  witnesses : List PairCertificate
  deriving DecidableEq, Repr

def BaseRow.Valid (p b : ℕ) (r : BaseRow) : Prop :=
  r.interval.Valid p b ∧ r.interval.cutoff ≤ b+r.witnesses.length ∧
    ∀ i : Fin r.witnesses.length, (r.witnesses.get i).Valid p b (b+i.val)

instance (p b : ℕ) (r : BaseRow) : Decidable (r.Valid p b) :=
  inferInstanceAs (Decidable (_ ∧ _ ∧ _))

theorem BaseRow.sound {p b c : ℕ} {r : BaseRow}
    (hp : 3 ≤ p) (h : r.Valid p b) (hbc : b ≤ c) : TwoSpeedWindow p b c := by
  by_cases hc : r.interval.cutoff ≤ c
  · exact IntervalCertificate.unbounded_second hp h.1 hc
  · have hi : c-b < r.witnesses.length := by
      have hlength := h.2.1
      omega
    let i : Fin r.witnesses.length := ⟨c-b, hi⟩
    have hgood := PairCertificate.sound (h.2.2 i)
    have he : b+i.val = c := by dsimp [i]; omega
    rwa [he] at hgood

def smallBound (p : ℕ) : ℕ := 2*p*(p+2)/(p-2)

theorem checked_rows_sound (p : ℕ) (rows : List BaseRow)
    (hp : 3 ≤ p) (hsize : rows.length = smallBound p)
    (hvalid : ∀ i : Fin rows.length, (rows.get i).Valid p (i.val+1))
    (b c : ℕ) (hb : 1 ≤ b) (hbound : b ≤ smallBound p) (hbc : b ≤ c) :
    TwoSpeedWindow p b c := by
  have hi : b-1 < rows.length := by omega
  let i : Fin rows.length := ⟨b-1, hi⟩
  have hindex : i.val+1 = b := by dsimp [i]; omega
  have hrow := hvalid i
  rw [hindex] at hrow
  exact BaseRow.sound hp hrow hbc

end Loneliness.TwoInsertions
