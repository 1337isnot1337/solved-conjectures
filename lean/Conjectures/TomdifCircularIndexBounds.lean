import Conjectures.TomdifCircularIndexGraph

/-! Actual simple-graph and real-circle bounds for the seven examples in #647. -/

namespace CircularIndex.Tomdif
open SimpleGraph

theorem verified_pos_degree {d n : ℕ} {es : List ColoredEdge}
    (h : verified d n es = true) : 0<d := by
  cases heq : es with
  | nil =>
    have hh := (verified_density h).2.2.1
    simp [heq] at hh
  | cons e tail =>
    have he : e ∈ es := by rw [heq]; simp
    have hr := verified_ranges h he
    let v : Fin n := ⟨e.left,hr.1.trans hr.2.1⟩
    have hei : e ∈ incident es v.val :=
      List.mem_filter.mpr ⟨he,occurs_iff.mpr (Or.inl rfl)⟩
    exact (List.length_pos_of_mem hei).trans_le (verified_degree_bound h v)

theorem certifiedGraph_lower {d n : ℕ} {es : List ColoredEdge}
    (h : verified d n es = true) :
    ((es.length : ℕ) : ℝ)/((n/2 : ℕ):ℝ) ≤ circularChromaticIndex (certifiedGraph h) := by
  have hdens := verified_density h
  have hd := verified_pos_degree h
  let c := (certifiedColoring h).toReal (by omega : 0<3) (by omega)
  have hm : 0<((n/2 : ℕ):ℝ) := by exact_mod_cast hdens.2.1
  apply le_csInf
  · exact ⟨_,⟨c⟩⟩
  · intro r hr
    have hi := hr.some.counting_bound
    rw [certifiedGraph_card_edges h, Fintype.card_fin] at hi
    exact (div_le_iff₀ hm).mpr hi

theorem certifiedGraph_upper {d n : ℕ} {es : List ColoredEdge}
    (h : verified d n es = true) :
    circularChromaticIndex (certifiedGraph h) ≤ (3*d+2:ℝ)/3 := by
  have hd := verified_pos_degree h
  have c := circularChromaticIndex_le_of_coloring
    ((certifiedColoring h).toReal (by omega : 0<3) (by omega))
  simpa [Nat.cast_add,Nat.cast_mul] using c

theorem certifiedGraph_upper_half {d n : ℕ} {es : List ColoredEdge}
    (h : verified d n es = true) :
    (d:ℝ)+1/2 < circularChromaticIndex (certifiedGraph h) ∧
      circularChromaticIndex (certifiedGraph h)<(d:ℝ)+1 := by
  have hdens := verified_density h
  have hm : 0<((n/2 : ℕ):ℝ) := by exact_mod_cast hdens.2.1
  constructor
  · apply lt_of_lt_of_le _ (certifiedGraph_lower h)
    apply (lt_div_iff₀ hm).mpr
    have he : ((2*d+1 : ℕ):ℝ)*((n/2:ℕ):ℝ) < ((2*es.length:ℕ):ℝ) := by
      exact_mod_cast hdens.2.2.1
    push_cast at he
    linarith only [he]
  · exact (certifiedGraph_upper h).trans_lt (by linarith)

theorem certifiedGraph_exact_if_tight {d n : ℕ} {es : List ColoredEdge}
    (h : verified d n es = true) (ht : 3*es.length=(3*d+2)*(n/2)) :
    circularChromaticIndex (certifiedGraph h)=(3*d+2:ℝ)/3 := by
  apply le_antisymm (certifiedGraph_upper h)
  apply le_trans _ (certifiedGraph_lower h)
  have hm : 0<((n/2 : ℕ):ℝ) := by exact_mod_cast (verified_density h).2.1
  apply (le_div_iff₀ hm).mpr
  have hh := congrArg (fun z : ℕ => (z:ℝ)) ht
  push_cast at hh
  linarith only [hh]

