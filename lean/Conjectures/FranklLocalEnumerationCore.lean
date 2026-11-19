module

public import Conjectures.FranklLocalEnumeration

/-! Test a local fiber by its core subset alone. For fixed allowed exterior E,
the union of all generators contained in S ∪ E is the largest possible witness.
This reduces the candidates from the whole support to the core powerset. -/
@[expose] public section

namespace FranklLocal

open scoped BigOperators

variable {α : Type*} [DecidableEq α]

theorem containedUnion_mem_family (G : Finset (Finset α)) (U : Finset α) :
    containedUnion G U ∈ family G :=
  unionOf_mem_family (Finset.filter_subset _ _)

theorem subset_containedUnion_of_family {G : Finset (Finset α)} {L U : Finset α}
    (hL : L ∈ family G) (hLU : L ⊆ U) : L ⊆ containedUnion G U := by
  intro x hx
  obtain ⟨g,hg,hgL,hxg⟩ := mem_family_iff_covered.mp hL x hx
  exact mem_unionOf.mpr ⟨g,Finset.mem_filter.mpr ⟨hg,hgL.trans hLU⟩,hxg⟩

def coreCompatible (G : Finset (Finset α)) (W E M : Finset α) : Finset (Finset α) :=
  W.powerset.filter (fun S => S ∪ M ⊆ containedUnion (localGenerators G W) (S ∪ E))

theorem compatible_eq_coreCompatible (G : Finset (Finset α)) (W E M : Finset α)
    (hEW : Disjoint E W) (hME : M ⊆ E) :
    compatible G W E M=coreCompatible G W E M := by
  ext S
  simp only [coreCompatible,Finset.mem_filter,Finset.mem_powerset]
  constructor
  · intro hS
    obtain ⟨L,hL,hML,hLE,hLS⟩ := mem_compatible.mp hS
    have hSW : S ⊆ W := by
      rw [← hLS]
      exact Finset.inter_subset_right
    have hLU : L ⊆ S ∪ E := by
      intro x hx
      by_cases hxW : x ∈ W
      · exact Finset.mem_union_left E (hLS ▸ Finset.mem_inter.mpr ⟨hx,hxW⟩)
      · exact Finset.mem_union_right S (hLE (Finset.mem_sdiff.mpr ⟨hx,hxW⟩))
    have hcover := subset_containedUnion_of_family hL hLU
    refine ⟨hSW,?_⟩
    intro x hx
    rcases Finset.mem_union.mp hx with hxS | hxM
    · apply hcover
      rw [← hLS] at hxS
      exact (Finset.mem_inter.mp hxS).1
    · exact hcover (Finset.mem_sdiff.mp (hML hxM)).1
  · rintro ⟨hSW,hcover⟩
    let L := containedUnion (localGenerators G W) (S ∪ E)
    have hLU : L ⊆ S ∪ E := containedUnion_subset _ _
    apply mem_compatible.mpr
    refine ⟨L,containedUnion_mem_family _ _,?_,?_,?_⟩
    · intro x hx
      exact Finset.mem_sdiff.mpr ⟨hcover (Finset.mem_union_right S hx),
        fun hxW => Finset.disjoint_left.mp hEW (hME hx) hxW⟩
    · intro x hx
      obtain ⟨hxL,hxW⟩ := Finset.mem_sdiff.mp hx
      rcases Finset.mem_union.mp (hLU hxL) with hxS | hxE
      · exact False.elim (hxW (hSW hxS))
      · exact hxE
    · ext x
      constructor
      · intro hx
        obtain ⟨hxL,hxW⟩ := Finset.mem_inter.mp hx
        rcases Finset.mem_union.mp (hLU hxL) with hxS | hxE
        · exact hxS
        · exact False.elim (Finset.disjoint_left.mp hEW hxE hxW)
      · intro hxS
        exact Finset.mem_inter.mpr
          ⟨hcover (Finset.mem_union_left M hxS),hSW hxS⟩

/-- B can be a fixed ambient boundary, including points unused by G. -/
def coreCertificateCheck (G : Finset (Finset α)) (W B : Finset α) (w : α → ℕ) : Bool :=
  decide (∃ x ∈ W, 0 < w x) &&
    decide (∀ E ∈ B.powerset, ∀ M ∈ E.powerset,
      0 ≤ ∑ S ∈ coreCompatible G W E M, integerImbalance W w S)

theorem coreCertificateCheck_sound {G : Finset (Finset α)} {W B : Finset α}
    {w : α → ℕ} (hB : boundary G W ⊆ B) (hBW : Disjoint B W)
    (hc : coreCertificateCheck G W B w=true) : certificateCheck G W w=true := by
  obtain ⟨hpos,hall⟩ := Bool.and_eq_true_iff.mp hc
  apply Bool.and_eq_true_iff.mpr
  refine ⟨hpos,decide_eq_true ?_⟩
  intro E hE M hM
  have hEB : E ⊆ B := (Finset.mem_powerset.mp hE).trans hB
  have hEW : Disjoint E W := Finset.disjoint_left.mpr
    (fun _ hxE hxW => Finset.disjoint_left.mp hBW (hEB hxE) hxW)
  rw [compatible_eq_coreCompatible G W E M hEW (Finset.mem_powerset.mp hM)]
  exact of_decide_eq_true hall E (Finset.mem_powerset.mpr hEB) M hM

theorem coreCertificateCheck_abundance {G : Finset (Finset α)} {W B : Finset α}
    {w : α → ℕ} (hB : boundary G W ⊆ B) (hBW : Disjoint B W)
    (hc : coreCertificateCheck G W B w=true) :
    ∃ x ∈ W, Abundant (family G) x :=
  certificateCheck_abundance (coreCertificateCheck_sound hB hBW hc)

end FranklLocal
