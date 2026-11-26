module
public import Conjectures.CyrusianKaplanStratumClosure
public import Mathlib.Analysis.Convex.Intrinsic
import Mathlib.Topology.Algebra.Affine

@[expose] public section
namespace CyrusianKaplan

open AffineSubspace Filter Set
open scoped Topology

/-- The finite sign strata in the ordinarization argument are
exactly the relative interiors of their weak closures. A zero
of an oriented strict constraint is not relatively interior:
extrapolate away from any actual strict point. -/
theorem intrinsicInterior_weakAffineStratum_eq {E ι : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [Finite ι]
    (f : ι → E →ᵃ[ℝ] ℝ) (I₀ Iminus : Set ι)
    (hf : ∀ i, Continuous (f i))
    (hn : (strictAffineStratum (fun i => f i) I₀ Iminus).Nonempty) :
    intrinsicInterior ℝ (weakAffineStratum (fun i => f i) I₀ Iminus) =
      strictAffineStratum (fun i => f i) I₀ Iminus := by
  let W := weakAffineStratum (fun i => f i) I₀ Iminus
  let Q := affineSpan ℝ W
  have hEq (i : ι) (hi : i ∈ I₀) (x : Q) : f i x.val = 0 := by
    let H := (affineSpan ℝ ({0} : Set ℝ)).comap (f i)
    have hH : Q ≤ H := by
      apply affineSpan_le.mpr
      intro z (hz : z ∈ W)
      apply AffineSubspace.mem_comap.mpr
      exact (mem_affineSpan_singleton ℝ ℝ).mpr (hz.1 i hi)
    exact (mem_affineSpan_singleton ℝ ℝ).mp (AffineSubspace.mem_comap.mp (hH x.property))
  have hOpen : IsOpen (⋂ i : Iminus, {x : Q | f i.val x.val < 0}) :=
    isOpen_iInter_of_finite (fun i : Iminus =>
      isOpen_lt ((hf i.val).comp continuous_subtype_val) continuous_const)
  apply le_antisymm
  · intro x hx
    obtain ⟨z,hz,hzx⟩ := mem_intrinsicInterior.mp hx
    subst x
    have hZW : z ∈ (Subtype.val ⁻¹' W : Set Q) :=
      interior_subset (show z ∈ interior (Subtype.val ⁻¹' W : Set Q) from hz)
    have hZ : z.val ∈ W := hZW
    refine ⟨hZ.1,?_⟩
    intro i hi
    have hzLe := hZ.2 i hi
    by_contra! hNot
    have hzEq : f i z.val = 0 := le_antisymm hzLe hNot
    obtain ⟨y,hy⟩ := hn
    have hyW : y ∈ W := ⟨hy.1,fun j hj => (hy.2 j hj).le⟩
    let u (n : ℕ) : ℝ := -(1 / ((n : ℝ) + 1))
    let q (n : ℕ) : Q :=
      ⟨AffineMap.lineMap z.val y (u n),
        AffineMap.lineMap_mem _ z.property (subset_affineSpan ℝ W hyW)⟩
    have hu : Tendsto u atTop (𝓝 0) := by
      have hu₀ : Tendsto (fun n : ℕ => (1:ℝ) / ((n:ℝ)+1)) atTop (𝓝 0) :=
        tendsto_one_div_add_atTop_nhds_zero_nat
      simpa only [u,neg_zero] using hu₀.neg
    have hq : Tendsto q atTop (𝓝 z) := by
      apply tendsto_subtype_rng.mpr
      have hc : Continuous (AffineMap.lineMap z.val y : ℝ →ᵃ[ℝ] E) :=
        AffineMap.lineMap_continuous
      change Tendsto ((AffineMap.lineMap z.val y) ∘ u) atTop (𝓝 z.val)
      have hlim := (hc.tendsto (0:ℝ)).comp hu
      rwa [AffineMap.lineMap_apply_zero] at hlim
    have hm : ∀ᶠ n in atTop, (q n).val ∈ W :=
      hq.eventually (mem_interior_iff_mem_nhds.mp hz)
    obtain ⟨n,hnW⟩ := hm.exists
    have hUn : u n < 0 := by
      unfold u
      exact neg_lt_zero.mpr (by positivity)
    have hPos : 0 < f i (q n).val := by
      change 0 < f i (AffineMap.lineMap z.val y (u n))
      rw [(f i).apply_lineMap,AffineMap.lineMap_apply_ring,hzEq,mul_zero,zero_add]
      exact mul_pos_of_neg_of_neg hUn (hy.2 i hi)
    exact (not_lt_of_ge (hnW.2 i hi)) hPos
  · intro x (hx : x ∈ strictAffineStratum (fun i => f i) I₀ Iminus)
    have hxW : x ∈ W := ⟨hx.1,fun i hi => (hx.2 i hi).le⟩
    let z : Q := ⟨x,subset_affineSpan ℝ W hxW⟩
    refine mem_intrinsicInterior.mpr ⟨z,?_,rfl⟩
    have hs : (⋂ i : Iminus, {x : Q | f i.val x.val < 0}) ⊆
        (Subtype.val ⁻¹' W : Set Q) := by
      intro y hy
      change y.val ∈ W
      exact ⟨fun i hi => hEq i hi y,fun i hi =>
        ((mem_iInter.mp hy) ⟨i,hi⟩ : f i y.val < 0).le⟩
    have hm : z ∈ (⋂ i : Iminus, {x : Q | f i.val x.val < 0}) :=
      mem_iInter.mpr (fun i : Iminus => hx.2 i.val i.property)
    exact interior_maximal hs hOpen hm

end CyrusianKaplan
