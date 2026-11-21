import Conjectures.JohnsonPfaffianRestriction
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.Algebra.MvPolynomial.Rename
namespace JohnsonPfaffian
open MvPolynomial

def NonnegativeCoeffs {σ : Type*} (p : MvPolynomial σ ℤ) : Prop := ∀ m, 0 ≤ p.coeff m

theorem coeffs_nonnegative_C {σ : Type*} (z : ℤ) (hz : 0≤z) : NonnegativeCoeffs (MvPolynomial.C z : MvPolynomial σ ℤ) := by
  classical
  intro m
  rw [MvPolynomial.coeff_C]
  split_ifs <;> omega

theorem coeffs_nonnegative_X {σ : Type*} (x : σ) : NonnegativeCoeffs (MvPolynomial.X x : MvPolynomial σ ℤ) := by
  classical
  intro m
  rw [MvPolynomial.coeff_X]
  split_ifs <;> omega

theorem coeffs_nonnegative_add {σ : Type*} (p q : MvPolynomial σ ℤ)
    (hp : NonnegativeCoeffs p) (hq : NonnegativeCoeffs q) : NonnegativeCoeffs (p+q) := by
  intro m
  simp only [AddMonoidAlgebra.coeff_add, Finsupp.add_apply]
  exact add_nonneg (hp m) (hq m)

theorem coeffs_nonnegative_mul {σ : Type*} (p q : MvPolynomial σ ℤ)
    (hp : NonnegativeCoeffs p) (hq : NonnegativeCoeffs q) : NonnegativeCoeffs (p*q) := by
  classical
  intro m
  rw [MvPolynomial.coeff_mul]
  exact Finset.sum_nonneg (fun _ _ => mul_nonneg (hp _) (hq _))

theorem coeffs_nonnegative_sum {σ α : Type*} (s : Finset α) (f : α → MvPolynomial σ ℤ)
    (hf : ∀ x ∈ s, NonnegativeCoeffs (f x)) : NonnegativeCoeffs (∑ x ∈ s, f x) := by
  intro m
  rw [MvPolynomial.coeff_sum]
  exact Finset.sum_nonneg (fun x hx => hf x hx m)

theorem coeffs_nonnegative_prod {σ α : Type*} (s : Finset α) (f : α → MvPolynomial σ ℤ)
    (hf : ∀ x ∈ s, NonnegativeCoeffs (f x)) : NonnegativeCoeffs (∏ x ∈ s, f x) := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa using (coeffs_nonnegative_C (σ := σ) 1 (by omega))
  | @insert a s ha ih =>
    rw [Finset.prod_insert ha]
    exact coeffs_nonnegative_mul _ _ (hf a (by simp)) (ih (by intro x hx; exact hf x (by simp [hx])))

theorem coeffs_nonnegative_pow {σ : Type*} (p : MvPolynomial σ ℤ)
    (hp : NonnegativeCoeffs p) (n : ℕ) : NonnegativeCoeffs (p^n) := by
  induction n with
  | zero => simpa using (coeffs_nonnegative_C (σ := σ) 1 (by omega))
  | succ n ih => rw [pow_succ]; exact coeffs_nonnegative_mul _ _ ih hp

theorem coeffs_nonnegative_substitution {σ τ : Type*} (p : MvPolynomial σ ℤ)
    (hp : NonnegativeCoeffs p) (g : σ → MvPolynomial τ ℤ)
    (hg : ∀ x, NonnegativeCoeffs (g x)) :
    NonnegativeCoeffs (MvPolynomial.eval₂ (MvPolynomial.C : ℤ →+* MvPolynomial τ ℤ) g p) := by
  classical
  rw [MvPolynomial.eval₂_eq]
  apply coeffs_nonnegative_sum
  intro m hm
  apply coeffs_nonnegative_mul
  · exact coeffs_nonnegative_C _ (hp m)
  · apply coeffs_nonnegative_prod
    intro x hx
    exact coeffs_nonnegative_pow _ (hg x) _
