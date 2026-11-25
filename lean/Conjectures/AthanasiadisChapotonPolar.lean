import Conjectures.AthanasiadisChapotonGauge
import Mathlib.Order.Antisymmetrization
import Mathlib.RingTheory.PowerSeries.Basic

/-! Athanasiadis–Chapoton Conjecture 6.2 for arbitrary finite preorders. -/

namespace AthanasiadisChapotonPolar

open Finset Set
open scoped Pointwise

variable {E P : Type*}

section Lattice

variable [Fintype E] [Fintype P] [PartialOrder P]

private theorem maxZero_intCast {ι : Type*} (s : Finset ι) (f : ι → ℤ) :
    maxZero s (fun i => (f i : ℝ)) = ((maxZero s f : ℤ) : ℝ) := by
  apply le_antisymm
  · refine maxZero_le_iff.mpr ⟨?_, ?_⟩
    · exact_mod_cast zero_le_maxZero s f
    · intro i hi
      exact_mod_cast le_maxZero f hi
  · rcases maxZero_eq_zero_or_attained s f with h | ⟨i, hi, h⟩
    · rw [h, Int.cast_zero]
      exact zero_le_maxZero ..
    · rw [← h]
      exact le_maxZero (fun j => (f j : ℝ)) hi

theorem gauge_intCast (owner : E → P) (z : E → ℤ) :
    gauge owner (fun i => (z i : ℝ)) = ((gauge owner z : ℤ) : ℝ) := by
  have hm : majorant owner (fun i => (z i : ℝ)) = fun c => ((majorant owner z c : ℤ) : ℝ) := by
    funext c
    exact maxZero_intCast _ _
  simp [gauge, hm, maxZero_intCast, Int.cast_sum]


private theorem height_intCast (b : P → ℤ) (c : P) :
    height (fun j => (b j : ℝ)) c = ((height b c : ℤ) : ℝ) := by
  classical
  simp only [height, chainMax, ← Int.cast_sum, maxZero_intCast]

/-- The same reversal formulas preserve the integer lattice inside real space. -/
theorem reversal_intCast (owner : E → P) (z : E → ℤ) (i : E) :
    reversal owner (fun j => (z j : ℝ)) i = ((reversal owner z i : ℤ) : ℝ) := by
  let zR := fun j => (z j : ℝ)
  let g := fun j => OrderDual.toDual (owner j)
  have hm : majorant owner zR = fun c => ((majorant owner z c : ℤ) : ℝ) := by
    funext c
    exact maxZero_intCast _ _
  have hw : (encode owner zR).weights = fun c => (((encode owner z).weights c : ℤ) : ℝ) := by
    funext c
    change majorant owner zR c - maxZero (strictlyAbove c) (majorant owner zR) =
      ((majorant owner z c - maxZero (strictlyAbove c) (majorant owner z) : ℤ) : ℝ)
    rw [hm, maxZero_intCast, Int.cast_sub]
  have hwd := congrArg (fun b : P → ℝ => fun c : Pᵒᵈ => b (OrderDual.ofDual c)) hw
  change height (P := Pᵒᵈ) (fun c => (encode owner zR).weights (OrderDual.ofDual c)) (g i) -
    (majorant owner zR (owner i) - zR i) =
    ((height (P := Pᵒᵈ) (fun c => (encode owner z).weights (OrderDual.ofDual c)) (g i) -
      (majorant owner z (owner i) - z i) : ℤ) : ℝ)
  rw [hwd, height_intCast (P := Pᵒᵈ), hm, Int.cast_sub, Int.cast_sub]

private theorem height_smul (b : P → ℝ) (c : P) {t : ℝ} (ht : 0 ≤ t) :
    height (fun j => t * b j) c = t * height b c := by
  classical
  unfold height chainMax
  simp_rw [← mul_sum]
  exact maxZero_smul _ _ ht

theorem reversal_smul (owner : E → P) (z : E → ℝ) {t : ℝ} (ht : 0 ≤ t) :
    reversal owner (t • z) = t • reversal owner z := by
  let g := fun i => OrderDual.toDual (owner i)
  have hm : majorant owner (t • z) = fun c => t * majorant owner z c := by
    funext c
    exact maxZero_smul _ _ ht
  have hw : (fun c : Pᵒᵈ => (encode owner (t • z)).weights (OrderDual.ofDual c)) =
      (fun c : Pᵒᵈ => t * (encode owner z).weights (OrderDual.ofDual c)) := by
    funext c
    let j := OrderDual.ofDual c
    change majorant owner (t • z) j - maxZero (strictlyAbove j) (majorant owner (t • z)) =
      t * (majorant owner z j - maxZero (strictlyAbove j) (majorant owner z))
    rw [hm, maxZero_smul _ _ ht, mul_sub]
  funext i
  change height (P := Pᵒᵈ) (fun c => (encode owner (t • z)).weights (OrderDual.ofDual c)) (g i) -
    (majorant owner (t • z) (owner i) - t * z i) =
    t * (height (P := Pᵒᵈ) (fun c => (encode owner z).weights (OrderDual.ofDual c)) (g i) -
      (majorant owner z (owner i) - z i))
  rw [hw, height_smul (P := Pᵒᵈ) _ _ ht, hm]
  ring

