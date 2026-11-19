import Conjectures.LonelinessHyperplaneRationalConeOptimalExistence

/-!
# A finite simplicial cover from rational optimal supports

Positive height supplies an optimizer for every feasible point. A generic
cost makes its support independent and its coefficients unique. This gives
a finite cover whose nonempty intersections are the cones on the literal
intersections of their supports. Empty supports are retained.
-/

namespace Loneliness.Hyperplane.RationalCone

noncomputable section

variable {ι V : Type*} [Fintype ι]
variable [AddCommGroup V] [Module ℚ V]

def admissibleSupports (g : ι → V) (c : ι → ℚ) : Finset (Finset ι) := by
  classical
  exact Finset.univ.filter (AdmissibleSupport g c)

@[simp] theorem mem_admissibleSupports (g : ι → V) (c : ι → ℚ) (S : Finset ι) :
    S ∈ admissibleSupports g c ↔ AdmissibleSupport g c S := by
  classical
  simp only [admissibleSupports, Finset.mem_filter, Finset.mem_univ, true_and]

/-- Restricting the support of an optimum produces another admissible
support. The new represented point is the sum of the chosen generators. -/
theorem AdmissibleSupport.mono (g : ι → V) (c : ι → ℚ)
    {S T : Finset ι} (hS : AdmissibleSupport g c S) (hTS : T ⊆ S) :
    AdmissibleSupport g c T := by
  classical
  obtain ⟨x, a, ha, hsupport⟩ := hS
  let b : ι → ℚ := fun i => if i ∈ T then 1 else 0
  have hbnonneg : ∀ i, 0 ≤ b i := by
    intro i
    simp only [b]
    split_ifs <;> norm_num
  have hbT : coefficientSupport b = T := by
    ext i
    simp [coefficientSupport, b]
  have hbS : Supported S b := by
    intro i hi
    have hiT : i ∉ T := fun h => hi (hTS h)
    exact ite_eq_right hiT
  have hb : Feasible g (combination g b) b := ⟨hbnonneg, rfl⟩
  have hopt := Optimal.supported_optimal g c x (combination g b) a b ha hb
    (by simpa only [hsupport] using hbS)
  exact ⟨combination g b, b, hopt, hbT⟩

theorem admissibleSupport_independent (g : ι → V) (c : ι → ℚ)
    (hc : GenericCost g c) (S : Finset ι) (hS : AdmissibleSupport g c S) :
    LinearIndepOn ℚ g (S : Set ι) := by
  obtain ⟨x, a, ha, hsupport⟩ := hS
  simpa only [hsupport] using optimal_support_independent g c hc x a ha

theorem feasible_iff_mem_admissibleSupport
    (g : ι → V) (height : V →ₗ[ℚ] ℚ)
    (hheight : ∀ i, 0 < height (g i)) (c : ι → ℚ) (x : V) :
    (∃ a : ι → ℚ, Feasible g x a) ↔
      ∃ S ∈ admissibleSupports g c, x ∈ supportedCone g S := by
  classical
  constructor
  · rintro ⟨a, ha⟩
    obtain ⟨S, hS, hx⟩ := exists_admissibleSupport_of_feasible g height hheight c x a ha
    exact ⟨S, (mem_admissibleSupports g c S).mpr hS, hx⟩
  · rintro ⟨S, _, a, ha, _⟩
    exact ⟨a, ha⟩

def intersectionSupport (J : Finset (Finset ι)) : Finset ι := by
  classical
  exact Finset.univ.filter (fun i => ∀ S ∈ J, i ∈ S)

@[simp] theorem mem_intersectionSupport (J : Finset (Finset ι)) (i : ι) :
    i ∈ intersectionSupport J ↔ ∀ S ∈ J, i ∈ S := by
  classical
  simp only [intersectionSupport, Finset.mem_filter, Finset.mem_univ, true_and]

theorem intersectionSupport_subset (J : Finset (Finset ι))
    (S : Finset ι) (hS : S ∈ J) : intersectionSupport J ⊆ S := by
  intro i hi
  exact (mem_intersectionSupport J i).mp hi S hS

