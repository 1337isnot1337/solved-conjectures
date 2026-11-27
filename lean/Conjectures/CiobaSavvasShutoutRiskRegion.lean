import Conjectures.CiobaSavvasShutoutDefs
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-!
# Cioba–Savvas Shutout Number Conjecture — Local Risk Region Machinery

Self-contained proofs of the Shearer / Chen–Chen–Yang local risk region facts:
- Deletion recurrence `Q_{U ∪ {v}}(z) = Q_U(z) - z_v Q_{U \ N(v)}(z)`;
- Fact 1 (Initialization): `0 < x < 1` and `0 ≤ z_v ≤ x (1 - x)^D` implies `z ∈ ℛ(G)`;
- Monotonicity of the ratio `R_v(U) = Q_{U \ N(v)}(z) / Q_U(z)` in `U`;
- Fact 2 (Clique test): exact linear characterization `∑_{c ∈ C} z_c R_c(A) < 1` on a clique `C`,
  plus coordinatewise downward monotonicity and two-endpoint virtual reply averaging.
-/

open Finset
open scoped BigOperators

namespace Conjectures.CiobaSavvasShutout

variable {V : Type*} [Fintype V] [DecidableEq V]

lemma isIndepSet_insert_iff {G : SimpleGraph V} [DecidableRel G.Adj]
    {I : Finset V} {v : V} (hv : v ∉ I) :
    G.IsIndepSet (insert v I : Set V) ↔
      G.IsIndepSet (I : Set V) ∧ Disjoint I (G.neighborFinset v) := by
  let _ := ‹DecidableEq V›
  constructor
  · intro h
    refine ⟨h.mono (Set.subset_insert v (I : Set V)), ?_⟩
    rw [Finset.disjoint_left]
    intro u hu hnu
    have hvu : v ≠ u := fun hEq => hv (hEq ▸ hu)
    exact h (Set.mem_insert v (I : Set V)) (Set.mem_insert_of_mem v hu) hvu
      ((G.mem_neighborFinset v u).1 hnu)
  · rintro ⟨hI, hdisj⟩ a ha b hb hab
    rcases ha with rfl | ha <;> rcases hb with rfl | hb
    · exact (hab rfl).elim
    · intro hadj
      exact Finset.disjoint_left.1 hdisj hb ((G.mem_neighborFinset a b).2 hadj)
    · intro hadj
      exact Finset.disjoint_left.1 hdisj ha ((G.mem_neighborFinset b a).2 hadj.symm)
    · exact hI ha hb hab

