import Solitaire.BirthRange
import Mathlib.Order.Interval.Finset.Nat

namespace SolitaireGeneral.LayerRule

noncomputable def ofLayers (layers : Set Nat) (hone : 1 ∈ layers) : LayerRule := by
  classical
  let sigma := fun n => ((Finset.range n).filter (fun k => k+1 ∈ layers)).card
  refine ⟨sigma,by simp [sigma],by simp [sigma,Finset.filter_singleton,hone],?_⟩
  intro n
  dsimp [sigma]
  rw [Finset.range_add_one,Finset.filter_insert]
  by_cases h : n+1 ∈ layers
  · right
    simp [h]
  · left
    simp [h]

theorem selected_iff_layer (layers : Set Nat) (hone : 1 ∈ layers)
    (r : Nat) (hr : 0 < r) : (ofLayers layers hone).Selected r ↔ r ∈ layers := by
  classical
  have hs : r-1+1=r := by omega
  unfold Selected ofLayers
  simp only
  conv_lhs => lhs; rw [← hs,Finset.range_add_one,Finset.filter_insert]
  by_cases h : r ∈ layers <;> simp [hs,h]

noncomputable def returnTime (L : LayerRule) (r : Nat) : Nat := by
  classical
  exact Nat.strongRecOn r (fun r ih =>
    if hr : r=0 then 0 else
      if L.Selected r then 1 else 1+ih (L.remains r) (L.remains_lt r (by omega)))

theorem returnTime_rec (L : LayerRule) (r : Nat) :
    L.returnTime r = if r=0 then 0 else
      if L.Selected r then 1 else 1+L.returnTime (L.remains r) := by
  classical
  unfold returnTime
  rw [Nat.strongRecOn_eq]
  split_ifs <;> rfl

theorem returnTime_zero (L : LayerRule) : L.returnTime 0=0 := by
  rw [returnTime_rec]
  simp

theorem returnTime_selected (L : LayerRule) (r : Nat) (hr : 0 < r)
    (hs : L.Selected r) : L.returnTime r=1 := by
  rw [returnTime_rec]
  simp [show r ≠ 0 by omega,hs]

theorem returnTime_unselected (L : LayerRule) (r : Nat) (hr : 0 < r)
    (hs : ¬L.Selected r) : L.returnTime r=1+L.returnTime (L.remains r) := by
  rw [returnTime_rec]
  simp [show r ≠ 0 by omega,hs]

theorem returnTime_pos (L : LayerRule) (r : Nat) (hr : 0 < r) : 0 < L.returnTime r := by
  rw [returnTime_rec]
  split_ifs <;> omega

theorem returnTime_le (L : LayerRule) (r : Nat) : L.returnTime r ≤ r := by
  induction r using Nat.strong_induction_on with
  | h r ih =>
    rw [returnTime_rec]
    split_ifs with hz hs
    · omega
    · omega
    · have hf := L.remains_lt r (by omega)
      have hh := ih (L.remains r) hf
      omega

theorem remains_selected (L : LayerRule) (r : Nat) (_hr : 0 < r) (hs : L.Selected r) :
    L.remains r=L.remains (r-1) := by
  have hle := L.picked_le (r-1)
  dsimp [remains,Selected] at *
  omega

theorem remains_unselected (L : LayerRule) (r : Nat) (hr : 0 < r)
    (hs : ¬L.Selected r) : L.remains r=L.remains (r-1)+1 := by
  have he := L.picked_flat_of_not_selected r hr hs
  have hle := L.picked_le (r-1)
  dsimp [remains]
  omega

theorem remains_pos_unselected (L : LayerRule) (r : Nat) (hr : 0 < r)
    (hs : ¬L.Selected r) : 0 < L.remains r := by
  rw [L.remains_unselected r hr hs]
  omega

theorem returnTime_one_iff (L : LayerRule) (r : Nat) (hr : 0 < r) :
    L.returnTime r=1 ↔ L.Selected r := by
  constructor
  · intro h
    by_contra hs
    have hf := L.remains_pos_unselected r hr hs
    have ht := L.returnTime_pos (L.remains r) hf
    rw [L.returnTime_unselected r hr hs] at h
    omega
  · exact L.returnTime_selected r hr

