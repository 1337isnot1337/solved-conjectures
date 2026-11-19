import Conjectures.LonelinessPrimeFilteringCorollaryThree
import Conjectures.LonelinessPrimeFilteringValuation
import Conjectures.LonelinessModularWitness

/-!
# Runner consequences of partial filtering and a uniform divisibility level

Corollary 3's folded-distance conclusion gives a genuine modular witness
and a lower bound for the actual real-time loneliness value. Positive
inputs can use their canonical `padicValNat` levels.

Separately, any number of inputs at one exact power-divisibility level
already has the required witness at numerator one. This elementary case
has no level-cardinality cap and does not require the modulus base to be
prime. It includes the upper distance boundary omitted by forbidding the
two extreme top digits.
-/

namespace Loneliness.PrimeFiltering

/-- Natural folded-distance bounds on a power grid give the repository's
actual modular witness. -/
theorem witness_of_prime_power_folded_lower {p m a : ℕ} (ds : List ℕ)
    (hfolded : ∀ d ∈ ds, p ^ m ≤ Modular.folded (p ^ (m + 1)) (a * d)) :
    Modular.Witness p (p ^ (m + 1)) a ds := by
  intro d hd
  calc
    p ^ (m + 1) = p * p ^ m := by rw [pow_succ, mul_comm]
    _ ≤ p * Modular.folded (p ^ (m + 1)) (a * d) :=
      Nat.mul_le_mul_left p (hfolded d hd)

/-- The seeded partial-filtering distance theorem gives a coprime modular
runner witness while retaining all higher input residues. -/
theorem corollary_three_witness_of_coprime_seed {p m r : ℕ} [Fact p.Prime]
    (ds : List ℕ) (level : ℕ → ℕ) (hrm : r < m)
    (hdiv : ∀ d ∈ ds, p ^ level d ∣ d)
    (hnext : ∀ d ∈ ds, ¬ p ^ (level d + 1) ∣ d)
    (hcount : ∀ j ≤ r,
      (ds.toFinset.filter (fun d => level d = j)).card ≤ (p - 1) / 2)
    (a : ℕ) (ha : Nat.Coprime a (p ^ (m + 1)))
    (hhigher : ∀ d ∈ ds, r < level d →
      p ^ m ≤ Modular.folded (p ^ (m + 1)) (a * d)) :
    ∃ b : ℕ, Nat.Coprime b (p ^ (m + 1)) ∧
      Modular.Witness p (p ^ (m + 1)) b ds ∧
      ∀ x : ℕ, p ^ (r + 1) ∣ x →
        (b * x) % p ^ (m + 1) = (a * x) % p ^ (m + 1) := by
  obtain ⟨b, hb, hbfolded, hbpreserve⟩ := corollary_three_distance_of_coprime_seed
    ds.toFinset id level hrm
    (fun d hd => hdiv d (List.mem_toFinset.mp hd))
    (fun d hd => hnext d (List.mem_toFinset.mp hd)) hcount a ha
    (fun d hd hhigh => hhigher d (List.mem_toFinset.mp hd) hhigh)
  refine ⟨b, hb, ?_, hbpreserve⟩
  exact witness_of_prime_power_folded_lower ds
    (fun d hd => hbfolded d (List.mem_toFinset.mpr hd))

/-- The seeded partial-filtering hypotheses bound the actual real supremum. -/
theorem corollary_three_value_of_coprime_seed {p m r : ℕ} [Fact p.Prime]
    (ds : List ℕ) (level : ℕ → ℕ) (hrm : r < m)
    (hdiv : ∀ d ∈ ds, p ^ level d ∣ d)
    (hnext : ∀ d ∈ ds, ¬ p ^ (level d + 1) ∣ d)
    (hcount : ∀ j ≤ r,
      (ds.toFinset.filter (fun d => level d = j)).card ≤ (p - 1) / 2)
    (a : ℕ) (ha : Nat.Coprime a (p ^ (m + 1)))
    (hhigher : ∀ d ∈ ds, r < level d →
      p ^ m ≤ Modular.folded (p ^ (m + 1)) (a * d)) :
    (1 : ℝ) / p ≤ Loneliness.value ds := by
  obtain ⟨b, _hb, hw, _hpreserve⟩ := corollary_three_witness_of_coprime_seed
    ds level hrm hdiv hnext hcount a ha hhigher
  exact Modular.witness_value_lower (Fact.out : p.Prime).two_le
    (pow_pos (Fact.out : p.Prime).pos _) hw

