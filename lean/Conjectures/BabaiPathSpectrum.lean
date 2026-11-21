import Mathlib.Combinatorics.SimpleGraph.Coloring.Vertex
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Data.Finset.Max
import Mathlib.Data.Nat.Dist
import Mathlib.Data.Nat.ModEq
import Mathlib.Data.Rat.Floor
import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Tactic.ByContra

/-!
# The Babai spectra of finite paths

The distance graph on `Fin n` has an edge precisely when the absolute
difference of two distinct vertices belongs to the prescribed distance set.
Its chromatic number is mathlib's `SimpleGraph.chromaticNumber`.

This file formalizes the proof in `results/babai-spectrum-paths/PROOF.md`,
contributed by aadrianvv. The independent-set bound supplies the missing
inclusion in Johnson--Kaya--Matzke's Conjecture 2.1. The converse is proved
here from the explicit modular coloring and clique construction, without
assuming the source's realization theorem.
-/

namespace BabaiPathSpectrum

open Finset

/-- The graph defined by the permitted distances on an `n`-vertex path. -/
def distanceGraph (n : ℕ) (D : Finset ℕ) : SimpleGraph (Fin n) where
  Adj u v := u ≠ v ∧ Nat.dist u.val v.val ∈ D
  symm.symm := by
    intro u v h
    exact ⟨h.1.symm, by simpa [Nat.dist_comm] using h.2⟩
  loopless.irrefl := by simp

/-- Exactly the positive distances smaller than the number of vertices. -/
def ValidDistances (n : ℕ) (D : Finset ℕ) : Prop := D ⊆ Ico 1 n

/-- Babai's `k`-spectrum, using the actual finite graph chromatic number. -/
def spectrum (n k : ℕ) : Set ℕ :=
  {s | ∃ D : Finset ℕ, ValidDistances n D ∧ D.card = k ∧
    (distanceGraph n D).chromaticNumber = (s : ℕ∞)}

/-- Shifting an independent set by its least vertex gives distinct
distances outside `D`, including zero. -/
theorem independent_card_bound (n : ℕ) (D : Finset ℕ)
    (hD : ValidDistances n D) (S : Finset (Fin n))
    (hS : ∀ u ∈ S, ∀ v ∈ S, ¬(distanceGraph n D).Adj u v) :
    S.card + D.card ≤ n := by
  classical
  by_cases hne : S.Nonempty
  · let a := S.min' hne
    have ha : a ∈ S := min'_mem S hne
    have hamin (x : Fin n) (hx : x ∈ S) : a.val ≤ x.val :=
      min'_le S x hx
    let T := S.image (fun x => x.val - a.val)
    have hTcard : T.card = S.card := by
      apply card_image_of_injOn
      intro x hx y hy hxy
      change x.val - a.val = y.val - a.val at hxy
      apply Fin.ext
      have hax := hamin x hx
      have hay := hamin y hy
      omega
    have hTrange : T ⊆ range n := by
      intro z hz
      obtain ⟨x, hx, rfl⟩ := mem_image.mp hz
      exact mem_range.mpr (lt_of_le_of_lt (Nat.sub_le _ _) x.isLt)
    have hDrange : D ⊆ range n := by
      intro d hd
      exact mem_range.mpr (mem_Ico.mp (hD hd)).2
    have hdisj : Disjoint T D := by
      apply disjoint_left.mpr
      intro d hd hdD
      obtain ⟨x, hx, rfl⟩ := mem_image.mp hd
      have hp := (mem_Ico.mp (hD hdD)).1
      have hax := hamin x hx
      apply hS a ha x hx
      refine ⟨?_, ?_⟩
      · intro he
        subst x
        omega
      · simpa [Nat.dist_eq_sub_of_le hax] using hdD
    have hcard := card_le_card (union_subset hTrange hDrange)
    rw [card_union_of_disjoint hdisj, hTcard, card_range] at hcard
    exact hcard
  · have hS0 : S = ∅ := not_nonempty_iff_eq_empty.mp hne
    rw [hS0]
    simp only [card_empty, zero_add]
    calc
      D.card ≤ (range n).card := card_le_card (by
        intro d hd
        exact mem_range.mpr (mem_Ico.mp (hD hd)).2)
      _ = n := card_range n

