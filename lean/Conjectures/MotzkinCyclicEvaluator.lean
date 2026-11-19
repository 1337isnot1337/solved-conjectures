import Conjectures.MotzkinCyclicBasis
import Conjectures.MotzkinCyclicScaling
import Conjectures.MotzkinEvaluatorDensity

/-! Connected cyclic preprocessing and the exact evaluator, including the
attaining multiplier represented by the two output residues. -/
namespace Motzkin.Cyclic

def circulantOptimum (N a b : ℕ) : ℕ × (ℕ × ℕ) :=
  let k := Nat.gcd N a
  let m := N/k
  Evaluator.quotientOptimum m k (normalizedShear m (a/k) b)

theorem circulantOptimum_threshold (N a b : ℕ) (hN : 0 < N)
    (hgen : Nat.gcd N (Nat.gcd a b)=1) :
    (circulantOptimum N a b).1=independenceNumber N a b := by
  let _ : NeZero N := ⟨hN.ne'⟩
  let k := Nat.gcd N a
  let m := N/k
  let s := normalizedShear m (a/k) b
  obtain ⟨hm,hk,hs,hNm,hrel⟩ := cyclic_Hermite_basis N a b hN hgen
  change 0 < m at hm
  change 0 < k at hk
  change s < m at hs
  have hma : m • (a:ZMod N)=0 := by
    have h := (hrel (m:ℤ) 0).mpr ⟨1,0,by ring,by ring⟩
    simpa only [natCast_zsmul,zero_zsmul,add_zero] using h
  have hskb : s • (a:ZMod N)+k • (b:ZMod N)=0 := by
    have h := (hrel (s:ℤ) (k:ℤ)).mpr ⟨0,1,by ring,by ring⟩
    simpa only [natCast_zsmul] using h
  have hchar := Evaluator.characterValue_eq_optimum (a:ZMod N) (b:ZMod N)
    m k s hm hk hma hskb (fun r t h => (hrel r t).mp h)
  rw [characterValue_eq_independence,← hNm] at hchar
  have hNr : (N:ℝ) ≠ 0 := by exact_mod_cast hN.ne'
  have hvalue : independence (a:ZMod N) (b:ZMod N)=Evaluator.optimum m k s := by
    exact_mod_cast (div_left_inj' hNr).mp hchar
  change (Evaluator.quotientOptimum m k s).1=independenceNumber N a b
  rw [Evaluator.quotientOptimum_threshold,Nat.mod_eq_of_lt hs,independenceNumber_eq]
  exact hvalue.symm

theorem residues_congruence {R : Type*} [CommRing R]
    (a b m k s i y q : R) (hma : m*a=0) (hskb : s*a+k*b=0)
    (hyq : y+s*i=m*q) : b*(k*i)=a*y := by
  apply sub_eq_zero.mp
  calc
    b*(k*i)-a*y = -a*(y+s*i)+(s*a+k*b)*i := by ring
    _ = -a*(m*q)+0*i := by rw [hyq,hskb]
    _ = -(m*a)*q := by ring
    _ = 0 := by rw [hma]; ring

theorem circulantOptimum_character (N a b : ℕ) [NeZero N]
    (hgen : Nat.gcd N (Nat.gcd a b)=1) :
    let z := circulantOptimum N a b
    ∃ t : ZMod N, (t*(a:ZMod N)).val=z.2.1 ∧ (t*(b:ZMod N)).val=z.2.2 ∧
      score t (a:ZMod N) (b:ZMod N)=z.1 := by
  let k := Nat.gcd N a
  let m := N/k
  let s := normalizedShear m (a/k) b
  let z := circulantOptimum N a b
  obtain ⟨hm,hk,hs,hNm,hrel⟩ := cyclic_Hermite_basis N a b (NeZero.pos N) hgen
  change 0 < m at hm
  change 0 < k at hk
  change s < m at hs
  have hma : m • (a:ZMod N)=0 := by
    have h := (hrel (m:ℤ) 0).mpr ⟨1,0,by ring,by ring⟩
    simpa only [natCast_zsmul,zero_zsmul,add_zero] using h
  have hskb : s • (a:ZMod N)+k • (b:ZMod N)=0 := by
    have h := (hrel (s:ℤ) (k:ℤ)).mpr ⟨0,1,by ring,by ring⟩
    simpa only [natCast_zsmul] using h
  obtain ⟨i,hi,hx,hy,hxL,hxU,hyL,hyU,hdiv⟩ :=
    Evaluator.quotientOptimum_feasible m k s hm hk
  rw [Nat.mod_eq_of_lt hs] at hdiv
  change z.2.1=k*i at hx
  change z.2.2 < m*k at hy
  change z.1 ≤ z.2.1 at hxL
  change z.2.1 ≤ m*k-z.1 at hxU
  change z.1 ≤ z.2.2 at hyL
  change z.2.2 ≤ m*k-z.1 at hyU
  change m ∣ z.2.2+s*i at hdiv
  have hxN : z.2.1 < N := by
    rw [hx,hNm]
    exact (Nat.mul_lt_mul_of_pos_left hi hk).trans_eq (Nat.mul_comm k m)
  rw [← hNm] at hy hxU hyU
  obtain ⟨q,hq⟩ := hdiv
  have hqR : (z.2.2:ZMod N)+(s:ZMod N)*(i:ZMod N)=(m:ZMod N)*(q:ZMod N) := by
    exact_mod_cast hq
  rw [nsmul_eq_mul] at hma
  simp only [nsmul_eq_mul] at hskb
  have hpair : (b:ZMod N)*(z.2.1:ZMod N)=(a:ZMod N)*(z.2.2:ZMod N) := by
    rw [hx,Nat.cast_mul]
    exact residues_congruence _ _ _ _ _ _ _ _ hma hskb hqR
  obtain ⟨t,hta,htb⟩ := (pair_eq_multiplier_iff (a:ZMod N) (b:ZMod N)
    (z.2.1:ZMod N) (z.2.2:ZMod N) (generate_of_gcd N a b hgen)).mpr hpair
  refine ⟨t,?_,?_,?_⟩
  · rw [hta,ZMod.val_natCast_of_lt hxN]
  · rw [htb,ZMod.val_natCast_of_lt hy]
  · apply le_antisymm
    · have h := score_le_independence (a:ZMod N) (b:ZMod N) t
      have hz := circulantOptimum_threshold N a b (NeZero.pos N) hgen
      rw [independenceNumber_eq] at hz
      exact h.trans_eq hz.symm
    · rw [score,hta,htb]
      exact le_min (folded_natCast_ge hxL hxU) (folded_natCast_ge hyL hyU)

/-- The executable connected-cyclic output is an exact independence number
and the two residues come from one actual attaining multiplier. -/
theorem circulantOptimum_correct (N a b : ℕ) [NeZero N]
    (hgen : Nat.gcd N (Nat.gcd a b)=1) :
    let z := circulantOptimum N a b
    ∃ A : Finset (ZMod N), ∃ t : ZMod N,
      (∀ x ∈ A, x+(a:ZMod N) ∉ A ∧ x+(b:ZMod N) ∉ A) ∧ A.card=z.1 ∧
      (t*(a:ZMod N)).val=z.2.1 ∧ (t*(b:ZMod N)).val=z.2.2 ∧
      score t (a:ZMod N) (b:ZMod N)=A.card ∧
      ∀ B : Finset (ZMod N),
        (∀ x ∈ B, x+(a:ZMod N) ∉ B ∧ x+(b:ZMod N) ∉ B) → B.card ≤ A.card := by
  obtain ⟨A,_,hA,hcard,_,hmax⟩ := finite_cyclic_theorem_all (a:ZMod N) (b:ZMod N)
  obtain ⟨t,hta,htb,ht⟩ := circulantOptimum_character N a b hgen
  have hz := circulantOptimum_threshold N a b (NeZero.pos N) hgen
  rw [independenceNumber_eq] at hz
  have hAz := hcard.trans hz.symm
  exact ⟨A,t,hA,hAz,hta,htb,ht.trans hAz.symm,hmax⟩

def circulantNumber (N a b : ℕ) : ℕ :=
  let g := Nat.gcd N (Nat.gcd a b)
  g*(circulantOptimum (N/g) (a/g) (b/g)).1

theorem circulantNumber_correct (N a b : ℕ) (hN : 0 < N) :
    circulantNumber N a b=independenceNumber N a b := by
  let g := Nat.gcd N (Nat.gcd a b)
  have hg : 0 < g := Nat.gcd_pos_of_pos_left (Nat.gcd a b) hN
  have hM : 0 < N/g := Nat.div_pos (Nat.gcd_le_left (Nat.gcd a b) hN) hg
  change g*(circulantOptimum (N/g) (a/g) (b/g)).1=independenceNumber N a b
  rw [circulantOptimum_threshold (N/g) (a/g) (b/g) hM (reduced_gcd_eq_one N a b hN)]
  exact (independenceNumber_gcd N a b hN).symm

end Motzkin.Cyclic