private theorem continuous_maxZero {X ι : Type*} [TopologicalSpace X] (s : Finset ι)
    (f : ι → X → ℝ) (hf : ∀ i ∈ s, Continuous (f i)) :
    Continuous (fun x => maxZero s (fun i => f i x)) := by
  classical
  induction s using Finset.induction_on with
  | empty =>
    have he (x : X) : maxZero ∅ (fun i => f i x) = 0 :=
      le_antisymm (maxZero_le_iff.mpr ⟨le_rfl, by simp⟩) (zero_le_maxZero ..)
    simp_rw [he]
    exact continuous_const
  | insert i s hi ih =>
    have he (x : X) : maxZero (insert i s) (fun j => f j x) =
        max (f i x) (maxZero s (fun j => f j x)) := by
      apply le_antisymm
      · refine maxZero_le_iff.mpr ⟨(zero_le_maxZero ..).trans (le_max_right ..), ?_⟩
        intro k hk
        rcases Finset.mem_insert.mp hk with rfl | hk
        · exact le_max_left ..
        · exact (le_maxZero (fun j => f j x) hk).trans (le_max_right ..)
      · exact max_le (le_maxZero (fun j => f j x) (mem_insert_self _ _))
          (maxZero_mono_set (Finset.subset_insert _ _) _)
    simp_rw [he]
    exact (hf _ (mem_insert_self _ _)).max (ih fun j hj => hf _ (mem_insert_of_mem hj))

private theorem continuous_reversal (owner : E → P) :
    Continuous (reversal owner : (E → ℝ) → (E → ℝ)) := by
  have hm (c : P) : Continuous (fun z : E → ℝ => majorant owner z c) :=
    continuous_maxZero _ (fun j (z : E → ℝ) => z j) (fun j _ => continuous_apply j)
  have hb (c : P) : Continuous (fun z : E → ℝ => (encode owner z).weights c) :=
    (hm c).sub (continuous_maxZero _ (fun j z => majorant owner z j) (fun j _ => hm j))
  apply continuous_pi
  intro i
  change Continuous (fun z : E → ℝ =>
    height (P := Pᵒᵈ) (encode owner z).weights (OrderDual.toDual (owner i)) -
      (majorant owner z (owner i) - z i))
  apply Continuous.sub _ ((hm _).sub (continuous_apply _))
  unfold height chainMax
  exact continuous_maxZero _ _ (fun _ _ => continuous_finsetSum _ (fun j _ => hb j))

private noncomputable def reversalHomeomorph (owner : E → P) : (E → ℝ) ≃ₜ (E → ℝ) where
  toEquiv := reversal owner
  continuous_toFun := continuous_reversal owner
  continuous_invFun := continuous_reversal (fun i => OrderDual.toDual (owner i))

end Lattice

variable (E) [Preorder E]

/-- The literal negative basis and nonempty ideal-vector generators from the source. -/
noncomputable def originalGenerators : Set (E → ℝ) :=
  Set.range negativeUnit ∪ {v | ∃ I : Set E, IsLowerSet I ∧ I.Nonempty ∧ idealVector I = v}

/-- The polar preorder polytope, including the usual zero-dimensional convention. -/
noncomputable def preorderPolar : Set (E → ℝ) :=
  convexHull ℝ (insert 0 (originalGenerators E))

theorem preorderPolar_eq_original [Fintype E] [Nonempty E] :
    preorderPolar E = convexHull ℝ (originalGenerators E) := by
  classical
  have one_mem : idealVector (univ : Set E) ∈ originalGenerators E :=
    Or.inr ⟨univ, by simp [IsLowerSet], univ_nonempty, rfl⟩
  have h0 : (0 : E → ℝ) ∈ convexHull ℝ (originalGenerators E) := by
    let f : Option E → E → ℝ := fun i => i.elim (idealVector univ) negativeUnit
    let w : ℝ := (Fintype.card E + 1 : ℝ)⁻¹
    have hw : 0 < w := by dsimp [w]; positivity
    apply mem_convexHull_of_exists_fintype (fun _ : Option E => w) f (fun _ => hw.le)
    · simp [nsmul_eq_mul, w, show (Fintype.card E : ℝ) + 1 ≠ 0 by positivity]
    · intro i
      cases i with
      | none => exact one_mem
      | some i => exact Or.inl ⟨i, rfl⟩
    · funext j
      simp [Fintype.sum_option, f, idealVector, negativeUnit, Pi.smul_apply,
        mul_ite, eq_comm (a := j)]
  refine subset_antisymm (convexHull_min ?_ (convex_convexHull ℝ _))
    (convexHull_mono (subset_insert _ _))
  intro x h
  rcases mem_insert_iff.mp h with rfl | hx
  · exact h0
  · exact subset_convexHull ℝ _ hx

