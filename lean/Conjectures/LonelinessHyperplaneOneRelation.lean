import Conjectures.LonelinessHyperplaneDenominator

/-! A single nonzero integer relation removes one coordinate of freedom.
These exact finite-alphabet bounds are also the counting input for
uniform tails in the endpoint-density argument. -/

namespace Loneliness.Hyperplane

open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

omit [DecidableEq ι] in
theorem integerPairing_eq_single_term
    (m z : ι → ℤ) (p : ι) (hz : ∀ i, i ≠ p → z i = 0) :
    integerPairing m z = m p * z p := by
  unfold integerPairing
  apply Finset.sum_eq_single p
  · intro i _ hip
    rw [hz i hip, mul_zero]
  · simp

theorem eq_of_pairing_eq_of_eq_off
    (m : ι → ℤ) (p : ι) (hp : m p ≠ 0) (x y : ι → ℤ)
    (hm : integerPairing m x = integerPairing m y)
    (hxy : ∀ i, i ≠ p → x i = y i) : x = y := by
  have hz : ∀ i, i ≠ p → (x - y) i = 0 := by
    intro i hip
    exact sub_eq_zero.mpr (hxy i hip)
  have hpair : m p * (x p - y p) = 0 := by
    change m p * (x - y) p = 0
    rw [← integerPairing_eq_single_term m (x - y) p hz]
    rw [integerPairing_sub, hm, sub_self]
  have hxp : x p = y p := sub_eq_zero.mp ((mul_eq_zero.mp hpair).resolve_left hp)
  funext i
  by_cases hip : i = p
  · simpa only [hip] using hxp
  · exact hxy i hip

