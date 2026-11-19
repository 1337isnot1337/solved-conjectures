import Solitaire.StableCore
import Solitaire.ProfileTransfer

namespace SolitaireGeneral

theorem descent_sum_bound (z : ℕ → ℕ) (k d : ℕ)
    (hstep : ∀ i, i < k → z (i+1)+d ≤ z i) :
    ∀ r, r ≤ k → r*d+z k ≤ z (k-r) := by
  intro r
  induction r with
  | zero => simp
  | succ r ih =>
    intro hr
    have hi := ih (by omega)
    have hs := hstep (k-(r+1)) (by omega)
    have he : k-(r+1)+1=k-r := by omega
    rw [he] at hs
    nlinarith

theorem descent_triangle (z : ℕ → ℕ) (k d : ℕ)
    (hstep : ∀ i, i < k → z (i+1)+d ≤ z i) :
    k*(k+1)*d ≤ 2*(∑ i ∈ Finset.range (k+1), z i) := by
  have hle : (∑ i ∈ Finset.range (k+1), (k-i)*d) ≤
      ∑ i ∈ Finset.range (k+1), z i := by
    apply Finset.sum_le_sum
    intro i hi
    have hik : i ≤ k := by simpa using hi
    have hh := descent_sum_bound z k d hstep (k-i) (by omega)
    have he : k-(k-i)=i := by omega
    rw [he] at hh
    omega
  have hrev : (∑ i ∈ Finset.range (k+1), (k-i)) =
      ∑ i ∈ Finset.range (k+1), i := by
    simpa using Finset.sum_range_reflect (fun i : ℕ => i) (k+1)
  rw [← Finset.sum_mul,hrev] at hle
  have ht := Finset.sum_range_id_mul_two (k+1)
  simp only [Nat.add_sub_cancel] at ht
  have htd := congrArg (fun m : ℕ => m*d) ht
  nlinarith

namespace LayerRule

theorem stableLength_triangle (L : LayerRule) (j : ℕ) :
    L.stableLength j*(L.stableLength j+1) ≤ 2*L.stableMass j := by
  let ell := L.stableLength j
  have ht := descent_triangle (L.stablePile j) ell 1 (by
    intro i hi
    rw [stablePile_succ]
    have hp := L.stablePile_pos j i hi
    have hh := L.remains_lt (L.stablePile j i) hp
    omega)
  have hz := L.stablePile_zero_of_zero j ell (ell+1) (L.stableLength_zero j) (by omega)
  rw [← L.stableMass_eq_sum_range j (ell+1) hz] at ht
  simpa only [Nat.mul_one] using ht

theorem stable_column_mass (L : LayerRule) (j k : ℕ) :
    (k+1)*L.stablePile j k ≤ L.stableMass j := by
  calc
    (k+1)*L.stablePile j k = ∑ _i ∈ Finset.range (k+1), L.stablePile j k := by simp
    _ ≤ ∑ i ∈ Finset.range (k+1), L.stablePile j i := by
      apply Finset.sum_le_sum
      intro i hi
      exact L.stablePile_antitone j (by simpa using hi)
    _ ≤ L.stableMass j := L.stableMass_prefix_le j (k+1)

theorem stable_drop_mass (L : LayerRule) (j k : ℕ) (hk : 0 < k) :
    k*(k+1)*(L.stablePile j (k-1)-L.stablePile j k) ≤ 2*L.stableMass j := by
  let d := L.stablePile j (k-1)-L.stablePile j k
  have ht := descent_triangle (L.stablePile j) k d (by
    intro i hi
    have hd := L.stablePile_drop_antitone j (show i ≤ k-1 by omega)
    dsimp only at hd
    have hki : k-1+1=k := by omega
    rw [hki] at hd
    have hmono : L.stablePile j (i+1) ≤ L.stablePile j i :=
      L.stablePile_antitone j (by omega)
    dsimp [d]
    omega)
  have hp := L.stableMass_prefix_le j (k+1)
  nlinarith

theorem interlacing_column_error (L : LayerRule) (j : ℕ) (r : ℕ → ℕ)
    (hinterlace : ∀ k, L.stablePile j (k+1) ≤ r k ∧ r (k+1) ≤ L.stablePile j k)
    (k : ℕ) (hk : 0 < k) :
    |(r k : ℝ)-(L.stablePile j k : ℝ)| ≤
      2*(L.stableMass j : ℝ)/((k : ℝ)*(k+1)) := by
  let d := L.stablePile j (k-1)-L.stablePile j k
  have hlo := (hinterlace k).1
  have hhi := (hinterlace (k-1)).2
  have hki : k-1+1=k := by omega
  rw [hki] at hhi
  have hmonop := L.stablePile_antitone j (show k-1 ≤ k by omega)
  have hmonon := L.stablePile_antitone j (show k ≤ k+1 by omega)
  have hd := L.stablePile_drop_antitone j (show k-1 ≤ k by omega)
  dsimp only at hd
  rw [hki] at hd
  have hu : r k ≤ L.stablePile j k+d := by dsimp [d] at *; omega
  have hl : L.stablePile j k ≤ r k+d := by dsimp [d] at *; omega
  have hur : (r k : ℝ) ≤ (L.stablePile j k : ℝ)+d := by exact_mod_cast hu
  have hlr : (L.stablePile j k : ℝ) ≤ (r k : ℝ)+d := by exact_mod_cast hl
  have hab : |(r k : ℝ)-(L.stablePile j k : ℝ)| ≤ (d : ℝ) := by
    apply abs_le.mpr
    constructor <;> linarith
  apply hab.trans
  have hkp : (0 : ℝ) < k := by exact_mod_cast hk
  apply (le_div_iff₀ (by positivity : (0 : ℝ) < (k : ℝ)*(k+1))).mpr
  have hn := L.stable_drop_mass j k hk
  have hr : (k : ℝ)*(k+1)*(d : ℝ) ≤ 2*(L.stableMass j : ℝ) := by
    exact_mod_cast hn
  nlinarith