private abbrev Classes := Antisymmetrization E (· ≤ ·)

private def classOf : E → Classes E := toAntisymmetrization (· ≤ ·)

private theorem preorderPolar_eq_hull {P : Type*} [PartialOrder P] (owner : E → P)
    (h : ∀ i j, owner i ≤ owner j ↔ i ≤ j) :
    preorderPolar E = polar owner := by
  unfold preorderPolar polar
  congr 1
  ext x
  simp only [originalGenerators, mem_insert_iff, mem_union, mem_ofPred_eq]
  constructor
  · rintro (rfl | hh | ⟨I, hI, _, rfl⟩)
    · exact Or.inr ⟨∅, by simp [IsIdeal], by ext i; simp [idealVector]⟩
    · exact Or.inl hh
    · refine Or.inr ⟨I, ?_, rfl⟩
      intro i j hle hj
      exact hI ((h i j).mp hle) hj
  · rintro (hh | ⟨I, hI, rfl⟩)
    · exact Or.inr (Or.inl hh)
    · by_cases hn : I.Nonempty
      · refine Or.inr (Or.inr ⟨I, ?_, hn, rfl⟩)
        intro i j hle hj
        exact hI ((h j i).mpr hle) hj
      · have hi : I = ∅ := Set.not_nonempty_iff_eq_empty.mp hn
        left
        ext i
        simp [hi, idealVector]

