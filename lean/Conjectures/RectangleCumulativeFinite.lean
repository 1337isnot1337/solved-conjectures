import Conjectures.RectangleEuler
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Algebra.Ring.GeomSum

namespace RectanglePartitionAsymptotics

open Finset

abbrev CappedConfig (B T : ℕ) := Fin B → Fin (T+1)

def mass {B T : ℕ} (f : CappedConfig B T) : ℕ :=
  ∑ i : Fin B, (i.val+1)*(f i).val

noncomputable def cumulativeConfigs (B T : ℕ) : Finset (CappedConfig B T) := by
  classical
  exact Finset.univ.filter (fun f => mass f ≤ T)

noncomputable def cumulativeCount (B T : ℕ) : ℕ := (cumulativeConfigs B T).card

noncomputable def Zcap (B T : ℕ) (t : ℝ) : ℝ :=
  ∑ f : CappedConfig B T, Real.exp (-t*(mass f : ℝ))

theorem mem_cumulativeConfigs {B T : ℕ} {f : CappedConfig B T} :
    f ∈ cumulativeConfigs B T ↔ mass f ≤ T := by
  classical
  simp only [cumulativeConfigs,Finset.mem_filter,Finset.mem_univ,true_and]

theorem cumulativeCount_pos (B T : ℕ) : 0 < cumulativeCount B T := by
  apply Finset.card_pos.mpr
  refine ⟨fun _ => 0,mem_cumulativeConfigs.mpr ?_⟩
  simp [mass]

theorem Zcap_pos (B T : ℕ) (t : ℝ) : 0 < Zcap B T t := by
  unfold Zcap
  exact Finset.sum_pos (fun _ _ => Real.exp_pos _) Finset.univ_nonempty

theorem exp_mass {B T : ℕ} (f : CappedConfig B T) (t : ℝ) :
    Real.exp (-t*(mass f : ℝ))=
      ∏ i : Fin B, Real.exp (-((i.val:ℝ)+1)*t)^(f i).val := by
  have he : -t*(mass f : ℝ)=
      ∑ i : Fin B, ((f i).val:ℝ)*(-((i.val:ℝ)+1)*t) := by
    simp only [mass,Nat.cast_sum,Nat.cast_mul,Nat.cast_add,Nat.cast_one,mul_sum]
    apply Finset.sum_congr rfl
    intro i hi
    ring
  rw [he,Real.exp_sum]
  apply Finset.prod_congr rfl
  intro i hi
  rw [Real.exp_nat_mul]

theorem Zcap_eq_prod (B T : ℕ) (t : ℝ) :
    Zcap B T t = ∏ a ∈ range B,
      ∑ r : Fin (T+1), Real.exp (-((a:ℝ)+1)*t)^r.val := by
  classical
  unfold Zcap
  simp_rw [exp_mass]
  rw [←Fintype.prod_sum (fun i : Fin B => fun r : Fin (T+1) =>
    Real.exp (-((i.val:ℝ)+1)*t)^r.val)]
  exact Fin.prod_univ_eq_prod_range (fun a : ℕ =>
    ∑ r : Fin (T+1),Real.exp (-((a:ℝ)+1)*t)^r.val) B

theorem finite_geometric_exact {q : ℝ} (hq : q ≠ 1) (n : ℕ) :
    (∑ r : Fin n,q^r.val)=(1-q^n)/(1-q) := by
  rw [Fin.sum_univ_eq_sum_range]
  apply (eq_div_iff (sub_ne_zero.mpr hq.symm)).mpr
  rw [geom_sum_mul_neg]

