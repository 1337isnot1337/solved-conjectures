module

public import Conjectures.SobolewskiUlasExceptionGapRegular

@[expose] public section
namespace SobolewskiUlasException

/-- A regular integer sequence confined to the interval [0,13) has
finite kernel: modulo thirteen only finitely many basis combinations
are possible, and the residue map is injective on the kernel. -/
theorem bounded_regular_finite_kernel {b : ℕ} {f : ℕ→ℤ} (h : IsRegular b f)
    (hBound : ∀ n,0≤f n ∧ f n<13) : (kernelSequences b f).Finite := by
  classical
  obtain ⟨s,hs⟩ := h
  let reduce (g : ℕ→ℤ) (n : ℕ) : ZMod 13 := (g n : ZMod 13)
  let residueCombo (c : ↥s→ZMod 13) (n : ℕ) : ZMod 13 :=
    ∑ j : ↥s,c j * (j.val n : ZMod 13)
  have hfinite : (reduce '' kernelSequences b f).Finite := by
    apply (Set.finite_range residueCombo).subset
    rintro _ ⟨g,hg,rfl⟩
    have hspan : g∈Submodule.span ℤ (s : Set (ℕ→ℤ)) := by
      rw [hs]
      exact Submodule.subset_span hg
    obtain ⟨c,hc⟩ := Submodule.mem_span_finset'.mp hspan
    refine ⟨fun j => (c j : ZMod 13),?_⟩
    funext n
    have he := congrArg (fun g : ℕ→ℤ => (g n : ZMod 13)) hc
    simp only [Finset.sum_apply,Pi.smul_apply,smul_eq_mul,Int.cast_sum,Int.cast_mul] at he
    exact he
  apply hfinite.of_finite_image
  intro g hg u hu hEq
  have hb (g : ℕ→ℤ) (hg : g∈kernelSequences b f) (n : ℕ) :
      0≤g n ∧ g n<13 := by
    obtain ⟨e,r,_,rfl⟩ := hg
    exact hBound (b^e*n+r)
  funext n
  have ht := congrArg (fun z : ZMod 13 => (z.val : ℤ)) (congrFun hEq n)
  change (((g n : ZMod 13).val : ℤ)=((u n : ZMod 13).val : ℤ)) at ht
  rw [ZMod.val_intCast,ZMod.val_intCast] at ht
  have hg' := hb g hg n
  have hu' := hb u hu n
  norm_num at ht
  rwa [Int.emod_eq_of_lt hg'.1 hg'.2,Int.emod_eq_of_lt hu'.1 hu'.2] at ht

theorem source_regular_implies_gap_finite_kernel {b : ℕ}
    (h : IsRegular b (fun k => (sourceLayerEnumeration k : ℤ))) :
    (kernelSequences b gapWord).Finite := by
  apply bounded_regular_finite_kernel (source_regular_implies_gap_regular h)
  intro n
  have hg := gapWord_values n
  omega

end SobolewskiUlasException
