import Conjectures.LonelinessHyperplaneAdmissibility

/-! Admissibility makes every coordinate wall and every equality wall
proper in the relation hyperplane. A fixed finite set of affine wall
levels therefore contains at most a constant times `N^(k-2)` box points.
These bounds control the boundary losses under a fixed lattice translation. -/

namespace Loneliness.Hyperplane

open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

def coordinateFrequency (i : ι) : ι → ℤ := Pi.single i 1

def differenceFrequency (i j : ι) : ι → ℤ := coordinateFrequency i - coordinateFrequency j

theorem pairing_normal_smul (c : ℤ) (m : ι → ℤ) (x : ι → ℝ) :
    pairing (c • m) x = (c : ℝ) * pairing m x := by
  simp only [pairing, Pi.smul_apply, zsmul_eq_mul, Int.cast_id, Int.cast_mul,
    mul_assoc, Finset.mul_sum]

theorem pairing_normal_sub (m b : ι → ℤ) (x : ι → ℝ) :
    pairing (m - b) x = pairing m x - pairing b x := by
  simp [pairing, sub_mul, Finset.sum_sub_distrib]

theorem pairing_coordinateFrequency (i : ι) (x : ι → ℝ) :
    pairing (coordinateFrequency i) x = x i := by
  simp [pairing, coordinateFrequency, Pi.single_apply, ite_mul]

theorem pairing_differenceFrequency (i j : ι) (x : ι → ℝ) :
    pairing (differenceFrequency i j) x = x i - x j := by
  rw [differenceFrequency, pairing_normal_sub,
    pairing_coordinateFrequency, pairing_coordinateFrequency]

theorem integerPairing_coordinateFrequency (i : ι) (x : ι → ℤ) :
    integerPairing (coordinateFrequency i) x = x i := by
  rw [integerPairing_comm, coordinateFrequency, integerPairing_single, mul_one]

theorem integerPairing_differenceFrequency (i j : ι) (x : ι → ℤ) :
    integerPairing (differenceFrequency i j) x = x i - x j := by
  rw [integerPairing_comm]
  simp only [differenceFrequency, coordinateFrequency, integerPairing_sub,
    integerPairing_single, mul_one]

theorem coordinateFrequency_not_multiple
    (m : ι → ℤ) (hreal : RealAdmissible m) (i : ι) :
    ¬ ∃ c : ℤ, coordinateFrequency i = c • m := by
  obtain ⟨x, hx, hpos, _⟩ := hreal
  rintro ⟨c, hc⟩
  have hzero : pairing (coordinateFrequency i) x = 0 := by
    rw [hc, pairing_normal_smul, hx, mul_zero]
  rw [pairing_coordinateFrequency] at hzero
  exact (ne_of_gt (hpos i)) hzero

theorem differenceFrequency_not_multiple
    (m : ι → ℤ) (hreal : RealAdmissible m) (i j : ι) (hij : i ≠ j) :
    ¬ ∃ c : ℤ, differenceFrequency i j = c • m := by
  obtain ⟨x, hx, _, hinj⟩ := hreal
  rintro ⟨c, hc⟩
  have hzero : pairing (differenceFrequency i j) x = 0 := by
    rw [hc, pairing_normal_smul, hx, mul_zero]
  rw [pairing_differenceFrequency] at hzero
  exact hij (hinj (sub_eq_zero.mp hzero))

def positiveBoxAffineRelation (m b : ι → ℤ) (a : ℤ) (N : ℕ) :
    Finset (ι → Fin N) :=
  Finset.univ.filter (fun v =>
    integerPairing m (positiveBoxCoordinates v) = 0 ∧
      integerPairing b (positiveBoxCoordinates v) = a)

theorem positiveBoxAffineRelation_card_le
    (m : ι → ℤ) (hm : PrimitiveNormal m) (b : ι → ℤ)
    (hb : ¬ ∃ c : ℤ, b = c • m) (a : ℤ) (N : ℕ) :
    (positiveBoxAffineRelation m b a N).card ≤ N ^ (Fintype.card ι - 2) := by
  obtain ⟨p, q, hpq, hdet⟩ := exists_nonzero_minor m hm b hb
  unfold positiveBoxAffineRelation positiveBoxCoordinates
  simpa only [Fintype.card_fin] using
    two_relation_fiber_card_le (positiveBoxEntry (N := N))
      (positiveBoxEntry_injective N) m b p q hpq hdet 0 a

def positiveBoxAffineStrip (m b : ι → ℤ) (S : Finset ℤ) (N : ℕ) :
    Finset (ι → Fin N) :=
  Finset.univ.filter (fun v =>
    integerPairing m (positiveBoxCoordinates v) = 0 ∧
      integerPairing b (positiveBoxCoordinates v) ∈ S)

theorem positiveBoxAffineStrip_card_le
    (m : ι → ℤ) (hm : PrimitiveNormal m) (b : ι → ℤ)
    (hb : ¬ ∃ c : ℤ, b = c • m) (S : Finset ℤ) (N : ℕ) :
    (positiveBoxAffineStrip m b S N).card ≤ S.card * N ^ (Fintype.card ι - 2) := by
  classical
  have hset : positiveBoxAffineStrip m b S N =
      S.biUnion (fun a => positiveBoxAffineRelation m b a N) := by
    ext v
    simp only [positiveBoxAffineStrip, positiveBoxAffineRelation,
      Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_biUnion]
    constructor
    · rintro ⟨hkernel, hmem⟩
      exact ⟨integerPairing b (positiveBoxCoordinates v), hmem, hkernel, rfl⟩
    · rintro ⟨a, ha, hkernel, heq⟩
      exact ⟨hkernel, heq.symm ▸ ha⟩
  rw [hset]
  calc
    _ ≤ ∑ a ∈ S, (positiveBoxAffineRelation m b a N).card := Finset.card_biUnion_le
    _ ≤ ∑ _a ∈ S, N ^ (Fintype.card ι - 2) := by
      apply Finset.sum_le_sum
      intro a _
      exact positiveBoxAffineRelation_card_le m hm b hb a N
    _ = _ := by simp

theorem positiveBox_coordinate_strip_card_le
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (i : ι) (S : Finset ℤ) (N : ℕ) :
    (Finset.univ.filter (fun v : ι → Fin N =>
      integerPairing m (positiveBoxCoordinates v) = 0 ∧
        positiveBoxCoordinates v i ∈ S)).card ≤ S.card * N ^ (Fintype.card ι - 2) := by
  simpa only [positiveBoxAffineStrip, integerPairing_coordinateFrequency] using
    positiveBoxAffineStrip_card_le m hm (coordinateFrequency i)
      (coordinateFrequency_not_multiple m hreal i) S N

theorem positiveBox_difference_strip_card_le
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (i j : ι) (hij : i ≠ j) (S : Finset ℤ) (N : ℕ) :
    (Finset.univ.filter (fun v : ι → Fin N =>
      integerPairing m (positiveBoxCoordinates v) = 0 ∧
        positiveBoxCoordinates v i - positiveBoxCoordinates v j ∈ S)).card ≤
          S.card * N ^ (Fintype.card ι - 2) := by
  simpa only [positiveBoxAffineStrip, integerPairing_differenceFrequency] using
    positiveBoxAffineStrip_card_le m hm (differenceFrequency i j)
      (differenceFrequency_not_multiple m hreal i j hij) S N

end

end Loneliness.Hyperplane
