module

public import Conjectures.SteinkeZakynthinou.Auxiliary
public import Conjectures.SteinkeZakynthinou.Pool

/-! Measuring how much of a path can change when one selected row is replaced. -/

@[expose] public section

open MeasureTheory
open scoped BigOperators

namespace SteinkeZakynthinou

def windowHasRow {n : ℕ} (z : Sample n) (θ : Fin (cycleSize n)) (i : Fin n) (t : Tree) : Prop :=
  ∃ q : t.Path, cutAt z Fin.val Fin.val_injective (shiftedRank n θ (t.position q)) = some i

noncomputable instance {n : ℕ} (z : Sample n) (θ : Fin (cycleSize n)) (i : Fin n) (t : Tree) :
    Decidable (windowHasRow z θ i t) := Classical.propDecidable _

noncomputable def ownDepths {n : ℕ} (z : Sample n) (d : Draw n) (i : Fin n) : Finset ℕ :=
  (sampleTree n).activeDepths d.2 (windowHasRow z d.1 i)

noncomputable def drawCharge {n : ℕ} (z : Sample n) (d : Draw n) (i : Fin n) : ℝ := by
  classical
  exact drawWeight z d *
    ((if (localDrawCode z d).1.1 = some i then Real.log 2 / 2 else 0) +
      1 / (n : ℝ) * ∑ j ∈ ownDepths z d i, ((4 / 3 : ℝ) ^ j)^2)

noncomputable def ownCharge {n : ℕ} (z : Sample n) (i : Fin n) : ℝ :=
  ∑ d : Draw n, drawCharge z d i

theorem drawCharge_nonneg {n : ℕ} (z : Sample n) (d : Draw n) (i : Fin n) :
    0 ≤ drawCharge z d i := by
  unfold drawCharge
  have hl : 0 ≤ Real.log 2 := Real.log_nonneg (by norm_num)
  exact mul_nonneg (drawWeight_nonneg _ _) (add_nonneg (by split <;> positivity)
    (mul_nonneg (by positivity) (Finset.sum_nonneg fun _ _ => sq_nonneg _)))

theorem sampleTree_span_bounds {n : ℕ} (p : (sampleTree n).Path) (j : ℕ)
    (hj : j < ((sampleTree n).spans p).length) :
    ∃ b k, ((sampleTree n).spans p)[j] = Tree.balanced b k ∧
      0 < k ∧ 2^j * k ≤ 2 * n + 1 ∧ b + k < cycleSize n ∧
      b ≤ (sampleTree n).position p ∧ (sampleTree n).position p ≤ b + k := by
  obtain ⟨b,k,hbk,hk,hs⟩ := Tree.spans_balanced 0 (2 * n + 1) p j hj
  have hmem : Tree.balanced b k ∈ (sampleTree n).spans p := hbk ▸ List.getElem_mem hj
  obtain ⟨last, hl⟩ := Tree.balanced_position_surj b k (b+k) (Nat.le_add_right _ _) le_rfl
  obtain ⟨path, hpath⟩ := (sampleTree n).span_position_mem p _ hmem last
  have hmax : (sampleTree n).position path ≤ 2 * n + 1 :=
    (Tree.balanced_position_bounds 0 (2 * n + 1) path).2.trans (by omega)
  obtain ⟨r, hr⟩ := (sampleTree n).position_mem_span p _ hmem
  have hp := Tree.balanced_position_bounds b k r
  rw [hr] at hp
  rw [hl] at hpath
  exact ⟨b,k,hbk,hk,hs,(show b+k < 2*n+1+1 by omega),hp.1,hp.2⟩

theorem internal_power_two_le {n : ℕ} (hn : 0 < n) (p : (sampleTree n).Path)
    (j : ℕ) (hj : j < ((sampleTree n).spans p).length) : 2^j ≤ 4 * n := by
  obtain ⟨b,k,_,hk,h,_,_,_⟩ := sampleTree_span_bounds p j hj
  exact (Nat.le_mul_of_pos_right _ hk).trans (h.trans (by omega))

