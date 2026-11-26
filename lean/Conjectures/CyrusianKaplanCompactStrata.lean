module
public import Conjectures.CyrusianKaplanTuplePolyhedra
import Mathlib.Topology.Compactness.Compact
import Mathlib.Topology.Instances.Real.Lemmas

@[expose] public section
namespace CyrusianKaplan

open Set

/-- Every admissible weak sign region is compact: the entire
strict fibre lies in the closed genus box, and weakification
is exactly its closure. This verifies the boundedness needed
before trying to count lattice points in the strata. -/
theorem isCompact_admissibleWeakSignRegion {r : ℕ} (g : ℝ)
    (s : TupleAffineTest r → Ordering)
    (x : TupleSpace r) (hx : x ∈ admissibleTupleRegion r g)
    (hs : affineSignCode (tupleAffineForm g) x = s) :
    IsCompact (weakTupleSignPolyhedron g s) := by
  let A : Set (Fin r → ℝ) := Set.univ.pi (fun _ => Icc g (2*g))
  let B : Set (Fin r → ℝ) := Set.univ.pi (fun _ => Icc 0 g)
  have hA : IsCompact A := isCompact_univ_pi (fun _ => isCompact_Icc)
  have hB : IsCompact B := isCompact_univ_pi (fun _ => isCompact_Icc)
  have hBox : IsCompact (A ×ˢ B) := hA.prod hB
  have hSub : affineSignFibre (tupleAffineForm g) s ⊆ A ×ˢ B := by
    intro y (hy : affineSignCode (tupleAffineForm g) y = s)
    have hyReg := (admissibleTupleRegion_sign_invariant g (hs.trans hy.symm)).mp hx
    obtain ⟨ha,hb,hR⟩ := hyReg
    obtain ⟨hHigh,hLow,_,_⟩ :=
      (real_admissibility_iff_ordered_tuple_tests g y.1 y.2 ha hb).mp hR
    exact ⟨fun i _ => ⟨(hHigh i).1.le,(hHigh i).2.le⟩,
      fun i _ => ⟨(hLow i).1.le,(hLow i).2⟩⟩
  rw [← closure_tupleSignFibre_eq g s ⟨x,hs⟩]
  exact hBox.of_isClosed_subset isClosed_closure (closure_minimal hSub hBox.isClosed)

end CyrusianKaplan
