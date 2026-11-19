import Conjectures.DenominatorFiniteLists
import Mathlib.Logic.Function.Iterate
import Mathlib.RingTheory.PowerSeries.Basic

/-! Actual finite ancestor sets for reverse Bulgarian solitaire. Positive,
nonempty partitions are preserved throughout; this excludes the spurious
orbit of the empty multiset under the total forward map. -/

namespace DenominatorFinite

open DenominatorDynamics

theorem forward_nonempty (p : Multiset Nat) : forward p ≠ 0 := by
  simp [forward]

theorem forward_positive (p : Multiset Nat) (hne : p ≠ 0) :
    DenominatorDynamics.Positive (forward p) := by
  intro a ha
  rcases Multiset.mem_cons.mp ha with rfl | ha
  · exact Multiset.card_pos.mpr hne
  · exact shrink_positive p a ha

theorem iterate_forward_positive (d : Nat) (p : Multiset Nat)
    (hp : DenominatorDynamics.Positive p) (hne : p ≠ 0) :
    DenominatorDynamics.Positive (forward^[d] p) ∧ forward^[d] p ≠ 0 := by
  induction d with
  | zero => exact ⟨hp,hne⟩
  | succ d ih =>
      rw [Function.iterate_succ_apply']
      exact ⟨forward_positive _ ih.2,forward_nonempty _⟩

theorem iterate_forward_preserves_mass (d : Nat) (p : Multiset Nat)
    (hp : DenominatorDynamics.Positive p) (hne : p ≠ 0) :
    (forward^[d] p).sum=p.sum := by
  induction d with
  | zero => rfl
  | succ d ih =>
      rw [Function.iterate_succ_apply',
        forward_preserves_mass _ (iterate_forward_positive d p hp hne).1,ih]

theorem reverse_nonempty (p : Multiset Nat) (hp : DenominatorDynamics.Positive p)
    (v : Nat) (hv : LegalSize p v) : reverseMove p v ≠ 0 := by
  intro he
  have hc := reverse_card p v hv
  rw [he,Multiset.card_zero] at hc
  have hvpos := hp v hv.1
  omega

/-- Partitions that reach `p` after exactly `d` forward moves. -/
def ancestors : Nat → Multiset Nat → Finset (Multiset Nat)
  | 0,p => {p}
  | d+1,p => (legalSizes p).biUnion (fun v => ancestors d (reverseMove p v))

@[simp] theorem ancestors_zero (p : Multiset Nat) : ancestors 0 p={p} := rfl

theorem mem_ancestors (d : Nat) (p q : Multiset Nat)
    (hp : DenominatorDynamics.Positive p) (hne : p ≠ 0) :
    q ∈ ancestors d p ↔
      DenominatorDynamics.Positive q ∧ q ≠ 0 ∧ forward^[d] q=p := by
  induction d generalizing p with
  | zero =>
      simp only [ancestors_zero,Finset.mem_singleton,Function.iterate_zero, id_eq]
      constructor
      · intro he
        subst q
        exact ⟨hp,hne,rfl⟩
      · exact fun h => h.2.2
  | succ d ih =>
      simp only [ancestors,Finset.mem_biUnion,mem_legalSizes]
      constructor
      · rintro ⟨v,hv,hq⟩
        have hq' := (ih _ (DenominatorDynamics.reverse_positive p v)
          (reverse_nonempty p hp v hv)).mp hq
        refine ⟨hq'.1,hq'.2.1,?_⟩
        rw [Function.iterate_succ_apply',hq'.2.2,forward_reverse p hp v hv]
      · rintro ⟨hqpos,hqne,hq⟩
        have hr := iterate_forward_positive d q hqpos hqne
        rw [Function.iterate_succ_apply'] at hq
        obtain ⟨hv,he⟩ := inverse_move_complete p (forward^[d] q) hr.1 hq
        refine ⟨(forward^[d] q).card,hv,?_⟩
        exact (ih _ (DenominatorDynamics.reverse_positive _ _) (reverse_nonempty p hp _ hv)).mpr
          ⟨hqpos,hqne,he.symm⟩

theorem ancestors_preserve_mass (d : Nat) (p q : Multiset Nat)
    (hp : DenominatorDynamics.Positive p) (hne : p ≠ 0)
    (hq : q ∈ ancestors d p) : q.sum=p.sum := by
  obtain ⟨hqpos,hqne,he⟩ := (mem_ancestors d p q hp hne).mp hq
  rw [← he,iterate_forward_preserves_mass d q hqpos hqne]

theorem ancestors_disjoint (d : Nat) (p q : Multiset Nat)
    (hp : DenominatorDynamics.Positive p) (hpne : p ≠ 0)
    (hq : DenominatorDynamics.Positive q) (hqne : q ≠ 0) (hne : p ≠ q) :
    Disjoint (ancestors d p) (ancestors d q) := by
  apply Finset.disjoint_left.mpr
  intro r hrp hrq
  exact hne (((mem_ancestors d p r hp hpne).mp hrp).2.2.symm.trans
    ((mem_ancestors d q r hq hqne).mp hrq).2.2)

theorem card_ancestors (d : Nat) (p : Multiset Nat)
    (hp : DenominatorDynamics.Positive p) (hne : p ≠ 0) :
    (ancestors d p).card=actualPathCount d p := by
  induction d generalizing p with
  | zero => simp [actualPathCount]
  | succ d ih =>
      rw [ancestors,Finset.card_biUnion]
      · apply Finset.sum_congr rfl
        intro v hv
        exact ih _ (DenominatorDynamics.reverse_positive p v)
          (reverse_nonempty p hp v ((mem_legalSizes p v).mp hv))
      · intro v hv w hw hne'
        have hv' := (mem_legalSizes p v).mp hv
        have hw' := (mem_legalSizes p w).mp hw
        exact ancestors_disjoint d _ _ (DenominatorDynamics.reverse_positive p v)
          (reverse_nonempty p hp v hv')
          (DenominatorDynamics.reverse_positive p w) (reverse_nonempty p hp w hw')
          (fun he => hne' ((distinct_sizes_distinct_preimages p v w hv' hw').mp he))

/-- All actual partitions that reach one of the designated roots at depth `d`. -/
def cycleAncestors (C : Finset (Multiset Nat)) (d : Nat) : Finset (Multiset Nat) :=
  C.biUnion (ancestors d)

def actualCycleCount (C : Finset (Multiset Nat)) (d : Nat) : Nat :=
  ∑ p ∈ C, actualPathCount d p

@[simp] theorem cycleAncestors_zero (C : Finset (Multiset Nat)) :
    cycleAncestors C 0=C := by simp [cycleAncestors,ancestors]

theorem mem_cycleAncestors (C : Finset (Multiset Nat)) (d : Nat) (q : Multiset Nat)
    (hpos : ∀ p ∈ C, DenominatorDynamics.Positive p) (hne : ∀ p ∈ C, p ≠ 0) :
    q ∈ cycleAncestors C d ↔
      DenominatorDynamics.Positive q ∧ q ≠ 0 ∧ forward^[d] q ∈ C := by
  simp only [cycleAncestors,Finset.mem_biUnion]
  constructor
  · rintro ⟨p,hp,hq⟩
    obtain ⟨hqpos,hqne,he⟩ := (mem_ancestors d p q (hpos p hp) (hne p hp)).mp hq
    exact ⟨hqpos,hqne,he.symm ▸ hp⟩
  · rintro ⟨hqpos,hqne,hq⟩
    exact ⟨forward^[d] q,hq,
      (mem_ancestors d _ _ (hpos _ hq) (hne _ hq)).mpr ⟨hqpos,hqne,rfl⟩⟩

theorem card_cycleAncestors (C : Finset (Multiset Nat)) (d : Nat)
    (hpos : ∀ p ∈ C, DenominatorDynamics.Positive p) (hne : ∀ p ∈ C, p ≠ 0) :
    (cycleAncestors C d).card=actualCycleCount C d := by
  rw [cycleAncestors,Finset.card_biUnion]
  · exact Finset.sum_congr rfl (fun p hp => card_ancestors d p (hpos p hp) (hne p hp))
  · intro p hp q hq hpq
    exact ancestors_disjoint d p q (hpos p hp) (hne p hp) (hpos q hq) (hne q hq) hpq

theorem cycleAncestors_subset_succ (C : Finset (Multiset Nat)) (d : Nat)
    (hpos : ∀ p ∈ C, DenominatorDynamics.Positive p) (hne : ∀ p ∈ C, p ≠ 0)
    (hclosed : ∀ p ∈ C, forward p ∈ C) :
    cycleAncestors C d ⊆ cycleAncestors C (d+1) := by
  intro q hq
  obtain ⟨hqpos,hqne,hq⟩ := (mem_cycleAncestors C d q hpos hne).mp hq
  apply (mem_cycleAncestors C (d+1) q hpos hne).mpr
  exact ⟨hqpos,hqne,by simpa only [Function.iterate_succ_apply'] using hclosed _ hq⟩

theorem cycleAncestors_mono (C : Finset (Multiset Nat))
    (hpos : ∀ p ∈ C, DenominatorDynamics.Positive p) (hne : ∀ p ∈ C, p ≠ 0)
    (hclosed : ∀ p ∈ C, forward p ∈ C) : Monotone (cycleAncestors C) := by
  exact monotone_nat_of_le_succ (fun d => cycleAncestors_subset_succ C d hpos hne hclosed)

theorem actualCycleCount_mono (C : Finset (Multiset Nat))
    (hpos : ∀ p ∈ C, DenominatorDynamics.Positive p) (hne : ∀ p ∈ C, p ≠ 0)
    (hclosed : ∀ p ∈ C, forward p ∈ C) : Monotone (actualCycleCount C) := by
  intro d e hde
  rw [← card_cycleAncestors C d hpos hne,← card_cycleAncestors C e hpos hne]
  exact Finset.card_le_card (cycleAncestors_mono C hpos hne hclosed hde)

/-- The partitions whose first visit to `C` occurs at the indicated depth. -/
def firstEntry (C : Finset (Multiset Nat)) : Nat → Finset (Multiset Nat)
  | 0 => cycleAncestors C 0
  | d+1 => cycleAncestors C (d+1) \ cycleAncestors C d

@[simp] theorem firstEntry_zero (C : Finset (Multiset Nat)) : firstEntry C 0=C := by
  simp [firstEntry]

theorem mem_firstEntry (C : Finset (Multiset Nat)) (d : Nat) (q : Multiset Nat)
    (hpos : ∀ p ∈ C, DenominatorDynamics.Positive p) (hne : ∀ p ∈ C, p ≠ 0)
    (hclosed : ∀ p ∈ C, forward p ∈ C) :
    q ∈ firstEntry C d ↔
      DenominatorDynamics.Positive q ∧ q ≠ 0 ∧ forward^[d] q ∈ C ∧
        ∀ e < d, forward^[e] q ∉ C := by
  cases d with
  | zero =>
      simp only [firstEntry_zero,Function.iterate_zero,id_eq,Nat.not_lt_zero,
        IsEmpty.forall_iff,implies_true,and_true]
      exact ⟨fun hq => ⟨hpos q hq,hne q hq,hq⟩,fun hq => hq.2.2⟩
  | succ d =>
      simp only [firstEntry,Finset.mem_sdiff]
      constructor
      · rintro ⟨hqnext,hqprev⟩
        obtain ⟨hqpos,hqne,hq⟩ := (mem_cycleAncestors C (d+1) q hpos hne).mp hqnext
        refine ⟨hqpos,hqne,hq,?_⟩
        intro e he hqe
        apply hqprev
        exact cycleAncestors_mono C hpos hne hclosed (by omega)
          ((mem_cycleAncestors C e q hpos hne).mpr ⟨hqpos,hqne,hqe⟩)
      · rintro ⟨hqpos,hqne,hq,hfirst⟩
        refine ⟨(mem_cycleAncestors C (d+1) q hpos hne).mpr ⟨hqpos,hqne,hq⟩,?_⟩
        intro hqprev
        exact hfirst d (by omega) ((mem_cycleAncestors C d q hpos hne).mp hqprev).2.2

theorem firstEntry_preserve_mass (C : Finset (Multiset Nat)) (d : Nat)
    (M : Nat) (hmass : ∀ p ∈ C, p.sum=M)
    (hpos : ∀ p ∈ C, DenominatorDynamics.Positive p) (hne : ∀ p ∈ C, p ≠ 0)
    (hclosed : ∀ p ∈ C, forward p ∈ C) :
    ∀ q ∈ firstEntry C d, q.sum=M := by
  intro q hq
  obtain ⟨hqpos,hqne,hq,_⟩ := (mem_firstEntry C d q hpos hne hclosed).mp hq
  rw [← iterate_forward_preserves_mass d q hqpos hqne]
  exact hmass _ hq

theorem card_firstEntry_succ (C : Finset (Multiset Nat)) (d : Nat)
    (hpos : ∀ p ∈ C, DenominatorDynamics.Positive p) (hne : ∀ p ∈ C, p ≠ 0)
    (hclosed : ∀ p ∈ C, forward p ∈ C) :
    (firstEntry C (d+1)).card+actualCycleCount C d=actualCycleCount C (d+1) := by
  rw [firstEntry,← card_cycleAncestors C d hpos hne,
    ← card_cycleAncestors C (d+1) hpos hne]
  exact Finset.card_sdiff_add_card_eq_card
    (cycleAncestors_subset_succ C d hpos hne hclosed)

noncomputable section

/-- The actual reverse-path count series for one fixed partition. -/
def actualPathSeries (p : Multiset Nat) : PowerSeries ℚ :=
  PowerSeries.mk (fun d => (actualPathCount d p : ℚ))

/-- The series of actual ancestor counts, summed over the distinct roots. -/
def ancestorSeries (C : Finset (Multiset Nat)) : PowerSeries ℚ :=
  PowerSeries.mk (fun d => (actualCycleCount C d : ℚ))

/-- The series that counts partitions by their exact first-entry depth. -/
def firstEntrySeries (C : Finset (Multiset Nat)) : PowerSeries ℚ :=
  PowerSeries.mk (fun d => ((firstEntry C d).card : ℚ))

@[simp] theorem coeff_actualPathSeries (p : Multiset Nat) (d : Nat) :
    PowerSeries.coeff d (actualPathSeries p)=(actualPathCount d p : ℚ) := by
  simp [actualPathSeries]

@[simp] theorem coeff_ancestorSeries (C : Finset (Multiset Nat)) (d : Nat) :
    PowerSeries.coeff d (ancestorSeries C)=(actualCycleCount C d : ℚ) := by
  simp [ancestorSeries]

@[simp] theorem coeff_firstEntrySeries (C : Finset (Multiset Nat)) (d : Nat) :
    PowerSeries.coeff d (firstEntrySeries C)=((firstEntry C d).card : ℚ) := by
  simp [firstEntrySeries]

theorem ancestorSeries_eq_sum (C : Finset (Multiset Nat)) :
    ancestorSeries C=∑ p ∈ C, actualPathSeries p := by
  ext d
  simp [actualCycleCount]

/-- Multiplication by `1-X` removes the preceding ancestor set, leaving
exactly the partitions that enter the forward-invariant set for the first time. -/
theorem firstEntrySeries_eq (C : Finset (Multiset Nat))
    (hpos : ∀ p ∈ C, DenominatorDynamics.Positive p) (hne : ∀ p ∈ C, p ≠ 0)
    (hclosed : ∀ p ∈ C, forward p ∈ C) :
    firstEntrySeries C=(1-PowerSeries.X)*ancestorSeries C := by
  ext d
  rw [sub_mul,one_mul,map_sub,coeff_firstEntrySeries,coeff_ancestorSeries]
  cases d with
  | zero =>
      simp [actualCycleCount,actualPathCount,PowerSeries.coeff_zero_eq_constantCoeff]
  | succ d =>
      rw [PowerSeries.coeff_succ_X_mul,coeff_ancestorSeries]
      apply (eq_sub_iff_add_eq).mpr
      exact_mod_cast card_firstEntry_succ C d hpos hne hclosed

theorem firstEntry_coeff_identity (C : Finset (Multiset Nat)) (d : Nat)
    (hpos : ∀ p ∈ C, DenominatorDynamics.Positive p) (hne : ∀ p ∈ C, p ≠ 0)
    (hclosed : ∀ p ∈ C, forward p ∈ C) :
    PowerSeries.coeff d ((1-PowerSeries.X)*∑ p ∈ C, actualPathSeries p)=
      ((firstEntry C d).card : ℚ) := by
  rw [← ancestorSeries_eq_sum,← firstEntrySeries_eq C hpos hne hclosed,
    coeff_firstEntrySeries]

end

end DenominatorFinite
