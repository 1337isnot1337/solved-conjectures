import Conjectures.LiWeighted
import Mathlib.RingTheory.MvPolynomial.Symmetric.FundamentalTheorem
import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Tactic

/-!
# Transfer of weighted homogeneity along the `e`-basis map

The map `aeval (fun i => esymm (Fin 3) ℚ (i + 1)) : MvPolynomial (Fin 3) ℚ → MvPolynomial (Fin 3) ℚ`
sends a polynomial weighted homogeneous of weighted degree `n` (for the weights `1, 2, 3`) to a
homogeneous polynomial of degree `n` (`LiWeighted.aeval_esymm_weightedHomogeneous`).  It is injective
(fundamental theorem of symmetric polynomials).  Hence a polynomial whose `e`-image is homogeneous
of degree `31` is weighted homogeneous of weighted degree `31`
(`LiWeighted.weightedHomogeneous_of_aeval`).  As a corollary, the `e`-basis coordinates
(`esymmAlgEquiv.symm`) of a symmetric homogeneous polynomial of degree `31` are weighted
homogeneous of weighted degree `31` (`LiWeighted.weightedHomogeneous_symm`).

The proof proceeds coefficientwise.  For a monomial `s` of `e`-weight `d ≠ 31`, the component
`q := weightedHomogeneousComponent wt d p` is nonzero but `aeval esymm q = 0`: it equals the
`d`-homogeneous component of the (degree `31`) image `aeval esymm p`, which vanishes because
`d ≠ 31`.  Injectivity of `aeval esymm` forces `q = 0`, a contradiction with `q.coeff s ≠ 0`.
-/

open MvPolynomial
open scoped BigOperators

namespace LiWeighted

/-- Every monomial has `e`-weight at most `3` times its total degree. -/
theorem wt_le_three_degree (s : Fin 3 →₀ ℕ) : Finsupp.weight wt s ≤ 3 * s.degree := by
  rw [Finsupp.weight_eq_sum, Finsupp.degree_eq_sum]
  simp only [smul_eq_mul]
  calc ∑ i : Fin 3, s i * wt i ≤ ∑ i : Fin 3, 3 * s i := by
        refine Finset.sum_le_sum fun i _ => ?_
        have h : wt i ≤ 3 := by simp only [wt]; omega
        rw [mul_comm]; exact Nat.mul_le_mul_right _ h
    _ = 3 * ∑ i : Fin 3, s i := by rw [Finset.mul_sum]

/-- Every polynomial is the sum of its weighted homogeneous components, for weights in
`Finset.range (p.totalDegree * 3 + 1)` (all possible weights, by `wt_le_three_degree`). -/
theorem decomp_range (p : MvPolynomial (Fin 3) ℚ) :
    p = ∑ m ∈ Finset.range (p.totalDegree * 3 + 1),
        MvPolynomial.weightedHomogeneousComponent wt m p := by
  set f : ℕ → MvPolynomial (Fin 3) ℚ := fun m => MvPolynomial.weightedHomogeneousComponent wt m p
  have hfs : (Function.support f).Finite :=
    MvPolynomial.weightedHomogeneousComponent_finsupp (w := wt) (φ := p)
  have h : (∑ᶠ (m : ℕ), f m) = p :=
    MvPolynomial.sum_weightedHomogeneousComponent (R := ℚ) (w := wt) (φ := p)
  rw [show (∑ᶠ (m : ℕ), f m) = ∑ m ∈ Set.Finite.toFinset hfs, f m from finsum_eq_sum f hfs] at h
  have hsub : Set.Finite.toFinset hfs ⊆ Finset.range (p.totalDegree * 3 + 1) := by
    intro m hm
    rw [Finset.mem_range]
    have hne : f m ≠ 0 := by
      intro h0
      have hmem := (Set.Finite.mem_toFinset hfs (a := m)).mp hm
      rw [Function.mem_support] at hmem
      exact hmem h0
    obtain ⟨d, hd⟩ := MvPolynomial.exists_coeff_ne_zero hne
    have hwd : Finsupp.weight wt d = m :=
      MvPolynomial.weightedHomogeneousComponent_isWeightedHomogeneous m p hd
    have hdm : d ∈ p.support := by
      rw [MvPolynomial.mem_support_iff]
      intro h0
      apply hd
      rw [MvPolynomial.coeff_weightedHomogeneousComponent, ite_eq_left hwd, h0]
    have h1 : Finsupp.weight wt d ≤ 3 * p.totalDegree :=
      calc Finsupp.weight wt d ≤ 3 * d.degree := wt_le_three_degree d
        _ ≤ 3 * p.totalDegree :=
              Nat.mul_le_mul_left 3 (Finset.le_sup (f := fun s => s.degree) hdm)
    omega
  have hRHS : (∑ m ∈ Set.Finite.toFinset hfs, f m) =
      ∑ m ∈ Finset.range (p.totalDegree * 3 + 1), f m := by
    refine Finset.sum_subset hsub ?_
    intro x _ hx
    rw [show f x = MvPolynomial.weightedHomogeneousComponent wt x p from rfl]
    rw [MvPolynomial.weightedHomogeneousComponent_eq_zero_of_notMem]
    intro hmem
    apply hx
    refine (Set.Finite.mem_toFinset hfs).mpr ?_
    rw [Function.mem_support]
    show MvPolynomial.weightedHomogeneousComponent wt x p ≠ 0
    obtain ⟨d, hd, hwd⟩ := Finset.mem_image.mp hmem
    intro h0
    have := congrArg (fun q => q.coeff d) h0
    simp only [AddMonoidAlgebra.coeff_zero] at this
    rw [MvPolynomial.coeff_weightedHomogeneousComponent, ite_eq_left hwd] at this
    exact (MvPolynomial.mem_support_iff.mp hd) this
  rw [hRHS] at h
  exact h.symm

