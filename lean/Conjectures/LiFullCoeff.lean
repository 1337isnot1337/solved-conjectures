import Conjectures.LiMain
import Mathlib.RingTheory.MvPolynomial.Symmetric.FundamentalTheorem
import Mathlib.RingTheory.MvPolynomial.Symmetric.Eval
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.MvPolynomial.Rename
import Mathlib.Data.Finsupp.Basic
import Mathlib.Data.Fintype.Fin
import Mathlib.Data.Multiset.Powerset
import Mathlib.Algebra.BigOperators.Group.Multiset.Basic
import Mathlib.Tactic

/-!
# The full chromatic symmetric function of Li's tree

`Li.li_coefficient` proves the coefficient of `e₃ e₂¹⁴` in the three-variable
chromatic symmetric polynomial of the explicit 31-vertex tree `T`.

This file formalizes the bridge to the *full* chromatic symmetric function: the
sum over proper colourings by an arbitrary finite colour set, evaluated in as
many variables as there are colours.  Since the chromatic symmetric function of a
graph of order `31` is homogeneous of degree `31`, the coefficient of
`e₃ e₂¹⁴` is computed faithfully by the three-variable restriction: the
elementary basis element `e_j` with `j > 3` vanishes when only three variables are
kept, and `e_j` with `j ≤ 3` restricts to the corresponding elementary symmetric
polynomial in three variables.

The main result is `Li.full_li_coefficient`.
-/

open MvPolynomial SimpleGraph
open scoped BigOperators

open Li

namespace LiFull

/-! ## Multiset elementary symmetric functions and zero extension -/

section MultisetEsymm

open Finset

variable {R : Type*} [CommSemiring R]

/-- Recurrence for the multiset elementary symmetric functions. -/
lemma esymm_cons (a : R) (s : Multiset R) (n : ℕ) :
    (a ::ₘ s).esymm (n + 1) = s.esymm (n + 1) + a * s.esymm n := by
  rw [Multiset.esymm, Multiset.esymm, Multiset.esymm, Multiset.powersetCard_cons,
    Multiset.map_add, Multiset.sum_add]
  rw [show (Multiset.map Multiset.prod (Multiset.powersetCard (n + 1) s)).sum
      = s.esymm (n + 1) from rfl]
  rw [Multiset.map_map]
  rw [show (Multiset.prod ∘ Multiset.cons a) = fun x : Multiset R => a * x.prod by
    funext x; exact Multiset.prod_cons a x]
  rw [Multiset.sum_map_mul_left]

/-- Prepending a zero does not change the `n`-th elementary symmetric function. -/
lemma esymm_cons_zero (s : Multiset R) (n : ℕ) :
    (0 ::ₘ s).esymm (n + 1) = s.esymm (n + 1) := by
  rw [esymm_cons, zero_mul, add_zero]

/-- Adding a block of zeros does not change the `n`-th elementary symmetric function. -/
lemma esymm_replicate_zero_add (s : Multiset R) (c n : ℕ) :
    (Multiset.replicate c 0 + s).esymm n = s.esymm n := by
  induction c with
  | zero => simp
  | succ c ih =>
      rw [Multiset.replicate_succ]
      cases n with
      | zero => simp
      | succ n =>
          rw [Multiset.cons_add, esymm_cons_zero, ih]

/-- The multiset of values of a function on `Fin (n+1)`, split off at `0`. -/
lemma multiset_map_univ_fin_succ {n : ℕ} (f : Fin (n + 1) → R) :
    (Finset.univ.val.map f : Multiset R)
      = f 0 ::ₘ (Finset.univ.val.map (fun i : Fin n => f i.succ)) := by
  rw [Finset.val_univ_fin, List.finRange_succ]
  simp only [List.map_cons, List.map_map, Multiset.map_coe]
  rfl

