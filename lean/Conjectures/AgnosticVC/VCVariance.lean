module

public import Conjectures.AgnosticVC.VC
public import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
public import Mathlib.Tactic.FieldSimp

@[expose] public section

namespace AgnosticVC

open Finset
open scoped BigOperators

variable {α : Type*} [DecidableEq α]

/-- Mass of a particular trace under restriction to `coords`. -/
def traceMass (F : Finset (Finset α)) (p : Finset α → ℝ) (coords v : Finset α) : ℝ :=
  ∑ s ∈ F.filter (fun s => coords ∩ s = v), p s

lemma traceMass_nonneg (F : Finset (Finset α)) (p : Finset α → ℝ)
    (hp : ∀ s ∈ F, 0 ≤ p s) (coords v : Finset α) : 0 ≤ traceMass F p coords v :=
  Finset.sum_nonneg fun _ hs => hp _ (Finset.mem_filter.mp hs).1

lemma traceMass_eq_zero_of_notMem {F : Finset (Finset α)} (p : Finset α → ℝ)
    {coords v : Finset α} (hv : v ∉ traceRestriction F coords) : traceMass F p coords v = 0 := by
  unfold traceMass
  suffices F.filter (fun s => coords ∩ s = v) = ∅ by simp [this]
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro s hs
  obtain ⟨hs, rfl⟩ := Finset.mem_filter.mp hs
  exact hv (Finset.mem_image_of_mem _ (Finset.mem_filter.mp hs).1)

lemma sum_traceMass (F : Finset (Finset α)) (p : Finset α → ℝ) (coords : Finset α) :
    ∑ v ∈ traceRestriction F coords, traceMass F p coords v = ∑ s ∈ F, p s := by
  apply Finset.sum_fiberwise_of_maps_to
  intro s hs
  exact Finset.mem_image_of_mem _ hs

/-- The real-valued indicator of a positive prediction at coordinate `i`. -/
def predictionIndicator (i : α) (s : Finset α) : ℝ := if i ∈ s then 1 else 0

/-- The conditional mean of a prediction given the restriction to `coords`. -/
noncomputable def conditionalPredictionMean (F : Finset (Finset α)) (p : Finset α → ℝ)
    (coords : Finset α) (i : α) (v : Finset α) : ℝ :=
  (∑ s ∈ F.filter (fun s => coords ∩ s = v ∧ i ∈ s), p s) / traceMass F p coords v

/-- The expected conditional variance of a prediction given a set of coordinates. -/
noncomputable def conditionalPredictionVariance (F : Finset (Finset α)) (p : Finset α → ℝ)
    (coords : Finset α) (i : α) : ℝ :=
  ∑ s ∈ F, p s * (predictionIndicator i s - conditionalPredictionMean F p coords i (coords ∩ s)) ^ 2

private lemma filter_trace_partition (F : Finset (Finset α)) (coords v : Finset α) (i : α) :
    (F.filter (fun s => coords ∩ s = v)).filter (fun s => i ∈ s) =
      F.filter (fun s => coords ∩ s = v ∧ i ∈ s) := by
  ext s
  simp only [Finset.mem_filter]
  tauto

lemma conditionalPredictionVariance_eq_zero_of_mem (F : Finset (Finset α)) (p : Finset α → ℝ)
    (hp : ∀ s ∈ F, 0 ≤ p s) {coords : Finset α} {i : α} (hi : i ∈ coords) :
    conditionalPredictionVariance F p coords i = 0 := by
  apply Finset.sum_eq_zero
  intro s hs
  by_cases hs0 : p s = 0
  · simp [hs0]
  have hsum : 0 < traceMass F p coords (coords ∩ s) := by
    apply (lt_of_le_of_ne (hp s hs) (Ne.symm hs0)).trans_le
    exact Finset.single_le_sum (f := p) (fun u hu => hp u (Finset.mem_filter.mp hu).1)
      (Finset.mem_filter.mpr ⟨hs, rfl⟩)
  have hmem : ∀ t, coords ∩ t = coords ∩ s → (i ∈ t ↔ i ∈ s) := by
    intro t ht
    simpa only [Finset.mem_inter, hi, true_and] using
      (congrArg (fun w : Finset α => i ∈ w) ht).to_iff
  by_cases his : i ∈ s
  · have heq : F.filter (fun t => coords ∩ t = coords ∩ s ∧ i ∈ t) =
        F.filter (fun t => coords ∩ t = coords ∩ s) := by
      ext t
      simp only [Finset.mem_filter]
      grind
    have hm : conditionalPredictionMean F p coords i (coords ∩ s) = 1 := by
      rw [conditionalPredictionMean, heq]
      change traceMass F p coords (coords ∩ s) / traceMass F p coords (coords ∩ s) = 1
      exact div_self hsum.ne'
    simp [predictionIndicator, his, hm]
  · have heq : F.filter (fun t => coords ∩ t = coords ∩ s ∧ i ∈ t) = ∅ := by
      ext t
      simp only [Finset.mem_filter, Finset.notMem_empty, iff_false]
      grind
    simp [predictionIndicator, conditionalPredictionMean, his, heq]

