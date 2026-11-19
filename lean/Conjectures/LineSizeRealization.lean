import Conjectures.LineSizeSelectedPoints
import Conjectures.LineSizePadding

/-! Filling the selected carrier arrangement realizes a decreasing sequence
at its exact incidence cost. Generic padding gives every larger point count. -/
noncomputable section
namespace LineSize

theorem Arrangement.fill_prefix (A : Arrangement) (k r : ℕ)
    (hk : A.carriers.card=k) (hrk : r ≤ k)
    (P : Finset Point) (d g : ℕ → ℕ) (hP : NoExtraLine A.carriers P)
    (hbase : ∀ i < k, (carrierPoints P (A.carrierAt hk i)).card=g i)
    (hcapacity : ∀ i < r, g i ≤ d i) :
    ∃ Q : Finset Point, P ⊆ Q ∧
      Q.card=P.card+(∑ i ∈ Finset.range r, (d i-g i)) ∧
      NoExtraLine A.carriers Q ∧
      ∀ i < k, (carrierPoints Q (A.carrierAt hk i)).card =
        if i < r then d i else g i := by
  classical
  have hfill : ∀ m, m ≤ r →
      ∃ Q : Finset Point, P ⊆ Q ∧
        Q.card=P.card+(∑ i ∈ Finset.range m, (d i-g i)) ∧
        NoExtraLine A.carriers Q ∧
        ∀ i < k, (carrierPoints Q (A.carrierAt hk i)).card =
          if i < m then d i else g i := by
    intro m
    induction m with
    | zero =>
      intro hm
      refine ⟨P,Finset.Subset.refl _,by simp,hP,?_⟩
      intro i hi
      simpa using hbase i hi
    | succ m ih =>
      intro hm
      obtain ⟨Q,hPQ,hQcard,hQ,hcounts⟩ := ih (by omega)
      have hmk : m < k := by omega
      have hmr : m < r := by omega
      obtain ⟨R,hQR,hRcard,hR,hnewcounts⟩ := fill_carrier A.carriers Q
        (A.carrierAt hk m) (A.carrierAt_mem hk m hmk) A.slopes hQ (d m-g m)
      refine ⟨R,hPQ.trans hQR,?_,hR,?_⟩
      · rw [hRcard,hQcard,Finset.sum_range_succ]
        omega
      · intro i hi
        rw [hnewcounts _ (A.carrierAt_mem hk i hi),hcounts i hi]
        by_cases him : i=m
        · subst i
          have hcap := hcapacity m hmr
          simp only [lt_self_iff_false,ite_false,ite_true,Nat.lt_succ_self]
          omega
        · have hne := A.carrierAt_ne hk i m hi hmk him
          by_cases hil : i < m
          · have his : i < m+1 := by omega
            simp [hne,hil,his]
          · have his : ¬i < m+1 := by omega
            simp [hne,hil,his]
  exact hfill r le_rfl

theorem exists_carrier_realization (d : ℕ → ℕ) (k : ℕ) (hd : Decreasing d k) :
    ∃ A : Arrangement, ∃ hk : A.carriers.card=k, ∃ P : Finset Point,
      NoExtraLine A.carriers P ∧ P.card=pointCost d k ∧
      ∀ i < k, (carrierPoints P (A.carrierAt hk i)).card=d i := by
  obtain ⟨r,hr⟩ := exists_core_length d k hd
  obtain ⟨A,hk⟩ := exists_arrangement k
  obtain ⟨P,hP,hPcard,hbase⟩ := A.selected_points_exist d k r hk
  obtain ⟨Q,hPQ,hQcard,hQ,hcounts⟩ := A.fill_prefix k r hk hr.1 P d
    (SelectedGraph.degree d k r) hP hbase
    (fun i hi => SelectedGraph.core_degree_le d k r hd hr i hi)
  refine ⟨A,hk,Q,hQ,?_,?_⟩
  · rw [hQcard,hPcard]
    exact SelectedGraph.cost_identity d k r hd hr
  · intro i hi
    by_cases hir : i < r
    · simpa only [ite_eq_left hir] using hcounts i hi
    · rw [hcounts i hi,ite_eq_right hir]
      exact SelectedGraph.tail_degree d k r hd hr i (by omega) hi

theorem exists_padded_carrier_realization (d : ℕ → ℕ) (k n : ℕ)
    (hd : Decreasing d k) (hcost : pointCost d k ≤ n) :
    ∃ A : Arrangement, ∃ hk : A.carriers.card=k, ∃ P : Finset Point,
      NoExtraLine A.carriers P ∧ P.card=n ∧
      ∀ i < k, (carrierPoints P (A.carrierAt hk i)).card=d i := by
  obtain ⟨A,hk,P,hP,hPcard,hcounts⟩ := exists_carrier_realization d k hd
  obtain ⟨Q,hPQ,hQcard,hQ,hpreserve⟩ :=
    pad_to_card A.carriers P hP n (by omega)
  refine ⟨A,hk,Q,hQ,hQcard,?_⟩
  intro i hi
  rw [hpreserve _ (A.carrierAt_mem hk i hi),hcounts i hi]

end LineSize
