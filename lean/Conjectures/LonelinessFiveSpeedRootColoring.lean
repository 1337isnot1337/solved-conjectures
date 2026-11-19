import Conjectures.LonelinessDistanceColoring
import Conjectures.LonelinessFiveSpeedClassificationCore
import Conjectures.LonelinessFiveSpeedFamilyCutoff
import Conjectures.LonelinessFiveSpeedRootIntegerLift

/-! The triangle-free five-distance consequence uses only the first
finite root cover. No plane cover or bounded-map exhaustion is assumed. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped BigOperators Matrix
open Loneliness.CriticalFamilies

theorem integerRootOutcome_additive (v : Fin 5 → ℕ)
    (houtcome : FiveSpeedRoot.IntegerRootOutcome v) :
    ∃ a ∈ List.ofFn v, ∃ b ∈ List.ofFn v, a + b ∈ List.ofFn v := by
  have hmem (i : Fin 5) : v i ∈ List.ofFn v := List.mem_ofFn.mpr ⟨i, rfl⟩
  rcases houtcome with ⟨a, b, _, ha, _⟩ | ⟨π, h134⟩
  · obtain ⟨i, j, k, _, _, hadd, _⟩ := FiveSpeedRoot.zero_relation_additive a v ha
    refine ⟨v i, hmem i, v j, hmem j, ?_⟩
    rw [hadd]
    exact hmem k
  · have hrow := congrFun h134 (0 : Fin 2)
    norm_num [special134Relations, Matrix.mulVec, dotProduct, Fin.sum_univ_succ] at hrow
    have haddZ : (v (π 0) : ℤ) + (v (π 1) : ℤ) = (v (π 2) : ℤ) := by
      linarith only [hrow]
    have hadd : v (π 0) + v (π 1) = v (π 2) := by exact_mod_cast haddZ
    refine ⟨v (π 0), hmem (π 0), v (π 1), hmem (π 1), ?_⟩
    rw [hadd]
    exact hmem (π 2)

theorem five_speed_below_additive_of_root_covers (hgap : CoordinateSubspace.FourSpeedGap)
    (ps : Finset ℕ) (hprime : ∀ p ∈ ps, p.Prime) (hlarge : ∀ p ∈ ps, 7 < p)
    (hcovers : ∀ p ∈ ps, FiveSpeedRoot.GlobalRootCover p)
    (hproduct : (4 * 279841) ^ 111 < ∏ p ∈ ps, p)
    (ds : List ℕ) (hlen : ds.length = 5) (hdistinct : ds.Nodup)
    (hpositive : ∀ a ∈ ds, 0 < a) (hbelow : value ds < (1 / 5 : ℝ)) :
    ∃ a ∈ ds, ∃ b ∈ ds, a + b ∈ ds := by
  have hne : ds ≠ [] := by intro h; simp [h] at hlen
  let ns := Normalization.normalize ds
  have hnslen : ns.length = 5 := (Normalization.normalize_length ds).trans hlen
  have hnsdistinct : ns.Nodup := Normalization.normalize_nodup hdistinct
  have hnspositive : ∀ a ∈ ns, 0 < a := Normalization.normalize_positive ds hpositive
  have hnsbelow : value ns < (1 / 5 : ℝ) := by
    change value (Normalization.normalize ds) < _
    rw [Normalization.value_normalize ds hne hpositive]
    exact hbelow
  have hadditive : ∃ a ∈ ns, ∃ b ∈ ns, a + b ∈ ns := by
    by_cases hcrit : ContainsCriticalQuadruple ns
    · exact critical_quadruple_additive hcrit
    · obtain ⟨v, hv⟩ := vector_of_list_length ns hnslen
      have hvpositive : ∀ i, 0 < v i := by
        intro i
        apply hnspositive
        rw [← hv]
        exact List.mem_ofFn.mpr ⟨i, rfl⟩
      have hvinjective : Function.Injective v :=
        List.nodup_ofFn.mp (by simpa only [hv] using hnsdistinct)
      have hvprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1 := by
        change Normalization.gcd (List.ofFn v) = 1
        rw [hv]
        exact Normalization.normalize_primitive ds hne hpositive
      have hvbelow : value (List.ofFn v) < (1 / 5 : ℝ) := by
        simpa only [hv] using hnsbelow
      have hvnot : ¬ContainsCriticalQuadruple (List.ofFn v) := by
        simpa only [hv] using hcrit
      have hvbound := Pigeonhole.five_speed_family_cutoff hgap v hvpositive
        hvprimitive hvbelow hvnot
      have houtcome := FiveSpeedRoot.root_integer_relation_lift v 279841 hvpositive
        hvinjective hvbound hvbelow ps hprime hlarge hcovers hproduct
      simpa only [hv] using integerRootOutcome_additive v houtcome
  obtain ⟨a, ha, b, hb, hab⟩ := hadditive
  have hscale (x : ℕ) (hx : x ∈ ns) : Normalization.gcd ds * x ∈ ds := by
    have hmem : Normalization.gcd ds * x ∈
        (Normalization.normalize ds).map (fun a => Normalization.gcd ds * a) :=
      List.mem_map.mpr ⟨x, hx, rfl⟩
    simpa only [Normalization.rescale_normalize] using hmem
  refine ⟨Normalization.gcd ds * a, hscale a ha,
    Normalization.gcd ds * b, hscale b hb, ?_⟩
  simpa only [Nat.mul_add] using hscale (a + b) hab

theorem five_speed_value_ge_fifth_of_root_covers (hgap : CoordinateSubspace.FourSpeedGap)
    (ps : Finset ℕ) (hprime : ∀ p ∈ ps, p.Prime) (hlarge : ∀ p ∈ ps, 7 < p)
    (hcovers : ∀ p ∈ ps, FiveSpeedRoot.GlobalRootCover p)
    (hproduct : (4 * 279841) ^ 111 < ∏ p ∈ ps, p)
    (ds : List ℕ) (hlen : ds.length = 5) (hdistinct : ds.Nodup)
    (hpositive : ∀ a ∈ ds, 0 < a)
    (hnoadditive : ¬∃ a ∈ ds, ∃ b ∈ ds, a + b ∈ ds) :
    (1 / 5 : ℝ) ≤ value ds := by
  by_contra h
  exact hnoadditive (five_speed_below_additive_of_root_covers hgap ps hprime hlarge
    hcovers hproduct ds hlen hdistinct hpositive (lt_of_not_ge h))

theorem triangle_free_five_distance_colorable_of_root_covers
    (hgap : CoordinateSubspace.FourSpeedGap)
    (ps : Finset ℕ) (hprime : ∀ p ∈ ps, p.Prime) (hlarge : ∀ p ∈ ps, 7 < p)
    (hcovers : ∀ p ∈ ps, FiveSpeedRoot.GlobalRootCover p)
    (hproduct : (4 * 279841) ^ 111 < ∏ p ∈ ps, p)
    (ds : List ℕ) (hlen : ds.length = 5) (hdistinct : ds.Nodup)
    (hpositive : ∀ a ∈ ds, 0 < a) (hfree : (DistanceColoring.graph ds).CliqueFree 3) :
    (DistanceColoring.graph ds).Colorable 5 := by
  apply DistanceColoring.colorable_of_value ds 5 (by decide)
  exact five_speed_value_ge_fifth_of_root_covers hgap ps hprime hlarge hcovers hproduct
    ds hlen hdistinct hpositive (DistanceColoring.triangleFree_no_additive ds hpositive hfree)

end Loneliness.FiveSpeedCertificate