/-- Every proper `c`-coloring uses enough colors to cover the vertices. -/
theorem coloring_card_bound (n : ℕ) (D : Finset ℕ)
    (hD : ValidDistances n D) (c : ℕ)
    (C : (distanceGraph n D).Coloring (Fin c)) :
    n ≤ c * (n - D.card) := by
  classical
  have hfiber : ∀ i : Fin c,
      ((univ : Finset (Fin n)).filter (fun v => C v = i)).card ≤ n - D.card := by
    intro i
    have hb := independent_card_bound n D hD
      ((univ : Finset (Fin n)).filter (fun v => C v = i)) (by
        intro u hu v hv hadj
        exact C.valid hadj ((mem_filter.mp hu).2.trans (mem_filter.mp hv).2.symm))
    omega
  have hcard := card_eq_sum_card_fiberwise
    (s := (univ : Finset (Fin n))) (t := (univ : Finset (Fin c))) (f := C)
    (by intro x hx; exact mem_univ _)
  have hsum := sum_le_sum (fun i (_ : i ∈ (univ : Finset (Fin c))) => hfiber i)
  simpa [← hcard] using hsum

/-- Greedy coloring in the natural order. At each step there are at most
`D.card` already colored neighbors. -/
theorem ordered_coloring_exists (D : Finset ℕ) (n : ℕ) :
    ∃ f : ℕ → Fin (D.card + 1), ∀ u v : ℕ,
      u < v → v < n → v-u ∈ D → f u ≠ f v := by
  classical
  induction n with
  | zero =>
      exact ⟨fun _ => 0, by intros; omega⟩
  | succ n ih =>
      obtain ⟨f, hf⟩ := ih
      let N := (range n).filter (fun u => n-u ∈ D)
      let F := N.image f
      have hNinj : Set.InjOn (fun u => n-u) N := by
        intro u hu v hv huv
        change n-u = n-v at huv
        have hu' := mem_range.mp (mem_filter.mp hu).1
        have hv' := mem_range.mp (mem_filter.mp hv).1
        omega
      have hNsub : N.image (fun u => n-u) ⊆ D := by
        intro d hd
        obtain ⟨u, hu, rfl⟩ := mem_image.mp hd
        exact (mem_filter.mp hu).2
      have hNcard : N.card ≤ D.card := by
        rw [← card_image_of_injOn hNinj]
        exact card_le_card hNsub
      have hFcard : F.card ≤ D.card := (card_image_le).trans hNcard
      obtain ⟨c, hc⟩ : ∃ c : Fin (D.card + 1), c ∉ F := by
        by_contra! h
        have hu : (univ : Finset (Fin (D.card + 1))) ⊆ F := by
          intro c hc
          exact h c
        have hh := card_le_card hu
        simp only [card_univ, Fintype.card_fin] at hh
        omega
      refine ⟨fun v => if v = n then c else f v, ?_⟩
      intro u v huv hv hd
      have hun : u ≠ n := by omega
      by_cases hvn : v = n
      · subst v
        simp only [ite_eq_right hun]
        intro huc
        apply hc
        exact mem_image.mpr ⟨u, mem_filter.mpr ⟨mem_range.mpr huv, hd⟩, huc⟩
      · simp only [ite_eq_right hun, ite_eq_right hvn]
        exact hf u v huv (by omega) hd

