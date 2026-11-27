import Conjectures.CiobaSavvasShutoutRiskRegion

/-!
# Cioba–Savvas Shutout Number Conjecture — Breaker's Risk-Region Strategy

Defines live vertices and the dynamic risk vector `z_v = 2^{r_v - (s - 1)}`, proves the
one-step safety margin `r_v ≤ s - 2` (`r_v + 2 ≤ s`), rules out immediate Maker wins
(including on odd-size boards), establishes existence of an unclaimed incident edge at any
live endpoint, implements Breaker's reply in all cases (0, 1, or 2 live endpoints), and
deduces `BreakerWinsImmediate G s` from initial membership in `ℛ(G)`.
-/

open Finset

namespace Conjectures.CiobaSavvasShutout

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A vertex is live if its host degree is at least `s` and Breaker has claimed no edge there. -/
def IsLive (G : SimpleGraph V) [DecidableRel G.Adj] (s : ℕ) (B : Finset (Sym2 V)) (v : V) : Prop :=
  s ≤ G.degree v ∧ breakerDeg B v = 0

instance instDecidableIsLive (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : ℕ) (B : Finset (Sym2 V)) (v : V) : Decidable (IsLive G s B v) :=
  inferInstanceAs (Decidable (s ≤ G.degree v ∧ breakerDeg B v = 0))

/-- Dynamic risk vector: `z_v = 2^{r_v - (s - 1)}` if `v` is live, and `0` otherwise. -/
noncomputable def riskVec (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : ℕ) (M B : Finset (Sym2 V)) (v : V) : ℝ :=
  if IsLive G s B v then (2 : ℝ) ^ ((makerDeg M v : ℤ) - ((s : ℤ) - 1)) else 0

lemma riskVec_nonneg (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : ℕ) (M B : Finset (Sym2 V)) (v : V) :
    0 ≤ riskVec G s M B v := by
  unfold riskVec
  split_ifs
  · exact zpow_nonneg (by norm_num : (0 : ℝ) ≤ 2) _
  · exact le_rfl

/-- Safety-margin invariant: whenever `riskVec ∈ ℛ(G)`, every live vertex has `r_v + 2 ≤ s`
(in particular `r_v ≤ s - 2`). -/
theorem makerDeg_add_two_le_of_inRiskRegion {G : SimpleGraph V} [DecidableRel G.Adj]
    {s : ℕ} {M B : Finset (Sym2 V)}
    (hr : InRiskRegion G (riskVec G s M B)) {v : V} (hv : IsLive G s B v) :
    makerDeg M v + 2 ≤ s := by
  have hlt : riskVec G s M B v < 1 := coord_lt_one_of_inRiskRegion hr v
  simp only [riskVec, hv, ↓reduceIte] at hlt
  have hexp : (makerDeg M v : ℤ) - ((s : ℤ) - 1) < 0 := by
    refine lt_of_not_ge fun hge => ?_
    have h1 : (1 : ℝ) ≤ (2 : ℝ) ^ ((makerDeg M v : ℤ) - ((s : ℤ) - 1)) :=
      one_le_zpow₀ (by norm_num : (1 : ℝ) ≤ 2) hge
    exact not_le_of_gt hlt h1
  omega

lemma not_hasShutout_of_inRiskRegion {G : SimpleGraph V} [DecidableRel G.Adj]
    {s : ℕ} {M B : Finset (Sym2 V)}
    (hvalid : ValidBoard G M B) (hr : InRiskRegion G (riskVec G s M B)) :
    ¬ HasShutout (V := V) s M B := by
  rintro ⟨v, hms, hbv⟩
  have hpart := incident_degree_partition hvalid v
  have hlive : IsLive G s B v := ⟨by omega, hbv⟩
  have hmargin := makerDeg_add_two_le_of_inRiskRegion hr hlive
  omega

/-- Maker's move cannot win immediately (covering also termination on an odd-sized board). -/
theorem not_hasShutout_after_maker_move {G : SimpleGraph V} [DecidableRel G.Adj]
    {s : ℕ} {M B : Finset (Sym2 V)} {e : Sym2 V}
    (hvalid : ValidBoard G M B) (hr : InRiskRegion G (riskVec G s M B))
    (he : e ∈ freeEdges G M B) :
    ¬ HasShutout (V := V) s (insert e M) B := by
  rintro ⟨v, hms, hbv⟩
  have hvalid' := (validBoard_insert_maker hvalid he).1
  have hpart := incident_degree_partition hvalid' v
  have hlive : IsLive G s B v := ⟨by omega, hbv⟩
  have hmargin := makerDeg_add_two_le_of_inRiskRegion hr hlive
  have heM : e ∉ M := by
    simp only [freeEdges, mem_sdiff, mem_union, not_or] at he
    exact he.2.1
  have hdeg := makerDeg_insert heM v
  split_ifs at hdeg <;> omega

