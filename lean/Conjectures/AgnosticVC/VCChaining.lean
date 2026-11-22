module

public import Conjectures.AgnosticVC.VCRademacher

@[expose] public section

namespace AgnosticVC

open Finset
open scoped BigOperators

variable {α : Type*} [DecidableEq α] [Fintype α] [Nonempty α]

/-- The classification loss on a coordinate, with the positives encoded as sets. -/
def binaryLoss (labels trace : Finset α) (i : α) : ℝ :=
  if i ∈ trace ↔ i ∈ labels then 0 else 1

omit [Nonempty α] in
private lemma hammingDistance_comm (u v : Finset α) :
    hammingDistance u v = hammingDistance v u := by
  have h : agreement u v = agreement v u := by
    ext i
    simp [agreement, iff_comm]
  simp [hammingDistance, h]

private lemma hammingDistance_self (u : Finset α) : hammingDistance u u = 0 := by
  have hN : (Fintype.card α : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr Fintype.card_ne_zero
  simp [hammingDistance, agreement, hN]

private lemma hammingDistance_separated {u v : Finset α} (hne : u ≠ v) :
    1 / (Fintype.card α : ℝ) ≤ hammingDistance u v := by
  have hne' : agreement u v ≠ Finset.univ := by
    intro heq
    apply hne
    ext i
    have hi : i ∈ agreement u v := heq ▸ Finset.mem_univ i
    simpa [agreement] using hi
  have hcard := Finset.card_lt_card (Finset.ssubset_iff_subset_ne.mpr
    ⟨Finset.subset_univ _, hne'⟩)
  have hcast : ((agreement u v).card : ℝ) + 1 ≤ Fintype.card α := by
    exact_mod_cast Nat.succ_le_of_lt (by simpa only [Finset.card_univ] using hcard)
  have hN : 0 < (Fintype.card α : ℝ) := Nat.cast_pos.mpr Fintype.card_pos
  rw [hammingDistance]
  apply (div_le_iff₀ hN).mpr
  rw [sub_mul, one_mul, div_mul_cancel₀ _ hN.ne']
  linarith only [hcast]

private lemma exists_hamming_net (F : Finset (Finset α)) (hF : F.Nonempty) (δ : ℝ)
    (hδ : 0 ≤ δ) : ∃ G ⊆ F, G.Nonempty ∧
      (∀ u ∈ G, ∀ v ∈ G, u ≠ v → δ ≤ hammingDistance u v) ∧
      (∀ u ∈ F, ∃ v ∈ G, hammingDistance u v ≤ δ) ∧
      (∀ H ⊆ F, (∀ u ∈ H, ∀ v ∈ H, u ≠ v → δ ≤ hammingDistance u v) → H.card ≤ G.card) := by
  classical
  let sep (H : Finset (Finset α)) := ∀ u ∈ H, ∀ v ∈ H, u ≠ v → δ ≤ hammingDistance u v
  let P := F.powerset.filter sep
  have hu : {hF.choose} ∈ P := by
    refine Finset.mem_filter.mpr ⟨Finset.mem_powerset.mpr ?_, ?_⟩
    · simpa using hF.choose_spec
    · simp [sep]
  obtain ⟨G, hG, hmax⟩ := Finset.exists_max_image P Finset.card ⟨_, hu⟩
  obtain ⟨hsub, hsep⟩ := Finset.mem_filter.mp hG |>.imp_left Finset.mem_powerset.mp
  have hGne : G.Nonempty := Finset.card_pos.mp (by simpa using hmax _ hu)
  refine ⟨G, hsub, hGne, hsep, ?_, ?_⟩
  · intro u huF
    by_contra! hn
    have hnu : u ∉ G := fun hum => (not_lt_of_ge hδ) (hammingDistance_self u ▸ hn u hum)
    have hinsert : insert u G ∈ P := by
      refine Finset.mem_filter.mpr ⟨Finset.mem_powerset.mpr (Finset.insert_subset huF hsub), ?_⟩
      intro v hv w hw hne
      rcases Finset.mem_insert.mp hv with hv | hv
      · subst v
        rcases Finset.mem_insert.mp hw with hw | hw
        · exact (hne hw.symm).elim
        · exact (hn w hw).le
      · rcases Finset.mem_insert.mp hw with hw | hw
        · subst w
          rw [hammingDistance_comm]
          exact (hn v hv).le
        · exact hsep _ hv _ hw hne
    have h := hmax _ hinsert
    rw [Finset.card_insert_of_notMem hnu] at h
    omega
  · intro H hH hHsep
    exact hmax H (Finset.mem_filter.mpr ⟨Finset.mem_powerset.mpr hH, hHsep⟩)

omit [Nonempty α] in
private lemma sum_sq_binaryLoss_le (a : α → ℝ) (ha : ∀ i, |a i| ≤ 1)
    (y u : Finset α) : ∑ i, (a i * binaryLoss y u i) ^ 2 ≤ Fintype.card α := by
  calc
    _ ≤ ∑ _i : α, (1 : ℝ) := by
      apply Finset.sum_le_sum
      intro i hi
      have hsq : (a i) ^ 2 ≤ 1 := by simpa using (sq_le_sq.mpr (show |a i| ≤ |(1 : ℝ)| by simpa using ha i))
      by_cases h : i ∈ u ↔ i ∈ y <;> simp [binaryLoss, h, hsq]
    _ = _ := by simp

private lemma sum_sq_binaryLoss_sub_le (a : α → ℝ) (ha : ∀ i, |a i| ≤ 1)
    (y u v : Finset α) :
    ∑ i, (a i * binaryLoss y u i - a i * binaryLoss y v i) ^ 2 ≤
      (Fintype.card α : ℝ) * hammingDistance u v := by
  have hcount : (∑ i : α, if ¬ (i ∈ u ↔ i ∈ v) then (1 : ℝ) else 0) =
      (Fintype.card α : ℝ) - (agreement u v).card := by
    have h := Finset.card_filter_add_card_filter_not (s := (Finset.univ : Finset α))
      (fun i => i ∈ u ↔ i ∈ v)
    have hc := congrArg (fun n : ℕ => (n : ℝ)) h
    simp only [Finset.card_univ, Nat.cast_add] at hc
    rw [Finset.sum_boole, ← hc]
    change _ = ((agreement u v).card : ℝ) + _ - (agreement u v).card
    ring
  have hN : (Fintype.card α : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr Fintype.card_ne_zero
  calc
    _ ≤ ∑ i : α, if ¬ (i ∈ u ↔ i ∈ v) then (1 : ℝ) else 0 := by
      apply Finset.sum_le_sum
      intro i hi
      have hsq : (a i) ^ 2 ≤ 1 := by simpa using (sq_le_sq.mpr (show |a i| ≤ |(1 : ℝ)| by simpa using ha i))
      by_cases hu : i ∈ u <;> by_cases hv : i ∈ v <;> by_cases hy : i ∈ y <;>
        simp [binaryLoss, hu, hv, hy, hsq]
    _ = _ := by rw [hcount, hammingDistance, mul_sub, mul_one, mul_div_cancel₀ _ hN]

omit [Nonempty α] in
private lemma signedSup_at_scale {β : Type*} (B : Finset β) (hB : B.Nonempty)
    (c : β → α → ℝ) (N d R r L : ℝ) (hd : 0 < d) (hR : 0 < R) (hr : 0 < r) (hRd : R ^ 2 = N * d)
    (hlog : Real.log (2 * B.card) ≤ d * L) (hv : ∀ b ∈ B, ∑ i, (c b i) ^ 2 ≤ N * r ^ 2) :
    signAverage (fun σ => B.sup' hB (fun b => |signedSum (c b) σ|)) ≤ (L + 1 / 2) * R * r := by
  let θ := d / (R * r)
  have hθ : 0 < θ := div_pos hd (mul_pos hR hr)
  apply (signAverage_sup_abs_signedSum_le B hB c _ θ hθ hv).trans
  apply (div_le_iff₀ hθ).mpr
  have hhalf : θ ^ 2 * (N * r ^ 2) / 2 = d / 2 := by
    calc
      _ = d * (N * d) / (2 * R ^ 2) := by dsimp [θ]; field_simp
      _ = _ := by rw [← hRd]; field_simp
  rw [hhalf]
  calc
    _ ≤ d * L + d / 2 := add_le_add hlog le_rfl
    _ = _ := by dsimp [θ]; field_simp

private lemma sum_chaining_scales (k : ℕ) :
    ∑ s ∈ Finset.range k, ((s : ℝ) + 2) * (1 / 2 : ℝ) ^ s ≤ 6 := by
  have heq : ∀ n : ℕ, (∑ s ∈ Finset.range n, ((s : ℝ) + 2) * (1 / 2 : ℝ) ^ s) +
      (2 * (n : ℝ) + 6) * (1 / 2 : ℝ) ^ n = 6 := by
    intro n
    induction n with
    | zero => norm_num
    | succ n ih =>
      rw [Finset.sum_range_succ, pow_succ]
      push_cast
      linarith only [ih]
  have ht : 0 ≤ (2 * (k : ℝ) + 6) * (1 / 2 : ℝ) ^ k := by positivity
  linarith only [heq k, ht]

set_option maxHeartbeats 800000 in
/-- Finite empirical-process bound for VC losses with arbitrary fixed amplitudes in `[−1, 1]`
and independent uniform signs. -/
theorem signAverage_max_binaryLoss_le (F : Finset (Finset α)) (hF : F.Nonempty) (d : ℕ)
    (hdpos : 0 < d) (hd : F.vcDim ≤ d) (y : Finset α) (a : α → ℝ) (ha : ∀ i, |a i| ≤ 1) :
    signAverage (fun σ => F.sup' hF (fun u => |signedSum (fun i => a i * binaryLoss y u i) σ|)) ≤
      91 * Real.sqrt ((Fintype.card α : ℝ) * d) := by
  classical
  let K := Fintype.card α
  let N : ℝ := K
  let D : ℝ := d
  let R := Real.sqrt (N * D)
  let r (s : ℕ) : ℝ := (1 / 2 : ℝ) ^ s
  let δ (s : ℕ) : ℝ := (r s) ^ 2
  have hN : 0 < N := Nat.cast_pos.mpr Fintype.card_pos
  have hD : 0 < D := Nat.cast_pos.mpr hdpos
  have hD1 : 1 ≤ D := by
    change 1 ≤ (d : ℝ)
    exact_mod_cast Nat.succ_le_of_lt hdpos
  have hR : 0 < R := Real.sqrt_pos.mpr (mul_pos hN hD)
  have hR2 : R ^ 2 = N * D := Real.sq_sqrt (mul_nonneg hN.le hD.le)
  have hr (s : ℕ) : 0 < r s := pow_pos (by norm_num) _
  have hδpos (s : ℕ) : 0 < δ s := pow_pos (hr s) _
  have hδle (s : ℕ) : δ s ≤ 1 := by
    apply pow_le_one₀ (hr s).le
    exact pow_le_one₀ (by norm_num) (by norm_num)
  choose G hsub hne hsep hcover hmax using fun s : ℕ => exists_hamming_net F hF (δ s) (hδpos s).le
  let c (u : Finset α) (i : α) : ℝ := a i * binaryLoss y u i
  have hentropy (s : ℕ) : Real.log (2 * (G s).card) ≤ D * (12 * ((s : ℝ) + 1)) := by
    have hpacking := log_card_le_of_hamming_separated (G s) d (hne s)
      ((Finset.vcDim_mono (hsub s)).trans hd) hdpos (δ s) (hδpos s) (hδle s) (hsep s)
    have h6 := Real.log_le_sub_one_of_pos (by norm_num : 0 < (6 : ℝ))
    have h2 : Real.log 2 ≤ 1 := by
      simpa only [show (2 : ℝ) - 1 = 1 by norm_num] using
        Real.log_le_sub_one_of_pos (by norm_num : 0 < (2 : ℝ))
    have hh : Real.log (δ s) = -(2 * (s : ℝ) * Real.log 2) := by
      dsimp [δ, r]
      rw [Real.log_pow, Real.log_pow, Real.log_div (by norm_num) (by norm_num), Real.log_one]
      ring
    have hlog : 1 + 2 * Real.log (6 / δ s) ≤ 11 + 4 * (s : ℝ) := by
      rw [Real.log_div (by norm_num) (hδpos s).ne', hh]
      nlinarith only [h6, mul_nonneg (Nat.cast_nonneg (α := ℝ) s) (sub_nonneg.mpr h2)]
    rw [Real.log_mul (by norm_num) (Nat.cast_ne_zero.mpr (hne s).card_ne_zero)]
    have hp : Real.log (G s).card ≤ D * (11 + 4 * (s : ℝ)) :=
      hpacking.trans (mul_le_mul_of_nonneg_left hlog hD.le)
    nlinarith only [h2, hp, hD1, mul_nonneg hD.le (Nat.cast_nonneg (α := ℝ) s)]
  let E (s : ℕ) (σ : α → Bool) := (G s).sup' (hne s) (fun u => |signedSum (c u) σ|)
  have hE0 : signAverage (E 0) ≤ 13 * R := by
    have h := signedSup_at_scale (G 0) (hne 0) c N D R 1 12 hD hR (by norm_num) hR2
      (by simpa using hentropy 0) (by simpa [c, N, K] using
        fun u (_ : u ∈ G 0) => sum_sq_binaryLoss_le a ha y u)
    change signAverage (E 0) ≤ _ at h
    linarith only [h, hR]
  have hstep (s : ℕ) : signAverage (E (s + 1)) ≤
      signAverage (E s) + (13 * R) * ((s : ℝ) + 2) * r s := by
    have hparents : ∀ u ∈ G (s + 1), ∃ v ∈ G s, hammingDistance u v ≤ δ s :=
      fun u hu => hcover s u (hsub _ hu)
    let parent (u : Finset α) := if hu : u ∈ G (s + 1) then (hparents u hu).choose else hF.choose
    have hp (u : Finset α) (hu : u ∈ G (s + 1)) :
        parent u ∈ G s ∧ hammingDistance u (parent u) ≤ δ s := by
      simpa [parent, hu] using (hparents u hu).choose_spec
    let Δ (u : Finset α) (i : α) := c u i - c (parent u) i
    let X (σ : α → Bool) := (G (s + 1)).sup' (hne (s + 1)) (fun u => |signedSum (Δ u) σ|)
    have hpoint (σ : α → Bool) : E (s + 1) σ ≤ E s σ + X σ := by
      apply Finset.sup'_le
      intro u hu
      have hpar : |signedSum (c (parent u)) σ| ≤ E s σ :=
        Finset.le_sup' (fun w : Finset α => |signedSum (c w) σ|) (hp u hu).1
      have hinc : |signedSum (Δ u) σ| ≤ X σ :=
        Finset.le_sup' (fun w : Finset α => |signedSum (Δ w) σ|) hu
      have heq : signedSum (c u) σ = signedSum (c (parent u)) σ + signedSum (Δ u) σ := by
        rw [show signedSum (Δ u) σ = _ from signedSum_sub _ _ _, add_sub_cancel]
      exact (heq ▸ abs_add_le (signedSum (c (parent u)) σ) (signedSum (Δ u) σ)).trans
        (add_le_add hpar hinc)
    have hcoef (u : Finset α) (hu : u ∈ G (s + 1)) : ∑ i, (Δ u i) ^ 2 ≤ N * (r s) ^ 2 :=
      (sum_sq_binaryLoss_sub_le a ha y u (parent u)).trans
        (mul_le_mul_of_nonneg_left (hp u hu).2 hN.le)
    have hL : Real.log (2 * (G (s + 1)).card) ≤ D * (12 * ((s : ℝ) + 2)) := by
      convert hentropy (s + 1) using 1
      push_cast
      ring
    have hmgf := signedSup_at_scale (G (s + 1)) (hne _) Δ N D R (r s) _ hD hR (hr s) hR2 hL hcoef
    have hX : signAverage X ≤ (13 * R) * ((s : ℝ) + 2) * r s := by
      change signAverage X ≤ _ at hmgf
      apply hmgf.trans
      have hscalar : 12 * ((s : ℝ) + 2) + 1 / 2 ≤ 13 * ((s : ℝ) + 2) := by
        linarith only [Nat.cast_nonneg (α := ℝ) s]
      calc
        _ ≤ (13 * ((s : ℝ) + 2)) * R * r s :=
          mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right hscalar hR.le) (hr s).le
        _ = _ := by ring
    have hh := signAverage_mono hpoint
    rw [signAverage_add] at hh
    exact hh.trans (add_le_add le_rfl hX)
  have hchain : ∀ k, signAverage (E k) ≤ 13 * R +
      13 * R * ∑ s ∈ Finset.range k, ((s : ℝ) + 2) * r s := by
    intro k
    induction k with
    | zero => simpa using hE0
    | succ k ih =>
      rw [Finset.sum_range_succ, mul_add]
      exact (hstep k).trans (by linarith only [ih])
  have hK : K ≤ 4 ^ K := by
    suffices ∀ k : ℕ, k ≤ 4 ^ k from this K
    intro k
    induction k with
    | zero => simp
    | succ k ih =>
      rw [pow_succ]
      have ht : 0 < 4 ^ k := pow_pos (by decide : 0 < (4 : ℕ)) _
      omega
  have hδK : δ K ≤ 1 / N := by
    have heq : δ K = 1 / (4 : ℝ) ^ K := by
      dsimp [δ, r]
      rw [← pow_mul, mul_comm K 2, pow_mul, div_pow]
      norm_num
      simp only [one_div, inv_pow]
    rw [heq]
    apply one_div_le_one_div_of_le hN
    dsimp [N]
    exact_mod_cast hK
  have hterminal : G K = F := by
    apply Finset.eq_of_subset_of_card_le (hsub K)
    apply hmax K F Subset.rfl
    intro u hu v hv hne
    exact hδK.trans (hammingDistance_separated hne)
  have hsums : ∑ s ∈ Finset.range K, ((s : ℝ) + 2) * r s ≤ 6 := sum_chaining_scales K
  have hscale : 0 ≤ 13 * R := mul_nonneg (by norm_num) hR.le
  have hfinal := (hchain K).trans (add_le_add le_rfl (mul_le_mul_of_nonneg_left hsums hscale))
  rw [show 13 * R + 13 * R * 6 = 91 * R by ring] at hfinal
  simpa only [E, hterminal, R, N, D, K, c] using hfinal

end AgnosticVC
