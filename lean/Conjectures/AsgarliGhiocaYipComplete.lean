import Conjectures.AsgarliGhiocaYipBlockingPencil
import Conjectures.AsgarliGhiocaYipIntersectionFamily
import Conjectures.AsgarliGhiocaYipPlaneBudget
import Conjectures.AsgarliGhiocaYipTwistFibers
import Conjectures.AsgarliGhiocaYipTwistMass
import Conjectures.AsgarliGhiocaYipTwistUpper
import Conjectures.AsgarliGhiocaYipTwistedModel

/-! # The blocking-pencil point estimate by twist averaging -/

namespace Conjectures.AsgarliGhiocaYip

open Finset Polynomial
open scoped Classical

variable {K : Type*} [Field K] [Fintype K]

set_option maxHeartbeats 1200000 in
/-- The ordering estimate follows from the polynomial Stepanov upper bound
and exact averaging over all twists of the ordering cover. -/
theorem regularOrderingEstimate {d : ℕ} (hd : 2 ≤ d) : RegularOrderingEstimate K d := by
  classical
  intro k g c hk hlarge hc hg u _ a
  let p := seed c u d - C a
  change p.Separable → (∀ y : K, p.eval y ≠ 0) → _
  intro hsep _
  let E := AlgebraicClosure K
  let base := algebraMap K E
  let G := LabelPermutations k d
  let A (i : Fin k) := monicIntersectionFamily (g i) d c u a
  have hA (i j) : ((A i).coeff j).natDegree ≤ d - j :=
    natDegree_coeff_monicIntersectionFamily_le (g i) d c u a j
  have hAm (i) : (A i).Monic ∧ (A i).natDegree = d :=
    monic_monicIntersectionFamily (g i) hd hc (hg i).1 (hg i).2 u a
  have hcard : Fintype.card (p.rootSet E) = d := by
    rw [card_rootSet_eq_natDegree (K := E) hsep (IsAlgClosed.splits _)]
    exact (natDegree_sub_C ..).trans (seed_degree hc u hd)
  let e : Fin d ≃ p.rootSet E := (Fintype.equivFinOfCardEq hcard).symm
  let r (j : Fin d) : E := (e j).val
  let τ : G := fun _ ↦ labelFrobenius e
  have hr : Function.Injective r := fun _ _ he ↦ e.injective (Subtype.ext he)
  obtain ⟨w, hw⟩ := exists_ground_separator hd hk hlarge hr
  let P := groundResolvent A w
  let P' := planeMap base P
  let R (h : G) := planeMap base (groundTwist A w h)
  let w' (i : Fin k) (j : Fin d) := base (w i j)
  choose v hv hv' using fun (t : K) (i : Fin k) ↦
    exists_intersection_enumeration (g i) hd hc (hg i).1 (hg i).2 u a t
  let x (t : K) := linearOrderingValue w' (v t)
  have hP : P.Monic := groundResolvent_monic A w
  have hP' : P'.Monic := hP.map _
  let f (t : K) := (evalRingHom (base t)).comp (mapRingHom base)
  have hf (t : K) : f t = base.comp (evalRingHom t) := RingHom.ext fun y ↦ by
    change (y.map base).eval (base t) = base (y.eval t)
    exact eval_map_apply ..
  have hfc (t : K) (y : K) : f t (C y) = base y := by rw [hf]; simp
  have hfac (t : K) (i : Fin k) : (A i).map (f t) = ∏ j, (X - C (v t i j)) := by
    rw [hf, ← Polynomial.map_map]
    exact hv' t i
  have hspec (t : K) : specialize (base t) P' = ∏ j : G, (X - C (x t j)) := by
    change (P.map (mapRingHom base)).map (evalRingHom (base t)) = _
    rw [Polynomial.map_map]
    change P.map (f t) = _
    simpa only [hfc] using groundResolvent_map A w (f t) (v t) (hfac t)
  have hinterp (t : K) (j h : G) : planeEval (base t) (x t j) (R h) =
      planeEval (base t) (x t j) P'.derivative * x t (j * h) := by
    change (((groundTwist A w h).map (mapRingHom base)).map (evalRingHom (base t))).eval (x t j) =
      ((planeMap base P).derivative.map (evalRingHom (base t))).eval (x t j) * _
    rw [Polynomial.map_map, derivative_planeMap]
    change ((groundTwist A w h).map (f t)).eval _ =
      ((P.derivative.map (mapRingHom base)).map (evalRingHom (base t))).eval _ * _
    rw [Polynomial.map_map]
    change ((groundTwist A w h).map (f t)).eval _ = (P.derivative.map (f t)).eval _ * _
    simpa only [hfc] using eval_groundTwist A w (f t) (v t) (hfac t) j h
  -- The ordering at the seed is the one that labels each root by itself.
  have hrange₀ (i : Fin k) : Set.range (v 0 i) = p.rootSet E := by
    rw [hv, intersection_at_zero _ (hg i).1, (hg i).2]
  let b₀ (i : Fin k) (j : Fin d) : p.rootSet E := ⟨v 0 i j, by
    rw [← hrange₀ i]; exact Set.mem_range_self j⟩
  have hsurj (i) : Function.Surjective (e.symm ∘ b₀ i) := by
    intro j
    have hmem : (e j).val ∈ Set.range (v 0 i) := by rw [hrange₀]; exact (e j).property
    obtain ⟨y, hy⟩ := hmem
    exact ⟨y, (congrArg e.symm (show b₀ i y = e j from Subtype.ext hy)).trans (e.symm_apply_apply j)⟩
  let β (i : Fin k) : Equiv.Perm (Fin d) :=
    Equiv.ofBijective (e.symm ∘ b₀ i) ⟨Finite.injective_iff_surjective.mpr (hsurj i), hsurj i⟩
  let γ (i : Fin k) : Equiv.Perm (Fin d) := (β i).symm
  have hγ (i j) : v 0 i (γ i j) = r j := by
    have he : e.symm (b₀ i (γ i j)) = j := (β i).apply_symm_apply j
    exact congrArg Subtype.val (by simpa only [Equiv.apply_symm_apply] using congrArg e he)
  have hxγ (j : G) : x 0 (γ * j) = linearOrderingValue w' (fun _ ↦ r) j := by
    unfold x linearOrderingValue
    apply sum_congr rfl
    intro i _; apply sum_congr rfl; intro l _
    change w' i l * v 0 i (γ i (j i l)) = w' i l * r (j i l)
    rw [hγ]
  have hxInj : Function.Injective (x 0) := by
    intro i j h
    obtain ⟨s, rfl⟩ := (Equiv.mulLeft γ).surjective i
    obtain ⟨t, rfl⟩ := (Equiv.mulLeft γ).surjective j
    change x 0 (γ * s) = x 0 (γ * t) at h
    rw [hxγ, hxγ] at h
    exact congrArg (Equiv.mulLeft γ) (hw h)
  have hreg₀' : (specialize (base 0) P').Separable := by
    rw [hspec]
    exact separable_prod_X_sub_C_iff.mpr hxInj
  have hreg₀ : (exceptionalPolynomial P).eval 0 ≠ 0 := by
    change (specialize (base 0) (planeMap base P)).Separable at hreg₀'
    rw [specialize_planeMap] at hreg₀'
    exact (separable_specialize_iff hP 0).mp ((separable_map base).mp hreg₀')
  have hseed : x 0 (γ * τ) = (x 0 γ)^Fintype.card K := by
    have hγ₁ : x 0 γ = linearOrderingValue w' (fun _ ↦ r) 1 := by simpa only [mul_one] using hxγ 1
    rw [hxγ, hγ₁]
    simpa only [mul_one] using frobenius_linearOrderingValue w (fun _ ↦ r) τ
      (fun _ j ↦ labelFrobenius_val e j) 1
  obtain ⟨M⟩ := GeometricFactors.exists_of_separable_map hP' (evalRingHom (base 0)) hreg₀'
  -- Construct the action on the components over the generic parameter.
  let H := FractionRing E[X]
  let L := AlgebraicClosure H
  let ψ := (algebraMap H L).comp (algebraMap E[X] H)
  let ψ₀ := ψ.comp (mapRingHom base)
  have hmap (U : PlanePolynomial K) : (planeMap base U).map ψ = U.map ψ₀ := Polynomial.map_map ..
  have hinjψ : Function.Injective ψ₀ := (algebraMap H L).injective.comp
    ((IsFractionRing.injective E[X] H).comp (Polynomial.map_injective _ base.injective))
  have hEx : exceptionalPolynomial P ≠ 0 := fun h ↦ hreg₀ (by rw [h, eval_zero])
  have hgen : (P'.map ψ).Separable := by
    rw [show P'.map ψ = P.map ψ₀ from hmap P]
    exact (separable_map_iff_exceptional hP ψ₀).mpr (by simpa only [map_zero] using hinjψ.ne hEx)
  choose vg hvg using fun i : Fin k ↦ exists_monic_root_factorization
    ((hAm i).1.map ψ₀) (((hAm i).1.natDegree_map ψ₀).trans (hAm i).2)
  let xg := linearOrderingValue (fun i j ↦ ψ₀ (C (w i j))) vg
  have hsplit : P'.map ψ = ∏ j : G, (X - C (xg j)) :=
    (hmap P).trans (groundResolvent_map A w ψ₀ vg hvg)
  have hgenD (j : G) : (P'.derivative.map ψ).eval (xg j) ≠ 0 := by
    have hr : (P'.map ψ).eval (xg j) = 0 := by
      rw [hsplit, eval_prod]
      exact prod_eq_zero (mem_univ j) (by simp)
    rw [← derivative_map]
    exact hgen.eval₂_derivative_ne_zero (RingHom.id L) hr
  have hgenR (j h : G) : ((R h).map ψ).eval (xg j) =
      (P'.derivative.map ψ).eval (xg j) * xg (j * h) := by
    change _ = ((planeMap base P).derivative.map ψ).eval (xg j) * _
    rw [show (R h).map ψ = (groundTwist A w h).map ψ₀ from hmap _, derivative_planeMap, hmap]
    exact eval_groundTwist A w ψ₀ vg hvg j h
  obtain ⟨act⟩ := componentTranslations_of_generic M R P'.derivative xg hsplit hgen hgenD hgenR
  let N := d.factorial ^ k
  have hPN : P.natDegree = N := natDegree_groundResolvent A w
  have hN : 0 < N := by dsimp [N]; positivity
  have hR (h : G) : Bivariate.WeightedDegreeLE 1 N (R h) := by
    intro j hj
    have hdeg : (R h).natDegree ≤ N - 1 :=
      natDegree_map_le.trans (natDegree_groundTwist_le A w h)
    have hjN : j ≤ N := (le_natDegree_of_ne_zero hj).trans (hdeg.trans (Nat.sub_le ..))
    have hcoeff : ((R h).coeff j).natDegree ≤ N - j := by
      change (((groundTwist A w h).map (mapRingHom base)).coeff j).natDegree ≤ _
      rw [coeff_map]
      exact natDegree_map_le.trans (natDegree_coeff_groundTwist_le A w hA h j)
    simp only [one_mul]; omega
  have hd' : P'.natDegree = N := (hP.natDegree_map _).trans hPN
  have hc' (j : ℕ) : (P'.coeff j).natDegree ≤ N - j := by
    change ((P.map (mapRingHom base)).coeff j).natDegree ≤ _
    rw [coeff_map]
    exact natDegree_map_le.trans (natDegree_coeff_groundResolvent_le A w hA j)
  have hwP : Bivariate.WeightedDegreeLE 1 N P' := by
    intro j hj
    have h := hc' j
    have hle := (le_natDegree_of_ne_zero hj).trans hd'.le
    simp only [one_mul]; omega
  have hEstimate (i : M.Component × G) (S : Finset (E × E))
      (hS : ∀ z ∈ S, planeEval z.1 z.2 i.1.val = 0 ∧ planeEval z.1 z.2 i.1.val.derivative ≠ 0 ∧
        z.1^Fintype.card K = z.1 ∧ planeEval z.1 z.2 P'.derivative ≠ 0 ∧
        planeEval z.1 z.2 P'.derivative * z.2^Fintype.card K = planeEval z.1 z.2 (R i.2)) :
      (S.card : ℝ) ≤ Fintype.card K + 8 * (N : ℝ)^2 * Real.sqrt (Fintype.card K) := by
    by_cases hS' : S.Nonempty
    · obtain ⟨z, hz⟩ := hS'
      have hder : i.1.val.derivative ≠ 0 := fun h ↦ (hS z hz).2.1 (by rw [h, map_zero])
      have hm := M.monic i.1.val i.1.property
      have hi := M.irred i.1.val i.1.property
      have hdiv := M.dvd i.1
      have hmN := (natDegree_le_of_dvd hdiv hP'.ne_zero).trans hd'.le
      have hdw := weightedDegree_one_of_monic_divisor hP' hm hdiv (by simpa only [hd'] using hc')
      exact card_twisted_frobenius_le (K := K) hm hi hder hN hmN
        (twice_factorial_pow_le hd hk) hlarge hdw (hR i.2) hwP.derivative S hS
    · rw [not_nonempty_iff_eq_empty.mp hS', card_empty, Nat.cast_zero]
      positivity
  have hcount := half_le_twist_fibers hP R M act x hspec hinterp hreg₀ ⟨γ, hseed⟩ hN
    (card_labelPermutations (k := k) (d := d)) hPN (natDegree_coeff_groundResolvent_le A w hA)
    hEstimate (twice_factorial_pow_le hd hk) (four_le_ordering_degree_bound hd hk) hlarge
  refine hcount.trans (Nat.mul_le_mul_left 2 ?_)
  unfold orderedPointCount
  refine (sum_le_sum (fun t ht ↦ ?_)).trans (sum_le_sum_of_subset ?_)
  · have hsepT : (specialize (base t) P').Separable := by
      rw [specialize_planeMap]
      exact ((separable_specialize_iff hP t).mpr (mem_regularParameters.mp ht).2).map
    have hi : Function.Injective (x t) := by
      rw [hspec] at hsepT
      exact separable_prod_X_sub_C_iff.mp hsepT
    let b i := enumerationEquiv (v t i) (injective_array_of_linearValue hi i) (hv t i)
    let α : G := fun i ↦ labelFrobenius (b i)
    have ha (i j) : v t i (α i j) = v t i j ^ Fintype.card K := labelFrobenius_val (b i) j
    let T := (univ : Finset G).filter fun j ↦ x t (j * τ) = (x t j)^Fintype.card K
    have htau (j : T) : α * j.val = j.val * τ := hi ((frobenius_linearOrderingValue w (v t) α ha j.val).trans
      ((mem_filter.mp j.property).2).symm)
    let order (j : T) : Ordering g d p u a t := orderingOfCompatibleLabels e b j.val
      (fun i ↦ congrFun (htau j) i)
    have ho : Function.Injective order := fun j l h ↦ Subtype.ext (orderingOfCompatibleLabels_injective e b h)
    rw [Nat.card_eq_fintype_card, ← Fintype.card_coe]
    exact Fintype.card_le_of_injective order ho
  · intro t ht
    exact mem_erase.mpr ⟨(mem_regularParameters.mp ht).1, mem_univ _⟩

/-- The all-graph missing-line lower bound, unconditionally. -/
theorem missing_lines {d k : ℕ} (hd : 2 ≤ d) (hk : 0 < k)
    (hq : 4 * d^2 ≤ Fintype.card K) (g : Fin k → K[X]) {c : K} (hc : c ≠ 0)
    (hg : ∀ i, (g i).natDegree = d ∧ (g i).leadingCoeff = c)
    (hlog : (k : ℝ) ≤ Real.log (Fintype.card K) / (8*d*Real.log d)) :
    Fintype.card K^2 ≤ 8*d*(d-1)*d^(d*k)*(missingLines g d).card :=
  missing_lines_of_ordering_estimate hd hk hq g hc hg hlog (regularOrderingEstimate hd)

/-- Both explicit blocking-pencil logarithmic bounds, unconditionally. -/
theorem pencil_bounds {d : ℕ} (hd : 2 ≤ d) (hq : 4*d^2 ≤ Fintype.card K) :
    Real.log (Fintype.card K) / (8*d*Real.log d) < blockingNumber K d ∧
    blockingNumber K d ≤ ⌊2 * Real.log (Fintype.card K) / (-Real.log (1 - 1 / (d : ℝ)))⌋₊ + 1 :=
  pencil_bounds_of_ordering_estimate hd hq (regularOrderingEstimate hd)

end Conjectures.AsgarliGhiocaYip
