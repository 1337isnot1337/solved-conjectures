import Conjectures.JohnsonPfaffianPositive
import Mathlib.Algebra.MvPolynomial.CommRing
import Mathlib.Algebra.MvPolynomial.PDeriv
namespace JohnsonPfaffian

theorem coeffs_nonnegative_pderiv {σ : Type*} (p : MvPolynomial σ ℤ)
    (hp : NonnegativeCoeffs p) (i : σ) : NonnegativeCoeffs (MvPolynomial.pderiv i p) := by
  classical
  intro m
  rw [MvPolynomial.coeff_pderiv]
  apply mul_nonneg (hp _)
  positivity

theorem intervalPfaffian_pderiv_nonnegative (u : ℕ) (i : ℕ × ℕ) (g : ℕ × ℕ → ℝ)
    (hg : ∀ J, 0 ≤ g J) :
    0 ≤ MvPolynomial.eval₂ (Int.castRingHom ℝ) g
      (MvPolynomial.pderiv i (intervalPfaffian u (intervalUniverse (2*u)) (fun J => MvPolynomial.X J))) :=
  eval_nonnegative_of_coeffs _ (coeffs_nonnegative_pderiv _ (intervalPfaffian_coefficients_nonnegative u) i) g hg
theorem eval_deriv_edgeProduct {σ : Type*} (i : σ) (g : σ → ℝ)
    (w : ℕ → ℕ → MvPolynomial σ ℤ) (M : List (ℕ × ℕ)) (e : ℕ × ℕ) (he : e ∈ M)
    (hz : MvPolynomial.eval₂ (Int.castRingHom ℝ) g (w e.1 e.2) = 0) :
    MvPolynomial.eval₂ (Int.castRingHom ℝ) g (MvPolynomial.pderiv i (edgeProduct w M)) =
      MvPolynomial.eval₂ (Int.castRingHom ℝ) g (MvPolynomial.pderiv i (w e.1 e.2)) *
        edgeProduct (fun a b => MvPolynomial.eval₂ (Int.castRingHom ℝ) g (w a b)) (M.erase e) := by
  have heq : edgeProduct w M = w e.1 e.2 * edgeProduct w (M.erase e) := by
    unfold edgeProduct
    rw [((List.perm_cons_erase he).map (fun f => w f.1 f.2)).prod_eq]
    simp
  rw [heq,MvPolynomial.pderiv_mul]
  let E := MvPolynomial.eval₂Hom (Int.castRingHom ℝ) g
  change E (_ + _) = E _ * _
  rw [map_add,map_mul,map_mul]
  change _ + MvPolynomial.eval₂ (Int.castRingHom ℝ) g (w e.1 e.2) * _ = _
  rw [hz,zero_mul,add_zero]
  congr 1
  exact map_edgeProduct E w (M.erase e)
theorem intervalWeight_eval_first_zero (n j : ℕ) (g : ℕ × ℕ → ℝ)
    (hg : ∀ J, J.1=0 → g J = 0) :
    MvPolynomial.eval₂ (Int.castRingHom ℝ) g
      (intervalWeight (intervalUniverse n) (fun J => MvPolynomial.X J) 0 j) = 0 := by
  let E := MvPolynomial.eval₂Hom (Int.castRingHom ℝ) g
  change E (intervalWeight (intervalUniverse n) (fun J => MvPolynomial.X J) 0 j) = 0
  rw [map_intervalWeight]
  unfold intervalWeight
  apply Finset.sum_eq_zero
  intro J hJ
  split_ifs with h
  · have hj : J.1=0 := by omega
    simpa [E] using hg J hj
  · rfl

