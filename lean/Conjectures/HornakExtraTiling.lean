import Conjectures.HornakEndpoint

/-! Realizing an additional exceptional piece on a chosen arm. -/
namespace Hornak

/-- Two-size pieces plus one exceptional piece can be realized as connected
segments whenever their numerical arm allocation fits. -/
theorem realize_extra_allocation {m : ℕ} (arms small large : Fin m → ℕ)
    (i extra : ℕ) (p : Fin m) (hi : 0 < i) (hextra : 0 < extra)
    (hfit : ∀ j, small j*i+large j*(i+1)+(if j=p then extra else 0) ≤ arms j) :
    let cut : Fin m → ℕ := fun j => arms j-(small j*i+large j*(i+1)+(if j=p then extra else 0))
    let labels := Σ j, Fin (small j+large j)
    let e := Fintype.equivFin labels
    Partitionable arms (Fin.cases (1+∑ j, cut j) (Fin.cases extra
      (fun k => pieceLen i (small (e.symm k).1) (e.symm k).2.val))) := by
  classical
  dsimp only
  let off : Fin m → ℕ := fun j => if j=p then extra else 0
  let cut : Fin m → ℕ := fun j => arms j-(small j*i+large j*(i+1)+off j)
  let labels := Σ j, Fin (small j+large j)
  let e := Fintype.equivFin labels
  let regHost := fun k : Fin (Fintype.card labels) => (e.symm k).1
  let host : Fin (Fintype.card labels+1) → Fin m := Fin.cases p regHost
  let regLo := fun k : Fin (Fintype.card labels) =>
    cut (regHost k)+off (regHost k)+pieceStart i (small (regHost k)) (e.symm k).2.val
  let lo : Fin (Fintype.card labels+1) → ℕ := Fin.cases (cut p) regLo
  let high : Fin (Fintype.card labels+1) → ℕ := Fin.cases (cut p+extra)
    (fun k => regLo k+pieceLen i (small (regHost k)) (e.symm k).2.val)
  change Partitionable arms (Fin.cases (1+∑ j, cut j) (Fin.cases extra
    (fun k => pieceLen i (small (regHost k)) (e.symm k).2.val)))
  have hcut (j : Fin m) : cut j ≤ arms j := Nat.sub_le _ _
  have htotal (j : Fin m) : cut j+(small j*i+large j*(i+1)+off j) = arms j := by
    dsimp [cut,off]
    exact Nat.sub_add_cancel (hfit j)
  have hinter (k : Fin (Fintype.card labels+1)) :
      cut (host k) ≤ lo k ∧ lo k < high k ∧ high k ≤ arms (host k) := by
    cases k using Fin.cases with
    | zero =>
      change cut p ≤ cut p ∧ cut p < cut p+extra ∧ cut p+extra ≤ arms p
      have h := htotal p
      simp only [off, ite_true] at h
      omega
    | succ k =>
      change cut (regHost k) ≤ regLo k ∧ regLo k < regLo k+pieceLen i (small (regHost k)) (e.symm k).2.val ∧
        regLo k+pieceLen i (small (regHost k)) (e.symm k).2.val ≤ arms (regHost k)
      have hn := (e.symm k).2.isLt
      have hend := piece_end_le i (small (regHost k)) (large (regHost k)) (e.symm k).2.val hn
      have hpositive := pieceLen_pos i (small (regHost k)) (e.symm k).2.val hi
      have h := htotal (regHost k)
      dsimp [regLo]
      omega
  have hcover (j : Fin m) (n : ℕ) (hn : cut j ≤ n) (hbound : n < arms j) :
      ∃ k, host k = j ∧ lo k ≤ n ∧ n < high k := by
    by_cases hfirst : n < cut j+off j
    · have hj : j = p := by
        by_contra h
        have ho : off j = 0 := by simp [off,h]
        omega
      subst j
      refine ⟨0,rfl,hn,?_⟩
      change n < cut p+extra
      simpa [off] using hfirst
    · have hbase : cut j+off j ≤ n := by omega
      have hused : n-(cut j+off j) < small j*i+large j*(i+1) := by
        have h := htotal j
        omega
      obtain ⟨r,hr,hrlo,hrhi⟩ := pieces_cover i (small j) (large j)
        (n-(cut j+off j)) hi hused
      let label : labels := ⟨j,⟨r,hr⟩⟩
      refine ⟨(e label).succ, ?_, ?_, ?_⟩
      · change regHost (e label) = j
        simp [regHost,label]
      · change regLo (e label) ≤ n
        change cut ((e.symm (e label)).1)+off ((e.symm (e label)).1)+
          pieceStart i (small (e.symm (e label)).1) (e.symm (e label)).2.val ≤ n
        rw [e.symm_apply_apply]
        change cut j+off j+pieceStart i (small j) r ≤ n
        omega
      · change n < regLo (e label)+pieceLen i (small (regHost (e label))) (e.symm (e label)).2.val
        change n < cut ((e.symm (e label)).1)+off ((e.symm (e label)).1)+
          pieceStart i (small (e.symm (e label)).1) (e.symm (e label)).2.val+
          pieceLen i (small (e.symm (e label)).1) (e.symm (e label)).2.val
        rw [e.symm_apply_apply]
        change n < cut j+off j+pieceStart i (small j) r+pieceLen i (small j) r
        omega
  have hdisj (k l : Fin (Fintype.card labels+1)) (hne : k ≠ l) (hsame : host k = host l) :
      high k ≤ lo l ∨ high l ≤ lo k := by
    cases k using Fin.cases with
    | zero =>
      cases l using Fin.cases with
      | zero => exact (hne rfl).elim
      | succ l =>
        left
        change p = regHost l at hsame
        change cut p+extra ≤ regLo l
        dsimp [regLo]
        rw [← hsame]
        simp [off]
    | succ k =>
      cases l using Fin.cases with
      | zero =>
        right
        change regHost k = p at hsame
        change cut p+extra ≤ regLo k
        dsimp [regLo]
        rw [hsame]
        simp [off]
      | succ l =>
        change regHost k = regHost l at hsame
        have hidx : (e.symm k).2.val ≠ (e.symm l).2.val := by
          intro he
          apply hne
          congr 1
          apply e.symm.injective
          change (e.symm k).1 = (e.symm l).1 at hsame
          apply Sigma.ext hsame
          apply (Fin.heq_ext_iff (congrArg (fun j => small j+large j) hsame)).2
          exact he
        rcases lt_or_gt_of_ne hidx with h | h
        · left
          have hh := pieces_ordered i (small (regHost k)) (e.symm k).2.val (e.symm l).2.val h
          change regLo k+pieceLen i (small (regHost k)) (e.symm k).2.val ≤ regLo l
          dsimp [regLo]
          rw [← hsame]
          omega
        · right
          have hh := pieces_ordered i (small (regHost l)) (e.symm l).2.val (e.symm k).2.val h
          change regLo l+pieceLen i (small (regHost l)) (e.symm l).2.val ≤ regLo k
          dsimp [regLo]
          rw [hsame]
          omega
  have h := partition_of_interval_tiling arms cut host lo high hcut hinter hcover hdisj
  have hsizes : (fun k => high k-lo k) = Fin.cases extra
      (fun k => pieceLen i (small (regHost k)) (e.symm k).2.val) := by
    funext k
    cases k using Fin.cases with
    | zero => simp [high,lo]
    | succ k => simp [high,lo]
  rw [hsizes] at h
  exact h

