module

public import Conjectures.FranklFamily

/-! The local certificate counts distinct inside patterns. The equality below
identifies them with the fiber of the actual family over an occurring exterior. -/
@[expose] public section

namespace FranklLocal

variable {α : Type*} [DecidableEq α]

def localGenerators (G : Finset (Finset α)) (W : Finset α) : Finset (Finset α) :=
  G.filter (fun g => ¬ Disjoint g W)

def boundary (G : Finset (Finset α)) (W : Finset α) : Finset α :=
  exterior W (unionOf (localGenerators G W))

def localPart (G : Finset (Finset α)) (W U : Finset α) : Finset α :=
  unionOf ((localGenerators G W).filter (fun g => g ⊆ U))

def exteriorCore (G : Finset (Finset α)) (W X : Finset α) : Finset α :=
  unionOf (G.filter (fun g => Disjoint g W ∧ g ⊆ X))

def fiber (G : Finset (Finset α)) (W X : Finset α) : Finset (Finset α) :=
  ((family G).filter (fun U => exterior W U=X)).image (interior W)

def compatible (G : Finset (Finset α)) (W E M : Finset α) : Finset (Finset α) :=
  ((family (localGenerators G W)).filter
    (fun L => M ⊆ exterior W L ∧ exterior W L ⊆ E)).image (interior W)

theorem localPart_mem (G : Finset (Finset α)) (W U : Finset α) :
    localPart G W U ∈ family (localGenerators G W) :=
  unionOf_mem_family (Finset.filter_subset _ _)

theorem localPart_subset (G : Finset (Finset α)) (W U : Finset α) :
    localPart G W U ⊆ U := by
  intro x hx
  obtain ⟨g,hg,hxg⟩ := mem_unionOf.mp hx
  exact (Finset.mem_filter.mp hg).2 hxg

theorem local_exterior_subset_boundary {G : Finset (Finset α)} {W L : Finset α}
    (hL : L ∈ family (localGenerators G W)) : exterior W L ⊆ boundary G W := by
  intro x hx
  obtain ⟨hxL,hxW⟩ := Finset.mem_sdiff.mp hx
  obtain ⟨g,hg,_,hxg⟩ := mem_family_iff_covered.mp hL x hxL
  exact Finset.mem_sdiff.mpr ⟨mem_unionOf.mpr ⟨g,hg,hxg⟩,hxW⟩

theorem localPart_interior {G : Finset (Finset α)} {W U : Finset α}
    (hU : U ∈ family G) : interior W (localPart G W U)=interior W U := by
  ext x
  constructor
  · intro hx
    obtain ⟨hxL,hxW⟩ := Finset.mem_inter.mp hx
    exact Finset.mem_inter.mpr ⟨localPart_subset G W U hxL,hxW⟩
  · intro hx
    obtain ⟨hxU,hxW⟩ := Finset.mem_inter.mp hx
    obtain ⟨g,hg,hgU,hxg⟩ := mem_family_iff_covered.mp hU x hxU
    have hlocal : g ∈ localGenerators G W := by
      apply Finset.mem_filter.mpr
      exact ⟨hg,fun h => Finset.disjoint_left.mp h hxg hxW⟩
    exact Finset.mem_inter.mpr
      ⟨mem_unionOf.mpr ⟨g,Finset.mem_filter.mpr ⟨hlocal,hgU⟩,hxg⟩,hxW⟩

theorem exteriorCore_mem (G : Finset (Finset α)) (W X : Finset α) :
    exteriorCore G W X ∈ family G :=
  unionOf_mem_family (Finset.filter_subset _ _)

theorem exteriorCore_subset (G : Finset (Finset α)) (W X : Finset α) :
    exteriorCore G W X ⊆ X := by
  intro x hx
  obtain ⟨g,hg,hxg⟩ := mem_unionOf.mp hx
  exact (Finset.mem_filter.mp hg).2.2 hxg

theorem exteriorCore_disjoint (G : Finset (Finset α)) (W X : Finset α) :
    Disjoint (exteriorCore G W X) W := by
  apply Finset.disjoint_left.mpr
  intro x hx hxW
  obtain ⟨g,hg,hxg⟩ := mem_unionOf.mp hx
  exact Finset.disjoint_left.mp (Finset.mem_filter.mp hg).2.1 hxg hxW

theorem reconstruction {G : Finset (Finset α)} {W U : Finset α}
    (hU : U ∈ family G) :
    U=localPart G W U ∪ exteriorCore G W (exterior W U) := by
  ext x
  constructor
  · intro hx
    obtain ⟨g,hg,hgU,hxg⟩ := mem_family_iff_covered.mp hU x hx
    by_cases hdis : Disjoint g W
    · apply Finset.mem_union_right
      apply mem_unionOf.mpr
      refine ⟨g,Finset.mem_filter.mpr ⟨hg,hdis,?_⟩,hxg⟩
      intro y hy
      exact Finset.mem_sdiff.mpr
        ⟨hgU hy,fun hyW => Finset.disjoint_left.mp hdis hy hyW⟩
    · apply Finset.mem_union_left
      exact mem_unionOf.mpr
        ⟨g,Finset.mem_filter.mpr ⟨Finset.mem_filter.mpr ⟨hg,hdis⟩,hgU⟩,hxg⟩
  · intro hx
    rcases Finset.mem_union.mp hx with h | h
    · exact localPart_subset G W U h
    · exact (Finset.mem_sdiff.mp (exteriorCore_subset G W (exterior W U) h)).1

