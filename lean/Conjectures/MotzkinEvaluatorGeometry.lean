import Conjectures.MotzkinEvaluatorResult
import Conjectures.MotzkinCyclic

/-! The evaluator's integer residues are exactly the circle pairs satisfying
the two Hermite relations. Their folded residue score is the circle score
multiplied by the quotient order. -/
namespace Motzkin.Evaluator

noncomputable def residuePoint (m k i y : ℕ) : UnitAddCircle × UnitAddCircle :=
  (((i:ℝ)/(m:ℝ):ℝ),((y:ℝ)/(m*k:ℕ):ℝ))

def residueScore (m k i y : ℕ) : ℕ :=
  min (min (k*i) (m*k-k*i)) (min y (m*k-y))

theorem norm_fraction (N r : ℕ) (hN : 0 < N) (hr : r < N) :
    ‖(((r:ℝ)/(N:ℝ):ℝ):UnitAddCircle)‖=(min r (N-r):ℝ)/(N:ℝ) := by
  let _ : NeZero N := ⟨hN.ne'⟩
  simpa only [ZMod.toAddCircle_natCast,Cyclic.folded,ZMod.val_natCast_of_lt hr]
    using Cyclic.norm_toAddCircle (r:ZMod N)

theorem fraction_eq_zero_iff (M q : ℕ) (hM : 0 < M) :
    (((q:ℝ)/(M:ℝ):ℝ):UnitAddCircle)=0 ↔ M ∣ q := by
  let _ : NeZero M := ⟨hM.ne'⟩
  rw [← ZMod.toAddCircle_natCast,ZMod.toAddCircle_eq_zero,ZMod.natCast_eq_zero_iff]

theorem residuePoint_relations (m k s i y : ℕ) (hm : 0 < m) (hk : 0 < k) :
    m • (residuePoint m k i y).1=0 ∧
      (s • (residuePoint m k i y).1+k • (residuePoint m k i y).2=0 ↔
        m ∣ y+s*i) := by
  have hm0 : (m:ℝ) ≠ 0 := by exact_mod_cast hm.ne'
  have hk0 : (k:ℝ) ≠ 0 := by exact_mod_cast hk.ne'
  constructor
  · change m • (((i:ℝ)/(m:ℝ):ℝ):UnitAddCircle)=0
    rw [← AddCircle.coe_nsmul]
    apply (AddCircle.coe_eq_zero_iff (1:ℝ)).mpr
    refine ⟨(i:ℤ),?_⟩
    simp only [nsmul_eq_mul,zsmul_eq_mul,Int.cast_natCast,mul_one]
    field_simp
  · have he : s • (residuePoint m k i y).1+k • (residuePoint m k i y).2=
        ((((y+s*i:ℕ):ℝ)/(m:ℝ):ℝ):UnitAddCircle) := by
      change s • (((i:ℝ)/(m:ℝ):ℝ):UnitAddCircle)+
        k • (((y:ℝ)/(m*k:ℕ):ℝ):UnitAddCircle)=_
      rw [← AddCircle.coe_nsmul,← AddCircle.coe_nsmul,← AddCircle.coe_add]
      congr 1
      simp only [nsmul_eq_mul,Nat.cast_add,Nat.cast_mul]
      field_simp <;> ring
    rw [he,fraction_eq_zero_iff m (y+s*i) hm]

theorem residuePoint_complete (m k s : ℕ) (hm : 0 < m) (hk : 0 < k)
    (x z : UnitAddCircle) (hx : m • x=0) (hz : s • x+k • z=0) :
    ∃ i y : ℕ, i < m ∧ y < m*k ∧ m ∣ y+s*i ∧ (x,z)=residuePoint m k i y := by
  have hN : 0 < m*k := Nat.mul_pos hm hk
  have hmx : m • (s • x)=0 := by
    rw [smul_smul,mul_comm m s,← smul_smul,hx,smul_zero]
  have hNz : (m*k) • z=0 := by
    have h := congrArg (fun w : UnitAddCircle => m • w) hz
    rw [nsmul_add,hmx,zero_add,smul_zero,smul_smul] at h
    exact h
  obtain ⟨i,hi,hix⟩ := (AddCircle.nsmul_eq_zero_iff hm).mp hx
  obtain ⟨y,hy,hyz⟩ := (AddCircle.nsmul_eq_zero_iff hN).mp hNz
  simp only [mul_one] at hix hyz
  have he : (x,z)=residuePoint m k i y := Prod.ext hix.symm hyz.symm
  have hrel := (residuePoint_relations m k s i y hm hk).2
  have hz' : s • (residuePoint m k i y).1+k • (residuePoint m k i y).2=0 := by
    rw [← he]
    exact hz
  exact ⟨i,y,hi,hy,hrel.mp hz',he⟩

