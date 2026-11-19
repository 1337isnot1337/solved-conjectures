import Conjectures.RectangleCumulativeScale

namespace RectanglePartitionAsymptotics

open Filter
open scoped Topology

noncomputable def scaledTail (B T : ℕ) (a c d : ℝ) : ℝ :=
  Real.exp (a*(c/Real.sqrt (T:ℝ))*(T:ℝ))*
    Zcap B T (d/Real.sqrt (T:ℝ))/Zcap B T (c/Real.sqrt (T:ℝ))

theorem tendsto_scaledTail_zero {ι : Type*} {l : Filter ι}
    (B T : ι → ℕ) {a c d : ℝ} (hc : 0 < c) (hd : 0 < d)
    (hrate : a*c+RectangleEuler.basel/d-RectangleEuler.basel/c < 0)
    (hT : Tendsto (fun x => (T x:ℝ)) l atTop)
    (hB : Tendsto (fun x => (B x:ℝ)/Real.sqrt (T x)) l atTop) :
    Tendsto (fun x => scaledTail (B x) (T x) a c d) l (𝓝 0) := by
  have hbase := tendsto_log_Zcap_sqrt B T hc hT hB
  have hshift := tendsto_log_Zcap_sqrt B T hd hT hB
  have hsqrt := Real.tendsto_sqrt_atTop.comp hT
  have hlin : Tendsto (fun _ : ι => a*c) l (𝓝 (a*c)) := tendsto_const_nhds
  have hscaled : Tendsto (fun x =>
      (a*(c/Real.sqrt (T x))*(T x:ℝ)+
        Real.log (Zcap (B x) (T x) (d/Real.sqrt (T x)))-
        Real.log (Zcap (B x) (T x) (c/Real.sqrt (T x))))/Real.sqrt (T x))
      l (𝓝 (a*c+RectangleEuler.basel/d-RectangleEuler.basel/c)) := by
    apply ((hlin.add hshift).sub hbase).congr'
    filter_upwards [hT.eventually (eventually_gt_atTop 0)] with x hx
    rw [sub_div,add_div,scaled_linear_sqrt hx a c]
  have he := tendsto_exp_of_scaled_neg
    (fun x => a*(c/Real.sqrt (T x))*(T x:ℝ)+
      Real.log (Zcap (B x) (T x) (d/Real.sqrt (T x)))-
      Real.log (Zcap (B x) (T x) (c/Real.sqrt (T x))))
    (fun x => Real.sqrt (T x)) hrate hsqrt hscaled
  apply he.congr'
  filter_upwards [] with x
  unfold scaledTail
  rw [Real.exp_sub,Real.exp_add,
    Real.exp_log (Zcap_pos (B x) (T x) (d/Real.sqrt (T x))),
    Real.exp_log (Zcap_pos (B x) (T x) (c/Real.sqrt (T x)))]

theorem chernoff_tail_sum (B T : ℕ) (c δ : ℝ) :
    (Real.exp ((δ/2)*(c/Real.sqrt (T:ℝ))*((1-2*δ)*(T:ℝ)))*
        Zcap B T (c/Real.sqrt (T:ℝ)+(δ/2)*(c/Real.sqrt (T:ℝ)))+
      Real.exp (-((δ/2)*(c/Real.sqrt (T:ℝ)))*(T:ℝ))*
        Zcap B T (c/Real.sqrt (T:ℝ)-(δ/2)*(c/Real.sqrt (T:ℝ))))/
          Zcap B T (c/Real.sqrt (T:ℝ)) =
      scaledTail B T ((δ/2)*(1-2*δ)) c (c*(1+δ/2))+
      scaledTail B T (-(δ/2)) c (c*(1-δ/2)) := by
  have hp : c/Real.sqrt (T:ℝ)+(δ/2)*(c/Real.sqrt (T:ℝ))=
      (c*(1+δ/2))/Real.sqrt (T:ℝ) := by ring
  have hm : c/Real.sqrt (T:ℝ)-(δ/2)*(c/Real.sqrt (T:ℝ))=
      (c*(1-δ/2))/Real.sqrt (T:ℝ) := by ring
  have he : (δ/2)*(c/Real.sqrt (T:ℝ))*((1-2*δ)*(T:ℝ))=
      ((δ/2)*(1-2*δ))*(c/Real.sqrt (T:ℝ))*(T:ℝ) := by ring
  have hn : -((δ/2)*(c/Real.sqrt (T:ℝ)))*(T:ℝ)=
      (-(δ/2))*(c/Real.sqrt (T:ℝ))*(T:ℝ) := by ring
  simp only [scaledTail,add_div,hp,hm,he,hn]

