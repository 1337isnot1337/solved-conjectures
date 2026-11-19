import Conjectures.MotzkinCyclicCriterion
import Mathlib.Data.Int.GCD

/-! Exact Hermite coordinates for a connected two-jump cyclic graph.
The modular inverse in the preprocessing formula is justified by the gcd
of the first jump and the modulus. -/
namespace Motzkin.Cyclic

theorem generate_of_int_bezout (N a b : ℕ) (u v w : ℤ)
    (h : u*(a:ℤ)+v*(b:ℤ)+w*(N:ℤ)=1) :
    AddSubgroup.closure ({(a:ZMod N),(b:ZMod N)} : Set (ZMod N))=⊤ := by
  let S := AddSubgroup.closure ({(a:ZMod N),(b:ZMod N)} : Set (ZMod N))
  have ha : (a:ZMod N) ∈ S := AddSubgroup.subset_closure (by simp)
  have hb : (b:ZMod N) ∈ S := AddSubgroup.subset_closure (by simp)
  have hcast : u • (a:ZMod N)+v • (b:ZMod N)=1 := by
    have hh := congrArg (fun z : ℤ => (z:ZMod N)) h
    simpa [zsmul_eq_mul] using hh
  have hOne : (1:ZMod N) ∈ S := hcast ▸ S.add_mem (S.zsmul_mem ha u) (S.zsmul_mem hb v)
  apply top_unique
  intro z _
  obtain ⟨n,rfl⟩ := ZMod.intCast_surjective z
  simpa only [zsmul_eq_mul,mul_one] using S.zsmul_mem hOne n

theorem generate_of_gcd (N a b : ℕ) (hgen : Nat.gcd N (Nat.gcd a b)=1) :
    AddSubgroup.closure ({(a:ZMod N),(b:ZMod N)} : Set (ZMod N))=⊤ := by
  have h₁ := Nat.gcd_eq_gcd_ab N (Nat.gcd a b)
  have h₂ := Nat.gcd_eq_gcd_ab a b
  rw [hgen] at h₁
  apply generate_of_int_bezout N a b
    (Nat.gcdA a b*Nat.gcdB N (Nat.gcd a b))
    (Nat.gcdB a b*Nat.gcdB N (Nat.gcd a b))
    (Nat.gcdA N (Nat.gcd a b))
  calc
    _ = (N:ℤ)*Nat.gcdA N (Nat.gcd a b)+
        (Nat.gcd a b:ℤ)*Nat.gcdB N (Nat.gcd a b) := by rw [h₂]; ring
    _ = 1 := h₁.symm

theorem integer_kernel_basis (m k A b s : ℕ) (hk : 0 < k)
    (hAm : Nat.Coprime A m) (hkb : Nat.Coprime k b)
    (hs : m ∣ s*A+b) (r t : ℤ) :
    (m:ℤ)*(k:ℤ) ∣ r*((k:ℤ)*(A:ℤ))+t*(b:ℤ) ↔
      ∃ u v : ℤ, r=u*(m:ℤ)+v*(s:ℤ) ∧ t=v*(k:ℤ) := by
  have hsZ : (m:ℤ) ∣ (s:ℤ)*(A:ℤ)+(b:ℤ) := by exact_mod_cast hs
  have hAmZ : Int.gcd (m:ℤ) (A:ℤ)=1 := by
    simpa only [Int.gcd_natCast_natCast] using hAm.symm
  have hkbZ : Int.gcd (k:ℤ) (b:ℤ)=1 := by
    simpa only [Int.gcd_natCast_natCast] using hkb
  have hkZ : (k:ℤ) ≠ 0 := by exact_mod_cast hk.ne'
  constructor
  · intro h
    have htotal : (k:ℤ) ∣ r*((k:ℤ)*(A:ℤ))+t*(b:ℤ) :=
      dvd_trans (dvd_mul_left (k:ℤ) (m:ℤ)) h
    have hfirst : (k:ℤ) ∣ r*((k:ℤ)*(A:ℤ)) := by
      refine ⟨r*(A:ℤ),?_⟩
      ring
    have htb : (k:ℤ) ∣ t*(b:ℤ) := by
      convert dvd_sub htotal hfirst using 1 <;> ring
    obtain ⟨v,ht⟩ := Int.dvd_of_dvd_mul_left_of_gcd_one htb hkbZ
    have hrel : (m:ℤ) ∣ r*(A:ℤ)+v*(b:ℤ) := by
      obtain ⟨w,hw⟩ := h
      refine ⟨w,?_⟩
      apply mul_left_cancel₀ hkZ
      calc
        (k:ℤ)*(r*(A:ℤ)+v*(b:ℤ)) =
            r*((k:ℤ)*(A:ℤ))+t*(b:ℤ) := by rw [ht]; ring
        _ = ((m:ℤ)*(k:ℤ))*w := hw
        _ = (k:ℤ)*((m:ℤ)*w) := by ring
    have hdiff : (m:ℤ) ∣ (r-v*(s:ℤ))*(A:ℤ) := by
      convert dvd_sub hrel (dvd_mul_of_dvd_right hsZ v) using 1 <;> ring
    obtain ⟨u,hu⟩ := Int.dvd_of_dvd_mul_left_of_gcd_one hdiff hAmZ
    refine ⟨u,v,?_,?_⟩
    · calc
        r = (r-v*(s:ℤ))+v*(s:ℤ) := by ring
        _ = (m:ℤ)*u+v*(s:ℤ) := by rw [hu]
        _ = u*(m:ℤ)+v*(s:ℤ) := by ring
    · rw [ht]
      ring
  · rintro ⟨u,v,hr,ht⟩
    obtain ⟨q,hq⟩ := hsZ
    refine ⟨u*(A:ℤ)+v*q,?_⟩
    rw [hr,ht]
    calc
      (u*(m:ℤ)+v*(s:ℤ))*((k:ℤ)*(A:ℤ))+(v*(k:ℤ))*(b:ℤ) =
          ((m:ℤ)*(k:ℤ))*(u*(A:ℤ))+((k:ℤ)*v)*((s:ℤ)*(A:ℤ)+(b:ℤ)) := by ring
      _ = ((m:ℤ)*(k:ℤ))*(u*(A:ℤ))+((k:ℤ)*v)*((m:ℤ)*q) := by rw [hq]
      _ = ((m:ℤ)*(k:ℤ))*(u*(A:ℤ)+v*q) := by ring

