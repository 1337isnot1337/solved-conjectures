import Conjectures.AthanasiadisChapotonTransfer
import Mathlib.Analysis.Convex.Combination

/-! The dilation gauge of the actual convex hull of polar-preorder generators. -/

namespace AthanasiadisChapotonPolar

open Finset Set
open scoped Pointwise

variable {E P : Type*} [PartialOrder P]
variable (owner : E → P)

noncomputable def idealVector (I : Set E) : E → ℝ := by
  classical
  exact fun i => if i ∈ I then 1 else 0

noncomputable def negativeUnit (i : E) : E → ℝ := by
  classical
  exact fun j => if j = i then -1 else 0

def IsIdeal (I : Set E) : Prop :=
  ∀ ⦃i j : E⦄, owner i ≤ owner j → j ∈ I → i ∈ I

/-- The source polar polytope, with the zero generator included. -/
noncomputable def polar : Set (E → ℝ) :=
  convexHull ℝ (Set.range negativeUnit ∪ {v | ∃ I : Set E, IsIdeal owner I ∧ idealVector I = v})

theorem idealVector_mem_polar {I : Set E} (hI : IsIdeal owner I) : idealVector I ∈ polar owner :=
  subset_convexHull ℝ _ (Or.inr ⟨I, hI, rfl⟩)

theorem negativeUnit_mem_polar (i : E) : negativeUnit i ∈ polar owner :=
  subset_convexHull ℝ _ (Or.inl ⟨i, rfl⟩)

theorem zero_mem_polar : (0 : E → ℝ) ∈ polar owner := by
  have h := idealVector_mem_polar owner (I := ∅) (by simp [IsIdeal])
  have he : idealVector (∅ : Set E) = 0 := by funext i; simp [idealVector]
  rwa [he] at h

private theorem maxZero_add_le {ι : Type*} (s : Finset ι) (f g : ι → ℝ) :
    maxZero s (fun i => f i + g i) ≤ maxZero s f + maxZero s g :=
  maxZero_le_iff.mpr ⟨add_nonneg (zero_le_maxZero ..) (zero_le_maxZero ..),
    fun _ hi => add_le_add (le_maxZero f hi) (le_maxZero g hi)⟩

theorem maxZero_smul {ι : Type*} (s : Finset ι) (f : ι → ℝ) {t : ℝ} (ht : 0 ≤ t) :
    maxZero s (fun i => t * f i) = t * maxZero s f := by
  apply le_antisymm
  · exact maxZero_le_iff.mpr ⟨mul_nonneg ht (zero_le_maxZero ..),
      fun _ hi => mul_le_mul_of_nonneg_left (le_maxZero f hi) ht⟩
  · rcases maxZero_eq_zero_or_attained s f with he | ⟨i, hi, he⟩
    · rw [he, mul_zero]
      exact zero_le_maxZero ..
    · rw [← he]
      exact le_maxZero (fun j => t * f j) hi

variable [Fintype E] [Fintype P]

private theorem gauge_smul (z : E → ℝ) {t : ℝ} (ht : 0 ≤ t) :
    gauge owner (t • z) = t * gauge owner z := by
  have hmaj : majorant owner (t • z) = fun c => t * majorant owner z c := by
    funext c
    exact maxZero_smul _ _ ht
  unfold gauge
  rw [hmaj, maxZero_smul _ _ ht, mul_add, Finset.mul_sum]
  congr 1
  apply sum_congr rfl
  intro i _
  change t * majorant owner z (owner i) - t * z i = _
  ring

