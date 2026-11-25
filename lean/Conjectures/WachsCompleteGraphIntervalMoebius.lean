module
public import Conjectures.WachsCompleteGraphMoebiusLaw

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

set_option maxHeartbeats 900000

/-- The literal recursive Möbius values are preserved under isomorphisms
of lower weighted intervals even if the ambient sizes differ. -/
theorem moebius_eq_of_lowerEquiv {r m n : ℕ}
    {X : WeightedCompletePartition r m} {Y : WeightedCompletePartition r n}
    (e : {P : WeightedCompletePartition r m // P ≤ X} ≃
         {P : WeightedCompletePartition r n // P ≤ Y})
    (he : ∀ P R, P.val ≤ R.val ↔ (e P).val ≤ (e R).val) :
    ∀ P : {P : WeightedCompletePartition r m // P ≤ X}, P.val.moebius = (e P).val.moebius := by
  classical
  let f (P : WeightedCompletePartition r m) : ℤ := if h : P ≤ X then (e ⟨P,h⟩).val.moebius else 0
  have hbot (P : {P : WeightedCompletePartition r m // P ≤ X}) : P.val = ⊥ ↔ (e P).val = ⊥ := by
    constructor
    · intro hp
      apply le_antisymm _ bot_le
      let b : {R : WeightedCompletePartition r n // R ≤ Y} := ⟨⊥,bot_le⟩
      have h : P.val ≤ (e.symm b).val := by rw [hp]; exact bot_le
      simpa only [Equiv.apply_symm_apply] using (he P (e.symm b)).mp h
    · intro hp
      apply le_antisymm _ bot_le
      apply (he P ⟨⊥,bot_le⟩).mpr
      rw [hp]
      exact bot_le
  have hc (P : WeightedCompletePartition r m) (hP : P ≤ X) :
      (∑ S ∈ P.lowerClosed,f S) = if P = ⊥ then 1 else 0 := by
    let R : {R : WeightedCompletePartition r m // R ≤ X} := ⟨P,hP⟩
    have hsum : (∑ S ∈ P.lowerClosed,f S) = ∑ T ∈ (e R).val.lowerClosed,T.moebius := by
      rw [Finset.sum_subtype (p:=fun S : WeightedCompletePartition r m => S ≤ P)
          _ (fun S => by simp [lowerClosed]),
        Finset.sum_subtype (p:=fun T : WeightedCompletePartition r n => T ≤ (e R).val)
          _ (fun T => by simp [lowerClosed])]
      let e' : {S : WeightedCompletePartition r m // S ≤ P} ≃ {T : WeightedCompletePartition r n // T ≤ (e R).val} :=
        { toFun := fun S =>
            ⟨(e ⟨S.val,S.property.trans hP⟩).val,(he ⟨S.val,S.property.trans hP⟩ R).mp S.property⟩
          invFun := fun T =>
            let V := e.symm ⟨T.val,T.property.trans (e R).property⟩
            ⟨V.val,(he V R).mpr (by simpa [V] using T.property)⟩
          left_inv := fun S => Subtype.ext (by simp)
          right_inv := fun T => Subtype.ext (by simp) }
      apply Fintype.sum_equiv e'
      intro S
      exact dite_eq_left (S.property.trans hP)
    rw [hsum,moebius_cumulative]
    by_cases p : P = ⊥
    · rw [ite_eq_left p,ite_eq_left ((hbot R).mp p)]
    · rw [ite_eq_right p,ite_eq_right (fun h => p ((hbot R).mpr h))]
  have hu (P : WeightedCompletePartition r m) : P ≤ X → f P = P.moebius := by
    induction P using (complete_order_wellFounded r m).induction with
    | h P ih =>
      intro hP
      have h₁ := hc P hP
      have h₂ := moebius_cumulative P
      rw [lowerClosed_insert,Finset.sum_insert (by simp [mem_lowerStrict])] at h₁ h₂
      have hs : (∑ S ∈ P.lowerStrict,f S) = ∑ S ∈ P.lowerStrict,S.moebius :=
        Finset.sum_congr rfl (fun S hS =>
          ih S (mem_lowerStrict.mp hS) ((mem_lowerStrict.mp hS).le.trans hP))
      rw [hs] at h₁
      exact add_right_cancel (h₁.trans h₂.symm)
  intro P
  have h := hu P.val P.property
  change (if h : P.val ≤ X then (e ⟨P.val,h⟩).val.moebius else 0) = P.val.moebius at h
  rw [dite_eq_left P.property] at h
  exact h.symm

end WeightedCompletePartition
end WachsCompleteGraph
