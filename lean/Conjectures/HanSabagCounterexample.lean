import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.Algebra.Order.Star.Real
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

/-!
# Han–Sabag–Kostina–Hassibi sparse-encoder counterexample

The source problem is expressed using actual real matrices, positive
semidefinite power, positive definite Lyapunov matrices, and the original
matrix inverse. The explicit witness and a uniform lower bound for every
sparse encoder disprove sparse optimality. The same strict separation holds
on the stated open interval of channel gains. The exact infimum for every individual assignment is proved using
`assignment_lower_general`, `assignment_approximation` and `encoder_patterns`.
-/

noncomputable section

namespace Han

abbrev Mat := Matrix (Fin 2) (Fin 2) ℝ

def diag2 (a b : ℝ) : Mat := Matrix.diagonal (fun i => if i = 0 then a else b)

def B : Mat := diag2 (4/5) (3/5)
def H : Mat := diag2 (7/4) 1
def P : Mat := diag2 (1168/1323) (3/17)
def J : Mat := diag2 (211/57600) (35289/246113344)
def D : Mat := diag2 (27/100) (17/20)
def G : Mat := fun i j => if i = 0 then 1 else if j = 0 then 53/40 else 840/1961

theorem J_pos : J.PosDef := by
  apply Matrix.PosDef.diagonal
  intro i
  fin_cases i <;> norm_num [J, diag2]

theorem noise_inverse : (1 + H * P * H) * D = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [H, P, D, diag2, Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal_apply]

theorem noise_inverse_eq : (1 + H * P * H)⁻¹ = D :=
  Matrix.inv_eq_right_inv noise_inverse

theorem P_pos : P.PosDef := by
  apply Matrix.PosDef.diagonal
  intro i
  fin_cases i <;> norm_num [P, diag2]

theorem P_nonneg : P.PosSemidef := P_pos.posSemidef

theorem lyapunov : J = B * J * B - G.transpose * D * G + B * G.transpose * G * B := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [J, B, D, G, diag2, Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal_apply]

theorem lyapunov_original :
    J = B * J * B - G.transpose * (1 + H * P * H)⁻¹ * G +
      B * G.transpose * G * B := by
  rw [noise_inverse_eq]
  exact lyapunov

theorem witness_power : P.trace = 23825/22491 := by
  norm_num [Matrix.trace, P, diag2, Matrix.diagonal_apply, Fin.sum_univ_two]

def q11 (d : ℝ) : ℝ := (16 - 25*d)/9
def q22 (d : ℝ) : ℝ := (9 - 25*d)/16
def q12 (d : ℝ) : ℝ := (12 - 25*d)/13

theorem one_channel_determinant (d : ℝ) :
    q11 d * q22 d - (q12 d)^2 = (25/24336)*(1-d)*(144-625*d) := by
  simp [q11, q22, q12]
  ring

theorem same_channel_necessary (d : ℝ) (hd : d ≤ 1)
    (hdet : 0 < q11 d * q22 d - (q12 d)^2) : d < 144/625 := by
  rw [one_channel_determinant] at hdet
  by_contra h
  have h1 : 0 ≤ 1-d := by linarith
  have h2 : 144-625*d ≤ 0 := by linarith
  have h3 : (1-d)*(144-625*d) ≤ 0 := mul_nonpos_of_nonneg_of_nonpos h1 h2
  nlinarith

def noise (p q : ℝ) : Mat := diag2 (1/(1+(49/16)*p)) (1/(1+q))

theorem noise_eq_inverse (p q : ℝ) (hp : 0 ≤ p) (hq : 0 ≤ q) :
    (1 + H * diag2 p q * H)⁻¹ = noise p q := by
  apply Matrix.inv_eq_right_inv
  have hp' : 1 + (49/16 : ℝ)*p ≠ 0 := by positivity
  have hq' : 1 + q ≠ 0 := by positivity
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [H, diag2, noise, Matrix.mul_apply, Matrix.diagonal_apply] <;>
    field_simp
  all_goals ring

theorem solution_entry00 (p q : ℝ) (g j : Mat)
    (h : j = B*j*B - g.transpose*(noise p q)*g + B*g.transpose*g*B) :
    j 0 0 = g 0 0 ^ 2 * q11 (1/(1+(49/16)*p)) +
            g 1 0 ^ 2 * q11 (1/(1+q)) := by
  have hh := congrFun (congrFun h 0) 0
  simp [B, noise, diag2, Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal_apply] at hh
  dsimp [q11]
  simp only [one_div]
  nlinarith [hh]

theorem solution_entry11 (p q : ℝ) (g j : Mat)
    (h : j = B*j*B - g.transpose*(noise p q)*g + B*g.transpose*g*B) :
    j 1 1 = g 0 1 ^ 2 * q22 (1/(1+(49/16)*p)) +
            g 1 1 ^ 2 * q22 (1/(1+q)) := by
  have hh := congrFun (congrFun h 1) 1
  simp [B, noise, diag2, Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal_apply] at hh
  dsimp [q22]
  simp only [one_div]
  nlinarith [hh]

theorem solution_entry01 (p q : ℝ) (g j : Mat)
    (h : j = B*j*B - g.transpose*(noise p q)*g + B*g.transpose*g*B) :
    j 0 1 = g 0 0 * g 0 1 * q12 (1/(1+(49/16)*p)) +
            g 1 0 * g 1 1 * q12 (1/(1+q)) := by
  have hh := congrFun (congrFun h 0) 1
  simp [B, noise, diag2, Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal_apply] at hh
  dsimp [q12]
  simp only [one_div]
  nlinarith [hh]