private theorem gauge_add_le (x y : E → ℝ) :
    gauge owner (x + y) ≤ gauge owner x + gauge owner y := by
  have hmaj (c : P) : majorant owner (x + y) c ≤ majorant owner x c + majorant owner y c :=
    maxZero_add_le _ x y
  have hm : maxZero univ (majorant owner (x + y)) ≤
      maxZero univ (majorant owner x) + maxZero univ (majorant owner y) :=
    maxZero_le_iff.mpr ⟨add_nonneg (zero_le_maxZero ..) (zero_le_maxZero ..), fun c hc =>
      (hmaj c).trans (add_le_add (le_maxZero _ hc) (le_maxZero _ hc))⟩
  have hd : (∑ i, (majorant owner (x + y) (owner i) - (x + y) i)) ≤
      (∑ i, ((majorant owner x (owner i) - x i) + (majorant owner y (owner i) - y i))) := by
    apply sum_le_sum
    intro i _
    have h := hmaj (owner i)
    change majorant owner (x + y) (owner i) - (x i + y i) ≤ _
    linarith only [h]
  simp only [sum_add_distrib] at hd
  unfold gauge
  linarith only [hm, hd]

private theorem gauge_negativeUnit_le (i : E) : gauge owner (negativeUnit i) ≤ 1 := by
  classical
  have hn (j : E) : negativeUnit i j ≤ 0 := by unfold negativeUnit; split <;> norm_num
  have hmaj : majorant owner (negativeUnit i) = 0 := by
    funext c
    exact le_antisymm (maxZero_le_iff.mpr ⟨le_rfl, fun j _ => hn j⟩)
      (majorant_nonneg owner _ _)
  have hmax : maxZero (univ : Finset P) (0 : P → ℝ) = 0 :=
    le_antisymm (maxZero_le_iff.mpr ⟨le_rfl, fun _ _ => le_rfl⟩) (zero_le_maxZero ..)
  simp [gauge, hmaj, hmax, negativeUnit, neg_ite]

private theorem gauge_idealVector_le {I : Set E} (hI : IsIdeal owner I) :
    gauge owner (idealVector I) ≤ 1 := by
  classical
  have he (i : E) : majorant owner (idealVector I) (owner i) = idealVector I i := by
    refine le_antisymm (maxZero_le_iff.mpr ⟨?_, ?_⟩) (le_majorant owner _ _)
    · unfold idealVector
      split <;> norm_num
    · intro j hj
      by_cases h : j ∈ I
      · simp [idealVector, h, hI ((mem_upperCoordinates owner).mp hj) h]
      · simp [idealVector, h]
        split <;> norm_num
  have hmax : maxZero univ (majorant owner (idealVector I)) ≤ 1 :=
    maxZero_le_iff.mpr ⟨zero_le_one, fun _ _ => maxZero_le_iff.mpr
      ⟨zero_le_one, fun i _ => by unfold idealVector; split <;> norm_num⟩⟩
  simpa [gauge, he] using hmax

private theorem gauge_le_one_of_mem {z : E → ℝ} (hz : z ∈ polar owner) : gauge owner z ≤ 1 := by
  apply convexHull_min (s := _) (t := {v | gauge owner v ≤ 1}) _ _ hz
  · rintro v (⟨i, rfl⟩ | ⟨I, hI, rfl⟩)
    · exact gauge_negativeUnit_le owner i
    · exact gauge_idealVector_le owner hI
  · intro x hx y hy a b ha hb hab
    change gauge owner (a • x + b • y) ≤ 1
    calc
      _ ≤ gauge owner (a • x) + gauge owner (b • y) := gauge_add_le owner _ _
      _ = _ := by rw [gauge_smul owner x ha, gauge_smul owner y hb]
      _ ≤ _ := by
        change gauge owner x ≤ 1 at hx
        change gauge owner y ≤ 1 at hy
        linarith only [mul_le_mul_of_nonneg_left hx ha, mul_le_mul_of_nonneg_left hy hb, hab]

omit [Fintype E] [Fintype P] in
private theorem add_mem_polar_dilate {x y : E → ℝ} {s t : ℝ} (hs : 0 ≤ s) (ht : 0 ≤ t)
    (hx : x ∈ s • polar owner) (hy : y ∈ t • polar owner) :
    x + y ∈ (s + t) • polar owner := by
  have hc : Convex ℝ (polar owner) := convex_convexHull ℝ _
  rw [hc.add_smul hs ht]
  exact Set.add_mem_add hx hy

