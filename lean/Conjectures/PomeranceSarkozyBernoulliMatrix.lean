module
public import Conjectures.PomeranceSarkozyPrimeProduct
public import Conjectures.PomeranceSarkozyMatrixComparison

@[expose] public section
namespace PomeranceSarkozy

open Finset
open scoped BigOperators

variable {A : Type*} [DecidableEq A] {n : ℕ}

def setTupleMatrix (I : Finset A) (s : Fin n→↥I.powerset) (a : ↥I) (i : Fin n) : ℕ :=
  if a.val∈(s i).val then 1 else 0

theorem setTupleMatrix_injective (I : Finset A) :
    Function.Injective (setTupleMatrix I (n:=n)) := by
  intro s t h
  funext i
  apply Subtype.ext
  ext a
  by_cases ha : a∈I
  · have he := congrFun (congrFun h ⟨a,ha⟩) i
    change (if a∈(s i).val then (1:ℕ) else 0)=(if a∈(t i).val then 1 else 0) at he
    by_cases hs : a∈(s i).val <;> by_cases ht : a∈(t i).val <;> simp_all
  · have hs : a∉(s i).val := fun hh => ha (Finset.mem_powerset.mp (s i).property hh)
    have ht : a∉(t i).val := fun hh => ha (Finset.mem_powerset.mp (t i).property hh)
    simp [hs,ht]

private theorem subset_coord_card (I S : Finset A) (hS : S⊆I) :
    ((Finset.univ : Finset ↥I).filter fun a => a.val∈S).card=S.card := by
  let F : Finset ↥I := Finset.univ.filter fun a => a.val∈S
  have hF : F.map (Function.Embedding.subtype (fun a => a∈I))=S := by
    ext a
    constructor
    · intro h
      obtain ⟨x,hx,rfl⟩ := Finset.mem_map.mp h
      exact (Finset.mem_filter.mp hx).2
    · intro h
      exact Finset.mem_map.mpr ⟨⟨a,hS h⟩,Finset.mem_filter.mpr ⟨Finset.mem_univ _,h⟩,rfl⟩
  calc
    F.card=(F.map (Function.Embedding.subtype (fun a => a∈I))).card := by simp
    _=S.card := congrArg Finset.card hF

private theorem bernoulli_row_mass (I S : Finset A) (hS : S⊆I) (b : ℝ) :
    (∏ a : ↥I,bernoulliNatMass b (if a.val∈S then 1 else 0)) =
      b^S.card*(1-b)^(I.card-S.card) := by
  have hc := subset_coord_card I S hS
  have hn : ((Finset.univ : Finset ↥I).filter fun a => a.val∉S).card=I.card-S.card := by
    have he := Finset.card_filter_add_card_filter_not
      (s:=(Finset.univ : Finset ↥I)) (p:=fun a => a.val∈S)
    rw [hc,Finset.card_univ,Fintype.card_coe] at he
    omega
  have he (a : ↥I) :
      bernoulliNatMass b (if a.val∈S then 1 else 0)=(if a.val∈S then b else 1-b) := by
    by_cases h : a.val∈S <;> simp [bernoulliNatMass,h]
  simp_rw [he]
  rw [Finset.prod_ite,Finset.prod_const,Finset.prod_const,hc,hn]

/-- The subset-valued product and the zero-one matrix product have
the same atom weights under the literal occupancy map. -/
theorem bernoulli_matrix_mass_eq_subset_tuple (I : Finset A) (p : Fin n→ℕ)
    (s : Fin n→↥I.powerset) :
    realMatrixMass (fun i => bernoulliNatMass (1/(p i:ℝ))) (setTupleMatrix I s) =
      (bernoulliTupleMass I p s:ℝ) := by
  unfold realMatrixMass setTupleMatrix bernoulliTupleMass tupleWeight bernoulliAtoms
  rw [Finset.prod_comm]
  push_cast
  exact Finset.prod_congr rfl (fun i _ =>
    bernoulli_row_mass I (s i).val (Finset.mem_powerset.mp (s i).property) (1/(p i:ℝ)))

theorem bernoulli_matrix_mass_eq_zero_outside (I : Finset A) (p : Fin n→ℕ)
    (x : ↥I→Fin n→ℕ) (hx : x∉Set.range (setTupleMatrix I)) :
    realMatrixMass (fun i => bernoulliNatMass (1/(p i:ℝ))) x=0 := by
  classical
  have hex : ∃ a : ↥I,∃ i : Fin n,2≤x a i := by
    by_contra! h
    let s (i : Fin n) : ↥I.powerset :=
      ⟨I.filter (fun a => ∃ ha : a∈I,x ⟨a,ha⟩ i=1),
        Finset.mem_powerset.mpr (Finset.filter_subset _ _)⟩
    apply hx
    use s
    funext a i
    have he : a.val∈(s i).val ↔ x a i=1 := by
      simp [s,a.property]
    unfold setTupleMatrix
    by_cases h1 : x a i=1
    · rw [ite_eq_left (he.mpr h1),h1]
    · rw [ite_eq_right (fun hm => h1 (he.mp hm)),show x a i=0 by have hh := h a i; omega]
  obtain ⟨a,i,hi⟩ := hex
  unfold realMatrixMass
  apply Finset.prod_eq_zero (Finset.mem_univ a)
  apply Finset.prod_eq_zero (Finset.mem_univ i)
  simp [bernoulliNatMass,show x a i≠0 by omega,show x a i≠1 by omega]

end PomeranceSarkozy
