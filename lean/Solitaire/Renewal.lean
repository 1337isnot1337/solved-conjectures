import Solitaire.Dynamics
import Solitaire.RankCounts

namespace SolitaireGeneral.LayerRule
namespace Cycle

variable {L : LayerRule} {n p : Nat} [NeZero p]

/-- Counting cards by their birth rank and exact return time gives the
renewal equation for the actual solitaire move. -/
theorem renewal (C : Cycle L n p) (t : ZMod p) :
    C.birth t = ∑ r ∈ Finset.range n,
      if r < C.birth (t-L.returnTime (r+1)) then 1 else 0 := by
  rw [C.birth_ages t]
  have hc : ∀ k, L.picked (C.age (t-1) k)=
      ∑ r ∈ Finset.range n,
        if r < C.birth (t-1-k) ∧ L.returnTime (r+1)=k+1 then 1 else 0 := by
    intro k
    exact L.returnTime_count_up_to _ n k (C.birth_le _)
  simp_rw [hc]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro r hr
  have hrn : r < n := Finset.mem_range.mp hr
  have hp := L.returnTime_pos (r+1) (by omega)
  have hu := L.returnTime_le (r+1)
  let d := L.returnTime (r+1)-1
  have hd : L.returnTime (r+1)=d+1 := by dsimp [d]; omega
  have hdn : d < n := by dsimp [d]; omega
  rw [Finset.sum_eq_single d]
  · rw [hd]
    simp only [and_true,Nat.cast_add,Nat.cast_one,sub_sub]
    rw [add_comm (1:ZMod p) (d:ZMod p)]
  · intro k _ hkd
    have hne : L.returnTime (r+1) ≠ k+1 := by omega
    simp [hne]
  · intro hnot
    exact False.elim (hnot (Finset.mem_range.mpr hdn))

theorem prefix_count (N b : Nat) (hb : b ≤ N) :
    (∑ r ∈ Finset.range N, if r < b then 1 else 0)=b := by
  have he : (Finset.range N).filter (fun r => r < b)=Finset.range b := by
    ext r
    simp only [Finset.mem_filter,Finset.mem_range]
    omega
  rw [← Finset.sum_filter,he]
  simp

/-- Every birth-rank indicator is periodic with its internally defined
return time; no periodicity hypothesis remains. -/
theorem rank_period (C : Cycle L n p) (r : Nat) (hr : 0 < r) (hrn : r ≤ n) :
    Function.Periodic (fun t : ZMod p => r ≤ C.birth t) (L.returnTime r : ZMod p) := by
  have hre : ∀ t : ZMod p,
      (∑ q : Fin n, bit (decide (q.val < C.birth (t-L.returnTime (q.val+1))))) =
        ∑ q : Fin n, if q.val < C.birth t then (1:Int) else 0 := by
    intro t
    have hn : (∑ q ∈ Finset.range n,
        if q < C.birth (t-L.returnTime (q+1)) then 1 else 0) =
          ∑ q ∈ Finset.range n, if q < C.birth t then 1 else 0 := by
      rw [← C.renewal t,prefix_count n (C.birth t) (C.birth_le t)]
    simp only [bit,decide_eq_true_eq]
    rw [Fin.sum_univ_eq_sum_range
      (fun q : Nat => if q < C.birth (t-L.returnTime (q+1)) then (1:Int) else 0) n,
      Fin.sum_univ_eq_sum_range
      (fun q : Nat => if q < C.birth t then (1:Int) else 0) n]
    exact_mod_cast hn
  have hp := renewal_rank_period n C.birth (fun q : Fin n => (L.returnTime (q.val+1):ZMod p)) hre
  have he : r-1+1=r := by omega
  have hq := hp (⟨r-1,by omega⟩:Fin n)
  intro t
  have ht := hq t
  change (r-1 < C.birth (t+(L.returnTime (r-1+1):ZMod p)))=(r-1 < C.birth t) at ht
  rw [he] at ht
  apply propext
  constructor
  · intro h
    have hh := ht.mp (show r-1 < C.birth (t+(L.returnTime r:ZMod p)) by omega)
    omega
  · intro h
    have hh := ht.mpr (show r-1 < C.birth t by omega)
    omega

theorem rank_period_nat (C : Cycle L n p) (r : Nat) (hr : 0 < r) (hrn : r ≤ n) :
    Function.Periodic (fun t : Nat => r ≤ C.birth (t:ZMod p)) (L.returnTime r) := by
  intro t
  simpa only [Nat.cast_add] using C.rank_period r hr hrn (t:ZMod p)

/-- Any two attained births obey the finite range bound. -/
theorem attained_birth_range (C : Cycle L n p) (hn : 0 < n) (u v : ZMod p) :
    L.remains (C.birth v) ≤ C.birth u := by
  apply L.birth_range_of_periodicity (fun t => C.birth (t:ZMod p))
    (C.birth u) (C.birth v) (C.birth_pos hn u) u.val v.val
  · simp only [ZMod.natCast_zmod_val]
  · simp only [ZMod.natCast_zmod_val]
  · intro r hr hrM
    exact C.rank_period_nat r hr (hrM.trans (C.birth_le v))

end Cycle
end SolitaireGeneral.LayerRule
