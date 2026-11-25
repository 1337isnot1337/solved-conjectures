module
public import Conjectures.NovelliThibonSourceFilling
public import Conjectures.NovelliThibonSignedGraph

@[expose] public section
namespace NovelliThibon

open Classical
variable {n : ℕ} {K : Type*} [Field K]

noncomputable def signedSourceModifiedGraphSum
    (E U : Finset (LabelEdge (n+1))) (q z : K)
    (t : LabelEdge (n+1) → K) (armValue : LabelEdge (n+1) → ℕ) : K :=
  (∑ S ∈ U.powerset,
    intermediateGraphScalar U S q t armValue * signedModifiedOmegaGraphLLT (E ∪ S) q z) /
      (q-1)^U.card / q^(∑ e ∈ U,armValue e)

theorem signedSourceModifiedGraphSum_normalized
    (E U : Finset (LabelEdge (n+1))) (hE : OrientedForward E) (hU : OrientedForward U)
    (hd : Disjoint E U) (q z : K) (hq : q≠0) (hq1 : q≠1)
    (t : LabelEdge (n+1) → K) (armValue : LabelEdge (n+1) → ℕ) :
    signedSourceModifiedGraphSum E U q z t armValue =
      ∑ σ : Equiv.Perm (Fin (n+1)),
        normalizedGraphWordWeight E U q t armValue σ * signedFundamentalAt (inverseDescentSet σ) z := by
  let F (σ : Equiv.Perm (Fin (n+1))) := signedFundamentalAt (inverseDescentSet σ) z
  have he (S : Finset (LabelEdge (n+1))) (hS : S∈U.powerset) :
      signedModifiedOmegaGraphLLT (E∪S) q z =
        ∑ σ : Equiv.Perm (Fin (n+1)),(q^graphDescents E σ*q^graphDescents S σ)*F σ := by
    have hs := Finset.mem_powerset.mp hS
    have hEy : OrientedForward (E∪S) := by
      intro e hh
      obtain h|h := Finset.mem_union.mp hh
      · exact hE e h
      · exact hU e (hs h)
    rw [signedModifiedOmegaGraphLLT_as_descents _ hEy q z hq]
    simp_rw [graphDescents_union E S (hd.mono_right hs),pow_add,F]
  have hl :
      (∑ S ∈ U.powerset,
        intermediateGraphScalar U S q t armValue * signedModifiedOmegaGraphLLT (E∪S) q z) =
      ∑ σ : Equiv.Perm (Fin (n+1)),
        (q^graphDescents E σ*intermediateContribution U q t armValue (edgeDescent σ))*F σ := by
    calc
      _ = ∑ S ∈ U.powerset,∑ σ : Equiv.Perm (Fin (n+1)),
          (q^graphDescents E σ*(intermediateGraphScalar U S q t armValue*q^graphDescents S σ))*F σ := by
        apply Finset.sum_congr rfl
        intro S hs
        rw [he S hs,Finset.mul_sum]
        apply Finset.sum_congr rfl
        intro s _
        ac_rfl
      _ = _ := by
        rw [Finset.sum_comm (s:=U.powerset)]
        apply Finset.sum_congr rfl
        intro σ _
        unfold intermediateContribution
        rw [Finset.mul_sum,Finset.sum_mul]
        simp_rw [intermediateGraphScalar_mul_descents]
        apply Finset.sum_congr rfl
        intro S _
        congr 1
        congr 1
        congr 1
        congr 1
        ext e
        simp only [Finset.mem_sdiff]
  rw [signedSourceModifiedGraphSum,hl]
  simp_rw [div_eq_mul_inv,Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro σ _
  have hnorm := source_optional_contribution U q hq hq1 t armValue (edgeDescent σ)
    (graphDescents E σ)
  have hh : normalizedGraphWordWeight E U q t armValue σ =
      q^((graphDescents E σ:ℤ)-((∑ e ∈ U,if edgeDescent σ e then armValue e else 0:ℕ):ℤ)) *
        (∏ e ∈ U,if edgeDescent σ e then t e else 1) := by
    simp only [normalizedGraphWordWeight,edgeDescent,decide_eq_true_eq]
  rw [hh,← hnorm]
  simp only [div_eq_mul_inv,F]
  ring

theorem signedSourceModifiedGraphSum_eq_marked_sum
    (E U : Finset (LabelEdge (n+1))) (hE : OrientedForward E) (hU : OrientedForward U)
    (hd : Disjoint E U) (q z : K) (hq : q≠0) (hq1 : q≠1)
    (t : LabelEdge (n+1) → K) (armValue : LabelEdge (n+1) → ℕ) :
    signedSourceModifiedGraphSum E U q z t armValue =
      ∑ S : Finset (Fin (n+1)), normalizedGraphWordWeight E U q t armValue (markedStandardize S)*(-z)^S.card := by
  rw [signedSourceModifiedGraphSum_normalized E U hE hU hd q z hq hq1 t armValue]
  simp_rw [signedFundamentalAt_as_fibre,Finset.mul_sum]
  have hw (σ : Equiv.Perm (Fin (n+1))) :
      (∑ S : Finset (Fin (n+1)) with markedStandardize S=σ,
        normalizedGraphWordWeight E U q t armValue σ*(-z)^S.card) =
      ∑ S : Finset (Fin (n+1)) with markedStandardize S=σ,
        normalizedGraphWordWeight E U q t armValue (markedStandardize S)*(-z)^S.card := by
    apply Finset.sum_congr rfl
    intro S hs
    rw [(Finset.mem_filter.mp hs).2]
  simp_rw [hw]
  rw [Finset.sum_fiberwise]

end NovelliThibon
