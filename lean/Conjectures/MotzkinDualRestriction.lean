import Conjectures.MotzkinImported.HaarCharacter
import Conjectures.MotzkinImported.DiscreteBidual
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Topology.Algebra.Group.Subgroup

/-! Continuous characters of a compact abelian group restrict densely to the
dual of any discrete subgroup. No continuous extension of an individual
character of a dense abstract subgroup is asserted or used. -/
namespace Motzkin

theorem denseRange_dual_map {H G : Type*} [CommGroup H] [CommGroup G]
    [TopologicalSpace H] [DiscreteTopology H]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [T2Space G]
    (f : H →ₜ* G) (hf : Function.Injective f) :
    DenseRange (PontryaginDual.map f) := by
  classical
  let r := PontryaginDual.map f
  let R : Subgroup (PontryaginDual H) := r.toMonoidHom.range
  let K : Subgroup (PontryaginDual H) := R.topologicalClosure
  have hK : K=⊤ := by
    apply top_unique
    intro ψ _
    by_contra hψ
    let _ : IsClosed (K : Set (PontryaginDual H)) := R.isClosed_topologicalClosure
    let _ : K.Normal := inferInstance
    let Q := PontryaginDual H ⧸ K
    let _ : CompactSpace Q := inferInstance
    let _ : IsTopologicalGroup Q := inferInstance
    let _ : T3Space Q := QuotientGroup.instT3Space K
    let _ : T2Space Q := inferInstance
    let q : PontryaginDual H →ₜ* Q :=
      {toMonoidHom := QuotientGroup.mk' K,
       continuous_toFun := QuotientGroup.continuous_mk}
    have hq (z : PontryaginDual H) : q z=1 ↔ z ∈ K := QuotientGroup.eq_one_iff z
    have hqψ : q ψ ≠ 1 := fun h => hψ ((hq ψ).mp h)
    obtain ⟨θ,hθ⟩ := exists_continuous_character_ne_one hqψ
    let ξ : PontryaginDual (PontryaginDual H) := θ.comp q
    obtain ⟨h,hh⟩ := PontryaginDual.eval_surjective_of_discrete H ξ
    have hkill (χ : PontryaginDual G) : ξ (r χ)=1 := by
      change θ (q (r χ))=1
      rw [(hq (r χ)).mpr (R.le_topologicalClosure ⟨χ,rfl⟩),map_one]
    have hfh : f h=1 := by
      by_contra hne
      obtain ⟨χ,hχ⟩ := exists_continuous_character_ne_one hne
      apply hχ
      calc
        χ (f h) = PontryaginDual.eval H h (r χ) := rfl
        _ = ξ (r χ) := DFunLike.congr_fun hh (r χ)
        _ = 1 := hkill χ
    have hh1 : h=1 := hf (hfh.trans f.map_one.symm)
    have hξ : ξ=1 := by rw [← hh,hh1,map_one]
    apply hθ
    change ξ ψ=1
    rw [hξ]
    rfl
  change Dense (Set.range r)
  rw [dense_iff_closure_eq]
  change (K : Set (PontryaginDual H))=Set.univ
  rw [hK]
  rfl

end Motzkin
