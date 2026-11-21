import Conjectures.ChenKhareSahiBoundary

namespace ChenKhareSahi

theorem cancel_rectangular {f g : SymFun} (r : ℕ)
    (hf : Continuous (fun v : ℝ × ℝ × ℝ => f v.1 v.2.1 v.2.2))
    (hg : Continuous (fun v : ℝ × ℝ × ℝ => g v.1 v.2.1 v.2.2))
    (h : ∀ x y z, (x*y*z)^r * f x y z = (x*y*z)^r * g x y z) : f = g := by
  let S : Set (ℝ × ℝ × ℝ) := ({0}ᶜ : Set ℝ) ×ˢ (({0}ᶜ : Set ℝ) ×ˢ ({0}ᶜ : Set ℝ))
  have hd : Dense S := (dense_compl_singleton (0:ℝ)).prod
    ((dense_compl_singleton (0:ℝ)).prod (dense_compl_singleton (0:ℝ)))
  have heq : (fun v : ℝ × ℝ × ℝ => f v.1 v.2.1 v.2.2) =
      (fun v : ℝ × ℝ × ℝ => g v.1 v.2.1 v.2.2) := by
    apply Continuous.ext_on hd hf hg
    intro v hv
    have hx : v.1 ≠ 0 := by simpa [S] using hv.1
    have hy : v.2.1 ≠ 0 := by simpa [S] using hv.2.1
    have hz : v.2.2 ≠ 0 := by simpa [S] using hv.2.2
    exact mul_left_cancel₀ (pow_ne_zero r (mul_ne_zero (mul_ne_zero hx hy) hz)) (h _ _ _)
  funext x y z
  exact congrFun heq (x,y,z)

theorem leading_order_ge {f g : SymFun} (r n : ℕ)
    (hf : Continuous (fun v : ℝ × ℝ × ℝ => f v.1 v.2.1 v.2.2))
    (hg : Continuous (fun v : ℝ × ℝ × ℝ => g v.1 v.2.1 v.2.2))
    (hpos : 0 < g 2 1 0)
    (h : ∀ x y z, (x*y*z)^r * f x y z = (x*y*z)^n * g x y z) : r ≤ n := by
  by_contra hnot
  have hnr : n < r := by omega
  let k := r-n
  have hk : k ≠ 0 := by dsimp [k]; omega
  have hr : r = n+k := by dsimp [k]; omega
  have hpath : Continuous (fun t : ℝ => ((2:ℝ), (1:ℝ), t)) := by fun_prop
  have hgcont : Continuous (fun t : ℝ => g 2 1 t) := hg.comp hpath
  have hfcont : Continuous (fun t : ℝ => f 2 1 t) := hf.comp hpath
  have hrcont : Continuous (fun t : ℝ => (2*t)^k * f 2 1 t) := by fun_prop
  have hne : Set.EqOn (fun t : ℝ => g 2 1 t) (fun t : ℝ => (2*t)^k * f 2 1 t) ({0}ᶜ : Set ℝ) := by
    intro t ht
    have ht0 : t ≠ 0 := by simpa using ht
    have hh := h 2 1 t
    simp only [mul_one] at hh
    rw [hr, pow_add] at hh
    have hh' : (2*t)^n * ((2*t)^k * f 2 1 t) = (2*t)^n * g 2 1 t := by simpa [mul_assoc] using hh
    have hc := mul_left_cancel₀ (pow_ne_zero n (mul_ne_zero (by norm_num : (2:ℝ) ≠ 0) ht0)) hh'
    exact hc.symm
  have heq := Continuous.ext_on (dense_compl_singleton (0:ℝ)) hgcont hrcont hne
  have hzero := congrFun heq 0
  simp [hk] at hzero
  linarith

theorem FullSemiring.saturated (f : SymFun) (r : ℕ)
    (hf : Continuous (fun v : ℝ × ℝ × ℝ => f v.1 v.2.1 v.2.2))
    (h : FullSemiring (fun x y z => (x*y*z)^r * f x y z)) : FullSemiring f := by
  rcases h.leading_factor with hzero | ⟨n,g,hg,hpos,hfactor⟩
  · have heq : f = (fun _ _ _ => 0) := by
      apply cancel_rectangular r hf continuous_const
      intro x y z
      have hh := congrFun (congrFun (congrFun hzero x) y) z
      simpa using hh
    rw [heq]
    exact FullSemiring.zero
  · have horder : r ≤ n := leading_order_ge r n hf hg.continuous hpos hfactor
    let k := n-r
    have hn : n = r+k := by dsimp [k]; omega
    let v : SymFun := fun x y z => (x*y*z)^k * g x y z
    have hv : FullSemiring v := FullSemiring.mul (fullSemiring_power k) hg
    have heq : f=v := by
      apply cancel_rectangular r hf hv.continuous
      intro x y z
      have hh := hfactor x y z
      dsimp only at hh
      rw [hh,hn,pow_add]
      dsimp [v]
      ring
    rw [heq]
    exact hv