/-- The birth-range theorem now uses the internally defined return-time
function, leaving only the renewal/rank-periodicity premise. -/
theorem birth_range_of_periodicity (L : LayerRule) (birth : Nat → Nat)
    (m M : Nat) (hm : 0 < m) (tmin tmax : Nat)
    (hmin : birth tmin=m) (hmax : birth tmax=M)
    (hperiod : ∀ r, 0 < r → r ≤ M →
      Function.Periodic (fun t => r ≤ birth t) (L.returnTime r)) :
    L.remains M ≤ m :=
  L.birth_range birth L.returnTime m M hm tmin tmax hmin hmax hperiod
    L.returnTime_selected L.returnTime_unselected

noncomputable def survivingRanks (L : LayerRule) (j : Nat) : Finset Nat := by
  classical
  exact (Finset.range j).filter (fun k => ¬L.Selected (k+1))

theorem survivingRanks_card (L : LayerRule) (j : Nat) :
    (L.survivingRanks j).card=L.remains j := by
  classical
  induction j with
  | zero => simp [survivingRanks,remains,L.zero]
  | succ j ih =>
    have he : j+1-1=j := by omega
    by_cases hs : L.Selected (j+1)
    · have hf := L.remains_selected (j+1) (by omega) hs
      simp only [he] at hf
      simp only [survivingRanks] at ih ⊢
      rw [Finset.range_add_one,Finset.filter_insert]
      simp [hs,ih,hf]
    · have hf := L.remains_unselected (j+1) (by omega) hs
      simp only [he] at hf
      simp only [survivingRanks] at ih ⊢
      rw [Finset.range_add_one,Finset.filter_insert]
      simp [hs,ih,hf]

theorem remains_strict_at_unselected (L : LayerRule) (r s : Nat)
    (hrs : r < s) (hs : ¬L.Selected s) : L.remains r < L.remains s := by
  have he := L.remains_unselected s (by omega) hs
  have hm := L.remains_monotone (show r ≤ s-1 by omega)
  omega

theorem survivingRanks_injective (L : LayerRule) (j : Nat) :
    Set.InjOn (fun k => L.remains (k+1)) (L.survivingRanks j) := by
  classical
  intro r hr s hs heq
  change L.remains (r+1)=L.remains (s+1) at heq
  have hr' := (Finset.mem_filter.mp hr).2
  have hs' := (Finset.mem_filter.mp hs).2
  rcases lt_trichotomy r s with h|h|h
  · have hh := L.remains_strict_at_unselected (r+1) (s+1) (by omega) hs'
    omega
  · exact h
  · have hh := L.remains_strict_at_unselected (s+1) (r+1) (by omega) hr'
    omega

/-- Removing selected layers sends surviving birth ranks bijectively onto the
positive ranks of the remaining pile. -/
theorem survivingRanks_image (L : LayerRule) (j : Nat) :
    (L.survivingRanks j).image (fun k => L.remains (k+1))=Finset.Icc 1 (L.remains j) := by
  classical
  have hsub : (L.survivingRanks j).image (fun k => L.remains (k+1)) ⊆
      Finset.Icc 1 (L.remains j) := by
    intro s hs
    obtain ⟨r,hr,rfl⟩ := Finset.mem_image.mp hs
    obtain ⟨hrj,hrnot⟩ := Finset.mem_filter.mp hr
    have hrj' : r < j := Finset.mem_range.mp hrj
    have hp := L.remains_pos_unselected (r+1) (by omega) hrnot
    have hu := L.remains_monotone (show r+1 ≤ j by omega)
    exact Finset.mem_Icc.mpr ⟨by omega,hu⟩
  apply Finset.eq_of_subset_of_card_le hsub
  rw [Finset.card_image_of_injOn (L.survivingRanks_injective j),L.survivingRanks_card]
  simp

end SolitaireGeneral.LayerRule
