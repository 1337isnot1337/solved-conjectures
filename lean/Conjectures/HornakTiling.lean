import Conjectures.HornakSegments
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.BigOperators.Fin

/-! Canonical consecutive placement of the two piece sizes in one arm. -/
namespace Hornak

def pieceStart (i small n : ℕ) : ℕ :=
  if n < small then n*i else small*i+(n-small)*(i+1)

def pieceLen (i small n : ℕ) : ℕ := if n < small then i else i+1

theorem pieceLen_pos (i small n : ℕ) (hi : 0 < i) : 0 < pieceLen i small n := by
  unfold pieceLen
  split_ifs <;> omega

theorem piece_end_le (i small large n : ℕ) (hn : n < small+large) :
    pieceStart i small n + pieceLen i small n ≤ small*i + large*(i+1) := by
  unfold pieceStart pieceLen
  by_cases h : n < small
  · simp only [ite_eq_left h]
    have hm : (n+1)*i ≤ small*i := Nat.mul_le_mul_right i (by omega)
    nlinarith
  · simp only [ite_eq_right h]
    have hs : n-small < large := by omega
    have hm : (n-small+1)*(i+1) ≤ large*(i+1) := Nat.mul_le_mul_right (i+1) (by omega)
    nlinarith

theorem pieces_ordered (i small n r : ℕ) (hnr : n < r) :
    pieceStart i small n + pieceLen i small n ≤ pieceStart i small r := by
  unfold pieceStart pieceLen
  by_cases hn : n < small <;> by_cases hr : r < small
  · simp only [ite_eq_left hn, ite_eq_left hr]
    have hm : (n+1)*i ≤ r*i := Nat.mul_le_mul_right i (by omega)
    nlinarith
  · simp only [ite_eq_left hn, ite_eq_right hr]
    have hm : (n+1)*i ≤ small*i := Nat.mul_le_mul_right i (by omega)
    nlinarith
  · omega
  · simp only [ite_eq_right hn, ite_eq_right hr]
    have hm : (n-small+1)*(i+1) ≤ (r-small)*(i+1) := Nat.mul_le_mul_right (i+1) (by omega)
    nlinarith

theorem pieces_cover (i small large q : ℕ) (hi : 0 < i)
    (hq : q < small*i+large*(i+1)) :
    ∃ n, n < small+large ∧ pieceStart i small n ≤ q ∧
      q < pieceStart i small n + pieceLen i small n := by
  by_cases h : q < small*i
  · let n := q/i
    have hn : n < small := (Nat.div_lt_iff_lt_mul hi).2 (by simpa [Nat.mul_comm] using h)
    have hdiv := Nat.div_add_mod q i
    have hmod := Nat.mod_lt q hi
    refine ⟨n, by omega, ?_, ?_⟩
    · simp only [pieceStart, ite_eq_left hn]
      dsimp [n]
      nlinarith [Nat.zero_le (q%i)]
    · simp only [pieceStart, pieceLen, ite_eq_left hn]
      dsimp [n]
      nlinarith
  · let t := q-small*i
    let n := small+t/(i+1)
    have ht : t < large*(i+1) := by dsimp [t]; omega
    have hn : t/(i+1) < large := (Nat.div_lt_iff_lt_mul (by omega : 0 < i+1)).2 ht
    have hdiv := Nat.div_add_mod t (i+1)
    have hmod := Nat.mod_lt t (by omega : 0 < i+1)
    have hsub : t+small*i=q := by dsimp [t]; omega
    have hns : ¬ n < small := by dsimp only [n]; exact Nat.not_lt_of_ge (Nat.le_add_right _ _)
    refine ⟨n, by dsimp [n]; exact Nat.add_lt_add_left hn small, ?_, ?_⟩
    · simp only [pieceStart, ite_eq_right hns]
      dsimp [n]
      simp only [Nat.add_sub_cancel_left]
      nlinarith [Nat.zero_le (t%(i+1))]
    · simp only [pieceStart, pieceLen, ite_eq_right hns]
      dsimp [n]
      simp only [Nat.add_sub_cancel_left]
      nlinarith