/-- Integer lattice points of the dilated polytope. The scale is a natural number. -/
def LatticePoints (Q : Set (E → ℝ)) (m : ℕ) :=
  {z : E → ℤ // (fun i => (z i : ℝ)) ∈ (m : ℝ) • Q}

section General

variable [Fintype E]

@[instance_reducible] private noncomputable def classFintype : Fintype (Classes E) := by
  have : Finite (Classes E) := Finite.of_surjective (classOf E) (fun a =>
    ⟨ofAntisymmetrization (· ≤ ·) a, toAntisymmetrization_ofAntisymmetrization _ a⟩)
  exact Fintype.ofFinite _

omit [Preorder E] in
theorem latticePoints_finite {P : Type*} [Fintype P] [PartialOrder P]
    (owner : E → P) (m : ℕ) : Finite (LatticePoints E (polar owner) m) := by
  classical
  let bound : Finset ℤ := Finset.Icc (-(m : ℤ)) m
  have h (z : LatticePoints E (polar owner) m) : gauge owner z.val ≤ m := by
    have h := (mem_polar_dilate_iff owner (by positivity : (0 : ℝ) ≤ m) _).mp z.property
    rw [gauge_intCast] at h
    exact_mod_cast h
  have hbounds (z : LatticePoints E (polar owner) m) (i : E) : z.val i ∈ bound := by
    have hn (j : E) : 0 ≤ majorant owner z.val (owner j) - z.val j :=
      sub_nonneg.mpr (le_majorant owner z.val j)
    have hd : majorant owner z.val (owner i) - z.val i ≤
        ∑ j, (majorant owner z.val (owner j) - z.val j) :=
      single_le_sum (fun j _ => hn j) (mem_univ i)
    have hM : majorant owner z.val (owner i) ≤ maxZero univ (majorant owner z.val) :=
      le_maxZero _ (mem_univ _)
    have hsum := sum_nonneg (fun j (_ : j ∈ (univ : Finset E)) => hn j)
    have hb := h z
    unfold gauge at hb
    apply Finset.mem_Icc.mpr
    constructor
    · have hi := majorant_nonneg owner z.val (owner i)
      have htop := zero_le_maxZero (univ : Finset P) (majorant owner z.val)
      linarith only [hd, hb, hi, htop]
    · linarith only [hM, hb, hsum, le_majorant owner z.val i]
  apply Finite.of_injective (f := fun z : LatticePoints E (polar owner) m =>
    fun i : E => (⟨z.val i, hbounds z i⟩ : ↥bound))
  intro x y he
  exact Subtype.ext (funext fun i => congrArg Subtype.val (congrFun he i))

/-- The actual lattice-point bijection for a finite preorder and its reversal. -/
noncomputable def latticePointsEquiv (m : ℕ) :
    LatticePoints E (preorderPolar E) m ≃ LatticePoints E (preorderPolar Eᵒᵈ) m := by
  classical
  let f := classOf E
  let g := fun i : E => OrderDual.toDual (f i)
  have h₁ : preorderPolar E = polar f :=
    preorderPolar_eq_hull E f (fun _ _ => toAntisymmetrization_le_toAntisymmetrization_iff)
  have h₂ : preorderPolar Eᵒᵈ = polar g :=
    preorderPolar_eq_hull Eᵒᵈ g (fun _ _ => toAntisymmetrization_le_toAntisymmetrization_iff)
  let : Fintype (Classes E) := classFintype E
  rw [h₁, h₂]
  apply (reversal f : (E → ℤ) ≃ (E → ℤ)).subtypeEquiv
  intro z
  change (fun i => (z i : ℝ)) ∈ (m : ℝ) • polar f ↔
    (fun i => ((reversal f z) i : ℝ)) ∈ (m : ℝ) • polar g
  rw [mem_polar_dilate_iff _ (by positivity), mem_polar_dilate_iff _ (by positivity),
    gauge_intCast, gauge_intCast]
  change _ ↔ ((gauge (fun i => OrderDual.toDual (f i)) (reversal f z) : ℤ) : ℝ) ≤ _
  rw [gauge_reversal]

theorem preorder_latticePoints_finite (m : ℕ) : Finite (LatticePoints E (preorderPolar E) m) := by
  classical
  rw [preorderPolar_eq_hull E (classOf E) (fun _ _ => toAntisymmetrization_le_toAntisymmetrization_iff)]
  let : Fintype (Classes E) := classFintype E
  exact latticePoints_finite E (classOf E) m


/-- The real reversal map is a homeomorphism of the ambient coordinate space. -/
noncomputable def preorderReversal : (E → ℝ) ≃ₜ (E → ℝ) :=
  let : Fintype (Classes E) := classFintype E
  reversalHomeomorph (classOf E)

theorem preorderReversal_smul (z : E → ℝ) {t : ℝ} (ht : 0 ≤ t) :
    preorderReversal E (t • z) = t • preorderReversal E z := by
  let : Fintype (Classes E) := classFintype E
  exact reversal_smul (classOf E) z ht

theorem preorderReversal_image_dilate {m : ℝ} (hm : 0 ≤ m) :
    preorderReversal E '' (m • preorderPolar E) = m • preorderPolar Eᵒᵈ := by
  let f := classOf E
  let g := fun i : E => OrderDual.toDual (f i)
  have h₁ : preorderPolar E = polar f :=
    preorderPolar_eq_hull E f (fun _ _ => toAntisymmetrization_le_toAntisymmetrization_iff)
  have h₂ : preorderPolar Eᵒᵈ = polar g :=
    preorderPolar_eq_hull Eᵒᵈ g (fun _ _ => toAntisymmetrization_le_toAntisymmetrization_iff)
  rw [h₁, h₂]
  let : Fintype (Classes E) := classFintype E
  have he (z : E → ℝ) : z ∈ m • polar f ↔ preorderReversal E z ∈ m • polar g := by
    rw [mem_polar_dilate_iff _ hm, mem_polar_dilate_iff _ hm]
    change _ ↔ gauge (fun i => OrderDual.toDual (f i)) (reversal f z) ≤ _
    rw [gauge_reversal]
  ext w
  constructor
  · rintro ⟨z, hz, rfl⟩
    exact (he z).mp hz
  · intro hw
    refine ⟨(preorderReversal E).symm w, (he _).mpr ?_, (preorderReversal E).apply_symm_apply w⟩
    rw [Homeomorph.apply_symm_apply]
    exact hw

theorem latticePointCount_dual (m : ℕ) :
    Nat.card (LatticePoints E (preorderPolar E) m) =
      Nat.card (LatticePoints E (preorderPolar Eᵒᵈ) m) :=
  Nat.card_congr (latticePointsEquiv E m)

noncomputable def ehrhartSeries : PowerSeries ℤ :=
  PowerSeries.mk fun m => (Nat.card (LatticePoints E (preorderPolar E) m) : ℤ)

/-- Conjecture 6.2 in its equivalent Ehrhart-series formulation. -/
theorem ehrhartSeries_dual : ehrhartSeries E = ehrhartSeries Eᵒᵈ := by
  ext m
  simp only [ehrhartSeries, PowerSeries.coeff_mk]
  exact_mod_cast latticePointCount_dual E m

/-- Multiplying the common Ehrhart series by its dimension denominator also
gives equal numerator series. -/
theorem hStarSeries_dual :
    (1 - PowerSeries.X) ^ (Fintype.card E + 1) * ehrhartSeries E =
      (1 - PowerSeries.X) ^ (Fintype.card Eᵒᵈ + 1) * ehrhartSeries Eᵒᵈ := by
  rw [ehrhartSeries_dual E]
  rfl

end General
end AthanasiadisChapotonPolar
