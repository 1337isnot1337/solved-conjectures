import Conjectures.LineSizeFill

/-! Arbitrarily many generic points can be added off every carrier while
preserving all carrier sizes and excluding unintended three-point lines. -/
noncomputable section
namespace LineSize

theorem exists_padding_point (C : Finset Carrier) (P : Finset Point)
    (hP : NoExtraLine C P) :
    ∃ x : Point, x ∉ P ∧ (∀ c ∈ C, ¬OnCarrier c x) ∧
      NoExtraLine C (insert x P) := by
  classical
  obtain ⟨D,hslope,havoid⟩ := exists_transversal_avoiding C P
  let F := P ∪ forbiddenCrossings P (graphPoint D 0) (graphPoint D 1) ∪
    C.image (meet D)
  obtain ⟨x,hxD,hxF⟩ := exists_point_avoiding D F
  have hxP : x ∉ P := by
    intro hp
    exact hxF (Finset.mem_union_left _ (Finset.mem_union_left _ hp))
  have hxother : ∀ c ∈ C, ¬OnCarrier c x := by
    intro c hc hxc
    have he := meet_unique D c (hslope c hc) x hxD hxc
    exact hxF (Finset.mem_union_right _ (Finset.mem_image.mpr ⟨c,hc,he.symm⟩))
  refine ⟨x,hxP,hxother,noExtraLine_insert_point C P x hP ?_⟩
  intro p hp q hq hpq hxL
  have hne : carrierLine D ≠ line[ℝ,p,q] := by
    intro he
    apply havoid p hp
    apply (mem_carrierLine D p).mp
    rw [he]
    exact left_mem_affineSpan_pair _ _ _
  apply False.elim
  apply hxF
  apply Finset.mem_union_left
  apply Finset.mem_union_right
  exact secant_forbidden P (graphPoint D 0) (graphPoint D 1) p q x hp hq hne
    ((mem_carrierLine D x).mpr hxD) hxL

theorem pad_points (C : Finset Carrier) (P : Finset Point)
    (hP : NoExtraLine C P) (m : ℕ) :
    ∃ Q : Finset Point, P ⊆ Q ∧ Q.card = P.card+m ∧ NoExtraLine C Q ∧
      ∀ c ∈ C, carrierPoints Q c = carrierPoints P c := by
  classical
  induction m with
  | zero => exact ⟨P,Finset.Subset.refl _,by simp,hP,fun _ _ => rfl⟩
  | succ m ih =>
    obtain ⟨Q,hPQ,hcard,hQ,hcounts⟩ := ih
    obtain ⟨x,hxQ,hxother,hnew⟩ := exists_padding_point C Q hQ
    refine ⟨insert x Q,hPQ.trans (Finset.subset_insert _ _),?_,hnew,?_⟩
    · rw [Finset.card_insert_of_notMem hxQ,hcard]
      omega
    · intro c hc
      rw [carrierPoints_insert_off Q c x (hxother c hc),hcounts c hc]

theorem pad_to_card (C : Finset Carrier) (P : Finset Point)
    (hP : NoExtraLine C P) (n : ℕ) (hn : P.card ≤ n) :
    ∃ Q : Finset Point, P ⊆ Q ∧ Q.card=n ∧ NoExtraLine C Q ∧
      ∀ c ∈ C, carrierPoints Q c = carrierPoints P c := by
  obtain ⟨Q,hPQ,hcard,hQ,hcounts⟩ := pad_points C P hP (n-P.card)
  exact ⟨Q,hPQ,by omega,hQ,hcounts⟩

end LineSize
