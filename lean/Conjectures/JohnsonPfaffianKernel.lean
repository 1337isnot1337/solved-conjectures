import Conjectures.JohnsonPfaffianAllMatching

/-!
# Johnson's conjecture

Section 5 of the existing proof: the finite mixed-difference factorization of
each positive nonincreasing log-convex distance kernel.  The interval factors
are indexed by the actual finite set of vertex intervals.
-/

namespace JohnsonPfaffian

open GilmoreCrossingNesting Set

noncomputable def CircularData.ofFamily {ι : Type*} [Fintype ι]
    (S : ι → ℕ → Bool) (t : ι → ℝ) (d : ℕ → ℝ) : CircularData where
  count := Fintype.card ι
  support q := S ((Fintype.equivFin ι).symm q)
  parameter q := t ((Fintype.equivFin ι).symm q)
  diagonal := d

theorem CircularData.ofFamily_weight {ι : Type*} [Fintype ι]
    (S : ι → ℕ → Bool) (t : ι → ℝ) (d : ℕ → ℝ) (i j : ℕ) :
    (CircularData.ofFamily S t d).weight i j =
      d i * d j * ∏ q, intervalFactor (t q) (S q i) (S q j) := by
  unfold ofFamily weight
  dsimp only
  rw [(Fintype.equivFin ι).symm.prod_comp (fun q => intervalFactor (t q) (S q i) (S q j))]

theorem CircularData.ofFamily_valid {ι : Type*} [Fintype ι]
    (n : ℕ) (S : ι → ℕ → Bool) (t : ι → ℝ) (d : ℕ → ℝ)
    (hS : ∀ q, CircularSupport n (S q)) (ht : ∀ q, 1 ≤ t q)
    (hd : ∀ i < n, 0 < d i) : (CircularData.ofFamily S t d).Valid n :=
  ⟨fun q => hS ((Fintype.equivFin ι).symm q),
    fun q => ht ((Fintype.equivFin ι).symm q), hd⟩

def intervalSupport (J : ℕ × ℕ) (i : ℕ) : Bool := decide (J.1 ≤ i ∧ i ≤ J.2)

theorem intervalSupport_linear (n : ℕ) (J : ℕ × ℕ) : LinearSupport n (intervalSupport J) := by
  intro a b c hab hbc _ ha hc
  simp only [intervalSupport, decide_eq_true_eq] at ha hc ⊢
  omega

noncomputable def kernelIntervalParameter (f : ℝ → ℝ) (nodes : ℕ → ℝ)
    (n : ℕ) (J : ℕ × ℕ) : ℝ :=
  if J.1 < J.2 then Real.exp (intervalCoefficient (sourceLogMatrix f nodes n) J.1 J.2) else 1

theorem kernelIntervalParameter_ge_one (f : ℝ → ℝ) (nodes : ℕ → ℝ) (n : ℕ)
    (hnodes : StrictMono nodes) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Ioi 0))
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x)))
    (J : ℕ × ℕ) (hJ : J ∈ intervalUniverse n) : 1 ≤ kernelIntervalParameter f nodes n J := by
  unfold kernelIntervalParameter
  split_ifs with h
  · exact Real.one_le_exp_iff.mpr (source_all_coefficients_nonnegative f nodes n J.1 J.2
      hnodes hf hanti hconv h ((mem_intervalUniverse n J).mp hJ).2)
  · exact le_rfl

theorem kernel_interval_factor (f : ℝ → ℝ) (nodes : ℕ → ℝ) (n : ℕ)
    (J : ℕ × ℕ) (i j : ℕ) (hij : i < j) :
    intervalFactor (kernelIntervalParameter f nodes n J) (intervalSupport J i) (intervalSupport J j) =
      if J.1 ≤ i ∧ j ≤ J.2 then
        Real.exp (intervalCoefficient (sourceLogMatrix f nodes n) J.1 J.2) else 1 := by
  have he : ((J.1 ≤ i ∧ i ≤ J.2) ∧ (J.1 ≤ j ∧ j ≤ J.2)) ↔
      (J.1 ≤ i ∧ j ≤ J.2) := by omega
  simp only [intervalFactor, intervalSupport, Bool.and_eq_true, decide_eq_true_eq, he]
  by_cases h : J.1 ≤ i ∧ j ≤ J.2
  · have ho : J.1 < J.2 := by omega
    simp [h, kernelIntervalParameter, ho]
  · simp [h]

theorem kernel_full_interval_product (f : ℝ → ℝ) (nodes : ℕ → ℝ) (n i j : ℕ)
    (hij : i < j) (_hj : j < n) :
    (∏ J ∈ intervalUniverse n,
      intervalFactor (kernelIntervalParameter f nodes n J) (intervalSupport J i) (intervalSupport J j)) =
      ∏ a ∈ Finset.range (i+1), ∏ k ∈ Finset.range (n-j),
        Real.exp (intervalCoefficient (sourceLogMatrix f nodes n) a (j+k)) := by
  classical
  let T := (Finset.range (i+1)).product (Finset.Ico j n)
  let F := fun J : ℕ × ℕ =>
    if J.1 ≤ i ∧ j ≤ J.2 then Real.exp (intervalCoefficient (sourceLogMatrix f nodes n) J.1 J.2)
    else 1
  have hT (J : ℕ × ℕ) : J ∈ T ↔ J.1 ≤ i ∧ j ≤ J.2 ∧ J.2 < n := by
    simp [T]
  have hsub : T ⊆ intervalUniverse n := by
    intro J hJ
    apply (mem_intervalUniverse n J).mpr
    have h := (hT J).mp hJ
    exact ⟨by omega, h.2.2⟩
  calc
    _ = ∏ J ∈ intervalUniverse n, F J := by
      apply Finset.prod_congr rfl
      intro J _
      exact kernel_interval_factor f nodes n J i j hij
    _ = ∏ J ∈ T, F J := by
      symm
      apply Finset.prod_subset hsub
      intro J hJ hn
      have hbound := ((mem_intervalUniverse n J).mp hJ).2
      have hnot : ¬(J.1 ≤ i ∧ j ≤ J.2) := by
        intro h
        exact hn ((hT J).mpr ⟨h.1, h.2, hbound⟩)
      simp [F, hnot]
    _ = ∏ J ∈ T, Real.exp (intervalCoefficient (sourceLogMatrix f nodes n) J.1 J.2) := by
      apply Finset.prod_congr rfl
      intro J hJ
      have h := (hT J).mp hJ
      simp [F, h.1, h.2.1]
    _ = _ := by
      dsimp only [T]
      rw [Finset.product_eq_sprod, Finset.prod_product (Finset.range (i+1)) (Finset.Ico j n)
        (fun J : ℕ × ℕ => Real.exp (intervalCoefficient (sourceLogMatrix f nodes n) J.1 J.2))]
      apply Finset.prod_congr rfl
      intro a _
      exact Finset.prod_Ico_eq_prod_range
        (fun b => Real.exp (intervalCoefficient (sourceLogMatrix f nodes n) a b)) j n

