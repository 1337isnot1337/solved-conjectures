module

public import Conjectures.SteinkeZakynthinou.Balanced
public import Conjectures.SteinkeZakynthinou.Rank
public import Mathlib.Data.Fintype.EquivFin
public import Mathlib.Algebra.Group.Fin.Basic
public import Mathlib.Logic.Equiv.Fin.Basic

/-! The shifted folded-rank tree, and its guarantee on every ordered sample. -/

@[expose] public section

open MeasureTheory
open scoped BigOperators

namespace SteinkeZakynthinou

abbrev cycleSize (n : ℕ) := 2 * n + 1 + 1

theorem cycleSize_pos (n : ℕ) : 0 < cycleSize n := Nat.zero_lt_succ _

def sampleTree (n : ℕ) : Tree := Tree.balanced 0 (2 * n + 1)

abbrev Draw (n : ℕ) := Fin (cycleSize n) × (sampleTree n).Path

def foldRank (n : ℕ) (i : Fin (cycleSize n)) : Fin (n + 1) :=
  if h : i.val < n + 1 then ⟨i.val, h⟩ else ⟨cycleSize n - 1 - i.val, by
    have hi := i.isLt
    simp only [cycleSize] at *
    omega⟩

theorem foldRank_surjective (n : ℕ) : Function.Surjective (foldRank n) := by
  intro r
  let k : Fin (cycleSize n) := ⟨r.val, by have h := r.isLt; change r.val < 2 * n + 1 + 1; omega⟩
  refine ⟨k, ?_⟩
  apply Fin.ext
  simp [foldRank, k, r.isLt]

noncomputable def cutAt {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) (r : Fin (n + 1)) : Option (Fin n) :=
  (finSuccEquivLast r).map (sortedRows z tag ht)

theorem cutAt_surjective {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) : Function.Surjective (cutAt z tag ht) := by
  intro q
  refine ⟨finSuccEquivLast.symm (q.map (sortedRows z tag ht).symm), ?_⟩
  simp only [cutAt, Equiv.apply_symm_apply]
  cases q <;> simp

def shiftedRank (n : ℕ) (shift : Fin (cycleSize n)) (position : ℕ) : Fin (n + 1) :=
  foldRank n (⟨position % cycleSize n, Nat.mod_lt _ (cycleSize_pos n)⟩ + shift)

theorem shiftedRank_surjective (n : ℕ) (shift : Fin (cycleSize n)) :
    Function.Surjective (fun p : (sampleTree n).Path =>
      shiftedRank n shift ((sampleTree n).position p)) := by
  intro r
  obtain ⟨k, hk⟩ := foldRank_surjective n r
  let i := k - shift
  have hi := i.isLt
  obtain ⟨p, hp⟩ := Tree.balanced_position_surj 0 (2 * n + 1) i.val (Nat.zero_le _)
    (by change i.val < 2 * n + 1 + 1 at hi; omega)
  refine ⟨p, ?_⟩
  change shiftedRank n shift ((Tree.balanced 0 (2 * n + 1)).position p) = _
  rw [hp, ← hk]
  unfold shiftedRank
  have he : (⟨i.val % cycleSize n, Nat.mod_lt _ (cycleSize_pos n)⟩ : Fin (cycleSize n)) = i :=
    Fin.ext (Nat.mod_eq_of_lt i.isLt)
  rw [he, sub_add_cancel]

noncomputable def noiseScale (n j : ℕ) : ℝ :=
  256 * Real.sqrt n * (3 / 4 : ℝ) ^ j

theorem noiseScale_pos {n : ℕ} (hn : 0 < n) (j : ℕ) : 0 < noiseScale n j := by
  unfold noiseScale
  have h : (0 : ℝ) < n := by exact_mod_cast hn
  positivity

theorem noiseScale_succ (n j : ℕ) : noiseScale n (j + 1) = 3 / 4 * noiseScale n j := by
  unfold noiseScale
  rw [pow_succ]
  ring

noncomputable def shiftedCost {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) (s : Fin (cycleSize n)) (i : ℕ) : ℝ :=
  virtualLoss z tag (cutAt z tag ht (shiftedRank n s i))

noncomputable def drawWeight {n : ℕ} (z : Sample n) (d : Draw n) : ℝ :=
  (sampleTree n).probability (shiftedCost z Fin.val Fin.val_injective d.1)
    (noiseScale n) 0 d.2 / cycleSize n

noncomputable def drawThreshold {n : ℕ} (hn : 0 < n) (z : Sample n) (d : Draw n) : ℝ :=
  properEndpoint hn z
    (cutAt z Fin.val Fin.val_injective (shiftedRank n d.1 ((sampleTree n).position d.2)))

theorem drawWeight_nonneg {n : ℕ} (z : Sample n) (d : Draw n) : 0 ≤ drawWeight z d :=
  div_nonneg ((sampleTree n).probability_pos _ _ _ _).le (by positivity)

