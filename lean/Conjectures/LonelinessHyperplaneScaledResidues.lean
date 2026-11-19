import Conjectures.LonelinessHyperplaneEndpointArithmetic
import Conjectures.LonelinessHyperplaneResidueDensity
import Conjectures.LonelinessHyperplaneOneRelation

/-! The fixed-divisor contributions in the endpoint-density argument.
Scaling embeds the residue group modulo `Q` into the group modulo `gQ`.
The scaled unit line has `φ(Q)` classes. Its frequency and its uniform
divisibility bound use the original positive, distinct sampling box. -/

namespace Loneliness.Hyperplane

open Filter
open scoped BigOperators Topology

noncomputable section

def residueScaleIntegerHom (g Q : ℕ) : ℤ →+ ZMod (g * Q) where
  toFun z := (((g : ℤ) * z : ℤ) : ZMod (g * Q))
  map_zero' := by simp
  map_add' := by
    intro x y
    simp only [mul_add, Int.cast_add]

theorem residueScaleIntegerHom_period (g Q : ℕ) :
    residueScaleIntegerHom g Q (Q : ℤ) = 0 := by
  change (((g : ℤ) * (Q : ℤ) : ℤ) : ZMod (g * Q)) = 0
  simp only [Int.cast_natCast, ← Nat.cast_mul, ZMod.natCast_self]

def residueScale (g Q : ℕ) : ZMod Q →+ ZMod (g * Q) :=
  ZMod.lift Q ⟨residueScaleIntegerHom g Q, residueScaleIntegerHom_period g Q⟩

theorem residueScale_intCast (g Q : ℕ) (z : ℤ) :
    residueScale g Q (z : ZMod Q) = (((g : ℤ) * z : ℤ) : ZMod (g * Q)) := by
  exact ZMod.lift_coe Q
    ⟨residueScaleIntegerHom g Q, residueScaleIntegerHom_period g Q⟩ z

theorem residueScale_injective (g Q : ℕ) (hg : 0 < g) :
    Function.Injective (residueScale g Q) := by
  unfold residueScale
  apply (ZMod.lift_injective Q).mpr
  intro z hz
  change (((g : ℤ) * z : ℤ) : ZMod (g * Q)) = 0 at hz
  have hdiv := (ZMod.intCast_zmod_eq_zero_iff_dvd ((g : ℤ) * z) (g * Q)).mp hz
  rw [Nat.cast_mul] at hdiv
  obtain ⟨c, hc⟩ := hdiv
  apply (ZMod.intCast_zmod_eq_zero_iff_dvd z Q).mpr
  refine ⟨c, ?_⟩
  have hgZ : (g : ℤ) ≠ 0 := by exact_mod_cast hg.ne'
  apply mul_left_cancel₀ hgZ
  calc
    (g : ℤ) * z = ((g : ℤ) * (Q : ℤ)) * c := hc
    _ = (g : ℤ) * ((Q : ℤ) * c) := by ring

variable {ι : Type*} [Fintype ι]

def scaleResidueVector (g Q : ℕ) (b : ι → ZMod Q) : ι → ZMod (g * Q) :=
  fun i => residueScale g Q (b i)

omit [Fintype ι] in
theorem scaleResidueVector_injective (g Q : ℕ) (hg : 0 < g) :
    Function.Injective (scaleResidueVector (ι := ι) g Q) := by
  intro r s hrs
  funext i
  apply residueScale_injective g Q hg
  exact congrFun hrs i

theorem residueNormalHom_scaleResidueVector
    (m : ι → ℤ) (g Q : ℕ) (b : ι → ZMod Q) :
    residueNormalHom m (g * Q) (scaleResidueVector g Q b) =
      residueScale g Q (residueNormalHom m Q b) := by
  change (∑ i, (m i : ZMod (g * Q)) * residueScale g Q (b i)) =
    residueScale g Q (∑ i, (m i : ZMod Q) * b i)
  rw [map_sum]
  apply Finset.sum_congr rfl
  intro i _
  rw [← zsmul_eq_mul, ← zsmul_eq_mul, map_zsmul]