/-- A function that is identically zero has multiset of values a block of zeros. -/
lemma multiset_map_univ_fin_of_zero {n : ℕ} (f : Fin (n + 1) → R)
    (hf : ∀ i : Fin (n + 1), f i = 0) :
    (Finset.univ.val.map f : Multiset R) = Multiset.replicate (n+1) 0 := by
  rw [show f = fun _ => (0:R) from funext hf]
  simp [Finset.val_univ_fin, Multiset.coe_replicate, Multiset.replicate_succ]

/-- **Zero extension for elementary symmetric functions.**  If `f : Fin n → R`
agrees with `h : Fin j → R` on the first `j` coordinates and vanishes elsewhere,
then all elementary symmetric evaluations agree. -/
lemma esymm_map_univ_fin_eq {n j : ℕ} (hj : j ≤ n) (f : Fin n → R)
    (hf : ∀ i : Fin n, j ≤ i.val → f i = 0) (k : ℕ) :
    (Finset.univ.val.map f).esymm k
      = (Finset.univ.val.map (fun i : Fin j => f (Fin.castLE hj i))).esymm k := by
  induction n generalizing j k with
  | zero =>
      have hj0 : j = 0 := by omega
      subst hj0
      simp [Finset.val_univ_fin]
  | succ n ih =>
      cases j with
      | zero =>
          have hrep : (Finset.univ.val.map f : Multiset R) = Multiset.replicate (n+1) 0 :=
            multiset_map_univ_fin_of_zero f (fun i => hf i (by omega))
          rw [hrep]
          have h := esymm_replicate_zero_add (0 : Multiset R) (n+1) k
          rw [show (Multiset.replicate (n+1) 0 : Multiset R)
              = Multiset.replicate (n+1) 0 + 0 by simp]
          rw [h]
          simp
      | succ j' =>
          have hj' : j' ≤ n := by omega
          rw [multiset_map_univ_fin_succ]
          rw [multiset_map_univ_fin_succ
            (fun i : Fin (j' + 1) => f (Fin.castLE (by omega : j' + 1 ≤ n + 1) i))]
          have hf' : ∀ i : Fin n, j' ≤ i.val → (fun i : Fin n => f i.succ) i = 0 := by
            intro i hi
            apply hf
            simp only [Fin.val_succ]
            omega
          have hEq : ∀ m, (Multiset.map (fun i : Fin n => f i.succ) univ.val).esymm m
              = (Multiset.map
                  (fun i : Fin j' => f (Fin.castLE (by omega : j' + 1 ≤ n + 1) (Fin.succ i)))
                  univ.val).esymm m := by
            intro m
            have h := ih hj' (fun i : Fin n => f i.succ) hf' m
            convert h using 2
            rw [show (fun i : Fin j' => f (Fin.castLE (by omega : j' + 1 ≤ n + 1) (Fin.succ i)))
                = (fun i : Fin j' => f (Fin.castLE hj' i).succ) from by
              funext i
              congr 1]
          cases k with
          | zero => simp
          | succ k =>
              rw [esymm_cons, esymm_cons, hEq k, hEq (k+1)]
              congr 1

