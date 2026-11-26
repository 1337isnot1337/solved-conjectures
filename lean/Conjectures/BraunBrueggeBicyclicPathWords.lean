import Conjectures.BraunBrueggeBicyclicSigns

/-! A unit step word of a prescribed total either has all signs or has a
single zero at a specified position. These two types have uniform counts. -/

open Finset

namespace BraunBruegge

variable {m : ℕ} {r : ℤ}

@[ext]
structure UnitStepWord (m : ℕ) (r : ℤ) where
  step : Fin m → ℤ
  bound : ∀ i, |step i| ≤ 1
  total : ∑ i, step i = r
  one_slack : ∀ i j, step i = 0 → step j = 0 → i = j

def UnitStepWord.Full (w : UnitStepWord m r) : Prop := ∀ i, w.step i ≠ 0

abbrev TraceWithGap (m : ℕ) (r : ℤ) := Σ i : Fin m, SignsWithTotal {j : Fin m // j ≠ i} r

private def fullOfSigns (b : SignsWithTotal (Fin m) r) : UnitStepWord m r :=
  ⟨fun i => stepSign (b.val i), fun _ => (abs_stepSign _).le, b.property,
    fun i _ hz _ => (stepSign_ne_zero (b.val i) hz).elim⟩

noncomputable def fullWordEquiv (m : ℕ) (r : ℤ) :
    SignsWithTotal (Fin m) r ≃ {w : UnitStepWord m r // w.Full} := by
  let f (b : SignsWithTotal (Fin m) r) : {w : UnitStepWord m r // w.Full} :=
    ⟨fullOfSigns b, fun _ => stepSign_ne_zero _⟩
  apply Equiv.ofBijective f
  constructor
  · intro a b he
    apply Subtype.ext
    funext i
    exact stepSign_injective (congrArg (fun w => w.val.step i) he)
  · intro w
    let b (i : Fin m) : Bool := decide (w.val.step i = 1)
    have hb (i : Fin m) : stepSign (b i) = w.val.step i :=
      stepSign_test_of_unit_of_ne_zero (w.val.bound i) (w.property i)
    let s : SignsWithTotal (Fin m) r := ⟨b, by simp_rw [hb]; exact w.val.total⟩
    exact ⟨s, Subtype.ext (UnitStepWord.ext (funext hb))⟩

private def stepOfGap (b : TraceWithGap m r) (i : Fin m) : ℤ :=
  if h : i = b.1 then 0 else stepSign (b.2.val ⟨i, h⟩)

@[simp] private theorem stepOfGap_zero (b : TraceWithGap m r) : stepOfGap b b.1 = 0 := by
  simp [stepOfGap]

private theorem stepOfGap_eq (b : TraceWithGap m r) (i : {i : Fin m // i ≠ b.1}) :
    stepOfGap b i.val = stepSign (b.2.val i) := by simp [stepOfGap, i.property]

private theorem stepOfGap_zero_iff (b : TraceWithGap m r) (i : Fin m) : stepOfGap b i = 0 ↔ i = b.1 := by
  by_cases h : i = b.1 <;> simp [stepOfGap, h]

private def wordOfGap (b : TraceWithGap m r) : UnitStepWord m r where
  step := stepOfGap b
  bound i := by
    by_cases h : i = b.1
    · simp [h]
    · rw [stepOfGap_eq b ⟨i, h⟩, abs_stepSign]
  total := by
    rw [Fintype.sum_eq_add_sum_subtype_ne _ b.1, stepOfGap_zero, zero_add]
    simp_rw [stepOfGap_eq]
    exact b.2.property
  one_slack i j hi hj := ((stepOfGap_zero_iff b i).mp hi).trans ((stepOfGap_zero_iff b j).mp hj).symm

noncomputable def gapWordEquiv (m : ℕ) (r : ℤ) :
    TraceWithGap m r ≃ {w : UnitStepWord m r // ¬w.Full} := by
  classical
  let f (b : TraceWithGap m r) : {w : UnitStepWord m r // ¬w.Full} :=
    ⟨wordOfGap b, fun h => h b.1 (stepOfGap_zero b)⟩
  apply Equiv.ofBijective f
  constructor
  · rintro ⟨i, a⟩ ⟨j, b⟩ he
    have hz : stepOfGap ⟨i, a⟩ i = stepOfGap ⟨j, b⟩ i := congrArg (fun w => w.val.step i) he
    rw [stepOfGap_zero] at hz
    have e : i = j := (stepOfGap_zero_iff ⟨j, b⟩ i).mp hz.symm
    subst j
    have hab : a = b := by
      apply Subtype.ext
      funext k
      have hk : stepOfGap ⟨i, a⟩ k.val = stepOfGap ⟨i, b⟩ k.val := congrArg (fun w => w.val.step k.val) he
      rw [stepOfGap_eq ⟨i, a⟩ k, stepOfGap_eq ⟨i, b⟩ k] at hk
      exact stepSign_injective hk
    subst b
    rfl
  · intro w
    have h := w.property
    unfold UnitStepWord.Full at h
    push Not at h
    obtain ⟨i, hi⟩ := h
    let b (j : {j : Fin m // j ≠ i}) : Bool := decide (w.val.step j.val = 1)
    have hb (j : {j : Fin m // j ≠ i}) : stepSign (b j) = w.val.step j.val :=
      stepSign_test_of_unit_of_ne_zero (w.val.bound j.val) (fun h => j.property (w.val.one_slack j.val i h hi))
    have ht := w.val.total
    rw [Fintype.sum_eq_add_sum_subtype_ne _ i, hi, zero_add] at ht
    let s : SignsWithTotal {j : Fin m // j ≠ i} r := ⟨b, by simp_rw [hb]; exact ht⟩
    refine ⟨⟨i, s⟩, Subtype.ext (UnitStepWord.ext ?_)⟩
    funext j
    change stepOfGap ⟨i, s⟩ j = w.val.step j
    by_cases e : j = i
    · subst j
      exact (stepOfGap_zero ⟨i, s⟩).trans hi.symm
    · exact (stepOfGap_eq ⟨i, s⟩ ⟨j, e⟩).trans (hb ⟨j, e⟩)

theorem card_fin_except (i : Fin m) : Fintype.card {j : Fin m // j ≠ i} = m - 1 := by
  rw [Fintype.card_subtype_compl (fun j => j = i), Fintype.card_subtype_eq, Fintype.card_fin]

theorem card_fullWords (m : ℕ) (r : ℤ) : Nat.card {w : UnitStepWord m r // w.Full} = binomialSignCount m r := by
  rw [← Nat.card_congr (fullWordEquiv m r), card_signsWithTotal, Fintype.card_fin]

theorem card_gapWords (m : ℕ) (r : ℤ) :
    Nat.card {w : UnitStepWord m r // ¬w.Full} = m * binomialSignCount (m - 1) r := by
  classical
  rw [← Nat.card_congr (gapWordEquiv m r)]
  change Nat.card (Σ i : Fin m, SignsWithTotal {j : Fin m // j ≠ i} r) = _
  rw [Nat.card_eq_fintype_card, Fintype.card_sigma]
  simp_rw [← Nat.card_eq_fintype_card, card_signsWithTotal, card_fin_except]
  simp

theorem fullWord_total_parity (w : UnitStepWord m r) (h : w.Full) : r % 2 = (m : ℤ) % 2 := by
  simpa only [Fintype.card_fin] using signsWithTotal_parity ((fullWordEquiv m r).symm ⟨w, h⟩)

theorem gapWord_total_parity (w : UnitStepWord m r) (h : ¬w.Full) : r % 2 = ((m - 1 : ℕ) : ℤ) % 2 := by
  let b := (gapWordEquiv m r).symm ⟨w, h⟩
  simpa only [card_fin_except] using signsWithTotal_parity b.2

theorem UnitStepWord.full_iff_total_parity (w : UnitStepWord m r) (hm : 0 < m) :
    w.Full ↔ r % 2 = (m : ℤ) % 2 := by
  refine ⟨fullWord_total_parity w, fun h => ?_⟩
  by_contra hw
  have hg := gapWord_total_parity w hw
  rw [Nat.cast_sub (by omega : 1 ≤ m), Nat.cast_one] at hg
  omega

theorem UnitStepWord.abs_total_le_length (w : UnitStepWord m r) : |r| ≤ m := by
  rw [← w.total]
  calc
    |∑ i, w.step i| ≤ ∑ i, |w.step i| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ _ : Fin m, (1 : ℤ) := Finset.sum_le_sum (fun i _ => w.bound i)
    _ = m := by simp

instance (m : ℕ) (r : ℤ) : Finite (UnitStepWord m r) := by
  let E := Set.Icc (-1 : ℤ) 1
  let : Finite E := Set.finite_Icc _ _
  let f (w : UnitStepWord m r) (i : Fin m) : E := ⟨w.step i, abs_le.mp (w.bound i)⟩
  apply Finite.of_injective f
  intro x y e
  apply UnitStepWord.ext
  funext i
  exact congrArg Subtype.val (congrFun e i)

end BraunBruegge
