import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring
import Mathlib.Tactic.IntervalCases

/-! Integral strict-greedy extensions for Batista's four congruence classes.
This file does not assume Chu's theorem as an axiom and does not claim to have
formalized its extremal comparison of all two-term underapproximations. -/
namespace Egyptian

/-- Cross-multiplied Egyptian fraction equation, with strictly ordered positive
integer denominators. -/
def Triple (p q x y z : Nat) : Prop :=
  0 < x ∧ x < y ∧ y < z ∧ p*x*y*z = q*(y*z + x*z + x*y)

/-- For h=1,2,3 the second strict-greedy error divides the denominator,
provided B is 0 or 2 modulo 3 in the h=3 case. -/
theorem error_divides (B h : Nat) (hh : 1 ≤ h ∧ h ≤ 3)
    (hmod : h = 3 → B % 3 = 0 ∨ B % 3 = 2) :
    0 < h - B % h ∧ h - B % h ≤ h ∧ (h - B % h) ∣ B := by
  have hr := Nat.mod_lt B (by omega : 0 < h)
  refine ⟨by omega, by omega, ?_⟩
  obtain ⟨hhlo, hhhi⟩ := hh
  interval_cases h
  · simpa only [Nat.mod_one, Nat.sub_zero] using (one_dvd B)
  · have hrem : B % 2 = 0 ∨ B % 2 = 1 := by omega
    rcases hrem with hr | hr
    · simpa [hr] using (Nat.dvd_of_mod_eq_zero hr)
    · simp [hr]
  · rcases hmod rfl with hr | hr
    · simpa [hr] using (Nat.dvd_of_mod_eq_zero hr)
    · simp [hr]

/-- The two strict greedy steps extend to a strictly ordered integral triple. -/
theorem greedy_extension (p q m h : Nat) (hm : 2 ≤ m)
    (hp : h ≤ p) (hh : 1 ≤ h ∧ h ≤ 3) (hq : q + h = p*m)
    (hmod : h = 3 → (q*m) % 3 = 0 ∨ (q*m) % 3 = 2) :
    ∃ y z, y = (q*m)/h + 1 ∧
      z = (q*m / (h - (q*m)%h)) * y ∧ Triple p q m y z := by
  let B := q*m
  let d := h - B%h
  let y := B/h + 1
  let z := (B/d)*y
  obtain ⟨hd, hdle, hdvd⟩ := error_divides B h hh hmod
  have hqpos : 0 < q := by nlinarith
  have hB : h*m ≤ B := by dsimp [B]; nlinarith
  have hdiv := Nat.mod_add_div B h
  have hrem := Nat.mod_lt B (by omega : 0 < h)
  have hdrel : d + B%h = h := Nat.sub_add_cancel (Nat.le_of_lt hrem)
  have hyrel : h*y = B+d := by dsimp [y]; nlinarith
  have hmy : m < y := by nlinarith
  have hquot : d*(B/d) = B := Nat.mul_div_cancel' hdvd
  have htwo : 2 ≤ B/d := by nlinarith
  have hyz : y < z := by dsimp [z]; nlinarith
  refine ⟨y,z,rfl,rfl,by omega,hmy,hyz,?_⟩
  have hzrel : d*z = B*y := by dsimp [z]; nlinarith [hquot]
  dsimp [B] at hyrel hzrel
  calc
    p*m*y*z = q*y*z + (h*y)*z := by rw [← hq]; ring
    _ = q*y*z + (q*m+d)*z := by rw [hyrel]
    _ = q*y*z + q*m*z + d*z := by ring
    _ = q*(y*z+m*z+m*y) := by rw [hzrel]; ring

/-- The residue-2 case has exactly the modular restriction used above. -/
theorem residue_two_modulus (q m : Nat) (hq : q+3=5*m) :
    (q*m)%3 = 0 ∨ (q*m)%3 = 2 := by
  have heq : q % 3 = (2 * (m % 3)) % 3 := by omega
  have hm := Nat.mod_lt m (by decide : 0 < 3)
  rw [Nat.mul_mod, heq]
  interval_cases m % 3 <;> norm_num

