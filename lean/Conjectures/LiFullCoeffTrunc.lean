import Conjectures.LiFullCoeff

/-!
# Independence of the colour set for the full chromatic symmetric function

`Li.full_li_coefficient` proves the coefficient of `e₃ e₂¹⁴` for the chromatic
symmetric function of `Li.T` evaluated with `31` variables (colourings into
`Fin 31`).  A graph on `31` vertices cannot use more than `31` colours in a
proper colouring, so any larger colour set must give the same coefficient; this
file proves that invariance in Lean.

The main results are

* `LiFull.fullChromPolyOn`: the full chromatic symmetric function over an
  arbitrary finite colour type;
* `LiFull.aeval_restrictFin_fullChromPoly_T`: restricting an `N`-colour
  chromatic symmetric function (`N ≥ 31`) to the first `31` colours gives the
  `31`-colour one;
* `LiFull.killMN_coeff`: coefficient extraction through the restriction of the
  `e`-basis variables;
* `Li.full_li_coefficient_fin`: for every `N ≥ 31`, the `e₃ e₂¹⁴` coefficient is
  `29`;
* `Li.full_li_coefficient_of_card`: the same for an arbitrary finite colour
  type of cardinality at least `31`.
-/

open MvPolynomial SimpleGraph
open scoped BigOperators
open Li

namespace LiFull

/-! ## The full chromatic symmetric function over an arbitrary colour type -/

section FullOn

variable {V σ : Type*} [Fintype V] [DecidableEq V] [Fintype σ] [DecidableEq σ]

/-- A proper colouring with values in an arbitrary finite colour type. -/
def fullProperOn (G : SimpleGraph V) [DecidableRel G.Adj] (κ : V → σ) : Prop :=
  ∀ u v, G.Adj u v → κ u ≠ κ v

instance (G : SimpleGraph V) [DecidableRel G.Adj] (κ : V → σ) :
    Decidable (fullProperOn G κ) := by
  unfold fullProperOn
  infer_instance

/-- The full chromatic symmetric function of a finite graph over an arbitrary
finite colour type.  The variables are indexed by the colour type. -/
noncomputable def fullChromPolyOn (G : SimpleGraph V) [DecidableRel G.Adj] :
    MvPolynomial σ ℚ :=
  ∑ κ ∈ Finset.univ.filter (fullProperOn G),
    ∏ v : V, (MvPolynomial.X (κ v) : MvPolynomial σ ℚ)

/-- Relabelling colours by a permutation of the colour type. -/
def permColorOn (e : Equiv.Perm σ) : (V → σ) ≃ (V → σ) where
  toFun κ v := e (κ v)
  invFun κ v := e.symm (κ v)
  left_inv κ := by funext v; simp
  right_inv κ := by funext v; simp

theorem fullProperOn_permColorOn (G : SimpleGraph V) [DecidableRel G.Adj]
    (e : Equiv.Perm σ) (κ : V → σ) :
    fullProperOn G (permColorOn e κ) ↔ fullProperOn G κ := by
  constructor
  · intro h u v huv heq
    exact h u v huv (by simp [permColorOn, heq])
  · intro h u v huv heq
    exact h u v huv (e.injective heq)

/-- The full chromatic symmetric function over any colour type is symmetric. -/
theorem fullChromPolyOn_isSymmetric (G : SimpleGraph V) [DecidableRel G.Adj] :
    (fullChromPolyOn (σ := σ) G).IsSymmetric := by
  intro e
  rw [fullChromPolyOn, map_sum]
  refine Finset.sum_bij (fun κ _ => permColorOn e κ) ?_ ?_ ?_ ?_
  · intro κ hκ
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hκ ⊢
    exact (fullProperOn_permColorOn G e κ).mpr hκ
  · intro κ₁ _ κ₂ _ heq
    exact (permColorOn e).injective heq
  · intro κ hκ
    refine ⟨(permColorOn e).symm κ, ?_, ?_⟩
    · simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hκ ⊢
      exact (fullProperOn_permColorOn G e ((permColorOn e).symm κ)).mp (by simpa using hκ)
    · exact (permColorOn e).apply_symm_apply κ
  · intro κ _
    rw [map_prod]
    apply Finset.prod_congr rfl
    intro v _
    simp [permColorOn]