theorem sum_drawWeight {n : ℕ} (z : Sample n) : ∑ d : Draw n, drawWeight z d = 1 := by
  rw [Fintype.sum_prod_type]
  simp only [drawWeight, div_eq_mul_inv, ← Finset.sum_mul, Tree.sum_probability, one_mul,
    Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
  exact mul_inv_cancel₀ (by positivity)

private theorem shifted_expected_totalLoss {n : ℕ} (hn : 0 < n) (z : Sample n)
    (t : ℝ) (s : Fin (cycleSize n)) :
    (∑ p : (sampleTree n).Path,
      (sampleTree n).probability (shiftedCost z Fin.val Fin.val_injective s) (noiseScale n) 0 p *
        totalLoss z (drawThreshold hn z (s, p))) ≤ totalLoss z t + 512 * Real.sqrt n := by
  let c := shiftedCost z Fin.val Fin.val_injective s
  obtain ⟨q, hq⟩ := exists_virtualLoss_eq z Fin.val t
  obtain ⟨r, hr⟩ := cutAt_surjective z Fin.val Fin.val_injective q
  obtain ⟨p, hp⟩ := shiftedRank_surjective n s r
  have hmin : (sampleTree n).minimum c ≤ totalLoss z t := by
    have h := (sampleTree n).minimum_le c p
    simpa only [c, shiftedCost, hp, hr, hq] using h
  have hlocal := (sampleTree n).expected_cost_le c (noiseScale n) (fun j => 2 * noiseScale n j)
    (noiseScale_pos hn) (fun j => by have := noiseScale_pos hn j; positivity)
    (fun j => by rw [noiseScale_succ]; ring_nf; exact le_rfl) 0
  have hroot : 2 * noiseScale n 0 = 512 * Real.sqrt n := by simp [noiseScale]; ring
  calc
    _ ≤ ∑ p : (sampleTree n).Path,
        (sampleTree n).probability c (noiseScale n) 0 p * c ((sampleTree n).position p) :=
      Finset.sum_le_sum fun p _ =>
        mul_le_mul_of_nonneg_left (totalLoss_properEndpoint_le hn z Fin.val _)
          ((sampleTree n).probability_pos c _ 0 p).le
    _ ≤ _ := by linarith

theorem expected_drawLoss_le {n : ℕ} (hn : 0 < n) (z : Sample n) (t : ℝ) :
    (∑ d : Draw n, drawWeight z d * empiricalLoss z (drawThreshold hn z d)) ≤
      empiricalLoss z t + 512 / Real.sqrt n := by
  have hM : (0 : ℝ) < cycleSize n := by positivity
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  have hs := Real.sqrt_pos.2 hnR
  have he := Real.sq_sqrt hnR.le
  have hdiv : (totalLoss z t + 512 * Real.sqrt n) / n =
      empiricalLoss z t + 512 / Real.sqrt n := by
    unfold empiricalLoss
    field_simp
    nlinarith
  rw [← hdiv]
  rw [Fintype.sum_prod_type]
  simp only [drawWeight, empiricalLoss]
  let b := (totalLoss z t + 512 * Real.sqrt n) / n / cycleSize n
  have hb : (∑ _ : Fin (cycleSize n), b) = (totalLoss z t + 512 * Real.sqrt n) / n := by
    simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul, b]
    rw [mul_comm, div_mul_cancel₀ _ hM.ne']
  rw [← hb]
  apply Finset.sum_le_sum
  intro s _
  have h := div_le_div_of_nonneg_right
    (div_le_div_of_nonneg_right (shifted_expected_totalLoss hn z t s) hnR.le) hM.le
  unfold b
  convert h using 1
  simp only [div_eq_mul_inv, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro p _
  ring

local instance {n : ℕ} : MeasurableSpace (Option (Fin n)) := ⊤
local instance {n : ℕ} : MeasurableSingletonClass (Option (Fin n)) :=
  ⟨fun _ => MeasurableSpace.measurableSet_top⟩

private theorem measurable_cutAt {n : ℕ} (r : Fin (n + 1)) :
    Measurable (fun z : Sample n => cutAt z Fin.val Fin.val_injective r) := by
  unfold cutAt
  cases h : finSuccEquivLast r with
  | none => exact measurable_const
  | some i =>
    exact (measurable_of_countable Option.some).comp (measurable_sortedRows Fin.val Fin.val_injective i)

private theorem measurable_virtualLoss {n : ℕ} (q : Option (Fin n)) :
    Measurable (fun z : Sample n => virtualLoss z Fin.val q) := by
  unfold virtualLoss
  apply Finset.measurable_sum
  intro i _
  have hb : Measurable (fun z : Sample n => (z i).2) :=
    measurable_snd.comp (show Measurable (fun z : Sample n => z i) from measurable_pi_apply i)
  have hp : Measurable (fun z : Sample n => virtualPredict z Fin.val q i) := by
    cases q with
    | none => exact measurable_const
    | some k =>
      have hk : MeasurableSet {z : Sample n | key (z k) k.val ≤ key (z i) i.val} := by
        convert (measurableSet_key_lt Fin.val i k).compl using 1
        ext z
        change (key (z k) k.val ≤ key (z i) i.val) ↔ ¬ key (z i) i.val < key (z k) k.val
        exact not_lt.symm
      have hm : Measurable (fun z : Sample n =>
          if key (z k) k.val ≤ key (z i) i.val then true else false) :=
        Measurable.ite hk measurable_const measurable_const
      convert hm using 1
      funext z
      change decide (key (z k) k.val ≤ key (z i) i.val) = _
      by_cases h : key (z k) k.val ≤ key (z i) i.val <;> simp [h]
  exact Measurable.ite (measurableSet_eq_fun hp hb) measurable_const measurable_const

private theorem measurable_shiftedCost {n : ℕ} (s : Fin (cycleSize n)) (i : ℕ) :
    Measurable (fun z : Sample n => shiftedCost z Fin.val Fin.val_injective s i) :=
  (measurable_from_prod_countable_left
    (f := fun p : Sample n × Option (Fin n) => virtualLoss p.1 Fin.val p.2)
    (fun q => measurable_virtualLoss q)).comp
    (measurable_id.prodMk (measurable_cutAt (shiftedRank n s i)))

private theorem measurable_choice : Measurable choice := by
  change Measurable (fun d : ℝ => if 0 ≤ d then 1 / (2 * (1 + d)) else 1 - 1 / (2 * (1 - d)))
  exact Measurable.ite (measurableSet_le measurable_const measurable_id) (by fun_prop) (by fun_prop)

private theorem measurable_treeMinimum {α : Type*} [MeasurableSpace α]
    (c : α → ℕ → ℝ) (hc : ∀ i, Measurable (fun x => c x i)) (t : Tree) :
    Measurable (fun x => t.minimum (c x)) := by
  induction t with
  | leaf i => exact hc i
  | fork l r ihl ihr => exact ihl.min ihr

private theorem measurable_treeProbability {α : Type*} [MeasurableSpace α]
    (c : α → ℕ → ℝ) (hc : ∀ i, Measurable (fun x => c x i)) (scale : ℕ → ℝ)
    (t : Tree) (j : ℕ) (p : t.Path) :
    Measurable (fun x => t.probability (c x) scale j p) := by
  induction t generalizing j with
  | leaf => exact measurable_const
  | fork l r ihl ihr =>
    have hl := measurable_treeMinimum c hc l
    have hr := measurable_treeMinimum c hc r
    change Sum l.Path r.Path at p
    cases p with
    | inl p =>
      exact (measurable_choice.comp ((hl.sub hr).div_const _)).mul (ihl _ p)
    | inr p =>
      exact (measurable_choice.comp ((hr.sub hl).div_const _)).mul (ihr _ p)

theorem measurable_drawWeight {n : ℕ} (d : Draw n) :
    Measurable (fun z => drawWeight z d) :=
  (measurable_treeProbability (fun z => shiftedCost z Fin.val Fin.val_injective d.1)
    (measurable_shiftedCost d.1) _ _ _ _).div_const _

theorem measurable_drawThreshold {n : ℕ} (hn : 0 < n) (d : Draw n) :
    Measurable (fun z => drawThreshold hn z d) :=
  (measurable_from_prod_countable_left
    (f := fun p : Sample n × Option (Fin n) => properEndpoint hn p.1 p.2)
    (fun q => measurable_properEndpoint hn q)).comp
    (measurable_id.prodMk (measurable_cutAt (shiftedRank n d.1 ((sampleTree n).position d.2))))

/-- The actual proper randomized learner. Its random law uses only the
training sample, and every output is a finite real threshold. -/
noncomputable def shiftedTreeLearner {n : ℕ} (hn : 0 < n) : Learner n where
  outcomes := Fintype.card (Draw n)
  threshold z i := drawThreshold hn z ((Fintype.equivFin (Draw n)).symm i)
  weight z i := drawWeight z ((Fintype.equivFin (Draw n)).symm i)
  weight_nonneg z _i := drawWeight_nonneg z _
  weight_sum z := ((Fintype.equivFin (Draw n)).symm.sum_comp (drawWeight z)).trans
    (sum_drawWeight z)
  measurable_threshold _i := measurable_drawThreshold hn _
  measurable_weight _i := measurable_drawWeight _

theorem shiftedTreeLearner_expectedLoss_le {n : ℕ} (hn : 0 < n) (z : Sample n) (t : ℝ) :
    (shiftedTreeLearner hn).expectedLoss z ≤ empiricalLoss z t + 512 / Real.sqrt n := by
  let g := fun d : Draw n => drawWeight z d * empiricalLoss z (drawThreshold hn z d)
  change (∑ i, g ((Fintype.equivFin (Draw n)).symm i)) ≤ _
  rw [(Fintype.equivFin (Draw n)).symm.sum_comp g]
  exact expected_drawLoss_le hn z t

end SteinkeZakynthinou
