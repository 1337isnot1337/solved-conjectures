module

public import Mathlib.Algebra.Group.End
public import Mathlib.Algebra.Group.Subgroup.Finite
public import Mathlib.GroupTheory.QuotientGroup.Defs

/-!
# Factor labels on the actual product group in Shumyatsky's proof

An automorphism which permutes the coordinate subgroups has a label
at each source factor. This gives the wreath-product description
used in the conjugate-pair lift.
-/

@[expose] public section

namespace Shumyatsky

variable {ι S : Type*} [Group S]

/-- Apply the label at each source coordinate and move it to the
    destination given by the permutation. -/
def factorAction (σ : Equiv.Perm ι) (labels : ι → MulAut S) : MulAut (ι → S) where
  toFun v j := labels (σ.symm j) (v (σ.symm j))
  invFun v i := (labels i).symm (v (σ i))
  left_inv v := by
    funext i
    simp
  right_inv v := by
    funext i
    simp
  map_mul' a b := by
    funext i
    exact map_mul (labels (σ.symm i)) _ _

theorem factorAction_apply_at (σ : Equiv.Perm ι) (labels : ι → MulAut S)
    (v : ι → S) (i : ι) : factorAction σ labels v (σ i) = labels i (v i) := by
  change labels (σ.symm (σ i)) (v (σ.symm (σ i))) = _
  rw [σ.symm_apply_apply]

/-- Equation for composing the source labels on the actual direct product. -/
theorem factorAction_mul (σ τ : Equiv.Perm ι) (a b : ι → MulAut S) :
    factorAction σ a * factorAction τ b =
      factorAction (σ * τ) (fun i => a (τ i) * b i) := by
  apply MulEquiv.ext
  intro v
  funext j
  obtain ⟨i, rfl⟩ := (σ * τ).surjective j
  rw [factorAction_apply_at, MulAut.mul_apply]
  change factorAction σ a (factorAction τ b v) (σ (τ i)) = a (τ i) (b i (v i))
  rw [factorAction_apply_at, factorAction_apply_at]

/-- An actual coordinate factor, embedded as functions supported at one index. -/
def coordinateFactor [DecidableEq ι] (i : ι) : Subgroup (ι → S) :=
  (MonoidHom.mulSingle (fun _ : ι => S) i).range

theorem factorAction_mulSingle [DecidableEq ι] (σ : Equiv.Perm ι)
    (a : ι → MulAut S) (i : ι) (s : S) :
    factorAction σ a (Pi.mulSingle i s) = Pi.mulSingle (σ i) (a i s) := by
  funext j
  obtain ⟨k, rfl⟩ := σ.surjective j
  rw [factorAction_apply_at]
  by_cases h : k = i
  · subst k
    simp
  · rw [Pi.mulSingle_eq_of_ne h, Pi.mulSingle_eq_of_ne (fun he => h (σ.injective he))]
    exact map_one _

/-- A factor-permuting automorphism of the finite product is exactly its
    permutation with the induced automorphisms of the individual factors. -/
theorem exists_factorAction_of_maps_factors [Finite ι] [DecidableEq ι]
    (e : MulAut (ι → S)) (σ : Equiv.Perm ι)
    (h : ∀ i, (coordinateFactor (S := S) i).map (e : (ι → S) →* (ι → S)) =
      coordinateFactor (σ i)) :
    ∃ labels : ι → MulAut S, e = factorAction σ labels := by
  let single (i : ι) : S ≃* coordinateFactor (S := S) i :=
    MonoidHom.ofInjective (f := MonoidHom.mulSingle (fun _ : ι => S) i)
      (Pi.mulSingle_injective (M := fun _ : ι => S) i)
  let labels (i : ι) : MulAut S :=
    (((single i).trans (e.subgroupMap (coordinateFactor i))).trans
      (MulEquiv.subgroupCongr (h i))).trans (single (σ i)).symm
  have hSingle (i : ι) (s : S) :
      e (Pi.mulSingle i s) = Pi.mulSingle (σ i) (labels i s) := by
    have hi := (single (σ i)).apply_symm_apply
      (MulEquiv.subgroupCongr (h i) (e.subgroupMap (coordinateFactor i) (single i s)))
    exact (congrArg Subtype.val hi).symm
  refine ⟨labels, MulEquiv.ext fun v => ?_⟩
  let same := (e : (ι → S) →* (ι → S)).eqLocus (factorAction σ labels)
  change v ∈ same
  apply Subgroup.pi_mem_of_mulSingle_mem
  intro i
  change e (Pi.mulSingle i (v i)) = factorAction σ labels (Pi.mulSingle i (v i))
  rw [hSingle, factorAction_mulSingle]

