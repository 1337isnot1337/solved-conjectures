import Conjectures.LonelinessHyperplaneSystemCone
import Conjectures.LonelinessHyperplaneFundamentalRemainderCounting
import Conjectures.LonelinessHyperplaneQuasipolynomialDegree
import Mathlib.Combinatorics.Enumerative.InclusionExclusion

/-!
# Exact positive-height counts for any system of integer relations

The actual finite box is covered by its optimal-support pieces. Their actual
intersections are simplicial cone fibers, so finite inclusion-exclusion and
the fundamental-remainder formulas give a quasipolynomial for every N ≥ 1.
Empty supports contribute zero at positive height. A literal box-size bound
then gives the ambient degree bound for the same polynomials.
-/

namespace Loneliness.Hyperplane.RationalCone

open scoped BigOperators
open QuasipolynomialArithmetic

noncomputable section

variable {ι : Type*} [Fintype ι]

def boxHeightCoefficients : BoxIndex ι → ℤ := by
  classical
  exact Pi.single none 1

theorem height_boxHeightCoefficients (x : BoxIndex ι → ℤ) :
    FundamentalRemainder.height boxHeightCoefficients x = x none := by
  classical
  simp [FundamentalRemainder.height, boxHeightCoefficients]

def systemConeFiberEquivHeightFiber (G : Finset (BoxIndex ι → ℕ))
    (S : Finset G) (N : ℕ) :
    supportedSystemConeFiber G S N ≃
      FundamentalRemainder.HeightFiber (restrictedIntegerGenerators G S)
        boxHeightCoefficients N :=
  (Equiv.refl _).subtypeEquiv (fun z => by
    change z.1 none = (N : ℤ) ↔
      FundamentalRemainder.height boxHeightCoefficients z.1 = (N : ℤ)
    rw [height_boxHeightCoefficients])

theorem supportedSystemBox_card_eq_heightFiber (rows : Set (ι → ℤ))
    (G : Finset (BoxIndex ι → ℕ))
    (hG : ∀ g ∈ G, g ∈ homogeneousBoxMonoid rows)
    (S : Finset G) (N : ℕ) :
    Nat.card (supportedSystemBox rows G S N) =
      Nat.card (FundamentalRemainder.HeightFiber (restrictedIntegerGenerators G S)
        boxHeightCoefficients N) :=
  (supportedSystemBox_card_eq rows G hG S N).trans
    (Nat.card_congr (systemConeFiberEquivHeightFiber G S N))

