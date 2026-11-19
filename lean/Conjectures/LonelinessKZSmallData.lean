import Conjectures.LonelinessKZGeneral
import Init.Data.RArray

/-! Generated exact certificates for smaller prefix problems.
All real variables remain universally quantified. The geometric
basis, prefix estimates, and determinant identity are separate inputs. -/

namespace Loneliness.KZSmall
open scoped BigOperators
open KZProduct

set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace SixSpectrumRankFour

/-! Threshold 1/6; containing-space lower bounds 2/11, 1/5, 1/4.
The exact increment product is 56/741200625. -/

def scale : ℕ := 108900
def boundData : Array ℕ := #[0, 100, 484, 3025]
def bounds (r : ℕ) : ℕ := boundData[r]?.getD 0

def rowData : Lean.RArray DualRow :=
  (.branch 4
    (.branch 2
      (.branch 1
        (.leaf ⟨1, #[0, 0, 0, 0, 0, 0]⟩)
        (.leaf ⟨1, #[1, 0, 0, 0, 0, 0]⟩)
      )
      (.branch 3
        (.leaf ⟨7, #[0, 3, 0, 1, 0, 0]⟩)
        (.leaf ⟨1, #[0, 1, 0, 0, 0, 0]⟩)
      )
    )
    (.branch 6
      (.branch 5
        (.leaf ⟨37, #[0, 0, 9, 3, 7, 0]⟩)
        (.leaf ⟨7, #[4, 0, 3, 0, 1, 0]⟩)
      )
      (.branch 7
        (.leaf ⟨37, #[0, 0, 21, 7, 4, 0]⟩)
        (.leaf ⟨1, #[0, 0, 1, 0, 0, 0]⟩)
      )
    )
  )

noncomputable def row (m : Fin (2^3)) : DualRow := rowData.get m.val

private theorem block_0 : ∀ j : Fin 8,
    DualValid 3 bounds (fun i => (0*8+j.val).testBit i.val)
      (row ⟨0*8+j.val, by omega⟩) := by decide +kernel

theorem rows_valid (m : Fin (2^3)) :
    DualValid 3 bounds (fun i => m.val.testBit i.val) (row m) := by
  let q := m.val / 8
  let j : Fin 8 := ⟨m.val % 8, Nat.mod_lt _ (by decide)⟩
  have hq : q < 1 := by dsimp [q]; omega
  have he : m.val = q*8+j.val := by dsimp [q,j]; omega
  interval_cases q
  · have hm : m = ⟨0*8+j.val, by omega⟩ := Fin.ext he
    rw [hm]
    exact block_0 j

theorem increment_positive : ∀ i < 3, 0 < KZGeneral.increment bounds scale i := by
  intro i hi
  interval_cases i <;>
    norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale]

theorem numerical_margin : 1 < (9075 : ℝ)^2 *
    ∏ i ∈ Finset.range 3, KZGeneral.increment bounds scale i := by
  norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale,
    Finset.prod_range_succ]

theorem product_lower_bound (t : ℕ → ℝ)
    (ht : ∀ i < 3, 0 < t i)
    (hprefix : ∀ r ≤ 3, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 3 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 3, KZGeneral.increment bounds scale i ≤
      ∏ i ∈ Finset.range 3, t i := by
  exact KZGeneral.product_of_certificate 3 bounds scale (by decide) (by decide)
    row rows_valid increment_positive t ht hprefix hratio

theorem norm_cutoff (t : ℕ → ℝ) (S deltaSquared : ℝ) (hS : 0 < S)
    (ht : ∀ i < 3, 0 < t i)
    (hprefix : ∀ r ≤ 3, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 3 → 3*t i ≤ 4*t (i+1))
    (hdet : ∏ i ∈ Finset.range 3, t i = deltaSquared / S) :
    S < (9075 : ℝ)^2 * deltaSquared := by
  exact KZGeneral.norm_square_cutoff 3 (KZGeneral.increment bounds scale) t
    S deltaSquared 9075 hS (product_lower_bound t ht hprefix hratio) hdet numerical_margin

end SixSpectrumRankFour

namespace SixSpectrumRankFive

/-! Threshold 1/6; containing-space lower bounds 2/11, 1/5, 1/4, 1/3.
The exact increment product is 14/2223601875. -/

def scale : ℕ := 108900
def boundData : Array ℕ := #[0, 100, 484, 3025, 12100]
def bounds (r : ℕ) : ℕ := boundData[r]?.getD 0

def rowData : Lean.RArray DualRow :=
  (.branch 8
    (.branch 4
      (.branch 2
        (.branch 1
          (.leaf ⟨1, #[0, 0, 0, 0, 0, 0, 0, 0]⟩)
          (.leaf ⟨1, #[1, 0, 0, 0, 0, 0, 0, 0]⟩)
        )
        (.branch 3
          (.leaf ⟨7, #[0, 3, 0, 0, 1, 0, 0, 0]⟩)
          (.leaf ⟨1, #[0, 1, 0, 0, 0, 0, 0, 0]⟩)
        )
      )
      (.branch 6
        (.branch 5
          (.leaf ⟨37, #[0, 0, 9, 0, 3, 7, 0, 0]⟩)
          (.leaf ⟨7, #[4, 0, 3, 0, 0, 1, 0, 0]⟩)
        )
        (.branch 7
          (.leaf ⟨37, #[0, 0, 21, 0, 7, 4, 0, 0]⟩)
          (.leaf ⟨1, #[0, 0, 1, 0, 0, 0, 0, 0]⟩)
        )
      )
    )
    (.branch 12
      (.branch 10
        (.branch 9
          (.leaf ⟨175, #[0, 0, 0, 27, 9, 21, 37, 0]⟩)
          (.leaf ⟨37, #[28, 0, 0, 9, 0, 3, 7, 0]⟩)
        )
        (.branch 11
          (.leaf ⟨7, #[0, 0, 0, 3, 1, 0, 1, 0]⟩)
          (.leaf ⟨7, #[0, 4, 0, 3, 0, 0, 1, 0]⟩)
        )
      )
      (.branch 14
        (.branch 13
          (.leaf ⟨25, #[0, 0, 0, 9, 3, 7, 4, 0]⟩)
          (.leaf ⟨37, #[16, 0, 0, 21, 0, 7, 4, 0]⟩)
        )
        (.branch 15
          (.leaf ⟨175, #[0, 0, 0, 111, 37, 28, 16, 0]⟩)
          (.leaf ⟨1, #[0, 0, 0, 1, 0, 0, 0, 0]⟩)
        )
      )
    )
  )

noncomputable def row (m : Fin (2^4)) : DualRow := rowData.get m.val

private theorem block_0 : ∀ j : Fin 16,
    DualValid 4 bounds (fun i => (0*16+j.val).testBit i.val)
      (row ⟨0*16+j.val, by omega⟩) := by decide +kernel

theorem rows_valid (m : Fin (2^4)) :
    DualValid 4 bounds (fun i => m.val.testBit i.val) (row m) := by
  let q := m.val / 16
  let j : Fin 16 := ⟨m.val % 16, Nat.mod_lt _ (by decide)⟩
  have hq : q < 1 := by dsimp [q]; omega
  have he : m.val = q*16+j.val := by dsimp [q,j]; omega
  interval_cases q
  · have hm : m = ⟨0*16+j.val, by omega⟩ := Fin.ext he
    rw [hm]
    exact block_0 j

theorem increment_positive : ∀ i < 4, 0 < KZGeneral.increment bounds scale i := by
  intro i hi
  interval_cases i <;>
    norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale]

theorem numerical_margin : 1 < (54450 : ℝ)^2 *
    ∏ i ∈ Finset.range 4, KZGeneral.increment bounds scale i := by
  norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale,
    Finset.prod_range_succ]

theorem product_lower_bound (t : ℕ → ℝ)
    (ht : ∀ i < 4, 0 < t i)
    (hprefix : ∀ r ≤ 4, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 4 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 4, KZGeneral.increment bounds scale i ≤
      ∏ i ∈ Finset.range 4, t i := by
  exact KZGeneral.product_of_certificate 4 bounds scale (by decide) (by decide)
    row rows_valid increment_positive t ht hprefix hratio

theorem norm_cutoff (t : ℕ → ℝ) (S deltaSquared : ℝ) (hS : 0 < S)
    (ht : ∀ i < 4, 0 < t i)
    (hprefix : ∀ r ≤ 4, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 4 → 3*t i ≤ 4*t (i+1))
    (hdet : ∏ i ∈ Finset.range 4, t i = deltaSquared / S) :
    S < (54450 : ℝ)^2 * deltaSquared := by
  exact KZGeneral.norm_square_cutoff 4 (KZGeneral.increment bounds scale) t
    S deltaSquared 54450 hS (product_lower_bound t ht hprefix hratio) hdet numerical_margin

end SixSpectrumRankFive

namespace SixSpectrum

/-! Threshold 1/6; containing-space lower bounds 2/11, 1/5, 1/4, 1/3, 1/2.
The exact increment product is 14/6670805625. -/

def scale : ℕ := 108900
def boundData : Array ℕ := #[0, 100, 484, 3025, 12100, 48400]
def bounds (r : ℕ) : ℕ := boundData[r]?.getD 0

def rowData : Lean.RArray DualRow :=
  (.branch 16
    (.branch 8
      (.branch 4
        (.branch 2
          (.branch 1
            (.leaf ⟨1, #[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
            (.leaf ⟨1, #[1, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
          )
          (.branch 3
            (.leaf ⟨7, #[0, 3, 0, 0, 0, 1, 0, 0, 0, 0]⟩)
            (.leaf ⟨1, #[0, 1, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
          )
        )
        (.branch 6
          (.branch 5
            (.leaf ⟨37, #[0, 0, 9, 0, 0, 3, 7, 0, 0, 0]⟩)
            (.leaf ⟨7, #[4, 0, 3, 0, 0, 0, 1, 0, 0, 0]⟩)
          )
          (.branch 7
            (.leaf ⟨37, #[0, 0, 21, 0, 0, 7, 4, 0, 0, 0]⟩)
            (.leaf ⟨1, #[0, 0, 1, 0, 0, 0, 0, 0, 0, 0]⟩)
          )
        )
      )
      (.branch 12
        (.branch 10
          (.branch 9
            (.leaf ⟨175, #[0, 0, 0, 27, 0, 9, 21, 37, 0, 0]⟩)
            (.leaf ⟨37, #[28, 0, 0, 9, 0, 0, 3, 7, 0, 0]⟩)
          )
          (.branch 11
            (.leaf ⟨7, #[0, 0, 0, 3, 0, 1, 0, 1, 0, 0]⟩)
            (.leaf ⟨7, #[0, 4, 0, 3, 0, 0, 0, 1, 0, 0]⟩)
          )
        )
        (.branch 14
          (.branch 13
            (.leaf ⟨25, #[0, 0, 0, 9, 0, 3, 7, 4, 0, 0]⟩)
            (.leaf ⟨37, #[16, 0, 0, 21, 0, 0, 7, 4, 0, 0]⟩)
          )
          (.branch 15
            (.leaf ⟨175, #[0, 0, 0, 111, 0, 37, 28, 16, 0, 0]⟩)
            (.leaf ⟨1, #[0, 0, 0, 1, 0, 0, 0, 0, 0, 0]⟩)
          )
        )
      )
    )
    (.branch 24
      (.branch 20
        (.branch 18
          (.branch 17
            (.leaf ⟨781, #[0, 0, 0, 0, 81, 27, 63, 111, 175, 0]⟩)
            (.leaf ⟨175, #[148, 0, 0, 0, 27, 0, 9, 21, 37, 0]⟩)
          )
          (.branch 19
            (.leaf ⟨259, #[0, 48, 0, 0, 63, 37, 0, 21, 49, 0]⟩)
            (.leaf ⟨37, #[0, 28, 0, 0, 9, 0, 0, 3, 7, 0]⟩)
          )
        )
        (.branch 22
          (.branch 21
            (.leaf ⟨781, #[0, 0, 0, 0, 225, 75, 175, 48, 139, 0]⟩)
            (.leaf ⟨7, #[4, 0, 0, 0, 3, 0, 1, 0, 1, 0]⟩)
          )
          (.branch 23
            (.leaf ⟨259, #[0, 0, 36, 0, 111, 49, 28, 0, 37, 0]⟩)
            (.leaf ⟨7, #[0, 0, 4, 0, 3, 0, 0, 0, 1, 0]⟩)
          )
        )
      )
      (.branch 28
        (.branch 26
          (.branch 25
            (.leaf ⟨781, #[0, 0, 0, 0, 189, 63, 147, 259, 148, 0]⟩)
            (.leaf ⟨25, #[16, 0, 0, 0, 9, 0, 3, 7, 4, 0]⟩)
          )
          (.branch 27
            (.leaf ⟨781, #[0, 0, 0, 0, 381, 127, 36, 175, 100, 0]⟩)
            (.leaf ⟨37, #[0, 16, 0, 0, 21, 0, 0, 7, 4, 0]⟩)
          )
        )
        (.branch 30
          (.branch 29
            (.leaf ⟨781, #[0, 0, 0, 0, 333, 111, 259, 196, 112, 0]⟩)
            (.leaf ⟨175, #[64, 0, 0, 0, 111, 0, 37, 28, 16, 0]⟩)
          )
          (.branch 31
            (.leaf ⟨781, #[0, 0, 0, 0, 525, 175, 148, 112, 64, 0]⟩)
            (.leaf ⟨1, #[0, 0, 0, 0, 1, 0, 0, 0, 0, 0]⟩)
          )
        )
      )
    )
  )

noncomputable def row (m : Fin (2^5)) : DualRow := rowData.get m.val

private theorem block_0 : ∀ j : Fin 32,
    DualValid 5 bounds (fun i => (0*32+j.val).testBit i.val)
      (row ⟨0*32+j.val, by omega⟩) := by decide +kernel

theorem rows_valid (m : Fin (2^5)) :
    DualValid 5 bounds (fun i => m.val.testBit i.val) (row m) := by
  let q := m.val / 32
  let j : Fin 32 := ⟨m.val % 32, Nat.mod_lt _ (by decide)⟩
  have hq : q < 1 := by dsimp [q]; omega
  have he : m.val = q*32+j.val := by dsimp [q,j]; omega
  interval_cases q
  · have hm : m = ⟨0*32+j.val, by omega⟩ := Fin.ext he
    rw [hm]
    exact block_0 j

theorem increment_positive : ∀ i < 5, 0 < KZGeneral.increment bounds scale i := by
  intro i hi
  interval_cases i <;>
    norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale]

theorem numerical_margin : 1 < (163350 : ℝ)^2 *
    ∏ i ∈ Finset.range 5, KZGeneral.increment bounds scale i := by
  norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale,
    Finset.prod_range_succ]

theorem product_lower_bound (t : ℕ → ℝ)
    (ht : ∀ i < 5, 0 < t i)
    (hprefix : ∀ r ≤ 5, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 5 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 5, KZGeneral.increment bounds scale i ≤
      ∏ i ∈ Finset.range 5, t i := by
  exact KZGeneral.product_of_certificate 5 bounds scale (by decide) (by decide)
    row rows_valid increment_positive t ht hprefix hratio

theorem norm_cutoff (t : ℕ → ℝ) (S deltaSquared : ℝ) (hS : 0 < S)
    (ht : ∀ i < 5, 0 < t i)
    (hprefix : ∀ r ≤ 5, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 5 → 3*t i ≤ 4*t (i+1))
    (hdet : ∏ i ∈ Finset.range 5, t i = deltaSquared / S) :
    S < (163350 : ℝ)^2 * deltaSquared := by
  exact KZGeneral.norm_square_cutoff 5 (KZGeneral.increment bounds scale) t
    S deltaSquared 163350 hS (product_lower_bound t ht hprefix hratio) hdet numerical_margin

end SixSpectrum

namespace TightSix

/-! Threshold 1/7; containing-space lower bounds 1/6, 1/5, 1/4, 1/3, 1/2.
The exact increment product is 8993/308758035600. -/

def scale : ℕ := 44100
def boundData : Array ℕ := #[0, 100, 576, 2025, 6400, 22500]
def bounds (r : ℕ) : ℕ := boundData[r]?.getD 0

def rowData : Lean.RArray DualRow :=
  (.branch 16
    (.branch 8
      (.branch 4
        (.branch 2
          (.branch 1
            (.leaf ⟨1, #[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
            (.leaf ⟨1, #[1, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
          )
          (.branch 3
            (.leaf ⟨7, #[0, 3, 0, 0, 0, 1, 0, 0, 0, 0]⟩)
            (.leaf ⟨1, #[0, 1, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
          )
        )
        (.branch 6
          (.branch 5
            (.leaf ⟨37, #[0, 0, 9, 0, 0, 3, 7, 0, 0, 0]⟩)
            (.leaf ⟨7, #[4, 0, 3, 0, 0, 0, 1, 0, 0, 0]⟩)
          )
          (.branch 7
            (.leaf ⟨37, #[0, 0, 21, 0, 0, 7, 4, 0, 0, 0]⟩)
            (.leaf ⟨1, #[0, 0, 1, 0, 0, 0, 0, 0, 0, 0]⟩)
          )
        )
      )
      (.branch 12
        (.branch 10
          (.branch 9
            (.leaf ⟨175, #[0, 0, 0, 27, 0, 9, 21, 37, 0, 0]⟩)
            (.leaf ⟨37, #[28, 0, 0, 9, 0, 0, 3, 7, 0, 0]⟩)
          )
          (.branch 11
            (.leaf ⟨7, #[0, 0, 0, 3, 0, 1, 0, 1, 0, 0]⟩)
            (.leaf ⟨7, #[0, 4, 0, 3, 0, 0, 0, 1, 0, 0]⟩)
          )
        )
        (.branch 14
          (.branch 13
            (.leaf ⟨25, #[0, 0, 0, 9, 0, 3, 7, 4, 0, 0]⟩)
            (.leaf ⟨37, #[16, 0, 0, 21, 0, 0, 7, 4, 0, 0]⟩)
          )
          (.branch 15
            (.leaf ⟨175, #[0, 0, 0, 111, 0, 37, 28, 16, 0, 0]⟩)
            (.leaf ⟨1, #[0, 0, 0, 1, 0, 0, 0, 0, 0, 0]⟩)
          )
        )
      )
    )
    (.branch 24
      (.branch 20
        (.branch 18
          (.branch 17
            (.leaf ⟨781, #[0, 0, 0, 0, 81, 27, 63, 111, 175, 0]⟩)
            (.leaf ⟨175, #[148, 0, 0, 0, 27, 0, 9, 21, 37, 0]⟩)
          )
          (.branch 19
            (.leaf ⟨259, #[0, 48, 0, 0, 63, 37, 0, 21, 49, 0]⟩)
            (.leaf ⟨37, #[0, 28, 0, 0, 9, 0, 0, 3, 7, 0]⟩)
          )
        )
        (.branch 22
          (.branch 21
            (.leaf ⟨781, #[0, 0, 0, 0, 225, 75, 175, 48, 139, 0]⟩)
            (.leaf ⟨7, #[4, 0, 0, 0, 3, 0, 1, 0, 1, 0]⟩)
          )
          (.branch 23
            (.leaf ⟨259, #[0, 0, 36, 0, 111, 49, 28, 0, 37, 0]⟩)
            (.leaf ⟨7, #[0, 0, 4, 0, 3, 0, 0, 0, 1, 0]⟩)
          )
        )
      )
      (.branch 28
        (.branch 26
          (.branch 25
            (.leaf ⟨781, #[0, 0, 0, 0, 189, 63, 147, 259, 148, 0]⟩)
            (.leaf ⟨25, #[16, 0, 0, 0, 9, 0, 3, 7, 4, 0]⟩)
          )
          (.branch 27
            (.leaf ⟨781, #[0, 0, 0, 0, 381, 127, 36, 175, 100, 0]⟩)
            (.leaf ⟨37, #[0, 16, 0, 0, 21, 0, 0, 7, 4, 0]⟩)
          )
        )
        (.branch 30
          (.branch 29
            (.leaf ⟨781, #[0, 0, 0, 0, 333, 111, 259, 196, 112, 0]⟩)
            (.leaf ⟨175, #[64, 0, 0, 0, 111, 0, 37, 28, 16, 0]⟩)
          )
          (.branch 31
            (.leaf ⟨781, #[0, 0, 0, 0, 525, 175, 148, 112, 64, 0]⟩)
            (.leaf ⟨1, #[0, 0, 0, 0, 1, 0, 0, 0, 0, 0]⟩)
          )
        )
      )
    )
  )

noncomputable def row (m : Fin (2^5)) : DualRow := rowData.get m.val

private theorem block_0 : ∀ j : Fin 32,
    DualValid 5 bounds (fun i => (0*32+j.val).testBit i.val)
      (row ⟨0*32+j.val, by omega⟩) := by decide +kernel

theorem rows_valid (m : Fin (2^5)) :
    DualValid 5 bounds (fun i => m.val.testBit i.val) (row m) := by
  let q := m.val / 32
  let j : Fin 32 := ⟨m.val % 32, Nat.mod_lt _ (by decide)⟩
  have hq : q < 1 := by dsimp [q]; omega
  have he : m.val = q*32+j.val := by dsimp [q,j]; omega
  interval_cases q
  · have hm : m = ⟨0*32+j.val, by omega⟩ := Fin.ext he
    rw [hm]
    exact block_0 j

theorem increment_positive : ∀ i < 5, 0 < KZGeneral.increment bounds scale i := by
  intro i hi
  interval_cases i <;>
    norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale]

theorem numerical_margin : 1 < (17010000 : ℝ)^2 *
    ∏ i ∈ Finset.range 5, KZGeneral.increment bounds scale i := by
  norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale,
    Finset.prod_range_succ]

theorem product_lower_bound (t : ℕ → ℝ)
    (ht : ∀ i < 5, 0 < t i)
    (hprefix : ∀ r ≤ 5, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 5 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 5, KZGeneral.increment bounds scale i ≤
      ∏ i ∈ Finset.range 5, t i := by
  exact KZGeneral.product_of_certificate 5 bounds scale (by decide) (by decide)
    row rows_valid increment_positive t ht hprefix hratio

theorem norm_cutoff (t : ℕ → ℝ) (S deltaSquared : ℝ) (hS : 0 < S)
    (ht : ∀ i < 5, 0 < t i)
    (hprefix : ∀ r ≤ 5, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 5 → 3*t i ≤ 4*t (i+1))
    (hdet : ∏ i ∈ Finset.range 5, t i = deltaSquared / S) :
    S < (17010000 : ℝ)^2 * deltaSquared := by
  exact KZGeneral.norm_square_cutoff 5 (KZGeneral.increment bounds scale) t
    S deltaSquared 17010000 hS (product_lower_bound t ht hprefix hratio) hdet numerical_margin

end TightSix

namespace TightSeven

/-! Threshold 1/8; containing-space lower bounds 1/7, 1/6, 1/5, 1/4, 1/3, 1/2.
The exact increment product is 1/5143824000. -/

def scale : ℕ := 176400
def boundData : Array ℕ := #[0, 225, 1225, 3969, 11025, 30625, 99225]
def bounds (r : ℕ) : ℕ := boundData[r]?.getD 0

def rowData : Lean.RArray DualRow :=
  (.branch 32
    (.branch 16
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf ⟨1, #[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              (.leaf ⟨1, #[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
            )
            (.branch 3
              (.leaf ⟨7, #[0, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0]⟩)
              (.leaf ⟨1, #[0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
            )
          )
          (.branch 6
            (.branch 5
              (.leaf ⟨37, #[0, 0, 9, 0, 0, 0, 3, 7, 0, 0, 0, 0]⟩)
              (.leaf ⟨7, #[4, 0, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0]⟩)
            )
            (.branch 7
              (.leaf ⟨37, #[0, 0, 21, 0, 0, 0, 7, 4, 0, 0, 0, 0]⟩)
              (.leaf ⟨1, #[0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
            )
          )
        )
        (.branch 12
          (.branch 10
            (.branch 9
              (.leaf ⟨175, #[0, 0, 0, 27, 0, 0, 9, 21, 37, 0, 0, 0]⟩)
              (.leaf ⟨37, #[28, 0, 0, 9, 0, 0, 0, 3, 7, 0, 0, 0]⟩)
            )
            (.branch 11
              (.leaf ⟨7, #[0, 0, 0, 3, 0, 0, 1, 0, 1, 0, 0, 0]⟩)
              (.leaf ⟨7, #[0, 4, 0, 3, 0, 0, 0, 0, 1, 0, 0, 0]⟩)
            )
          )
          (.branch 14
            (.branch 13
              (.leaf ⟨25, #[0, 0, 0, 9, 0, 0, 3, 7, 4, 0, 0, 0]⟩)
              (.leaf ⟨37, #[16, 0, 0, 21, 0, 0, 0, 7, 4, 0, 0, 0]⟩)
            )
            (.branch 15
              (.leaf ⟨175, #[0, 0, 0, 111, 0, 0, 37, 28, 16, 0, 0, 0]⟩)
              (.leaf ⟨1, #[0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
            )
          )
        )
      )
      (.branch 24
        (.branch 20
          (.branch 18
            (.branch 17
              (.leaf ⟨781, #[0, 0, 0, 0, 81, 0, 27, 63, 111, 175, 0, 0]⟩)
              (.leaf ⟨175, #[148, 0, 0, 0, 27, 0, 0, 9, 21, 37, 0, 0]⟩)
            )
            (.branch 19
              (.leaf ⟨259, #[0, 48, 0, 0, 63, 0, 37, 0, 21, 49, 0, 0]⟩)
              (.leaf ⟨37, #[0, 28, 0, 0, 9, 0, 0, 0, 3, 7, 0, 0]⟩)
            )
          )
          (.branch 22
            (.branch 21
              (.leaf ⟨781, #[0, 0, 0, 0, 225, 0, 75, 175, 48, 139, 0, 0]⟩)
              (.leaf ⟨7, #[4, 0, 0, 0, 3, 0, 0, 1, 0, 1, 0, 0]⟩)
            )
            (.branch 23
              (.leaf ⟨259, #[0, 0, 36, 0, 111, 0, 49, 28, 0, 37, 0, 0]⟩)
              (.leaf ⟨7, #[0, 0, 4, 0, 3, 0, 0, 0, 0, 1, 0, 0]⟩)
            )
          )
        )
        (.branch 28
          (.branch 26
            (.branch 25
              (.leaf ⟨781, #[0, 0, 0, 0, 189, 0, 63, 147, 259, 148, 0, 0]⟩)
              (.leaf ⟨25, #[16, 0, 0, 0, 9, 0, 0, 3, 7, 4, 0, 0]⟩)
            )
            (.branch 27
              (.leaf ⟨781, #[0, 0, 0, 0, 381, 0, 127, 36, 175, 100, 0, 0]⟩)
              (.leaf ⟨37, #[0, 16, 0, 0, 21, 0, 0, 0, 7, 4, 0, 0]⟩)
            )
          )
          (.branch 30
            (.branch 29
              (.leaf ⟨781, #[0, 0, 0, 0, 333, 0, 111, 259, 196, 112, 0, 0]⟩)
              (.leaf ⟨175, #[64, 0, 0, 0, 111, 0, 0, 37, 28, 16, 0, 0]⟩)
            )
            (.branch 31
              (.leaf ⟨781, #[0, 0, 0, 0, 525, 0, 175, 148, 112, 64, 0, 0]⟩)
              (.leaf ⟨1, #[0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]⟩)
            )
          )
        )
      )
    )
    (.branch 48
      (.branch 40
        (.branch 36
          (.branch 34
            (.branch 33
              (.leaf ⟨3367, #[0, 0, 0, 0, 0, 243, 81, 189, 333, 525, 781, 0]⟩)
              (.leaf ⟨781, #[700, 0, 0, 0, 0, 81, 0, 27, 63, 111, 175, 0]⟩)
            )
            (.branch 35
              (.leaf ⟨175, #[0, 48, 0, 0, 0, 27, 25, 0, 9, 21, 37, 0]⟩)
              (.leaf ⟨175, #[0, 148, 0, 0, 0, 27, 0, 0, 9, 21, 37, 0]⟩)
            )
          )
          (.branch 38
            (.branch 37
              (.leaf ⟨37, #[0, 0, 0, 0, 0, 9, 3, 7, 0, 3, 7, 0]⟩)
              (.leaf ⟨259, #[148, 0, 48, 0, 0, 63, 0, 37, 0, 21, 49, 0]⟩)
            )
            (.branch 39
              (.leaf ⟨37, #[0, 0, 12, 0, 0, 9, 7, 4, 0, 3, 7, 0]⟩)
              (.leaf ⟨37, #[0, 0, 28, 0, 0, 9, 0, 0, 0, 3, 7, 0]⟩)
            )
          )
        )
        (.branch 44
          (.branch 42
            (.branch 41
              (.leaf ⟨3367, #[0, 0, 0, 0, 0, 675, 225, 525, 925, 336, 673, 0]⟩)
              (.leaf ⟨781, #[556, 0, 0, 0, 0, 225, 0, 75, 175, 48, 139, 0]⟩)
            )
            (.branch 43
              (.leaf ⟨7, #[0, 0, 0, 0, 0, 3, 1, 0, 1, 0, 1, 0]⟩)
              (.leaf ⟨7, #[0, 4, 0, 0, 0, 3, 0, 0, 1, 0, 1, 0]⟩)
            )
          )
          (.branch 46
            (.branch 45
              (.leaf ⟨3367, #[0, 0, 0, 0, 0, 1251, 417, 973, 592, 84, 529, 0]⟩)
              (.leaf ⟨259, #[112, 0, 0, 36, 0, 111, 0, 49, 28, 0, 37, 0]⟩)
            )
            (.branch 47
              (.leaf ⟨175, #[0, 0, 0, 36, 0, 75, 37, 28, 16, 0, 25, 0]⟩)
              (.leaf ⟨7, #[0, 0, 0, 4, 0, 3, 0, 0, 0, 0, 1, 0]⟩)
            )
          )
        )
      )
      (.branch 56
        (.branch 52
          (.branch 50
            (.branch 49
              (.leaf ⟨481, #[0, 0, 0, 0, 0, 81, 27, 63, 111, 175, 100, 0]⟩)
              (.leaf ⟨781, #[592, 0, 0, 0, 0, 189, 0, 63, 147, 259, 148, 0]⟩)
            )
            (.branch 51
              (.leaf ⟨175, #[0, 12, 0, 0, 0, 63, 25, 0, 21, 49, 28, 0]⟩)
              (.leaf ⟨25, #[0, 16, 0, 0, 0, 9, 0, 0, 3, 7, 4, 0]⟩)
            )
          )
          (.branch 54
            (.branch 53
              (.leaf ⟨3367, #[0, 0, 0, 0, 0, 1143, 381, 889, 444, 973, 556, 0]⟩)
              (.leaf ⟨781, #[400, 0, 0, 0, 0, 381, 0, 127, 36, 175, 100, 0]⟩)
            )
            (.branch 55
              (.leaf ⟨37, #[0, 0, 0, 0, 0, 21, 7, 4, 0, 7, 4, 0]⟩)
              (.leaf ⟨37, #[0, 0, 16, 0, 0, 21, 0, 0, 0, 7, 4, 0]⟩)
            )
          )
        )
        (.branch 60
          (.branch 58
            (.branch 57
              (.leaf ⟨91, #[0, 0, 0, 0, 0, 27, 9, 21, 37, 28, 16, 0]⟩)
              (.leaf ⟨781, #[448, 0, 0, 0, 0, 333, 0, 111, 259, 196, 112, 0]⟩)
            )
            (.branch 59
              (.leaf ⟨3367, #[0, 0, 0, 0, 0, 1767, 589, 252, 925, 700, 400, 0]⟩)
              (.leaf ⟨175, #[0, 64, 0, 0, 0, 111, 0, 0, 37, 28, 16, 0]⟩)
            )
          )
          (.branch 62
            (.branch 61
              (.leaf ⟨481, #[0, 0, 0, 0, 0, 225, 75, 175, 148, 112, 64, 0]⟩)
              (.leaf ⟨781, #[256, 0, 0, 0, 0, 525, 0, 175, 148, 112, 64, 0]⟩)
            )
            (.branch 63
              (.leaf ⟨3367, #[0, 0, 0, 0, 0, 2343, 781, 700, 592, 448, 256, 0]⟩)
              (.leaf ⟨1, #[0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0]⟩)
            )
          )
        )
      )
    )
  )

noncomputable def row (m : Fin (2^6)) : DualRow := rowData.get m.val

private theorem block_0 : ∀ j : Fin 64,
    DualValid 6 bounds (fun i => (0*64+j.val).testBit i.val)
      (row ⟨0*64+j.val, by omega⟩) := by decide +kernel

theorem rows_valid (m : Fin (2^6)) :
    DualValid 6 bounds (fun i => m.val.testBit i.val) (row m) := by
  let q := m.val / 64
  let j : Fin 64 := ⟨m.val % 64, Nat.mod_lt _ (by decide)⟩
  have hq : q < 1 := by dsimp [q]; omega
  have he : m.val = q*64+j.val := by dsimp [q,j]; omega
  interval_cases q
  · have hm : m = ⟨0*64+j.val, by omega⟩ := Fin.ext he
    rw [hm]
    exact block_0 j

theorem increment_positive : ∀ i < 6, 0 < KZGeneral.increment bounds scale i := by
  intro i hi
  interval_cases i <;>
    norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale]

theorem numerical_margin : 1 < (1587600 : ℝ)^2 *
    ∏ i ∈ Finset.range 6, KZGeneral.increment bounds scale i := by
  norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale,
    Finset.prod_range_succ]

theorem product_lower_bound (t : ℕ → ℝ)
    (ht : ∀ i < 6, 0 < t i)
    (hprefix : ∀ r ≤ 6, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 6 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 6, KZGeneral.increment bounds scale i ≤
      ∏ i ∈ Finset.range 6, t i := by
  exact KZGeneral.product_of_certificate 6 bounds scale (by decide) (by decide)
    row rows_valid increment_positive t ht hprefix hratio

theorem norm_cutoff (t : ℕ → ℝ) (S deltaSquared : ℝ) (hS : 0 < S)
    (ht : ∀ i < 6, 0 < t i)
    (hprefix : ∀ r ≤ 6, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 6 → 3*t i ≤ 4*t (i+1))
    (hdet : ∏ i ∈ Finset.range 6, t i = deltaSquared / S) :
    S < (1587600 : ℝ)^2 * deltaSquared := by
  exact KZGeneral.norm_square_cutoff 6 (KZGeneral.increment bounds scale) t
    S deltaSquared 1587600 hS (product_lower_bound t ht hprefix hratio) hdet numerical_margin

end TightSeven

namespace TightEight

/-! Threshold 1/9; containing-space lower bounds 1/8, 1/7, 1/6, 1/5, 1/4, 1/3, 1/2.
The exact increment product is 19283407/21431729527810560000. -/

def scale : ℕ := 1587600
def boundData : Array ℕ := #[0, 1225, 6400, 19600, 50176, 122500, 313600, 960400]
def bounds (r : ℕ) : ℕ := boundData[r]?.getD 0

def rowData : Lean.RArray DualRow :=
  (.branch 64
    (.branch 32
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf ⟨1, #[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
                (.leaf ⟨1, #[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
              (.branch 3
                (.leaf ⟨7, #[0, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0]⟩)
                (.leaf ⟨1, #[0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
            )
            (.branch 6
              (.branch 5
                (.leaf ⟨37, #[0, 0, 9, 0, 0, 0, 0, 3, 7, 0, 0, 0, 0, 0]⟩)
                (.leaf ⟨7, #[4, 0, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0]⟩)
              )
              (.branch 7
                (.leaf ⟨37, #[0, 0, 21, 0, 0, 0, 0, 7, 4, 0, 0, 0, 0, 0]⟩)
                (.leaf ⟨1, #[0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
            )
          )
          (.branch 12
            (.branch 10
              (.branch 9
                (.leaf ⟨175, #[0, 0, 0, 27, 0, 0, 0, 9, 21, 37, 0, 0, 0, 0]⟩)
                (.leaf ⟨37, #[28, 0, 0, 9, 0, 0, 0, 0, 3, 7, 0, 0, 0, 0]⟩)
              )
              (.branch 11
                (.leaf ⟨7, #[0, 0, 0, 3, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0]⟩)
                (.leaf ⟨7, #[0, 4, 0, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0]⟩)
              )
            )
            (.branch 14
              (.branch 13
                (.leaf ⟨25, #[0, 0, 0, 9, 0, 0, 0, 3, 7, 4, 0, 0, 0, 0]⟩)
                (.leaf ⟨37, #[16, 0, 0, 21, 0, 0, 0, 0, 7, 4, 0, 0, 0, 0]⟩)
              )
              (.branch 15
                (.leaf ⟨175, #[0, 0, 0, 111, 0, 0, 0, 37, 28, 16, 0, 0, 0, 0]⟩)
                (.leaf ⟨1, #[0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
            )
          )
        )
        (.branch 24
          (.branch 20
            (.branch 18
              (.branch 17
                (.leaf ⟨781, #[0, 0, 0, 0, 81, 0, 0, 27, 63, 111, 175, 0, 0, 0]⟩)
                (.leaf ⟨175, #[148, 0, 0, 0, 27, 0, 0, 0, 9, 21, 37, 0, 0, 0]⟩)
              )
              (.branch 19
                (.leaf ⟨259, #[0, 48, 0, 0, 63, 0, 0, 37, 0, 21, 49, 0, 0, 0]⟩)
                (.leaf ⟨37, #[0, 28, 0, 0, 9, 0, 0, 0, 0, 3, 7, 0, 0, 0]⟩)
              )
            )
            (.branch 22
              (.branch 21
                (.leaf ⟨781, #[0, 0, 0, 0, 225, 0, 0, 75, 175, 48, 139, 0, 0, 0]⟩)
                (.leaf ⟨7, #[4, 0, 0, 0, 3, 0, 0, 0, 1, 0, 1, 0, 0, 0]⟩)
              )
              (.branch 23
                (.leaf ⟨259, #[0, 0, 36, 0, 111, 0, 0, 49, 28, 0, 37, 0, 0, 0]⟩)
                (.leaf ⟨7, #[0, 0, 4, 0, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0]⟩)
              )
            )
          )
          (.branch 28
            (.branch 26
              (.branch 25
                (.leaf ⟨781, #[0, 0, 0, 0, 189, 0, 0, 63, 147, 259, 148, 0, 0, 0]⟩)
                (.leaf ⟨25, #[16, 0, 0, 0, 9, 0, 0, 0, 3, 7, 4, 0, 0, 0]⟩)
              )
              (.branch 27
                (.leaf ⟨781, #[0, 0, 0, 0, 381, 0, 0, 127, 36, 175, 100, 0, 0, 0]⟩)
                (.leaf ⟨37, #[0, 16, 0, 0, 21, 0, 0, 0, 0, 7, 4, 0, 0, 0]⟩)
              )
            )
            (.branch 30
              (.branch 29
                (.leaf ⟨781, #[0, 0, 0, 0, 333, 0, 0, 111, 259, 196, 112, 0, 0, 0]⟩)
                (.leaf ⟨175, #[64, 0, 0, 0, 111, 0, 0, 0, 37, 28, 16, 0, 0, 0]⟩)
              )
              (.branch 31
                (.leaf ⟨781, #[0, 0, 0, 0, 525, 0, 0, 175, 148, 112, 64, 0, 0, 0]⟩)
                (.leaf ⟨1, #[0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
            )
          )
        )
      )
      (.branch 48
        (.branch 40
          (.branch 36
            (.branch 34
              (.branch 33
                (.leaf ⟨3367, #[0, 0, 0, 0, 0, 243, 0, 81, 189, 333, 525, 781, 0, 0]⟩)
                (.leaf ⟨781, #[700, 0, 0, 0, 0, 81, 0, 0, 27, 63, 111, 175, 0, 0]⟩)
              )
              (.branch 35
                (.leaf ⟨175, #[0, 48, 0, 0, 0, 27, 0, 25, 0, 9, 21, 37, 0, 0]⟩)
                (.leaf ⟨175, #[0, 148, 0, 0, 0, 27, 0, 0, 0, 9, 21, 37, 0, 0]⟩)
              )
            )
            (.branch 38
              (.branch 37
                (.leaf ⟨37, #[0, 0, 0, 0, 0, 9, 0, 3, 7, 0, 3, 7, 0, 0]⟩)
                (.leaf ⟨259, #[148, 0, 48, 0, 0, 63, 0, 0, 37, 0, 21, 49, 0, 0]⟩)
              )
              (.branch 39
                (.leaf ⟨37, #[0, 0, 12, 0, 0, 9, 0, 7, 4, 0, 3, 7, 0, 0]⟩)
                (.leaf ⟨37, #[0, 0, 28, 0, 0, 9, 0, 0, 0, 0, 3, 7, 0, 0]⟩)
              )
            )
          )
          (.branch 44
            (.branch 42
              (.branch 41
                (.leaf ⟨3367, #[0, 0, 0, 0, 0, 675, 0, 225, 525, 925, 336, 673, 0, 0]⟩)
                (.leaf ⟨781, #[556, 0, 0, 0, 0, 225, 0, 0, 75, 175, 48, 139, 0, 0]⟩)
              )
              (.branch 43
                (.leaf ⟨7, #[0, 0, 0, 0, 0, 3, 0, 1, 0, 1, 0, 1, 0, 0]⟩)
                (.leaf ⟨7, #[0, 4, 0, 0, 0, 3, 0, 0, 0, 1, 0, 1, 0, 0]⟩)
              )
            )
            (.branch 46
              (.branch 45
                (.leaf ⟨3367, #[0, 0, 0, 0, 0, 1251, 0, 417, 973, 592, 84, 529, 0, 0]⟩)
                (.leaf ⟨259, #[112, 0, 0, 36, 0, 111, 0, 0, 49, 28, 0, 37, 0, 0]⟩)
              )
              (.branch 47
                (.leaf ⟨175, #[0, 0, 0, 36, 0, 75, 0, 37, 28, 16, 0, 25, 0, 0]⟩)
                (.leaf ⟨7, #[0, 0, 0, 4, 0, 3, 0, 0, 0, 0, 0, 1, 0, 0]⟩)
              )
            )
          )
        )
        (.branch 56
          (.branch 52
            (.branch 50
              (.branch 49
                (.leaf ⟨481, #[0, 0, 0, 0, 0, 81, 0, 27, 63, 111, 175, 100, 0, 0]⟩)
                (.leaf ⟨781, #[592, 0, 0, 0, 0, 189, 0, 0, 63, 147, 259, 148, 0, 0]⟩)
              )
              (.branch 51
                (.leaf ⟨175, #[0, 12, 0, 0, 0, 63, 0, 25, 0, 21, 49, 28, 0, 0]⟩)
                (.leaf ⟨25, #[0, 16, 0, 0, 0, 9, 0, 0, 0, 3, 7, 4, 0, 0]⟩)
              )
            )
            (.branch 54
              (.branch 53
                (.leaf ⟨3367, #[0, 0, 0, 0, 0, 1143, 0, 381, 889, 444, 973, 556, 0, 0]⟩)
                (.leaf ⟨781, #[400, 0, 0, 0, 0, 381, 0, 0, 127, 36, 175, 100, 0, 0]⟩)
              )
              (.branch 55
                (.leaf ⟨37, #[0, 0, 0, 0, 0, 21, 0, 7, 4, 0, 7, 4, 0, 0]⟩)
                (.leaf ⟨37, #[0, 0, 16, 0, 0, 21, 0, 0, 0, 0, 7, 4, 0, 0]⟩)
              )
            )
          )
          (.branch 60
            (.branch 58
              (.branch 57
                (.leaf ⟨91, #[0, 0, 0, 0, 0, 27, 0, 9, 21, 37, 28, 16, 0, 0]⟩)
                (.leaf ⟨781, #[448, 0, 0, 0, 0, 333, 0, 0, 111, 259, 196, 112, 0, 0]⟩)
              )
              (.branch 59
                (.leaf ⟨3367, #[0, 0, 0, 0, 0, 1767, 0, 589, 252, 925, 700, 400, 0, 0]⟩)
                (.leaf ⟨175, #[0, 64, 0, 0, 0, 111, 0, 0, 0, 37, 28, 16, 0, 0]⟩)
              )
            )
            (.branch 62
              (.branch 61
                (.leaf ⟨481, #[0, 0, 0, 0, 0, 225, 0, 75, 175, 148, 112, 64, 0, 0]⟩)
                (.leaf ⟨781, #[256, 0, 0, 0, 0, 525, 0, 0, 175, 148, 112, 64, 0, 0]⟩)
              )
              (.branch 63
                (.leaf ⟨3367, #[0, 0, 0, 0, 0, 2343, 0, 781, 700, 592, 448, 256, 0, 0]⟩)
                (.leaf ⟨1, #[0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
            )
          )
        )
      )
    )
    (.branch 96
      (.branch 80
        (.branch 72
          (.branch 68
            (.branch 66
              (.branch 65
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 729, 243, 567, 999, 1575, 2343, 3367, 0]⟩)
                (.leaf ⟨3367, #[3124, 0, 0, 0, 0, 0, 243, 0, 81, 189, 333, 525, 781, 0]⟩)
              )
              (.branch 67
                (.leaf ⟨5467, #[0, 1776, 0, 0, 0, 0, 567, 781, 0, 189, 441, 777, 1225, 0]⟩)
                (.leaf ⟨781, #[0, 700, 0, 0, 0, 0, 81, 0, 0, 27, 63, 111, 175, 0]⟩)
              )
            )
            (.branch 70
              (.branch 69
                (.leaf ⟨6475, #[0, 0, 576, 0, 0, 0, 999, 525, 1225, 0, 333, 777, 1369, 0]⟩)
                (.leaf ⟨175, #[100, 0, 48, 0, 0, 0, 27, 0, 25, 0, 9, 21, 37, 0]⟩)
              )
              (.branch 71
                (.leaf ⟨6475, #[0, 0, 2676, 0, 0, 0, 999, 1225, 700, 0, 333, 777, 1369, 0]⟩)
                (.leaf ⟨175, #[0, 0, 148, 0, 0, 0, 27, 0, 0, 0, 9, 21, 37, 0]⟩)
              )
            )
          )
          (.branch 76
            (.branch 74
              (.branch 73
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 2457, 819, 1911, 3367, 576, 1587, 2935, 0]⟩)
                (.leaf ⟨37, #[28, 0, 0, 0, 0, 0, 9, 0, 3, 7, 0, 3, 7, 0]⟩)
              )
              (.branch 75
                (.leaf ⟨259, #[0, 0, 0, 48, 0, 0, 63, 37, 0, 37, 0, 21, 49, 0]⟩)
                (.leaf ⟨259, #[0, 148, 0, 48, 0, 0, 63, 0, 0, 37, 0, 21, 49, 0]⟩)
              )
            )
            (.branch 78
              (.branch 77
                (.leaf ⟨925, #[0, 0, 0, 108, 0, 0, 225, 111, 259, 148, 0, 75, 175, 0]⟩)
                (.leaf ⟨37, #[16, 0, 0, 12, 0, 0, 9, 0, 7, 4, 0, 3, 7, 0]⟩)
              )
              (.branch 79
                (.leaf ⟨6475, #[0, 0, 0, 2532, 0, 0, 1575, 1369, 1036, 592, 0, 525, 1225, 0]⟩)
                (.leaf ⟨37, #[0, 0, 0, 28, 0, 0, 9, 0, 0, 0, 0, 3, 7, 0]⟩)
              )
            )
          )
        )
        (.branch 88
          (.branch 84
            (.branch 82
              (.branch 81
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 2025, 675, 1575, 2775, 4375, 1776, 3043, 0]⟩)
                (.leaf ⟨3367, #[2692, 0, 0, 0, 0, 0, 675, 0, 225, 525, 925, 336, 673, 0]⟩)
              )
              (.branch 83
                (.leaf ⟨5467, #[0, 768, 0, 0, 0, 0, 1575, 781, 0, 525, 1225, 336, 973, 0]⟩)
                (.leaf ⟨781, #[0, 556, 0, 0, 0, 0, 225, 0, 0, 75, 175, 48, 139, 0]⟩)
              )
            )
            (.branch 86
              (.branch 85
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 4329, 1443, 3367, 1200, 3043, 768, 2467, 0]⟩)
                (.leaf ⟨7, #[4, 0, 0, 0, 0, 0, 3, 0, 1, 0, 1, 0, 1, 0]⟩)
              )
              (.branch 87
                (.leaf ⟨259, #[0, 0, 36, 0, 0, 0, 111, 49, 28, 0, 37, 0, 37, 0]⟩)
                (.leaf ⟨7, #[0, 0, 4, 0, 0, 0, 3, 0, 0, 0, 1, 0, 1, 0]⟩)
              )
            )
          )
          (.branch 92
            (.branch 90
              (.branch 89
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 3753, 1251, 2919, 5143, 3376, 1020, 2611, 0]⟩)
                (.leaf ⟨3367, #[2116, 0, 0, 0, 0, 0, 1251, 0, 417, 973, 592, 84, 529, 0]⟩)
              )
              (.branch 91
                (.leaf ⟨5467, #[0, 0, 0, 0, 324, 0, 2343, 889, 252, 1225, 700, 0, 781, 0]⟩)
                (.leaf ⟨259, #[0, 112, 0, 0, 36, 0, 111, 0, 0, 49, 28, 0, 37, 0]⟩)
              )
            )
            (.branch 94
              (.branch 93
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 6057, 2019, 4711, 3568, 2044, 12, 2035, 0]⟩)
                (.leaf ⟨175, #[64, 0, 0, 0, 36, 0, 75, 0, 37, 28, 16, 0, 25, 0]⟩)
              )
              (.branch 95
                (.leaf ⟨5467, #[0, 0, 0, 0, 1332, 0, 2343, 1225, 1036, 784, 448, 0, 781, 0]⟩)
                (.leaf ⟨7, #[0, 0, 0, 0, 4, 0, 3, 0, 0, 0, 0, 0, 1, 0]⟩)
              )
            )
          )
        )
      )
      (.branch 112
        (.branch 104
          (.branch 100
            (.branch 98
              (.branch 97
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 1701, 567, 1323, 2331, 3675, 5467, 3124, 0]⟩)
                (.leaf ⟨481, #[400, 0, 0, 0, 0, 0, 81, 0, 27, 63, 111, 175, 100, 0]⟩)
              )
              (.branch 99
                (.leaf ⟨5467, #[0, 1020, 0, 0, 0, 0, 1323, 781, 0, 441, 1029, 1813, 1036, 0]⟩)
                (.leaf ⟨781, #[0, 592, 0, 0, 0, 0, 189, 0, 0, 63, 147, 259, 148, 0]⟩)
              )
            )
            (.branch 102
              (.branch 101
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 4005, 1335, 3115, 756, 2343, 4459, 2548, 0]⟩)
                (.leaf ⟨175, #[100, 0, 12, 0, 0, 0, 63, 0, 25, 0, 21, 49, 28, 0]⟩)
              )
              (.branch 103
                (.leaf ⟨925, #[0, 0, 192, 0, 0, 0, 333, 175, 100, 0, 111, 259, 148, 0]⟩)
                (.leaf ⟨25, #[0, 0, 16, 0, 0, 0, 9, 0, 0, 0, 3, 7, 4, 0]⟩)
              )
            )
          )
          (.branch 108
            (.branch 106
              (.branch 105
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 3429, 1143, 2667, 4699, 2676, 4711, 2692, 0]⟩)
                (.leaf ⟨3367, #[2224, 0, 0, 0, 0, 0, 1143, 0, 381, 889, 444, 973, 556, 0]⟩)
              )
              (.branch 107
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 6501, 2167, 324, 2599, 900, 3367, 1924, 0]⟩)
                (.leaf ⟨781, #[0, 400, 0, 0, 0, 0, 381, 0, 0, 127, 36, 175, 100, 0]⟩)
              )
            )
            (.branch 110
              (.branch 109
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 5733, 1911, 4459, 3124, 1344, 3703, 2116, 0]⟩)
                (.leaf ⟨37, #[16, 0, 0, 0, 0, 0, 21, 0, 7, 4, 0, 7, 4, 0]⟩)
              )
              (.branch 111
                (.leaf ⟨6475, #[0, 0, 0, 432, 0, 0, 3675, 1369, 1036, 592, 0, 1225, 700, 0]⟩)
                (.leaf ⟨37, #[0, 0, 0, 16, 0, 0, 21, 0, 0, 0, 0, 7, 4, 0]⟩)
              )
            )
          )
        )
        (.branch 120
          (.branch 116
            (.branch 114
              (.branch 113
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 2997, 999, 2331, 4107, 6475, 4900, 2800, 0]⟩)
                (.leaf ⟨91, #[64, 0, 0, 0, 0, 0, 27, 0, 9, 21, 37, 28, 16, 0]⟩)
              )
              (.branch 115
                (.leaf ⟨5467, #[0, 12, 0, 0, 0, 0, 2331, 781, 0, 777, 1813, 1372, 784, 0]⟩)
                (.leaf ⟨781, #[0, 448, 0, 0, 0, 0, 333, 0, 0, 111, 259, 196, 112, 0]⟩)
              )
            )
            (.branch 118
              (.branch 117
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 5301, 1767, 4123, 2532, 5143, 3892, 2224, 0]⟩)
                (.leaf ⟨3367, #[1600, 0, 0, 0, 0, 0, 1767, 0, 589, 252, 925, 700, 400, 0]⟩)
              )
              (.branch 119
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 8373, 2791, 1780, 432, 3367, 2548, 1456, 0]⟩)
                (.leaf ⟨175, #[0, 0, 64, 0, 0, 0, 111, 0, 0, 0, 37, 28, 16, 0]⟩)
              )
            )
          )
          (.branch 124
            (.branch 122
              (.branch 121
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 4725, 1575, 3675, 6475, 5476, 4144, 2368, 0]⟩)
                (.leaf ⟨481, #[256, 0, 0, 0, 0, 0, 225, 0, 75, 175, 148, 112, 64, 0]⟩)
              )
              (.branch 123
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 7797, 2599, 1332, 4375, 3700, 2800, 1600, 0]⟩)
                (.leaf ⟨781, #[0, 256, 0, 0, 0, 0, 525, 0, 0, 175, 148, 112, 64, 0]⟩)
              )
            )
            (.branch 126
              (.branch 125
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 7029, 2343, 5467, 4900, 4144, 3136, 1792, 0]⟩)
                (.leaf ⟨3367, #[1024, 0, 0, 0, 0, 0, 2343, 0, 781, 700, 592, 448, 256, 0]⟩)
              )
              (.branch 127
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 10101, 3367, 3124, 2800, 2368, 1792, 1024, 0]⟩)
                (.leaf ⟨1, #[0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
            )
          )
        )
      )
    )
  )

noncomputable def row (m : Fin (2^7)) : DualRow := rowData.get m.val

private theorem block_0 : ∀ j : Fin 64,
    DualValid 7 bounds (fun i => (0*64+j.val).testBit i.val)
      (row ⟨0*64+j.val, by omega⟩) := by decide +kernel

private theorem block_1 : ∀ j : Fin 64,
    DualValid 7 bounds (fun i => (1*64+j.val).testBit i.val)
      (row ⟨1*64+j.val, by omega⟩) := by decide +kernel

theorem rows_valid (m : Fin (2^7)) :
    DualValid 7 bounds (fun i => m.val.testBit i.val) (row m) := by
  let q := m.val / 64
  let j : Fin 64 := ⟨m.val % 64, Nat.mod_lt _ (by decide)⟩
  have hq : q < 2 := by dsimp [q]; omega
  have he : m.val = q*64+j.val := by dsimp [q,j]; omega
  interval_cases q
  · have hm : m = ⟨0*64+j.val, by omega⟩ := Fin.ext he
    rw [hm]
    exact block_0 j
  · have hm : m = ⟨1*64+j.val, by omega⟩ := Fin.ext he
    rw [hm]
    exact block_1 j

theorem increment_positive : ∀ i < 7, 0 < KZGeneral.increment bounds scale i := by
  intro i hi
  interval_cases i <;>
    norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale]

theorem numerical_margin : 1 < (57153600 : ℝ)^2 *
    ∏ i ∈ Finset.range 7, KZGeneral.increment bounds scale i := by
  norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale,
    Finset.prod_range_succ]

theorem product_lower_bound (t : ℕ → ℝ)
    (ht : ∀ i < 7, 0 < t i)
    (hprefix : ∀ r ≤ 7, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 7 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 7, KZGeneral.increment bounds scale i ≤
      ∏ i ∈ Finset.range 7, t i := by
  exact KZGeneral.product_of_certificate 7 bounds scale (by decide) (by decide)
    row rows_valid increment_positive t ht hprefix hratio

theorem norm_cutoff (t : ℕ → ℝ) (S deltaSquared : ℝ) (hS : 0 < S)
    (ht : ∀ i < 7, 0 < t i)
    (hprefix : ∀ r ≤ 7, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 7 → 3*t i ≤ 4*t (i+1))
    (hdet : ∏ i ∈ Finset.range 7, t i = deltaSquared / S) :
    S < (57153600 : ℝ)^2 * deltaSquared := by
  exact KZGeneral.norm_square_cutoff 7 (KZGeneral.increment bounds scale) t
    S deltaSquared 57153600 hS (product_lower_bound t ht hprefix hratio) hdet numerical_margin

end TightEight

namespace SevenSpectrum

/-! Threshold 1/7; containing-space lower bounds 5/33, 1/6, 1/5, 1/4, 1/3, 1/2.
The exact increment product is 8993/1186638179795145. -/

def scale : ℕ := 5336100
def boundData : Array ℕ := #[0, 1600, 12100, 69696, 245025, 774400, 2722500]
def bounds (r : ℕ) : ℕ := boundData[r]?.getD 0

def rowData : Lean.RArray DualRow :=
  (.branch 32
    (.branch 16
      (.branch 8
        (.branch 4
          (.branch 2
            (.branch 1
              (.leaf ⟨1, #[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              (.leaf ⟨1, #[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
            )
            (.branch 3
              (.leaf ⟨7, #[0, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0]⟩)
              (.leaf ⟨1, #[0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
            )
          )
          (.branch 6
            (.branch 5
              (.leaf ⟨37, #[0, 0, 9, 0, 0, 0, 3, 7, 0, 0, 0, 0]⟩)
              (.leaf ⟨7, #[4, 0, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0]⟩)
            )
            (.branch 7
              (.leaf ⟨37, #[0, 0, 21, 0, 0, 0, 7, 4, 0, 0, 0, 0]⟩)
              (.leaf ⟨1, #[0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
            )
          )
        )
        (.branch 12
          (.branch 10
            (.branch 9
              (.leaf ⟨175, #[0, 0, 0, 27, 0, 0, 9, 21, 37, 0, 0, 0]⟩)
              (.leaf ⟨37, #[28, 0, 0, 9, 0, 0, 0, 3, 7, 0, 0, 0]⟩)
            )
            (.branch 11
              (.leaf ⟨7, #[0, 0, 0, 3, 0, 0, 1, 0, 1, 0, 0, 0]⟩)
              (.leaf ⟨7, #[0, 4, 0, 3, 0, 0, 0, 0, 1, 0, 0, 0]⟩)
            )
          )
          (.branch 14
            (.branch 13
              (.leaf ⟨25, #[0, 0, 0, 9, 0, 0, 3, 7, 4, 0, 0, 0]⟩)
              (.leaf ⟨37, #[16, 0, 0, 21, 0, 0, 0, 7, 4, 0, 0, 0]⟩)
            )
            (.branch 15
              (.leaf ⟨175, #[0, 0, 0, 111, 0, 0, 37, 28, 16, 0, 0, 0]⟩)
              (.leaf ⟨1, #[0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
            )
          )
        )
      )
      (.branch 24
        (.branch 20
          (.branch 18
            (.branch 17
              (.leaf ⟨781, #[0, 0, 0, 0, 81, 0, 27, 63, 111, 175, 0, 0]⟩)
              (.leaf ⟨175, #[148, 0, 0, 0, 27, 0, 0, 9, 21, 37, 0, 0]⟩)
            )
            (.branch 19
              (.leaf ⟨259, #[0, 48, 0, 0, 63, 0, 37, 0, 21, 49, 0, 0]⟩)
              (.leaf ⟨37, #[0, 28, 0, 0, 9, 0, 0, 0, 3, 7, 0, 0]⟩)
            )
          )
          (.branch 22
            (.branch 21
              (.leaf ⟨781, #[0, 0, 0, 0, 225, 0, 75, 175, 48, 139, 0, 0]⟩)
              (.leaf ⟨7, #[4, 0, 0, 0, 3, 0, 0, 1, 0, 1, 0, 0]⟩)
            )
            (.branch 23
              (.leaf ⟨259, #[0, 0, 36, 0, 111, 0, 49, 28, 0, 37, 0, 0]⟩)
              (.leaf ⟨7, #[0, 0, 4, 0, 3, 0, 0, 0, 0, 1, 0, 0]⟩)
            )
          )
        )
        (.branch 28
          (.branch 26
            (.branch 25
              (.leaf ⟨781, #[0, 0, 0, 0, 189, 0, 63, 147, 259, 148, 0, 0]⟩)
              (.leaf ⟨25, #[16, 0, 0, 0, 9, 0, 0, 3, 7, 4, 0, 0]⟩)
            )
            (.branch 27
              (.leaf ⟨781, #[0, 0, 0, 0, 381, 0, 127, 36, 175, 100, 0, 0]⟩)
              (.leaf ⟨37, #[0, 16, 0, 0, 21, 0, 0, 0, 7, 4, 0, 0]⟩)
            )
          )
          (.branch 30
            (.branch 29
              (.leaf ⟨781, #[0, 0, 0, 0, 333, 0, 111, 259, 196, 112, 0, 0]⟩)
              (.leaf ⟨175, #[64, 0, 0, 0, 111, 0, 0, 37, 28, 16, 0, 0]⟩)
            )
            (.branch 31
              (.leaf ⟨781, #[0, 0, 0, 0, 525, 0, 175, 148, 112, 64, 0, 0]⟩)
              (.leaf ⟨1, #[0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]⟩)
            )
          )
        )
      )
    )
    (.branch 48
      (.branch 40
        (.branch 36
          (.branch 34
            (.branch 33
              (.leaf ⟨3367, #[0, 0, 0, 0, 0, 243, 81, 189, 333, 525, 781, 0]⟩)
              (.leaf ⟨781, #[700, 0, 0, 0, 0, 81, 0, 27, 63, 111, 175, 0]⟩)
            )
            (.branch 35
              (.leaf ⟨175, #[0, 48, 0, 0, 0, 27, 25, 0, 9, 21, 37, 0]⟩)
              (.leaf ⟨175, #[0, 148, 0, 0, 0, 27, 0, 0, 9, 21, 37, 0]⟩)
            )
          )
          (.branch 38
            (.branch 37
              (.leaf ⟨37, #[0, 0, 0, 0, 0, 9, 3, 7, 0, 3, 7, 0]⟩)
              (.leaf ⟨259, #[148, 0, 48, 0, 0, 63, 0, 37, 0, 21, 49, 0]⟩)
            )
            (.branch 39
              (.leaf ⟨37, #[0, 0, 12, 0, 0, 9, 7, 4, 0, 3, 7, 0]⟩)
              (.leaf ⟨37, #[0, 0, 28, 0, 0, 9, 0, 0, 0, 3, 7, 0]⟩)
            )
          )
        )
        (.branch 44
          (.branch 42
            (.branch 41
              (.leaf ⟨3367, #[0, 0, 0, 0, 0, 675, 225, 525, 925, 336, 673, 0]⟩)
              (.leaf ⟨781, #[556, 0, 0, 0, 0, 225, 0, 75, 175, 48, 139, 0]⟩)
            )
            (.branch 43
              (.leaf ⟨7, #[0, 0, 0, 0, 0, 3, 1, 0, 1, 0, 1, 0]⟩)
              (.leaf ⟨7, #[0, 4, 0, 0, 0, 3, 0, 0, 1, 0, 1, 0]⟩)
            )
          )
          (.branch 46
            (.branch 45
              (.leaf ⟨3367, #[0, 0, 0, 0, 0, 1251, 417, 973, 592, 84, 529, 0]⟩)
              (.leaf ⟨259, #[112, 0, 0, 36, 0, 111, 0, 49, 28, 0, 37, 0]⟩)
            )
            (.branch 47
              (.leaf ⟨175, #[0, 0, 0, 36, 0, 75, 37, 28, 16, 0, 25, 0]⟩)
              (.leaf ⟨7, #[0, 0, 0, 4, 0, 3, 0, 0, 0, 0, 1, 0]⟩)
            )
          )
        )
      )
      (.branch 56
        (.branch 52
          (.branch 50
            (.branch 49
              (.leaf ⟨481, #[0, 0, 0, 0, 0, 81, 27, 63, 111, 175, 100, 0]⟩)
              (.leaf ⟨781, #[592, 0, 0, 0, 0, 189, 0, 63, 147, 259, 148, 0]⟩)
            )
            (.branch 51
              (.leaf ⟨175, #[0, 12, 0, 0, 0, 63, 25, 0, 21, 49, 28, 0]⟩)
              (.leaf ⟨25, #[0, 16, 0, 0, 0, 9, 0, 0, 3, 7, 4, 0]⟩)
            )
          )
          (.branch 54
            (.branch 53
              (.leaf ⟨3367, #[0, 0, 0, 0, 0, 1143, 381, 889, 444, 973, 556, 0]⟩)
              (.leaf ⟨781, #[400, 0, 0, 0, 0, 381, 0, 127, 36, 175, 100, 0]⟩)
            )
            (.branch 55
              (.leaf ⟨37, #[0, 0, 0, 0, 0, 21, 7, 4, 0, 7, 4, 0]⟩)
              (.leaf ⟨37, #[0, 0, 16, 0, 0, 21, 0, 0, 0, 7, 4, 0]⟩)
            )
          )
        )
        (.branch 60
          (.branch 58
            (.branch 57
              (.leaf ⟨91, #[0, 0, 0, 0, 0, 27, 9, 21, 37, 28, 16, 0]⟩)
              (.leaf ⟨781, #[448, 0, 0, 0, 0, 333, 0, 111, 259, 196, 112, 0]⟩)
            )
            (.branch 59
              (.leaf ⟨3367, #[0, 0, 0, 0, 0, 1767, 589, 252, 925, 700, 400, 0]⟩)
              (.leaf ⟨175, #[0, 64, 0, 0, 0, 111, 0, 0, 37, 28, 16, 0]⟩)
            )
          )
          (.branch 62
            (.branch 61
              (.leaf ⟨481, #[0, 0, 0, 0, 0, 225, 75, 175, 148, 112, 64, 0]⟩)
              (.leaf ⟨781, #[256, 0, 0, 0, 0, 525, 0, 175, 148, 112, 64, 0]⟩)
            )
            (.branch 63
              (.leaf ⟨3367, #[0, 0, 0, 0, 0, 2343, 781, 700, 592, 448, 256, 0]⟩)
              (.leaf ⟨1, #[0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0]⟩)
            )
          )
        )
      )
    )
  )

noncomputable def row (m : Fin (2^6)) : DualRow := rowData.get m.val

private theorem block_0 : ∀ j : Fin 64,
    DualValid 6 bounds (fun i => (0*64+j.val).testBit i.val)
      (row ⟨0*64+j.val, by omega⟩) := by decide +kernel

theorem rows_valid (m : Fin (2^6)) :
    DualValid 6 bounds (fun i => m.val.testBit i.val) (row m) := by
  let q := m.val / 64
  let j : Fin 64 := ⟨m.val % 64, Nat.mod_lt _ (by decide)⟩
  have hq : q < 1 := by dsimp [q]; omega
  have he : m.val = q*64+j.val := by dsimp [q,j]; omega
  interval_cases q
  · have hm : m = ⟨0*64+j.val, by omega⟩ := Fin.ext he
    rw [hm]
    exact block_0 j

theorem increment_positive : ∀ i < 6, 0 < KZGeneral.increment bounds scale i := by
  intro i hi
  interval_cases i <;>
    norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale]

theorem numerical_margin : 1 < (5145525 : ℝ)^2 *
    ∏ i ∈ Finset.range 6, KZGeneral.increment bounds scale i := by
  norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale,
    Finset.prod_range_succ]

theorem product_lower_bound (t : ℕ → ℝ)
    (ht : ∀ i < 6, 0 < t i)
    (hprefix : ∀ r ≤ 6, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 6 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 6, KZGeneral.increment bounds scale i ≤
      ∏ i ∈ Finset.range 6, t i := by
  exact KZGeneral.product_of_certificate 6 bounds scale (by decide) (by decide)
    row rows_valid increment_positive t ht hprefix hratio

theorem norm_cutoff (t : ℕ → ℝ) (S deltaSquared : ℝ) (hS : 0 < S)
    (ht : ∀ i < 6, 0 < t i)
    (hprefix : ∀ r ≤ 6, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 6 → 3*t i ≤ 4*t (i+1))
    (hdet : ∏ i ∈ Finset.range 6, t i = deltaSquared / S) :
    S < (5145525 : ℝ)^2 * deltaSquared := by
  exact KZGeneral.norm_square_cutoff 6 (KZGeneral.increment bounds scale) t
    S deltaSquared 5145525 hS (product_lower_bound t ht hprefix hratio) hdet numerical_margin

end SevenSpectrum

namespace EightSpectrum

/-! Threshold 1/8; containing-space lower bounds 3/23, 1/7, 1/6, 1/5, 1/4, 1/3, 1/2.
The exact increment product is 1/47981761732800. -/

def scale : ℕ := 93315600
def boundData : Array ℕ := #[0, 11025, 119025, 648025, 2099601, 5832225, 16200625, 52490025]
def bounds (r : ℕ) : ℕ := boundData[r]?.getD 0

def rowData : Lean.RArray DualRow :=
  (.branch 64
    (.branch 32
      (.branch 16
        (.branch 8
          (.branch 4
            (.branch 2
              (.branch 1
                (.leaf ⟨1, #[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
                (.leaf ⟨1, #[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
              (.branch 3
                (.leaf ⟨7, #[0, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0]⟩)
                (.leaf ⟨1, #[0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
            )
            (.branch 6
              (.branch 5
                (.leaf ⟨37, #[0, 0, 9, 0, 0, 0, 0, 3, 7, 0, 0, 0, 0, 0]⟩)
                (.leaf ⟨7, #[4, 0, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0]⟩)
              )
              (.branch 7
                (.leaf ⟨37, #[0, 0, 21, 0, 0, 0, 0, 7, 4, 0, 0, 0, 0, 0]⟩)
                (.leaf ⟨1, #[0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
            )
          )
          (.branch 12
            (.branch 10
              (.branch 9
                (.leaf ⟨175, #[0, 0, 0, 27, 0, 0, 0, 9, 21, 37, 0, 0, 0, 0]⟩)
                (.leaf ⟨37, #[28, 0, 0, 9, 0, 0, 0, 0, 3, 7, 0, 0, 0, 0]⟩)
              )
              (.branch 11
                (.leaf ⟨7, #[0, 0, 0, 3, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0]⟩)
                (.leaf ⟨7, #[0, 4, 0, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0]⟩)
              )
            )
            (.branch 14
              (.branch 13
                (.leaf ⟨25, #[0, 0, 0, 9, 0, 0, 0, 3, 7, 4, 0, 0, 0, 0]⟩)
                (.leaf ⟨37, #[16, 0, 0, 21, 0, 0, 0, 0, 7, 4, 0, 0, 0, 0]⟩)
              )
              (.branch 15
                (.leaf ⟨175, #[0, 0, 0, 111, 0, 0, 0, 37, 28, 16, 0, 0, 0, 0]⟩)
                (.leaf ⟨1, #[0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
            )
          )
        )
        (.branch 24
          (.branch 20
            (.branch 18
              (.branch 17
                (.leaf ⟨781, #[0, 0, 0, 0, 81, 0, 0, 27, 63, 111, 175, 0, 0, 0]⟩)
                (.leaf ⟨175, #[148, 0, 0, 0, 27, 0, 0, 0, 9, 21, 37, 0, 0, 0]⟩)
              )
              (.branch 19
                (.leaf ⟨259, #[0, 48, 0, 0, 63, 0, 0, 37, 0, 21, 49, 0, 0, 0]⟩)
                (.leaf ⟨37, #[0, 28, 0, 0, 9, 0, 0, 0, 0, 3, 7, 0, 0, 0]⟩)
              )
            )
            (.branch 22
              (.branch 21
                (.leaf ⟨781, #[0, 0, 0, 0, 225, 0, 0, 75, 175, 48, 139, 0, 0, 0]⟩)
                (.leaf ⟨7, #[4, 0, 0, 0, 3, 0, 0, 0, 1, 0, 1, 0, 0, 0]⟩)
              )
              (.branch 23
                (.leaf ⟨259, #[0, 0, 36, 0, 111, 0, 0, 49, 28, 0, 37, 0, 0, 0]⟩)
                (.leaf ⟨7, #[0, 0, 4, 0, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0]⟩)
              )
            )
          )
          (.branch 28
            (.branch 26
              (.branch 25
                (.leaf ⟨781, #[0, 0, 0, 0, 189, 0, 0, 63, 147, 259, 148, 0, 0, 0]⟩)
                (.leaf ⟨25, #[16, 0, 0, 0, 9, 0, 0, 0, 3, 7, 4, 0, 0, 0]⟩)
              )
              (.branch 27
                (.leaf ⟨781, #[0, 0, 0, 0, 381, 0, 0, 127, 36, 175, 100, 0, 0, 0]⟩)
                (.leaf ⟨37, #[0, 16, 0, 0, 21, 0, 0, 0, 0, 7, 4, 0, 0, 0]⟩)
              )
            )
            (.branch 30
              (.branch 29
                (.leaf ⟨781, #[0, 0, 0, 0, 333, 0, 0, 111, 259, 196, 112, 0, 0, 0]⟩)
                (.leaf ⟨175, #[64, 0, 0, 0, 111, 0, 0, 0, 37, 28, 16, 0, 0, 0]⟩)
              )
              (.branch 31
                (.leaf ⟨781, #[0, 0, 0, 0, 525, 0, 0, 175, 148, 112, 64, 0, 0, 0]⟩)
                (.leaf ⟨1, #[0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
            )
          )
        )
      )
      (.branch 48
        (.branch 40
          (.branch 36
            (.branch 34
              (.branch 33
                (.leaf ⟨3367, #[0, 0, 0, 0, 0, 243, 0, 81, 189, 333, 525, 781, 0, 0]⟩)
                (.leaf ⟨781, #[700, 0, 0, 0, 0, 81, 0, 0, 27, 63, 111, 175, 0, 0]⟩)
              )
              (.branch 35
                (.leaf ⟨175, #[0, 48, 0, 0, 0, 27, 0, 25, 0, 9, 21, 37, 0, 0]⟩)
                (.leaf ⟨175, #[0, 148, 0, 0, 0, 27, 0, 0, 0, 9, 21, 37, 0, 0]⟩)
              )
            )
            (.branch 38
              (.branch 37
                (.leaf ⟨37, #[0, 0, 0, 0, 0, 9, 0, 3, 7, 0, 3, 7, 0, 0]⟩)
                (.leaf ⟨259, #[148, 0, 48, 0, 0, 63, 0, 0, 37, 0, 21, 49, 0, 0]⟩)
              )
              (.branch 39
                (.leaf ⟨37, #[0, 0, 12, 0, 0, 9, 0, 7, 4, 0, 3, 7, 0, 0]⟩)
                (.leaf ⟨37, #[0, 0, 28, 0, 0, 9, 0, 0, 0, 0, 3, 7, 0, 0]⟩)
              )
            )
          )
          (.branch 44
            (.branch 42
              (.branch 41
                (.leaf ⟨3367, #[0, 0, 0, 0, 0, 675, 0, 225, 525, 925, 336, 673, 0, 0]⟩)
                (.leaf ⟨781, #[556, 0, 0, 0, 0, 225, 0, 0, 75, 175, 48, 139, 0, 0]⟩)
              )
              (.branch 43
                (.leaf ⟨7, #[0, 0, 0, 0, 0, 3, 0, 1, 0, 1, 0, 1, 0, 0]⟩)
                (.leaf ⟨7, #[0, 4, 0, 0, 0, 3, 0, 0, 0, 1, 0, 1, 0, 0]⟩)
              )
            )
            (.branch 46
              (.branch 45
                (.leaf ⟨3367, #[0, 0, 0, 0, 0, 1251, 0, 417, 973, 592, 84, 529, 0, 0]⟩)
                (.leaf ⟨259, #[112, 0, 0, 36, 0, 111, 0, 0, 49, 28, 0, 37, 0, 0]⟩)
              )
              (.branch 47
                (.leaf ⟨175, #[0, 0, 0, 36, 0, 75, 0, 37, 28, 16, 0, 25, 0, 0]⟩)
                (.leaf ⟨7, #[0, 0, 0, 4, 0, 3, 0, 0, 0, 0, 0, 1, 0, 0]⟩)
              )
            )
          )
        )
        (.branch 56
          (.branch 52
            (.branch 50
              (.branch 49
                (.leaf ⟨481, #[0, 0, 0, 0, 0, 81, 0, 27, 63, 111, 175, 100, 0, 0]⟩)
                (.leaf ⟨781, #[592, 0, 0, 0, 0, 189, 0, 0, 63, 147, 259, 148, 0, 0]⟩)
              )
              (.branch 51
                (.leaf ⟨175, #[0, 12, 0, 0, 0, 63, 0, 25, 0, 21, 49, 28, 0, 0]⟩)
                (.leaf ⟨25, #[0, 16, 0, 0, 0, 9, 0, 0, 0, 3, 7, 4, 0, 0]⟩)
              )
            )
            (.branch 54
              (.branch 53
                (.leaf ⟨3367, #[0, 0, 0, 0, 0, 1143, 0, 381, 889, 444, 973, 556, 0, 0]⟩)
                (.leaf ⟨781, #[400, 0, 0, 0, 0, 381, 0, 0, 127, 36, 175, 100, 0, 0]⟩)
              )
              (.branch 55
                (.leaf ⟨37, #[0, 0, 0, 0, 0, 21, 0, 7, 4, 0, 7, 4, 0, 0]⟩)
                (.leaf ⟨37, #[0, 0, 16, 0, 0, 21, 0, 0, 0, 0, 7, 4, 0, 0]⟩)
              )
            )
          )
          (.branch 60
            (.branch 58
              (.branch 57
                (.leaf ⟨91, #[0, 0, 0, 0, 0, 27, 0, 9, 21, 37, 28, 16, 0, 0]⟩)
                (.leaf ⟨781, #[448, 0, 0, 0, 0, 333, 0, 0, 111, 259, 196, 112, 0, 0]⟩)
              )
              (.branch 59
                (.leaf ⟨3367, #[0, 0, 0, 0, 0, 1767, 0, 589, 252, 925, 700, 400, 0, 0]⟩)
                (.leaf ⟨175, #[0, 64, 0, 0, 0, 111, 0, 0, 0, 37, 28, 16, 0, 0]⟩)
              )
            )
            (.branch 62
              (.branch 61
                (.leaf ⟨481, #[0, 0, 0, 0, 0, 225, 0, 75, 175, 148, 112, 64, 0, 0]⟩)
                (.leaf ⟨781, #[256, 0, 0, 0, 0, 525, 0, 0, 175, 148, 112, 64, 0, 0]⟩)
              )
              (.branch 63
                (.leaf ⟨3367, #[0, 0, 0, 0, 0, 2343, 0, 781, 700, 592, 448, 256, 0, 0]⟩)
                (.leaf ⟨1, #[0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
            )
          )
        )
      )
    )
    (.branch 96
      (.branch 80
        (.branch 72
          (.branch 68
            (.branch 66
              (.branch 65
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 729, 243, 567, 999, 1575, 2343, 3367, 0]⟩)
                (.leaf ⟨3367, #[3124, 0, 0, 0, 0, 0, 243, 0, 81, 189, 333, 525, 781, 0]⟩)
              )
              (.branch 67
                (.leaf ⟨5467, #[0, 1776, 0, 0, 0, 0, 567, 781, 0, 189, 441, 777, 1225, 0]⟩)
                (.leaf ⟨781, #[0, 700, 0, 0, 0, 0, 81, 0, 0, 27, 63, 111, 175, 0]⟩)
              )
            )
            (.branch 70
              (.branch 69
                (.leaf ⟨6475, #[0, 0, 576, 0, 0, 0, 999, 525, 1225, 0, 333, 777, 1369, 0]⟩)
                (.leaf ⟨175, #[100, 0, 48, 0, 0, 0, 27, 0, 25, 0, 9, 21, 37, 0]⟩)
              )
              (.branch 71
                (.leaf ⟨6475, #[0, 0, 2676, 0, 0, 0, 999, 1225, 700, 0, 333, 777, 1369, 0]⟩)
                (.leaf ⟨175, #[0, 0, 148, 0, 0, 0, 27, 0, 0, 0, 9, 21, 37, 0]⟩)
              )
            )
          )
          (.branch 76
            (.branch 74
              (.branch 73
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 2457, 819, 1911, 3367, 576, 1587, 2935, 0]⟩)
                (.leaf ⟨37, #[28, 0, 0, 0, 0, 0, 9, 0, 3, 7, 0, 3, 7, 0]⟩)
              )
              (.branch 75
                (.leaf ⟨259, #[0, 0, 0, 48, 0, 0, 63, 37, 0, 37, 0, 21, 49, 0]⟩)
                (.leaf ⟨259, #[0, 148, 0, 48, 0, 0, 63, 0, 0, 37, 0, 21, 49, 0]⟩)
              )
            )
            (.branch 78
              (.branch 77
                (.leaf ⟨925, #[0, 0, 0, 108, 0, 0, 225, 111, 259, 148, 0, 75, 175, 0]⟩)
                (.leaf ⟨37, #[16, 0, 0, 12, 0, 0, 9, 0, 7, 4, 0, 3, 7, 0]⟩)
              )
              (.branch 79
                (.leaf ⟨6475, #[0, 0, 0, 2532, 0, 0, 1575, 1369, 1036, 592, 0, 525, 1225, 0]⟩)
                (.leaf ⟨37, #[0, 0, 0, 28, 0, 0, 9, 0, 0, 0, 0, 3, 7, 0]⟩)
              )
            )
          )
        )
        (.branch 88
          (.branch 84
            (.branch 82
              (.branch 81
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 2025, 675, 1575, 2775, 4375, 1776, 3043, 0]⟩)
                (.leaf ⟨3367, #[2692, 0, 0, 0, 0, 0, 675, 0, 225, 525, 925, 336, 673, 0]⟩)
              )
              (.branch 83
                (.leaf ⟨5467, #[0, 768, 0, 0, 0, 0, 1575, 781, 0, 525, 1225, 336, 973, 0]⟩)
                (.leaf ⟨781, #[0, 556, 0, 0, 0, 0, 225, 0, 0, 75, 175, 48, 139, 0]⟩)
              )
            )
            (.branch 86
              (.branch 85
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 4329, 1443, 3367, 1200, 3043, 768, 2467, 0]⟩)
                (.leaf ⟨7, #[4, 0, 0, 0, 0, 0, 3, 0, 1, 0, 1, 0, 1, 0]⟩)
              )
              (.branch 87
                (.leaf ⟨259, #[0, 0, 36, 0, 0, 0, 111, 49, 28, 0, 37, 0, 37, 0]⟩)
                (.leaf ⟨7, #[0, 0, 4, 0, 0, 0, 3, 0, 0, 0, 1, 0, 1, 0]⟩)
              )
            )
          )
          (.branch 92
            (.branch 90
              (.branch 89
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 3753, 1251, 2919, 5143, 3376, 1020, 2611, 0]⟩)
                (.leaf ⟨3367, #[2116, 0, 0, 0, 0, 0, 1251, 0, 417, 973, 592, 84, 529, 0]⟩)
              )
              (.branch 91
                (.leaf ⟨5467, #[0, 0, 0, 0, 324, 0, 2343, 889, 252, 1225, 700, 0, 781, 0]⟩)
                (.leaf ⟨259, #[0, 112, 0, 0, 36, 0, 111, 0, 0, 49, 28, 0, 37, 0]⟩)
              )
            )
            (.branch 94
              (.branch 93
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 6057, 2019, 4711, 3568, 2044, 12, 2035, 0]⟩)
                (.leaf ⟨175, #[64, 0, 0, 0, 36, 0, 75, 0, 37, 28, 16, 0, 25, 0]⟩)
              )
              (.branch 95
                (.leaf ⟨5467, #[0, 0, 0, 0, 1332, 0, 2343, 1225, 1036, 784, 448, 0, 781, 0]⟩)
                (.leaf ⟨7, #[0, 0, 0, 0, 4, 0, 3, 0, 0, 0, 0, 0, 1, 0]⟩)
              )
            )
          )
        )
      )
      (.branch 112
        (.branch 104
          (.branch 100
            (.branch 98
              (.branch 97
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 1701, 567, 1323, 2331, 3675, 5467, 3124, 0]⟩)
                (.leaf ⟨481, #[400, 0, 0, 0, 0, 0, 81, 0, 27, 63, 111, 175, 100, 0]⟩)
              )
              (.branch 99
                (.leaf ⟨5467, #[0, 1020, 0, 0, 0, 0, 1323, 781, 0, 441, 1029, 1813, 1036, 0]⟩)
                (.leaf ⟨781, #[0, 592, 0, 0, 0, 0, 189, 0, 0, 63, 147, 259, 148, 0]⟩)
              )
            )
            (.branch 102
              (.branch 101
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 4005, 1335, 3115, 756, 2343, 4459, 2548, 0]⟩)
                (.leaf ⟨175, #[100, 0, 12, 0, 0, 0, 63, 0, 25, 0, 21, 49, 28, 0]⟩)
              )
              (.branch 103
                (.leaf ⟨925, #[0, 0, 192, 0, 0, 0, 333, 175, 100, 0, 111, 259, 148, 0]⟩)
                (.leaf ⟨25, #[0, 0, 16, 0, 0, 0, 9, 0, 0, 0, 3, 7, 4, 0]⟩)
              )
            )
          )
          (.branch 108
            (.branch 106
              (.branch 105
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 3429, 1143, 2667, 4699, 2676, 4711, 2692, 0]⟩)
                (.leaf ⟨3367, #[2224, 0, 0, 0, 0, 0, 1143, 0, 381, 889, 444, 973, 556, 0]⟩)
              )
              (.branch 107
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 6501, 2167, 324, 2599, 900, 3367, 1924, 0]⟩)
                (.leaf ⟨781, #[0, 400, 0, 0, 0, 0, 381, 0, 0, 127, 36, 175, 100, 0]⟩)
              )
            )
            (.branch 110
              (.branch 109
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 5733, 1911, 4459, 3124, 1344, 3703, 2116, 0]⟩)
                (.leaf ⟨37, #[16, 0, 0, 0, 0, 0, 21, 0, 7, 4, 0, 7, 4, 0]⟩)
              )
              (.branch 111
                (.leaf ⟨6475, #[0, 0, 0, 432, 0, 0, 3675, 1369, 1036, 592, 0, 1225, 700, 0]⟩)
                (.leaf ⟨37, #[0, 0, 0, 16, 0, 0, 21, 0, 0, 0, 0, 7, 4, 0]⟩)
              )
            )
          )
        )
        (.branch 120
          (.branch 116
            (.branch 114
              (.branch 113
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 2997, 999, 2331, 4107, 6475, 4900, 2800, 0]⟩)
                (.leaf ⟨91, #[64, 0, 0, 0, 0, 0, 27, 0, 9, 21, 37, 28, 16, 0]⟩)
              )
              (.branch 115
                (.leaf ⟨5467, #[0, 12, 0, 0, 0, 0, 2331, 781, 0, 777, 1813, 1372, 784, 0]⟩)
                (.leaf ⟨781, #[0, 448, 0, 0, 0, 0, 333, 0, 0, 111, 259, 196, 112, 0]⟩)
              )
            )
            (.branch 118
              (.branch 117
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 5301, 1767, 4123, 2532, 5143, 3892, 2224, 0]⟩)
                (.leaf ⟨3367, #[1600, 0, 0, 0, 0, 0, 1767, 0, 589, 252, 925, 700, 400, 0]⟩)
              )
              (.branch 119
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 8373, 2791, 1780, 432, 3367, 2548, 1456, 0]⟩)
                (.leaf ⟨175, #[0, 0, 64, 0, 0, 0, 111, 0, 0, 0, 37, 28, 16, 0]⟩)
              )
            )
          )
          (.branch 124
            (.branch 122
              (.branch 121
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 4725, 1575, 3675, 6475, 5476, 4144, 2368, 0]⟩)
                (.leaf ⟨481, #[256, 0, 0, 0, 0, 0, 225, 0, 75, 175, 148, 112, 64, 0]⟩)
              )
              (.branch 123
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 7797, 2599, 1332, 4375, 3700, 2800, 1600, 0]⟩)
                (.leaf ⟨781, #[0, 256, 0, 0, 0, 0, 525, 0, 0, 175, 148, 112, 64, 0]⟩)
              )
            )
            (.branch 126
              (.branch 125
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 7029, 2343, 5467, 4900, 4144, 3136, 1792, 0]⟩)
                (.leaf ⟨3367, #[1024, 0, 0, 0, 0, 0, 2343, 0, 781, 700, 592, 448, 256, 0]⟩)
              )
              (.branch 127
                (.leaf ⟨14197, #[0, 0, 0, 0, 0, 0, 10101, 3367, 3124, 2800, 2368, 1792, 1024, 0]⟩)
                (.leaf ⟨1, #[0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]⟩)
              )
            )
          )
        )
      )
    )
  )

noncomputable def row (m : Fin (2^7)) : DualRow := rowData.get m.val

private theorem block_0 : ∀ j : Fin 64,
    DualValid 7 bounds (fun i => (0*64+j.val).testBit i.val)
      (row ⟨0*64+j.val, by omega⟩) := by decide +kernel

private theorem block_1 : ∀ j : Fin 64,
    DualValid 7 bounds (fun i => (1*64+j.val).testBit i.val)
      (row ⟨1*64+j.val, by omega⟩) := by decide +kernel

theorem rows_valid (m : Fin (2^7)) :
    DualValid 7 bounds (fun i => m.val.testBit i.val) (row m) := by
  let q := m.val / 64
  let j : Fin 64 := ⟨m.val % 64, Nat.mod_lt _ (by decide)⟩
  have hq : q < 2 := by dsimp [q]; omega
  have he : m.val = q*64+j.val := by dsimp [q,j]; omega
  interval_cases q
  · have hm : m = ⟨0*64+j.val, by omega⟩ := Fin.ext he
    rw [hm]
    exact block_0 j
  · have hm : m = ⟨1*64+j.val, by omega⟩ := Fin.ext he
    rw [hm]
    exact block_1 j

theorem increment_positive : ∀ i < 7, 0 < KZGeneral.increment bounds scale i := by
  intro i hi
  interval_cases i <;>
    norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale]

theorem numerical_margin : 1 < (209960100 : ℝ)^2 *
    ∏ i ∈ Finset.range 7, KZGeneral.increment bounds scale i := by
  norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale,
    Finset.prod_range_succ]

theorem product_lower_bound (t : ℕ → ℝ)
    (ht : ∀ i < 7, 0 < t i)
    (hprefix : ∀ r ≤ 7, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 7 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 7, KZGeneral.increment bounds scale i ≤
      ∏ i ∈ Finset.range 7, t i := by
  exact KZGeneral.product_of_certificate 7 bounds scale (by decide) (by decide)
    row rows_valid increment_positive t ht hprefix hratio

theorem norm_cutoff (t : ℕ → ℝ) (S deltaSquared : ℝ) (hS : 0 < S)
    (ht : ∀ i < 7, 0 < t i)
    (hprefix : ∀ r ≤ 7, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 7 → 3*t i ≤ 4*t (i+1))
    (hdet : ∏ i ∈ Finset.range 7, t i = deltaSquared / S) :
    S < (209960100 : ℝ)^2 * deltaSquared := by
  exact KZGeneral.norm_square_cutoff 7 (KZGeneral.increment bounds scale) t
    S deltaSquared 209960100 hS (product_lower_bound t ht hprefix hratio) hdet numerical_margin

end EightSpectrum

end Loneliness.KZSmall
