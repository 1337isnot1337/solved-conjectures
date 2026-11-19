import Conjectures.LonelinessHyperplaneRationalConeFan
import Conjectures.LonelinessHyperplaneHomogeneousBox
import Conjectures.LonelinessHyperplaneFundamentalRemainder

/-!
# Actual relation boxes and their simplicial cone pieces

Finite generation covers every homogenized box point. Conversely, an integer
point in a cone on valid nonnegative generators has nonnegative coordinates
and satisfies every original equation. This identifies each supported box
piece with the actual integer height fiber of its restricted generators.
-/

namespace Loneliness.Hyperplane.RationalCone

open scoped BigOperators

noncomputable section

section Restriction

variable {α V : Type*} [Fintype α] [AddCommGroup V] [Module ℚ V]

theorem mem_supportedCone_iff_subtype (g : α → V) (S : Finset α) (x : V) :
    x ∈ supportedCone g S ↔
      ∃ a : S → ℚ, (∀ i, 0 ≤ a i) ∧ (∑ i : S, a i • g i.1) = x := by
  classical
  constructor
  · rintro ⟨a, ha, hsupp⟩
    refine ⟨fun i => a i.1, fun i => ha.1 i.1, ?_⟩
    exact (Finset.sum_coe_sort S (fun i => a i • g i)).trans
      ((combination_eq_sum_of_supported g S a hsupp).symm.trans ha.2)
  · rintro ⟨a, hapos, ha⟩
    let b : α → ℚ := fun i => if hi : i ∈ S then a ⟨i, hi⟩ else 0
    have hbsupp : Supported S b := by
      intro i hi
      exact dite_eq_right hi
    refine ⟨b, ⟨?_, ?_⟩, hbsupp⟩
    · intro i
      by_cases hi : i ∈ S
      · simpa only [b, dite_eq_left hi] using hapos ⟨i, hi⟩
      · simp only [b, dite_eq_right hi, le_refl]
    · calc
        combination g b = ∑ i ∈ S, b i • g i :=
          combination_eq_sum_of_supported g S b hbsupp
        _ = ∑ i : S, a i • g i.1 := by
          rw [← Finset.sum_coe_sort S (fun i => b i • g i)]
          apply Finset.sum_congr rfl
          intro i _
          simp only [b, dite_eq_left i.2]
        _ = x := ha

end Restriction

section NaturalGenerators

variable {κ : Type*}

def integerGenerator (x : κ → ℕ) : κ → ℤ := fun j => (x j : ℤ)

theorem castVector_integerGenerator (x : κ → ℕ) :
    FundamentalRemainder.castVector (integerGenerator x) = natVector x := by
  ext j
  simp only [FundamentalRemainder.castVector, integerGenerator, natVector,
    Int.cast_natCast]

def restrictedIntegerGenerators (G : Finset (κ → ℕ)) (S : Finset G) :
    S → κ → ℤ := fun i => integerGenerator i.1.1

theorem conePoint_nonneg (G : Finset (κ → ℕ)) (S : Finset G)
    (z : FundamentalRemainder.ConePoint (restrictedIntegerGenerators G S)) (j : κ) :
    0 ≤ z.1 j := by
  obtain ⟨a, ha, heq⟩ := z.2
  have he : (∑ i : S, a i * (i.1.1 j : ℚ)) = (z.1 j : ℚ) := by
    simpa only [FundamentalRemainder.rationalCombination, Finset.sum_apply,
      Pi.smul_apply, smul_eq_mul, FundamentalRemainder.castVector,
      restrictedIntegerGenerators, integerGenerator, Int.cast_natCast] using congrFun heq j
  have hn : (0 : ℚ) ≤ (z.1 j : ℚ) := by
    rw [← he]
    exact Finset.sum_nonneg (fun i _ => mul_nonneg (ha i) (Nat.cast_nonneg _))
  exact_mod_cast hn

def conePointNat (G : Finset (κ → ℕ)) (S : Finset G)
    (z : FundamentalRemainder.ConePoint (restrictedIntegerGenerators G S)) : κ → ℕ :=
  fun j => (z.1 j).toNat

