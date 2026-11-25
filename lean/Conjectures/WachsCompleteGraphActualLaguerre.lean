module
public import Conjectures.WachsCompleteGraphActualEGF
public import Conjectures.WachsLagrangeInversion

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries WeightedCompletePartition

noncomputable def actualCharacteristicEGF (p : ℕ) (t : ℝ) : PowerSeries ℝ :=
  (PowerSeries.exp ℝ).subst (blockEGF (rankBlockWeight p t))

theorem actualCharacteristicEGF_coeff (p n : ℕ) (t : ℝ) :
    Polynomial.eval₂ (Int.castRingHom ℝ) t (characteristic (p+2) n) =
      (n.factorial:ℝ)*coeff n (actualCharacteristicEGF p t) := by
  have h (j : ℕ) : coeff j (PowerSeries.exp ℝ) = (fun _ : ℕ => (1:ℝ)) j/(j.factorial:ℝ) := by
    rw [coeff_exp,map_div₀,map_one,map_natCast]
  have hn : (n.factorial:ℝ) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero n
  rw [actualCharacteristicEGF,coeff_subst_blockEGF _ _ _ h,
    characteristic_by_block_sizes (p+1)]
  simp only [one_mul,rankBlockProduct,Polynomial.eval₂_finsetSum,Polynomial.eval₂_monomial,
    map_prod,Int.coe_castRingHom]
  field_simp
  apply Finset.sum_congr rfl
  intro π _
  rw [Finset.prod_coe_sort π.parts (fun b : Finset (Fin n) => (canonicalBlockTotal (p+2) b.card:ℝ))]

theorem forcingAt_constant_one (p : ℕ) (t : ℝ) : constantCoeff (forcingAt p t) = 1 := by
  simp [forcingAt,← coeff_zero_eq_constantCoeff_apply, coeff_rescale, coeff_map,forcingQuotient]

private theorem substExp_reverse_of_comp (F B : ℝ⟦X⟧)
    (hF : constantCoeff F = 0) (hB : constantCoeff B = 0) (h1 : coeff 1 F = 1)
    (hFB : PowerSeries.subst B F = (X : ℝ⟦X⟧)) :
    PowerSeries.subst F (PowerSeries.subst B (PowerSeries.exp ℝ)) = PowerSeries.exp ℝ := by
  have hsF : HasSubst F := HasSubst.of_constantCoeff_zero' hF
  have hsB : HasSubst B := HasSubst.of_constantCoeff_zero' hB
  have hunit : IsUnit (coeff 1 F) := by rw [h1]; exact isUnit_one
  have hc : PowerSeries.subst F B = (X : ℝ⟦X⟧) :=
    PowerSeries.subst_eq_X_of_subst_eq_X F hF hunit (Q:=B) hsB hFB
  calc
    _ = PowerSeries.subst (PowerSeries.subst F B) (PowerSeries.exp ℝ) :=
      subst_comp_subst_apply hsB hsF (PowerSeries.exp ℝ)
    _ = _ := by rw [hc,X_subst]

private theorem forcingCoeff_zero (p : ℕ) (t : ℝ) :
    constantCoeff (completeGraphForcing p t) = 0 := by
  unfold completeGraphForcing
  rw [map_mul,constantCoeff_X,zero_mul]

private theorem forcingCoeff_one (p : ℕ) (t : ℝ) :
    coeff 1 (completeGraphForcing p t) = 1 := by
  rw [completeGraphForcing_factorial_coeff]
  simp [rankForcingWeight]

theorem actualCharacteristicEGF_reverse_subst (p : ℕ) (t : ℝ) :
    PowerSeries.subst ((X : ℝ⟦X⟧) * forcingAt p t) (actualCharacteristicEGF p t) = PowerSeries.exp ℝ :=
  substExp_reverse_of_comp (completeGraphForcing p t) (blockEGF (rankBlockWeight p t))
    (forcingCoeff_zero p t) (constant_blockEGF _) (forcingCoeff_one p t)
    (actualRankEGF_comp_forcing p t)

/-- The Lagrange-normalized formula for the actual weighted bond-poset
polynomial, without assuming the previously separate bridge. -/
theorem weightedCompleteGraphLagrange : WeightedCompleteGraphLagrange := by
  intro p k t
  rw [actualCharacteristicEGF_coeff]
  have hU : constantCoeff (forcingAt p t) ≠ 0 := by rw [forcingAt_constant_one]; exact one_ne_zero
  have h := formal_lagrange_burmann (forcingAt p t) (actualCharacteristicEGF p t)
    (PowerSeries.exp ℝ) hU (actualCharacteristicEGF_reverse_subst p t) k
  rw [PowerSeries.derivative_exp] at h
  rw [Nat.factorial_succ,Nat.cast_mul,Nat.cast_add,Nat.cast_one]
  calc
    _ = (k.factorial:ℝ) * (((k:ℝ)+1)*coeff (k+1) (actualCharacteristicEGF p t)) := by ring
    _ = _ := by rw [h]

theorem weighted_complete_graph_laguerre_formula (p k : ℕ) (t : ℝ) :
    Polynomial.eval₂ (Int.castRingHom ℝ) t (characteristic (p+2) (k+1)) =
      (k.factorial:ℝ)*coeff k
        (expAt (1-((k+1:ℕ):ℝ)*t)*(laguerreAt p t)⁻¹^(k+1)) :=
  weighted_complete_graph_formula_of_lagrange weightedCompleteGraphLagrange p k t

theorem weighted_complete_graph_formal_moments (p k : ℕ) (t : ℝ)
    (rates : Fin p → ℝ) (hfac : HasLaguerreFactorization p rates) :
    Polynomial.eval₂ (Int.castRingHom ℝ) t (characteristic (p+2) (k+1)) =
      ∑ j ∈ Finset.range (k+1), (k.choose j:ℝ)*(-t)^j*formalGammaMoment p (k+1) j rates :=
  weighted_complete_graph_moments_of_source_inputs weightedCompleteGraphLagrange p k t rates hfac

end WachsCompleteGraph
