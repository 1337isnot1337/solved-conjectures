import Conjectures.Egyptian

/-! Elementary global bounds for Egyptian-fraction competitors. -/
namespace Egyptian

/-- An integer residual of at least a improves the universal last-denominator bound. -/
theorem residual_bound (a e b T : Nat) (he : 0 < e) (ha : a ≤ e)
    (heq : e*T=b*(b+e)) : a*T ≤ b*(b+a) := by
  have hmul := Nat.mul_le_mul_right (b*b) ha
  have hscaled : e*(a*T) ≤ e*(b*(b+a)) := by
    calc
      e*(a*T) = a*(e*T) := by ring
      _ = a*(b*(b+e)) := by rw [heq]
      _ ≤ e*(b*(b+a)) := by nlinarith only [hmul]
  exact Nat.le_of_mul_le_mul_left hscaled he

/-- A concave quadratic positive at both endpoints is positive between them. -/
theorem concave_quadratic_positive (c d e a b v : ℤ)
    (hc : 0 ≤ c) (hab : a < b) (hav : a ≤ v) (hvb : v ≤ b)
    (ha : 0 < -c*a^2+d*a+e) (hb : 0 < -c*b^2+d*b+e) :
    0 < -c*v^2+d*v+e := by
  let P := fun t : ℤ => -c*t^2+d*t+e
  have hid : (b-a)*P v = (b-v)*P a+(v-a)*P b+c*(b-a)*(v-a)*(b-v) := by
    dsimp [P]
    ring
  have h1 : 0 ≤ (b-v)*P a := mul_nonneg (by omega) (le_of_lt ha)
  have h2 : 0 ≤ (v-a)*P b := mul_nonneg (by omega) (le_of_lt hb)
  have h3 : 0 ≤ c*(b-a)*(v-a)*(b-v) := by positivity
  have hpos : 0 < (b-v)*P a+(v-a)*P b := by
    by_cases hva : v=a
    · subst v
      have hh : 0 < (b-a)*P a := mul_pos (by omega) ha
      nlinarith only [hh]
    · have hh : 0 < (v-a)*P b := mul_pos (by omega) hb
      omega
  have hp : 0 < (b-a)*P v := by rw [hid]; omega
  by_contra hn
  have hnon : P v ≤ 0 := by dsimp [P]; omega
  have hneg := mul_nonpos_of_nonneg_of_nonpos (show 0 ≤ b-a by omega) hnon
  omega

def gap (p q m h v : Nat) : ℤ :=
  (p:ℤ)*v*((q:ℤ)*m)^2 - q*((q:ℤ)*m)^2 - (h:ℤ)^2*(q*v)*(q*v+1)

theorem endpoint_bounds (p q m h : Nat) (hm : 20 ≤ m) (hq : q+h=p*m)
    (hcases : (p=1 ∧ h=1) ∨ (p=5 ∧ (h=1 ∨ h=2 ∨ h=3))) :
    0 < gap p q m h (m+2) ∧ 0 < gap p q m h (3*m) := by
  let u : ℤ := (m:ℤ)-20
  have hu : 0 ≤ u := by dsimp [u]; omega
  have hM : (m:ℤ) = u+20 := by dsimp [u]; ring
  have hQ : (q:ℤ) = (p:ℤ)*(u+20)-h := by
    have hh : (q:ℤ)+h=(p:ℤ)*m := by exact_mod_cast hq
    rw [hM] at hh
    omega
  rcases hcases with ⟨rfl,rfl⟩ | ⟨rfl,hh⟩
  · constructor <;> unfold gap <;> push_cast <;> rw [hQ,hM] <;> norm_num <;> apply sub_pos.mp <;> ring_nf <;> positivity
  · rcases hh with rfl | rfl | rfl
    all_goals constructor <;> unfold gap <;> push_cast <;> rw [hQ,hM] <;> norm_num <;> apply sub_pos.mp <;> ring_nf <;> positivity

