import Conjectures.LonelinessHigherSpectrumBounds
import Conjectures.LonelinessSixSporadicBounds
import Conjectures.LonelinessDistanceColoring
import Mathlib.Data.Fin.VecNotation

/-! The Zhu-triangle consequences of the stated six-, seven- and eight-speed
classifications. Every listed family and sporadic has an actual triangle in
its integer distance graph. The final implications retain the primitive
classification premise explicitly; numerical coverage is separate work. -/

namespace Loneliness.HigherTriangleConsequences

open HigherSpectrumBounds

def HasAdditive (ds : List ℕ) : Prop :=
  ∃ a ∈ ds, ∃ b ∈ ds, a + b ∈ ds

/-- The three integer vertices are 0, x and x+y. -/
def TriangleWitness (ds : List ℕ) : Prop :=
  ∃ x y : ℤ, x ≠ 0 ∧ y ≠ 0 ∧ x + y ≠ 0 ∧
    x.natAbs ∈ ds ∧ y.natAbs ∈ ds ∧ (x + y).natAbs ∈ ds

theorem additive_perm {ds es : List ℕ} (hperm : ds.Perm es)
    (hadd : HasAdditive es) : HasAdditive ds := by
  obtain ⟨a, ha, b, hb, hab⟩ := hadd
  exact ⟨a, hperm.mem_iff.mpr ha, b, hperm.mem_iff.mpr hb,
    hperm.mem_iff.mpr hab⟩

theorem witness_of_additive (ds : List ℕ) (hpositive : ∀ d ∈ ds, 0 < d)
    (hadd : HasAdditive ds) : TriangleWitness ds := by
  obtain ⟨a, ha, b, hb, hab⟩ := hadd
  have hapos := hpositive a ha
  have hbpos := hpositive b hb
  refine ⟨(a : ℤ), (b : ℤ), by omega, by omega, by omega, ?_, ?_, ?_⟩
  · simpa only [Int.natAbs_natCast] using ha
  · simpa only [Int.natAbs_natCast] using hb
  · simpa only [← Nat.cast_add, Int.natAbs_natCast] using hab

theorem witness_not_triangleFree (ds : List ℕ) (hw : TriangleWitness ds) :
    ¬(DistanceColoring.graph ds).CliqueFree 3 := by
  obtain ⟨x, y, hx, hy, hxy, hxm, hym, hxym⟩ := hw
  have h0x : (DistanceColoring.graph ds).Adj 0 x := by
    refine ⟨by omega, ?_⟩
    simpa only [zero_sub, Int.natAbs_neg] using hxm
  have h0xy : (DistanceColoring.graph ds).Adj 0 (x + y) := by
    refine ⟨by omega, ?_⟩
    simpa only [zero_sub, Int.natAbs_neg] using hxym
  have hxxy : (DistanceColoring.graph ds).Adj x (x + y) := by
    refine ⟨by omega, ?_⟩
    rw [show x - (x + y) = -y by omega, Int.natAbs_neg]
    exact hym
  intro hfree
  apply hfree {0, x, x + y}
  exact SimpleGraph.is3Clique_triple_iff.mpr ⟨h0x, h0xy, hxxy⟩

theorem six_rows_additive : ∀ row ∈ SixSporadicBounds.rows,
    HasAdditive row.speeds := by
  unfold HasAdditive
  decide +kernel

theorem seven_rows_additive : ∀ row ∈ sevenRows, HasAdditive row.speeds := by
  unfold HasAdditive
  decide +kernel

theorem eight_rows_additive : ∀ row ∈ eightRows, HasAdditive row.speeds := by
  unfold HasAdditive
  decide +kernel

theorem six_sporadic_additive (ds : List ℕ) (hlisted : SixSporadicBounds.IsListed ds) :
    HasAdditive ds := by
  obtain ⟨row, hr, hperm⟩ := hlisted
  exact additive_perm hperm (six_rows_additive row hr)

theorem seven_candidate_additive (ds : List ℕ) (hknown : KnownSeven ds) :
    HasAdditive ds := by
  rcases hknown with ⟨s, _hs, hperm⟩ | ⟨row, hr, hperm⟩
  · apply additive_perm hperm
    exact ⟨1, by simp, 1, by simp, by simp⟩
  · exact additive_perm hperm (seven_rows_additive row hr)

