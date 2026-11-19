import Conjectures.LonelinessHyperplaneFundamentalRemainder
import Conjectures.LonelinessHyperplaneSimplicialArithmetic
import Mathlib.Logic.Equiv.Prod

/-! Positive integer height fibers of an actual simplicial lattice cone
are finite sums of shifted weighted partitions. The remainder offsets
are derived from the half-open coefficient bounds. -/

namespace Loneliness.Hyperplane.FundamentalRemainder

open scoped BigOperators
open QuasipolynomialArithmetic

noncomputable section

variable {ι κ : Type*} [Fintype κ]

def height (c x : κ → ℤ) : ℤ := ∑ j, c j * x j

def rationalHeight (c : κ → ℤ) (x : κ → ℚ) : ℚ := ∑ j, (c j : ℚ) * x j

theorem height_add (c x y : κ → ℤ) : height c (x + y) = height c x + height c y := by
  simp only [height, Pi.add_apply, mul_add, Finset.sum_add_distrib]

theorem rationalHeight_castVector (c x : κ → ℤ) :
    rationalHeight c (castVector x) = (height c x : ℚ) := by
  simp [rationalHeight, castVector, height]

variable [Fintype ι]

instance remainder_fintype (g : ι → κ → ℤ) : Fintype (Remainder g) := Fintype.ofFinite _

