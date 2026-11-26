module
public import Conjectures.CyrusianKaplanStratumClosure
public import Mathlib.Data.Fintype.Pi
import Mathlib.Tactic.Linarith

@[expose] public section
namespace CyrusianKaplan

open Set

/-- The three possible signs of a real affine test, with all
boundaries represented by equality rather than rounding. -/
noncomputable def affineTestSign (x : ℝ) : Ordering := by
  classical
  exact if x < 0 then .lt else if x = 0 then .eq else .gt

theorem affineTestSign_eq_lt (x : ℝ) : affineTestSign x = .lt ↔ x < 0 := by
  classical
  unfold affineTestSign
  split_ifs <;> simp_all

theorem affineTestSign_eq_eq (x : ℝ) : affineTestSign x = .eq ↔ x = 0 := by
  classical
  by_cases h : x < 0
  · simp [affineTestSign, h, h.ne]
  · simp [affineTestSign, h]

theorem affineTestSign_eq_gt (x : ℝ) : affineTestSign x = .gt ↔ 0 < x := by
  classical
  by_cases h : x < 0
  · simp [affineTestSign, h, not_lt_of_ge h.le]
  · by_cases he : x = 0
    · simp [he, affineTestSign]
    · have hp : 0 < x := lt_of_le_of_ne (le_of_not_gt h) (Ne.symm he)
      simp [affineTestSign, h, he, hp]

noncomputable def affineSignCode {E ι : Type*} (f : ι → E → ℝ) (x : E) : ι → Ordering :=
  fun i => affineTestSign (f i x)

def affineSignFibre {E ι : Type*} (f : ι → E → ℝ) (s : ι → Ordering) : Set E :=
  {x | affineSignCode f x = s}

theorem affineSignFibre_pairwiseDisjoint {E ι : Type*} (f : ι → E → ℝ) :
    Pairwise (fun s t => Disjoint (affineSignFibre f s) (affineSignFibre f t)) := by
  intro s t h
  apply Set.disjoint_left.mpr
  intro x (hx : affineSignCode f x = s) (hy : affineSignCode f x = t)
  exact h (hx.symm.trans hy)

/-- A predicate determined by finitely many signs is the exact
disjoint union of those sign fibres for which it has a witness. -/
theorem set_eq_iUnion_admissibleSignFibres {E ι : Type*} [Finite ι]
    (f : ι → E → ℝ) (P : Set E)
    (hP : ∀ ⦃x y⦄, affineSignCode f x = affineSignCode f y → (x ∈ P ↔ y ∈ P)) :
    P = ⋃ s : {s : ι → Ordering // ∃ x ∈ P, affineSignCode f x = s}, affineSignFibre f s.val := by
  ext x
  constructor
  · intro hx
    exact mem_iUnion.mpr ⟨⟨affineSignCode f x,⟨x,hx,rfl⟩⟩,rfl⟩
  · intro hx
    obtain ⟨⟨s,y,hy,hys⟩,hxs⟩ := mem_iUnion.mp hx
    exact (hP ((show affineSignCode f x = s from hxs).trans hys.symm)).mpr hy

/-- The sign fibres are exactly the oriented strict strata to which
the convex-combination closure theorem applies. -/
theorem affineSignFibre_eq_strictStratum {E ι : Type*}
    (f : ι → E → ℝ) (s : ι → Ordering) :
    affineSignFibre f s =
      strictAffineStratum (fun i x => if s i = .gt then -f i x else f i x)
        {i | s i = .eq} {i | s i ≠ .eq} := by
  classical
  ext x
  constructor
  · intro (h : affineSignCode f x = s)
    have hc (i : ι) : affineTestSign (f i x) = s i := congrFun h i
    refine ⟨?_,?_⟩
    · intro i (hi : s i = .eq)
      simpa [hi] using (affineTestSign_eq_eq _).mp ((hc i).trans hi)
    · intro i (hi : s i ≠ .eq)
      cases hsi : s i with
      | lt =>
        simpa [hsi] using (affineTestSign_eq_lt _).mp ((hc i).trans hsi)
      | eq => exact (hi hsi).elim
      | gt =>
        simpa [hsi,neg_lt_zero] using (affineTestSign_eq_gt _).mp ((hc i).trans hsi)
  · intro ⟨hEq,hNe⟩
    change affineSignCode f x = s
    funext i
    change affineTestSign (f i x) = s i
    cases hsi : s i with
    | lt =>
      apply (affineTestSign_eq_lt _).mpr
      simpa [hsi] using hNe i (by simp [hsi])
    | eq =>
      apply (affineTestSign_eq_eq _).mpr
      simpa [hsi] using hEq i hsi
    | gt =>
      apply (affineTestSign_eq_gt _).mpr
      simpa [hsi,neg_lt_zero] using hNe i (by simp [hsi])

end CyrusianKaplan