theorem eight_candidate_additive (ds : List ℕ) (hknown : KnownEight ds) :
    HasAdditive ds := by
  rcases hknown with ⟨s, _hs, hperm | hperm | hperm⟩ | ⟨row, hr, hperm⟩
  · apply additive_perm hperm
    exact ⟨1, by simp, 1, by simp, by simp⟩
  · apply additive_perm hperm
    exact ⟨1, by simp, 1, by simp, by simp⟩
  · apply additive_perm hperm
    exact ⟨1, by simp, 4, by simp, by simp⟩
  · exact additive_perm hperm (eight_rows_additive row hr)

/-- The literal positive product families, before any restriction on value. -/
def SixProduct (ds : List ℕ) : Prop :=
  ∃ s b : ℕ, 0 < s ∧
    (ds.Perm [s, 2 * s, 3 * s, 4 * s, 5 * s, b] ∨
      ds.Perm [s, 3 * s, 4 * s, 5 * s, 9 * s, b])

/-- The literal real column parameterization, allowing all coordinate signs. -/
def SixThird (ds : List ℕ) : Prop :=
  ∃ (v : Fin 6 → ℤ) (s t : ℝ),
    ds.Perm (List.ofFn (fun i => (v i).natAbs)) ∧
    (fun i => (v i : ℝ)) = ![s, t, s + t, 2 * s + t, 3 * s + t, 3 * s + 2 * t]

def SixCandidate (ds : List ℕ) : Prop :=
  SixProduct ds ∨ SixThird ds ∨ SixSporadicBounds.IsListed ds

theorem six_product_additive (ds : List ℕ) (hproduct : SixProduct ds) :
    HasAdditive ds := by
  obtain ⟨s, b, _hs, hperm | hperm⟩ := hproduct
  · apply additive_perm hperm
    refine ⟨s, by simp, s, by simp, ?_⟩
    rw [show s + s = 2 * s by omega]
    simp
  · apply additive_perm hperm
    refine ⟨s, by simp, 3 * s, by simp, ?_⟩
    rw [show s + 3 * s = 4 * s by omega]
    simp

/-- Signs of the third family's parameters do not affect the triangle:
the signed vertices are used directly. -/
theorem six_third_triangle (ds : List ℕ) (hpositive : ∀ d ∈ ds, 0 < d)
    (hthird : SixThird ds) : TriangleWitness ds := by
  obtain ⟨v, s, t, hperm, hcoords⟩ := hthird
  have hmem (i : Fin 6) : (v i).natAbs ∈ ds :=
    hperm.mem_iff.mpr (List.mem_ofFn.mpr ⟨i, rfl⟩)
  have hnonzero (i : Fin 6) : v i ≠ 0 :=
    Int.natAbs_pos.mp (hpositive _ (hmem i))
  have h0 := congrFun hcoords (0 : Fin 6)
  have h1 := congrFun hcoords (1 : Fin 6)
  have h2 := congrFun hcoords (2 : Fin 6)
  norm_num at h0 h1 h2
  have hsumR : (v 0 : ℝ) + (v 1 : ℝ) = (v 2 : ℝ) := by
    linarith only [h0, h1, h2]
  have hsum : v 0 + v 1 = v 2 := by exact_mod_cast hsumR
  refine ⟨v 0, v 1, hnonzero 0, hnonzero 1, ?_, hmem 0, hmem 1, ?_⟩
  · simpa only [hsum] using hnonzero 2
  · simpa only [hsum] using hmem 2

theorem six_candidate_triangle (ds : List ℕ) (hknown : SixCandidate ds)
    (hpositive : ∀ d ∈ ds, 0 < d) : TriangleWitness ds := by
  rcases hknown with hproduct | hthird | hsporadic
  · exact witness_of_additive ds hpositive (six_product_additive ds hproduct)
  · exact six_third_triangle ds hpositive hthird
  · exact witness_of_additive ds hpositive (six_sporadic_additive ds hsporadic)

