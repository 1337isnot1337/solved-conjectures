module
public import Conjectures.CyrusianKaplanEncoding
public import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

open Finset

def RealEncodedMember (g : ℝ) (A B : Finset ℝ) (x : ℝ) : Prop :=
  x=0 ∨ (x≤g ∧ x∈B) ∨ (g<x ∧ x∉A)

def RealEncodingTests (g : ℝ) (A B : Finset ℝ) : Prop :=
  (∀ b∈B,∀ d∈B,RealEncodedMember g A B (b+d)) ∧
  (∀ a∈A,∀ b∈B,¬RealEncodedMember g A B (a-b))

def RealAdmissibleEncoding (g : ℝ) (r : ℕ) (A B : Finset ℝ) : Prop :=
  A.card=r ∧ B.card=r ∧
    (∀ a∈A,g<a ∧ a<2*g) ∧
    (∀ b∈B,0<b ∧ b≤g) ∧ RealEncodingTests g A B

def positiveScaleEmbedding (c : ℝ) (hc : 0<c) : ℝ ↪ ℝ :=
  ⟨fun x=>c*x,fun _ _ h=>mul_left_cancel₀ hc.ne' h⟩

theorem mem_positiveScale_map_iff {c x : ℝ} (hc : 0<c) (A : Finset ℝ) :
    c*x∈A.map (positiveScaleEmbedding c hc) ↔ x∈A := by
  constructor
  · intro h
    obtain ⟨y,hy,hEq⟩ := Finset.mem_map.mp h
    have he : y=x := (positiveScaleEmbedding c hc).injective hEq
    rwa [he] at hy
  · intro h
    exact Finset.mem_map.mpr ⟨x,h,rfl⟩

theorem realEncodedMember_scale_iff {c g x : ℝ} (hc : 0<c) (A B : Finset ℝ) :
    RealEncodedMember (c*g) (A.map (positiveScaleEmbedding c hc))
      (B.map (positiveScaleEmbedding c hc)) (c*x) ↔ RealEncodedMember g A B x := by
  unfold RealEncodedMember
  simp only [mul_eq_zero,hc.ne',false_or,mul_le_mul_iff_right₀ hc,mul_lt_mul_iff_right₀ hc,
    mem_positiveScale_map_iff hc]

private theorem finset_scale_forall_iff {c : ℝ} (hc : 0<c) (A : Finset ℝ) (P : ℝ→Prop) :
    (∀ y∈A.map (positiveScaleEmbedding c hc),P y) ↔ ∀ x∈A,P (c*x) := by
  constructor
  · intro h x hx
    exact h (c*x) ((mem_positiveScale_map_iff hc A).mpr hx)
  · intro h y hy
    obtain ⟨x,hx,rfl⟩ := Finset.mem_map.mp hy
    exact h x hx

theorem realEncodingTests_scale_iff {c g : ℝ} (hc : 0<c) (A B : Finset ℝ) :
    RealEncodingTests (c*g) (A.map (positiveScaleEmbedding c hc))
      (B.map (positiveScaleEmbedding c hc)) ↔ RealEncodingTests g A B := by
  unfold RealEncodingTests
  rw [finset_scale_forall_iff hc B,finset_scale_forall_iff hc A]
  simp_rw [finset_scale_forall_iff hc B,← mul_add,← mul_sub,realEncodedMember_scale_iff hc]

/-- All constraints in the actual set model are homogeneous:
normalizing from any positive genus to one does not shift a boundary. -/
theorem realAdmissibleEncoding_scale_iff {c g : ℝ} (hc : 0<c) (r : ℕ) (A B : Finset ℝ) :
    RealAdmissibleEncoding (c*g) r (A.map (positiveScaleEmbedding c hc))
      (B.map (positiveScaleEmbedding c hc)) ↔ RealAdmissibleEncoding g r A B := by
  unfold RealAdmissibleEncoding
  simp only [Finset.card_map,realEncodingTests_scale_iff hc,
    finset_scale_forall_iff hc,show (2:ℝ)*(c*g)=c*(2*g) by ring,
    mul_le_mul_iff_right₀ hc,mul_lt_mul_iff_right₀ hc,mul_pos_iff_of_pos_left hc]

def natRealEmbedding : ℕ ↪ ℝ := ⟨Nat.cast,Nat.cast_injective⟩

private theorem nat_cast_mem_real_map (A : Finset ℕ) (n : ℕ) :
    (n:ℝ)∈A.map natRealEmbedding ↔ n∈A := by
  constructor
  · intro h
    obtain ⟨k,hk,hkn⟩ := Finset.mem_map.mp h
    have he : k=n := natRealEmbedding.injective hkn
    rwa [he] at hk
  · intro h
    exact Finset.mem_map.mpr ⟨n,h,rfl⟩

theorem realEncodedMember_nat_iff (g n : ℕ) (A B : Finset ℕ) :
    RealEncodedMember (g:ℝ) (A.map natRealEmbedding) (B.map natRealEmbedding) (n:ℝ)
      ↔ EncodedMember g A B n := by
  unfold RealEncodedMember EncodedMember
  simp only [Nat.cast_eq_zero,Nat.cast_le,Nat.cast_lt,nat_cast_mem_real_map]

private theorem finset_nat_real_forall_iff (A : Finset ℕ) (P : ℝ→Prop) :
    (∀ x∈A.map natRealEmbedding,P x) ↔ ∀ n∈A,P (n:ℝ) := by
  constructor
  · intro h n hn
    exact h n ((nat_cast_mem_real_map A n).mpr hn)
  · intro h x hx
    obtain ⟨n,hn,rfl⟩ := Finset.mem_map.mp hx
    exact h n hn

/-- Integer encodings have exactly the same membership and additive
tests in the homogeneous real region. Negative differences are not
truncated in the real model: the bounds ensure a>b at the only
tested differences. -/
theorem realEncodingTests_nat_iff (g : ℕ) (A B : Finset ℕ)
    (hA : A⊆Finset.Ioo g (2*g)) (hB : B⊆Finset.Icc 1 g) :
    RealEncodingTests (g:ℝ) (A.map natRealEmbedding) (B.map natRealEmbedding)
      ↔ EncodingTests g A B := by
  unfold RealEncodingTests EncodingTests
  simp only [finset_nat_real_forall_iff]
  have hAdd (b d : ℕ) : RealEncodedMember (g:ℝ) (A.map natRealEmbedding)
      (B.map natRealEmbedding) (↑b+ ↑d)↔EncodedMember g A B (b+d) := by
    rw [← Nat.cast_add,realEncodedMember_nat_iff]
  have hSub (a : ℕ) (ha : a∈A) (b : ℕ) (hb : b∈B) :
      RealEncodedMember (g:ℝ) (A.map natRealEmbedding) (B.map natRealEmbedding)
        (↑a- ↑b)↔EncodedMember g A B (a-b) := by
    have h : b≤a := ((Finset.mem_Icc.mp (hB hb)).2).trans (Finset.mem_Ioo.mp (hA ha)).1.le
    rw [← Nat.cast_sub h,realEncodedMember_nat_iff]
  constructor
  · rintro ⟨h₁,h₂⟩
    exact ⟨fun b hb d hd=>(hAdd b d).mp (h₁ b hb d hd),
      fun a ha b hb he=>h₂ a ha b hb ((hSub a ha b hb).mpr he)⟩
  · rintro ⟨h₁,h₂⟩
    exact ⟨fun b hb d hd=>(hAdd b d).mpr (h₁ b hb d hd),
      fun a ha b hb he=>h₂ a ha b hb ((hSub a ha b hb).mp he)⟩

end CyrusianKaplan
