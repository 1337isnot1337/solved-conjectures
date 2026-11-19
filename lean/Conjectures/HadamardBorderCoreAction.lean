import Conjectures.HadamardBorderCore
import Conjectures.HadamardBorderCompression

/-!
# The actual core acting on inflated balanced columns

Quotient compression evaluates each block action on a lifted column. Constant
compressions annihilate balanced columns. A compression with one jump of two
contributes twice the reflected column. Applying these identities to the
literal core table produces the fixed border's coefficient array.
-/

namespace HadamardBorderConstruction

open Matrix
open scoped BigOperators
open HadamardBorderNormalizationTransport
open HadamardFixedBorder

variable {G Q : Type*}
variable [Fintype G] [AddCommGroup G]
variable [Fintype Q] [AddCommGroup Q] [DecidableEq Q]

/-- The quotient map applied within each of the four row blocks. -/
def blockProjection (π : G →+ Q) : BlockIndex G → BlockIndex Q :=
  fun p => (p.1, π p.2)

/-- Inflate the rows of an actual matrix along a specified map. -/
def inflateRows {X Y I : Type*} (p : X → Y) (M : Matrix Y I ℤ) : Matrix X I ℤ :=
  fun x k => M (p x) k

theorem sum_mul_zero_of_constant_compress (π : G →+ Q) (f : G → ℤ)
    (d : ℤ) (hcompress : ∀ q, compress π f q = d)
    (w : Q → ℤ) (hbalanced : ∑ q, w q = 0) :
    (∑ x, f x * w (π x)) = 0 := by
  rw [sum_mul_eq_sum_compress]
  simp_rw [hcompress]
  rw [← Finset.mul_sum, hbalanced, mul_zero]

theorem sum_mul_two_of_normalized_compress (π : G →+ Q) (f : G → ℤ)
    (a : ℤ) (hcompress : ∀ q, compress π f q = a + if q = 0 then 2 else 0)
    (w : Q → ℤ) (hbalanced : ∑ q, w q = 0) :
    (∑ x, f x * w (π x)) = 2 * w 0 := by
  rw [sum_mul_eq_sum_compress]
  simp_rw [hcompress, add_mul]
  rw [Finset.sum_add_distrib, ← Finset.mul_sum, hbalanced, mul_zero, zero_add]
  simp [ite_mul]

theorem convolution_action_of_constant_compress (π : G →+ Q) (f : G → ℤ)
    (d : ℤ) (hcompress : ∀ q, compress π f q = d)
    (w : Q → ℤ) (hbalanced : ∑ q, w q = 0) (x : G) :
    (∑ y, convolution f x y * w (π y)) = 0 := by
  have hbalance' : (∑ q, w (π x - q)) = 0 := by
    calc
      _ = ∑ q, w q := Equiv.sum_comp (reflectionTranslation (π x)) w
      _ = 0 := hbalanced
  calc
    (∑ y, convolution f x y * w (π y)) =
        ∑ z, f z * w (π x - π z) := by
      apply Fintype.sum_equiv (reflectionTranslation x)
      intro y
      change f (x - y) * w (π y) =
        f (x - y) * w (π x - π (x - y))
      have h : π x - π (x - y) = π y := by rw [map_sub]; abel
      rw [h]
    _ = 0 :=
      sum_mul_zero_of_constant_compress π f d hcompress
        (fun q => w (π x - q)) hbalance'

theorem positiveHankel_action_of_normalized_compress (π : G →+ Q) (f : G → ℤ)
    (a : ℤ) (hcompress : ∀ q, compress π f q = a + if q = 0 then 2 else 0)
    (w : Q → ℤ) (hbalanced : ∑ q, w q = 0) (x : G) :
    (∑ y, positiveHankel f x y * w (π y)) = 2 * w (-π x) := by
  have hbalance' : (∑ q, w (q - π x)) = 0 := by
    calc
      _ = ∑ q, w q := by
        simpa only [Equiv.coe_addRight, sub_eq_add_neg] using
          Equiv.sum_comp (Equiv.addRight (-π x)) w
      _ = 0 := hbalanced
  calc
    (∑ y, positiveHankel f x y * w (π y)) =
        ∑ z, f z * w (π z - π x) := by
      apply Fintype.sum_equiv (Equiv.addRight x)
      intro y
      change f (x + y) * w (π y) =
        f (y + x) * w (π (y + x) - π x)
      have h : π (y + x) - π x = π y := by rw [map_add]; abel
      rw [h, add_comm x y]
    _ = 2 * w (-π x) := by
      simpa only [zero_sub] using
        sum_mul_two_of_normalized_compress π f a hcompress
          (fun q => w (q - π x)) hbalance'