/-- After Maker claims `e`, every live endpoint of `e` still has an unclaimed incident edge. -/
theorem exists_free_edge_incident_of_live {G : SimpleGraph V} [DecidableRel G.Adj]
    {s : ℕ} {M B : Finset (Sym2 V)} {e : Sym2 V}
    (hvalid : ValidBoard G M B) (hr : InRiskRegion G (riskVec G s M B))
    (he : e ∈ freeEdges G M B) {a : V} (ha : a ∈ e) (hlive : IsLive G s B a) :
    ∃ f ∈ freeEdges G (insert e M) B, a ∈ f := by
  have hvalid' := (validBoard_insert_maker hvalid he).1
  have hpart := incident_degree_partition hvalid' a
  have hmargin := makerDeg_add_two_le_of_inRiskRegion hr hlive
  have heM : e ∉ M := by
    simp only [freeEdges, mem_sdiff, mem_union, not_or] at he
    exact he.2.1
  have hdeg := makerDeg_insert heM a
  simp only [ha, ↓reduceIte] at hdeg
  have hdegG : s ≤ G.degree a := hlive.1
  have hb0 : breakerDeg B a = 0 := hlive.2
  have hpos : 0 < #{f ∈ freeEdges G (insert e M) B | a ∈ f} := by omega
  obtain ⟨f, hf⟩ := Finset.card_pos.mp hpos
  simp only [mem_filter] at hf
  exact ⟨f, hf.1, hf.2⟩

lemma not_isLive_insert_of_mem {G : SimpleGraph V} [DecidableRel G.Adj]
    {s : ℕ} {B : Finset (Sym2 V)} {f : Sym2 V} (hf : f ∉ B) {a : V} (ha : a ∈ f) :
    ¬ IsLive G s (insert f B) a := by
  intro h
  have h0 := h.2
  rw [breakerDeg_insert hf a] at h0
  simp only [ha, ↓reduceIte] at h0
  omega

lemma not_isLive_mono {G : SimpleGraph V} [DecidableRel G.Adj]
    {s : ℕ} {B : Finset (Sym2 V)} {f : Sym2 V} (hf : f ∉ B) {w : V}
    (hn : ¬ IsLive G s B w) :
    ¬ IsLive G s (insert f B) w := by
  intro h
  apply hn
  refine ⟨h.1, ?_⟩
  have h0 := h.2
  rw [breakerDeg_insert hf w] at h0
  by_cases hw : w ∈ f
  · simp only [hw, ↓reduceIte] at h0
    omega
  · simp only [hw, ↓reduceIte, add_zero] at h0
    exact h0

/-- Case 0: if neither endpoint of Maker's edge `s(u, v)` is live, any free reply preserves `ℛ(G)`. -/
lemma reply_neither_live {G : SimpleGraph V} [DecidableRel G.Adj]
    {s : ℕ} {M B : Finset (Sym2 V)} {u v : V}
    (hvalid : ValidBoard G M B) (hr : InRiskRegion G (riskVec G s M B))
    (he : s(u, v) ∈ freeEdges G M B)
    (hu : ¬ IsLive G s B u) (hv : ¬ IsLive G s B v)
    {f : Sym2 V} (hf : f ∈ freeEdges G (insert s(u, v) M) B) :
    InRiskRegion G (riskVec G s (insert s(u, v) M) (insert f B)) := by
  have _ := hvalid
  have heM : s(u, v) ∉ M := by
    simp only [freeEdges, mem_sdiff, mem_union, not_or] at he
    exact he.2.1
  have hfB : f ∉ B := by
    simp only [freeEdges, mem_sdiff, mem_union, not_or] at hf
    exact hf.2.2
  refine inRiskRegion_mono hr (riskVec_nonneg G s (insert s(u, v) M) (insert f B)) (fun w => ?_)
  by_cases hw : IsLive G s (insert f B) w
  · have hwB : IsLive G s B w := by
      by_contra hnw
      exact not_isLive_mono hfB hnw hw
    have hwu : w ≠ u := fun h => hu (h ▸ hwB)
    have hwv : w ≠ v := fun h => hv (h ▸ hwB)
    have hwmem : w ∉ s(u, v) := by
      rw [Sym2.mem_iff]
      tauto
    simp only [riskVec, hw, hwB, makerDeg_insert heM w, hwmem, ↓reduceIte, add_zero]
    exact le_rfl
  · simp only [riskVec, hw, ↓reduceIte]
    exact riskVec_nonneg G s M B w

