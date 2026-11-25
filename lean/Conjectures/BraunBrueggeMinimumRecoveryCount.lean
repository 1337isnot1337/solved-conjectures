import Conjectures.BraunBrueggeMinimumRecovery

/-! An outside vertex produced by a flip has a unique unsplit pair. Specifying
which endpoint of that pair was flipped determines the original orientation. -/

open Set

namespace BraunBruegge

variable {V M : Type*} {G : SimpleGraph V}

namespace IndexedMatching

variable (m : IndexedMatching G M)

abbrev StrongOrientation := {d : M → Bool // (m.orient d).Strong}

abbrev InsideVertex (root : V) :=
  {p : (polar G root).extremePoints ℝ // ∃ d : M → Bool, p.val ∈ (m.orient d).MatchFace root}

abbrev OutsideVertex (root : V) :=
  {p : (polar G root).extremePoints ℝ // ¬∃ d : M → Bool, p.val ∈ (m.orient d).MatchFace root}

private theorem eq_of_ne_bool {a b : Bool} (h : a ≠ b) : a = !b := by
  cases a <;> cases b <;> simp_all

private theorem unsplit_iff {s : M ⊕ M} (q : m.RecoveryColor s) (i : M) :
    q.color (m.low i) = q.color (m.high i) ↔ i = endpointIndex s := by
  cases s with
  | inl j =>
    have hh : q.color (m.high i) = true := q.agrees (.inr i) (by simp)
    have hf : q.color (m.low j) = true := eq_of_ne_bool q.flips
    rw [hh]
    change _ ↔ i = j
    by_cases he : i = j
    · subst i
      simp [hf]
    · have hl : q.color (m.low i) = false := q.agrees (.inl i) (by simpa)
      simp [hl, he]
  | inr j =>
    have hl : q.color (m.low i) = false := q.agrees (.inl i) (by simp)
    have hf : q.color (m.high j) = false := eq_of_ne_bool q.flips
    rw [hl]
    change _ ↔ i = j
    by_cases he : i = j
    · subst i
      simp [hf]
    · have hh : q.color (m.high i) = true := q.agrees (.inr i) (by simpa)
      simp [hh, he]

private theorem unsplit_orient_iff (d : M → Bool) (b : V → Bool) (i : M) :
    b ((m.orient d).low i) = b ((m.orient d).high i) ↔ b (m.low i) = b (m.high i) := by
  cases he : d i
  · simpa [orient, low, high, swapEnds, he] using
      (eq_comm (a := b (m.endpoints (.inr i))) (b := b (m.endpoints (.inl i))))
  · simp [orient, low, high, swapEnds, he]

private theorem endpointIndex_swapEnds (d : M → Bool) (s : M ⊕ M) :
    endpointIndex (swapEnds d s) = endpointIndex s := by
  cases s with | inl i | inr i => cases he : d i <;> simp [swapEnds, he, endpointIndex]

private theorem endpoint_eq_of_side_and_index {s t : M ⊕ M}
    (hi : endpointIndex s = endpointIndex t) (hs : endpointSide s = endpointSide t) : s = t := by
  cases s <;> cases t <;> simp_all [endpointIndex, endpointSide]

private noncomputable def flipAt (v : V) (b : V → Bool) (w : V) : Bool := by
  classical
  exact if w = v then !b w else b w

private theorem flipAt_recovery (d : M → Bool) {s : M ⊕ M} (q : (m.orient d).RecoveryColor s)
    (i : M) : flipAt (m.endpoints (swapEnds d s)) q.color (m.low i) = !d i := by
  classical
  have h (t : M ⊕ M) : flipAt (m.endpoints (swapEnds d s)) q.color ((m.orient d).endpoints t) = endpointSide t := by
    by_cases hts : t = s
    · subst t
      have hf := eq_of_ne_bool q.flips
      change q.color (m.endpoints (swapEnds d s)) = !endpointSide s at hf
      change flipAt (m.endpoints (swapEnds d s)) q.color (m.endpoints (swapEnds d s)) = _
      simp [flipAt, hf]
    · have hn : (m.orient d).endpoints t ≠ m.endpoints (swapEnds d s) :=
        fun e => hts ((m.orient d).endpoints.injective e)
      exact (by simpa only [flipAt, hn, ite_false] using q.agrees t hts)
  cases he : d i
  · simpa [orient, swapEnds, he, low, endpointSide] using h (.inr i)
  · simpa [orient, swapEnds, he, low, endpointSide] using h (.inl i)

private theorem recovery_original_endpoint_eq {a b : M → Bool} {s t : M ⊕ M}
    (p : (m.orient a).RecoveryColor s) (q : (m.orient b).RecoveryColor t)
    (h : p.color = q.color) (he : endpointSide (swapEnds a s) = endpointSide (swapEnds b t)) :
    swapEnds a s = swapEnds b t := by
  apply endpoint_eq_of_side_and_index _ he
  rw [endpointIndex_swapEnds, endpointIndex_swapEnds]
  have hp := (m.orient a).unsplit_iff p (endpointIndex s)
  have hq := (m.orient b).unsplit_iff q (endpointIndex s)
  rw [m.unsplit_orient_iff a, h] at hp
  rw [m.unsplit_orient_iff b] at hq
  exact hq.mp (hp.mpr rfl)

private theorem recovery_orientation_eq {a b : M → Bool} {s t : M ⊕ M}
    (p : (m.orient a).RecoveryColor s) (q : (m.orient b).RecoveryColor t)
    (h : p.color = q.color) (he : swapEnds a s = swapEnds b t) : a = b := by
  funext i
  have hp := m.flipAt_recovery a p i
  have hq := m.flipAt_recovery b q i
  rw [h, he] at hp
  simpa using congrArg Bool.not (hp.symm.trans hq)

private theorem recovery_outside {d : M → Bool} {s : M ⊕ M} (q : (m.orient d).RecoveryColor s)
    (root : V) : ¬∃ a : M → Bool, binaryPotential root q.color ∈ (m.orient a).MatchFace root := by
  rintro ⟨a, ha⟩
  let i := endpointIndex s
  have hb := ((m.orient d).unsplit_iff q i).mpr rfl
  rw [m.unsplit_orient_iff d, ← m.unsplit_orient_iff a] at hb
  have h := (m.orient a).matchFace_tight ha i
  rw [binaryPotential_diff, hb, sub_self] at h
  norm_num at h

private theorem exists_indexed_recoveries [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) (hn : ¬G.IsBipartite) (hs : m.Strong) :
    ∃ s : Fin 2 ↪ M ⊕ M, ∀ k : Fin 2, Nonempty (m.RecoveryColor (s k)) := by
  obtain ⟨s, t, hst, hs₀, ht₀⟩ := m.exists_two_recovery_colors hm hG hn hs
  let f : Fin 2 ↪ M ⊕ M := ⟨![s, t], by
    intro i j e
    fin_cases i <;> fin_cases j
    · rfl
    · exact (hst e).elim
    · exact (hst e.symm).elim
    · rfl⟩
  exact ⟨f, by intro k; fin_cases k <;> first | exact hs₀ | exact ht₀⟩

theorem strongOrientations_le_outside [Fintype V] [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) (hn : ¬G.IsBipartite) (root : V) :
    Nat.card m.StrongOrientation ≤ Nat.card (m.OutsideVertex root) := by
  classical
  let : Finite ((polar G root).extremePoints ℝ) := finite_polar_vertices hG root
  have h (d : m.StrongOrientation) := (m.orient d.val).exists_indexed_recoveries hm hG hn d.property
  let s (d : m.StrongOrientation) := (h d).choose
  let q (d : m.StrongOrientation) (k : Fin 2) : (m.orient d.val).RecoveryColor (s d k) :=
    Classical.choice ((h d).choose_spec k)
  let f (dk : m.StrongOrientation × Fin 2) : m.OutsideVertex root × Bool :=
    let r := q dk.1 dk.2
    (⟨⟨binaryPotential root r.color, binaryPotential_vertex root r.color r.connected⟩, m.recovery_outside r root⟩,
      endpointSide (swapEnds dk.1.val (s dk.1 dk.2)))
  have hi : Function.Injective f := by
    rintro ⟨a, i⟩ ⟨b, j⟩ e
    have hf : binaryPotential root (q a i).color = binaryPotential root (q b j).color :=
      congrArg (fun z => z.1.val.val) e
    obtain ⟨v, hv⟩ := (q a i).connected.preconnected.exists_adj_of_nontrivial root
    have hcolor := binaryPotential_injective_of_nonconstant ⟨root, v, hv.2⟩ hf
    have hside : endpointSide (swapEnds a.val (s a i)) = endpointSide (swapEnds b.val (s b j)) :=
      congrArg Prod.snd e
    have he := m.recovery_original_endpoint_eq (q a i) (q b j) hcolor hside
    have hd : a = b := Subtype.ext (m.recovery_orientation_eq (q a i) (q b j) hcolor he)
    subst b
    have hj : i = j := (s a).injective ((swapEnds a.val).injective he)
    subst j
    rfl
  have hc := Nat.card_le_card_of_injective f hi
  rw [Nat.card_prod, Nat.card_prod, Nat.card_fin, show Nat.card Bool = 2 by simp] at hc
  omega

end IndexedMatching
end BraunBruegge