theorem solution_entry10 (p q : ℝ) (g j : Mat)
    (h : j = B*j*B - g.transpose*(noise p q)*g + B*g.transpose*g*B) :
    j 1 0 = g 0 0 * g 0 1 * q12 (1/(1+(49/16)*p)) +
            g 1 0 * g 1 1 * q12 (1/(1+q)) := by
  have hh := congrFun (congrFun h 1) 0
  simp [B, noise, diag2, Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal_apply] at hh
  dsimp [q12]
  simp only [one_div]
  nlinarith [hh]

theorem general_entry00 (d e : ℝ) (g j : Mat)
    (h : j = B*j*B - g.transpose*(diag2 d e)*g + B*g.transpose*g*B) :
    j 0 0 = g 0 0 ^ 2 * q11 d +
            g 1 0 ^ 2 * q11 e := by
  have hh := congrFun (congrFun h 0) 0
  simp [B, diag2, Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal_apply] at hh
  dsimp [q11]
  nlinarith [hh]

theorem general_entry11 (d e : ℝ) (g j : Mat)
    (h : j = B*j*B - g.transpose*(diag2 d e)*g + B*g.transpose*g*B) :
    j 1 1 = g 0 1 ^ 2 * q22 d +
            g 1 1 ^ 2 * q22 e := by
  have hh := congrFun (congrFun h 1) 1
  simp [B, diag2, Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal_apply] at hh
  dsimp [q22]
  nlinarith [hh]

theorem general_entry01 (d e : ℝ) (g j : Mat)
    (h : j = B*j*B - g.transpose*(diag2 d e)*g + B*g.transpose*g*B) :
    j 0 1 = g 0 0 * g 0 1 * q12 d +
            g 1 0 * g 1 1 * q12 e := by
  have hh := congrFun (congrFun h 0) 1
  simp [B, diag2, Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal_apply] at hh
  dsimp [q12]
  nlinarith [hh]

theorem general_entry10 (d e : ℝ) (g j : Mat)
    (h : j = B*j*B - g.transpose*(diag2 d e)*g + B*g.transpose*g*B) :
    j 1 0 = g 0 0 * g 0 1 * q12 d +
            g 1 0 * g 1 1 * q12 e := by
  have hh := congrFun (congrFun h 1) 0
  simp [B, diag2, Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal_apply] at hh
  dsimp [q12]
  nlinarith [hh]

theorem factor_nonnegative_cancel (u v d : ℝ)
    (h : 0 < (u^2 * q11 d) * (v^2 * q22 d) -
      (u*v*q12 d)*(v*u*q12 d)) : 0 < q11 d * q22 d - q12 d^2 := by
  have hid : (u^2 * q11 d) * (v^2 * q22 d) -
      (u*v*q12 d)*(v*u*q12 d) =
      (u^2*v^2) * (q11 d * q22 d - q12 d^2) := by ring
  rw [hid] at h
  by_contra hn
  have hfac : 0 ≤ u^2*v^2 := mul_nonneg (sq_nonneg u) (sq_nonneg v)
  have hbad := mul_nonpos_of_nonneg_of_nonpos hfac (le_of_not_gt hn)
  linarith

theorem reciprocal_power_bound (p c t : ℝ) (hp : 0 ≤ p) (hc : 0 < c)
    (ht : 0 < t) (h : 1 / (1 + c*p) < t) : (1-t)/(t*c) < p := by
  have hd : 0 < 1 + c*p := by positivity
  have htc : 0 < t*c := mul_pos ht hc
  apply (div_lt_iff₀ htc).2
  have h' := (div_lt_iff₀ hd).1 h
  nlinarith

theorem q11_positive_bound (d : ℝ) (h : 0 < q11 d) : d < 16/25 := by
  dsimp [q11] at h
  linarith

theorem q22_positive_bound (d : ℝ) (h : 0 < q22 d) : d < 9/25 := by
  dsimp [q22] at h
  linarith

theorem factor_positive (u x : ℝ) (h : 0 < u^2*x) : 0 < x := by
  by_contra hn
  have hb := mul_nonpos_of_nonneg_of_nonpos (sq_nonneg u) (le_of_not_gt hn)
  linarith

theorem reciprocal_le_one (p c : ℝ) (hp : 0 ≤ p) (hc : 0 ≤ c) :
    1/(1+c*p) ≤ 1 := by
  have hc' : 0 ≤ c*p := mul_nonneg hc hp
  have hd : 0 < 1+c*p := by linarith
  apply (div_le_one₀ hd).2
  linarith

