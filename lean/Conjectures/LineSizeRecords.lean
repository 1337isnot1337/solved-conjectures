import Conjectures.LineSizeGeometry
import Mathlib.Data.Finset.Powerset

/-! Records consist of the actual sizes of lines determined by two distinct
points. The count ranges over a finite set of records, while realizability
quantifies over arbitrary finite subsets of the real plane. -/
noncomputable section
namespace LineSize

theorem hasLineSize_bounds (P : Finset Point) (s : ℕ)
    (hs : HasLineSize P s) : 2 ≤ s ∧ s ≤ P.card := by
  classical
  obtain ⟨a,ha,b,hb,hab,he⟩ := hs
  have hpair : ({a,b} : Finset Point) ⊆ linePoints P a b := by
    intro p hp
    rcases Finset.mem_insert.mp hp with hpa | hp
    · subst p
      exact (mem_linePoints P a b a).mpr ⟨ha,left_mem_affineSpan_pair _ _ _⟩
    · have hp' : p=b := Finset.mem_singleton.mp hp
      subst p
      exact (mem_linePoints P a b b).mpr ⟨hb,right_mem_affineSpan_pair _ _ _⟩
  have hlo := Finset.card_le_card hpair
  have hhi := Finset.card_le_card (linePoints_subset P a b)
  rw [Finset.card_pair hab,he] at hlo
  rw [he] at hhi
  exact ⟨hlo,hhi⟩

def lineSizeRecord (P : Finset Point) : Finset ℕ := by
  classical
  exact (Finset.range (P.card+1)).filter (HasLineSize P)

@[simp] theorem mem_lineSizeRecord (P : Finset Point) (s : ℕ) :
    s ∈ lineSizeRecord P ↔ HasLineSize P s := by
  classical
  simp only [lineSizeRecord,Finset.mem_filter,Finset.mem_range]
  exact ⟨fun h => h.2,fun h => ⟨by have := (hasLineSize_bounds P s h).2; omega,h⟩⟩

theorem lineSizeRecord_bounds (P : Finset Point) {s : ℕ}
    (hs : s ∈ lineSizeRecord P) : 2 ≤ s ∧ s ≤ P.card :=
  hasLineSize_bounds P s ((mem_lineSizeRecord P s).mp hs)

theorem lineSizeRecord_subset (P : Finset Point) :
    lineSizeRecord P ⊆ Finset.range (P.card+1) := by
  intro s hs
  exact Finset.mem_range.mpr (by have := (lineSizeRecord_bounds P hs).2; omega)

theorem lineSizeRecord_eq_empty_of_card_le_one (P : Finset Point)
    (hP : P.card ≤ 1) : lineSizeRecord P = ∅ := by
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro s hs
  have hb := lineSizeRecord_bounds P hs
  omega

def largeLineSizeRecord (P : Finset Point) : Finset ℕ :=
  (lineSizeRecord P).filter (3 ≤ ·)

@[simp] theorem mem_largeLineSizeRecord (P : Finset Point) (s : ℕ) :
    s ∈ largeLineSizeRecord P ↔ HasLineSize P s ∧ 3 ≤ s := by
  simp [largeLineSizeRecord]

theorem lineSizeRecord_eq_insert_two (P : Finset Point)
    (h2 : HasLineSize P 2) :
    lineSizeRecord P = insert 2 (largeLineSizeRecord P) := by
  ext s
  simp only [mem_lineSizeRecord,Finset.mem_insert,mem_largeLineSizeRecord]
  constructor
  · intro hs
    have hb := (hasLineSize_bounds P s hs).1
    by_cases he : s=2
    · exact Or.inl he
    · exact Or.inr ⟨hs,by omega⟩
  · rintro (rfl | ⟨hs,_⟩)
    · exact h2
    · exact hs

def attainableRecords (n : ℕ) : Finset (Finset ℕ) := by
  classical
  exact (Finset.range (n+1)).powerset.filter
    (fun record => ∃ P : Finset Point, P.card=n ∧ lineSizeRecord P=record)

@[simp] theorem mem_attainableRecords (n : ℕ) (record : Finset ℕ) :
    record ∈ attainableRecords n ↔
      ∃ P : Finset Point, P.card=n ∧ lineSizeRecord P=record := by
  classical
  simp only [attainableRecords,Finset.mem_filter]
  constructor
  · exact fun h => h.2
  · rintro ⟨P,hP,rfl⟩
    refine ⟨Finset.mem_powerset.mpr ?_,P,hP,rfl⟩
    rw [← hP]
    exact lineSizeRecord_subset P

def lineSizeCount (n : ℕ) : ℕ := (attainableRecords n).card

theorem record_cost_le (n : ℕ) (record : Finset ℕ)
    (hrecord : record ∈ attainableRecords n) (d : ℕ → ℕ) (k : ℕ)
    (hd : ∀ i < k, d i ∈ record)
    (hdistinct : ∀ i j, i < j → j < k → d i ≠ d j) :
    pointCost d k ≤ n := by
  obtain ⟨P,hP,rfl⟩ := (mem_attainableRecords n record).mp hrecord
  rw [← hP]
  exact realizable_cost_le P d k
    (fun i hi => (mem_lineSizeRecord P (d i)).mp (hd i hi)) hdistinct

theorem attainableRecords_zero : attainableRecords 0 = {∅} := by
  classical
  ext record
  rw [mem_attainableRecords,Finset.mem_singleton]
  constructor
  · rintro ⟨P,hP,hrecord⟩
    rw [Finset.card_eq_zero.mp hP] at hrecord
    rw [← hrecord]
    exact lineSizeRecord_eq_empty_of_card_le_one ∅ (by simp)
  · rintro rfl
    exact ⟨∅,by simp,lineSizeRecord_eq_empty_of_card_le_one ∅ (by simp)⟩

theorem attainableRecords_one : attainableRecords 1 = {∅} := by
  classical
  ext record
  rw [mem_attainableRecords,Finset.mem_singleton]
  constructor
  · rintro ⟨P,hP,hrecord⟩
    rw [← hrecord]
    exact lineSizeRecord_eq_empty_of_card_le_one P hP.le
  · rintro rfl
    refine ⟨{(0,0)},by simp,?_⟩
    exact lineSizeRecord_eq_empty_of_card_le_one _ (by simp)

@[simp] theorem lineSizeCount_zero : lineSizeCount 0 = 1 := by
  simp [lineSizeCount,attainableRecords_zero]

@[simp] theorem lineSizeCount_one : lineSizeCount 1 = 1 := by
  simp [lineSizeCount,attainableRecords_one]

end LineSize
