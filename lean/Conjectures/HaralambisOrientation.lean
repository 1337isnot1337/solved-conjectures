import Mathlib.Combinatorics.Hall.Finite
import Mathlib.Data.Fintype.EquivFin
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Algebra.BigOperators.Ring.Finset
import Lean.Elab.Tactic.Omega
import Mathlib.Tactic.Ring

namespace Haralambis

open Finset

/-- Edges have independent identities, so parallel edges and loops are
retained. The two endpoint incidences both contribute to the degree. -/
def edgeDegree {E V : Type*} [Fintype E] [DecidableEq V] (lo hi : E → V) (v : V) : ℕ := by
  exact (univ.filter (fun e => lo e=v)).card+(univ.filter (fun e => hi e=v)).card

theorem degree_sum_on {E V : Type*} [Fintype E] [DecidableEq V]
    (lo hi : E → V) (S : Finset V) :
    ∑ v ∈ S, edgeDegree lo hi v =
      (univ.filter (fun e => lo e ∈ S)).card+(univ.filter (fun e => hi e ∈ S)).card := by
  simp only [edgeDegree,sum_add_distrib]
  exact congrArg₂ (·+·) (sum_card_fiberwise_eq_card_filter univ S lo)
    (sum_card_fiberwise_eq_card_filter univ S hi)

def slotNeighbors {E V : Type*} [Fintype E] [DecidableEq V]
    (lo hi : E → V) (q : V → ℕ) (s : Σ v, Fin (q v)) : Finset E := by
  exact univ.filter (fun e => lo e=s.1 ∨ hi e=s.1)

theorem half_degree_hall {E V : Type*} [Fintype E] [Fintype V]
    [DecidableEq E] [DecidableEq V]
    (lo hi : E → V) (q : V → ℕ) (hq : ∀ v, edgeDegree lo hi v=2*q v)
    (S : Finset (Σ v, Fin (q v))) :
    S.card ≤ (S.biUnion (slotNeighbors lo hi q)).card := by
  let VS : Finset V := S.image Sigma.fst
  let N : Finset E := S.biUnion (slotNeighbors lo hi q)
  have hs : S ⊆ VS.sigma (fun v => (univ : Finset (Fin (q v)))) := by
    intro s hs
    exact mem_sigma.mpr ⟨mem_image.mpr ⟨s,hs,rfl⟩,mem_univ _⟩
  have hslots : S.card ≤ ∑ v ∈ VS, q v := by
    have hh := card_le_card hs
    simpa only [card_sigma,card_univ,Fintype.card_fin] using hh
  have hLo : (univ.filter (fun e => lo e ∈ VS)).card ≤ N.card := by
    apply card_le_card
    intro e he
    obtain ⟨s,hs,hsv⟩ := mem_image.mp (mem_filter.mp he).2
    apply mem_biUnion.mpr
    refine ⟨s,hs,?_⟩
    apply mem_filter.mpr
    exact ⟨mem_univ _,Or.inl hsv.symm⟩
  have hHi : (univ.filter (fun e => hi e ∈ VS)).card ≤ N.card := by
    apply card_le_card
    intro e he
    obtain ⟨s,hs,hsv⟩ := mem_image.mp (mem_filter.mp he).2
    apply mem_biUnion.mpr
    refine ⟨s,hs,?_⟩
    apply mem_filter.mpr
    exact ⟨mem_univ _,Or.inr hsv.symm⟩
  have hsum : 2*(∑ v ∈ VS, q v) = ∑ v ∈ VS, edgeDegree lo hi v := by
    simp only [hq,mul_sum]
  rw [degree_sum_on] at hsum
  have hh : 2*S.card ≤ 2*N.card := by omega
  change S.card ≤ N.card
  omega

theorem slots_card {E V : Type*} [Fintype E] [Fintype V]
    [DecidableEq V]
    (lo hi : E → V) (q : V → ℕ) (hq : ∀ v, edgeDegree lo hi v=2*q v) :
    Fintype.card (Σ v, Fin (q v)) = Fintype.card E := by
  have hh := degree_sum_on lo hi (univ : Finset V)
  simp only [hq,mem_univ,filter_true,card_univ,←mul_sum] at hh
  have hsum : ∑ v, q v = Fintype.card E := by omega
  simpa only [Fintype.card_sigma,Fintype.card_fin] using hsum