/-- Every k>5 outside residue class 1 has an ordered strict-greedy expansion.
The first denominator is k/5+1, also when 5 divides k. -/
theorem batista_greedy_exists (k : Nat) (hk : 5 < k) (hr : k%5 ≠ 1) :
    ∃ y z, Triple 5 k (k/5+1) y z := by
  have hdiv := Nat.mod_add_div k 5
  have hrem := Nat.mod_lt k (by decide : 0 < 5)
  have hm : 2 ≤ k/5+1 := by omega
  have hcases : k%5 = 0 ∨ k%5 = 2 ∨ k%5 = 3 ∨ k%5 = 4 := by omega
  rcases hcases with h0 | h2 | h3 | h4
  · obtain ⟨y,z,_,_,ht⟩ := greedy_extension 1 (k/5) (k/5+1) 1 hm
      (by decide) (by decide) (by omega) (by intro h; omega)
    refine ⟨y,z,ht.1,ht.2.1,ht.2.2.1,?_⟩
    have heq := ht.2.2.2
    have hkq : k = 5*(k/5) := by omega
    calc
      5*(k/5+1)*y*z = 5*(1*(k/5+1)*y*z) := by ring
      _ = 5*((k/5)*(y*z+(k/5+1)*z+(k/5+1)*y)) := by rw [heq]
      _ = (5*(k/5))*(y*z+(k/5+1)*z+(k/5+1)*y) := by ring
      _ = k*(y*z+(k/5+1)*z+(k/5+1)*y) := by rw [← hkq]
  · obtain ⟨y,z,_,_,ht⟩ := greedy_extension 5 k (k/5+1) 3 hm
      (by decide) (by decide) (by omega) (fun _ => residue_two_modulus _ _ (by omega))
    exact ⟨y,z,ht⟩
  · obtain ⟨y,z,_,_,ht⟩ := greedy_extension 5 k (k/5+1) 2 hm
      (by decide) (by decide) (by omega) (by intro h; omega)
    exact ⟨y,z,ht⟩
  · obtain ⟨y,z,_,_,ht⟩ := greedy_extension 5 k (k/5+1) 1 hm
      (by decide) (by decide) (by omega) (by intro h; omega)
    exact ⟨y,z,ht⟩

/-- The cross-multiplied equation is the actual rational fraction equation. -/
theorem triple_rational {p q x y z : Nat} (hq : 0 < q) (ht : Triple p q x y z) :
    (p : ℚ)/q = 1/(x : ℚ) + 1/(y : ℚ) + 1/(z : ℚ) := by
  obtain ⟨hx,hxy,hyz,heq⟩ := ht
  have hy : 0 < y := by omega
  have hz : 0 < z := by omega
  have heq' : (p:ℚ)*x*y*z = q*(y*z+x*z+x*y) := by exact_mod_cast heq
  field_simp
  nlinarith

#print axioms batista_greedy_exists
#print axioms triple_rational

/-- Every competing triple starts at or after the strict greedy denominator. -/
theorem first_denominator_bound {p q x y z : Nat}
    (hp : 0 < p) (hq : 0 < q) (ht : Triple p q x y z) : q/p+1 ≤ x := by
  have hf := triple_rational hq ht
  obtain ⟨hx,hxy,hyz,_⟩ := ht
  have hy : (0:ℚ) < y := by exact_mod_cast (show 0 < y by omega)
  have hz : (0:ℚ) < z := by exact_mod_cast (show 0 < z by omega)
  have hxq : (0:ℚ) < x := by exact_mod_cast hx
  have hqq : (0:ℚ) < q := by exact_mod_cast hq
  have hlt : (1:ℚ)/x < (p:ℚ)/q := by
    rw [hf]
    have := div_pos (show (0:ℚ)<1 by norm_num) hy
    have := div_pos (show (0:ℚ)<1 by norm_num) hz
    linarith
  have hcross := (div_lt_div_iff₀ hxq hqq).mp hlt
  have hnat : q < p*x := by exact_mod_cast (by simpa using hcross : (q:ℚ) < p*x)
  exact Nat.succ_le_of_lt ((Nat.div_lt_iff_lt_mul hp).mpr (by simpa [Nat.mul_comm] using hnat))

/-- Conditional transfer of a unique best two-term underapproximation to the
unique maximum last denominator. The hypothesis is exactly the optimizing
content of Chu's theorem and remains visible in this declaration. -/
theorem unique_maximum_from_pair_optimal {p q m y z : Nat} (hq : 0 < q)
    (hg : Triple p q m y z)
    (hoptimal : ∀ x' y' z', Triple p q x' y' z' →
      (1:ℚ)/x' + 1/(y':ℚ) ≤ 1/(m:ℚ) + 1/(y:ℚ))
    (hunique : ∀ x' y' z', Triple p q x' y' z' →
      (1:ℚ)/x' + 1/(y':ℚ) = 1/(m:ℚ) + 1/(y:ℚ) → x'=m ∧ y'=y) :
    ∀ x' y' z', Triple p q x' y' z' → z' ≤ z ∧ (z'=z → x'=m ∧ y'=y) := by
  intro x' y' z' ht
  have hf := triple_rational hq hg
  have hf' := triple_rational hq ht
  have hz : (0:ℚ) < z := by exact_mod_cast (show 0 < z from lt_trans hg.1 (lt_trans hg.2.1 hg.2.2.1))
  have hz' : (0:ℚ) < z' := by exact_mod_cast (show 0 < z' from lt_trans ht.1 (lt_trans ht.2.1 ht.2.2.1))
  have he : (1:ℚ)/z ≤ 1/(z':ℚ) := by linarith [hoptimal x' y' z' ht]
  have hc := (div_le_div_iff₀ hz hz').mp he
  refine ⟨by exact_mod_cast (by simpa using hc : (z':ℚ) ≤ z), ?_⟩
  intro heq
  apply hunique x' y' z' ht
  subst z'
  linarith

#print axioms first_denominator_bound
#print axioms unique_maximum_from_pair_optimal

end Egyptian
