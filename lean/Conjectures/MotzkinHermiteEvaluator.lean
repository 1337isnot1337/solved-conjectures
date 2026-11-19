import Conjectures.MotzkinHermiteQuotient
import Conjectures.MotzkinEvaluatorGeometry

/-! The evaluator returns the exact independence number of the Hermite
quotient and the two values of an attaining character. No enumeration of
vertices or of the mk characters is used by the evaluator. -/
namespace Motzkin.Hermite

def linearCharacter (x y : UnitAddCircle) : (ℤ × ℤ) →+ UnitAddCircle where
  toFun z := z.1 • x+z.2 • y
  map_zero' := by simp
  map_add' z w := by
    change (z.1+w.1) • x+(z.2+w.2) • y=_
    rw [add_zsmul,add_zsmul]
    abel

noncomputable def pointCharacter (m k s : ℕ) (x y : UnitAddCircle)
    (hx : m • x=0) (hy : s • x+k • y=0) : Group m k s →+ UnitAddCircle :=
  QuotientAddGroup.lift (lattice m k s) (linearCharacter x y) (by
    intro z hz
    obtain ⟨u,v,hu,hv⟩ := (mem_lattice m k s z.1 z.2).mp hz
    change z.1 • x+z.2 • y=0
    rw [hu,hv,add_zsmul,mul_zsmul,mul_zsmul,mul_zsmul,
      natCast_zsmul,natCast_zsmul,natCast_zsmul]
    calc
      _ = u • (m • x)+v • (s • x+k • y) := by rw [smul_add]; abel
      _ = 0 := by rw [hx,hy,smul_zero,smul_zero,add_zero])

theorem pointCharacter_first (m k s : ℕ) (x y : UnitAddCircle)
    (hx : m • x=0) (hy : s • x+k • y=0) :
    pointCharacter m k s x y hx hy (first m k s)=x := by
  simp [pointCharacter,first,quotient,linearCharacter]

theorem pointCharacter_second (m k s : ℕ) (x y : UnitAddCircle)
    (hx : m • x=0) (hy : s • x+k • y=0) :
    pointCharacter m k s x y hx hy (second m k s)=y := by
  simp [pointCharacter,second,quotient,linearCharacter]

theorem character_score_le_optimum (m k s : ℕ) (hm : 0 < m) (hk : 0 < k)
    (χ : Group m k s →+ UnitAddCircle) :
    min ‖χ (first m k s)‖ ‖χ (second m k s)‖ ≤
      (Evaluator.optimum m k s:ℝ)/(m*k:ℕ) := by
  obtain ⟨_,_,_,_,_,hmax⟩ := Evaluator.optimum_annihilator_maximum m k s hm hk
  apply hmax
  · rw [← map_nsmul,first_relation,map_zero]
  · rw [← map_nsmul,← map_nsmul,← map_add,second_relation,map_zero]

theorem independent_card_le_optimum (m k s : ℕ) [NeZero m] [NeZero k]
    (B : Finset (Group m k s))
    (hB : ∀ x ∈ B, x+first m k s ∉ B ∧ x+second m k s ∉ B) :
    B.card ≤ Evaluator.optimum m k s := by
  obtain ⟨χ,hχ⟩ := finite_independent_character (first m k s) (second m k s)
    (generated m k s) B hB
  have hupper := hχ.trans (character_score_le_optimum m k s (NeZero.pos m) (NeZero.pos k) χ)
  rw [card] at hupper
  have hN : (0:ℝ) < (m*k:ℕ) := by exact_mod_cast Nat.mul_pos (NeZero.pos m) (NeZero.pos k)
  exact_mod_cast (div_le_div_iff_of_pos_right hN).mp hupper

