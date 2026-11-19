module

public import Conjectures.FranklFamilyIndependent
public import Conjectures.FranklLargeSelection
public import Conjectures.FranklLopsided

/-! Avoiding events which do not read a point's incident bits leaves its
absence probability exactly 1/8 in the three-regular case. -/
@[expose] public section

namespace Frankl.Large

open Finset

variable {α ι : Type*} [DecidableEq α] [Fintype ι]

def pointAbsent (G : ι → Finset α) (a : α) : Finset (Finset ι) :=
  univ.filter (fun s => a ∉ generated G s)

@[simp] theorem mem_pointAbsent (G : ι → Finset α) (a : α) (s : Finset ι) :
    s ∈ pointAbsent G a ↔ a ∉ generated G s := by simp [pointAbsent]

variable [DecidableEq ι]

theorem no_bad_nonreaders_of_same_outside (G : ι → Finset α) (a : α) (T : Finset ι)
    (hT : Disjoint T (pointReaders G a)) {s t : Finset ι}
    (hst : s \ incident G a=t \ incident G a) :
    s ∈ Lopsided.avoid (badEvent G) T ↔ t ∈ Lopsided.avoid (badEvent G) T := by
  have hagree (f : ι) (hf : f ∈ T) : Bad G f s ↔ Bad G f t := by
    apply bad_iff_of_agree_on_support
    intro j hj
    have hjI : j ∉ incident G a := by
      intro hja
      have hreader := (mem_pointReaders G a f).mpr
        ⟨j,mem_inter.mpr ⟨hj,hja⟩⟩
      exact disjoint_left.mp hT hf hreader
    have hmem := Finset.ext_iff.mp hst j
    simpa only [mem_sdiff,hjI,not_false_eq_true,and_true] using hmem
  simp only [Lopsided.mem_avoid,mem_badEvent]
  constructor
  · intro hs f hf
    exact (not_congr (hagree f hf)).mp (hs f hf)
  · intro ht f hf
    exact (not_congr (hagree f hf)).mpr (ht f hf)

theorem pointAbsent_inter_avoid (G : ι → Finset α) (a : α) (T : Finset ι) :
    pointAbsent G a ∩ Lopsided.avoid (badEvent G) T=
      (Lopsided.avoid (badEvent G) T).filter (fun s => Disjoint s (incident G a)) := by
  ext s
  simp only [mem_inter,mem_pointAbsent,mem_filter,point_absent_iff,and_comm]

/-- The exact finite counting identity for any collection of nonreader
events, including conditioning sets whose avoidance family is empty. -/
theorem point_absence_independent_nonreaders (G : ι → Finset α) (a : α) (T : Finset ι)
    (hT : Disjoint T (pointReaders G a)) :
    2^(incident G a).card*(pointAbsent G a ∩ Lopsided.avoid (badEvent G) T).card=
      (Lopsided.avoid (badEvent G) T).card := by
  rw [pointAbsent_inter_avoid]
  exact FranklLocal.independent_empty_slice_card
    (Lopsided.avoid (badEvent G) T) (incident G a)
    (fun s t hst => no_bad_nonreaders_of_same_outside G a T hT hst)

theorem three_regular_point_absence_independent_nonreaders
    (G : ι → Finset α) (a : α) (T : Finset ι)
    (hthree : (incident G a).card=3) (hT : Disjoint T (pointReaders G a)) :
    8*(pointAbsent G a ∩ Lopsided.avoid (badEvent G) T).card=
      (Lopsided.avoid (badEvent G) T).card := by
  have h := point_absence_independent_nonreaders G a T hT
  rw [hthree] at h
  exact h

end Frankl.Large
