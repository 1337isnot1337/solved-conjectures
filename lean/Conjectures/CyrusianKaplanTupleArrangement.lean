module
public import Conjectures.CyrusianKaplanOrderedCoordinates
public import Conjectures.CyrusianKaplanSignPartition
public import Mathlib.Data.Fintype.EquivFin
import Mathlib.Tactic.DeriveFintype
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

open Set

abbrev TupleSpace (r : ℕ) := (Fin r → ℝ) × (Fin r → ℝ)

/-- Indices for the exact finite affine arrangement, including the
box, order, additive closure tests, and comparison baseline. -/
inductive TupleAffineTest (r : ℕ)
  | highLower (i : Fin r)
  | highUpper (i : Fin r)
  | lowLower (i : Fin r)
  | lowUpper (i : Fin r)
  | highOrder (i j : Fin r)
  | lowOrder (i j : Fin r)
  | sumCut (i j : Fin r)
  | sumLow (i j k : Fin r)
  | sumHigh (i j k : Fin r)
  | diffCut (i j : Fin r)
  | diffLow (i j k : Fin r)
  | diffHigh (i j k : Fin r)
  deriving DecidableEq, Fintype

def tupleAffineForm {r : ℕ} (g : ℝ) (i : TupleAffineTest r) (z : TupleSpace r) : ℝ :=
  match i with
  | .highLower i => g - z.1 i
  | .highUpper i => z.1 i - 2 * g
  | .lowLower i => -z.2 i
  | .lowUpper i => z.2 i - g
  | .highOrder i j => z.1 i - z.1 j
  | .lowOrder i j => z.2 i - z.2 j
  | .sumCut i j => z.2 i + z.2 j - g
  | .sumLow i j k => z.2 i + z.2 j - z.2 k
  | .sumHigh i j k => z.2 i + z.2 j - z.1 k
  | .diffCut i j => z.1 i - z.2 j - g
  | .diffLow i j k => z.1 i - z.2 j - z.2 k
  | .diffHigh i j k => z.1 i - z.2 j - z.1 k

theorem continuous_tupleAffineForm {r : ℕ} (g : ℝ) (i : TupleAffineTest r) :
    Continuous (tupleAffineForm g i) := by
  have hA (i : Fin r) : Continuous (fun z : TupleSpace r => z.1 i) :=
    (continuous_apply i).comp continuous_fst
  have hB (i : Fin r) : Continuous (fun z : TupleSpace r => z.2 i) :=
    (continuous_apply i).comp continuous_snd
  cases i <;> unfold tupleAffineForm
  all_goals fun_prop (disch := first | apply hA | apply hB)

private theorem fst_tuple_smul {r : ℕ} (k : ℝ) (z : TupleSpace r) (i : Fin r) :
    (k • z).1 i = k*z.1 i := rfl

private theorem snd_tuple_smul {r : ℕ} (k : ℝ) (z : TupleSpace r) (i : Fin r) :
    (k • z).2 i = k*z.2 i := rfl

theorem tupleAffineForm_combination {r : ℕ} (g : ℝ) (i : TupleAffineTest r)
    (x y : TupleSpace r) (t : ℝ) :
    tupleAffineForm g i ((1-t) • x + t • y) =
      (1-t) * tupleAffineForm g i x + t * tupleAffineForm g i y := by
  cases i <;> simp only [tupleAffineForm,Prod.fst_add,Prod.snd_add,
    fst_tuple_smul,snd_tuple_smul,Pi.add_apply] <;> ring

theorem tupleAffineForm_scale {r : ℕ} (g c : ℝ) (i : TupleAffineTest r)
    (x : TupleSpace r) :
    tupleAffineForm (c*g) i (c • x) = c * tupleAffineForm g i x := by
  cases i <;> simp only [tupleAffineForm,fst_tuple_smul,snd_tuple_smul] <;> ring

/-- Ordered coordinate version of the region whose lattice points
are counted. No integrality condition is built into its sign fibres. -/
def admissibleTupleRegion (r : ℕ) (g : ℝ) : Set (TupleSpace r) :=
  {z | StrictMono z.1 ∧ StrictMono z.2 ∧
    RealAdmissibleEncoding g r (indexedFinset z.1) (indexedFinset z.2)}