variable {Q : ℕ} [NeZero Q]

def scaledUnitResidueLine (g : ℕ) (b : ι → ZMod Q) : Finset (ι → ZMod (g * Q)) := by
  classical
  exact (unitResidueLine b).image (scaleResidueVector g Q)

theorem scaledUnitResidueLine_card
    (g : ℕ) (hg : 0 < g) (b : ι → ZMod Q) (hb : PrimitiveResidue b) :
    (scaledUnitResidueLine g b).card = Nat.totient Q := by
  classical
  rw [scaledUnitResidueLine,
    Finset.card_image_of_injective _ (scaleResidueVector_injective g Q hg),
    unitResidueLine_card b hb]

theorem scaledUnitResidueLine_mem_kernel
    (m : ι → ℤ) (g : ℕ) (b : ι → ZMod Q)
    (hb : residueNormalHom m Q b = 0)
    {r : ι → ZMod (g * Q)} (hr : r ∈ scaledUnitResidueLine g b) :
    residueNormalHom m (g * Q) r = 0 := by
  classical
  obtain ⟨s, hs, rfl⟩ := Finset.mem_image.mp hr
  rw [residueNormalHom_scaleResidueVector, unitResidueLine_mem_kernel m b hb hs,
    map_zero]

/-- Membership in a scaled residue class forces coordinatewise
divisibility by the scale in the integers. -/
theorem scaledUnitResidueLine_dvd
    (g : ℕ) (b : ι → ZMod Q) (v : ι → ℤ)
    (hv : (fun i => (v i : ZMod (g * Q))) ∈ scaledUnitResidueLine g b) :
    ∀ i, (g : ℤ) ∣ v i := by
  classical
  obtain ⟨r, _, heq⟩ := Finset.mem_image.mp hv
  intro i
  obtain ⟨z, hz⟩ := ZMod.intCast_surjective (r i)
  have hgi : (((g : ℤ) * z : ℤ) : ZMod (g * Q)) = (v i : ZMod (g * Q)) := by
    rw [← residueScale_intCast g Q z, hz]
    exact congrFun heq i
  have hdiv : ((g * Q : ℕ) : ℤ) ∣ v i - (g : ℤ) * z := by
    apply (ZMod.intCast_zmod_eq_zero_iff_dvd (v i - (g : ℤ) * z) (g * Q)).mp
    rw [Int.cast_sub, hgi, sub_self]
  obtain ⟨c, hc⟩ := hdiv
  refine ⟨z + (Q : ℤ) * c, ?_⟩
  calc
    v i = (g : ℤ) * z + ((g * Q : ℕ) : ℤ) * c := by linarith [hc]
    _ = (g : ℤ) * (z + (Q : ℤ) * c) := by push_cast; ring

variable [DecidableEq ι]

/-- Each fixed positive scale contributes `φ(Q)` genuine residue
classes modulo `gQ`, all counted in the original box. -/
theorem scaledUnitResidueLine_frequency_tendsto
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (g : ℕ) (hg : 0 < g)
    (b : ι → ZMod Q) (hb : PrimitiveResidue b)
    (hkernel : residueNormalHom m Q b = 0) :
    Tendsto (residueSetFrequency m (g * Q) (scaledUnitResidueLine g b)) atTop
      (𝓝 ((Nat.totient Q : ℝ) / ((g * Q : ℕ) : ℝ) ^ (Fintype.card ι - 1))) := by
  have hQ : 0 < Q := Nat.pos_of_ne_zero (NeZero.ne Q)
  simpa only [scaledUnitResidueLine_card g hg b hb] using
    residueSetFrequency_tendsto m hm hreal hdim (g * Q) (Nat.mul_pos hg hQ)
      (scaledUnitResidueLine g b)
      (fun _ hr => scaledUnitResidueLine_mem_kernel m g b hkernel hr)

