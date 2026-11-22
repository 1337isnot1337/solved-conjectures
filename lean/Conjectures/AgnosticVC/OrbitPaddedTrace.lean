module

public import Conjectures.AgnosticVC.OrbitClass

/-! One orbit query and repeated negative marker rows recover an ordered coset
selector at arbitrary sample size. -/

@[expose] public section

namespace AgnosticVC

variable {G : Type*} [AddCommGroup G]

/-- The first feature queries the orbit of `x`; the remaining features mark zero. -/
def orbitPaddedFeatures (k : ℕ) (x : G) (i : Fin (k + 2)) : G × Bool :=
  if i = 0 then (x, false) else (0, true)

/-- The singleton positive trace specifies precisely the nonzero parameters in the orbit. -/
theorem orbitPaddedTrace_eq_singleton_iff (Γ : AddSubgroup G) (k : ℕ) (x a : G) :
    sampleTrace (orbitPredict Γ) (orbitPaddedFeatures k x) a = {0} ↔
      x - a ∈ Γ ∧ a ≠ 0 := by
  constructor
  · intro h
    have hfirst : (0 : Fin (k + 2)) ∈ sampleTrace (orbitPredict Γ) (orbitPaddedFeatures k x) a := by
      simp [h]
    have hother : (1 : Fin (k + 2)) ∉ sampleTrace (orbitPredict Γ) (orbitPaddedFeatures k x) a := by
      simp [h]
    refine ⟨?_, ?_⟩
    · simpa [orbitPaddedFeatures] using hfirst
    · intro ha
      apply hother
      simp [orbitPaddedFeatures, ha]
  · rintro ⟨hcoset, hne⟩
    ext i
    by_cases hi : i = 0
    · subst i
      simp [orbitPaddedFeatures, hcoset]
    · simp [orbitPaddedFeatures, hi, Ne.symm hne]

/-- Every orbit has a nonzero representative when the subgroup is nontrivial. -/
theorem orbitPaddedPositive_realized (Γ : AddSubgroup G) [Nontrivial Γ] (k : ℕ) (x : G) :
    ({0} : Finset (Fin (k + 2))) ∈ sampleFamily (orbitPredict Γ) (orbitPaddedFeatures k x) := by
  apply mem_sampleFamily.mpr
  by_cases hx : x = 0
  · subst x
    obtain ⟨γ, hγ⟩ := exists_ne (0 : Γ)
    refine ⟨γ, (orbitPaddedTrace_eq_singleton_iff Γ k _ _).mpr ⟨?_, ?_⟩⟩
    · simp [Γ.neg_mem γ.property]
    · exact fun h => hγ (Subtype.ext h)
  · exact ⟨x, (orbitPaddedTrace_eq_singleton_iff Γ k _ _).mpr ⟨by simp, hx⟩⟩

/-- The first hypothesis with the padded singleton positive trace. -/
noncomputable def orbitPaddedPositiveRep [TraceOrder G] (Γ : AddSubgroup G) [Nontrivial Γ]
    (k : ℕ) (x : G) : G :=
  canonicalRep (orbitPredict Γ) (orbitPaddedFeatures k x)
    ⟨{0}, orbitPaddedPositive_realized Γ k x⟩

theorem orbitPaddedPositiveRep_fit [TraceOrder G] (Γ : AddSubgroup G) [Nontrivial Γ]
    (k : ℕ) (x : G) : x - orbitPaddedPositiveRep Γ k x ∈ Γ ∧
      orbitPaddedPositiveRep Γ k x ≠ 0 :=
  (orbitPaddedTrace_eq_singleton_iff Γ k x _).mp
    (canonicalRep_trace _ _ ⟨_, orbitPaddedPositive_realized Γ k x⟩)

/-- Equivalent orbit queries have the identical allowable parameter set. -/
theorem orbitPaddedPositiveRep_invariant [TraceOrder G] (Γ : AddSubgroup G) [Nontrivial Γ]
    (k : ℕ) {x y : G} (hxy : x - y ∈ Γ) :
    orbitPaddedPositiveRep Γ k x = orbitPaddedPositiveRep Γ k y := by
  apply (canonicalRep_eq_iff (orbitPredict Γ) (orbitPaddedFeatures k x)
    ⟨_, orbitPaddedPositive_realized Γ k x⟩ _).mpr
  have hfit := orbitPaddedPositiveRep_fit Γ k y
  refine ⟨(orbitPaddedTrace_eq_singleton_iff Γ k x _).mpr
    ⟨(orbit_coset_mem_iff Γ hxy).mpr hfit.1, hfit.2⟩, ?_⟩
  intro a ha htrace
  obtain ⟨hm, hn⟩ := (orbitPaddedTrace_eq_singleton_iff Γ k x a).mp htrace
  exact ((canonicalRep_eq_iff (orbitPredict Γ) (orbitPaddedFeatures k y)
    ⟨_, orbitPaddedPositive_realized Γ k y⟩ (orbitPaddedPositiveRep Γ k y)).mp rfl).2 a ha
      ((orbitPaddedTrace_eq_singleton_iff Γ k y a).mpr
        ⟨(orbit_coset_mem_iff Γ hxy).mp hm, hn⟩)

end AgnosticVC