theorem negativeHankel_action_of_normalized_compress (π : G →+ Q) (f : G → ℤ)
    (a : ℤ) (hcompress : ∀ q, compress π f q = a + if q = 0 then 2 else 0)
    (w : Q → ℤ) (hbalanced : ∑ q, w q = 0) (x : G) :
    (∑ y, negativeHankel f x y * w (π y)) = 2 * w (-π x) := by
  have hbalance' : (∑ q, w (-π x - q)) = 0 := by
    calc
      _ = ∑ q, w q := Equiv.sum_comp (reflectionTranslation (-π x)) w
      _ = 0 := hbalanced
  calc
    (∑ y, negativeHankel f x y * w (π y)) =
        ∑ z, f z * w (-π x - π z) := by
      apply Fintype.sum_equiv (reflectionTranslation (-x))
      intro y
      change f (-x - y) * w (π y) =
        f (-x - y) * w (-π x - π (-x - y))
      have h : -π x - π (-x - y) = π y := by
        rw [map_sub, map_neg]
        abel
      rw [h]
    _ = 2 * w (-π x) := by
      simpa only [sub_zero] using
        sum_mul_two_of_normalized_compress π f a hcompress
          (fun q => w (-π x - q)) hbalance'

/-- Each actual block has exactly its prescribed reflected coefficient. -/
theorem coreBlocks_action_of_normalized (π : G →+ Q) (f : Rows G)
    (d : ℤ) (a : Fin 3 → ℤ)
    (hzero : ∀ q, compress π (f 0) q = d)
    (hother : ∀ r : Fin 3, ∀ q,
      compress π (f r.succ) q = a r + if q = 0 then 2 else 0)
    (i j : Fin 4) (w : Q → ℤ) (hbalanced : ∑ q, w q = 0) (x : G) :
    (∑ y, coreBlocks f i j x y * w (π y)) = gamma i j * w (-π x) := by
  have hA := convolution_action_of_constant_compress π (f 0) d hzero w hbalanced x
  have hB₁ := positiveHankel_action_of_normalized_compress π (f 1) (a 0)
    (hother 0) w hbalanced x
  have hB₂ := positiveHankel_action_of_normalized_compress π (f 2) (a 1)
    (hother 1) w hbalanced x
  have hB₃ := positiveHankel_action_of_normalized_compress π (f 3) (a 2)
    (hother 2) w hbalanced x
  have hC₁ := negativeHankel_action_of_normalized_compress π (f 1) (a 0)
    (hother 0) w hbalanced x
  have hC₂ := negativeHankel_action_of_normalized_compress π (f 2) (a 1)
    (hother 1) w hbalanced x
  have hC₃ := negativeHankel_action_of_normalized_compress π (f 3) (a 2)
    (hother 2) w hbalanced x
  fin_cases i <;> fin_cases j <;>
    simp [coreBlocks, gamma, neg_mul, Finset.sum_neg_distrib,
      hA, hB₁, hB₂, hB₃, hC₁, hC₂, hC₃]

theorem gammaReflection_mul_apply {I : Type*}
    (Γ : Matrix (Fin 4) (Fin 4) ℤ) (M : Matrix (BlockIndex Q) I ℤ)
    (i : Fin 4) (q : Q) (k : I) :
    (gammaReflection (Q := Q) Γ * M) (i, q) k =
      ∑ j, Γ i j * M (j, -q) k := by
  have htest (r : Q) : q = -r ↔ r = -q := by
    constructor
    · intro h
      have hh := congrArg Neg.neg h
      simpa only [neg_neg] using hh.symm
    · intro h
      rw [h, neg_neg]
  simp only [Matrix.mul_apply, gammaReflection, Fintype.sum_prod_type]
  apply Finset.sum_congr rfl
  intro j hj
  simp [htest, mul_ite, ite_mul]

