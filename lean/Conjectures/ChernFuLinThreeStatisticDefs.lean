import Conjectures.BursteinA218225Defs
import Mathlib.Algebra.BigOperators.Fin

/-! # The two avoidance classes and their joint statistic fibres

The target is Chern–Fu–Lin, Conjecture 6.1. Positions here are indexed from
zero (`Fin n`); translating all positions by one gives the paper's indexing.
-/

namespace Conjectures.ChernFuLinThreeStatistic

open BursteinA218225

def pat3124 : Fin 4 → ℕ := ![3, 1, 2, 4]

def InZ {n : ℕ} (π : Equiv.Perm (Fin n)) : Prop :=
  ¬ ContainsPattern π pat3124 ∧ ¬ ContainsPattern π pat42153 ∧ ¬ ContainsPattern π pat24153

def IsLeftMin {n : ℕ} (π : Equiv.Perm (Fin n)) (i : Fin n) : Prop :=
  ∀ j < i, π i < π j

def IsRightMax {n : ℕ} (π : Equiv.Perm (Fin n)) (i : Fin n) : Prop :=
  ∀ j > i, π j < π i

/-- Positions, rather than the values or just the number, of left-to-right minima. -/
def lmi {n : ℕ} (π : Equiv.Perm (Fin n)) : Finset (Fin n) :=
  Finset.univ.filter fun i => ∀ j < i, π i < π j

def rma {n : ℕ} (π : Equiv.Perm (Fin n)) : ℕ :=
  ∑ i, if ∀ j > i, π j < π i then 1 else 0

/-- Descents of the inverse permutation, comparing consecutive *values*. -/
def ides : {n : ℕ} → Equiv.Perm (Fin n) → ℕ
  | 0, _ => 0
  | n + 1, π => ∑ i : Fin n, if π.symm i.succ < π.symm i.castSucc then 1 else 0

noncomputable def fibreCount {n : ℕ} (P : Equiv.Perm (Fin n) → Prop)
    (L : Finset (Fin n)) (r d : ℕ) : ℕ :=
  Nat.card {π : Equiv.Perm (Fin n) // P π ∧ lmi π = L ∧ rma π = r ∧ ides π = d}

/-- The literal equidistribution proposition, including the empty length. -/
def Equidistributed : Prop :=
  ∀ (n : ℕ) (L : Finset (Fin n)) (r d : ℕ),
    fibreCount InX L r d = fibreCount InZ L r d

theorem inZ_deleteMax {n : ℕ} {π : Equiv.Perm (Fin (n + 1))} (h : InZ π) :
    InZ (deleteMax π) :=
  ⟨fun hc => h.1 (containsPattern_of_deleteMax hc),
   fun hc => h.2.1 (containsPattern_of_deleteMax hc),
   fun hc => h.2.2 (containsPattern_of_deleteMax hc)⟩

@[simp] theorem mem_lmi {n : ℕ} {π : Equiv.Perm (Fin n)} {i : Fin n} :
    i ∈ lmi π ↔ IsLeftMin π i := by simp [lmi, IsLeftMin]

/-- Adding a maximum preserves the left-minimum status of each old position. -/
theorem isLeftMin_insertMax_old {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1))
    (i : Fin n) : IsLeftMin (insertMax π g) (g.succAbove i) ↔ IsLeftMin π i := by
  constructor
  · intro h j hji
    exact (insertMax_order_iff π g i j).1 (h _ (Fin.strictMono_succAbove g hji))
  · intro h j
    refine g.succAboveCases ?_ (fun k => ?_) j
    · intro _
      simpa only [insertMax_apply_self, insertMax_apply_succAbove] using Fin.castSucc_lt_last (π i)
    · intro hki
      exact (insertMax_order_iff π g i k).2 (h _ ((Fin.strictMono_succAbove g).lt_iff_lt.1 hki))

theorem isLeftMin_insertMax_new {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1)) :
    IsLeftMin (insertMax π g) g ↔ g = 0 := by
  constructor
  · intro h
    by_contra hg
    have h0 := h 0 (Fin.pos_iff_ne_zero.mpr hg)
    rw [insertMax_apply_self] at h0
    exact (Fin.le_last _).not_gt h0
  · rintro rfl j hj
    exact (Fin.not_lt_zero j hj).elim

/-- Old maxima survive precisely to the right of the inserted maximum. -/
theorem isRightMax_insertMax_old {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1))
    (i : Fin n) : IsRightMax (insertMax π g) (g.succAbove i) ↔
      g < g.succAbove i ∧ IsRightMax π i := by
  constructor
  · intro h
    refine ⟨?_, fun j hij => (insertMax_order_iff π g j i).1
      (h _ (Fin.strictMono_succAbove g hij))⟩
    apply lt_of_le_of_ne _ (Fin.succAbove_ne g i).symm
    by_contra! hlt
    have hm := h _ hlt
    rw [insertMax_apply_self] at hm
    exact (Fin.le_last _).not_gt hm
  · rintro ⟨hg, h⟩ j
    refine g.succAboveCases ?_ (fun k => ?_) j
    · exact fun hij => (lt_asymm hg hij).elim
    · intro hik
      exact (insertMax_order_iff π g k i).2 (h _ ((Fin.strictMono_succAbove g).lt_iff_lt.1 hik))

theorem isRightMax_insertMax_new {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1)) :
    IsRightMax (insertMax π g) g := by
  intro j hj
  obtain ⟨k, rfl⟩ := Fin.exists_succAbove_eq hj.ne'
  simpa only [insertMax_apply_self, insertMax_apply_succAbove] using Fin.castSucc_lt_last (π k)

theorem rma_insertMax {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1)) :
    rma (insertMax π g) = 1 + ∑ i : Fin n,
      if g < g.succAbove i ∧ (∀ j > i, π j < π i) then 1 else 0 := by
  unfold rma
  rw [Fin.sum_univ_succAbove _ g]
  refine congrArg₂ Nat.add (ite_eq_left (isRightMax_insertMax_new π g)) ?_
  apply Finset.sum_congr rfl
  intro i _
  exact if_congr (isRightMax_insertMax_old π g i) rfl rfl

@[simp] theorem insertMax_symm_castSucc {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n + 1))
    (i : Fin n) : (insertMax π g).symm i.castSucc = g.succAbove (π.symm i) := by
  apply (insertMax π g).injective
  simp [insertMax_apply_succAbove]

/-- Only the comparison between the two largest values can create an inverse descent. -/
theorem ides_insertMax {n : ℕ} (π : Equiv.Perm (Fin (n + 1))) (g : Fin (n + 2)) :
    ides (insertMax π g) = ides π + if g < g.succAbove (maxGap π) then 1 else 0 := by
  simp only [ides]
  rw [Fin.sum_univ_castSucc]
  congr 1
  · apply Finset.sum_congr rfl
    intro i _
    rw [Fin.succ_castSucc, insertMax_symm_castSucc, insertMax_symm_castSucc]
    exact if_congr (Fin.strictMono_succAbove g).lt_iff_lt rfl rfl
  · change (if maxGap (insertMax π g) < _ then 1 else 0) = _
    rw [maxGap_insertMax, insertMax_symm_castSucc]; rfl

end Conjectures.ChernFuLinThreeStatistic
