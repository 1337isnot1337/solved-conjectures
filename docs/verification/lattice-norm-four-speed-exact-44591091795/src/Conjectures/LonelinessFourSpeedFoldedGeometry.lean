import Conjectures.LonelinessFourSpeedGeometry
import Conjectures.LonelinessModularNormalize

/-! A short folded multiple recovers a primitive four-speed direction below
two ninths. The modular representative may have been multiplied by a unit
and folded independently in each coordinate. The proof centers the original
integer congruence, applies the four-coordinate plane gap, and then uses
primitive normalization. -/

namespace Loneliness.FourSpeedFoldedGeometry

open Modular FourSpeedGeometry

/-- The integer representative nearest zero, choosing the nonnegative
representative in the half-modulus tie. -/
def centered (m r : ℕ) : ℤ :=
  if r % m ≤ m - r % m then ((r % m : ℕ) : ℤ) else -((m - r % m : ℕ) : ℤ)

theorem centered_natAbs (m r : ℕ) : (centered m r).natAbs = folded m r := by
  unfold centered folded
  split_ifs with h
  · simp only [Int.natAbs_natCast, Nat.min_eq_left h]
  · simp only [Int.natAbs_neg, Int.natAbs_natCast, Nat.min_eq_right (by omega : m-r%m ≤ r%m)]

theorem centered_congr (m r : ℕ) (hm : 0 < m) :
    (m : ℤ) ∣ centered m r - (r : ℤ) := by
  have hres : (m : ℤ) ∣ ((r % m : ℕ) : ℤ) - (r : ℤ) :=
    Int.dvd_sub_self_of_emod_eq rfl
  unfold centered
  split_ifs with h
  · exact hres
  · have hle : r % m ≤ m := (Nat.mod_lt r hm).le
    rw [Nat.cast_sub hle]
    convert dvd_sub hres (dvd_refl (m : ℤ)) using 1
    ring

/-- Literal ordered recovery. This also establishes that no coordinate of a
short terminal representative can vanish. -/
theorem recover_folded_primitive_vector
    (v : Fin 4 → ℕ) (hv : ∀ i, 0 < v i)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (m a b : ℕ) (hm : 0 < m) (hunit : (a*b)%m = 1%m)
    (x : Fin 4 → ℕ) (hrep : ∀ i, folded m (a*v i) = x i)
    (t : ℕ) (ht : 0 < t) (htm : t < m)
    (hsmall : ∀ i, 18 * folded m (t*x i) ≤ m)
    (hbelow : value (List.ofFn v) < (2/9 : ℝ)) :
    Normalization.normalize (List.ofFn (fun i => folded m (t*x i))) =
      List.ofFn v := by
  let A := (t*a)%m
  have hApos : 0 < A := by
    have h := folded_unit_pos hm hunit ht htm
    unfold folded at h
    dsimp [A]
    rw [Nat.mul_comm a t] at h
    omega
  have hAm : A < m := Nat.mod_lt _ hm
  let w : Fin 4 → ℤ := fun i => centered m (A*v i)
  have hwabs (i : Fin 4) : (w i).natAbs = folded m (t*x i) := by
    change (centered m (A*v i)).natAbs = _
    rw [centered_natAbs]
    calc
      folded m (A*v i) = folded m ((t*a)*v i) := by
        apply folded_eq_of_mod_eq
        simp only [A, Nat.mul_mod, Nat.mod_mod]
      _ = folded m (t*(a*v i)) := by rw [Nat.mul_assoc]
      _ = folded m (t*x i) := by
        rw [← hrep i, folded_mul_folded m (a*v i) t hm]
  have hcong (i : Fin 4) : (m : ℤ) ∣ w i - (A : ℤ)*(v i : ℤ) := by
    simpa only [Nat.cast_mul] using centered_congr m (A*v i) hm
  have hbound (i : Fin 4) : 18 * |w i| ≤ (m : ℤ) := by
    have hnat : 18 * (w i).natAbs ≤ m := by rw [hwabs]; exact hsmall i
    rw [← Int.natCast_natAbs]
    exact_mod_cast hnat
  have hrecover := (recover_short_vector_of_primitive_congruence v hv hprimitive
    w (A : ℤ) (m : ℤ) (by exact_mod_cast hApos) (by exact_mod_cast hAm)
    hcong hbound hbelow).2
  have habs : absoluteSpeeds w = List.ofFn (fun i => folded m (t*x i)) := by
    simp only [absoluteSpeeds, hwabs]
  rwa [habs] at hrecover

theorem recover_folded_primitive_sorted
    (v : Fin 4 → ℕ) (hv : ∀ i, 0 < v i)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (m a b : ℕ) (hm : 0 < m) (hunit : (a*b)%m = 1%m)
    (x : Fin 4 → ℕ) (hrep : ∀ i, folded m (a*v i) = x i)
    (t : ℕ) (ht : 0 < t) (htm : t < m)
    (hsmall : ∀ i, 18 * folded m (t*x i) ≤ m)
    (hbelow : value (List.ofFn v) < (2/9 : ℝ)) :
    (Normalization.normalize (List.ofFn (fun i => folded m (t*x i)))).mergeSort (· ≤ ·) =
      (List.ofFn v).mergeSort (· ≤ ·) := by
  rw [recover_folded_primitive_vector v hv hprimitive m a b hm hunit
    x hrep t ht htm hsmall hbelow]

/-- Terminal soundness in the existential unit-representative form used by
the folded projective search. Both sides use the same normalization and sort. -/
theorem folded_terminal_sound
    (v : Fin 4 → ℕ) (hv : ∀ i, 0 < v i)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (m : ℕ) (hm : 0 < m) (x : Fin 4 → ℕ)
    (hrep : ∃ a b : ℕ, (a*b)%m = 1%m ∧ ∀ i, folded m (a*v i) = x i)
    (t : ℕ) (ht : 0 < t) (htm : t < m)
    (hsmall : ∀ i, 18 * folded m (t*x i) ≤ m)
    (hbelow : value (List.ofFn v) < (2/9 : ℝ)) :
    (Normalization.normalize (List.ofFn (fun i => folded m (t*x i)))).mergeSort (· ≤ ·) =
      (Normalization.normalize (List.ofFn v)).mergeSort (· ≤ ·) := by
  obtain ⟨a,b,hunit,hrep⟩ := hrep
  rw [recover_folded_primitive_vector v hv hprimitive m a b hm hunit
    x hrep t ht htm hsmall hbelow]
  simp only [Normalization.normalize, hprimitive, Nat.div_one, List.map_id']

end Loneliness.FourSpeedFoldedGeometry