/-- Actual p-adic valuations discharge the exact-level hypotheses in the
seeded partial-filtering witness. The supplied power grid remains explicit. -/
theorem corollary_three_witness_padic_of_coprime_seed {p m r : ℕ} [Fact p.Prime]
    (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d) (hrm : r < m)
    (hcount : ∀ j ≤ r,
      (ds.toFinset.filter (fun d => padicValNat p d = j)).card ≤ (p - 1) / 2)
    (a : ℕ) (ha : Nat.Coprime a (p ^ (m + 1)))
    (hhigher : ∀ d ∈ ds, r < padicValNat p d →
      p ^ m ≤ Modular.folded (p ^ (m + 1)) (a * d)) :
    ∃ b : ℕ, Nat.Coprime b (p ^ (m + 1)) ∧
      Modular.Witness p (p ^ (m + 1)) b ds ∧
      ∀ x : ℕ, p ^ (r + 1) ∣ x →
        (b * x) % p ^ (m + 1) = (a * x) % p ^ (m + 1) :=
  corollary_three_witness_of_coprime_seed ds (padicValNat p) hrm
    (fun d hd => (padic_level_exact (p := p) (hpos d hd)).1)
    (fun d hd => (padic_level_exact (p := p) (hpos d hd)).2) hcount a ha hhigher

theorem corollary_three_value_padic_of_coprime_seed {p m r : ℕ} [Fact p.Prime]
    (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d) (hrm : r < m)
    (hcount : ∀ j ≤ r,
      (ds.toFinset.filter (fun d => padicValNat p d = j)).card ≤ (p - 1) / 2)
    (a : ℕ) (ha : Nat.Coprime a (p ^ (m + 1)))
    (hhigher : ∀ d ∈ ds, r < padicValNat p d →
      p ^ m ≤ Modular.folded (p ^ (m + 1)) (a * d)) :
    (1 : ℝ) / p ≤ Loneliness.value ds := by
  obtain ⟨b, _hb, hw, _hpreserve⟩ := corollary_three_witness_padic_of_coprime_seed
    ds hpos hrm hcount a ha hhigher
  exact Modular.witness_value_lower (Fact.out : p.Prime).two_le
    (pow_pos (Fact.out : p.Prime).pos _) hw

/-- An input at exact power-divisibility level `j` is at least `p^j`
from either end of the residue interval modulo `p^(j+1)`. -/
theorem folded_lower_of_exact_power {p j d : ℕ} (hp : 0 < p)
    (hdiv : p ^ j ∣ d) (hnext : ¬ p ^ (j + 1) ∣ d) :
    p ^ j ≤ Modular.folded (p ^ (j + 1)) d := by
  have hpower : p ^ j ∣ p ^ (j + 1) := Nat.pow_dvd_pow p (Nat.le_succ j)
  have hremdiv : p ^ j ∣ d % p ^ (j + 1) := (Nat.dvd_mod_iff hpower).mpr hdiv
  have hremnz : d % p ^ (j + 1) ≠ 0 := by
    intro hz
    exact hnext (Nat.dvd_of_mod_eq_zero hz)
  have hleft : p ^ j ≤ d % p ^ (j + 1) :=
    Nat.le_of_dvd (Nat.pos_of_ne_zero hremnz) hremdiv
  have hrem : d % p ^ (j + 1) < p ^ (j + 1) := Nat.mod_lt _ (pow_pos hp _)
  have hright : p ^ j ≤ p ^ (j + 1) - d % p ^ (j + 1) :=
    Nat.le_of_dvd (Nat.sub_pos_of_lt hrem) (Nat.dvd_sub hpower hremdiv)
  exact le_min hleft hright

/-- Any number of inputs at one exact level admits the explicit numerator
one witness. There is no cardinality or primality assumption. -/
theorem uniform_level_witness {p j : ℕ} (ds : List ℕ) (hp : 2 ≤ p)
    (hdiv : ∀ d ∈ ds, p ^ j ∣ d)
    (hnext : ∀ d ∈ ds, ¬ p ^ (j + 1) ∣ d) :
    Modular.Witness p (p ^ (j + 1)) 1 ds := by
  apply witness_of_prime_power_folded_lower ds
  intro d hd
  simpa only [one_mul] using
    folded_lower_of_exact_power (show 0 < p by omega) (hdiv d hd) (hnext d hd)

/-- The exact uniform-level case bounds the actual loneliness value,
without restricting the number of inputs. -/
theorem uniform_level_value {p j : ℕ} (ds : List ℕ) (hp : 2 ≤ p)
    (hdiv : ∀ d ∈ ds, p ^ j ∣ d)
    (hnext : ∀ d ∈ ds, ¬ p ^ (j + 1) ∣ d) :
    (1 : ℝ) / p ≤ Loneliness.value ds :=
  Modular.witness_value_lower hp (pow_pos (show 0 < p by omega) _)
    (uniform_level_witness ds hp hdiv hnext)

