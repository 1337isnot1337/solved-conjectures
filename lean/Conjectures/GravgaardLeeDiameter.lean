import Conjectures.GravgaardLeeDiameterCover
import Conjectures.GravgaardLeeDiameterGreedy
import Conjectures.GravgaardLeeDiameterTails

/-!
# Gravgaard–Lee's Lüroth diameter question

The exact positive hull consists of sums of genuine infinite expansions.
The total diameter hypothesis is weak, so equality is included.
-/

open Filter Finset Set
open scoped Topology

namespace GravgaardLeeDiameter

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth GravgaardLeeUpperLower

noncomputable section

private theorem exists_donor {ι : Type*} [Fintype ι] {k : ι → ℕ}
    (hk : ∀ i, 2 ≤ k i) (hdiam : 1 ≤ ∑ i, endpoint (k i)) {x : ℝ}
    (hx : x ∈ Ioc 0 (∑ i, endpoint (k i))) :
    ∃ y : ι → ℝ, (∀ i, y i ∈ closedDigits (k i)) ∧
      (∑ i, y i) = x ∧ ∃ i, y i ∈ largeDigitSet (k i) := by
  have hcl : x ∈ closure (Ioo (0 : ℝ) x) := by
    rw [closure_Ioo hx.1.ne]
    exact ⟨hx.1.le, le_rfl⟩
  obtain ⟨t, ht, htends⟩ := mem_closure_iff_seq_limit.mp hcl
  have hrep (n : ℕ) : ∃ y : ι → ℝ, (∀ i, y i ∈ closedDigits (k i)) ∧ (∑ i, y i) = t n := by
    have hm : t n ∈ (sumSet fun i => closedDigits (k i)) := by
      rw [closed_sum_eq hk hdiam]
      exact ⟨(ht n).1.le, (ht n).2.le.trans hx.2⟩
    exact hm
  choose y hmem hyt using hrep
  have hcomp : IsCompact {y : ι → ℝ | ∀ i, y i ∈ closedDigits (k i)} :=
    isCompact_pi_infinite fun i => closedDigits_compact (hk i)
  obtain ⟨z, hz, φ, hφ, hlim⟩ := hcomp.tendsto_subseq hmem
  have hsum_cont : Continuous (fun z : ι → ℝ => ∑ i, z i) :=
    continuous_finsetSum _ fun i _ => continuous_apply i
  have hsum : (∑ i, z i) = x := by
    have hh := hsum_cont.continuousAt.tendsto.comp hlim
    have hf : (fun y : ι → ℝ => ∑ i, y i) ∘ (y ∘ φ) = t ∘ φ := funext fun n => hyt (φ n)
    rw [hf] at hh
    exact tendsto_nhds_unique hh (htends.comp hφ.tendsto_atTop)
  refine ⟨z, hz, hsum, ?_⟩
  by_contra! hbad
  choose l hlt hloc using fun i => excluded_left_isolated (hk i) (hz i) (hbad i)
  have hevent : ∀ᶠ n in atTop, ∀ i, l i < y (φ n) i := eventually_all.mpr fun i =>
    (tendsto_order.mp ((continuous_apply i).continuousAt.tendsto.comp hlim)).1 _ (hlt i)
  obtain ⟨n, hn⟩ := hevent.exists
  have hle : (∑ i, z i) ≤ ∑ i, y (φ n) i :=
    sum_le_sum fun i _ => hloc i _ (hmem (φ n) i) (hn i)
  rw [hsum, hyt] at hle
  exact (not_le_of_gt (ht (φ n)).2) hle