theorem intersectionSupport_admissible (g : ι → V) (c : ι → ℚ)
    (J : Finset (Finset ι)) (hne : J.Nonempty)
    (hJ : ∀ S ∈ J, AdmissibleSupport g c S) :
    AdmissibleSupport g c (intersectionSupport J) := by
  obtain ⟨S, hS⟩ := hne
  exact AdmissibleSupport.mono g c (hJ S hS) (intersectionSupport_subset J S hS)

/-- A nonempty intersection uses one feasible coefficient vector: generic
optimality forces all the individual cone representations to coincide. -/
theorem mem_supportedCone_intersectionSupport_iff
    (g : ι → V) (c : ι → ℚ) (hc : GenericCost g c)
    (J : Finset (Finset ι)) (hne : J.Nonempty)
    (hJ : ∀ S ∈ J, AdmissibleSupport g c S) (x : V) :
    x ∈ supportedCone g (intersectionSupport J) ↔
      ∀ S ∈ J, x ∈ supportedCone g S := by
  classical
  constructor
  · rintro ⟨a, ha, hsupp⟩ S hS
    refine ⟨a, ha, ?_⟩
    intro i hi
    exact hsupp i (fun h => hi (intersectionSupport_subset J S hS h))
  · intro hx
    obtain ⟨S₀, hS₀⟩ := hne
    obtain ⟨a, ha, hasupp⟩ := hx S₀ hS₀
    have hoptimal (S : Finset ι) (hS : S ∈ J) (b : ι → ℚ)
        (hb : Feasible g x b) (hbsupp : Supported S b) : Optimal g c x b := by
      obtain ⟨y, z, hz, hzsupp⟩ := hJ S hS
      exact Optimal.supported_optimal g c y x z b hz hb
        (by simpa only [hzsupp] using hbsupp)
    have haopt := hoptimal S₀ hS₀ a ha hasupp
    refine ⟨a, ha, ?_⟩
    intro i hi
    have hmissing : ∃ S ∈ J, i ∉ S := by
      by_contra h
      apply hi
      apply (mem_intersectionSupport J i).mpr
      intro S hS
      by_contra his
      exact h ⟨S, hS, his⟩
    obtain ⟨S, hS, his⟩ := hmissing
    obtain ⟨b, hb, hbsupp⟩ := hx S hS
    have hab := optimal_unique g c hc x a b haopt (hoptimal S hS b hb hbsupp)
    rw [hab]
    exact hbsupp i his

/-- All geometric inputs for the finite cone decomposition are derived from
the original generators and their positive height. -/
theorem exists_finite_simplicial_cover_of_positive_height
    (g : ι → V) (height : V →ₗ[ℚ] ℚ)
    (hheight : ∀ i, 0 < height (g i)) :
    ∃ c : ι → ℚ, GenericCost g c ∧
      (∀ S ∈ admissibleSupports g c, LinearIndepOn ℚ g (S : Set ι)) ∧
      (∀ x : V, (∃ a : ι → ℚ, Feasible g x a) ↔
        ∃ S ∈ admissibleSupports g c, x ∈ supportedCone g S) ∧
      ∀ (J : Finset (Finset ι)), J.Nonempty → J ⊆ admissibleSupports g c →
        AdmissibleSupport g c (intersectionSupport J) ∧
        LinearIndepOn ℚ g (intersectionSupport J : Set ι) ∧
        ∀ x : V, x ∈ supportedCone g (intersectionSupport J) ↔
          ∀ S ∈ J, x ∈ supportedCone g S := by
  classical
  obtain ⟨c, hc⟩ := exists_genericCost g
  refine ⟨c, hc, ?_, feasible_iff_mem_admissibleSupport g height hheight c, ?_⟩
  · intro S hS
    exact admissibleSupport_independent g c hc S ((mem_admissibleSupports g c S).mp hS)
  · intro J hne hJ
    have hJA : ∀ S ∈ J, AdmissibleSupport g c S := fun S hS =>
      (mem_admissibleSupports g c S).mp (hJ hS)
    have hA := intersectionSupport_admissible g c J hne hJA
    exact ⟨hA, admissibleSupport_independent g c hc _ hA,
      mem_supportedCone_intersectionSupport_iff g c hc J hne hJA⟩

end

end Loneliness.Hyperplane.RationalCone