/-- The full chromatic symmetric function over any colour type is homogeneous
of degree the number of vertices. -/
theorem fullChromPolyOn_isHomogeneous (G : SimpleGraph V) [DecidableRel G.Adj] :
    (fullChromPolyOn (σ := σ) G).IsHomogeneous (Fintype.card V) := by
  rw [fullChromPolyOn]
  apply IsHomogeneous.sum
  intro κ _
  have := IsHomogeneous.prod (s := Finset.univ)
    (φ := fun v : V => (MvPolynomial.X (κ v) : MvPolynomial σ ℚ))
    (n := fun _ => 1) (by intro v _; exact isHomogeneous_X _ _)
  simpa using this

end FullOn

/-- The `31`-colour definition is the special case `σ = Fin 31` of the general
definition. -/
theorem fullChromPolyOn_fin31 :
    fullChromPolyOn (V := Fin 31) (σ := Fin 31) T = fullChromPoly T := rfl

/-- **Degree `31`.**  Over any finite colour type, the chromatic symmetric
function of `T` is homogeneous of degree `31`.  This is why the `31`-colour
truncation already determines the coefficient of `e₃ e₂¹⁴`: every monomial of a
homogeneous degree-`31` polynomial involves total degree `31`, and every proper
colouring of the `31`-vertex graph uses at most `31` colours. -/
theorem fullChromPolyOn_T_isHomogeneous_31 (σ : Type*) [Fintype σ] [DecidableEq σ] :
    (fullChromPolyOn (V := Fin 31) (σ := σ) T).IsHomogeneous 31 := by
  simpa using fullChromPolyOn_isHomogeneous (V := Fin 31) (σ := σ) T

section RestrictFin

variable {N : ℕ}

/-- The canonical embedding `Fin 31 → Fin N` for `N ≥ 31`. -/
def iotaN (hN : 31 ≤ N) : Fin 31 ↪ Fin N := Fin.castLEEmb hN

/-- Restriction of an `N`-colour polynomial to the first `31` colours: variables
with index `≥ 31` are set to zero. -/
noncomputable def restrictFin (hN : 31 ≤ N) : Fin N → MvPolynomial (Fin 31) ℚ :=
  fun i => if h : i.val < 31 then MvPolynomial.X (⟨i.val, h⟩ : Fin 31) else 0

lemma mem_range_iotaN_iff (hN : 31 ≤ N) (i : Fin N) :
    i ∈ Set.range (⇑(iotaN hN)) ↔ i.val < 31 := by
  constructor
  · rintro ⟨j, rfl⟩
    exact j.isLt
  · intro h
    exact ⟨⟨i.val, h⟩, by ext; rfl⟩

lemma restrictFin_iotaN (hN : 31 ≤ N) (j : Fin 31) :
    restrictFin hN (iotaN hN j) = MvPolynomial.X j := by
  simp [restrictFin, iotaN]

lemma restrictFin_of_not_mem (hN : 31 ≤ N) (i : Fin N)
    (h : i ∉ Set.range (⇑(iotaN hN))) : restrictFin hN i = 0 := by
  have : ¬ i.val < 31 := fun hv => h ((mem_range_iotaN_iff hN i).mpr hv)
  simp [restrictFin, this]