/-- Zero extension, stated for `aeval` of an elementary symmetric polynomial. -/
lemma aeval_esymm_eq_of_zero_extend {R S : Type*} [CommSemiring R] [CommSemiring S]
    [Algebra R S] {n m : ℕ} (hmn : m ≤ n) (f : Fin n → S) (h : Fin m → S)
    (hf : ∀ i : Fin n, f i = if hi : i.val < m then h ⟨i.val, hi⟩ else 0) (k : ℕ) :
    aeval f (esymm (Fin n) R k) = aeval h (esymm (Fin m) R k) := by
  rw [aeval_esymm_eq_multiset_esymm, aeval_esymm_eq_multiset_esymm]
  have hf' : ∀ i : Fin n, m ≤ i.val → f i = 0 := by
    intro i hi
    rw [hf i]
    simp only [hi, Nat.not_lt, dif_neg]
  rw [esymm_map_univ_fin_eq hmn f hf' k]
  rw [show (fun i : Fin m => f (Fin.castLE hmn i)) = h from by
    funext i
    rw [hf (Fin.castLE hmn i)]
    simp]

end MultisetEsymm

/-! ## Reindexing sums over function spaces -/

section SumPi

variable {α β γ M : Type*} [Fintype α] [Fintype β] [Fintype γ] [DecidableEq α]
  [DecidableEq β] [AddCommMonoid M]

/-- A sum over all functions `α → β` of a term that vanishes whenever a value
lies outside the range of an embedding `γ ↪ β` equals the sum over functions
`α → γ`. -/
lemma sum_pi_of_vanishing (e : γ ↪ β) (F : (α → β) → M)
    (hF : ∀ f : α → β, ∀ x : α, f x ∉ Set.range (⇑e) → F f = 0) :
    ∑ f : α → β, F f = ∑ g : α → γ, F (fun x => e (g x)) := by
  classical
  let e' : (α → γ) → (α → β) := fun g => fun x => e (g x)
  have he' : Function.Injective e' := by
    intro g h hgh
    funext x
    exact e.injective (congrFun hgh x)
  have hzero : ∀ f : α → β, f ∉ Finset.univ.image e' → F f = 0 := by
    intro f hf
    by_contra hFne
    have hall : ∀ x : α, f x ∈ Set.range (⇑e) := by
      intro x
      by_contra hx
      exact hFne (hF f x hx)
    choose g hg using hall
    exact hf (Finset.mem_image.mpr ⟨g, Finset.mem_univ _, funext hg⟩)
  calc ∑ f : α → β, F f
      = ∑ f ∈ Finset.univ.image e', F f :=
          (Finset.sum_subset (by simp) (fun f _ hf => hzero f hf)).symm
    _ = ∑ g : α → γ, F (e' g) := by
        rw [Finset.sum_image]
        intro a _ b _ hab
        exact he' hab

end SumPi

/-! ## The full chromatic symmetric function -/

section FullChromatic

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A proper colouring where the colour set is the vertex set itself. -/
def fullProper (G : SimpleGraph V) [DecidableRel G.Adj] (κ : V → V) : Prop :=
  ∀ u v, G.Adj u v → κ u ≠ κ v

instance (G : SimpleGraph V) [DecidableRel G.Adj] (κ : V → V) :
    Decidable (fullProper G κ) := by
  unfold fullProper
  infer_instance

/-- The full chromatic symmetric function of a finite graph, evaluated with as
many variables as vertices.  Since this polynomial is homogeneous of degree
`Fintype.card V`, this captures every coefficient of the full chromatic
symmetric function. -/
noncomputable def fullChromPoly (G : SimpleGraph V) [DecidableRel G.Adj] :
    MvPolynomial V ℚ :=
  ∑ κ ∈ Finset.univ.filter (fullProper G),
    ∏ v : V, (MvPolynomial.X (κ v) : MvPolynomial V ℚ)

/-- Relabelling colours by a permutation of the colour set. -/
def permColorV (e : Equiv.Perm V) : (V → V) ≃ (V → V) where
  toFun κ v := e (κ v)
  invFun κ v := e.symm (κ v)
  left_inv κ := by funext v; simp
  right_inv κ := by funext v; simp

theorem fullProper_permColorV (G : SimpleGraph V) [DecidableRel G.Adj]
    (e : Equiv.Perm V) (κ : V → V) :
    fullProper G (permColorV e κ) ↔ fullProper G κ := by
  constructor
  · intro h u v huv heq
    exact h u v huv (by simp [permColorV, heq])
  · intro h u v huv heq
    exact h u v huv (e.injective heq)

/-- The full chromatic symmetric function is symmetric. -/
theorem fullChromPoly_isSymmetric (G : SimpleGraph V) [DecidableRel G.Adj] :
    (fullChromPoly G).IsSymmetric := by
  intro e
  rw [fullChromPoly, map_sum]
  refine Finset.sum_bij (fun κ _ => permColorV e κ) ?_ ?_ ?_ ?_
  · intro κ hκ
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hκ ⊢
    exact (fullProper_permColorV G e κ).mpr hκ
  · intro κ₁ _ κ₂ _ heq
    exact (permColorV e).injective heq
  · intro κ hκ
    refine ⟨(permColorV e).symm κ, ?_, ?_⟩
    · simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hκ ⊢
      exact (fullProper_permColorV G e ((permColorV e).symm κ)).mp (by simpa using hκ)
    · exact (permColorV e).apply_symm_apply κ
  · intro κ _
    rw [map_prod]
    apply Finset.prod_congr rfl
    intro v _
    simp [permColorV]

/-- The full chromatic symmetric function is homogeneous of degree the number of
vertices. -/
theorem fullChromPoly_isHomogeneous (G : SimpleGraph V) [DecidableRel G.Adj] :
    (fullChromPoly G).IsHomogeneous (Fintype.card V) := by
  rw [fullChromPoly]
  apply IsHomogeneous.sum
  intro κ _
  have := IsHomogeneous.prod (s := Finset.univ)
    (φ := fun v : V => (MvPolynomial.X (κ v) : MvPolynomial V ℚ))
    (n := fun _ => 1) (by intro v _; exact isHomogeneous_X _ _)
  simpa using this

end FullChromatic

/-! ## The three-variable restriction -/

section Restriction

/-- The canonical embedding `Fin 3 → Fin 31`. -/
def iota : Fin 3 ↪ Fin 31 := Fin.castLEEmb (by decide : 3 ≤ 31)

/-- The three-variable restriction map: variables `≥ 3` are set to zero. -/
noncomputable def restrict3 : Fin 31 → MvPolynomial (Fin 3) ℚ :=
  fun i => if h : i.val < 3 then MvPolynomial.X (⟨i.val, h⟩ : Fin 3) else 0

/-- The partial substitution as an algebra homomorphism. -/
noncomputable def kill31 : MvPolynomial (Fin 31) ℚ →ₐ[ℚ] MvPolynomial (Fin 3) ℚ :=
  MvPolynomial.aeval restrict3

lemma mem_range_iota_iff (i : Fin 31) : i ∈ Set.range (⇑iota) ↔ i.val < 3 := by
  constructor
  · rintro ⟨j, rfl⟩
    exact j.isLt
  · intro h
    exact ⟨⟨i.val, h⟩, by ext; rfl⟩

lemma restrict3_iota (j : Fin 3) : restrict3 (iota j) = MvPolynomial.X j := by
  simp [restrict3, iota]

lemma restrict3_of_not_mem (i : Fin 31) (h : i ∉ Set.range (⇑iota)) : restrict3 i = 0 := by
  have : ¬ i.val < 3 := fun hv => h ((mem_range_iota_iff i).mpr hv)
  simp [restrict3, this]

lemma kill31_X (i : Fin 31) : kill31 (MvPolynomial.X i) = restrict3 i := by
  simp [kill31]

/-- **Faithfulness of the three-variable restriction on the chromatic symmetric
function.**  Restricting all variables with index `≥ 3` to zero gives exactly the
three-variable chromatic symmetric polynomial. -/
theorem aeval_restrict3_fullChromPoly_T :
    MvPolynomial.aeval restrict3 (fullChromPoly T) = chromPoly T := by
  classical
  have hproper_iff : ∀ g : Fin 31 → Fin 3,
      fullProper T (fun x => iota (g x)) ↔ Li.proper3 T g := by
    intro g
    constructor
    · intro h u v huv heq
      exact h u v huv (by show iota (g u) = iota (g v); rw [heq])
    · intro h u v huv heq
      exact h u v huv (iota.injective heq)
  rw [fullChromPoly, map_sum]
  simp only [map_prod, MvPolynomial.aeval_X]
  rw [Finset.sum_filter]
  rw [sum_pi_of_vanishing iota
    (fun κ : Fin 31 → Fin 31 => if fullProper T κ then ∏ v, restrict3 (κ v) else 0)]
  · rw [Li.chromPoly, Finset.sum_filter]
    apply Finset.sum_congr rfl
    intro g _
    by_cases hp : Li.proper3 T g
    · rw [if_pos hp, if_pos ((hproper_iff g).mpr hp)]
      apply Finset.prod_congr rfl
      intro v _
      exact restrict3_iota (g v)
    · rw [if_neg hp, if_neg (fun h => hp ((hproper_iff g).mp h))]
  · intro κ x hx
    have h0 : restrict3 (κ x) = 0 := restrict3_of_not_mem (κ x) hx
    by_cases hproper : fullProper T κ
    · rw [if_pos hproper]
      rw [Finset.prod_eq_zero (Finset.mem_univ x) h0]
    · rw [if_neg hproper]

end Restriction

/-! ## Coefficient preservation under the three-variable restriction -/

section KillCoeff

lemma kill31_X_iota (j : Fin 3) : kill31 (MvPolynomial.X (iota j)) = MvPolynomial.X j := by
  rw [kill31_X, restrict3_iota]

lemma kill31_X_of_not_mem (i : Fin 31) (h : i ∉ Set.range (⇑iota)) :
    kill31 (MvPolynomial.X i) = 0 := by
  rw [kill31_X, restrict3_of_not_mem i h]

lemma kill31_C (c : ℚ) : kill31 (MvPolynomial.C c) = MvPolynomial.C c := by
  simp [kill31]

lemma kill31_rename_iota (q : MvPolynomial (Fin 3) ℚ) :
    kill31 (MvPolynomial.rename (⇑iota) q) = q := by
  rw [MvPolynomial.rename_eq_aeval]
  change ((kill31).comp (MvPolynomial.aeval (MvPolynomial.X ∘ ⇑iota))) q = q
  rw [MvPolynomial.comp_aeval]
  simp only [Function.comp_apply, kill31_X_iota]
  simp

lemma kill31_monomial_of_support (d : Fin 31 →₀ ℕ) (c : ℚ)
    (hd : ↑d.support ⊆ Set.range (⇑iota)) :
    kill31 (MvPolynomial.monomial d c)
      = MvPolynomial.monomial (Finsupp.comapDomain (⇑iota) d iota.injective.injOn) c := by
  have hd_eq : Finsupp.embDomain iota (Finsupp.comapDomain (⇑iota) d iota.injective.injOn) = d :=
    Finsupp.embDomain_comapDomain hd
  conv_lhs => rw [← hd_eq]
  rw [Finsupp.embDomain_eq_mapDomain, ← MvPolynomial.rename_monomial]
  rw [kill31_rename_iota]

lemma kill31_monomial_of_not_support (d : Fin 31 →₀ ℕ) (c : ℚ)
    (hd : ¬ ↑d.support ⊆ Set.range (⇑iota)) :
    kill31 (MvPolynomial.monomial d c) = 0 := by
  obtain ⟨i, hi, hir⟩ := Set.not_subset.mp hd
  rw [MvPolynomial.monomial_eq]
  rw [map_mul, kill31_C]
  rw [Finsupp.prod, map_prod]
  rw [Finset.prod_eq_zero (i := i) hi]
  · simp
  · rw [map_pow, kill31_X_of_not_mem i hir]
    have hdi : d i ≠ 0 := Finsupp.mem_support_iff.mp hi
    exact zero_pow hdi

lemma comapDomain_eq_iff {d : Fin 31 →₀ ℕ} {e : Fin 3 →₀ ℕ}
    (hd : ↑d.support ⊆ Set.range (⇑iota)) :
    Finsupp.comapDomain (⇑iota) d iota.injective.injOn = e
      ↔ d = Finsupp.embDomain iota e := by
  constructor
  · intro h
    rw [← Finsupp.embDomain_comapDomain (f := iota) (g := d) hd, h]
  · intro h
    rw [h]
    exact Finsupp.comapDomain_embDomain iota e

lemma kill31_monomial_coeff (d : Fin 31 →₀ ℕ) (c : ℚ) (e : Fin 3 →₀ ℕ) :
    (kill31 (MvPolynomial.monomial d c)).coeff e
      = if d = Finsupp.embDomain iota e then c else 0 := by
  by_cases hd : ↑d.support ⊆ Set.range (⇑iota)
  · rw [kill31_monomial_of_support d c hd, MvPolynomial.coeff_monomial]
    by_cases h : Finsupp.comapDomain (⇑iota) d iota.injective.injOn = e
    · rw [if_pos h, if_pos ((comapDomain_eq_iff hd).mp h)]
    · have hne : ¬ (d = Finsupp.embDomain iota e) :=
        fun h' => h ((comapDomain_eq_iff hd).mpr h')
      rw [if_neg h, if_neg hne]
  · have hne : d ≠ Finsupp.embDomain iota e := by
      intro hde
      exact hd ((Finsupp.mem_range_embDomain_iff iota d).mp ⟨e, hde.symm⟩)
    rw [kill31_monomial_of_not_support d c hd]
    simp [hne]

/-- Coefficient extraction through the three-variable restriction: for any
polynomial in 31 variables, the coefficients at `e` and at the embedded
exponent `e` agree. -/
lemma kill31_coeff (q : MvPolynomial (Fin 31) ℚ) (e : Fin 3 →₀ ℕ) :
    (kill31 q).coeff e = q.coeff (Finsupp.embDomain iota e) := by
  conv_lhs => rw [MvPolynomial.as_sum q]
  conv_rhs => rw [MvPolynomial.as_sum q]
  rw [map_sum, MvPolynomial.coeff_sum, MvPolynomial.coeff_sum]
  apply Finset.sum_congr rfl
  intro d _
  rw [kill31_monomial_coeff, MvPolynomial.coeff_monomial]

end KillCoeff

/-! ## The bridge theorem -/

section Bridge

/-- The `e`-basis coordinates of the full chromatic symmetric function of `T`. -/
noncomputable def fullECoords : MvPolynomial (Fin 31) ℚ :=
  (MvPolynomial.esymmAlgEquiv (Fin 31) ℚ (n := 31) (by decide)).symm
    ⟨fullChromPoly T, fullChromPoly_isSymmetric T⟩

/-- The `e`-basis coordinates of the three-variable chromatic symmetric
polynomial of `T`. -/
noncomputable def chromECoords : MvPolynomial (Fin 3) ℚ :=
  (MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).symm
    ⟨chromPoly T, chromPoly_isSymmetric T⟩

lemma esymm_fin3_eq_zero_of_gt {k : ℕ} (hk : 3 < k) :
    MvPolynomial.esymm (Fin 3) ℚ k = 0 := by
  rw [MvPolynomial.esymm]
  have h : (Finset.univ : Finset (Fin 3)).card < k := by simpa using hk
  rw [Finset.powersetCard_eq_empty.mpr h]
  simp

/-- The elementary symmetric functions of the zero-extended vector agree with
those of the three variables. -/
lemma aeval_restrict3_esymm (k : ℕ) :
    MvPolynomial.aeval restrict3 (MvPolynomial.esymm (Fin 31) ℚ k)
      = MvPolynomial.esymm (Fin 3) ℚ k := by
  have h := aeval_esymm_eq_of_zero_extend (R := ℚ) (S := MvPolynomial (Fin 3) ℚ)
    (by decide : 3 ≤ 31) restrict3
    (fun j : Fin 3 => MvPolynomial.X j) (by intro i; rfl) k
  simpa using h

lemma aeval_esymm31_fullECoords :
    MvPolynomial.aeval (fun i : Fin 31 => MvPolynomial.esymm (Fin 31) ℚ (i.val + 1))
      fullECoords = fullChromPoly T := by
  have h2 := (MvPolynomial.esymmAlgEquiv (Fin 31) ℚ (n := 31) (by decide)).apply_symm_apply
    ⟨fullChromPoly T, fullChromPoly_isSymmetric T⟩
  have h3 := congrArg Subtype.val h2
  rw [MvPolynomial.esymmAlgEquiv_apply] at h3
  rw [MvPolynomial.esymmAlgHom_apply] at h3
  simpa [fullECoords] using h3

lemma aeval_esymm3_chromECoords :
    MvPolynomial.aeval (fun j : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (j.val + 1))
      chromECoords = chromPoly T := by
  have h2 := (MvPolynomial.esymmAlgEquiv (Fin 3) ℚ (n := 3) (by decide)).apply_symm_apply
    ⟨chromPoly T, chromPoly_isSymmetric T⟩
  have h3 := congrArg Subtype.val h2
  rw [MvPolynomial.esymmAlgEquiv_apply] at h3
  rw [MvPolynomial.esymmAlgHom_apply] at h3
  simpa [chromECoords] using h3

/-- The `aeval` map along the three-variable elementary generators factors
through the three-variable restriction. -/
lemma aeval_esymm3_factors :
    (MvPolynomial.aeval (fun i : Fin 31 => MvPolynomial.esymm (Fin 3) ℚ (i.val + 1)))
      = (MvPolynomial.aeval (fun j : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (j.val + 1))).comp
          kill31 := by
  apply MvPolynomial.algHom_ext
  intro i
  rw [AlgHom.comp_apply, kill31_X]
  simp only [restrict3]
  by_cases h : i.val < 3
  · rw [dif_pos h]
    simp
  · rw [dif_neg h]
    rw [MvPolynomial.aeval_X]
    have hzero : MvPolynomial.esymm (Fin 3) ℚ (i.val + 1) = 0 :=
      esymm_fin3_eq_zero_of_gt (by omega)
    simp [hzero]

/-- Injectivity of the three-variable elementary basis map. -/
lemma aeval_esymm3_injective :
    Function.Injective (fun q : MvPolynomial (Fin 3) ℚ =>
      MvPolynomial.aeval (fun j : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (j.val + 1)) q) := by
  intro a b hab
  apply MvPolynomial.esymmAlgHom_injective (σ := Fin 3) (R := ℚ) (n := 3) (by decide)
  apply Subtype.ext
  rw [MvPolynomial.esymmAlgHom_apply, MvPolynomial.esymmAlgHom_apply]
  exact hab

/-- The full `e`-coordinates restrict to the three-variable `e`-coordinates. -/
lemma kill31_fullECoords : kill31 fullECoords = chromECoords := by
  apply aeval_esymm3_injective
  change MvPolynomial.aeval (fun j : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (j.val + 1))
      (kill31 fullECoords)
      = MvPolynomial.aeval (fun j : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (j.val + 1))
          chromECoords
  have hL : MvPolynomial.aeval (fun j : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (j.val + 1))
      (kill31 fullECoords)
      = MvPolynomial.aeval (fun i : Fin 31 => MvPolynomial.esymm (Fin 3) ℚ (i.val + 1))
          fullECoords := by
    rw [show (MvPolynomial.aeval (fun j : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (j.val + 1)))
        (kill31 fullECoords)
        = ((MvPolynomial.aeval (fun j : Fin 3 => MvPolynomial.esymm (Fin 3) ℚ (j.val + 1))).comp
            kill31) fullECoords from rfl]
    rw [← aeval_esymm3_factors]
  rw [hL]
  have hM : MvPolynomial.aeval (fun i : Fin 31 => MvPolynomial.esymm (Fin 3) ℚ (i.val + 1))
      fullECoords = chromPoly T := by
    have h1 : (fun i : Fin 31 => MvPolynomial.esymm (Fin 3) ℚ (i.val + 1))
        = (fun i : Fin 31 =>
            MvPolynomial.aeval restrict3 (MvPolynomial.esymm (Fin 31) ℚ (i.val + 1))) := by
      funext i
      exact (aeval_restrict3_esymm (i.val + 1)).symm
    rw [h1]
    rw [show (MvPolynomial.aeval (fun i : Fin 31 =>
          MvPolynomial.aeval restrict3 (MvPolynomial.esymm (Fin 31) ℚ (i.val + 1))))
        fullECoords
        = MvPolynomial.aeval restrict3
            (MvPolynomial.aeval (fun i : Fin 31 => MvPolynomial.esymm (Fin 31) ℚ (i.val + 1))
              fullECoords) from by
      rw [← MvPolynomial.comp_aeval]
      rfl]
    rw [aeval_esymm31_fullECoords, aeval_restrict3_fullChromPoly_T]
  rw [hM, aeval_esymm3_chromECoords]

/-- The index `e₃ e₂¹⁴` in `31` variables is the image of the index in `3`
variables. -/
lemma embDomain_iota_lambda :
    Finsupp.embDomain iota
        (Finsupp.single (1 : Fin 3) 14 + Finsupp.single (2 : Fin 3) 1)
      = (Finsupp.single (1 : Fin 31) 14 + Finsupp.single (2 : Fin 31) 1) := by
  rw [Finsupp.embDomain_add, Finsupp.embDomain_single, Finsupp.embDomain_single]
  have h1 : iota (1 : Fin 3) = (1 : Fin 31) := by ext; rfl
  have h2 : iota (2 : Fin 3) = (2 : Fin 31) := by ext; rfl
  rw [h1, h2]

/-- **Restriction/faithfulness of the `e₃ e₂¹⁴` coefficient.**  The coefficient of
`e₃ e₂¹⁴` in the full chromatic symmetric function of `T` (with `31` variables)
equals the corresponding coefficient in the three-variable chromatic symmetric
polynomial.  This is the precise statement that no `e_j` with `j > 3` contributes
to this coefficient. -/
theorem full_coeff_eq_three_variable_coeff :
    fullECoords.coeff (Finsupp.single (1 : Fin 31) 14 + Finsupp.single (2 : Fin 31) 1)
      = chromECoords.coeff (Finsupp.single (1 : Fin 3) 14 + Finsupp.single (2 : Fin 3) 1) := by
  rw [← embDomain_iota_lambda]
  rw [← kill31_coeff fullECoords (Finsupp.single (1 : Fin 3) 14 + Finsupp.single (2 : Fin 3) 1)]
  rw [kill31_fullECoords]

end Bridge

end LiFull

namespace Li

/-- **The full coefficient theorem.**  The coefficient of `e₃ e₂¹⁴` in the
chromatic symmetric function of the explicit 31-vertex tree, evaluated with 31
variables, is `+29`. -/
theorem full_li_coefficient :
    ((MvPolynomial.esymmAlgEquiv (Fin 31) ℚ (n := 31) (by decide)).symm
      ⟨LiFull.fullChromPoly T, LiFull.fullChromPoly_isSymmetric T⟩).coeff
      (Finsupp.single (1 : Fin 31) 14 + Finsupp.single (2 : Fin 31) 1) = 29 := by
  change LiFull.fullECoords.coeff
    (Finsupp.single (1 : Fin 31) 14 + Finsupp.single (2 : Fin 31) 1) = 29
  rw [LiFull.full_coeff_eq_three_variable_coeff]
  exact Li.li_coefficient

end Li
