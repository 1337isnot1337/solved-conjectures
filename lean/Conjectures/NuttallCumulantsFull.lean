module

public import Conjectures.NuttallChebyshev
public import Conjectures.NuttallDominanceCombine
public import Mathlib.Data.Fin.Tuple.Sort
import all Conjectures.NuttallChebyshev
import all Conjectures.NuttallDominanceCombine
import all Conjectures.NuttallHankelTransfer
import all Conjectures.NuttallMovingBoxIntegral
import all Conjectures.NuttallMovingBoxDeterminant
import all Conjectures.NuttallVandermonde
import all Conjectures.NuttallAndreief
import all Conjectures.NuttallRepeatedTails

public section
namespace NuttallCumulants
open Filter Set Matrix MeasureTheory
open scoped Topology ContDiff

theorem thetaDerivative_contDiff (j : ℕ) : ContDiff ℝ ∞ (iteratedDeriv j thetaKernel) :=
  iteratedDeriv_contDiff_infty thetaKernel
    (fun k x => (hasDerivAt_iteratedDeriv_thetaKernel k x).differentiableAt) j

theorem signedThetaDerivative_on_ordered_tail (r : ℕ) :
    ∃ U : ℝ, 1 ≤ U ∧ ∀ n ≤ r, ∀ t : Fin n → ℝ, StrictMono t → (∀ i, U ≤ t i) →
      0 < (-1:ℝ)^(n.choose 2)*(thetaDerivativeAtNodes n t).det := by
  obtain ⟨U,hU,h⟩ := thetaHankel_eventually_signed_pos_all r
  refine ⟨U,hU,fun n hn t ht hU' => ?_⟩
  let f := fun j : Fin n => iteratedDeriv j.val thetaKernel
  have hw : AlternatingPrefixWronskians f (Ici U) := by
    intro k hk x hx
    have he : wronskianMatrix k (wronskianPrefix hk f) x = thetaHankel k x := by
      ext i j
      change iteratedDeriv i.val (iteratedDeriv j.val thetaKernel) x =
        iteratedDeriv (i.val+j.val) thetaKernel x
      rw [iteratedDeriv_iteratedDeriv_add]
    rw [he]
    exact h x hx k (hk.trans hn)
  exact alternatingPrefixWronskians_evaluation f
    ordConnected_Ici (fun j x _ => (thetaDerivative_contDiff j.val).contDiffAt) hw t ht hU'

theorem cumulantVandermonde_eq_det (n : ℕ) (x : Fin n → ℝ) :
    cumulantVandermonde n x = (Matrix.vandermonde x).det := by
  rw [Matrix.det_vandermonde]
  rfl

theorem signedCumulantIntegrand_perm (n m : ℕ) (u : ℝ) (x : Fin n → ℝ)
    (σ : Equiv.Perm (Fin n)) :
    signedCumulantIntegrand n m u (x ∘ σ) = signedCumulantIntegrand n m u x := by
  have hv : Matrix.vandermonde (x ∘ σ) = (Matrix.vandermonde x).submatrix σ id := by
    ext i j
    rfl
  have hd : thetaDerivativeMatrix n u (x ∘ σ) = (thetaDerivativeMatrix n u x).submatrix id σ := by
    ext i j
    rfl
  have hwt : (∏ i, (x ∘ σ) i^(m-n)) = ∏ i, x i^(m-n) :=
    Equiv.prod_comp σ (fun i => x i^(m-n))
  let s : ℝ := ↑(Equiv.Perm.sign σ)
  have hsign : s*s = 1 := by
    rcases Int.units_eq_one_or (Equiv.Perm.sign σ) with h | h <;> norm_num [s,h]
  unfold signedCumulantIntegrand
  rw [hwt, hd, Matrix.det_permute', cumulantVandermonde_eq_det _ (x ∘ σ), hv,
    Matrix.det_permute, ← cumulantVandermonde_eq_det n x]
  change (s*cumulantVandermonde n x)*(∏ i, x i^(m-n))*
      ((-1:ℝ)^(n.choose 2)*(s*(thetaDerivativeMatrix n u x).det)) = _
  calc
    _ = (s*s)*(cumulantVandermonde n x*(∏ i, x i^(m-n))*
      ((-1:ℝ)^(n.choose 2)*(thetaDerivativeMatrix n u x).det)) := by ring
    _ = _ := by rw [hsign, one_mul]

