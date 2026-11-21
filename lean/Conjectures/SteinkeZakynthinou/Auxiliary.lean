module

public import Conjectures.SteinkeZakynthinou.Locality
public import Conjectures.SteinkeZakynthinou.Channel
public import Mathlib.Data.Fintype.Option

/-! Augmenting a sampled cut by its abstract terminal tree position. -/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

noncomputable def cutEquiv {n : ℕ} (z : Sample n) : Fin (n + 1) ≃ Option (Fin n) :=
  finSuccEquivLast.trans (Equiv.optionCongr (sortedRows z Fin.val Fin.val_injective))

theorem cutEquiv_apply {n : ℕ} (z : Sample n) (i : Fin (n + 1)) :
    cutEquiv z i = cutAt z Fin.val Fin.val_injective i := by
  cases h : finSuccEquivLast i <;> simp [cutEquiv, cutAt, h]

def foldEquiv (n : ℕ) : Fin (cycleSize n) ≃ Fin (n + 1) × Bool where
  toFun i := (foldRank n i, orientation n i)
  invFun r := unfoldRank n r.1 r.2
  left_inv := unfoldRank_foldRank n
  right_inv r := Prod.ext (foldRank_unfoldRank n r.1 r.2) (orientation_unfoldRank n r.1 r.2)

abbrev LocalCut (n : ℕ) := Option (Fin n) × Bool

noncomputable def localCutEquiv {n : ℕ} (z : Sample n) : Fin (cycleSize n) ≃ LocalCut n :=
  (foldEquiv n).trans (Equiv.prodCongr (cutEquiv z) (Equiv.refl Bool))

def drawPosition {n : ℕ} (d : Draw n) : Fin (cycleSize n) :=
  cycleIndex n ((sampleTree n).position d.2) + d.1

noncomputable def localDrawCode {n : ℕ} (z : Sample n) :
    Draw n ≃ LocalCut n × (sampleTree n).Path where
  toFun d := (localCutEquiv z (drawPosition d), d.2)
  invFun v := ((localCutEquiv z).symm v.1 - cycleIndex n ((sampleTree n).position v.2), v.2)
  left_inv d := by
    apply Prod.ext
    · simp [drawPosition]
    · rfl
  right_inv v := by
    apply Prod.ext
    · have h : cycleIndex n ((sampleTree n).position v.2) +
          ((localCutEquiv z).symm v.1 - cycleIndex n ((sampleTree n).position v.2)) =
          (localCutEquiv z).symm v.1 := by abel
      change localCutEquiv z (cycleIndex n ((sampleTree n).position v.2) +
        ((localCutEquiv z).symm v.1 - cycleIndex n ((sampleTree n).position v.2))) = v.1
      rw [h, Equiv.apply_symm_apply]
    · rfl

abbrev AuxCode (n : ℕ) := (Option (Slot n) × Bool) × (sampleTree n).Path

noncomputable def auxCode {n : ℕ} (z : Sample n) (s : Selector n) (d : Draw n) : AuxCode n :=
  let v := localDrawCode z d
  ((v.1.1.map (selectedSlot s), v.1.2), v.2)

theorem auxCode_injective {n : ℕ} (z : Sample n) (s : Selector n) :
    Function.Injective (auxCode z s) := by
  intro d e he
  apply (localDrawCode z).injective
  have hsel : Function.Injective (selectedSlot s) := fun _ _ h => congrArg Prod.fst h
  have ho : Function.Injective (Option.map (selectedSlot s)) := by
    intro x y h
    cases x <;> cases y <;> simp_all [hsel.eq_iff]
  exact Prod.ext
    (Prod.ext (ho (congrArg (fun x : AuxCode n => x.1.1) he))
      (congrArg (fun x : AuxCode n => x.1.2) he))
    (congrArg (fun x : AuxCode n => x.2) he)

noncomputable def auxMass {n : ℕ} (T : Pool n) (s : Selector n) (a : AuxCode n) : ℝ := by
  classical
  exact ∑ d : Draw n, if auxCode (select T s) s d = a then drawWeight (select T s) d else 0

theorem auxMass_nonneg {n : ℕ} (T : Pool n) (s : Selector n) (a : AuxCode n) :
    0 ≤ auxMass T s a := by
  unfold auxMass
  exact Finset.sum_nonneg fun d _ => by
    split
    · exact drawWeight_nonneg _ _
    · exact le_rfl

