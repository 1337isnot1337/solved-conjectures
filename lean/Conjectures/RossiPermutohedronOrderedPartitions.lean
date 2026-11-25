module

public import Mathlib.Combinatorics.Enumerative.Stirling
public import Mathlib.Data.Fin.Tuple.Basic
public import Mathlib.Data.Fintype.EquivFin
public import Mathlib.Logic.Equiv.Sum
public import Mathlib.Tactic

@[expose] public section
namespace RossiPermutohedron

/-- The ordered partition into the fibres, with their labels in order. -/
abbrev OrderedPartition (n k : ℕ) := {f : Fin n→Fin k // Function.Surjective f}

noncomputable instance (n k : ℕ) : Fintype (OrderedPartition n k) :=
  Fintype.ofFinite _

def touchesLast {n k : ℕ} (f : OrderedPartition (n+1) k) : Prop :=
  ∃ i : Fin n, f.val i.castSucc=f.val (Fin.last n)

theorem restricted_surj_of_touches {n k : ℕ} (f : OrderedPartition (n+1) k)
    (h : touchesLast f) :
    Function.Surjective (fun i : Fin n => f.val i.castSucc) := by
  intro y
  obtain ⟨i,hi⟩ := f.property y
  refine Fin.lastCases (motive := fun i => f.val i=y → ∃ j : Fin n, f.val j.castSucc=y)
    ?_ ?_ i hi
  · intro hy
    rcases h with ⟨j,hj⟩
    exact ⟨j,hj.trans hy⟩
  · intro j hj
    exact ⟨j,hj⟩

noncomputable def partitionTouchedEquiv (n k : ℕ) :
    {f : OrderedPartition (n+1) k // touchesLast f} ≃ Fin k × OrderedPartition n k where
  toFun f := ⟨f.val.val (Fin.last n),⟨_,restricted_surj_of_touches f.val f.property⟩⟩
  invFun p := ⟨⟨Fin.lastCases p.1 p.2.val, by
    intro y
    obtain ⟨i,hi⟩ := p.2.property y
    exact ⟨i.castSucc,by simpa using hi⟩⟩, by
      obtain ⟨i,hi⟩ := p.2.property p.1
      exact ⟨i,by simpa using hi⟩⟩
  left_inv f := by
    apply Subtype.ext
    apply Subtype.ext
    funext i
    refine Fin.lastCases (motive := fun i => _ = f.val.val i) ?_ ?_ i
    · simp
    · intro j
      simp
  right_inv p := by
    apply Prod.ext
    · simp
    · apply Subtype.ext
      funext i
      simp

noncomputable def withoutLabel {k : ℕ} (v : Fin (k+1)) :
    Fin k ≃ {z : Fin (k+1) // z≠v} :=
  Equiv.ofBijective (fun i => ⟨v.succAbove i,Fin.succAbove_ne _ _⟩)
    ⟨fun _ _ h => Fin.succAbove_right_injective (congrArg Subtype.val h),
      fun ⟨z,hz⟩ => by
        obtain ⟨i,hi⟩ := Fin.exists_succAbove_eq_iff.mpr hz
        exact ⟨i,Subtype.ext hi⟩⟩

theorem withoutLabel_val {k : ℕ} (v : Fin (k+1)) (i : Fin k) :
    (withoutLabel v i).val=v.succAbove i := rfl

noncomputable def projectSingleton {n k : ℕ}
    (f : OrderedPartition (n+1) (k+1)) (hf : ¬touchesLast f) :
    OrderedPartition n k := by
  let v := f.val (Fin.last n)
  let e := withoutLabel v
  let g : Fin n → {z : Fin (k+1) // z≠v} :=
    fun i => ⟨f.val i.castSucc, fun h => hf ⟨i,h⟩⟩
  refine ⟨fun i => e.symm (g i),?_⟩
  intro y
  obtain ⟨i,hi⟩ := f.property (e y).val
  refine Fin.lastCases (motive := fun i => f.val i=(e y).val → ∃ j, e.symm (g j)=y)
      ?_ ?_ i hi
  · intro h
    exact ((e y).property h.symm).elim
  · intro j hj
    exact ⟨j, (congrArg e.symm (Subtype.ext hj)).trans (e.symm_apply_apply y)⟩

theorem projectSingleton_succAbove {n k : ℕ}
    (f : OrderedPartition (n+1) (k+1)) (hf : ¬touchesLast f) (i : Fin n) :
    (f.val (Fin.last n)).succAbove ((projectSingleton f hf).val i)=f.val i.castSucc := by
  exact congrArg Subtype.val ((withoutLabel (f.val (Fin.last n))).apply_symm_apply
    ⟨f.val i.castSucc, fun h => hf ⟨i,h⟩⟩)

def appendSingleton {n k : ℕ} (v : Fin (k+1)) (f : OrderedPartition n k) :
    OrderedPartition (n+1) (k+1) := by
  let g : Fin (n+1) → Fin (k+1) := fun i => Fin.lastCases (motive := fun _ => Fin (k+1)) v (fun j : Fin n => v.succAbove (f.val j)) i
  refine ⟨g, ?_⟩
  intro y
  by_cases hv : y=v
  · refine ⟨Fin.last n,?_⟩
    simpa [g] using hv.symm
  · obtain ⟨z,hz⟩ := Fin.exists_succAbove_eq_iff.mpr hv
    obtain ⟨i,hi⟩ := f.property z
    refine ⟨i.castSucc,?_⟩
    simpa [g,hi] using hz

@[simp] theorem appendSingleton_last {n k : ℕ} (v : Fin (k+1)) (f : OrderedPartition n k) :
    (appendSingleton v f).val (Fin.last n) = v := by simp [appendSingleton]

@[simp] theorem appendSingleton_castSucc {n k : ℕ} (v : Fin (k+1))
    (f : OrderedPartition n k) (i : Fin n) :
    (appendSingleton v f).val i.castSucc = v.succAbove (f.val i) := by simp [appendSingleton]

theorem appendSingleton_not_touches {n k : ℕ} (v : Fin (k+1)) (f : OrderedPartition n k) :
    ¬ touchesLast (appendSingleton v f) := by
  rintro ⟨i,hi⟩
  rw [appendSingleton_castSucc,appendSingleton_last] at hi
  exact Fin.succAbove_ne _ _ hi

noncomputable def partitionSingletonEquiv (n k : ℕ) :
    {f : OrderedPartition (n+1) (k+1) // ¬touchesLast f} ≃ Fin (k+1) × OrderedPartition n k where
  toFun f := ⟨f.val.val (Fin.last n),projectSingleton f.val f.property⟩
  invFun p := ⟨appendSingleton p.1 p.2,appendSingleton_not_touches _ _⟩
  left_inv f := by
    apply Subtype.ext
    apply Subtype.ext
    funext i
    refine Fin.lastCases (motive := fun i => (appendSingleton
      (f.val.val (Fin.last n)) (projectSingleton f.val f.property)).val i=f.val.val i) ?_ ?_ i
    · simp
    · intro j
      rw [appendSingleton_castSucc,projectSingleton_succAbove]
  right_inv p := by
    apply Prod.ext
    · exact appendSingleton_last _ _
    · apply Subtype.ext
      funext i
      apply Fin.succAbove_right_injective (p := p.1)
      have h := projectSingleton_succAbove (appendSingleton p.1 p.2)
        (appendSingleton_not_touches p.1 p.2) i
      rw [appendSingleton_last,appendSingleton_castSucc] at h
      exact h

open scoped Classical in
theorem orderedPartition_card_succ (n k : ℕ) :
    Fintype.card (OrderedPartition (n+1) (k+1)) =
      (k+1)*(Fintype.card (OrderedPartition n (k+1))+Fintype.card (OrderedPartition n k)) := by
  let e := (Equiv.sumCompl (@touchesLast n (k+1))).symm.trans
    (Equiv.sumCongr (partitionTouchedEquiv n (k+1)) (partitionSingletonEquiv n k))
  rw [Fintype.card_congr e,Fintype.card_sum,Fintype.card_prod,Fintype.card_prod,Fintype.card_fin,
    ← mul_add]

/-- The count of ordered partitions into a prescribed number of nonempty blocks. -/
theorem orderedPartition_card (n k : ℕ) :
    Fintype.card (OrderedPartition n k) = k.factorial * Nat.stirlingSecond n k := by
  induction n generalizing k with
  | zero =>
    cases k with
    | zero =>
      let : Unique (OrderedPartition 0 0) :=
        ⟨⟨fun a => a.elim0, fun b => b.elim0⟩,
          fun f => Subtype.ext (funext fun i => i.elim0)⟩
      simp [Nat.stirlingSecond_zero]
    | succ k =>
      let : IsEmpty (OrderedPartition 0 (k+1)) :=
        ⟨fun f => let ⟨i,_⟩ := f.property 0; i.elim0⟩
      simp [Nat.stirlingSecond_zero_succ]
  | succ n ih =>
    cases k with
    | zero =>
      let : IsEmpty (OrderedPartition (n+1) 0) := ⟨fun f => (f.val 0).elim0⟩
      simp [Nat.stirlingSecond_succ_zero]
    | succ k =>
      rw [orderedPartition_card_succ, ih, ih, Nat.stirlingSecond_succ_succ]
      simp only [Nat.factorial_succ]
      ring

end RossiPermutohedron
