import Conjectures.BraunBrueggeMinimumBipartite
import Mathlib.Data.Fintype.BigOperators
import Mathlib.SetTheory.Cardinal.Finite

/-! Exact normalized polar-vertex count for the actual complete bipartite
graph, with one vertex of the left part fixed at zero. -/

namespace BraunBruegge

variable {L R : Type*} [Fintype L] [Fintype R] [Nonempty R]

private abbrev complete := completeBipartiteGraph L R

omit [Fintype L] [Fintype R] [Nonempty R] in
private theorem cross_edge (l : L) (r : R) : (complete (L := L) (R := R)).Adj (.inl l) (.inr r) := by
  simp [complete, completeBipartiteGraph]

omit [Fintype L] [Fintype R] in
theorem complete_bipartite_connected (root : L) : (completeBipartiteGraph L R).Connected := by
  obtain ⟨r⟩ := (inferInstance : Nonempty R)
  have ha (x : L ⊕ R) : (complete (L := L) (R := R)).Reachable (.inl root) x := by
    cases x with
    | inl l => exact (cross_edge root r).reachable.trans (cross_edge l r).reachable.symm
    | inr s => exact (cross_edge root s).reachable
  have : Nonempty (L ⊕ R) := ⟨.inl root⟩
  exact { preconnected := fun u v => (ha u).symm.trans (ha v) }

private theorem complete_extreme_iff (root : L) (f : L ⊕ R → ℝ) :
    f ∈ (polar complete (.inl root)).extremePoints ℝ ↔
      f (.inl root) = 0 ∧ ∀ l : L, ∀ r : R, |f (.inl l) - f (.inr r)| = 1 := by
  constructor
  · intro h
    have he := tightGraph_eq_of_bipartition Sum.isLeft (f := f) (by
      intro u v h
      cases u <;> cases v <;> simp [complete, completeBipartiteGraph] at h ⊢) h
    refine ⟨h.1.1, fun l r => ?_⟩
    have ht : (tightGraph complete f).Adj (.inl l) (.inr r) := he.symm ▸ cross_edge l r
    exact ht.2
  · rintro ⟨h0, h⟩
    have ht : tightGraph complete f = complete := by
      ext u v
      constructor
      · exact fun he => he.1
      · intro he
        refine ⟨he, ?_⟩
        cases u <;> cases v <;> simp [complete, completeBipartiteGraph] at he
        · exact h _ _
        · rw [abs_sub_comm]
          exact h _ _
    apply mem_extreme_polar_iff.mpr
    refine ⟨⟨h0, ?_⟩, ht.symm ▸ complete_bipartite_connected root⟩
    intro u v huv
    have h' : (tightGraph complete f).Adj u v := ht.symm ▸ huv
    exact h'.2.le

private def mixed {R : Type*} (b : R → Bool) : Prop :=
  ∃ r₀, b r₀ = false ∧ ∃ r₁, b r₁ = true

private theorem flags_eq_of_not_mixed {R : Type*} {b : R → Bool} (h : ¬mixed b) (r s : R) : b r = b s := by
  cases hr : b r <;> cases hs : b s
  · rfl
  · exact (h ⟨r, hr, s, hs⟩).elim
  · exact (h ⟨s, hs, r, hr⟩).elim
  · rfl

private noncomputable def sign (b : Bool) : ℝ := if b then 1 else -1

private theorem sign_injective : Function.Injective sign := by
  intro x y h
  cases x <;> cases y <;> first | rfl | norm_num [sign] at h

private theorem sign_ne_zero (b : Bool) : sign b ≠ 0 := by cases b <;> norm_num [sign]

private theorem eq_sign_of_abs_eq {x : ℝ} (hx : |x| = 1) : x = sign (decide (0 < x)) := by
  by_cases hp : 0 < x
  · rw [abs_of_pos hp] at hx
    simp [sign, hx]
  · rw [abs_of_nonpos (le_of_not_gt hp)] at hx
    simp [sign, hp]
    linarith