/-- **Restriction to `31` colours.**  Setting all colours `≥ 31` to zero in the
`N`-colour chromatic symmetric function gives the `31`-colour one. -/
theorem aeval_restrictFin_fullChromPoly_T (hN : 31 ≤ N) :
    MvPolynomial.aeval (restrictFin hN) (fullChromPolyOn (σ := Fin N) T)
      = fullChromPoly T := by
  classical
  have hproper : ∀ g : Fin 31 → Fin 31,
      fullProperOn T (fun x => iotaN hN (g x)) ↔ fullProperOn T g := by
    intro g
    constructor
    · intro h u v huv heq
      exact h u v huv (by show iotaN hN (g u) = iotaN hN (g v); rw [heq])
    · intro h u v huv heq
      exact h u v huv ((iotaN hN).injective heq)
  rw [fullChromPolyOn, map_sum]
  simp only [map_prod, MvPolynomial.aeval_X]
  rw [Finset.sum_filter]
  rw [sum_pi_of_vanishing (iotaN hN)
    (fun κ : Fin 31 → Fin N => if fullProperOn T κ then ∏ v, restrictFin hN (κ v) else 0)]
  · rw [← fullChromPolyOn_fin31, fullChromPolyOn, Finset.sum_filter]
    apply Finset.sum_congr rfl
    intro g _
    by_cases hp : fullProperOn T g
    · rw [if_pos hp, if_pos ((hproper g).mpr hp)]
      apply Finset.prod_congr rfl
      intro v _
      exact restrictFin_iotaN hN (g v)
    · rw [if_neg hp, if_neg (fun h => hp ((hproper g).mp h))]
  · intro κ x hx
    have h0 : restrictFin hN (κ x) = 0 := restrictFin_of_not_mem hN (κ x) hx
    by_cases hproper : fullProperOn T κ
    · rw [if_pos hproper, Finset.prod_eq_zero (Finset.mem_univ x) h0]
    · rw [if_neg hproper]

end RestrictFin

/-! ## Coefficient preservation for a general restriction `Fin m ↪ Fin n` -/

section KillMN

variable {m n : ℕ} (hmn : m ≤ n)

/-- The canonical embedding `Fin m → Fin n`. -/
def iotaMN : Fin m ↪ Fin n := Fin.castLEEmb hmn

/-- Restriction of an `n`-variable polynomial to the first `m` variables. -/
noncomputable def restrictMN (m : ℕ) : Fin n → MvPolynomial (Fin m) ℚ :=
  fun i => if h : i.val < m then MvPolynomial.X (⟨i.val, h⟩ : Fin m) else 0

/-- The corresponding algebra homomorphism. -/
noncomputable def killMN (m : ℕ) : MvPolynomial (Fin n) ℚ →ₐ[ℚ] MvPolynomial (Fin m) ℚ :=
  MvPolynomial.aeval (restrictMN (n := n) m)

lemma mem_range_iotaMN_iff (i : Fin n) :
    i ∈ Set.range (⇑(iotaMN hmn)) ↔ i.val < m := by
  constructor
  · rintro ⟨j, rfl⟩
    exact j.isLt
  · intro h
    exact ⟨⟨i.val, h⟩, by ext; rfl⟩

lemma restrictMN_iotaMN (j : Fin m) :
    restrictMN (n := n) m (iotaMN hmn j) = MvPolynomial.X j := by
  simp [restrictMN, iotaMN]

lemma restrictMN_of_not_mem (i : Fin n) (h : i ∉ Set.range (⇑(iotaMN hmn))) :
    restrictMN (n := n) m i = 0 := by
  have : ¬ i.val < m := fun hv => h ((mem_range_iotaMN_iff hmn i).mpr hv)
  simp [restrictMN, this]

lemma killMN_X (i : Fin n) :
    killMN (n := n) m (MvPolynomial.X i) = restrictMN (n := n) m i := by
  simp [killMN]

lemma killMN_X_iotaMN (j : Fin m) :
    killMN (n := n) m (MvPolynomial.X (iotaMN hmn j)) = MvPolynomial.X j := by
  rw [killMN_X, restrictMN_iotaMN]

lemma killMN_X_of_not_mem (i : Fin n) (h : i ∉ Set.range (⇑(iotaMN hmn))) :
    killMN (n := n) m (MvPolynomial.X i) = 0 := by
  rw [killMN_X, restrictMN_of_not_mem hmn i h]

lemma killMN_C (c : ℚ) :
    killMN (n := n) m (MvPolynomial.C c) = MvPolynomial.C c := by
  simp [killMN]

