import Conjectures.LonelinessHyperplaneResidueKernel
import Mathlib.Topology.Instances.AddCircle.Real
import Mathlib.Data.Nat.Totient

/-! Exact finite arithmetic for an endpoint of finite order on a
primitive velocity circle. The point lies on the circle precisely when
the primitive velocity residue is a unit multiple of the point residue.
There are exactly `φ(Q)` such residues. This module makes no density claim. -/

namespace Loneliness.Hyperplane

open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] {Q : ℕ} [NeZero Q]

def PrimitiveResidue (b : ι → ZMod Q) : Prop :=
  ∃ c : ι → ZMod Q, ∑ i, c i * b i = 1

theorem primitiveResidue_of_unit_coordinate
    (b : ι → ZMod Q) (i : ι) (hi : IsUnit (b i)) : PrimitiveResidue b := by
  classical
  obtain ⟨u, hu⟩ := hi
  refine ⟨Pi.single i (↑(u⁻¹) : ZMod Q), ?_⟩
  rw [Finset.sum_eq_single i]
  · simp only [Pi.single_eq_same]
    rw [← hu]
    simp
  · intro j _ hji
    simp [Pi.single_eq_of_ne hji]
  · simp

/-- Bézout coefficients of the primitive velocity recover the time
parameter from the target point. -/
theorem primitive_velocity_hits_residue_iff
    (v : ι → ℤ) (hv : PrimitiveNormal v) (b : ι → ZMod Q) :
    (∃ t : UnitAddCircle, ∀ i, v i • t = ZMod.toAddCircle (b i)) ↔
      ∃ a : ZMod Q, ∀ i, (v i : ZMod Q) * a = b i := by
  constructor
  · rintro ⟨t, ht⟩
    obtain ⟨e, he⟩ := primitive_bezout v hv
    have he' : ∑ i, e i * v i = 1 := by simpa only [mul_comm] using he
    let a : ZMod Q := ∑ i, (e i : ZMod Q) * b i
    have hat : ZMod.toAddCircle a = t := by
      calc
        ZMod.toAddCircle a = ∑ i, e i • ZMod.toAddCircle (b i) := by
          dsimp only [a]
          rw [map_sum]
          apply Finset.sum_congr rfl
          intro i _
          rw [← zsmul_eq_mul, map_zsmul]
        _ = ∑ i, e i • (v i • t) := by
          apply Finset.sum_congr rfl
          intro i _
          rw [ht i]
        _ = (∑ i, e i * v i) • t := by simp only [Finset.sum_smul, mul_smul]
        _ = t := by rw [he', one_smul]
    refine ⟨a, ?_⟩
    intro i
    apply ZMod.toAddCircle_injective Q
    calc
      ZMod.toAddCircle ((v i : ZMod Q) * a) = v i • ZMod.toAddCircle a := by
        rw [← zsmul_eq_mul, map_zsmul]
      _ = ZMod.toAddCircle (b i) := by rw [hat, ht i]
  · rintro ⟨a, ha⟩
    refine ⟨ZMod.toAddCircle a, ?_⟩
    intro i
    rw [← map_zsmul, zsmul_eq_mul, ha i]

theorem primitive_velocity_hits_unit_line_iff
    (v : ι → ℤ) (hv : PrimitiveNormal v)
    (b : ι → ZMod Q) (hb : PrimitiveResidue b) :
    (∃ t : UnitAddCircle, ∀ i, v i • t = ZMod.toAddCircle (b i)) ↔
      ∃ u : (ZMod Q)ˣ, ∀ i, (v i : ZMod Q) = (u : ZMod Q) * b i := by
  rw [primitive_velocity_hits_residue_iff v hv b]
  constructor
  · rintro ⟨a, ha⟩
    obtain ⟨c, hc⟩ := hb
    have hunit : IsUnit a := by
      apply IsUnit.of_mul_eq_one (∑ i, c i * (v i : ZMod Q))
      calc
        _ = ∑ i, c i * ((v i : ZMod Q) * a) := by
          rw [Finset.mul_sum]
          apply Finset.sum_congr rfl
          intro i _
          ring
        _ = ∑ i, c i * b i := by simp only [ha]
        _ = 1 := hc
    obtain ⟨u, hu⟩ := hunit
    refine ⟨u⁻¹, ?_⟩
    intro i
    calc
      (v i : ZMod Q) = (↑(u⁻¹) : ZMod Q) * ((v i : ZMod Q) * (u : ZMod Q)) := by
        simp [mul_left_comm]
      _ = (↑(u⁻¹) : ZMod Q) * b i := by rw [hu, ha i]
  · rintro ⟨u, hu⟩
    refine ⟨(↑(u⁻¹) : ZMod Q), ?_⟩
    intro i
    rw [hu i]
    calc
      (u : ZMod Q) * b i * (↑(u⁻¹) : ZMod Q) =
          (u : ZMod Q) * ((↑(u⁻¹) : ZMod Q) * b i) := by ring
      _ = b i := Units.mul_inv_cancel_left u (b i)

theorem unit_residue_line_injective
    (b : ι → ZMod Q) (hb : PrimitiveResidue b) :
    Function.Injective (fun u : (ZMod Q)ˣ => fun i => (u : ZMod Q) * b i) := by
  obtain ⟨c, hc⟩ := hb
  intro u w huw
  apply Units.ext
  have heq : (u : ZMod Q) * (∑ i, c i * b i) =
      (w : ZMod Q) * (∑ i, c i * b i) := by
    rw [Finset.mul_sum, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i _
    have hi : (u : ZMod Q) * b i = (w : ZMod Q) * b i := congrFun huw i
    calc
      (u : ZMod Q) * (c i * b i) = c i * ((u : ZMod Q) * b i) := by ring
      _ = c i * ((w : ZMod Q) * b i) := congrArg (fun z : ZMod Q => c i * z) hi
      _ = (w : ZMod Q) * (c i * b i) := by ring
  simpa only [hc, mul_one] using heq

def unitResidueLine (b : ι → ZMod Q) : Finset (ι → ZMod Q) := by
  classical
  exact Finset.univ.image (fun u : (ZMod Q)ˣ => fun i => (u : ZMod Q) * b i)

theorem unitResidueLine_card (b : ι → ZMod Q) (hb : PrimitiveResidue b) :
    (unitResidueLine b).card = Nat.totient Q := by
  classical
  rw [unitResidueLine, Finset.card_image_of_injective _ (unit_residue_line_injective b hb),
    Finset.card_univ, ZMod.card_units_eq_totient]

theorem unitResidueLine_mem_kernel
    (m : ι → ℤ) (b : ι → ZMod Q) (hb : residueNormalHom m Q b = 0)
    {r : ι → ZMod Q} (hr : r ∈ unitResidueLine b) : residueNormalHom m Q r = 0 := by
  classical
  obtain ⟨u, _, rfl⟩ := Finset.mem_image.mp hr
  change (∑ i, (m i : ZMod Q) * ((u : ZMod Q) * b i)) = 0
  calc
    _ = (u : ZMod Q) * (∑ i, (m i : ZMod Q) * b i) := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro i _
      ring
    _ = 0 := by change (u : ZMod Q) * residueNormalHom m Q b = 0; rw [hb, mul_zero]

end

end Loneliness.Hyperplane
