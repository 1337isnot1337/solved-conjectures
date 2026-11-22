module

public import Conjectures.AgnosticVC.VC
public import Mathlib.Analysis.SpecialFunctions.Log.Basic
public import Mathlib.Data.Nat.Choose.Sum
public import Mathlib.Algebra.Order.Floor.Semiring
public import Mathlib.Tactic.FieldSimp

@[expose] public section

namespace AgnosticVC

open Finset
open scoped BigOperators

variable {α : Type*} [DecidableEq α]

/-- Sauer–Shelah with the cardinality of the chosen coordinates. -/
theorem card_traceRestriction_le_sum_choose (F : Finset (Finset α)) (coords : Finset α)
    (n d : ℕ) (hn : coords.card ≤ n) (hd : F.vcDim ≤ d) :
    (traceRestriction F coords).card ≤ ∑ k ∈ Finset.range (d + 1), n.choose k := by
  let G := traceRestriction F coords
  have hsub : G.shatterer ⊆ (Finset.range (d + 1)).biUnion coords.powersetCard := by
    intro s hs
    have hsh := Finset.mem_shatterer.mp hs
    obtain ⟨v, hv, hsv⟩ := hsh.exists_superset
    obtain ⟨u, hu, rfl⟩ := Finset.mem_image.mp hv
    have hsize := hsh.card_le_vcDim.trans ((traceRestriction_vcDim_le F coords).trans hd)
    exact Finset.mem_biUnion.mpr ⟨s.card, Finset.mem_range.mpr (Nat.lt_succ_of_le hsize),
      Finset.mem_powersetCard.mpr ⟨hsv.trans Finset.inter_subset_left, rfl⟩⟩
  calc
    G.card ≤ G.shatterer.card := Finset.card_le_card_shatterer G
    _ ≤ ((Finset.range (d + 1)).biUnion coords.powersetCard).card := Finset.card_le_card hsub
    _ ≤ ∑ k ∈ Finset.range (d + 1), (coords.powersetCard k).card := Finset.card_biUnion_le
    _ ≤ _ := Finset.sum_le_sum fun k _ => by
      rw [Finset.card_powersetCard]
      exact Nat.choose_mono k hn

private lemma log_le_of_le_sum_choose (p n d : ℕ) (hp : 0 < p) (hd : 0 < d) (hn : d ≤ n)
    (hcount : p ≤ ∑ k ∈ Finset.range (d + 1), n.choose k) :
    Real.log p ≤ (d : ℝ) * (1 + Real.log ((n : ℝ) / d)) := by
  have hpr : 0 < (p : ℝ) := by exact_mod_cast hp
  have hdr : 0 < (d : ℝ) := by exact_mod_cast hd
  have hnr : 0 < (n : ℝ) := by exact_mod_cast hd.trans_le hn
  let x : ℝ := (d : ℝ) / n
  have hx : 0 < x := div_pos hdr hnr
  have hx1 : x ≤ 1 := (div_le_one hnr).mpr (Nat.cast_le.mpr hn)
  have hpow : (p : ℝ) * x ^ d ≤ Real.exp d := by
    calc
      (p : ℝ) * x ^ d ≤ (∑ k ∈ Finset.range (d + 1), (n.choose k : ℝ)) * x ^ d :=
        mul_le_mul_of_nonneg_right (by exact_mod_cast hcount) (pow_nonneg hx.le _)
      _ ≤ ∑ k ∈ Finset.range (d + 1), (n.choose k : ℝ) * x ^ k := by
        rw [Finset.sum_mul]
        exact Finset.sum_le_sum fun k hk => mul_le_mul_of_nonneg_left
          (pow_le_pow_of_le_one hx.le hx1 (Nat.le_of_lt_succ (Finset.mem_range.mp hk)))
          (Nat.cast_nonneg _)
      _ ≤ ∑ k ∈ Finset.range (n + 1), (n.choose k : ℝ) * x ^ k :=
        Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono (Nat.succ_le_succ hn))
          (fun k _ _ => mul_nonneg (Nat.cast_nonneg _) (pow_nonneg hx.le _))
      _ = (1 + x) ^ n := by rw [add_comm 1 x, add_pow]; simp [mul_comm]
      _ ≤ Real.exp d := by
        have h := pow_le_pow_left₀ (by linarith : 0 ≤ 1 + x)
          (show 1 + x ≤ Real.exp x from by simpa [add_comm] using Real.add_one_le_exp x) n
        rw [← Real.exp_nat_mul] at h
        have hnx : (n : ℝ) * x = d := by dsimp [x]; field_simp
        exact hnx ▸ h
  have hl := Real.log_le_log (mul_pos hpr (pow_pos hx _)) hpow
  rw [Real.log_mul hpr.ne' (pow_pos hx _).ne', Real.log_pow, Real.log_exp] at hl
  dsimp [x] at hl
  rw [Real.log_div hdr.ne' hnr.ne'] at hl
  rw [Real.log_div hnr.ne' hdr.ne']
  linarith only [hl]

