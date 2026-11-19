import Conjectures.LonelinessHyperplaneResiduePartition
import Conjectures.LonelinessHyperplaneSmoothDensity

/-! The density of positive, distinct velocity circles passing through
a fixed finite-order point on the relation torus. The sampling is over
all velocities in the original box. Smooth residue classes partition
the event, and dominated convergence gives its exact Euler product. -/

namespace Loneliness.Hyperplane

open Filter
open scoped BigOperators Topology

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]
variable {Q : ℕ} [NeZero Q]

def positiveBoxNatCoordinates {N : ℕ} (v : ι → Fin N) : ι → ℕ :=
  fun i => (v i : ℕ) + 1

omit [Fintype ι] [DecidableEq ι] [Nonempty ι] in
theorem positiveBoxCoordinates_eq_natCast {N : ℕ} (v : ι → Fin N) (i : ι) :
    positiveBoxCoordinates v i = (positiveBoxNatCoordinates v i : ℤ) := by
  simp only [positiveBoxCoordinates, positiveBoxEntry, positiveBoxNatCoordinates,
    Nat.cast_add, Nat.cast_one]

omit [DecidableEq ι] in
theorem scaledUnitResidueLine_box_scale_le
    (b : ι → ZMod Q) (g N : ℕ) (hg : 0 < g)
    (v : ι → Fin N)
    (hv : (fun i => (positiveBoxCoordinates v i : ZMod (g * Q))) ∈
      scaledUnitResidueLine g b) : g ≤ N := by
  have hnat : (fun i => (positiveBoxNatCoordinates v i : ZMod (g * Q))) ∈
      scaledUnitResidueLine g b := by
    simpa only [positiveBoxCoordinates_eq_natCast, Int.cast_natCast] using hv
  obtain ⟨r, hr, _⟩ := (scaledUnitResidueLine_nat_iff g hg b
    (positiveBoxNatCoordinates v)).mp hnat
  let i := Classical.arbitrary ι
  have hdiv : g ∣ positiveBoxNatCoordinates v i := ⟨r i, hr i⟩
  have hle := Nat.le_of_dvd (Nat.succ_pos (v i : ℕ)) hdiv
  have hvN := (v i).isLt
  omega

def smoothScalesInBox (Q N : ℕ) : Finset (Nat.factoredNumbers Q.primeFactors) :=
  (Finset.range (N + 1)).subtype (· ∈ Nat.factoredNumbers Q.primeFactors)

def positiveBoxHitsResidue (m : ι → ℤ) (b : ι → ZMod Q) (N : ℕ) :
    Finset (ι → Fin N) := by
  classical
  exact (positiveBoxAdmissible m N).filter (fun v =>
    ∃ t : UnitAddCircle, ∀ i, positiveBoxCoordinates v i • t = ZMod.toAddCircle (b i))

theorem positiveBoxHitsResidue_eq_biUnion
    (m : ι → ℤ) (b : ι → ZMod Q) (i₀ : ι) (hb : IsUnit (b i₀)) (N : ℕ) :
    positiveBoxHitsResidue m b N =
      (smoothScalesInBox Q N).biUnion (fun g =>
        positiveBoxResidueSet m ((g : ℕ) * Q) (scaledUnitResidueLine (g : ℕ) b) N) := by
  classical
  ext v
  constructor
  · intro hv
    obtain ⟨hvA, hhit⟩ := Finset.mem_filter.mp hv
    have hhitNat : ∃ t : UnitAddCircle,
        ∀ i, (positiveBoxNatCoordinates v i : ℤ) • t = ZMod.toAddCircle (b i) := by
      simpa only [positiveBoxCoordinates_eq_natCast] using hhit
    obtain ⟨g, hg, hres⟩ := (positive_velocity_hits_residue_iff_smooth
      (positiveBoxNatCoordinates v) (fun i => Nat.succ_pos (v i : ℕ)) b i₀ hb).mp hhitNat
    have hres' : (fun i => (positiveBoxCoordinates v i : ZMod (g * Q))) ∈
        scaledUnitResidueLine g b := by
      simpa only [positiveBoxCoordinates_eq_natCast, Int.cast_natCast] using hres
    have hgN := scaledUnitResidueLine_box_scale_le b g N
      (Nat.pos_of_ne_zero hg.1) v hres'
    refine Finset.mem_biUnion.mpr ⟨⟨g, hg⟩, ?_, ?_⟩
    · simpa only [smoothScalesInBox, Finset.mem_subtype, Finset.mem_range] using
        Nat.lt_succ_of_le hgN
    · exact Finset.mem_filter.mpr ⟨hvA, hres'⟩
  · intro hv
    obtain ⟨g, _, hvg⟩ := Finset.mem_biUnion.mp hv
    obtain ⟨hvA, hres⟩ := Finset.mem_filter.mp hvg
    have hresNat : (fun i => (positiveBoxNatCoordinates v i : ZMod ((g : ℕ) * Q))) ∈
        scaledUnitResidueLine (g : ℕ) b := by
      simpa only [positiveBoxCoordinates_eq_natCast, Int.cast_natCast] using hres
    have hhit := (positive_velocity_hits_residue_iff_smooth
      (positiveBoxNatCoordinates v) (fun i => Nat.succ_pos (v i : ℕ)) b i₀ hb).mpr
      ⟨(g : ℕ), g.property, hresNat⟩
    apply Finset.mem_filter.mpr
    refine ⟨hvA, ?_⟩
    simpa only [positiveBoxCoordinates_eq_natCast] using hhit

