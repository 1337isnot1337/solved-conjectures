#!/usr/bin/env python3
"""Fresh strict sources, complete axiom audit and stock replay for prime filtering and runner consequences."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess

import audit_lean_all_owned as audit
import verify_frankl_orbit_batches as runtime
from replay_lean import header_tokens, imports_of

ROOT = Path(__file__).resolve().parents[1]
MODEL = 'docs/prime-filtering-exact-sources.json'
OWN_INPUTS = ('scripts/verify_prime_filtering_exact.py', '.github/workflows/lean-prime-filtering-exact.yml', 'docs/prime-filtering-exact-sources.json')
FACETS = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig")
CONFIGURATION_INPUTS = (
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
)
HELPER_INPUTS = (
    "scripts/audit_lean_all_owned.py", "scripts/build_lean_parallel.py",
    "scripts/plan_accepted_lean.py", "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py", "scripts/verify_frankl_orbit_batches.py",
    "scripts/verify_lean_candidate.py",
)
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


def source(module):
    return ROOT / "lean" / (module.replace(".", "/") + ".lean")


def exact_singleton(modules, target):
    selected = [m for m in modules if m == target or m.startswith(target + ".")]
    require(selected == [target], "Stock checker prefix is not an exact singleton: " + target)


ROOTS = ['Conjectures.LonelinessPrimeFilteringWitness', 'Conjectures.LonelinessPrimeFilteringUnits', 'Conjectures.LonelinessPrimeFilteringCases']
SOURCE_PRIORITY_ROOTS = []
MODULE_COUNT = 18
LEGACY_PREFIXES = ['Loneliness.']
REQUIRED = [
    "Loneliness.CriticalFamilies.le_value_any",
    "Loneliness.Modular.distance_nat_div",
    "Loneliness.Modular.hasWitness_value_lower",
    "Loneliness.Modular.witness_clearance_lower",
    "Loneliness.Modular.witness_value_lower",
    "Loneliness.PrimeFiltering.avoid_two_per_level",
    "Loneliness.PrimeFiltering.corollary_three_distance",
    "Loneliness.PrimeFiltering.corollary_three_distance_of_coprime_seed",
    "Loneliness.PrimeFiltering.corollary_three_value_of_coprime_seed",
    "Loneliness.PrimeFiltering.corollary_three_value_padic_of_coprime_seed",
    "Loneliness.PrimeFiltering.corollary_three_witness_of_coprime_seed",
    "Loneliness.PrimeFiltering.corollary_three_witness_padic_of_coprime_seed",
    "Loneliness.PrimeFiltering.exists_affine_avoiding",
    "Loneliness.PrimeFiltering.exists_avoiding_permutations",
    "Loneliness.PrimeFiltering.exists_nat_affine_avoiding",
    "Loneliness.PrimeFiltering.folded_lower_of_exact_power",
    "Loneliness.PrimeFiltering.hasWitness_of_level_budgets",
    "Loneliness.PrimeFiltering.hasWitness_of_lower_valuation_counts",
    "Loneliness.PrimeFiltering.hasWitness_seven_of_three_per_level",
    "Loneliness.PrimeFiltering.hasWitness_seven_of_three_per_valuation",
    "Loneliness.PrimeFiltering.maxPadicVal_le_iff",
    "Loneliness.PrimeFiltering.not_dvd_pow_maxPadicVal_succ",
    "Loneliness.PrimeFiltering.one_seventh_of_three_below_max_valuation",
    "Loneliness.PrimeFiltering.one_seventh_of_three_per_level",
    "Loneliness.PrimeFiltering.one_seventh_of_three_per_valuation",
    "Loneliness.PrimeFiltering.padicValNat_le_maxPadicVal",
    "Loneliness.PrimeFiltering.padic_level_exact",
    "Loneliness.PrimeFiltering.partial_prime_filtering",
    "Loneliness.PrimeFiltering.prime_filtering",
    "Loneliness.PrimeFiltering.prime_filtering_coprime",
    "Loneliness.PrimeFiltering.prime_filtering_of_card_bounds",
    "Loneliness.PrimeFiltering.prime_filtering_padic",
    "Loneliness.PrimeFiltering.prime_filtering_padic_of_le",
    "Loneliness.PrimeFiltering.prime_filtering_unit",
    "Loneliness.PrimeFiltering.seven_avoid_two_of_three_per_level",
    "Loneliness.PrimeFiltering.uniform_level_value",
    "Loneliness.PrimeFiltering.uniform_level_witness",
    "Loneliness.PrimeFiltering.uniform_padic_value",
    "Loneliness.PrimeFiltering.value_lower_of_level_budgets",
    "Loneliness.PrimeFiltering.value_lower_of_lower_valuation_counts",
    "Loneliness.PrimeFiltering.witness_of_digit_avoiding",
    "Loneliness.PrimeFiltering.witness_of_prime_power_folded_lower",
    "Loneliness.PrimeFilteringArithmetic.digit_eq_zero_iff",
    "Loneliness.PrimeFilteringArithmetic.digit_mul_of_dvd",
    "Loneliness.PrimeFilteringArithmetic.digit_step",
    "Loneliness.PrimeFilteringArithmetic.digit_step_of_next_pow_dvd",
    "Loneliness.PrimeFilteringArithmetic.leading_digit_ne_zero",
    "Loneliness.PrimeFilteringArithmetic.multiplier_cast_at_top",
    "Loneliness.PrimeFilteringArithmetic.multiplier_cast_of_lt",
    "Loneliness.PrimeFilteringArithmetic.multiplier_ne_zero",
    "Loneliness.PrimeFilteringArithmetic.multiplier_ne_zero_at_top",
    "Loneliness.PrimeFilteringArithmetic.multiplier_ne_zero_of_lt",
    "Loneliness.PrimeFilteringArithmetic.quotient_step",
    "Loneliness.PrimeFilteringDigitBound.folded_lower_of_digit_avoiding",
    "Loneliness.PrimeFilteringDigitBound.residue_bounds_of_digit_avoiding",
    "Loneliness.PrimeFilteringResidues.coprime_prime_power_of_nonzero",
    "Loneliness.PrimeFilteringResidues.digit_eq_of_mod_eq",
    "Loneliness.PrimeFilteringResidues.digit_mod_prime_power",
    "Loneliness.PrimeFilteringResidues.exists_unit_lift",
    "Loneliness.PrimeFilteringResidues.exists_unit_val_lift",
    "Loneliness.PrimeFilteringResidues.isUnit_prime_power_of_nonzero",
    "Loneliness.PrimeFilteringResidues.residue_step_of_next_pow_dvd",
    "Loneliness.PrimeFilteringResidues.step_expansion_of_next_pow_dvd",
    "Loneliness.PrimeFilteringResidues.val_coprime_prime_power_of_nonzero",
    "Loneliness.continuous_clearance",
    "Loneliness.distance_int_div",
    "Loneliness.distance_nonneg",
    "Loneliness.le_clearance",
]

STATEMENTS = r'''import Conjectures.LonelinessPrimeFilteringWitness
import Conjectures.LonelinessPrimeFilteringUnits
import Conjectures.LonelinessPrimeFilteringCases

open scoped BigOperators
noncomputable section

namespace PrimeFilteringArithmeticContracts
open Loneliness.PrimeFilteringArithmetic
variable {p m j k x d : ℕ}
example (hp : 0 < p) (hj : j ≤ m) (hx : p ^ j ∣ x) :
    ((1 + k * p ^ (m - j)) * x) / p ^ m = x / p ^ m + k * (x / p ^ j) :=
  quotient_step hp hj hx
example (hp : 0 < p) (hj : j ≤ m) (hx : p ^ j ∣ x) :
    (((((1 + k * p ^ (m - j)) * x) / p ^ m) : ℕ) : ZMod p) =
      ((x / p ^ m : ℕ) : ZMod p) + (k : ZMod p) * ((x / p ^ j : ℕ) : ZMod p) :=
  digit_step hp hj hx
example (hp : 0 < p) (hj : j ≤ m) (hx : p ^ (j + 1) ∣ x) :
    digit p m ((1 + k * p ^ (m - j)) * x) = digit p m x :=
  digit_step_of_next_pow_dvd hp hj hx
example (hd : p ^ j ∣ d) (hnext : ¬ p ^ (j + 1) ∣ d) :
    ((d / p ^ j : ℕ) : ZMod p) ≠ 0 := leading_digit_ne_zero hd hnext
example (hp : 1 < p) (hj : j < m) :
    ((1 + k * p ^ (m - j) : ℕ) : ZMod p) ≠ 0 := multiplier_ne_zero_of_lt hp hj
example (hk : (k : ZMod p) ≠ -1) :
    ((1 + k * p ^ (m - m) : ℕ) : ZMod p) ≠ 0 := multiplier_ne_zero_at_top hk
example (hp : 1 < p) (hj : j ≤ m) (htop : j = m → (k : ZMod p) ≠ -1) :
    ((1 + k * p ^ (m - j) : ℕ) : ZMod p) ≠ 0 := multiplier_ne_zero hp hj htop
end PrimeFilteringArithmeticContracts


namespace PrimeFilteringResiduesContracts
open Loneliness.PrimeFilteringArithmetic Loneliness.PrimeFilteringResidues
variable {p m j k x y a : ℕ}
example (hj : j ≤ m) (hx : p ^ (j + 1) ∣ x) :
    (1 + k * p ^ (m - j)) * x = x + (k * (x / p ^ (j + 1))) * p ^ (m + 1) :=
  step_expansion_of_next_pow_dvd hj hx
example (hj : j ≤ m) (hx : p ^ (j + 1) ∣ x) :
    ((1 + k * p ^ (m - j)) * x) % p ^ (m + 1) = x % p ^ (m + 1) :=
  residue_step_of_next_pow_dvd hj hx
example : (((x % p ^ (m + 1) / p ^ m : ℕ)) : ZMod p) =
    ((x / p ^ m : ℕ) : ZMod p) := digit_mod_prime_power p m x
example (h : x % p ^ (m + 1) = y % p ^ (m + 1)) :
    digit p m x = digit p m y := digit_eq_of_mod_eq h
example (hp : p.Prime) (ha : (a : ZMod p) ≠ 0) :
    Nat.Coprime a (p ^ (m + 1)) := coprime_prime_power_of_nonzero hp ha
example (hp : p.Prime) (ha : (a : ZMod p) ≠ 0) :
    IsUnit (a : ZMod (p ^ (m + 1))) := isUnit_prime_power_of_nonzero hp ha
example (hp : p.Prime) (ha : (a : ZMod p) ≠ 0) :
    ∃ u : (ZMod (p ^ (m + 1)))ˣ, (u : ZMod (p ^ (m + 1))) = (a : ZMod (p ^ (m + 1))) :=
  exists_unit_lift hp ha
example (hp : p.Prime) (b : ZMod p) (hb : b ≠ 0) :
    Nat.Coprime b.val (p ^ (m + 1)) := val_coprime_prime_power_of_nonzero hp b hb
example (hp : p.Prime) (b : ZMod p) (hb : b ≠ 0) :
    ∃ u : (ZMod (p ^ (m + 1)))ˣ,
      (u : ZMod (p ^ (m + 1))) = (b.val : ZMod (p ^ (m + 1))) :=
  exists_unit_val_lift hp b hb
end PrimeFilteringResiduesContracts


namespace PrimeFilteringDigitBoundContracts
open Loneliness.PrimeFilteringDigitBound
variable {p m x : ℕ}
example (hp : 0 < p) (hzero : ((x / p ^ m : ℕ) : ZMod p) ≠ 0)
    (hlast : ((x / p ^ m : ℕ) : ZMod p) ≠ -1) :
    p ^ m ≤ x % p ^ (m + 1) ∧
      x % p ^ (m + 1) + p ^ m ≤ p ^ (m + 1) :=
  residue_bounds_of_digit_avoiding hp hzero hlast
example (hp : 0 < p) (hzero : ((x / p ^ m : ℕ) : ZMod p) ≠ 0)
    (hlast : ((x / p ^ m : ℕ) : ZMod p) ≠ -1) :
    p ^ m ≤ min (x % p ^ (m + 1)) (p ^ (m + 1) - x % p ^ (m + 1)) :=
  folded_lower_of_digit_avoiding hp hzero hlast
end PrimeFilteringDigitBoundContracts


namespace PrimeFilteringPartialContracts
open scoped BigOperators
open Loneliness.PrimeFiltering
example {ι : Type*} {p m r : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (F : ι → Finset (ZMod p))
    (hrm : r < m) (hlevel : ∀ i ∈ s, level i ≤ r)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hbudget : ∀ j ≤ r,
      ∑ i ∈ s.filter (fun i => level i = j), (F i).card ≤ p - 1)
    (a : ℕ) (ha : (a : ZMod p) ≠ 0) :
    ∃ b : ℕ, (b : ZMod p) ≠ 0 ∧
      (∀ i ∈ s, (((b * v i) / p ^ m : ℕ) : ZMod p) ∉ F i) ∧
      ∀ x : ℕ, p ^ (r + 1) ∣ x →
        (b * x) % p ^ (m + 1) = (a * x) % p ^ (m + 1) :=
  partial_prime_filtering s v level F hrm hlevel hdiv hnext hbudget a ha
end PrimeFilteringPartialContracts


namespace PrimeFilteringCorollaryThreeContracts
open Loneliness.PrimeFiltering
example {ι : Type*} {p m r : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (hrm : r < m)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hcount : ∀ j ≤ r,
      (s.filter (fun i => level i = j)).card ≤ (p - 1) / 2)
    (a : ℕ) (ha : Nat.Coprime a (p ^ (m + 1)))
    (hhigher : ∀ i ∈ s, r < level i →
      p ^ m ≤ min ((a * v i) % p ^ (m + 1))
        (p ^ (m + 1) - (a * v i) % p ^ (m + 1))) :
    ∃ b : ℕ, Nat.Coprime b (p ^ (m + 1)) ∧
      (∀ i ∈ s, p ^ m ≤ min ((b * v i) % p ^ (m + 1))
        (p ^ (m + 1) - (b * v i) % p ^ (m + 1))) ∧
      ∀ x : ℕ, p ^ (r + 1) ∣ x →
        (b * x) % p ^ (m + 1) = (a * x) % p ^ (m + 1) :=
  corollary_three_distance_of_coprime_seed s v level hrm hdiv hnext hcount a ha hhigher
example {ι : Type*} {p m r : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (hrm : r < m)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hcount : ∀ j ≤ r,
      (s.filter (fun i => level i = j)).card ≤ (p - 1) / 2)
    (hhigher : ∀ i ∈ s, r < level i →
      p ^ m ≤ min (v i % p ^ (m + 1)) (p ^ (m + 1) - v i % p ^ (m + 1))) :
    ∃ b : ℕ, Nat.Coprime b (p ^ (m + 1)) ∧
      (∀ i ∈ s, p ^ m ≤ min ((b * v i) % p ^ (m + 1))
        (p ^ (m + 1) - (b * v i) % p ^ (m + 1))) ∧
      ∀ x : ℕ, p ^ (r + 1) ∣ x →
        (b * x) % p ^ (m + 1) = x % p ^ (m + 1) :=
  corollary_three_distance s v level hrm hdiv hnext hcount hhigher
end PrimeFilteringCorollaryThreeContracts


open scoped BigOperators

example {p n : ℕ} [Fact p.Prime] (hn : 0 < n) :
    p ^ padicValNat p n ∣ n ∧ ¬ p ^ (padicValNat p n + 1) ∣ n :=
  Loneliness.PrimeFiltering.padic_level_exact hn

example {ι : Type*} (p : ℕ) (s : Finset ι) (v : ι → ℕ) (i : ι) (hi : i ∈ s) :
    padicValNat p (v i) ≤ s.sup (fun k => padicValNat p (v k)) :=
  Loneliness.PrimeFiltering.padicValNat_le_maxPadicVal p s v hi

example {ι : Type*} {p : ℕ} [Fact p.Prime]
    (s : Finset ι) (v : ι → ℕ) (hpos : ∀ i ∈ s, 0 < v i) (i : ι) (hi : i ∈ s) :
    ¬ p ^ (s.sup (fun k => padicValNat p (v k)) + 1) ∣ v i :=
  Loneliness.PrimeFiltering.not_dvd_pow_maxPadicVal_succ s v hpos hi

example {ι : Type*} {p : ℕ} [Fact p.Prime]
    (s : Finset ι) (v : ι → ℕ) (F : ι → Finset (ZMod p))
    (hpos : ∀ i ∈ s, 0 < v i)
    (hlower : ∀ j < s.sup (fun i => padicValNat p (v i)),
      ∑ i ∈ s.filter (fun i => padicValNat p (v i) = j), (F i).card ≤ p - 1)
    (htop : ∑ i ∈ s.filter
      (fun i => padicValNat p (v i) = s.sup (fun k => padicValNat p (v k))),
      (F i).card ≤ p - 2) :
    ∃ a : ℕ, (a : ZMod p) ≠ 0 ∧
      ∀ i ∈ s, (((a * v i) / p ^ (s.sup (fun k => padicValNat p (v k))) : ℕ) : ZMod p)
        ∉ F i :=
  Loneliness.PrimeFiltering.prime_filtering_padic s v F hpos hlower htop

namespace PrimeFilteringExactContracts

open scoped BigOperators
open Loneliness.PrimeFiltering

example {ι : Type*} {p m : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (F : ι → Finset (ZMod p))
    (hlevel : ∀ i ∈ s, level i ≤ m)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hlower : ∀ j < m, ∑ i ∈ s.filter (fun i => level i = j), (F i).card ≤ p - 1)
    (htop : ∑ i ∈ s.filter (fun i => level i = m), (F i).card ≤ p - 2) :
    ∃ a : ℕ, (a : ZMod p) ≠ 0 ∧
      ∀ i ∈ s, (((a * v i) / p ^ m : ℕ) : ZMod p) ∉ F i :=
  prime_filtering_of_card_bounds s v level F hlevel hdiv hnext hlower htop

example {ι : Type*} {p m : ℕ} [Fact p.Prime]
    (s : Finset ι) (v level : ι → ℕ) (F : ι → Finset (ZMod p))
    (hlevel : ∀ i ∈ s, level i ≤ m)
    (hdiv : ∀ i ∈ s, p ^ level i ∣ v i)
    (hnext : ∀ i ∈ s, ¬ p ^ (level i + 1) ∣ v i)
    (hlower : ∀ j < m, ∑ i ∈ s.filter (fun i => level i = j), (F i).card ≤ p - 1)
    (htop : ∑ i ∈ s.filter (fun i => level i = m), (F i).card ≤ p - 2) :
    ∃ u : (ZMod (p ^ (m + 1)))ˣ,
      ∀ i ∈ s, ((((u : ZMod (p ^ (m + 1))).val * v i) / p ^ m : ℕ) : ZMod p) ∉ F i :=
  prime_filtering_unit s v level F hlevel hdiv hnext hlower htop

example (ds : List ℕ) :
    Loneliness.value ds = sSup (Loneliness.clearance ds '' Set.Icc (0 : ℝ) 1) := rfl

example (k m t : ℕ) (ds : List ℕ) :
    Loneliness.Modular.Witness k m t ds ↔
      ∀ d ∈ ds, m ≤ k * min ((t * d) % m) (m - (t * d) % m) := Iff.rfl

example (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d)
    (hcount : ∀ j : ℕ, (ds.toFinset.filter (fun d => padicValNat 7 d = j)).card ≤ 3) :
    ∃ a : ℕ, ∀ d ∈ ds,
      7 ^ (ds.toFinset.sup (fun x => padicValNat 7 x) + 2) ≤
        7 * min ((a * d) % 7 ^ (ds.toFinset.sup (fun x => padicValNat 7 x) + 2))
          (7 ^ (ds.toFinset.sup (fun x => padicValNat 7 x) + 2) -
            (a * d) % 7 ^ (ds.toFinset.sup (fun x => padicValNat 7 x) + 2)) :=
  hasWitness_seven_of_three_per_valuation ds hpos hcount

example {p j : ℕ} (ds : List ℕ) (hp : 2 ≤ p)
    (hdiv : ∀ d ∈ ds, p ^ j ∣ d)
    (hnext : ∀ d ∈ ds, ¬ p ^ (j + 1) ∣ d) :
    (1 : ℝ) / p ≤ sSup (Loneliness.clearance ds '' Set.Icc (0 : ℝ) 1) :=
  uniform_level_value ds hp hdiv hnext

-- No cardinality bound is imposed on the highest occupied valuation level.
example {p : ℕ} [Fact p.Prime] (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d)
    (hcount : ∀ j < ds.toFinset.sup (fun d => padicValNat p d),
      (ds.toFinset.filter (fun d => padicValNat p d = j)).card ≤ (p - 1) / 2) :
    ∃ a : ℕ, ∀ d ∈ ds,
      p ^ (ds.toFinset.sup (fun x => padicValNat p x) + 1) ≤
        p * min ((a * d) % p ^ (ds.toFinset.sup (fun x => padicValNat p x) + 1))
          (p ^ (ds.toFinset.sup (fun x => padicValNat p x) + 1) -
            (a * d) % p ^ (ds.toFinset.sup (fun x => padicValNat p x) + 1)) :=
  hasWitness_of_lower_valuation_counts ds hpos hcount

example (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d)
    (hcount : ∀ j < ds.toFinset.sup (fun d => padicValNat 7 d),
      (ds.toFinset.filter (fun d => padicValNat 7 d = j)).card ≤ 3) :
    (1 : ℝ) / 7 ≤ sSup (Loneliness.clearance ds '' Set.Icc (0 : ℝ) 1) :=
  one_seventh_of_three_below_max_valuation ds hpos hcount

end PrimeFilteringExactContracts

end
'''


def profile(command, cwd, environment, log, progress, timeout):
    result = runtime.profile(command, cwd, environment, log, progress, timeout)
    result.update({"progress": str(progress), "progress_sha256": sha(progress)})
    return result

def preflight(model):
    require(model["schema"] == "prime-filtering-exact-v1", "Unexpected source model")
    require(model.get("sealed") is True, "Prime-filtering source manifest is not sealed")
    require(model["roots"] == ROOTS,
            "Unexpected theorem root")
    require(model["source_priority_roots"] == SOURCE_PRIORITY_ROOTS,
            "Unexpected source scheduling priority")
    require(model["legacy_prefixes"] == LEGACY_PREFIXES, "Unexpected legacy ownership prefix")
    require(model["source_policy"] == {
        "warning_as_error": True, "linter_override": False, "fresh_project_objects": True},
        "Unexpected strict source policy")
    require(set(model["configuration_sha256"]) == set(CONFIGURATION_INPUTS),
            "Pinned configuration inventory differs")
    require(set(model["helper_sha256"]) == set(HELPER_INPUTS),
            "Pinned helper inventory differs")
    require(model["literal_statements_sha256"] == hashlib.sha256(STATEMENTS.encode()).hexdigest(),
            "Literal theorem contracts differ")
    modules = runtime.dependency_order(model["roots"])
    priority_modules = runtime.dependency_order(SOURCE_PRIORITY_ROOTS)
    require(set(priority_modules) <= set(modules), "Source priority extends the proof closure")
    modules = priority_modules + [module for module in modules if module not in priority_modules]
    require(len(modules) == model["project_module_count"] == MODULE_COUNT and set(modules) == set(model["source_sha256"]),
            "Exact prime-filtering proof closure differs")
    required = model["required_theorems"]
    require(required == REQUIRED, "Exact prime-filtering theorem inventory differs")
    require(len(required) == len(set(required)) == model["required_theorem_count"] and len(required) > 0, "Required theorem inventory differs")
    for module in modules:
        require(sha(source(module)) == model["source_sha256"][module],
                "Pinned proof source differs: " + module)
        exact_singleton(modules, module)
    for path, digest in {**model["configuration_sha256"], **model["helper_sha256"]}.items():
        require(sha(ROOT / path) == digest, "Pinned configuration/helper differs: " + path)
    require(audit.ALLOWED == ("propext", "Classical.choice", "Quot.sound"),
            "Standard-axiom whitelist changed")
    modern = {m: next(header_tokens(source(m).read_text()), None) == "module" for m in modules}
    return modules, required, modern


def module_objects(stage, module, modern):
    stem = stage / "lib/lean" / module.replace(".", "/")
    facets = {}
    for suffix in FACETS:
        path = Path(str(stem) + suffix)
        require(not path.is_symlink(), "Proof object must be a regular file")
        if path.is_file():
            facets[suffix] = sha(path)
    needed = set(FACETS[:3]) if modern[module] else {".olean"}
    require(needed <= set(facets), "Missing required object facet: " + module)
    require((".olean.private" in facets) == (".olean.server" in facets),
            "Partial optional private/server facet pair: " + module)
    return facets


def objects(stage, modules, modern):
    result = {module: module_objects(stage, module, modern) for module in modules}
    present = {".".join(p.relative_to(stage / "lib/lean").with_suffix("").parts)
               for p in (stage / "lib/lean/Conjectures").rglob("*.olean")}
    require(present == set(modules), "Extra or missing staged project object")
    return result


def verify(model, modules, required, modern, stage, runtime_path):
    require(not stage.exists() or not any(stage.iterdir()), "Choose a fresh proof stage")
    for name in ("src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    compiler, external, toolchain = runtime.resolve_runtime(runtime_path)
    require(toolchain["lean_sha256"] == LEAN_SHA256
            and toolchain["checker_sha256"] == CHECKER_SHA256,
            "Compiler or stock checker is not the pinned binary")
    controls = {**model["configuration_sha256"], **model["helper_sha256"],
                **{path: sha(ROOT / path) for path in OWN_INPUTS}}
    receipt = {
        "schema": "prime-filtering-exact-receipt-v1",
        "status": "running", "scope": model["scope"],
        "git_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "roots": model["roots"], "project_modules": modules,
        "required_theorems": required, "source_sha256": model["source_sha256"],
        "gate_sha256": controls, "toolchain": toolchain,
        "source_workers": 1, "kernel_threads": 1,
        "source_checks": {}, "source_failures": {}, "blocked_sources": {},
        "kernel_checks": {}, "source_policy": model["source_policy"],
        "axiom_whitelist": list(audit.ALLOWED), "modern_modules": modern,
        "external_lean_path": external,
        "contribution": model["contribution"],
        "accepted_registry_changed": False,
        "universal_prime_filtering_included": True,
        "actual_loneliness_value_scope": True,
    }
    def save():
        (stage / "receipt.json").write_bytes(encoded(receipt))
    environment = {
        **os.environ, "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
        "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
        "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0",
    }
    try:
        built_objects = {}
        for module in modules:
            stem = module.replace(".", "/")
            copied = stage / "src" / (stem + ".lean")
            copied.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source(module), copied)
            require(sha(copied) == model["source_sha256"][module], "Copied proof source differs")
            project_imports = [dep for dep in imports_of(copied) if dep in modules]
            unavailable = [dep for dep in project_imports if dep not in built_objects]
            if unavailable:
                require(all(dep in receipt["source_failures"] or dep in receipt["blocked_sources"]
                            for dep in unavailable), "Source dependency order differs: " + module)
                receipt["blocked_sources"][module] = {
                    "blocked_by": unavailable, "source_sha256": sha(copied),
                }
                save()
                print(json.dumps({"phase": module + ".source", "status": "blocked",
                                  "blocked_by": unavailable}), flush=True)
                continue
            output = stage / "lib/lean" / (stem + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            for dep in project_imports:
                require(module_objects(stage, dep, modern) == built_objects[dep],
                        "Imported project object changed before compilation: " + dep)
                require(sha(stage / "src" / (dep.replace(".", "/") + ".lean"))
                        == model["source_sha256"][dep],
                        "Imported project source changed before compilation: " + dep)
            direct_imports = {
                dep: {"source_sha256": model["source_sha256"][dep],
                      "artifact_sha256": dict(built_objects[dep])}
                for dep in project_imports
            }
            command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                       "-o", str(output), stem + ".lean"]
            check = profile(command, stage / "src", environment,
                stage / "logs" / (module + ".source.log"),
                stage / "progress" / (module + ".source.json"), 1800)
            check["source_sha256"] = sha(copied)
            check["direct_project_imports"] = direct_imports
            receipt["source_checks"][module] = check
            save()
            require(sha(copied) == model["source_sha256"][module],
                    "Proof source changed during compilation: " + module)
            for dep, dependency in direct_imports.items():
                require(module_objects(stage, dep, modern) == dependency["artifact_sha256"],
                        "Imported project object changed during compilation: " + dep)
                require(sha(stage / "src" / (dep.replace(".", "/") + ".lean"))
                        == dependency["source_sha256"],
                        "Imported project source changed during compilation: " + dep)
            if check["exit_code"] != 0 or check["timed_out"] is not False:
                receipt["source_failures"][module] = {
                    "exit_code": check["exit_code"], "timed_out": check["timed_out"],
                    "log": check["log"],
                }
                save()
                continue
            built_objects[module] = module_objects(stage, module, modern)
            check["artifact_sha256"] = built_objects[module]
            save()
        if receipt["source_failures"] or receipt["blocked_sources"]:
            diagnostics = "\n\n".join(
                module + "\n" + Path(check["log"]).read_text()[-12000:]
                for module, check in receipt["source_failures"].items())
            raise RuntimeError("Strict source failed: " + ", ".join(receipt["source_failures"])
                               + "\nBlocked source modules: " + ", ".join(receipt["blocked_sources"])
                               + "\n" + diagnostics)
        require(list(built_objects) == modules, "Not every exact source module was compiled")
        frozen_objects = objects(stage, modules, modern)
        require(frozen_objects == built_objects, "A compiled project object was replaced")
        receipt["artifact_sha256"] = frozen_objects
        statements = stage / "src/PrimeFilteringExactStatements.lean"
        statements.write_text(STATEMENTS)
        command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                   statements.name]
        check = profile(command, stage / "src", environment,
            stage / "logs/literal-statements.log", stage / "progress/literal-statements.json", 900)
        receipt["literal_statements"] = check
        receipt["literal_statements_sha256"] = sha(statements)
        save()
        require(check["exit_code"] == 0 and check["timed_out"] is False,
                "Literal theorem statements failed:\n" + Path(check["log"]).read_text()[-12000:])
        spec = {"modules": modules, "required": required,
                "legacy_prefixes": model["legacy_prefixes"]}
        audit_path = stage / "src/PrimeFilteringExactAudit.lean"
        audit_raw = audit.audit_source(modules, required, model["legacy_prefixes"]).encode()
        audit_path.write_bytes(audit_raw)
        command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true", audit_path.name]
        check = profile(command, stage / "src", environment,
            stage / "logs/all-owned-audit.log", stage / "progress/all-owned-audit.json", 900)
        receipt["axiom_audit"] = check
        save()
        require(check["exit_code"] == 0 and check["timed_out"] is False,
                "All-owned audit failed:\n" + Path(check["log"]).read_text()[-12000:])
        inventory = audit.validate_log(Path(check["log"]).read_text(), spec, modern)
        require(all(inventory["declarations"][name]["kind"] == "theorem" for name in required),
                "A required theorem endpoint is not a theorem declaration")
        (stage / "declaration-inventory.json").write_bytes(encoded(inventory))
        check.update({
            "all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
            "explicit_import_all": True, "summary": inventory["summary"],
            "audit_source_sha256": hashlib.sha256(audit_raw).hexdigest(),
            "declaration_inventory_sha256": sha(stage / "declaration-inventory.json"),
        })
        replayed = []
        for module in modules:
            exact_singleton(modules, module)
            command = [str(compiler / "bin/leanchecker"), "-v", module]
            if buffer := shutil.which("stdbuf"):
                command = [buffer, "-oL", "-eL", *command]
            check = profile(command, stage / "src", environment,
                stage / "logs" / (module + ".kernel.log"),
                stage / "progress" / (module + ".kernel.json"), 1800)
            receipt["kernel_checks"][module] = check
            save()
            require(check["exit_code"] == 0 and check["timed_out"] is False,
                    "Stock kernel replay failed: " + module + "\n" + Path(check["log"]).read_text()[-12000:])
            actual = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$",
                                Path(check["log"]).read_text(), re.M)
            require(actual == [module], "Kernel target differs: " + module)
            check.update({"replayed_modules": actual, "exact_singleton_target": True})
            replayed.extend(actual)
            save()
        require(replayed == modules, "Complete original-theorem replay inventory differs")
        receipt["kernel_replay"] = {
            "replayed_modules": replayed, "exact_project_closure": True,
            "all_modules_replayed_as_targets": True, "fresh_process_per_module": True,
            "seconds": round(sum(c["seconds"] for c in receipt["kernel_checks"].values()), 3),
            "peak_rss_kib": max(c["peak_rss_kib"] for c in receipt["kernel_checks"].values()),
        }
        require(objects(stage, modules, modern) == frozen_objects, "Proof object bytes changed")
        for module, digest in model["source_sha256"].items():
            require(sha(source(module)) == digest and
                    sha(stage / "src" / (module.replace(".", "/") + ".lean")) == digest,
                    "Proof source changed during the gate")
        for path, digest in controls.items():
            require(sha(ROOT / path) == digest, "Gate input changed during the check: " + path)
        for check in [*receipt["source_checks"].values(), receipt["literal_statements"], receipt["axiom_audit"],
                      *receipt["kernel_checks"].values()]:
            require(sha(check["log"]) == check["log_sha256"], "Recorded process log changed")
            require(sha(check["progress"]) == check["progress_sha256"],
                    "Recorded process profile changed")
        require(statements.read_text() == STATEMENTS, "Literal theorem statements changed")
        require(audit_path.read_bytes() == audit_raw
                and sha(stage / "declaration-inventory.json") ==
                    receipt["axiom_audit"]["declaration_inventory_sha256"],
                "Axiom audit evidence changed")
        require(sha(compiler / "bin/lean") == LEAN_SHA256
                and sha(compiler / "bin/leanchecker") == CHECKER_SHA256,
                "Compiler or stock checker changed")
        require(subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
                == receipt["git_commit"], "Frozen checkout commit changed")
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "literal_prime_filtering_scope_checked": True,
                        "full_six_speed_bound_claimed": False})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({
        "status": "passed", "project_modules": len(modules),
        "required_theorems": len(required), "audit_summary": inventory["summary"],
        "receipt_sha256": sha(stage / "receipt.json"),
    }), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--artifact-dir", type=Path)
    parser.add_argument("--runtime", type=Path)
    args = parser.parse_args()
    model = json.loads((ROOT / MODEL).read_text())
    modules, required, modern = preflight(model)
    if args.plan:
        print(json.dumps({"modules": modules, "required": required, "modern": modern,
                          "source_policy": model["source_policy"]}, indent=2))
        return
    stage = (args.artifact_dir or ROOT / ".candidate-artifacts/prime-filtering-exact").resolve()
    verify(model, modules, required, modern, stage, args.runtime)


if __name__ == "__main__":
    main()
