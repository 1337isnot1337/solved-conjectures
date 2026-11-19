module

public import Conjectures.FranklLocalMaskCertificate
public import Conjectures.FranklLocalFiniteSupport

/-! The mask computation is equivalent to the original local certificate.
Exact domain coverage preserves every boundary condition and the positive
weight condition. Injective maps on the actual finite local support then
transport the computation through the existing distinct-pattern semantics. -/
@[expose] public section

namespace FranklLocal

open scoped BigOperators

variable {α β : Type*} [DecidableEq α] [DecidableEq β]

theorem certificateCheck_of_weightCertificate {G : Finset (Finset α)}
    {W : Finset α} {w : α → ℕ}
    (hc : WeightCertificate G W (fun x => (w x : ℝ)))
    (hpositive : ∃ x ∈ W, 0 < w x) : certificateCheck G W w = true := by
  apply Bool.and_eq_true_iff.mpr
  refine ⟨decide_eq_true hpositive, decide_eq_true ?_⟩
  intro E hE M hM
  have h := hc E M (Finset.mem_powerset.mp hM) (Finset.mem_powerset.mp hE)
  have hcast : (0 : ℝ) ≤
      ((∑ S ∈ compatible G W E M, integerImbalance W w S : ℤ) : ℝ) := by
    simpa only [Int.cast_sum, integerImbalance_cast] using h
  exact_mod_cast hcast

theorem certificateCheck_iff_weightCertificate {G : Finset (Finset α)}
    {W : Finset α} {w : α → ℕ} : certificateCheck G W w = true ↔
      (∃ x ∈ W, 0 < w x) ∧ WeightCertificate G W (fun x => (w x : ℝ)) := by
  constructor
  · intro hc
    exact ⟨of_decide_eq_true (Bool.and_eq_true_iff.mp hc).1,
      certificateCheck_weightCertificate hc⟩
  · rintro ⟨hpositive, hc⟩
    exact certificateCheck_of_weightCertificate hc hpositive

theorem localGenerators_idem (G : Finset (Finset α)) (W : Finset α) :
    localGenerators (localGenerators G W) W = localGenerators G W := by
  ext g
  simp [localGenerators]

theorem certificateCheck_localGenerators (G : Finset (Finset α)) (W : Finset α)
    (w : α → ℕ) :
    certificateCheck (localGenerators G W) W w = certificateCheck G W w :=
  certificateCheck_locality _ _ _ _ (localGenerators_idem G W)

/-- Natural-weight certificates retain positivity under a map that is
injective only on the specified finite generator and window support. -/
theorem certificateCheck_image_on {G : Finset (Finset α)} {W : Finset α}
    {w : α → ℕ} (hc : certificateCheck G W w = true) (A : Finset α)
    (hG : ∀ g ∈ G, g ⊆ A) (hW : W ⊆ A)
    (f : α → β) (hf : Set.InjOn f A) (v : β → ℕ)
    (hv : ∀ x ∈ W, v (f x) = w x) :
    certificateCheck (imageFamily f G) (W.image f) v = true := by
  apply certificateCheck_of_weightCertificate
  · exact (certificateCheck_weightCertificate hc).image_on A hG hW f hf
      (fun y => (v y : ℝ)) (by
        intro x hx
        exact_mod_cast hv x hx)
  · obtain ⟨x, hx, hpositive⟩ := of_decide_eq_true (Bool.and_eq_true_iff.mp hc).1
    exact ⟨f x, Finset.mem_image_of_mem f hx, by simpa only [hv x hx] using hpositive⟩

/-- Generators disjoint from the window do not enter a local certificate.
Only the exact image of the local generator family is required here. -/
theorem certificateCheck_image_on_local
    {G : Finset (Finset α)} {H : Finset (Finset β)}
    {W : Finset α} {V : Finset β} {w : α → ℕ} {v : β → ℕ}
    (hc : certificateCheck G W w = true) (A : Finset α)
    (hG : ∀ g ∈ localGenerators G W, g ⊆ A) (hW : W ⊆ A)
    (f : α → β) (hf : Set.InjOn f A)
    (hGimage : imageFamily f (localGenerators G W) = localGenerators H V)
    (hWimage : W.image f = V) (hv : ∀ x ∈ W, v (f x) = w x) :
    certificateCheck H V v = true := by
  have hlocal : certificateCheck (localGenerators G W) W w = true := by
    rw [certificateCheck_localGenerators]
    exact hc
  have h := certificateCheck_image_on hlocal A hG hW f hf v hv
  simpa only [hGimage, hWimage, certificateCheck_localGenerators] using h

namespace Mask

open Frankl.FC.BitCode FranklSmallCyclic

/-- The original certificate supplies every mask row because each decoded
exterior code is an actual boundary subset. No outside row is omitted. -/
theorem certificateCheck_check {n core : ℕ} {gs inside outside : List ℕ} {w : ℕ → ℕ}
    (hd : ValidDomains n gs core inside outside)
    (hc : certificateCheck (decodedGenerators n gs) (decode n core) w = true) :
    check n gs core inside outside w = true := by
  obtain ⟨hcore, hgs, hnodup, hinside, houtside, hinsideCover, houtsideCover⟩ := hd
  obtain ⟨hpositive, hrows⟩ := Bool.and_eq_true_iff.mp hc
  have hchecked := of_decide_eq_true hrows
  apply Bool.and_eq_true_iff.mpr
  refine ⟨hpositive, List.all_eq_true.mpr ?_⟩
  intro e he
  apply List.all_eq_true.mpr
  intro m hm
  by_cases hraw : m &&& e = m
  · rw [ite_eq_left hraw]
    apply decide_eq_true
    have hEB : decode n e ⊆ boundary (decodedGenerators n gs) (decode n core) := by
      apply Finset.mem_powerset.mp
      rw [← houtsideCover]
      exact Finset.mem_image_of_mem (decode n) (List.mem_toFinset.mpr he)
    have hME : decode n m ⊆ decode n e :=
      (mask_subset_iff (houtside m hm) e).mp hraw
    have hdis : Disjoint (decode n e) (decode n core) :=
      (boundary_disjoint_window (decodedGenerators n gs) (decode n core)).mono_left hEB
    rw [rowShare_compatible w hgs hcore hnodup hinside (houtside m hm)
      hinsideCover hdis hME]
    exact hchecked (decode n e) (Finset.mem_powerset.mpr hEB)
      (decode n m) (Finset.mem_powerset.mpr hME)
  · rw [ite_eq_right hraw]