theorem exterior_remainder_subset_boundary {G : Finset (Finset α)}
    {W X : Finset α} (hX : ∃ U ∈ family G, exterior W U=X) :
    X \ exteriorCore G W X ⊆ boundary G W := by
  obtain ⟨U,hU,rfl⟩ := hX
  intro x hx
  obtain ⟨hxX,hxZ⟩ := Finset.mem_sdiff.mp hx
  obtain ⟨hxU,hxW⟩ := Finset.mem_sdiff.mp hxX
  have hxL : x ∈ localPart G W U := by
    have h := hxU
    rw [reconstruction hU] at h
    exact (Finset.mem_union.mp h).resolve_right hxZ
  exact local_exterior_subset_boundary (localPart_mem G W U)
    (Finset.mem_sdiff.mpr ⟨hxL,hxW⟩)

theorem mem_fiber {G : Finset (Finset α)} {W X S : Finset α} :
    S ∈ fiber G W X ↔ ∃ U ∈ family G, exterior W U=X ∧ interior W U=S := by
  simp only [fiber,Finset.mem_image,Finset.mem_filter]
  aesop

theorem mem_compatible {G : Finset (Finset α)} {W E M S : Finset α} :
    S ∈ compatible G W E M ↔
      ∃ L ∈ family (localGenerators G W),
        M ⊆ exterior W L ∧ exterior W L ⊆ E ∧ interior W L=S := by
  simp only [compatible,Finset.mem_image,Finset.mem_filter]
  aesop

/-- For an occurring exterior X, the local C(E,M) is exactly its fiber.
No multiplicity from a generating representation enters either side. -/
theorem fiber_eq_compatible {G : Finset (Finset α)} {W X : Finset α}
    (hX : ∃ U ∈ family G, exterior W U=X) :
    fiber G W X=compatible G W (X ∩ boundary G W)
      ((X \ exteriorCore G W X) ∩ boundary G W) := by
  ext S
  constructor
  · intro hS
    obtain ⟨U,hU,hUX,rfl⟩ := mem_fiber.mp hS
    apply mem_compatible.mpr
    refine ⟨localPart G W U,localPart_mem G W U,?_,?_,localPart_interior hU⟩
    · intro x hx
      obtain ⟨hxXZ,_⟩ := Finset.mem_inter.mp hx
      obtain ⟨hxX,hxZ⟩ := Finset.mem_sdiff.mp hxXZ
      have hxUW : x ∈ exterior W U := by simpa only [hUX] using hxX
      obtain ⟨hxU,hxW⟩ := Finset.mem_sdiff.mp hxUW
      have hrec := reconstruction (W:=W) hU
      rw [hUX] at hrec
      rw [hrec] at hxU
      exact Finset.mem_sdiff.mpr ⟨(Finset.mem_union.mp hxU).resolve_right hxZ,hxW⟩
    · intro x hx
      obtain ⟨hxL,hxW⟩ := Finset.mem_sdiff.mp hx
      have hxU : x ∈ exterior W U :=
        Finset.mem_sdiff.mpr ⟨localPart_subset G W U hxL,hxW⟩
      exact Finset.mem_inter.mpr
        ⟨by simpa only [hUX] using hxU,
          local_exterior_subset_boundary (localPart_mem G W U) hx⟩
  · intro hS
    obtain ⟨L,hL,hML,hLE,hLS⟩ := mem_compatible.mp hS
    let Z := exteriorCore G W X
    have hZ : Z ∈ family G := exteriorCore_mem G W X
    have hZG : family (localGenerators G W) ⊆ family G :=
      family_mono (Finset.filter_subset _ _)
    have hXd : Disjoint X W := by
      obtain ⟨U,_,rfl⟩ := hX
      apply Finset.disjoint_left.mpr
      intro x hx hxW
      exact (Finset.mem_sdiff.mp hx).2 hxW
    apply mem_fiber.mpr
    refine ⟨L ∪ Z,union_mem_family (hZG hL) hZ,?_,?_⟩
    · ext x
      constructor
      · intro hx
        obtain ⟨hxU,hxW⟩ := Finset.mem_sdiff.mp hx
        rcases Finset.mem_union.mp hxU with hxL | hxZ
        · exact (Finset.mem_inter.mp (hLE (Finset.mem_sdiff.mpr ⟨hxL,hxW⟩))).1
        · exact exteriorCore_subset G W X hxZ
      · intro hxX
        have hxW : x ∉ W := fun h => Finset.disjoint_left.mp hXd hxX h
        apply Finset.mem_sdiff.mpr
        refine ⟨?_,hxW⟩
        by_cases hxZ : x ∈ Z
        · exact Finset.mem_union_right _ hxZ
        · have hxM : x ∈ (X \ exteriorCore G W X) ∩ boundary G W :=
            Finset.mem_inter.mpr ⟨Finset.mem_sdiff.mpr ⟨hxX,hxZ⟩,
              exterior_remainder_subset_boundary hX (Finset.mem_sdiff.mpr ⟨hxX,hxZ⟩)⟩
          exact Finset.mem_union_left _ (Finset.mem_sdiff.mp (hML hxM)).1
    · rw [← hLS]
      ext x
      simp only [interior,Finset.mem_inter,Finset.mem_union]
      have hz : ¬(x ∈ exteriorCore G W X ∧ x ∈ W) :=
        fun h => Finset.disjoint_left.mp (exteriorCore_disjoint G W X) h.1 h.2
      change (x ∈ L ∨ x ∈ exteriorCore G W X) ∧ x ∈ W ↔ x ∈ L ∧ x ∈ W
      tauto

end FranklLocal
