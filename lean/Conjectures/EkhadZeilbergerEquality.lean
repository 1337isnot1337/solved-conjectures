import Conjectures.EkhadZeilbergerWords

namespace EkhadZeilberger

noncomputable section
variable {α : Type*}

private theorem mismatch_blocks_suffix {n : ℕ}
    (A B : Fin (n+2) → α) (hB : ConstantWord B) (i : Fin (n+2)) (hi : A i ≠ B i) :
    ∀ d, 0 < d → d ≤ i.val → ¬ WordOverlap A B d := by
  intro d _ hd hov
  have he := Nat.sub_add_cancel hd
  have hIndex : i.val-d+d < n+2 := by rw [he]; exact i.isLt
  have hh := hov (i.val-d) hIndex
  have hfin : (⟨i.val-d+d,hIndex⟩ : Fin (n+2)) = i := Fin.ext he
  rw [hfin] at hh
  exact hi (hh.trans (hB _ _))

private theorem mismatch_blocks_prefix {n : ℕ}
    (A B : Fin (n+2) → α) (hB : ConstantWord B) (i : Fin (n+2)) (hi : A i ≠ B i) :
    ∀ d, 0 < d → d ≤ n+1-i.val → ¬ WordOverlap B A d := by
  intro d _ hd hov
  have hIndex : i.val+d < n+2 := by have := i.isLt; omega
  have hh := hov i.val hIndex
  exact hi (hh.symm.trans (hB _ _))

private theorem positive_mass {t : ℝ} (ht : 0<t) {a : ℕ} (ha : 0<a) :
    0 < overlapMass t a := by
  cases a with
  | zero => omega
  | succ a => exact ht.trans_le (overlapMass_first_le t ht.le a)

/-- An interior mismatching letter forces a strict cross-overlap loss. -/
theorem constant_cross_weight_lt_of_interior_mismatch {n : ℕ} {t : ℝ}
    (A B : Fin (n+2) → α) (ht : 0<t) (ht1 : t<1) (hB : ConstantWord B)
    (i : Fin (n+2)) (h0 : 0 < i.val) (h1 : i.val < n+1) (hi : A i ≠ B i) :
    overlapWeight t A B (n+1)+overlapWeight t B A (n+1) < overlapMass t (n+1) := by
  let a := i.val
  let b := n+1-i.val
  have hab : a+b = n+1 := by omega
  have hba : b+a = n+1 := by omega
  have hb : 0<b := by omega
  have hAB := overlapWeight_le_shifted_mass t ht.le A B a b
    (mismatch_blocks_suffix A B hB i hi)
  have hBA := overlapWeight_le_shifted_mass t ht.le B A b a
    (mismatch_blocks_prefix A B hB i hi)
  rw [hab] at hAB
  rw [hba] at hBA
  have hpow : t^b < 1 := pow_lt_one₀ ht.le ht1 (by omega)
  have hloss : t^b * overlapMass t a < overlapMass t a := by
    simpa only [one_mul] using mul_lt_mul_of_pos_right hpow (positive_mass ht h0)
  have hmass := overlapMass_add t a b
  rw [hab] at hmass
  linarith

/-- If the two terminal positions both mismatch a constant word, neither
orientation can have any nonempty suffix-prefix match. -/
theorem constant_cross_weight_zero_of_two_ends {n : ℕ} {t : ℝ}
    (A B : Fin (n+2) → α) (hB : ConstantWord B)
    (hfirst : A 0 ≠ B 0) (hlast : A (Fin.last (n+1)) ≠ B (Fin.last (n+1))) :
    overlapWeight t A B (n+1)+overlapWeight t B A (n+1) = 0 := by
  have hAB := overlapWeight_zero_of_missing t A B (n+1)
    (mismatch_blocks_suffix A B hB (Fin.last (n+1)) hlast)
  have hBA := overlapWeight_zero_of_missing t B A (n+1)
    (mismatch_blocks_prefix A B hB 0 hfirst)
  rw [hAB,hBA,add_zero]