theorem sparse_inverse_cases (d e : ℝ) (g j : Mat) (hd : d ≤ 1) (he : e ≤ 1)
    (hj : j.PosDef)
    (heq : j = B*j*B - g.transpose*(diag2 d e)*g + B*g.transpose*g*B)
    (hs0 : g 0 0 = 0 ∨ g 1 0 = 0) (hs1 : g 0 1 = 0 ∨ g 1 1 = 0) :
    e < 144/625 ∨ (d < 9/25 ∧ e < 16/25) ∨
      (d < 16/25 ∧ e < 9/25) ∨ d < 144/625 := by
  have h00 := general_entry00 d e g j heq
  have h11 := general_entry11 d e g j heq
  have h01 := general_entry01 d e g j heq
  have h10 := general_entry10 d e g j heq
  have hpos00 : 0 < j 0 0 := hj.diag_pos
  have hpos11 : 0 < j 1 1 := hj.diag_pos
  have hdet := hj.det_pos
  rw [Matrix.det_fin_two] at hdet
  rcases hs0 with h00z | h10z <;> rcases hs1 with h01z | h11z
  · simp [h00z, h01z] at h00 h11 h01 h10
    rw [h00, h11, h01, h10] at hdet
    exact Or.inl (same_channel_necessary e he
      (factor_nonnegative_cancel (g 1 0) (g 1 1) e (by simpa [mul_comm] using hdet)))
  · simp [h00z, h11z] at h00 h11
    rw [h00] at hpos00
    rw [h11] at hpos11
    exact Or.inr (Or.inl ⟨q22_positive_bound _ (factor_positive _ _ hpos11),
      q11_positive_bound _ (factor_positive _ _ hpos00)⟩)
  · simp [h10z, h01z] at h00 h11
    rw [h00] at hpos00
    rw [h11] at hpos11
    exact Or.inr (Or.inr (Or.inl ⟨q11_positive_bound _ (factor_positive _ _ hpos00),
      q22_positive_bound _ (factor_positive _ _ hpos11)⟩))
  · simp [h10z, h11z] at h00 h11 h01 h10
    rw [h00, h11, h01, h10] at hdet
    exact Or.inr (Or.inr (Or.inr (same_channel_necessary d hd
      (factor_nonnegative_cancel (g 0 0) (g 0 1) d (by simpa [mul_comm] using hdet)))))

theorem sparse_lower_bound (p q : ℝ) (g j : Mat) (hp : 0 ≤ p) (hq : 0 ≤ q)
    (hj : j.PosDef)
    (heq : j = B*j*B - g.transpose*(noise p q)*g + B*g.transpose*g*B)
    (hs0 : g 0 0 = 0 ∨ g 1 0 = 0) (hs1 : g 0 1 = 0 ∨ g 1 1 = 0) :
    (481/441 : ℝ) < p+q := by
  have h00 := solution_entry00 p q g j heq
  have h11 := solution_entry11 p q g j heq
  have h01 := solution_entry01 p q g j heq
  have h10 := solution_entry10 p q g j heq
  have hpos00 : 0 < j 0 0 := hj.diag_pos
  have hpos11 : 0 < j 1 1 := hj.diag_pos
  have hdet := hj.det_pos
  rw [Matrix.det_fin_two] at hdet
  rcases hs0 with h00z | h10z <;> rcases hs1 with h01z | h11z
  · simp [h00z, h01z] at h00 h11 h01 h10
    rw [h00, h11, h01, h10] at hdet
    have hd := same_channel_necessary (1/(1+q)) (by simpa using reciprocal_le_one q 1 hq (by norm_num))
      (factor_nonnegative_cancel (g 1 0) (g 1 1) _ (by simpa [mul_comm] using hdet))
    have ht := reciprocal_power_bound q 1 (144/625) hq (by norm_num) (by norm_num) (by simpa using hd)
    norm_num at ht
    linarith
  · simp [h00z, h11z] at h00 h11
    rw [h00] at hpos00
    rw [h11] at hpos11
    have hd1 := q22_positive_bound _ (factor_positive _ _ hpos11)
    have hd2 := q11_positive_bound _ (factor_positive _ _ hpos00)
    have ht1 := reciprocal_power_bound p (49/16) (9/25) hp (by norm_num) (by norm_num) (by simpa using hd1)
    have ht2 := reciprocal_power_bound q 1 (16/25) hq (by norm_num) (by norm_num) (by simpa using hd2)
    norm_num at ht1 ht2
    linarith
  · simp [h10z, h01z] at h00 h11
    rw [h00] at hpos00
    rw [h11] at hpos11
    have hd1 := q11_positive_bound _ (factor_positive _ _ hpos00)
    have hd2 := q22_positive_bound _ (factor_positive _ _ hpos11)
    have ht1 := reciprocal_power_bound p (49/16) (16/25) hp (by norm_num) (by norm_num) (by simpa using hd1)
    have ht2 := reciprocal_power_bound q 1 (9/25) hq (by norm_num) (by norm_num) (by simpa using hd2)
    norm_num at ht1 ht2
    linarith
  · simp [h10z, h11z] at h00 h11 h01 h10
    rw [h00, h11, h01, h10] at hdet
    have hd := same_channel_necessary (1/(1+(49/16)*p))
      (reciprocal_le_one p (49/16) hp (by norm_num))
      (factor_nonnegative_cancel (g 0 0) (g 0 1) _ (by simpa [mul_comm] using hdet))
    have ht := reciprocal_power_bound p (49/16) (144/625) hp (by norm_num) (by norm_num) (by simpa using hd)
    norm_num at ht
    linarith

def Feasible (p g j : Mat) : Prop :=
  p.PosSemidef ∧ p 0 1 = 0 ∧ p 1 0 = 0 ∧ j.PosDef ∧
  j = B*j*B - g.transpose*(1+H*p*H)⁻¹*g + B*g.transpose*g*B

def Sparse (g : Mat) : Prop := ∀ i, g 0 i = 0 ∨ g 1 i = 0

theorem witness_feasible : Feasible P G J := by
  refine ⟨P_nonneg, ?_, ?_, J_pos, lyapunov_original⟩ <;>
    norm_num [P, diag2, Matrix.diagonal_apply]

