module

public import Conjectures.ShumyatskyAbelianReduction
public import Conjectures.ShumyatskySingleFactorLift
public import Conjectures.ShumyatskySocleFactorAction
public import Conjectures.ShumyatskyGaschutz

/-! Assemble the exact Kourovka 17.125 statement. The hypotheses are
the four classification-dependent results on automorphisms and
generation of nonabelian finite simple groups used in the written proof. -/

@[expose] public section

namespace Shumyatsky

universe u

/-- The four external finite-simple-group results required by this proof. -/
structure SimpleGroupInputs : Prop where
  outer_solvable : ∀ (S : Type u) [Group S] [Finite S] [IsSimpleGroup S],
    ¬IsMulCommutative S → Group.IsSolvable (MulAut S ⧸ (MulAut.conj (G := S)).range)
  coprime_cyclic : ∀ (S : Type u) [Group S] [Finite S] [IsSimpleGroup S],
    ¬IsMulCommutative S →
    ∀ H : Subgroup (MulAut S), Nat.Coprime (Nat.card S) (Nat.card H) → IsCyclic H
  cyclic_outer_conjugate_generation : ∀ (S : Type u) [Group S] [Finite S] [IsSimpleGroup S],
    ¬IsMulCommutative S → ∀ L : Subgroup (MulAut S), (MulAut.conj (G := S)).range ≤ L →
    IsCyclic (L ⧸ (MulAut.conj (G := S)).range.subgroupOf L) → HasConjugateGenerators L
  two_generated_preimages : ∀ (S : Type u) [Group S] [Finite S] [IsSimpleGroup S],
    ¬IsMulCommutative S → ∀ a b : MulAut S,
    let L := (Subgroup.closure {outerProjection a, outerProjection b}).comap outerProjection
    ∃ x y : L, Subgroup.closure {x, y} = ⊤

variable {S : Type u} [Group S]

/-- Applying Gaschütz to the actual inverse image supplies independent
    lifts of the two outer labels, with every inner automorphism in
    the generated subgroup. -/
theorem exists_outer_pair_lifts_of_two_generated_preimage [Finite S]
    (a b : MulAut S)
    (hGen : let L := (Subgroup.closure {outerProjection a, outerProjection b}).comap outerProjection
      ∃ x y : L, Subgroup.closure {x, y} = ⊤) :
    ∃ x y : MulAut S,
      outerProjection x = outerProjection a ∧ outerProjection y = outerProjection b ∧
        (MulAut.conj (G := S)).range ≤ Subgroup.closure {x, y} := by
  let E := Subgroup.closure {outerProjection a, outerProjection b}
  let L := E.comap outerProjection
  let q : L →* E := (outerProjection.comp L.subtype).codRestrict E fun x => x.property
  let a' : E := ⟨outerProjection a, Subgroup.subset_closure (by simp)⟩
  let b' : E := ⟨outerProjection b, Subgroup.subset_closure (by simp)⟩
  have : Finite (MulAut S) := Finite.of_injective (fun e : MulAut S => (e : S → S))
    DFunLike.coe_injective
  have hQ : Function.Surjective q := by
    intro c
    obtain ⟨z, hz⟩ := QuotientGroup.mk'_surjective (MulAut.conj (G := S)).range (c : _)
    exact ⟨⟨z, show outerProjection z ∈ E from hz.symm ▸ c.property⟩, Subtype.ext hz⟩
  have hPair : Subgroup.closure {a', b'} = ⊤ := by
    apply Subgroup.map_injective (f := E.subtype) E.subtype_injective
    rw [MonoidHom.map_closure, Set.image_insert_eq, Set.image_singleton, Subgroup.map_top,
      E.range_subtype]
    rfl
  obtain ⟨x, y, hx, hy, hTop⟩ := exists_generating_pair_lifts q hQ a' b' hPair hGen
  refine ⟨x, y, congrArg Subtype.val hx, congrArg Subtype.val hy, ?_⟩
  have hL : Subgroup.closure {(x : MulAut S), (y : MulAut S)} = L := by
    have h := congrArg (fun H : Subgroup L => H.map L.subtype) hTop
    rw [MonoidHom.map_closure, Set.image_insert_eq, Set.image_singleton, Subgroup.map_top,
      L.range_subtype] at h
    exact h
  rw [hL]
  intro z hz
  obtain ⟨s, rfl⟩ := MonoidHom.mem_range.mp hz
  change outerProjection (MulAut.conj s) ∈ E
  rw [outerProjection_conj]
  exact E.one_mem

