module

public import Conjectures.SteinkeZakynthinou.Rounding
public import Mathlib.Data.Finset.Sort
public import Mathlib.Order.Interval.Finset.Fin

/-! The order of a sample is a measurable function of its features and labels. -/

@[expose] public section

open MeasureTheory
open scoped BigOperators

namespace SteinkeZakynthinou

theorem key_injective {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) : Function.Injective (fun i => key (z i) (tag i)) := by
  intro i j h
  exact ht (congrArg (fun k : Key => (ofLex (ofLex k).2).2) h)

noncomputable def sorting {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) :
    {e : Fin n ≃ Fin n // StrictMono (fun r => key (z (e r)) (tag (e r)))} := by
  classical
  let f := fun i => key (z i) (tag i)
  let s := Finset.univ.image f
  have h : s.card = n := by
    dsimp [s]
    rw [Finset.card_image_of_injective _ (show Function.Injective f from key_injective z tag ht)]
    exact Fintype.card_fin n
  have hf : ∀ i, f i ∈ s := fun i => Finset.mem_image_of_mem f (Finset.mem_univ i)
  let e : Fin n ≃ s := Equiv.ofBijective (fun i => ⟨f i, hf i⟩) ⟨
    fun _ _ hh => key_injective z tag ht (congrArg Subtype.val hh),
    fun x => by
      obtain ⟨i, _, he⟩ := Finset.mem_image.mp x.2
      exact ⟨i, Subtype.ext he⟩⟩
  let o := s.orderIsoOfFin h
  refine ⟨o.toEquiv.trans e.symm, ?_⟩
  intro i j hij
  have he (r : Fin n) : f (e.symm (o r)) = (o r).val :=
    congrArg Subtype.val (e.apply_symm_apply (o r))
  change f (e.symm (o i)) < f (e.symm (o j))
  rw [he, he]
  exact o.lt_iff_lt.mpr hij

noncomputable def sortedRows {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) : Fin n ≃ Fin n :=
  (sorting z tag ht).val

theorem sortedRows_strictMono {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) :
    StrictMono (fun r => key (z (sortedRows z tag ht r)) (tag (sortedRows z tag ht r))) :=
  (sorting z tag ht).property

theorem sortedRows_eq_iff {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) (r i : Fin n) :
    sortedRows z tag ht r = i ↔
      (∑ j : Fin n, if key (z j) (tag j) < key (z i) (tag i) then 1 else 0 : ℕ) = r.val := by
  let e := sortedRows z tag ht
  have hmono := sortedRows_strictMono z tag ht
  have hcount :
      (∑ j : Fin n, if key (z j) (tag j) < key (z i) (tag i) then 1 else 0 : ℕ) =
        (e.symm i).val := by
    calc
      _ = ∑ j : Fin n, if j < e.symm i then 1 else 0 := by
        apply Fintype.sum_equiv e.symm
        intro j
        have hh := hmono.lt_iff_lt (a := e.symm j) (b := e.symm i)
        simp only [e, Equiv.apply_symm_apply] at hh
        simp only [hh, e]
      _ = _ := by
        have h := Finset.sum_boole (R := ℕ) (fun (j : Fin n) => j < e.symm i) Finset.univ
        rw [h]
        have he : (Finset.univ.filter fun j => j < e.symm i) = Finset.Iio (e.symm i) := by
          ext j
          simp
        rw [he, Fin.card_Iio]
        rfl
  rw [hcount, ← Fin.ext_iff]
  exact (eq_comm.trans e.eq_symm_apply).symm

theorem measurableSet_key_lt {n : ℕ} (tag : Fin n → ℕ) (i j : Fin n) :
    MeasurableSet {z : Sample n | key (z i) (tag i) < key (z j) (tag j)} := by
  have hi : Measurable (fun z : Sample n => z i) := measurable_pi_apply i
  have hj : Measurable (fun z : Sample n => z j) := measurable_pi_apply j
  have hnot (k : Fin n) : Measurable (fun z : Sample n => !(z k).2) := by
    exact (measurable_of_countable (fun b : Bool => !b)).comp
      (measurable_snd.comp (show Measurable (fun z : Sample n => z k) from measurable_pi_apply k))
  have hb : MeasurableSet {z : Sample n | (!(z i).2) < (!(z j).2)} :=
    ((hnot i).prodMk (hnot j)) ((Set.toFinite {b : Bool × Bool | b.1 < b.2}).measurableSet)
  have ht : MeasurableSet {z : Sample n | tag i < tag j} := by
    by_cases h : tag i < tag j <;> simp [h]
  simp only [key, Prod.Lex.toLex_lt_toLex]
  exact (measurableSet_lt (measurable_fst.comp hi) (measurable_fst.comp hj)).union
    ((measurableSet_eq_fun (measurable_fst.comp hi) (measurable_fst.comp hj)).inter
      (hb.union ((measurableSet_eq_fun (hnot i) (hnot j)).inter ht)))

theorem measurable_sortedRows {n : ℕ} (tag : Fin n → ℕ) (ht : Function.Injective tag)
    (r : Fin n) : Measurable (fun z : Sample n => sortedRows z tag ht r) := by
  apply measurable_to_countable'
  intro i
  have hsum : Measurable (fun z : Sample n =>
      ∑ j : Fin n, if key (z j) (tag j) < key (z i) (tag i) then (1 : ℕ) else 0) := by
    apply Finset.measurable_sum
    intro j _
    exact Measurable.ite (measurableSet_key_lt tag j i) measurable_const measurable_const
  convert measurableSet_eq_fun hsum (measurable_const (a := r.val)) using 1
  ext z
  simp only [Set.mem_preimage, Set.mem_singleton_iff, Set.mem_ofPred_eq]
  exact sortedRows_eq_iff z tag ht r i

end SteinkeZakynthinou