theorem sparse_feasible_power (p g j : Mat) (hf : Feasible p g j) (hs : Sparse g) :
    (481/441 : ℝ) < p.trace := by
  rcases hf with ⟨hp, hp01, hp10, hj, heq⟩
  have hp0 : 0 ≤ p 0 0 := hp.diag_nonneg
  have hp1 : 0 ≤ p 1 1 := hp.diag_nonneg
  have hpdiag : p = diag2 (p 0 0) (p 1 1) := by
    ext i k
    fin_cases i <;> fin_cases k <;> simp [diag2, hp01, hp10]
  have hnoise := noise_eq_inverse (p 0 0) (p 1 1) hp0 hp1
  rw [← hpdiag] at hnoise
  rw [hnoise] at heq
  have hlower := sparse_lower_bound (p 0 0) (p 1 1) g j hp0 hp1 hj heq (hs 0) (hs 1)
  simpa [Matrix.trace, Fin.sum_univ_two] using hlower

theorem sparse_encoders_strictly_worse :
    Feasible P G J ∧ ∀ p g j, Feasible p g j → Sparse g → P.trace < p.trace := by
  refine ⟨witness_feasible, ?_⟩
  intro p g j hf hs
  have h := sparse_feasible_power p g j hf hs
  rw [witness_power]
  linarith

theorem uniform_gap : ∀ p g j, Feasible p g j → Sparse g →
    (706/22491 : ℝ) < p.trace - P.trace := by
  intro p g j hf hs
  have h := sparse_feasible_power p g j hf hs
  rw [witness_power]
  linarith

def Hvar (h : ℝ) : Mat := diag2 h 1
def Pvar (h : ℝ) : Mat := diag2 (73/(27*h^2)) (3/17)

theorem Pvar_nonneg (h : ℝ) (hh : 0 < h) : (Pvar h).PosSemidef := by
  apply Matrix.PosSemidef.diagonal
  intro i
  fin_cases i <;> positivity

theorem variable_noise_inverse (h : ℝ) (hh : 0 < h) :
    (1 + Hvar h * Pvar h * Hvar h)⁻¹ = D := by
  apply Matrix.inv_eq_right_inv
  have hne : h ≠ 0 := ne_of_gt hh
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [Hvar, Pvar, D, diag2, Matrix.mul_apply, Matrix.diagonal_apply] <;>
    field_simp
  all_goals ring

theorem general_noise_inverse (h p q : ℝ) (hp : 0 ≤ p) (hq : 0 ≤ q) :
    (1 + Hvar h * diag2 p q * Hvar h)⁻¹ =
      diag2 (1/(1+h^2*p)) (1/(1+q)) := by
  apply Matrix.inv_eq_right_inv
  have hp' : 1 + h^2*p ≠ 0 := by positivity
  have hq' : 1 + q ≠ 0 := by positivity
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [Hvar, diag2, Matrix.mul_apply, Matrix.diagonal_apply] <;>
    field_simp

theorem variable_witness (h : ℝ) (hh : 0 < h) :
    (Pvar h).PosSemidef ∧ J.PosDef ∧
    J = B*J*B - G.transpose*(1+Hvar h * Pvar h * Hvar h)⁻¹*G + B*G.transpose*G*B := by
  refine ⟨Pvar_nonneg h hh, J_pos, ?_⟩
  rw [variable_noise_inverse h hh]
  exact lyapunov

def sparseFloor (h : ℝ) : ℝ :=
  min (481/144) (min ((16/9)/(h^2)+9/16)
    (min ((9/16)/(h^2)+16/9) ((481/144)/(h^2))))

theorem dense_below_floor (h : ℝ) (hlo : (1360/567 : ℝ) < h^2)
    (hhi : h^2 < 4675/1296) : 73/(27*h^2)+3/17 < sparseFloor h := by
  have hx : 0 < h^2 := by linarith
  have hylo : (1296/4675 : ℝ) < 1/h^2 := by
    apply (lt_div_iff₀ hx).2
    nlinarith
  have hyhi : 1/h^2 < (567/1360 : ℝ) := by
    apply (div_lt_iff₀ hx).2
    nlinarith
  simp only [sparseFloor, lt_min_iff]
  repeat' constructor
  all_goals simp only [div_eq_mul_inv, mul_inv_rev] at *
  all_goals norm_num at *
  all_goals nlinarith

theorem sparse_floor_bound (h p q : ℝ) (g j : Mat) (hh : 0 < h)
    (hp : 0 ≤ p) (hq : 0 ≤ q) (hj : j.PosDef)
    (heq : j = B*j*B - g.transpose*(diag2 (1/(1+h^2*p)) (1/(1+q)))*g + B*g.transpose*g*B)
    (hs0 : g 0 0 = 0 ∨ g 1 0 = 0) (hs1 : g 0 1 = 0 ∨ g 1 1 = 0) :
    sparseFloor h ≤ p+q := by
  have hx : 0 < h^2 := sq_pos_of_pos hh
  have hcases := sparse_inverse_cases (1/(1+h^2*p)) (1/(1+q)) g j
    (reciprocal_le_one p (h^2) hp hx.le)
    (by simpa using reciprocal_le_one q 1 hq (by norm_num)) hj heq hs0 hs1
  simp only [sparseFloor, min_le_iff]
  rcases hcases with h1 | h2 | h3 | h4
  · left
    have hq' := reciprocal_power_bound q 1 (144/625) hq (by norm_num) (by norm_num) (by simpa using h1)
    norm_num at hq'
    linarith
  · right; left
    obtain ⟨h2a,h2b⟩ := h2
    have hp' := reciprocal_power_bound p (h^2) (9/25) hp hx (by norm_num) (by simpa using h2a)
    have hq' := reciprocal_power_bound q 1 (16/25) hq (by norm_num) (by norm_num) (by simpa using h2b)
    norm_num at hp' hq'
    have he : (16/25)/((9/25)*h^2) = (16/9)/(h^2) := by ring
    rw [he] at hp'
    linarith
  · right; right; left
    obtain ⟨h3a,h3b⟩ := h3
    have hp' := reciprocal_power_bound p (h^2) (16/25) hp hx (by norm_num) (by simpa using h3a)
    have hq' := reciprocal_power_bound q 1 (9/25) hq (by norm_num) (by norm_num) (by simpa using h3b)
    norm_num at hp' hq'
    have he : (9/25)/((16/25)*h^2) = (9/16)/(h^2) := by ring
    rw [he] at hp'
    linarith
  · right; right; right
    have hp' := reciprocal_power_bound p (h^2) (144/625) hp hx (by norm_num) (by simpa using h4)
    norm_num at hp'
    have he : (481/625)/((144/625)*h^2) = (481/144)/(h^2) := by ring
    rw [he] at hp'
    linarith

