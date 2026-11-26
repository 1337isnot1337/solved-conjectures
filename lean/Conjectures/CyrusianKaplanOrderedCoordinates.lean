module
public import Conjectures.CyrusianKaplanHomogeneous
public import Mathlib.Data.Finset.Sort
public import Mathlib.Order.Hom.Set

@[expose] public section
namespace CyrusianKaplan

open Finset Set

/-- The underlying finite set of a coordinate tuple. -/
def indexedFinset {r : ℕ} {α : Type*} [DecidableEq α] (f : Fin r→α) : Finset α :=
  Finset.univ.image f

theorem mem_indexedFinset_iff {r : ℕ} {α : Type*} [DecidableEq α] (f : Fin r→α) (x : α) :
    x∈indexedFinset f ↔ ∃ i,f i=x := by simp [indexedFinset]

theorem forall_indexedFinset_iff {r : ℕ} {α : Type*} [DecidableEq α]
    (f : Fin r→α) (P : α→Prop) :
    (∀ x∈indexedFinset f,P x) ↔ ∀ i,P (f i) := by
  constructor
  · intro h i
    exact h _ ((mem_indexedFinset_iff f _).mpr ⟨i,rfl⟩)
  · intro h x hx
    obtain ⟨i,rfl⟩ := (mem_indexedFinset_iff f x).mp hx
    exact h i

theorem card_indexedFinset {r : ℕ} {α : Type*} [LinearOrder α]
    (f : Fin r→α) (hf : StrictMono f) : (indexedFinset f).card=r := by
  unfold indexedFinset
  rw [Finset.card_image_of_injective _ hf.injective,Finset.card_univ,Fintype.card_fin]

/-- Finite sets of fixed size are identified with their unique
strictly increasing coordinate tuples, for either integers or reals. -/
def sortedCoordinateEquiv (r : ℕ) (α : Type*) [LinearOrder α] :
    {f : Fin r→α // StrictMono f} ≃ {A : Finset α // A.card=r} where
  toFun f := ⟨indexedFinset f.val,card_indexedFinset f.val f.property⟩
  invFun A := ⟨A.val.orderEmbOfFin A.property,(A.val.orderEmbOfFin A.property).strictMono⟩
  left_inv f := by
    apply Subtype.ext
    apply StrictMono.eq_of_range_eq
      (((indexedFinset f.val).orderEmbOfFin (card_indexedFinset f.val f.property)).strictMono)
      f.property
    rw [Finset.range_orderEmbOfFin]
    ext x
    exact mem_indexedFinset_iff f.val x
  right_inv A := by
    apply Subtype.ext
    exact Finset.image_orderEmbOfFin_univ A.val A.property

/-- Membership expressed directly by affine comparisons between
the tested value and coordinates: no enumeration of sample genera. -/
def RealTupleMember {r : ℕ} (g : ℝ) (a b : Fin r→ℝ) (x : ℝ) : Prop :=
  x=0 ∨ (x≤g ∧ ∃ i,b i=x) ∨ (g<x ∧ ∀ i,x≠a i)

theorem realTupleMember_iff {r : ℕ} (g : ℝ) (a b : Fin r→ℝ) (x : ℝ) :
    RealEncodedMember g (indexedFinset a) (indexedFinset b) x↔RealTupleMember g a b x := by
  unfold RealEncodedMember RealTupleMember
  simp only [mem_indexedFinset_iff,not_exists,ne_comm]

/-- The actual region has the written coordinate tests in fixed
dimension 2r. The comparisons may all be used as hyperplane
constraints without adding a nonhomogeneous intercept. -/
theorem real_admissibility_iff_ordered_tuple_tests {r : ℕ} (g : ℝ) (a b : Fin r→ℝ)
    (ha : StrictMono a) (hb : StrictMono b) :
    RealAdmissibleEncoding g r (indexedFinset a) (indexedFinset b) ↔
      (∀ i,g<a i ∧ a i<2*g) ∧
      (∀ i,0<b i ∧ b i≤g) ∧
      (∀ i j,RealTupleMember g a b (b i+b j)) ∧
      (∀ i j,¬RealTupleMember g a b (a i-b j)) := by
  unfold RealAdmissibleEncoding RealEncodingTests
  simp only [card_indexedFinset a ha,card_indexedFinset b hb,true_and,
    forall_indexedFinset_iff,realTupleMember_iff]

end CyrusianKaplan