theorem height_natCombination (g : ι → κ → ℤ) (c : κ → ℤ) (n : ι → ℕ) :
    height c (natCombination g n) = ∑ i, (n i : ℤ) * height c (g i) := by
  simp only [height, natCombination, Finset.mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  ring

theorem rationalHeight_combination (g : ι → κ → ℤ) (c : κ → ℤ) (a : ι → ℚ) :
    rationalHeight c (rationalCombination g a) = ∑ i, a i * (height c (g i) : ℚ) := by
  simp only [rationalHeight, rationalCombination, Finset.sum_apply,
    Pi.smul_apply, smul_eq_mul, castVector, height, Int.cast_sum,
    Int.cast_mul, Finset.mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  ring

theorem remainder_height_nonneg (g : ι → κ → ℤ) (c : κ → ℤ)
    (hc : ∀ i, 0 < height c (g i)) (r : Remainder g) : 0 ≤ height c r.1 := by
  obtain ⟨a, ha, he⟩ := r.2
  have h := congrArg (rationalHeight c) he
  rw [rationalHeight_combination, rationalHeight_castVector] at h
  have hn : (0 : ℚ) ≤ (height c r.1 : ℚ) := by
    rw [← h]
    exact Finset.sum_nonneg (fun i _ => mul_nonneg (ha i).1 (by exact_mod_cast (hc i).le))
  exact_mod_cast hn

theorem remainder_height_lt [Nonempty ι] (g : ι → κ → ℤ) (c : κ → ℤ)
    (hc : ∀ i, 0 < height c (g i)) (r : Remainder g) :
    height c r.1 < ∑ i, height c (g i) := by
  obtain ⟨a, ha, he⟩ := r.2
  have h := congrArg (rationalHeight c) he
  rw [rationalHeight_combination, rationalHeight_castVector] at h
  have hb : (height c r.1 : ℚ) < ∑ i, (height c (g i) : ℚ) := by
    rw [← h]
    apply Finset.sum_lt_sum_of_nonempty Finset.univ_nonempty
    intro i _
    have hi : (0 : ℚ) < (height c (g i) : ℚ) := by exact_mod_cast hc i
    simpa only [one_mul] using mul_lt_mul_of_pos_right (ha i).2 hi
  exact_mod_cast hb

def generatorWeights (g : ι → κ → ℤ) (c : κ → ℤ) : ι → ℕ :=
  fun i => (height c (g i)).toNat

def remainderOffset (c : κ → ℤ) {g : ι → κ → ℤ} (r : Remainder g) : ℕ :=
  (height c r.1).toNat

omit [Fintype ι] in
theorem generatorWeights_cast (g : ι → κ → ℤ) (c : κ → ℤ)
    (hc : ∀ i, 0 < height c (g i)) (i : ι) :
    (generatorWeights g c i : ℤ) = height c (g i) :=
  Int.toNat_of_nonneg (hc i).le

omit [Fintype ι] in
theorem generatorWeights_pos (g : ι → κ → ℤ) (c : κ → ℤ)
    (hc : ∀ i, 0 < height c (g i)) (i : ι) : 0 < generatorWeights g c i := by
  have h := generatorWeights_cast g c hc i
  have hp := hc i
  omega

theorem remainderOffset_cast (g : ι → κ → ℤ) (c : κ → ℤ)
    (hc : ∀ i, 0 < height c (g i)) (r : Remainder g) :
    (remainderOffset c r : ℤ) = height c r.1 :=
  Int.toNat_of_nonneg (remainder_height_nonneg g c hc r)

theorem remainderOffset_lt [Nonempty ι] (g : ι → κ → ℤ) (c : κ → ℤ)
    (hc : ∀ i, 0 < height c (g i)) (r : Remainder g) :
    remainderOffset c r < ∑ i, generatorWeights g c i := by
  have h := remainder_height_lt g c hc r
  have hh : (remainderOffset c r : ℤ) < ∑ i, (generatorWeights g c i : ℤ) := by
    simpa only [remainderOffset_cast g c hc, generatorWeights_cast g c hc] using h
  exact_mod_cast hh

def HeightFiber (g : ι → κ → ℤ) (c : κ → ℤ) (N : ℕ) :=
  {x : ConePoint g // height c x.1 = (N : ℤ)}

theorem recompose_height_iff (g : ι → κ → ℤ) (c : κ → ℤ)
    (hc : ∀ i, 0 < height c (g i)) (r : Remainder g) (n : ι → ℕ) (N : ℕ) :
    height c (recompose g (r,n)).1 = (N : ℤ) ↔
      (∑ i, generatorWeights g c i * n i) + remainderOffset c r = N := by
  change height c (r.1 + natCombination g n) = (N : ℤ) ↔ _
  rw [height_add, height_natCombination]
  have he : ((∑ i, generatorWeights g c i * n i) + remainderOffset c r : ℤ) =
      height c r.1 + ∑ i, (n i : ℤ) * height c (g i) := by
    simp only [Nat.cast_sum, Nat.cast_mul,
      generatorWeights_cast g c hc, remainderOffset_cast g c hc]
    rw [add_comm]
    congr 1
    apply Finset.sum_congr rfl
    intro i _
    ring
  rw [← he]
  exact_mod_cast Iff.rfl

/-- This equivalence is between actual integer height fibers and the
shifted weighted-partition types, with all remainder offsets derived. -/
def heightFiberEquiv (g : ι → κ → ℤ)
    (hg : LinearIndependent ℚ (fun i => castVector (g i)))
    (c : κ → ℤ) (hc : ∀ i, 0 < height c (g i)) (N : ℕ) :
    HeightFiber g c N ≃
      Σ r : Remainder g, shiftedWeightedPartition (generatorWeights g c) (remainderOffset c r) N := by
  let e : (Remainder g × (ι → ℕ)) ≃ ConePoint g := (conePointEquiv g hg).symm
  let e₁ : {p : Remainder g × (ι → ℕ) //
      (∑ i, generatorWeights g c i * p.2 i) + remainderOffset c p.1 = N} ≃
      HeightFiber g c N := e.subtypeEquiv (fun p => (recompose_height_iff g c hc p.1 p.2 N).symm)
  exact e₁.symm.trans (Equiv.subtypeProdEquivSigmaSubtype
    (fun (r : Remainder g) (n : ι → ℕ) =>
      (∑ i, generatorWeights g c i * n i) + remainderOffset c r = N))

theorem positive_shiftedPartition_finite [Nonempty ι]
    (a : ι → ℕ) (ha : ∀ i, 0 < a i) (offset N : ℕ) :
    Finite (shiftedWeightedPartition a offset N) := by
  classical
  let M := ∏ i, a i
  have hM : 0 < M := Finset.prod_pos (fun i _ => ha i)
  have hdiv : ∀ i, a i ∣ M := fun i => Finset.dvd_prod_of_mem a (Finset.mem_univ i)
  let (r : remainderVectors a M) :
      Finite (shiftedWeakComposition (ι := ι) M (remainderWeight a M r + offset) N) :=
    shiftedWeakComposition_finite M (remainderWeight a M r + offset) N hM
  exact Finite.of_equiv _ (shiftedWeightedPartitionEquiv a ha M hM hdiv offset N).symm

theorem heightFiber_card_eq_sum [Nonempty ι] (g : ι → κ → ℤ)
    (hg : LinearIndependent ℚ (fun i => castVector (g i)))
    (c : κ → ℤ) (hc : ∀ i, 0 < height c (g i)) (N : ℕ) :
    Nat.card (HeightFiber g c N) =
      ∑ r : Remainder g, Nat.card
        (shiftedWeightedPartition (generatorWeights g c) (remainderOffset c r) N) := by
  classical
  let (r : Remainder g) : Finite
      (shiftedWeightedPartition (generatorWeights g c) (remainderOffset c r) N) :=
    positive_shiftedPartition_finite _ (generatorWeights_pos g c hc) _ _
  exact (Nat.card_congr (heightFiberEquiv g hg c hc N)).trans Nat.card_sigma

theorem heightFiber_isQuasipolynomial [Nonempty ι] (g : ι → κ → ℤ)
    (hg : LinearIndependent ℚ (fun i => castVector (g i)))
    (c : κ → ℤ) (hc : ∀ i, 0 < height c (g i)) :
    IsQuasipolynomial (fun N => (Nat.card (HeightFiber g c N) : ℚ))
      (Fintype.card ι - 1) := by
  classical
  have hr (r : Remainder g) := shiftedWeightedPartition_isQuasipolynomial_of_small_offset
    (generatorWeights g c) (generatorWeights_pos g c hc)
      (remainderOffset c r) (remainderOffset_lt g c hc r)
  have hs := IsQuasipolynomial.finite_linear_combination
    (fun (r : Remainder g) N =>
      (Nat.card (shiftedWeightedPartition (generatorWeights g c) (remainderOffset c r) N) : ℚ))
    (fun _ => 1) (Fintype.card ι - 1) hr
  apply hs.congr
  intro N
  simp only [one_mul, heightFiber_card_eq_sum g hg c hc N, Nat.cast_sum]

omit [Fintype κ] in
theorem conePoint_zero_of_isEmpty [IsEmpty ι] (g : ι → κ → ℤ) (x : ConePoint g) :
    x.1 = 0 := by
  obtain ⟨a, _, ha⟩ := x.2
  funext j
  have hj : (x.1 j : ℚ) = 0 := by
    simpa [rationalCombination, castVector] using (congrFun ha j).symm
  exact_mod_cast hj

/-- The empty support is a genuine boundary case, rather than a
quasipolynomial on all nonnegative heights. -/
theorem heightFiber_card_of_isEmpty [IsEmpty ι] (g : ι → κ → ℤ) (c : κ → ℤ) (N : ℕ) :
    Nat.card (HeightFiber g c N) = if N = 0 then 1 else 0 := by
  classical
  by_cases hN : N = 0
  · subst N
    rw [ite_eq_left rfl]
    let z : HeightFiber g c 0 := ⟨⟨0, 0, by simp,
      by
        ext j
        simp [rationalCombination, castVector]⟩, by simp [height]⟩
    apply Nat.card_eq_one_iff_exists.mpr
    refine ⟨z, ?_⟩
    intro x
    apply Subtype.ext
    apply Subtype.ext
    exact conePoint_zero_of_isEmpty g x.1
  · rw [ite_eq_right hN]
    let : IsEmpty (HeightFiber g c N) := ⟨by
      rintro ⟨x, hx⟩
      rw [conePoint_zero_of_isEmpty g x] at hx
      simp only [height, Pi.zero_apply, mul_zero, Finset.sum_const_zero] at hx
      exact hN (by omega)⟩
    exact Nat.card_of_isEmpty

theorem heightFiber_card_eq_zero_of_isEmpty [IsEmpty ι]
    (g : ι → κ → ℤ) (c : κ → ℤ) (N : ℕ) (hN : 0 < N) :
    Nat.card (HeightFiber g c N) = 0 := by
  rw [heightFiber_card_of_isEmpty, ite_eq_right (Nat.ne_of_gt hN)]

end

end Loneliness.Hyperplane.FundamentalRemainder
