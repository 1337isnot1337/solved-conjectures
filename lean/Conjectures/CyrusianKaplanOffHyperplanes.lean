module
public import Conjectures.CyrusianKaplanOrderedCoordinates
import Mathlib.Tactic.Linarith

@[expose] public section
namespace CyrusianKaplan

/-- The baseline off the arrangement in the written proof. Pairwise
bounds are equivalent to the extremal bound when both tuples are nonempty. -/
def TupleBaseline {r : ℕ} (g : ℝ) (a b : Fin r → ℝ) : Prop :=
  (∀ i, g < b i + b i) ∧ ∀ i j, a i - b j < g

/-- The equalities needed to compare the actual admissible region and
the baseline. Equalities that only define their shared box are unnecessary. -/
def OffCorrectionHyperplanes {r : ℕ} (g : ℝ) (a b : Fin r → ℝ) : Prop :=
  (∀ i, b i + b i ≠ g) ∧
  (∀ i j k, b i + b j ≠ b k) ∧
  (∀ i j k, b i + b j ≠ a k) ∧
  (∀ i j, a i - b j ≠ g) ∧
  (∀ i j k, a i - b j ≠ a k)

/-- Off the explicit equality hyperplanes, the closure tests select
exactly the baseline inside the common ordered box. -/
theorem real_admissibility_iff_baseline_off_hyperplanes {r : ℕ} (g : ℝ)
    (a b : Fin r → ℝ) (ha : StrictMono a) (hb : StrictMono b)
    (hA : ∀ i, g < a i ∧ a i < 2 * g)
    (hB : ∀ i, 0 < b i ∧ b i ≤ g)
    (hOff : OffCorrectionHyperplanes g a b) :
    RealAdmissibleEncoding g r (indexedFinset a) (indexedFinset b) ↔
      TupleBaseline g a b := by
  rcases hOff with ⟨_hDouble,hLow,hHigh,hDiff,hGap⟩
  rw [real_admissibility_iff_ordered_tuple_tests g a b ha hb]
  constructor
  · rintro ⟨_,_,hPlus,hMinus⟩
    constructor
    · intro i
      rcases hPlus i i with h0 | ⟨_hLe,k,hk⟩ | ⟨hGt,_⟩
      · have := (hB i).1
        linarith
      · exact (hLow i i k hk.symm).elim
      · exact hGt
    · intro i j
      by_contra! hLe
      exact hMinus i j (Or.inr (Or.inr
        ⟨lt_of_le_of_ne hLe (Ne.symm (hDiff i j)),hGap i j⟩))
  · rintro ⟨hAbove,hBelow⟩
    refine ⟨hA,hB,?_,?_⟩
    · intro i j
      exact Or.inr (Or.inr ⟨by linarith [hAbove i,hAbove j],hHigh i j⟩)
    · intro i j h
      rcases h with h0 | ⟨_,k,hk⟩ | ⟨hG,_⟩
      · linarith [(hA i).1,(hB j).2]
      · exact hHigh j k i (by linarith)
      · exact (not_lt_of_ge hG.le) (hBelow i j)

/-- A doubling exceptional hyperplane can meet an admissible encoding
only where a low member also lies on a genus boundary. This is the
second equation used in the written codimension argument. -/
theorem doubling_hyperplane_forces_genus_boundary {r : ℕ} (g : ℝ)
    (a b : Fin r → ℝ) (ha : StrictMono a) (hb : StrictMono b)
    (h : RealAdmissibleEncoding g r (indexedFinset a) (indexedFinset b))
    (i : Fin r) (hi : b i + b i = g) : ∃ k, b k = g := by
  obtain ⟨_,hB,hPlus,_⟩ := (real_admissibility_iff_ordered_tuple_tests g a b ha hb).mp h
  have hPos : 0 < g := by linarith [(hB i).1]
  have hMem := hPlus i i
  rw [hi] at hMem
  rcases hMem with h0 | ⟨_,k,hk⟩ | ⟨hLt,_⟩
  · exact (hPos.ne' h0).elim
  · exact ⟨k,hk⟩
  · exact (lt_irrefl _ hLt).elim

end CyrusianKaplan