/-- Equal actual p-adic valuations give the uncapped uniform-level case. -/
theorem uniform_padic_value {p j : ℕ} [Fact p.Prime] (ds : List ℕ)
    (hpos : ∀ d ∈ ds, 0 < d)
    (hlevel : ∀ d ∈ ds, padicValNat p d = j) :
    (1 : ℝ) / p ≤ Loneliness.value ds := by
  apply uniform_level_value (j := j) ds (Fact.out : p.Prime).two_le
  · intro d hd
    simpa only [hlevel d hd] using (padic_level_exact (p := p) (hpos d hd)).1
  · intro d hd
    simpa only [hlevel d hd] using (padic_level_exact (p := p) (hpos d hd)).2

/-- Only levels below the canonical maximum need a cardinality bound.
Every input at the highest level already has the required distance at
numerator one, regardless of how many such inputs there are. -/
theorem hasWitness_of_lower_valuation_counts {p : ℕ} [Fact p.Prime]
    (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d)
    (hcount : ∀ j < maxPadicVal p ds.toFinset id,
      (ds.toFinset.filter (fun d => padicValNat p d = j)).card ≤ (p - 1) / 2) :
    Modular.HasWitness p (p ^ (maxPadicVal p ds.toFinset id + 1)) ds := by
  let m := maxPadicVal p ds.toFinset id
  change Modular.HasWitness p (p ^ (m + 1)) ds
  have hbound : ∀ d ∈ ds, padicValNat p d ≤ m := by
    intro d hd
    exact padicValNat_le_maxPadicVal p ds.toFinset id (List.mem_toFinset.mpr hd)
  by_cases hm : m = 0
  · refine ⟨1, ?_⟩
    rw [hm]
    apply uniform_level_witness ds (Fact.out : p.Prime).two_le
    · intro d hd
      have hlevel : padicValNat p d = 0 := by have := hbound d hd; omega
      simpa only [hlevel] using (padic_level_exact (p := p) (hpos d hd)).1
    · intro d hd
      have hlevel : padicValNat p d = 0 := by have := hbound d hd; omega
      simpa only [hlevel] using (padic_level_exact (p := p) (hpos d hd)).2
  · have hrm : m - 1 < m := by omega
    have hcounts : ∀ j ≤ m - 1,
        (ds.toFinset.filter (fun d => padicValNat p d = j)).card ≤ (p - 1) / 2 := by
      intro j hj
      exact hcount j (show j < m by omega)
    have htop : ∀ d ∈ ds, m - 1 < padicValNat p d →
        p ^ m ≤ Modular.folded (p ^ (m + 1)) (1 * d) := by
      intro d hd hhigh
      have hlevel : padicValNat p d = m := by have := hbound d hd; omega
      have hexact := padic_level_exact (p := p) (hpos d hd)
      rw [hlevel] at hexact
      simpa only [one_mul] using
        folded_lower_of_exact_power (Fact.out : p.Prime).pos hexact.1 hexact.2
    obtain ⟨b, _hb, hw, _hpreserve⟩ := corollary_three_witness_padic_of_coprime_seed
      ds hpos hrm hcounts 1 (by simp) htop
    exact ⟨b, hw⟩

theorem value_lower_of_lower_valuation_counts {p : ℕ} [Fact p.Prime]
    (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d)
    (hcount : ∀ j < maxPadicVal p ds.toFinset id,
      (ds.toFinset.filter (fun d => padicValNat p d = j)).card ≤ (p - 1) / 2) :
    (1 : ℝ) / p ≤ Loneliness.value ds :=
  Modular.hasWitness_value_lower (Fact.out : p.Prime).two_le
    (pow_pos (Fact.out : p.Prime).pos _)
    (hasWitness_of_lower_valuation_counts ds hpos hcount)

/-- The first seven-runner reduction: at most three distinct speeds at
each lower 7-adic level suffice; the occupied top level is unrestricted. -/
theorem one_seventh_of_three_below_max_valuation (ds : List ℕ)
    (hpos : ∀ d ∈ ds, 0 < d)
    (hcount : ∀ j < maxPadicVal 7 ds.toFinset id,
      (ds.toFinset.filter (fun d => padicValNat 7 d = j)).card ≤ 3) :
    (1 : ℝ) / 7 ≤ Loneliness.value ds := by
  let : Fact (Nat.Prime 7) := ⟨by decide⟩
  apply value_lower_of_lower_valuation_counts ds hpos
  intro j hj
  exact hcount j hj

end Loneliness.PrimeFiltering
