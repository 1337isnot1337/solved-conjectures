import Conjectures.LineSizeAffine
import Conjectures.LineSizeCrossings

/-! Finite avoidance for adding a carrier to a real-plane arrangement.
The new crossings avoid every old secant except their own carrier. -/
namespace LineSize

theorem carrierLine_pair (C : Carrier) (p q : Point)
    (hp : OnCarrier C p) (hq : OnCarrier C q) (hpq : p ≠ q) :
    line[ℝ, p, q] = carrierLine C := by
  exact affineSpan_pair_eq_of_mem_of_mem_of_ne
    ((mem_carrierLine C p).mpr hp) ((mem_carrierLine C q).mpr hq) hpq

theorem carrierLine_ne (C D : Carrier) (h : C.slope ≠ D.slope) :
    carrierLine C ≠ carrierLine D := by
  intro heq
  have h0 : OnCarrier D (graphPoint C 0) := by
    apply (mem_carrierLine D _).mp
    rw [← heq]
    exact (mem_carrierLine C _).mpr (graphPoint_on C 0)
  have h1 : OnCarrier D (graphPoint C 1) := by
    apply (mem_carrierLine D _).mp
    rw [← heq]
    exact (mem_carrierLine C _).mpr (graphPoint_on C 1)
  simp only [OnCarrier, graphPoint, mul_zero, zero_add, mul_one] at h0 h1
  exact h (by linarith)

theorem exists_carrier_with_safe_crossings (C : Finset Carrier) (P : Finset Point) :
    ∃ D : Carrier,
      (∀ c ∈ C, D.slope ≠ c.slope) ∧
      (∀ p ∈ P, ¬OnCarrier D p) ∧
      (∀ c ∈ C, ∀ p ∈ P, ∀ q ∈ P,
        carrierLine c ≠ line[ℝ, p, q] → meet D c ∉ line[ℝ, p, q]) := by
  classical
  let F := P ∪ C.biUnion (fun c =>
    forbiddenCrossings P (graphPoint c 0) (graphPoint c 1))
  obtain ⟨D,hslope,havoid⟩ := exists_transversal_avoiding C F
  refine ⟨D,hslope,?_,?_⟩
  · intro p hp
    exact havoid p (Finset.mem_union_left _ hp)
  · intro c hc p hp q hq hne hsec
    have hcross : meet D c ∈
        forbiddenCrossings P (graphPoint c 0) (graphPoint c 1) := by
      apply secant_forbidden P _ _ p q _ hp hq hne
      · exact (mem_carrierLine c _).mpr (meet_on_right D c (hslope c hc))
      · exact hsec
    have hF : meet D c ∈ F :=
      Finset.mem_union_right _ (Finset.mem_biUnion.mpr ⟨c,hc,hcross⟩)
    exact havoid _ hF (meet_on_left D c)

theorem new_crossing_notMem (P : Finset Point) (D c : Carrier)
    (havoid : ∀ p ∈ P, ¬OnCarrier D p) : meet D c ∉ P := by
  intro hp
  exact havoid _ hp (meet_on_left D c)

theorem new_crossings_ne (P : Finset Point) (D c d : Carrier)
    (hcd : c.slope ≠ d.slope) (hDc : D.slope ≠ c.slope)
    (hDd : D.slope ≠ d.slope) (hold : meet c d ∈ P)
    (havoid : ∀ p ∈ P, ¬OnCarrier D p) : meet D c ≠ meet D d := by
  intro heq
  have hc := meet_on_right D c hDc
  have hd : OnCarrier d (meet D c) := by
    rw [heq]
    exact meet_on_right D d hDd
  have hx := meet_unique c d hcd (meet D c) hc hd
  have hD : OnCarrier D (meet c d) := by
    rw [← hx]
    exact meet_on_left D c
  exact havoid _ hold hD

end LineSize