theorem positiveBoxScaledUnitResidue_card_le
    (m : ι → ℤ) (hm : PrimitiveNormal m) (g N : ℕ) (hg : 0 < g)
    (b : ι → ZMod Q) :
    (positiveBoxResidueSet m (g * Q) (scaledUnitResidueLine g b) N).card ≤
      (N / g) ^ (Fintype.card ι - 1) := by
  classical
  have hsub : positiveBoxResidueSet m (g * Q) (scaledUnitResidueLine g b) N ⊆
      positiveBoxDivisible m g N := by
    intro v hv
    obtain ⟨hvA, hvres⟩ := Finset.mem_filter.mp hv
    apply Finset.mem_filter.mpr
    constructor
    · exact Finset.mem_filter.mpr
        ⟨Finset.mem_univ _, (Finset.mem_filter.mp hvA).2.1⟩
    · exact scaledUnitResidueLine_dvd g b (positiveBoxCoordinates v) hvres
  exact (Finset.card_le_card hsub).trans (positiveBoxDivisible_card_le m hm g N hg)

private theorem box_le_twice_floor_for_divisibility
    {N C : ℕ} (hC : 0 < C) (hN : C ≤ N) : N ≤ (2 * C) * (N / C) := by
  have hq : 1 ≤ N / C := Nat.div_pos hN hC
  have hCq : C ≤ C * (N / C) := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left C hq
  have hmod : N % C ≤ C := (Nat.mod_lt N hC).le
  have hdiv := Nat.mod_add_div N C
  nlinarith

/-- A bound uniform in both the box size and the scale. Restricting
the scales to the finitely supported smooth integers then gives a
summable dominator even when the relation lattice has dimension one. -/
theorem exists_scaledUnitResidue_uniform_bound
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (b : ι → ZMod Q) :
    ∃ C K : ℕ, 0 < C ∧ ∀ N : ℕ, C ≤ N → ∀ g : ℕ, 0 < g →
      0 < (positiveBoxAdmissible m N).card ∧
        residueSetFrequency m (g * Q) (scaledUnitResidueLine g b) N ≤
          (K : ℝ) / (g : ℝ) ^ (Fintype.card ι - 1) := by
  obtain ⟨C, hC, hden⟩ := exists_admissible_box_denominator m hm hreal
  let d := Fintype.card ι - 1
  let K := (2 * C) ^ d
  refine ⟨C, K, hC, ?_⟩
  intro N hN g hg
  let E := (positiveBoxResidueSet m (g * Q) (scaledUnitResidueLine g b) N).card
  let D := (positiveBoxAdmissible m N).card
  have hD : 0 < D := (pow_pos (Nat.div_pos hN hC) _).trans_le (hden N hN)
  have hDR : (0 : ℝ) < (D : ℝ) := by exact_mod_cast hD
  have hgR : (0 : ℝ) < (g : ℝ) := by exact_mod_cast hg
  have hcross : E * g ^ d ≤ K * D := by
    calc
      E * g ^ d ≤ (N / g) ^ d * g ^ d :=
        Nat.mul_le_mul_right _ (positiveBoxScaledUnitResidue_card_le m hm g N hg b)
      _ = ((N / g) * g) ^ d := (mul_pow _ _ _).symm
      _ ≤ N ^ d := Nat.pow_le_pow_left (Nat.div_mul_le_self N g) _
      _ ≤ ((2 * C) * (N / C)) ^ d :=
        Nat.pow_le_pow_left (box_le_twice_floor_for_divisibility hC hN) _
      _ = (2 * C) ^ d * (N / C) ^ d := mul_pow _ _ _
      _ ≤ K * D := Nat.mul_le_mul_left _ (hden N hN)
  refine ⟨hD, ?_⟩
  change (E : ℝ) / (D : ℝ) ≤ (K : ℝ) / (g : ℝ) ^ d
  apply (div_le_div_iff₀ hDR (pow_pos hgR d)).mpr
  exact_mod_cast hcross

end

end Loneliness.Hyperplane
