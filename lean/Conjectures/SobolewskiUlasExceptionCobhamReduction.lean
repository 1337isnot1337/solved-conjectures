module

public import Conjectures.SobolewskiUlasExceptionGapExpansion

@[expose] public section
namespace SobolewskiUlasException

def IndependentOfTwo (m : ℕ) : Prop :=
  ∀ a c : ℕ,0<a → 0<c → m^a≠2^c

theorem independentOfTwo_of_not_power (m : ℕ) (hm : 2≤m)
    (hp : ¬∃ e : ℕ,m=2^e) : IndependentOfTwo m := by
  intro a c ha _ hc
  obtain ⟨e,u,hu,he⟩ := twoPower_odd_part m (by omega)
  have hu1 : u≠1 := by
    intro h
    exact hp ⟨e,by simpa [h] using he⟩
  have hodd : u^a%2=1 := by rw [Nat.pow_mod,hu,one_pow]; decide
  have hEq : 2^(e*a)*u^a=2^c*1 := by
    calc
      _ = (2^e*u)^a := by rw [mul_pow,pow_mul]
      _ = m^a := congrArg (·^a) he.symm
      _ = _ := by simpa using hc
  have hpow := twoPower_odd_exponent_unique hodd (by decide : (1:ℕ)%2=1) hEq
  rw [hpow] at hEq
  have hU : u^a=1 := Nat.eq_of_mul_eq_mul_left (show 0<2^c by positivity) hEq
  have hle : u^1≤u^a := Nat.pow_le_pow_right (by omega : 0<u) (Nat.succ_le_of_lt ha)
  rw [pow_one,hU] at hle
  omega

/-- The explicit external dependency in the last step of the written
proof. It combines finite kernels for the binary indicator and the
bounded gaps with the non-erasing gap expansion. The conclusion is
the special case of the Cobham–Durand substitution theorem used here. -/
def CobhamGapTransfer : Prop :=
  ∀ (m : ℕ) (g : ℕ→ℤ) (P : ℕ→Prop),
    2≤m → IndependentOfTwo m →
    (∀ n,1≤g n ∧ g n≤12) →
    (kernelSequences m g).Finite → (predicateKernel 2 P).Finite →
    IsGapExpansion g P → UltimatelyPeriodic P

/-- All non-power-of-two bases reduce to the explicitly stated
Cobham–Durand input. The statement introduces no axiom. -/
theorem sourceLayerEnumeration_not_regular_nonpowers_of_cobham
    (h : CobhamGapTransfer) (m : ℕ) (hm : 2≤m)
    (hp : ¬∃ e : ℕ,m=2^e) :
    ¬IsRegular m (fun k => (sourceLayerEnumeration k : ℤ)) := by
  intro hf
  have hG := source_regular_implies_gap_finite_kernel hf
  have hP := finite_predicateKernel_shift scaled_indicator_finite_binary_kernel (nthException 1)
  have ht := h m gapWord (fun n => inScaled (n+nthException 1)) hm
    (independentOfTwo_of_not_power m hm hp) gapWord_values hG hP
    exception_indicator_is_gap_expansion
  exact scaledExceptions_not_ultimatelyPeriodic (ultimatelyPeriodic_of_shift ht)

theorem sourceLayerEnumeration_not_regular_any_base_of_cobham
    (h : CobhamGapTransfer) (m : ℕ) (hm : 2≤m) :
    ¬IsRegular m (fun k => (sourceLayerEnumeration k : ℤ)) := by
  by_cases hp : ∃ e : ℕ,m=2^e
  · obtain ⟨e,rfl⟩ := hp
    have he : 0<e := by
      by_contra! hn
      have hzero := Nat.eq_zero_of_le_zero hn
      rw [hzero,pow_zero] at hm
      omega
    exact sourceLayerEnumeration_not_regular_power_two e he
  · exact sourceLayerEnumeration_not_regular_nonpowers_of_cobham h m hm hp

end SobolewskiUlasException
