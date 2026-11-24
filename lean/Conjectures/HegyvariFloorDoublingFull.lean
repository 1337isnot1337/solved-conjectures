import Conjectures.HegyvariFloorDoublingTower

/-!
# Hegyvári's conjecture

Candidate full statement, with the normalization and distinct-value
finite-deletion bridge made explicit. This is a proof candidate, not
a verified result: the complete dependency closure must compile and
pass the repository's axiom and independent kernel checks.

The prior tower input is the source-pinned Kohlmeyer--Kruer proof.
The new non-dyadic and odd-ratio reductions follow the repository's
existing `results/hegyvari-floor-doubling/PROOF.md`, Sections 2--4.
-/

namespace Bounty.Erdos354Formal

open Filter Topology
open scoped BigOperators

theorem hegyvari_odd_part : ∀ m : ℕ, 0 < m →
    ∃ e l : ℕ, l % 2 = 1 ∧ m = 2^e*l := by
  intro m
  induction m using Nat.strong_induction_on with
  | ind m ih =>
    intro hm
    by_cases hodd : m % 2 = 1
    · exact ⟨0,m,hodd,by simp⟩
    · obtain ⟨e,l,hl,he⟩ := ih (m/2)
        (Nat.div_lt_self hm (by decide)) (by omega)
      refine ⟨e+1,l,hl,?_⟩
      calc
        m = 2*(m/2) := by omega
        _ = 2*(2^e*l) := by rw [he]
        _ = 2^(e+1)*l := by rw [pow_succ]; ac_rfl

theorem hegyvari_dyadic_scale_iff (a : ℝ) (n : ℕ) :
    Dyadic ((2 : ℝ)^n*a) ↔ Dyadic a := by
  constructor
  · rintro ⟨k,z,h⟩
    refine ⟨k+n,z,?_⟩
    have he := (eq_div_iff (by positivity : (2 : ℝ)^k ≠ 0)).mp h
    apply (eq_div_iff (by positivity : (2 : ℝ)^(k+n) ≠ 0)).mpr
    rw [pow_add]
    calc
      a*((2 : ℝ)^k*2^n) = ((2 : ℝ)^n*a)*2^k := by ring
      _ = (z : ℝ) := he
  · rintro ⟨k,z,h⟩
    refine ⟨k,(2 : ℤ)^n*z,?_⟩
    have he := (eq_div_iff (by positivity : (2 : ℝ)^k ≠ 0)).mp h
    apply (eq_div_iff (by positivity : (2 : ℝ)^k ≠ 0)).mpr
    push_cast
    calc
      ((2 : ℝ)^n*a)*2^k = (2 : ℝ)^n*(a*2^k) := by ring
      _ = _ := by rw [he]

theorem hegyvari_dyadic_natMul {a : ℝ} (ha : Dyadic a) (l : ℕ) :
    Dyadic ((l : ℝ)*a) := by
  rcases ha with ⟨n,z,h⟩
  refine ⟨n,(l : ℤ)*z,?_⟩
  rw [h]
  push_cast
  rw [mul_div_assoc]

theorem hegyvari_nonPower_symm {a b : ℝ}
    (h : HegyvariFloorDoubling.NonPowerTwoRatio a b) :
    HegyvariFloorDoubling.NonPowerTwoRatio b a := by
  intro z hz
  apply h (-z)
  calc
    a/b = (b/a)⁻¹ := by rw [inv_div]
    _ = (2 : ℝ)^(-z) := by rw [hz, zpow_neg]

theorem hegyvari_completePair_symm {a b : ℝ} (h : CompletePair a b) :
    CompletePair b a := by
  filter_upwards [h] with z hz
  rcases hz with ⟨s,t,he⟩
  exact ⟨t,s,by simpa only [add_comm] using he⟩