theorem cumulantVandermonde_eq_zero_of_not_injective (n : ℕ) (x : Fin n → ℝ)
    (h : ¬Function.Injective x) : cumulantVandermonde n x = 0 := by
  obtain ⟨i,j,hij,hne⟩ := Function.not_injective_iff.mp h
  rw [cumulantVandermonde_eq_det]
  apply Matrix.det_zero_of_row_eq hne
  funext k
  simp [Matrix.vandermonde_apply,hij]

theorem thetaTailIntegrandSign_exists (n : ℕ) :
    ∃ U : ℝ, 1 ≤ U ∧ ThetaTailIntegrandSign n U := by
  obtain ⟨U,hU,h⟩ := signedThetaDerivative_on_ordered_tail n
  refine ⟨U,hU,?_⟩
  intro m hm u hu x hx htail
  by_cases hi : Function.Injective x
  · let σ : Equiv.Perm (Fin n) := Tuple.sort x
    let z : Fin n → ℝ := x ∘ σ
    have hz : StrictMono z := (Tuple.monotone_sort x).strictMono_of_injective (hi.comp σ.injective)
    have hzpos (i : Fin n) : 0 < z i := hx (σ i)
    have ht : StrictMono (fun i => u+z i) := fun i j hij => by simpa only [add_comm u] using add_lt_add_left (hz hij) u
    have he := h n le_rfl (fun i => u+z i) ht (fun i => htail (σ i))
    rw [thetaDerivativeAtNodes_det_eq_integrand_matrix] at he
    have hv : 0 < cumulantVandermonde n z := by
      unfold cumulantVandermonde
      exact Finset.prod_pos fun i _ => Finset.prod_pos fun j hj =>
        sub_pos.mpr (hz (Finset.mem_Ioi.mp hj))
    have hw : 0 < ∏ i, z i^(m-n) :=
      Finset.prod_pos fun i _ => pow_pos (hzpos i) _
    have hp : 0 < signedCumulantIntegrand n m u z := mul_pos (mul_pos hv hw) he
    change 0 < signedCumulantIntegrand n m u (x ∘ σ) at hp
    rw [signedCumulantIntegrand_perm] at hp
    exact ⟨hp.le,fun _ => hp⟩
  · have he : signedCumulantIntegrand n m u x = 0 := by
      unfold signedCumulantIntegrand
      rw [cumulantVandermonde_eq_zero_of_not_injective n x hi, zero_mul, zero_mul]
    exact ⟨he.ge, fun h' => (hi h').elim⟩

theorem signedCumulantHankel_eventually_pos (n : ℕ) :
    ∀ᶠ m : ℕ in atTop, ∀ u : ℝ, 0 ≤ u →
      0 < (-1:ℝ)^(n.choose 2)*(cumulantHankel m n u).det := by
  by_cases hn : 1 ≤ n
  · obtain ⟨U,hU,h⟩ := thetaTailIntegrandSign_exists n
    exact signedCumulantHankel_eventually_pos_of_tail n hn hU h
  · have hz : n = 0 := by omega
    subst n
    exact Filter.Eventually.of_forall (fun m u _ => by simp)

theorem signedCumulantHankel_eventually_pos_all (r : ℕ) :
    ∀ᶠ m : ℕ in atTop, ∀ n ≤ r, ∀ u : ℝ, 0 ≤ u →
      0 < (-1:ℝ)^(n.choose 2)*(cumulantHankel m n u).det := by
  have h : ∀ᶠ m : ℕ in atTop, ∀ n : Fin (r+1), ∀ u : ℝ, 0 ≤ u →
      0 < (-1:ℝ)^(n.val.choose 2)*(cumulantHankel m n.val u).det :=
    Filter.eventually_all.2 (fun n => signedCumulantHankel_eventually_pos n.val)
  exact h.mono fun m hm n hn => hm ⟨n,Nat.lt_succ_of_le hn⟩


