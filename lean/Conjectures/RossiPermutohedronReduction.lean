module

public import Conjectures.RossiPermutohedronSignGrid
public import Conjectures.RossiPermutohedronTransform

@[expose] public section
namespace RossiPermutohedron
open Polynomial Set

theorem reciprocalShift_nonzero {p : ℝ[X]} (hn : p.eval 1 ≠ 0) : reciprocalShift p ≠ 0 := by
  intro h
  have he := congrArg (eval (0:ℝ)) (reverse_eq_zero.mp h)
  simp [eval_comp] at he
  exact hn he

/-- The reciprocal substitution carries the exact split of the roots of
`P` to Rossi's intervals, preserving simplicity by the degree bound. -/
theorem reciprocalShift_exact_roots {p : ℝ[X]} {r : Finset ℝ} {y : ℝ}
    (hn : p.eval 1 ≠ 0) (hdeg : p.natDegree = r.card+2)
    (hr : ∀ x∈r,x<0) (hy : y∈Ioo (0:ℝ) 1)
    (hroots : p.roots = (insert y (insert 0 r)).val) :
    ∃ (s : Finset ℝ) (z : ℝ), s.card=r.card ∧ (∀ x∈s,x∈Ioo (0:ℝ) 1) ∧ 1<z ∧
      (reciprocalShift p).roots = (insert z (insert 1 s)).val := by
  classical
  let e : ℝ ↪ ℝ := ⟨fun x => (1-x)⁻¹,shiftInversion_injective⟩
  let s := r.map e
  let z := e y
  have hp : p≠0 := fun h => hn (by simp [h])
  have hz : 1<z := shiftInversion_large hy
  have hS (x : ℝ) (hx : x∈s) : x∈Ioo (0:ℝ) 1 := by
    obtain ⟨u,hu,rfl⟩ := Finset.mem_map.mp hx
    exact shiftInversion_mem_small (hr u hu)
  have h1 : (1:ℝ) ∉ s := fun h => (lt_irrefl 1) (hS 1 h).2
  have hzs : z∉insert 1 s := by
    intro hx
    rcases Finset.mem_insert.mp hx with hx|hx
    · exact hz.ne' hx
    · exact (not_lt.mpr hz.le) (hS z hx).2
  have hm (x : ℝ) (hx : x∈insert y (insert 0 r)) : p.IsRoot x := by
    apply (mem_roots hp).mp
    rwa [hroots]
  have transRoot (x : ℝ) (hx : x<1) (hroot : p.IsRoot x) :
      (reciprocalShift p).IsRoot (e x) := by
    apply (reciprocalShift_eval_iff (inv_ne_zero (sub_pos.mpr hx).ne')).mpr
    change p.IsRoot (1-((1-x)⁻¹)⁻¹)
    rwa [shiftInversion_sub_one]
  have hle : (insert z (insert 1 s)).val ≤ (reciprocalShift p).roots := by
    apply (Multiset.le_iff_subset (insert z (insert 1 s)).nodup).mpr
    intro x hx
    apply (mem_roots (reciprocalShift_nonzero hn)).mpr
    rcases Finset.mem_insert.mp hx with rfl|hx
    · exact transRoot y hy.2 (hm y (Finset.mem_insert_self ..))
    rcases Finset.mem_insert.mp hx with rfl|hx
    · have h := transRoot 0 zero_lt_one (hm 0 (by simp))
      simpa [e] using h
    obtain ⟨u,hu,rfl⟩ := Finset.mem_map.mp hx
    exact transRoot u ((hr u hu).trans zero_lt_one) (hm u (by simp [hu]))
  have hcard : (insert z (insert 1 s)).card=r.card+2 := by
    rw [Finset.card_insert_of_notMem hzs,Finset.card_insert_of_notMem h1,Finset.card_map]
  have he := Multiset.eq_of_le_of_card_le hle (by
    have h := (card_roots' (reciprocalShift p)).trans (reciprocalShift_degree_le p)
    simpa only [← Finset.card_def,hcard,← hdeg] using h)
  exact ⟨s,z,Finset.card_map _,hS,hz,he.symm⟩

noncomputable def shiftedEulerian (A : ℝ[X]) : ℝ[X] :=
  1-(1-X)*A

theorem shiftedEulerian_eval0 {A : ℝ[X]} (hA : A.eval 0=1) :
    (shiftedEulerian A).eval 0=0 := by simp [shiftedEulerian,hA]

theorem shiftedEulerian_eval1 (A : ℝ[X]) : (shiftedEulerian A).eval 1=1 := by
  simp [shiftedEulerian]

theorem shiftedEulerian_derivative_eval0 {A : ℝ[X]} :
    (shiftedEulerian A).derivative.eval 0=A.eval 0-A.derivative.eval 0 := by
  simp [shiftedEulerian, derivative_sub, derivative_mul]
  ring

theorem shiftedEulerian_natDegree {A : ℝ[X]} (hA : A ≠ 0) :
    (shiftedEulerian A).natDegree=A.natDegree+1 := by
  have hX : (1-X : ℝ[X]).natDegree=1 := by
    rw [natDegree_sub]
    exact natDegree_X_sub_C _
  have hm : ((1-X)*A).natDegree=A.natDegree+1 := by
    rw [natDegree_mul, hX]
    · omega
    · intro h
      rw [h,natDegree_zero] at hX
      omega
    · exact hA
  rw [shiftedEulerian,natDegree_sub_eq_right_of_natDegree_lt, hm]
  simp [hm]

/-- The final algebraic and root-count portions of the published proof.
The actual sign grid and Eulerian permutation model must still be supplied. -/
theorem rossi_reduction_of_grid {m : ℕ} (A : ℝ[X]) (hdeg : A.natDegree=m+1)
    (h0 : A.eval 0=1) (hd : 1<A.derivative.eval 0)
    (g : Fin (m+1) → ℝ) (hmono : StrictAnti g) (hneg : ∀ j, g j < 0)
    (halt : ∀ i : Fin m,
       ((shiftedEulerian A).eval (g i.succ) < 0 ∧ 0 < (shiftedEulerian A).eval (g i.castSucc)) ∨
       ((shiftedEulerian A).eval (g i.castSucc) < 0 ∧ 0 < (shiftedEulerian A).eval (g i.succ))) :
    ∃ (s : Finset ℝ) (z : ℝ), s.card=m ∧ (∀ x∈s,x∈Ioo (0:ℝ) 1) ∧ 1<z ∧
      (reciprocalShift (shiftedEulerian A)).roots = (insert z (insert 1 s)).val := by
  have ha : A≠0 := by
    intro h
    simp [h] at h0
  have hp : (shiftedEulerian A).natDegree=m+2 := by rw [shiftedEulerian_natDegree ha,hdeg]
  have hder : (shiftedEulerian A).derivative.eval 0<0 := by
    rw [shiftedEulerian_derivative_eval0,h0]
    exact sub_neg.mpr hd
  obtain ⟨r,y,hr,hr',hy,hroots⟩ := roots_exact_of_sign_grid _ hp g hmono hneg halt
    (shiftedEulerian_eval0 h0) hder (by simp [shiftedEulerian_eval1])
  obtain ⟨s,z,hs,hs',hz,he⟩ := reciprocalShift_exact_roots
    (by simp [shiftedEulerian_eval1]) (hr ▸ hp) hr' hy hroots
  exact ⟨s,z,hs.trans hr,hs',hz,he⟩

end RossiPermutohedron