noncomputable def sourceKernelData (f : ℝ → ℝ) (nodes : ℕ → ℝ) (n : ℕ) : CircularData :=
  CircularData.ofFamily (ι := {J // J ∈ intervalUniverse n})
    (fun J => intervalSupport J.val) (fun J => kernelIntervalParameter f nodes n J.val)
    (fun _ => Real.sqrt (f (nodes (n-1)-nodes 0)))

theorem sourceKernelData_valid (f : ℝ → ℝ) (nodes : ℕ → ℝ) (n : ℕ)
    (hnodes : StrictMono nodes) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Ioi 0))
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x))) (hn : 2 ≤ n) :
    (sourceKernelData f nodes n).Valid n := by
  apply CircularData.ofFamily_valid
  · exact fun J => Or.inl (intervalSupport_linear n J.val)
  · exact fun J => kernelIntervalParameter_ge_one f nodes n hnodes hf hanti hconv J.val J.property
  · intro i _
    exact Real.sqrt_pos.mpr (hf _ (sub_pos.mpr (hnodes (by omega))))

theorem sourceKernelData_weight (f : ℝ → ℝ) (nodes : ℕ → ℝ) (n : ℕ)
    (hnodes : StrictMono nodes) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Ioi 0))
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x))) (hn : 2 ≤ n)
    (i j : ℕ) (hij : i < j) (hj : j < n) :
    (sourceKernelData f nodes n).weight i j = f (nodes j-nodes i) := by
  unfold sourceKernelData
  rw [CircularData.ofFamily_weight,
    Finset.prod_coe_sort (intervalUniverse n)
      (fun J => intervalFactor (kernelIntervalParameter f nodes n J) (intervalSupport J i) (intervalSupport J j))]
  have hD : 0 < f (nodes (n-1)-nodes 0) := hf _ (sub_pos.mpr (hnodes (by omega)))
  rw [Real.mul_self_sqrt hD.le, kernel_full_interval_product f nodes n i j hij hj]
  have h := (source_kernel_all_interval_factors f nodes n (i+1) j
    hnodes hf hanti hconv hn (by omega) (by omega) hj).1
  simpa only [Nat.add_sub_cancel] using h.symm

theorem edgeProduct_congr_on (u : ℕ) (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u)
    (w v : ℕ → ℕ → ℝ) (h : ∀ i j, i < j → j < 2*u → w i j = v i j) :
    edgeProduct w M = edgeProduct v M := by
  unfold edgeProduct
  congr 1
  apply List.map_congr_left
  intro e he
  have hv := valid_matching_edges u M hM e he
  exact h e.1 e.2 hv.1 hv.2

theorem kernel_matching_bound (u : ℕ) (f : ℝ → ℝ) (nodes : ℕ → ℝ)
    (hnodes : StrictMono nodes) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Ioi 0))
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x)))
    (M : List (ℕ × ℕ)) (hM : M ∈ matchingFinset u) :
    edgeProduct (fun i j => f (nodes j-nodes i)) M ≤
      matchingPfaffian u (fun i j => f (nodes j-nodes i)) := by
  by_cases hu : u = 0
  · subst u
    have hM0 : M = [] := by simpa [matchingFinset_zero] using hM
    simp [hM0, edgeProduct, matchingPfaffian_zero]
  have hn : 2 ≤ 2*u := by omega
  let D := sourceKernelData f nodes (2*u)
  have hD := sourceKernelData_valid f nodes (2*u) hnodes hf hanti hconv hn
  have hw := sourceKernelData_weight f nodes (2*u) hnodes hf hanti hconv hn
  have huncross : ∀ a b c d, a < b → b < c → c < d → d < 2*u →
      D.weight a c * D.weight b d ≤ D.weight a b * D.weight c d := by
    intro a b c d hab hbc hcd hd
    rw [hw a c (by omega) (by omega), hw b d (by omega) hd,
      hw a b hab (by omega), hw c d hcd hd]
    exact (kernel_uncrossing f hf hanti hconv (nodes a) (nodes b) (nodes c) (nodes d)
      (hnodes hab) (hnodes hbc) (hnodes hcd)).1
  have hb := D.matching_bound_of_uncrossing u hD huncross M hM
  rw [edgeProduct_congr_on u M hM D.weight (fun i j => f (nodes j-nodes i)) hw,
    matchingPfaffian_congr_on u D.weight (fun i j => f (nodes j-nodes i)) hw] at hb
  exact hb

end JohnsonPfaffian
