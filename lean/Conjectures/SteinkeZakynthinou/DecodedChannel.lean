module

public import Conjectures.SteinkeZakynthinou.Properization
public import Conjectures.SteinkeZakynthinou.Pool

/-! From auxiliary finite codes back to the learner's actual real output. -/

@[expose] public section

open SteinkeZakynthinou.Learner
open scoped BigOperators

namespace SteinkeZakynthinou

theorem channelInfo_eq_mean_log {n : ℕ} {α : Type*} [Fintype α]
    (p : Selector n → α → ℝ) (hp : ∀ s a, 0 ≤ p s a) :
    channelInfo p = selectorMean (fun s => ∑ a,
      p s a * Real.log (p s a / selectorMean (fun v => p v a))) := by
  unfold channelInfo
  rw [selectorMean_sum]
  apply Finset.sum_congr rfl
  intro a _
  let f := fun s => p s a
  let m := selectorMean f
  have he (s : Selector n) : f s * Real.log (f s / m) =
      entropyTerm (f s) - f s * Real.log m := by
    by_cases hf : f s = 0
    · simp [hf, entropyTerm]
    have hm : m ≠ 0 := fun h => hf (eq_zero_of_selectorMean_eq_zero (fun s => hp s a) h s)
    rw [Real.log_div hf hm, mul_sub, entropyTerm]
  change entropyGap f = selectorMean (fun s => f s * Real.log (f s / m))
  simp only [he, selectorMean_sub, selectorMean_mul_const, entropyGap, entropyTerm, m]

noncomputable def weightedCode {n : ℕ} {α ι : Type*} [Fintype ι] [DecidableEq α]
    (f : Selector n → ι → α) (w : Selector n → ι → ℝ) (s : Selector n) (a : α) : ℝ :=
  ∑ i, if f s i = a then w s i else 0

theorem weightedCode_nonneg {n : ℕ} {α ι : Type*} [Fintype ι] [DecidableEq α]
    (f : Selector n → ι → α) (w : Selector n → ι → ℝ) (hw : ∀ s i, 0 ≤ w s i)
    (s : Selector n) (a : α) : 0 ≤ weightedCode f w s a :=
  Finset.sum_nonneg fun i _ => by split; exact hw s i; exact le_rfl

theorem push_weightedCode {n : ℕ} {α β ι : Type*} [Fintype ι] [Fintype α]
    [DecidableEq α] [DecidableEq β] (g : α → β)
    (f : Selector n → ι → α) (w : Selector n → ι → ℝ) :
    pushChannel g (weightedCode f w) = weightedCode (fun s i => g (f s i)) w := by
  funext s b
  unfold pushChannel weightedCode
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro i _
  simp only [Finset.sum_ite_eq, Finset.mem_filter, Finset.mem_univ, true_and]

theorem learner_poolInformation_eq_code {n : ℕ} (a : Learner n) (T : Pool n)
    {α : Type*} [Fintype α] [DecidableEq α] (g : α → ℝ) (hg : Function.Injective g)
    (code : Selector n → Fin a.outcomes → α)
    (hc : ∀ s i, a.threshold (select T s) i = g (code s i)) :
    a.poolInformation T = channelInfo (weightedCode code (fun s i => a.weight (select T s) i)) := by
  classical
  let w := fun s i => a.weight (select T s) i
  let p := weightedCode code w
  have he (s : Selector n) (x : α) : a.mass (select T s) (g x) = p s x := by
    unfold mass p weightedCode w
    simp only [hc, hg.eq_iff]
  rw [channelInfo_eq_mean_log p (weightedCode_nonneg code w (fun s i => a.weight_nonneg _ _))]
  unfold poolInformation
  simp only [hc, he]
  congr 1
  funext s
  let r := fun x => Real.log (p s x / selectorMean (fun v => p v x))
  change (∑ i, w s i * r (code s i)) = ∑ x, p s x * r x
  rw [← Finset.sum_fiberwise Finset.univ (code s) (fun i => w s i * r (code s i))]
  apply Finset.sum_congr rfl
  intro x _
  have hh (i : Fin a.outcomes) (hi : i ∈ Finset.univ.filter (fun j => code s j = x)) :
      w s i * r (code s i) = w s i * r x := by rw [(Finset.mem_filter.mp hi).2]
  rw [Finset.sum_congr rfl hh, ← Finset.sum_mul]
  unfold p weightedCode
  rw [Finset.sum_filter]

private theorem revealRank_auxMass_eq_code {n : ℕ} (T : Pool n) :
    revealRank (auxMass T) (properRank T) =
      weightedCode (fun (s : Selector n) (d : Draw n) =>
        let a := auxCode (select T s) s d
        (a, properRank T s a)) (fun s d => drawWeight (select T s) d) := by
  classical
  funext s x
  rcases x with ⟨a,i⟩
  unfold revealRank weightedCode auxMass
  by_cases h : i = properRank T s a
  · rw [ite_eq_left h]
    apply Finset.sum_congr rfl
    intro d _
    by_cases hd : auxCode (select T s) s d = a
    · simp [hd, h]
    · simp [hd]
  · rw [ite_eq_right h]
    symm
    apply Finset.sum_eq_zero
    intro d _
    by_cases hd : auxCode (select T s) s d = a <;> simp [hd, Ne.symm h]

/-- The proper learner's information is bounded by that of the augmented
tree draw and the selector's first surviving queried rank. -/
theorem learner_poolInformation_le_aux {n : ℕ} (hn : 0 < n) (T : Pool n) :
    (shiftedTreeLearner hn).poolInformation T ≤
      2 * channelInfo (auxMass T) + Real.log 4 + Real.log 3 := by
  classical
  let A := AuxCode n × Fin (2*n+1)
  let g := fun x : A => decodeThreshold T x.1 x.2
  let V := Finset.univ.image g
  let enc := fun x : A => (⟨g x, Finset.mem_image_of_mem g (Finset.mem_univ x)⟩ : V)
  let e := (Fintype.equivFin (Draw n)).symm
  let f := fun (s : Selector n) (d : Draw n) =>
    let a := auxCode (select T s) s d
    (a, properRank T s a)
  let w := fun (s : Selector n) (d : Draw n) => drawWeight (select T s) d
  let c := fun (s : Selector n) (j : Fin (shiftedTreeLearner hn).outcomes) => enc (f s (e j))
  have hc (s : Selector n) (j : Fin (shiftedTreeLearner hn).outcomes) :
      (shiftedTreeLearner hn).threshold (select T s) j = (c s j).val := by
    exact (decodeThreshold_draw hn T s (e j)).symm
  rw [learner_poolInformation_eq_code (shiftedTreeLearner hn) T (α := V) Subtype.val
    Subtype.val_injective c hc]
  have he : weightedCode c (fun s j => (shiftedTreeLearner hn).weight (select T s) j) =
      pushChannel enc (revealRank (auxMass T) (properRank T)) := by
    rw [revealRank_auxMass_eq_code, push_weightedCode]
    funext s v
    let h := fun d : Draw n => if enc (f s d) = v then w s d else 0
    change (∑ j, h (e j)) = ∑ d, h d
    exact e.sum_comp h
  rw [he]
  have hrn (s : Selector n) (x : A) : 0 ≤ revealRank (auxMass T) (properRank T) s x := by
    unfold revealRank
    split
    · exact auxMass_nonneg T s x.1
    · exact le_rfl
  exact (channelInfo_push_le enc _ hrn).trans
    (channelInfo_revealRank_le (auxMass T) (auxMass_nonneg T) (sum_auxMass T) (properRank T)
      (properRank_moment T))

end SteinkeZakynthinou