def normalizedShear (m A b : ℕ) : ℕ :=
  (-(b:ZMod m)*(A:ZMod m)⁻¹).val

theorem normalizedShear_lt (m A b : ℕ) [NeZero m] :
    normalizedShear m A b < m := ZMod.val_lt _

theorem normalizedShear_relation (m A b : ℕ) [NeZero m]
    (hAm : Nat.Coprime A m) : m ∣ normalizedShear m A b*A+b := by
  apply (ZMod.natCast_eq_zero_iff _ _).mp
  rw [Nat.cast_add,Nat.cast_mul,normalizedShear,ZMod.natCast_zmod_val]
  calc
    (-(b:ZMod m)*(A:ZMod m)⁻¹)*(A:ZMod m)+(b:ZMod m) =
        -(b:ZMod m)*((A:ZMod m)*(A:ZMod m)⁻¹)+(b:ZMod m) := by ring
    _ = 0 := by rw [ZMod.coe_mul_inv_eq_one A hAm]; ring

theorem cyclic_relation_iff_dvd (N a b : ℕ) (r t : ℤ) :
    r • (a:ZMod N)+t • (b:ZMod N)=0 ↔
      (N:ℤ) ∣ r*(a:ℤ)+t*(b:ℤ) := by
  rw [zsmul_eq_mul,zsmul_eq_mul]
  have hcast : (r:ZMod N)*(a:ZMod N)+(t:ZMod N)*(b:ZMod N) =
      ((r*(a:ℤ)+t*(b:ℤ):ℤ):ZMod N) := by
    simp only [Int.cast_add,Int.cast_mul,Int.cast_natCast]
  rw [hcast,ZMod.intCast_zmod_eq_zero_iff_dvd]

/-- The preprocessing formula produces the full kernel, not only two
relations lying in it. It also covers the order-one first generator. -/
theorem cyclic_Hermite_basis (N a b : ℕ) (hN : 0 < N)
    (hgen : Nat.gcd N (Nat.gcd a b)=1) :
    let k := Nat.gcd N a
    let m := N/k
    let s := normalizedShear m (a/k) b
    0 < m ∧ 0 < k ∧ s < m ∧ N=m*k ∧
      ∀ r t : ℤ, r • (a:ZMod N)+t • (b:ZMod N)=0 ↔
        ∃ u v : ℤ, r=u*(m:ℤ)+v*(s:ℤ) ∧ t=v*(k:ℤ) := by
  let k := Nat.gcd N a
  let m := N/k
  let A := a/k
  let s := normalizedShear m A b
  have hk : 0 < k := Nat.gcd_pos_of_pos_left a hN
  have hm : 0 < m := Nat.div_pos (Nat.gcd_le_left a hN) hk
  letI : NeZero m := ⟨hm.ne'⟩
  have hNm : N=m*k := (Nat.div_mul_cancel (Nat.gcd_dvd_left N a)).symm
  have ha : a=k*A := (Nat.mul_div_cancel' (Nat.gcd_dvd_right N a)).symm
  have hAm : Nat.Coprime A m := by
    have hmA : Nat.Coprime m A := Nat.gcd_div_gcd_div_gcd_of_pos_left hN
    exact hmA.symm
  have hkb : Nat.Coprime k b := by
    change Nat.gcd (Nat.gcd N a) b=1
    rw [Nat.gcd_assoc]
    exact hgen
  refine ⟨hm,hk,normalizedShear_lt m A b,hNm,?_⟩
  intro r t
  rw [cyclic_relation_iff_dvd]
  rw [hNm,ha]
  push_cast
  exact integer_kernel_basis m k A b s hk hAm hkb
    (normalizedShear_relation m A b hAm) r t

end Motzkin.Cyclic