lemma killMN_rename_iotaMN (q : MvPolynomial (Fin m) ℚ) :
    killMN (n := n) m (MvPolynomial.rename (⇑(iotaMN hmn)) q) = q := by
  rw [MvPolynomial.rename_eq_aeval]
  change ((killMN (n := n) m).comp
    (MvPolynomial.aeval (MvPolynomial.X ∘ ⇑(iotaMN hmn)))) q = q
  rw [MvPolynomial.comp_aeval]
  simp only [Function.comp_apply, killMN_X_iotaMN]
  simp

lemma killMN_monomial_of_support (d : Fin n →₀ ℕ) (c : ℚ)
    (hd : ↑d.support ⊆ Set.range (⇑(iotaMN hmn))) :
    killMN (n := n) m (MvPolynomial.monomial d c)
      = MvPolynomial.monomial
          (Finsupp.comapDomain (⇑(iotaMN hmn)) d (iotaMN hmn).injective.injOn) c := by
  have hd_eq : Finsupp.embDomain (iotaMN hmn)
      (Finsupp.comapDomain (⇑(iotaMN hmn)) d (iotaMN hmn).injective.injOn) = d :=
    Finsupp.embDomain_comapDomain hd
  conv_lhs => rw [← hd_eq]
  rw [Finsupp.embDomain_eq_mapDomain, ← MvPolynomial.rename_monomial]
  rw [killMN_rename_iotaMN]

lemma killMN_monomial_of_not_support (d : Fin n →₀ ℕ) (c : ℚ)
    (hd : ¬ ↑d.support ⊆ Set.range (⇑(iotaMN hmn))) :
    killMN (n := n) m (MvPolynomial.monomial d c) = 0 := by
  obtain ⟨i, hi, hir⟩ := Set.not_subset.mp hd
  rw [MvPolynomial.monomial_eq]
  rw [map_mul, killMN_C]
  rw [Finsupp.prod, map_prod]
  rw [Finset.prod_eq_zero (i := i) hi]
  · simp
  · rw [map_pow, killMN_X_of_not_mem hmn i hir]
    have hdi : d i ≠ 0 := Finsupp.mem_support_iff.mp hi
    exact zero_pow hdi

lemma comapDomain_eq_iff_MN {d : Fin n →₀ ℕ} {e : Fin m →₀ ℕ}
    (hd : ↑d.support ⊆ Set.range (⇑(iotaMN hmn))) :
    Finsupp.comapDomain (⇑(iotaMN hmn)) d (iotaMN hmn).injective.injOn = e
      ↔ d = Finsupp.embDomain (iotaMN hmn) e := by
  constructor
  · intro h
    rw [← Finsupp.embDomain_comapDomain (f := iotaMN hmn) (g := d) hd, h]
  · intro h
    rw [h]
    exact Finsupp.comapDomain_embDomain (iotaMN hmn) e

lemma killMN_monomial_coeff (d : Fin n →₀ ℕ) (c : ℚ) (e : Fin m →₀ ℕ) :
    (killMN (n := n) m (MvPolynomial.monomial d c)).coeff e
      = if d = Finsupp.embDomain (iotaMN hmn) e then c else 0 := by
  by_cases hd : ↑d.support ⊆ Set.range (⇑(iotaMN hmn))
  · rw [killMN_monomial_of_support hmn d c hd, MvPolynomial.coeff_monomial]
    by_cases h : Finsupp.comapDomain (⇑(iotaMN hmn)) d (iotaMN hmn).injective.injOn = e
    · rw [if_pos h, if_pos ((comapDomain_eq_iff_MN hmn hd).mp h)]
    · have hne : ¬ (d = Finsupp.embDomain (iotaMN hmn) e) :=
        fun h' => h ((comapDomain_eq_iff_MN hmn hd).mpr h')
      rw [if_neg h, if_neg hne]
  · have hne : d ≠ Finsupp.embDomain (iotaMN hmn) e := by
      intro hde
      exact hd ((Finsupp.mem_range_embDomain_iff (iotaMN hmn) d).mp ⟨e, hde.symm⟩)
    rw [killMN_monomial_of_not_support hmn d c hd]
    simp [hne]