theorem signed_incidence_identity {V : Type*} [DecidableEq V] (a b c v : V)
    (hc : c=a ∨ c=b) :
    (if c=a then (1:ℤ) else -1)*((if a=v then 1 else 0)-(if b=v then 1 else 0)) =
      2*(if c=v then 1 else 0)-(if a=v then 1 else 0)-(if b=v then 1 else 0) := by
  rcases hc with hc | hc <;> subst c <;> split_ifs <;> simp_all

/-- Every finite multigraph of even degree has a balanced orientation. The
proof matches half-degree vertex slots to incident edge IDs using finite
Hall marriage, rather than assuming an Euler tour or an embedded surface. -/
theorem exists_balanced_signs_of_half_degree {E V : Type*} [Fintype E] [Fintype V]
    [DecidableEq E] [DecidableEq V]
    (lo hi : E → V) (q : V → ℕ) (hq : ∀ v, edgeDegree lo hi v=2*q v) :
    ∃ s : E → ℤ, (∀ e, s e=1 ∨ s e= -1) ∧
      ∀ v, ∑ e, s e*((if lo e=v then 1 else 0)-(if hi e=v then 1 else 0))=0 := by
  obtain ⟨f,hfinj,hfmem⟩ :=
    (all_card_le_biUnion_card_iff_existsInjective' (slotNeighbors lo hi q)).mp
      (half_degree_hall lo hi q hq)
  have hfbij := (Fintype.bijective_iff_injective_and_card f).mpr
    ⟨hfinj,slots_card lo hi q hq⟩
  let e : (Σ v, Fin (q v)) ≃ E := Equiv.ofBijective f hfbij
  let assigned : E → V := fun x => (e.symm x).1
  have hincident : ∀ x, assigned x=lo x ∨ assigned x=hi x := by
    intro x
    have hh := hfmem (e.symm x)
    have he : f (e.symm x)=x := e.apply_symm_apply x
    simp only [slotNeighbors,mem_filter,mem_univ,true_and,he] at hh
    exact hh.elim (fun h => Or.inl h.symm) (fun h => Or.inr h.symm)
  let s : E → ℤ := fun x => if assigned x=lo x then 1 else -1
  refine ⟨s,?_,?_⟩
  · intro x
    dsimp [s]
    split_ifs <;> simp
  · intro v
    have hassigned : (∑ x : E, if assigned x=v then (1:ℤ) else 0) = q v := by
      calc
        _ = ∑ t : (Σ w, Fin (q w)), if t.1=v then (1:ℤ) else 0 := by
          symm
          apply Fintype.sum_equiv e
          intro t
          simp only [assigned,e.symm_apply_apply]
        _ = _ := by
          rw [Fintype.sum_sigma]
          calc
            _ = ∑ w : V, if w=v then (q w:ℤ) else 0 := by
              apply sum_congr rfl
              intro w hw
              by_cases hwv : w=v <;> simp [hwv]
            _ = _ := by simp
    have hlo : (∑ x : E, if lo x=v then (1:ℤ) else 0) =
        ((univ.filter (fun x => lo x=v)).card:ℤ) := by simp
    have hhi : (∑ x : E, if hi x=v then (1:ℤ) else 0) =
        ((univ.filter (fun x => hi x=v)).card:ℤ) := by simp
    have hdegree : ((univ.filter (fun x => lo x=v)).card:ℤ)+
        ((univ.filter (fun x => hi x=v)).card:ℤ) = 2*(q v:ℤ) := by
      have hh := hq v
      unfold edgeDegree at hh
      exact_mod_cast hh
    calc
      _ = ∑ x : E, (2*(if assigned x=v then (1:ℤ) else 0)-
          (if lo x=v then 1 else 0)-(if hi x=v then 1 else 0)) := by
        apply sum_congr rfl
        intro x hx
        exact signed_incidence_identity (lo x) (hi x) (assigned x) v (hincident x)
      _ = 0 := by
        rw [sum_sub_distrib,sum_sub_distrib,←mul_sum,hassigned,hlo,hhi]
        omega

theorem exists_balanced_signs {E V : Type*} [Fintype E] [Fintype V]
    [DecidableEq E] [DecidableEq V]
    (lo hi : E → V) (hdeg : ∀ v, Even (edgeDegree lo hi v)) :
    ∃ s : E → ℤ, (∀ e, s e=1 ∨ s e= -1) ∧
      ∀ v, ∑ e, s e*((if lo e=v then 1 else 0)-(if hi e=v then 1 else 0))=0 := by
  choose q hq using hdeg
  apply exists_balanced_signs_of_half_degree lo hi q
  intro v
  have hh := hq v
  omega

end Haralambis