noncomputable def intervalPfaffian {R : Type*} [CommRing R] (u : ℕ)
    (I : Finset (ℕ × ℕ)) (t : ℕ × ℕ → R) : R :=
  ∑ M ∈ GilmoreCrossingNesting.matchingFinset u,
    (-1:R)^(GilmoreCrossingNesting.pairCount GilmoreCrossingNesting.crossContribution M) * edgeProduct (intervalWeight I t) M

theorem map_intervalWeight {R S : Type*} [CommRing R] [CommRing S] (f : R →+* S)
    (I : Finset (ℕ × ℕ)) (t : ℕ × ℕ → R) (a b : ℕ) :
    f (intervalWeight I t a b) = intervalWeight I (fun J => f (t J)) a b := by
  simp only [intervalWeight, map_sum]
  apply Finset.sum_congr rfl
  intro J hJ
  split_ifs <;> simp

theorem map_edgeProduct {R S : Type*} [CommRing R] [CommRing S] (f : R →+* S)
    (w : ℕ → ℕ → R) (M : List (ℕ × ℕ)) :
    f (edgeProduct w M) = edgeProduct (fun a b => f (w a b)) M := by
  induction M with
  | nil => simp [edgeProduct]
  | cons e es ih =>
    simp only [edgeProduct, List.map_cons, List.prod_cons, map_mul]
    exact congrArg (fun x => f (w e.1 e.2) * x) ih

theorem map_intervalPfaffian {R S : Type*} [CommRing R] [CommRing S] (f : R →+* S)
    (u : ℕ) (I : Finset (ℕ × ℕ)) (t : ℕ × ℕ → R) :
    f (intervalPfaffian u I t) = intervalPfaffian u I (fun J => f (t J)) := by
  unfold intervalPfaffian
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro M hM
  rw [map_mul, map_pow, map_neg, map_one, map_edgeProduct]
  congr 2
  funext a b
  exact map_intervalWeight f I t a b
theorem matching_length (u : ℕ) (M : List (ℕ × ℕ))
    (hM : M ∈ GilmoreCrossingNesting.matchingFinset u) : M.length = u := by
  have hpart := ((GilmoreCrossingNesting.mem_matchingFinset (u := u) (arcs := M)).mp hM).1
  have hlen : (GilmoreCrossingNesting.arcEndpoints M).length = 2*M.length := by
    induction M with
    | nil => rfl
    | cons e es ih => simp [GilmoreCrossingNesting.arcEndpoints] at ih ⊢; omega
  have hp := hpart.length_eq
  simp only [List.length_range] at hp
  omega

theorem intervalWeight_homogeneous (I : Finset (ℕ × ℕ)) (a b : ℕ) :
    (intervalWeight I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ)) a b).IsHomogeneous 1 := by
  unfold intervalWeight
  apply MvPolynomial.IsHomogeneous.sum
  intro J hJ
  split_ifs
  · exact MvPolynomial.isHomogeneous_X ℤ J
  · exact MvPolynomial.isHomogeneous_zero _ _ _

theorem intervalProduct_homogeneous (I : Finset (ℕ × ℕ)) (M : List (ℕ × ℕ)) :
    (edgeProduct (intervalWeight I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ))) M).IsHomogeneous M.length := by
  induction M with
  | nil => simpa [edgeProduct] using (MvPolynomial.isHomogeneous_one (σ := ℕ × ℕ) ℤ)
  | cons e es ih =>
    simp only [edgeProduct,List.map_cons,List.prod_cons,List.length_cons]
    simpa [Nat.add_comm,edgeProduct] using (intervalWeight_homogeneous I e.1 e.2).mul ih

theorem intervalPfaffian_homogeneous (u : ℕ) (I : Finset (ℕ × ℕ)) :
    (intervalPfaffian u I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ))).IsHomogeneous u := by
  unfold intervalPfaffian
  apply MvPolynomial.IsHomogeneous.sum
  intro M hM
  have hs : ((-1 : MvPolynomial (ℕ × ℕ) ℤ)^(GilmoreCrossingNesting.pairCount GilmoreCrossingNesting.crossContribution M)).IsHomogeneous 0 := by
    simpa using ((MvPolynomial.isHomogeneous_one (σ := ℕ × ℕ) ℤ).neg.pow _)
  have hp := intervalProduct_homogeneous I M
  rw [matching_length u M hM] at hp
  simpa using hs.mul hp