/-- Unified implementation of a virtual reply killing live endpoint `u` (covering both the
one-live-endpoint case and either branch of the two-live-endpoint case, including any extra
risk decrease if Breaker's actual edge `f` hits another live vertex). -/
lemma reply_kill_live_endpoint {G : SimpleGraph V} [DecidableRel G.Adj]
    {s : ℕ} {M B : Finset (Sym2 V)} {u v : V}
    (hvalid : ValidBoard G M B) (hr : InRiskRegion G (riskVec G s M B))
    (he : s(u, v) ∈ freeEdges G M B) (hu : IsLive G s B u)
    (hvirt : InRiskRegion G (virtualKillLeft (riskVec G s M B) u v)) :
    ∃ f ∈ freeEdges G (insert s(u, v) M) B,
      InRiskRegion G (riskVec G s (insert s(u, v) M) (insert f B)) := by
  obtain ⟨f, hf, huf⟩ := exists_free_edge_incident_of_live hvalid hr he (by simp : u ∈ s(u, v)) hu
  have heM : s(u, v) ∉ M := by
    simp only [freeEdges, mem_sdiff, mem_union, not_or] at he
    exact he.2.1
  have hfB : f ∉ B := by
    simp only [freeEdges, mem_sdiff, mem_union, not_or] at hf
    exact hf.2.2
  refine ⟨f, hf, inRiskRegion_mono hvirt
    (riskVec_nonneg G s (insert s(u, v) M) (insert f B)) (fun w => ?_)⟩
  by_cases hwu : w = u
  · subst hwu
    have hnu : ¬ IsLive G s (insert f B) w := not_isLive_insert_of_mem hfB huf
    simp [riskVec, virtualKillLeft, hnu]
  · by_cases hwv : w = v
    · subst hwv
      simp only [virtualKillLeft, hwu, ↓reduceIte]
      by_cases hw : IsLive G s (insert f B) w
      · have hwB : IsLive G s B w := by
          by_contra hnw
          exact not_isLive_mono hfB hnw hw
        have hmem : w ∈ s(u, w) := by simp
        simp only [riskVec, hw, hwB, makerDeg_insert heM w, hmem, ↓reduceIte]
        have hexp : ((makerDeg M w + 1 : ℕ) : ℤ) - ((s : ℤ) - 1) =
            ((makerDeg M w : ℤ) - ((s : ℤ) - 1)) + 1 := by omega
        rw [hexp, zpow_add_one₀ (by norm_num : (2 : ℝ) ≠ 0), mul_comm]
      · simp only [riskVec, hw, ↓reduceIte]
        exact mul_nonneg (by norm_num : (0 : ℝ) ≤ 2) (riskVec_nonneg G s M B w)
    · simp only [virtualKillLeft, hwu, hwv, ↓reduceIte]
      by_cases hw : IsLive G s (insert f B) w
      · have hwB : IsLive G s B w := by
          by_contra hnw
          exact not_isLive_mono hfB hnw hw
        have hwmem : w ∉ s(u, v) := by
          rw [Sym2.mem_iff]
          tauto
        simp only [riskVec, hw, hwB, makerDeg_insert heM w, hwmem, ↓reduceIte, add_zero]
        exact le_rfl
      · simp only [riskVec, hw, ↓reduceIte]
        exact riskVec_nonneg G s M B w

/-- Full Breaker response step across all cases (0, 1, or 2 live endpoints). -/
theorem exists_breaker_reply_preserving_risk {G : SimpleGraph V} [DecidableRel G.Adj]
    {s : ℕ} {M B : Finset (Sym2 V)} {e : Sym2 V}
    (hvalid : ValidBoard G M B) (hr : InRiskRegion G (riskVec G s M B))
    (he : e ∈ freeEdges G M B) (hne : (freeEdges G (insert e M) B).Nonempty) :
    ∃ f ∈ freeEdges G (insert e M) B,
      InRiskRegion G (riskVec G s (insert e M) (insert f B)) := by
  induction e using Sym2.ind with
  | _ u v =>
    have hadj : G.Adj u v := by
      have hmem : s(u, v) ∈ G.edgeFinset := (mem_sdiff.mp he).1
      exact SimpleGraph.mem_edgeFinset.mp hmem
    by_cases hu : IsLive G s B u
    · by_cases hv : IsLive G s B v
      · rcases inRiskRegion_edge_virtual_reply hr hadj with hL | hR
        · exact reply_kill_live_endpoint hvalid hr he hu hL
        · have he' : s(v, u) ∈ freeEdges G M B := by rwa [Sym2.eq_swap]
          have hR' : InRiskRegion G (virtualKillLeft (riskVec G s M B) v u) := hR
          simpa [Sym2.eq_swap] using reply_kill_live_endpoint hvalid hr he' hv hR'
      · have hvirt : InRiskRegion G (virtualKillLeft (riskVec G s M B) u v) := by
          refine inRiskRegion_mono hr (fun w => ?_) (fun w => ?_)
          · unfold virtualKillLeft
            split_ifs
            · exact le_rfl
            · exact mul_nonneg (by norm_num : (0 : ℝ) ≤ 2) (riskVec_nonneg G s M B v)
            · exact riskVec_nonneg G s M B w
          · unfold virtualKillLeft
            split_ifs with h1 h2
            · exact riskVec_nonneg G s M B w
            · subst h2
              simp [riskVec, hv]
            · exact le_rfl
        exact reply_kill_live_endpoint hvalid hr he hu hvirt
    · by_cases hv : IsLive G s B v
      · have he' : s(v, u) ∈ freeEdges G M B := by rwa [Sym2.eq_swap]
        have hvirt : InRiskRegion G (virtualKillLeft (riskVec G s M B) v u) := by
          refine inRiskRegion_mono hr (fun w => ?_) (fun w => ?_)
          · unfold virtualKillLeft
            split_ifs
            · exact le_rfl
            · exact mul_nonneg (by norm_num : (0 : ℝ) ≤ 2) (riskVec_nonneg G s M B u)
            · exact riskVec_nonneg G s M B w
          · unfold virtualKillLeft
            split_ifs with h1 h2
            · exact riskVec_nonneg G s M B w
            · subst h2
              simp [riskVec, hu]
            · exact le_rfl
        simpa [Sym2.eq_swap] using reply_kill_live_endpoint hvalid hr he' hv hvirt
      · obtain ⟨f, hf⟩ := hne
        exact ⟨f, hf, reply_neither_live hvalid hr he hu hv hf⟩

/-- Inductive game-tree win: if the invariant holds at a valid Maker-to-move position with
`k = #(freeEdges G M B)`, Breaker wins the immediate `s`-shutout game from that position. -/
theorem breakerWinsImmAux_of_inRiskRegion {G : SimpleGraph V} [DecidableRel G.Adj]
    {s : ℕ} :
    ∀ (k : ℕ) (M B : Finset (Sym2 V)),
      ValidBoard G M B →
      #(freeEdges G M B) = k →
      InRiskRegion G (riskVec G s M B) →
      BreakerWinsImmAux G s k true M B := by
  intro k
  induction k using Nat.strong_induction_on with
  | _ k ih =>
    intro M B hvalid hcard hr
    match k with
    | 0 =>
      exact not_hasShutout_of_inRiskRegion hvalid hr
    | 1 =>
      refine ⟨not_hasShutout_of_inRiskRegion hvalid hr, fun e he => ?_⟩
      exact not_hasShutout_after_maker_move hvalid hr he
    | m + 2 =>
      refine ⟨not_hasShutout_of_inRiskRegion hvalid hr, fun e he => ?_⟩
      have hno1 : ¬ HasShutout (V := V) s (insert e M) B :=
        not_hasShutout_after_maker_move hvalid hr he
      obtain ⟨hvalid1, hcard1⟩ := validBoard_insert_maker hvalid he
      have hcard1' : #(freeEdges G (insert e M) B) = m + 1 := by omega
      have hne : (freeEdges G (insert e M) B).Nonempty :=
        Finset.card_pos.mp (by omega)
      obtain ⟨f, hf, hr2⟩ := exists_breaker_reply_preserving_risk hvalid hr he hne
      obtain ⟨hvalid2, hcard2⟩ := validBoard_insert_breaker hvalid1 hf
      have hcard2' : #(freeEdges G (insert e M) (insert f B)) = m := by omega
      exact ⟨hno1, f, hf, ih m (by omega) (insert e M) (insert f B) hvalid2 hcard2' hr2⟩

/-- If the initial empty board lies in `ℛ(G)`, Breaker has a winning strategy in the
immediate `s`-shutout game on `G`. -/
theorem breakerWinsImmediate_of_inRiskRegion {G : SimpleGraph V} [DecidableRel G.Adj]
    {s : ℕ} (hr : InRiskRegion G (riskVec G s ∅ ∅)) :
    BreakerWinsImmediate G s := by
  exact breakerWinsImmAux_of_inRiskRegion #G.edgeFinset ∅ ∅ (validBoard_empty G)
    (by simp [freeEdges]) hr

end Conjectures.CiobaSavvasShutout
