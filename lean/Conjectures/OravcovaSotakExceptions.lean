import Conjectures.OravcovaSotakBounds
import Mathlib.Logic.Equiv.Fintype
import Mathlib.Data.Fin.VecNotation

/-! Exhaustive, kernel-reduced obstructions on the three finite intervals.
A proved color permutation fixes an initial clique's colors. Constraints
are then checked as each remaining color is introduced. -/

namespace OravcovaSotak

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option synthInstance.maxSize 10000

theorem normalize_clique_coloring {D : List ℕ} {k m : ℕ}
    (C : (graph D).Coloring (Fin k)) (v : Fin m → ℤ)
    (hv : Pairwise (fun i j => (graph D).Adj (v i) (v j))) (hm : m ≤ k) :
    ∃ C' : (graph D).Coloring (Fin k),
      ∀ i : Fin m, C' (v i) = ⟨i.val,i.isLt.trans_le hm⟩ := by
  let g : Fin m → Fin k := fun i => ⟨i.val,i.isLt.trans_le hm⟩
  have hg : Function.Injective g := by
    intro i j h
    exact Fin.ext (congrArg (fun x : Fin k => x.val) h)
  obtain ⟨σ,hσ⟩ := Equiv.Perm.exists_extending_pair (C ∘ v) g
    (C.injective_comp_of_pairwise_adj v hv) hg
  let C' : (graph D).Coloring (Fin k) := SimpleGraph.Coloring.mk (σ ∘ C)
    (by intro a b hab he; exact C.valid hab (σ.injective he))
  exact ⟨C',hσ⟩

theorem exceptional5a_finite :
    (0 : Fin 5) ≠ (1 : Fin 5) →
    (0 : Fin 5) ≠ (2 : Fin 5) →
    (1 : Fin 5) ≠ (2 : Fin 5) →
    (0 : Fin 5) ≠ (3 : Fin 5) →
    (1 : Fin 5) ≠ (3 : Fin 5) →
    (2 : Fin 5) ≠ (3 : Fin 5) →
    ∀ c4 : Fin 5,
    (1 : Fin 5) ≠ c4 →
    (2 : Fin 5) ≠ c4 →
    (3 : Fin 5) ≠ c4 →
    ∀ c5 : Fin 5,
    (0 : Fin 5) ≠ c5 →
    (2 : Fin 5) ≠ c5 →
    (3 : Fin 5) ≠ c5 →
    c4 ≠ c5 →
    ∀ c6 : Fin 5,
    (1 : Fin 5) ≠ c6 →
    (3 : Fin 5) ≠ c6 →
    c4 ≠ c6 →
    c5 ≠ c6 →
    ∀ c7 : Fin 5,
    (2 : Fin 5) ≠ c7 →
    c4 ≠ c7 →
    c5 ≠ c7 →
    c6 ≠ c7 →
    ∀ c8 : Fin 5,
    (0 : Fin 5) ≠ c8 →
    (3 : Fin 5) ≠ c8 →
    c5 ≠ c8 →
    c6 ≠ c8 →
    c7 ≠ c8 →
    ∀ c9 : Fin 5,
    (1 : Fin 5) ≠ c9 →
    c4 ≠ c9 →
    c6 ≠ c9 →
    c7 ≠ c9 →
    c8 ≠ c9 →
    ∀ c10 : Fin 5,
    (2 : Fin 5) ≠ c10 →
    c5 ≠ c10 →
    c7 ≠ c10 →
    c8 ≠ c10 →
    c9 ≠ c10 →
    ∀ c11 : Fin 5,
    (3 : Fin 5) ≠ c11 →
    c6 ≠ c11 →
    c8 ≠ c11 →
    c9 ≠ c11 →
    c10 ≠ c11 →
    ∀ c12 : Fin 5,
    c4 ≠ c12 →
    c7 ≠ c12 →
    c9 ≠ c12 →
    c10 ≠ c12 →
    c11 ≠ c12 →
    False := by
  decide +kernel

