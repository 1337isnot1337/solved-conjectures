module
public import Mathlib.Algebra.MvPolynomial.Basic
public import Mathlib.GroupTheory.Perm.Sign
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Tactic

@[expose] public section
namespace NovelliThibon

open Equiv

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- A determinant alternant, written as a signed sum over permutations
of variable exponents. -/
noncomputable def alternant (a : ι → ℕ) : MvPolynomial ι ℤ :=
  ∑ p : Perm ι, MvPolynomial.monomial
    (Finsupp.equivFunOnFinite.symm (a ∘ p.symm)) (p.sign : ℤ)

/-- Increase the exponent in just one coordinate. -/
def raiseAt (a : ι → ℕ) (j : ι) : ι → ℕ :=
  fun i => a i + if i=j then 1 else 0

omit [Fintype ι] in
theorem raiseAt_permute (a : ι → ℕ) (j : ι) (p : Perm ι) :
    raiseAt a j ∘ p.symm = raiseAt (a ∘ p.symm) (p j) := by
  funext i
  simp [raiseAt, Equiv.symm_apply_eq]

theorem monomial_raiseAt (a : ι → ℕ) (j : ι) (b : ℤ) :
    MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm (raiseAt a j)) b =
    MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm a) b * MvPolynomial.X j := by
  rw [← pow_one (MvPolynomial.X j),← MvPolynomial.monomial_add_single]
  have h : Finsupp.equivFunOnFinite.symm (raiseAt a j) =
      Finsupp.equivFunOnFinite.symm a + Finsupp.single j 1 := by
    apply Finsupp.ext
    intro i
    change raiseAt a j i = a i + (Finsupp.single j 1 : ι →₀ ℕ) i
    by_cases h : i=j
    · subst i
      simp [raiseAt]
    · simp [raiseAt,h]
  rw [h]

/-- Multiplication by the first power sum increases one exponent.
A later cancellation removes exactly the nonpartition moves. -/
theorem alternant_mul_p1 (a : ι → ℕ) :
    alternant a * (∑ j : ι, MvPolynomial.X j) = ∑ j : ι, alternant (raiseAt a j) := by
  unfold alternant
  rw [Finset.sum_mul]
  simp_rw [Finset.mul_sum]
  rw [Finset.sum_comm (s:=Finset.univ) (t:=Finset.univ) (f:=fun (j : ι) (p : Perm ι) =>
    MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm (raiseAt a j ∘ p.symm)) (p.sign : ℤ))]
  apply Finset.sum_congr rfl
  intro p _
  simp_rw [raiseAt_permute,monomial_raiseAt]
  exact (Equiv.sum_comp p (fun j => MvPolynomial.monomial
    (Finsupp.equivFunOnFinite.symm (a ∘ p.symm)) (p.sign : ℤ) * MvPolynomial.X j)).symm

omit [Fintype ι] in
theorem swap_equal_exponents {a : ι → ℕ} {i j : ι} (h : a i=a j) (k : ι) :
    a (Equiv.swap i j k) = a k := by
  by_cases hi : k=i
  · subst k
    simp [h]
  by_cases hj : k=j
  · subst k
    simp [h]
  simp [Equiv.swap_apply_of_ne_of_ne hi hj]

/-- An alternant whose exponent vector has a repetition cancels in pairs. -/
theorem alternant_eq_zero_of_repeat (a : ι → ℕ) {i j : ι} (hne : i ≠ j) (he : a i=a j) :
    alternant a = 0 := by
  let f := fun p : Perm ι => MvPolynomial.monomial
    (Finsupp.equivFunOnFinite.symm (a ∘ p.symm)) (p.sign : ℤ)
  change (∑ p : Perm ι, f p) = 0
  have hp (p : Perm ι) : f (p * swap i j) = -(f p) := by
    have he' : a ∘ (p * swap i j).symm = a ∘ p.symm := by
      funext k
      change a (swap i j (p.symm k)) = a (p.symm k)
      exact swap_equal_exponents he _
    simp [f,he',Perm.sign_mul,Perm.sign_swap hne]
  have h := Equiv.sum_comp (Equiv.mulRight (swap i j)) f
  change (∑ p : Perm ι, f (p * swap i j)) = ∑ p : Perm ι, f p at h
  simp_rw [hp,Finset.sum_neg_distrib] at h
  have h2 : (2:ℤ) • (∑ p : Perm ι, f p) = 0 := by
    rw [show (2:ℤ) = (1:ℤ)+1 by decide,add_smul,one_smul]
    nth_rewrite 1 [← h]
    exact neg_add_cancel _
  exact (smul_eq_zero.mp h2).resolve_left (by decide)

omit [Fintype ι] in
/-- Adding one to a set of exponent positions is equivariant. -/
def raiseOn (a : ι → ℕ) (s : Finset ι) : ι → ℕ :=
  fun i => a i + if i∈s then 1 else 0

noncomputable def squarefreeMonomial (s : Finset ι) : MvPolynomial ι ℤ :=
  MvPolynomial.monomial
    (Finsupp.equivFunOnFinite.symm (fun i => if i∈s then 1 else 0)) 1

noncomputable def elementaryBySubsets (k : ℕ) : MvPolynomial ι ℤ :=
  ∑ s ∈ (Finset.univ : Finset ι).powersetCard k, squarefreeMonomial s

omit [Fintype ι] in
theorem raiseOn_permute (a : ι → ℕ) (s : Finset ι) (p : Perm ι) :
    raiseOn a s ∘ p.symm = raiseOn (a ∘ p.symm) (s.map p.toEmbedding) := by
  ext i
  have h : p.symm i ∈ s ↔ i ∈ s.map p.toEmbedding := by
    simp
  simp only [Function.comp_apply,raiseOn,h]

theorem monomial_raiseOn (a : ι → ℕ) (s : Finset ι) (b : ℤ) :
    MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm (raiseOn a s)) b =
      MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm a) b * squarefreeMonomial s := by
  rw [squarefreeMonomial,MvPolynomial.monomial_mul_monomial,mul_one]
  apply congrArg (fun m => MvPolynomial.monomial m b)
  apply Finsupp.ext
  intro i
  rfl