theorem Zcap_eq_exp (B T : ℕ) {t : ℝ} (ht : 0 < t) :
    Zcap B T t=Real.exp (RectangleEuler.logEuler B t-
      RectangleEuler.logEuler B (((T:ℝ)+1)*t)) := by
  have hexp (a : ℕ) : Real.exp (-((a:ℝ)+1)*t) < 1 :=
    Real.exp_lt_one_iff.mpr (by
      have ha : (0:ℝ) ≤ a := by positivity
      nlinarith)
  have hexp' (a : ℕ) : Real.exp (-((a:ℝ)+1)*(((T:ℝ)+1)*t)) < 1 :=
    Real.exp_lt_one_iff.mpr (by
      have ha : (0:ℝ)<(a:ℝ)+1 := by positivity
      have hT : (0:ℝ)<(T:ℝ)+1 := by positivity
      have hp := mul_pos ha (mul_pos hT ht)
      nlinarith)
  rw [Zcap_eq_prod,RectangleEuler.logEuler,RectangleEuler.logEuler,
    ←Finset.sum_sub_distrib,Real.exp_sum]
  apply Finset.prod_congr rfl
  intro a ha
  rw [finite_geometric_exact (ne_of_lt (hexp a))]
  have he : Real.exp (-((a:ℝ)+1)*t)^(T+1)=
      Real.exp (-((a:ℝ)+1)*(((T:ℝ)+1)*t)) := by
    rw [←Real.exp_nat_mul]
    congr 1
    push_cast
    ring
  rw [he,sub_neg_eq_add,Real.exp_add,Real.exp_neg,
    Real.exp_log (sub_pos.mpr (hexp a)),Real.exp_log (sub_pos.mpr (hexp' a))]
  ring

theorem log_Zcap (B T : ℕ) {t : ℝ} (ht : 0 < t) :
    Real.log (Zcap B T t)=RectangleEuler.logEuler B t-
      RectangleEuler.logEuler B (((T:ℝ)+1)*t) := by
  rw [Zcap_eq_exp B T ht,Real.log_exp]

/-- A finite weighted counting bound. No infinite configuration space or
analytic coefficient theorem enters this inequality. -/
theorem finite_weighted_count {α : Type*} [Fintype α] (w : α → ℕ) (T : ℕ)
    {t : ℝ} (ht : 0 ≤ t) :
    (((Finset.univ : Finset α).filter (fun x => w x ≤ T)).card : ℝ)*
      Real.exp (-t*(T:ℝ)) ≤ ∑ x : α, Real.exp (-t*(w x:ℝ)) := by
  classical
  let S := (Finset.univ : Finset α).filter (fun x => w x ≤ T)
  calc
    (S.card:ℝ)*Real.exp (-t*(T:ℝ)) = ∑ x ∈ S,Real.exp (-t*(T:ℝ)) := by
      simp only [Finset.sum_const,nsmul_eq_mul]
    _ ≤ ∑ x ∈ S,Real.exp (-t*(w x:ℝ)) := by
      apply Finset.sum_le_sum
      intro x hx
      have hw : (w x:ℝ) ≤ T := by exact_mod_cast (Finset.mem_filter.mp hx).2
      apply Real.exp_le_exp.mpr
      have hh := mul_le_mul_of_nonneg_left hw ht
      nlinarith only [hh]
    _ ≤ ∑ x : α,Real.exp (-t*(w x:ℝ)) := by
      apply Finset.sum_le_sum_of_subset_of_nonneg (Finset.filter_subset _ _)
      intro x hx hn
      exact (Real.exp_pos _).le

theorem cumulative_weighted_le (B T : ℕ) {t : ℝ} (ht : 0 ≤ t) :
    (cumulativeCount B T:ℝ)*Real.exp (-t*(T:ℝ)) ≤ Zcap B T t := by
  classical
  simpa only [cumulativeCount,cumulativeConfigs,Zcap] using
    finite_weighted_count (mass (B:=B) (T:=T)) T ht

theorem log_cumulative_le (B T : ℕ) {t : ℝ} (ht : 0 ≤ t) :
    Real.log (cumulativeCount B T:ℝ) ≤ t*(T:ℝ)+Real.log (Zcap B T t) := by
  have hc : (0:ℝ)<cumulativeCount B T := by exact_mod_cast cumulativeCount_pos B T
  have hh := Real.log_le_log (mul_pos hc (Real.exp_pos _)) (cumulative_weighted_le B T ht)
  rw [Real.log_mul hc.ne' (Real.exp_ne_zero _),Real.log_exp] at hh
  linarith

/-- A finite three-region Chernoff bound. It holds for every nonnegative t,u
and every real lower cutoff L; later choices place L below the upper cutoff. -/
theorem finite_chernoff_bound {α : Type*} [Fintype α] (w : α → ℕ) (T : ℕ)
    (L t u : ℝ) (ht : 0 ≤ t) (hu : 0 ≤ u) :
    (∑ x : α,Real.exp (-t*(w x:ℝ))) ≤
      (((Finset.univ : Finset α).filter (fun x => w x ≤ T)).card:ℝ)*Real.exp (-t*L)+
      Real.exp (u*L)*(∑ x : α,Real.exp (-(t+u)*(w x:ℝ)))+
      Real.exp (-u*(T:ℝ))*(∑ x : α,Real.exp (-(t-u)*(w x:ℝ))) := by
  classical
  have hpoint (x : α) : Real.exp (-t*(w x:ℝ)) ≤
      (if w x ≤ T then Real.exp (-t*L) else 0)+
      Real.exp (u*L)*Real.exp (-(t+u)*(w x:ℝ))+
      Real.exp (-u*(T:ℝ))*Real.exp (-(t-u)*(w x:ℝ)) := by
    have ha : (0:ℝ) ≤ (if w x ≤ T then Real.exp (-t*L) else 0) := by
      split_ifs <;> positivity
    have hb : (0:ℝ) ≤ Real.exp (u*L)*Real.exp (-(t+u)*(w x:ℝ)) := by positivity
    have hc : (0:ℝ) ≤ Real.exp (-u*(T:ℝ))*Real.exp (-(t-u)*(w x:ℝ)) := by positivity
    by_cases hsmall : (w x:ℝ) ≤ L
    · have hh : Real.exp (-t*(w x:ℝ)) ≤
          Real.exp (u*L)*Real.exp (-(t+u)*(w x:ℝ)) := by
        calc
          _ = Real.exp (u*(w x:ℝ))*Real.exp (-(t+u)*(w x:ℝ)) := by
            rw [←Real.exp_add]
            congr 1
            ring
          _ ≤ _ := mul_le_mul_of_nonneg_right
            (Real.exp_le_exp.mpr (mul_le_mul_of_nonneg_left hsmall hu)) (Real.exp_pos _).le
      linarith
    · by_cases hmiddle : w x ≤ T
      · rw [ite_eq_left hmiddle]
        have hh : Real.exp (-t*(w x:ℝ)) ≤ Real.exp (-t*L) := by
          apply Real.exp_le_exp.mpr
          have hm := mul_le_mul_of_nonneg_left (le_of_lt (lt_of_not_ge hsmall)) ht
          nlinarith only [hm]
        linarith
      · have hw : (T:ℝ) ≤ w x := by exact_mod_cast (le_of_lt (lt_of_not_ge hmiddle))
        have hh : Real.exp (-t*(w x:ℝ)) ≤
            Real.exp (-u*(T:ℝ))*Real.exp (-(t-u)*(w x:ℝ)) := by
          calc
            _ = Real.exp (-u*(w x:ℝ))*Real.exp (-(t-u)*(w x:ℝ)) := by
              rw [←Real.exp_add]
              congr 1
              ring
            _ ≤ _ := by
              apply mul_le_mul_of_nonneg_right _ (Real.exp_pos _).le
              apply Real.exp_le_exp.mpr
              have hm := mul_le_mul_of_nonneg_left hw hu
              nlinarith only [hm]
        linarith
  have hs := Finset.sum_le_sum (fun x (_ : x ∈ (Finset.univ : Finset α)) => hpoint x)
  simpa only [Finset.sum_add_distrib,←Finset.mul_sum,←Finset.sum_filter,
    Finset.sum_const,nsmul_eq_mul] using hs

theorem cumulative_chernoff (B T : ℕ) (L t u : ℝ) (ht : 0 ≤ t) (hu : 0 ≤ u) :
    Zcap B T t ≤ (cumulativeCount B T:ℝ)*Real.exp (-t*L)+
      Real.exp (u*L)*Zcap B T (t+u)+Real.exp (-u*(T:ℝ))*Zcap B T (t-u) := by
  classical
  simpa only [Zcap,cumulativeCount,cumulativeConfigs] using
    finite_chernoff_bound (mass (B:=B) (T:=T)) T L t u ht hu

end RectanglePartitionAsymptotics
