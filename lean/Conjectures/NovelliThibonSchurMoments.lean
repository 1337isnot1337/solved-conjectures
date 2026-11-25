module
public import Conjectures.NovelliThibonYoungRaises
public import Conjectures.NovelliThibonFillingFirstOrder

@[expose] public section
namespace NovelliThibon

theorem alphabetPairSum_X {ι : Type*} [Fintype ι] [LinearOrder ι] :
    alphabetPairSum (MvPolynomial.X : ι → MvPolynomial ι ℤ) = MvPolynomial.esymm ι ℤ 2 := by
  classical
  unfold alphabetPairSum MvPolynomial.esymm
  refine Finset.sum_bij (fun p _ => ({p.1,p.2}:Finset ι)) ?_ ?_ ?_ ?_
  · intro p hp
    have h := (Finset.mem_filter.mp hp).2
    exact Finset.mem_powersetCard_univ.mpr (Finset.card_eq_two.mpr ⟨p.1,p.2,h.ne',rfl⟩)
  · rintro ⟨a,b⟩ hp ⟨c,d⟩ hq h
    have hp' : b<a := (Finset.mem_filter.mp hp).2
    have hq' : d<c := (Finset.mem_filter.mp hq).2
    have ha : a=c := by
      have hac : a=c ∨ a=d := by
        have ha : a ∈ ({c,d}:Finset ι) := h ▸ Finset.mem_insert_self a _
        simpa only [Finset.mem_insert,Finset.mem_singleton] using ha
      have hca : c=a ∨ c=b := by
        have hc : c ∈ ({a,b}:Finset ι) := h.symm ▸ Finset.mem_insert_self c _
        simpa only [Finset.mem_insert,Finset.mem_singleton] using hc
      rcases hac with ha|ha
      · exact ha
      · rcases hca with hc|hc
        · exact hc.symm
        · exact False.elim ((hp'.trans (ha ▸ hq')).ne hc.symm)
    subst c
    have hb : b ∈ ({a,d}:Finset ι) := h ▸ (Finset.mem_insert_of_mem (Finset.mem_singleton_self b))
    exact Prod.ext rfl ((Finset.mem_insert.mp hb).resolve_left hp'.ne |> Finset.mem_singleton.mp)
  · intro s hs
    obtain ⟨a,b,hab,rfl⟩ := Finset.card_eq_two.mp (Finset.mem_powersetCard_univ.mp hs)
    obtain h|h := lt_or_gt_of_ne hab
    · exact ⟨(b,a),Finset.mem_filter.mpr ⟨Finset.mem_univ _,h⟩,Finset.pair_comm _ _⟩
    · exact ⟨(a,b),Finset.mem_filter.mpr ⟨Finset.mem_univ _,h⟩,rfl⟩
  · intro p hp
    have hp' := (Finset.mem_filter.mp hp).2
    simp [Finset.prod_insert,Finset.mem_singleton,hp'.ne']

/-- Coefficient extraction against the staircase alternant. On the
alternant expansion it selects precisely the strictly dominant term. -/
noncomputable def schurExtract {m : ℕ} (lam : YoungDiagram) :
    MvPolynomial (Fin (m+2)) ℤ →ₗ[ℤ] ℤ where
  toFun P := (alternant (@staircase m)*P).coeff
    (Finsupp.equivFunOnFinite.symm (shapeExponents lam))
  map_add' P Q := by simp [mul_add]
  map_smul' z P := by
    change (alternant (@staircase m) * (z • P)).coeff _ = z • (alternant (@staircase m)*P).coeff _
    rw [mul_smul_comm,MvPolynomial.coeff_smul]

open Classical in
/-- On the polynomial satisfying the bialternant characterization,
the extractor is exactly the standard coordinate functional. -/
theorem schurExtract_of_bialternant (m : ℕ) (lam nu : YoungDiagram)
    (hlam : lam.colLen 0 ≤ m+2) (hnu : nu.colLen 0 ≤ m+2)
    (P : MvPolynomial (Fin (m+2)) ℤ)
    (hP : alternant (@staircase m)*P = alternant (shapeExponents nu)) :
    schurExtract (m:=m) lam P = if nu=lam then 1 else 0 := by
  classical
  change (alternant (@staircase m)*P).coeff _ = _
  rw [hP,coeff_alternant_strict (shapeExponents_strict nu m) (shapeExponents_strict lam m)]
  by_cases h : nu=lam
  · simp [h]
  · have h' : shapeExponents nu (m:=m) ≠ shapeExponents lam (m:=m) :=
      fun e => h (shapeExponents_injective_of_height hnu hlam e)
    simp [h,h']

theorem schurExtract_e2_p1_pow (m n : ℕ) (lam : YoungDiagram) :
    schurExtract (m:=m) lam (MvPolynomial.esymm (Fin (m+2)) ℤ 2 *
      (MvPolynomial.psum (Fin (m+2)) ℤ 1)^n) =
      (exponentChains n (verticalTwoExponents m) (shapeExponents lam):ℤ) := by
  change (alternant (@staircase m)*(_*_)).coeff _ = _
  rw [← mul_assoc]
  exact coeff_staircase_e2_p1_pow m n (shapeExponents_strict lam m)

theorem schurExtract_alphabetPair_p1_pow (m n : ℕ) (lam : YoungDiagram) :
    schurExtract (m:=m) lam (alphabetPairSum MvPolynomial.X * (alphabetSum MvPolynomial.X)^n) =
      (exponentChains n (verticalTwoExponents m) (shapeExponents lam):ℤ) := by
  rw [alphabetPairSum_X]
  have hh : alphabetSum (MvPolynomial.X : Fin (m+2) → MvPolynomial (Fin (m+2)) ℤ) =
      MvPolynomial.psum (Fin (m+2)) ℤ 1 := by simp [alphabetSum,MvPolynomial.psum]
  rw [hh]
  exact schurExtract_e2_p1_pow m n lam

/-- The q-moment after dominant Schur extraction, for actual diagram
fillings. The count of valid vertical-start moves remains explicit. -/
theorem q_schur_filling_moment (m : ℕ) (μ lam : YoungDiagram) :
    schurExtract (m:=m) lam
      (∑ w : Cell μ → Fin (m+2), cellWordWeight MvPolynomial.X w *
        (qFillingExponent μ w : MvPolynomial (Fin (m+2)) ℤ)) =
        (∑ r : Fin (μ.colLen 0),((μ.rowLen r.val).choose 2:ℤ)) *
          (exponentChains (μ.card-2) (verticalTwoExponents m) (shapeExponents lam):ℤ) := by
  rw [q_filling_first_moment]
  let z : ℤ := ∑ r : Fin (μ.colLen 0),((μ.rowLen r.val).choose 2:ℤ)
  have h : (∑ r : Fin (μ.colLen 0),((μ.rowLen r.val).choose 2 : MvPolynomial (Fin (m+2)) ℤ)) =
      (z : MvPolynomial (Fin (m+2)) ℤ) := by simp only [z,Int.cast_sum,Int.cast_natCast]
  rw [h,← zsmul_eq_mul,map_smul,schurExtract_alphabetPair_p1_pow,zsmul_eq_mul]
  simp [z]

theorem t_schur_filling_moment (m : ℕ) (μ lam : YoungDiagram) {j : ℕ} (hj : 0<j) :
    schurExtract (m:=m) lam
      (∑ w : Cell μ → Fin (m+2), cellWordWeight MvPolynomial.X w *
        (tFillingExponent μ j w : MvPolynomial (Fin (m+2)) ℤ)) =
        (μ.rowLen j :ℤ) * (exponentChains (μ.card-2)
          (verticalTwoExponents m) (shapeExponents lam):ℤ) := by
  rw [t_filling_first_moment μ _ hj,← nsmul_eq_mul]
  rw [map_nsmul,schurExtract_alphabetPair_p1_pow,nsmul_eq_mul]

end NovelliThibon
