module

public import Mathlib.Topology.Algebra.InfiniteSum.NatInt
public import Mathlib.Analysis.SpecificLimits.Basic
public import Mathlib.Tactic

@[expose] public section
namespace LassalleRefinement

/-- A nonnegative coefficient series bounded at 2 has a geometric tail
at 1. The constant 32 is the one used in the Lassalle proof. -/
theorem normalized_positive_series_tail (g : ℕ→ℝ) (M : ℝ) (hM : 0<M)
    (hg : ∀ i,0≤g i) (hs : Summable g) (hw : Summable (fun i => g i*2^i))
    (hfull : ∑' i,g i = M) (hweight : ∑' i,g i*2^i ≤32*M) (m : ℕ) :
    let X := (∑ i ∈ Finset.range (m+1),g i)/M
    0≤X ∧ X≤1 ∧ |X-1|≤32*(1/2:ℝ)^m := by
  let C : ℝ := (1/2)^m
  have hC : 0≤C := by positivity
  let w (i : ℕ) : ℝ := g i*2^i
  let u (i : ℕ) : ℝ := g (i+(m+1))
  let v (i : ℕ) : ℝ := w (i+(m+1))
  have hu : Summable u := (summable_nat_add_iff (m+1)).2 hs
  have hv : Summable v := (summable_nat_add_iff (m+1)).2 hw
  have hvC : Summable (fun i => C*v i) := hv.mul_left C
  have huv (i : ℕ) : u i≤C*v i := by
    have he : C*(2:ℝ)^m=1 := by
      dsimp [C]
      rw [←mul_pow]
      norm_num
    have hp : (2:ℝ)^m≤(2:ℝ)^(i+(m+1)) :=
      pow_le_pow_right₀ (by norm_num) (by omega)
    have hOne : (1:ℝ)≤C*(2:ℝ)^(i+(m+1)) := he ▸ mul_le_mul_of_nonneg_left hp hC
    dsimp [u,v,w]
    calc
      _ = g (i+(m+1))*1 := (mul_one _).symm
      _ ≤ g (i+(m+1))*(C*(2:ℝ)^(i+(m+1))) :=
        mul_le_mul_of_nonneg_left hOne (hg _)
      _ = _ := by ring
  have htail : ∑' i,u i ≤ C*(32*M) := by
    calc
      _ ≤ ∑' i,C*v i := hu.tsum_le_tsum huv hvC
      _ = C*(∑' i,v i) := tsum_mul_left
      _ ≤ C*(∑' i,w i) := by
        apply mul_le_mul_of_nonneg_left _ hC
        have h₀ : 0≤∑ i ∈ Finset.range (m+1),w i :=
          Finset.sum_nonneg fun i _ => mul_nonneg (hg _) (by positivity)
        have he := hw.sum_add_tsum_nat_add (m+1)
        change (∑ i ∈ Finset.range (m+1),w i)+(∑' i,v i)=∑' i,w i at he
        linarith
      _ ≤ _ := mul_le_mul_of_nonneg_left hweight hC
  let S := ∑ i ∈ Finset.range (m+1),g i
  have hst := hs.sum_add_tsum_nat_add (m+1)
  change S+(∑' i,u i)=∑' i,g i at hst
  rw [hfull] at hst
  have hs₀ : 0≤S := Finset.sum_nonneg (fun i _ => hg i)
  have hu₀ : (0:ℝ)≤∑' i,u i := tsum_nonneg fun i => hg _
  have hsM : S≤M := by linarith
  have hXM : S/M≤1 := (div_le_iff₀ hM).mpr (by simpa using hsM)
  change 0≤S/M ∧ S/M≤1 ∧ |S/M-1|≤32*C
  refine ⟨div_nonneg hs₀ hM.le,hXM,?_⟩
  rw [abs_of_nonpos (sub_nonpos.mpr hXM),neg_sub]
  have he : 1-S/M=(M-S)/M := by rw [sub_div,div_self hM.ne']
  rw [he]
  apply (div_le_iff₀ hM).mpr
  linarith

end LassalleRefinement