/-- Maximum degree is asserted with both the bound and an attaining vertex. -/
def UpperHalfExample (d : ℕ) : Prop :=
  ∃ (n : ℕ) (G : SimpleGraph (Fin n)) (i : DecidableRel G.Adj),
    letI := i
    (∀ v, G.degree v≤d) ∧ (∃ v, G.degree v=d) ∧
      (d:ℝ)+1/2<circularChromaticIndex G ∧ circularChromaticIndex G<(d:ℝ)+1

theorem example_of_verified {d n : ℕ} {es : List ColoredEdge}
    (h : verified d n es = true) : UpperHalfExample d := by
  refine ⟨n,certifiedGraph h,inferInstance,?_,?_,certifiedGraph_upper_half h⟩
  · intro v
    rw [certifiedGraph_degree]
    exact verified_degree_bound h v
  · obtain ⟨v,hv⟩ := verified_degree_attained h
    exact ⟨v,(certifiedGraph_degree h v).trans hv⟩

theorem tomdif_upper_half_degrees {d : ℕ}
    (h : d∈({9,11,13,15,17,19,23} : Finset ℕ)) : UpperHalfExample d := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at h
  rcases h with rfl|rfl|rfl|rfl|rfl|rfl|rfl
  · exact example_of_verified verifies9
  · exact example_of_verified verifies11
  · exact example_of_verified verifies13
  · exact example_of_verified verifies15
  · exact example_of_verified verifies17
  · exact example_of_verified verifies19
  · exact example_of_verified verifies23

theorem tomdif_degree15_bracket :
    (171:ℝ)/11 ≤ circularChromaticIndex (certifiedGraph verifies15) ∧
      circularChromaticIndex (certifiedGraph verifies15) ≤ 47/3 :=
  ⟨certifiedGraph_lower verifies15, by
    calc
      _ ≤ (3*(15:ℝ)+2)/3 := certifiedGraph_upper verifies15
      _ = 47/3 := by norm_num⟩

set_option maxRecDepth 18000 in
theorem tomdif_degree9_exact :
    circularChromaticIndex (certifiedGraph verifies9) = (29:ℝ)/3 := by
  calc
    _ = (3*(9:ℝ)+2)/3 := certifiedGraph_exact_if_tight verifies9 (by decide)
    _ = (29:ℝ)/3 := by norm_num

set_option maxRecDepth 18000 in
theorem tomdif_degree11_exact :
    circularChromaticIndex (certifiedGraph verifies11) = (35:ℝ)/3 := by
  calc
    _ = (3*(11:ℝ)+2)/3 := certifiedGraph_exact_if_tight verifies11 (by decide)
    _ = (35:ℝ)/3 := by norm_num

set_option maxRecDepth 18000 in
theorem tomdif_degree13_exact :
    circularChromaticIndex (certifiedGraph verifies13) = (41:ℝ)/3 := by
  calc
    _ = (3*(13:ℝ)+2)/3 := certifiedGraph_exact_if_tight verifies13 (by decide)
    _ = (41:ℝ)/3 := by norm_num

set_option maxRecDepth 18000 in
theorem tomdif_degree17_exact :
    circularChromaticIndex (certifiedGraph verifies17) = (53:ℝ)/3 := by
  calc
    _ = (3*(17:ℝ)+2)/3 := certifiedGraph_exact_if_tight verifies17 (by decide)
    _ = (53:ℝ)/3 := by norm_num

set_option maxRecDepth 18000 in
theorem tomdif_degree19_exact :
    circularChromaticIndex (certifiedGraph verifies19) = (59:ℝ)/3 := by
  calc
    _ = (3*(19:ℝ)+2)/3 := certifiedGraph_exact_if_tight verifies19 (by decide)
    _ = (59:ℝ)/3 := by norm_num

set_option maxRecDepth 18000 in
theorem tomdif_degree23_exact :
    circularChromaticIndex (certifiedGraph verifies23) = (71:ℝ)/3 := by
  calc
    _ = (3*(23:ℝ)+2)/3 := certifiedGraph_exact_if_tight verifies23 (by decide)
    _ = (71:ℝ)/3 := by norm_num

end CircularIndex.Tomdif
