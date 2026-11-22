module

public import Conjectures.AgnosticVC.OptimizerRestriction
public import Conjectures.AgnosticVC.VC
public import Mathlib.Data.Fintype.Powerset

@[expose] public section

open scoped BigOperators

namespace AgnosticVC

variable {I : Type*} [Fintype I] [DecidableEq I]

abbrev SizedSubset (I : Type*) (m : ℕ) := {M : Finset I // M.card = m}

abbrev AvoidingSubset (i : I) (m : ℕ) := {M : SizedSubset I m // i ∉ M.val}

abbrev ContainingSubset (i : I) (m : ℕ) := {M : SizedSubset I m // i ∈ M.val}

/-- A subset containing the omitted index and a position available to replace it. -/
abbrev SwapBefore (i : I) (m : ℕ) := (M : ContainingSubset i m) × {j : I // j ∉ M.val.val}

/-- A subset avoiding the omitted index and a position available to swap back out. -/
abbrev SwapAfter (i : I) (m : ℕ) := (M : AvoidingSubset i m) × {j : I // j ∈ M.val.val}

omit [Fintype I] in
theorem card_insert_after_erase (M : Finset I) {i j : I} (hi : i ∈ M) (hj : j ∉ M) :
    (insert j (M.erase i)).card = M.card := by
  rw [Finset.card_insert_of_notMem (fun h => hj (Finset.mem_of_mem_erase h)), Finset.card_erase_of_mem hi]
  have h := Finset.card_pos.mpr ⟨i, hi⟩
  omega

/-- Swap the omitted index out, recording the position used to replace it. -/
def swapOut (i : I) {m : ℕ} (a : SwapBefore i m) : SwapAfter i m :=
  ⟨⟨⟨insert a.2.val (a.1.val.val.erase i), (card_insert_after_erase _ a.1.property a.2.property).trans
      a.1.val.property⟩,
    fun h => (Finset.mem_insert.mp h).elim (fun e => a.2.property (e ▸ a.1.property))
      (Finset.notMem_erase _ _)⟩,
    ⟨a.2.val, Finset.mem_insert_self _ _⟩⟩

/-- Undo the exchange by putting the omitted index back. -/
def swapIn (i : I) {m : ℕ} (a : SwapAfter i m) : SwapBefore i m :=
  ⟨⟨⟨insert i (a.1.val.val.erase a.2.val), (card_insert_after_erase _ a.2.property a.1.property).trans
      a.1.val.property⟩,
    Finset.mem_insert_self _ _⟩,
    ⟨a.2.val, fun h => (Finset.mem_insert.mp h).elim (fun e => a.1.property (by simpa only [e] using a.2.property))
      (Finset.notMem_erase _ _)⟩⟩

/-- The two descriptions of a changed subset pair count the same pairs. -/
def swapEquiv (i : I) (m : ℕ) : SwapBefore i m ≃ SwapAfter i m where
  toFun := swapOut i
  invFun := swapIn i
  left_inv a := by
    refine Sigma.subtype_ext (Subtype.ext (Subtype.ext ?_)) rfl
    change insert i ((insert a.2.val (a.1.val.val.erase i)).erase a.2.val) = a.1.val.val
    rw [Finset.erase_insert (fun h => a.2.property (Finset.mem_of_mem_erase h)), Finset.insert_erase a.1.property]
  right_inv a := by
    refine Sigma.subtype_ext (Subtype.ext (Subtype.ext ?_)) rfl
    change insert a.2.val ((insert i (a.1.val.val.erase a.2.val)).erase i) = a.1.val.val
    rw [Finset.erase_insert (fun h => a.1.property (Finset.mem_of_mem_erase h)), Finset.insert_erase a.2.property]

/-- The diagonal (unchanged) and exchanged cases of the deletion coupling. -/
abbrev SubsetSwap (i : I) (m : ℕ) := AvoidingSubset i m ⊕ SwapBefore i m

def swapSource (i : I) {m : ℕ} (k : SubsetSwap i m) : SizedSubset I m :=
  match k with
  | Sum.inl a => a.val
  | Sum.inr a => a.1.val

def swapTarget (i : I) {m : ℕ} (k : SubsetSwap i m) : AvoidingSubset i m :=
  match k with
  | Sum.inl a => a
  | Sum.inr a => (swapOut i a).1

/-- Give every original subset equal total weight, split equally among replacement choices
for the subsets that contain the omitted index. -/
noncomputable def swapWeight (i : I) {m : ℕ} (k : SubsetSwap i m) : ℝ :=
  let u := ((Fintype.card (SizedSubset I m) : ℝ))⁻¹
  match k with
  | Sum.inl _ => u
  | Sum.inr _ => u / ((Fintype.card I - m : ℕ) : ℝ)

omit [DecidableEq I] in
theorem swapWeight_nonneg (i : I) {m : ℕ} (k : SubsetSwap i m) : 0 ≤ swapWeight i k := by
  cases k <;> simp only [swapWeight] <;> positivity

private theorem sum_swapBefore_fst (i : I) {m : ℕ} (f : ContainingSubset i m → ℝ) :
    ∑ k : SwapBefore i m, f k.1 = ((Fintype.card I - m : ℕ) : ℝ) * ∑ a, f a := by
  rw [Fintype.sum_sigma, Finset.mul_sum]
  refine Finset.sum_congr rfl fun a _ => ?_
  simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, Fintype.card_subtype_compl,
    Fintype.card_coe, a.val.property]

private theorem sum_swapAfter_fst (i : I) {m : ℕ} (f : AvoidingSubset i m → ℝ) :
    ∑ k : SwapAfter i m, f k.1 = (m : ℝ) * ∑ a, f a := by
  rw [Fintype.sum_sigma, Finset.mul_sum]
  refine Finset.sum_congr rfl fun a _ => ?_
  simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, Fintype.card_coe, a.val.property]

/-- The first marginal of the coupling is uniform over all subsets of the required size. -/
theorem sum_swapSource (i : I) {m : ℕ} (hm : m < Fintype.card I) (f : SizedSubset I m → ℝ) :
    ∑ k : SubsetSwap i m, swapWeight i k * f (swapSource i k) =
      (Fintype.card (SizedSubset I m) : ℝ)⁻¹ * ∑ a, f a := by
  let u := ((Fintype.card (SizedSubset I m) : ℝ))⁻¹
  let δ : ℝ := (Fintype.card I - m : ℕ)
  have hδ : 0 < δ := by
    dsimp [δ]
    exact_mod_cast Nat.sub_pos_of_lt hm
  rw [Fintype.sum_sum_type]
  change (∑ a : AvoidingSubset i m, u * f a.val) +
    (∑ k : SwapBefore i m, (u / δ) * f k.1.val) = u * ∑ a, f a
  rw [← Finset.mul_sum, ← Finset.mul_sum, sum_swapBefore_fst i (fun a => f a.val)]
  have he : (u / δ) * δ = u := div_mul_cancel₀ _ hδ.ne'
  rw [← mul_assoc, he, ← mul_add, add_comm (∑ a : AvoidingSubset i m, f a.val)]
  exact congrArg (u * ·) (Fintype.sum_subtype_add_sum_subtype (fun a : SizedSubset I m => i ∈ a.val) f)

private theorem sum_swapTarget_constant (i : I) {m : ℕ} (f : AvoidingSubset i m → ℝ) :
    ∑ k : SubsetSwap i m, swapWeight i k * f (swapTarget i k) =
      (((Fintype.card (SizedSubset I m) : ℝ))⁻¹ +
        (((Fintype.card (SizedSubset I m) : ℝ))⁻¹ / ((Fintype.card I - m : ℕ) : ℝ)) * m) *
        ∑ a, f a := by
  let u := ((Fintype.card (SizedSubset I m) : ℝ))⁻¹
  let δ : ℝ := (Fintype.card I - m : ℕ)
  rw [Fintype.sum_sum_type]
  change (∑ a : AvoidingSubset i m, u * f a) +
    (∑ k : SwapBefore i m, (u / δ) * f ((swapEquiv i m k).1)) = _
  rw [← Finset.mul_sum, ← Finset.mul_sum, (swapEquiv i m).sum_comp (fun k => f k.1), sum_swapAfter_fst]
  ring

/-- The second marginal of the coupling is uniform among the subsets avoiding the omitted row. -/
theorem sum_swapTarget (i : I) {m : ℕ} (hm : m < Fintype.card I) (f : AvoidingSubset i m → ℝ) :
    ∑ k : SubsetSwap i m, swapWeight i k * f (swapTarget i k) =
      (Fintype.card (AvoidingSubset i m) : ℝ)⁻¹ * ∑ a, f a := by
  let u := ((Fintype.card (SizedSubset I m) : ℝ))⁻¹
  let δ : ℝ := (Fintype.card I - m : ℕ)
  have hc : (Fintype.card (SizedSubset I m) : ℝ) ≠ 0 := by
    rw [Fintype.card_finset_len]
    exact_mod_cast (Nat.choose_pos hm.le).ne'
  have h := sum_swapSource i hm (fun _ => (1 : ℝ))
  have h' := sum_swapTarget_constant i (m := m) (fun _ => (1 : ℝ))
  simp only [mul_one, Finset.sum_const, Finset.card_univ, nsmul_eq_mul, mul_one, inv_mul_cancel₀ hc] at h h'
  rw [h] at h'
  have hp : ((Fintype.card (AvoidingSubset i m) : ℝ)) ≠ 0 := fun he => by rw [he, mul_zero] at h'; norm_num at h'
  have he : u + (u / δ) * m = (Fintype.card (AvoidingSubset i m) : ℝ)⁻¹ := by
    apply (mul_left_inj' hp).mp
    rw [inv_mul_cancel₀ hp]
    exact h'.symm
  rw [sum_swapTarget_constant, he]

private def containingEquiv (i : I) (m : ℕ) : ContainingSubset i (m + 1) ≃
    ↥((Finset.univ.erase i).powersetCard m) where
  toFun M := ⟨M.val.val.erase i, Finset.mem_powersetCard.mpr
    ⟨fun j hj => Finset.mem_erase.mpr ⟨(Finset.mem_erase.mp hj).1, Finset.mem_univ j⟩,
      by rw [Finset.card_erase_of_mem M.property, M.val.property, Nat.add_sub_cancel]⟩⟩
  invFun M := ⟨⟨insert i M.val, by
    obtain ⟨hM, hcard⟩ := Finset.mem_powersetCard.mp M.property
    rw [Finset.card_insert_of_notMem (fun hi => Finset.notMem_erase _ _ (hM hi)), hcard]⟩,
    Finset.mem_insert_self _ _⟩
  left_inv M := Subtype.ext (Subtype.ext (Finset.insert_erase M.property))
  right_inv M := Subtype.ext (Finset.erase_insert
    (fun hi => Finset.notMem_erase _ _ ((Finset.mem_powersetCard.mp M.property).1 hi)))

/-- The changed mass of the subset coupling is exactly the fraction of subsets that contain
the omitted coordinate. -/
theorem sum_swapWeight_changed (i : I) {m : ℕ} (hm : m < Fintype.card I) :
    ∑ k : SwapBefore i m, swapWeight i (Sum.inr k) = (m : ℝ) / Fintype.card I := by
  let N := Fintype.card I
  let δ : ℝ := (N - m : ℕ)
  let u := ((Fintype.card (SizedSubset I m) : ℝ))⁻¹
  have hδ : 0 < δ := by
    dsimp [δ, N]
    exact_mod_cast Nat.sub_pos_of_lt hm
  have he : ∑ k : SwapBefore i m, swapWeight i (Sum.inr k) =
      u * (Fintype.card (ContainingSubset i m) : ℝ) := by
    change (∑ _ : SwapBefore i m, u / δ) = _
    simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
    have hc := sum_swapBefore_fst i (m := m) (fun _ => (1 : ℝ))
    simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, mul_one] at hc
    rw [hc]
    change δ * (Fintype.card (ContainingSubset i m) : ℝ) * (u / δ) = _
    field_simp
  rw [he]
  cases m with
  | zero =>
    have hempty : IsEmpty (ContainingSubset i 0) := by
      refine ⟨fun M => ?_⟩
      have h := Finset.card_eq_zero.mp M.val.property
      have hi := M.property
      rw [h] at hi
      exact Finset.notMem_empty i hi
    simp
  | succ m =>
    have hn : 0 < N := Fintype.card_pos_iff.mpr ⟨i⟩
    have hc : Fintype.card (ContainingSubset i (m + 1)) = (N - 1).choose m := by
      rw [Fintype.card_congr (containingEquiv i m), Fintype.card_coe,
        Finset.card_powersetCard, Finset.card_erase_of_mem (Finset.mem_univ i), Finset.card_univ]
    have hall : Fintype.card (SizedSubset I (m + 1)) = N.choose (m + 1) := Fintype.card_finset_len _
    dsimp only [u]
    rw [hc, hall]
    have hNc : (N : ℝ) ≠ 0 := by exact_mod_cast hn.ne'
    have hMc : (N.choose (m + 1) : ℝ) ≠ 0 := by exact_mod_cast (Nat.choose_pos hm.le).ne'
    have heN : N - 1 + 1 = N := by omega
    have relation := Nat.add_one_mul_choose_eq (N - 1) m
    rw [heN] at relation
    have relation' : (N : ℝ) * ((N - 1).choose m : ℝ) = (N.choose (m + 1) : ℝ) * ((m + 1 : ℕ) : ℝ) :=
      by exact_mod_cast relation
    rw [inv_mul_eq_div]
    apply (div_eq_div_iff hMc hNc).mpr
    linarith only [relation']

/-- Restrict a binary trace to a given set of coordinates. -/
def restrictionOn (F : Finset (Finset I)) (M : Finset I) (v : ↥F) : ↥(traceRestriction F M) :=
  ⟨M ∩ v.val, Finset.mem_image.mpr ⟨v.val, v.property, rfl⟩⟩

/-- The mass of a cell depends only on its equivalence class of full traces. -/
theorem marginal_cell_congr {α β γ : Type*} [Fintype α] (r : α → β) (s : α → γ)
    (h : ∀ a b, r a = r b ↔ s a = s b) (p : α → ℝ) (a : α) :
    marginal r p (r a) = marginal s p (s a) := by
  classical
  unfold marginal
  rw [Finset.filter_congr fun x _ => h x a]

omit [Fintype I] in
private theorem restrictionOn_insert_eq_iff (F : Finset (Finset I)) (M : Finset I) (i : I)
    (u v : ↥F) : restrictionOn F (insert i M) u = restrictionOn F (insert i M) v ↔
      (restrictionOn F M u, decide (i ∈ u.val)) = (restrictionOn F M v, decide (i ∈ v.val)) := by
  simp only [Prod.mk.injEq, Subtype.ext_iff, restrictionOn, decide_eq_decide]
  constructor
  · intro h
    have hmem (j : I) := Finset.ext_iff.mp h j
    constructor
    · ext j
      simp only [Finset.mem_inter]
      exact ⟨fun ⟨hj, hu⟩ => ⟨hj, (Finset.mem_inter.mp <|
        (hmem j).mp (Finset.mem_inter.mpr ⟨Finset.mem_insert_of_mem hj, hu⟩)).2⟩,
        fun ⟨hj, hv⟩ => ⟨hj, (Finset.mem_inter.mp <|
        (hmem j).mpr (Finset.mem_inter.mpr ⟨Finset.mem_insert_of_mem hj, hv⟩)).2⟩⟩
    · simpa only [Finset.mem_inter, Finset.mem_insert_self, true_and] using hmem i
  · rintro ⟨h, hi⟩
    ext j
    by_cases hji : j = i
    · subst j
      simpa only [Finset.mem_inter, Finset.mem_insert_self, true_and] using hi
    · simp only [Finset.mem_inter, Finset.mem_insert, hji, false_or]
      simpa only [Finset.mem_inter] using Finset.ext_iff.mp h j

omit [Fintype I] in
/-- Swapping one coordinate changes the log gradient by at most 32 in squared norm under
any positive law on the full traces. -/
theorem restrictionOn_swap_gradient_bound (F : Finset (Finset I)) (M : Finset I)
    (i j : I) {p : ↥F → ℝ} (hp : IsLaw p) (hpos : ∀ a, 0 < p a) :
    ∑ a, p a * (Real.log (marginal (restrictionOn F (insert j M)) p (restrictionOn F (insert j M) a)) -
      Real.log (marginal (restrictionOn F (insert i M)) p (restrictionOn F (insert i M) a)))^2 ≤ 32 := by
  let r := restrictionOn F M
  have hi (a : ↥F) := marginal_cell_congr (restrictionOn F (insert i M))
    (fun a => (r a, decide (i ∈ a.val))) (restrictionOn_insert_eq_iff F M i) p a
  have hj (a : ↥F) := marginal_cell_congr (restrictionOn F (insert j M))
    (fun a => (r a, decide (j ∈ a.val))) (restrictionOn_insert_eq_iff F M j) p a
  simp_rw [hi, hj]
  exact binary_replacement_gradient_bound r (fun a => decide (j ∈ a.val))
    (fun a => decide (i ∈ a.val)) hp hpos

end AgnosticVC
