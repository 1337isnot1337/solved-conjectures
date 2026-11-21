module

public import Conjectures.KVZGammaWronskianDeterminants
public import Conjectures.KVZGammaWronskianJets
public import Mathlib.Analysis.Convex.Topology
public import Mathlib.Topology.Order.IntermediateValue
public import Mathlib.Basic.Sign.Basic
public import Mathlib.Tactic.Linarith

/-!
# The all-order Wronskian criterion

For smooth real functions on an open convex interval, nonvanishing of every
initial Wronskian implies that every ordered-node evaluation determinant has
the sign of the final Wronskian. The proof uses the exact determinant mean
value theorem and the proved Leibniz jet identity, not an assumed
Chebyshev-system theorem or a coalescing-node limit.

This is the criterion used in §2 of the repository's proof of the
Karp–Vishnyakova–Zhang gamma-quotient result, whose source is arXiv:2408.01755v2,
Section 3, item 11.
-/

@[expose] public section

namespace KVZGamma

open Matrix Set
open scoped BigOperators ContDiff Topology

theorem continuous_nonzero_mul_pos {I : Set ℝ} (hI : IsPreconnected I)
    (f : ℝ → ℝ) (hf : ContinuousOn f I) (hn : ∀ x ∈ I, f x ≠ 0)
    {x y : ℝ} (hx : x ∈ I) (hy : y ∈ I) : 0 < f x * f y := by
  rcases lt_or_gt_of_ne (hn x hx) with hxneg | hxpos <;>
    rcases lt_or_gt_of_ne (hn y hy) with hyneg | hypos
  · exact mul_pos_of_neg_of_neg hxneg hyneg
  · obtain ⟨z, hz, hzero⟩ := hI.intermediate_value hx hy hf ⟨hxneg.le, hypos.le⟩
    exact False.elim (hn z hz hzero)
  · obtain ⟨z, hz, hzero⟩ := hI.intermediate_value hy hx hf ⟨hyneg.le, hxpos.le⟩
    exact False.elim (hn z hz hzero)
  · exact mul_pos hxpos hypos

theorem initialWronskiansNonzero_first {n : ℕ} {I : Set ℝ}
    (f : Fin (n + 1) → ℝ → ℝ) (hW : initialWronskiansNonzero f I)
    {t : ℝ} (ht : t ∈ I) : f 0 t ≠ 0 := by
  have hn := hW 1 (by omega) t ht
  rw [wronskian_one] at hn
  exact hn

theorem initialWronskiansNonzero_normalizedDerivatives {n : ℕ} {I : Set ℝ}
    (hI : IsOpen I) (f : Fin (n + 1) → ℝ → ℝ)
    (hf : ∀ j, ContDiffOn ℝ ∞ (f j) I) (hW : initialWronskiansNonzero f I) :
    initialWronskiansNonzero (normalizedDerivatives f) I := by
  intro k hk t ht
  let p : Fin (k + 1) → ℝ → ℝ := fun j => f (j.castLE (Nat.succ_le_succ hk))
  have hp : ∀ j, ContDiffOn ℝ ∞ (p j) I := fun j => hf _
  have hfirst : ∀ x ∈ I, p 0 x ≠ 0 := fun x hx =>
    initialWronskiansNonzero_first f hW hx
  have hn := hW (k + 1) (Nat.succ_le_succ hk) t ht
  change wronskian p t ≠ 0 at hn
  rw [wronskian_normalizedDerivatives hI p hp hfirst ht] at hn
  have hng : wronskian (normalizedDerivatives p) t ≠ 0 := by
    intro hz
    exact hn (by rw [hz, mul_zero])
  exact hng