/-- Coefficient extraction through the restriction: for any polynomial in `n`
variables, the coefficient at `e` and at the embedded exponent agree. -/
lemma killMN_coeff (q : MvPolynomial (Fin n) ℚ) (e : Fin m →₀ ℕ) :
    (killMN (n := n) m q).coeff e = q.coeff (Finsupp.embDomain (iotaMN hmn) e) := by
  conv_lhs => rw [MvPolynomial.as_sum q]
  conv_rhs => rw [MvPolynomial.as_sum q]
  rw [map_sum, MvPolynomial.coeff_sum, MvPolynomial.coeff_sum]
  apply Finset.sum_congr rfl
  intro d _
  rw [killMN_monomial_coeff hmn, MvPolynomial.coeff_monomial]

end KillMN

/-! ## The coefficient is independent of `N ≥ 31` -/

section BridgeFin

variable {N : ℕ}

/-- The `e`-basis coordinates of the `N`-colour chromatic symmetric function. -/
noncomputable def fullECoordsFin (hN : 31 ≤ N) : MvPolynomial (Fin N) ℚ :=
  (MvPolynomial.esymmAlgEquiv (Fin N) ℚ (n := N) (Fintype.card_fin N)).symm
    ⟨fullChromPolyOn (σ := Fin N) T, fullChromPolyOn_isSymmetric T⟩

/-- The `k`-th elementary symmetric function in `m` variables vanishes for
`k > m`. -/
lemma esymm_fin_eq_zero_of_gt {m k : ℕ} (hk : m < k) :
    MvPolynomial.esymm (Fin m) ℚ k = 0 := by
  rw [MvPolynomial.esymm]
  have h : (Finset.univ : Finset (Fin m)).card < k := by simpa using hk
  rw [Finset.powersetCard_eq_empty.mpr h]
  simp

/-- The elementary symmetric functions of the restricted vector agree with those
of the `31` variables. -/
lemma aeval_restrictMN_esymm (hN : 31 ≤ N) (k : ℕ) :
    MvPolynomial.aeval (restrictMN (n := N) 31) (MvPolynomial.esymm (Fin N) ℚ k)
      = MvPolynomial.esymm (Fin 31) ℚ k := by
  have h := aeval_esymm_eq_of_zero_extend (R := ℚ) (S := MvPolynomial (Fin 31) ℚ)
    (n := N) (m := 31) hN (restrictMN (n := N) 31)
    (fun j : Fin 31 => MvPolynomial.X j) (by intro i; rfl) k
  simpa using h

lemma aeval_esymmN_fullECoordsFin (hN : 31 ≤ N) :
    MvPolynomial.aeval (fun i : Fin N => MvPolynomial.esymm (Fin N) ℚ (i.val + 1))
      (fullECoordsFin hN) = fullChromPolyOn (σ := Fin N) T := by
  have h2 := (MvPolynomial.esymmAlgEquiv (Fin N) ℚ (n := N) (Fintype.card_fin N)).apply_symm_apply
    ⟨fullChromPolyOn (σ := Fin N) T, fullChromPolyOn_isSymmetric T⟩
  have h3 := congrArg Subtype.val h2
  rw [MvPolynomial.esymmAlgEquiv_apply] at h3
  rw [MvPolynomial.esymmAlgHom_apply] at h3
  simpa [fullECoordsFin] using h3

/-- The map along the `31`-variable elementary generators factors through the
restriction from `N` to `31` colours. -/
lemma aeval_esymm31_factors_fin (hN : 31 ≤ N) :
    (MvPolynomial.aeval (fun i : Fin N => MvPolynomial.esymm (Fin 31) ℚ (i.val + 1)))
      = (MvPolynomial.aeval (fun j : Fin 31 => MvPolynomial.esymm (Fin 31) ℚ (j.val + 1))).comp
          (killMN (n := N) 31) := by
  apply MvPolynomial.algHom_ext
  intro i
  rw [AlgHom.comp_apply, killMN_X]
  simp only [restrictMN]
  by_cases h : i.val < 31
  · rw [dif_pos h]
    simp
  · rw [dif_neg h]
    rw [MvPolynomial.aeval_X]
    have hzero : MvPolynomial.esymm (Fin 31) ℚ (i.val + 1) = 0 :=
      esymm_fin_eq_zero_of_gt (by omega)
    simp [hzero]