theorem tendsto_chernoff_tail_sum {ι : Type*} {l : Filter ι}
    (B T : ι → ℕ) {c δ : ℝ} (hc : 0 < c) (hδ : 0 < δ)
    (hδsmall : δ < 1/4) (hC : c^2*(1-δ)=RectangleEuler.basel)
    (hT : Tendsto (fun x => (T x:ℝ)) l atTop)
    (hB : Tendsto (fun x => (B x:ℝ)/Real.sqrt (T x)) l atTop) :
    Tendsto (fun x =>
      scaledTail (B x) (T x) ((δ/2)*(1-2*δ)) c (c*(1+δ/2))+
      scaledTail (B x) (T x) (-(δ/2)) c (c*(1-δ/2))) l (𝓝 0) := by
  have hneg := chernoff_constants_negative hc hδ hδsmall hC
  have hp : 0 < c*(1+δ/2) := by positivity
  have hm : 0 < c*(1-δ/2) := by
    apply mul_pos hc
    linarith
  have hrate : ((δ/2)*(1-2*δ))*c+RectangleEuler.basel/(c*(1+δ/2))-
      RectangleEuler.basel/c < 0 := by nlinarith only [hneg.1]
  simpa only [add_zero] using
    (tendsto_scaledTail_zero B T hc hp hrate hT hB).add
      (tendsto_scaledTail_zero B T hc hm hneg.2 hT hB)

theorem eventually_log_cumulative_lower {ι : Type*} {l : Filter ι}
    (B T : ι → ℕ) {c δ : ℝ} (hc : 0 < c) (hδ : 0 < δ)
    (hδsmall : δ < 1/4) (hC : c^2*(1-δ)=RectangleEuler.basel)
    (hT : Tendsto (fun x => (T x:ℝ)) l atTop)
    (hB : Tendsto (fun x => (B x:ℝ)/Real.sqrt (T x)) l atTop) :
    ∀ᶠ x in l,
      (Real.log (Zcap (B x) (T x) (c/Real.sqrt (T x)))-Real.log 2+
        (c/Real.sqrt (T x))*((1-2*δ)*(T x:ℝ)))/Real.sqrt (T x) ≤
      Real.log (cumulativeCount (B x) (T x):ℝ)/Real.sqrt (T x) := by
  have hsum := tendsto_chernoff_tail_sum B T hc hδ hδsmall hC hT hB
  have htail := (tendsto_order.mp hsum).2 (1/2) (by norm_num)
  filter_upwards [htail,hT.eventually (eventually_gt_atTop 0)] with x hx hTx
  have hs : 0 < Real.sqrt (T x:ℝ) := Real.sqrt_pos.mpr hTx
  apply (div_le_div_iff_of_pos_right hs).mpr
  apply log_cumulative_lower (B x) (T x) ((1-2*δ)*(T x:ℝ))
    (c/Real.sqrt (T x)) ((δ/2)*(c/Real.sqrt (T x))) (by positivity) (by positivity)
  rw [chernoff_tail_sum]
  exact hx.le

theorem eventually_cumulative_gt_of_delta {ι : Type*} {l : Filter ι}
    (B T : ι → ℕ) {c δ r : ℝ} (hc : 0 < c) (hδ : 0 < δ)
    (hδsmall : δ < 1/4) (hC : c^2*(1-δ)=RectangleEuler.basel)
    (hr : r < c*(2-3*δ))
    (hT : Tendsto (fun x => (T x:ℝ)) l atTop)
    (hB : Tendsto (fun x => (B x:ℝ)/Real.sqrt (T x)) l atTop) :
    ∀ᶠ x in l, r < Real.log (cumulativeCount (B x) (T x):ℝ)/Real.sqrt (T x) := by
  have hbase := tendsto_log_Zcap_sqrt B T hc hT hB
  have hsqrt := Real.tendsto_sqrt_atTop.comp hT
  have hlog2 := hsqrt.const_div_atTop (Real.log 2)
  have hlim : Tendsto (fun x =>
      (Real.log (Zcap (B x) (T x) (c/Real.sqrt (T x)))-Real.log 2+
        (c/Real.sqrt (T x))*((1-2*δ)*(T x:ℝ)))/Real.sqrt (T x))
      l (𝓝 (c*(2-3*δ))) := by
    have hh := (hbase.sub hlog2).add_const (c*(1-2*δ))
    have hcst : RectangleEuler.basel/c-0+c*(1-2*δ)=c*(2-3*δ) := by
      have he := chernoff_lower_constant hc hC
      linarith
    rw [hcst] at hh
    apply hh.congr'
    filter_upwards [hT.eventually (eventually_gt_atTop 0)] with x hx
    have he : ((c/Real.sqrt (T x))*((1-2*δ)*(T x:ℝ)))/Real.sqrt (T x)=
        c*(1-2*δ) := by
      calc
        _=((1-2*δ)*(c/Real.sqrt (T x))*(T x:ℝ))/Real.sqrt (T x) := by ring
        _=(1-2*δ)*c := scaled_linear_sqrt hx (1-2*δ) c
        _=c*(1-2*δ) := by ring
    rw [add_div,sub_div,he]
    rfl
  filter_upwards [(tendsto_order.mp hlim).1 r hr,
    eventually_log_cumulative_lower B T hc hδ hδsmall hC hT hB] with x hx hbound
  exact hx.trans_le hbound

end RectanglePartitionAsymptotics
