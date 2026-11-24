import Conjectures.GravgaardLeeUpperLowerRepair

/-! # Gravgaard–Lee's mixed upper/lower Lüroth conjecture

Every valid linked scene admits a finite refinement with one genuine lower
digit. If ordinary refinement never supplies that digit, an actual upper
orbit and the sibling-cylinder repair contradict this obstruction.
-/

open Set Finset Filter Topology

namespace GravgaardLeeUpperLower

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth

noncomputable section

namespace Scene

variable {k : ℕ}

/-- The lower side cannot remain at its excluded zero endpoint: an actual
digit can always be appended while retaining a valid linked scene. -/
theorem canAdvance (s : Scene k) {x : ℝ} (hx : s.Valid x) : s.CanAdvance x := by
  by_contra hb
  let o : UpperOrbit s x := blockedOrbit ⟨s, hx, hb⟩
  let M := max s.e (k * (k - 1) + 3)
  have hQ := s.Q_pos
  have hε : 0 < s.Q / ((M : ℝ) + 1) := by positivity
  obtain ⟨N, hN⟩ := eventually_atTop.1 ((tendsto_order.1 o.scale_tendsto).2 _ hε)
  obtain ⟨n, hn, hd⟩ := o.nonmax_arbitrarily_late N
  let r := o.state n
  let d := o.digit n
  let t := r.u + r.P / d
  let c := x - s.v - t
  have hd2 : 2 ≤ d := (o.digit_bounds n).1
  have htail := o.tail_identity (n + 1)
  have hnext := (o.digit_spec n).2.2.2.1
  have hval := value_mem (fun i => o.digit (n + 1 + i))
    (fun i => (o.digit_bounds _).1)
  have hc_eq : c = (o.state (n + 1)).P * value (fun i => o.digit (n + 1 + i)) := by
    dsimp [c, t, r, d]
    rw [hnext] at htail
    linarith
  have hc : 0 < c := by rw [hc_eq]; exact mul_pos (o.state _).P_pos hval.1
  have hcP : c ≤ r.P := by
    rw [hc_eq]
    calc
      _ ≤ (o.state (n + 1)).P := mul_le_of_le_one_right (o.state _).P_pos.le hval.2
      _ = r.P * width d := (o.digit_spec n).2.2.1
      _ ≤ r.P := by
        have hw := mul_le_mul_of_nonneg_left (width_le_half hd2) r.P_pos.le
        have hP := r.P_pos
        nlinarith
  obtain ⟨j, hej, hj, hlo, hhi, hsize⟩ := repair_digit_exists
    s.toFrame.k_ge_three hd2 hd r.P_pos s.Q_pos hc hcP (hN n hn)
  have hL : 0 < s.Q * width (j + 1) := mul_pos s.Q_pos (width_pos (by omega))
  obtain ⟨m, hm, hm'⟩ := dyadic_scale_between hL hsize
  let P' := r.P * width (d + 1) * (1 / 2 : ℝ) ^ m
  have hP' : 0 < P' := lt_of_lt_of_le hL hm
  have hcyl : (fun y => t - P' + P' * y) '' smallDigitSet k ⊆ s.upperCylinder :=
    (r.sibling_cylinder_subset (o.digit_spec n).1 hd m).trans (o.cylinder_subset n)
  exact hb (s.repair_from_cylinder hP' hcyl hej hj hlo hhi hm hm')

end Scene

end
end GravgaardLeeUpperLower
