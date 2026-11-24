import Conjectures.FeldheimWeightedTailWrightUnit
import Mathlib.Topology.Order.IntermediateValue

/-!
# Feldheim–Feldheim’s weighted tail conjecture

The positive-deviation component reduction in §2 of the recorded proof.
Every continuous fixed-weight approximate Wright function lies a uniformly
bounded distance above each of its chords, on every compact interval.
-/

open Set

namespace Conjectures.FeldheimWeightedTail

noncomputable section

theorem exists_nonnegative_zero_interval {D : ℝ → ℝ} {a z b : ℝ}
    (hz : z ∈ Icc a b) (hD : ContinuousOn D (Icc a b))
    (ha : D a = 0) (hb : D b = 0) (hp : 0 < D z) :
    ∃ u v : ℝ, a ≤ u ∧ u < z ∧ z < v ∧ v ≤ b ∧
      D u = 0 ∧ D v = 0 ∧ ∀ x ∈ Icc u v, 0 ≤ D x := by
  let L := Icc a z ∩ D ⁻¹' ({0} : Set ℝ)
  let R := Icc z b ∩ D ⁻¹' ({0} : Set ℝ)
  have hDL : ContinuousOn D (Icc a z) := hD.mono (Icc_subset_Icc le_rfl hz.2)
  have hDR : ContinuousOn D (Icc z b) := hD.mono (Icc_subset_Icc hz.1 le_rfl)
  have hLc : IsCompact L := isCompact_Icc.of_isClosed_subset
    (hDL.preimage_isClosed_of_isClosed isClosed_Icc isClosed_singleton) inter_subset_left
  have hRc : IsCompact R := isCompact_Icc.of_isClosed_subset
    (hDR.preimage_isClosed_of_isClosed isClosed_Icc isClosed_singleton) inter_subset_left
  have hLn : L.Nonempty := ⟨a, ⟨le_rfl, hz.1⟩, ha⟩
  have hRn : R.Nonempty := ⟨b, ⟨hz.2, le_rfl⟩, hb⟩
  obtain ⟨u, hu, hU⟩ := hLc.exists_isMaxOn hLn (f := id) continuousOn_id
  obtain ⟨v, hv, hV⟩ := hRc.exists_isMinOn hRn (f := id) continuousOn_id
  have hu0 : D u = 0 := hu.2
  have hv0 : D v = 0 := hv.2
  have huz : u < z := by
    have hle := hu.1.2
    by_contra h
    have he : u = z := le_antisymm hle (by linarith)
    rw [he] at hu0
    linarith
  have hzv : z < v := by
    have hle := hv.1.1
    by_contra h
    have he : v = z := le_antisymm (by linarith) hle
    rw [he] at hv0
    linarith
  refine ⟨u, v, hu.1.1, huz, hzv, hv.1.2, hu0, hv0, ?_⟩
  intro x hx
  by_contra hneg
  have hn : D x < 0 := lt_of_not_ge hneg
  rcases le_total x z with hxz | hzx
  · have hux : u < x := by
      by_contra h
      have he : x = u := le_antisymm (by linarith) hx.1
      rw [he, hu0] at hn
      linarith
    have hDc : ContinuousOn D (Icc x z) :=
      hD.mono (Icc_subset_Icc (hu.1.1.trans hx.1) hz.2)
    obtain ⟨w, hw, hw0⟩ := intermediate_value_Icc hxz hDc (show 0 ∈ Icc (D x) (D z) from ⟨hn.le, hp.le⟩)
    have hwL : w ∈ L := ⟨⟨(hu.1.1.trans hx.1).trans hw.1, hw.2⟩, hw0⟩
    have hwu := hU hwL
    change w ≤ u at hwu
    linarith [hw.1]
  · have hxv : x < v := by
      by_contra h
      have he : x = v := le_antisymm hx.2 (by linarith)
      rw [he, hv0] at hn
      linarith
    have hDc : ContinuousOn D (Icc z x) :=
      hD.mono (Icc_subset_Icc hz.1 (hx.2.trans hv.1.2))
    obtain ⟨w, hw, hw0⟩ := intermediate_value_Icc' hzx hDc (show 0 ∈ Icc (D x) (D z) from ⟨hn.le, hp.le⟩)
    have hwR : w ∈ R := ⟨⟨hw.1, hw.2.trans (hx.2.trans hv.1.2)⟩, hw0⟩
    have hvw := hV hwR
    change v ≤ w at hvw
    linarith [hw.2]