theorem positiveBoxHitsResidue_card
    (m : ι → ℤ) (b : ι → ZMod Q) (i₀ : ι) (hb : IsUnit (b i₀)) (N : ℕ) :
    (positiveBoxHitsResidue m b N).card =
      ∑ g ∈ smoothScalesInBox Q N,
        (positiveBoxResidueSet m ((g : ℕ) * Q) (scaledUnitResidueLine (g : ℕ) b) N).card := by
  classical
  rw [positiveBoxHitsResidue_eq_biUnion m b i₀ hb N]
  apply Finset.card_biUnion
  intro g _ h _ hne
  apply Finset.disjoint_left.mpr
  intro v hvg hvh
  apply hne
  apply Subtype.ext
  apply scaledUnitResidueLine_unique_smooth b i₀ hb (positiveBoxNatCoordinates v)
    g.property h.property
  · simpa only [positiveBoxCoordinates_eq_natCast, Int.cast_natCast] using
      (Finset.mem_filter.mp hvg).2
  · simpa only [positiveBoxCoordinates_eq_natCast, Int.cast_natCast] using
      (Finset.mem_filter.mp hvh).2

def residueHitFrequency (m : ι → ℤ) (b : ι → ZMod Q) (N : ℕ) : ℝ :=
  ((positiveBoxHitsResidue m b N).card : ℝ) / (positiveBoxAdmissible m N).card

theorem residueHitFrequency_eq_smoothResidueFrequency
    (m : ι → ℤ) (b : ι → ZMod Q) (i₀ : ι) (hb : IsUnit (b i₀)) (N : ℕ) :
    residueHitFrequency m b N = smoothResidueFrequency m b N := by
  classical
  have hzero : ∀ g : Nat.factoredNumbers Q.primeFactors,
      g ∉ smoothScalesInBox Q N →
      residueSetFrequency m ((g : ℕ) * Q) (scaledUnitResidueLine (g : ℕ) b) N = 0 := by
    intro g hg
    have hgN : N < (g : ℕ) := by
      simpa only [smoothScalesInBox, Finset.mem_subtype, Finset.mem_range,
        not_lt, Nat.succ_le_iff] using hg
    have hempty : positiveBoxResidueSet m ((g : ℕ) * Q)
        (scaledUnitResidueLine (g : ℕ) b) N = ∅ := by
      apply Finset.eq_empty_iff_forall_notMem.mpr
      intro v hv
      have hle := scaledUnitResidueLine_box_scale_le b (g : ℕ) N
        (Nat.pos_of_ne_zero g.property.1) v (Finset.mem_filter.mp hv).2
      omega
    simp only [residueSetFrequency, hempty, Finset.card_empty, Nat.cast_zero, zero_div]
  calc
    residueHitFrequency m b N =
        ∑ g ∈ smoothScalesInBox Q N,
          residueSetFrequency m ((g : ℕ) * Q) (scaledUnitResidueLine (g : ℕ) b) N := by
      unfold residueHitFrequency residueSetFrequency
      rw [positiveBoxHitsResidue_card m b i₀ hb N, Nat.cast_sum, Finset.sum_div]
    _ = smoothResidueFrequency m b N := (tsum_eq_sum hzero).symm

/-- Exact limiting density for hitting the finite-order point. The
point must lie in the normal kernel and have a unit coordinate. -/
theorem residueHitFrequency_tendsto
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι)
    (b : ι → ZMod Q) (i₀ : ι) (hb : IsUnit (b i₀))
    (hkernel : residueNormalHom m Q b = 0) :
    Tendsto (residueHitFrequency m b) atTop
      (𝓝 ((Nat.totient Q : ℝ) /
        ((Q : ℝ) ^ (Fintype.card ι - 1) *
          ∏ p ∈ Q.primeFactors, (1 - ((p : ℝ) ^ (Fintype.card ι - 1))⁻¹)))) := by
  have ht := smoothResidueFrequency_tendsto m hm hreal hdim b
    (primitiveResidue_of_unit_coordinate b i₀ hb) hkernel
  change Tendsto (fun N => smoothResidueFrequency m b N) atTop _ at ht
  change Tendsto (fun N => residueHitFrequency m b N) atTop _
  simpa only [residueHitFrequency_eq_smoothResidueFrequency m b i₀ hb] using ht

end

end Loneliness.Hyperplane