private lemma extend_trace (coords s : Finset α) (i : α) :
    insert i coords ∩ s = if i ∈ s then insert i (coords ∩ s) else coords ∩ s := by
  split
  · exact Finset.insert_inter_of_mem ‹i ∈ s›
  · exact Finset.insert_inter_of_notMem ‹i ∉ s›

private lemma filter_extend_trace (F : Finset (Finset α)) {coords v : Finset α} {i : α}
    (hi : i ∉ coords) (hv : i ∉ v) :
    (F.filter (fun s => insert i coords ∩ s = v) =
        (F.filter (fun s => coords ∩ s = v)).filter (fun s => i ∉ s)) ∧
    (F.filter (fun s => insert i coords ∩ s = insert i v) =
        (F.filter (fun s => coords ∩ s = v)).filter (fun s => i ∈ s)) := by
  have hinj (s : Finset α) : insert i (coords ∩ s) = insert i v ↔ coords ∩ s = v := by
    constructor
    · intro heq
      apply_fun (·.erase i) at heq
      simpa [Finset.erase_insert, hi, hv] using heq
    · exact congrArg (insert i)
  constructor <;> ext s
  · by_cases his : i ∈ s
    · have hne : insert i (coords ∩ s) ≠ v := fun h => hv (h ▸ Finset.mem_insert_self _ _)
      simp [Finset.mem_filter, extend_trace, his, hne]
    · simp [Finset.mem_filter, extend_trace, his]
  · by_cases his : i ∈ s
    · simp [Finset.mem_filter, extend_trace, his, hinj]
    · have hne : coords ∩ s ≠ insert i v := fun h => hi (Finset.mem_inter.mp
        (h.symm ▸ Finset.mem_insert_self _ _)).1
      simp [Finset.mem_filter, extend_trace, his, hne]

private lemma bernoulliVariance (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) :
    a * (0 - b / (a + b)) ^ 2 + b * (1 - b / (a + b)) ^ 2 = a * b / (a + b) := by
  by_cases h : a + b = 0
  · have ha0 : a = 0 := by linarith
    have hb0 : b = 0 := by linarith
    simp [ha0, hb0]
  · field_simp
    ring

