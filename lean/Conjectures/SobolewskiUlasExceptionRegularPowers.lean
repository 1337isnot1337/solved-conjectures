module

public import Conjectures.SobolewskiUlasExceptionRecurrenceAlgebra
public import Mathlib.RingTheory.Noetherian.Basic
public import Mathlib.RingTheory.PrincipalIdealDomain

@[expose] public section
namespace SobolewskiUlasException

theorem kernelSpan_pow_le (b a : ℕ) (f : ℕ→ℤ) :
    kernelSpan (b^a) f≤kernelSpan b f := by
  apply Submodule.span_le.mpr
  rintro g ⟨e,d,hd,rfl⟩
  apply Submodule.subset_span
  exact ⟨a*e,d,by simpa only [pow_mul] using hd,by rw [pow_mul]⟩

theorem regular_pow {b : ℕ} {f : ℕ→ℤ} (h : IsRegular b f) (a : ℕ) :
    IsRegular (b^a) f :=
  Submodule.FG.of_le h (kernelSpan_pow_le b a f)

theorem powSection_stable_on_span {b e r : ℕ} {f g : ℕ→ℤ} (hr : r<b^e)
    (hg : g∈kernelSpan b f) :
    sectionMap (b^e) r g∈kernelSpan b f := by
  let S := kernelSpan b f
  have he : S≤S.comap (sectionMap (b^e) r) := by
    apply Submodule.span_le.mpr
    rintro x ⟨j,s,hs,rfl⟩
    apply Submodule.subset_span
    refine ⟨j+e,b^j*r+s,?_,?_⟩
    · calc
        b^j*r+s < b^j*r+b^j := Nat.add_lt_add_left hs _
        _ = b^j*(r+1) := (Nat.mul_succ ..).symm
        _ ≤ b^j*b^e := Nat.mul_le_mul_left _ (Nat.succ_le_of_lt hr)
        _ = b^(j+e) := (pow_add ..).symm
    · funext n
      change f (b^j*(b^e*n+r)+s)=f (b^(j+e)*n+(b^j*r+s))
      congr 1
      rw [pow_add]
      ring
  exact he hg

/-- Finite generation in any positive power of a base gives finite
generation in the original base. The generating set is enlarged by
only finitely many short sections. -/
theorem regular_of_pow {b a : ℕ} {f : ℕ→ℤ} (ha : 0<a) (hb : 0<b)
    (h : IsRegular (b^a) f) : IsRegular b f := by
  classical
  obtain ⟨s,hs⟩ := h
  let I := Σ j : Fin a,Fin (b^j.val)
  let P := I × ↥s
  let map : P → (ℕ→ℤ) := fun u => sectionMap (b^u.1.1.val) u.1.2.val u.2.val
  let T : Finset (ℕ→ℤ) := Finset.univ.image map
  let W := Submodule.span ℤ (T : Set (ℕ→ℤ))
  have hsK (g : ℕ→ℤ) (hg : g∈s) : g∈kernelSpan (b^a) f := by
    rw [← hs]
    exact Submodule.subset_span hg
  have intoW (j r : ℕ) (hj : j<a) (hr : r<b^j) (g : ℕ→ℤ) (hg : g∈s) :
      sectionMap (b^j) r g∈W := by
    apply Submodule.subset_span
    exact Finset.mem_image.mpr ⟨(⟨⟨j,hj⟩,⟨r,hr⟩⟩,⟨g,hg⟩),Finset.mem_univ _,rfl⟩
  have hW : W≤kernelSpan b f := by
    apply Submodule.span_le.mpr
    intro g hg
    obtain ⟨u,_,he⟩ := Finset.mem_image.mp hg
    rw [← he]
    exact powSection_stable_on_span u.1.2.isLt
      (kernelSpan_pow_le b a f (hsK u.2.val u.2.property))
  have hshort (j r : ℕ) (hj : j<a) (hr : r<b^j) {g : ℕ→ℤ}
      (hg : g∈kernelSpan (b^a) f) : sectionMap (b^j) r g∈W := by
    have hle : kernelSpan (b^a) f≤W.comap (sectionMap (b^j) r) := by
      rw [← hs]
      apply Submodule.span_le.mpr
      intro v hv
      exact intoW j r hj hr v hv
    exact hle hg
  have hrev : kernelSpan b f≤W := by
    apply Submodule.span_le.mpr
    rintro _ ⟨e,d,hd,rfl⟩
    let j := e%a
    let t := e/a
    let K := b^(a*t)
    have hK : 0<K := pow_pos hb _
    have hE : e=a*t+j := by
      have hh := Nat.mod_add_div e a
      dsimp [j,t]
      omega
    have hj : j<a := Nat.mod_lt _ ha
    let r := d/K
    let l := d%K
    have hl : l<(b^a)^t := by rw [← pow_mul]; exact Nat.mod_lt _ hK
    have hr : r<b^j := by
      apply (Nat.div_lt_iff_lt_mul hK).mpr
      have he : b^e = b^j * K := by rw [hE,pow_add,Nat.mul_comm]
      exact hd.trans_le he.le
    have hz : sectionMap ((b^a)^t) l f∈kernelSpan (b^a) f :=
      Submodule.subset_span ⟨t,l,hl,rfl⟩
    have hs' := hshort j r hj hr hz
    have hq : sectionMap (b^e) d f=
        sectionMap (b^j) r (sectionMap ((b^a)^t) l f) := by
      funext n
      change f (b^e*n+d)=f ((b^a)^t*(b^j*n+r)+l)
      congr 1
      have hh : d=K*r+l := by
        have hdiv := Nat.mod_add_div d K
        dsimp [r,l]
        omega
      rw [hE,pow_add,← Nat.pow_mul,hh]
      dsimp only [K]
      rw [pow_mul]
      ring
    exact hq.symm ▸ hs'
  exact ⟨T,le_antisymm hW hrev⟩

theorem regular_power_two_implies_regular16 {a : ℕ} {f : ℕ→ℤ}
    (ha : 0<a) (h : IsRegular (2^a) f) : IsRegular 16 f :=
  regular_pow (regular_of_pow ha (by decide : 0<(2:ℕ)) h) 4

end SobolewskiUlasException
