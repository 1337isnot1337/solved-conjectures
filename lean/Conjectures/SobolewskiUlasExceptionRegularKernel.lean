module

public import Conjectures.SobolewskiUlasExceptionCayley
public import Mathlib.LinearAlgebra.Finsupp.LinearCombination
public import Mathlib.RingTheory.Finiteness.Defs

@[expose] public section
namespace SobolewskiUlasException

/-- Taking the subsequence at one residue class is integer-linear. -/
def sectionMap (b d : ℕ) : (ℕ→ℤ) →ₗ[ℤ] (ℕ→ℤ) where
  toFun f n := f (b*n+d)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

def kernelSequences (b : ℕ) (f : ℕ→ℤ) : Set (ℕ→ℤ) :=
  {g | ∃ e d : ℕ,d<b^e ∧ g=sectionMap (b^e) d f}

def kernelSpan (b : ℕ) (f : ℕ→ℤ) : Submodule ℤ (ℕ→ℤ) :=
  Submodule.span ℤ (kernelSequences b f)

def IsRegular (b : ℕ) (f : ℕ→ℤ) : Prop := (kernelSpan b f).FG

theorem sequence_mem_kernelSpan (b : ℕ) (f : ℕ→ℤ) : f∈kernelSpan b f := by
  apply Submodule.subset_span
  refine ⟨0,0,by simp,?_⟩
  funext n
  change f n=f (b^0*n+0)
  simp

theorem section_stable_on_kernel {b d : ℕ} {f : ℕ→ℤ} (hd : d<b)
    {g : ℕ→ℤ} (hg : g∈kernelSequences b f) :
    sectionMap b d g∈kernelSequences b f := by
  obtain ⟨e,r,hr,rfl⟩ := hg
  refine ⟨e+1,b^e*d+r,?_,?_⟩
  · calc
      b^e*d+r < b^e*d+b^e := Nat.add_lt_add_left hr _
      _ = b^e*(d+1) := (Nat.mul_succ ..).symm
      _ ≤ b^e*b := Nat.mul_le_mul_left _ (Nat.succ_le_of_lt hd)
      _ = b^(e+1) := (pow_succ ..).symm
  · funext n
    change f (b^e*(b*n+d)+r)=f (b^(e+1)*n+(b^e*d+r))
    congr 1
    rw [pow_succ]
    ring

theorem section_stable_on_span {b d : ℕ} {f g : ℕ→ℤ} (hd : d<b)
    (hg : g∈kernelSpan b f) : sectionMap b d g∈kernelSpan b f := by
  let S := kernelSpan b f
  have hle : S≤S.comap (sectionMap b d) := by
    apply Submodule.span_le.mpr
    intro x hx
    exact Submodule.subset_span (section_stable_on_kernel hd hx)
  exact hle hg

end SobolewskiUlasException
