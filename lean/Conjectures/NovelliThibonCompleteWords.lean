module
public import Conjectures.NovelliThibonGraphLLT
public import Mathlib.RingTheory.MvPolynomial.Symmetric.Defs
public import Mathlib.Data.Multiset.Sort
public import Mathlib.Data.List.Sort
public import Mathlib.Algebra.BigOperators.Fin

@[expose] public section
namespace NovelliThibon

open Classical
variable {A : Type*} [LinearOrder A]

def listIndexed {n : ℕ} (l : List A) (h : l.length=n) : Fin n → A :=
  fun i => l.get (i.cast h.symm)

omit [LinearOrder A] in
theorem ofFn_listIndexed {n : ℕ} (l : List A) (h : l.length=n) :
    List.ofFn (listIndexed l h) = l := by
  subst n
  exact List.ofFn_get l

/-- Monotone words are the unique sorted representatives of Mathlib's
fixed-cardinality multisets. -/
noncomputable def monotoneWordEquivSym (n : ℕ) : {w : Fin n→A // Monotone w} ≃ Sym A n where
  toFun w := ⟨(List.ofFn w.val : Multiset A),by simp⟩
  invFun s := by
    let l := s.val.sort
    have hl : l.length=n := (Multiset.length_sort _).trans s.property
    have hp : l.SortedLE := List.sortedLE_iff_pairwise.mpr (Multiset.pairwise_sort _ _)
    refine ⟨listIndexed l hl,?_⟩
    intro i j hij
    exact hp.monotone_get (show i.cast hl.symm≤j.cast hl.symm from hij)
  left_inv w := by
    apply Subtype.ext
    apply List.ofFn_injective
    rw [ofFn_listIndexed]
    change ((List.ofFn w.val : Multiset A).sort) = List.ofFn w.val
    rw [Multiset.coe_sort,List.mergeSort_eq_self]
    exact w.property.sortedLE_ofFn.pairwise
  right_inv s := by
    apply Subtype.ext
    change (↑(List.ofFn (listIndexed s.val.sort
      ((Multiset.length_sort _).trans s.property))) : Multiset A) = s.val
    rw [ofFn_listIndexed]
    exact Multiset.sort_eq _ _

variable {R : Type*} [CommSemiring R] [Fintype A]

/-- The empty descent set evaluates precisely the actual complete
homogeneous symmetric polynomial, not an abstract function. -/
theorem fundamentalAt_empty_eq_hsymm_eval (n : ℕ) (x : A → R) :
    fundamentalAt (∅ : Finset (Fin n)) x = MvPolynomial.eval x (MvPolynomial.hsymm A R (n+1)) := by
  unfold fundamentalAt MvPolynomial.hsymm
  have hsub :
      (∑ w : Fin (n+1) → A with Monotone w ∧
        (∀ i ∈ (∅ : Finset (Fin n)),w i.castSucc < w i.succ),wordWeight x w) =
      ∑ w : {w : Fin (n+1)→A // Monotone w},wordWeight x w.val :=
    Finset.sum_subtype _ (fun w => by simp) _
  rw [hsub]
  change _ = (MvPolynomial.eval₂Hom (RingHom.id R) x) _
  rw [map_sum]
  apply Fintype.sum_equiv (monotoneWordEquivSym (n+1))
  intro w
  change (∏ i : Fin (n+1),x (w.val i)) =
    (MvPolynomial.eval₂Hom (RingHom.id R) x) (((List.ofFn w.val : Multiset A).map MvPolynomial.X).prod)
  rw [Multiset.map_coe,Multiset.prod_coe,List.map_ofFn,Fin.prod_ofFn,map_prod]
  simp

end NovelliThibon