/-- Actual multiplication by the core equals the reflected quotient action. -/
theorem core_mul_inflateRows_of_normalized {I : Type*}
    (π : G →+ Q) (f : Rows G) (M : Matrix (BlockIndex Q) I ℤ)
    (d : ℤ) (a : Fin 3 → ℤ)
    (hzero : ∀ q, compress π (f 0) q = d)
    (hother : ∀ r : Fin 3, ∀ q,
      compress π (f r.succ) q = a r + if q = 0 then 2 else 0)
    (hbalanced : ∀ j k, ∑ q, M (j, q) k = 0) :
    core f * inflateRows (blockProjection π) M =
      inflateRows (blockProjection π) (gammaReflection gamma * M) := by
  ext ⟨i, x⟩ k
  change (∑ p : BlockIndex G, coreBlocks f i p.1 x p.2 * M (p.1, π p.2) k) =
    (gammaReflection (Q := Q) gamma * M) (i, π x) k
  rw [Fintype.sum_prod_type, gammaReflection_mul_apply]
  apply Finset.sum_congr rfl
  intro j hj
  exact coreBlocks_action_of_normalized π f d a hzero hother
    i j (fun q => M (j, q) k) (hbalanced j k) x

omit [DecidableEq Q] in
/-- Matrix balance gives the separate sum-zero identities for every column. -/
theorem column_balance_of_blockOnes_mul_zero {I : Type*}
    (M : Matrix (BlockIndex Q) I ℤ) (hbalanced : blockOnes Q * M = 0) :
    ∀ j k, ∑ q, M (j, q) k = 0 := by
  intro j k
  have hentry := congrArg (fun A : Matrix (BlockIndex Q) I ℤ => A (j, 0) k) hbalanced
  change (∑ p : BlockIndex Q, (if j = p.1 then (1 : ℤ) else 0) * M p k) = 0 at hentry
  rw [Fintype.sum_prod_type, Finset.sum_comm] at hentry
  simpa only [ite_mul, one_mul, zero_mul, Fintype.sum_ite_eq] using hentry

/-- The fixed-border interface, with the actual transpose of its right border. -/
theorem core_mul_inflate_transpose_of_normalized {I : Type*}
    (π : G →+ Q) (f : Rows G) (E : Matrix I (BlockIndex Q) ℤ)
    (d : ℤ) (a : Fin 3 → ℤ)
    (hzero : ∀ q, compress π (f 0) q = d)
    (hother : ∀ r : Fin 3, ∀ q,
      compress π (f r.succ) q = a r + if q = 0 then 2 else 0)
    (hbalanced : blockOnes Q * Eᵀ = 0) :
    core f * inflateRows (blockProjection π) Eᵀ =
      inflateRows (blockProjection π) (gammaReflection gamma * Eᵀ) :=
  core_mul_inflateRows_of_normalized π f Eᵀ d a hzero hother
    (column_balance_of_blockOnes_mul_zero Eᵀ hbalanced)

omit [Fintype Q] in
/-- Sign rows supply the diagonal correlation; only nonzero correlations are inputs. -/
theorem core_gram_of_two_level [DecidableEq G]
    (π : G →+ Q) (f : Rows G) (hf : ∀ i, SignValued (f i))
    (hcorrelation : ∀ u, u ≠ 0 →
      combinedCorrelation f u = if π u = 0 then -12 else 4) :
    core f * (core f)ᵀ =
      (4 * (Fintype.card G : ℤ) + 12) •
        (1 : Matrix (BlockIndex G) (BlockIndex G) ℤ) +
      (4 : ℤ) • blockOnesG G - (16 : ℤ) • kernelBlocks π := by
  apply core_gram_of_correlation_formula π f
  intro u
  by_cases hu : u = 0
  · subst u
    simpa using combinedCorrelation_zero f hf
  · simpa only [ite_eq_right hu] using hcorrelation u hu

end HadamardBorderConstruction
