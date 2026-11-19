import Solitaire.BirthRange
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Order.Iterate

namespace SolitaireGeneral.LayerRule

def stablePile (L : LayerRule) (j k : ℕ) : ℕ := (L.remains^[k]) j

def stableMass (L : LayerRule) (j : ℕ) : ℕ :=
  ∑ k ∈ Finset.range (j+1), L.stablePile j k

@[simp] theorem remains_zero (L : LayerRule) : L.remains 0=0 := by
  simp [remains]

@[simp] theorem remains_one (L : LayerRule) : L.remains 1=0 := by
  simp [remains, L.one]

theorem remains_le (L : LayerRule) (n : ℕ) : L.remains n ≤ n := Nat.sub_le _ _

theorem remains_succ_le (L : LayerRule) (n : ℕ) : L.remains (n+1) ≤ L.remains n+1 := by
  have hp : L.picked n ≤ L.picked (n+1) := L.picked_monotone (by omega)
  have hb := L.picked_le n
  dsimp [remains]
  omega

theorem remains_le_add_one (L : LayerRule) (x y : ℕ) (h : x ≤ y+1) :
    L.remains x ≤ L.remains y+1 :=
  (L.remains_monotone h).trans (L.remains_succ_le y)

@[simp] theorem stablePile_zero_column (L : LayerRule) (j : ℕ) : L.stablePile j 0=j := rfl

theorem stablePile_succ (L : LayerRule) (j k : ℕ) :
    L.stablePile j (k+1)=L.remains (L.stablePile j k) :=
  Function.iterate_succ_apply' _ _ _

theorem stablePile_le_sub (L : LayerRule) (j k : ℕ) : L.stablePile j k ≤ j-k := by
  induction k with
  | zero => simp
  | succ k ih =>
    rw [stablePile_succ]
    by_cases h : L.stablePile j k=0
    · rw [h,remains_zero]
      omega
    · have hh := L.remains_lt (L.stablePile j k) (by omega)
      omega

theorem stablePile_eq_zero (L : LayerRule) (j k : ℕ) (h : j ≤ k) :
    L.stablePile j k=0 := by
  have hh := L.stablePile_le_sub j k
  omega

@[simp] theorem stablePile_zero_top (L : LayerRule) (k : ℕ) : L.stablePile 0 k=0 :=
  L.stablePile_eq_zero 0 k (Nat.zero_le _)

theorem stablePile_monotone (L : LayerRule) (k : ℕ) : Monotone (fun j => L.stablePile j k) := by
  induction k with
  | zero => exact monotone_id
  | succ k ih =>
    intro a b hab
    change L.stablePile a (k+1) ≤ L.stablePile b (k+1)
    rw [stablePile_succ,stablePile_succ]
    exact L.remains_monotone (ih hab)

theorem stablePile_antitone (L : LayerRule) (j : ℕ) : Antitone (L.stablePile j) := by
  apply antitone_nat_of_succ_le
  intro k
  rw [stablePile_succ]
  exact L.remains_le _

theorem stablePile_succ_le (L : LayerRule) (j k : ℕ) :
    L.stablePile (j+1) k ≤ L.stablePile j k+1 := by
  induction k with
  | zero => simp
  | succ k ih =>
    rw [stablePile_succ,stablePile_succ]
    exact L.remains_le_add_one _ _ ih

theorem stablePile_drop (L : LayerRule) (j k : ℕ) :
    L.stablePile j k-L.stablePile j (k+1)=L.picked (L.stablePile j k) := by
  rw [stablePile_succ]
  have h := L.picked_le (L.stablePile j k)
  dsimp [remains]
  omega

theorem stablePile_drop_antitone (L : LayerRule) (j : ℕ) :
    Antitone (fun k => L.stablePile j k-L.stablePile j (k+1)) := by
  intro k l hkl
  change L.stablePile j l-L.stablePile j (l+1) ≤ L.stablePile j k-L.stablePile j (k+1)
  rw [stablePile_drop,stablePile_drop]
  exact L.picked_monotone (L.stablePile_antitone j hkl)

@[simp] theorem stableMass_zero (L : LayerRule) : L.stableMass 0=0 := by
  simp [stableMass]

theorem le_stableMass (L : LayerRule) (j : ℕ) : j ≤ L.stableMass j := by
  simpa only [stableMass,stablePile_zero_column] using
    (Finset.single_le_sum (f := L.stablePile j) (fun i _ => Nat.zero_le _)
      (show 0 ∈ Finset.range (j+1) by simp))

theorem stablePile_zero_of_zero (L : LayerRule) (j k m : ℕ)
    (hk : L.stablePile j k=0) (hkm : k ≤ m) : L.stablePile j m=0 := by
  have hh := L.stablePile_antitone j hkm
  omega