/-- The evaluation determinant and the final Wronskian have the same strict
sign, at every reference point in the interval. Order zero is included. -/
theorem evaluationDet_mul_wronskian_pos {n : ℕ} {I : Set ℝ}
    (hI : IsOpen I) (hconv : Convex ℝ I) (f : Fin n → ℝ → ℝ)
    (hf : ∀ j, ContDiffOn ℝ ∞ (f j) I) (hW : initialWronskiansNonzero f I)
    (x : Fin n → ℝ) (hx : StrictMono x) (hxI : ∀ i, x i ∈ I)
    {t : ℝ} (ht : t ∈ I) : 0 < evaluationDet f x * wronskian f t := by
  induction n with
  | zero =>
    have heval : evaluationDet f x = 1 := Matrix.det_isEmpty
    rw [heval, wronskian_zero, mul_one]
    exact zero_lt_one
  | succ n ih =>
    have hfirst : ∀ y ∈ I, f 0 y ≠ 0 := fun y hy =>
      initialWronskiansNonzero_first f hW hy
    let q : Fin n → ℝ → ℝ := fun j y => f j.succ y / f 0 y
    let g : Fin n → ℝ → ℝ := normalizedDerivatives f
    have hq : ∀ j, ContDiffOn ℝ ∞ (q j) I := fun j =>
      (hf j.succ).div (hf 0) hfirst
    have hg : ∀ j, ContDiffOn ℝ ∞ (g j) I :=
      normalizedDerivatives_contDiffOn hI f hf hfirst
    have hWg : initialWronskiansNonzero g I :=
      initialWronskiansNonzero_normalizedDerivatives hI f hf hW
    have hinterval (i : Fin n) : Icc (x i.castSucc) (x i.succ) ⊆ I :=
      hconv.ordConnected.out (hxI i.castSucc) (hxI i.succ)
    have hgap (i : Fin n) : x i.castSucc < x i.succ := hx i.castSucc_lt_succ
    obtain ⟨c, hc, hdet⟩ := det_interval_differences_mvt
      (fun _ j y => q j y) (fun _ j y => g j y)
      (fun i : Fin n => x i.castSucc) (fun i : Fin n => x i.succ) hgap
      (fun i j => (hq j).continuousOn.mono (hinterval i)) (by
        intro i y hy j
        exact ((hq j).contDiffAt (hI.mem_nhds
          (hinterval i ⟨hy.1.le, hy.2.le⟩))).differentiableAt (by simp) |>.hasDerivAt)
    have hcI : ∀ i, c i ∈ I := fun i => hinterval i ⟨(hc i).1.le, (hc i).2.le⟩
    have hcmono : StrictMono c := by
      intro i j hij
      have hij' : i.succ ≤ j.castSucc := by change i.val + 1 ≤ j.val; exact hij
      exact ((hc i).2.trans_le (hx.monotone hij')).trans (hc j).1
    have hsign : 0 < evaluationDet g c * wronskian g t :=
      ih g hg hWg c hcmono hcI
    have hprodgap : 0 < ∏ i : Fin n, (x i.succ - x i.castSucc) :=
      Finset.prod_pos fun i _ => sub_pos.mpr (hgap i)
    have hscale : 0 < (∏ i, f 0 (x i)) * f 0 t ^ (n + 1) := by
      have hp : 0 < ∏ i : Fin (n + 1), (f 0 (x i) * f 0 t) :=
        Finset.prod_pos fun i _ => continuous_nonzero_mul_pos hconv.isPreconnected
          (f 0) (hf 0).continuousOn hfirst (hxI i) ht
      simpa only [Finset.prod_mul_distrib, Finset.prod_const, Finset.card_univ,
        Fintype.card_fin] using hp
    have heval : evaluationDet f x = (∏ i, f 0 (x i)) *
        ((∏ i : Fin n, (x i.succ - x i.castSucc)) * evaluationDet g c) := by
      rw [evaluationDet_normalize f x (fun i => hfirst (x i) (hxI i))]
      exact congrArg ((∏ i, f 0 (x i)) * ·) hdet
    have hwr : wronskian f t = f 0 t ^ (n + 1) * wronskian g t :=
      wronskian_normalizedDerivatives hI f hf hfirst ht
    rw [heval, hwr]
    have hpos := mul_pos hprodgap (mul_pos hscale hsign)
    convert hpos using 1; ring

theorem evaluationDet_ne_zero {n : ℕ} {I : Set ℝ}
    (hI : IsOpen I) (hconv : Convex ℝ I) (f : Fin n → ℝ → ℝ)
    (hf : ∀ j, ContDiffOn ℝ ∞ (f j) I) (hW : initialWronskiansNonzero f I)
    (x : Fin n → ℝ) (hx : StrictMono x) (hxI : ∀ i, x i ∈ I)
    {t : ℝ} (ht : t ∈ I) : evaluationDet f x ≠ 0 := by
  have hp := evaluationDet_mul_wronskian_pos hI hconv f hf hW x hx hxI ht
  intro hz
  rw [hz, zero_mul] at hp
  exact (lt_irrefl 0) hp

/-- Explicit equality of signs, in the source's row/column convention. -/
theorem evaluationDet_sign_eq {n : ℕ} {I : Set ℝ}
    (hI : IsOpen I) (hconv : Convex ℝ I) (f : Fin n → ℝ → ℝ)
    (hf : ∀ j, ContDiffOn ℝ ∞ (f j) I) (hW : initialWronskiansNonzero f I)
    (x : Fin n → ℝ) (hx : StrictMono x) (hxI : ∀ i, x i ∈ I)
    {t : ℝ} (ht : t ∈ I) :
    SignType.sign (evaluationDet f x) = SignType.sign (wronskian f t) := by
  have hp := evaluationDet_mul_wronskian_pos hI hconv f hf hW x hx hxI ht
  rcases mul_pos_iff.mp hp with hpos | hneg
  · rw [sign_pos hpos.1, sign_pos hpos.2]
  · rw [sign_neg hneg.1, sign_neg hneg.2]

end KVZGamma
