import Conjectures.NonmixedGapTile

namespace NonmixedGap

/-- The literal three-case formula from the note. Integer Euclidean division
handles negative `a-b` as well as positive `a-b`. -/
noncomputable def formula (a b k m : ℤ) : ℝ :=
  let s := k+m+1
  let d := (a-b)/s
  let r := (a-b)%s
  if r=0 then 1/(s:ℝ)
  else if r ≤ m then ((b+k*d:ℤ):ℝ)/((k*a+(m+1)*b:ℤ):ℝ)
  else ((a-m*(d+1):ℤ):ℝ)/(((k+1)*a+m*b:ℤ):ℝ)

theorem formula_eq_densityValue {a b k m d r : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (heq : a-b=(k+m+1)*d+r) (hr0 : 0 ≤ r) (hrs : r < k+m+1) :
    formula a b k m = densityValue a b k m d r := by
  have hs : 0 < k+m+1 := by omega
  have hd : (a-b)/(k+m+1)=d := by
    exact ((Int.ediv_emod_unique (a:=a-b) (b:=k+m+1) (q:=d) (r:=r) hs).mpr
      ⟨by nlinarith only [heq],hr0,hrs⟩).1
  have hr : (a-b)%(k+m+1)=r := by
    have hrem := Int.emod_add_mul_ediv (a-b) (k+m+1)
    rw [hd] at hrem
    nlinarith only [hrem,heq]
  unfold formula
  dsimp
  rw [hd,hr]
  by_cases hrz : r=0
  · rw [hrz] at heq ⊢
    simp only [ite_true,densityValue_zero ha hb hk hm heq]
  · simp only [hrz,ite_false,densityValue,numerator,denominator]
    split_ifs <;> rfl

/-- Natalchenko–Sagdeev's two-nonmixed-gap density formula and circle identity,
for all positive coprime integer gap lengths and arbitrary positive gap counts. -/
theorem nonmixed_gap_density (a b k m : ℤ)
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) (hcop : IsCoprime a b) :
    packingDensity a b k m = formula a b k m ∧
    circleValue a b k m = formula a b k m := by
  obtain ⟨U,V,hbez⟩ := hcop
  let s := k+m+1
  let d := (a-b)/s
  let r := (a-b)%s
  have hs : 0 < s := by dsimp [s]; omega
  have heq : a-b=(k+m+1)*d+r := by
    have hh := Int.emod_add_mul_ediv (a-b) s
    dsimp [s,d,r] at hh ⊢
    nlinarith only [hh]
  have hr0 : 0 ≤ r := Int.emod_nonneg _ (ne_of_gt hs)
  have hrs : r < k+m+1 := Int.emod_lt_of_pos _ hs
  have hformula := formula_eq_densityValue ha hb hk hm heq hr0 hrs
  rw [hformula]
  exact ⟨packingDensity_eq ha hb hk hm hbez heq hr0 hrs,
    circleValue_eq ha hb hk hm hbez heq hr0 hrs⟩

/-- A periodic set of centers attains the exact density and its translates of
the explicitly defined tile are pairwise disjoint. -/
theorem nonmixed_gap_periodic_optimum (a b k m : ℤ)
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) (hcop : IsCoprime a b) :
    ∃ (A : Set ℤ) (P : ℤ), 0 < P ∧ IsPeriodic A P ∧
      Packs A (tile a b k m) ∧ upperDensity A = formula a b k m := by
  obtain ⟨U,V,hbez⟩ := hcop
  let s := k+m+1
  let d := (a-b)/s
  let r := (a-b)%s
  have hs : 0 < s := by dsimp [s]; omega
  have heq : a-b=(k+m+1)*d+r := by
    have hh := Int.emod_add_mul_ediv (a-b) s
    dsimp [s,d,r] at hh ⊢
    nlinarith only [hh]
  have hr0 : 0 ≤ r := Int.emod_nonneg _ (ne_of_gt hs)
  have hrs : r < k+m+1 := Int.emod_lt_of_pos _ hs
  obtain ⟨A,P,hP,hperiod,hA,hvalue⟩ := exists_optimal_packing ha hb hk hm hbez heq hr0 hrs
  refine ⟨A,P,hP,hperiod,(packs_iff_avoids ha hb (le_of_lt hk) (le_of_lt hm)).mpr hA,?_⟩
  rw [formula_eq_densityValue ha hb hk hm heq hr0 hrs]
  exact hvalue

theorem nonmixed_gap_density_nat (a b k m : ℕ)
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) (hcop : Nat.Coprime a b) :
    packingDensity a b k m = formula a b k m ∧
    circleValue a b k m = formula a b k m := by
  exact nonmixed_gap_density a b k m (by exact_mod_cast ha) (by exact_mod_cast hb)
    (by exact_mod_cast hk) (by exact_mod_cast hm) hcop.isCoprime

end NonmixedGap