theorem seven_candidate_triangle (ds : List ℕ) (hknown : KnownSeven ds)
    (hpositive : ∀ d ∈ ds, 0 < d) : TriangleWitness ds :=
  witness_of_additive ds hpositive (seven_candidate_additive ds hknown)

theorem eight_candidate_triangle (ds : List ℕ) (hknown : KnownEight ds)
    (hpositive : ∀ d ∈ ds, 0 < d) : TriangleWitness ds :=
  witness_of_additive ds hpositive (eight_candidate_additive ds hknown)

theorem witness_of_normalize (ds : List ℕ) (hne : ds ≠ [])
    (hpositive : ∀ d ∈ ds, 0 < d)
    (hw : TriangleWitness (Normalization.normalize ds)) : TriangleWitness ds := by
  obtain ⟨x, y, hx, hy, hxy, hxm, hym, hxym⟩ := hw
  let g := Normalization.gcd ds
  have hg : 0 < g := Normalization.gcd_pos hne hpositive
  have hgZ : (g : ℤ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hg)
  have hscale (z : ℤ) (hz : z.natAbs ∈ Normalization.normalize ds) :
      ((g : ℤ) * z).natAbs ∈ ds := by
    have hm : g * z.natAbs ∈
        (Normalization.normalize ds).map (fun a => Normalization.gcd ds * a) :=
      List.mem_map.mpr ⟨z.natAbs, hz, rfl⟩
    rw [Normalization.rescale_normalize] at hm
    simpa only [Int.natAbs_mul, Int.natAbs_natCast] using hm
  refine ⟨(g : ℤ) * x, (g : ℤ) * y, mul_ne_zero hgZ hx, mul_ne_zero hgZ hy,
    ?_, hscale x hxm, hscale y hym, ?_⟩
  · rw [← mul_add]
    exact mul_ne_zero hgZ hxy
  · simpa only [mul_add] using hscale (x + y) hxym

/-- This is precisely the primitive near-tight classification input. -/
def PrimitiveClassifies (k : ℕ) (C : List ℕ → Prop) : Prop :=
  ∀ ds : List ℕ, ds.length = k → ds.Nodup → (∀ d ∈ ds, 0 < d) →
    Normalization.gcd ds = 1 → value ds < (1 : ℝ) / k → C ds

theorem triangle_free_colorable_of_primitive_classification
    (k : ℕ) (hk : 0 < k) (C : List ℕ → Prop)
    (htri : ∀ ds, C ds → (∀ d ∈ ds, 0 < d) → TriangleWitness ds)
    (hclass : PrimitiveClassifies k C)
    (ds : List ℕ) (hlen : ds.length = k) (hdistinct : ds.Nodup)
    (hpositive : ∀ d ∈ ds, 0 < d)
    (hfree : (DistanceColoring.graph ds).CliqueFree 3) :
    (DistanceColoring.graph ds).Colorable k := by
  apply DistanceColoring.colorable_of_value ds k hk
  by_contra hn
  have hbelow : value ds < (1 : ℝ) / k := lt_of_not_ge hn
  have hne : ds ≠ [] := by
    intro hz
    rw [hz] at hlen
    simp only [List.length_nil] at hlen
    omega
  have hknown := hclass (Normalization.normalize ds)
    (by simpa only [Normalization.normalize_length] using hlen)
    (Normalization.normalize_nodup hdistinct)
    (Normalization.normalize_positive ds hpositive)
    (Normalization.normalize_primitive ds hne hpositive)
    (by simpa only [Normalization.value_normalize ds hne hpositive] using hbelow)
  have hw := htri (Normalization.normalize ds) hknown
    (Normalization.normalize_positive ds hpositive)
  exact witness_not_triangleFree ds (witness_of_normalize ds hne hpositive hw) hfree

