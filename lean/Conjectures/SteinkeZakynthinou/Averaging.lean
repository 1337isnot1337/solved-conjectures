module

public import Conjectures.SteinkeZakynthinou.AdjacentInformation

/-! Summing each selected row's charge in the original iid pool. -/

@[expose] public section

open MeasureTheory SteinkeZakynthinou.Learner
open scoped BigOperators

namespace SteinkeZakynthinou

private theorem sum_depths_eq_sum_fin {n : ℕ} (z : Sample n) (d : Draw n) (i : Fin n)
    (f : ℕ → ℝ) :
    (∑ j ∈ ownDepths z d i, f j) =
      ∑ j : Fin ((sampleTree n).spans d.2).length,
        if windowHasRow z d.1 i ((sampleTree n).spans d.2)[j.val] then f j.val else 0 := by
  classical
  let J := Fin ((sampleTree n).spans d.2).length
  let u : Finset J := Finset.univ.filter (fun j =>
    windowHasRow z d.1 i ((sampleTree n).spans d.2)[j.val])
  have he : u.map Fin.valEmbedding = ownDepths z d i := by
    ext j
    simp only [u, Finset.mem_map, Finset.mem_filter, Finset.mem_univ, true_and, Fin.valEmbedding_apply,
      ownDepths, Tree.mem_activeDepths]
    constructor
    · rintro ⟨k,hk,rfl⟩
      exact ⟨k.isLt,hk⟩
    · rintro ⟨hj,h⟩
      exact ⟨⟨j,hj⟩,h,rfl⟩
  rw [← he, Finset.sum_map]
  exact Finset.sum_filter _ _

private theorem measurableSet_cutAt_eq_some {n : ℕ} (r : Fin (n + 1)) (i : Fin n) :
    MeasurableSet {z : Sample n | cutAt z Fin.val Fin.val_injective r = some i} := by
  unfold cutAt
  cases h : finSuccEquivLast r with
  | none => simp
  | some k =>
    simpa only [Option.map_some, Option.some.injEq, Set.preimage, Set.mem_singleton_iff] using
      (measurable_sortedRows Fin.val Fin.val_injective k) (measurableSet_singleton i)

private theorem measurableSet_windowHasRow {n : ℕ} (θ : Fin (cycleSize n)) (i : Fin n) (t : Tree) :
    MeasurableSet {z : Sample n | windowHasRow z θ i t} := by
  have he : {z : Sample n | windowHasRow z θ i t} = ⋃ q : t.Path,
      {z : Sample n | cutAt z Fin.val Fin.val_injective (shiftedRank n θ (t.position q)) = some i} := by
    ext z
    simp [windowHasRow]
  rw [he]
  exact MeasurableSet.iUnion (fun _ => measurableSet_cutAt_eq_some _ _)

theorem measurable_drawCharge {n : ℕ} (d : Draw n) (i : Fin n) :
    Measurable (fun z : Sample n => drawCharge z d i) := by
  classical
  unfold drawCharge
  have he (z : Sample n) : (localDrawCode z d).1.1 =
      cutAt z Fin.val Fin.val_injective (foldRank n (drawPosition d)) := by
    simp [localDrawCode, localCutEquiv, foldEquiv, cutEquiv_apply]
  simp only [he, sum_depths_eq_sum_fin]
  apply (measurable_drawWeight d).mul
  refine (Measurable.ite (measurableSet_cutAt_eq_some _ _) measurable_const measurable_const).add
    (measurable_const.mul ?_)
  exact Finset.measurable_sum _ fun j _ =>
    Measurable.ite (measurableSet_windowHasRow _ _ _) measurable_const measurable_const

theorem measurable_ownCharge {n : ℕ} (i : Fin n) : Measurable (fun z : Sample n => ownCharge z i) :=
  Finset.measurable_sum _ fun d _ => measurable_drawCharge d i

private theorem sum_window_indicator_le {n : ℕ} (z : Sample n) (θ : Fin (cycleSize n)) (t : Tree) :
    (∑ i : Fin n, if windowHasRow z θ i t then (1 : ℕ) else 0) ≤ Fintype.card t.Path := by
  classical
  let f := fun q : t.Path => cutAt z Fin.val Fin.val_injective (shiftedRank n θ (t.position q))
  have h₀ : (Finset.univ.filter (fun i => windowHasRow z θ i t)).card ≤
      (Finset.univ.image f).card := by
    apply Finset.card_le_card_of_injOn Option.some
    · intro i hi
      obtain ⟨q,hq⟩ := (Finset.mem_filter.mp hi).2
      exact Finset.mem_image.mpr ⟨q,Finset.mem_univ _,hq⟩
    · intro _ _ _ _ he
      exact Option.some.inj he
  rw [Finset.sum_boole]
  exact h₀.trans ((Finset.card_image_le).trans_eq Finset.card_univ)