def FeasibleVar (h : ℝ) (p g j : Mat) : Prop :=
  p.PosSemidef ∧ p 0 1 = 0 ∧ p 1 0 = 0 ∧ j.PosDef ∧
  j = B*j*B - g.transpose*(1+Hvar h*p*Hvar h)⁻¹*g + B*g.transpose*g*B

theorem variable_witness_feasible (h : ℝ) (hh : 0 < h) : FeasibleVar h (Pvar h) G J := by
  have hw := variable_witness h hh
  refine ⟨hw.1, ?_, ?_, hw.2.1, hw.2.2⟩ <;>
    norm_num [Pvar, diag2, Matrix.diagonal_apply]

theorem variable_witness_power (h : ℝ) : (Pvar h).trace = 73/(27*h^2)+3/17 := by
  simp [Matrix.trace, Pvar, diag2, Fin.sum_univ_two]

theorem variable_sparse_floor (h : ℝ) (hh : 0 < h) (p g j : Mat)
    (hf : FeasibleVar h p g j) (hs : Sparse g) : sparseFloor h ≤ p.trace := by
  rcases hf with ⟨hp, hp01, hp10, hj, heq⟩
  have hp0 : 0 ≤ p 0 0 := hp.diag_nonneg
  have hp1 : 0 ≤ p 1 1 := hp.diag_nonneg
  have hpdiag : p = diag2 (p 0 0) (p 1 1) := by
    ext i k
    fin_cases i <;> fin_cases k <;> simp [diag2, hp01, hp10]
  have hnoise := general_noise_inverse h (p 0 0) (p 1 1) hp0 hp1
  rw [← hpdiag] at hnoise
  rw [hnoise] at heq
  have hlower := sparse_floor_bound h (p 0 0) (p 1 1) g j hh hp0 hp1 hj heq (hs 0) (hs 1)
  simpa [Matrix.trace, Fin.sum_univ_two] using hlower

theorem open_family_gap (h : ℝ) (hh : 0 < h)
    (hlo : (1360/567 : ℝ) < h^2) (hhi : h^2 < 4675/1296) :
    FeasibleVar h (Pvar h) G J ∧
    (Pvar h).trace < sparseFloor h ∧
    ∀ p g j, FeasibleVar h p g j → Sparse g → sparseFloor h ≤ p.trace := by
  refine ⟨variable_witness_feasible h hh, ?_, ?_⟩
  · rw [variable_witness_power]
    exact dense_below_floor h hlo hhi
  · intro p g j hf hs
    exact variable_sparse_floor h hh p g j hf hs

theorem concrete_gain_in_interval :
    (0 : ℝ) < 7/4 ∧ (1360/567 : ℝ) < (7/4)^2 ∧ (7/4 : ℝ)^2 < 4675/1296 := by
  norm_num

theorem concrete_variable_power : Pvar (7/4) = P := by
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [Pvar, P, diag2, Matrix.diagonal_apply]

def symmetric2 (a b c : ℝ) : Mat :=
  fun i j => if i = 0 then (if j = 0 then a else b) else (if j = 0 then b else c)

theorem symmetric2_posDef (a b c : ℝ) (ha : 0 < a) (hdet : 0 < a*c-b^2) :
    (symmetric2 a b c).PosDef := by
  rw [Matrix.posDef_iff_dotProduct_mulVec]
  constructor
  · apply Matrix.IsHermitian.ext
    intro i j
    fin_cases i <;> fin_cases j <;> simp [symmetric2]
  · intro x hx
    simp [dotProduct, Matrix.mulVec, Fin.sum_univ_two, symmetric2]
    by_cases h1 : x 1 = 0
    · have h0 : x 0 ≠ 0 := by
        intro h0
        apply hx
        funext i
        fin_cases i <;> simp [h0,h1]
      have hs : 0 < (x 0)^2 := sq_pos_of_ne_zero h0
      have ht := mul_pos ha hs
      simp [h1]
      nlinarith
    · have hs : 0 < (x 1)^2 := sq_pos_of_ne_zero h1
      have ht := mul_pos hdet hs
      have hs2 := sq_nonneg (a*x 0+b*x 1)
      nlinarith

def sameChannelEncoder : Mat := fun i _ => if i = 0 then 1 else 0

def channelJ (d : ℝ) : Mat := symmetric2 (q11 d) (q12 d) (q22 d)

theorem channelJ_pos (d : ℝ) (hd : 0 < d) (ht : d < 144/625) : (channelJ d).PosDef := by
  apply symmetric2_posDef
  · simp only [q11]
    linarith
  · rw [one_channel_determinant]
    have h1 : 0 < 1-d := by linarith
    have h2 : 0 < 144-625*d := by linarith
    positivity

