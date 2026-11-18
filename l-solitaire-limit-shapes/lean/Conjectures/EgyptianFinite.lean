import Conjectures.EgyptianBounds

/-! Kernel-reduced exhaustive certificates for the finitely many small k.
The soundness proof establishes complete denominator bounds from the fraction
 equation; the certificate does not assume a numerical search is exhaustive. -/
namespace Egyptian

instance (p q x y z : Nat) : Decidable (Triple p q x y z) := by
  unfold Triple
  infer_instance

def greedyX (k : Nat) : Nat := k/5+1
def greedyY (k : Nat) : Nat := k*greedyX k / (5*greedyX k-k)+1
def greedyZ (k : Nat) : Nat :=
  k*greedyX k*greedyY k / ((5*greedyX k-k)*greedyY k-k*greedyX k)

def smallPairCheck (k x y : Nat) : Bool :=
  let d := (5*x-k)*y-k*x
  let z := k*x*y/d
  if 0<d ∧ k*x*y%d=0 ∧ y<z then
    decide (z ≤ greedyZ k ∧ (z=greedyZ k → x=greedyX k ∧ y=greedyY k))
  else true

def smallCheck (k : Nat) : Bool :=
  (List.range (3*k/5+1)).all (fun x =>
    if k<5*x then
      (List.range (2*k*x/(5*x-k)+1)).all (fun y =>
        if x<y ∧ k*x<(5*x-k)*y then smallPairCheck k x y else true)
    else true)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem small_certificate : ∀ k : Fin 100, k.val%5 ≠ 1 → smallCheck k.val=true := by decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem small_valid_certificate : ∀ k : Fin 100, 3≤k.val → k.val%5 ≠ 1 →
    Triple 5 k.val (greedyX k.val) (greedyY k.val) (greedyZ k.val) := by decide

/-- Upper bound on the second denominator from the strict ordering. -/
theorem second_denominator_upper {p q x y z : Nat} (hp : 0<p) (hq : 0<q)
    (ht : Triple p q x y z) : (p*x-q)*y < 2*q*x := by
  obtain ⟨t,b,e,htpos,hbpos,hepos,hqt,hb,hty,hez,heq⟩ := triple_residuals hp hq ht
  have hlt : e*y<e*z := Nat.mul_lt_mul_of_pos_left ht.2.2.1 hepos
  rw [hez] at hlt
  have heb : e<b := Nat.lt_of_mul_lt_mul_right hlt
  have htdef : t=p*x-q := by omega
  rw [← htdef]
  nlinarith only [hty,heb,hb]

/-- Every actual triple occurs within the certificate's two finite loops. -/
theorem small_check_sound {k x y z : Nat} (hk : 0<k) (hcheck : smallCheck k=true)
    (ht : Triple 5 k x y z) :
    z ≤ greedyZ k ∧ (z=greedyZ k → x=greedyX k ∧ y=greedyY k) := by
  obtain ⟨t,b,e,htpos,hbpos,hepos,hqt,hb,hty,hez,heq⟩ := triple_residuals (by decide : 0<5) hk ht
  have htdef : t=5*x-k := by omega
  have hfirst : k<5*x := by omega
  have hxu := first_denominator_upper hk ht
  have hxrange : x∈List.range (3*k/5+1) := by
    apply List.mem_range.mpr
    have hh : x ≤ 3*k/5 := (Nat.le_div_iff_mul_le (by decide : 0<5)).mpr (by omega)
    omega
  have hyu := second_denominator_upper (by decide : 0<5) hk ht
  have hyrange : y∈List.range (2*k*x/(5*x-k)+1) := by
    apply List.mem_range.mpr
    have hpos : 0<5*x-k := by omega
    have hh : y≤2*k*x/(5*x-k) := (Nat.le_div_iff_mul_le hpos).mpr (by nlinarith only [hyu])
    omega
  have hdiv : (5*x-k)*y-k*x=e := by rw [← htdef, ← hb,hty]; omega
  have hez' : k*x*y=e*z := by rw [← hb,hez]
  have hzdiv : k*x*y/((5*x-k)*y-k*x)=z := by
    rw [hdiv,hez',Nat.mul_div_cancel_left _ hepos]
  have hzmod : k*x*y%((5*x-k)*y-k*x)=0 := by rw [hdiv,hez']; simp
  have hxcheck := List.all_eq_true.mp hcheck x hxrange
  simp only [hfirst,ite_eq_left] at hxcheck
  have hycheck := List.all_eq_true.mp hxcheck y hyrange
  have hyguard : x<y ∧ k*x<(5*x-k)*y := ⟨ht.2.1,by rw [←htdef,←hb,hty];omega⟩
  rw [ite_eq_left hyguard] at hycheck
  have hguard : 0<(5*x-k)*y-k*x ∧ k*x*y%((5*x-k)*y-k*x)=0 ∧
      y<k*x*y/((5*x-k)*y-k*x) := ⟨by rw [hdiv]; exact hepos,hzmod,by rw [hzdiv]; exact ht.2.2.1⟩
  dsimp only [smallPairCheck] at hycheck
  rw [ite_eq_left hguard] at hycheck
  simpa only [hzdiv,decide_eq_true_eq] using hycheck

theorem small_optimal {k : Nat} (hk : 0<k) (hu : k<100) (hr : k%5≠1) :
    ∀ x y z, Triple 5 k x y z →
      z≤greedyZ k ∧ (z=greedyZ k → x=greedyX k ∧ y=greedyY k) := by
  intro x y z ht
  exact small_check_sound hk (small_certificate ⟨k,hu⟩ hr) ht

#print axioms small_optimal
end Egyptian
