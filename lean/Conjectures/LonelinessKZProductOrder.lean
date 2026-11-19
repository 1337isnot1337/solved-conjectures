import Conjectures.LonelinessKZProductCertificate

open scoped BigOperators

namespace Loneliness.KZProduct

theorem fin_sum_prefix (d r : ℕ) (hr : r ≤ d) (t : ℕ → ℝ) :
    (∑ i : Fin d, if i.val < r then t i.val else 0) = ∑ i ∈ Finset.range r, t i := by
  rw [Fin.sum_univ_eq_sum_range (fun i => if i < r then t i else 0) d,
    ← Finset.sum_filter]
  have he : (Finset.range d).filter (fun i => i < r) = Finset.range r := by
    ext i
    simp only [Finset.mem_filter, Finset.mem_range]
    omega
  rw [he]

theorem fin_sum_at (d j : ℕ) (hj : j < d) (t : ℕ → ℝ) :
    (∑ i : Fin d, if i.val = j then t i.val else 0) = t j := by
  rw [Finset.sum_eq_single (⟨j,hj⟩ : Fin d)]
  · simp
  · intro i hi hij
    have hne : i.val ≠ j := by intro he; apply hij; exact Fin.ext he
    simp [hne]
  · simp

/-- The certificate matrix encodes exactly the stated prefix sums and KZ
adjacent-ratio inequalities. -/
theorem constraints_of_prefix_ratio {d : ℕ} (bounds : ℕ → ℕ) (D : ℕ) (t : ℕ → ℝ)
    (hprefix : ∀ r ≤ d, (bounds r : ℝ)/D ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < d → 3*t i ≤ 4*t (i+1)) :
    ∀ r : Fin (2*d), (constraintBound d bounds r : ℝ)/D ≤
      ∑ i : Fin d, (coefficient d r i : ℝ)*t i.val := by
  intro r
  by_cases hr : r.val < d
  · simp only [constraintBound,ite_eq_left hr]
    have hsum : (∑ i : Fin d, (coefficient d r i : ℝ)*t i.val) =
        ∑ i ∈ Finset.range (r.val+1), t i := by
      calc
        _ = ∑ i : Fin d, if i.val < r.val+1 then t i.val else 0 := by
          apply Finset.sum_congr rfl
          intro i hi
          by_cases hi' : i.val ≤ r.val
          · simp [coefficient,hr,hi',show i.val < r.val+1 by omega]
          · simp [coefficient,hr,hi',show ¬i.val < r.val+1 by omega]
        _ = _ := fin_sum_prefix d (r.val+1) (by omega) t
    rw [hsum]
    exact hprefix (r.val+1) (by omega)
  · simp only [constraintBound,ite_eq_right hr,Nat.cast_zero,zero_div]
    by_cases hs : r.val-d+1 < d
    · have hj : r.val-d < d := by omega
      have hsum : (∑ i : Fin d, (coefficient d r i : ℝ)*t i.val) =
          4*t (r.val-d+1)-3*t (r.val-d) := by
        calc
          _ = ∑ i : Fin d, ((if i.val=r.val-d+1 then 4*t i.val else 0) -
              (if i.val=r.val-d then 3*t i.val else 0)) := by
            apply Finset.sum_congr rfl
            intro i hi
            simp only [coefficient,ite_eq_right hr,ite_eq_left hs,Int.cast_sub,sub_mul]
            split_ifs <;> norm_num
          _ = _ := by
            rw [Finset.sum_sub_distrib,fin_sum_at d _ hs (fun i => 4*t i),
              fin_sum_at d _ hj (fun i => 3*t i)]
      rw [hsum]
      linarith [hratio (r.val-d) hs]
    · simp [coefficient,hr,hs]

/-- Lower bounds for every subset imply the prefix inequalities after
sorting. Applying the checked logarithmic prefix theorem then bounds the
product of the original, possibly nonmonotone, tuple. -/
theorem prod_le_of_subset_sums {d : ℕ} (t : Fin d → ℝ) (c : ℕ → ℝ)
    (ht : ∀ i, 0 < t i) (hc : ∀ i < d, 0 < c i)
    (hsub : ∀ s : Fin d → Bool,
      ∑ i ∈ Finset.range (selectedCount s), c i ≤
        ∑ i : Fin d, if s i then t i else 0) :
    ∏ i ∈ Finset.range d, c i ≤ ∏ i : Fin d, t i := by
  classical
  let σ := Tuple.sort t
  let x : ℕ → ℝ := fun i => if hi : i < d then t (σ ⟨i,hi⟩) else 1
  have hx : ∀ i < d, 0 < x i := by
    intro i hi
    simp only [x,dite_eq_left hi]
    exact ht _
  have hmono : MonotoneOn x (Set.Iio d) := by
    intro i hi j hj hij
    change i < d at hi
    change j < d at hj
    simp only [x,dite_eq_left hi,dite_eq_left hj]
    exact Tuple.monotone_sort t (show (⟨i,hi⟩ : Fin d) ≤ ⟨j,hj⟩ from hij)
  have hprefix : ∀ k ≤ d, ∑ i ∈ Finset.range k, c i ≤ ∑ i ∈ Finset.range k, x i := by
    intro k hk
    let e : Fin k ↪ Fin d := ⟨fun i => σ ⟨i.val,lt_of_lt_of_le i.isLt hk⟩, by
      intro i j hij
      apply Fin.ext
      exact congrArg (fun a : Fin d => a.val) (σ.injective hij)⟩
    let S : Finset (Fin d) := Finset.univ.map e
    have hcard : S.card = k := by simp [S]
    let s : Fin d → Bool := fun i => decide (i ∈ S)
    have hcount : selectedCount s = k := by simpa [selectedCount,s] using hcard
    have hselect : (∑ i : Fin d, if s i then t i else 0) = ∑ i ∈ S, t i := by
      simp only [s,decide_eq_true_eq,← Finset.sum_filter]
      simp
    have hp := hsub s
    rw [hcount,hselect] at hp
    have hright : (∑ i ∈ Finset.range k, x i) = ∑ i ∈ S, t i := by
      rw [Finset.sum_range]
      simp only [S,Finset.sum_map]
      apply Finset.sum_congr rfl
      intro i hi
      simp [x,e,lt_of_lt_of_le i.isLt hk]
      rfl
    rw [hright]
    exact hp
  have h := PrefixProduct.prod_le d x c hx hc hmono hprefix
  have he : (∏ i ∈ Finset.range d, x i) = ∏ i : Fin d, t i := by
    rw [Finset.prod_range]
    have hxe : (∏ i : Fin d, x i.val) = ∏ i : Fin d, t (σ i) := by
      apply Finset.prod_congr rfl
      intro i hi
      simp [x,i.isLt]
    rw [hxe]
    exact Fintype.prod_equiv σ _ _ (fun i => rfl)
  rwa [he] at h

end Loneliness.KZProduct