theorem intervalWeight_deriv_first (n q j : ℕ) (hq : q<n) :
    MvPolynomial.pderiv (0,q)
      (intervalWeight (intervalUniverse n) (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ)) 0 j) =
        if j≤q then 1 else 0 := by
  classical
  have hderiv : MvPolynomial.pderiv (0,q)
      (intervalWeight (intervalUniverse n) (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ)) 0 j) =
      ∑ x ∈ intervalUniverse n, if x.1 ≤ 0 ∧ 0 ≤ x.2 ∧ x.1 ≤ j ∧ j ≤ x.2 then
        (if x = (0,q) then 1 else 0) else 0 := by
    unfold intervalWeight
    rw [map_sum]
    apply Finset.sum_congr rfl
    intro x hx
    by_cases h : x.1 = 0 ∧ x.1 ≤ j ∧ j ≤ x.2
    · simp [h,MvPolynomial.pderiv_X,Pi.single_apply]
    · simp [h]
  rw [hderiv]
  have hmem : (0,q) ∈ intervalUniverse n := (mem_intervalUniverse n (0,q)).mpr (by simp [hq])
  calc
    _ = ∑ x ∈ intervalUniverse n, if x=(0,q) then (if j≤q then (1 : MvPolynomial (ℕ × ℕ) ℤ) else 0) else 0 := by
      apply Finset.sum_congr rfl
      intro x hx
      by_cases h : x=(0,q)
      · subst x; simp
      · simp [h]
    _ = _ := by simp [hmem]
noncomputable def borderWeight (q : ℕ) (w : ℕ → ℕ → ℝ) (a b : ℕ) : ℝ :=
  if a=0 then (if b≤q then 1 else 0) else w a b

theorem matching_has_zero_edge (u : ℕ) (M : List (ℕ × ℕ))
    (hM : M ∈ GilmoreCrossingNesting.matchingFinset (u+1)) :
    ∃ j, (0,j) ∈ M ∧ 0<j := by
  obtain ⟨e,he,hei⟩ := matching_edge_at_vertex (u+1) 0 M hM (by omega)
  have heord := (valid_matching_edges (u+1) M hM e he).1
  have he0 : e.1=0 := by rcases hei with h | h <;> omega
  refine ⟨e.2,?_,by omega⟩
  simpa [← he0] using he

theorem border_edgeProduct (u q j : ℕ) (w : ℕ → ℕ → ℝ) (M : List (ℕ × ℕ))
    (hM : M ∈ GilmoreCrossingNesting.matchingFinset (u+1)) (he : (0,j) ∈ M) :
    edgeProduct (borderWeight q w) M = (if j≤q then 1 else 0) * edgeProduct w (M.erase (0,j)) := by
  have hsort := ((GilmoreCrossingNesting.mem_matchingFinset (u := u+1) (arcs := M)).mp hM).2.2
  have hn : M.Nodup := List.nodup_iff_pairwise_ne.mpr (hsort.imp (by intro a b h hab; subst b; omega))
  have hrest : edgeProduct (borderWeight q w) (M.erase (0,j)) = edgeProduct w (M.erase (0,j)) := by
    unfold edgeProduct
    apply congrArg List.prod
    apply List.map_congr_left
    intro e he'
    have he'' := (List.Nodup.mem_erase_iff hn).mp he'
    have hdis := matching_edges_disjoint (u+1) M hM e (0,j) he''.2 he he''.1
    have he0 : e.1 ≠ 0 := by
      intro hz
      have hh := List.disjoint_left.mp hdis (by simp : e.1 ∈ [e.1,e.2])
      apply hh
      simp [hz]
    simp [borderWeight,he0]
  have hp : edgeProduct (borderWeight q w) M = borderWeight q w 0 j * edgeProduct (borderWeight q w) (M.erase (0,j)) := by
    unfold edgeProduct
    rw [((List.perm_cons_erase he).map (fun e => borderWeight q w e.1 e.2)).prod_eq]
    simp
  rw [hp,hrest]
  simp [borderWeight]