/-- The full elementary shift identity for alternants, before
cancellation of the repeated-exponent terms. -/
theorem alternant_mul_elementary (a : ι → ℕ) (k : ℕ) :
    alternant a * elementaryBySubsets (ι:=ι) k =
      ∑ s ∈ (Finset.univ : Finset ι).powersetCard k,alternant (raiseOn a s) := by
  unfold alternant elementaryBySubsets
  rw [Finset.sum_mul]
  simp_rw [Finset.mul_sum]
  rw [Finset.sum_comm (s:=(Finset.univ : Finset ι).powersetCard k)
    (t:=(Finset.univ : Finset (Perm ι)))]
  apply Finset.sum_congr rfl
  intro p _
  simp_rw [raiseOn_permute,monomial_raiseOn]
  let f : Finset ι → MvPolynomial ι ℤ :=
    fun s => MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm (a ∘ p.symm))
      (p.sign : ℤ) * squarefreeMonomial s
  change (∑ s ∈ (Finset.univ : Finset ι).powersetCard k,f s) =
    ∑ s ∈ (Finset.univ : Finset ι).powersetCard k,f (s.map p.toEmbedding)
  have hm : ((Finset.univ : Finset ι).powersetCard k).map
        (Finset.mapEmbedding p.toEmbedding).toEmbedding = (Finset.univ : Finset ι).powersetCard k := by
    rw [← Finset.powersetCard_map,Finset.map_univ_equiv p]
  calc
    _ = ∑ s ∈ ((Finset.univ : Finset ι).powersetCard k).map (Finset.mapEmbedding p.toEmbedding).toEmbedding,f s := by rw [hm]
    _ = _ := Finset.sum_map _ _ _

omit [Fintype ι] in
/-- If the input exponent sequence decreases strictly, a unit raise
either preserves that order or creates a repeated pair. -/
theorem raiseAt_strictAnti_or_repeat [LinearOrder ι] {a : ι → ℕ} (ha : StrictAnti a) (j : ι) :
    StrictAnti (raiseAt a j) ∨
      ∃ i k : ι, i < k ∧ raiseAt a j i = raiseAt a j k := by
  classical
  by_cases h : StrictAnti (raiseAt a j)
  · exact Or.inl h
  · right
    unfold StrictAnti at h
    push Not at h
    obtain ⟨i,k,hik,hik'⟩ := h
    have h₀ := ha hik
    refine ⟨i,k,hik,le_antisymm hik' ?_⟩
    unfold raiseAt
    split <;> split <;> omega

open Classical in
theorem alternant_mul_p1_valid [LinearOrder ι] {a : ι → ℕ} (ha : StrictAnti a) :
    alternant a * (∑ j : ι,MvPolynomial.X j) =
      ∑ j ∈ (Finset.univ.filter fun j : ι => StrictAnti (raiseAt a j)),alternant (raiseAt a j) := by
  rw [alternant_mul_p1,Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro j _
  obtain h | ⟨i,k,hik,hik'⟩ := raiseAt_strictAnti_or_repeat ha j
  · simp [h]
  · by_cases h : StrictAnti (raiseAt a j)
    · simp [h]
    · simp [h,alternant_eq_zero_of_repeat _ hik.ne hik']

end NovelliThibon
