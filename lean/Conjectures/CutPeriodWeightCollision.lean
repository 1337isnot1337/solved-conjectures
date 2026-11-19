import Conjectures.CutPeriodWeightTables

/-! The finite weight screen rules out every move to the candidate value.
Its only surviving abstract profile consists entirely of rigid atoms; the
positive quotient required by its target shape rules that profile out too. -/
namespace CutPeriod.Weight

theorem profile_mem (ps : List Piece) (hlen : ps.length≤9)
    (hw : sumWeight ps≤15) :
    profileHas ps.length (sumWeight ps) (xorLow ps) (flexibleAny ps)=true := by
  induction ps with
  | nil => exact profile_start
  | cons a ps ih =>
    have hlen' : ps.length<9 := by
      simp only [List.length_cons] at hlen
      omega
    have hw' : sumWeight ps≤15 := by
      change weight a.1+sumWeight ps≤15 at hw
      omega
    have htail := ih (by omega) hw'
    have hstep := profile_step ps.length (sumWeight ps) (xorLow ps)
      (flexibleAny ps) a.1 hlen'
      (by simpa only [sumWeight_cons,Nat.add_comm] using hw)
      (xorLow_bound ps) htail
    simpa only [List.length_cons,sumWeight_cons,xorLow_cons,flexibleAny_cons,
      Nat.add_comm,Nat.xor_comm,Bool.or_comm] using hstep

theorem no_collision (p n : Nat) (hp : p=2 ∨ p=3 ∨ p=8 ∨ p=9)
    (hn : 0<n) : ¬Piles p n (value n) := by
  intro h
  obtain ⟨s,q,hq,hsize,hvalue⟩ := exists_shape n hn
  obtain ⟨ps,hlegal,hlen,hsum,hxor⟩ := piles_decomposition h
  have hl := low_bound s
  have hR := xorLow_bound ps
  have hX : xorHigh ps=q := by omega
  have hlow : xorLow ps=low s := by omega
  have hXQ := xorHigh_le ps
  have hW : sumWeight ps≤weight s := by omega
  have hmod : sumWeight ps%12=weight s%12 := by omega
  have hlen9 : ps.length≤9 := by omega
  have hmem := profile_mem ps hlen9 (hW.trans (weight_bounds s).2)
  rw [hlow] at hmem
  obtain ⟨hs,hfalse⟩ := profile_exclusion s ps.length (sumWeight ps)
    (flexibleAny ps) (by omega) hW hmod hmem
  have hqpos := positive_quotient s q hq hs
  have hzero := xorHigh_zero_of_rigid ps hlegal hfalse
  omega

end CutPeriod.Weight