theorem support_card_le_degree {σ : Type*} (m : σ →₀ ℕ) : m.support.card ≤ Finsupp.degree m := by
  classical
  rw [Finsupp.degree_apply]
  calc
    m.support.card = ∑ _ ∈ m.support, (1:ℕ) := by simp
    _ ≤ ∑ x ∈ m.support, m x := Finset.sum_le_sum (by intro x hx; have := Finsupp.mem_support_iff.mp hx; omega)
noncomputable def specializeVariables {σ : Type*} (K : Finset σ) :
    MvPolynomial σ ℤ →+* MvPolynomial σ ℤ :=
  ((MvPolynomial.rename (Subtype.val : {x // x ∈ K} → σ)).comp
    (MvPolynomial.killCompl (f := (Subtype.val : {x // x ∈ K} → σ)) Subtype.val_injective)).toRingHom

theorem specializeVariables_X {σ : Type*} [DecidableEq σ] (K : Finset σ) (x : σ) :
    specializeVariables K (MvPolynomial.X x) = if x ∈ K then MvPolynomial.X x else 0 := by
  classical
  unfold specializeVariables
  change (MvPolynomial.rename (Subtype.val : {x // x ∈ K} → σ))
    (MvPolynomial.killCompl Subtype.val_injective (MvPolynomial.X x)) = _
  by_cases hx : x ∈ K
  · let y : {x // x ∈ K} := ⟨x,hx⟩
    have hxy : (Subtype.val y) = x := rfl
    rw [← hxy, ← MvPolynomial.rename_X, MvPolynomial.killCompl_rename_app, MvPolynomial.rename_X]
    simp [hxy,hx]
  · simp [MvPolynomial.killCompl, hx]

theorem specializeVariables_coeff {σ : Type*} (K : Finset σ) (p : MvPolynomial σ ℤ)
    (m : σ →₀ ℕ) (hm : m.support ⊆ K) :
    (specializeVariables K p).coeff m = p.coeff m := by
  classical
  let f : {x // x ∈ K} → σ := Subtype.val
  let m' := m.comapDomain f (Subtype.val_injective.injOn)
  have hrange : (↑m.support : Set σ) ⊆ Set.range f := by
    intro x hx
    exact ⟨⟨x,hm hx⟩,rfl⟩
  have hmap : Finsupp.mapDomain f m' = m := Finsupp.mapDomain_comapDomain f Subtype.val_injective m hrange
  unfold specializeVariables
  change ((MvPolynomial.rename f) (MvPolynomial.killCompl Subtype.val_injective p)).coeff m = p.coeff m
  rw [← hmap, MvPolynomial.coeff_rename_mapDomain f Subtype.val_injective, MvPolynomial.coeff_killCompl]
theorem intervalPfaffian_weight_congr {R : Type*} [CommRing R] (u : ℕ)
    (I J : Finset (ℕ × ℕ)) (t s : ℕ × ℕ → R)
    (h : ∀ a b, intervalWeight I t a b = intervalWeight J s a b) :
    intervalPfaffian u I t = intervalPfaffian u J s := by
  unfold intervalPfaffian
  apply Finset.sum_congr rfl
  intro M hM
  congr 1
  apply congrArg (fun w => edgeProduct w M)
  funext a b
  exact h a b

theorem specialize_intervalPfaffian (u : ℕ) (I K : Finset (ℕ × ℕ)) :
    specializeVariables K (intervalPfaffian u I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ))) =
      intervalPfaffian u (I.filter (fun J => J ∈ K)) (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ)) := by
  classical
  rw [map_intervalPfaffian]
  apply intervalPfaffian_weight_congr
  intro a b
  simp only [intervalWeight,specializeVariables_X,Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro J hJ
  split_ifs <;> simp_all
noncomputable def intervalUniverse (n : ℕ) : Finset (ℕ × ℕ) :=
  ((Finset.range n).product (Finset.range n)).filter (fun J => J.1 ≤ J.2)

theorem mem_intervalUniverse (n : ℕ) (J : ℕ × ℕ) :
    J ∈ intervalUniverse n ↔ J.1 ≤ J.2 ∧ J.2 < n := by
  rcases J with ⟨a,b⟩
  simp [intervalUniverse]
  omega

theorem intervalPfaffian_extend {R : Type*} [CommRing R] (u : ℕ)
    (I U : Finset (ℕ × ℕ)) (t : ℕ × ℕ → R) (hsub : I ⊆ U) :
    intervalPfaffian u I t = intervalPfaffian u U (fun J => if J ∈ I then t J else 0) := by
  classical
  apply intervalPfaffian_weight_congr
  intro a b
  unfold intervalWeight
  symm
  calc
    _ = ∑ J ∈ I, if J.1 ≤ a ∧ a ≤ J.2 ∧ J.1 ≤ b ∧ b ≤ J.2 then (if J ∈ I then t J else 0) else 0 := by
      symm
      apply Finset.sum_subset hsub
      intro J hJU hJI
      simp [hJI]
    _ = _ := by
      apply Finset.sum_congr rfl
      intro J hJ
      simp [hJ]

theorem compressedIntervalWeights_nonnegative (u i : ℕ) (I : Finset (ℕ × ℕ)) (K : ℕ × ℕ) :
    NonnegativeCoeffs (compressedIntervalWeights u i I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ)) K) := by
  unfold compressedIntervalWeights
  apply coeffs_nonnegative_sum
  intro J hJ
  exact coeffs_nonnegative_X J

theorem compressed_intervalPfaffian_nonnegative (u i : ℕ) (hu : 0<u) (I : Finset (ℕ × ℕ))
    (hIH : NonnegativeCoeffs (intervalPfaffian u (intervalUniverse (2*u)) (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ)))) :
    NonnegativeCoeffs (intervalPfaffian u (I.image (compressedInterval u i))
      (compressedIntervalWeights u i I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ)))) := by
  classical
  let U := intervalUniverse (2*u)
  let I' := I.image (compressedInterval u i)
  let t := compressedIntervalWeights u i I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ))
  have hsub : I' ⊆ U := by
    intro J hJ
    obtain ⟨K,hK,rfl⟩ := Finset.mem_image.mp hJ
    exact (mem_intervalUniverse _ _).mpr (compressedInterval_valid u i K hu)
  let g : ℕ × ℕ → MvPolynomial (ℕ × ℕ) ℤ := fun J => if J ∈ I' then t J else 0
  have hg : ∀ J, NonnegativeCoeffs (g J) := by
    intro J
    by_cases h : J ∈ I'
    · simp only [g,ite_eq_left h]
      exact compressedIntervalWeights_nonnegative u i I J
    · simp only [g,ite_eq_right h]
      simpa using (coeffs_nonnegative_C (σ := ℕ × ℕ) 0 (by omega))
  have hp := coeffs_nonnegative_substitution _ hIH g hg
  have hmap := map_intervalPfaffian (MvPolynomial.eval₂Hom (MvPolynomial.C : ℤ →+* MvPolynomial (ℕ × ℕ) ℤ) g)
    u U (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ))
  change MvPolynomial.eval₂ (MvPolynomial.C : ℤ →+* MvPolynomial (ℕ × ℕ) ℤ) g (intervalPfaffian u U (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ))) = intervalPfaffian u U (fun J => MvPolynomial.eval₂ (MvPolynomial.C : ℤ →+* MvPolynomial (ℕ × ℕ) ℤ) g (MvPolynomial.X J)) at hmap
  simp only [MvPolynomial.eval₂_X] at hmap
  rw [hmap] at hp
  have hext := intervalPfaffian_extend u I' U t hsub
  change NonnegativeCoeffs (intervalPfaffian u U g) at hp
  rw [← hext] at hp
  exact hp
theorem matchingFinset_zero : GilmoreCrossingNesting.matchingFinset 0 = {[]} := by
  classical
  ext M
  constructor
  · intro hM
    have hlen := matching_length 0 M hM
    have : M = [] := by cases M <;> simp_all
    simp [this]
  · intro hM
    have : M = [] := by simpa using hM
    subst M
    apply (GilmoreCrossingNesting.mem_matchingFinset (u := 0) (arcs := [])).mpr
    simp [GilmoreCrossingNesting.arcEndpoints]

theorem intervalPfaffian_zero {R : Type*} [CommRing R] (I : Finset (ℕ × ℕ)) (t : ℕ × ℕ → R) :
    intervalPfaffian 0 I t = 1 := by
  simp [intervalPfaffian,matchingFinset_zero,edgeProduct,GilmoreCrossingNesting.pairCount]

theorem intervalWeight_X_nonnegative (I : Finset (ℕ × ℕ)) (a b : ℕ) :
    NonnegativeCoeffs (intervalWeight I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ)) a b) := by
  unfold intervalWeight
  apply coeffs_nonnegative_sum
  intro J hJ
  split_ifs
  · exact coeffs_nonnegative_X J
  · simpa using (coeffs_nonnegative_C (σ := ℕ × ℕ) 0 (by omega))