theorem realP420_continuous : Continuous (fun v : ℝ × ℝ × ℝ => realP420 v.1 v.2.1 v.2.2) := by
  unfold realP420 realMonomial realM
  fun_prop

theorem realP411_continuous : Continuous (fun v : ℝ × ℝ × ℝ => realP411 v.1 v.2.1 v.2.2) := by
  unfold realP411 realMonomial realM
  fun_prop

theorem counterexample_continuous : Continuous (fun v : ℝ × ℝ × ℝ =>
    realP420 v.1 v.2.1 v.2.2 / realP420 1 1 1 - realP411 v.1 v.2.1 v.2.2 / realP411 1 1 1) := by
  simp only [div_eq_mul_inv]
  exact (realP420_continuous.mul continuous_const).sub (realP411_continuous.mul continuous_const)

theorem rectangular_translates_nonmembership (r : ℕ) :
    ¬ FullSemiring (fun x y z => (x*y*z)^r *
      (realP420 x y z / realP420 1 1 1 - realP411 x y z / realP411 1 1 1)) := by
  intro h
  have hs := FullSemiring.saturated _ r counterexample_continuous h
  exact FullSemiring.excludes_counterexample hs


theorem orbit_card_translate (a b c r : ℕ) :
    (orbit (a+r) (b+r) (c+r)).card = (orbit a b c).card := by
  by_cases hab : a=b <;> by_cases hac : a=c <;> by_cases hbc : b=c
  all_goals simp_all [orbit]

theorem realMonomial_translate (a b c r : ℕ) (x y z : ℝ) :
    realMonomial (a+r) (b+r) (c+r) x y z = (x*y*z)^r * realMonomial a b c x y z := by
  unfold realMonomial
  rw [orbit_card_translate, realM_translate]
  ring


noncomputable def shiftedP420 (r : ℕ) (x y z : ℝ) : ℝ :=
  realMonomial (4+r) (2+r) r x y z + (11/91)*(realMonomial (4+r) (1+r) (1+r) x y z +
    realMonomial (3+r) (3+r) r x y z) + (1143098/9092629)*realMonomial (3+r) (2+r) (1+r) x y z +
      (27053496033/90189787051)*realMonomial (2+r) (2+r) (2+r) x y z

noncomputable def shiftedP411 (r : ℕ) (x y z : ℝ) : ℝ :=
  realMonomial (4+r) (1+r) (1+r) x y z + (111/991)*realMonomial (3+r) (2+r) (1+r) x y z +
    (1221/90181)*realMonomial (2+r) (2+r) (2+r) x y z

theorem shiftedP420_eq (r : ℕ) (x y z : ℝ) :
    shiftedP420 r x y z = (x*y*z)^r * realP420 x y z := by
  have ha := realMonomial_translate 4 2 0 r x y z
  have hb := realMonomial_translate 3 3 0 r x y z
  simp only [Nat.zero_add] at ha hb
  simp only [shiftedP420, realP420, ha, hb, realMonomial_translate]
  ring

theorem shiftedP411_eq (r : ℕ) (x y z : ℝ) :
    shiftedP411 r x y z = (x*y*z)^r * realP411 x y z := by
  simp only [shiftedP411, realP411, realMonomial_translate]
  ring

theorem shiftedP420_eigen (r : ℕ) (x y z : ℝ) :
    realClearedOperator (shiftedP420 r) x y z =
      ((1/10 : ℝ)^r * (1009081/1000000)) * realDelta x y z * shiftedP420 r x y z := by
  have heq : shiftedP420 r = fun x y z => (x*y*z)^r * realP420 x y z := by
    funext x y z
    exact shiftedP420_eq r x y z
  rw [heq]
  exact translate_eigenfunction realP420 _ realP420_eigen r x y z

theorem shiftedP411_eigen (r : ℕ) (x y z : ℝ) :
    realClearedOperator (shiftedP411 r) x y z =
      ((1/10 : ℝ)^r * (190081/1000000)) * realDelta x y z * shiftedP411 r x y z := by
  have heq : shiftedP411 r = fun x y z => (x*y*z)^r * realP411 x y z := by
    funext x y z
    exact shiftedP411_eq r x y z
  rw [heq]
  exact translate_eigenfunction realP411 _ realP411_eigen r x y z

theorem shifted_counterexamples (r : ℕ) :
    ¬ FullSemiring (fun x y z => shiftedP420 r x y z / shiftedP420 r 1 1 1 -
      shiftedP411 r x y z / shiftedP411 r 1 1 1) := by
  have heq : (fun x y z => shiftedP420 r x y z / shiftedP420 r 1 1 1 - shiftedP411 r x y z / shiftedP411 r 1 1 1) =
      (fun x y z => (x*y*z)^r * (realP420 x y z / realP420 1 1 1 - realP411 x y z / realP411 1 1 1)) := by
    funext x y z
    rw [shiftedP420_eq, shiftedP411_eq, shiftedP420_eq, shiftedP411_eq]
    norm_num
    ring
  rw [heq]
  exact rectangular_translates_nonmembership r

end ChenKhareSahi
