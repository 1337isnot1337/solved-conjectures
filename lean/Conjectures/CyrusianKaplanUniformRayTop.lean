module
public import Conjectures.CyrusianKaplanIntegralRayHeightHom
public import Conjectures.CyrusianKaplanUniformLeadingBridge

@[expose] public section
namespace CyrusianKaplan

open Polynomial
open scoped BigOperators

private theorem natCard_residue_fibre_eq_filter {B : Type*} [Fintype B]
    (h : B → ℕ) (p r : ℕ) :
    Nat.card {b : B // r=(h b)%p}=(Finset.univ.filter (fun b=>r=(h b)%p)).card := by
  let E : {b : B // r=(h b)%p} ≃ ↥(Finset.univ.filter (fun b=>r=(h b)%p)) :=
    Equiv.subtypeEquivRight (fun _ => by simp)
  rw [Nat.card_congr E,Nat.card_eq_fintype_card,Fintype.card_coe]

/-- A genuine unit-height lattice point forces the top coefficient
to be independent of residue in an actual integral open ray chart.
This is the algebraic counterpart of a fixed affine-lattice leading
coefficient in codimension one. -/
theorem integerRayHeightSlice_has_uniform_top_quasipolynomial {m k : ℕ}
    (A : Fin m → Fin (k+1) → ℤ) (ell : Fin m)
    (h : ∀ i,0<A ell i)
    (hA : Function.Injective (coneRayCoordinateHom m (k+1) (fun j i => (A j i:ℝ))))
    (v₀ : rayCoordinateLattice m (k+1) (fun j i => (A j i:ℝ)))
    (hv₀ : actualRayHeightHom A ell v₀=1) :
    ∃ p : ℕ, ∃ hp : 0<p, ∃ C : ℚ, ∃ Q : Fin p→ℚ[X],
      (∀ s,(Q s).natDegree≤k) ∧ (∀ s,(Q s).coeff k=C) ∧
      ∀ g : ℕ,0<g →
        (Nat.card (integerRayHeightSlice A ell g):ℚ)=(Q ⟨g%p,Nat.mod_lt _ hp⟩).eval (g:ℚ) := by
  classical
  let P := rayCoordinateLattice m (k+1) (fun j i => (A j i:ℝ))
  let w := integralRayWeights A ell
  let p := ∏ i,w i
  have hw (i : Fin (k+1)) : 0<w i := by
    change 0<(A ell i).toNat
    have hi := h i
    omega
  have hp : 0<p := Finset.prod_pos (fun i _ => hw i)
  have hdvd (i : Fin (k+1)) : w i∣p := Finset.dvd_prod_of_mem w (Finset.mem_univ i)
  have : Finite (openFundamentalBoxPoints P) :=
    finite_openFundamentalBoxPoints_of_injective _ _ _ hA
  let : Fintype (openFundamentalBoxPoints P) := Fintype.ofFinite _
  let H := actualRayHeightHom A ell
  have hH (x : P) : (H x:ℝ)=∑ i,(w i:ℝ)*x.val i := actualRayHeightHom_eq_weighted_sum A ell h x
  let H₀ (z : openFundamentalBoxPoints P) : ℕ := (integer_box_height_exists A ell h z).choose
  have hH₀ (b : openFundamentalBoxPoints P) :
      (∑ i,(w i:ℝ)*b.val i)=(H₀ b:ℝ) := (integer_box_height_exists A ell h b).choose_spec
  have hB (b : openFundamentalBoxPoints P) : H₀ b≤∑ i,w i := by
    have hRe : (H₀ b:ℝ)≤(∑ i,(w i:ℝ)) := by
      rw [← hH₀]
      exact Finset.sum_le_sum (fun i _ => mul_le_of_le_one_right (Nat.cast_nonneg _) (b.property.2 i).2)
    exact_mod_cast hRe
  let B := OpenConeNumerator k P w p
  let n (b : B) := openConeNumeratorShift H₀ b
  let Q (s : Fin p) : ℚ[X] :=
    ∑ b : B, if s.val=(n b)%p then shiftedRayPolynomial k p (n b) else 0
  let s₀ : Fin p := ⟨0,hp⟩
  refine ⟨p,hp,(Q s₀).coeff k,Q,?_,?_,?_⟩
  · intro s
    unfold Q
    apply Polynomial.natDegree_sum_le_of_forall_le
    intro b _
    split_ifs
    · exact shiftedRayPolynomial_natDegree_le _ _ _
    · simp
  · intro s
    unfold Q
    rw [finite_ray_residue_top_coeff n k p hp s.val,
      finite_ray_residue_top_coeff n k p hp s₀.val,
      ← natCard_residue_fibre_eq_filter,← natCard_residue_fibre_eq_filter]
    have hCard := numerator_shift_residue_card_eq P
      (integer_ray_coefficients_in_lattice A) (natural_ray_coefficients_in_lattice _ _ A)
      w p hp hw hdvd H hH H₀ hH₀ v₀ hv₀ s s₀
    change Nat.card {b : B // s.val=(n b)%p} =
      Nat.card {b : B // s₀.val=(n b)%p} at hCard
    rw [hCard]
  · intro g hg
    have he : Nat.card (integerRayHeightSlice A ell g) = Nat.card (openConeHeightSlice w P g) := by
      apply Nat.card_congr
      apply Equiv.subtypeEquivRight
      intro x
      change (coneRayCoordinateHom m (k+1) (fun j i => (A j i:ℝ)) x.val ell=(g:ℝ)) ↔
        (∑ i,(w i:ℝ)*x.val i)=(g:ℝ)
      rw [weighted_real_eq_integral_ray_height A ell h]
    rw [he,openConeHeightSlice_card P (natural_ray_coefficients_in_lattice _ _ A)
      w p hp hw hdvd H₀ hH₀ g,Nat.cast_sum]
    change (∑ b : B,(rayShiftCount k p (n b) g:ℚ)) =
      ((∑ b : B,if g%p=(n b)%p then shiftedRayPolynomial k p (n b) else 0)).eval (g:ℚ)
    rw [Polynomial.eval_finsetSum]
    apply Finset.sum_congr rfl
    intro b _
    split_ifs with hmod
    · have hn : n b≤(k+1)*p :=
        open_cone_shift_le_period_times_dimension w p (H₀ b.1) hdvd (hB b.1) b.2
      rw [rayShiftCount_of_congruent _ _ _ _ hp hmod,
        shiftedRayPolynomial_eval _ _ _ _ hp hg hn hmod]
      split_ifs <;> simp
    · rw [rayShiftCount_of_not_congruent _ _ _ _ hmod,Nat.cast_zero,Polynomial.eval_zero]

end CyrusianKaplan