theorem intervalPfaffian_coefficients_nonnegative (u : ℕ) :
    NonnegativeCoeffs (intervalPfaffian u (intervalUniverse (2*u)) (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ))) := by
  classical
  induction u with
  | zero =>
    rw [intervalPfaffian_zero]
    simpa using (coeffs_nonnegative_C (σ := ℕ × ℕ) 1 (by omega))
  | succ u ih =>
    intro m
    by_cases hdeg : Finsupp.degree m = u+1
    · let U := intervalUniverse (2*(u+1))
      let I := U.filter (fun J => J ∈ m.support)
      have hcard : I.card ≤ u+1 := by
        have hsub : I ⊆ m.support := by intro J hJ; exact (Finset.mem_filter.mp hJ).2
        have := Finset.card_le_card hsub
        have := support_card_le_degree m
        omega
      have hvalid : ∀ J ∈ I, J.1 ≤ J.2 ∧ J.2 < 2*(u+1) := by
        intro J hJ
        exact (mem_intervalUniverse _ _).mp (Finset.mem_filter.mp hJ).1
      have hcoeff : (intervalPfaffian (u+1) U (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ))).coeff m =
          (intervalPfaffian (u+1) I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ))).coeff m := by
        have h := specializeVariables_coeff m.support (intervalPfaffian (u+1) U (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ))) m (by rfl)
        rw [specialize_intervalPfaffian] at h
        exact h.symm
      change 0 ≤ (intervalPfaffian (u+1) U (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ))).coeff m
      rw [hcoeff]
      rcases sparse_interval_inductive_step u I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ)) hcard hvalid with hz | ⟨i,hi,heq⟩
      · change intervalPfaffian (u+1) I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ)) = 0 at hz
        rw [hz]
        simp
      · change intervalPfaffian (u+1) I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ)) =
            intervalWeight I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ)) i (i+1) *
              intervalPfaffian u (I.image (compressedInterval u i))
                (compressedIntervalWeights u i I (fun J => (MvPolynomial.X J : MvPolynomial (ℕ × ℕ) ℤ))) at heq
        rw [heq]
        apply coeffs_nonnegative_mul
        · exact intervalWeight_X_nonnegative I i (i+1)
        · by_cases hu : 0<u
          · exact compressed_intervalPfaffian_nonnegative u i hu I ih
          · have hu0 : u=0 := by omega
            subst u
            rw [intervalPfaffian_zero]
            simpa using (coeffs_nonnegative_C (σ := ℕ × ℕ) 1 (by omega))
    · have hh := intervalPfaffian_homogeneous (u+1) (intervalUniverse (2*(u+1)))
      rw [hh.coeff_eq_zero hdeg]
end JohnsonPfaffian
