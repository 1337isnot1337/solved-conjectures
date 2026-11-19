import Conjectures.LonelinessNearestPlane

/-!
# Reverse rounding while preserving a real prefix

The vectors in an initial prefix are left free over the reals. Later vectors
are rounded to integer coefficients, and only their Gram–Schmidt lengths enter
the error bound. With one free vector, the remainder lies on the original
speed line.
-/

namespace Loneliness.NearestPlane

open scoped BigOperators

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

theorem prefixSpan_mono (b : ℕ → E) {s r : ℕ} (h : s ≤ r) :
    prefixSpan b s ≤ prefixSpan b r := by
  apply Submodule.span_mono
  rintro x ⟨i, hi, rfl⟩
  exact ⟨i, lt_of_lt_of_le hi h, rfl⟩

def tailIntegerCombination (b : ℕ → E) (s r : ℕ) (z : ℕ → ℤ) : E :=
  ∑ i ∈ Finset.range r, (z i : ℝ) • b (s + i)

theorem tailIntegerCombination_mem (b : ℕ → E) (s r : ℕ) (z : ℕ → ℤ) :
    tailIntegerCombination b s r z ∈ prefixSpan b (s + r) := by
  apply Submodule.sum_mem
  intro i hi
  apply Submodule.smul_mem
  exact Submodule.subset_span
    ⟨s + i, Nat.add_lt_add_left (Finset.mem_range.mp hi) s, rfl⟩

theorem round_error_norm_sq (a : ℝ) (g : E) :
    ‖(a - (round a : ℝ)) • g‖ ^ 2 ≤ (1 / 4 : ℝ) * ‖g‖ ^ 2 := by
  have h := abs_sub_round a
  have hs : |a - (round a : ℝ)| ^ 2 ≤ (1 / 4 : ℝ) := by
    have hm : |a - (round a : ℝ)| * |a - (round a : ℝ)| ≤
        (1 / 2 : ℝ) * (1 / 2) :=
      mul_le_mul h h (abs_nonneg _) (by norm_num)
    nlinarith only [hm]
  calc
    ‖(a - (round a : ℝ)) • g‖ ^ 2 =
        |a - (round a : ℝ)| ^ 2 * ‖g‖ ^ 2 := by
      rw [norm_smul, Real.norm_eq_abs, mul_pow]
    _ ≤ (1 / 4 : ℝ) * ‖g‖ ^ 2 :=
      mul_le_mul_of_nonneg_right hs (sq_nonneg _)

