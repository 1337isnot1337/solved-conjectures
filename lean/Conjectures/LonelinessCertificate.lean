import Conjectures.LonelinessMax

/-! Kernel-checkable exact loneliness values. The finite upper check is sound
for every real time by `exists_pair_sum_maximum`, not just for sampled times. -/

namespace Loneliness.PairSum

def folded (d k q : ℕ) : ℕ := min ((d*k)%q) (q-(d*k)%q)

def upperCheck (ds : List ℕ) (A B : ℕ) : Bool :=
  ds.all fun a => ds.all fun b => (List.range (a+b+1)).all fun k =>
    ds.any fun d => decide (B*folded d k (a+b) ≤ A*(a+b))

def lowerCheck (ds : List ℕ) (A B k q : ℕ) : Bool :=
  ds.all fun d => decide (A*q ≤ B*folded d k q)

theorem distance_rational (d k q : ℕ) :
    distance ((d : ℝ)*((k : ℝ)/q)) = (folded d k q : ℝ)/q := by
  rw [distance_eq_norm, UnitAddCircle.norm_eq]
  rw [← mul_div_assoc, ← Nat.cast_mul, abs_sub_round_div_natCast_eq]
  rfl

theorem upperCheck_sound (ds : List ℕ) (hD : ds.toFinset.Nonempty)
    (hcard : 1 < ds.toFinset.card) (hpos : ∀ d ∈ ds, 0 < d)
    (A B : ℕ) (hB : 0 < B) (hcheck : upperCheck ds A B = true) :
    ∀ t : ℝ, score ds.toFinset hD t ≤ (A : ℝ)/B := by
  have hp : ∀ d ∈ ds.toFinset, 0 < d := by simpa using hpos
  obtain ⟨a, ha, b, hb, _, k, hk, hmax⟩ :=
    exists_pair_sum_maximum ds.toFinset hD hcard hp
  have ha' : a ∈ ds := by simpa using ha
  have hb' : b ∈ ds := by simpa using hb
  have hc := (List.all_eq_true.mp (List.all_eq_true.mp
    (List.all_eq_true.mp hcheck a ha') b hb')) k (by simp; omega)
  obtain ⟨d, hd, hineq⟩ := List.any_eq_true.mp hc
  have hi : B*folded d k (a+b) ≤ A*(a+b) := of_decide_eq_true hineq
  have hq : 0 < a+b := by have := hp a ha; omega
  have hqr : (0 : ℝ) < (a+b : ℕ) := by exact_mod_cast hq
  have hBr : (0 : ℝ) < B := by exact_mod_cast hB
  have hbound : score ds.toFinset hD ((k : ℝ)/(a+b : ℕ)) ≤ (A : ℝ)/B := by
    apply (score_le ds.toFinset hD _ (by simpa using hd)).trans
    rw [distance_rational]
    apply (div_le_div_iff₀ hqr hBr).mpr
    exact_mod_cast (by simpa [Nat.mul_comm] using hi)
  exact fun t => (hmax t).trans hbound

theorem lowerCheck_sound (ds : List ℕ) (hD : ds.toFinset.Nonempty)
    (A B k q : ℕ) (hB : 0 < B) (hq : 0 < q)
    (hcheck : lowerCheck ds A B k q = true) :
    (A : ℝ)/B ≤ score ds.toFinset hD ((k : ℝ)/q) := by
  apply Finset.le_inf' hD
  intro d hd
  have hd' : d ∈ ds := by simpa using hd
  have hc := List.all_eq_true.mp hcheck d hd'
  have hi : A*q ≤ B*folded d k q := of_decide_eq_true hc
  rw [distance_rational]
  have hqr : (0 : ℝ) < q := by exact_mod_cast hq
  have hBr : (0 : ℝ) < B := by exact_mod_cast hB
  apply (div_le_div_iff₀ hBr hqr).mpr
  exact_mod_cast (by simpa [Nat.mul_comm] using hi)

/-- Both the exact value and its global extremality, with an explicit witness. -/
theorem certified_value (ds : List ℕ) (hD : ds.toFinset.Nonempty)
    (hcard : 1 < ds.toFinset.card) (hpos : ∀ d ∈ ds, 0 < d)
    (A B k q : ℕ) (hB : 0 < B) (hq : 0 < q)
    (hupper : upperCheck ds A B = true) (hlower : lowerCheck ds A B k q = true) :
    score ds.toFinset hD ((k : ℝ)/q) = (A : ℝ)/B ∧
      ∀ t : ℝ, score ds.toFinset hD t ≤ (A : ℝ)/B := by
  have hu := upperCheck_sound ds hD hcard hpos A B hB hupper
  exact ⟨le_antisymm (hu _) (lowerCheck_sound ds hD A B k q hB hq hlower), hu⟩

def IsExactValue (ds : List ℕ) (r : ℝ) : Prop :=
  ∃ hD : ds.toFinset.Nonempty,
    (∃ t : ℝ, score ds.toFinset hD t = r) ∧ ∀ t : ℝ, score ds.toFinset hD t ≤ r

theorem certified_exact_value (ds : List ℕ) (hD : ds.toFinset.Nonempty)
    (hcard : 1 < ds.toFinset.card) (hpos : ∀ d ∈ ds, 0 < d)
    (A B k q : ℕ) (hB : 0 < B) (hq : 0 < q)
    (hupper : upperCheck ds A B = true) (hlower : lowerCheck ds A B k q = true) :
    IsExactValue ds ((A : ℝ)/B) := by
  have hv := certified_value ds hD hcard hpos A B k q hB hq hupper hlower
  exact ⟨hD, ⟨(k : ℝ)/q, hv.1⟩, hv.2⟩

end Loneliness.PairSum