/-- All first denominators at least m+2 are excluded by a concave quadratic. -/
theorem separated_first_bound (p q m h v : Nat) (hm : 20 ≤ m) (hq : q+h=p*m)
    (hcases : (p=1 ∧ h=1) ∨ (p=5 ∧ (h=1 ∨ h=2 ∨ h=3)))
    (hvlo : m+2 ≤ v) (hvhi : v ≤ 3*m) :
    (h:ℤ)^2*(q*v)*(q*v+1) < ((p:ℤ)*v-q)*((q:ℤ)*m)^2 := by
  obtain ⟨ha,hb⟩ := endpoint_bounds p q m h hm hq hcases
  have hquad := concave_quadratic_positive
    ((h:ℤ)^2*q^2) ((p:ℤ)*((q:ℤ)*m)^2-(h:ℤ)^2*q)
    (-((q:ℤ)*((q:ℤ)*m)^2)) ((m:ℤ)+2) (3*(m:ℤ)) v
    (by positivity) (by omega) (by exact_mod_cast hvlo) (by exact_mod_cast hvhi)
  have ha' : 0 < -((h:ℤ)^2*q^2)*((m:ℤ)+2)^2+
      ((p:ℤ)*((q:ℤ)*m)^2-(h:ℤ)^2*q)*((m:ℤ)+2)-q*((q:ℤ)*m)^2 := by
    convert ha using 1
    unfold gap
    push_cast
    ring
  have hb' : 0 < -((h:ℤ)^2*q^2)*(3*(m:ℤ))^2+
      ((p:ℤ)*((q:ℤ)*m)^2-(h:ℤ)^2*q)*(3*(m:ℤ))-q*((q:ℤ)*m)^2 := by
    convert hb using 1
    unfold gap
    push_cast
    ring
  have hpos := hquad ha' hb'
  nlinarith only [hpos]

#print axioms separated_first_bound
/-- The immediate neighbor is excluded by the ordinary residual bound for h≤2. -/
theorem neighbor_first_bound (p q m h : Nat) (hm : 20 ≤ m) (hq : q+h=p*m)
    (hcases : (p=1 ∧ h=1) ∨ (p=5 ∧ (h=1 ∨ h=2))) :
    (h:ℤ)^2*(q*(m+1))*(q*(m+1)+1) <
      ((p:ℤ)*(m+1)-q)*((q:ℤ)*m)^2 := by
  let u : ℤ := (m:ℤ)-20
  have hu : 0 ≤ u := by dsimp [u]; omega
  have hM : (m:ℤ) = u+20 := by dsimp [u]; ring
  have hQ : (q:ℤ) = (p:ℤ)*(u+20)-h := by
    have hh : (q:ℤ)+h=(p:ℤ)*m := by exact_mod_cast hq
    rw [hM] at hh
    omega
  rcases hcases with ⟨rfl,rfl⟩ | ⟨rfl,hh⟩
  · push_cast; rw [hQ,hM]; norm_num; apply sub_pos.mp; ring_nf; positivity
  · rcases hh with rfl | rfl
    all_goals push_cast; rw [hQ,hM]; norm_num; apply sub_pos.mp; ring_nf; positivity

/-- The h=3 neighbor uses the stronger residual bound e≥3. -/
theorem neighbor_three_bound (q m : Nat) (hm : 20 ≤ m) (hq : q+3=5*m) :
    (9:ℤ)*(q*(m+1))*(q*(m+1)+3) < 24*((q:ℤ)*m)^2 := by
  let u : ℤ := (m:ℤ)-20
  have hu : 0 ≤ u := by dsimp [u]; omega
  have hM : (m:ℤ) = u+20 := by dsimp [u]; ring
  have hQ : (q:ℤ) = 5*(u+20)-3 := by
    have hh : (q:ℤ)+3=5*m := by exact_mod_cast hq
    rw [hM] at hh
    omega
  rw [hQ,hM]
  apply sub_pos.mp
  ring_nf
  positivity

theorem neighbor_residual_three (q m v e : Nat) (hq : q+3=5*m)
    (he : 0 < e) (herel : q*(m+1)+e=8*v) : 3 ≤ e := by
  have heq : q % 8 = (5*(m%8)+5) % 8 := by omega
  have hmod : (q*(m+1))%8=0 ∨ (q*(m+1))%8=4 ∨ (q*(m+1))%8=5 := by
    rw [Nat.mul_mod, Nat.add_mod, heq]
    have hm := Nat.mod_lt m (by decide : 0 < 8)
    interval_cases m%8 <;> norm_num
  omega

