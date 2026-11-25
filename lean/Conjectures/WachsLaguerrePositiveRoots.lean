module
public import Conjectures.WachsLaguerreInterlaceAssemble

@[expose] public section
namespace WachsCompleteGraph

open Polynomial

theorem monicLaguerre_one_root : (monicLaguerre 1).eval 2 = 0 := by
  have h := (monicLaguerre_monic 1).eq_X_add_C (monicLaguerre_natDegree 1)
  have h0 : (monicLaguerre 1).coeff 0 = -2 := by
    rw [coeff_zero_eq_eval_zero,monicLaguerre_zero_value]
    norm_num
  rw [h,h0]
  norm_num

theorem laguerre_consecutive_interlacing (n : ℕ) :
    ∃ (a : Fin (n+1) → ℝ) (b : Fin n → ℝ),
      PositiveLaguerreRoots (n+1) a ∧ PositiveLaguerreRoots n b ∧ StrictlyInterlaces a b := by
  induction n with
  | zero =>
    let a : Fin (0+1) → ℝ := fun _ => 2
    let b : Fin 0 → ℝ := Fin.elim0
    have ha : StrictMono a := by
      intro i j hij
      have hi := i.isLt
      have hj := j.isLt
      have hh := Fin.lt_def.mp hij
      omega
    have hb : StrictMono b := fun i => Fin.elim0 i
    refine ⟨a,b,⟨ha,fun _ => by norm_num [a],?_⟩,⟨hb,fun i => Fin.elim0 i,?_⟩,fun i => Fin.elim0 i⟩
    · exact monic_eq_prod_of_distinct_roots (monicLaguerre_monic 1) (monicLaguerre_natDegree 1)
        a ha.injective (fun _ => monicLaguerre_one_root)
    · exact monic_eq_prod_of_distinct_roots (monicLaguerre_monic 0) (monicLaguerre_natDegree 0)
        b hb.injective (fun i => Fin.elim0 i)
  | succ n ih =>
    obtain ⟨a,b,ha,hb,hI⟩ := ih
    obtain ⟨r,hr,hI'⟩ := laguerre_successor_roots a b ha hb hI
    exact ⟨r,a,hr,ha,hI'⟩

/-- Every root is positive and the roots are distinct; the displayed
product has the exact degree, so is not a subset of the roots. -/
theorem laguerre_positive_roots (n : ℕ) : ∃ r : Fin n → ℝ, PositiveLaguerreRoots n r := by
  obtain ⟨_,r,_,hr,_⟩ := laguerre_consecutive_interlacing n
  exact ⟨r,hr⟩

end WachsCompleteGraph
