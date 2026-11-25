module
public import Conjectures.NovelliThibonAlternantChains
public import Mathlib.RingTheory.MvPolynomial.Symmetric.Defs

@[expose] public section
namespace NovelliThibon

theorem elementaryBySubsets_eq_esymm {ι : Type*} [Fintype ι] [DecidableEq ι] (k : ℕ) :
    elementaryBySubsets (ι:=ι) k = MvPolynomial.esymm ι ℤ k := by
  classical
  unfold elementaryBySubsets
  rw [MvPolynomial.esymm_eq_sum_monomial]
  apply Finset.sum_congr rfl
  intro s hs
  unfold squarefreeMonomial
  apply congrArg (fun a => MvPolynomial.monomial a (1:ℤ))
  apply Finsupp.ext
  intro i
  rw [Finsupp.finsetSum_apply]
  change (if i∈s then 1 else 0) = ∑ j ∈ s,(Finsupp.single j 1 : ι →₀ ℕ) i
  simp [Finsupp.single_apply,Finset.sum_ite_eq']

/-- Staircase exponent vector used to extract Schur coefficients from
an ordinary polynomial coefficient. We use at least two variables. -/
def staircase {m : ℕ} (i : Fin (m+2)) : ℕ := m+1-i.val

def firstTwo (m : ℕ) : Finset (Fin (m+2)) :=
  {⟨0,by omega⟩,⟨1,by omega⟩}

theorem firstTwo_card (m : ℕ) : (firstTwo m).card = 2 := by
  simp [firstTwo]

def verticalTwoExponents (m : ℕ) : Fin (m+2) → ℕ :=
  raiseOn staircase (firstTwo m)

theorem verticalTwoExponents_strict (m : ℕ) : StrictAnti (verticalTwoExponents m) := by
  intro i j hij
  have h₂ : j ∈ firstTwo m → i ∈ firstTwo m := by
    have hval : i.val<j.val := hij
    simp only [firstTwo,Finset.mem_insert,Finset.mem_singleton,Fin.ext_iff]
    omega
  have hii := i.isLt
  have hjj := j.isLt
  have hv : i.val<j.val := hij
  unfold verticalTwoExponents raiseOn staircase
  by_cases hi : i∈firstTwo m
  · by_cases hj : j∈firstTwo m <;> simp only [hi,hj,ite_true,ite_false] <;> omega
  · have hj : j∉firstTwo m := fun hm => hi (h₂ hm)
    simp only [hi,hj,ite_false]
    omega

theorem staircase_raise_pair_cancels {m : ℕ} (i j : Fin (m+2)) (hij : i<j)
    (hne : ({i,j}:Finset (Fin (m+2))) ≠ firstTwo m) :
    alternant (raiseOn staircase ({i,j}:Finset (Fin (m+2)))) = 0 := by
  have hval : i.val<j.val := hij
  have init : i.val=0 → j.val=1 → False := by
    intro hi hj
    apply hne
    have e₀ : i = ⟨0,by omega⟩ := Fin.ext hi
    have e₁ : j = ⟨1,by omega⟩ := Fin.ext hj
    simp only [e₀,e₁,firstTwo]
  by_cases hi : i.val=0
  · have hprev : 1<j.val := by by_contra! h; exact init hi (by omega)
    let k : Fin (m+2) := ⟨j.val-1,by have := j.isLt; omega⟩
    have hk : k.val+1=j.val := by dsimp [k]; omega
    have hki : k≠i := fun e => by have := congrArg Fin.val e; omega
    have hkj : k≠j := fun e => by have := congrArg Fin.val e; omega
    have hn : k ∉ ({i,j}:Finset (Fin (m+2))) := by simp [hki,hkj]
    have hm : j ∈ ({i,j}:Finset (Fin (m+2))) := by simp
    have hjb := j.isLt
    apply alternant_eq_zero_of_repeat _ hkj
    simp only [raiseOn,hn,hm,ite_false,ite_true,add_zero,staircase]
    omega
  · let k : Fin (m+2) := ⟨i.val-1,by have := i.isLt; omega⟩
    have hk : k.val+1=i.val := by dsimp [k]; omega
    have hki : k≠i := fun e => by have := congrArg Fin.val e; omega
    have hkj : k≠j := fun e => by have := congrArg Fin.val e; omega
    have hn : k ∉ ({i,j}:Finset (Fin (m+2))) := by simp [hki,hkj]
    have hm : i ∈ ({i,j}:Finset (Fin (m+2))) := by simp
    have hib := i.isLt
    apply alternant_eq_zero_of_repeat _ hki
    simp only [raiseOn,hn,hm,ite_false,ite_true,add_zero,staircase]
    omega

/-- The product (A_δ e_2) is exactly the vertical two-box
alternant: all other two-index rises have a repeated exponent. -/
theorem alternant_staircase_mul_e2 (m : ℕ) :
    alternant (@staircase m) * MvPolynomial.esymm (Fin (m+2)) ℤ 2 =
      alternant (verticalTwoExponents m) := by
  rw [← elementaryBySubsets_eq_esymm,alternant_mul_elementary]
  rw [Finset.sum_eq_single (firstTwo m)]
  · rfl
  · intro s hs hne
    obtain ⟨i,j,hij,rfl⟩ := Finset.card_eq_two.mp (Finset.mem_powersetCard_univ.mp hs)
    obtain h|h := lt_or_gt_of_ne hij
    · exact staircase_raise_pair_cancels i j h hne
    · rw [Finset.pair_comm] at hne ⊢
      exact staircase_raise_pair_cancels j i h hne
  · intro hn
    exact (hn (Finset.mem_powersetCard_univ.mpr (firstTwo_card m))).elim

/-- Dominant-coefficient extraction for (e_2p_1^n) in the alternant
model; the coefficient counts vertical-start one-cell chains. -/
theorem coeff_staircase_e2_p1_pow (m n : ℕ) {b : Fin (m+2) → ℕ} (hb : StrictAnti b) :
    ((alternant (@staircase m) * MvPolynomial.esymm (Fin (m+2)) ℤ 2) *
       (MvPolynomial.psum (Fin (m+2)) ℤ 1)^n).coeff (Finsupp.equivFunOnFinite.symm b) =
       (exponentChains n (verticalTwoExponents m) b : ℤ) := by
  rw [alternant_staircase_mul_e2]
  simp only [MvPolynomial.psum,pow_one]
  exact coeff_alternant_mul_p1_pow n (verticalTwoExponents_strict m) hb

end NovelliThibon