/-- Residual identities and positivity, obtained from an actual triple. -/
theorem triple_residuals {p q x v w : Nat} (hp : 0 < p) (hq : 0 < q)
    (ht : Triple p q x v w) :
    ∃ t b e, 0 < t ∧ 0 < b ∧ 0 < e ∧
      q+t=p*x ∧ b=q*x ∧ t*v=b+e ∧ e*w=b*v ∧ e*(t*w)=b*(b+e) := by
  have hfirst := first_denominator_bound hp hq ht
  have hlt : q < x*p := (Nat.div_lt_iff_lt_mul hp).mp (by omega : q/p<x)
  have hlt2 : q < p*x := by simpa [Nat.mul_comm] using hlt
  let t := p*x-q
  let b := q*x
  have htpos : 0 < t := by dsimp [t]; omega
  have hbpos : 0 < b := Nat.mul_pos hq ht.1
  have hqt : q+t=p*x := by dsimp [t]; omega
  have hfull : (q+t)*v*w = q*(v*w+x*w+x*v) := by rw [hqt]; exact ht.2.2.2
  have hres : (t*v)*w=b*v+b*w := by dsimp [b]; nlinarith only [hfull]
  have hvpos : 0 < v := lt_trans ht.1 ht.2.1
  have hwpos : 0 < w := lt_trans hvpos ht.2.2.1
  have hvlt : b < t*v := by
    by_contra hn
    have hh := Nat.mul_le_mul_right w (show t*v ≤ b by omega)
    have hhpos := Nat.mul_pos hbpos hvpos
    omega
  let e := t*v-b
  have hepos : 0 < e := by dsimp [e]; omega
  have htv : t*v=b+e := by dsimp [e]; omega
  have hew : e*w=b*v := by rw [htv] at hres; nlinarith only [hres]
  refine ⟨t,b,e,htpos,hbpos,hepos,hqt,rfl,htv,hew,?_⟩
  calc
    e*(t*w)=t*(e*w) := by ring
    _=t*(b*v) := by rw [hew]
    _=b*(t*v) := by ring
    _=b*(b+e) := by rw [htv]

theorem first_denominator_upper {p q x v w : Nat} (hq : 0 < q)
    (ht : Triple p q x v w) : p*x < 3*q := by
  have hf := triple_rational hq ht
  have hx : (0:ℚ) < x := by exact_mod_cast ht.1
  have hv : (0:ℚ) < v := by exact_mod_cast (lt_trans ht.1 ht.2.1)
  have hw : (0:ℚ) < w := by exact_mod_cast (lt_trans (lt_trans ht.1 ht.2.1) ht.2.2.1)
  have hqq : (0:ℚ) < q := by exact_mod_cast hq
  have hvx : (1:ℚ)/v < 1/(x:ℚ) := (div_lt_div_iff₀ hv hx).mpr (by simpa using (show (x:ℚ)<v by exact_mod_cast ht.2.1))
  have hwx : (1:ℚ)/w < 1/(x:ℚ) := (div_lt_div_iff₀ hw hx).mpr (by simpa using (show (x:ℚ)<w by exact_mod_cast (lt_trans ht.2.1 ht.2.2.1)))
  have hlt : (p:ℚ)/q < 3/(x:ℚ) := by
    rw [hf]
    have hh : (3:ℚ)/x=3*((1:ℚ)/x) := by ring
    rw [hh]
    linarith
  exact_mod_cast (div_lt_div_iff₀ hqq hx).mp hlt

