import Solitaire.RankPeriod

namespace SolitaireGeneral

/-- Nested periodic predicates with coprime periods cannot have both an upper
presence and a lower absence. -/
theorem nested_coprime_periods (P Q : Nat → Prop) (a b : Nat)
    (hP : Function.Periodic P a) (hQ : Function.Periodic Q b)
    (hab : a.Coprime b) (hsub : ∀ t, Q t → P t) (hQsome : ∃ t, Q t) :
    ∀ t, P t := by
  obtain ⟨u,hu⟩ := hQsome
  intro t
  let k := Nat.chineseRemainder hab t u
  have hka : (k:Nat)%a=t%a := k.property.1
  have hkb : (k:Nat)%b=u%b := k.property.2
  have hp : P (k:Nat)=P t := by
    rw [← hP.map_mod_nat (k:Nat),← hP.map_mod_nat t,hka]
  have hq : Q (k:Nat)=Q u := by
    rw [← hQ.map_mod_nat (k:Nat),← hQ.map_mod_nat u,hkb]
  exact hp.mp (hsub k (hq.mpr hu))

/-- The number picked is the cumulative indicator of selected layers. -/
structure LayerRule where
  picked : Nat → Nat
  zero : picked 0=0
  one : picked 1=1
  increment : ∀ n, picked (n+1)=picked n ∨ picked (n+1)=picked n+1

namespace LayerRule

def remains (L : LayerRule) (n : Nat) : Nat := n-L.picked n

def Selected (L : LayerRule) (r : Nat) : Prop := L.picked r=L.picked (r-1)+1

instance (L : LayerRule) (r : Nat) : Decidable (L.Selected r) :=
  inferInstanceAs (Decidable (L.picked r=L.picked (r-1)+1))

theorem picked_monotone (L : LayerRule) : Monotone L.picked := by
  apply monotone_nat_of_le_succ
  intro n
  rcases L.increment n with h|h <;> omega

theorem picked_le (L : LayerRule) (n : Nat) : L.picked n ≤ n := by
  induction n with
  | zero => rw [L.zero]
  | succ n ih => rcases L.increment n with h|h <;> omega

theorem picked_pos (L : LayerRule) (n : Nat) (hn : 0 < n) : 0 < L.picked n := by
  have hh := L.picked_monotone (show 1 ≤ n by omega)
  rw [L.one] at hh
  omega

theorem remains_lt (L : LayerRule) (n : Nat) (hn : 0 < n) : L.remains n < n := by
  have hh := L.picked_pos n hn
  dsimp [remains]
  omega

theorem remains_monotone (L : LayerRule) : Monotone L.remains := by
  apply monotone_nat_of_le_succ
  intro n
  have hp := L.picked_le n
  rcases L.increment n with h|h <;> simp only [remains,h] <;> omega

theorem picked_flat_of_not_selected (L : LayerRule) (r : Nat) (hr : 0 < r)
    (hnot : ¬L.Selected r) : L.picked r=L.picked (r-1) := by
  have hi := L.increment (r-1)
  have he : r-1+1=r := by omega
  rw [he] at hi
  rcases hi with h|h
  · exact h
  · exact False.elim (hnot h)

/-- The min/max birth interval contains no selected rank. -/
theorem interval_unselected (L : LayerRule) (birth : Nat → Nat) (tau : Nat → Nat)
    (m M : Nat) (tmin tmax : Nat) (hmin : birth tmin=m) (hmax : birth tmax=M)
    (hperiod : ∀ r, 0 < r → r ≤ M → Function.Periodic (fun t => r ≤ birth t) (tau r))
    (hselected : ∀ r, 0 < r → L.Selected r → tau r=1) :
    ∀ r, m < r → r ≤ M → ¬L.Selected r := by
  intro r hmr hrM hsel
  have hp := hperiod r (by omega) hrM
  rw [hselected r (by omega) hsel] at hp
  have hh : (r ≤ birth tmax) = (r ≤ birth tmin) := by
    rw [← hp.map_mod_nat tmax,← hp.map_mod_nat tmin]
    simp only [Nat.mod_one]
  have htrue : r ≤ birth tmax := by omega
  have hfalse := hh.mp htrue
  omega

theorem picked_constant_on_interval (L : LayerRule) (m M : Nat)
    (hnot : ∀ r, m < r → r ≤ M → ¬L.Selected r) :
    ∀ j, m ≤ j → j ≤ M → L.picked j=L.picked m := by
  intro j hm
  induction j, hm using Nat.le_induction with
  | base => intro _; rfl
  | succ j hm ih =>
    intro hjM
    have hj := ih (by omega)
    have hs := L.picked_flat_of_not_selected (j+1) (by omega)
      (hnot (j+1) (by omega) hjM)
    simpa using hs.trans hj

/-- The finite min/max inequality, using only the rank-return recursion and
the periodicity forced by renewal. -/
theorem birth_range (L : LayerRule) (birth : Nat → Nat) (tau : Nat → Nat)
    (m M : Nat) (hm : 0 < m) (tmin tmax : Nat)
    (hmin : birth tmin=m) (hmax : birth tmax=M)
    (hperiod : ∀ r, 0 < r → r ≤ M → Function.Periodic (fun t => r ≤ birth t) (tau r))
    (hselected : ∀ r, 0 < r → L.Selected r → tau r=1)
    (hunselected : ∀ r, 0 < r → ¬L.Selected r → tau r=1+tau (L.remains r)) :
    L.remains M ≤ m := by
  have hnot := L.interval_unselected birth tau m M tmin tmax hmin hmax hperiod hselected
  have hflat := L.picked_constant_on_interval m M hnot
  by_cases hMm : M ≤ m
  · dsimp [remains]
    omega
  have hc := L.picked_pos m hm
  have hM := hflat M (by omega) le_rfl
  by_contra hfail
  let r := m+1
  let s := m+1+L.picked m
  have hr : 0 < r := by dsimp [r]; omega
  have hs : 0 < s := by dsimp [s]; omega
  have hsM : s ≤ M := by
    dsimp [remains] at hfail
    dsimp [s]
    omega
  have hrM : r ≤ M := by dsimp [r,s] at *; omega
  have hsr : r ≤ s := by dsimp [r,s]; omega
  have hsp : L.picked s=L.picked m := hflat s (by dsimp [s]; omega) hsM
  have hremain : L.remains s=r := by dsimp [remains,r,s]; rw [hsp]; omega
  have htaus : tau s=1+tau r := by
    rw [hunselected s hs (hnot s (by dsimp [s]; omega) hsM),hremain]
  have hcop : (tau r).Coprime (tau s) := by
    rw [htaus,Nat.add_comm 1]
    exact Nat.coprime_self_add_right.mpr (by simp)
  have hall := nested_coprime_periods (fun t => r ≤ birth t) (fun t => s ≤ birth t)
    (tau r) (tau s) (hperiod r hr hrM) (hperiod s hs hsM) hcop
    (by intro t ht; omega) ⟨tmax,by omega⟩
  have hh := hall tmin
  dsimp [r] at hh
  omega

end LayerRule
end SolitaireGeneral
