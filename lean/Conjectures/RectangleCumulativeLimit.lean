import Conjectures.RectangleCumulativeTails
import Conjectures.RectangleCumulativeEncoding

namespace RectanglePartitionAsymptotics

open Filter
open scoped Topology

/-- The full cumulative partition asymptotic on an arbitrary filter. The
largest permitted part may vary independently of the total-size budget. -/
theorem tendsto_log_cumulative_sqrt {ι : Type*} {l : Filter ι}
    (B T : ι → ℕ)
    (hT : Tendsto (fun x => (T x:ℝ)) l atTop)
    (hB : Tendsto (fun x => (B x:ℝ)/Real.sqrt (T x)) l atTop) :
    Tendsto (fun x => Real.log (cumulativeCount (B x) (T x):ℝ)/Real.sqrt (T x))
      l (𝓝 (2*Real.sqrt RectangleEuler.basel)) := by
  let g : ℝ := Real.sqrt RectangleEuler.basel
  have hg : 0 < g := Real.sqrt_pos.mpr RectangleEuler.basel_pos
  have hg2 : g^2=RectangleEuler.basel := Real.sq_sqrt RectangleEuler.basel_pos.le
  apply tendsto_order.mpr
  constructor
  · intro r hr
    change r < 2*g at hr
    let δ : ℝ := min (1/8) ((2*g-r)/(6*g))
    have hδ : 0 < δ := lt_min (by norm_num) (div_pos (by linarith) (by positivity))
    have hδsmall : δ < 1/4 :=
      lt_of_le_of_lt (min_le_left _ _) (by norm_num)
    have hδrate : δ*(6*g) ≤ 2*g-r :=
      (le_div_iff₀ (by positivity : (0:ℝ)<6*g)).mp (min_le_right _ _)
    have hnear : r < g*(2-3*δ) := by nlinarith only [hδrate,hr]
    have hd : 0 < 1-δ := by linarith
    let c : ℝ := Real.sqrt (RectangleEuler.basel/(1-δ))
    have hc : 0 < c := Real.sqrt_pos.mpr (div_pos RectangleEuler.basel_pos hd)
    have hC : c^2*(1-δ)=RectangleEuler.basel := by
      have hh : c^2=RectangleEuler.basel/(1-δ) :=
        Real.sq_sqrt (div_nonneg RectangleEuler.basel_pos.le hd.le)
      exact (eq_div_iff hd.ne').mp hh
    have hgc : g ≤ c := by
      apply Real.sqrt_le_sqrt
      apply (le_div_iff₀ hd).mpr
      have hh := mul_nonneg RectangleEuler.basel_pos.le hδ.le
      nlinarith only [hh]
    have hfactor : 0 ≤ 2-3*δ := by linarith
    have hrc : r < c*(2-3*δ) :=
      hnear.trans_le (mul_le_mul_of_nonneg_right hgc hfactor)
    exact eventually_cumulative_gt_of_delta B T hc hδ hδsmall hC hrc hT hB
  · intro r hr
    change 2*g < r at hr
    have hbase := tendsto_log_Zcap_sqrt B T hg hT hB
    have hcst : g+RectangleEuler.basel/g=2*g := by
      field_simp
      nlinarith only [hg2]
    have hU : Tendsto (fun x => g+
        Real.log (Zcap (B x) (T x) (g/Real.sqrt (T x)))/Real.sqrt (T x))
        l (𝓝 (2*g)) := by
      have hh : Tendsto (fun x => g+
          Real.log (Zcap (B x) (T x) (g/Real.sqrt (T x)))/Real.sqrt (T x))
          l (𝓝 (g+RectangleEuler.basel/g)) := tendsto_const_nhds.add hbase
      rwa [hcst] at hh
    filter_upwards [(tendsto_order.mp hU).2 r hr,
      hT.eventually (eventually_gt_atTop 0)] with x hx hTx
    have hs : 0 < Real.sqrt (T x:ℝ) := Real.sqrt_pos.mpr hTx
    have hh := div_le_div_of_nonneg_right
      (log_cumulative_le (B x) (T x) (show 0 ≤ g/Real.sqrt (T x) by positivity)) hs.le
    have he : ((g/Real.sqrt (T x))*(T x:ℝ))/Real.sqrt (T x)=g := by
      simpa only [one_mul] using scaled_linear_sqrt hTx 1 g
    rw [add_div,he] at hh
    exact hh.trans_lt hx

/-- The same asymptotic for the exact multiset-valued partition family used
in the rectangle constructions. -/
theorem tendsto_log_boundedParts_sqrt {ι : Type*} {l : Filter ι}
    (B T : ι → ℕ)
    (hT : Tendsto (fun x => (T x:ℝ)) l atTop)
    (hB : Tendsto (fun x => (B x:ℝ)/Real.sqrt (T x)) l atTop) :
    Tendsto (fun x => Real.log ((RectanglePartitions.boundedParts 1 (B x) (T x)).card:ℝ)/
      Real.sqrt (T x)) l (𝓝 (2*Real.sqrt RectangleEuler.basel)) := by
  simpa only [cumulativeCount_eq_boundedParts] using tendsto_log_cumulative_sqrt B T hT hB

end RectanglePartitionAsymptotics
