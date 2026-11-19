import Mathlib.Algebra.Module.Submodule.Union
import Mathlib.Basic.Real.Basic
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.Data.Fintype.Lattice
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-! Coordinate coalescence for finite families of nonzero linear forms.
Two separating functionals replace the cyclic-order argument: two adjacent
normalized scalar values yield a signed sum outside every original line. -/

namespace Loneliness.Coalescence

noncomputable section

variable {K : Type*} [Field K] [LinearOrder K] [IsStrictOrderedRing K]

def orientation (x : K) : K := if 0 < x then 1 else -1

omit [IsStrictOrderedRing K] in
theorem orientation_cases (x : K) : orientation x = 1 ∨ orientation x = -1 := by
  unfold orientation
  split_ifs <;> simp

theorem orientation_mul_pos {x : K} (hx : x ≠ 0) : 0 < orientation x * x := by
  rcases lt_trichotomy x 0 with h | h | h
  · have hn : ¬0 < x := by linarith
    simp only [orientation, ite_eq_right hn, neg_one_mul]
    linarith
  · exact False.elim (hx h)
  · simp [orientation, h]

variable {ι V : Type*} [Fintype ι] [AddCommGroup V] [Module K V]

theorem exists_signed_sum_avoiding_lines [Infinite K] (v : ι → V) (hv : ∀ i, v i ≠ 0)
    (hpair : ∃ p q, v p ∉ Submodule.span K {v q}) :
    ∃ (a b : ι) (σ τ : K), a ≠ b ∧
      (σ = 1 ∨ σ = -1) ∧ (τ = 1 ∨ τ = -1) ∧
      ∀ (k : ι) (c : K), σ • v a + τ • v b ≠ c • v k := by
  classical
  obtain ⟨p, q, hpq⟩ := hpair
  let : Nonempty ι := ⟨p⟩
  obtain ⟨f, hf⟩ := Module.exists_dual_forall_apply_ne_zero (K := K) v hv
  let u : ι → V := fun i => (f (v i))⁻¹ • v i
  have hrecover (i : ι) : f (v i) • u i = v i := by
    simp [u, smul_smul, hf i]
  have hupq : u p ≠ u q := by
    intro heq
    apply hpq
    apply Submodule.mem_span_singleton.mpr
    refine ⟨f (v p) / f (v q), ?_⟩
    calc
      (f (v p) / f (v q)) • v q = f (v p) • u q := by
        simp [u, div_eq_mul_inv, smul_smul]
      _ = f (v p) • u p := by rw [heq]
      _ = v p := hrecover p
  let P := {ij : ι × ι // u ij.1 ≠ u ij.2}
  obtain ⟨g, hg⟩ := Module.exists_dual_forall_apply_ne_zero (K := K)
    (fun ij : P => u ij.1.1 - u ij.1.2) (fun ij => sub_ne_zero.mpr ij.2)
  have hsep (i j : ι) (heq : g (u i) = g (u j)) : u i = u j := by
    by_contra hne
    apply hg ⟨(i, j), hne⟩
    simp only [map_sub, heq, sub_self]
  let r : ι → K := fun i => g (u i)
  have hrpq : r p ≠ r q := fun h => hupq (hsep p q h)
  obtain ⟨a, ha⟩ := Finite.exists_min r
  have hgreater : ∃ b, r a < r b := by
    by_contra hn
    have hle (i : ι) : r i ≤ r a := le_of_not_gt (fun h => hn ⟨i, h⟩)
    apply hrpq
    exact (le_antisymm (hle p) (ha p)).trans (le_antisymm (hle q) (ha q)).symm
  let P' := {i : ι // r a < r i}
  obtain ⟨c, hc⟩ := hgreater
  let : Nonempty P' := ⟨⟨c, hc⟩⟩
  obtain ⟨b, hb⟩ := Finite.exists_min (fun i : P' => r i.1)
  have hab : r a < r b.1 := b.2
  have hgap (i : ι) : r i ≤ r a ∨ r b.1 ≤ r i := by
    by_cases hi : r a < r i
    · exact Or.inr (hb ⟨i, hi⟩)
    · exact Or.inl (le_of_not_gt hi)
  let σ := orientation (f (v a))
  let τ := orientation (f (v b.1))
  let A := σ * f (v a)
  let B := τ * f (v b.1)
  let w := σ • v a + τ • v b.1
  have hA : 0 < A := orientation_mul_pos (hf a)
  have hB : 0 < B := orientation_mul_pos (hf b.1)
  have hgr (i : ι) : g (v i) = f (v i) * r i := by
    have h := congrArg g (hrecover i)
    simpa only [map_smul, smul_eq_mul] using h.symm
  have hfw : f w = A + B := by simp [w, A, B]
  have hgw : g w = A * r a + B * r b.1 := by
    simp only [w, map_add, map_smul, smul_eq_mul, hgr]
    dsimp [A, B]
    ring
  have hfwpos : 0 < f w := by rw [hfw]; positivity
  have hlo : f w * r a < g w := by
    rw [hfw, hgw]
    nlinarith [mul_pos hB (sub_pos.mpr hab)]
  have hhi : g w < f w * r b.1 := by
    rw [hfw, hgw]
    nlinarith [mul_pos hA (sub_pos.mpr hab)]
  have havoid (k : ι) (s : K) : w ≠ s • v k := by
    intro heq
    have hfeq : f w = s * f (v k) := by simp [heq]
    have hgeq : g w = s * g (v k) := by simp [heq]
    have hratio : g w = f w * r k := by rw [hgeq, hfeq, hgr]; ring
    rcases hgap k with hk | hk
    · have h := mul_le_mul_of_nonneg_left hk hfwpos.le
      linarith
    · have h := mul_le_mul_of_nonneg_left hk hfwpos.le
      linarith
  refine ⟨a, b.1, σ, τ, ?_, orientation_cases _, orientation_cases _, havoid⟩
  intro heq
  have h := congrArg r heq
  linarith

omit [LinearOrder K] [IsStrictOrderedRing K] in
theorem exists_nonparallel_pair [Nonempty ι]
    (v : ι → V) (hv : ∀ i, v i ≠ 0)
    (hdim : 2 ≤ Module.finrank K (Submodule.span K (Set.range v))) :
    ∃ p q, v p ∉ Submodule.span K {v q} := by
  classical
  obtain ⟨q⟩ := ‹Nonempty ι›
  by_contra hn
  have hsub : Submodule.span K (Set.range v) ≤ Submodule.span K {v q} := by
    apply Submodule.span_le.mpr
    rintro x ⟨i, rfl⟩
    by_contra h
    exact hn ⟨i, q, h⟩
  have hle := Submodule.finrank_mono hsub
  rw [finrank_span_singleton (hv q)] at hle
  omega

theorem coalescing_hyperplane [Infinite K] [Nonempty ι] [FiniteDimensional K V]
    (f : ι → Module.Dual K V) (hf : ∀ i, f i ≠ 0)
    (hdim : 2 ≤ Module.finrank K (Submodule.span K (Set.range f))) :
    ∃ (a b : ι) (ε : K) (H : Submodule K V), a ≠ b ∧
      f a ∉ Submodule.span K {f b} ∧
      (ε = 1 ∨ ε = -1) ∧
      Module.finrank K H + 1 = Module.finrank K V ∧
      (∀ x ∈ H, f a x = ε * f b x) ∧
      (∀ k, ∃ x ∈ H, f k x ≠ 0) ∧ H = (f a - ε • f b).ker := by
  classical
  obtain ⟨a, b, σ, τ, hab, hσ, hτ, havoid⟩ :=
    exists_signed_sum_avoiding_lines f hf (exists_nonparallel_pair f hf hdim)
  let φ : Module.Dual K V := σ • f a + τ • f b
  have hφ : φ ≠ 0 := by
    intro hz
    apply havoid a 0
    simpa [φ] using hz
  let ε : K := -σ * τ
  have hε : ε = 1 ∨ ε = -1 := by
    rcases hσ with rfl | rfl <;> rcases hτ with rfl | rfl <;> norm_num [ε]
  have hσσ : σ * σ = 1 := by rcases hσ with rfl | rfl <;> norm_num
  have hnonparallel : f a ∉ Submodule.span K {f b} := by
    intro hmem
    obtain ⟨c, hc⟩ := Submodule.mem_span_singleton.mp hmem
    apply havoid b (σ * c + τ)
    rw [← hc]
    simp [smul_smul, add_smul]
  refine ⟨a, b, ε, φ.ker, hab, hnonparallel, hε,
    Module.Dual.finrank_ker_add_one_of_ne_zero hφ, ?_, ?_, ?_⟩
  · intro x hx
    have hzero : σ * f a x + τ * f b x = 0 := by simpa [φ] using hx
    calc
      f a x = (σ * σ) * f a x := by rw [hσσ]; ring
      _ = σ * (σ * f a x + τ * f b x) - σ * τ * f b x := by ring
      _ = ε * f b x := by rw [hzero]; dsimp [ε]; ring
  · intro k
    by_contra hn
    have hker : φ.ker ≤ (f k).ker := by
      intro x hx
      change f k x = 0
      by_contra hzero
      exact hn ⟨x, hx, hzero⟩
    have hmem : f k ∈ Submodule.span K {φ} := by
      have h := mem_span_of_iInf_ker_le_ker (L := fun _ : Unit => φ) (K := f k)
        (by simpa using hker)
      simpa only [Set.range_const] using h
    obtain ⟨c, hc⟩ := Submodule.mem_span_singleton.mp hmem
    have hcne : c ≠ 0 := by
      intro hz
      rw [hz, zero_smul] at hc
      exact hf k hc.symm
    apply havoid k c⁻¹
    change φ = c⁻¹ • f k
    rw [← hc, smul_smul, inv_mul_cancel₀ hcne, one_smul]
  · ext x
    simp only [φ, ε, LinearMap.mem_ker, LinearMap.add_apply,
      LinearMap.sub_apply, LinearMap.smul_apply, smul_eq_mul]
    rcases hσ with rfl | rfl <;> rcases hτ with rfl | rfl <;>
      norm_num <;> constructor <;> intro h <;> linarith

end

end Loneliness.Coalescence
