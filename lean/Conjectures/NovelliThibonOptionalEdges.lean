module
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Tactic.Ring
public import Mathlib.Tactic.FieldSimp

@[expose] public section
namespace NovelliThibon

variable {V K : Type*} [CommRing K]

def includeVertical (q t : K) (arm : ℕ) (desc : Bool) : K :=
  (t-q^arm)*(if desc then q else 1)

def excludeVertical (q t : K) (arm : ℕ) : K :=
  -t+q^(arm+1)

/-- Exact cancellation for one optional vertical edge in Definition 5.3. -/
theorem optional_vertical_sum (q t : K) (arm : ℕ) (desc : Bool) :
    includeVertical q t arm desc+excludeVertical q t arm =
      (q-1)*(if desc then t else q^arm) := by
  cases desc <;> simp [includeVertical,excludeVertical,pow_succ] <;> ring

open Classical in
/-- The intermediate-graph sum cancels ((q-1)) once per vertical
edge simultaneously, without any choice of order or specialization. -/
theorem optional_vertical_expansion (U : Finset V) (q : K) (t : V → K)
    (arm : V → ℕ) (desc : V → Bool) :
    (∑ S ∈ U.powerset,
      (∏ u ∈ S,includeVertical q (t u) (arm u) (desc u)) *
        (∏ u ∈ U\S,excludeVertical q (t u) (arm u))) =
      (q-1)^U.card*(∏ u ∈ U,if desc u then t u else q^(arm u)) := by
  classical
  rw [← Finset.prod_add]
  simp_rw [optional_vertical_sum]
  rw [Finset.prod_mul_distrib,Finset.prod_const]

variable {F : Type*} [Field F]

open Classical in
theorem optional_vertical_normalized (U : Finset V) (q : F) (hq : q ≠ 1) (t : V → F)
    (arm : V → ℕ) (desc : V → Bool) :
    (∑ S ∈ U.powerset,
      (∏ u ∈ S,includeVertical q (t u) (arm u) (desc u)) *
        (∏ u ∈ U\S,excludeVertical q (t u) (arm u))) / (q-1)^U.card =
      ∏ u ∈ U,if desc u then t u else q^(arm u) := by
  rw [optional_vertical_expansion]
  field_simp [pow_ne_zero _ (sub_ne_zero.mpr hq)]

end NovelliThibon
