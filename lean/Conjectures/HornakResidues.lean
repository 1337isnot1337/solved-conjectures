import Conjectures.HornakMaximum

/-! Residue identities used by the endpoint and explicit-family arguments. -/
namespace Hornak

theorem consecutive_quotient_threshold (k h v : ℕ) (hk : 2 ≤ k) :
    k ≤ (h*k+v)/(k-1)+v ↔ k-1 ≤ h+v := by
  have hk' : 0 < k-1 := by omega
  have hk'' : k-1+1 = k := by omega
  constructor
  · intro hbound
    by_contra hsmall
    have hlt : (h*k+v)/(k-1) < h+1 := by
      apply (Nat.div_lt_iff_lt_mul hk').2
      nlinarith
    omega
  · intro hlarge
    have hle : h+1 ≤ (h*k+v)/(k-1) := by
      apply (Nat.le_div_iff_mul_le hk').2
      nlinarith
    omega

/-- Complementary capacity formula in additive form, which remains valid
when the number of smaller pieces exceeds the larger-piece quotient. -/
theorem remaining_large_capacity (x i a : ℕ) (ha : a*i ≤ x) :
    (x-a*i)/(i+1)+a = x/(i+1)+(x%(i+1)+a)/(i+1) := by
  have hpos : 0 < i+1 := by omega
  have hsub := Nat.sub_add_cancel ha
  have hsum : x+a = (x-a*i)+a*(i+1) := by nlinarith
  have hfirst : (x+a)/(i+1) = (x-a*i)/(i+1)+a := by
    rw [hsum, Nat.add_mul_div_right _ _ hpos]
  have hdiv := Nat.div_add_mod x (i+1)
  have hsum' : x+a = (x%(i+1)+a)+(i+1)*(x/(i+1)) := by nlinarith
  have hsecond : (x+a)/(i+1) = x/(i+1)+(x%(i+1)+a)/(i+1) := by
    rw [hsum', Nat.add_mul_div_left _ _ hpos]
    omega
  omega

theorem complementary_carry_le_one (i v a : ℕ) (hv : v < i+1) (ha : a ≤ i) :
    (v+a)/(i+1) ≤ 1 := by
  have h : (v+a)/(i+1) < 2 := by
    apply (Nat.div_lt_iff_lt_mul (by omega : 0 < i+1)).2
    omega
  omega

theorem complementary_carry_iff (i v a : ℕ) (hv : v < i+1) :
    1 ≤ (v+a)/(i+1) ↔ (i+1)-v ≤ a := by
  rw [Nat.le_div_iff_mul_le (by omega : 0 < i+1)]
  simp only [one_mul]
  omega

theorem fixed_small_packing_iff {α : Type*} [DecidableEq α] (s : Finset α)
    (capacity small : α → ℕ) (i b : ℕ)
    (ha : ∀ j ∈ s, small j*i ≤ capacity j) :
    (∃ large : α → ℕ, (∀ j ∈ s, small j*i + large j*(i+1) ≤ capacity j) ∧
      (∑ j ∈ s, large j) = b) ↔
    b ≤ ∑ j ∈ s, (capacity j-small j*i)/(i+1) := by
  constructor
  · rintro ⟨large,hfit,hsum⟩
    apply (allocate_iff s (fun j => (capacity j-small j*i)/(i+1)) b).1
    refine ⟨large, ?_, hsum⟩
    intro j hj
    rw [Nat.le_div_iff_mul_le (by omega : 0 < i+1)]
    have h := hfit j hj
    have hs := ha j hj
    omega
  · intro hb
    obtain ⟨large,hfit,hsum⟩ := allocate s (fun j => (capacity j-small j*i)/(i+1)) b hb
    refine ⟨large, ?_, hsum⟩
    intro j hj
    have h := (Nat.le_div_iff_mul_le (by omega : 0 < i+1)).1 (hfit j hj)
    have hs := ha j hj
    omega

theorem complementary_sum_capacity {α : Type*} (s : Finset α)
    (capacity small : α → ℕ) (i : ℕ) (ha : ∀ j ∈ s, small j*i ≤ capacity j) :
    (∑ j ∈ s, (capacity j-small j*i)/(i+1)) + (∑ j ∈ s, small j) =
      (∑ j ∈ s, capacity j/(i+1)) +
        (∑ j ∈ s, (capacity j%(i+1)+small j)/(i+1)) := by
  rw [← Finset.sum_add_distrib, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro j hj
  exact remaining_large_capacity (capacity j) i (small j) (ha j hj)

/-- A prescribed minimum in one arm can be reserved before distributing
all remaining pieces, provided the total capacity is sufficient. -/
theorem allocate_with_minimum {α : Type*} [DecidableEq α] (s : Finset α)
    (capacity : α → ℕ) (a jmin : ℕ) (j : α) (hj : j ∈ s)
    (hmin : jmin ≤ capacity j) (hma : jmin ≤ a) (htotal : a ≤ ∑ k ∈ s, capacity k) :
    ∃ used : α → ℕ, (∀ k ∈ s, used k ≤ capacity k) ∧
      (∑ k ∈ s, used k) = a ∧ jmin ≤ used j := by
  let cap' := Function.update capacity j (capacity j-jmin)
  have hcap := sum_update_balance s capacity j hj (capacity j-jmin)
  have hrest : a-jmin ≤ ∑ k ∈ s, cap' k := by
    dsimp [cap']
    omega
  obtain ⟨used, hb, hsum⟩ := allocate s cap' (a-jmin) hrest
  let out := Function.update used j (used j+jmin)
  refine ⟨out, ?_, ?_, ?_⟩
  · intro k hk
    by_cases he : k = j
    · subst k
      have hh := hb j hj
      simp only [cap', Function.update_self] at hh
      simp only [out, Function.update_self]
      omega
    · have hh := hb k hk
      simp only [cap', Function.update_of_ne he] at hh
      simp only [out, Function.update_of_ne he]
      exact hh
  · have h := sum_update_balance s used j hj (used j+jmin)
    dsimp [out]
    omega
  · simp [out]

/-- If the baseline quotient capacity suffices, no carry condition is needed. -/
theorem packing_baseline {m : ℕ} (capacity : Fin m → ℕ) (i a b : ℕ)
    (hi : 0 < i) (ha : a ≤ ∑ j, capacity j/i)
    (hb : a+b ≤ ∑ j, capacity j/(i+1)) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i + large j*(i+1) ≤ capacity j := by
  obtain ⟨small,hs,hsum⟩ := allocate Finset.univ (fun j => capacity j/i) a ha
  have hfit : ∀ j ∈ Finset.univ, small j*i ≤ capacity j := by
    intro j hj
    exact (Nat.le_div_iff_mul_le hi).1 (hs j hj)
  have hrem := complementary_sum_capacity Finset.univ capacity small i hfit
  rw [hsum] at hrem
  have hlarge : b ≤ ∑ j, (capacity j-small j*i)/(i+1) := by omega
  obtain ⟨large,hlfit,hlsum⟩ := (fixed_small_packing_iff Finset.univ capacity small i b hfit).2 hlarge
  exact ⟨small,large,hsum,hlsum,fun j => hlfit j (Finset.mem_univ j)⟩

/-- One designated carry supplies one extra larger-piece slot. -/
theorem packing_one_carry {m : ℕ} (capacity : Fin m → ℕ) (i a b : ℕ)
    (hi : 0 < i) (ha : a ≤ ∑ j, capacity j/i)
    (hb : a+b ≤ (∑ j, capacity j/(i+1))+1) (p : Fin m)
    (hmin : (i+1)-capacity p%(i+1) ≤ a)
    (hcap : (i+1)-capacity p%(i+1) ≤ capacity p/i) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i + large j*(i+1) ≤ capacity j := by
  obtain ⟨small,hs,hsum,hminimum⟩ := allocate_with_minimum Finset.univ
    (fun j => capacity j/i) a ((i+1)-capacity p%(i+1)) p (Finset.mem_univ p) hcap hmin ha
  have hfit : ∀ j ∈ Finset.univ, small j*i ≤ capacity j := by
    intro j hj
    exact (Nat.le_div_iff_mul_le hi).1 (hs j hj)
  have hv : capacity p%(i+1) < i+1 := Nat.mod_lt _ (by omega)
  have hc : 1 ≤ (capacity p%(i+1)+small p)/(i+1) :=
    (complementary_carry_iff i _ _ hv).2 hminimum
  have hcsum : 1 ≤ ∑ j, (capacity j%(i+1)+small j)/(i+1) := by
    calc
      1 ≤ (capacity p%(i+1)+small p)/(i+1) := hc
      _ ≤ ∑ j, (capacity j%(i+1)+small j)/(i+1) :=
        Finset.single_le_sum (f := fun j => (capacity j%(i+1)+small j)/(i+1))
          (fun _ _ => Nat.zero_le _) (Finset.mem_univ p)
  have hrem := complementary_sum_capacity Finset.univ capacity small i hfit
  rw [hsum] at hrem
  have hlarge : b ≤ ∑ j, (capacity j-small j*i)/(i+1) := by omega
  obtain ⟨large,hlfit,hlsum⟩ := (fixed_small_packing_iff Finset.univ capacity small i b hfit).2 hlarge
  exact ⟨small,large,hsum,hlsum,fun j => hlfit j (Finset.mem_univ j)⟩

/-- The two endpoint cases in Section 2, stated as an exact packing theorem.
The carry witness is the contribution of the arithmetic admissibility test. -/
theorem regular_endpoint_packing {m : ℕ} (capacity : Fin m → ℕ) (i a b γ : ℕ)
    (hi : 0 < i) (ha : a ≤ ∑ j, capacity j/i) (hγ : γ ≤ 1)
    (hb : a+b = (∑ j, capacity j/(i+1))+γ)
    (hcarry : γ = 1 → ∃ p : Fin m,
      (i+1)-capacity p%(i+1) ≤ a ∧
      (i+1)-capacity p%(i+1) ≤ capacity p/i) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i + large j*(i+1) ≤ capacity j := by
  by_cases hz : γ = 0
  · apply packing_baseline capacity i a b hi ha
    omega
  · have he : γ = 1 := by omega
    obtain ⟨p,hmin,hcap⟩ := hcarry he
    apply packing_one_carry capacity i a b hi ha (by omega) p hmin hcap

theorem transfer_many_fewer_large {m : ℕ} (capacity : Fin m → ℕ)
    (i a b K t : ℕ) (hi : 0 < i)
    (hbudget : (a+t*(i+1))+b+K = ∑ j, capacity j/i)
    (hfeasible : ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b+t*i ∧
      ∀ j, small j*i+large j*(i+1) ≤ capacity j) :
    ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a+t*(i+1) ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ capacity j := by
  induction t generalizing a with
  | zero => simpa using hfeasible
  | succ t ih =>
    have hintermediate : ∃ small large : Fin m → ℕ,
        (∑ j, small j) = a+i+1 ∧ (∑ j, large j) = b+t*i ∧
        ∀ j, small j*i+large j*(i+1) ≤ capacity j := by
      apply transfer_to_fewer_large capacity i a (b+t*i) (K+t) hi
      · simp only [Nat.succ_mul, Nat.mul_add, Nat.mul_one] at hbudget ⊢
        omega
      · simpa only [Nat.succ_mul, Nat.add_assoc] using hfeasible
    have hb : ((a+i+1)+t*(i+1))+b+K = ∑ j, capacity j/i := by
      simp only [Nat.succ_mul] at hbudget
      omega
    have hresult := ih (a+i+1) hb hintermediate
    simpa only [Nat.succ_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hresult

end Hornak