private theorem sum_draw_depthCharge_le {n : ℕ} (hn : 0 < n) (z : Sample n) (d : Draw n) :
    (∑ i : Fin n, ∑ j ∈ ownDepths z d i, ((4 / 3 : ℝ)^j)^2) ≤ 72 * n := by
  classical
  let len := ((sampleTree n).spans d.2).length
  have hnR : (0 : ℝ) ≤ n := by positivity
  have hDepth (j : Fin len) :
      (∑ i : Fin n, if windowHasRow z d.1 i ((sampleTree n).spans d.2)[j.val]
        then ((4 / 3 : ℝ)^j.val)^2 else 0) ≤ 8 * n * (((4 / 3 : ℝ)^j.val)^2 * (1 / 2 : ℝ)^j.val) := by
    let t := ((sampleTree n).spans d.2)[j.val]
    let E := ((4 / 3 : ℝ)^j.val)^2
    have hc := sum_window_indicator_le z d.1 t
    have h1 : (∑ i : Fin n, if windowHasRow z d.1 i t then E else 0) =
        (∑ i : Fin n, ((if windowHasRow z d.1 i t then 1 else 0 : ℕ) : ℝ)) * E := by
      rw [Finset.sum_mul]
      exact Finset.sum_congr rfl fun i _ => by split <;> simp_all
    change (∑ i : Fin n, if windowHasRow z d.1 i t then E else 0) ≤ _
    rw [h1, ← Nat.cast_sum]
    obtain ⟨l,k,ht,hk,hdepth,_,_,_⟩ := sampleTree_span_bounds d.2 j.val j.isLt
    have hcard : Fintype.card t.Path = k + 1 := by
      change t = Tree.balanced l k at ht
      rw [ht]
      exact (Fintype.card_congr (Tree.balancedPositionEquiv l k)).trans (Fintype.card_fin _)
    have hk' : (2 : ℕ)^j.val * (k + 1) ≤ 8*n := by
      have hh := internal_power_two_le hn d.2 j.val j.isLt
      rw [Nat.mul_add, Nat.mul_one]
      omega
    have hreal : (k + 1 : ℝ) ≤ 8 * n * (1 / 2 : ℝ)^j.val := by
      rw [one_div_pow, mul_one_div]
      apply (le_div_iff₀ (by positivity)).mpr
      exact_mod_cast (by simpa [mul_comm] using hk')
    rw [hcard] at hc
    have hcast : ((∑ i : Fin n, if windowHasRow z d.1 i t then (1 : ℕ) else 0 : ℕ) : ℝ) ≤ k + 1 := by
      exact_mod_cast hc
    calc
      _ ≤ (k + 1 : ℝ) * E := mul_le_mul_of_nonneg_right hcast (by positivity)
      _ ≤ (8 * n * (1 / 2 : ℝ)^j.val) * E := mul_le_mul_of_nonneg_right hreal (by positivity)
      _ = _ := by dsimp [E]; ring
  simp only [sum_depths_eq_sum_fin]
  rw [Finset.sum_comm]
  have h := Finset.sum_le_sum (fun j (_ : j ∈ Finset.univ) => hDepth j)
  apply h.trans
  rw [← Finset.mul_sum]
  have hdecay := sum_depth_decay_le len
  rw [← Fin.sum_univ_eq_sum_range] at hdecay
  have hfin := mul_le_mul_of_nonneg_left hdecay (by positivity : 0 ≤ 8 * (n : ℝ))
  convert hfin using 1
  ring

private theorem sum_anchor_indicator_le {n : ℕ} (q : Option (Fin n)) :
    (∑ i : Fin n, if q = some i then Real.log 2 / 2 else 0) ≤ 1 := by
  cases q with
  | none => simp
  | some j =>
    simp only [Option.some.injEq, Finset.sum_ite_eq, Finset.mem_univ, ite_true]
    linarith [Real.log_le_self (by norm_num : 0 ≤ (2 : ℝ))]

theorem sum_ownCharge_le {n : ℕ} (hn : 0 < n) (z : Sample n) :
    (∑ i : Fin n, ownCharge z i) ≤ 73 := by
  classical
  unfold ownCharge
  rw [Finset.sum_comm]
  calc
    _ ≤ ∑ d : Draw n, drawWeight z d * 73 := by
      apply Finset.sum_le_sum
      intro d _
      simp only [drawCharge, ← Finset.mul_sum, Finset.sum_add_distrib]
      apply mul_le_mul_of_nonneg_left _ (drawWeight_nonneg _ _)
      have hd := sum_draw_depthCharge_le hn z d
      have hnR : 0 < (n : ℝ) := by exact_mod_cast hn
      have hbound : 1 / (n : ℝ) * (∑ i : Fin n, ∑ j ∈ ownDepths z d i, ((4 / 3 : ℝ)^j)^2) ≤ 72 := by
        calc
          _ ≤ 1 / (n : ℝ) * (72 * n) := mul_le_mul_of_nonneg_left hd (by positivity)
          _ = _ := by field_simp
      linarith [sum_anchor_indicator_le (localDrawCode z d).1.1]
    _ = _ := by rw [← Finset.sum_mul, sum_drawWeight, one_mul]

theorem integrable_ownCharge {n : ℕ} (hn : 0 < n) (D : Measure Observation) [IsProbabilityMeasure D]
    (i : Fin n) : Integrable (fun z : Sample n => ownCharge z i) (sampleMeasure n D) := by
  apply Integrable.of_bound (measurable_ownCharge i).aestronglyMeasurable 73
  apply Filter.Eventually.of_forall
  intro z
  have hn₀ : ∀ j : Fin n, 0 ≤ ownCharge z j :=
    fun j => Finset.sum_nonneg (fun d _ => drawCharge_nonneg z d j)
  rw [Real.norm_eq_abs, abs_of_nonneg (hn₀ i)]
  exact (Finset.single_le_sum (fun j _ => hn₀ j) (Finset.mem_univ i)).trans (sum_ownCharge_le hn z)

noncomputable def poolCharge {n : ℕ} (T : Pool n) : ℝ :=
  ∑ i : Fin n, selectorMean (fun s => ownCharge (select T (Function.update s i false)) i +
    ownCharge (select T (Function.update s i true)) i)

theorem auxInfo_le_poolCharge {n : ℕ} (hn : 0 < n) (T : Pool n) :
    channelInfo (auxMass T) ≤ poolCharge T :=
  (channelInfo_le_js _ (auxMass_nonneg T)).trans
    (Finset.sum_le_sum fun i _ => selectorMean_mono (fun s => sum_adjacent_js_le hn T s i))

end SteinkeZakynthinou
