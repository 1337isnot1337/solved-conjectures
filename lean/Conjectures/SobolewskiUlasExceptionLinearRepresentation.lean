module

public import Conjectures.SobolewskiUlasExceptionRegularKernel

@[expose] public section
namespace SobolewskiUlasException

/-- Finite generation of the actual base-sixteen kernel gives a finite
digit-by-digit linear representation, without requiring a free basis. -/
theorem regular16_has_digitRepresentation {f : ℕ→ℤ} (h : IsRegular 16 f) :
    ∃ d : ℕ, Nonempty (@DigitRepresentation16 (Fin d) _ _ f) := by
  classical
  obtain ⟨s,hs⟩ := h
  let d := s.card
  let E : ↥s ≃ Fin d := s.equivFin
  let G (i : Fin d) : ℕ→ℤ := (E.symm i).val
  have hG : Set.range G=(s : Set (ℕ→ℤ)) := by
    ext g
    constructor
    · rintro ⟨i,rfl⟩
      exact (E.symm i).property
    · intro hg
      exact ⟨E ⟨g,hg⟩,by simp [G]⟩
  have he : Submodule.span ℤ (Set.range G)=kernelSpan 16 f := hG ▸ hs
  have hK (i : Fin d) : G i ∈ kernelSpan 16 f := by
    rw [← he]
    exact Submodule.subset_span ⟨i,rfl⟩
  have hsel (k : Fin 16) (i : Fin d) :
      ∃ c : Fin d → ℤ, ∑ j, c j • G j = sectionMap 16 k.val (G i) := by
    have hk := section_stable_on_span (f := f) k.isLt (hK i)
    rw [← he] at hk
    exact (Submodule.mem_span_range_iff_exists_fun ℤ).mp hk
  choose coeff hcoeff using hsel
  have hstart : f ∈ Submodule.span ℤ (Set.range G) := he.symm ▸ sequence_mem_kernelSpan 16 f
  obtain ⟨start,hstart⟩ := (Submodule.mem_span_range_iff_exists_fun ℤ).mp hstart
  let trans (k : Fin 16) : Matrix (Fin d) (Fin d) ℤ := fun i j => coeff k i j
  let digits (k : ℕ) : Matrix (Fin d) (Fin d) ℤ :=
    if hk : k<16 then trans ⟨k,hk⟩ else 0
  let V (n : ℕ) : Fin d → ℤ := fun i => G i n
  have htrans (k : ℕ) (hk : k<16) (n : ℕ) :
      (digits k).mulVec (V n)=V (16*n+k) := by
    funext i
    dsimp only [digits]
    rw [dite_eq_left hk]
    have hh := congrFun (hcoeff (⟨k,hk⟩ : Fin 16) i) n
    change (∑ j : Fin d, coeff ⟨k,hk⟩ i j • G j) n=G i (16*n+k) at hh
    simpa only [Finset.sum_apply,Pi.smul_apply,smul_eq_mul,Matrix.mulVec,dotProduct,
      trans,V] using hh
  have horbit (n : ℕ) : ((Nat.digits 16 n).map digits).prod.mulVec (V 0)=V n := by
    induction n using Nat.strong_induction_on with
    | h n ih =>
      by_cases h0 : n=0
      · subst n
        simp only [Nat.digits_zero,List.map_nil,List.prod_nil,Matrix.one_mulVec]
      · rw [Nat.digits_eq_cons_digits_div (by decide) h0,List.map_cons,List.prod_cons]
        rw [← Matrix.mulVec_mulVec,ih (n/16) (Nat.div_lt_self (Nat.pos_of_ne_zero h0) (by decide))]
        rw [htrans _ (Nat.mod_lt _ (by decide))]
        congr 1
        have hm := Nat.mod_add_div n 16
        omega
  let finish : Matrix (Fin d) (Fin d) ℤ →ₗ[ℤ] ℤ :=
    { toFun := fun M => ∑ i, start i * M.mulVec (V 0) i
      map_add' := by
        intro M N
        simp only [Matrix.add_mulVec,Pi.add_apply,mul_add,Finset.sum_add_distrib]
      map_smul' := by
        intro c M
        change (∑ i, start i * (c • M).mulVec (V 0) i)=c*(∑ i,start i*M.mulVec (V 0) i)
        rw [Finset.mul_sum,Matrix.smul_mulVec]
        apply Finset.sum_congr rfl
        intro i _
        simp only [Pi.smul_apply,smul_eq_mul]
        ring }
  refine ⟨d,⟨⟨digits,finish,?_⟩⟩⟩
  intro n
  change f n=∑ i,start i*(((Nat.digits 16 n).map digits).prod.mulVec (V 0)) i
  rw [horbit n]
  have hf := congrFun hstart n
  simpa only [Finset.sum_apply,Pi.smul_apply,smul_eq_mul,V] using hf.symm

end SobolewskiUlasException