/-- The first `s` vectors remain free over the reals. The next `r` vectors have
integer coefficients, with squared error bounded by their GS lengths alone. -/
theorem exists_integer_rounding_mod_prefix (b : ℕ → E) (s r : ℕ) {x : E}
    (hx : x ∈ prefixSpan b (s + r)) :
    ∃ y ∈ prefixSpan b s, ∃ z : ℕ → ℤ,
      ‖x - y - tailIntegerCombination b s r z‖ ^ 2 ≤
        (1 / 4 : ℝ) * ∑ i ∈ Finset.range r,
          ‖InnerProductSpace.gramSchmidt ℝ b (s + i)‖ ^ 2 := by
  classical
  induction r generalizing x with
  | zero =>
      refine ⟨x, by simpa using hx, fun _ => 0, ?_⟩
      simp [tailIntegerCombination]
  | succ r ih =>
      have hIio : Set.Iio (s + (r + 1)) = insert (s + r) (Set.Iio (s + r)) := by
        ext i
        simp only [Set.mem_Iio, Set.mem_insert_iff]
        omega
      have hx' : x ∈ Submodule.span ℝ (insert (b (s + r)) (b '' Set.Iio (s + r))) := by
        simpa only [prefixSpan, hIio, Set.image_insert_eq] using hx
      obtain ⟨a, w, hw, hxw⟩ := Submodule.mem_span_insert.mp hx'
      let g := InnerProductSpace.gramSchmidt ℝ b (s + r)
      let p := b (s + r) - g
      let θ := a - (round a : ℝ)
      let u := w + θ • p
      have hp : p ∈ prefixSpan b (s + r) := gramSchmidt_remainder_mem b (s + r)
      have hu : u ∈ prefixSpan b (s + r) :=
        (prefixSpan b (s + r)).add_mem hw ((prefixSpan b (s + r)).smul_mem θ hp)
      obtain ⟨y, hy, z, hz⟩ := ih hu
      let z' := Function.update z r (round a)
      have hcomb : tailIntegerCombination b s (r + 1) z' =
          tailIntegerCombination b s r z + (round a : ℝ) • b (s + r) := by
        unfold tailIntegerCombination
        rw [Finset.sum_range_succ]
        have hlast : z' r = round a := Function.update_self r (round a) z
        rw [hlast]
        congr 1
        apply Finset.sum_congr rfl
        intro i hi
        have hir : i ≠ r := (Finset.mem_range.mp hi).ne
        rw [show z' i = z i from Function.update_of_ne hir (round a) z]
      have hy' : y ∈ prefixSpan b (s + r) :=
        prefixSpan_mono b (by omega) hy
      have he : u - y - tailIntegerCombination b s r z ∈ prefixSpan b (s + r) :=
        (prefixSpan b (s + r)).sub_mem ((prefixSpan b (s + r)).sub_mem hu hy')
          (tailIntegerCombination_mem b s r z)
      have horth : inner ℝ (u - y - tailIntegerCombination b s r z) (θ • g) = 0 := by
        have horth' : inner ℝ (u - y - tailIntegerCombination b s r z) g = 0 :=
          (inner_eq_zero_symm (𝕜 := ℝ)).mp (inner_gramSchmidt_prefix b (s + r) he)
        simp only [inner_smul_right, horth', mul_zero]
      have hresidual : x - y - tailIntegerCombination b s (r + 1) z' =
          (u - y - tailIntegerCombination b s r z) + θ • g := by
        rw [hxw, hcomb]
        dsimp only [u, p, θ]
        module
      have hlast : ‖θ • g‖ ^ 2 ≤ (1 / 4 : ℝ) * ‖g‖ ^ 2 :=
        round_error_norm_sq a g
      refine ⟨y, hy, z', ?_⟩
      calc
        ‖x - y - tailIntegerCombination b s (r + 1) z'‖ ^ 2 =
            ‖u - y - tailIntegerCombination b s r z‖ ^ 2 + ‖θ • g‖ ^ 2 := by
          rw [hresidual, norm_add_sq_real, horth]
          ring
        _ ≤ (1 / 4 : ℝ) * (∑ i ∈ Finset.range r,
              ‖InnerProductSpace.gramSchmidt ℝ b (s + i)‖ ^ 2) +
            (1 / 4 : ℝ) * ‖g‖ ^ 2 := add_le_add hz hlast
        _ = (1 / 4 : ℝ) * ∑ i ∈ Finset.range (r + 1),
              ‖InnerProductSpace.gramSchmidt ℝ b (s + i)‖ ^ 2 := by
          rw [Finset.sum_range_succ]
          dsimp only [g]
          ring

/-- Rounding toward the line of the first vector, modulo integer combinations
of the remaining vectors. The first GS length contributes no error. -/
theorem exists_rounding_along_first_vector (b : ℕ → E) (r : ℕ) {x : E}
    (hx : x ∈ prefixSpan b (r + 1)) :
    ∃ a : ℝ, ∃ z : ℕ → ℤ,
      ‖x - a • b 0 - ∑ i ∈ Finset.range r, (z i : ℝ) • b (i + 1)‖ ^ 2 ≤
        (1 / 4 : ℝ) * ∑ i ∈ Finset.range r,
          ‖InnerProductSpace.gramSchmidt ℝ b (i + 1)‖ ^ 2 := by
  obtain ⟨y, hy, z, hz⟩ := exists_integer_rounding_mod_prefix b 1 r
    (by simpa [Nat.add_comm] using hx)
  have hy' : y ∈ Submodule.span ℝ {b 0} := by
    apply (Submodule.span_mono (s := b '' Set.Iio 1) (t := {b 0}) ?_) hy
    rintro w ⟨i, hi, rfl⟩
    have hi0 : i = 0 := by change i < 1 at hi; omega
    simp [hi0]
  obtain ⟨a, ha⟩ := Submodule.mem_span_singleton.mp hy'
  refine ⟨a, z, ?_⟩
  rw [ha]
  simpa [tailIntegerCombination, Nat.add_comm] using hz

end

end Loneliness.NearestPlane
