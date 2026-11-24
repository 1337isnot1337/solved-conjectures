import Conjectures.JuhnkeAlternating
import Conjectures.JuhnkePathsRuns

/-!
# Juhnke's conjecture

The cardinality of literal unit words with a specified displacement and run
count. The proof passes through the canonical maximal positive-length runs.
-/

namespace Juhnke

open scoped BigOperators

/-- Separate the directions and positive lengths of a fixed number of steps. -/
noncomputable def lengthPathEquiv (N r : ℕ) :
    PositiveOn (Fin r) N × (Fin r → Bool) ≃
      {p : LiteralPath N // p.stepCount = r} :=
  ((Equiv.prodCongr (positiveFinCompositionEquiv r N) (Equiv.refl _)).trans
    (Equiv.sigmaEquivProdOfEquiv (fun c : {c : Composition N // c.length = r} =>
      Equiv.arrowCongr (finCongr c.property) (Equiv.refl Bool))).symm).trans
    (Equiv.subtypeSigmaEquiv (fun c : Composition N => Fin c.length → Bool)
      (fun c => c.length = r)).symm

def pathOfLengths {N r : ℕ} (f : PositiveOn (Fin r) N) (w : Fin r → Bool) :
    LiteralPath N :=
  ⟨(positiveFinToComposition f).val,
    fun i => w (Fin.cast (positiveFinToComposition f).property i)⟩

theorem lengthPathEquiv_apply {N r : ℕ} (f : PositiveOn (Fin r) N)
    (w : Fin r → Bool) :
    ((lengthPathEquiv N r) (f, w)).val = pathOfLengths f w := rfl

theorem pathOfLengths_stepCount {N r : ℕ} (f : PositiveOn (Fin r) N)
    (w : Fin r → Bool) : (pathOfLengths f w).stepCount = r :=
  (positiveFinToComposition f).property

theorem pathOfLengths_east {N r : ℕ} (f : PositiveOn (Fin r) N)
    (w : Fin r → Bool) :
    (pathOfLengths f w).east = ∑ i, if w i then f.val i else 0 := by
  unfold LiteralPath.east pathOfLengths
  simp only [positiveFinToComposition, Composition.blocksFun, List.get_ofFn]
  exact Equiv.sum_comp (finCongr List.length_ofFn) (fun i => if w i then f.val i else 0)

theorem pathOfLengths_alternating {N r : ℕ} (f : PositiveOn (Fin r) N)
    (w : Fin r → Bool) :
    AlternatingLabels (pathOfLengths f w) ↔
      ∀ i : Fin (r - 1), w (leftUnit i) ≠ w (rightUnit i) := by
  let h := pathOfLengths_stepCount f w
  constructor
  · intro hp i
    let j : Fin ((pathOfLengths f w).stepCount - 1) := Fin.cast (congrArg (· - 1) h).symm i
    have hj := hp j
    exact hj
  · intro hw i
    let j : Fin (r - 1) := Fin.cast (congrArg (· - 1) h) i
    exact hw j

theorem sum_east_subtype {ι : Type*} [Fintype ι] (f : ι → ℕ) (w : ι → Bool) :
    (∑ i, if w i then f i else 0) = ∑ i : {i // w i = true}, f i := by
  classical
  rw [← Finset.sum_filter]
  exact Finset.sum_subtype _ (fun _ => by simp) f

/-- An endpoint condition splits the positive lengths into two independent totals. -/
def positiveEastEquiv {r a b : ℕ} (w : Fin r → Bool) :
    {f : PositiveOn (Fin r) (a + b) // (∑ i, if w i then f.val i else 0) = a} ≃
      SplitPositiveOn (fun i => w i = true) a b where
  toFun f := ⟨f.val.val, f.val.property.1, by
      rw [← sum_east_subtype]
      exact f.property,
    by
      have hsum := Fintype.sum_subtype_add_sum_subtype (fun i => w i = true) f.val.val
      have he : (∑ i : {i // w i = true}, f.val.val i) = a := by
        rw [← sum_east_subtype]
        exact f.property
      rw [he, f.val.property.2] at hsum
      exact Nat.add_left_cancel hsum⟩
  invFun f := ⟨⟨f.val, f.property.1, by
      rw [← Fintype.sum_subtype_add_sum_subtype (fun i => w i = true) f.val,
        f.property.2.1, f.property.2.2]⟩,
    by rw [sum_east_subtype]; exact f.property.2.1⟩
  left_inv f := by apply Subtype.ext; apply Subtype.ext; rfl
  right_inv f := by apply Subtype.ext; rfl

def alternatingPairEquiv {N a r : ℕ} (hr : 0 < r) :
    {fw : PositiveOn (Fin r) N × (Fin r → Bool) //
      (∀ i : Fin (r - 1), fw.2 (leftUnit i) ≠ fw.2 (rightUnit i)) ∧
        (∑ i, if fw.2 i then fw.1.val i else 0) = a} ≃
    Σ start : Bool, {f : PositiveOn (Fin r) N //
      (∑ i, if alternatingLabel start i then f.val i else 0) = a} where
  toFun fw := ⟨fw.val.2 ⟨0, hr⟩, fw.val.1, by
    rw [← eq_alternatingLabel hr fw.val.2 fw.property.1]
    exact fw.property.2⟩
  invFun sf := ⟨(sf.2.val, alternatingLabel sf.1),
    alternatingLabel_adjacent sf.1, sf.2.property⟩
  left_inv fw := by
    apply Subtype.ext
    change (fw.val.1, alternatingLabel (fw.val.2 ⟨0, hr⟩)) = fw.val
    exact Prod.ext rfl (eq_alternatingLabel hr fw.val.2 fw.property.1).symm
  right_inv sf := by rfl

theorem runCount_word_of_alternating {N : ℕ} (hN : 0 < N) (p : LiteralPath N)
    (hp : AlternatingLabels p) : runCount p.word = p.stepCount := by
  rw [runCount_of_pos hN, (alternatingLabels_iff_changes_eq_cuts p).mp hp]
  exact (compositionCutsEquiv_length hN p.1).symm

def unitWordFixedAlternatingEquiv {N a r : ℕ} (hN : 0 < N) :
    {w : Fin N → Bool // eastCount w = a ∧ runCount w = r} ≃
      {p : {p : LiteralPath N // p.stepCount = r} //
        AlternatingLabels p.val ∧ p.val.east = a} where
  toFun w := ⟨⟨maximalPath w.val, by rw [maximalPath_stepCount hN]; exact w.property.2⟩,
    maximalPath_alternating w.val, by rw [maximalPath_east]; exact w.property.1⟩
  invFun p := ⟨p.val.val.word, by
      rw [← LiteralPath.east_eq_word_eastCount]
      exact p.property.2,
    by rw [runCount_word_of_alternating hN _ p.property.1]; exact p.val.property⟩
  left_inv w := by apply Subtype.ext; exact maximalPath_word w.val
  right_inv p := by
    apply Subtype.ext
    apply Subtype.ext
    exact congrArg (fun q : {p : LiteralPath N // AlternatingLabels p} => q.val)
      ((unitWordMaximalEquiv N).apply_symm_apply ⟨p.val.val, p.property.1⟩)

noncomputable def lengthPathRestrictedEquiv (N a r : ℕ) :
    {fw : PositiveOn (Fin r) N × (Fin r → Bool) //
      (∀ i : Fin (r - 1), fw.2 (leftUnit i) ≠ fw.2 (rightUnit i)) ∧
        (∑ i, if fw.2 i then fw.1.val i else 0) = a} ≃
    {p : {p : LiteralPath N // p.stepCount = r} //
      AlternatingLabels p.val ∧ p.val.east = a} :=
  (lengthPathEquiv N r).subtypeEquiv (fun fw => by
    rw [lengthPathEquiv_apply, pathOfLengths_alternating, pathOfLengths_east])

/-- A unit word is uniquely specified by its first direction and positive run lengths. -/
noncomputable def unitWordAlternatingLengthsEquiv {a b r : ℕ}
    (hN : 0 < a + b) (hr : 0 < r) :
    {w : Fin (a + b) → Bool // eastCount w = a ∧ runCount w = r} ≃
      Σ start : Bool, AlternatingLengths r a b start :=
  ((unitWordFixedAlternatingEquiv hN).trans (lengthPathRestrictedEquiv (a + b) a r).symm).trans
    ((alternatingPairEquiv hr).trans
      (Equiv.sigmaCongrRight fun start => positiveEastEquiv (alternatingLabel start)))

theorem unitWord_even_count {a b : ℕ} (ha : 0 < a) (hb : 0 < b) (j : ℕ) :
    Fintype.card {w : Fin (a + b) → Bool // eastCount w = a ∧ runCount w = 2 * j + 2} =
      2 * ((a - 1).choose j * (b - 1).choose j) := by
  classical
  rw [Fintype.card_congr (unitWordAlternatingLengthsEquiv (by omega) (by omega)),
    Fintype.card_sigma]
  simp only [Fintype.sum_bool, alternatingLengths_even_card ha hb]
  omega

theorem unitWord_odd_count {a b : ℕ} (ha : 0 < a) (hb : 0 < b) (j : ℕ) :
    Fintype.card {w : Fin (a + b) → Bool // eastCount w = a ∧ runCount w = 2 * j + 3} =
      (a - 1).choose (j + 1) * (b - 1).choose j +
        (a - 1).choose j * (b - 1).choose (j + 1) := by
  classical
  rw [Fintype.card_congr (unitWordAlternatingLengthsEquiv (by omega) (by omega)),
    Fintype.card_sigma]
  simp only [Fintype.sum_bool, alternatingLengths_odd_true_card ha hb,
    alternatingLengths_odd_false_card ha hb]

end Juhnke