theorem exceptional5a_not_colorable : ¬(graph [1,2,3,5,8]).Colorable 5 := by
  rintro ⟨C⟩
  obtain ⟨C',hc⟩ := normalize_clique_coloring C ![0,1,2,3] (by unfold Pairwise; decide +kernel) (by decide)
  have h0 : C' 0 = 0 := hc 0
  have h1 : C' 1 = 1 := hc 1
  have h2 : C' 2 = 2 := hc 2
  have h3 : C' 3 = 3 := hc 3
  exact exceptional5a_finite
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (C' 4)
    (by simpa only [h1] using C'.valid (v := 1) (w := 4) (by decide +kernel))
    (by simpa only [h2] using C'.valid (v := 2) (w := 4) (by decide +kernel))
    (by simpa only [h3] using C'.valid (v := 3) (w := 4) (by decide +kernel))
    (C' 5)
    (by simpa only [h0] using C'.valid (v := 0) (w := 5) (by decide +kernel))
    (by simpa only [h2] using C'.valid (v := 2) (w := 5) (by decide +kernel))
    (by simpa only [h3] using C'.valid (v := 3) (w := 5) (by decide +kernel))
    (C'.valid (v := 4) (w := 5) (by decide +kernel))
    (C' 6)
    (by simpa only [h1] using C'.valid (v := 1) (w := 6) (by decide +kernel))
    (by simpa only [h3] using C'.valid (v := 3) (w := 6) (by decide +kernel))
    (C'.valid (v := 4) (w := 6) (by decide +kernel))
    (C'.valid (v := 5) (w := 6) (by decide +kernel))
    (C' 7)
    (by simpa only [h2] using C'.valid (v := 2) (w := 7) (by decide +kernel))
    (C'.valid (v := 4) (w := 7) (by decide +kernel))
    (C'.valid (v := 5) (w := 7) (by decide +kernel))
    (C'.valid (v := 6) (w := 7) (by decide +kernel))
    (C' 8)
    (by simpa only [h0] using C'.valid (v := 0) (w := 8) (by decide +kernel))
    (by simpa only [h3] using C'.valid (v := 3) (w := 8) (by decide +kernel))
    (C'.valid (v := 5) (w := 8) (by decide +kernel))
    (C'.valid (v := 6) (w := 8) (by decide +kernel))
    (C'.valid (v := 7) (w := 8) (by decide +kernel))
    (C' 9)
    (by simpa only [h1] using C'.valid (v := 1) (w := 9) (by decide +kernel))
    (C'.valid (v := 4) (w := 9) (by decide +kernel))
    (C'.valid (v := 6) (w := 9) (by decide +kernel))
    (C'.valid (v := 7) (w := 9) (by decide +kernel))
    (C'.valid (v := 8) (w := 9) (by decide +kernel))
    (C' 10)
    (by simpa only [h2] using C'.valid (v := 2) (w := 10) (by decide +kernel))
    (C'.valid (v := 5) (w := 10) (by decide +kernel))
    (C'.valid (v := 7) (w := 10) (by decide +kernel))
    (C'.valid (v := 8) (w := 10) (by decide +kernel))
    (C'.valid (v := 9) (w := 10) (by decide +kernel))
    (C' 11)
    (by simpa only [h3] using C'.valid (v := 3) (w := 11) (by decide +kernel))
    (C'.valid (v := 6) (w := 11) (by decide +kernel))
    (C'.valid (v := 8) (w := 11) (by decide +kernel))
    (C'.valid (v := 9) (w := 11) (by decide +kernel))
    (C'.valid (v := 10) (w := 11) (by decide +kernel))
    (C' 12)
    (C'.valid (v := 4) (w := 12) (by decide +kernel))
    (C'.valid (v := 7) (w := 12) (by decide +kernel))
    (C'.valid (v := 9) (w := 12) (by decide +kernel))
    (C'.valid (v := 10) (w := 12) (by decide +kernel))
    (C'.valid (v := 11) (w := 12) (by decide +kernel))

theorem exceptional5a_chromaticNumber : (graph [1,2,3,5,8]).chromaticNumber = 6 := by
  apply SimpleGraph.chromaticNumber_eq_iff_colorable_not_colorable.mpr
  exact ⟨distance_colorable_length_add_one [1,2,3,5,8], exceptional5a_not_colorable⟩

theorem exceptional5b_finite :
    (0 : Fin 5) ≠ (1 : Fin 5) →
    ∀ c2 : Fin 5,
    (1 : Fin 5) ≠ c2 →
    ∀ c3 : Fin 5,
    c2 ≠ c3 →
    ∀ c4 : Fin 5,
    (0 : Fin 5) ≠ c4 →
    c3 ≠ c4 →
    (0 : Fin 5) ≠ (2 : Fin 5) →
    (1 : Fin 5) ≠ (2 : Fin 5) →
    c4 ≠ (2 : Fin 5) →
    (0 : Fin 5) ≠ (3 : Fin 5) →
    (1 : Fin 5) ≠ (3 : Fin 5) →
    c2 ≠ (3 : Fin 5) →
    (2 : Fin 5) ≠ (3 : Fin 5) →
    ∀ c7 : Fin 5,
    (0 : Fin 5) ≠ c7 →
    (1 : Fin 5) ≠ c7 →
    c2 ≠ c7 →
    c3 ≠ c7 →
    (3 : Fin 5) ≠ c7 →
    ∀ c8 : Fin 5,
    (1 : Fin 5) ≠ c8 →
    c2 ≠ c8 →
    c3 ≠ c8 →
    c4 ≠ c8 →
    c7 ≠ c8 →
    ∀ c9 : Fin 5,
    c2 ≠ c9 →
    c3 ≠ c9 →
    c4 ≠ c9 →
    (2 : Fin 5) ≠ c9 →
    c8 ≠ c9 →
    ∀ c10 : Fin 5,
    c3 ≠ c10 →
    c4 ≠ c10 →
    (2 : Fin 5) ≠ c10 →
    (3 : Fin 5) ≠ c10 →
    c9 ≠ c10 →
    ∀ c11 : Fin 5,
    c4 ≠ c11 →
    (2 : Fin 5) ≠ c11 →
    (3 : Fin 5) ≠ c11 →
    c7 ≠ c11 →
    c10 ≠ c11 →
    ∀ c12 : Fin 5,
    (2 : Fin 5) ≠ c12 →
    (3 : Fin 5) ≠ c12 →
    c7 ≠ c12 →
    c8 ≠ c12 →
    c11 ≠ c12 →
    ∀ c13 : Fin 5,
    (3 : Fin 5) ≠ c13 →
    c7 ≠ c13 →
    c8 ≠ c13 →
    c9 ≠ c13 →
    c12 ≠ c13 →
    ∀ c14 : Fin 5,
    c7 ≠ c14 →
    c8 ≠ c14 →
    c9 ≠ c14 →
    c10 ≠ c14 →
    c13 ≠ c14 →
    ∀ c15 : Fin 5,
    c8 ≠ c15 →
    c9 ≠ c15 →
    c10 ≠ c15 →
    c11 ≠ c15 →
    c14 ≠ c15 →
    ∀ c16 : Fin 5,
    c9 ≠ c16 →
    c10 ≠ c16 →
    c11 ≠ c16 →
    c12 ≠ c16 →
    c15 ≠ c16 →
    False := by
  decide +kernel

theorem exceptional5b_not_colorable : ¬(graph [1,4,5,6,7]).Colorable 5 := by
  rintro ⟨C⟩
  obtain ⟨C',hc⟩ := normalize_clique_coloring C ![0,1,5,6] (by unfold Pairwise; decide +kernel) (by decide)
  have h0 : C' 0 = 0 := hc 0
  have h1 : C' 1 = 1 := hc 1
  have h5 : C' 5 = 2 := hc 2
  have h6 : C' 6 = 3 := hc 3
  exact exceptional5b_finite
    (by decide +kernel)
    (C' 2)
    (by simpa only [h1] using C'.valid (v := 1) (w := 2) (by decide +kernel))
    (C' 3)
    (C'.valid (v := 2) (w := 3) (by decide +kernel))
    (C' 4)
    (by simpa only [h0] using C'.valid (v := 0) (w := 4) (by decide +kernel))
    (C'.valid (v := 3) (w := 4) (by decide +kernel))
    (by decide +kernel)
    (by decide +kernel)
    (by simpa only [h5] using C'.valid (v := 4) (w := 5) (by decide +kernel))
    (by decide +kernel)
    (by decide +kernel)
    (by simpa only [h6] using C'.valid (v := 2) (w := 6) (by decide +kernel))
    (by decide +kernel)
    (C' 7)
    (by simpa only [h0] using C'.valid (v := 0) (w := 7) (by decide +kernel))
    (by simpa only [h1] using C'.valid (v := 1) (w := 7) (by decide +kernel))
    (C'.valid (v := 2) (w := 7) (by decide +kernel))
    (C'.valid (v := 3) (w := 7) (by decide +kernel))
    (by simpa only [h6] using C'.valid (v := 6) (w := 7) (by decide +kernel))
    (C' 8)
    (by simpa only [h1] using C'.valid (v := 1) (w := 8) (by decide +kernel))
    (C'.valid (v := 2) (w := 8) (by decide +kernel))
    (C'.valid (v := 3) (w := 8) (by decide +kernel))
    (C'.valid (v := 4) (w := 8) (by decide +kernel))
    (C'.valid (v := 7) (w := 8) (by decide +kernel))
    (C' 9)
    (C'.valid (v := 2) (w := 9) (by decide +kernel))
    (C'.valid (v := 3) (w := 9) (by decide +kernel))
    (C'.valid (v := 4) (w := 9) (by decide +kernel))
    (by simpa only [h5] using C'.valid (v := 5) (w := 9) (by decide +kernel))
    (C'.valid (v := 8) (w := 9) (by decide +kernel))
    (C' 10)
    (C'.valid (v := 3) (w := 10) (by decide +kernel))
    (C'.valid (v := 4) (w := 10) (by decide +kernel))
    (by simpa only [h5] using C'.valid (v := 5) (w := 10) (by decide +kernel))
    (by simpa only [h6] using C'.valid (v := 6) (w := 10) (by decide +kernel))
    (C'.valid (v := 9) (w := 10) (by decide +kernel))
    (C' 11)
    (C'.valid (v := 4) (w := 11) (by decide +kernel))
    (by simpa only [h5] using C'.valid (v := 5) (w := 11) (by decide +kernel))
    (by simpa only [h6] using C'.valid (v := 6) (w := 11) (by decide +kernel))
    (C'.valid (v := 7) (w := 11) (by decide +kernel))
    (C'.valid (v := 10) (w := 11) (by decide +kernel))
    (C' 12)
    (by simpa only [h5] using C'.valid (v := 5) (w := 12) (by decide +kernel))
    (by simpa only [h6] using C'.valid (v := 6) (w := 12) (by decide +kernel))
    (C'.valid (v := 7) (w := 12) (by decide +kernel))
    (C'.valid (v := 8) (w := 12) (by decide +kernel))
    (C'.valid (v := 11) (w := 12) (by decide +kernel))
    (C' 13)
    (by simpa only [h6] using C'.valid (v := 6) (w := 13) (by decide +kernel))
    (C'.valid (v := 7) (w := 13) (by decide +kernel))
    (C'.valid (v := 8) (w := 13) (by decide +kernel))
    (C'.valid (v := 9) (w := 13) (by decide +kernel))
    (C'.valid (v := 12) (w := 13) (by decide +kernel))
    (C' 14)
    (C'.valid (v := 7) (w := 14) (by decide +kernel))
    (C'.valid (v := 8) (w := 14) (by decide +kernel))
    (C'.valid (v := 9) (w := 14) (by decide +kernel))
    (C'.valid (v := 10) (w := 14) (by decide +kernel))
    (C'.valid (v := 13) (w := 14) (by decide +kernel))
    (C' 15)
    (C'.valid (v := 8) (w := 15) (by decide +kernel))
    (C'.valid (v := 9) (w := 15) (by decide +kernel))
    (C'.valid (v := 10) (w := 15) (by decide +kernel))
    (C'.valid (v := 11) (w := 15) (by decide +kernel))
    (C'.valid (v := 14) (w := 15) (by decide +kernel))
    (C' 16)
    (C'.valid (v := 9) (w := 16) (by decide +kernel))
    (C'.valid (v := 10) (w := 16) (by decide +kernel))
    (C'.valid (v := 11) (w := 16) (by decide +kernel))
    (C'.valid (v := 12) (w := 16) (by decide +kernel))
    (C'.valid (v := 15) (w := 16) (by decide +kernel))

theorem exceptional5b_chromaticNumber : (graph [1,4,5,6,7]).chromaticNumber = 6 := by
  apply SimpleGraph.chromaticNumber_eq_iff_colorable_not_colorable.mpr
  exact ⟨distance_colorable_length_add_one [1,4,5,6,7], exceptional5b_not_colorable⟩

theorem exceptional7_finite :
    (0 : Fin 7) ≠ (1 : Fin 7) →
    (0 : Fin 7) ≠ (2 : Fin 7) →
    (1 : Fin 7) ≠ (2 : Fin 7) →
    (0 : Fin 7) ≠ (3 : Fin 7) →
    (1 : Fin 7) ≠ (3 : Fin 7) →
    (2 : Fin 7) ≠ (3 : Fin 7) →
    (0 : Fin 7) ≠ (4 : Fin 7) →
    (1 : Fin 7) ≠ (4 : Fin 7) →
    (2 : Fin 7) ≠ (4 : Fin 7) →
    (3 : Fin 7) ≠ (4 : Fin 7) →
    (0 : Fin 7) ≠ (5 : Fin 7) →
    (1 : Fin 7) ≠ (5 : Fin 7) →
    (2 : Fin 7) ≠ (5 : Fin 7) →
    (3 : Fin 7) ≠ (5 : Fin 7) →
    (4 : Fin 7) ≠ (5 : Fin 7) →
    ∀ c6 : Fin 7,
    (1 : Fin 7) ≠ c6 →
    (2 : Fin 7) ≠ c6 →
    (3 : Fin 7) ≠ c6 →
    (4 : Fin 7) ≠ c6 →
    (5 : Fin 7) ≠ c6 →
    ∀ c7 : Fin 7,
    (0 : Fin 7) ≠ c7 →
    (2 : Fin 7) ≠ c7 →
    (3 : Fin 7) ≠ c7 →
    (4 : Fin 7) ≠ c7 →
    (5 : Fin 7) ≠ c7 →
    c6 ≠ c7 →
    ∀ c8 : Fin 7,
    (1 : Fin 7) ≠ c8 →
    (3 : Fin 7) ≠ c8 →
    (4 : Fin 7) ≠ c8 →
    (5 : Fin 7) ≠ c8 →
    c6 ≠ c8 →
    c7 ≠ c8 →
    ∀ c9 : Fin 7,
    (2 : Fin 7) ≠ c9 →
    (4 : Fin 7) ≠ c9 →
    (5 : Fin 7) ≠ c9 →
    c6 ≠ c9 →
    c7 ≠ c9 →
    c8 ≠ c9 →
    ∀ c10 : Fin 7,
    (3 : Fin 7) ≠ c10 →
    (5 : Fin 7) ≠ c10 →
    c6 ≠ c10 →
    c7 ≠ c10 →
    c8 ≠ c10 →
    c9 ≠ c10 →
    ∀ c11 : Fin 7,
    (4 : Fin 7) ≠ c11 →
    c6 ≠ c11 →
    c7 ≠ c11 →
    c8 ≠ c11 →
    c9 ≠ c11 →
    c10 ≠ c11 →
    ∀ c12 : Fin 7,
    (0 : Fin 7) ≠ c12 →
    (5 : Fin 7) ≠ c12 →
    c7 ≠ c12 →
    c8 ≠ c12 →
    c9 ≠ c12 →
    c10 ≠ c12 →
    c11 ≠ c12 →
    ∀ c13 : Fin 7,
    (1 : Fin 7) ≠ c13 →
    c6 ≠ c13 →
    c8 ≠ c13 →
    c9 ≠ c13 →
    c10 ≠ c13 →
    c11 ≠ c13 →
    c12 ≠ c13 →
    ∀ c14 : Fin 7,
    (2 : Fin 7) ≠ c14 →
    c7 ≠ c14 →
    c9 ≠ c14 →
    c10 ≠ c14 →
    c11 ≠ c14 →
    c12 ≠ c14 →
    c13 ≠ c14 →
    ∀ c15 : Fin 7,
    (3 : Fin 7) ≠ c15 →
    c8 ≠ c15 →
    c10 ≠ c15 →
    c11 ≠ c15 →
    c12 ≠ c15 →
    c13 ≠ c15 →
    c14 ≠ c15 →
    ∀ c16 : Fin 7,
    (4 : Fin 7) ≠ c16 →
    c9 ≠ c16 →
    c11 ≠ c16 →
    c12 ≠ c16 →
    c13 ≠ c16 →
    c14 ≠ c16 →
    c15 ≠ c16 →
    ∀ c17 : Fin 7,
    (5 : Fin 7) ≠ c17 →
    c10 ≠ c17 →
    c12 ≠ c17 →
    c13 ≠ c17 →
    c14 ≠ c17 →
    c15 ≠ c17 →
    c16 ≠ c17 →
    ∀ c18 : Fin 7,
    c6 ≠ c18 →
    c11 ≠ c18 →
    c13 ≠ c18 →
    c14 ≠ c18 →
    c15 ≠ c18 →
    c16 ≠ c18 →
    c17 ≠ c18 →
    False := by
  decide +kernel

theorem exceptional7_not_colorable : ¬(graph [1,2,3,4,5,7,12]).Colorable 7 := by
  rintro ⟨C⟩
  obtain ⟨C',hc⟩ := normalize_clique_coloring C ![0,1,2,3,4,5] (by unfold Pairwise; decide +kernel) (by decide)
  have h0 : C' 0 = 0 := hc 0
  have h1 : C' 1 = 1 := hc 1
  have h2 : C' 2 = 2 := hc 2
  have h3 : C' 3 = 3 := hc 3
  have h4 : C' 4 = 4 := hc 4
  have h5 : C' 5 = 5 := hc 5
  exact exceptional7_finite
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (by decide +kernel)
    (C' 6)
    (by simpa only [h1] using C'.valid (v := 1) (w := 6) (by decide +kernel))
    (by simpa only [h2] using C'.valid (v := 2) (w := 6) (by decide +kernel))
    (by simpa only [h3] using C'.valid (v := 3) (w := 6) (by decide +kernel))
    (by simpa only [h4] using C'.valid (v := 4) (w := 6) (by decide +kernel))
    (by simpa only [h5] using C'.valid (v := 5) (w := 6) (by decide +kernel))
    (C' 7)
    (by simpa only [h0] using C'.valid (v := 0) (w := 7) (by decide +kernel))
    (by simpa only [h2] using C'.valid (v := 2) (w := 7) (by decide +kernel))
    (by simpa only [h3] using C'.valid (v := 3) (w := 7) (by decide +kernel))
    (by simpa only [h4] using C'.valid (v := 4) (w := 7) (by decide +kernel))
    (by simpa only [h5] using C'.valid (v := 5) (w := 7) (by decide +kernel))
    (C'.valid (v := 6) (w := 7) (by decide +kernel))
    (C' 8)
    (by simpa only [h1] using C'.valid (v := 1) (w := 8) (by decide +kernel))
    (by simpa only [h3] using C'.valid (v := 3) (w := 8) (by decide +kernel))
    (by simpa only [h4] using C'.valid (v := 4) (w := 8) (by decide +kernel))
    (by simpa only [h5] using C'.valid (v := 5) (w := 8) (by decide +kernel))
    (C'.valid (v := 6) (w := 8) (by decide +kernel))
    (C'.valid (v := 7) (w := 8) (by decide +kernel))
    (C' 9)
    (by simpa only [h2] using C'.valid (v := 2) (w := 9) (by decide +kernel))
    (by simpa only [h4] using C'.valid (v := 4) (w := 9) (by decide +kernel))
    (by simpa only [h5] using C'.valid (v := 5) (w := 9) (by decide +kernel))
    (C'.valid (v := 6) (w := 9) (by decide +kernel))
    (C'.valid (v := 7) (w := 9) (by decide +kernel))
    (C'.valid (v := 8) (w := 9) (by decide +kernel))
    (C' 10)
    (by simpa only [h3] using C'.valid (v := 3) (w := 10) (by decide +kernel))
    (by simpa only [h5] using C'.valid (v := 5) (w := 10) (by decide +kernel))
    (C'.valid (v := 6) (w := 10) (by decide +kernel))
    (C'.valid (v := 7) (w := 10) (by decide +kernel))
    (C'.valid (v := 8) (w := 10) (by decide +kernel))
    (C'.valid (v := 9) (w := 10) (by decide +kernel))
    (C' 11)
    (by simpa only [h4] using C'.valid (v := 4) (w := 11) (by decide +kernel))
    (C'.valid (v := 6) (w := 11) (by decide +kernel))
    (C'.valid (v := 7) (w := 11) (by decide +kernel))
    (C'.valid (v := 8) (w := 11) (by decide +kernel))
    (C'.valid (v := 9) (w := 11) (by decide +kernel))
    (C'.valid (v := 10) (w := 11) (by decide +kernel))
    (C' 12)
    (by simpa only [h0] using C'.valid (v := 0) (w := 12) (by decide +kernel))
    (by simpa only [h5] using C'.valid (v := 5) (w := 12) (by decide +kernel))
    (C'.valid (v := 7) (w := 12) (by decide +kernel))
    (C'.valid (v := 8) (w := 12) (by decide +kernel))
    (C'.valid (v := 9) (w := 12) (by decide +kernel))
    (C'.valid (v := 10) (w := 12) (by decide +kernel))
    (C'.valid (v := 11) (w := 12) (by decide +kernel))
    (C' 13)
    (by simpa only [h1] using C'.valid (v := 1) (w := 13) (by decide +kernel))
    (C'.valid (v := 6) (w := 13) (by decide +kernel))
    (C'.valid (v := 8) (w := 13) (by decide +kernel))
    (C'.valid (v := 9) (w := 13) (by decide +kernel))
    (C'.valid (v := 10) (w := 13) (by decide +kernel))
    (C'.valid (v := 11) (w := 13) (by decide +kernel))
    (C'.valid (v := 12) (w := 13) (by decide +kernel))
    (C' 14)
    (by simpa only [h2] using C'.valid (v := 2) (w := 14) (by decide +kernel))
    (C'.valid (v := 7) (w := 14) (by decide +kernel))
    (C'.valid (v := 9) (w := 14) (by decide +kernel))
    (C'.valid (v := 10) (w := 14) (by decide +kernel))
    (C'.valid (v := 11) (w := 14) (by decide +kernel))
    (C'.valid (v := 12) (w := 14) (by decide +kernel))
    (C'.valid (v := 13) (w := 14) (by decide +kernel))
    (C' 15)
    (by simpa only [h3] using C'.valid (v := 3) (w := 15) (by decide +kernel))
    (C'.valid (v := 8) (w := 15) (by decide +kernel))
    (C'.valid (v := 10) (w := 15) (by decide +kernel))
    (C'.valid (v := 11) (w := 15) (by decide +kernel))
    (C'.valid (v := 12) (w := 15) (by decide +kernel))
    (C'.valid (v := 13) (w := 15) (by decide +kernel))
    (C'.valid (v := 14) (w := 15) (by decide +kernel))
    (C' 16)
    (by simpa only [h4] using C'.valid (v := 4) (w := 16) (by decide +kernel))
    (C'.valid (v := 9) (w := 16) (by decide +kernel))
    (C'.valid (v := 11) (w := 16) (by decide +kernel))
    (C'.valid (v := 12) (w := 16) (by decide +kernel))
    (C'.valid (v := 13) (w := 16) (by decide +kernel))
    (C'.valid (v := 14) (w := 16) (by decide +kernel))
    (C'.valid (v := 15) (w := 16) (by decide +kernel))
    (C' 17)
    (by simpa only [h5] using C'.valid (v := 5) (w := 17) (by decide +kernel))
    (C'.valid (v := 10) (w := 17) (by decide +kernel))
    (C'.valid (v := 12) (w := 17) (by decide +kernel))
    (C'.valid (v := 13) (w := 17) (by decide +kernel))
    (C'.valid (v := 14) (w := 17) (by decide +kernel))
    (C'.valid (v := 15) (w := 17) (by decide +kernel))
    (C'.valid (v := 16) (w := 17) (by decide +kernel))
    (C' 18)
    (C'.valid (v := 6) (w := 18) (by decide +kernel))
    (C'.valid (v := 11) (w := 18) (by decide +kernel))
    (C'.valid (v := 13) (w := 18) (by decide +kernel))
    (C'.valid (v := 14) (w := 18) (by decide +kernel))
    (C'.valid (v := 15) (w := 18) (by decide +kernel))
    (C'.valid (v := 16) (w := 18) (by decide +kernel))
    (C'.valid (v := 17) (w := 18) (by decide +kernel))

theorem exceptional7_chromaticNumber : (graph [1,2,3,4,5,7,12]).chromaticNumber = 8 := by
  apply SimpleGraph.chromaticNumber_eq_iff_colorable_not_colorable.mpr
  exact ⟨distance_colorable_length_add_one [1,2,3,4,5,7,12], exceptional7_not_colorable⟩

end OravcovaSotak
