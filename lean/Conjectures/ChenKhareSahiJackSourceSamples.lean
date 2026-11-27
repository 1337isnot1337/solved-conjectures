import Conjectures.ChenKhareSahiJackSourceData
import Conjectures.ChenKhareSahiJackSourceFamily

namespace ChenKhareSahi.Jack.Source

noncomputable section

set_option maxRecDepth 65536
set_option maxHeartbeats 16000000

theorem ordered_shapes (d : Fin 6) (i j : Fin (dimension d)) (hij : i < j) :
    ¬ Dominates ((degreeBlock d).sh i) ((degreeBlock d).sh j) := by
  rw [dominates_iff]
  revert hij j i d
  decide +kernel

/-- Covered shapes and four observed values, including the normalization at one. -/
theorem checked_samples : ∀ e ∈ schurRaw, ∃ d : Fin 6, ∃ i : Fin (dimension d),
    (degreeBlock d).sh i = e.1 ∧ ∀ k, rawValue (degreeBlock d) i (testPoint k) = expectedPoint e k := by
  decide +kernel

def normalized (G : Shape → Pt → ℝ) (p : Shape) (x : Pt) := G p x / G p 1

/-- The true source definition only needs to specify its graded blocks through degree
five. Beyond this range the argument works for arbitrary homogeneous generators. -/
structure SourceFamily (G : Shape → Pt → ℝ) : Prop where
  homogeneous : ∀ p, Antitone p → ∀ t x, G p (t • x) = t ^ size p * G p x
  unit_parameter : ∀ d : Fin 6, ∃ M P, IsUnitJackBlock (degreeBlock d) G M P

theorem SourceFamily.values {G : Shape → Pt → ℝ} (hG : SourceFamily G)
    (p : Shape) (hp : Antitone p) (hs : size p ≤ 5) :
    val (normalized G p) = val (nschur p) := by
  obtain ⟨e, he, hr⟩ := partition_mem p hp hs
  obtain ⟨d, i, shape, samples⟩ := checked_samples e he
  obtain ⟨M, P, hb⟩ := hG.unit_parameter d
  have hval (k : Fin 4) : G e.1 (natPt (testPoint k)) = (expectedPoint e k : ℝ) := by
    rw [← samples, ← shape]
    exact hb.sample (degreeBlock_valid d) (ordered_shapes d) i _
  have h0 := hval 0
  have h1 := hval 1
  have h2 := hval 2
  have h3 := hval 3
  change G e.1 (natPt pt1) = ((e.2.1 : ℚ) : ℝ) at h0
  change G e.1 (natPt pt2) = ((e.2.2.1 : ℚ) : ℝ) at h1
  change G e.1 (natPt pt3) = ((e.2.2.2.1 : ℚ) : ℝ) at h2
  change G e.1 (natPt ones5) = ((e.2.2.2.2 : ℚ) : ℝ) at h3
  rw [← hr, val_nschur e he]
  change (G e.1 (natPt pt1) / G e.1 1, G e.1 (natPt pt2) / G e.1 1,
    G e.1 (natPt pt3) / G e.1 1) = _
  rw [show (1 : Pt) = natPt ones5 from one_eq_natPt, h0, h1, h2, h3]
  simp [toR, nvec]

end

end ChenKhareSahi.Jack.Source
