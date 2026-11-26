module
public import Conjectures.PomeranceSarkozyAtomicPush

@[expose] public section
namespace PomeranceSarkozy

variable {A B C : Type*}

private noncomputable def supportedFiberEquiv (g : A→B) (hg : Function.Injective g)
    (f : B→C) (c : C) :
    ↥((f∘g) ⁻¹' {c}) ≃ {z : ↥(f ⁻¹' {c}) // z.val∈Set.range g} where
  toFun a := ⟨⟨g a.val,a.property⟩,⟨a.val,rfl⟩⟩
  invFun z :=
    ⟨z.property.choose, (show f (g z.property.choose)=c from
      (congrArg f z.property.choose_spec).trans z.val.property)⟩
  left_inv a := Subtype.ext (hg (Set.mem_range_self a.val).choose_spec)
  right_inv z := Subtype.ext (Subtype.ext z.property.choose_spec)

/-- Fibers can be summed in a finite encoding or over an infinite
ambient support when the ambient mass vanishes off the encoding. -/
theorem atomicPush_supported_encoding (g : A→B) (hg : Function.Injective g)
    (f : B→C) (p : A→ℝ) (q : B→ℝ) (hqs : Summable q)
    (hm : ∀ a,q (g a)=p a) (hz : ∀ b∉Set.range g,q b=0) :
    atomicPush f q=atomicPush (f∘g) p := by
  classical
  funext c
  let S : Set B := f ⁻¹' {c}
  let T : Set ↥S := {z | z.val∈Set.range g}
  have hs : Summable (fun z : ↥S => q z.val) := hqs.subtype S
  have hsum₀ : (∑' z : ↥Tᶜ,q z.val.val)=0 := by
    have he (z : ↥Tᶜ) : q z.val.val=0 := hz _ z.property
    simp_rw [he]
    exact tsum_zero
  have he : (∑' z : ↥T,q z.val.val) = ∑' z : ↥S,q z.val := by
    have he := hs.tsum_subtype_add_tsum_subtype_compl T
    change (∑' z : ↥T,q z.val.val)+(∑' z : ↥Tᶜ,q z.val.val)=_ at he
    simpa only [hsum₀,add_zero] using he
  unfold atomicPush
  let e : ↥((f∘g) ⁻¹' {c}) ≃ ↥T := supportedFiberEquiv g hg f c
  rw [← he,← e.tsum_eq (fun z : ↥T => q z.val.val)]
  apply tsum_congr
  intro a
  change q (g a.val)=p a.val
  exact hm a.val

end PomeranceSarkozy