/-- Every feasible numerical allocation gives an actual connected partition:
one central piece and the specified small and large segments on each arm. -/
theorem realize_allocations {m : ℕ} (arms small large : Fin m → ℕ) (i : ℕ)
    (hi : 0 < i) (hfit : ∀ j, small j*i+large j*(i+1) ≤ arms j) :
    let cut : Fin m → ℕ := fun j => arms j-(small j*i+large j*(i+1))
    let labels := Σ j, Fin (small j+large j)
    let e := Fintype.equivFin labels
    Partitionable arms (Fin.cases (1+∑ j, cut j)
      (fun k => pieceLen i (small (e.symm k).1) (e.symm k).2.val)) := by
  classical
  dsimp only
  let cut : Fin m → ℕ := fun j => arms j-(small j*i+large j*(i+1))
  let labels := Σ j, Fin (small j+large j)
  let e := Fintype.equivFin labels
  let host := fun k : Fin (Fintype.card labels) => (e.symm k).1
  let lo := fun k : Fin (Fintype.card labels) =>
    cut (host k)+pieceStart i (small (host k)) (e.symm k).2.val
  let high := fun k : Fin (Fintype.card labels) =>
    lo k+pieceLen i (small (host k)) (e.symm k).2.val
  change Partitionable arms (Fin.cases (1+∑ j, cut j) (fun k => pieceLen i (small (host k)) (e.symm k).2.val))
  have hcut (j : Fin m) : cut j ≤ arms j := Nat.sub_le _ _
  have htotal (j : Fin m) : cut j+(small j*i+large j*(i+1)) = arms j := by
    dsimp [cut]
    exact Nat.sub_add_cancel (hfit j)
  have hinter (k : Fin (Fintype.card labels)) :
      cut (host k) ≤ lo k ∧ lo k < high k ∧ high k ≤ arms (host k) := by
    have hn := (e.symm k).2.isLt
    have hend := piece_end_le i (small (host k)) (large (host k)) (e.symm k).2.val hn
    have hpositive := pieceLen_pos i (small (host k)) (e.symm k).2.val hi
    dsimp [lo,high]
    have htotal' := htotal (host k)
    omega
  have hcover (j : Fin m) (n : ℕ) (hn : cut j ≤ n) (hbound : n < arms j) :
      ∃ k, host k = j ∧ lo k ≤ n ∧ n < high k := by
    have hused : n-cut j < small j*i+large j*(i+1) := by have := htotal j; omega
    obtain ⟨r,hr,hrlo,hrhi⟩ := pieces_cover i (small j) (large j) (n-cut j) hi hused
    let label : labels := ⟨j,⟨r,hr⟩⟩
    refine ⟨e label, ?_, ?_, ?_⟩
    · simp [host, label]
    · change cut ((e.symm (e label)).1) + pieceStart i (small (e.symm (e label)).1) (e.symm (e label)).2.val ≤ n
      rw [e.symm_apply_apply]
      change cut j + pieceStart i (small j) r ≤ n
      omega
    · change n < cut ((e.symm (e label)).1) + pieceStart i (small (e.symm (e label)).1) (e.symm (e label)).2.val + pieceLen i (small (e.symm (e label)).1) (e.symm (e label)).2.val
      rw [e.symm_apply_apply]
      change n < cut j + pieceStart i (small j) r + pieceLen i (small j) r
      omega
  have hdisj (k l : Fin (Fintype.card labels)) (hne : k ≠ l) (hsame : host k = host l) :
      high k ≤ lo l ∨ high l ≤ lo k := by
    have hidx : (e.symm k).2.val ≠ (e.symm l).2.val := by
      intro he
      apply hne
      apply e.symm.injective
      change (e.symm k).1 = (e.symm l).1 at hsame
      apply Sigma.ext hsame
      apply (Fin.heq_ext_iff (congrArg (fun j => small j+large j) hsame)).2
      exact he
    rcases lt_or_gt_of_ne hidx with h | h
    · left
      have hh := pieces_ordered i (small (host k)) (e.symm k).2.val (e.symm l).2.val h
      dsimp [high,lo]
      rw [← hsame]
      omega
    · right
      have hh := pieces_ordered i (small (host l)) (e.symm l).2.val (e.symm k).2.val h
      dsimp [high,lo]
      rw [hsame]
      omega
  have h := partition_of_interval_tiling arms cut host lo high hcut hinter hcover hdisj
  simpa only [high, lo, Nat.add_sub_cancel_left] using h

