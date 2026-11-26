module
public import Conjectures.CyrusianKaplanOffHyperplanes
public import Conjectures.CyrusianKaplanTupleArrangement
import Mathlib.Tactic.Linarith

@[expose] public section
namespace CyrusianKaplan

open Set

/-- The closed baseline includes the endpoint a=2g when it is
permitted by a-b≤g. That endpoint was excluded from the true
semigroup region but must not be discarded from the baseline. -/
def baselineTupleRegion (r : ℕ) (g : ℝ) : Set (TupleSpace r) :=
  {z | StrictMono z.1 ∧ StrictMono z.2 ∧
      (∀ i,g<z.1 i ∧ z.1 i≤2*g) ∧ (∀ i,0<z.2 i ∧ z.2 i≤g) ∧
      (∀ i,g<z.2 i+z.2 i) ∧ ∀ i j,z.1 i-z.2 j≤g}

def regularCorrectionPoint {r : ℕ} (g : ℝ) (z : TupleSpace r) : Prop :=
  OffCorrectionHyperplanes g z.1 z.2 ∧ ∀ i,z.1 i≠2*g

theorem baseline_and_admissible_iff_at_regular_point {r : ℕ} (g : ℝ) (z : TupleSpace r)
    (h : regularCorrectionPoint g z) :
    z ∈ admissibleTupleRegion r g ↔ z ∈ baselineTupleRegion r g := by
  constructor
  · intro ⟨ha,hb,hR⟩
    have hTests :=
      (real_admissibility_iff_ordered_tuple_tests g z.1 z.2 ha hb).mp hR
    have hBase :=
      (real_admissibility_iff_baseline_off_hyperplanes g z.1 z.2 ha hb
        hTests.1 hTests.2.1 h.1).mp hR
    exact ⟨ha,hb,fun i => ⟨(hTests.1 i).1,(hTests.1 i).2.le⟩,hTests.2.1,
      hBase.1,fun i j => (hBase.2 i j).le⟩
  · intro ⟨ha,hb,hA,hB,hSum,hDiff⟩
    have hA' (i : Fin r) : g<z.1 i ∧ z.1 i<2*g :=
      ⟨(hA i).1,lt_of_le_of_ne (hA i).2 (h.2 i)⟩
    have hD (i j : Fin r) : z.1 i-z.2 j<g :=
      lt_of_le_of_ne (hDiff i j) (h.1.2.2.2.1 i j)
    exact ⟨ha,hb,(real_admissibility_iff_baseline_off_hyperplanes g z.1 z.2 ha hb
        hA' hB h.1).mpr ⟨hSum,hD⟩⟩

/-- The set-theoretic correction support is contained in the
exceptional affine arrangement, in either direction. -/
theorem both_corrections_supported_on_exceptional_rows (r : ℕ) (g : ℝ) :
    ((admissibleTupleRegion r g \ baselineTupleRegion r g) ∪
      (baselineTupleRegion r g \ admissibleTupleRegion r g)) ⊆
      {z | ¬regularCorrectionPoint g z} := by
  intro z hz (hReg : regularCorrectionPoint g z)
  have h := baseline_and_admissible_iff_at_regular_point g z hReg
  rcases hz with ⟨hta,htb⟩|⟨htb,hta⟩
  · exact htb (h.mp hta)
  · exact hta (h.mpr htb)

theorem admissible_doubling_forces_distinct_boundary_row {r : ℕ} (g : ℝ) (hg : 0<g)
    (z : TupleSpace r) (hz : z ∈ admissibleTupleRegion r g)
    (i : Fin r) (hi : z.2 i+z.2 i=g) :
    ∃ k, k≠i ∧ z.2 k=g := by
  obtain ⟨ha,hb,hR⟩ := hz
  obtain ⟨k,hk⟩ := doubling_hyperplane_forces_genus_boundary g z.1 z.2 ha hb hR i hi
  refine ⟨k,?_,hk⟩
  intro he
  subst k
  linarith

end CyrusianKaplan