theorem auxMass_at_code {n : ℕ} (T : Pool n) (s : Selector n) (d : Draw n) :
    auxMass T s (auxCode (select T s) s d) = drawWeight (select T s) d := by
  classical
  unfold auxMass
  simp only [(auxCode_injective _ _).eq_iff, Finset.sum_ite_eq', Finset.mem_univ, ite_true]

theorem auxMass_eq_zero_of_not_mem_range {n : ℕ} (T : Pool n) (s : Selector n) (a : AuxCode n)
    (h : a ∉ Set.range (auxCode (select T s) s)) : auxMass T s a = 0 := by
  unfold auxMass
  exact Finset.sum_eq_zero fun d _ => ite_eq_right (fun he => h ⟨d, he⟩)

theorem sum_auxMass {n : ℕ} (T : Pool n) (s : Selector n) : ∑ a, auxMass T s a = 1 := by
  classical
  unfold auxMass
  rw [Finset.sum_comm]
  simp only [Finset.sum_ite_eq, Finset.mem_univ, ite_true, sum_drawWeight]

theorem auxCode_at_draw {n : ℕ} (z : Sample n) (s : Selector n) (d : Draw n) :
    auxCode z s d =
      (((cutAt z Fin.val Fin.val_injective (foldRank n (drawPosition d))).map (selectedSlot s),
        orientation n (drawPosition d)), d.2) := by
  simp [auxCode, localDrawCode, localCutEquiv, foldEquiv, cutEquiv_apply]

theorem draw_shift_eq {n : ℕ} (d : Draw n) :
    d.1 = drawPosition d - cycleIndex n ((sampleTree n).position d.2) := by
  unfold drawPosition
  abel

theorem branchCut_drawPosition_eq {n : ℕ} (T : Pool n) (s : Selector n) (i : Fin n)
    (b : Bool) (d : Draw n) :
    branchCut T s i b (drawPosition d) =
      cutAt (branchSample T s i b) Fin.val Fin.val_injective (foldRank n (drawPosition d)) := by
  unfold branchCut cutAt
  rw [sortedRows_selectedTag_eq]

/-- A common code has the same oriented anchor in the augmented union. -/
theorem shared_code_anchor {n : ℕ} (T : Pool n) (s : Selector n) (i : Fin n) (d₀ d₁ : Draw n)
    (h : auxCode (branchSample T s i false) (branchSelector s i false) d₀ =
      auxCode (branchSample T s i true) (branchSelector s i true) d₁) :
    branchFoldEmbedding T s i false (drawPosition d₀) =
      branchFoldEmbedding T s i true (drawPosition d₁) := by
  have ho : orientation n (drawPosition d₀) = orientation n (drawPosition d₁) := by
    rw [auxCode_at_draw, auxCode_at_draw] at h
    exact congrArg (fun x : AuxCode n => x.1.2) h
  have hk : (branchCut T s i false (drawPosition d₀)).map (selectedSlot (branchSelector s i false)) =
      (branchCut T s i true (drawPosition d₁)).map (selectedSlot (branchSelector s i true)) := by
    rw [auxCode_at_draw, auxCode_at_draw] at h
    rw [branchCut_drawPosition_eq, branchCut_drawPosition_eq]
    exact congrArg (fun x : AuxCode n => x.1.1) h
  have he : (branchCut T s i false (drawPosition d₀)).map (replacementRow i false) =
      (branchCut T s i true (drawPosition d₁)).map (replacementRow i true) := by
    cases h₀ : branchCut T s i false (drawPosition d₀) with
    | none =>
      cases h₁ : branchCut T s i true (drawPosition d₁) <;> simp_all
    | some j =>
      cases h₁ : branchCut T s i true (drawPosition d₁) with
      | none => simp [h₀, h₁] at hk
      | some k =>
        simp only [h₀, h₁, Option.map_some, Option.some.injEq] at hk ⊢
        apply (unionSlot_injective s i)
        rw [unionSlot_replacementRow, unionSlot_replacementRow]
        exact hk
  apply (foldEquiv (n + 1)).injective
  apply Prod.ext
  · let u := unionSample T s i
    let tag := unionTag s i
    have hcut : Function.Injective (cutAt u tag (unionTag_injective s i)) := by
      exact ((finSuccEquivLast.trans (Equiv.optionCongr (sortedRows u tag (unionTag_injective s i))))).injective
    apply hcut
    rw [show cutAt u tag (unionTag_injective s i) ((foldEquiv (n + 1))
        (branchFoldEmbedding T s i false (drawPosition d₀))).1 =
        (branchCut T s i false (drawPosition d₀)).map (replacementRow i false) from
          branchFoldEmbedding_cutAt T s i false _]
    exact he.trans (branchFoldEmbedding_cutAt T s i true _).symm
  · change orientation (n + 1) (branchFoldEmbedding T s i false (drawPosition d₀)) =
      orientation (n + 1) (branchFoldEmbedding T s i true (drawPosition d₁))
    rw [branchFoldEmbedding, branchFoldEmbedding, orientation_foldedEmbedding,
      orientation_foldedEmbedding]
    exact ho

/-- Every code anchored off the changed row also occurs on the other sample. -/
theorem code_mem_other_of_ne {n : ℕ} (T : Pool n) (s : Selector n) (i : Fin n) (b : Bool)
    (d : Draw n)
    (h : (localDrawCode (branchSample T s i b) d).1.1 ≠ some i) :
    auxCode (branchSample T s i b) (branchSelector s i b) d ∈
      Set.range (auxCode (branchSample T s i (!b)) (branchSelector s i (!b))) := by
  let v := localDrawCode (branchSample T s i b) d
  let e := (localDrawCode (branchSample T s i (!b))).symm v
  use e
  simp only [auxCode, e, Equiv.apply_symm_apply]
  have hsame : v.1.1.map (selectedSlot (branchSelector s i (!b))) =
      v.1.1.map (selectedSlot (branchSelector s i b)) := by
    cases hv : v.1.1 with
    | none => rfl
    | some j =>
      have hj : j ≠ i := by
        intro hi
        apply h
        change v.1.1 = some i
        rw [hv, hi]
      simp [selectedSlot, branchSelector, Function.update, hj]
  exact Prod.ext (Prod.ext hsame rfl) rfl

end SteinkeZakynthinou