theorem center_size_of_allocation {m : ℕ} (arms small large : Fin m → ℕ)
    (i a b center : ℕ) (hfit : ∀ j, small j*i+large j*(i+1) ≤ arms j)
    (ha : (∑ j, small j) = a) (hb : (∑ j, large j) = b)
    (htotal : center+a*i+b*(i+1) = 1+∑ j, arms j) :
    1+(∑ j, (arms j-(small j*i+large j*(i+1)))) = center := by
  have hsum : (∑ j, (arms j-(small j*i+large j*(i+1)))) +
      (∑ j, (small j*i+large j*(i+1))) = ∑ j, arms j := by
    rw [← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro j _
    exact Nat.sub_add_cancel (hfit j)
  simp only [Finset.sum_add_distrib, ← Finset.sum_mul, ha, hb] at hsum
  omega

theorem realize_allocations_with_center {m : ℕ} (arms small large : Fin m → ℕ)
    (i a b center : ℕ) (hi : 0 < i)
    (hfit : ∀ j, small j*i+large j*(i+1) ≤ arms j)
    (ha : (∑ j, small j) = a) (hb : (∑ j, large j) = b)
    (htotal : center+a*i+b*(i+1) = 1+∑ j, arms j) :
    let labels := Σ j, Fin (small j+large j)
    let e := Fintype.equivFin labels
    Partitionable arms (Fin.cases center
      (fun k => pieceLen i (small (e.symm k).1) (e.symm k).2.val)) := by
  have hcenter := center_size_of_allocation arms small large i a b center hfit ha hb htotal
  have h := realize_allocations arms small large i hi hfit
  dsimp only at h ⊢
  rw [← hcenter]
  exact h

theorem small_piece_count {m : ℕ} (small large : Fin m → ℕ) (i : ℕ) :
    let labels := Σ j, Fin (small j+large j)
    let e := Fintype.equivFin labels
    Nat.card {k : Fin (Fintype.card labels) //
      pieceLen i (small (e.symm k).1) (e.symm k).2.val = i} = ∑ j, small j := by
  classical
  dsimp only
  let labels := Σ j, Fin (small j+large j)
  let e := Fintype.equivFin labels
  let e0 : {k : Fin (Fintype.card labels) //
      pieceLen i (small (e.symm k).1) (e.symm k).2.val = i} ≃
      {z : labels // z.2.val < small z.1} :=
    Equiv.subtypeEquiv e.symm (by
      intro k
      simp only [pieceLen]
      split_ifs <;> omega)
  let e1 : {z : labels // z.2.val < small z.1} ≃ Σ j, Fin (small j) := {
    toFun := fun z => ⟨z.val.1,⟨z.val.2.val,z.property⟩⟩
    invFun := fun z => ⟨⟨z.1,⟨z.2.val, by have := z.2.isLt; omega⟩⟩, z.2.isLt⟩
    left_inv := by intro ⟨⟨j,n⟩,h⟩; rfl
    right_inv := by intro ⟨j,n⟩; rfl
  }
  calc
    Nat.card {k : Fin (Fintype.card labels) //
      pieceLen i (small (e.symm k).1) (e.symm k).2.val = i} = Nat.card (Σ j, Fin (small j)) :=
        Nat.card_congr (e0.trans e1)
    _ = ∑ j, small j := by simp [Nat.card_eq_fintype_card, Fintype.card_sigma]

theorem large_piece_count {m : ℕ} (small large : Fin m → ℕ) (i : ℕ) :
    let labels := Σ j, Fin (small j+large j)
    let e := Fintype.equivFin labels
    Nat.card {k : Fin (Fintype.card labels) //
      pieceLen i (small (e.symm k).1) (e.symm k).2.val = i+1} = ∑ j, large j := by
  classical
  dsimp only
  let labels := Σ j, Fin (small j+large j)
  let e := Fintype.equivFin labels
  let e0 : {k : Fin (Fintype.card labels) //
      pieceLen i (small (e.symm k).1) (e.symm k).2.val = i+1} ≃
      {z : labels // small z.1 ≤ z.2.val} :=
    Equiv.subtypeEquiv e.symm (by
      intro k
      simp only [pieceLen]
      split_ifs <;> omega)
  let e1 : {z : labels // small z.1 ≤ z.2.val} ≃ Σ j, Fin (large j) := {
    toFun := fun z => ⟨z.val.1,⟨z.val.2.val-small z.val.1, by have := z.val.2.isLt; have := z.property; omega⟩⟩
    invFun := fun z => ⟨⟨z.1,⟨small z.1+z.2.val, by have := z.2.isLt; omega⟩⟩, by simp⟩
    left_inv := by
      intro ⟨⟨j,n⟩,h⟩
      apply Subtype.ext
      change (⟨j,⟨small j+(n.val-small j), _⟩⟩ : labels) = ⟨j,n⟩
      congr 1
      apply Fin.ext
      change small j ≤ n.val at h
      change small j+(n.val-small j) = n.val
      omega
    right_inv := by
      intro ⟨j,n⟩
      change (⟨j,⟨small j+n.val-small j, _⟩⟩ : Σ j, Fin (large j)) = ⟨j,n⟩
      congr 1
      apply Fin.ext
      simp
  }
  calc
    Nat.card {k : Fin (Fintype.card labels) //
      pieceLen i (small (e.symm k).1) (e.symm k).2.val = i+1} = Nat.card (Σ j, Fin (large j)) :=
        Nat.card_congr (e0.trans e1)
    _ = ∑ j, large j := by simp [Nat.card_eq_fintype_card, Fintype.card_sigma]

/-- Numeric two-size arm allocations realize a connected graph partition
with the exact prescribed center, small-piece count and large-piece count. -/
theorem packing_realizes_partition {m : ℕ} (arms : Fin m → ℕ)
    (i a b center : ℕ) (hi : 0 < i)
    (htotal : center+a*i+b*(i+1) = 1+∑ j, arms j)
    (hfeasible : ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ arms j) :
    ∃ (p : ℕ) (sizes : Fin (p+1) → ℕ),
      sizes 0 = center ∧
      Nat.card {k : Fin p // sizes k.succ = i} = a ∧
      Nat.card {k : Fin p // sizes k.succ = i+1} = b ∧
      (∀ k : Fin p, sizes k.succ = i ∨ sizes k.succ = i+1) ∧
      Partitionable arms sizes := by
  classical
  obtain ⟨small,large,ha,hb,hfit⟩ := hfeasible
  let labels := Σ j, Fin (small j+large j)
  let e := Fintype.equivFin labels
  let sizes : Fin (Fintype.card labels+1) → ℕ := Fin.cases center
    (fun k => pieceLen i (small (e.symm k).1) (e.symm k).2.val)
  refine ⟨Fintype.card labels,sizes,rfl,?_,?_,?_,?_⟩
  · have h := small_piece_count small large i
    dsimp only at h
    simpa [sizes, labels, e, ha] using h
  · have h := large_piece_count small large i
    dsimp only at h
    simpa [sizes, labels, e, hb] using h
  · intro k
    change pieceLen i (small (e.symm k).1) (e.symm k).2.val = i ∨
      pieceLen i (small (e.symm k).1) (e.symm k).2.val = i+1
    unfold pieceLen
    split_ifs <;> simp
  · exact realize_allocations_with_center arms small large i a b center hi hfit ha hb htotal

theorem size_fiber_card_succ {p : ℕ} (sizes : Fin (p+1) → ℕ) (n : ℕ) :
    Nat.card {j // sizes j = n} = (if sizes 0 = n then 1 else 0) +
      Nat.card {k : Fin p // sizes k.succ = n} := by
  classical
  simp only [Nat.card_eq_fintype_card, Fintype.card_subtype, Finset.card_filter,
    Fin.sum_univ_succ]

theorem two_value_fiber_counts {p q : ℕ} (f : Fin p → ℕ) (g : Fin q → ℕ) (i : ℕ)
    (hf : ∀ k, f k = i ∨ f k = i+1) (hg : ∀ k, g k = i ∨ g k = i+1)
    (hsmall : Nat.card {k // f k = i} = Nat.card {k // g k = i})
    (hlarge : Nat.card {k // f k = i+1} = Nat.card {k // g k = i+1}) :
    ∀ n, Nat.card {k // f k = n} = Nat.card {k // g k = n} := by
  intro n
  by_cases hs : n = i
  · subst n
    exact hsmall
  by_cases hl : n = i+1
  · subst n
    exact hlarge
  have hfzero : IsEmpty {k // f k = n} := ⟨fun k => by
    rcases hf k.val with h | h <;> rw [k.property] at h <;> omega⟩
  have hgzero : IsEmpty {k // g k = n} := ⟨fun k => by
    rcases hg k.val with h | h <;> rw [k.property] at h <;> omega⟩
  rw [Nat.card_eq_zero.mpr (Or.inl hfzero), Nat.card_eq_zero.mpr (Or.inl hgzero)]

theorem centered_sizes_reorder {m p q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (p+1) → ℕ) (sizes' : Fin (q+1) → ℕ) (i : ℕ)
    (hcenter : sizes 0 = sizes' 0)
    (hf : ∀ k : Fin p, sizes k.succ = i ∨ sizes k.succ = i+1)
    (hg : ∀ k : Fin q, sizes' k.succ = i ∨ sizes' k.succ = i+1)
    (hsmall : Nat.card {k : Fin p // sizes k.succ = i} = Nat.card {k : Fin q // sizes' k.succ = i})
    (hlarge : Nat.card {k : Fin p // sizes k.succ = i+1} = Nat.card {k : Fin q // sizes' k.succ = i+1})
    (hpart : Partitionable arms sizes) : Partitionable arms sizes' := by
  apply partitionable_reorder arms sizes sizes' _ hpart
  intro n
  rw [size_fiber_card_succ, size_fiber_card_succ, hcenter]
  congr 1
  exact two_value_fiber_counts (fun k => sizes k.succ) (fun k => sizes' k.succ)
    i hf hg hsmall hlarge n

/-- A feasible allocation realizes any ordering of the requested two-size
parts, after choosing the zeroth label for the central part. -/
theorem partition_from_packing {m q : ℕ} (arms : Fin m → ℕ)
    (sizes : Fin (q+1) → ℕ) (i a b center : ℕ) (hi : 0 < i)
    (hcenter : sizes 0 = center)
    (hsmall : Nat.card {k : Fin q // sizes k.succ = i} = a)
    (hlarge : Nat.card {k : Fin q // sizes k.succ = i+1} = b)
    (hvalues : ∀ k : Fin q, sizes k.succ = i ∨ sizes k.succ = i+1)
    (htotal : center+a*i+b*(i+1) = 1+∑ j, arms j)
    (hfeasible : ∃ small large : Fin m → ℕ,
      (∑ j, small j) = a ∧ (∑ j, large j) = b ∧
      ∀ j, small j*i+large j*(i+1) ≤ arms j) :
    Partitionable arms sizes := by
  obtain ⟨p,values,hc,hs,hl,hv,hpart⟩ :=
    packing_realizes_partition arms i a b center hi htotal hfeasible
  exact centered_sizes_reorder arms values sizes i (hc.trans hcenter.symm) hv hvalues
    (hs.trans hsmall.symm) (hl.trans hlarge.symm) hpart

end Hornak