/-- The `aeval esymm`-image decomposes over the weight range. -/
theorem aeval_decomp (p : MvPolynomial (Fin 3) ℚ) :
    MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1)) p =
      ∑ m ∈ Finset.range (p.totalDegree * 3 + 1),
        MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1))
          (MvPolynomial.weightedHomogeneousComponent wt m p) := by
  conv_lhs => rw [decomp_range p]
  rw [map_sum]

/-- For `d` in the weight range, the `d`-homogeneous component of the `aeval esymm`-image is the
`aeval esymm`-image of the `d`-weighted component. -/
theorem homogeneousComponent_aeval (d : ℕ) (p : MvPolynomial (Fin 3) ℚ)
    (hd : d ∈ Finset.range (p.totalDegree * 3 + 1)) :
    MvPolynomial.homogeneousComponent d
        (MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1)) p) =
      MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1))
        (MvPolynomial.weightedHomogeneousComponent wt d p) := by
  classical
  conv_lhs => rw [aeval_decomp p]
  rw [show MvPolynomial.homogeneousComponent d
        (∑ m ∈ Finset.range (p.totalDegree * 3 + 1),
          MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1))
            (MvPolynomial.weightedHomogeneousComponent wt m p)) =
        ∑ m ∈ Finset.range (p.totalDegree * 3 + 1),
          MvPolynomial.homogeneousComponent d
            (MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1))
              (MvPolynomial.weightedHomogeneousComponent wt m p)) from
      map_sum (MvPolynomial.homogeneousComponent d) _ _]
  rw [Finset.sum_eq_single_of_mem (M := MvPolynomial (Fin 3) ℚ) d hd]
  · exact MvPolynomial.homogeneousComponent_eq_self (n := d)
      (aeval_esymm_weightedHomogeneous
        (MvPolynomial.weightedHomogeneousComponent_isWeightedHomogeneous d p))
  · intro m _ hmd
    rw [MvPolynomial.homogeneousComponent_eq_zero' (n := d)]
    intro dm hdm
    have hHom : (MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1))
        (MvPolynomial.weightedHomogeneousComponent wt m p)).IsHomogeneous m :=
      aeval_esymm_weightedHomogeneous
        (MvPolynomial.weightedHomogeneousComponent_isWeightedHomogeneous m p)
    exact fun h => hmd ((hHom (Finsupp.mem_support_iff.mp hdm)).symm.trans (by
      rw [Finsupp.degree_eq_weight_one] at h; exact h))

/-- The `e`-basis map `aeval esymm` is injective, hence vanishes only at zero. -/
theorem aeval_esymm_eq_zero_iff {q : MvPolynomial (Fin 3) ℚ} :
    MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1)) q = 0 ↔ q = 0 := by
  refine ⟨fun h => ?_, fun h => by rw [h, map_zero]⟩
  have hinj : Function.Injective
      (MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1)) :
        MvPolynomial (Fin 3) ℚ →ₐ[ℚ] MvPolynomial (Fin 3) ℚ) := by
    have h0 := MvPolynomial.esymmAlgHom_injective (σ := Fin 3) (R := ℚ) (n := 3) (by decide)
    intro a b hab
    refine h0 ?_
    have hab' : ((MvPolynomial.esymmAlgHom (Fin 3) ℚ 3) a).val =
        ((MvPolynomial.esymmAlgHom (Fin 3) ℚ 3) b).val := by
      rw [MvPolynomial.esymmAlgHom_apply, MvPolynomial.esymmAlgHom_apply]
      exact hab
    exact Subtype.ext hab'
  exact hinj (by rw [h, map_zero])