/-- The output threshold is the exact integer optimum, and its two residues
are the values of an actual attaining character on the quotient generators. -/
theorem quotientOptimum_independence (m k s : ℕ) [NeZero m] [NeZero k] (hs : s < m) :
    let z := Evaluator.quotientOptimum m k s
    ∃ A : Finset (Group m k s), ∃ χ : Group m k s →+ UnitAddCircle,
      (∀ x ∈ A, x+first m k s ∉ A ∧ x+second m k s ∉ A) ∧
      A.card=z.1 ∧
      χ (first m k s)=((((z.2.1:ℕ):ℝ)/(m*k:ℕ):ℝ):UnitAddCircle) ∧
      χ (second m k s)=((((z.2.2:ℕ):ℝ)/(m*k:ℕ):ℝ):UnitAddCircle) ∧
      min ‖χ (first m k s)‖ ‖χ (second m k s)‖=(A.card:ℝ)/(m*k:ℕ) ∧
      ∀ B : Finset (Group m k s),
        (∀ x ∈ B, x+first m k s ∉ B ∧ x+second m k s ∉ B) → B.card ≤ A.card := by
  let z := Evaluator.quotientOptimum m k s
  have hm : 0 < m := NeZero.pos m
  have hk : 0 < k := NeZero.pos k
  have hN : (0:ℝ) < (m*k:ℕ) := by exact_mod_cast Nat.mul_pos hm hk
  have hz : z.1=Evaluator.optimum m k s := by
    rw [Evaluator.quotientOptimum_threshold,Nat.mod_eq_of_lt hs]
  obtain ⟨i,hi,hxi,hy,hkiL,hkiU,hyL,hyU,hdiv⟩ := Evaluator.quotientOptimum_feasible m k s hm hk
  rw [Nat.mod_eq_of_lt hs] at hdiv
  change z.2.1=k*i at hxi
  change z.2.2 < m*k at hy
  change z.1 ≤ z.2.1 at hkiL
  change z.2.1 ≤ m*k-z.1 at hkiU
  change z.1 ≤ z.2.2 at hyL
  change z.2.2 ≤ m*k-z.1 at hyU
  change m ∣ z.2.2+s*i at hdiv
  rw [hxi] at hkiL hkiU
  have hscore : Evaluator.residueScore m k i z.2.2=z.1 := by
    apply le_antisymm
    · rw [hz]
      exact (Evaluator.optimum_spec m k s hm hk).2 _
        (Evaluator.residueScore_feasible m k s i z.2.2 hi hy hdiv)
    · exact Evaluator.feasible_le_residueScore m k _ hkiL hkiU hyL hyU
  let p := Evaluator.residuePoint m k i z.2.2
  obtain ⟨hpx,hpy⟩ := Evaluator.residuePoint_relations m k s i z.2.2 hm hk
  let χ := pointCharacter m k s p.1 p.2 hpx (hpy.mpr hdiv)
  have hχx : χ (first m k s)=p.1 := pointCharacter_first _ _ _ _ _ _ _
  have hχy : χ (second m k s)=p.2 := pointCharacter_second _ _ _ _ _ _ _
  have hχscore : min ‖χ (first m k s)‖ ‖χ (second m k s)‖=(z.1:ℝ)/(m*k:ℕ) := by
    rw [hχx,hχy,Evaluator.residuePoint_score m k i z.2.2 hm hk hi hy,hscore]
  obtain ⟨A,hA,hLower⟩ := finite_character_independent (first m k s) (second m k s) χ
  rw [hχscore,card] at hLower
  have hcard : A.card=z.1 := by
    apply le_antisymm
    · rw [hz]
      exact independent_card_le_optimum m k s A hA
    · exact_mod_cast (div_le_div_iff_of_pos_right hN).mp hLower
  refine ⟨A,χ,hA,hcard,?_,?_,?_,?_⟩
  · rw [hχx,hxi]
    change (((i:ℝ)/(m:ℝ):ℝ):UnitAddCircle)=_
    congr 1
    have hm0 : (m:ℝ) ≠ 0 := by exact_mod_cast hm.ne'
    have hk0 : (k:ℝ) ≠ 0 := by exact_mod_cast hk.ne'
    push_cast
    field_simp
  · exact hχy
  · rw [hχscore,hcard]
  · intro B hB
    rw [hcard,hz]
    exact independent_card_le_optimum m k s B hB

end Motzkin.Hermite