/-- A Bernoulli prediction conditioned on a trace has one variance contribution per edge. -/
lemma conditionalPredictionVariance_eq_sum_edges (F : Finset (Finset α)) (p : Finset α → ℝ)
    (hp : ∀ s ∈ F, 0 ≤ p s) {coords : Finset α} {i : α} (hi : i ∉ coords) :
    conditionalPredictionVariance F p coords i =
      ∑ v ∈ oneInclusionEdges (traceRestriction F (insert i coords)) i,
        traceMass F p (insert i coords) v * traceMass F p (insert i coords) (insert i v) /
          (traceMass F p (insert i coords) v + traceMass F p (insert i coords) (insert i v)) := by
  let G := traceRestriction F coords
  let H := traceRestriction F (insert i coords)
  let a := traceMass F p (insert i coords)
  have hsub : oneInclusionEdges H i ⊆ G := by
    intro v hv
    obtain ⟨hv, hiv, _⟩ := mem_oneInclusionEdges.mp hv
    obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp hv
    have his : i ∉ s := fun his => hiv (by simp [his])
    have heq : insert i coords ∩ s = coords ∩ s := by simp [his]
    exact heq.symm ▸ (Finset.mem_image_of_mem (coords ∩ ·) hs)
  change _ = ∑ v ∈ oneInclusionEdges H i, a v * a (insert i v) / (a v + a (insert i v))
  have hone : ∀ v ∈ G, i ∉ v := by
    intro v hv
    obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp hv
    exact fun h => hi (Finset.mem_inter.mp h).1
  have heq (v : Finset α) (hv : v ∈ G) : traceMass F p coords v = a v + a (insert i v) := by
    obtain ⟨h₀, h₁⟩ := filter_extend_trace F hi (hone v hv)
    dsimp only [a, traceMass]
    rw [h₀, h₁, add_comm]
    simpa using (Finset.sum_filter_add_sum_filter_not (s := F.filter
      (fun s => coords ∩ s = v)) (p := fun s => i ∈ s) p).symm
  have hmean (v : Finset α) (hv : v ∈ G) : conditionalPredictionMean F p coords i v =
      a (insert i v) / (a v + a (insert i v)) := by
    obtain ⟨_, h₁⟩ := filter_extend_trace F hi (hone v hv)
    rw [conditionalPredictionMean, heq v hv, ← filter_trace_partition, ← h₁]
    rfl
  have hfiber (v : Finset α) (hv : v ∈ G) :
      (∑ s ∈ F.filter (fun s => coords ∩ s = v), p s *
        (predictionIndicator i s - conditionalPredictionMean F p coords i (coords ∩ s)) ^ 2) =
        a v * a (insert i v) / (a v + a (insert i v)) := by
    obtain ⟨h₀, h₁⟩ := filter_extend_trace F hi (hone v hv)
    rw [← Finset.sum_filter_add_sum_filter_not (s := F.filter (fun s => coords ∩ s = v))
      (p := fun s => i ∉ s)]
    push Not
    let c := a (insert i v) / (a v + a (insert i v))
    have hk₀ : (∑ s ∈ (F.filter (fun s => coords ∩ s = v)).filter (fun s => i ∉ s), p s *
          (predictionIndicator i s - conditionalPredictionMean F p coords i (coords ∩ s)) ^ 2) =
        a v * (0 - c) ^ 2 := by
      rw [show a v = ∑ s ∈ F.filter (fun s => insert i coords ∩ s = v), p s from rfl,
        h₀, Finset.sum_mul]
      apply Finset.sum_congr rfl
      intro s hs
      obtain ⟨⟨_, hsv⟩, his⟩ := Finset.mem_filter.mp hs |>.imp_left Finset.mem_filter.mp
      simp [predictionIndicator, his, hsv, hmean v hv, c]
    have hk₁ : (∑ s ∈ (F.filter (fun s => coords ∩ s = v)).filter (fun s => i ∈ s), p s *
          (predictionIndicator i s - conditionalPredictionMean F p coords i (coords ∩ s)) ^ 2) =
        a (insert i v) * (1 - c) ^ 2 := by
      rw [show a (insert i v) = ∑ s ∈ F.filter (fun s => insert i coords ∩ s = insert i v), p s from rfl,
        h₁, Finset.sum_mul]
      apply Finset.sum_congr rfl
      intro s hs
      obtain ⟨⟨_, hsv⟩, his⟩ := Finset.mem_filter.mp hs |>.imp_left Finset.mem_filter.mp
      simp [predictionIndicator, his, hsv, hmean v hv, c]
    rw [hk₀, hk₁]
    exact bernoulliVariance _ _ (traceMass_nonneg F p hp _ _) (traceMass_nonneg F p hp _ _)
  unfold conditionalPredictionVariance
  rw [← Finset.sum_fiberwise_of_maps_to (t := G) (fun s hs =>
    Finset.mem_image_of_mem (coords ∩ ·) hs)]
  rw [Finset.sum_congr rfl hfiber]
  symm
  apply Finset.sum_subset hsub
  intro v hv hve
  have hne : v ∉ H ∨ insert i v ∉ H := by
    simp only [mem_oneInclusionEdges, hone v hv] at hve
    tauto
  rcases hne with h | h
  · simp [a, traceMass_eq_zero_of_notMem p h]
  · simp [a, traceMass_eq_zero_of_notMem p h]

