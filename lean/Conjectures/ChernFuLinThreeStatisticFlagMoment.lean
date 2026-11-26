import Conjectures.ChernFuLinThreeStatisticFlagWord

/-! # Evaluation of the moment for the active-flag extension series -/

namespace Conjectures.ChernFuLinThreeStatistic.Kernel

open PowerSeries Finset

variable {K : Type*} [Field K]
local notation "S" => PowerSeries K
noncomputable section

private def conv (u : S) (α : ℕ → S) (a : ℕ) := ∑ j ∈ range a, α (j+1)*u^(a-1-j)
private def cum (α : ℕ → S) (a : ℕ) := ∑ j ∈ range a, α (j+1)

private theorem conv_succ (u : S) (α : ℕ → S) (a : ℕ) : conv u α (a+1) = u*conv u α a + α (a+1) := by
  unfold conv; rw [sum_range_succ,mul_sum]; simp only [Nat.add_sub_cancel,Nat.sub_self,pow_zero,mul_one]
  congr 1; apply sum_congr rfl; intro j hj
  rw [show a-j=(a-1-j)+1 by have := mem_range.mp hj; omega,pow_succ]; ring

theorem rec_of_flags {k u iz v g : S} (H : Flags k u iz v g) (hk : X∣k) (hu : u*(1-k)=1) :
    ∃ R : Recurrence X k u iz v g, R.β 0 = H.A 0 [] := by
  obtain ⟨α,β,hβ,hval⟩ := flags_affine H hk hu
  let p := conv u α; let q := cum α; let w := cum β
  have hB (a) : H.B0 a = g*v^a + k*w (a+1) + p (a+1) - q (a+1) := by
    rw [H.base]; dsimp [p,q,w,conv,cum]; rw [mul_sum,mul_sum]
    rw [add_assoc,add_sub_assoc,← sum_add_distrib,← sum_sub_distrib]
    congr 1; apply sum_congr rfl; intro j _; rw [hval]
    linear_combination α (j+1)*L_zeros u iz k hu (a-j)
  have rest (a W) : k*(∑ j ∈ range a, H.A (j+1) (pre (a-1-j)++W)) =
      k*w a+(1+k*u*iz)*p a-q a + k*u*iz*p a*L u iz W := by
    dsimp [w,p,q,cum,conv]
    simp only [mul_sum,sum_mul]; rw [← sum_add_distrib,← sum_sub_distrib,← sum_add_distrib]
    apply sum_congr rfl; intro j _; rw [hval,L_append,factor_pre,pow_succ]
    linear_combination α (j+1)*L_pre u iz k hu (a-1-j)
  have eqn (a W) := H.node a W
  simp_rw [rest,hval] at eqn
  have hb (a) := eqn a []
  simp only [L,mul_zero,zero_add,add_zero] at hb
  have ha (a) := eqn a [false]
  simp only [L,Bool.false_eq_true,ite_false,mul_one,add_zero] at ha
  let R : Recurrence X k u iz v g :=
    { α := α, β := β, p := p, q := q, w := w
      p0 := by simp [p,conv]
      q0 := by simp [q,cum]
      w0 := by simp [w,cum]
      ps := conv_succ u α
      qs := fun a => by simp [q,cum,sum_range_succ]
      ws := fun a => by simp [w,cum,sum_range_succ]
      βs := fun a => by linear_combination hb a
      αs := fun a => by
        rw [← hB]; apply mul_right_cancel₀ (right_ne_zero_of_mul_eq_one (show (1-k)*u=1 by rwa [mul_comm]))
        linear_combination ha a - hb a }
  exact ⟨R,hβ 0⟩

theorem moment_of_flags {t z : K} (ht : t≠0) (hz : z≠0) (hz' : z+1≠0) {u : S}
    (hu : u*(1-X*C t*C z)=1)
    (A : Flags (X*C t*C z) u (C z⁻¹) 1 1) (M : Flags (X*C t*C z) u (C z⁻¹) u u) :
    C z*(M.A 0 []-1) = C z*(A.A 0 []-1)+C t*(C z*(A.A 0 []-1))^2 := by
  have hk : X ∣ X*C t*C z := ⟨C t*C z,by ring⟩
  obtain ⟨α,hα⟩ := rec_of_flags A hk hu; obtain ⟨μ,hμ⟩ := rec_of_flags M hk hu
  rw [← hα,← hμ]; exact moment_of_recurrences ht hz hz' u hu α μ

end
end Conjectures.ChernFuLinThreeStatistic.Kernel