theorem factorAction_injective [DecidableEq ι] [Nontrivial S]
    {σ τ : Equiv.Perm ι} {a b : ι → MulAut S}
    (h : factorAction σ a = factorAction τ b) :
    σ = τ ∧ a = b := by
  have hp : σ = τ := by
    apply Equiv.Perm.ext
    intro i
    by_contra hne
    obtain ⟨s, hs⟩ := exists_ne (1 : S)
    have hv := congrArg (fun f : MulAut (ι → S) => f (Pi.mulSingle i s) (σ i)) h
    change factorAction σ a (Pi.mulSingle i s) (σ i) =
      factorAction τ b (Pi.mulSingle i s) (σ i) at hv
    rw [factorAction_mulSingle, factorAction_mulSingle,
      Pi.mulSingle_eq_same, Pi.mulSingle_eq_of_ne hne] at hv
    exact hs ((a i).injective (hv.trans (map_one _).symm))
  subst τ
  refine ⟨rfl, ?_⟩
  funext i
  apply MulEquiv.ext
  intro s
  have hv := congrArg (fun f : MulAut (ι → S) => f (fun _ => s) (σ i)) h
  simpa only [factorAction_apply_at] using hv

/-- The label equation (1) is equivalent to conjugacy of the actual
    product automorphisms when their factor permutations intertwine. -/
theorem factorAction_conj_iff [DecidableEq ι] [Nontrivial S]
    (σ τ γ : Equiv.Perm ι) (x y g : ι → MulAut S) :
    factorAction γ g * factorAction σ x * (factorAction γ g)⁻¹ = factorAction τ y ↔
      γ * σ = τ * γ ∧ ∀ i, g (σ i) = y (γ i) * g i * (x i)⁻¹ := by
  rw [mul_inv_eq_iff_eq_mul, factorAction_mul, factorAction_mul]
  constructor
  · intro h
    obtain ⟨hPerm, hLabels⟩ := factorAction_injective h
    refine ⟨hPerm, fun i => ?_⟩
    exact (eq_mul_inv_iff_mul_eq).2 (congrFun hLabels i)
  · rintro ⟨hPerm, hLabels⟩
    rw [hPerm]
    congr 1
    funext i
    exact (eq_mul_inv_iff_mul_eq).1 (hLabels i)


instance innerAutomorphisms_normal :
    (MulAut.conj (G := S)).range.Normal where
  conj_mem a ha e := by
    obtain ⟨s, rfl⟩ := ha
    refine ⟨e s, MulEquiv.ext fun t => ?_⟩
    simp

/-- The actual projection from automorphisms to outer automorphisms. -/
def outerProjection :
    MulAut S →* (MulAut S ⧸ (MulAut.conj (G := S)).range) :=
  QuotientGroup.mk' _

theorem outerProjection_conj (s : S) :
    outerProjection (MulAut.conj s) = 1 := by
  apply MonoidHom.mem_ker.mp
  change MulAut.conj s ∈ (QuotientGroup.mk' (MulAut.conj (G := S)).range).ker
  rw [QuotientGroup.ker_mk']
  exact ⟨s, rfl⟩

/-- Inner automorphisms of a product use its actual coordinate conjugations. -/
theorem factorAction_inner (v : ι → S) :
    factorAction 1 (fun i => MulAut.conj (v i)) = MulAut.conj v := by
  apply MulEquiv.ext
  intro t
  funext i
  rfl

/-- For fixed factor permutation, labels in prescribed outer classes
    parameterize exactly a right coset modulo inner automorphisms
    of the actual product group. -/
theorem factorAction_outer_eq_iff [DecidableEq ι] [Nontrivial S]
    (σ : Equiv.Perm ι) (a b : ι → MulAut S) :
    (∀ i, outerProjection (a i) = outerProjection (b i)) ↔
      ∃ v : ι → S, factorAction σ a = factorAction σ b * MulAut.conj v := by
  constructor
  · intro h
    have hv (i : ι) : ∃ s : S, MulAut.conj s = (b i)⁻¹ * a i := by
      change (b i)⁻¹ * a i ∈ (MulAut.conj (G := S)).range
      rw [← QuotientGroup.ker_mk' (MulAut.conj (G := S)).range, MonoidHom.mem_ker]
      change outerProjection ((b i)⁻¹ * a i) = 1
      rw [map_mul, map_inv, h i, inv_mul_cancel]
    choose v hv using hv
    refine ⟨v, ?_⟩
    rw [← factorAction_inner, factorAction_mul, mul_one]
    congr 1
    funext i
    change a i = b i * MulAut.conj (v i)
    rw [hv, mul_inv_cancel_left]
  · rintro ⟨v, h⟩
    rw [← factorAction_inner, factorAction_mul, mul_one] at h
    obtain ⟨_, hLabels⟩ := factorAction_injective h
    intro i
    rw [congrFun hLabels i]
    change outerProjection (b i * MulAut.conj (v i)) = outerProjection (b i)
    rw [map_mul, outerProjection_conj, mul_one]

end Shumyatsky