private lemma edgeVariance_le_min (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) :
    a * b / (a + b) ≤ min a b := by
  by_cases h : a + b = 0
  · simp [h, le_min ha hb]
  · have hpos : 0 < a + b := lt_of_le_of_ne (add_nonneg ha hb) (Ne.symm h)
    refine le_min ((div_le_iff₀ hpos).mpr ?_) ((div_le_iff₀ hpos).mpr ?_)
    · nlinarith only [mul_nonneg ha ha]
    · nlinarith only [mul_nonneg hb hb]

/-- On a fixed block, the sum of residual variances over all single omissions is bounded by
its trace family's VC dimension times the total mass. -/
theorem sum_omissionVariance_le (F : Finset (Finset α)) (p : Finset α → ℝ)
    (hp : ∀ s ∈ F, 0 ≤ p s) (T : Finset α) (d : ℕ) (hd : F.vcDim ≤ d) :
    ∑ i ∈ T, conditionalPredictionVariance F p (T.erase i) i ≤ (d : ℝ) * ∑ s ∈ F, p s := by
  let G := traceRestriction F T
  let q := traceMass F p T
  have hbound := weighted_oneInclusionEdges_le G T d q
    (fun v hv => by obtain ⟨s, _, rfl⟩ := Finset.mem_image.mp hv; exact Finset.inter_subset_left)
    ((traceRestriction_vcDim_le _ _).trans hd) (fun v _ => traceMass_nonneg F p hp T v)
  have hmass : ∑ v ∈ G, q v = ∑ s ∈ F, p s := sum_traceMass F p T
  rw [hmass] at hbound
  refine (Finset.sum_le_sum fun i hi => ?_).trans hbound
  rw [conditionalPredictionVariance_eq_sum_edges F p hp (Finset.notMem_erase i T),
    Finset.insert_erase hi]
  exact Finset.sum_le_sum fun v _ => edgeVariance_le_min _ _
    (traceMass_nonneg F p hp T v) (traceMass_nonneg F p hp T (insert i v))

private lemma sum_subsets_and_omissions {R : Type*} [AddCommMonoid R]
    (coords : Finset α) (m : ℕ) (f : Finset α → α → R) :
    ∑ M ∈ coords.powersetCard m, ∑ i ∈ coords \ M, f M i =
      ∑ T ∈ coords.powersetCard (m + 1), ∑ i ∈ T, f (T.erase i) i := by
  rw [Finset.sum_sigma', Finset.sum_sigma']
  refine Finset.sum_bij' (fun x _ => ⟨insert x.2 x.1, x.2⟩)
    (fun x _ => ⟨x.1.erase x.2, x.2⟩) ?_ ?_ ?_ ?_ ?_
  · intro x hx
    obtain ⟨⟨hsub, hcard⟩, hi, hnot⟩ := Finset.mem_sigma.mp hx |>.imp
      Finset.mem_powersetCard.mp Finset.mem_sdiff.mp
    exact Finset.mem_sigma.mpr ⟨Finset.mem_powersetCard.mpr
      ⟨Finset.insert_subset hi hsub, by rw [Finset.card_insert_of_notMem hnot, hcard]⟩,
      Finset.mem_insert_self _ _⟩
  · intro y hy
    obtain ⟨⟨hsub, hcard⟩, hi⟩ := Finset.mem_sigma.mp hy |>.imp_left Finset.mem_powersetCard.mp
    exact Finset.mem_sigma.mpr ⟨Finset.mem_powersetCard.mpr
      ⟨(Finset.erase_subset _ _).trans hsub, by simp [Finset.card_erase_of_mem hi, hcard]⟩,
      Finset.mem_sdiff.mpr ⟨hsub hi, Finset.notMem_erase _ _⟩⟩
  · rintro ⟨M, i⟩ hx
    have hi := (Finset.mem_sdiff.mp (Finset.mem_sigma.mp hx).2).2
    simp [Finset.erase_insert hi]
  · rintro ⟨T, i⟩ hy
    have hi := (Finset.mem_sigma.mp hy).2
    simp [Finset.insert_erase hi]
  · intro x hx
    have hi := (Finset.mem_sdiff.mp (Finset.mem_sigma.mp hx).2).2
    simp [Finset.erase_insert hi]