theorem intervalPfaffian_deriv_border (u q : ℕ) (hq : q < 2*(u+1))
    (g : ℕ × ℕ → ℝ) (hg0 : ∀ J, J.1=0 → g J=0) :
    MvPolynomial.eval₂ (Int.castRingHom ℝ) g
      (MvPolynomial.pderiv (0,q) (intervalPfaffian (u+1) (intervalUniverse (2*(u+1))) (fun J => MvPolynomial.X J))) =
    ∑ M ∈ GilmoreCrossingNesting.matchingFinset (u+1),
      (-1:ℝ)^(GilmoreCrossingNesting.pairCount GilmoreCrossingNesting.crossContribution M) *
        edgeProduct (borderWeight q (intervalWeight (intervalUniverse (2*(u+1))) g)) M := by
  classical
  let W : ℕ → ℕ → MvPolynomial (ℕ × ℕ) ℤ := intervalWeight (intervalUniverse (2*(u+1))) (fun J => MvPolynomial.X J)
  let E := MvPolynomial.eval₂Hom (Int.castRingHom ℝ) g
  unfold intervalPfaffian
  rw [map_sum]
  change E (∑ M ∈ GilmoreCrossingNesting.matchingFinset (u+1), _) = _
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro M hM
  obtain ⟨j,he,hj⟩ := matching_has_zero_edge u M hM
  let k := GilmoreCrossingNesting.pairCount GilmoreCrossingNesting.crossContribution M
  have hsign : (-1 : MvPolynomial (ℕ × ℕ) ℤ)^k = MvPolynomial.C ((-1:ℤ)^k) := by simp
  change E (MvPolynomial.pderiv (0,q) ((-1 : MvPolynomial (ℕ × ℕ) ℤ)^k * edgeProduct W M)) = _
  rw [hsign,MvPolynomial.pderiv_C_mul,map_mul]
  have hEw : ∀ a b, E (W a b) = intervalWeight (intervalUniverse (2*(u+1))) g a b := by
    intro a b
    rw [map_intervalWeight]
    simp [E]
  have hz : MvPolynomial.eval₂ (Int.castRingHom ℝ) g (W 0 j) = 0 :=
    intervalWeight_eval_first_zero _ j g hg0
  have hp := eval_deriv_edgeProduct (0,q) g W M (0,j) he hz
  change E (MvPolynomial.pderiv (0,q) (edgeProduct W M)) = _ at hp
  rw [hp, border_edgeProduct u q j _ M hM he]
  have hd : MvPolynomial.eval₂ (Int.castRingHom ℝ) g (MvPolynomial.pderiv (0,q) (W 0 j)) = if j≤q then 1 else 0 := by
    rw [intervalWeight_deriv_first _ q j hq]
    split_ifs <;> simp
  rw [hd]
  have hwprod : edgeProduct (fun a b => MvPolynomial.eval₂ (Int.castRingHom ℝ) g (W a b)) (M.erase (0,j)) =
      edgeProduct (intervalWeight (intervalUniverse (2*(u+1))) g) (M.erase (0,j)) := by
    apply congrArg (fun w => edgeProduct w _)
    funext a b
    exact hEw a b
  rw [hwprod]
  simp [E,k]
theorem border_prefix_matching_nonnegative (u q : ℕ) (hq : q<2*(u+1))
    (g : ℕ × ℕ → ℝ) (hg : ∀ J, 0 ≤ g J) (hg0 : ∀ J, J.1=0 → g J=0) :
    0 ≤ ∑ M ∈ GilmoreCrossingNesting.matchingFinset (u+1),
      (-1:ℝ)^(GilmoreCrossingNesting.pairCount GilmoreCrossingNesting.crossContribution M) *
        edgeProduct (borderWeight q (intervalWeight (intervalUniverse (2*(u+1))) g)) M := by
  have hp := intervalPfaffian_pderiv_nonnegative (u+1) (0,q) g hg
  rw [intervalPfaffian_deriv_border u q hq g hg0] at hp
  exact hp
end JohnsonPfaffian
