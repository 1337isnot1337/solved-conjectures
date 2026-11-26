module
public import Conjectures.PomeranceSarkozyGridChaining
public import Mathlib.Topology.ContinuousMap.Bounded.ArzelaAscoli
public import Mathlib.Topology.MetricSpace.Equicontinuity
public import Mathlib.Topology.Order.ProjIcc
import Mathlib.Tactic.Linarith

@[expose] public section
namespace PomeranceSarkozy

open Set Filter
open scoped Topology BoundedContinuousFunction

abbrev UnitIntervalPath := (Icc (0:ℝ) 1) →ᵇ ℝ

def processPathZero : Icc (0:ℝ) 1 := ⟨0,⟨le_rfl,zero_le_one⟩⟩

noncomputable def unitBase32Vertex (m : ℕ) (j : Fin (32^m+1)) : Icc (0:ℝ) 1 := by
  refine ⟨base32GridPoint m j.val,?_⟩
  change 0≤((j.val:ℕ):ℝ)/(32:ℝ)^m ∧ ((j.val:ℕ):ℝ)/(32:ℝ)^m≤1
  have h : j.val≤32^m := by have := j.isLt; omega
  exact ⟨by positivity,(div_le_one₀ (by positivity)).mpr (by exact_mod_cast h)⟩

def processGridGood (A : ℝ) : Set UnitIntervalPath :=
  {f | |f processPathZero| ≤ A ∧ ∀ m (j : Fin (32^m)),
    |f (unitBase32Vertex m j.succ)-f (unitBase32Vertex m j.castSucc)| ≤ A*(1/2:ℝ)^m}

private theorem processGridGood_isClosed (A : ℝ) : IsClosed (processGridGood A) := by
  have he : processGridGood A =
      {f : UnitIntervalPath | |f processPathZero| ≤ A} ∩
      ⋂ m : ℕ,⋂ j : Fin (32^m),
        {f : UnitIntervalPath | |f (unitBase32Vertex m j.succ)-f (unitBase32Vertex m j.castSucc)| ≤ A*(1/2:ℝ)^m} := by
    ext f
    simp only [processGridGood,mem_inter_iff,mem_iInter,mem_ofPred_eq]
  rw [he]
  have hEval (q : Icc (0:ℝ) 1) : Continuous (fun f : UnitIntervalPath=>f q) :=
    (BoundedContinuousFunction.lipschitz_eval_const q).continuous
  exact (isClosed_le (hEval _).abs continuous_const).inter
    (isClosed_iInter fun m=>isClosed_iInter fun j=>isClosed_le ((hEval _).sub (hEval _)).abs continuous_const)

private theorem processGridGood_modulus {A : ℝ} (hA : 0≤A)
    {f : UnitIntervalPath} (hf : f∈processGridGood A) (m : ℕ)
    (s t : Icc (0:ℝ) 1) (hst : |(s:ℝ)-(t:ℝ)|≤((32:ℝ)^m)⁻¹) :
    |f s-f t|≤63*A*(1/2:ℝ)^m := by
  let π := projIcc (0:ℝ) 1 zero_le_one
  let g (x : ℝ) := f (π x)
  have hCont : ContinuousOn g (Icc (0:ℝ) 1) :=
    (f.continuous.comp (continuous_projIcc (h:=zero_le_one))).continuousOn
  have hGrid (m j : ℕ) (hj : j<32^m) :
      |g (base32GridPoint m (j+1))-g (base32GridPoint m j)| ≤ A*(1/2:ℝ)^m := by
    let k : Fin (32^m) := ⟨j,hj⟩
    have hp (q : Fin (32^m+1)) : π (base32GridPoint m q.val)=unitBase32Vertex m q :=
      projIcc_of_mem _ (unitBase32Vertex m q).property
    change |f (π (base32GridPoint m k.succ.val))-f (π (base32GridPoint m k.castSucc.val))| ≤ _
    rw [hp,hp]
    exact hf.2 m k
  have h := base32_grid_modulus g hCont A hA hGrid m s.property t.property hst
  have hπ (x : Icc (0:ℝ) 1) : π x=x := by
    unfold π
    exact (projIcc_of_mem _ x.property).trans (Subtype.eta _ _)
  unfold g at h
  rwa [hπ,hπ] at h

/-- Paths bounded at zero and satisfying every base-32 edge test
form a compact subset of uniform path space. -/
theorem processGridGood_isCompact (A : ℝ) (hA : 0≤A) : IsCompact (processGridGood A) := by
  refine BoundedContinuousFunction.arzela_ascoli₂ (Icc (-(64*A)) (64*A))
    isCompact_Icc _ (processGridGood_isClosed A) ?_ ?_
  · intro f x hf
    have hb : |(x:ℝ)-(processPathZero:ℝ)|≤((32:ℝ)^0)⁻¹ := by
      change |(x:ℝ)-0|≤_
      rw [sub_zero,abs_of_nonneg x.property.1]
      simpa using x.property.2
    have h₁ := processGridGood_modulus hA hf 0 x processPathZero hb
    simp only [pow_zero,mul_one] at h₁
    have h₂ := hf.1
    have h₃ : |f x|≤|f x-f processPathZero|+|f processPathZero| := by
      simpa only [sub_zero] using abs_sub_le (f x) (f processPathZero) 0
    exact abs_le.mp (h₃.trans (by linarith))
  · intro t
    apply Metric.equicontinuousAt_iff.mpr
    intro ε hε
    have hLim : Tendsto (fun m : ℕ=>63*A*(1/2:ℝ)^m) atTop (𝓝 0) := by
      simpa only [mul_zero] using
        (tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num : (0:ℝ)≤1/2) (by norm_num)).const_mul (63*A)
    obtain ⟨m,hm⟩ := (hLim.eventually_lt_const hε).exists
    refine ⟨((32:ℝ)^m)⁻¹,by positivity,fun s hs f=>?_⟩
    change |(s:ℝ)-(t:ℝ)| < _ at hs
    change |f.val t-f.val s| < ε
    exact (processGridGood_modulus hA f.property m t s (by rw [abs_sub_comm]; exact hs.le)).trans_lt hm

end PomeranceSarkozy
