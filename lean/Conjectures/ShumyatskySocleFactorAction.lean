module

public import Conjectures.ShumyatskyCharacteristicallySimple
public import Conjectures.ShumyatskySimpleFactors
public import Conjectures.ShumyatskyMultifactorLift
public import Mathlib.GroupTheory.GroupAction.SubMulAction

/-! The action on the actual simple factors factors through the
socle quotient. A generating pair in the quotient has transitive
factor permutations, and its lifts have the verified label form. -/

@[expose] public section

open scoped Pointwise

namespace Shumyatsky

variable {G : Type*} [Group G]

/-- The actual permutation action on the ambient conjugates of an
    internal subgroup of a normal subgroup. -/
def ambientFactorPerm (N : Subgroup G) [N.Normal] (P : Subgroup N) :
    G →* Equiv.Perm (ambientConjugates N P) := by
  letI : MulAction G (Subgroup N) := MulAction.compHom _ (MulAut.conjNormal (H := N))
  let A : SubMulAction G (Subgroup N) :=
    { carrier := ambientConjugates N P
      smul_mem' := by
        rintro g K ⟨a, rfl⟩
        refine ⟨g * a, ?_⟩
        change P.map (MulAut.conjNormal (H := N) (g * a)).toMonoidHom =
          (P.map (MulAut.conjNormal (H := N) a).toMonoidHom).map
            (MulAut.conjNormal (H := N) g).toMonoidHom
        rw [map_mul, Subgroup.map_map]
        rfl }
  exact MulAction.toPermHom G A

theorem ambientFactorPerm_apply_val (N : Subgroup G) [N.Normal] (P : Subgroup N)
    (g : G) (i : ambientConjugates N P) :
    ((ambientFactorPerm N P g) i).val = i.val.map (MulAut.conjNormal g).toMonoidHom :=
  rfl

private theorem ambientFactorPerm_eq_one_of_centralizes (N : Subgroup G) [N.Normal]
    (P : Subgroup N) (g : G) (h : ∀ b : N, Commute g (b : G)) :
    ambientFactorPerm N P g = 1 := by
  have hAut : MulAut.conjNormal (H := N) g = 1 := by
    apply MulEquiv.ext
    intro b
    apply Subtype.ext
    change g * (b : G) * g⁻¹ = b
    exact mul_inv_eq_iff_eq_mul.mpr (h b).eq
  apply Equiv.ext
  intro i
  apply Subtype.ext
  change ((ambientFactorPerm N P g) i).val = i.val
  rw [ambientFactorPerm_apply_val, hAut]
  exact Subgroup.map_id _

/-- Each other minimal normal subgroup centralizes the whole chosen
    minimal normal subgroup. Its own elements act trivially on the
    factor indices since the factors are normal in that subgroup. -/
theorem minimalNormalSocle_le_ker_ambientFactorPerm (N : Subgroup G)
    [N.Normal] (hN : IsMinimalNormalSubgroup N) (P : Subgroup N)
    (hNormal : ∀ i : ambientConjugates N P, i.val.Normal) :
    minimalNormalSocle G ≤ (ambientFactorPerm N P).ker := by
  apply iSup_le
  intro M g hg
  apply MonoidHom.mem_ker.mpr
  by_cases hEqual : M.val = N
  · apply Equiv.ext
    intro i
    apply Subtype.ext
    change ((ambientFactorPerm N P g) i).val = i.val
    have hIn : g ∈ N := hEqual ▸ hg
    rw [ambientFactorPerm_apply_val,
      MulAut.conjNormal_val (h := (⟨g, hIn⟩ : N))]
    have : i.val.Normal := hNormal i
    exact Subgroup.Normal.map_conj_eq (H := i.val) _
  · exact ambientFactorPerm_eq_one_of_centralizes N P g (fun b =>
      commute_of_distinct_minimal_normal M.property hN hEqual ⟨g, hg⟩ b)

/-- The permutations of a pair lifting generators of the socle quotient
    generate a subgroup transitive on the actual simple factors. -/