theorem same_channel_solution (p q : ℝ) :
    channelJ (1/(1+(49/16)*p)) =
      B * channelJ (1/(1+(49/16)*p)) * B -
      sameChannelEncoder.transpose * noise p q * sameChannelEncoder +
      B * sameChannelEncoder.transpose * sameChannelEncoder * B := by
  ext i k
  fin_cases i <;> fin_cases k <;>
    simp [B, noise, channelJ, symmetric2, q11, q12, q22, sameChannelEncoder,
      diag2, Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal_apply] <;> ring

theorem same_channel_feasible (p : ℝ) (hp : (481/441 : ℝ) < p) :
    Feasible (diag2 p 0) sameChannelEncoder (channelJ (1/(1+(49/16)*p))) ∧
      Sparse sameChannelEncoder := by
  have hp0 : 0 ≤ p := by linarith
  have hden : 0 < 1+(49/16)*p := by positivity
  have hdpos : 0 < 1/(1+(49/16)*p) := by positivity
  have hdlt : 1/(1+(49/16)*p) < 144/625 := by
    apply (div_lt_iff₀ hden).2
    linarith
  have hpsem : (diag2 p 0).PosSemidef := by
    apply Matrix.PosSemidef.diagonal
    intro i
    fin_cases i <;> simp [hp0]
  refine ⟨⟨hpsem, ?_, ?_, channelJ_pos _ hdpos hdlt, ?_⟩, ?_⟩
  · norm_num [diag2, Matrix.diagonal_apply]
  · norm_num [diag2, Matrix.diagonal_apply]
  · rw [noise_eq_inverse p 0 hp0 (by norm_num)]
    exact same_channel_solution p 0
  · intro i
    right
    simp [sameChannelEncoder]

theorem sparse_infimum_exact :
    (∀ p g j, Feasible p g j → Sparse g → (481/441 : ℝ) ≤ p.trace) ∧
    ∀ ε : ℝ, 0 < ε → ∃ p g j, Feasible p g j ∧ Sparse g ∧ p.trace < (481/441 : ℝ)+ε := by
  constructor
  · intro p g j hf hs
    exact le_of_lt (sparse_feasible_power p g j hf hs)
  · intro ε hε
    let t : ℝ := 481/441 + ε/2
    have ht : (481/441 : ℝ) < t := by dsimp [t]; linarith
    obtain ⟨hf, hs⟩ := same_channel_feasible t ht
    refine ⟨diag2 t 0, sameChannelEncoder, channelJ (1/(1+(49/16)*t)), hf, hs, ?_⟩
    simp [Matrix.trace, diag2]
    dsimp [t]
    linarith

theorem assignment_lower_bounds (p q : ℝ) (g j : Mat) (hp : 0 ≤ p) (hq : 0 ≤ q)
    (hj : j.PosDef)
    (heq : j = B*j*B - g.transpose*(noise p q)*g + B*g.transpose*g*B) :
    (g 1 0 = 0 → g 1 1 = 0 → (481/441 : ℝ) < p+q) ∧
    (g 0 0 = 0 → g 0 1 = 0 → (481/144 : ℝ) < p+q) ∧
    (g 1 0 = 0 → g 0 1 = 0 → (865/441 : ℝ) < p+q) ∧
    (g 0 0 = 0 → g 1 1 = 0 → (8065/7056 : ℝ) < p+q) := by
  have h00 := solution_entry00 p q g j heq
  have h11 := solution_entry11 p q g j heq
  have h01 := solution_entry01 p q g j heq
  have h10 := solution_entry10 p q g j heq
  have hpos00 : 0 < j 0 0 := hj.diag_pos
  have hpos11 : 0 < j 1 1 := hj.diag_pos
  have hdet := hj.det_pos
  rw [Matrix.det_fin_two] at hdet
  constructor
  · intro hz0 hz1
    simp [hz0, hz1] at h00 h11 h01 h10
    rw [h00, h11, h01, h10] at hdet
    have hd := same_channel_necessary (1/(1+(49/16)*p))
      (reciprocal_le_one p (49/16) hp (by norm_num))
      (factor_nonnegative_cancel (g 0 0) (g 0 1) _ (by simpa [mul_comm] using hdet))
    have ht := reciprocal_power_bound p (49/16) (144/625) hp (by norm_num) (by norm_num) (by simpa using hd)
    norm_num at ht
    linarith
  constructor
  · intro hz0 hz1
    simp [hz0, hz1] at h00 h11 h01 h10
    rw [h00, h11, h01, h10] at hdet
    have hd := same_channel_necessary (1/(1+q))
      (by simpa using reciprocal_le_one q 1 hq (by norm_num))
      (factor_nonnegative_cancel (g 1 0) (g 1 1) _ (by simpa [mul_comm] using hdet))
    have ht := reciprocal_power_bound q 1 (144/625) hq (by norm_num) (by norm_num) (by simpa using hd)
    norm_num at ht
    linarith
  constructor
  · intro hz0 hz1
    simp [hz0, hz1] at h00 h11
    rw [h00] at hpos00
    rw [h11] at hpos11
    have hd1 := q11_positive_bound _ (factor_positive _ _ hpos00)
    have hd2 := q22_positive_bound _ (factor_positive _ _ hpos11)
    have ht1 := reciprocal_power_bound p (49/16) (16/25) hp (by norm_num) (by norm_num) (by simpa using hd1)
    have ht2 := reciprocal_power_bound q 1 (9/25) hq (by norm_num) (by norm_num) (by simpa using hd2)
    norm_num at ht1 ht2
    linarith
  · intro hz0 hz1
    simp [hz0, hz1] at h00 h11
    rw [h00] at hpos00
    rw [h11] at hpos11
    have hd1 := q22_positive_bound _ (factor_positive _ _ hpos11)
    have hd2 := q11_positive_bound _ (factor_positive _ _ hpos00)
    have ht1 := reciprocal_power_bound p (49/16) (9/25) hp (by norm_num) (by norm_num) (by simpa using hd1)
    have ht2 := reciprocal_power_bound q 1 (16/25) hq (by norm_num) (by norm_num) (by simpa using hd2)
    norm_num at ht1 ht2
    linarith