/-- The logarithmic form of Sauer–Shelah on a positive, finite trace family. -/
theorem log_card_traceRestriction_le (F : Finset (Finset α)) (coords : Finset α)
    (n d : ℕ) (hF : F.Nonempty) (hn : coords.card ≤ n) (hd : F.vcDim ≤ d)
    (hdpos : 0 < d) (hdn : d ≤ n) :
    Real.log (traceRestriction F coords).card ≤ (d : ℝ) * (1 + Real.log ((n : ℝ) / d)) := by
  apply log_le_of_le_sum_choose _ n d ((hF.image _).card_pos) hdpos hdn
  exact card_traceRestriction_le_sum_choose F coords n d hn hd

variable [Fintype α]

/-- Coordinates where two traces agree. -/
def agreement (u v : Finset α) : Finset α :=
  Finset.univ.filter (fun a => a ∈ u ↔ a ∈ v)

/-- Normalized Hamming distance. Its square root is the empirical Euclidean distance for
binary predictions. -/
noncomputable def hammingDistance (u v : Finset α) : ℝ :=
  1 - (agreement u v).card / (Fintype.card α : ℝ)

private lemma exists_separating_positions [Nonempty α] (F : Finset (Finset α)) (k : ℕ)
    (δ : ℝ)
    (hsep : ∀ u ∈ F, ∀ v ∈ F, u ≠ v → δ ≤ hammingDistance u v)
    (hk : 2 * Real.log F.card < δ * k) :
    ∃ coords : Finset α, coords.card ≤ k ∧ (traceRestriction F coords).card = F.card := by
  classical
  let B : Finset (Finset α × Finset α) := (F ×ˢ F).filter (fun uv => uv.1 ≠ uv.2)
  let bad (uv : Finset α × Finset α) : Finset (Fin k → α) :=
    Fintype.piFinset (fun _ : Fin k => agreement uv.1 uv.2)
  let W := B.biUnion bad
  let N : ℝ := Fintype.card α
  let p : ℝ := F.card
  have hN : 0 < N := Nat.cast_pos.mpr Fintype.card_pos
  have hbad (uv : Finset α × Finset α) (huv : uv ∈ B) :
      ((bad uv).card : ℝ) ≤ N ^ k * Real.exp (-(δ * k)) := by
    obtain ⟨huv, hne⟩ := Finset.mem_filter.mp huv
    obtain ⟨hu, hv⟩ := Finset.mem_product.mp huv
    have hs : δ ≤ 1 - (agreement uv.1 uv.2).card / N := hsep uv.1 hu uv.2 hv hne
    have hagree : ((agreement uv.1 uv.2).card : ℝ) ≤ N * Real.exp (-δ) := by
      calc
        _ ≤ (1 - δ) * N := (div_le_iff₀ hN).mp (by linarith)
        _ ≤ Real.exp (-δ) * N := mul_le_mul_of_nonneg_right
          (by simpa [sub_eq_add_neg, add_comm] using Real.add_one_le_exp (-δ)) hN.le
        _ = _ := mul_comm _ _
    calc
      ((bad uv).card : ℝ) = ((agreement uv.1 uv.2).card : ℝ) ^ k := by
        simp [bad]
      _ ≤ (N * Real.exp (-δ)) ^ k := pow_le_pow_left₀ (Nat.cast_nonneg _) hagree _
      _ = _ := by rw [mul_pow, ← Real.exp_nat_mul]; congr 2; ring
  have hcardB : (B.card : ℝ) ≤ p ^ 2 := by
    have hb := Finset.card_filter_le (s := F ×ˢ F) (fun uv => uv.1 ≠ uv.2)
    rw [Finset.card_product, ← pow_two] at hb
    dsimp [B, p]
    exact_mod_cast hb
  have hW : (W.card : ℝ) < N ^ k := by
    have hUnion : (W.card : ℝ) ≤ ∑ uv ∈ B, ((bad uv).card : ℝ) := by
      exact_mod_cast (Finset.card_biUnion_le (s := B) (t := bad))
    have hbound := hUnion.trans (Finset.sum_le_sum hbad)
    rw [Finset.sum_const, nsmul_eq_mul] at hbound
    by_cases hp : p = 0
    · have h0 : (W.card : ℝ) ≤ 0 := by
        exact (hbound.trans (mul_le_mul_of_nonneg_right hcardB
          (mul_nonneg (pow_nonneg hN.le _) (Real.exp_nonneg _)))).trans_eq (by simp [hp])
      exact h0.trans_lt (pow_pos hN _)
    · have hp' : 0 < p := lt_of_le_of_ne (Nat.cast_nonneg _) (Ne.symm hp)
      have hLt : p ^ 2 * Real.exp (-(δ * k)) < 1 := by
        rw [← Real.exp_log hp', ← Real.exp_nat_mul, ← Real.exp_add, ← Real.exp_zero]
        apply Real.exp_lt_exp.mpr
        push_cast
        dsimp [p]
        linarith only [hk]
      calc
        _ ≤ (B.card : ℝ) * (N ^ k * Real.exp (-(δ * k))) := hbound
        _ ≤ p ^ 2 * (N ^ k * Real.exp (-(δ * k))) :=
          mul_le_mul_of_nonneg_right hcardB (mul_nonneg (pow_nonneg hN.le _) (Real.exp_nonneg _))
        _ = N ^ k * (p ^ 2 * Real.exp (-(δ * k))) := by ring
        _ < N ^ k * 1 := mul_lt_mul_of_pos_left hLt (pow_pos hN _)
        _ = _ := mul_one _
  have hW' : W.card < (Finset.univ : Finset (Fin k → α)).card := by
    rw [Finset.card_univ, Fintype.card_fun, Fintype.card_fin]
    dsimp [N] at hW
    exact_mod_cast hW
  obtain ⟨w, hw⟩ := Finset.exists_mem_notMem_of_card_lt_card hW'
  let coords := Finset.univ.image w
  have hc : coords.card ≤ k := by simpa [coords] using Finset.card_image_le (s := Finset.univ) (f := w)
  refine ⟨coords, hc, Finset.card_image_of_injOn ?_⟩
  intro u hu v hv huv
  by_contra hne
  have hwnot : w ∉ W := hw.2
  apply hwnot
  refine Finset.mem_biUnion.mpr ⟨(u, v), ?_, ?_⟩
  · exact Finset.mem_filter.mpr ⟨Finset.mem_product.mpr ⟨hu, hv⟩, hne⟩
  · refine Fintype.mem_piFinset.mpr fun j => Finset.mem_filter.mpr ⟨Finset.mem_univ _, ?_⟩
    have hj : w j ∈ coords := Finset.mem_image_of_mem _ (Finset.mem_univ j)
    simpa only [Finset.mem_inter, hj, true_and] using
      (congrArg (fun s : Finset α => w j ∈ s) huv).to_iff

/-- A finite VC family separated in normalized Hamming distance has polynomial packing size
with exponent proportional to its VC dimension. -/
theorem log_card_le_of_hamming_separated [Nonempty α] (F : Finset (Finset α)) (d : ℕ)
    (hF : F.Nonempty) (hd : F.vcDim ≤ d) (hdpos : 0 < d) (δ : ℝ) (hδ : 0 < δ)
    (hδ1 : δ ≤ 1) (hsep : ∀ u ∈ F, ∀ v ∈ F, u ≠ v → δ ≤ hammingDistance u v) :
    Real.log F.card ≤ (d : ℝ) * (1 + 2 * Real.log (6 / δ)) := by
  let L := Real.log F.card
  let u := L / d
  let x := 2 * L / δ
  let k := d + ⌈x⌉₊ + 1
  have hd1 : 1 ≤ (d : ℝ) := by exact_mod_cast hdpos
  have hdr : 0 < (d : ℝ) := Nat.cast_pos.mpr hdpos
  have hL : 0 ≤ L := Real.log_nonneg (by exact_mod_cast hF.card_pos)
  have hu : 0 ≤ u := div_nonneg hL hdr.le
  have hx : 0 ≤ x := div_nonneg (mul_nonneg (by norm_num) hL) hδ.le
  have hdk : d ≤ k := by dsimp [k]; omega
  have hk : 2 * L < δ * k := by
    have hlt : x < (k : ℝ) := by
      dsimp [k]
      push_cast
      linarith only [Nat.le_ceil x, hdr]
    calc
      2 * L = x * δ := (div_mul_cancel₀ (2 * L) hδ.ne').symm
      _ < (k : ℝ) * δ := mul_lt_mul_of_pos_right hlt hδ
      _ = _ := mul_comm _ _
  obtain ⟨coords, hc, hcard⟩ := exists_separating_positions F k δ hsep hk
  have hlog := log_card_traceRestriction_le F coords k d hF hc hd hdpos hdk
  rw [hcard] at hlog
  have hkl : (k : ℝ) ≤ (d : ℝ) + x + 2 := by
    dsimp [k]
    push_cast
    linarith only [Nat.ceil_lt_add_one hx]
  have hratio : (k : ℝ) / d ≤ 3 * (1 + u) / δ := by
    calc
      _ ≤ ((d : ℝ) + x + 2) / d := div_le_div_of_nonneg_right hkl hdr.le
      _ = 1 + 2 * u / δ + 2 / d := by dsimp [x, u]; field_simp
      _ ≤ 1 + 2 * u / δ + 2 := by gcongr; exact (div_le_iff₀ hdr).mpr (by linarith)
      _ ≤ _ := by
        apply (le_div_iff₀ hδ).mpr
        have hz : (2 * u / δ) * δ = 2 * u := div_mul_cancel₀ _ hδ.ne'
        nlinarith only [hz, hδ1, hu]
  have hlogk := Real.log_le_log (div_pos (Nat.cast_pos.mpr (hdpos.trans_le hdk)) hdr) hratio
  have hpos : 0 < 1 + u := by linarith
  have hlog1 := Real.log_le_sub_one_of_pos (div_pos hpos (by norm_num : 0 < (2 : ℝ)))
  rw [Real.log_div hpos.ne' (by norm_num : (2 : ℝ) ≠ 0)] at hlog1
  have hrw : 3 * (1 + u) / δ = (3 / δ) * (1 + u) := by ring
  rw [hrw, Real.log_mul (div_pos (by norm_num) hδ).ne' hpos.ne'] at hlogk
  have hfinal : Real.log (6 / δ) = Real.log (3 / δ) + Real.log 2 := by
    rw [show (6 : ℝ) / δ = (3 / δ) * 2 by ring,
      Real.log_mul (div_pos (by norm_num) hδ).ne' (by norm_num : (2 : ℝ) ≠ 0)]
  have hu' : u ≤ 1 + Real.log ((k : ℝ) / d) := by
    apply (div_le_iff₀ hdr).mpr
    simpa [L, mul_comm] using hlog
  have huBound : u ≤ 1 + 2 * Real.log (6 / δ) := by linarith only [hu', hlogk, hlog1, hfinal]
  simpa [L, mul_comm] using (div_le_iff₀ hdr).mp huBound

end AgnosticVC