theorem extra_center_size {m : ℕ} (arms small large : Fin m → ℕ)
    (i extra a b center : ℕ) (p : Fin m)
    (hfit : ∀ j, small j*i+large j*(i+1)+(if j=p then extra else 0) ≤ arms j)
    (ha : (∑ j, small j) = a) (hb : (∑ j, large j) = b)
    (htotal : center+extra+a*i+b*(i+1) = 1+∑ j, arms j) :
    1+(∑ j, (arms j-(small j*i+large j*(i+1)+(if j=p then extra else 0)))) = center := by
  have hsum : (∑ j, (arms j-(small j*i+large j*(i+1)+(if j=p then extra else 0)))) +
      (∑ j, (small j*i+large j*(i+1)+(if j=p then extra else 0))) = ∑ j, arms j := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro j _
    exact Nat.sub_add_cancel (hfit j)
  simp only [Finset.sum_add_distrib, ← Finset.sum_mul, ha, hb] at hsum
  have he : (∑ j : Fin m, if j=p then extra else 0) = extra := by simp
  rw [he] at hsum
  omega

theorem realize_extra_with_center {m : ℕ} (arms small large : Fin m → ℕ)
    (i extra a b center : ℕ) (p : Fin m) (hi : 0 < i) (hextra : 0 < extra)
    (hfit : ∀ j, small j*i+large j*(i+1)+(if j=p then extra else 0) ≤ arms j)
    (ha : (∑ j, small j) = a) (hb : (∑ j, large j) = b)
    (htotal : center+extra+a*i+b*(i+1) = 1+∑ j, arms j) :
    let labels := Σ j, Fin (small j+large j)
    let e := Fintype.equivFin labels
    Partitionable arms (Fin.cases center (Fin.cases extra
      (fun k => pieceLen i (small (e.symm k).1) (e.symm k).2.val))) := by
  have hcenter := extra_center_size arms small large i extra a b center p hfit ha hb htotal
  have h := realize_extra_allocation arms small large i extra p hi hextra hfit
  dsimp only at h ⊢
  rw [← hcenter]
  exact h

