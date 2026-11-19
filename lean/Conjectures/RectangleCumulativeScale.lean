import Conjectures.RectangleCumulativeFinite
import Conjectures.RectangleEulerScale
import Mathlib.Topology.Algebra.Order.Field

namespace RectanglePartitionAsymptotics

open Filter
open scoped Topology

theorem tendsto_log_Zcap_sqrt {ι : Type*} {l : Filter ι}
    (B T : ι → ℕ) {c : ℝ} (hc : 0 < c)
    (hT : Tendsto (fun x => (T x:ℝ)) l atTop)
    (hB : Tendsto (fun x => (B x:ℝ)/Real.sqrt (T x)) l atTop) :
    Tendsto (fun x => Real.log (Zcap (B x) (T x) (c/Real.sqrt (T x)))/
      Real.sqrt (T x)) l (𝓝 (RectangleEuler.basel/c)) := by
  have hh := RectangleEuler.tendsto_logTruncatedEuler_sqrt B (fun x => (T x:ℝ)) hc hT hB
  apply hh.congr'
  filter_upwards [hT.eventually (eventually_gt_atTop 0)] with x hx
  rw [log_Zcap _ _ (div_pos hc (Real.sqrt_pos.mpr hx))]
  rfl

theorem tendsto_exp_of_scaled_neg {ι : Type*} {l : Filter ι}
    (f s : ι → ℝ) {c : ℝ} (hc : c < 0) (hs : Tendsto s l atTop)
    (hf : Tendsto (fun x => f x/s x) l (𝓝 c)) :
    Tendsto (fun x => Real.exp (f x)) l (𝓝 0) := by
  have hbot : Tendsto f l atBot := by
    have hh := hs.atTop_mul_neg hc hf
    apply hh.congr'
    filter_upwards [hs.eventually (eventually_gt_atTop 0)] with x hx
    field_simp
  exact Real.tendsto_exp_atBot.comp hbot

theorem scaled_linear_sqrt {T : ℝ} (hT : 0 < T) (a c : ℝ) :
    (a*(c/Real.sqrt T)*T)/Real.sqrt T=a*c := by
  have hs : 0 < Real.sqrt T := Real.sqrt_pos.mpr hT
  calc
    _=a*c*(T/(Real.sqrt T)^2) := by field_simp
    _=a*c := by rw [Real.sq_sqrt hT.le,div_self hT.ne',mul_one]

theorem chernoff_constants_negative {C c δ : ℝ}
    (hc : 0 < c) (hδ : 0 < δ) (hδsmall : δ < 1/4)
    (hC : c^2*(1-δ)=C) :
    ((δ/2)*c*(1-2*δ)+C/(c*(1+δ/2))-C/c < 0) ∧
      (-(δ/2)*c+C/(c*(1-δ/2))-C/c < 0) := by
  have hp : 0 < 1+δ/2 := by linarith
  have hm : 0 < 1-δ/2 := by linarith
  have hp2 : 0 < 2+δ := by linarith
  have hm2 : 0 < 2-δ := by linarith
  constructor
  · have he : (δ/2)*c*(1-2*δ)+C/(c*(1+δ/2))-C/c=
        -(c*δ^2*(1+2*δ)/(2*(2+δ))) := by
      rw [←hC]
      field_simp
      ring
    rw [he]
    exact neg_neg_of_pos (by positivity)
  · have he : -(δ/2)*c+C/(c*(1-δ/2))-C/c=
        -(c*δ^2/(2*(2-δ))) := by
      rw [←hC]
      field_simp
      ring
    rw [he]
    exact neg_neg_of_pos (by positivity)

theorem chernoff_lower_constant {C c δ : ℝ} (hc : 0 < c)
    (hC : c^2*(1-δ)=C) : c*(1-2*δ)+C/c=c*(2-3*δ) := by
  rw [←hC]
  field_simp
  ring

theorem log_cumulative_lower (B T : ℕ) (L t u : ℝ) (ht : 0 ≤ t) (hu : 0 ≤ u)
    (htails : (Real.exp (u*L)*Zcap B T (t+u)+
      Real.exp (-u*(T:ℝ))*Zcap B T (t-u))/Zcap B T t ≤ 1/2) :
    Real.log (Zcap B T t)-Real.log 2+t*L ≤ Real.log (cumulativeCount B T:ℝ) := by
  have hz := Zcap_pos B T t
  have hc : (0:ℝ)<cumulativeCount B T := by exact_mod_cast cumulativeCount_pos B T
  have htail := (div_le_iff₀ hz).mp htails
  have hchernoff := cumulative_chernoff B T L t u ht hu
  have hmiddle : Zcap B T t/2 ≤ (cumulativeCount B T:ℝ)*Real.exp (-t*L) := by
    linarith
  have hh := Real.log_le_log (div_pos hz (by norm_num : (0:ℝ)<2)) hmiddle
  rw [Real.log_div hz.ne' (by norm_num : (2:ℝ)≠0),
    Real.log_mul hc.ne' (Real.exp_ne_zero _),Real.log_exp] at hh
  linarith

end RectanglePartitionAsymptotics
