import Conjectures.LonelinessHyperplaneScaledResidues
import Conjectures.LonelinessHyperplaneSmoothFactorization

/-! Positive velocity circles and a disjoint partition by scaled
residue classes. The target needs one unit coordinate. The scale is
supported on the primes of the target order; no primitive-sampling
restriction is imposed on the original velocities. -/

namespace Loneliness.Hyperplane

open scoped BigOperators

noncomputable section

theorem residueScale_natCast (g Q a : ℕ) :
    residueScale g Q (a : ZMod Q) = ((g * a : ℕ) : ZMod (g * Q)) := by
  simpa only [Nat.cast_mul, Int.cast_mul, Int.cast_natCast] using
    residueScale_intCast g Q (a : ℤ)

variable {ι : Type*} [Fintype ι] {Q : ℕ} [NeZero Q]

theorem scaledUnitResidueLine_nat_iff
    (g : ℕ) (hg : 0 < g) (b : ι → ZMod Q) (v : ι → ℕ) :
    (fun i => (v i : ZMod (g * Q))) ∈ scaledUnitResidueLine g b ↔
      ∃ r : ι → ℕ, (∀ i, v i = g * r i) ∧
        (fun i => (r i : ZMod Q)) ∈ unitResidueLine b := by
  classical
  constructor
  · intro hv
    have hd : ∀ i, g ∣ v i := by
      intro i
      have hdi := scaledUnitResidueLine_dvd g b (fun j => (v j : ℤ))
        (by simpa only [Int.cast_natCast] using hv) i
      exact_mod_cast hdi
    let r : ι → ℕ := fun i => v i / g
    have hr : ∀ i, v i = g * r i := fun i => (Nat.mul_div_cancel' (hd i)).symm
    obtain ⟨s, hs, hmap⟩ := Finset.mem_image.mp hv
    have heq : (fun i => (r i : ZMod Q)) = s := by
      apply scaleResidueVector_injective g Q hg
      funext i
      change residueScale g Q (r i : ZMod Q) = residueScale g Q (s i)
      rw [residueScale_natCast, ← hr i]
      exact (congrFun hmap i).symm
    exact ⟨r, hr, heq.symm ▸ hs⟩
  · rintro ⟨r, hr, hres⟩
    refine Finset.mem_image.mpr ⟨fun i => (r i : ZMod Q), hres, ?_⟩
    funext i
    change residueScale g Q (r i : ZMod Q) = (v i : ZMod (g * Q))
    rw [residueScale_natCast, ← hr i]

theorem unitResidueLine_unit_coordinate
    (b : ι → ZMod Q) (i : ι) (hb : IsUnit (b i))
    {r : ι → ZMod Q} (hr : r ∈ unitResidueLine b) : IsUnit (r i) := by
  classical
  obtain ⟨u, _, rfl⟩ := Finset.mem_image.mp hr
  exact u.isUnit.mul hb

theorem unitResidueLine_mul_nat
    (b : ι → ZMod Q) (a : ℕ) (ha : a.Coprime Q)
    {r : ι → ZMod Q} (hr : r ∈ unitResidueLine b) :
    (fun i => (a : ZMod Q) * r i) ∈ unitResidueLine b := by
  classical
  obtain ⟨u, hu⟩ := (ZMod.isUnit_iff_coprime a Q).mpr ha
  obtain ⟨w, _, rfl⟩ := Finset.mem_image.mp hr
  refine Finset.mem_image.mpr ⟨u * w, Finset.mem_univ _, ?_⟩
  funext i
  simp only [Units.val_mul, hu, mul_assoc]

/-- Distinct smooth scales cannot contain the same integer velocity.
One unit coordinate already fixes the scale. -/
theorem scaledUnitResidueLine_unique_smooth
    (b : ι → ZMod Q) (i : ι) (hb : IsUnit (b i))
    (v : ι → ℕ) {g h : ℕ}
    (hg : g ∈ Nat.factoredNumbers Q.primeFactors)
    (hh : h ∈ Nat.factoredNumbers Q.primeFactors)
    (hvg : (fun j => (v j : ZMod (g * Q))) ∈ scaledUnitResidueLine g b)
    (hvh : (fun j => (v j : ZMod (h * Q))) ∈ scaledUnitResidueLine h b) : g = h := by
  have hgpos : 0 < g := Nat.pos_of_ne_zero hg.1
  have hhpos : 0 < h := Nat.pos_of_ne_zero hh.1
  obtain ⟨r, hr, hresr⟩ := (scaledUnitResidueLine_nat_iff g hgpos b v).mp hvg
  obtain ⟨s, hs, hress⟩ := (scaledUnitResidueLine_nat_iff h hhpos b v).mp hvh
  have hrQ : (r i).Coprime Q := (ZMod.isUnit_iff_coprime (r i) Q).mp
    (unitResidueLine_unit_coordinate b i hb hresr)
  have hsQ : (s i).Coprime Q := (ZMod.isUnit_iff_coprime (s i) Q).mp
    (unitResidueLine_unit_coordinate b i hb hress)
  apply Nat.dvd_antisymm
  · apply (coprime_smooth_of_coprime hg hsQ).dvd_of_dvd_mul_right
    rw [← hs i, hr i]
    exact dvd_mul_right _ _
  · apply (coprime_smooth_of_coprime hh hrQ).dvd_of_dvd_mul_right
    rw [← hr i, hs i]
    exact dvd_mul_right _ _

theorem unitCircle_nat_zsmul_surjective (a : ℕ) (ha : 0 < a) :
    Function.Surjective (fun t : UnitAddCircle => (a : ℤ) • t) := by
  intro t
  obtain ⟨r, rfl⟩ := QuotientAddGroup.mk_surjective t
  refine ⟨((r / (a : ℝ) : ℝ) : UnitAddCircle), ?_⟩
  change (a : ℤ) • ((r / (a : ℝ) : ℝ) : UnitAddCircle) = (r : UnitAddCircle)
  rw [← AddCircle.coe_zsmul]
  congr 1
  rw [zsmul_eq_mul, Int.cast_natCast]
  have haR : (a : ℝ) ≠ 0 := by exact_mod_cast ha.ne'
  field_simp [haR] <;> ring

theorem velocity_hits_of_unitResidueLine
    (v : ι → ℤ) (b : ι → ZMod Q)
    (hv : (fun i => (v i : ZMod Q)) ∈ unitResidueLine b) :
    ∃ t : UnitAddCircle, ∀ i, v i • t = ZMod.toAddCircle (b i) := by
  classical
  obtain ⟨u, _, hu⟩ := Finset.mem_image.mp hv
  refine ⟨ZMod.toAddCircle (↑(u⁻¹) : ZMod Q), ?_⟩
  intro i
  have hi : (u : ZMod Q) * b i = (v i : ZMod Q) := congrFun hu i
  rw [← map_zsmul, zsmul_eq_mul, ← hi]
  apply congrArg ZMod.toAddCircle
  calc
    (u : ZMod Q) * b i * (↑(u⁻¹) : ZMod Q) =
        (u : ZMod Q) * ((↑(u⁻¹) : ZMod Q) * b i) := by ring
    _ = b i := Units.mul_inv_cancel_left u (b i)

variable [Nonempty ι]

/-- The primitive normalization is used inside the proof, while the
statement ranges over every positive integer velocity. -/
theorem positive_velocity_hits_residue_iff_smooth
    (v : ι → ℕ) (hv : ∀ i, 0 < v i)
    (b : ι → ZMod Q) (i₀ : ι) (hb : IsUnit (b i₀)) :
    (∃ t : UnitAddCircle, ∀ i, (v i : ℤ) • t = ZMod.toAddCircle (b i)) ↔
      ∃ g : ℕ, g ∈ Nat.factoredNumbers Q.primeFactors ∧
        (fun i => (v i : ZMod (g * Q))) ∈ scaledUnitResidueLine g b := by
  classical
  constructor
  · rintro ⟨t, ht⟩
    let D := Finset.univ.gcd v
    obtain ⟨w, hw, hwgcd⟩ := Finset.extract_gcd v Finset.univ_nonempty
    have hwi : ∀ i, v i = D * w i := fun i => hw i (Finset.mem_univ _)
    have hD : 0 < D := by
      by_contra hnot
      have hz : D = 0 := Nat.eq_zero_of_not_pos hnot
      have hvi := hwi i₀
      rw [hz, zero_mul] at hvi
      exact (hv i₀).ne' hvi
    have hprimitive : PrimitiveNormal (fun i => (w i : ℤ)) := by
      simpa only [PrimitiveNormal, Int.natAbs_natCast] using hwgcd
    have hhit : ∃ r : UnitAddCircle,
        ∀ i, (w i : ℤ) • r = ZMod.toAddCircle (b i) := by
      refine ⟨(D : ℤ) • t, ?_⟩
      intro i
      rw [← mul_smul, mul_comm]
      have hti := ht i
      rw [hwi i, Nat.cast_mul] at hti
      exact hti
    obtain ⟨u, hu⟩ := (primitive_velocity_hits_unit_line_iff
      (fun i => (w i : ℤ)) hprimitive b
      (primitiveResidue_of_unit_coordinate b i₀ hb)).mp hhit
    have hwres : (fun i => (w i : ZMod Q)) ∈ unitResidueLine b := by
      refine Finset.mem_image.mpr ⟨u, Finset.mem_univ _, ?_⟩
      funext i
      simpa only [Int.cast_natCast] using (hu i).symm
    obtain ⟨g, h, hg, _, hhQ, hDgh⟩ :=
      exists_smooth_coprime_factorization Q D
        (Nat.pos_of_ne_zero (NeZero.ne Q)) hD
    refine ⟨g, hg, (scaledUnitResidueLine_nat_iff g
      (Nat.pos_of_ne_zero hg.1) b v).mpr ?_⟩
    refine ⟨fun i => h * w i, ?_, ?_⟩
    · intro i
      rw [hwi i, hDgh, mul_assoc]
    · simpa only [Nat.cast_mul] using unitResidueLine_mul_nat b h hhQ hwres
  · rintro ⟨g, hg, hvg⟩
    have hgpos := Nat.pos_of_ne_zero hg.1
    obtain ⟨r, hr, hres⟩ := (scaledUnitResidueLine_nat_iff g hgpos b v).mp hvg
    obtain ⟨t, ht⟩ := velocity_hits_of_unitResidueLine (fun i => (r i : ℤ)) b
      (by simpa only [Int.cast_natCast] using hres)
    obtain ⟨s, hs⟩ := unitCircle_nat_zsmul_surjective g hgpos t
    change (g : ℤ) • s = t at hs
    refine ⟨s, ?_⟩
    intro i
    calc
      (v i : ℤ) • s = ((r i : ℤ) * (g : ℤ)) • s := by
        rw [hr i, Nat.cast_mul, mul_comm]
      _ = (r i : ℤ) • t := by rw [mul_smul, hs]
      _ = ZMod.toAddCircle (b i) := ht i

theorem positive_velocity_hits_residue_iff_unique_smooth
    (v : ι → ℕ) (hv : ∀ i, 0 < v i)
    (b : ι → ZMod Q) (i₀ : ι) (hb : IsUnit (b i₀)) :
    (∃ t : UnitAddCircle, ∀ i, (v i : ℤ) • t = ZMod.toAddCircle (b i)) ↔
      ∃! g : ℕ, g ∈ Nat.factoredNumbers Q.primeFactors ∧
        (fun i => (v i : ZMod (g * Q))) ∈ scaledUnitResidueLine g b := by
  rw [positive_velocity_hits_residue_iff_smooth v hv b i₀ hb]
  constructor
  · rintro ⟨g, hg, hvg⟩
    refine ⟨g, ⟨hg, hvg⟩, ?_⟩
    intro h hh
    exact scaledUnitResidueLine_unique_smooth b i₀ hb v hh.1 hg hh.2 hvg
  · rintro ⟨g, hg, _⟩
    exact ⟨g, hg⟩

end

end Loneliness.Hyperplane