private theorem gap_eq_of_no_active_window {n : ℕ} (T : Pool n) (s : Selector n) (i : Fin n)
    (θ₀ θ₁ : Fin (cycleSize n)) (p : (sampleTree n).Path)
    (hcode : auxCode (branchSample T s i false) (branchSelector s i false) (θ₀,p) =
      auxCode (branchSample T s i true) (branchSelector s i true) (θ₁,p))
    (j : ℕ) (hj : j < ((sampleTree n).spans p).length)
    (h : ¬ (windowHasRow (branchSample T s i false) θ₀ i ((sampleTree n).spans p)[j] ∨
          windowHasRow (branchSample T s i true) θ₁ i ((sampleTree n).spans p)[j])) :
    (((sampleTree n).spans p)[j]).gap
      (shiftedCost (branchSample T s i false) Fin.val Fin.val_injective θ₀) =
    (((sampleTree n).spans p)[j]).gap
      (shiftedCost (branchSample T s i true) Fin.val Fin.val_injective θ₁) := by
  let path := (sampleTree n).position p
  let p' := cycleIndex n path
  let a₀ := drawPosition (θ₀,p)
  let a₁ := drawPosition (θ₁,p)
  have ha := shared_code_anchor T s i (θ₀,p) (θ₁,p) hcode
  have hθ₀ : θ₀ = a₀ - p' := draw_shift_eq (θ₀,p)
  have hθ₁ : θ₁ = a₁ - p' := draw_shift_eq (θ₁,p)
  obtain ⟨l,k,hw,_,_,hlu,hl,hu⟩ := sampleTree_span_bounds p j hj
  let l' : Fin (cycleSize n) := ⟨l, (Nat.le_add_right _ _).trans_lt hlu⟩
  let u' : Fin (cycleSize n) := ⟨l+k, hlu⟩
  have hpR : path < cycleSize n := lt_of_le_of_lt hu hlu
  have hp' : p'.val = path := Nat.mod_eq_of_lt hpR
  have hwin (b : Bool) (θ a : Fin (cycleSize n)) (hθ : θ = a - p')
      (hn : ¬ windowHasRow (branchSample T s i b) θ i ((sampleTree n).spans p)[j]) :
      ∀ r, l' ≤ r → r ≤ u' → branchCut T s i b (a + (r - p')) ≠ some i := by
    intro r hrl hru he
    obtain ⟨q,hq⟩ := Tree.balanced_position_surj l k r.val hrl hru
    apply hn
    rw [hw]
    use q
    rw [hq, hθ, shiftedCut_eq_branchCut, cycleIndex_val]
    exact he
  obtain ⟨c,hc⟩ := shiftedCost_eq_add_on_inactive T s i a₀ a₁ p' l' u'
    (by change l ≤ p'.val; rw [hp']; exact hl)
    (by change p'.val ≤ l+k; rw [hp']; exact hu) ha
    (hwin false θ₀ a₀ hθ₀ (fun hh => h (Or.inl hh)))
    (hwin true θ₁ a₁ hθ₁ (fun hh => h (Or.inr hh)))
  apply Tree.gap_eq_of_leaf_eq_add _ _ _ c
  rw [hw]
  intro q
  have hq := Tree.balanced_position_bounds l k q
  let r : Fin (cycleSize n) := ⟨_, hq.2.trans_lt hlu⟩
  exact hθ₀.symm ▸ hθ₁.symm ▸ hc r hq.1 hq.2

theorem shared_draw_log_le {n : ℕ} (hn : 0 < n) (T : Pool n) (s : Selector n) (i : Fin n)
    (θ₀ θ₁ : Fin (cycleSize n)) (p : (sampleTree n).Path)
    (h : auxCode (branchSample T s i false) (branchSelector s i false) (θ₀,p) =
      auxCode (branchSample T s i true) (branchSelector s i true) (θ₁,p)) :
    |Real.log (drawWeight (branchSample T s i false) (θ₀,p)) -
      Real.log (drawWeight (branchSample T s i true) (θ₁,p))| ≤
      (∑ j ∈ ownDepths (branchSample T s i false) (θ₀,p) i ∪
        ownDepths (branchSample T s i true) (θ₁,p) i, (4 / 3 : ℝ)^j) /
          (32 * Real.sqrt n) := by
  classical
  let z₀ := branchSample T s i false
  let z₁ := branchSample T s i true
  let c := shiftedCost z₀ Fin.val Fin.val_injective θ₀
  let d := shiftedCost z₁ Fin.val Fin.val_injective θ₁
  let active := fun q => windowHasRow z₀ θ₀ i q ∨ windowHasRow z₁ θ₁ i q
  have he : (sampleTree n).activeDepths p active =
      ownDepths z₀ (θ₀,p) i ∪ ownDepths z₁ (θ₁,p) i := by
    ext j
    simp only [Tree.mem_activeDepths, ownDepths, Finset.mem_union, active]
    exact exists_or
  rw [← he]
  have hh (j : ℕ) : |c j - d j| ≤ 3 := by
    have hh := abs_cost_difference_le T s i (drawPosition (θ₀,p)) (drawPosition (θ₁,p))
      (cycleIndex n ((sampleTree n).position p)) (shared_code_anchor T s i _ _ h) j
    rwa [← draw_shift_eq (θ₀,p), ← draw_shift_eq (θ₁,p)] at hh
  have hgap (j : ℕ) (hj : j < ((sampleTree n).spans p).length) :
      |(((sampleTree n).spans p)[j]).gap c - (((sampleTree n).spans p)[j]).gap d| ≤ 8 :=
    ((Tree.abs_gap_sub_le_of_leaf_le _ _ _ (by norm_num : (0 : ℝ) ≤ 3)
      (fun q => hh _))).trans (by norm_num)
  have hlog := (sampleTree n).abs_log_probability_sub_le c d hn p active hgap
    (fun j hj h₀ => gap_eq_of_no_active_window T s i θ₀ θ₁ p h j hj h₀)
  have hM : (cycleSize n : ℝ) ≠ 0 := by positivity
  unfold drawWeight
  rw [Real.log_div ((sampleTree n).probability_pos _ _ _ _).ne' hM,
    Real.log_div ((sampleTree n).probability_pos _ _ _ _).ne' hM]
  convert hlog using 1
  congr 1
  ring

end SteinkeZakynthinou