theorem colorable_card_add_one (n : ℕ) (D : Finset ℕ) :
    (distanceGraph n D).Colorable (D.card + 1) := by
  obtain ⟨f, hf⟩ := ordered_coloring_exists D n
  refine ⟨SimpleGraph.Coloring.mk (fun v => f v.val) ?_⟩
  intro u v huv
  by_cases h : u.val < v.val
  · exact hf u.val v.val h v.isLt (by
      simpa [Nat.dist_eq_sub_of_le h.le] using huv.2)
  · have h' : v.val < u.val := by
      have hne : u.val ≠ v.val := fun he => huv.1 (Fin.ext he)
      omega
    exact (hf v.val u.val h' u.isLt (by
      simpa [Nat.dist_eq_sub_of_le_right h'.le] using huv.2)).symm

/-- Candidate distances for the realization of the value `s`. -/
def nonmultiples (n s : ℕ) : Finset ℕ := (Ico 1 n).filter (fun d => ¬s ∣ d)

theorem nonmultiples_card_lower (n k s : ℕ) (hkn : k < n) (hs : 0 < s)
    (hns : n ≤ s * (n-k)) :
    k ≤ (nonmultiples n s).card := by
  classical
  let M := (Ico 1 n).filter (fun d => s ∣ d)
  have hmap : M.image (fun d => d/s) ⊆ Ico 1 (n-k) := by
    intro q hq
    obtain ⟨d, hd, rfl⟩ := mem_image.mp hq
    obtain ⟨hdI, hsd⟩ := mem_filter.mp hd
    obtain ⟨hdpos, hdn⟩ := mem_Ico.mp hdI
    have hcancel := Nat.div_mul_cancel hsd
    apply mem_Ico.mpr
    change 1 ≤ d/s ∧ d/s < n-k
    constructor
    · apply Nat.pos_of_ne_zero
      intro hq0
      rw [hq0, zero_mul] at hcancel
      omega
    · apply (Nat.div_lt_iff_lt_mul hs).mpr
      exact hdn.trans_le (by simpa [Nat.mul_comm] using hns)
  have hinj : Set.InjOn (fun d => d/s) M := by
    intro a ha b hb he
    change a/s = b/s at he
    have ha' := Nat.div_mul_cancel (mem_filter.mp ha).2
    have hb' := Nat.div_mul_cancel (mem_filter.mp hb).2
    rw [he] at ha'
    omega
  have hMcard : M.card ≤ n-k-1 := by
    rw [← card_image_of_injOn hinj]
    simpa using card_le_card hmap
  have hpartition := card_filter_add_card_filter_not
    (s := Ico 1 n) (p := fun d => s ∣ d)
  change M.card + (nonmultiples n s).card = (Ico 1 n).card at hpartition
  simp only [Nat.card_Ico] at hpartition
  omega

theorem initial_distances_subset (n s : ℕ) (hsn : s ≤ n) :
    Ico 1 s ⊆ nonmultiples n s := by
  intro d hd
  obtain ⟨hdpos, hds⟩ := mem_Ico.mp hd
  apply mem_filter.mpr
  refine ⟨mem_Ico.mpr ⟨hdpos, hds.trans_le hsn⟩, ?_⟩
  intro hsd
  have := Nat.le_of_dvd (by omega : 0 < d) hsd
  omega

/-- Choose exactly `k` nonmultiples, retaining the first `s-1` distances. -/
theorem realizing_distances (n k s : ℕ) (hkn : k < n) (hs : 0 < s)
    (hsk : s ≤ k+1) (hns : n ≤ s*(n-k)) :
    ∃ D : Finset ℕ, Ico 1 s ⊆ D ∧ D ⊆ nonmultiples n s ∧ D.card = k := by
  classical
  have hsn : s ≤ n := by omega
  have hL := initial_distances_subset n s hsn
  have hsmall : (Ico 1 s).card ≤ k := by simp only [Nat.card_Ico]; omega
  have hlarge := nonmultiples_card_lower n k s hkn hs hns
  exact exists_subsuperset_card_eq hL hsmall hlarge

/-- Reduction modulo `s` colors a graph all of whose distances are
nonmultiples of `s`. -/
theorem modular_colorable (n s : ℕ) (D : Finset ℕ) (hs : 0 < s)
    (hD : D ⊆ nonmultiples n s) : (distanceGraph n D).Colorable s := by
  refine ⟨SimpleGraph.Coloring.mk (fun v => ⟨v.val % s, Nat.mod_lt _ hs⟩) ?_⟩
  intro u v huv he
  have he' : u.val % s = v.val % s := congrArg Fin.val he
  have hm : u.val ≡ v.val [MOD s] := he'
  have hnodvd := (mem_filter.mp (hD huv.2)).2
  apply hnodvd
  by_cases h : u.val ≤ v.val
  · rw [Nat.dist_eq_sub_of_le h]
    exact hm.dvd'
  · rw [Nat.dist_eq_sub_of_le_right (by omega)]
    exact hm.symm.dvd'

/-- The first `s` vertices form a clique when distances `1,...,s-1`
are all present. -/
theorem clique_lower (n s : ℕ) (D : Finset ℕ) (hsn : s ≤ n)
    (hD : Ico 1 s ⊆ D) : (s : ℕ∞) ≤ (distanceGraph n D).chromaticNumber := by
  apply SimpleGraph.le_chromaticNumber_of_pairwise_adj
    (ι := Fin s) (by simp) (fun i => (⟨i.val, i.isLt.trans_le hsn⟩ : Fin n))
  intro i j hij
  change (⟨i.val, i.isLt.trans_le hsn⟩ : Fin n) ≠
    ⟨j.val, j.isLt.trans_le hsn⟩ ∧ Nat.dist i.val j.val ∈ D
  refine ⟨?_, hD ?_⟩
  · intro he
    apply hij
    exact Fin.ext (congrArg (fun v : Fin n => v.val) he)
  · apply mem_Ico.mpr
    have hne : i.val ≠ j.val := fun he => hij (Fin.ext he)
    by_cases h : i.val ≤ j.val
    · rw [Nat.dist_eq_sub_of_le h]
      exact ⟨by omega, lt_of_le_of_lt (Nat.sub_le _ _) j.isLt⟩
    · rw [Nat.dist_eq_sub_of_le_right (by omega)]
      exact ⟨by omega, lt_of_le_of_lt (Nat.sub_le _ _) i.isLt⟩

theorem realize_chromatic_number (n k s : ℕ) (hkn : k < n) (hs : 0 < s)
    (hsk : s ≤ k+1) (hns : n ≤ s*(n-k)) : s ∈ spectrum n k := by
  obtain ⟨D, hLD, hD, hcard⟩ := realizing_distances n k s hkn hs hsk hns
  refine ⟨D, ?_, hcard, ?_⟩
  · intro d hd
    exact (mem_filter.mp (hD hd)).1
  · exact le_antisymm (modular_colorable n s D hs hD).chromaticNumber_le
      (clique_lower n s D (by omega) hLD)

/-- An integer-only form of the full spectrum theorem. -/
theorem mem_spectrum_iff (n k s : ℕ) (hn : 0 < n) (hkn : k < n) :
    s ∈ spectrum n k ↔ n ≤ s*(n-k) ∧ s ≤ k+1 := by
  constructor
  · rintro ⟨D, hD, hcard, hchi⟩
    constructor
    · have hc : (distanceGraph n D).Colorable s :=
        SimpleGraph.chromaticNumber_le_iff_colorable.mp (by rw [hchi])
      obtain ⟨C⟩ := hc
      simpa [hcard] using coloring_card_bound n D hD s C
    · have hu := (colorable_card_add_one n D).chromaticNumber_le
      rw [hchi, hcard] at hu
      exact_mod_cast hu
  · rintro ⟨hns, hsk⟩
    have hs : 0 < s := by
      by_contra h
      have hz : s = 0 := by omega
      simp [hz] at hns
      omega
    exact realize_chromatic_number n k s hkn hs hsk hns

/-- The full Johnson--Kaya--Matzke path-spectrum formula, for all
admissible path sizes and cardinalities of the distance set. -/
theorem spectrum_eq_interval (n k : ℕ) (hn : 2 ≤ n) (_hk : 1 ≤ k) (hkn : k < n) :
    spectrum n k = Set.Icc ⌈(n : ℚ) / (n-k : ℕ)⌉₊ (k+1) := by
  ext s
  rw [mem_spectrum_iff n k s (by omega) hkn, Set.mem_Icc,
    Nat.ceil_le, div_le_iff₀ (by exact_mod_cast (show 0 < n-k by omega))]
  norm_cast

end BabaiPathSpectrum
