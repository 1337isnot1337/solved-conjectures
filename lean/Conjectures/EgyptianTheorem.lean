import Conjectures.EgyptianFinite

/-! Completion of Batista's congruence theorem from the elementary comparison. -/
namespace Egyptian

theorem same_first_comparison {p q m y z v w : Nat} (hq : 0<q)
    (hg : Triple p q m y z) (ht : Triple p q m v w) (hvy : y≤v) :
    w≤z ∧ (w=z → v=y) := by
  have hf := triple_rational hq hg
  have hf' := triple_rational hq ht
  have hy : (0:ℚ)<y := by exact_mod_cast (lt_trans hg.1 hg.2.1)
  have hz : (0:ℚ)<z := by exact_mod_cast (lt_trans (lt_trans hg.1 hg.2.1) hg.2.2.1)
  have hv : (0:ℚ)<v := by exact_mod_cast (lt_trans ht.1 ht.2.1)
  have hw : (0:ℚ)<w := by exact_mod_cast (lt_trans (lt_trans ht.1 ht.2.1) ht.2.2.1)
  have hrecip : (1:ℚ)/v≤1/(y:ℚ) := (div_le_div_iff₀ hv hy).mpr (by simpa using (show (y:ℚ)≤v by exact_mod_cast hvy))
  have hzw : (1:ℚ)/z≤1/(w:ℚ) := by linarith
  have hwz := (div_le_div_iff₀ hz hw).mp hzw
  refine ⟨by exact_mod_cast (by simpa using hwz : (w:ℚ)≤z), ?_⟩
  intro hweq
  subst w
  have heq : (1:ℚ)/v=1/(y:ℚ) := by linarith
  have hc := (div_eq_div_iff (ne_of_gt hv) (ne_of_gt hy)).mp heq
  exact_mod_cast (by simpa using hc.symm : (v:ℚ)=(y:ℚ))

theorem greedy_square_lower (B h d y z : Nat) (hy : B≤h*y)
    (hz : d*z=B*y) (hd : d≤h) : B^2≤h^2*z := by
  have hfirst : B*y≤h*z := by rw [←hz]; exact Nat.mul_le_mul_right z hd
  calc
    B^2=B*B := by ring
    _≤B*(h*y) := Nat.mul_le_mul_left B hy
    _=h*(B*y) := by ring
    _≤h*(h*z) := Nat.mul_le_mul_left h hfirst
    _=h^2*z := by ring