/-- Injectivity of the elementary basis map in `m` variables. -/
lemma aeval_esymm_fin_injective (m : ℕ) :
    Function.Injective (fun q : MvPolynomial (Fin m) ℚ =>
      MvPolynomial.aeval (fun j : Fin m => MvPolynomial.esymm (Fin m) ℚ (j.val + 1)) q) := by
  intro a b hab
  apply MvPolynomial.esymmAlgHom_injective (σ := Fin m) (R := ℚ) (n := m)
    (by rw [Fintype.card_fin])
  apply Subtype.ext
  rw [MvPolynomial.esymmAlgHom_apply, MvPolynomial.esymmAlgHom_apply]
  exact hab

/-- The full `e`-coordinates for `N` colours restrict to the `31`-colour
`e`-coordinates. -/
lemma killMN_fullECoords (hN : 31 ≤ N) :
    killMN (n := N) 31 (fullECoordsFin hN) = fullECoords := by
  apply aeval_esymm_fin_injective 31
  change MvPolynomial.aeval (fun j : Fin 31 => MvPolynomial.esymm (Fin 31) ℚ (j.val + 1))
      (killMN (n := N) 31 (fullECoordsFin hN))
      = MvPolynomial.aeval (fun j : Fin 31 => MvPolynomial.esymm (Fin 31) ℚ (j.val + 1))
          fullECoords
  have hL : MvPolynomial.aeval (fun j : Fin 31 => MvPolynomial.esymm (Fin 31) ℚ (j.val + 1))
      (killMN (n := N) 31 (fullECoordsFin hN))
      = MvPolynomial.aeval (fun i : Fin N => MvPolynomial.esymm (Fin 31) ℚ (i.val + 1))
          (fullECoordsFin hN) := by
    rw [show (MvPolynomial.aeval (fun j : Fin 31 => MvPolynomial.esymm (Fin 31) ℚ (j.val + 1)))
        (killMN (n := N) 31 (fullECoordsFin hN))
        = ((MvPolynomial.aeval (fun j : Fin 31 => MvPolynomial.esymm (Fin 31) ℚ (j.val + 1))).comp
            (killMN (n := N) 31)) (fullECoordsFin hN) from rfl]
    rw [← aeval_esymm31_factors_fin hN]
  rw [hL]
  have hM : MvPolynomial.aeval (fun i : Fin N => MvPolynomial.esymm (Fin 31) ℚ (i.val + 1))
      (fullECoordsFin hN) = fullChromPoly T := by
    have h1 : (fun i : Fin N => MvPolynomial.esymm (Fin 31) ℚ (i.val + 1))
        = (fun i : Fin N =>
            MvPolynomial.aeval (restrictMN (n := N) 31)
              (MvPolynomial.esymm (Fin N) ℚ (i.val + 1))) := by
      funext i
      exact (aeval_restrictMN_esymm hN (i.val + 1)).symm
    rw [h1]
    rw [show (MvPolynomial.aeval (fun i : Fin N =>
          MvPolynomial.aeval (restrictMN (n := N) 31)
            (MvPolynomial.esymm (Fin N) ℚ (i.val + 1)))) (fullECoordsFin hN)
        = MvPolynomial.aeval (restrictMN (n := N) 31)
            (MvPolynomial.aeval (fun i : Fin N =>
              MvPolynomial.esymm (Fin N) ℚ (i.val + 1)) (fullECoordsFin hN)) from by
      rw [← MvPolynomial.comp_aeval]
      rfl]
    rw [aeval_esymmN_fullECoordsFin hN]
    rw [show MvPolynomial.aeval (restrictMN (n := N) 31) =
        MvPolynomial.aeval (restrictFin hN) from rfl]
    rw [aeval_restrictFin_fullChromPoly_T hN]
  rw [hM, aeval_esymm31_fullECoords]

