import Conjectures.BraunBrueggeMinimumPolar
import Mathlib.Analysis.Normed.Module.FiniteDimension

/-! A connected graph gives a compact normalized polar with finitely many
vertices. The bounds come from walk lengths and the integer labels. -/

open Finset Set

namespace BraunBruegge

variable {V : Type*} {G : SimpleGraph V} {root : V}

private theorem abs_difference_le_walk_length {f : V → ℝ} (hf : f ∈ polar G root)
    {u v : V} (p : G.Walk u v) : |f u - f v| ≤ (p.length : ℝ) := by
  induction p with
  | nil => simp
  | @cons u w v h p ih =>
    have he := hf.2 h
    calc
      |f u - f v| = |(f u - f w) + (f w - f v)| := by congr 1; ring
      _ ≤ |f u - f w| + |f w - f v| := abs_add_le _ _
      _ ≤ ((p.cons h).length : ℝ) := by simp [SimpleGraph.Walk.length_cons]; linarith

theorem polar_isClosed (G : SimpleGraph V) (root : V) : IsClosed (polar G root) := by
  have he : polar G root = {f | f root = 0} ∩ ⋂ u, ⋂ v, ⋂ (_ : G.Adj u v),
      {f | |f u - f v| ≤ (1 : ℝ)} := by
    ext f
    simp [polar]
  rw [he]
  apply (isClosed_eq (continuous_apply root) continuous_const).inter
  apply isClosed_iInter fun u => isClosed_iInter fun v => isClosed_iInter fun _ => ?_
  exact isClosed_le ((continuous_apply u).sub (continuous_apply v)).abs continuous_const

private theorem polar_uniform_bound [Fintype V] (hG : G.Connected) (root : V) :
    ∃ N : ℕ, ∀ f ∈ polar G root, ∀ v, |f v| ≤ (N : ℝ) := by
  classical
  let p (v : V) := (hG root v).some
  refine ⟨∑ v, (p v).length, ?_⟩
  intro f hf v
  have h := abs_difference_le_walk_length hf (p v)
  rw [hf.1, zero_sub, abs_neg] at h
  exact h.trans (by exact_mod_cast (single_le_sum (f := fun u => (p u).length)
    (fun _ _ => Nat.zero_le _) (Finset.mem_univ v) :
    (p v).length ≤ ∑ u, (p u).length))

theorem polar_isCompact [Fintype V] (hG : G.Connected) (root : V) : IsCompact (polar G root) := by
  obtain ⟨N, hN⟩ := polar_uniform_bound hG root
  apply (isCompact_closedBall (0 : V → ℝ) (N : ℝ)).of_isClosed_subset (polar_isClosed G root)
  intro f hf
  rw [Metric.mem_closedBall, dist_zero_right]
  apply (pi_norm_le_iff_of_nonneg (Nat.cast_nonneg N)).mpr
  intro v
  exact (Real.norm_eq_abs _).symm ▸ hN f hf v

theorem finite_polar_vertices [Fintype V] (hG : G.Connected) (root : V) :
    Finite ((polar G root).extremePoints ℝ) := by
  classical
  obtain ⟨N, hN⟩ := polar_uniform_bound hG root
  let bounds : Set ℤ := Set.Icc (-(N : ℤ)) (N : ℤ)
  have : Finite bounds := Set.finite_Icc _ _
  let label (p : ((polar G root).extremePoints ℝ)) (v : V) : ℤ :=
    (int_label_of_mem_extreme_polar p.property v).choose
  have he (p : ((polar G root).extremePoints ℝ)) (v : V) : p.val v = label p v :=
    (int_label_of_mem_extreme_polar p.property v).choose_spec
  let phi (p : ((polar G root).extremePoints ℝ)) (v : V) : bounds :=
    ⟨label p v, by
      have hbound := abs_le.mp (hN p.val p.property.1 v)
      rw [he p v] at hbound
      exact ⟨by exact_mod_cast hbound.1, by exact_mod_cast hbound.2⟩⟩
  apply Finite.of_injective phi
  intro f g h
  apply Subtype.ext
  funext v
  have eq := congrArg Subtype.val (congrFun h v)
  change label f v = label g v at eq
  rw [he f v, he g v, eq]

end BraunBruegge