private abbrev Parameters (L R : Type*) := (L → Bool) ⊕ {b : R → Bool // mixed b}

private noncomputable def label [DecidableEq L] (root : L) (p : Parameters L R) : L ⊕ R → ℝ :=
  match p with
  | .inl b => Sum.elim (fun l => if l ≠ root ∧ b l then 2 * sign (b root) else 0) (fun _ => sign (b root))
  | .inr b => Sum.elim (fun _ => 0) (fun r => sign (b.val r))

private theorem label_extreme [DecidableEq L] (root : L) (p : Parameters L R) :
    label root p ∈ (polar complete (.inl root)).extremePoints ℝ := by
  apply (complete_extreme_iff root _).mpr
  cases p with
  | inl b =>
    refine ⟨by simp [label], ?_⟩
    intro l r
    by_cases h : l ≠ root ∧ b l
    · cases he : b root <;> norm_num [label, h, he, sign]
    · cases he : b root <;> norm_num [label, h, he, sign]
  | inr b =>
    refine ⟨rfl, fun l r => ?_⟩
    cases he : b.val r <;> norm_num [label, he, sign]

omit [Fintype L] [Fintype R] in
private theorem label_injective [DecidableEq L] (root : L) : Function.Injective (label (R := R) root) := by
  obtain ⟨r⟩ := (inferInstance : Nonempty R)
  have impossible {b : L → Bool} {c : {x : R → Bool // mixed x}}
      (h : label root (.inl b) = label root (.inr c)) : False := by
    obtain ⟨r₀, h₀, r₁, h₁⟩ := c.property
    have e (s : R) : b root = c.val s := sign_injective (congrFun h (.inr s))
    have h0 := e r₀
    have h1 := e r₁
    simp only [h₀, h₁] at h0 h1
    rw [h0] at h1
    contradiction
  rintro (b | b) (c | c) h
  · have hh : b root = c root := sign_injective (congrFun h (.inr r))
    congr 1
    funext l
    by_cases hl : l = root
    · simpa [hl] using hh
    · have he : (if b l then 2 * sign (c root) else 0) =
          (if c l then 2 * sign (c root) else 0) := by
        simpa [label, hl, hh] using congrFun h (.inl l)
      cases hb : b l <;> cases hc : c l <;> simp [hb, hc, sign_ne_zero] at he ⊢
  · exact (impossible h).elim
  · exact (impossible h.symm).elim
  · apply congrArg Sum.inr
    apply Subtype.ext
    funext r
    exact sign_injective (congrFun h (.inr r))

private theorem label_surjective [DecidableEq L] (root : L) (f : L ⊕ R → ℝ)
    (hf : f ∈ (polar complete (.inl root)).extremePoints ℝ) :
    ∃ p : Parameters L R, label root p = f := by
  obtain ⟨r⟩ := (inferInstance : Nonempty R)
  obtain ⟨hroot, hcross⟩ := (complete_extreme_iff root f).mp hf
  let b (s : R) : Bool := decide (0 < f (.inr s))
  have hr (s : R) : f (.inr s) = sign (b s) := by
    have he := hcross root s
    rw [hroot, zero_sub, abs_neg] at he
    exact eq_sign_of_abs_eq he
  by_cases hm : mixed b
  · refine ⟨.inr ⟨b, hm⟩, ?_⟩
    obtain ⟨r₀, h₀, r₁, h₁⟩ := hm
    funext v
    cases v with
    | inr s => exact (hr s).symm
    | inl l =>
      have h0 := hcross l r₀
      have h1 := hcross l r₁
      rw [hr r₀, h₀] at h0
      rw [hr r₁, h₁] at h1
      simp only [sign, Bool.false_eq_true, ite_false, ite_true] at h0 h1
      change 0 = f (.inl l)
      linarith [(abs_le.mp h0.le).2, (abs_le.mp h1.le).1]
  · let c (l : L) : Bool := if l = root then b r else decide (f (.inl l) ≠ 0)
    have hc : c root = b r := by simp [c]
    refine ⟨.inl c, ?_⟩
    funext v
    cases v with
    | inr s =>
      change sign (c root) = f (.inr s)
      rw [hc, hr, flags_eq_of_not_mixed hm s r]
    | inl l =>
      by_cases hl : l = root
      · simp [label, hl, hroot]
      · have hx := hcross l r
        rw [hr] at hx
        have he : f (.inl l) = 0 ∨ f (.inl l) = 2 * sign (b r) := by
          have hh : f (.inl l) - sign (b r) = 1 ∨ f (.inl l) - sign (b r) = -1 := by
            by_cases h : 0 ≤ f (.inl l) - sign (b r)
            · left; rwa [abs_of_nonneg h] at hx
            · right; rw [abs_of_neg (lt_of_not_ge h)] at hx; linarith
          cases hb : b r <;> simp [hb, sign] at hh ⊢ <;>
            rcases hh with h | h <;> first | (left; linarith) | (right; linarith)
        rcases he with h0 | h2
        · simp [label, c, hl, h0]
        · simp [label, c, hl, h2, sign_ne_zero]

private noncomputable def constantFlagsEquiv (r : R) : {b : R → Bool // ¬mixed b} ≃ Bool where
  toFun b := b.val r
  invFun b := ⟨fun _ => b, by rintro ⟨_, h₀, _, h₁⟩; rw [h₀] at h₁; contradiction⟩
  left_inv b := Subtype.ext (funext fun s => flags_eq_of_not_mixed b.property r s)
  right_inv _ := rfl

private theorem card_mixed_add_two : Nat.card {b : R → Bool // mixed b} + 2 = 2 ^ Fintype.card R := by
  classical
  obtain ⟨r⟩ := (inferInstance : Nonempty R)
  have h := Nat.card_congr ((Equiv.sumCompl (mixed (R := R))).symm.trans
    (Equiv.sumCongr (Equiv.refl _) (constantFlagsEquiv r)))
  simpa [Nat.card_sum, Nat.card_eq_fintype_card, Fintype.card_fun] using h.symm

theorem finite_complete_bipartite_polar_vertices (root : L) :
    Finite ((polar (completeBipartiteGraph L R) (.inl root)).extremePoints ℝ) := by
  classical
  let f (p : Parameters L R) : ((polar complete (.inl root)).extremePoints ℝ) := ⟨label root p, label_extreme root p⟩
  exact Finite.of_surjective f fun q => by
    obtain ⟨p, hp⟩ := label_surjective root q.val q.property
    exact ⟨p, Subtype.ext hp⟩

/-- The complete bipartite polar has exactly `2^a + 2^b - 2` vertices. -/
theorem card_complete_bipartite_polar_vertices (root : L) :
    Nat.card ((polar (completeBipartiteGraph L R) (.inl root)).extremePoints ℝ) =
      2 ^ Fintype.card L + 2 ^ Fintype.card R - 2 := by
  classical
  let f (p : Parameters L R) : ((polar complete (.inl root)).extremePoints ℝ) := ⟨label root p, label_extreme root p⟩
  have hf : Function.Bijective f := by
    refine ⟨fun _ _ h => label_injective root (congrArg Subtype.val h), ?_⟩
    intro q
    obtain ⟨p, hp⟩ := label_surjective root q.val q.property
    exact ⟨p, Subtype.ext hp⟩
  rw [← Nat.card_congr (Equiv.ofBijective f hf)]
  change Nat.card ((L → Bool) ⊕ {b : R → Bool // mixed b}) = _
  rw [Nat.card_sum]
  have h := card_mixed_add_two (R := R)
  have hL : Nat.card (L → Bool) = 2 ^ Fintype.card L := by simp [Nat.card_eq_fintype_card]
  omega

end BraunBruegge