def encoder11 : Mat := fun i _ => if i = 1 then 1 else 0
def encoder01 : Mat := fun i k => if i = k then 1 else 0
def encoder10 : Mat := fun i k => if i = k then 0 else 1

def splitJ01 (p q : ℝ) : Mat := diag2 (q11 (1/(1+(49/16)*p))) (q22 (1/(1+q)))
def splitJ10 (p q : ℝ) : Mat := diag2 (q11 (1/(1+q))) (q22 (1/(1+(49/16)*p)))

theorem encoder11_solution (p q : ℝ) :
    channelJ (1/(1+q)) = B * channelJ (1/(1+q)) * B -
      encoder11.transpose * noise p q * encoder11 + B * encoder11.transpose * encoder11 * B := by
  ext i k
  fin_cases i <;> fin_cases k <;>
    simp [B, noise, channelJ, symmetric2, q11, q12, q22, encoder11,
      diag2, Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal_apply] <;> ring

theorem encoder01_solution (p q : ℝ) :
    splitJ01 p q = B * splitJ01 p q * B -
      encoder01.transpose * noise p q * encoder01 + B * encoder01.transpose * encoder01 * B := by
  ext i k
  fin_cases i <;> fin_cases k <;>
    simp [B, noise, splitJ01, q11, q22, encoder01,
      diag2, Matrix.mul_apply, Matrix.diagonal_apply] <;> ring

theorem encoder10_solution (p q : ℝ) :
    splitJ10 p q = B * splitJ10 p q * B -
      encoder10.transpose * noise p q * encoder10 + B * encoder10.transpose * encoder10 * B := by
  ext i k
  fin_cases i <;> fin_cases k <;>
    simp [B, noise, splitJ10, q11, q22, encoder10,
      diag2, Matrix.mul_apply, Fin.sum_univ_two, Matrix.diagonal_apply] <;> ring

theorem diag2_nonneg (p q : ℝ) (hp : 0 ≤ p) (hq : 0 ≤ q) : (diag2 p q).PosSemidef := by
  apply Matrix.PosSemidef.diagonal
  intro i
  fin_cases i <;> simp [hp, hq]

theorem feasible_of_solution (p q : ℝ) (g j : Mat) (hp : 0 ≤ p) (hq : 0 ≤ q)
    (hj : j.PosDef)
    (heq : j = B*j*B - g.transpose*(noise p q)*g + B*g.transpose*g*B) :
    Feasible (diag2 p q) g j := by
  refine ⟨diag2_nonneg p q hp hq, ?_, ?_, hj, ?_⟩
  · norm_num [diag2, Matrix.diagonal_apply]
  · norm_num [diag2, Matrix.diagonal_apply]
  · rw [noise_eq_inverse p q hp hq]
    exact heq

theorem threshold01 (p : ℝ) (hp : (9/49 : ℝ) < p) :
    0 < q11 (1/(1+(49/16)*p)) := by
  have hd : 0 < 1+(49/16)*p := by linarith
  have ht : 1/(1+(49/16)*p) < (16/25 : ℝ) := by
    apply (div_lt_iff₀ hd).2
    linarith
  dsimp [q11]
  linarith

theorem threshold10 (p : ℝ) (hp : (256/441 : ℝ) < p) :
    0 < q22 (1/(1+(49/16)*p)) := by
  have hd : 0 < 1+(49/16)*p := by linarith
  have ht : 1/(1+(49/16)*p) < (9/25 : ℝ) := by
    apply (div_lt_iff₀ hd).2
    linarith
  dsimp [q22]
  linarith

theorem threshold11 (q : ℝ) (hq : (16/9 : ℝ) < q) :
    0 < q22 (1/(1+q)) := by
  have hd : 0 < 1+q := by linarith
  have ht : 1/(1+q) < (9/25 : ℝ) := by
    apply (div_lt_iff₀ hd).2
    linarith
  dsimp [q22]
  linarith

theorem threshold00 (q : ℝ) (hq : (9/16 : ℝ) < q) :
    0 < q11 (1/(1+q)) := by
  have hd : 0 < 1+q := by linarith
  have ht : 1/(1+q) < (16/25 : ℝ) := by
    apply (div_lt_iff₀ hd).2
    linarith
  dsimp [q11]
  linarith

theorem encoder11_feasible (q : ℝ) (hq : (481/144 : ℝ) < q) :
    Feasible (diag2 0 q) encoder11 (channelJ (1/(1+q))) := by
  have hq0 : 0 ≤ q := by linarith
  have hdpos : 0 < 1/(1+q) := by positivity
  have hdlt : 1/(1+q) < 144/625 := by
    apply (div_lt_iff₀ (by linarith)).2
    linarith
  exact feasible_of_solution 0 q encoder11 (channelJ (1/(1+q))) (by norm_num) hq0
    (channelJ_pos _ hdpos hdlt) (encoder11_solution 0 q)