/-- The index `e₃ e₂¹⁴` in `N` variables is the image of the index in `31`
variables. -/
lemma embDomain_iotaMN_lambda (hN : 31 ≤ N) :
    Finsupp.embDomain (iotaMN (m := 31) (n := N) hN)
        (Finsupp.single (1 : Fin 31) 14 + Finsupp.single (2 : Fin 31) 1)
      = (Finsupp.single (⟨1, by omega⟩ : Fin N) 14
          + Finsupp.single (⟨2, by omega⟩ : Fin N) 1) := by
  rw [Finsupp.embDomain_add, Finsupp.embDomain_single, Finsupp.embDomain_single]
  have h1 : iotaMN (m := 31) (n := N) hN (1 : Fin 31) = (⟨1, by omega⟩ : Fin N) := by
    ext; rfl
  have h2 : iotaMN (m := 31) (n := N) hN (2 : Fin 31) = (⟨2, by omega⟩ : Fin N) := by
    ext; rfl
  rw [h1, h2]

/-- The base `31`-variable coefficient, restated for `fullECoords`. -/
lemma fullECoords_coeff_29 :
    fullECoords.coeff (Finsupp.single (1 : Fin 31) 14 + Finsupp.single (2 : Fin 31) 1) = 29 := by
  simpa [fullECoords] using Li.full_li_coefficient

end BridgeFin

/-! ## Transport along an equivalence of colour types -/

section RenameOn

variable {V σ τ : Type*} [Fintype V] [DecidableEq V] [Fintype σ] [DecidableEq σ]
  [Fintype τ] [DecidableEq τ]

/-- The full chromatic symmetric function is natural under relabelling of the
colour set. -/
theorem rename_fullChromPolyOn (G : SimpleGraph V) [DecidableRel G.Adj] (e : σ ≃ τ) :
    MvPolynomial.rename (⇑e) (fullChromPolyOn (σ := σ) G) = fullChromPolyOn (σ := τ) G := by
  rw [fullChromPolyOn, fullChromPolyOn, map_sum]
  refine Finset.sum_bij (fun κ _ => e ∘ κ) ?_ ?_ ?_ ?_
  · intro κ hκ
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hκ ⊢
    intro u v huv h
    exact hκ u v huv (e.injective h)
  · intro κ₁ _ κ₂ _ h
    funext v
    exact e.injective (congrFun h v)
  · intro κ' hκ'
    refine ⟨e.symm ∘ κ', ?_, ?_⟩
    · simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hκ' ⊢
      intro u v huv h
      exact hκ' u v huv (by simpa using congrArg e h)
    · funext v
      simp
  · intro κ _
    rw [map_prod]
    apply Finset.prod_congr rfl
    intro v _
    simp

end RenameOn

section CardBridge

variable {σ : Type*} [Fintype σ] [DecidableEq σ]