private theorem positive_pair_replacement {k l : ℕ} (hk : 2 ≤ k) (hl : 2 ≤ l)
    {y : ℝ} (hy : y ∈ largeDigitSet k) {w : List ℕ} (hw : ∀ d ∈ w, l ≤ d) :
    ∃ y' ∈ largeDigitSet k, ∃ w' ∈ largeDigitSet l, y' + w' = y + wordValue w 0 := by
  obtain ⟨a, ha, rfl⟩ := (mem_largeDigitSet hk).mp hy
  let Q := wordScale w
  have hQ : 0 < Q := wordScale_pos hl hw
  have hlR : (2 : ℝ) ≤ l := by exact_mod_cast hl
  have hlim := tendsto_pow_atTop_nhds_zero_of_lt_one
    (by norm_num : (0 : ℝ) ≤ 1 / 2) (by norm_num : (1 : ℝ) / 2 < 1)
  obtain ⟨n, hn⟩ := ((tendsto_order.mp hlim).2 (Q / (l : ℝ)) (by positivity)).exists
  let P := ∏ j ∈ range n, width (a j)
  have hP : 0 < P := prod_pos fun j _ => width_pos (hk.trans (ha j))
  have hPQ : P ≤ Q / (l : ℝ) := (scale_le a (fun j => hk.trans (ha j)) n).trans hn.le
  let tail := value (fun j => a (n + j))
  have htail : tail ∈ largeDigitSet k :=
    (mem_largeDigitSet hk).mpr ⟨_, fun j => ha (n + j), rfl⟩
  have htail_pos := (largeDigitSet_endpoint_bounds hk htail).1
  have htail_le := (largeDigitSet_endpoint_bounds hk htail).2
  let z := P * tail
  have hz : 0 < z := mul_pos hP htail_pos
  have hzP : z ≤ P := mul_le_of_le_one_right hP.le (htail_le.trans (endpoint_le_one hk))
  have hzQr : z * (l : ℝ) ≤ Q := by
    exact (le_div_iff₀ (by linarith)).mp (hzP.trans hPQ)
  have hzQ : z ≤ Q := by nlinarith [mul_nonneg hz.le (show 0 ≤ (l : ℝ) - 1 by linarith)]
  have hkR : (2 : ℝ) ≤ k := by exact_mod_cast hk
  have hfirst : ((k : ℝ) - 1) * z ≤ P := by
    have hbound := branch_le_digitTop hk hk
    rw [endpoint_fixed hk] at hbound
    have htail' := (le_div_iff₀ (show 0 < (k : ℝ) - 1 by linarith)).mp (htail_le.trans hbound)
    have h := mul_le_mul_of_nonneg_left htail' hP.le
    dsimp [z]
    nlinarith
  have hsecond : ((l : ℝ) - 1) * z ≤ Q := by nlinarith
  obtain ⟨u, hu, v, hv, heq⟩ := two_scaled_tails hk hl hz hzP hzQ hfirst hsecond
  refine ⟨truncation a n + P * u, prefix_mem_large hk a ha n hu, wordValue w v,
    word_mem_large hl hw hv, ?_⟩
  have ha' : value a = truncation a n + z :=
    value_truncation a (fun i => hk.trans (ha i)) n
  rw [word_affine w v, ha']
  change P * u + Q * v = z at heq
  change truncation a n + P * u + (wordValue w 0 + Q * v) = _
  linarith

/-- Repairing a new coordinate preserves a chosen genuine summand and
every coordinate already repaired. -/
private theorem repair_on {ι : Type*} [Fintype ι] {k : ι → ℕ} (hk : ∀ i, 2 ≤ k i)
    (anchor : ι) (s : Finset ι) {y : ι → ℝ} (hy : ∀ i, y i ∈ closedDigits (k i))
    (ha : y anchor ∈ largeDigitSet (k anchor)) :
    ∃ z : ι → ℝ, (∀ i, z i ∈ closedDigits (k i)) ∧
      z anchor ∈ largeDigitSet (k anchor) ∧
      (∀ i ∈ s, z i ∈ largeDigitSet (k i)) ∧ (∑ i, z i) = ∑ i, y i := by
  classical
  induction s using Finset.induction_on with
  | empty => exact ⟨y, hy, ha, by simp, rfl⟩
  | @insert j s _ ih =>
    obtain ⟨z, hz, hza, hzs, hsum⟩ := ih
    by_cases hj : z j ∈ largeDigitSet (k j)
    · exact ⟨z, hz, hza, fun i hi => by
        rcases mem_insert.mp hi with rfl | hi
        · exact hj
        · exact hzs i hi, hsum⟩
    have hja : j ≠ anchor := fun h => hj (h ▸ hza)
    obtain ⟨w, hw, hjw⟩ := (finite_or_large (hk j) (hz j)).resolve_right hj
    obtain ⟨a, ha', b, hb', hab⟩ := positive_pair_replacement (hk anchor) (hk j) hza hw
    rw [← hjw] at hab
    let z' := Function.update (Function.update z anchor a) j b
    have za : z' anchor = a := by simp [z', Ne.symm hja]
    have zj : z' j = b := by simp [z']
    have zs (i : ι) (hia : i ≠ anchor) (hij : i ≠ j) : z' i = z i := by
      simp [z', Function.update_of_ne hia, Function.update_of_ne hij]
    refine ⟨z', ?_, za ▸ ha', ?_, ?_⟩
    · intro i
      by_cases hi : i = anchor
      · rw [hi, za]
        exact subset_closure ha'
      · by_cases h : i = j
        · rw [h, zj]
          exact subset_closure hb'
        · exact (zs i hi h).symm ▸ hz i
    · intro i hi
      by_cases hia : i = anchor
      · rwa [hia, za]
      · by_cases hij : i = j
        · rwa [hij, zj]
        · rw [zs i hia hij]
          exact hzs i ((mem_insert.mp hi).resolve_left hij)
    · rw [← hsum, ← sum_erase_add univ z' (Finset.mem_univ j),
        ← sum_erase_add univ z (Finset.mem_univ j)]
      have hanchor : anchor ∈ univ.erase j :=
        mem_erase.mpr ⟨Ne.symm hja, Finset.mem_univ _⟩
      rw [← sum_erase_add _ z' hanchor, ← sum_erase_add _ z hanchor, za, zj]
      have heq : (∑ i ∈ (univ.erase j).erase anchor, z' i) =
          ∑ i ∈ (univ.erase j).erase anchor, z i :=
        sum_congr rfl fun i hi => zs i (mem_erase.mp hi).1 (mem_erase.mp (mem_erase.mp hi).2).1
      rw [heq]
      linarith

/-- For any finite family of lower digit bounds with total diameter at least
one, the sum of the genuine infinite-expansion sets is the full positive hull. -/
theorem diameter_condition {ι : Type*} [Fintype ι] (k : ι → ℕ) (hk : ∀ i, 2 ≤ k i)
    (hdiam : 1 ≤ ∑ i, endpoint (k i)) :
    (sumSet fun i => largeDigitSet (k i)) = Ioc 0 (∑ i, endpoint (k i)) := by
  classical
  apply Set.Subset.antisymm
  · rintro _ ⟨y, hy, rfl⟩
    have hnonempty : (univ : Finset ι).Nonempty := by
      by_contra! h
      rw [h, sum_empty] at hdiam
      norm_num at hdiam
    exact ⟨sum_pos (fun i _ => (largeDigitSet_endpoint_bounds (hk i) (hy i)).1) hnonempty,
      sum_le_sum (fun i _ => (largeDigitSet_endpoint_bounds (hk i) (hy i)).2)⟩
  · intro x hx
    obtain ⟨y, hy, hsum, i, hi⟩ := exists_donor hk hdiam hx
    obtain ⟨z, _, _, hz, hzy⟩ := repair_on hk i univ hy hi
    exact ⟨z, fun j => hz j (Finset.mem_univ j), hzy.trans hsum⟩

/-- Coverage modulo one holds exactly at or above the total-diameter threshold. -/
theorem all_residues_iff {ι : Type*} [Fintype ι] (k : ι → ℕ) (hk : ∀ i, 2 ≤ k i) :
    (∀ x : ℝ, ∃ y ∈ (sumSet fun i => largeDigitSet (k i)), ∃ m : ℤ, x = y + m) ↔
      1 ≤ ∑ i, endpoint (k i) := by
  constructor
  · intro h
    by_contra! hlt
    let D := ∑ i, endpoint (k i)
    let x := (D + 1) / 2
    obtain ⟨y, ⟨v, hv, rfl⟩, m, hm⟩ := h x
    have hl : 0 ≤ ∑ i, v i := sum_nonneg fun i _ => (largeDigitSet_endpoint_bounds (hk i) (hv i)).1.le
    have hu : (∑ i, v i) ≤ D :=
      sum_le_sum fun i _ => (largeDigitSet_endpoint_bounds (hk i) (hv i)).2
    have hD : D < 1 := hlt
    have hx : x < 1 := by dsimp [x]; linarith
    have hxD : D < x := by dsimp [x]; linarith
    have hm₀ : (0 : ℝ) < m := by linarith
    have hm₁ : (m : ℝ) < 1 := by linarith
    have hm₀' : 0 < m := by exact_mod_cast hm₀
    have hm₁' : m < 1 := by exact_mod_cast hm₁
    omega
  · intro h x
    let m := ⌈x⌉ - 1
    have hlow := Int.ceil_lt_add_one x
    have hhigh := Int.le_ceil x
    have h0 : 0 < x - (m : ℝ) := by dsimp [m]; push_cast; linarith
    have h1 : x - (m : ℝ) ≤ 1 := by dsimp [m]; push_cast; linarith
    refine ⟨x - (m : ℝ), ?_, m, by ring⟩
    rw [diameter_condition k hk h]
    exact ⟨h0, h1.trans h⟩

/-- The written example has total diameter exactly one. -/
theorem diameter_boundary_example : (53 : ℝ) * endpoint 62 + 20 * endpoint 138 = 1 := by
  norm_num [endpoint]

end

end GravgaardLeeDiameter
