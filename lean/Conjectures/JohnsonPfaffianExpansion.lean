import Conjectures.JohnsonPfaffianPrefix
namespace JohnsonPfaffian
open GilmoreCrossingNesting

noncomputable def zeroPartner (u : ℕ) (M : List (ℕ × ℕ)) : ℕ :=
  if h : M ∈ matchingFinset (u+1) then Classical.choose (matching_has_zero_edge u M h) else 0

theorem zeroPartner_spec (u : ℕ) (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset (u+1)) :
    (0,zeroPartner u M) ∈ M ∧ 0<zeroPartner u M ∧ zeroPartner u M < 2*(u+1) := by
  classical
  have h := Classical.choose_spec (matching_has_zero_edge u M hM)
  have hval := valid_matching_edges (u+1) M hM _ h.1
  simp only [zeroPartner, dite_eq_left hM]
  exact ⟨h.1,h.2,hval.2⟩

noncomputable def residualTerm (u : ℕ) (w : ℕ → ℕ → ℝ) (M : List (ℕ × ℕ)) : ℝ :=
  (-1:ℝ)^(pairCount crossContribution M) * edgeProduct w (M.erase (0,zeroPartner u M))

noncomputable def borderPrefix (u q : ℕ) (w : ℕ → ℕ → ℝ) : ℝ :=
  ∑ M ∈ matchingFinset (u+1), (-1:ℝ)^(pairCount crossContribution M) * edgeProduct (borderWeight q w) M

theorem borderPrefix_eq_sum (u q : ℕ) (w : ℕ → ℕ → ℝ) :
    borderPrefix u q w = ∑ M ∈ matchingFinset (u+1),
      (if zeroPartner u M ≤ q then residualTerm u w M else 0) := by
  unfold borderPrefix
  apply Finset.sum_congr rfl
  intro M hM
  have hp := zeroPartner_spec u M hM
  rw [border_edgeProduct u q (zeroPartner u M) w M hM hp.1]
  unfold residualTerm
  split_ifs <;> ring

theorem borderPrefix_zero (u : ℕ) (w : ℕ → ℕ → ℝ) : borderPrefix u 0 w = 0 := by
  rw [borderPrefix_eq_sum]
  apply Finset.sum_eq_zero
  intro M hM
  have h := (zeroPartner_spec u M hM).2.1
  simp [show ¬zeroPartner u M ≤ 0 by omega]

theorem prefix_difference (u q : ℕ) (w : ℕ → ℕ → ℝ) :
    borderPrefix u (q+1) w - borderPrefix u q w =
      ∑ M ∈ matchingFinset (u+1), if zeroPartner u M = q+1 then residualTerm u w M else 0 := by
  rw [borderPrefix_eq_sum,borderPrefix_eq_sum, ← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro M hM
  split_ifs <;> simp_all
  all_goals omega
theorem matching_term_factor (u : ℕ) (w : ℕ → ℕ → ℝ) (M : List (ℕ × ℕ))
    (hM : M ∈ matchingFinset (u+1)) :
    (-1:ℝ)^(pairCount crossContribution M) * edgeProduct w M =
      w 0 (zeroPartner u M) * residualTerm u w M := by
  have he := (zeroPartner_spec u M hM).1
  have hp : edgeProduct w M = w 0 (zeroPartner u M) * edgeProduct w (M.erase (0,zeroPartner u M)) := by
    unfold edgeProduct
    rw [((List.perm_cons_erase he).map (fun e => w e.1 e.2)).prod_eq]
    simp
  rw [hp]
  unfold residualTerm
  ring

theorem matchingPfaffian_first_row (u : ℕ) (w : ℕ → ℕ → ℝ) :
    matchingPfaffian (u+1) w =
      ∑ j ∈ Finset.range (2*u+1), w 0 (j+1) * (borderPrefix u (j+1) w - borderPrefix u j w) := by
  unfold matchingPfaffian
  simp_rw [prefix_difference, Finset.mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro M hM
  rw [matching_term_factor u w M hM]
  have hp := zeroPartner_spec u M hM
  let p := zeroPartner u M
  have hp0 : 0<p := hp.2.1
  have hpmax : p<2*(u+1) := hp.2.2
  have hmem : p-1 ∈ Finset.range (2*u+1) := Finset.mem_range.mpr (by omega)
  rw [Finset.sum_eq_single (p-1)]
  · have hpval : p-1+1 = zeroPartner u M := by dsimp [p]; omega
    simp only [hpval, ite_true]
  · intro j hj hjne
    have hn : zeroPartner u M ≠ j+1 := by dsimp [p] at hjne; omega
    simp [hn]
  · intro hn
    exact False.elim (hn hmem)
theorem intervalWeight_nonnegative (I : Finset (ℕ × ℕ)) (g : ℕ × ℕ → ℝ)
    (hg : ∀ J ∈ I, 0≤g J) (a b : ℕ) : 0 ≤ intervalWeight I g a b := by
  unfold intervalWeight
  apply Finset.sum_nonneg
  intro J hJ
  split_ifs <;> simp_all

theorem intervalWeight_antitone_right (I : Finset (ℕ × ℕ)) (g : ℕ × ℕ → ℝ)
    (hg : ∀ J ∈ I, 0≤g J) (a b c : ℕ) (hab : a≤b) (hbc : b≤c) :
    intervalWeight I g a c ≤ intervalWeight I g a b := by
  unfold intervalWeight
  apply Finset.sum_le_sum
  intro J hJ
  have hgJ := hg J hJ
  split_ifs <;> simp_all
  all_goals omega

theorem interval_endpoint_prefix_bound (u : ℕ) (hu : 0<u) (g : ℕ × ℕ → ℝ)
    (hg : ∀ J, 0≤g J) (hg0 : ∀ J, J.1=0 → g J=0) :
    let w := intervalWeight (intervalUniverse (2*(u+1))) g
    w 0 (2*u+1) * (borderPrefix u (2*u+1) w - borderPrefix u (2*u) w) ≤ matchingPfaffian (u+1) w := by
  let w := intervalWeight (intervalUniverse (2*(u+1))) g
  let a : ℕ → ℝ := fun j => w 0 (j+1)
  let z : ℕ → ℝ := fun q => borderPrefix u q w
  have hz0 : z 0 = 0 := borderPrefix_zero u w
  have hapos : 0 ≤ a (2*u-1) := intervalWeight_nonnegative _ _ (by intro J hJ; exact hg J) _ _
  have hz : ∀ q ≤ (2*u-1)+1, 0 ≤ z q := by
    intro q hq
    have hq' : q < 2*(u+1) := by omega
    exact border_prefix_matching_nonnegative u q hq' g hg hg0
  have hmono : ∀ j < 2*u-1, a (j+1) ≤ a j := by
    intro j hj
    exact intervalWeight_antitone_right _ _ (by intro J hJ; exact hg J) _ _ _ (by omega) (by omega)
  have hpartial := nonnegative_prefix_expansion a z (2*u-1) hz0 hapos hz hmono
  have hN : 2*u-1+1 = 2*u := by omega
  rw [hN] at hpartial
  change w 0 (2*u+1) * (z (2*u+1)-z (2*u)) ≤ matchingPfaffian (u+1) w
  rw [matchingPfaffian_first_row, Finset.sum_range_succ]
  change w 0 (2*u+1) * (z (2*u+1)-z (2*u)) ≤
    (∑ j ∈ Finset.range (2*u), a j * (z (j+1)-z j)) + w 0 (2*u+1) * (z (2*u+1)-z (2*u))
  linarith
end JohnsonPfaffian
