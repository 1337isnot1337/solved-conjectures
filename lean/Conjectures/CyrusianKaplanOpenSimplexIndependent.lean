module
public import Conjectures.CyrusianKaplanOpenSimplexCone
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

private theorem sum_smul_affineMap {E ι : Type*} [AddCommGroup E] [Module ℝ E]
    [Fintype ι] (f : E →ᵃ[ℝ] ℝ) (a : ι→ℝ) (v : ι→E) :
    (∑ i,a i * f (v i)) =
      f.linear (∑ i,a i • v i) + (∑ i,a i)*f 0 := by
  rw [map_sum,Finset.sum_mul,← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i _
  have he : f (v i)=f.linear (v i)+f 0 :=
    congrFun f.decomp (v i)
  simp [he,mul_add,map_smul]

/-- Coning a simplex over a hyperplane not containing its centre
preserves affine independence. -/
theorem affineIndependent_cons_of_affine_hyperplane {E : Type*}
    [AddCommGroup E] [Module ℝ E] {n : ℕ}
    {x : E} {v : Fin n→E} (hv : AffineIndependent ℝ v)
    (f : E →ᵃ[ℝ] ℝ) (c : ℝ) (hx : f x ≠ c) (hf : ∀ i,f (v i)=c) :
    AffineIndependent ℝ (Fin.cons x v) := by
  rw [affineIndependent_iff]
  intro s w hA hB j hj
  classical
  let a (i : Fin (n+1)) : ℝ := if i∈s then w i else 0
  have hSum : (∑ i,a i)=0 := by
    rw [← Finset.sum_subset (Finset.subset_univ s) (fun i _ hi => (ite_eq_right hi : a i=0))]
    exact (Finset.sum_congr rfl (fun i hi => (ite_eq_left hi : a i=w i))).trans hA
  have hSumV : (∑ i,a i • (@Fin.cons n (fun _ => E) x v) i)=0 := by
    rw [← Finset.sum_subset (Finset.subset_univ s)
      (fun i _ hi => show a i • (@Fin.cons n (fun _ => E) x v) i=0 by simp [a,hi])]
    exact (Finset.sum_congr rfl (fun i hi => by simp [a,hi])).trans hB
  have hRow : (∑ i,a i * f ((@Fin.cons n (fun _ => E) x v) i)) = 0 := by
    rw [sum_smul_affineMap, hSumV, hSum]
    simp
  rw [Fin.sum_univ_succ] at hSum hSumV hRow
  simp only [Fin.cons_zero, Fin.cons_succ, hf, ← Finset.sum_mul] at hRow
  have hZero : a 0 = 0 := by
    have he : a 0 * (f x-c)=0 := by
      calc
        _ = (a 0 * f x + (∑ i : Fin n,a i.succ)*c) -
            (a 0+(∑ i : Fin n,a i.succ))*c := by ring
        _ = 0 := by rw [hRow,hSum]; ring
    exact (mul_eq_zero.mp he).resolve_right (sub_ne_zero.mpr hx)
  simp only [hZero, zero_add, Fin.cons_zero, Fin.cons_succ, zero_smul] at hSum hSumV
  have hTail (i : Fin n) : a i.succ=0 :=
    hv.eq_zero_of_sum_eq_zero (s:=Finset.univ) hSum hSumV i (Finset.mem_univ _)
  have h : a j=0 := Fin.cases hZero hTail j
  simpa [a,hj] using h

end CyrusianKaplan