theorem supportedSystemBox_quasipolynomial_on_positive
    (rows : Set (ι → ℤ)) (G : Finset (BoxIndex ι → ℕ))
    (hG : ∀ g ∈ G, g ∈ homogeneousBoxMonoid rows ∧ 0 < g none)
    (S : Finset G)
    (hli : LinearIndepOn ℚ (fun g : G => natVector g.1) (S : Set G)) :
    ∃ q : ℕ → ℚ, IsQuasipolynomial q G.card ∧
      ∀ N : ℕ, 0 < N → q N = (Nat.card (supportedSystemBox rows G S N) : ℚ) := by
  classical
  by_cases hS : S.Nonempty
  · obtain ⟨i, hi⟩ := hS
    let : Nonempty S := ⟨⟨i, hi⟩⟩
    have hli' : LinearIndependent ℚ (fun i : S =>
        FundamentalRemainder.castVector (restrictedIntegerGenerators G S i)) := by
      let e : S → (S : Set G) := fun i => ⟨i.1, i.2⟩
      have he : Function.Injective e := by
        intro i j h
        exact Subtype.ext (congrArg Subtype.val h)
      simpa only [Function.comp_def, e, restrictedIntegerGenerators,
        castVector_integerGenerator] using hli.linearIndependent.comp e he
    have hheight : ∀ i : S, 0 < FundamentalRemainder.height boxHeightCoefficients
        (restrictedIntegerGenerators G S i) := by
      intro i
      rw [height_boxHeightCoefficients]
      change (0 : ℤ) < (i.1.1 none : ℤ)
      exact_mod_cast (hG i.1.1 i.1.2).2
    have hcard : Fintype.card S ≤ G.card := by
      simpa only [Fintype.card_coe] using
        Fintype.card_subtype_le (fun g : G => g ∈ S)
    refine ⟨fun N => (Nat.card (FundamentalRemainder.HeightFiber
      (restrictedIntegerGenerators G S) boxHeightCoefficients N) : ℚ), ?_, ?_⟩
    · exact (FundamentalRemainder.heightFiber_isQuasipolynomial
        (restrictedIntegerGenerators G S) hli' boxHeightCoefficients hheight).mono_degree
          ((Nat.sub_le _ _).trans hcard)
    · intro N _
      exact congrArg (fun n : ℕ => (n : ℚ))
        (supportedSystemBox_card_eq_heightFiber rows G (fun g hg => (hG g hg).1) S N).symm
  · have hSempty : S = ∅ := Finset.not_nonempty_iff_eq_empty.mp hS
    subst S
    refine ⟨fun _ => 0, ?_, ?_⟩
    · refine ⟨1, by decide, fun _ => 0, ?_, ?_⟩
      · intro r
        simp only [Polynomial.natDegree_zero]
        exact Nat.zero_le _
      · intro r n
        simp only [Polynomial.eval_zero]
    · intro N hN
      rw [supportedSystemBox_card_eq_heightFiber rows G (fun g hg => (hG g hg).1),
        FundamentalRemainder.heightFiber_card_of_isEmpty,
        ite_eq_right (Nat.ne_of_gt hN), Nat.cast_zero]

def systemFanFamilies (G : Finset (BoxIndex ι → ℕ)) (c : G → ℚ) :
    Finset (Finset (Finset G)) := by
  classical
  exact (admissibleSupports (fun g : G => natVector g.1) c).powerset.filter (·.Nonempty)

omit [Fintype ι] in
theorem systemFanFamily_nonempty (G : Finset (BoxIndex ι → ℕ)) (c : G → ℚ)
    (J : systemFanFamilies G c) : J.1.Nonempty :=
  (Finset.mem_filter.mp J.2).2

omit [Fintype ι] in
theorem systemFanFamily_subset (G : Finset (BoxIndex ι → ℕ)) (c : G → ℚ)
    (J : systemFanFamilies G c) :
    J.1 ⊆ admissibleSupports (fun g : G => natVector g.1) c :=
  Finset.mem_powerset.mp (Finset.mem_filter.mp J.2).1

omit [Fintype ι] in
theorem systemFanFamily_admissible (G : Finset (BoxIndex ι → ℕ)) (c : G → ℚ)
    (J : systemFanFamilies G c) :
    AdmissibleSupport (fun g : G => natVector g.1) c (intersectionSupport J.1) :=
  intersectionSupport_admissible _ c J.1 (systemFanFamily_nonempty G c J)
    (fun S hS => (mem_admissibleSupports _ c S).mp (systemFanFamily_subset G c J hS))

/-- Inclusion-exclusion is applied to subsets of the actual closed box.
Its intersections are identified with actual supported solution types. -/
theorem closedSystemBox_card_inclusion_exclusion
    (rows : Set (ι → ℤ)) (G : Finset (BoxIndex ι → ℕ))
    (hclosure : AddSubmonoid.closure (G : Set (BoxIndex ι → ℕ)) = homogeneousBoxMonoid rows)
    (hpositive : ∀ g ∈ G, 0 < g none)
    (c : G → ℚ) (hc : GenericCost (fun g : G => natVector g.1) c) (N : ℕ) :
    (Nat.card (closedSystemBox rows N) : ℚ) =
      ∑ J : systemFanFamilies G c, (-1 : ℚ) ^ (J.1.card + 1) *
        (Nat.card (supportedSystemBox rows G (intersectionSupport J.1) N) : ℚ) := by
  classical
  let : Fintype (closedSystemBox rows N) := Fintype.ofFinite _
  let g : G → BoxIndex ι → ℚ := fun i => natVector i.1
  let F := admissibleSupports g c
  let piece : Finset G → Finset (closedSystemBox rows N) := fun S =>
    Finset.univ.filter (fun v => natVector (homogeneousLift N v.1) ∈ supportedCone g S)
  have hcover : F.biUnion piece = Finset.univ := by
    ext v
    simp only [Finset.mem_biUnion, Finset.mem_univ, iff_true]
    obtain ⟨a, ha⟩ := homogeneousBox_feasible_of_generators rows G hclosure
      ⟨homogeneousLift N v.1, homogeneousLift_mem rows N v⟩
    have hheight : ∀ i : G, 0 < (LinearMap.proj none : (BoxIndex ι → ℚ) →ₗ[ℚ] ℚ) (g i) := by
      intro i
      change (0 : ℚ) < (i.1 none : ℚ)
      exact_mod_cast hpositive i.1 i.2
    obtain ⟨S, hS, hv⟩ := (feasible_iff_mem_admissibleSupport g
      (LinearMap.proj none) hheight c (natVector (homogeneousLift N v.1))).mp ⟨a, ha⟩
    exact ⟨S, hS, Finset.mem_filter.mpr ⟨Finset.mem_univ v, hv⟩⟩
  have hinter (J : systemFanFamilies G c) :
      Nat.card (supportedSystemBox rows G (intersectionSupport J.1) N) =
        (J.1.inf' (systemFanFamily_nonempty G c J) piece).card := by
    apply Nat.subtype_card
    intro v
    simpa only [Finset.mem_inf', piece, Finset.mem_filter, Finset.mem_univ, true_and] using
      (mem_supportedCone_intersectionSupport_iff g c hc J.1
        (systemFanFamily_nonempty G c J)
        (fun S hS => (mem_admissibleSupports _ c S).mp (systemFanFamily_subset G c J hS))
        (natVector (homogeneousLift N v.1))).symm
  have hIE := Finset.inclusion_exclusion_card_biUnion F piece
  rw [hcover, Finset.card_univ] at hIE
  have hI : (Fintype.card (closedSystemBox rows N) : ℤ) =
      ∑ J : systemFanFamilies G c, (-1 : ℤ) ^ (J.1.card + 1) *
        ((J.1.inf' (systemFanFamily_nonempty G c J) piece).card : ℤ) := by
    exact hIE
  calc
    _ = ∑ J : systemFanFamilies G c, (-1 : ℚ) ^ (J.1.card + 1) *
        ((J.1.inf' (systemFanFamily_nonempty G c J) piece).card : ℚ) := by
      rw [Nat.card_eq_fintype_card]
      exact_mod_cast hI
    _ = _ := by
      apply Finset.sum_congr rfl
      intro J _
      rw [← hinter J]

/-- Exact positive-N quasipolynomiality derived from the finite generators
of the original integer equation system. -/
theorem closedSystemBox_exists_quasipolynomial_on_positive (rows : Set (ι → ℤ)) :
    ∃ d : ℕ, ∃ q : ℕ → ℚ, IsQuasipolynomial q d ∧
      ∀ N : ℕ, 0 < N → q N = (Nat.card (closedSystemBox rows N) : ℚ) := by
  classical
  obtain ⟨G, hclosure, hG⟩ := exists_positive_height_generators rows
  obtain ⟨c, hc⟩ := exists_genericCost (fun g : G => natVector g.1)
  have hpiece (J : systemFanFamilies G c) :
      ∃ q : ℕ → ℚ, IsQuasipolynomial q G.card ∧
        ∀ N : ℕ, 0 < N → q N =
          (Nat.card (supportedSystemBox rows G (intersectionSupport J.1) N) : ℚ) :=
    supportedSystemBox_quasipolynomial_on_positive rows G hG (intersectionSupport J.1)
      (admissibleSupport_independent _ c hc _ (systemFanFamily_admissible G c J))
  choose q hq heq using hpiece
  refine ⟨G.card, fun N => ∑ J : systemFanFamilies G c,
    (-1 : ℚ) ^ (J.1.card + 1) * q J N, ?_, ?_⟩
  · exact IsQuasipolynomial.finite_linear_combination q
      (fun J => (-1 : ℚ) ^ (J.1.card + 1)) G.card hq
  · intro N hN
    rw [closedSystemBox_card_inclusion_exclusion rows G hclosure
      (fun g hg => (hG g hg).2) c hc N]
    apply Finset.sum_congr rfl
    intro J _
    rw [heq J N hN]

theorem closedSystemBox_card_le (rows : Set (ι → ℤ)) (N : ℕ) :
    Nat.card (closedSystemBox rows N) ≤ (N + 1) ^ Fintype.card ι := by
  classical
  let : Fintype (closedSystemBox rows N) := Fintype.ofFinite _
  have h := Fintype.card_le_of_injective
    (fun v : closedSystemBox rows N => v.1) Subtype.val_injective
  simpa only [Nat.card_eq_fintype_card, Fintype.card_fun, Fintype.card_fin] using h

/-- The ambient degree bound follows from the literal box cardinality;
no geometric dimension or rank formula is assumed. -/
theorem closedSystemBox_quasipolynomial_on_positive (rows : Set (ι → ℤ)) :
    ∃ q : ℕ → ℚ, IsQuasipolynomial q (Fintype.card ι) ∧
      ∀ N : ℕ, 0 < N → q N = (Nat.card (closedSystemBox rows N) : ℚ) := by
  obtain ⟨d, q, hq, heq⟩ := closedSystemBox_exists_quasipolynomial_on_positive rows
  refine ⟨q, hq.degree_of_power_bound (2 ^ Fintype.card ι) (Fintype.card ι) ?_, heq⟩
  intro N hN
  rw [heq N hN, abs_of_nonneg (Nat.cast_nonneg _)]
  have hsize : N + 1 ≤ 2 * N := by omega
  have hb : Nat.card (closedSystemBox rows N) ≤
      2 ^ Fintype.card ι * N ^ Fintype.card ι := by
    calc
      _ ≤ (N + 1) ^ Fintype.card ι := closedSystemBox_card_le rows N
      _ ≤ (2 * N) ^ Fintype.card ι := Nat.pow_le_pow_left hsize _
      _ = _ := Nat.mul_pow _ _ _
  exact_mod_cast hb

end

end Loneliness.Hyperplane.RationalCone