theorem factorPerms_transitive_of_lifts (N : Subgroup G) [N.Normal]
    (hN : IsMinimalNormalSubgroup N) (P : Subgroup N)
    (hNormal : ∀ i : ambientConjugates N P, i.val.Normal)
    (x y : G)
    (hGen : let q := QuotientGroup.mk' (minimalNormalSocle G)
      Subgroup.closure {q x, q y} = ⊤) :
    ∀ i j, ∃ p ∈ Subgroup.closure {ambientFactorPerm N P x, ambientFactorPerm N P y}, p i = j := by
  let q := QuotientGroup.mk' (minimalNormalSocle G)
  let r := ambientFactorPerm N P
  let f := QuotientGroup.lift (minimalNormalSocle G) r
    (minimalNormalSocle_le_ker_ambientFactorPerm N hN P hNormal)
  change Subgroup.closure {q x, q y} = ⊤ at hGen
  have hImg := congrArg (fun H : Subgroup (G ⧸ minimalNormalSocle G) => H.map f) hGen
  rw [MonoidHom.map_closure, Set.image_insert_eq, Set.image_singleton, Subgroup.map_top] at hImg
  change Subgroup.closure {r x, r y} = f.range at hImg
  intro i j
  obtain ⟨g, hg⟩ := ambientConjugates_transitive N P i j
  refine ⟨r g, ?_, Subtype.ext ((ambientFactorPerm_apply_val N P g i).trans hg)⟩
  rw [hImg]
  exact ⟨q g, rfl⟩

/-- Transport the actual conjugation automorphism across the simple
    direct-power isomorphism, then recover its labels on the factors. -/
theorem exists_actual_factor_labels [Finite G]
    (N : Subgroup G) [N.Normal] (P : Subgroup N) [DecidableEq (ambientConjugates N P)]
    (e : (ambientConjugates N P → P) ≃* N)
    (he : ∀ i, (coordinateFactor i).map e.toMonoidHom = i.val) (g : G) :
    ∃ a : ambientConjugates N P → MulAut P,
      MulAut.congr e.symm (MulAut.conjNormal g) = factorAction (ambientFactorPerm N P g) a := by
  have : Finite (Subgroup N) :=
    Finite.of_injective (fun H : Subgroup N => (H : Set N)) SetLike.coe_injective
  apply exists_factorAction_of_maps_factors
  intro i
  let f := (MulAut.congr e.symm (MulAut.conjNormal g)).toMonoidHom
  apply Subgroup.map_injective (f := e.toMonoidHom) e.injective
  rw [Subgroup.map_map]
  have hComp : e.toMonoidHom.comp f = (MulAut.conjNormal (H := N) g).toMonoidHom.comp e.toMonoidHom := by
    apply MonoidHom.ext
    intro a
    change e (e.symm (MulAut.conjNormal (H := N) g (e a))) = _
    exact e.apply_symm_apply _
  change (coordinateFactor i).map (e.toMonoidHom.comp f) =
    (coordinateFactor (ambientFactorPerm N P g i)).map e.toMonoidHom
  rw [hComp, ← Subgroup.map_map, he i, he (ambientFactorPerm N P g i),
    ambientFactorPerm_apply_val]

private theorem transport_inner {A B : Type*} [Group A] [Group B] (e : A ≃* B) (a : A) :
    MulAut.congr e.symm (MulAut.conj (e a)) = MulAut.conj a := by
  apply MulEquiv.ext
  intro b
  change e.symm (e a * e b * (e a)⁻¹) = a * b * a⁻¹
  simp only [map_mul, map_inv, MulEquiv.symm_apply_apply]

/-- Carry out the multifactor lift on the actual minimal normal subgroup,
    with the ordered lifting property for outer labels as the sole
    additional generation input. -/