omit [Fintype E] [Fintype P] in
private theorem enlarge_polar_dilate {x : E → ℝ} {s t : ℝ} (hs : 0 ≤ s) (hst : s ≤ t)
    (hx : x ∈ s • polar owner) : x ∈ t • polar owner := by
  have hz : (0 : E → ℝ) ∈ (t - s) • polar owner := by
    simpa only [smul_zero] using Set.smul_mem_smul_set (a := t - s) (zero_mem_polar owner)
  have h := add_mem_polar_dilate owner hs (sub_nonneg.mpr hst) hx hz
  rw [add_zero, add_sub_cancel] at h
  exact h

private noncomputable def positiveIndices (w : E → ℝ) : Finset E := by
  classical
  exact univ.filter (fun i => 0 < w i)

private theorem positiveIndices_mem {w : E → ℝ} {i : E} :
    i ∈ positiveIndices w ↔ 0 < w i := by
  classical
  simp [positiveIndices]

omit [Fintype P] in
private theorem antitone_mem_dilate_aux (n : ℕ) (w : E → ℝ) (hw : ∀ i, 0 ≤ w i)
    (ha : ∀ i j, owner i ≤ owner j → w j ≤ w i) (hc : (positiveIndices w).card = n) :
    w ∈ maxZero univ w • polar owner := by
  classical
  induction n using Nat.strong_induction_on generalizing w with
  | h n ih =>
    let S := positiveIndices w
    by_cases hn : S.Nonempty
    · let δ := (S.image w).min' (hn.image _)
      obtain ⟨i, hi, hwi⟩ := mem_image.mp (min'_mem (S.image w) (hn.image _))
      have heδ : w i = δ := hwi
      have hδ : 0 < δ := heδ ▸ positiveIndices_mem.mp hi
      have hδle (j : E) (hj : 0 < w j) : δ ≤ w j :=
        min'_le _ _ (mem_image_of_mem _ (positiveIndices_mem.mpr hj))
      let v : E → ℝ := fun j => max 0 (w j - δ)
      have hv (j : E) : 0 ≤ v j := le_max_left ..
      have hva (j k : E) (hjk : owner j ≤ owner k) : v k ≤ v j :=
        max_le_max_left 0 (sub_le_sub_right (ha j k hjk) _)
      have hvc : (positiveIndices v).card < n := by
        rw [← hc]
        apply Finset.card_lt_card
        apply Finset.ssubset_iff_subset_ne.mpr
        refine ⟨?_, ?_⟩
        · intro j hj
          have h := positiveIndices_mem.mp hj
          change 0 < max 0 (w j - δ) at h
          exact positiveIndices_mem.mpr (hδ.trans (sub_pos.mp ((lt_max_iff.mp h).resolve_left (lt_irrefl 0))))
        · intro he
          have hj' : i ∈ positiveIndices w := hi
          have hj := positiveIndices_mem.mp (he.symm ▸ hj')
          simp [v, heδ] at hj
      have hv_mem := ih _ hvc v hv hva rfl
      let I : Set E := {j | 0 < w j}
      have hI : IsIdeal owner I := by
        intro j k h hj
        exact (show 0 < w k from hj).trans_le (ha j k h)
      have hw_eq : w = δ • idealVector I + v := by
        funext j
        change w j = δ * idealVector I j + max 0 (w j - δ)
        by_cases h : 0 < w j
        · simp [idealVector, I, h, max_eq_right (sub_nonneg.mpr (hδle j h))]
        · have hj : w j = 0 := le_antisymm (le_of_not_gt h) (hw j)
          simp [idealVector, I, hj, hδ.le]
      have hmax : maxZero univ w = δ + maxZero univ v := by
        have hδM : δ ≤ maxZero univ w := heδ ▸ le_maxZero w (mem_univ i)
        apply le_antisymm
        · refine maxZero_le_iff.mpr ⟨add_nonneg hδ.le (zero_le_maxZero ..), fun j _ => ?_⟩
          have hvj := le_maxZero v (mem_univ j)
          change max 0 (w j - δ) ≤ _ at hvj
          linarith only [(le_max_right (0 : ℝ) (w j - δ)).trans hvj]
        · rw [← le_sub_iff_add_le']
          refine maxZero_le_iff.mpr ⟨sub_nonneg.mpr hδM, fun j _ => ?_⟩
          exact max_le (sub_nonneg.mpr hδM)
            (sub_le_sub_right (le_maxZero _ (mem_univ j)) _)
      have hs := Set.smul_mem_smul_set (a := δ) (idealVector_mem_polar owner hI)
      rw [hmax]
      exact hw_eq ▸ add_mem_polar_dilate owner hδ.le (zero_le_maxZero ..) hs hv_mem
    · have he : w = 0 := by
        funext i
        have h : ¬ 0 < w i := fun hh => hn ⟨i, positiveIndices_mem.mpr hh⟩
        exact le_antisymm (le_of_not_gt h) (hw i)
      rw [he]
      simpa only [smul_zero] using Set.smul_mem_smul_set
        (a := maxZero (univ : Finset E) (0 : E → ℝ)) (zero_mem_polar owner)

omit [Fintype P] in
private theorem deficit_mem_dilate (d : E → ℝ) (hd : ∀ i, 0 ≤ d i) :
    (-d) ∈ (∑ i, d i) • polar owner := by
  classical
  have h (s : Finset E) : (∑ i ∈ s, d i • negativeUnit i) ∈ (∑ i ∈ s, d i) • polar owner := by
    induction s using Finset.induction_on with
    | empty =>
      simpa only [sum_empty, smul_zero] using Set.smul_mem_smul_set (a := (0 : ℝ)) (zero_mem_polar owner)
    | insert i s hi ih =>
      rw [sum_insert hi, sum_insert hi]
      exact add_mem_polar_dilate owner (hd i) (sum_nonneg fun j _ => hd j)
        (Set.smul_mem_smul_set (negativeUnit_mem_polar owner i)) ih
  have he : (∑ i, d i • negativeUnit i) = -d := by
    funext j
    simp [negativeUnit, mul_ite, Pi.smul_apply, Pi.neg_apply, eq_comm (a := j)]
  exact he ▸ h univ

/-- Membership in a dilate of the literal hull is equivalent to the gauge inequality. -/
theorem mem_polar_dilate_iff {m : ℝ} (hm : 0 ≤ m) (z : E → ℝ) :
    z ∈ m • polar owner ↔ gauge owner z ≤ m := by
  constructor
  · rintro ⟨y, hy, rfl⟩
    rw [gauge_smul owner y hm]
    simpa only [mul_one] using mul_le_mul_of_nonneg_left (gauge_le_one_of_mem owner hy) hm
  · intro hz
    let a := majorant owner z
    let w := fun i => a (owner i)
    let d := fun i => w i - z i
    have ha : ∀ i j, owner i ≤ owner j → w j ≤ w i := fun _ _ h => majorant_antitone owner z h
    have hw (i : E) : 0 ≤ w i := majorant_nonneg owner z _
    have hd (i : E) : 0 ≤ d i := sub_nonneg.mpr (le_majorant owner z i)
    have hww := antitone_mem_dilate_aux owner _ w hw ha rfl
    have hmax : maxZero univ w ≤ maxZero univ a := maxZero_le_iff.mpr
      ⟨zero_le_maxZero .., fun i _ => le_maxZero a (mem_univ (owner i))⟩
    have hwd : w + (-d) = z := by funext i; change w i + -(w i - z i) = z i; ring
    have hsum := add_mem_polar_dilate owner (zero_le_maxZero ..) (sum_nonneg fun i _ => hd i)
      hww (deficit_mem_dilate owner d hd)
    rw [hwd] at hsum
    apply enlarge_polar_dilate owner (add_nonneg (zero_le_maxZero ..) (sum_nonneg fun i _ => hd i))
      _ hsum
    exact (add_le_add_left hmax _).trans hz

end AthanasiadisChapotonPolar