theorem zhu_of_primitive_classification
    (k : ℕ) (hk : 0 < k) (C : List ℕ → Prop)
    (htri : ∀ ds, C ds → (∀ d ∈ ds, 0 < d) → TriangleWitness ds)
    (hclass : PrimitiveClassifies k C)
    (ds : List ℕ) (hlen : ds.length = k) (hdistinct : ds.Nodup)
    (hpositive : ∀ d ∈ ds, 0 < d)
    (hchi : (DistanceColoring.graph ds).chromaticNumber = (k : ℕ∞) + 1) :
    ¬(DistanceColoring.graph ds).CliqueFree 3 := by
  intro hfree
  have hcolor := triangle_free_colorable_of_primitive_classification
    k hk C htri hclass ds hlen hdistinct hpositive hfree
  exact (SimpleGraph.chromaticNumber_eq_iff_colorable_not_colorable.mp hchi).2 hcolor

theorem six_triangle_free_colorable
    (hclass : PrimitiveClassifies 6 SixCandidate)
    (ds : List ℕ) (hlen : ds.length = 6) (hdistinct : ds.Nodup)
    (hpositive : ∀ d ∈ ds, 0 < d)
    (hfree : (DistanceColoring.graph ds).CliqueFree 3) :
    (DistanceColoring.graph ds).Colorable 6 :=
  triangle_free_colorable_of_primitive_classification 6 (by decide) SixCandidate
    six_candidate_triangle hclass ds hlen hdistinct hpositive hfree

theorem seven_triangle_free_colorable
    (hclass : PrimitiveClassifies 7 KnownSeven)
    (ds : List ℕ) (hlen : ds.length = 7) (hdistinct : ds.Nodup)
    (hpositive : ∀ d ∈ ds, 0 < d)
    (hfree : (DistanceColoring.graph ds).CliqueFree 3) :
    (DistanceColoring.graph ds).Colorable 7 :=
  triangle_free_colorable_of_primitive_classification 7 (by decide) KnownSeven
    seven_candidate_triangle hclass ds hlen hdistinct hpositive hfree

theorem eight_triangle_free_colorable
    (hclass : PrimitiveClassifies 8 KnownEight)
    (ds : List ℕ) (hlen : ds.length = 8) (hdistinct : ds.Nodup)
    (hpositive : ∀ d ∈ ds, 0 < d)
    (hfree : (DistanceColoring.graph ds).CliqueFree 3) :
    (DistanceColoring.graph ds).Colorable 8 :=
  triangle_free_colorable_of_primitive_classification 8 (by decide) KnownEight
    eight_candidate_triangle hclass ds hlen hdistinct hpositive hfree

theorem six_zhu
    (hclass : PrimitiveClassifies 6 SixCandidate)
    (ds : List ℕ) (hlen : ds.length = 6) (hdistinct : ds.Nodup)
    (hpositive : ∀ d ∈ ds, 0 < d)
    (hchi : (DistanceColoring.graph ds).chromaticNumber = 7) :
    ¬(DistanceColoring.graph ds).CliqueFree 3 :=
  zhu_of_primitive_classification 6 (by decide) SixCandidate
    six_candidate_triangle hclass ds hlen hdistinct hpositive (by
      convert hchi using 1
      norm_num)

theorem seven_zhu
    (hclass : PrimitiveClassifies 7 KnownSeven)
    (ds : List ℕ) (hlen : ds.length = 7) (hdistinct : ds.Nodup)
    (hpositive : ∀ d ∈ ds, 0 < d)
    (hchi : (DistanceColoring.graph ds).chromaticNumber = 8) :
    ¬(DistanceColoring.graph ds).CliqueFree 3 :=
  zhu_of_primitive_classification 7 (by decide) KnownSeven
    seven_candidate_triangle hclass ds hlen hdistinct hpositive (by
      convert hchi using 1
      norm_num)

theorem eight_zhu
    (hclass : PrimitiveClassifies 8 KnownEight)
    (ds : List ℕ) (hlen : ds.length = 8) (hdistinct : ds.Nodup)
    (hpositive : ∀ d ∈ ds, 0 < d)
    (hchi : (DistanceColoring.graph ds).chromaticNumber = 9) :
    ¬(DistanceColoring.graph ds).CliqueFree 3 :=
  zhu_of_primitive_classification 8 (by decide) KnownEight
    eight_candidate_triangle hclass ds hlen hdistinct hpositive (by
      convert hchi using 1
      norm_num)

end Loneliness.HigherTriangleConsequences

