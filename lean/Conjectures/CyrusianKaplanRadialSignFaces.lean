module
public import Conjectures.CyrusianKaplanCompactSignFaces
import Mathlib.Data.Finset.Card
import Mathlib.Tactic.Linarith

@[expose] public section
namespace CyrusianKaplan
open Set

theorem signWeakConstraint_lt_of_fibre {r : ℕ} {s : TupleAffineTest r→Ordering}
    {x : TupleSpace r} (hx : x∈affineSignFibre (tupleAffineForm 1) s)
    (i : TupleAffineTest r × Bool) :
    signWeakConstraint 1 s i x < 0 ↔ s i.1 ≠ .eq := by
  have hs : affineTestSign (tupleAffineForm 1 i.1 x) = s i.1 := congrFun hx i.1
  rw [signWeakConstraint_apply]
  cases he : s i.1 with
  | eq =>
    have h := (affineTestSign_eq_eq _).mp (hs.trans he)
    simp [h]
  | lt =>
    have h := (affineTestSign_eq_lt _).mp (hs.trans he)
    simp [h]
  | gt =>
    have h := (affineTestSign_eq_gt _).mp (hs.trans he)
    simp [h]

theorem signWeakConstraint_eq_zero_iff {r : ℕ} (s : TupleAffineTest r→Ordering)
    (x : TupleSpace r) (i : TupleAffineTest r × Bool) :
    signWeakConstraint 1 s i x = 0 ↔ affineSignCode (tupleAffineForm 1) x i.1 = .eq := by
  rw [signWeakConstraint_apply]
  change _ ↔ affineTestSign (tupleAffineForm 1 i.1 x) = .eq
  rw [affineTestSign_eq_eq]
  split_ifs <;> simp

theorem mem_radialBoundary_iff_specializes_ne {r : ℕ}
    {s : TupleAffineTest r→Ordering} {x y : TupleSpace r}
    (hx : x∈affineSignFibre (tupleAffineForm 1) s) :
    y∈radialBoundary (signWeakConstraint 1 s) (fun _=>0) x ↔
      signSpecializes (affineSignCode (tupleAffineForm 1) y) s ∧
        affineSignCode (tupleAffineForm 1) y ≠ s := by
  change (y∈finiteAffinePolyhedron (signWeakConstraint 1 s) (fun _=>0) ∧
    ∃ i,signWeakConstraint 1 s i x<0 ∧ signWeakConstraint 1 s i y=0) ↔ _
  rw [← weak_sign_eq_finiteAffinePolyhedron,mem_weak_sign_iff_specializes]
  constructor
  · rintro ⟨h,i,hX,hY⟩
    refine ⟨h,fun he => ?_⟩
    exact (signWeakConstraint_lt_of_fibre hx i).mp hX
      ((congrFun he i.1).symm.trans ((signWeakConstraint_eq_zero_iff s y i).mp hY))
  · rintro ⟨h,hn⟩
    obtain ⟨i,hi⟩ : ∃ i, affineSignCode (tupleAffineForm 1) y i ≠ s i := by
      by_contra! hAll
      exact hn (funext hAll)
    have hZero : affineSignCode (tupleAffineForm 1) y i = .eq := (h i).resolve_left hi
    refine ⟨h,(i,false),?_,(signWeakConstraint_eq_zero_iff s y (i,false)).mpr hZero⟩
    exact (signWeakConstraint_lt_of_fibre hx (i,false)).mpr (fun he => hi (hZero.trans he.symm))

noncomputable def signNonzeros {ι : Type*} [Fintype ι] (s : ι→Ordering) : Finset ι := by
  classical
  exact Finset.univ.filter fun i => s i ≠ .eq

theorem mem_signNonzeros {ι : Type*} [Fintype ι] {s : ι→Ordering} {i : ι} :
    i∈signNonzeros s ↔ s i ≠ .eq := by
  classical
  simp [signNonzeros]

theorem signNonzeros_card_lt_of_specializes_ne {ι : Type*} [Fintype ι] {s t : ι→Ordering}
    (h : signSpecializes t s) (hne : t ≠ s) :
    (signNonzeros t).card < (signNonzeros s).card := by
  classical
  apply Finset.card_lt_card
  apply Finset.ssubset_iff_subset_ne.mpr
  constructor
  · intro i hi
    rw [mem_signNonzeros] at hi ⊢
    exact ((h i).resolve_right hi) ▸ hi
  · intro he
    apply hne
    funext i
    rcases h i with hh|hh
    · exact hh
    · by_contra! hn
      have hs : i∈signNonzeros s := mem_signNonzeros.mpr (fun he => hn (hh.trans he.symm))
      exact (mem_signNonzeros.mp (show i∈signNonzeros t from he.symm ▸ hs)) hh

end CyrusianKaplan