@[simp] theorem stableMass_one (L : LayerRule) : L.stableMass 1=1 := by
  simp [stableMass,Finset.sum_range_succ,stablePile_succ]

theorem exists_greater_mass (L : LayerRule) (n : ℕ) : ∃ j, n < L.stableMass j :=
  ⟨n+1,(Nat.lt_succ_self n).trans_le (L.le_stableMass (n+1))⟩

def referenceIndex (L : LayerRule) (n : ℕ) : ℕ :=
  Nat.find (L.exists_greater_mass n)-1

theorem reference_spec (L : LayerRule) (n : ℕ) :
    L.stableMass (L.referenceIndex n) ≤ n ∧ n < L.stableMass (L.referenceIndex n+1) := by
  let q := Nat.find (L.exists_greater_mass n)
  have hq : n < L.stableMass q := Nat.find_spec (L.exists_greater_mass n)
  have hq0 : 0 < q := by
    by_contra hh
    have hzero : q=0 := by omega
    rw [hzero,stableMass_zero] at hq
    omega
  have hprev : L.stableMass (q-1) ≤ n := by
    apply Nat.le_of_not_gt
    exact Nat.find_min (p := fun j => n < L.stableMass j)
      (L.exists_greater_mass n) (show q-1 < q by omega)
  change L.stableMass (q-1) ≤ n ∧ n < L.stableMass (q-1+1)
  rw [show q-1+1=q by omega]
  exact ⟨hprev,hq⟩

theorem referenceIndex_pos (L : LayerRule) (n : ℕ) (hn : 0 < n) :
    0 < L.referenceIndex n := by
  have hspec := (L.reference_spec n).2
  by_contra hh
  have hz : L.referenceIndex n=0 := by omega
  rw [hz] at hspec
  simp only [Nat.zero_add,stableMass_one] at hspec
  omega

theorem reference_mass_pos (L : LayerRule) (n : ℕ) (hn : 0 < n) :
    0 < L.stableMass (L.referenceIndex n) :=
  (L.referenceIndex_pos n hn).trans_le (L.le_stableMass _)

theorem referenceIndex_maximal (L : LayerRule) (n j : ℕ)
    (hj : L.stableMass j ≤ n) : j ≤ L.referenceIndex n := by
  have hnext := (L.reference_spec n).2
  by_contra hh
  have hmono := L.stableMass_monotone (show L.referenceIndex n+1 ≤ j by omega)
  omega

theorem reference_mass_gap (L : LayerRule) (n : ℕ) :
    (n : ℝ)-(L.stableMass (L.referenceIndex n) : ℝ) ≤ Real.sqrt (2*(n : ℝ)) := by
  let j := L.referenceIndex n
  have hspec := L.reference_spec n
  have hinc := L.stableMass_increment j
  have hgap : n-L.stableMass j ≤ L.stableLength j := by
    dsimp [j] at *
    omega
  have htri := L.stableLength_triangle j
  have hsqNat : (L.stableLength j)^2 ≤ 2*n := by
    dsimp [j] at *
    nlinarith
  have hsq : (L.stableLength j : ℝ)^2 ≤ 2*(n : ℝ) := by exact_mod_cast hsqNat
  have hgapr : (n : ℝ)-(L.stableMass j : ℝ) ≤ (L.stableLength j : ℝ) := by
    have hh : n ≤ L.stableMass j+L.stableLength j := by omega
    have hhr : (n : ℝ) ≤ (L.stableMass j : ℝ)+(L.stableLength j : ℝ) := by
      exact_mod_cast hh
    linarith
  exact hgapr.trans (Real.le_sqrt_of_sq_le hsq)

/-- The reference stable profile supplies every quantitative analytic input
once the actual recurrent state satisfies the two interlacing inequalities. -/
theorem reference_comparison (L : LayerRule) (n : ℕ) (hn : 0 < n) (r : ℕ → ℕ)
    (hinterlace : ∀ k, L.stablePile (L.referenceIndex n) (k+1) ≤ r k ∧
      r (k+1) ≤ L.stablePile (L.referenceIndex n) k) :
    ProfileComparison n (L.stableMass (L.referenceIndex n)) r
      (L.stablePile (L.referenceIndex n)) := {
  stable_pos := L.reference_mass_pos n hn
  stable_le := (L.reference_spec n).1
  column_error := fun k hk => L.interlacing_column_error _ r hinterlace k hk
  column_mass := fun k => L.stable_column_mass _ k
  mass_gap := L.reference_mass_gap n
}

end LayerRule
end SolitaireGeneral
