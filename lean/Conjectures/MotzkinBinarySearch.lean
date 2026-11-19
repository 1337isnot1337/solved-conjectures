import Conjectures.MotzkinFloorSumCost

/-! Binary search with an explicit oracle-call bound. The bracket theorem
does not assume monotonicity; the last-true corollary uses it to certify the
global optimum. -/
namespace Motzkin.Search

def lastTrue (P : ℕ → Bool) (lo hi : ℕ) : ℕ :=
  if h : hi-lo ≤ 1 then lo else
  let mid := (lo+hi)/2
  if P mid then lastTrue P mid hi else lastTrue P lo mid
termination_by hi-lo
decreasing_by all_goals omega

def calls (P : ℕ → Bool) (lo hi : ℕ) : ℕ :=
  if h : hi-lo ≤ 1 then 0 else
  let mid := (lo+hi)/2
  if P mid then 1+calls P mid hi else 1+calls P lo mid
termination_by hi-lo
decreasing_by all_goals omega

theorem midpoint_bounds (lo hi : ℕ) (h : 1 < hi-lo) :
    lo < (lo+hi)/2 ∧ (lo+hi)/2 < hi := by omega

private theorem bracket_aux (P : ℕ → Bool) (w : ℕ) :
    ∀ lo hi : ℕ, hi-lo=w → lo < hi → P lo=true → P hi=false →
      lo ≤ lastTrue P lo hi ∧ lastTrue P lo hi < hi ∧
        P (lastTrue P lo hi)=true ∧ P (lastTrue P lo hi+1)=false := by
  induction w using Nat.strong_induction_on with
  | h w ih =>
    intro lo hi hw hlt hlo hhi
    by_cases hs : hi-lo ≤ 1
    · have he : hi=lo+1 := by omega
      simpa only [lastTrue,dite_eq_left hs,he,Nat.le_refl,Nat.lt_succ_self,true_and]
        using And.intro hlo hhi
    have hm := midpoint_bounds lo hi (by omega)
    rw [lastTrue,dite_eq_right hs]
    dsimp only
    by_cases hc : P ((lo+hi)/2)=true
    · rw [ite_eq_left hc]
      obtain ⟨hl,hu,hp,hq⟩ := ih (hi-(lo+hi)/2) (by omega)
        ((lo+hi)/2) hi rfl hm.2 hc hhi
      exact ⟨hm.1.le.trans hl,hu,hp,hq⟩
    · rw [ite_eq_right hc]
      have hc' : P ((lo+hi)/2)=false := by
        cases he : P ((lo+hi)/2) <;> simp_all
      obtain ⟨hl,hu,hp,hq⟩ := ih ((lo+hi)/2-lo) (by omega)
        lo ((lo+hi)/2) rfl hm.1 hlo hc'
      exact ⟨hl,hu.trans hm.2,hp,hq⟩

theorem bracket (P : ℕ → Bool) (lo hi : ℕ) (hlt : lo < hi)
    (hlo : P lo=true) (hhi : P hi=false) :
    lo ≤ lastTrue P lo hi ∧ lastTrue P lo hi < hi ∧
      P (lastTrue P lo hi)=true ∧ P (lastTrue P lo hi+1)=false :=
  bracket_aux P (hi-lo) lo hi rfl hlt hlo hhi

theorem is_last_true (P : ℕ → Bool)
    (hmono : ∀ x y : ℕ, x ≤ y → P y=true → P x=true)
    (lo hi : ℕ) (hlt : lo < hi) (hlo : P lo=true) (hhi : P hi=false) :
    P (lastTrue P lo hi)=true ∧ ∀ x : ℕ, P x=true → x ≤ lastTrue P lo hi := by
  obtain ⟨_,_,htrue,hfalse⟩ := bracket P lo hi hlt hlo hhi
  refine ⟨htrue,?_⟩
  intro x hx
  by_contra h
  have hh := hmono (lastTrue P lo hi+1) x (by omega) hx
  rw [hfalse] at hh
  contradiction

private theorem size_lt_of_twice_le {q M : ℕ} (hM : 0 < M) (h : 2*q ≤ M) :
    q.size < M.size := by
  by_cases hq : q=0
  · subst q
    simpa only [Nat.size_zero] using Nat.size_pos.mpr hM
  have hs : (2*q).size=q.size+1 := by
    simpa [Nat.shiftLeft_eq,mul_comm] using Nat.size_shiftLeft (m:=q) hq 1
  have hm := Nat.size_le_size h
  rw [hs] at hm
  omega

private theorem calls_le_size_aux (P : ℕ → Bool) (w : ℕ) :
    ∀ lo hi : ℕ, hi-lo=w → calls P lo hi ≤ (hi-lo-1).size := by
  induction w using Nat.strong_induction_on with
  | h w ih =>
    intro lo hi hw
    by_cases hs : hi-lo ≤ 1
    · simp only [calls,dite_eq_left hs]
      exact Nat.zero_le _
    have hm := midpoint_bounds lo hi (by omega)
    rw [calls,dite_eq_right hs]
    dsimp only
    by_cases hc : P ((lo+hi)/2)=true
    · rw [ite_eq_left hc]
      have hind := ih (hi-(lo+hi)/2) (by omega) ((lo+hi)/2) hi rfl
      have hsize := size_lt_of_twice_le
        (show 0 < hi-lo-1 by omega) (show 2*(hi-(lo+hi)/2-1) ≤ hi-lo-1 by omega)
      omega
    · rw [ite_eq_right hc]
      have hind := ih ((lo+hi)/2-lo) (by omega) lo ((lo+hi)/2) rfl
      have hsize := size_lt_of_twice_le
        (show 0 < hi-lo-1 by omega) (show 2*((lo+hi)/2-lo-1) ≤ hi-lo-1 by omega)
      omega

theorem calls_le_size (P : ℕ → Bool) (lo hi : ℕ) :
    calls P lo hi ≤ (hi-lo-1).size := calls_le_size_aux P (hi-lo) lo hi rfl

theorem calls_le_log2 (P : ℕ → Bool) (lo hi N : ℕ) (hN : 0 < N)
    (hwidth : hi-lo-1 ≤ N) : calls P lo hi ≤ N.log2+1 := by
  rw [← FloorSum.size_eq_log2_add_one hN]
  exact (calls_le_size P lo hi).trans (Nat.size_le_size hwidth)

end Motzkin.Search
