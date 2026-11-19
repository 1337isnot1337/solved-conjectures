module

public import Conjectures.FranklLocalCertificate

/-! Enumerate distinct unions by subsets of their finite point support.
This has 2^|support| candidates, regardless of the number of generators. -/
@[expose] public section

namespace FranklLocal

open scoped BigOperators

variable {α : Type*} [DecidableEq α]

def containedUnion (G : Finset (Finset α)) (U : Finset α) : Finset α :=
  unionOf (G.filter (fun g => g ⊆ U))

theorem containedUnion_subset (G : Finset (Finset α)) (U : Finset α) :
    containedUnion G U ⊆ U := by
  intro x hx
  obtain ⟨g,hg,hxg⟩ := mem_unionOf.mp hx
  exact (Finset.mem_filter.mp hg).2 hxg

theorem containedUnion_eq_iff (G : Finset (Finset α)) (U : Finset α) :
    containedUnion G U=U ↔ U ∈ family G := by
  constructor
  · intro h
    rw [← h]
    exact unionOf_mem_family (Finset.filter_subset _ _)
  · intro hU
    apply Finset.Subset.antisymm (containedUnion_subset G U)
    intro x hx
    obtain ⟨g,hg,hgU,hxg⟩ := mem_family_iff_covered.mp hU x hx
    exact mem_unionOf.mpr ⟨g,Finset.mem_filter.mpr ⟨hg,hgU⟩,hxg⟩

def enumeratedFamily (G : Finset (Finset α)) (A : Finset α) : Finset (Finset α) :=
  A.powerset.filter (fun U => containedUnion G U=U)

theorem enumeratedFamily_eq (G : Finset (Finset α)) (A : Finset α)
    (hA : ∀ g ∈ G, g ⊆ A) : enumeratedFamily G A=family G := by
  ext U
  simp only [enumeratedFamily,Finset.mem_filter,Finset.mem_powerset,containedUnion_eq_iff]
  constructor
  · exact And.right
  · intro hU
    refine ⟨?_,hU⟩
    intro x hx
    obtain ⟨g,hg,_,hxg⟩ := mem_family_iff_covered.mp hU x hx
    exact hA g hg hxg

theorem enumerated_support_eq (G : Finset (Finset α)) :
    enumeratedFamily G (unionOf G)=family G := by
  apply enumeratedFamily_eq
  intro g hg x hx
  exact mem_unionOf.mpr ⟨g,hg,hx⟩

theorem family_card_le_support_powerset (G : Finset (Finset α)) :
    (family G).card ≤ 2^(unionOf G).card := by
  rw [← enumerated_support_eq G,← Finset.card_powerset]
  exact Finset.card_le_card (Finset.filter_subset _ _)

def enumeratedCompatible (G : Finset (Finset α)) (W A E M : Finset α) :
    Finset (Finset α) :=
  ((enumeratedFamily (localGenerators G W) A).filter
    (fun L => M ⊆ exterior W L ∧ exterior W L ⊆ E)).image (interior W)

theorem enumeratedCompatible_eq (G : Finset (Finset α)) (W A E M : Finset α)
    (hA : ∀ g ∈ localGenerators G W, g ⊆ A) :
    enumeratedCompatible G W A E M=compatible G W E M := by
  rw [enumeratedCompatible,enumeratedFamily_eq _ _ hA]
  rfl

def supportCertificateCheck (G : Finset (Finset α)) (W A : Finset α) (w : α → ℕ) : Bool :=
  decide (∃ x ∈ W, 0 < w x) &&
    decide (∀ E ∈ (boundary G W).powerset, ∀ M ∈ E.powerset,
      0 ≤ ∑ S ∈ enumeratedCompatible G W A E M, integerImbalance W w S)

theorem supportCertificateCheck_eq (G : Finset (Finset α)) (W A : Finset α)
    (w : α → ℕ) (hA : ∀ g ∈ localGenerators G W, g ⊆ A) :
    supportCertificateCheck G W A w=certificateCheck G W w := by
  simp only [supportCertificateCheck,certificateCheck,enumeratedCompatible_eq _ _ _ _ _ hA]

theorem supportCertificateCheck_abundance {G : Finset (Finset α)}
    {W A : Finset α} {w : α → ℕ}
    (hA : ∀ g ∈ localGenerators G W, g ⊆ A)
    (hc : supportCertificateCheck G W A w=true) :
    ∃ x ∈ W, Abundant (family G) x := by
  apply certificateCheck_abundance
  simpa only [supportCertificateCheck_eq G W A w hA] using hc

/-- Only generators touching W enter its certificate. The rest of the
global generating collection may be arbitrary. -/
theorem certificateCheck_locality (G H : Finset (Finset α)) (W : Finset α)
    (w : α → ℕ) (hlocal : localGenerators G W=localGenerators H W) :
    certificateCheck G W w=certificateCheck H W w := by
  simp only [certificateCheck,boundary,compatible,hlocal]
  rfl

theorem local_certificate_transfer {G H : Finset (Finset α)}
    {W : Finset α} {w : α → ℕ}
    (hlocal : localGenerators G W=localGenerators H W)
    (hc : certificateCheck H W w=true) :
    ∃ x ∈ W, Abundant (family G) x := by
  apply certificateCheck_abundance
  rw [certificateCheck_locality G H W w hlocal]
  exact hc

end FranklLocal
