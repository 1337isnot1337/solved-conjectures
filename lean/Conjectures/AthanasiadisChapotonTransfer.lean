import Conjectures.AthanasiadisChapotonChain

/-! Reversal preserves the chain weights and the class deficits of each vector. -/

namespace AthanasiadisChapotonPolar

open Finset

section Transfer

variable {E P R : Type*} [Fintype E] [PartialOrder P]
variable [AddCommGroup R] [LinearOrder R]
variable (owner : E → P)

noncomputable def upperCoordinates (c : P) : Finset E := by
  classical
  exact univ.filter fun i => c ≤ owner i

@[simp] theorem mem_upperCoordinates {i : E} {c : P} :
    i ∈ upperCoordinates owner c ↔ c ≤ owner i := by
  classical
  simp [upperCoordinates]

/-- The least nonnegative, order-reversing class majorant of a vector. -/
noncomputable def majorant (z : E → R) (c : P) : R :=
  maxZero (upperCoordinates owner c) z

theorem majorant_nonneg (z : E → R) (c : P) : 0 ≤ majorant owner z c := zero_le_maxZero _ _

theorem majorant_antitone (z : E → R) : Antitone (majorant owner z) := by
  intro c d h
  exact maxZero_mono_set (fun i hi => (mem_upperCoordinates owner).mpr
    (h.trans ((mem_upperCoordinates owner).mp hi))) z

theorem le_majorant (z : E → R) (i : E) : z i ≤ majorant owner z (owner i) :=
  le_maxZero _ ((mem_upperCoordinates owner).mpr le_rfl)

theorem majorant_le_of {z : E → R} {a : P → R} (ha : Antitone a) (ha₀ : ∀ c, 0 ≤ a c)
    (hz : ∀ i, z i ≤ a (owner i)) (c : P) : majorant owner z c ≤ a c :=
  maxZero_le_iff.mpr ⟨ha₀ c, fun i hi => (hz i).trans (ha ((mem_upperCoordinates owner).mp hi))⟩

variable [Fintype P] [IsOrderedAddMonoid R]

noncomputable def gauge (z : E → R) : R :=
  maxZero univ (majorant owner z) + ∑ i, (majorant owner z (owner i) - z i)

/-- Weights and deficits in the transfer. A positive weight requires one zero
deficit in its class. -/
@[ext]
structure TransferData where
  weights : P → R
  deficits : E → R
  weights_nonneg : ∀ c, 0 ≤ weights c
  deficits_nonneg : ∀ i, 0 ≤ deficits i
  zero_in_class : ∀ c, 0 < weights c → ∃ i, owner i = c ∧ deficits i = 0