theorem constant_cross_weight_eq_single_end {n : ℕ} {t : ℝ}
    (A B : Fin (n+2) → α) (ht : 0<t) (ht1 : t<1) (hB : ConstantWord B) (hd : A ≠ B)
    (h : overlapWeight t A B (n+1)+overlapWeight t B A (n+1) = overlapMass t (n+1)) :
    ∃ e : Fin (n+2), (e=0 ∨ e=Fin.last (n+1)) ∧ A e ≠ B e ∧ ∀ i, i ≠ e → A i = B i := by
  classical
  have he : ∃ e,A e ≠ B e := by
    by_contra! hh
    exact hd (funext hh)
  have endpoint (i : Fin (n+2)) (hi : A i ≠ B i) :
      i=0 ∨ i=Fin.last (n+1) := by
    by_contra! hn
    have h0 : 0 < i.val := by
      have hh : i.val ≠ 0 := fun hv => hn.1 (Fin.ext hv)
      omega
    have h1 : i.val < n+1 := by
      have hh : i.val ≠ n+1 := fun hv => hn.2 (Fin.ext hv)
      have hv := i.isLt
      omega
    exact (ne_of_lt (constant_cross_weight_lt_of_interior_mismatch A B ht ht1 hB i h0 h1 hi)) h
  have hM : 0 < overlapMass t (n+1) := positive_mass ht (by omega)
  obtain ⟨e,he⟩ := he
  refine ⟨e,endpoint e he,he,fun i hi => ?_⟩
  by_contra hd'
  have htwin : overlapWeight t A B (n+1)+overlapWeight t B A (n+1) = 0 := by
    rcases endpoint e he with he' | he'
    · rcases endpoint i hd' with hi' | hi'
      · exact False.elim (hi (hi'.trans he'.symm))
      · exact constant_cross_weight_zero_of_two_ends A B hB (he' ▸ he) (hi' ▸ hd')
    · rcases endpoint i hd' with hi' | hi'
      · exact constant_cross_weight_zero_of_two_ends A B hB (hi' ▸ hd') (he' ▸ he)
      · exact False.elim (hi (hi'.trans he'.symm))
  linarith

theorem constant_word_maximizer_single_end {n : ℕ} {t : ℝ}
    (A B : Fin (n+2) → α) (ht : 0<t) (ht1 : t<1) (hB : ConstantWord B) (hd : A ≠ B)
    (he : (overlapWeight t B B (n+1)-overlapWeight t A A (n+1)) /
       Real.sqrt (wordVariance t A B) = overlapMass t (n+1)) :
    ∃ e : Fin (n+2), (e=0 ∨ e=Fin.last (n+1)) ∧ A e ≠ B e ∧ ∀ i, i ≠ e → A i = B i := by
  have hself := constant_self_weight t B (n+1) hB
  rw [hself] at he
  have hconditions := (constant_loser_advantage (positive_mass ht (by omega : 0<n+1))
    (overlapWeight_nonneg t ht.le A A (n+1))
    (overlapWeight_le_mass t ht.le A A (n+1))
    (constant_cross_weight_le t ht.le ht1.le n A B hB hd)
    (show wordVariance t A B = _ by unfold wordVariance; rw [hself])).2.mp he
  exact constant_cross_weight_eq_single_end A B ht ht1 hB hd hconditions.2

/-- Reversal of the proposed extremizer. -/
def firstException (n : ℕ) (a b : α) : Fin (n+2) → α :=
  fun i => if i.val=0 then b else a

theorem firstException_attains (t : ℝ) (n : ℕ) (a b : α) (hab : a ≠ b) :
    (overlapWeight t (fun _ : Fin (n+2) => a) (fun _ => a) (n+1) -
      overlapWeight t (firstException n a b) (firstException n a b) (n+1)) /
      Real.sqrt (wordVariance t (firstException n a b) (fun _ => a)) =
        overlapMass t (n+1) := by
  let A := firstException n a b
  let B : Fin (n+2) → α := fun _ => a
  have hBB : overlapWeight t B B (n+1) = overlapMass t (n+1) :=
    constant_self_weight t B (n+1) (fun _ _ => rfl)
  have hAA : overlapWeight t A A (n+1) = 0 := by
    apply overlapWeight_zero_of_missing
    intro d hd hd' h
    have hh := h 0 (by omega)
    exact hab (by simpa [A,firstException,ne_of_gt hd] using hh)
  have hAB : overlapWeight t A B (n+1) = overlapMass t (n+1) := by
    apply overlapWeight_of_all
    intro d hd _ i hi
    have hpos : i+d ≠ 0 := by omega
    change (if i+d=0 then b else a) = a
    simp only [hpos,ite_false]
  have hBA : overlapWeight t B A (n+1) = 0 := by
    apply overlapWeight_zero_of_missing
    intro d _ hd h
    have hh := h 0 (by omega)
    exact hab (by simpa [A,B,firstException] using hh)
  have hv : wordVariance t A B = 1 := by
    unfold wordVariance
    rw [hBB,hAA,hAB,hBA]
    ring
  change (overlapWeight t B B (n+1)-overlapWeight t A A (n+1)) /
    Real.sqrt (wordVariance t A B) = overlapMass t (n+1)
  rw [hBB,hAA,hv,sub_zero,Real.sqrt_one,div_one]

/-- Exact constant-loser extremizers, up to the choice of the exceptional endpoint. -/
theorem constant_word_maximizer_iff {n : ℕ} {t : ℝ}
    (A B : Fin (n+2) → α) (ht : 0<t) (ht1 : t<1) (hB : ConstantWord B) (hd : A ≠ B) :
    ((overlapWeight t B B (n+1)-overlapWeight t A A (n+1)) /
       Real.sqrt (wordVariance t A B) = overlapMass t (n+1)) ↔
    ∃ a b : α, a ≠ b ∧ B = (fun _ => a) ∧
      (A = firstException n a b ∨ A = lastException n a b) := by
  constructor
  · intro hh
    obtain ⟨e,hend,hneq,he⟩ := constant_word_maximizer_single_end A B ht ht1 hB hd hh
    refine ⟨B e,A e,Ne.symm hneq,funext (fun i => hB i e),?_⟩
    rcases hend with hzero | hlast
    · left
      funext i
      by_cases hi : i=e
      · subst i
        simp [firstException,show e.val=0 from congrArg Fin.val hzero]
      · have hval : i.val ≠ 0 := fun h => hi ((Fin.ext h).trans hzero.symm)
        simpa [firstException,hval] using (he i hi).trans (hB i e)
    · right
      funext i
      by_cases hi : i=e
      · subst i
        simp [lastException,show e.val=n+1 from congrArg Fin.val hlast]
      · have hval : i.val ≠ n+1 := fun h => hi ((Fin.ext h).trans hlast.symm)
        simpa [lastException,hval] using (he i hi).trans (hB i e)
  · rintro ⟨a,b,hab,rfl,hA⟩
    rcases hA with rfl | rfl
    · exact firstException_attains t n a b hab
    · exact lastException_attains t n a b hab

end
end EkhadZeilberger
