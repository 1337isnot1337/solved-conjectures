module
public import Conjectures.CyrusianKaplanCorrectionSupport
public import Conjectures.CyrusianKaplanCompactStrata
public import Conjectures.CyrusianKaplanLatticeFibres

@[expose] public section
namespace CyrusianKaplan
open Set

/-- The baseline is a literal union of the same sign fibres;
its inclusive boundaries are retained in the code inequalities. -/
def baselineSignCode {r : ℕ} (s : TupleAffineTest r→Ordering) : Prop :=
  (∀ i j,i<j → s (.highOrder i j)=.lt) ∧
  (∀ i j,i<j → s (.lowOrder i j)=.lt) ∧
  (∀ i,s (.highLower i)=.lt ∧ s (.highUpper i)≠.gt) ∧
  (∀ i,s (.lowLower i)=.lt ∧ s (.lowUpper i)≠.gt) ∧
  (∀ i,s (.sumCut i i)=.gt) ∧ ∀ i j,s (.diffCut i j)≠.gt

theorem baselineTupleRegion_iff_baselineSignCode {r : ℕ} (g : ℝ) (z : TupleSpace r) :
    z∈baselineTupleRegion r g ↔ baselineSignCode (affineSignCode (tupleAffineForm g) z) := by
  unfold baselineSignCode baselineTupleRegion
  simp only [Set.mem_ofPred_eq,affineSignCode, affineTestSign_eq_lt, affineTestSign_eq_gt,
    tupleAffineForm,ne_eq,not_lt,sub_neg,sub_pos,neg_lt_zero,StrictMono]

theorem baselineTupleRegion_sign_invariant {r : ℕ} (g : ℝ) {x y : TupleSpace r}
    (h : affineSignCode (tupleAffineForm g) x = affineSignCode (tupleAffineForm g) y) :
    x∈baselineTupleRegion r g ↔ y∈baselineTupleRegion r g := by
  rw [baselineTupleRegion_iff_baselineSignCode,baselineTupleRegion_iff_baselineSignCode,h]

theorem baselineTupleRegion_scale_iff {r : ℕ} {c : ℝ} (hc : 0<c) (g : ℝ) (z : TupleSpace r) :
    c • z∈baselineTupleRegion r (c*g) ↔ z∈baselineTupleRegion r g := by
  rw [baselineTupleRegion_iff_baselineSignCode,baselineTupleRegion_iff_baselineSignCode,
    tuple_sign_code_scale g hc]

theorem isCompact_baselineWeakSignRegion {r : ℕ} (g : ℝ)
    (s : TupleAffineTest r → Ordering)
    (x : TupleSpace r) (hx : x∈baselineTupleRegion r g)
    (hs : affineSignCode (tupleAffineForm g) x=s) :
    IsCompact (weakTupleSignPolyhedron g s) := by
  let A : Set (Fin r → ℝ) := Set.univ.pi (fun _ => Icc g (2*g))
  let B : Set (Fin r → ℝ) := Set.univ.pi (fun _ => Icc 0 g)
  have hA : IsCompact A := isCompact_univ_pi (fun _ => isCompact_Icc)
  have hB : IsCompact B := isCompact_univ_pi (fun _ => isCompact_Icc)
  have hBox : IsCompact (A ×ˢ B) := hA.prod hB
  have hSub : affineSignFibre (tupleAffineForm g) s ⊆ A ×ˢ B := by
    intro y (hy : affineSignCode (tupleAffineForm g) y=s)
    obtain ⟨_,_,hHigh,hLow,_,_⟩ := (baselineTupleRegion_sign_invariant g (hs.trans hy.symm)).mp hx
    exact ⟨fun i _ => ⟨(hHigh i).1.le,(hHigh i).2⟩,fun i _ => ⟨(hLow i).1.le,(hLow i).2⟩⟩
  rw [← closure_tupleSignFibre_eq g s ⟨x,hs⟩]
  exact hBox.of_isClosed_subset isClosed_closure (closure_minimal hSub hBox.isClosed)

end CyrusianKaplan