noncomputable def encode (z : E → R) : TransferData (R := R) owner := by
  let a := majorant owner z
  let b := fun c => a c - maxZero (strictlyAbove c) a
  refine ⟨b, fun i => a (owner i) - z i, ?_, fun i => sub_nonneg.mpr (le_majorant owner z i), ?_⟩
  · intro c
    exact sub_nonneg.mpr (maxZero_le_iff.mpr ⟨majorant_nonneg owner z c,
      fun d hd => majorant_antitone owner z (mem_strictlyAbove.mp hd).le⟩)
  · intro c hc
    have hgap : maxZero (strictlyAbove c) a < a c := sub_pos.mp hc
    have ha₀ : 0 < a c := (zero_le_maxZero _ _).trans_lt hgap
    obtain hz | ⟨i, hi, he⟩ := maxZero_eq_zero_or_attained (upperCoordinates owner c) z
    · exact (ha₀.ne' hz).elim
    · have hci := (mem_upperCoordinates owner).mp hi
      have hite : owner i = c := by
        by_contra hn
        have ht : c < owner i := lt_of_le_of_ne hci (Ne.symm hn)
        have hle : a (owner i) ≤ maxZero (strictlyAbove c) a := le_maxZero a (mem_strictlyAbove.mpr ht)
        exact (not_lt_of_ge ((he ▸ le_majorant owner z i).trans hle)) hgap
      exact ⟨i, hite, sub_eq_zero.mpr (by rw [hite]; exact he.symm)⟩

noncomputable def decode (D : TransferData (R := R) owner) (i : E) : R :=
  height D.weights (owner i) - D.deficits i

theorem majorant_decode (D : TransferData (R := R) owner) :
    majorant owner (decode owner D) = height D.weights := by
  let a := height D.weights
  let z := decode owner D
  have hupper (c : P) : majorant owner z c ≤ a c :=
    majorant_le_of owner (height_antitone _) (height_nonneg _)
      (fun i => sub_le_self _ (D.deficits_nonneg i)) c
  funext c
  apply le_antisymm (hupper c)
  induction c using WellFoundedGT.induction with
  | ind c ih =>
    by_cases hpos : 0 < D.weights c
    · obtain ⟨i, hi, hz⟩ := D.zero_in_class c hpos
      exact (le_maxZero z ((mem_upperCoordinates owner).mpr (show c ≤ owner i by rw [hi]))).trans_eq'
        (by simp [z, decode, hi, hz, a])
    · have hb : D.weights c = 0 := le_antisymm (le_of_not_gt hpos) (D.weights_nonneg c)
      have ha : a c = maxZero (strictlyAbove c) a := by
        dsimp only [a]
        rw [height_rec _ D.weights_nonneg, hb, zero_add]
      rw [ha]
      exact maxZero_le_iff.mpr ⟨majorant_nonneg owner z c, fun d hd =>
        (ih d (mem_strictlyAbove.mp hd)).trans
          (majorant_antitone owner z (mem_strictlyAbove.mp hd).le)⟩

theorem decode_encode (z : E → R) : decode owner (encode owner z) = z := by
  have h : height (encode owner z).weights = majorant owner z :=
    height_of_gaps (majorant_antitone owner z) (majorant_nonneg owner z)
  funext i
  unfold decode
  rw [h]
  change majorant owner z (owner i) - (majorant owner z (owner i) - z i) = z i
  abel

theorem encode_decode (D : TransferData (R := R) owner) : encode owner (decode owner D) = D := by
  ext c
  · change majorant owner (decode owner D) c -
      maxZero (strictlyAbove c) (majorant owner (decode owner D)) = _
    rw [majorant_decode, height_rec _ D.weights_nonneg]
    exact add_sub_cancel_right _ _
  · change majorant owner (decode owner D) (owner c) - decode owner D c = _
    rw [majorant_decode, decode]
    abel

noncomputable def encoding : (E → R) ≃ TransferData (R := R) owner :=
  ⟨encode owner, decode owner, decode_encode owner, encode_decode owner⟩

theorem gauge_decode (D : TransferData (R := R) owner) :
    gauge owner (decode owner D) = chainMax univ D.weights + ∑ i, D.deficits i := by
  unfold gauge
  rw [majorant_decode, maxHeight_eq_chainMax]
  congr 1
  apply sum_congr rfl
  intro i _
  unfold decode
  abel

/-- The transfer to the opposite order keeps both the weights and deficits. -/
noncomputable def reversal : (E → R) ≃ (E → R) :=
  (encoding owner).trans (encoding (fun i => OrderDual.toDual (owner i))).symm

theorem gauge_reversal (z : E → R) :
    gauge (fun i => OrderDual.toDual (owner i)) (reversal owner z) = gauge owner z := by
  have h₁ := gauge_decode (fun i => OrderDual.toDual (owner i))
    (show TransferData (R := R) (fun i => OrderDual.toDual (owner i)) from encode owner z)
  have h₂ := gauge_decode owner (encode owner z)
  change gauge (fun i => OrderDual.toDual (owner i))
    (decode (fun i => OrderDual.toDual (owner i)) (encode owner z)) = _
  rw [h₁]
  calc
    _ = chainMax univ (encode owner z).weights + ∑ i, (encode owner z).deficits i :=
      congrArg (· + ∑ i, (encode owner z).deficits i) (chainMax_dual (encode owner z).weights)
    _ = _ := by simpa only [decode_encode] using h₂.symm

end Transfer

end AthanasiadisChapotonPolar
