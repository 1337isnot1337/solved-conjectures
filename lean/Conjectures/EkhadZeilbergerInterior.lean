import Conjectures.EkhadZeilbergerWords

namespace EkhadZeilberger
noncomputable section
variable {α : Type*}

def SameInterior {n : ℕ} (A B : Fin (n+2) → α) : Prop :=
  ∀ i, 0 < i.val → i.val < n+1 → A i = B i

/-- With identical interiors, a one-step overlap is between words of the
forms a c…c and c…c b. Nonconstancy makes both words unbordered. -/
theorem self_overlap_absent_of_same_interior {n : ℕ}
    (A B : Fin (n+2) → α) (hA : ¬ConstantWord A) (hB : ¬ConstantWord B)
    (hi : SameInterior A B) (hAB : WordOverlap A B 1)
    (d : ℕ) (hd : 0<d) (hmax : d≤n+1) : ¬WordOverlap A A d ∧ ¬WordOverlap B B d := by
  let c := A (1 : Fin (n+2))
  have htail (s : ℕ) (hs : s+1<n+2) : A ⟨s+1,hs⟩=c := by
    induction s with
    | zero => rfl
    | succ s ih =>
      have hs' : s+1<n+2 := by omega
      have hab := hAB (s+1) (by omega)
      have hab' := hi ⟨s+1,hs'⟩ (show 0 < s+1 by omega) (show s+1 < n+1 by omega)
      exact hab.trans (hab'.symm.trans (ih hs'))
  have htail' (i : Fin (n+2)) (h0 : 0 < i.val) : A i = c := by
    have hn : i.val-1+1=i.val := by omega
    have hl := htail (i.val-1) (by rw [hn]; exact i.isLt)
    rwa [show (⟨i.val-1+1,by rw [hn]; exact i.isLt⟩ : Fin (n+2)) = i from Fin.ext hn] at hl
  have hprefix (i : Fin (n+2)) (h0 : i.val < n+1) : B i = c := by
    have h := hAB i.val (by omega)
    exact h.symm.trans (htail i.val (by omega))
  have HA0 : A 0 ≠ c := by
    intro h
    apply hA
    have hh (i : Fin (n+2)) : A i=c := by
      by_cases hs : i=0
      · simpa only [hs] using h
      · exact htail' i (by
          by_contra! hle
          exact hs (Fin.ext (Nat.le_zero.mp hle)))
    exact fun i j => (hh i).trans (hh j).symm
  have HBlast : B (Fin.last (n+1)) ≠ c := by
    intro h
    apply hB
    have hh (i : Fin (n+2)) : B i=c := by
      by_cases hs : i=Fin.last (n+1)
      · simpa only [hs] using h
      · exact hprefix i (by
          have hlt := i.isLt
          by_contra! hn
          exact hs (Fin.ext (by dsimp; omega)))
    exact fun i j => (hh i).trans (hh j).symm
  constructor
  · intro h
    have hidx : 0+d<n+2 := by omega
    exact HA0 ((h 0 hidx).symm.trans (htail' ⟨0+d,hidx⟩ (show 0 < 0+d by omega)))
  · intro h
    have he : n+1-d+d=n+1 := Nat.sub_add_cancel hmax
    have hidx : n+1-d+d<n+2 := by omega
    have hh := h (n+1-d) hidx
    rw [show (⟨n+1-d+d,hidx⟩ : Fin (n+2)) = Fin.last (n+1) from Fin.ext he] at hh
    exact HBlast (hh.trans (hprefix _ (by dsimp; omega)))

theorem zero_self_weights_of_same_interior {n : ℕ} (t : ℝ)
    (A B : Fin (n+2) → α) (hA : ¬ConstantWord A) (hB : ¬ConstantWord B)
    (hi : SameInterior A B) (hAB : WordOverlap A B 1 ∨ WordOverlap B A 1) :
    overlapWeight t A A (n+1)=0 ∧ overlapWeight t B B (n+1)=0 := by
  have hh (d : ℕ) (hd : 0<d) (hm : d≤n+1) : ¬WordOverlap A A d ∧ ¬WordOverlap B B d := by
    rcases hAB with hab | hba
    · exact self_overlap_absent_of_same_interior A B hA hB hi hab d hd hm
    · exact (self_overlap_absent_of_same_interior B A hB hA
        (fun i hi0 hi1 => (hi i hi0 hi1).symm) hba d hd hm).symm
  exact ⟨overlapWeight_zero_of_missing t A A _ (fun d h0 hm => (hh d h0 hm).1),
    overlapWeight_zero_of_missing t B B _ (fun d h0 hm => (hh d h0 hm).2)⟩

end
end EkhadZeilberger