private theorem tupleMember_pos_iff {r : ℕ} (g : ℝ) (a b : Fin r → ℝ) (u : ℝ)
    (hu : 0 < u) :
    RealTupleMember g a b u ↔
      ((¬ 0 < u-g) ∧ ∃ k, u-b k=0) ∨ (0 < u-g ∧ ∀ k, u-a k≠0) := by
  unfold RealTupleMember
  simp only [hu.ne',false_or,not_lt,sub_pos,sub_eq_zero]
  constructor
  · rintro (⟨h,k,hk⟩ | h)
    · exact Or.inl ⟨h,k,hk.symm⟩
    · exact Or.inr ⟨h.1,fun k h0 => h.2 k (sub_eq_zero.mp h0)⟩
  · rintro (⟨h,k,hk⟩ | h)
    · exact Or.inl ⟨h,k,hk.symm⟩
    · exact Or.inr ⟨h.1,fun k h0 => h.2 k (sub_eq_zero.mpr h0)⟩

private theorem tupleForm_eq_iff {r : ℕ} {g : ℝ} {x y : TupleSpace r}
    (hs : affineSignCode (tupleAffineForm g) x = affineSignCode (tupleAffineForm g) y)
    (i : TupleAffineTest r) :
    tupleAffineForm g i x=0 ↔ tupleAffineForm g i y=0 := by
  rw [← affineTestSign_eq_eq,← affineTestSign_eq_eq]
  exact iff_of_eq (congrArg (fun q : Ordering => q = .eq) (congrFun hs i))

private theorem tupleForm_lt_iff {r : ℕ} {g : ℝ} {x y : TupleSpace r}
    (hs : affineSignCode (tupleAffineForm g) x = affineSignCode (tupleAffineForm g) y)
    (i : TupleAffineTest r) :
    tupleAffineForm g i x<0 ↔ tupleAffineForm g i y<0 := by
  rw [← affineTestSign_eq_lt,← affineTestSign_eq_lt]
  exact iff_of_eq (congrArg (fun q : Ordering => q = .lt) (congrFun hs i))

private theorem tupleForm_gt_iff {r : ℕ} {g : ℝ} {x y : TupleSpace r}
    (hs : affineSignCode (tupleAffineForm g) x = affineSignCode (tupleAffineForm g) y)
    (i : TupleAffineTest r) :
    0<tupleAffineForm g i x ↔ 0<tupleAffineForm g i y := by
  rw [← affineTestSign_eq_gt,← affineTestSign_eq_gt]
  exact iff_of_eq (congrArg (fun q : Ordering => q = .gt) (congrFun hs i))

theorem admissibleTupleRegion_sign_invariant {r : ℕ} (g : ℝ) {x y : TupleSpace r}
    (hs : affineSignCode (tupleAffineForm g) x = affineSignCode (tupleAffineForm g) y) :
    x ∈ admissibleTupleRegion r g ↔ y ∈ admissibleTupleRegion r g := by
  suffices hdir : ∀ {u v : TupleSpace r},
      affineSignCode (tupleAffineForm g) u = affineSignCode (tupleAffineForm g) v →
        u ∈ admissibleTupleRegion r g → v ∈ admissibleTupleRegion r g by
    exact ⟨hdir hs,hdir hs.symm⟩
  intro u v huv ⟨hAo,hBo,hReg⟩
  have hAord : StrictMono v.1 := fun i j hij => sub_neg.mp
    ((tupleForm_lt_iff huv (.highOrder i j)).mp (sub_neg.mpr (hAo hij)))
  have hBord : StrictMono v.2 := fun i j hij => sub_neg.mp
    ((tupleForm_lt_iff huv (.lowOrder i j)).mp (sub_neg.mpr (hBo hij)))
  obtain ⟨hA,hB,hSum,hDiff⟩ :=
    (real_admissibility_iff_ordered_tuple_tests g u.1 u.2 hAo hBo).mp hReg
  have hA' (i : Fin r) : g<v.1 i ∧ v.1 i<2*g :=
    ⟨sub_neg.mp ((tupleForm_lt_iff huv (.highLower i)).mp (sub_neg.mpr (hA i).1)),
      sub_neg.mp ((tupleForm_lt_iff huv (.highUpper i)).mp (sub_neg.mpr (hA i).2))⟩
  have hB' (i : Fin r) : 0<v.2 i ∧ v.2 i≤g :=
    ⟨neg_lt_zero.mp ((tupleForm_lt_iff huv (.lowLower i)).mp (neg_lt_zero.mpr (hB i).1)),
      sub_nonpos.mp (not_lt.mp (fun h =>
        not_lt_of_ge (sub_nonpos.mpr (hB i).2) ((tupleForm_gt_iff huv (.lowUpper i)).mpr h)))⟩
  refine ⟨hAord,hBord,(real_admissibility_iff_ordered_tuple_tests g v.1 v.2 hAord hBord).mpr
    ⟨hA',hB',?_,?_⟩⟩
  · intro i j
    have h := hSum i j
    rw [tupleMember_pos_iff _ _ _ _ (add_pos (hB i).1 (hB j).1)] at h
    rw [tupleMember_pos_iff _ _ _ _ (add_pos (hB' i).1 (hB' j).1)]
    rcases h with h | h
    · obtain ⟨hCut,k,hk⟩ := h
      exact Or.inl ⟨fun hc => hCut ((tupleForm_gt_iff huv (.sumCut i j)).mpr hc),
        k,(tupleForm_eq_iff huv (.sumLow i j k)).mp hk⟩
    · exact Or.inr ⟨(tupleForm_gt_iff huv (.sumCut i j)).mp h.1,fun k hk =>
        h.2 k ((tupleForm_eq_iff huv (.sumHigh i j k)).mpr hk)⟩
  · intro i j hj
    apply hDiff i j
    rw [tupleMember_pos_iff _ _ _ _ (sub_pos.mpr ((hB j).2.trans_lt (hA i).1))]
    rw [tupleMember_pos_iff _ _ _ _ (sub_pos.mpr ((hB' j).2.trans_lt (hA' i).1))] at hj
    rcases hj with h | h
    · obtain ⟨hCut,k,hk⟩ := h
      exact Or.inl ⟨fun hc => hCut ((tupleForm_gt_iff huv (.diffCut i j)).mp hc),
        k,(tupleForm_eq_iff huv (.diffLow i j k)).mpr hk⟩
    · exact Or.inr ⟨(tupleForm_gt_iff huv (.diffCut i j)).mpr h.1,fun k hk =>
        h.2 k ((tupleForm_eq_iff huv (.diffHigh i j k)).mp hk)⟩

theorem admissibleTupleRegion_eq_sign_union (r : ℕ) (g : ℝ) :
    admissibleTupleRegion r g =
      ⋃ s : {s : TupleAffineTest r → Ordering //
        ∃ x ∈ admissibleTupleRegion r g, affineSignCode (tupleAffineForm g) x = s},
        affineSignFibre (tupleAffineForm g) s.val :=
  set_eq_iUnion_admissibleSignFibres _ _ (fun _ _ => admissibleTupleRegion_sign_invariant g)

end CyrusianKaplan