/-- Every larger first denominator loses to the square lower bound. -/
theorem larger_first_denominator_bound (p q m h x v w : Nat)
    (hm : 20 ≤ m) (hq : q+h=p*m)
    (hcases : (p=1 ∧ h=1) ∨ (p=5 ∧ (h=1 ∨ h=2 ∨ h=3)))
    (ht : Triple p q x v w) (hxm : m<x) : h^2*w < (q*m)^2 := by
  have hp : 0<p := by rcases hcases with ⟨rfl,_⟩ | ⟨rfl,_⟩ <;> omega
  have hqpos : 0<q := by rcases hcases with ⟨rfl,rfl⟩ | ⟨rfl,hh⟩; omega; rcases hh with rfl | rfl | rfl <;> omega
  obtain ⟨t,b,e,htpos,hbpos,hepos,hqt,hb,htv,hew,heq⟩ := triple_residuals hp hqpos ht
  have htu : ((p:ℤ)*x-q)=(t:ℤ) := by
    have hh : (q:ℤ)+t=(p:ℤ)*x := by exact_mod_cast hqt
    omega
  have hxu := first_denominator_upper hqpos ht
  have hxhi : x ≤ 3*m := by
    have hhpos : 0<h := by rcases hcases with ⟨_,rfl⟩ | ⟨_,hh⟩; omega; rcases hh with rfl | rfl | rfl <;> omega
    have hmul : p*x < p*(3*m) := by nlinarith only [hxu,hq,hhpos]
    exact Nat.le_of_lt (Nat.lt_of_mul_lt_mul_left hmul)
  by_cases hneigh : x=m+1
  · subst x
    push_cast at htu
    rcases hcases with h11 | ⟨hp5,hh⟩
    · have hh := neighbor_first_bound p q m h hm hq (Or.inl h11)
      rw [htu] at hh
      have hbound : h^2*(b*(b+1)) < t*(q*m)^2 := by rw [hb]; rw [mul_assoc] at hh; exact_mod_cast hh
      have hu := residual_bound 1 e b (t*w) hepos (by omega) heq
      have hscaled : t*(h^2*w) < t*(q*m)^2 := by nlinarith only [Nat.mul_le_mul_left (h^2) hu,hbound]
      exact Nat.lt_of_mul_lt_mul_left hscaled
    · rcases hh with hh1 | hh2 | hh3
      all_goals subst p
      · have hh := neighbor_first_bound 5 q m h hm hq (Or.inr ⟨rfl,Or.inl hh1⟩)
        rw [htu] at hh
        have hbound : h^2*(b*(b+1)) < t*(q*m)^2 := by rw [hb]; rw [mul_assoc] at hh; exact_mod_cast hh
        have hu := residual_bound 1 e b (t*w) hepos (by omega) heq
        have hscaled : t*(h^2*w) < t*(q*m)^2 := by nlinarith only [Nat.mul_le_mul_left (h^2) hu,hbound]
        exact Nat.lt_of_mul_lt_mul_left hscaled
      · have hh := neighbor_first_bound 5 q m h hm hq (Or.inr ⟨rfl,Or.inr hh2⟩)
        rw [htu] at hh
        have hbound : h^2*(b*(b+1)) < t*(q*m)^2 := by rw [hb]; rw [mul_assoc] at hh; exact_mod_cast hh
        have hu := residual_bound 1 e b (t*w) hepos (by omega) heq
        have hscaled : t*(h^2*w) < t*(q*m)^2 := by nlinarith only [Nat.mul_le_mul_left (h^2) hu,hbound]
        exact Nat.lt_of_mul_lt_mul_left hscaled
      · subst h
        have ht8 : t=8 := by omega
        have he3 : 3≤e := neighbor_residual_three q m v e hq hepos (by rw [← hb,← htv,ht8])
        have hh := neighbor_three_bound q m hm hq
        have hbound : 9*(b*(b+3)) < 24*(q*m)^2 := by rw [hb]; rw [mul_assoc] at hh; exact_mod_cast hh
        have hu := residual_bound 3 e b (t*w) hepos he3 heq
        have hscaled : 24*(3^2*w) < 24*(q*m)^2 := by rw [ht8] at hu; nlinarith only [Nat.mul_le_mul_left 9 hu,hbound]
        exact Nat.lt_of_mul_lt_mul_left hscaled
  · have hh := separated_first_bound p q m h x hm hq hcases (by omega) hxhi
    rw [htu] at hh
    have hbound : h^2*(b*(b+1)) < t*(q*m)^2 := by rw [hb]; rw [mul_assoc] at hh; exact_mod_cast hh
    have hu := residual_bound 1 e b (t*w) hepos (by omega) heq
    have hscaled : t*(h^2*w) < t*(q*m)^2 := by nlinarith only [Nat.mul_le_mul_left (h^2) hu,hbound]
    exact Nat.lt_of_mul_lt_mul_left hscaled

#print axioms larger_first_denominator_bound

end Egyptian