/-- Complete lexicographic and unique-maximum conclusions for the large regime. -/
theorem large_greedy_optimal (p q m h : Nat) (hm : 20≤m) (hq : q+h=p*m)
    (hcases : (p=1 ∧ h=1) ∨ (p=5 ∧ (h=1 ∨ h=2 ∨ h=3))) :
    ∃ y z, Triple p q m y z ∧
      ∀ x v w, Triple p q x v w →
        (m<x ∨ (m=x ∧ y≤v)) ∧ w≤z ∧ (w=z → x=m ∧ v=y) := by
  have hp : 0<p := by rcases hcases with ⟨rfl,_⟩ | ⟨rfl,_⟩ <;> omega
  have hh : 1≤h ∧ h≤3 := by
    rcases hcases with ⟨_,rfl⟩ | ⟨_,hh⟩
    · omega
    · rcases hh with rfl | rfl | rfl <;> omega
  have hhp : h≤p := by
    rcases hcases with ⟨rfl,rfl⟩ | ⟨rfl,hh⟩
    · omega
    · rcases hh with rfl | rfl | rfl <;> omega
  have hqpos : 0<q := by nlinarith
  have hmod : h=3 → (q*m)%3=0 ∨ (q*m)%3=2 := by
    intro h3
    subst h
    rcases hcases with ⟨_,hh⟩ | ⟨rfl,_⟩
    · omega
    · exact residue_two_modulus q m hq
  obtain ⟨y,z,hy,hz,hg⟩ := greedy_extension p q m h (by omega) hhp hh hq hmod
  let B := q*m
  let d := h-B%h
  obtain ⟨hdpos,hdle,hdvd⟩ := error_divides B h hh hmod
  have hdiv := Nat.mod_add_div B h
  have hrem := Nat.mod_lt B (by omega : 0<h)
  have hdrel : d+B%h=h := Nat.sub_add_cancel (Nat.le_of_lt hrem)
  have hyrel : h*y=B+d := by dsimp [B,d] at *; rw [hy]; nlinarith only [hdiv,hdrel]
  have hquot : d*(B/d)=B := Nat.mul_div_cancel' hdvd
  have hzrel : d*z=B*y := by rw [hz]; change d*(B/d*y)=B*y; nlinarith only [hquot]
  have hlower : B^2≤h^2*z := greedy_square_lower B h d y z (by omega) hzrel hdle
  refine ⟨y,z,hg,?_⟩
  intro x v w ht
  have hfirst := first_denominator_bound hp hqpos ht
  have hqx : q<x*p := (Nat.div_lt_iff_lt_mul hp).mp (by omega : q/p<x)
  have hprod : p*m<p*(x+1) := by
    calc
      p*m=q+h := hq.symm
      _<p*x+p := Nat.add_lt_add_of_lt_of_le (by simpa [Nat.mul_comm] using hqx) hhp
      _=p*(x+1) := by ring
  have hmx : m≤x := by have := Nat.lt_of_mul_lt_mul_left hprod; omega
  by_cases heq : x=m
  · subst x
    obtain ⟨t,b,e,htpos,hbpos,hepos,hqt,hb,htv,hew,he⟩ := triple_residuals hp hqpos ht
    have htH : t=h := by omega
    have hvm : B/h<v := (Nat.div_lt_iff_lt_mul (by omega : 0<h)).mpr (by dsimp [B]; rw [htH,hb] at htv; nlinarith only [htv,hepos])
    have hvy : y≤v := by rw [hy]; exact Nat.succ_le_of_lt hvm
    obtain ⟨hwz,hunique⟩ := same_first_comparison hqpos hg ht hvy
    exact ⟨Or.inr ⟨rfl,hvy⟩,hwz,fun heq => ⟨rfl,hunique heq⟩⟩
  · have hstrict := larger_first_denominator_bound p q m h x v w hm hq hcases ht (by omega)
    have hwz : w<z := Nat.lt_of_mul_lt_mul_left (lt_of_lt_of_le hstrict hlower)
    exact ⟨Or.inl (by omega),Nat.le_of_lt hwz,fun heq => by omega⟩

#print axioms large_greedy_optimal
/-- The conclusion stated in the note: an ordered solution is lexicographically
first and uniquely maximizes the last denominator among all ordered solutions. -/
def BatistaConclusion (k m y z : Nat) : Prop :=
  Triple 5 k m y z ∧ ∀ x v w, Triple 5 k x v w →
    (m<x ∨ (m=x ∧ y≤v)) ∧ w≤z ∧ (w=z → x=m ∧ v=y)

theorem canonical_lex_first {k x v w : Nat} (hk : 0<k) (ht : Triple 5 k x v w) :
    greedyX k<x ∨ (greedyX k=x ∧ greedyY k≤v) := by
  have hfirst := first_denominator_bound (by decide : 0<5) hk ht
  change greedyX k≤x at hfirst
  by_cases hlt : greedyX k<x
  · exact Or.inl hlt
  · have hx : x=greedyX k := by omega
    subst x
    obtain ⟨t,b,e,htpos,hbpos,hepos,hqt,hb,htv,hew,heq⟩ := triple_residuals (by decide : 0<5) hk ht
    have htdef : t=5*greedyX k-k := by omega
    have hfrac : k*greedyX k/(5*greedyX k-k)<v :=
      (Nat.div_lt_iff_lt_mul (by omega : 0<5*greedyX k-k)).mpr (by
        rw [←htdef,←hb]
        nlinarith only [htv,hepos])
    exact Or.inr ⟨rfl,Nat.succ_le_of_lt hfrac⟩

theorem triple_times_five {q x y z : Nat} (ht : Triple 1 q x y z) :
    Triple 5 (5*q) x y z := by
  refine ⟨ht.1,ht.2.1,ht.2.2.1,?_⟩
  have heq := ht.2.2.2
  nlinarith only [heq]