/-- The mean residual variance over a uniform coordinate and an independent uniform
`m`-subset, for every nonnegative law on every finite binary trace family. -/
theorem average_conditionalPredictionVariance_le (F : Finset (Finset α)) (p : Finset α → ℝ)
    (hp : ∀ s ∈ F, 0 ≤ p s) (coords : Finset α) (m d : ℕ)
    (hm : m < coords.card) (hd : F.vcDim ≤ d) :
    (∑ M ∈ coords.powersetCard m, ∑ i ∈ coords, conditionalPredictionVariance F p M i) /
        ((coords.card : ℝ) * ((coords.powersetCard m).card : ℝ)) ≤
      (d : ℝ) * (∑ s ∈ F, p s) / (m + 1 : ℝ) := by
  let A := (d : ℝ) * (∑ s ∈ F, p s)
  have hA : 0 ≤ A := mul_nonneg (Nat.cast_nonneg _) (Finset.sum_nonneg hp)
  have hdrop : ∀ M ∈ coords.powersetCard m,
      ∑ i ∈ coords, conditionalPredictionVariance F p M i =
        ∑ i ∈ coords \ M, conditionalPredictionVariance F p M i := by
    intro M hM
    symm
    refine Finset.sum_subset Finset.sdiff_subset ?_
    intro i hi hnot
    have him : i ∈ M := by by_contra hn; exact hnot (Finset.mem_sdiff.mpr ⟨hi, hn⟩)
    exact conditionalPredictionVariance_eq_zero_of_mem F p hp him
  rw [Finset.sum_congr rfl hdrop, sum_subsets_and_omissions]
  have hsum : (∑ T ∈ coords.powersetCard (m + 1), ∑ i ∈ T,
      conditionalPredictionVariance F p (T.erase i) i) ≤
        ((coords.powersetCard (m + 1)).card : ℝ) * A := by
    calc
      _ ≤ ∑ T ∈ coords.powersetCard (m + 1), A :=
        Finset.sum_le_sum fun T _ => sum_omissionVariance_le F p hp T d hd
      _ = _ := by simp [nsmul_eq_mul]
  have hchoose : ((coords.powersetCard (m + 1)).card : ℝ) * (m + 1 : ℝ) =
      ((coords.powersetCard m).card : ℝ) * ((coords.card - m : ℕ) : ℝ) := by
    simp only [Finset.card_powersetCard]
    exact_mod_cast Nat.choose_succ_right_eq coords.card m
  have hN : 0 < (coords.card : ℝ) := Nat.cast_pos.mpr (Nat.zero_lt_of_lt hm)
  have hc : 0 < ((coords.powersetCard m).card : ℝ) := by
    rw [Finset.card_powersetCard]
    exact Nat.cast_pos.mpr (Nat.choose_pos hm.le)
  have hmpos : 0 < (m + 1 : ℝ) := by linarith only [Nat.cast_nonneg (α := ℝ) m]
  apply (div_le_div_iff₀ (mul_pos hN hc) hmpos).mpr
  calc
    _ ≤ (((coords.powersetCard (m + 1)).card : ℝ) * A) * (m + 1 : ℝ) :=
      mul_le_mul_of_nonneg_right hsum hmpos.le
    _ = (A * (((coords.powersetCard m).card : ℝ))) * ((coords.card - m : ℕ) : ℝ) := by
      rw [mul_comm _ A, mul_assoc, hchoose, ← mul_assoc]
    _ ≤ (A * (((coords.powersetCard m).card : ℝ))) * (coords.card : ℝ) :=
      mul_le_mul_of_nonneg_left (Nat.cast_le.mpr (Nat.sub_le _ _)) (mul_nonneg hA hc.le)
    _ = _ := by dsimp [A]; ring

end AgnosticVC