/-- Deletion recurrence for the multivariate independence polynomial. -/
theorem indepPoly_insert (G : SimpleGraph V) [DecidableRel G.Adj]
    {U : Finset V} {v : V} (hv : v ∉ U) (z : V → ℝ) :
    indepPoly G (insert v U) z =
      indepPoly G U z - z v * indepPoly G (U \ G.neighborFinset v) z := by
  unfold indepPoly
  rw [← Finset.sum_filter_add_sum_filter_not (indepSubsets G (insert v U)) (fun I => v ∉ I)]
  have h1 : (indepSubsets G (insert v U)).filter (fun I => v ∉ I) = indepSubsets G U := by
    ext I
    simp only [indepSubsets, mem_filter, mem_powerset]
    constructor
    · rintro ⟨⟨hsub, hind⟩, hvI⟩
      refine ⟨fun u hu => ?_, hind⟩
      rcases mem_insert.1 (hsub hu) with rfl | huU
      · exact (hvI hu).elim
      · exact huU
    · rintro ⟨hsub, hind⟩
      exact ⟨⟨hsub.trans (subset_insert v U), hind⟩, fun hvI => hv (hsub hvI)⟩
  have h2 : ∑ I ∈ (indepSubsets G (insert v U)).filter (fun I => ¬ v ∉ I),
      (-1 : ℝ) ^ #I * ∏ u ∈ I, z u =
      -(z v * ∑ I ∈ indepSubsets G (U \ G.neighborFinset v),
        (-1 : ℝ) ^ #I * ∏ u ∈ I, z u) := by
    rw [Finset.mul_sum, ← Finset.sum_neg_distrib]
    symm
    refine Finset.sum_bij (fun I _ => insert v I) ?_ ?_ ?_ ?_
    · intro I hI
      simp only [indepSubsets, mem_filter, mem_powerset, not_not] at hI ⊢
      rcases hI with ⟨hsub, hind⟩
      have hIU : I ⊆ U := hsub.trans sdiff_subset
      have hvI : v ∉ I := fun h => hv (hIU h)
      have hdisj : Disjoint I (G.neighborFinset v) :=
        Finset.disjoint_left.2 fun u hu hnu => (mem_sdiff.1 (hsub hu)).2 hnu
      refine ⟨⟨insert_subset_insert v hIU, ?_⟩, mem_insert_self v I⟩
      rw [coe_insert]
      exact (isIndepSet_insert_iff hvI).2 ⟨hind, hdisj⟩
    · intro I₁ hI₁ I₂ hI₂ hEq
      simp only [indepSubsets, mem_filter, mem_powerset] at hI₁ hI₂
      have hv1 : v ∉ I₁ := fun h => hv (hI₁.1.trans sdiff_subset h)
      have hv2 : v ∉ I₂ := fun h => hv (hI₂.1.trans sdiff_subset h)
      have := congrArg (fun S => S.erase v) hEq
      simpa [erase_insert hv1, erase_insert hv2] using this
    · intro J hJ
      simp only [indepSubsets, mem_filter, mem_powerset, not_not] at hJ
      rcases hJ with ⟨⟨hsub, hind⟩, hvJ⟩
      refine ⟨J.erase v, ?_, insert_erase hvJ⟩
      simp only [indepSubsets, mem_filter, mem_powerset]
      have hvE : v ∉ J.erase v := notMem_erase v J
      have hind' : G.IsIndepSet (insert v (J.erase v : Set V)) := by
        rw [← coe_insert, insert_erase hvJ]
        exact hind
      rcases (isIndepSet_insert_iff hvE).1 hind' with ⟨hindE, hdisjE⟩
      refine ⟨fun u hu => ?_, hindE⟩
      have huJ : u ∈ J := mem_of_mem_erase hu
      have huv : u ≠ v := ne_of_mem_erase hu
      have huU : u ∈ U := by
        rcases mem_insert.1 (hsub huJ) with rfl | huU
        · exact (huv rfl).elim
        · exact huU
      exact mem_sdiff.2 ⟨huU, Finset.disjoint_left.1 hdisjE hu⟩
    · intro I hI
      simp only [indepSubsets, mem_filter, mem_powerset] at hI
      have hvI : v ∉ I := fun h => hv (hI.1.trans sdiff_subset h)
      rw [card_insert_of_notMem hvI, prod_insert hvI, pow_succ]
      ring
  rw [h1, h2]
  ring

lemma indepPoly_singleton (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) (z : V → ℝ) :
    indepPoly G {v} z = 1 - z v := by
  have hv : v ∉ (∅ : Finset V) := notMem_empty v
  have h := indepPoly_insert G hv z
  simp only [insert_empty_eq, empty_sdiff, indepPoly_empty, mul_one] at h
  exact h

theorem coord_lt_one_of_inRiskRegion {G : SimpleGraph V} [DecidableRel G.Adj]
    {z : V → ℝ} (hz : InRiskRegion G z) (v : V) :
    z v < 1 := by
  have hpos := hz.2 {v}
  rw [indepPoly_singleton] at hpos
  linarith

omit [Fintype V] in
private lemma indepPoly_sdiff_lower_aux {G : SimpleGraph V} [DecidableRel G.Adj]
    {z : V → ℝ} {x : ℝ} (hx : 0 ≤ 1 - x) {U : Finset V}
    (hstep : ∀ S : Finset V, S ⊆ U → ∀ w ∈ U, w ∉ S →
      (1 - x) * indepPoly G S z ≤ indepPoly G (insert w S) z) :
    ∀ T : Finset V, T ⊆ U → (1 - x) ^ #T * indepPoly G (U \ T) z ≤ indepPoly G U z := by
  intro T
  induction T using Finset.induction_on with
  | empty =>
    intro _
    simp
  | @insert w T hw ih =>
    intro hsub
    have hwU : w ∈ U := hsub (mem_insert_self w T)
    have hTU : T ⊆ U := (subset_insert w T).trans hsub
    have hEq : U \ T = insert w (U \ insert w T) := by
      ext u
      simp only [mem_sdiff, mem_insert]
      by_cases huw : u = w
      · subst huw; simp [hwU, hw]
      · simp [huw]
    have hwS : w ∉ U \ insert w T := by simp
    have hle1 : (1 - x) * indepPoly G (U \ insert w T) z ≤ indepPoly G (U \ T) z := by
      rw [hEq]
      exact hstep (U \ insert w T) sdiff_subset w hwU hwS
    have hle2 : (1 - x) ^ #T * ((1 - x) * indepPoly G (U \ insert w T) z) ≤
        (1 - x) ^ #T * indepPoly G (U \ T) z :=
      mul_le_mul_of_nonneg_left hle1 (pow_nonneg hx #T)
    have hpow : (1 - x) ^ #(insert w T) * indepPoly G (U \ insert w T) z =
        (1 - x) ^ #T * ((1 - x) * indepPoly G (U \ insert w T) z) := by
      rw [card_insert_of_notMem hw, pow_succ]
      ring
    rw [hpow]
    exact hle2.trans (ih hTU)

lemma indepPoly_sdiff_lower {G : SimpleGraph V} [DecidableRel G.Adj]
    {z : V → ℝ} {x : ℝ} (hx : 0 ≤ 1 - x) {U W : Finset V}
    (hstep : ∀ S : Finset V, S ⊆ U → ∀ w ∈ U, w ∉ S →
      (1 - x) * indepPoly G S z ≤ indepPoly G (insert w S) z) :
    (1 - x) ^ #(U ∩ W) * indepPoly G (U \ W) z ≤ indepPoly G U z := by
  let _ := ‹Fintype V›
  have h := indepPoly_sdiff_lower_aux hx hstep (U ∩ W) inter_subset_left
  have hsdiff : U \ (U ∩ W) = U \ W := by
    ext u
    simp
  rwa [hsdiff] at h

/-- Fact 1 (Initialization): if `0 < x < 1` and `0 ≤ z_v ≤ x (1 - x)^D` for every vertex `v`
with `G.degree v ≤ D`, then `z ∈ ℛ(G)`. -/
theorem inRiskRegion_of_le_init {G : SimpleGraph V} [DecidableRel G.Adj]
    {D : ℕ} (hdeg : ∀ v : V, G.degree v ≤ D)
    {x : ℝ} (hx0 : 0 < x) (hx1 : x < 1)
    {z : V → ℝ} (hz0 : ∀ v : V, 0 ≤ z v) (hzle : ∀ v : V, z v ≤ x * (1 - x) ^ D) :
    InRiskRegion G z := by
  have hxpos : 0 < 1 - x := by linarith
  have hxle1 : 1 - x ≤ 1 := by linarith
  have hmain : ∀ n : ℕ, ∀ U : Finset V, #U = n →
      0 < indepPoly G U z ∧
        ∀ v, v ∉ U → (1 - x) * indepPoly G U z ≤ indepPoly G (insert v U) z := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro U hcard
      have hposU : 0 < indepPoly G U z := by
        rcases U.eq_empty_or_nonempty with rfl | ⟨u, hu⟩
        · rw [indepPoly_empty]; exact zero_lt_one
        · have hlt : #(U.erase u) < n := by
            rw [← hcard]
            exact card_erase_lt_of_mem hu
          have ⟨hposE, hstepE⟩ := ih #(U.erase u) hlt (U.erase u) rfl
          have h1 := hstepE u (notMem_erase u U)
          rw [insert_erase hu] at h1
          exact lt_of_lt_of_le (mul_pos hxpos hposE) h1
      refine ⟨hposU, ?_⟩
      intro v hv
      rw [indepPoly_insert G hv z]
      have hstepU : ∀ S : Finset V, S ⊆ U → ∀ w ∈ U, w ∉ S →
          (1 - x) * indepPoly G S z ≤ indepPoly G (insert w S) z := by
        intro S hSU w hwU hwS
        have hlt : #S < n := by
          rw [← hcard]
          exact card_lt_card (Finset.ssubset_iff_subset_ne.2 ⟨hSU, fun hEq => hwS (hEq ▸ hwU)⟩)
        exact (ih #S hlt S rfl).2 w hwS
      have hsdiff := indepPoly_sdiff_lower hxpos.le (W := G.neighborFinset v) hstepU
      have hposSdiff : 0 ≤ indepPoly G (U \ G.neighborFinset v) z := by
        by_cases hEq : U \ G.neighborFinset v = U
        · rw [hEq]; exact hposU.le
        · have hlt : #(U \ G.neighborFinset v) < n := by
            rw [← hcard]
            exact card_lt_card (Finset.ssubset_iff_subset_ne.2 ⟨sdiff_subset, hEq⟩)
          exact (ih _ hlt _ rfl).1.le
      have hcardN : #(U ∩ G.neighborFinset v) ≤ D := by
        calc #(U ∩ G.neighborFinset v) ≤ #(G.neighborFinset v) := card_le_card inter_subset_right
          _ = G.degree v := G.card_neighborFinset_eq_degree v
          _ ≤ D := hdeg v
      have hpow : (1 - x) ^ D ≤ (1 - x) ^ #(U ∩ G.neighborFinset v) :=
        pow_le_pow_of_le_one hxpos.le hxle1 hcardN
      have hzv : z v * indepPoly G (U \ G.neighborFinset v) z ≤ x * indepPoly G U z := by
        calc z v * indepPoly G (U \ G.neighborFinset v) z
            ≤ (x * (1 - x) ^ D) * indepPoly G (U \ G.neighborFinset v) z :=
              mul_le_mul_of_nonneg_right (hzle v) hposSdiff
          _ = x * ((1 - x) ^ D * indepPoly G (U \ G.neighborFinset v) z) := by ring
          _ ≤ x * ((1 - x) ^ #(U ∩ G.neighborFinset v) *
                indepPoly G (U \ G.neighborFinset v) z) :=
              mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right hpow hposSdiff) hx0.le
          _ ≤ x * indepPoly G U z := mul_le_mul_of_nonneg_left hsdiff hx0.le
      linarith
  exact ⟨hz0, fun U => (hmain #U U rfl).1⟩

lemma riskRatio_pos {G : SimpleGraph V} [DecidableRel G.Adj]
    {A U : Finset V} {z : V → ℝ} (hA : InRiskRegionOn G A z) (hU : U ⊆ A) (v : V) :
    0 < riskRatio G z v U := by
  unfold riskRatio
  exact div_pos (hA.2 _ (sdiff_subset.trans hU)) (hA.2 _ hU)

lemma riskRatio_insert_of_adj {G : SimpleGraph V} [DecidableRel G.Adj]
    {A U : Finset V} {z : V → ℝ} (hA : InRiskRegionOn G A z)
    {w v : V} (hwA : w ∈ A) (hwU : w ∉ U) (hU : U ⊆ A) (hadj : G.Adj v w) :
    riskRatio G z v U ≤ riskRatio G z v (insert w U) := by
  unfold riskRatio
  have hwN : w ∈ G.neighborFinset v := (G.mem_neighborFinset v w).2 hadj
  have hnum : (insert w U) \ G.neighborFinset v = U \ G.neighborFinset v := by
    ext u
    simp only [mem_sdiff, mem_insert]
    constructor
    · rintro ⟨rfl | hu, huN⟩
      · exact (huN hwN).elim
      · exact ⟨hu, huN⟩
    · rintro ⟨hu, huN⟩
      exact ⟨Or.inr hu, huN⟩
  rw [hnum]
  have hposNum : 0 ≤ indepPoly G (U \ G.neighborFinset v) z :=
    (hA.2 _ (sdiff_subset.trans hU)).le
  have hposIns : 0 < indepPoly G (insert w U) z :=
    hA.2 _ (insert_subset hwA hU)
  have hdenom : indepPoly G (insert w U) z ≤ indepPoly G U z := by
    rw [indepPoly_insert G hwU z]
    have hzw : 0 ≤ z w := hA.1 w hwA
    have hposW : 0 ≤ indepPoly G (U \ G.neighborFinset w) z :=
      (hA.2 _ (sdiff_subset.trans hU)).le
    linarith [mul_nonneg hzw hposW]
  exact div_le_div_of_nonneg_left hposNum hposIns hdenom

lemma riskRatio_insert_of_not_adj {G : SimpleGraph V} [DecidableRel G.Adj]
    {A U : Finset V} {z : V → ℝ} (hA : InRiskRegionOn G A z)
    {w v : V} (hwA : w ∈ A) (hwU : w ∉ U) (hU : U ⊆ A) (hnot : ¬ G.Adj v w) :
    riskRatio G z v (insert w U) / riskRatio G z v U =
      (1 - z w * riskRatio G z w (U \ G.neighborFinset v)) /
        (1 - z w * riskRatio G z w U) := by
  have hwN : w ∉ G.neighborFinset v := fun h => hnot ((G.mem_neighborFinset v w).1 h)
  have hset : (insert w U) \ G.neighborFinset v = insert w (U \ G.neighborFinset v) := by
    ext u
    simp only [mem_sdiff, mem_insert]
    constructor
    · rintro ⟨rfl | hu, huN⟩
      · exact Or.inl rfl
      · exact Or.inr ⟨hu, huN⟩
    · rintro (rfl | ⟨hu, huN⟩)
      · exact ⟨Or.inl rfl, hwN⟩
      · exact ⟨Or.inr hu, huN⟩
  have hwUN : w ∉ U \ G.neighborFinset v := fun h => hwU (mem_sdiff.1 h).1
  have hQU : indepPoly G U z ≠ 0 := (hA.2 _ hU).ne'
  have hQUN : indepPoly G (U \ G.neighborFinset v) z ≠ 0 :=
    (hA.2 _ (sdiff_subset.trans hU)).ne'
  have hQins : indepPoly G (insert w U) z ≠ 0 := (hA.2 _ (insert_subset hwA hU)).ne'
  have hins1 : indepPoly G (insert w U) z =
      indepPoly G U z * (1 - z w * riskRatio G z w U) := by
    rw [indepPoly_insert G hwU z, riskRatio]
    field_simp [hQU]
  have hins2 : indepPoly G ((insert w U) \ G.neighborFinset v) z =
      indepPoly G (U \ G.neighborFinset v) z *
        (1 - z w * riskRatio G z w (U \ G.neighborFinset v)) := by
    rw [hset, indepPoly_insert G hwUN z, riskRatio]
    field_simp [hQUN]
  have hden0 : 1 - z w * riskRatio G z w U ≠ 0 := by
    intro h0
    rw [h0, mul_zero] at hins1
    exact hQins hins1
  unfold riskRatio at *
  rw [hins1, hins2]
  field_simp [hQU, hQUN, hden0]

private lemma riskRatio_mono_aux {G : SimpleGraph V} [DecidableRel G.Adj]
    {A : Finset V} {z : V → ℝ} (hA : InRiskRegionOn G A z) :
    ∀ n : ℕ, ∀ U U' : Finset V, #U' = n → U ⊆ U' → U' ⊆ A → ∀ v : V,
      riskRatio G z v U ≤ riskRatio G z v U' := by
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro U U' hcard hUU' hU'A v
    by_cases hEq : U = U'
    · subst hEq; exact le_rfl
    · have hssub : U ⊂ U' := Finset.ssubset_iff_subset_ne.2 ⟨hUU', hEq⟩
      obtain ⟨w, hwU', hwU⟩ := exists_of_ssubset hssub
      let U₁ := U'.erase w
      have hwU₁ : w ∉ U₁ := notMem_erase w U'
      have hU₁ins : insert w U₁ = U' := insert_erase hwU'
      have hU₁A : U₁ ⊆ A := (erase_subset w U').trans hU'A
      have hwA : w ∈ A := hU'A hwU'
      have hUU₁ : U ⊆ U₁ := fun u hu => mem_erase.2 ⟨fun h => hwU (h ▸ hu), hUU' hu⟩
      have hlt : #U₁ < n := by
        rw [← hcard]
        exact card_erase_lt_of_mem hwU'
      have hstep1 : riskRatio G z v U ≤ riskRatio G z v U₁ :=
        ih #U₁ hlt U U₁ rfl hUU₁ hU₁A v
      have hstep2 : riskRatio G z v U₁ ≤ riskRatio G z v (insert w U₁) := by
        by_cases hadj : G.Adj v w
        · exact riskRatio_insert_of_adj hA hwA hwU₁ hU₁A hadj
        · have hrat := riskRatio_insert_of_not_adj hA hwA hwU₁ hU₁A hadj
          have hRw : riskRatio G z w (U₁ \ G.neighborFinset v) ≤ riskRatio G z w U₁ :=
            ih #U₁ hlt (U₁ \ G.neighborFinset v) U₁ rfl sdiff_subset hU₁A w
          have hzw : 0 ≤ z w := hA.1 w hwA
          have hQU₁ : 0 < indepPoly G U₁ z := hA.2 _ hU₁A
          have hQins : 0 < indepPoly G (insert w U₁) z := hA.2 _ (hU₁ins.symm ▸ hU'A)
          have hdenPos : 0 < 1 - z w * riskRatio G z w U₁ := by
            have hEqDen : 1 - z w * riskRatio G z w U₁ =
                indepPoly G (insert w U₁) z / indepPoly G U₁ z := by
              rw [indepPoly_insert G hwU₁ z, riskRatio]
              field_simp [hQU₁.ne']
            rw [hEqDen]
            exact div_pos hQins hQU₁
          have hnumGe : 1 - z w * riskRatio G z w U₁ ≤
              1 - z w * riskRatio G z w (U₁ \ G.neighborFinset v) := by
            linarith [mul_le_mul_of_nonneg_left hRw hzw]
          have hge1 : 1 ≤ riskRatio G z v (insert w U₁) / riskRatio G z v U₁ := by
            rw [hrat]
            exact (one_le_div hdenPos).2 hnumGe
          have hRvPos : 0 < riskRatio G z v U₁ := riskRatio_pos hA hU₁A v
          exact (one_le_div hRvPos).1 hge1
      rw [← hU₁ins]
      exact hstep1.trans hstep2

/-- Monotonicity of `R_v(U)` in `U` inside a positive region `A`. -/
theorem riskRatio_mono {G : SimpleGraph V} [DecidableRel G.Adj]
    {A U U' : Finset V} {z : V → ℝ} (hA : InRiskRegionOn G A z)
    (hUU' : U ⊆ U') (hU'A : U' ⊆ A) {v : V} (hv : v ∉ U') :
    riskRatio G z v U ≤ riskRatio G z v U' := by
  have _ := hv
  exact riskRatio_mono_aux hA #U' U U' rfl hUU' hU'A v

private lemma indepPoly_clique_split_aux {G : SimpleGraph V} [DecidableRel G.Adj]
    {C : Finset V} (hC : G.IsClique (C : Set V)) {U : Finset V} (hUC : Disjoint U C)
    (z : V → ℝ) :
    ∀ T : Finset V, T ⊆ C →
      indepPoly G (U ∪ T) z =
        indepPoly G U z - ∑ c ∈ T, z c * indepPoly G (U \ G.neighborFinset c) z := by
  intro T
  induction T using Finset.induction_on with
  | empty =>
    intro _
    simp
  | @insert c T hcT ih =>
    intro hTC
    have hcC : c ∈ C := hTC (mem_insert_self c T)
    have hTsub : T ⊆ C := (subset_insert c T).trans hTC
    have hcU : c ∉ U := Finset.disjoint_right.1 hUC hcC
    have hcUT : c ∉ U ∪ T := by simp [hcU, hcT]
    have hEq1 : U ∪ insert c T = insert c (U ∪ T) := by
      ext u; simp
    have hEq2 : (U ∪ T) \ G.neighborFinset c = U \ G.neighborFinset c := by
      ext u
      simp only [mem_sdiff, mem_union]
      constructor
      · rintro ⟨huU | huT, huN⟩
        · exact ⟨huU, huN⟩
        · have huC : u ∈ C := hTsub huT
          have hcu : c ≠ u := fun h => hcT (h ▸ huT)
          have hadj : G.Adj c u := hC hcC huC hcu
          exact (huN ((G.mem_neighborFinset c u).2 hadj)).elim
      · rintro ⟨huU, huN⟩
        exact ⟨Or.inl huU, huN⟩
    rw [hEq1, indepPoly_insert G hcUT z, hEq2, ih hTsub, sum_insert hcT]
    ring

/-- Clique expansion of the independence polynomial: an independent set meets a clique `C`
in at most one vertex. -/
theorem indepPoly_clique_split {G : SimpleGraph V} [DecidableRel G.Adj]
    {C : Finset V} (hC : G.IsClique (C : Set V)) (S : Finset V) (z : V → ℝ) :
    indepPoly G S z =
      indepPoly G (S \ C) z -
        ∑ c ∈ S ∩ C, z c * indepPoly G ((S \ C) \ G.neighborFinset c) z := by
  have h := indepPoly_clique_split_aux hC (disjoint_sdiff_self_left : Disjoint (S \ C) C) z
    (S ∩ C) inter_subset_right
  have hEq : (S \ C) ∪ (S ∩ C) = S := sdiff_union_inter S C
  rwa [hEq] at h

/-- Fact 2 (Clique test): fixing coordinates outside a clique `C` in `ℛ(G[V \ C])`,
a nonnegative assignment on `C` extends into `ℛ(G)` iff `∑_{c ∈ C} z_c R_c(V \ C) < 1`. -/
theorem inRiskRegion_clique_iff {G : SimpleGraph V} [DecidableRel G.Adj]
    {C : Finset V} (hC : G.IsClique (C : Set V)) {z : V → ℝ}
    (hA : InRiskRegionOn G (Finset.univ \ C) z) (hCz : ∀ c ∈ C, 0 ≤ z c) :
    InRiskRegion G z ↔
      ∑ c ∈ C, z c * riskRatio G z c (Finset.univ \ C) < 1 := by
  have hfactor : ∀ S : Finset V,
      indepPoly G S z =
        indepPoly G (S \ C) z * (1 - ∑ c ∈ S ∩ C, z c * riskRatio G z c (S \ C)) := by
    intro S
    have hsub : S \ C ⊆ Finset.univ \ C := sdiff_subset_sdiff (subset_univ S) Subset.rfl
    have hQU : indepPoly G (S \ C) z ≠ 0 := (hA.2 _ hsub).ne'
    rw [indepPoly_clique_split hC S z, mul_sub, mul_one, Finset.mul_sum]
    congr 1
    refine Finset.sum_congr rfl fun c _ => ?_
    rw [riskRatio]
    field_simp [hQU]
  constructor
  · intro hz
    have hpos := hz.2 Finset.univ
    rw [hfactor Finset.univ, univ_inter] at hpos
    have hQA : 0 < indepPoly G (Finset.univ \ C) z := hA.2 _ Subset.rfl
    have h1 : 0 < 1 - ∑ c ∈ C, z c * riskRatio G z c (Finset.univ \ C) :=
      (mul_pos_iff_of_pos_left hQA).1 hpos
    linarith
  · intro hsum
    refine ⟨fun v => ?_, fun S => ?_⟩
    · by_cases hv : v ∈ C
      · exact hCz v hv
      · exact hA.1 v (mem_sdiff.2 ⟨mem_univ v, hv⟩)
    · rw [hfactor S]
      have hsub : S \ C ⊆ Finset.univ \ C := sdiff_subset_sdiff (subset_univ S) Subset.rfl
      have hQU : 0 < indepPoly G (S \ C) z := hA.2 _ hsub
      have hle1 : ∑ c ∈ S ∩ C, z c * riskRatio G z c (S \ C) ≤
          ∑ c ∈ S ∩ C, z c * riskRatio G z c (Finset.univ \ C) := by
        refine Finset.sum_le_sum fun c hc => ?_
        have hcC : c ∈ C := (mem_inter.1 hc).2
        have hcNotA : c ∉ Finset.univ \ C := by simp [hcC]
        exact mul_le_mul_of_nonneg_left
          (riskRatio_mono hA hsub Subset.rfl hcNotA) (hCz c hcC)
      have hle2 : ∑ c ∈ S ∩ C, z c * riskRatio G z c (Finset.univ \ C) ≤
          ∑ c ∈ C, z c * riskRatio G z c (Finset.univ \ C) := by
        refine Finset.sum_le_sum_of_subset_of_nonneg inter_subset_right fun c hc _ => ?_
        exact mul_nonneg (hCz c hc) (riskRatio_pos hA Subset.rfl c).le
      have hlt : ∑ c ∈ S ∩ C, z c * riskRatio G z c (S \ C) < 1 :=
        lt_of_le_of_lt (hle1.trans hle2) hsum
      exact mul_pos hQU (by linarith)

/-- Decreasing a single coordinate (keeping it nonnegative) preserves `ℛ(G)` (singleton clique). -/
lemma inRiskRegion_update_le {G : SimpleGraph V} [DecidableRel G.Adj]
    {z : V → ℝ} (hz : InRiskRegion G z) (v : V) {t : ℝ} (ht0 : 0 ≤ t) (htle : t ≤ z v) :
    InRiskRegion G (Function.update z v t) := by
  let z' := Function.update z v t
  have hC : G.IsClique (({v} : Finset V) : Set V) := by
    rw [coe_singleton]
    exact Set.pairwise_singleton _ _
  have hcongr : ∀ u ∈ Finset.univ \ ({v} : Finset V), z' u = z u := by
    intro u hu
    have huv : u ≠ v := by simpa using hu
    exact Function.update_of_ne huv t z
  have hA : InRiskRegionOn G (Finset.univ \ ({v} : Finset V)) z :=
    inRiskRegionOn_of_inRiskRegion hz _
  have hA' : InRiskRegionOn G (Finset.univ \ ({v} : Finset V)) z' := by
    refine ⟨fun u hu => ?_, fun U hU => ?_⟩
    · rw [hcongr u hu]; exact hA.1 u hu
    · rw [indepPoly_congr (fun u hu => hcongr u (hU hu))]; exact hA.2 U hU
  have hCz : ∀ c ∈ ({v} : Finset V), 0 ≤ z c := fun c _ => hz.1 c
  have hCz' : ∀ c ∈ ({v} : Finset V), 0 ≤ z' c := by
    intro c hc
    rw [mem_singleton.1 hc]
    simpa [z'] using ht0
  have hlt : ∑ c ∈ ({v} : Finset V), z c * riskRatio G z c (Finset.univ \ {v}) < 1 :=
    (inRiskRegion_clique_iff hC hA hCz).1 hz
  rw [sum_singleton] at hlt
  have hR_eq : riskRatio G z' v (Finset.univ \ {v}) = riskRatio G z v (Finset.univ \ {v}) := by
    unfold riskRatio
    rw [indepPoly_congr (fun u hu => hcongr u (sdiff_subset hu)),
      indepPoly_congr (fun u hu => hcongr u hu)]
  have hlt' : ∑ c ∈ ({v} : Finset V), z' c * riskRatio G z' c (Finset.univ \ {v}) < 1 := by
    rw [sum_singleton, hR_eq]
    have hzv' : z' v = t := Function.update_self v t z
    rw [hzv']
    have hRpos : 0 ≤ riskRatio G z v (Finset.univ \ {v}) := (riskRatio_pos hA Subset.rfl v).le
    exact lt_of_le_of_lt (mul_le_mul_of_nonneg_right htle hRpos) hlt
  exact (inRiskRegion_clique_iff hC hA' hCz').2 hlt'

/-- Coordinatewise downward monotonicity of `ℛ(G)`. -/
theorem inRiskRegion_mono {G : SimpleGraph V} [DecidableRel G.Adj]
    {z z' : V → ℝ} (hz : InRiskRegion G z) (hz'0 : ∀ v, 0 ≤ z' v) (hle : ∀ v, z' v ≤ z v) :
    InRiskRegion G z' := by
  have haux : ∀ S : Finset V, InRiskRegion G (fun v => if v ∈ S then z' v else z v) := by
    intro S
    induction S using Finset.induction_on with
    | empty =>
      simpa using hz
    | @insert w S hw ih =>
      have hEq : (fun v => if v ∈ insert w S then z' v else z v) =
          Function.update (fun v => if v ∈ S then z' v else z v) w (z' w) := by
        ext v
        by_cases hvw : v = w
        · subst hvw; simp
        · simp [hvw]
      rw [hEq]
      refine inRiskRegion_update_le ih w (hz'0 w) ?_
      simp [hw, hle w]
  simpa using haux Finset.univ

/-- Virtual reply setting `u ↦ 0` and doubling `v ↦ 2 * z v`. -/
def virtualKillLeft (z : V → ℝ) (u v : V) (w : V) : ℝ :=
  if w = u then 0 else if w = v then 2 * z v else z w

/-- Virtual reply setting `v ↦ 0` and doubling `u ↦ 2 * z u`. -/
def virtualKillRight (z : V → ℝ) (u v : V) (w : V) : ℝ :=
  if w = v then 0 else if w = u then 2 * z u else z w

/-- Two-endpoint averaging on an edge `uv` (a 2-clique): at least one of the two virtual
replies `(0, 2 z_v)` or `(2 z_u, 0)` remains in `ℛ(G)`. -/
theorem inRiskRegion_edge_virtual_reply {G : SimpleGraph V} [DecidableRel G.Adj]
    {z : V → ℝ} (hz : InRiskRegion G z) {u v : V} (hadj : G.Adj u v) :
    InRiskRegion G (virtualKillLeft z u v) ∨ InRiskRegion G (virtualKillRight z u v) := by
  have huv : u ≠ v := hadj.ne
  let C : Finset V := {u, v}
  have hC : G.IsClique (C : Set V) := by
    intro a ha b hb hab
    simp only [C, coe_insert, coe_singleton, Set.mem_insert_iff, Set.mem_singleton_iff] at ha hb
    rcases ha with rfl | rfl <;> rcases hb with rfl | rfl
    · exact (hab rfl).elim
    · exact hadj
    · exact hadj.symm
    · exact (hab rfl).elim
  have hA : InRiskRegionOn G (Finset.univ \ C) z := inRiskRegionOn_of_inRiskRegion hz _
  have hCz : ∀ c ∈ C, 0 ≤ z c := fun c _ => hz.1 c
  have hsum : ∑ c ∈ C, z c * riskRatio G z c (Finset.univ \ C) < 1 :=
    (inRiskRegion_clique_iff hC hA hCz).1 hz
  rw [sum_pair huv] at hsum
  have hcongrL : ∀ w ∈ Finset.univ \ C, virtualKillLeft z u v w = z w := by
    intro w hw
    have hwC : w ∉ C := (mem_sdiff.1 hw).2
    have hwu : w ≠ u := fun h => hwC (by simp [C, h])
    have hwv : w ≠ v := fun h => hwC (by simp [C, h])
    simp [virtualKillLeft, hwu, hwv]
  have hcongrR : ∀ w ∈ Finset.univ \ C, virtualKillRight z u v w = z w := by
    intro w hw
    have hwC : w ∉ C := (mem_sdiff.1 hw).2
    have hwu : w ≠ u := fun h => hwC (by simp [C, h])
    have hwv : w ≠ v := fun h => hwC (by simp [C, h])
    simp [virtualKillRight, hwu, hwv]
  have hAL : InRiskRegionOn G (Finset.univ \ C) (virtualKillLeft z u v) := by
    refine ⟨fun w hw => ?_, fun U hU => ?_⟩
    · rw [hcongrL w hw]; exact hA.1 w hw
    · rw [indepPoly_congr (fun w hw => hcongrL w (hU hw))]; exact hA.2 U hU
  have hAR : InRiskRegionOn G (Finset.univ \ C) (virtualKillRight z u v) := by
    refine ⟨fun w hw => ?_, fun U hU => ?_⟩
    · rw [hcongrR w hw]; exact hA.1 w hw
    · rw [indepPoly_congr (fun w hw => hcongrR w (hU hw))]; exact hA.2 U hU
  have hRL : ∀ c, riskRatio G (virtualKillLeft z u v) c (Finset.univ \ C) =
      riskRatio G z c (Finset.univ \ C) := by
    intro c
    unfold riskRatio
    rw [indepPoly_congr (fun w hw => hcongrL w (sdiff_subset hw)),
      indepPoly_congr (fun w hw => hcongrL w hw)]
  have hRR : ∀ c, riskRatio G (virtualKillRight z u v) c (Finset.univ \ C) =
      riskRatio G z c (Finset.univ \ C) := by
    intro c
    unfold riskRatio
    rw [indepPoly_congr (fun w hw => hcongrR w (sdiff_subset hw)),
      indepPoly_congr (fun w hw => hcongrR w hw)]
  have hCL : ∀ c ∈ C, 0 ≤ virtualKillLeft z u v c := by
    intro c hc
    simp only [C, mem_insert, mem_singleton] at hc
    rcases hc with rfl | rfl
    · simp [virtualKillLeft]
    · simp [virtualKillLeft, huv.symm]; linarith [hz.1 c]
  have hCR : ∀ c ∈ C, 0 ≤ virtualKillRight z u v c := by
    intro c hc
    simp only [C, mem_insert, mem_singleton] at hc
    rcases hc with rfl | rfl
    · simp [virtualKillRight, huv]; linarith [hz.1 c]
    · simp [virtualKillRight]
  by_cases hleft : 2 * z v * riskRatio G z v (Finset.univ \ C) < 1
  · left
    refine (inRiskRegion_clique_iff hC hAL hCL).2 ?_
    rw [sum_pair huv, hRL u, hRL v]
    simp [virtualKillLeft, huv.symm]
    linarith
  · right
    refine (inRiskRegion_clique_iff hC hAR hCR).2 ?_
    rw [sum_pair huv, hRR u, hRR v]
    simp [virtualKillRight, huv]
    linarith

end Conjectures.CiobaSavvasShutout