theorem integerGenerator_conePointNat (G : Finset (κ → ℕ)) (S : Finset G)
    (z : FundamentalRemainder.ConePoint (restrictedIntegerGenerators G S)) :
    integerGenerator (conePointNat G S z) = z.1 := by
  ext j
  exact Int.toNat_of_nonneg (conePoint_nonneg G S z j)

theorem castVector_eq_natVector_conePointNat (G : Finset (κ → ℕ)) (S : Finset G)
    (z : FundamentalRemainder.ConePoint (restrictedIntegerGenerators G S)) :
    FundamentalRemainder.castVector z.1 = natVector (conePointNat G S z) := by
  rw [← integerGenerator_conePointNat G S z, castVector_integerGenerator]

theorem conePointNat_mem_supportedCone (G : Finset (κ → ℕ)) (S : Finset G)
    (z : FundamentalRemainder.ConePoint (restrictedIntegerGenerators G S)) :
    natVector (conePointNat G S z) ∈ supportedCone (fun g : G => natVector g.1) S := by
  apply (mem_supportedCone_iff_subtype _ S _).mpr
  obtain ⟨a, ha, heq⟩ := z.2
  refine ⟨a, ha, ?_⟩
  have h := heq.trans (castVector_eq_natVector_conePointNat G S z)
  simpa only [FundamentalRemainder.rationalCombination, restrictedIntegerGenerators,
    castVector_integerGenerator] using h

end NaturalGenerators

section System

variable {ι : Type*} [Fintype ι]

instance closedSystemBox_finite (rows : Set (ι → ℤ)) (N : ℕ) :
    Finite (closedSystemBox rows N) := by
  unfold closedSystemBox
  infer_instance

theorem homogeneousBox_feasible_of_generators
    (rows : Set (ι → ℤ)) (G : Finset (BoxIndex ι → ℕ))
    (hG : AddSubmonoid.closure (G : Set (BoxIndex ι → ℕ)) = homogeneousBoxMonoid rows)
    (x : homogeneousBoxMonoid rows) :
    ∃ a : G → ℚ, Feasible (fun g : G => natVector g.1) (natVector x.1) a := by
  classical
  have hx : x.1 ∈ AddSubmonoid.closure (G : Set (BoxIndex ι → ℕ)) := by
    rw [hG]
    exact x.2
  obtain ⟨n, hn⟩ := AddSubmonoid.mem_closure_finset'.mp hx
  refine ⟨fun i => (n i : ℚ), fun i => Nat.cast_nonneg _, ?_⟩
  ext j
  have hj := congrFun hn j
  simp only [Finset.sum_apply, nsmul_eq_mul] at hj
  simp only [combination, Finset.sum_apply, Pi.smul_apply, smul_eq_mul, natVector]
  exact_mod_cast hj.symm

theorem conePointNat_mem_homogeneousBox
    (rows : Set (ι → ℤ)) (G : Finset (BoxIndex ι → ℕ))
    (hG : ∀ g ∈ G, g ∈ homogeneousBoxMonoid rows)
    (S : Finset G)
    (z : FundamentalRemainder.ConePoint (restrictedIntegerGenerators G S)) :
    conePointNat G S z ∈ homogeneousBoxMonoid rows := by
  obtain ⟨a, ha, _⟩ := conePointNat_mem_supportedCone G S z
  exact homogeneousBox_mem_of_rational_combination rows G hG _ a ha.2

def supportedSystemBox (rows : Set (ι → ℤ))
    (G : Finset (BoxIndex ι → ℕ)) (S : Finset G) (N : ℕ) : Type _ :=
  {v : closedSystemBox rows N //
    natVector (homogeneousLift N v.1) ∈ supportedCone (fun g : G => natVector g.1) S}

def supportedSystemConeFiber (G : Finset (BoxIndex ι → ℕ))
    (S : Finset G) (N : ℕ) : Type _ :=
  {z : FundamentalRemainder.ConePoint (restrictedIntegerGenerators G S) //
    z.1 none = (N : ℤ)}