theorem triple_divide_five {q x y z : Nat} (ht : Triple 5 (5*q) x y z) :
    Triple 1 q x y z := by
  refine ⟨ht.1,ht.2.1,ht.2.2.1,?_⟩
  have heq := ht.2.2.2
  nlinarith only [heq]

theorem batista_large (k : Nat) (hk : 100≤k) (hr : k%5≠1) :
    ∃ m y z, BatistaConclusion k m y z := by
  have hdiv := Nat.mod_add_div k 5
  have hrem := Nat.mod_lt k (by decide : 0<5)
  have hm : 20≤k/5+1 := by omega
  have hcases : k%5=0 ∨ k%5=2 ∨ k%5=3 ∨ k%5=4 := by omega
  rcases hcases with h0 | h2 | h3 | h4
  · have hkq : k=5*(k/5) := by omega
    obtain ⟨y,z,hg,hopt⟩ := large_greedy_optimal 1 (k/5) (k/5+1) 1 hm
      (by omega) (Or.inl ⟨rfl,rfl⟩)
    refine ⟨k/5+1,y,z,?_,?_⟩
    · have hh := triple_times_five hg
      simpa only [←hkq] using hh
    · intro x v w ht
      have ht' : Triple 5 (5*(k/5)) x v w := by simpa only [←hkq] using ht
      exact hopt x v w (triple_divide_five ht')
  · obtain ⟨y,z,hg,hopt⟩ := large_greedy_optimal 5 k (k/5+1) 3 hm
      (by omega) (Or.inr ⟨rfl,Or.inr (Or.inr rfl)⟩)
    exact ⟨k/5+1,y,z,hg,hopt⟩
  · obtain ⟨y,z,hg,hopt⟩ := large_greedy_optimal 5 k (k/5+1) 2 hm
      (by omega) (Or.inr ⟨rfl,Or.inr (Or.inl rfl)⟩)
    exact ⟨k/5+1,y,z,hg,hopt⟩
  · obtain ⟨y,z,hg,hopt⟩ := large_greedy_optimal 5 k (k/5+1) 1 hm
      (by omega) (Or.inr ⟨rfl,Or.inl rfl⟩)
    exact ⟨k/5+1,y,z,hg,hopt⟩

/-- Complete congruence theorem, without an unproved comparison hypothesis. -/
theorem batista_congruence (k : Nat) (hk : 3≤k) (hr : k%5≠1) :
    ∃ m y z, BatistaConclusion k m y z := by
  by_cases hu : k<100
  · refine ⟨greedyX k,greedyY k,greedyZ k,small_valid_certificate ⟨k,hu⟩ hk hr,?_⟩
    intro x v w ht
    obtain ⟨hw,hunique⟩ := small_optimal (by omega : 0<k) hu hr x v w ht
    exact ⟨canonical_lex_first (by omega) ht,hw,hunique⟩
  · exact batista_large k (by omega) hr

theorem admissible_denominator_at_least_three {k x y z : Nat} (hk : 0<k)
    (ht : Triple 5 k x y z) : 3≤k := by
  have hfirst := first_denominator_upper hk ht
  have hsecond := second_denominator_upper (by decide : 0<5) hk ht
  by_contra hn
  have hx : x=1 := by have := ht.1; omega
  have hy : 2≤y := by have := ht.2.1; omega
  have hk2 : k=1 ∨ k=2 := by omega
  rcases hk2 with rfl | rfl <;> subst x <;> norm_num at hsecond <;> omega

/-- The note's exact hypothesis: every admissible positive k outside residue
class 1 has a lexicographically first solution that uniquely maximizes z. -/
theorem batista_admissible_congruence (k : Nat) (hk : 0<k) (hr : k%5≠1)
    (hadmissible : ∃ x y z, Triple 5 k x y z) :
    ∃ m y z, BatistaConclusion k m y z := by
  obtain ⟨x,y,z,ht⟩ := hadmissible
  exact batista_congruence k (admissible_denominator_at_least_three hk ht) hr

#print axioms batista_congruence
#print axioms batista_admissible_congruence

end Egyptian