/-- The full compact-interval chord estimate, with no nonnegativity assumption on the function. -/
theorem wright_chord_le {F : ℝ → ℝ} {a b t e z : ℝ}
    (hab : a < b) (ht : 0 < t) (ht2 : t ≤ 1/2) (he : 0 ≤ e)
    (hF : ContinuousOn F (Icc a b)) (hW : WrightBoundOn F (Icc a b) t e)
    (hz : z ∈ Icc a b) :
    F z ≤ ((b-z)/(b-a))*F a+((z-a)/(b-a))*F b+wrightConstant t*e := by
  let s := (F b-F a)/(b-a)
  let c := F a-s*a
  let D : ℝ → ℝ := fun x => F x-(s*x+c)
  have hD : ContinuousOn D (Icc a b) := by dsimp only [D]; fun_prop
  have hDa : D a = 0 := by dsimp only [D,c]; ring
  have hDb : D b = 0 := by
    dsimp only [D,c,s]
    field_simp [sub_ne_zero.mpr hab.ne']
    ring
  have hWD : WrightBoundOn D (Icc a b) t e := hW.sub_affine s c
  have hKe : 0 ≤ wrightConstant t*e :=
    mul_nonneg (le_trans (by norm_num) (wrightConstant_ge_three t)) he
  have hDz : D z ≤ wrightConstant t*e := by
    by_cases hp : 0 < D z
    · obtain ⟨u, v, hau, huz, hzv, hvb, hu0, hv0, hpos⟩ :=
        exists_nonnegative_zero_interval hz hD hDa hDb hp
      have huv : u < v := huz.trans hzv
      let A : ℝ → ℝ := fun x => u+(v-u)*x
      have hmap (x : ℝ) (hx : x ∈ Icc (0 : ℝ) 1) : A x ∈ Icc u v := by
        dsimp only [A]
        constructor <;> nlinarith [hx.1, hx.2]
      have hmap' (x : ℝ) (hx : x ∈ Icc (0 : ℝ) 1) : A x ∈ Icc a b :=
        ⟨hau.trans (hmap x hx).1, (hmap x hx).2.trans hvb⟩
      have hcont : ContinuousOn (fun x => D (A x)) (Icc (0 : ℝ) 1) :=
        hD.comp (by dsimp only [A]; fun_prop) hmap'
      have hW' : WrightBoundOn (fun x => D (A x)) (Icc (0 : ℝ) 1) t e := by
        have hh := hWD.comp_affine (a := v-u) (b := u) (T := Icc (0 : ℝ) 1) (by
          intro x hx
          simpa only [add_comm] using hmap' x hx)
        simpa only [A, add_comm] using hh
      have hzero : D (A 0) = 0 := by simpa only [A, mul_zero, add_zero] using hu0
      have hone : D (A 1) = 0 := by
        have hA1 : A 1 = v := by dsimp only [A]; ring
        rwa [hA1]
      have hunit := wright_unit_le ht ht2 he hcont (fun x hx => hpos (A x) (hmap x hx)) hzero hone hW'
      have hx : (z-u)/(v-u) ∈ Icc (0 : ℝ) 1 := by
        constructor
        · exact div_nonneg (sub_nonneg.mpr huz.le) (sub_nonneg.mpr huv.le)
        · apply (div_le_one (sub_pos.mpr huv)).mpr
          linarith
      have hh := hunit ((z-u)/(v-u)) hx
      have hAz : A ((z-u)/(v-u)) = z := by
        dsimp only [A]
        field_simp [sub_ne_zero.mpr huv.ne']
        ring
      rwa [hAz] at hh
    · exact (le_of_not_gt hp).trans hKe
  have hchord : s*z+c = ((b-z)/(b-a))*F a+((z-a)/(b-a))*F b := by
    dsimp only [s,c]
    field_simp [sub_ne_zero.mpr hab.ne']
    ring
  dsimp only [D] at hDz
  rw [hchord] at hDz
  linarith

theorem wright_chordBoundOn {F : ℝ → ℝ} {T t e : ℝ}
    (ht : 0 < t) (ht2 : t ≤ 1/2) (he : 0 ≤ e)
    (hF : ContinuousOn F (Ici T)) (hW : WrightBoundOn F (Ici T) t e) :
    ChordBoundOn F T (wrightConstant t*e) := by
  intro a ha b hab z hz
  have hsub : Icc a b ⊆ Ici T := fun x hx => ha.trans hx.1
  exact wright_chord_le hab ht ht2 he (hF.mono hsub) (hW.mono hsub) hz

end

end Conjectures.FeldheimWeightedTail