theorem extra_packing_realizes_partition {m : ℕ} (arms : Fin m → ℕ)
    (i extra a b center : ℕ) (p : Fin m) (hi : 0 < i) (hextra : 0 < extra)
    (htotal : center+extra+a*i+b*(i+1) = 1+∑ j, arms j)
    (hfeasible : ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1)+(if j=p then extra else 0) ≤ arms j) :
    ∃ (q : ℕ) (sizes : Fin (q+2) → ℕ),
      sizes 0 = center ∧ sizes 1 = extra ∧
      Nat.card {k : Fin q // sizes k.succ.succ = i} = a ∧
      Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b ∧
      (∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1) ∧
      Partitionable arms sizes := by
  classical
  obtain ⟨small,large,ha,hb,hfit⟩ := hfeasible
  let labels := Σ j, Fin (small j+large j)
  let e := Fintype.equivFin labels
  let sizes : Fin (Fintype.card labels+2) → ℕ := Fin.cases center (Fin.cases extra
    (fun k => pieceLen i (small (e.symm k).1) (e.symm k).2.val))
  refine ⟨Fintype.card labels,sizes,rfl,rfl,?_,?_,?_,?_⟩
  · have h := small_piece_count small large i
    dsimp only at h
    simpa [sizes,labels,e,ha] using h
  · have h := large_piece_count small large i
    dsimp only at h
    simpa [sizes,labels,e,hb] using h
  · intro k
    change pieceLen i (small (e.symm k).1) (e.symm k).2.val = i ∨
      pieceLen i (small (e.symm k).1) (e.symm k).2.val = i+1
    unfold pieceLen
    split_ifs <;> simp
  · exact realize_extra_with_center arms small large i extra a b center p hi hextra hfit ha hb htotal

theorem two_centers_reorder {m p q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (p+2) → ℕ) (sizes' : Fin (q+2) → ℕ) (i : ℕ)
    (hcenter : sizes 0 = sizes' 0) (hextra : sizes 1 = sizes' 1)
    (hf : ∀ k : Fin p, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (hg : ∀ k : Fin q, sizes' k.succ.succ = i ∨ sizes' k.succ.succ = i+1)
    (hsmall : Nat.card {k : Fin p // sizes k.succ.succ = i} = Nat.card {k : Fin q // sizes' k.succ.succ = i})
    (hlarge : Nat.card {k : Fin p // sizes k.succ.succ = i+1} = Nat.card {k : Fin q // sizes' k.succ.succ = i+1})
    (hpart : Partitionable arms sizes) : Partitionable arms sizes' := by
  apply partitionable_reorder arms sizes sizes' _ hpart
  intro n
  rw [size_fiber_card_succ sizes n, size_fiber_card_succ sizes' n, hcenter]
  congr 1
  rw [size_fiber_card_succ (fun k => sizes k.succ) n,
    size_fiber_card_succ (fun k => sizes' k.succ) n]
  simp only [Fin.succ_zero_eq_one, hextra]
  congr 1
  exact two_value_fiber_counts (fun k => sizes k.succ.succ) (fun k => sizes' k.succ.succ)
    i hf hg hsmall hlarge n

theorem extra_partition_from_packing {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra a b center : ℕ) (p : Fin m)
    (hi : 0 < i) (hextra : 0 < extra)
    (hcenter : sizes 0 = center) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : center+extra+a*i+b*(i+1) = 1+∑ j, arms j)
    (hfeasible : ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1)+(if j=p then extra else 0) ≤ arms j) :
    Partitionable arms sizes := by
  obtain ⟨r,values,hc,he,hs,hl,hv,hpart⟩ :=
    extra_packing_realizes_partition arms i extra a b center p hi hextra htotal hfeasible
  exact two_centers_reorder arms values sizes i (hc.trans hcenter.symm) (he.trans hextrasize.symm)
    hv hvalues (hs.trans hsmall.symm) (hl.trans hlarge.symm) hpart

/-- Placing the exceptional piece first reduces exactly one arm capacity;
any subsequent two-size packing of those reduced arms realizes the graph. -/
theorem extra_partition_from_reduced_packing {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+2) → ℕ) (i extra a b center : ℕ) (p : Fin m)
    (hi : 0 < i) (hextra : 0 < extra) (hcap : extra ≤ arms p)
    (hcenter : sizes 0 = center) (hextrasize : sizes 1 = extra)
    (hsmall : Nat.card {k : Fin q // sizes k.succ.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ.succ = i ∨ sizes k.succ.succ = i+1)
    (htotal : center+extra+a*i+b*(i+1) = 1+∑ j, arms j)
    (hfeasible : ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ arms j-(if j=p then extra else 0)) :
    Partitionable arms sizes := by
  apply extra_partition_from_packing arms sizes i extra a b center p hi hextra
    hcenter hextrasize hsmall hlarge hvalues htotal
  obtain ⟨small,large,ha,hb,hfit⟩ := hfeasible
  refine ⟨small,large,ha,hb,?_⟩
  intro j
  by_cases h : j = p
  · subst j
    have h := hfit p
    simp only [ite_true] at h ⊢
    omega
  · have hh := hfit j
    simp [h] at hh ⊢
    exact hh

end Hornak
