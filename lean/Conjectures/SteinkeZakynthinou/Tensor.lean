module

public import Conjectures.SteinkeZakynthinou.Statement
public import Conjectures.SteinkeZakynthinou.Information
public import Mathlib.Logic.Equiv.Fin.Basic
public import Mathlib.Data.Fin.Tuple.Basic

/-! Entropy tensorization for the independent fair selector bits. -/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

open Learner (selectorMean)

def prepend {n : ℕ} (b : Bool) (s : Selector n) : Selector (n + 1) :=
  Fin.cons (α := fun _ => Bool) b s

theorem selectorMean_add {n : ℕ} (f g : Selector n → ℝ) :
    selectorMean (fun s => f s + g s) = selectorMean f + selectorMean g := by
  simp [selectorMean, Finset.sum_add_distrib, add_div]

theorem selectorMean_div {n : ℕ} (f : Selector n → ℝ) (a : ℝ) :
    selectorMean (fun s => f s / a) = selectorMean f / a := by
  unfold selectorMean
  calc
    _ = (∑ s, f s) / a / Fintype.card (Selector n) := by
      rw [← Finset.sum_div]
    _ = _ := by rw [div_div, div_div, mul_comm a]

theorem selectorMean_nonneg {n : ℕ} {f : Selector n → ℝ} (h : ∀ s, 0 ≤ f s) :
    0 ≤ selectorMean f :=
  div_nonneg (Finset.sum_nonneg (fun s _ => h s)) (by positivity)

theorem selectorMean_succ {n : ℕ} (f : Selector (n + 1) → ℝ) :
    selectorMean f =
      (selectorMean (fun s => f (prepend false s)) +
        selectorMean (fun s => f (prepend true s))) / 2 := by
  let e : Selector (n + 1) ≃ Bool × Selector n := (Fin.consEquiv _).symm
  have h := Fintype.sum_equiv e f (fun b => f (prepend b.1 b.2)) (fun x => congrArg f (e.symm_apply_apply x).symm)
  unfold selectorMean
  rw [h, Fintype.sum_prod_type, Fintype.sum_bool, Fintype.card_congr e, Fintype.card_prod]
  simp only [Fintype.card_bool, Nat.cast_mul, Nat.cast_ofNat, ← add_div]
  rw [div_div, mul_comm 2, add_comm]

theorem jsTerm_selectorMean_le {n : ℕ} (f g : Selector n → ℝ)
    (hf : ∀ s, 0 ≤ f s) (hg : ∀ s, 0 ≤ g s) :
    jsTerm (selectorMean f) (selectorMean g) ≤ selectorMean (fun s => jsTerm (f s) (g s)) := by
  unfold selectorMean
  simp only [div_eq_inv_mul]
  rw [jsTerm_scale]
  exact mul_le_mul_of_nonneg_left
    (jsTerm_sum_le Finset.univ f g (fun _ _ => hf _) (fun _ _ => hg _)) (by positivity)

noncomputable def entropyGap {n : ℕ} (f : Selector n → ℝ) : ℝ :=
  selectorMean (fun s => entropyTerm (f s)) - entropyTerm (selectorMean f)

noncomputable def coordinateCharge {n : ℕ} (f : Selector n → ℝ) (i : Fin n) : ℝ :=
  selectorMean fun s => jsTerm (f (Function.update s i false)) (f (Function.update s i true))

theorem average_coordinate_sum {n : ℕ} (f : Fin n → Selector n → ℝ) :
    selectorMean (fun s => ∑ i, f i s) = ∑ i, selectorMean (f i) := by
  simp only [selectorMean, ← Finset.sum_div]
  rw [Finset.sum_comm]

private theorem coordinateCharge_zero {n : ℕ} (f : Selector (n + 1) → ℝ)
    (h : ∀ s, 0 ≤ f s) :
    jsTerm (selectorMean (fun s => f (prepend false s)))
        (selectorMean (fun s => f (prepend true s))) ≤ coordinateCharge f 0 := by
  have h0 : ∀ (b c : Bool) (s : Selector n), Function.update (prepend b s) 0 c =
      prepend c s := by
    intro b c s
    funext i
    refine Fin.cases ?_ (fun i => ?_) i <;> simp [Function.update, prepend]
  rw [coordinateCharge, selectorMean_succ]
  simp only [h0, ← two_mul, mul_div_cancel_left₀ _ (by norm_num : (2 : ℝ) ≠ 0)]
  exact jsTerm_selectorMean_le _ _ (fun s => h _) (fun s => h _)

private theorem coordinateCharge_succ {n : ℕ} (f : Selector (n + 1) → ℝ) (i : Fin n) :
    coordinateCharge f i.succ =
      (coordinateCharge (fun s => f (prepend false s)) i +
        coordinateCharge (fun s => f (prepend true s)) i) / 2 := by
  have hs : ∀ (b c : Bool) (s : Selector n),
      Function.update (prepend b s) i.succ c = prepend b (Function.update s i c) := by
    intro b c s
    funext j
    refine Fin.cases ?_ (fun j => ?_) j
    · simp [Function.update, prepend, Ne.symm (Fin.succ_ne_zero i)]
    · by_cases he : j = i <;> simp [Function.update, prepend, he]
  unfold coordinateCharge
  rw [selectorMean_succ]
  simp only [hs]

theorem entropyGap_le_coordinateCharges {n : ℕ} (f : Selector n → ℝ)
    (h : ∀ s, 0 ≤ f s) : entropyGap f ≤ ∑ i, coordinateCharge f i := by
  induction n with
  | zero => simp [entropyGap, selectorMean]
  | succ n ih =>
    let f₀ := fun s : Selector n => f (prepend false s)
    let f₁ := fun s : Selector n => f (prepend true s)
    have he : entropyGap f = (entropyGap f₀ + entropyGap f₁) / 2 +
        jsTerm (selectorMean f₀) (selectorMean f₁) := by
      unfold entropyGap
      rw [selectorMean_succ, selectorMean_succ (f := f)]
      rw [jsTerm_entropy (selectorMean_nonneg fun s => h _) (selectorMean_nonneg fun s => h _)]
      dsimp [f₀, f₁]
      ring
    rw [he, Fin.sum_univ_succ]
    have h₀ := ih f₀ (fun s => h _)
    have h₁ := ih f₁ (fun s => h _)
    have hj := coordinateCharge_zero f h
    simp only [coordinateCharge_succ]
    rw [← Finset.sum_div, Finset.sum_add_distrib]
    change (entropyGap f₀ + entropyGap f₁) / 2 + jsTerm (selectorMean f₀) (selectorMean f₁) ≤
      coordinateCharge f 0 + ((∑ i, coordinateCharge f₀ i) + ∑ i, coordinateCharge f₁ i) / 2
    change jsTerm (selectorMean f₀) (selectorMean f₁) ≤ coordinateCharge f 0 at hj
    linarith

end SteinkeZakynthinou