theorem repeatedTail_differentiable_iteratedDeriv (m j : ℕ) :
    Differentiable ℝ (iteratedDeriv j (repeatedTail m)) := by
  induction m generalizing j with
  | zero =>
    exact (thetaDerivative_contDiff j).differentiable (by simp)
  | succ m ih =>
    cases j with
    | zero =>
      rw [iteratedDeriv_zero]
      exact fun x => (hasDerivAt_repeatedTail_succ m x).differentiableAt
    | succ j =>
      have he : deriv (repeatedTail (m+1)) = -(repeatedTail m) := by
        funext t
        exact (hasDerivAt_repeatedTail_succ m t).deriv
      rw [iteratedDeriv_succ',he]
      have hf : iteratedDeriv j (-(repeatedTail m)) = -(iteratedDeriv j (repeatedTail m)) :=
        funext fun t => iteratedDeriv_neg j (repeatedTail m) t
      rw [hf]
      exact (ih j).neg

noncomputable def squareDerivativeMatrix (n : ℕ) (f : ℝ → ℝ) (t : ℝ) :
    Matrix (Fin n) (Fin n) ℝ :=
  Matrix.of fun i j => iteratedDeriv (i.val+j.val) f t

theorem theta_style_derivative_evaluation_of_hankel (n : ℕ) (f : ℝ → ℝ)
    (hf : ∀ j : ℕ, Differentiable ℝ (iteratedDeriv j f))
    (h : ∀ k ≤ n, ∀ t : ℝ, 0 ≤ t → 0 < (-1:ℝ)^(k.choose 2)*(squareDerivativeMatrix k f t).det)
    (t : Fin n → ℝ) (ht : StrictMono t) (ht0 : ∀ i, 0 ≤ t i) :
    0 < (-1:ℝ)^(n.choose 2)*(evaluationMatrix n (fun j => iteratedDeriv j.val f) t).det := by
  have hw : AlternatingPrefixWronskians (fun j : Fin n => iteratedDeriv j.val f) (Ici 0) := by
    intro k hk x hx
    have he : wronskianMatrix k (wronskianPrefix hk (fun j : Fin n => iteratedDeriv j.val f)) x =
        squareDerivativeMatrix k f x := by
      ext i j
      change iteratedDeriv i.val (iteratedDeriv j.val f) x = iteratedDeriv (i.val+j.val) f x
      rw [iteratedDeriv_iteratedDeriv_add]
    rw [he]
    exact h k hk x hx
  exact alternatingPrefixWronskians_evaluation _
    ordConnected_Ici (fun j x _ => (iteratedDeriv_contDiff_infty f hf j.val).contDiffAt) hw t ht ht0

noncomputable def orderedAdditionMatrix (n : ℕ) (f : ℝ → ℝ) (x y : Fin n → ℝ) :
    Matrix (Fin n) (Fin n) ℝ := Matrix.of fun i j => f (x i+y j)

/-- Applying the signed evaluation criterion twice gives signs for all
ordered distinct samples of an additive kernel. -/
theorem signed_addition_determinant_of_hankel (n : ℕ) (f : ℝ → ℝ)
    (hf : ∀ j : ℕ, Differentiable ℝ (iteratedDeriv j f))
    (h : ∀ k ≤ n, ∀ t : ℝ, 0 ≤ t → 0 < (-1:ℝ)^(k.choose 2)*(squareDerivativeMatrix k f t).det)
    (x y : Fin n → ℝ) (hx : StrictMono x) (hy : StrictMono y)
    (hx0 : ∀ i, 0 ≤ x i) (hy0 : ∀ i, 0 ≤ y i) :
    0 < (-1:ℝ)^(n.choose 2)*(orderedAdditionMatrix n f x y).det := by
  let F : Fin n → ℝ → ℝ := fun i t => f (x i+t)
  have hw : AlternatingPrefixWronskians F (Ici 0) := by
    intro k hk u hu
    let t : Fin k → ℝ := fun i => x (Fin.castLE hk i)+u
    have ht : StrictMono t := by
      intro i j hij
      exact add_lt_add_left (hx (show Fin.castLE hk i < Fin.castLE hk j from hij)) u
    have ht0 (i : Fin k) : 0 ≤ t i := add_nonneg (hx0 _) hu
    have he : wronskianMatrix k (wronskianPrefix hk F) u =
        (evaluationMatrix k (fun j => iteratedDeriv j.val f) t).transpose := by
      ext i j
      change iteratedDeriv i.val (fun v => f (x (Fin.castLE hk j)+v)) u = iteratedDeriv i.val f (t j)
      rw [iteratedDeriv_comp_const_add]
    rw [he,Matrix.det_transpose]
    exact theta_style_derivative_evaluation_of_hankel k f hf (fun i hi => h i (hi.trans hk)) t ht ht0
  have hCf : ContDiff ℝ ∞ f := by
    simpa only [iteratedDeriv_zero] using iteratedDeriv_contDiff_infty f hf 0
  have hC (j : Fin n) (t : ℝ) (_ : t ∈ Ici 0) : ContDiffAt ℝ ∞ (F j) t :=
    (hCf.comp (contDiff_const.add contDiff_id)).contDiffAt
  have hm : orderedAdditionMatrix n f x y = (evaluationMatrix n F y).transpose := rfl
  rw [hm,Matrix.det_transpose]
  exact alternatingPrefixWronskians_evaluation F ordConnected_Ici hC hw y hy hy0

/-- Eventual strict sign-reverse regularity of the literal Nuttall cumulant
kernel, with one cumulant threshold for every determinant order up to r. -/
theorem nuttall_cumulants_eventually_strict_sign_reverse (r : ℕ) :
    ∀ᶠ m : ℕ in atTop, ∀ n ≤ r, ∀ x y : Fin n → ℝ,
      StrictMono x → StrictMono y → (∀ i, 0 ≤ x i) → (∀ i, 0 ≤ y i) →
        0 < (-1:ℝ)^(n.choose 2)*(orderedAdditionMatrix n (repeatedTail m) x y).det := by
  filter_upwards [signedCumulantHankel_eventually_pos_all r] with m hm
  intro n hn x y hx hy hx0 hy0
  exact signed_addition_determinant_of_hankel n (repeatedTail m)
    (repeatedTail_differentiable_iteratedDeriv m) (fun k hk => hm k (hk.trans hn))
    x y hx hy hx0 hy0

theorem nuttall_cumulants_conjecture (r : ℕ) :
    ∃ M : ℕ, ∀ m ≥ M, ∀ n ≤ r, ∀ x y : Fin n → ℝ,
      StrictMono x → StrictMono y → (∀ i, 0 ≤ x i) → (∀ i, 0 ≤ y i) →
        0 < (-1:ℝ)^(n.choose 2)*(orderedAdditionMatrix n (repeatedTail m) x y).det :=
  Filter.eventually_atTop.mp (nuttall_cumulants_eventually_strict_sign_reverse r)


/-- Nuttall's sign-reverse regularity through order r, on nonnegative nodes. -/
def NuttallRRUpTo (r m : ℕ) : Prop :=
  ∀ n ≤ r, ∀ x y : Fin n → ℝ, StrictMono x → StrictMono y →
    (∀ i, 0 ≤ x i) → (∀ i, 0 ≤ y i) →
    0 < (-1:ℝ)^(n.choose 2)*(orderedAdditionMatrix n (repeatedTail m) x y).det

/-- Conjecture 1, §4.5 of Nuttall: there is a least cumulant index attaining
sign-reverse regularity through any prescribed finite order. -/
theorem nuttall_cumulants_least_order (r : ℕ) :
    ∃ m : ℕ, NuttallRRUpTo r m ∧ ∀ j : ℕ, NuttallRRUpTo r j → m ≤ j := by
  classical
  have he : ∃ m : ℕ, NuttallRRUpTo r m := by
    obtain ⟨M,hM⟩ := nuttall_cumulants_conjecture r
    exact ⟨M,hM M le_rfl⟩
  exact ⟨Nat.find he, Nat.find_spec he, fun _ hj => Nat.find_min' he hj⟩

end NuttallCumulants
