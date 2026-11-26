module
public import Conjectures.CyrusianKaplanOpenSimplexIndependent
public import Mathlib.LinearAlgebra.AffineSpace.FiniteDimensional
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

/-- The simplex in a proper hyperplane has at most as many
vertices as the ambient dimension. At equality it spans the
full hyperplane. This also gives the exact affine weights of
an integer origin supplied by a primitive lattice row. -/
theorem affineIndependent_hyperplane_size_and_weights {E : Type*}
    [AddCommGroup E] [Module ℝ E] [FiniteDimensional ℝ E] {n : ℕ} {v : Fin n→E}
    (hv : AffineIndependent ℝ v) (f : E →ᵃ[ℝ] ℝ) (c : ℝ) {x : E}
    (hx : f x≠c) (hV : ∀ i,f (v i)=c) :
    n ≤ Module.finrank ℝ E ∧ (n = Module.finrank ℝ E →
      ∀ z : E,f z=c → ∃ w : Fin n→ℝ,(∑ i,w i)=1 ∧ z=∑ i,w i • v i) := by
  let q : Fin (n+1)→E := Fin.cons x v
  have hI : AffineIndependent ℝ q := affineIndependent_cons_of_affine_hyperplane hv f c hx hV
  have hh := hI.card_le_finrank_succ
  rw [Fintype.card_fin] at hh
  have hLe := Submodule.finrank_le (vectorSpan ℝ (Set.range q))
  refine ⟨by omega,?_⟩
  intro hn z hz
  have hFull : affineSpan ℝ (Set.range q)=⊤ :=
    (hI.affineSpan_eq_top_iff_card_eq_finrank_add_one).mpr (by rw [Fintype.card_fin,hn])
  have hzS : z∈affineSpan ℝ (Set.range q) := by simp [hFull]
  obtain ⟨s,w,hSum,hzC⟩ := (mem_affineSpan_iff_eq_affineCombination ℝ E).mp hzS
  rw [Finset.affineCombination_eq_linear_combination _ _ _ hSum] at hzC
  classical
  let a (i : Fin (n+1)) := if i∈s then w i else 0
  have ha : (∑ i,a i)=1 := by
    rw [← Finset.sum_subset (Finset.subset_univ s) (fun i _ hi => (ite_eq_right hi : a i=0))]
    exact (Finset.sum_congr rfl (fun i hi => (ite_eq_left hi : a i=w i))).trans hSum
  have hq : (∑ i,a i • q i)=z := by
    rw [← Finset.sum_subset (Finset.subset_univ s) (fun i _ hi => show a i • q i=0 by simp [a,hi])]
    exact (Finset.sum_congr rfl (fun i hi => by simp [a,hi])).trans hzC.symm
  have hApply : ∑ i,a i*f (q i)=c := by
    have he (u : E) : f u=f.linear u+f 0 := congrFun f.decomp u
    calc
      _ = f.linear (∑ i,a i • q i)+(∑ i,a i)*f 0 := by
        rw [map_sum,Finset.sum_mul,← Finset.sum_add_distrib]
        apply Finset.sum_congr rfl
        intro i _
        simp [he (q i),mul_add,map_smul]
      _ = c := by rw [hq,ha,one_mul,← he z,hz]
  rw [Fin.sum_univ_succ] at ha hq hApply
  simp only [q,Fin.cons_zero,Fin.cons_succ,hV,← Finset.sum_mul] at hApply
  have hZero : a 0=0 := by
    have hEq : a 0*(f x-c)=0 := by
      calc
        _ = (a 0*f x+(∑ i : Fin n,a i.succ)*c)-(a 0+(∑ i : Fin n,a i.succ))*c := by ring
        _ = 0 := by rw [hApply,ha,one_mul,sub_self]
    exact (mul_eq_zero.mp hEq).resolve_right (sub_ne_zero.mpr hx)
  refine ⟨fun i => a i.succ,?_,?_⟩
  · simpa only [hZero,zero_add] using ha
  · simpa only [q,Fin.cons_zero,Fin.cons_succ,hZero,zero_smul,zero_add] using hq.symm

end CyrusianKaplan