theorem check_iff_certificateCheck {n core : ℕ} {gs inside outside : List ℕ}
    {w : ℕ → ℕ} (hd : ValidDomains n gs core inside outside) :
    check n gs core inside outside w = true ↔
      certificateCheck (decodedGenerators n gs) (decode n core) w = true :=
  ⟨check_certificateCheck hd, certificateCheck_check hd⟩

theorem check_eq_certificateCheck {n core : ℕ} {gs inside outside : List ℕ}
    {w : ℕ → ℕ} (hd : ValidDomains n gs core inside outside) :
    check n gs core inside outside w =
      certificateCheck (decodedGenerators n gs) (decode n core) w :=
  Bool.eq_iff_iff.mpr (check_iff_certificateCheck hd)

theorem check_iff_weightCertificate {n core : ℕ} {gs inside outside : List ℕ}
    {w : ℕ → ℕ} (hd : ValidDomains n gs core inside outside) :
    check n gs core inside outside w = true ↔
      (∃ x ∈ decode n core, 0 < w x) ∧
        WeightCertificate (decodedGenerators n gs) (decode n core) (fun x => (w x : ℝ)) :=
  (check_iff_certificateCheck hd).trans certificateCheck_iff_weightCertificate

/-- Transport a checked computation between two literal decoded families.
The point map may have arbitrary collisions outside the specified support. -/
theorem check_image_on {n core n' core' : ℕ}
    {gs inside outside hs inside' outside' : List ℕ} {w v : ℕ → ℕ}
    (hd : ValidDomains n gs core inside outside)
    (hd' : ValidDomains n' hs core' inside' outside')
    (hc : check n gs core inside outside w = true) (A : Finset ℕ)
    (hG : ∀ g ∈ decodedGenerators n gs, g ⊆ A) (hW : decode n core ⊆ A)
    (f : ℕ → ℕ) (hf : Set.InjOn f A)
    (hGimage : imageFamily f (decodedGenerators n gs) = decodedGenerators n' hs)
    (hWimage : (decode n core).image f = decode n' core')
    (hv : ∀ x ∈ decode n core, v (f x) = w x) :
    check n' hs core' inside' outside' v = true := by
  apply certificateCheck_check hd'
  have h := certificateCheck_image_on (check_certificateCheck hd hc) A hG hW f hf v hv
  simpa only [hGimage, hWimage] using h

/-- The map needs to carry only generators meeting the core. This form
consumes equivalence witnesses after all cyclic aliases have been applied. -/
theorem check_image_on_local {n core n' core' : ℕ}
    {gs inside outside hs inside' outside' : List ℕ} {w v : ℕ → ℕ}
    (hd : ValidDomains n gs core inside outside)
    (hd' : ValidDomains n' hs core' inside' outside')
    (hc : check n gs core inside outside w = true) (A : Finset ℕ)
    (hG : ∀ g ∈ localGenerators (decodedGenerators n gs) (decode n core), g ⊆ A)
    (hW : decode n core ⊆ A) (f : ℕ → ℕ) (hf : Set.InjOn f A)
    (hGimage : imageFamily f (localGenerators (decodedGenerators n gs) (decode n core)) =
      localGenerators (decodedGenerators n' hs) (decode n' core'))
    (hWimage : (decode n core).image f = decode n' core')
    (hv : ∀ x ∈ decode n core, v (f x) = w x) :
    check n' hs core' inside' outside' v = true :=
  certificateCheck_check hd' (certificateCheck_image_on_local
    (check_certificateCheck hd hc) A hG hW f hf hGimage hWimage hv)

/-- The actual finite support is the core together with the union of its
local generators. Unused points of either ambient ground are irrelevant. -/
theorem check_image_local {n core n' core' : ℕ}
    {gs inside outside hs inside' outside' : List ℕ} {w v : ℕ → ℕ}
    (hd : ValidDomains n gs core inside outside)
    (hd' : ValidDomains n' hs core' inside' outside')
    (hc : check n gs core inside outside w = true) (f : ℕ → ℕ)
    (hf : Set.InjOn f (↑(decode n core ∪
      unionOf (localGenerators (decodedGenerators n gs) (decode n core)) : Finset ℕ)))
    (hGimage : imageFamily f (localGenerators (decodedGenerators n gs) (decode n core)) =
      localGenerators (decodedGenerators n' hs) (decode n' core'))
    (hWimage : (decode n core).image f = decode n' core')
    (hv : ∀ x ∈ decode n core, v (f x) = w x) :
    check n' hs core' inside' outside' v = true := by
  apply check_image_on_local hd hd' hc (decode n core ∪
    unionOf (localGenerators (decodedGenerators n gs) (decode n core)))
    ?_ Finset.subset_union_left
    f hf hGimage hWimage hv
  intro g hg x hx
  exact Finset.mem_union_right _ (mem_unionOf.mpr ⟨g, hg, hx⟩)

end Mask
end FranklLocal