/-- Independent dyadic shifts only delete initial indexed terms. -/
theorem hegyvari_completePair_of_shifts {a b : ℝ} (i j : ℕ)
    (h : CompletePair ((2 : ℝ)^i*a) ((2 : ℝ)^j*b)) : CompletePair a b := by
  classical
  filter_upwards [h] with z hz
  rcases hz with ⟨s,t,he⟩
  refine ⟨s.image (fun k => i+k),t.image (fun k => j+k),?_⟩
  rw [Finset.sum_image (fun k _ k' _ h => by omega),
    Finset.sum_image (fun k _ k' _ h => by omega)]
  simpa only [height_scale] using he

/-- When the positive quotient b/a is dyadic and not a power of two,
normalize it to an odd integer multiplier by independently shifting
the two rays. Neither parameter has to be irrational. -/
theorem hegyvari_complete_dyadic_ratio {a b : ℝ}
    (ha : 1 ≤ a) (hb : 1 ≤ b)
    (hr : HegyvariFloorDoubling.NonPowerTwoRatio a b)
    (hnd : ¬ Dyadic a ∨ ¬ Dyadic b) (hd : Dyadic (b/a)) : CompletePair a b := by
  have ha0 : 0 < a := by linarith
  have hb0 : 0 < b := by linarith
  rcases hd with ⟨k,z,hz⟩
  have h₁ : b/a*(2 : ℝ)^k = (z : ℝ) :=
    (eq_div_iff (by positivity : (2 : ℝ)^k ≠ 0)).mp hz
  have hzpos : 0 < z := by
    exact_mod_cast (show (0 : ℝ) < (z : ℝ) by rw [← h₁]; positivity)
  have hzcast : (z.toNat : ℤ) = z := Int.toNat_of_nonneg hzpos.le
  have hm : 0 < z.toNat := by omega
  obtain ⟨e,l,hodd,he⟩ := hegyvari_odd_part z.toNat hm
  have hcast : (z : ℝ) = (2 : ℝ)^e*(l : ℝ) := by
    have hzi : z = (2 : ℤ)^e*(l : ℤ) := by
      rw [← hzcast]
      exact_mod_cast he
    exact_mod_cast hzi
  have hmul : (2 : ℝ)^k*b = (l : ℝ)*((2 : ℝ)^e*a) := by
    calc
      (2 : ℝ)^k*b = (b/a*(2 : ℝ)^k)*a := by field_simp; ring
      _ = (z : ℝ)*a := by rw [h₁]
      _ = _ := by rw [hcast]; ring
  have hl : 3 ≤ l := by
    by_contra! hsmall
    have heq : l = 1 := by omega
    have hscale : (2 : ℝ)^k*b = (2 : ℝ)^e*a := by simpa [heq] using hmul
    apply hr ((k : ℤ)-(e : ℤ))
    rw [zpow_sub₀ (by norm_num : (2 : ℝ) ≠ 0), zpow_natCast, zpow_natCast]
    apply (div_eq_div_iff (ne_of_gt hb0) (by positivity : (2 : ℝ)^e ≠ 0)).mpr
    simpa only [mul_comm] using hscale.symm
  let A := (2 : ℝ)^e*a
  let B := (2 : ℝ)^k*b
  have hA : 1 ≤ A := by
    have hp : (1 : ℝ) ≤ 2^e := one_le_pow₀ (by norm_num)
    dsimp [A]
    nlinarith [mul_nonneg (sub_nonneg.mpr hp) (sub_nonneg.mpr ha)]
  have hB : 1 ≤ B := by
    have hp : (1 : ℝ) ≤ 2^k := one_le_pow₀ (by norm_num)
    dsimp [B]
    nlinarith [mul_nonneg (sub_nonneg.mpr hp) (sub_nonneg.mpr hb)]
  have hBA : B = (l : ℝ)*A := hmul
  have hnA : ¬ Dyadic A := by
    intro hdA
    have hdB : Dyadic B := by rw [hBA]; exact hegyvari_dyadic_natMul hdA l
    rcases hnd with h | h
    · exact h ((hegyvari_dyadic_scale_iff a e).mp hdA)
    · exact h ((hegyvari_dyadic_scale_iff b k).mp hdB)
  have hc : CompletePair A B :=
    completePair_of_symbolicallyDisjoint hA hB
      (hegyvari_disjoint_odd_ratio hA hB hl hodd hBA hnA)
  exact hegyvari_completePair_of_shifts e k hc

theorem hegyvari_complete_normalized {a b : ℝ} (ha : 1 ≤ a) (hb : 1 ≤ b)
    (hr : HegyvariFloorDoubling.NonPowerTwoRatio a b)
    (hnd : ¬ Dyadic a ∨ ¬ Dyadic b) : CompletePair a b := by
  by_cases hba : Dyadic (b/a)
  · exact hegyvari_complete_dyadic_ratio ha hb hr hnd hba
  · by_cases hab : Dyadic (a/b)
    · exact hegyvari_completePair_symm
        (hegyvari_complete_dyadic_ratio hb ha (hegyvari_nonPower_symm hr) hnd.symm hab)
    · exact completePair_of_symbolicallyDisjoint ha hb
        (hegyvari_disjoint_nondyadic_ratios ha hb hab hba hnd)

/-- Multiplying both positive parameters by the same integral power
of two preserves all the required hypotheses. -/
theorem hegyvari_scale_conditions {a b : ℝ} (ha : 0 < a) (hb : 0 < b)
    (hr : HegyvariFloorDoubling.NonPowerTwoRatio a b)
    (hnd : ¬ Dyadic a ∨ ¬ Dyadic b) (N : ℕ) :
    0 < (2 : ℝ)^N*a ∧ 0 < (2 : ℝ)^N*b ∧
      HegyvariFloorDoubling.NonPowerTwoRatio ((2 : ℝ)^N*a) ((2 : ℝ)^N*b) ∧
      (¬ Dyadic ((2 : ℝ)^N*a) ∨ ¬ Dyadic ((2 : ℝ)^N*b)) := by
  refine ⟨by positivity,by positivity,?_,?_⟩
  · have he : ((2 : ℝ)^N*a)/((2 : ℝ)^N*b) = a/b := by field_simp
    intro z hz
    exact hr z (he.symm.trans hz)
  · rcases hnd with h | h
    · exact Or.inl (fun hd => h ((hegyvari_dyadic_scale_iff a N).mp hd))
    · exact Or.inr (fun hd => h ((hegyvari_dyadic_scale_iff b N).mp hd))

theorem hegyvari_complete_positive {a b : ℝ} (ha : 0 < a) (hb : 0 < b)
    (hr : HegyvariFloorDoubling.NonPowerTwoRatio a b)
    (hnd : ¬ Dyadic a ∨ ¬ Dyadic b) : CompletePair a b := by
  obtain ⟨N,hA,hB⟩ := exists_common_scale ha hb
  obtain ⟨_,_,hR,hND⟩ := hegyvari_scale_conditions ha hb hr hnd N
  exact hegyvari_completePair_of_shifts N N
    (hegyvari_complete_normalized hA hB hR hND)

/-- Completeness on every common tail, with actual finite-index
witnesses, converted from the integer heights of the tower proof to
the natural-valued floor rays in the checked distinct-value bridge. -/
theorem hegyvari_indexed_tail_complete {a b : ℝ} (ha : 0 < a) (hb : 0 < b)
    (hr : HegyvariFloorDoubling.NonPowerTwoRatio a b)
    (hnd : ¬ Dyadic a ∨ ¬ Dyadic b) :
    HegyvariFloorDoubling.IndexedTailComplete
      (HegyvariFloorDoubling.floorRay a) (HegyvariFloorDoubling.floorRay b) := by
  classical
  intro N
  obtain ⟨hA,hB,hR,hND⟩ := hegyvari_scale_conditions ha hb hr hnd N
  have hc := hegyvari_complete_positive hA hB hR hND
  rcases Filter.eventually_atTop.mp hc with ⟨z₀,hz₀⟩
  refine ⟨z₀.toNat,?_⟩
  intro m hm
  have hm' : z₀ ≤ (m : ℤ) := by omega
  rcases hz₀ (m : ℤ) hm' with ⟨s,t,hst⟩
  let S := s.image (fun k => N+k)
  let T := t.image (fun k => N+k)
  have hS : ∑ i ∈ S, (HegyvariFloorDoubling.floorRay a i : ℤ) =
      ∑ i ∈ s, height ((2 : ℝ)^N*a) i := by
    dsimp [S]
    rw [Finset.sum_image (fun i _ j _ hij => by omega)]
    apply Finset.sum_congr rfl
    intro i _
    rw [hegyvari_height_cast ha.le, ← height_scale]
  have hT : ∑ i ∈ T, (HegyvariFloorDoubling.floorRay b i : ℤ) =
      ∑ i ∈ t, height ((2 : ℝ)^N*b) i := by
    dsimp [T]
    rw [Finset.sum_image (fun i _ j _ hij => by omega)]
    apply Finset.sum_congr rfl
    intro i _
    rw [hegyvari_height_cast hb.le, ← height_scale]
  have hsum : (m : ℤ) =
      ((∑ i ∈ S, HegyvariFloorDoubling.floorRay a i : ℕ) : ℤ) +
      ((∑ i ∈ T, HegyvariFloorDoubling.floorRay b i : ℕ) : ℤ) := by
    push_cast
    rw [hS,hT]
    exact hst
  have hsum' : m = (∑ i ∈ S, HegyvariFloorDoubling.floorRay a i) +
      ∑ i ∈ T, HegyvariFloorDoubling.floorRay b i := by exact_mod_cast hsum
  refine ⟨S.toList,T.toList,S.nodup_toList,T.nodup_toList,?_,?_,?_⟩
  · intro i hi
    have hmem := Finset.mem_toList.mp hi
    obtain ⟨k,_,rfl⟩ := Finset.mem_image.mp hmem
    omega
  · intro i hi
    have hmem := Finset.mem_toList.mp hi
    obtain ⟨k,_,rfl⟩ := Finset.mem_image.mp hmem
    omega
  · rw [← List.sum_toFinset _ S.nodup_toList, ← List.sum_toFinset _ T.nodup_toList]
    simpa only [Finset.toList_toFinset] using hsum'.symm

/-- Full original strong-completeness statement, expressed using lists
of forbidden values and duplicate-free lists of actual positive values. -/
theorem hegyvari_strong_complete_lists (a b : ℝ) (ha : 0 < a) (hb : 0 < b)
    (hr : HegyvariFloorDoubling.NonPowerTwoRatio a b)
    (hnd : ¬ Dyadic a ∨ ¬ Dyadic b) :
    HegyvariFloorDoubling.DistinctStrongComplete
      (HegyvariFloorDoubling.floorRay a) (HegyvariFloorDoubling.floorRay b) :=
  HegyvariFloorDoubling.floorRays_strongComplete_of_indexed ha hb hr
    (hegyvari_indexed_tail_complete ha hb hr hnd)

/-- Hegyvári's conjecture, with every finite forbidden set and every
sufficiently large integer. The selected set consists of distinct
actual floor values, not occurrences in an interleaving. -/
theorem hegyvari_strong_complete (a b : ℝ) (ha : 0 < a) (hb : 0 < b)
    (hr : ∀ z : ℤ, a/b ≠ (2 : ℝ)^z)
    (hnd : ¬ Dyadic a ∨ ¬ Dyadic b) :
    ∀ F : Finset ℕ, ∃ M : ℕ, ∀ m : ℕ, M ≤ m →
      ∃ S : Finset ℕ,
        (∀ x ∈ S, 0 < x ∧
          ((∃ i : ℕ, ⌊(2 : ℝ)^i*a⌋₊ = x) ∨ (∃ j : ℕ, ⌊(2 : ℝ)^j*b⌋₊ = x)) ∧
          x ∉ F) ∧ (∑ x ∈ S,x) = m := by
  classical
  intro F
  rcases hegyvari_strong_complete_lists a b ha hb hr hnd F.toList with ⟨M,hM⟩
  refine ⟨M,?_⟩
  intro m hm
  rcases hM m hm with ⟨values,hndup,hsum,hmem⟩
  refine ⟨values.toFinset,?_,?_⟩
  · intro x hx
    obtain ⟨⟨hpos,hval⟩,havoid⟩ := hmem x (List.mem_toFinset.mp hx)
    exact ⟨hpos,hval,fun hf => havoid (Finset.mem_toList.mpr hf)⟩
  · rw [List.sum_toFinset _ hndup]
    simpa using hsum

end Bounty.Erdos354Formal