private theorem outer_subgroup_solvable (L : Subgroup (MulAut S))
    [Group.IsSolvable (MulAut S ⧸ (MulAut.conj (G := S)).range)] :
    Group.IsSolvable (L ⧸ (MulAut.conj (G := S)).range.subgroupOf L) := by
  let Inn := (MulAut.conj (G := S)).range
  let f := (outerProjection (S := S)).comp L.subtype
  have hKer : f.ker = Inn.subgroupOf L := by
    unfold f outerProjection
    rw [← MonoidHom.comap_ker, QuotientGroup.ker_mk']
    rfl
  let e : L ⧸ Inn.subgroupOf L ≃* f.range :=
    (QuotientGroup.quotientMulEquivOfEq hKer.symm).trans (QuotientGroup.quotientKerEquivRange f)
  exact Group.isSolvable_of_isSolvable_injective (f := e.toMonoidHom) e.injective

variable {G : Type u} [Group G]

private theorem innerActionInRange_eq_subgroupOf (N : Subgroup G) [N.Normal] :
    innerActionInRange N = (MulAut.conj (G := N)).range.subgroupOf
      (MulAut.conjNormal (H := N)).range := by
  let L := (MulAut.conjNormal (H := N)).range
  change innerActionInRange N = (MulAut.conj (G := N)).range.comap L.subtype
  rw [← map_innerActionInRange_eq_conj_range N,
    Subgroup.comap_map_eq_self_of_injective L.subtype_injective]

private theorem single_factor_lift_of_inputs [Finite G] (hInputs : SimpleGroupInputs.{u})
    (N : Subgroup G) [N.Normal] [IsSimpleGroup N] (hN : IsMinimalNormalSubgroup N)
    (hNonabel : ¬IsMulCommutative N) (hMin : PrimeSpectrumMinimal G) (x₀ g₀ : G)
    (hGen : let q := QuotientGroup.mk' (minimalNormalSocle G)
      Subgroup.closure {q x₀, q g₀ * q x₀ * (q g₀)⁻¹} = ⊤) :
    ∃ u v : N,
      let x := MulAut.conjNormal x₀ * MulAut.conj u
      let g := MulAut.conjNormal g₀ * MulAut.conj v
      primeSpectrum N ⊆ primeSpectrum (Subgroup.closure {x, g * x * g⁻¹}) := by
  let L := (MulAut.conjNormal (H := N)).range
  have hInn : (MulAut.conj (G := N)).range ≤ L := by
    rw [← map_innerActionInRange_eq_conj_range N]
    intro a ha
    obtain ⟨b, _, rfl⟩ := Subgroup.mem_map.mp ha
    exact b.property
  have : Group.IsSolvable (MulAut N ⧸ (MulAut.conj (G := N)).range) :=
    hInputs.outer_solvable N hNonabel
  let e := QuotientGroup.quotientMulEquivOfEq (innerActionInRange_eq_subgroupOf N)
  have : Group.IsSolvable (L ⧸ (MulAut.conj (G := N)).range.subgroupOf L) :=
    outer_subgroup_solvable L
  apply exists_single_factor_prime_lift_of_automorphism_inputs N hN hNonabel hMin
    _ (hInputs.coprime_cyclic N hNonabel) _ x₀ g₀ hGen
  · exact Group.isSolvable_of_isSolvable_injective (f := e.toMonoidHom) e.injective
  · intro hCyclic
    exact hInputs.cyclic_outer_conjugate_generation N hNonabel L hInn (e.isCyclic.mp hCyclic)

private theorem factor_lift_of_inputs [Finite G] (hInputs : SimpleGroupInputs.{u})
    (N : Subgroup G) [N.Normal] (hN : IsMinimalNormalSubgroup N)
    (hNonabel : ¬IsMulCommutative N) (hMin : PrimeSpectrumMinimal G) (x₀ g₀ : G)
    (hGen : let q := QuotientGroup.mk' (minimalNormalSocle G)
      Subgroup.closure {q x₀, q g₀ * q x₀ * (q g₀)⁻¹} = ⊤) :
    ∃ u v : N,
      let x := MulAut.conjNormal x₀ * MulAut.conj u
      let g := MulAut.conjNormal g₀ * MulAut.conj v
      primeSpectrum N ⊆ primeSpectrum (Subgroup.closure {x, g * x * g⁻¹}) := by
  obtain ⟨P, hSimple, hPNonabel, e, he⟩ :=
    exists_nonabelian_simple_power_of_minimal_normal hN hNonabel
  let I := ambientConjugates N P
  let : DecidableEq I := Classical.decEq I
  have : IsSimpleGroup P := hSimple
  rcases subsingleton_or_nontrivial I with hOne | hMany
  · let i₀ : I := ⟨_, ⟨1, rfl⟩⟩
    let eval : (I → P) ≃* P :=
      { toFun := fun a => a i₀
        invFun := fun a _ => a
        left_inv := fun a => funext fun i => congrArg a (hOne.elim i₀ i)
        right_inv := fun _ => rfl
        map_mul' := fun _ _ => rfl }
    have : IsSimpleGroup N := (e.symm.trans eval).isSimpleGroup
    exact single_factor_lift_of_inputs hInputs N hN hNonabel hMin x₀ g₀ hGen
  · have : Nontrivial I := hMany
    exact exists_actual_multifactor_prime_lift N hN P hPNonabel e he
      (fun a b => exists_outer_pair_lifts_of_two_generated_preimage a b
        (hInputs.two_generated_preimages P hPNonabel a b)) x₀ g₀ hGen

/-- Every finite prime-spectrum-minimal group has conjugate generators
    from the four stated finite-simple-group inputs. -/
theorem minimal_conjugate_generation_of_simple_group_inputs (hInputs : SimpleGroupInputs.{u})
    (G : Type u) [Group G] [Finite G] (hMin : PrimeSpectrumMinimal G) :
    HasConjugateGenerators G := by
  classical
  let P (n : ℕ) := ∀ (A : Type u) [Group A] [Finite A],
    Nat.card A = n → PrimeSpectrumMinimal A → HasConjugateGenerators A
  have hAll (n : ℕ) : P n := by
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro A _ _ hCard hMinimal
      have hQuotient (N : Subgroup A) [N.Normal] (hN : N ≠ ⊥) :
          let q := QuotientGroup.mk' N
          ∃ x g : A, Subgroup.closure {q x, q g * q x * (q g)⁻¹} = ⊤ := by
        let q := QuotientGroup.mk' N
        have hSurj := QuotientGroup.mk'_surjective N
        have hSmall : Nat.card (A ⧸ N) < n := by
          calc
            Nat.card (A ⧸ N) = Nat.card (A ⧸ N) * 1 := (mul_one _).symm
            _ < Nat.card (A ⧸ N) * Nat.card N :=
              Nat.mul_lt_mul_of_pos_left ((N.one_lt_card_iff_ne_bot).mpr hN) Nat.card_pos
            _ = Nat.card A := (Subgroup.card_eq_card_quotient_mul_card_subgroup N).symm
            _ = n := hCard
        obtain ⟨a, b, hGen⟩ := ih _ hSmall (A ⧸ N) rfl (hMinimal.of_surjective q hSurj)
        obtain ⟨x, hx⟩ := hSurj a
        obtain ⟨g, hg⟩ := hSurj b
        refine ⟨x, g, ?_⟩
        rwa [hx, hg]
      rcases subsingleton_or_nontrivial A with hTriv | hNontrivial
      · have : Subsingleton A := hTriv
        exact ⟨1, 1, Subsingleton.elim _ _⟩
      have : Nontrivial A := hNontrivial
      by_cases hAbel : ∃ N : Subgroup A, IsMinimalNormalSubgroup N ∧ IsMulCommutative N
      · obtain ⟨N, hN, hAbel⟩ := hAbel
        have : N.Normal := hN.normal
        have : IsMulCommutative N := hAbel
        obtain ⟨x, g, hGen⟩ := hQuotient N hN.neBot
        exact exists_lift_across_abelian_minimal_normal N hN hMinimal x g hGen
      have hNonabel (N : Subgroup A) (hN : IsMinimalNormalSubgroup N) : ¬IsMulCommutative N :=
        fun he => hAbel ⟨N, hN, he⟩
      obtain ⟨x, g, hGen⟩ := hQuotient (minimalNormalSocle A) minimalNormalSocle_ne_bot
      obtain ⟨a, b, _, _, hAB⟩ := exists_generating_pair_of_socle_factor_lifts hMinimal
        hNonabel x g hGen (fun N => by
          let : N.val.Normal := N.property.normal
          exact factor_lift_of_inputs hInputs N.val N.property (hNonabel N.val N.property)
            hMinimal x g hGen)
      exact ⟨a, b, hAB⟩
  exact hAll (Nat.card G) G rfl hMin

/-- The exact statement of Kourovka Notebook 17.125, from the explicitly
    stated classification-dependent automorphism and generation results. -/
theorem conjugate_prime_spectrum_of_simple_group_inputs (hInputs : SimpleGroupInputs.{u})
    (G : Type u) [Group G] [Finite G] :
    ∃ a b : G, IsConj a b ∧ primeSpectrum (Subgroup.closure {a, b}) = primeSpectrum G := by
  apply conjecture_of_minimal _ G
  intro H _ _ hMin
  obtain ⟨x, g, hGen⟩ := minimal_conjugate_generation_of_simple_group_inputs hInputs H hMin
  exact ⟨x, g * x * g⁻¹, isConj_iff.mpr ⟨g, rfl⟩, hGen⟩

end Shumyatsky