theorem encoder01_feasible (p q : ℝ) (hp : (9/49 : ℝ) < p) (hq : (16/9 : ℝ) < q) :
    Feasible (diag2 p q) encoder01 (splitJ01 p q) := by
  have hj : (splitJ01 p q).PosDef := by
    apply Matrix.PosDef.diagonal
    intro i
    fin_cases i
    · exact threshold01 p hp
    · exact threshold11 q hq
  exact feasible_of_solution p q encoder01 (splitJ01 p q) (by linarith) (by linarith)
    hj (encoder01_solution p q)

theorem encoder10_feasible (p q : ℝ) (hp : (256/441 : ℝ) < p) (hq : (9/16 : ℝ) < q) :
    Feasible (diag2 p q) encoder10 (splitJ10 p q) := by
  have hj : (splitJ10 p q).PosDef := by
    apply Matrix.PosDef.diagonal
    intro i
    fin_cases i
    · exact threshold00 q hq
    · exact threshold10 p hp
  exact feasible_of_solution p q encoder10 (splitJ10 p q) (by linarith) (by linarith)
    hj (encoder10_solution p q)

theorem assignment_lower_general (p g j : Mat) (hf : Feasible p g j) :
    (g 1 0 = 0 → g 1 1 = 0 → (481/441 : ℝ) < p.trace) ∧
    (g 0 0 = 0 → g 0 1 = 0 → (481/144 : ℝ) < p.trace) ∧
    (g 1 0 = 0 → g 0 1 = 0 → (865/441 : ℝ) < p.trace) ∧
    (g 0 0 = 0 → g 1 1 = 0 → (8065/7056 : ℝ) < p.trace) := by
  rcases hf with ⟨hp, hp01, hp10, hj, heq⟩
  have hp0 : 0 ≤ p 0 0 := hp.diag_nonneg
  have hp1 : 0 ≤ p 1 1 := hp.diag_nonneg
  have hpdiag : p = diag2 (p 0 0) (p 1 1) := by
    ext i k
    fin_cases i <;> fin_cases k <;> simp [diag2, hp01, hp10]
  have hnoise := noise_eq_inverse (p 0 0) (p 1 1) hp0 hp1
  rw [← hpdiag] at hnoise
  rw [hnoise] at heq
  have hlower := assignment_lower_bounds (p 0 0) (p 1 1) g j hp0 hp1 hj heq
  simpa [Matrix.trace, Fin.sum_univ_two] using hlower

theorem assignment_approximation (ε : ℝ) (hε : 0 < ε) :
    (∃ p j, Feasible p sameChannelEncoder j ∧ p.trace < (481/441 : ℝ) + ε) ∧
    (∃ p j, Feasible p encoder11 j ∧ p.trace < (481/144 : ℝ) + ε) ∧
    (∃ p j, Feasible p encoder01 j ∧ p.trace < (865/441 : ℝ) + ε) ∧
    (∃ p j, Feasible p encoder10 j ∧ p.trace < (8065/7056 : ℝ) + ε) := by
  constructor
  · let t : ℝ := 481/441 + ε/2
    have ht : (481/441 : ℝ) < t := by dsimp [t]; linarith
    refine ⟨diag2 t 0, channelJ (1/(1+(49/16)*t)), (same_channel_feasible t ht).1, ?_⟩
    simp [Matrix.trace, diag2]
    dsimp [t]
    linarith
  constructor
  · let t : ℝ := 481/144 + ε/2
    have ht : (481/144 : ℝ) < t := by dsimp [t]; linarith
    refine ⟨diag2 0 t, channelJ (1/(1+t)), encoder11_feasible t ht, ?_⟩
    simp [Matrix.trace, diag2]
    dsimp [t]
    linarith
  constructor
  · let p : ℝ := 9/49 + ε/4
    let q : ℝ := 16/9 + ε/4
    have hp : (9/49 : ℝ) < p := by dsimp [p]; linarith
    have hq : (16/9 : ℝ) < q := by dsimp [q]; linarith
    refine ⟨diag2 p q, splitJ01 p q, encoder01_feasible p q hp hq, ?_⟩
    simp [Matrix.trace, diag2]
    dsimp [p,q]
    linarith
  · let p : ℝ := 256/441 + ε/4
    let q : ℝ := 9/16 + ε/4
    have hp : (256/441 : ℝ) < p := by dsimp [p]; linarith
    have hq : (9/16 : ℝ) < q := by dsimp [q]; linarith
    refine ⟨diag2 p q, splitJ10 p q, encoder10_feasible p q hp hq, ?_⟩
    simp [Matrix.trace, diag2]
    dsimp [p,q]
    linarith

theorem encoder_patterns :
    (sameChannelEncoder 1 0 = 0 ∧ sameChannelEncoder 1 1 = 0 ∧
      sameChannelEncoder 0 0 ≠ 0 ∧ sameChannelEncoder 0 1 ≠ 0) ∧
    (encoder11 0 0 = 0 ∧ encoder11 0 1 = 0 ∧ encoder11 1 0 ≠ 0 ∧ encoder11 1 1 ≠ 0) ∧
    (encoder01 1 0 = 0 ∧ encoder01 0 1 = 0 ∧ encoder01 0 0 ≠ 0 ∧ encoder01 1 1 ≠ 0) ∧
    (encoder10 0 0 = 0 ∧ encoder10 1 1 = 0 ∧ encoder10 1 0 ≠ 0 ∧ encoder10 0 1 ≠ 0) := by
  norm_num [sameChannelEncoder, encoder11, encoder01, encoder10]

theorem power_gap : (1168/1323 : ℝ) + 3/17 = 23825/22491 ∧
    (23825/22491 : ℝ) < 481/441 := by norm_num

end Han

end