/-- **Main lemma.**  The preimage under `aeval esymm` of a homogeneous polynomial of degree `31`
is weighted homogeneous of weighted degree `31`. -/
theorem weightedHomogeneous_of_aeval
    {p : MvPolynomial (Fin 3) ℚ}
    (hg : (MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1)) p).IsHomogeneous 31) :
    MvPolynomial.IsWeightedHomogeneous LiWeighted.wt p 31 := by
  classical
  rw [MvPolynomial.IsWeightedHomogeneous]
  intro s hs
  by_contra hne
  -- The weight of `s` lies in the finite range of components.
  have hmem : Finsupp.weight wt s ∈ Finset.range (p.totalDegree * 3 + 1) := by
    rw [Finset.mem_range]
    have hdm : s ∈ p.support := by
      rw [MvPolynomial.mem_support_iff]; exact hs
    have h1 : Finsupp.weight wt s ≤ 3 * p.totalDegree := by
      calc Finsupp.weight wt s ≤ 3 * s.degree := wt_le_three_degree s
        _ ≤ 3 * p.totalDegree :=
              Nat.mul_le_mul_left 3 (Finset.le_sup (f := fun x => x.degree) hdm)
    omega
  -- The `d`-homogeneous component of `aeval esymm p` vanishes since it is homogeneous of
  -- degree `31 ≠ d`.
  have hzero : MvPolynomial.homogeneousComponent (Finsupp.weight wt s)
      (MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1)) p) = 0 := by
    apply MvPolynomial.homogeneousComponent_eq_zero' (n := Finsupp.weight wt s)
    intro dm hdm hdeg
    apply hne
    have hdeg' : Finsupp.degree dm = 31 := by
      have hdm' : ((MvPolynomial.aeval
          (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1)) p)).coeff dm ≠ 0 :=
        MvPolynomial.mem_support_iff.mp hdm
      have := hg hdm'
      rw [Finsupp.degree_eq_weight_one]
      exact this
    exact hdeg.symm.trans hdeg'
  -- Hence the `d`-weight component maps to zero, and thus vanishes by injectivity.
  have himg : MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1))
      (MvPolynomial.weightedHomogeneousComponent wt (Finsupp.weight wt s) p) = 0 := by
    rw [← homogeneousComponent_aeval (Finsupp.weight wt s) p hmem]; exact hzero
  have hcomp : MvPolynomial.weightedHomogeneousComponent wt (Finsupp.weight wt s) p = 0 :=
    aeval_esymm_eq_zero_iff.mp himg
  -- But its coefficient at `s` is nonzero: contradiction.
  have hcoeff : (MvPolynomial.weightedHomogeneousComponent wt (Finsupp.weight wt s) p).coeff s ≠ 0 := by
    rw [MvPolynomial.coeff_weightedHomogeneousComponent, ite_eq_left rfl]; exact hs
  rw [hcomp] at hcoeff
  exact hcoeff rfl

/-- **Corollary.**  The coordinates of a symmetric homogeneous polynomial of degree `31` in the
elementary symmetric basis are weighted homogeneous of weighted degree `31`. -/
theorem weightedHomogeneous_symm
    (g : MvPolynomial (Fin 3) ℚ) (hg : g.IsSymmetric) (hh : g.IsHomogeneous 31) :
    MvPolynomial.IsWeightedHomogeneous LiWeighted.wt
      ((MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).symm ⟨g, hg⟩) 31 := by
  apply weightedHomogeneous_of_aeval
  have h1 : MvPolynomial.aeval (fun i : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (i + 1))
      ((MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).symm ⟨g, hg⟩) = g := by
    have h2 := (MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).apply_symm_apply ⟨g, hg⟩
    have h3 := congrArg Subtype.val h2
    rw [MvPolynomial.esymmAlgEquiv_apply] at h3
    rwa [MvPolynomial.esymmAlgHom_apply] at h3
  rw [h1]
  exact hh

end LiWeighted