/-- The `e`-basis coordinates of the chromatic symmetric function over an
arbitrary colour type agree with those over `Fin (card σ)`. -/
lemma eCoords_eq_of_equiv (hσ : 31 ≤ Fintype.card σ) :
    (MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).symm
        ⟨fullChromPolyOn (σ := σ) T, fullChromPolyOn_isSymmetric T⟩
      = fullECoordsFin hσ := by
  classical
  let N := Fintype.card σ
  let eσ : σ ≃ Fin N := Fintype.equivFin σ
  let pσ : MvPolynomial (Fin N) ℚ :=
    (MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).symm
      ⟨fullChromPolyOn (σ := σ) T, fullChromPolyOn_isSymmetric T⟩
  show pσ = fullECoordsFin hσ
  apply aeval_esymm_fin_injective N
  change MvPolynomial.aeval (fun j : Fin N => MvPolynomial.esymm (Fin N) ℚ (j.val + 1)) pσ
      = MvPolynomial.aeval (fun j : Fin N => MvPolynomial.esymm (Fin N) ℚ (j.val + 1))
          (fullECoordsFin hσ)
  have h1 : MvPolynomial.aeval (fun i : Fin N => MvPolynomial.esymm (σ := σ) ℚ (i.val + 1))
      pσ = fullChromPolyOn (σ := σ) T := by
    have h2 := (MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).apply_symm_apply
      ⟨fullChromPolyOn (σ := σ) T, fullChromPolyOn_isSymmetric T⟩
    have h3 := congrArg Subtype.val h2
    rw [MvPolynomial.esymmAlgEquiv_apply] at h3
    rw [MvPolynomial.esymmAlgHom_apply] at h3
    simpa [pσ] using h3
  have hcomp : (MvPolynomial.rename (⇑eσ)).comp
      (MvPolynomial.aeval (fun i : Fin N => MvPolynomial.esymm (σ := σ) ℚ (i.val + 1)))
      = MvPolynomial.aeval (fun i : Fin N =>
          MvPolynomial.esymm (Fin N) ℚ (i.val + 1)) := by
    rw [MvPolynomial.comp_aeval]
    congr 1
    funext i
    exact MvPolynomial.rename_esymm σ ℚ (i.val + 1) eσ
  have hp : MvPolynomial.aeval (fun i : Fin N => MvPolynomial.esymm (Fin N) ℚ (i.val + 1))
      pσ = fullChromPolyOn (σ := Fin N) T := by
    rw [← hcomp]
    change MvPolynomial.rename (⇑eσ)
        (MvPolynomial.aeval (fun i : Fin N => MvPolynomial.esymm (σ := σ) ℚ (i.val + 1)) pσ)
      = fullChromPolyOn (σ := Fin N) T
    rw [h1, rename_fullChromPolyOn]
  rw [hp, aeval_esymmN_fullECoordsFin hσ]

end CardBridge

end LiFull

namespace Li

/-- **Colour-set independence of the full coefficient.**  For every `N ≥ 31`,
the coefficient of `e₃ e₂¹⁴` in the `N`-colour chromatic symmetric function of
`T` is `29`.  In particular the `31`-colour theorem `Li.full_li_coefficient`
is the statement for the minimal sufficient colour set. -/
theorem full_li_coefficient_fin (N : ℕ) (hN : 31 ≤ N) :
    ((MvPolynomial.esymmAlgEquiv (Fin N) ℚ (n := N) (Fintype.card_fin N)).symm
      ⟨LiFull.fullChromPolyOn (σ := Fin N) T, LiFull.fullChromPolyOn_isSymmetric T⟩).coeff
      (Finsupp.single (⟨1, by omega⟩ : Fin N) 14
        + Finsupp.single (⟨2, by omega⟩ : Fin N) 1) = 29 := by
  change (LiFull.fullECoordsFin hN).coeff
    (Finsupp.single (⟨1, by omega⟩ : Fin N) 14
      + Finsupp.single (⟨2, by omega⟩ : Fin N) 1) = 29
  rw [← LiFull.embDomain_iotaMN_lambda hN]
  rw [← LiFull.killMN_coeff hN (LiFull.fullECoordsFin hN)
    (Finsupp.single (1 : Fin 31) 14 + Finsupp.single (2 : Fin 31) 1)]
  rw [LiFull.killMN_fullECoords hN]
  exact LiFull.fullECoords_coeff_29

/-- **Colour-set independence for an arbitrary finite colour type.**  If `σ` is
any finite colour type with at least `31` colours, the coefficient of
`e₃ e₂¹⁴` in the `σ`-colour chromatic symmetric function of `T` is `29`. -/
theorem full_li_coefficient_of_card {σ : Type*} [Fintype σ] [DecidableEq σ]
    (hσ : 31 ≤ Fintype.card σ) :
    ((MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).symm
      ⟨LiFull.fullChromPolyOn (σ := σ) T, LiFull.fullChromPolyOn_isSymmetric T⟩).coeff
      (Finsupp.single (⟨1, by omega⟩ : Fin (Fintype.card σ)) 14
        + Finsupp.single (⟨2, by omega⟩ : Fin (Fintype.card σ)) 1) = 29 := by
  rw [LiFull.eCoords_eq_of_equiv hσ]
  exact full_li_coefficient_fin (Fintype.card σ) hσ

end Li