def supportedSystemBoxToCone (rows : Set (ι → ℤ))
    (G : Finset (BoxIndex ι → ℕ)) (S : Finset G) (N : ℕ) :
    supportedSystemBox rows G S N → supportedSystemConeFiber G S N := by
  intro v
  refine ⟨⟨integerGenerator (homogeneousLift N v.1.1), ?_⟩, rfl⟩
  obtain ⟨a, ha, heq⟩ := (mem_supportedCone_iff_subtype _ S _).mp v.2
  refine ⟨a, ha, ?_⟩
  simpa only [FundamentalRemainder.rationalCombination, restrictedIntegerGenerators,
    castVector_integerGenerator] using heq

theorem supportedSystemBoxToCone_injective (rows : Set (ι → ℤ))
    (G : Finset (BoxIndex ι → ℕ)) (S : Finset G) (N : ℕ) :
    Function.Injective (supportedSystemBoxToCone rows G S N) := by
  intro v w h
  apply Subtype.ext
  apply Subtype.ext
  funext i
  apply Fin.ext
  have he := congrArg
    (fun z : supportedSystemConeFiber G S N => z.1.1 (some (.inl i))) h
  change ((v.1.1 i : ℕ) : ℤ) = ((w.1.1 i : ℕ) : ℤ) at he
  exact_mod_cast he

theorem supportedSystemBoxToCone_surjective (rows : Set (ι → ℤ))
    (G : Finset (BoxIndex ι → ℕ))
    (hG : ∀ g ∈ G, g ∈ homogeneousBoxMonoid rows)
    (S : Finset G) (N : ℕ) :
    Function.Surjective (supportedSystemBoxToCone rows G S N) := by
  intro z
  let n := conePointNat G S z.1
  have hmem : n ∈ homogeneousBoxMonoid rows :=
    conePointNat_mem_homogeneousBox rows G hG S z.1
  have hheight : n none = N := by
    change (z.1.1 none).toNat = N
    rw [z.2, Int.toNat_natCast]
  let p : homogeneousBoxFiber rows N := ⟨⟨n, hmem⟩, hheight⟩
  let v : closedSystemBox rows N := (homogeneousBoxFiberEquiv rows N).symm p
  have hv : homogeneousLift N v.1 = n := by
    have he := (homogeneousBoxFiberEquiv rows N).apply_symm_apply p
    exact congrArg (fun y : homogeneousBoxFiber rows N => y.1.1) he
  have hcone : natVector (homogeneousLift N v.1) ∈
      supportedCone (fun g : G => natVector g.1) S := by
    rw [hv]
    exact conePointNat_mem_supportedCone G S z.1
  refine ⟨⟨v, hcone⟩, ?_⟩
  apply Subtype.ext
  apply Subtype.ext
  change integerGenerator (homogeneousLift N v.1) = z.1.1
  rw [hv]
  exact integerGenerator_conePointNat G S z.1

/-- This equivalence preserves the actual integer point and its actual
height; no lattice-count or saturation premise is added. -/
def supportedSystemBoxEquivConeFiber (rows : Set (ι → ℤ))
    (G : Finset (BoxIndex ι → ℕ))
    (hG : ∀ g ∈ G, g ∈ homogeneousBoxMonoid rows)
    (S : Finset G) (N : ℕ) :
    supportedSystemBox rows G S N ≃ supportedSystemConeFiber G S N :=
  Equiv.ofBijective (supportedSystemBoxToCone rows G S N)
    ⟨supportedSystemBoxToCone_injective rows G S N,
      supportedSystemBoxToCone_surjective rows G hG S N⟩

theorem supportedSystemBox_card_eq (rows : Set (ι → ℤ))
    (G : Finset (BoxIndex ι → ℕ))
    (hG : ∀ g ∈ G, g ∈ homogeneousBoxMonoid rows)
    (S : Finset G) (N : ℕ) :
    Nat.card (supportedSystemBox rows G S N) = Nat.card (supportedSystemConeFiber G S N) :=
  Nat.card_congr (supportedSystemBoxEquivConeFiber rows G hG S N)

end System

end

end Loneliness.Hyperplane.RationalCone