theorem residuePoint_score (m k i y : ℕ) (hm : 0 < m) (hk : 0 < k)
    (hi : i < m) (hy : y < m*k) :
    min ‖(residuePoint m k i y).1‖ ‖(residuePoint m k i y).2‖=
      (residueScore m k i y:ℝ)/(m*k:ℕ) := by
  have hN : 0 < m*k := Nat.mul_pos hm hk
  have hki : k*i < m*k := by
    simpa only [mul_comm k m] using Nat.mul_lt_mul_of_pos_left hi hk
  have hm0 : (m:ℝ) ≠ 0 := by exact_mod_cast hm.ne'
  have hk0 : (k:ℝ) ≠ 0 := by exact_mod_cast hk.ne'
  have he : (i:ℝ)/(m:ℝ)=((k*i:ℕ):ℝ)/(m*k:ℕ) := by
    push_cast
    field_simp
  change min ‖(((i:ℝ)/(m:ℝ):ℝ):UnitAddCircle)‖
    ‖(((y:ℝ)/(m*k:ℕ):ℝ):UnitAddCircle)‖=_
  rw [he,norm_fraction (m*k) (k*i) hN hki,norm_fraction (m*k) y hN hy,
    min_div_div_right (Nat.cast_nonneg (m*k)),residueScore,Nat.cast_min]

theorem residueScore_feasible (m k s i y : ℕ) (hi : i < m) (hy : y < m*k)
    (hdiv : m ∣ y+s*i) : Feasible m k s (residueScore m k i y) := by
  have h₁ : residueScore m k i y ≤ k*i :=
    (min_le_left _ _).trans (min_le_left _ _)
  have h₂ : residueScore m k i y ≤ m*k-k*i :=
    (min_le_left _ _).trans (min_le_right _ _)
  have h₃ : residueScore m k i y ≤ y :=
    (min_le_right _ _).trans (min_le_left _ _)
  have h₄ : residueScore m k i y ≤ m*k-y :=
    (min_le_right _ _).trans (min_le_right _ _)
  have hki : k*i ≤ m*k := by nlinarith
  exact ⟨i,y,hi,hy,h₁,by omega,h₃,by omega,hdiv⟩

theorem feasible_le_residueScore (m k h : ℕ) {i y : ℕ}
    (hkiL : h ≤ k*i) (hkiU : k*i ≤ m*k-h)
    (hyL : h ≤ y) (hyU : y ≤ m*k-h) : h ≤ residueScore m k i y := by
  have hN : h ≤ m*k := hkiL.trans (hkiU.trans (Nat.sub_le _ _))
  apply le_min
  · exact le_min hkiL (by omega)
  · exact le_min hyL (by omega)

/-- The binary-search threshold is the exact maximum circle score on the
annihilator of the two Hermite relations, scaled by the quotient order. -/
theorem optimum_annihilator_maximum (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) :
    ∃ x z : UnitAddCircle, m • x=0 ∧ s • x+k • z=0 ∧
      min ‖x‖ ‖z‖=(optimum m k s:ℝ)/(m*k:ℕ) ∧
      ∀ x' z' : UnitAddCircle, m • x'=0 → s • x'+k • z'=0 →
        min ‖x'‖ ‖z'‖ ≤ (optimum m k s:ℝ)/(m*k:ℕ) := by
  have hN : (0:ℝ) < (m*k:ℕ) := by exact_mod_cast Nat.mul_pos hm hk
  obtain ⟨i,y,hi,hy,hkiL,hkiU,hyL,hyU,hdiv⟩ := (optimum_spec m k s hm hk).1
  have hscore : residueScore m k i y=optimum m k s := by
    apply le_antisymm
    · exact (optimum_spec m k s hm hk).2 _ (residueScore_feasible m k s i y hi hy hdiv)
    · exact feasible_le_residueScore m k _ hkiL hkiU hyL hyU
  obtain ⟨hx,hz⟩ := residuePoint_relations m k s i y hm hk
  refine ⟨(residuePoint m k i y).1,(residuePoint m k i y).2,hx,hz.mpr hdiv,?_,?_⟩
  · rw [residuePoint_score m k i y hm hk hi hy,hscore]
  · intro x' z' hx' hz'
    obtain ⟨i',y',hi',hy',hdiv',he⟩ := residuePoint_complete m k s hm hk x' z' hx' hz'
    have hle := (optimum_spec m k s hm hk).2 _
      (residueScore_feasible m k s i' y' hi' hy' hdiv')
    have hx'' := congrArg Prod.fst he
    have hz'' := congrArg Prod.snd he
    rw [hx'',hz'',residuePoint_score m k i' y' hm hk hi' hy']
    exact (div_le_div_iff_of_pos_right hN).mpr (by exact_mod_cast hle)

end Motzkin.Evaluator
