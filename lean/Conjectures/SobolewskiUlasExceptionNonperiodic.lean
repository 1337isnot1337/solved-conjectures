module

public import Conjectures.SobolewskiUlasExceptionCount

@[expose] public section
namespace SobolewskiUlasException

theorem twoPower_odd_part (m : ℕ) (hm : 0<m) :
    ∃ e u : ℕ,u%2=1 ∧ m=2^e*u := by
  induction m using Nat.strong_induction_on with
  | h m ih =>
    by_cases he : m%2=0
    · have h₁ : 0<m/2 := by omega
      have h₂ : m/2<m := by omega
      obtain ⟨e,u,hu,hd⟩ := ih (m/2) h₂ h₁
      refine ⟨e+1,u,hu,?_⟩
      rw [pow_succ',mul_assoc,← hd]
      omega
    · exact ⟨0,m,by omega,by simp⟩

theorem twoPower_odd_exponent_unique {a b x y : ℕ}
    (hx : x%2=1) (hy : y%2=1) (he : 2^a*x=2^b*y) : a=b := by
  wlog hab : a≤b generalizing a b x y
  · exact (this hy hx he.symm (by omega)).symm
  obtain ⟨d,hd⟩ := Nat.exists_eq_add_of_le hab
  subst b
  rw [pow_add,mul_assoc] at he
  have hc := Nat.eq_of_mul_eq_mul_left (show 0<2^a by positivity) he
  cases d with
  | zero => simp
  | succ d =>
    rw [pow_succ',mul_assoc] at hc
    omega

theorem oddExponent_multiple_of_period (p : ℕ) (hp : 0<p) :
    ∃ t e u : ℕ,e%2=1 ∧ u%2=1 ∧ t*p=2^e*u := by
  obtain ⟨e,u,hu,he⟩ := twoPower_odd_part p hp
  by_cases h : e%2=0
  · refine ⟨2,e+1,u,by omega,hu,?_⟩
    rw [he,pow_succ',mul_assoc]
  · exact ⟨1,e,u,by omega,hu,by simpa using he⟩

theorem fourPower_eq_twoPower (j : ℕ) : 4^j=2^(2*j) := by
  rw [pow_mul]
  rfl

theorem scaled_not_of_odd_exponent {m e u : ℕ}
    (he : e%2=1) (hu : u%2=1) (hm : m=2^e*u) : ¬inScaled m := by
  intro h
  obtain ⟨j,s,hs⟩ := h
  rw [fourPower_eq_twoPower] at hs
  have hk := twoPower_odd_exponent_unique (baseValue_odd s) hu (hs.trans hm)
  omega

def UltimatelyPeriodic (pred : ℕ→Prop) : Prop :=
  ∃ threshold period : ℕ,0<period ∧ ∀ x≥threshold,pred (x+period) ↔ pred x

theorem periodic_multiple {P : ℕ→Prop} {N p m : ℕ}
    (hp : ∀ x≥N,P (x+p) ↔ P x) (hm : N≤m) (t : ℕ) :
    P (m+t*p) ↔ P m := by
  induction t with
  | zero => simp
  | succ t ih =>
    rw [Nat.succ_mul,← Nat.add_assoc]
    exact (hp (m+t*p) (by omega)).trans ih

/-- The literal union of the odd Thue–Morse layers has no eventual
period. This is the obstruction needed before the Cobham step. -/
theorem scaledExceptions_not_ultimatelyPeriodic : ¬UltimatelyPeriodic inScaled := by
  rintro ⟨N,p,hp,hperiod⟩
  obtain ⟨t,e,u,he,hu,hq⟩ := oddExponent_multiple_of_period p hp
  let j := e/2
  have he' : e=2*j+1 := by dsimp [j]; omega
  let x := 4^(j+1+N)*baseValue 0
  have hx : inScaled x := ⟨j+1+N,0,rfl⟩
  have hbase : (2:ℕ)^N≤4^(j+1+N) := (Nat.pow_le_pow_left (by decide) _).trans
    (Nat.pow_le_pow_right (by decide) (by omega))
  have hN : N≤x := by
    have hlt : N<(2:ℕ)^N := Nat.lt_two_pow_self
    have h₀ : 0<baseValue 0 := by decide
    exact (hlt.le.trans hbase).trans (Nat.le_mul_of_pos_right _ h₀)
  have hfac : x=2^e*(2*(4^N*baseValue 0)) := by
    dsimp only [x]
    calc
      _ = 4^j * 4 * (4^N * baseValue 0) := by rw [pow_add,pow_succ]; ring
      _ = _ := by rw [he',pow_succ,← fourPower_eq_twoPower]; ring
  have hm : x+t*p=2^e*(2*(4^N*baseValue 0)+u) := by
    rw [hfac,hq,Nat.mul_add]
  have hmOdd : (2*(4^N*baseValue 0)+u)%2=1 := by omega
  exact (scaled_not_of_odd_exponent he hmOdd hm) ((periodic_multiple hperiod hN t).mpr hx)

end SobolewskiUlasException