theorem card_away_from_pivot (p : ι) :
    Fintype.card {i : ι // i ≠ p} = Fintype.card ι - 1 := by
  calc
    _ = ((Finset.univ : Finset ι).erase p).card := by
      apply Fintype.card_of_subtype
      intro i
      simp
    _ = _ := by simp

/-- Arbitrary affine right-hand sides are allowed. -/
theorem one_relation_fiber_card_le
    {α : Type*} [Fintype α] [DecidableEq α]
    (a : α → ℤ) (ha : Function.Injective a)
    (m : ι → ℤ) (p : ι) (hp : m p ≠ 0) (r : ℤ) :
    (Finset.univ.filter (fun v : ι → α =>
      integerPairing m (fun i => a (v i)) = r)).card ≤
      Fintype.card α ^ (Fintype.card ι - 1) := by
  classical
  let X := {v : ι → α // integerPairing m (fun i => a (v i)) = r}
  let R : X → ({i : ι // i ≠ p} → α) := fun v i => v.1 i.1
  have hR : Function.Injective R := by
    intro x y hxy
    have heq : (fun i => a (x.1 i)) = fun i => a (y.1 i) := by
      apply eq_of_pairing_eq_of_eq_off m p hp
      · exact x.2.trans y.2.symm
      · intro i hip
        exact congrArg a (congrFun hxy ⟨i, hip⟩)
    apply Subtype.ext
    funext i
    exact ha (congrFun heq i)
  have hcard : Fintype.card X ≤ Fintype.card α ^ (Fintype.card ι - 1) := by
    calc
      _ ≤ Fintype.card ({i : ι // i ≠ p} → α) :=
        Fintype.card_le_of_injective R hR
      _ = _ := by simp [Fintype.card_pi, card_away_from_pivot p]
  simpa only [X, Fintype.card_subtype] using hcard

def positiveBoxRelation (m : ι → ℤ) (N : ℕ) : Finset (ι → Fin N) :=
  Finset.univ.filter (fun v => integerPairing m (positiveBoxCoordinates v) = 0)

theorem positiveBoxRelation_card_le
    (m : ι → ℤ) (p : ι) (hp : m p ≠ 0) (N : ℕ) :
    (positiveBoxRelation m N).card ≤ N ^ (Fintype.card ι - 1) := by
  unfold positiveBoxRelation positiveBoxCoordinates
  simpa only [Fintype.card_fin] using
    one_relation_fiber_card_le (positiveBoxEntry (N := N))
      (positiveBoxEntry_injective N) m p hp 0

theorem positiveBoxAdmissible_card_upper
    (m : ι → ℤ) (hm : PrimitiveNormal m) (N : ℕ) :
    (positiveBoxAdmissible m N).card ≤ N ^ (Fintype.card ι - 1) := by
  obtain ⟨p, hp⟩ := primitive_exists_nonzero m hm
  have hsub : positiveBoxAdmissible m N ⊆ positiveBoxRelation m N := by
    intro v hv
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, (Finset.mem_filter.mp hv).2.1⟩
  exact (Finset.card_le_card hsub).trans (positiveBoxRelation_card_le m p hp N)

omit [Fintype ι] [DecidableEq ι] in
/-- Coordinatewise division by a positive common divisor lands in the
box with the integer-divided side length. -/
theorem exists_divided_positiveBoxCoordinates
    {g N : ℕ} (hg : 0 < g) (v : ι → Fin N)
    (hdiv : ∀ i, (g : ℤ) ∣ positiveBoxCoordinates v i) :
    ∃ w : ι → Fin (N / g),
      ∀ i, positiveBoxCoordinates v i = (g : ℤ) * positiveBoxCoordinates w i := by
  have hd : ∀ i, g ∣ ((v i : ℕ) + 1) := by
    intro i
    have hi := hdiv i
    change (g : ℤ) ∣ ((v i : ℕ) : ℤ) + 1 at hi
    exact_mod_cast hi
  let q : ι → ℕ := fun i => ((v i : ℕ) + 1) / g
  have hqpos : ∀ i, 0 < q i := by
    intro i
    exact Nat.div_pos (Nat.le_of_dvd (by omega) (hd i)) hg
  have hqle : ∀ i, q i ≤ N / g := by
    intro i
    exact Nat.div_le_div_right (by have hi := (v i).isLt; omega)
  let w : ι → Fin (N / g) := fun i => ⟨q i - 1, by
    have hp := hqpos i
    have hb := hqle i
    omega⟩
  refine ⟨w, ?_⟩
  intro i
  have he : q i - 1 + 1 = q i := by have hi := hqpos i; omega
  have hmul : (v i : ℕ) + 1 = g * (q i - 1 + 1) := by
    rw [he, Nat.mul_comm]
    exact (Nat.div_mul_cancel (hd i)).symm
  change ((v i : ℕ) : ℤ) + 1 = (g : ℤ) * (((q i - 1 : ℕ) : ℤ) + 1)
  exact_mod_cast hmul

def positiveBoxDivisible (m : ι → ℤ) (g N : ℕ) : Finset (ι → Fin N) :=
  (positiveBoxRelation m N).filter
    (fun v => ∀ i, (g : ℤ) ∣ positiveBoxCoordinates v i)

/-- The bound is uniform in the divisor as well as the box size. This
is the summable tail estimate needed when only finitely many primes may
divide the divisor. -/
theorem positiveBoxDivisible_card_le
    (m : ι → ℤ) (hm : PrimitiveNormal m) (g N : ℕ) (hg : 0 < g) :
    (positiveBoxDivisible m g N).card ≤ (N / g) ^ (Fintype.card ι - 1) := by
  classical
  let X := positiveBoxDivisible m g N
  have hxdiv : ∀ x : X, ∀ i, (g : ℤ) ∣ positiveBoxCoordinates x.1 i := by
    intro x
    exact (Finset.mem_filter.mp x.2).2
  choose F hF using fun x : X => exists_divided_positiveBoxCoordinates hg x.1 (hxdiv x)
  have hFmem : ∀ x : X, F x ∈ positiveBoxRelation m (N / g) := by
    intro x
    have hxkernel : integerPairing m (positiveBoxCoordinates x.1) = 0 :=
      (Finset.mem_filter.mp (Finset.mem_filter.mp x.2).1).2
    have heq : positiveBoxCoordinates x.1 = (g : ℤ) • positiveBoxCoordinates (F x) := by
      funext i
      simpa only [Pi.smul_apply, zsmul_eq_mul, Int.cast_id] using hF x i
    rw [heq, integerPairing_smul] at hxkernel
    have hgZ : (g : ℤ) ≠ 0 := by exact_mod_cast hg.ne'
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _,
      (mul_eq_zero.mp hxkernel).resolve_left hgZ⟩
  let G : X → positiveBoxRelation m (N / g) := fun x => ⟨F x, hFmem x⟩
  have hG : Function.Injective G := by
    intro x y hxy
    apply Subtype.ext
    apply positiveBoxCoordinates_injective N
    funext i
    have hFxy : F x = F y := congrArg Subtype.val hxy
    rw [hF x i, hF y i, hFxy]
  have hcard : (positiveBoxDivisible m g N).card ≤
      (positiveBoxRelation m (N / g)).card := by
    simpa only [X, Fintype.card_coe] using Fintype.card_le_of_injective G hG
  obtain ⟨p, hp⟩ := primitive_exists_nonzero m hm
  exact hcard.trans (positiveBoxRelation_card_le m p hp (N / g))

end

end Loneliness.Hyperplane