theorem stableMass_eq_sum_range (L : LayerRule) (j N : ℕ)
    (hN : L.stablePile j N=0) :
    L.stableMass j=∑ k ∈ Finset.range N, L.stablePile j k := by
  unfold stableMass
  by_cases h : N ≤ j+1
  · symm
    apply Finset.sum_subset (Finset.range_mono h)
    intro k _ hk
    exact L.stablePile_zero_of_zero j N k hN (by simpa using hk)
  · apply Finset.sum_subset (Finset.range_mono (by omega : j+1 ≤ N))
    intro k _ hk
    exact L.stablePile_eq_zero j k (by simp only [Finset.mem_range] at hk; omega)

theorem stableMass_eq_sum_range_of_le (L : LayerRule) (j N : ℕ) (h : j ≤ N) :
    L.stableMass j=∑ k ∈ Finset.range N, L.stablePile j k :=
  L.stableMass_eq_sum_range j N (L.stablePile_eq_zero j N h)

theorem stableMass_prefix_le (L : LayerRule) (j N : ℕ) :
    (∑ k ∈ Finset.range N, L.stablePile j k) ≤ L.stableMass j := by
  by_cases h : j ≤ N
  · rw [L.stableMass_eq_sum_range_of_le j N h]
  · have heq : j+1=N+(j+1-N) := by omega
    rw [stableMass,heq,Finset.sum_range_add]
    omega

theorem stableMass_strictMono (L : LayerRule) : StrictMono L.stableMass := by
  intro i j hij
  rw [L.stableMass_eq_sum_range_of_le i (j+1) (by omega),
    L.stableMass_eq_sum_range_of_le j (j+1) (by omega)]
  apply Finset.sum_lt_sum
  · intro k _
    exact L.stablePile_monotone k (by omega)
  · exact ⟨0,by simp,by simpa using hij⟩

theorem stableMass_monotone (L : LayerRule) : Monotone L.stableMass :=
  L.stableMass_strictMono.monotone

def stableLength (L : LayerRule) (j : ℕ) : ℕ :=
  Nat.find (show ∃ k, L.stablePile j k=0 from ⟨j,L.stablePile_eq_zero j j le_rfl⟩)

theorem stableLength_zero (L : LayerRule) (j : ℕ) :
    L.stablePile j (L.stableLength j)=0 := by
  unfold stableLength
  exact Nat.find_spec (p := fun k => L.stablePile j k=0)
    (show ∃ k, L.stablePile j k=0 from ⟨j,L.stablePile_eq_zero j j le_rfl⟩)

theorem stableLength_le (L : LayerRule) (j : ℕ) : L.stableLength j ≤ j :=
  Nat.find_min' _ (L.stablePile_eq_zero j j le_rfl)

theorem stablePile_pos (L : LayerRule) (j k : ℕ) (hk : k < L.stableLength j) :
    0 < L.stablePile j k := by
  apply Nat.pos_of_ne_zero
  exact Nat.find_min (p := fun i => L.stablePile j i=0)
    (show ∃ i, L.stablePile j i=0 from ⟨j,L.stablePile_eq_zero j j le_rfl⟩) hk

theorem stableMass_length (L : LayerRule) (j : ℕ) :
    L.stableMass j=∑ k ∈ Finset.range (L.stableLength j), L.stablePile j k :=
  L.stableMass_eq_sum_range j _ (L.stableLength_zero j)

theorem stableMass_increment (L : LayerRule) (j : ℕ) :
    L.stableMass (j+1) ≤ L.stableMass j+L.stableLength j+1 := by
  let ell := L.stableLength j
  have hnew : L.stablePile (j+1) (ell+1)=0 := by
    rw [stablePile_succ]
    have hle := L.stablePile_succ_le j ell
    have hold := L.stableLength_zero j
    have hm := L.remains_monotone (show L.stablePile (j+1) ell ≤ 1 by
      dsimp [ell] at *; omega)
    rw [remains_one] at hm
    omega
  rw [L.stableMass_eq_sum_range (j+1) (ell+1) hnew,
    L.stableMass_eq_sum_range j (ell+1)
      (L.stablePile_zero_of_zero j ell (ell+1) (L.stableLength_zero j) (by omega))]
  calc
    (∑ k ∈ Finset.range (ell+1), L.stablePile (j+1) k)
      ≤ ∑ k ∈ Finset.range (ell+1), (L.stablePile j k+1) :=
        Finset.sum_le_sum (fun k _ => L.stablePile_succ_le j k)
    _ = (∑ k ∈ Finset.range (ell+1), L.stablePile j k)+L.stableLength j+1 := by
      simp [Finset.sum_add_distrib,ell,Nat.add_assoc]

end SolitaireGeneral.LayerRule