theorem exists_actual_multifactor_prime_lift [Finite G] (N : Subgroup G)
    [N.Normal] (hN : IsMinimalNormalSubgroup N) (P : Subgroup N)
    [IsSimpleGroup P] [DecidableEq (ambientConjugates N P)] [Nontrivial (ambientConjugates N P)]
    (hNonabel : ¬IsMulCommutative P) (e : (ambientConjugates N P → P) ≃* N)
    (he : ∀ i, (coordinateFactor i).map e.toMonoidHom = i.val)
    (hGenerate : ∀ u v : MulAut P, ∃ u' v' : MulAut P,
      outerProjection u' = outerProjection u ∧ outerProjection v' = outerProjection v ∧
        (MulAut.conj (G := P)).range ≤ Subgroup.closure {u', v'})
    (x₀ g₀ : G)
    (hGen : let q := QuotientGroup.mk' (minimalNormalSocle G)
      Subgroup.closure {q x₀, q g₀ * q x₀ * (q g₀)⁻¹} = ⊤) :
    ∃ u v : N,
      let x := MulAut.conjNormal x₀ * MulAut.conj u
      let g := MulAut.conjNormal g₀ * MulAut.conj v
      primeSpectrum N ⊆ primeSpectrum (Subgroup.closure {x, g * x * g⁻¹}) := by
  have : Finite (Subgroup N) :=
    Finite.of_injective (fun H : Subgroup N => (H : Set N)) SetLike.coe_injective
  have hNormal (i : ambientConjugates N P) : i.val.Normal := by
    rw [← he i]
    exact Subgroup.Normal.map (coordinateFactor_normal i) _ e.surjective
  have hCenter : Subgroup.center P = ⊥ := by
    rcases Subgroup.Normal.eq_bot_or_eq_top (Subgroup.center P) with h | h
    · exact h
    · exact (hNonabel (Subgroup.center_eq_top_iff.mp h)).elim
  let y₀ := g₀ * x₀ * g₀⁻¹
  let perm := ambientFactorPerm N P
  let R := MulAut.congr e.symm
  let act := R.toMonoidHom.comp (MulAut.conjNormal (H := N))
  obtain ⟨x, hx⟩ := exists_actual_factor_labels N P e he x₀
  obtain ⟨y, hy⟩ := exists_actual_factor_labels N P e he y₀
  obtain ⟨g, hg⟩ := exists_actual_factor_labels N P e he g₀
  change act x₀ = factorAction (perm x₀) x at hx
  change act y₀ = factorAction (perm y₀) y at hy
  change act g₀ = factorAction (perm g₀) g at hg
  have hConj : factorAction (perm g₀) g * factorAction (perm x₀) x *
      (factorAction (perm g₀) g)⁻¹ = factorAction (perm y₀) y := by
    rw [← hx, ← hy, ← hg]
    simp only [y₀, map_mul, map_inv]
  have hQ : let q := QuotientGroup.mk' (minimalNormalSocle G)
        Subgroup.closure {q x₀, q y₀} = ⊤ := by
    dsimp only [y₀]
    simpa only [map_mul, map_inv] using hGen
  have hTransitive := factorPerms_transitive_of_lifts N hN P hNormal x₀ y₀ hQ
  obtain ⟨a, b, hAB⟩ := exists_multifactor_lift_in_inner_cosets hCenter
    (perm x₀) (perm y₀) (perm g₀) x y g hConj hTransitive hGenerate
  refine ⟨e a, e b, ?_⟩
  dsimp only
  let A₁ := MulAut.conjNormal (H := N) x₀ * MulAut.conj (e a)
  let B₁ := MulAut.conjNormal (H := N) g₀ * MulAut.conj (e b)
  let H := Subgroup.closure ({A₁, B₁ * A₁ * B₁⁻¹} : Set (MulAut N))
  have hA₁ : R A₁ = factorAction (perm x₀) x * MulAut.conj a := by
    rw [show A₁ = _ * _ from rfl, map_mul, transport_inner]
    exact congrArg (· * MulAut.conj a) hx
  have hB₁ : R B₁ = factorAction (perm g₀) g * MulAut.conj b := by
    rw [show B₁ = _ * _ from rfl, map_mul, transport_inner]
    exact congrArg (· * MulAut.conj b) hg
  have hP : primeSpectrum P ⊆ primeSpectrum (H.map R.toMonoidHom) := by
    unfold H
    rw [MonoidHom.map_closure, Set.image_insert_eq, Set.image_singleton]
    change primeSpectrum P ⊆ primeSpectrum (Subgroup.closure {R A₁, R (B₁ * A₁ * B₁⁻¹)})
    have hY : R (B₁ * A₁ * B₁⁻¹) = R B₁ * R A₁ * (R B₁)⁻¹ := by
      simp only [map_mul, map_inv]
    rw [hY, hA₁, hB₁]
    exact hAB
  change primeSpectrum N ⊆ primeSpectrum H
  have hNP : primeSpectrum N ⊆ primeSpectrum P := by
    intro p hp
    have hp' := primeSpectrum_mono_of_injective e.symm.toMonoidHom e.symm.injective hp
    obtain ⟨i, hi⟩ := Set.mem_iUnion.mp (primeSpectrum_pi_subset (fun _ : ambientConjugates N P => P) hp')
    exact hi
  exact hNP.trans (hP.trans (primeSpectrum_mono_of_surjective _
    (R.toMonoidHom.subgroupMap_surjective H)))

end Shumyatsky
