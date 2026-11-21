module

public import Conjectures.SteinkeZakynthinou.Fold
public import Conjectures.SteinkeZakynthinou.RankLoss
public import Mathlib.Order.WithBot

/-! How a selected sequence of tagged cuts sits inside a larger sample. -/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

noncomputable def orderedCutKey {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) (r : Fin (n + 1)) : WithTop Key :=
  match cutAt z tag ht r with
  | none => ⊤
  | some i => ↑(key (z i) (tag i))

theorem orderedCutKey_castSucc {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) (r : Fin n) :
    orderedCutKey z tag ht (Fin.castSucc r) =
      (key (z (sortedRows z tag ht r)) (tag (sortedRows z tag ht r)) : WithTop Key) := by
  simp [orderedCutKey, cutAt]

theorem orderedCutKey_last {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) :
    orderedCutKey z tag ht (Fin.last n) = ⊤ := by
  simp [orderedCutKey, cutAt]

theorem orderedCutKey_strictMono {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) :
    StrictMono (orderedCutKey z tag ht) := by
  intro a b hab
  refine Fin.lastCases ?_ (fun i => ?_) a hab
  · intro h
    exact False.elim ((not_lt.mpr (Fin.le_last b)) h)
  · clear hab a
    refine Fin.lastCases ?_ (fun j => ?_) b
    · intro _
      simp [orderedCutKey_castSucc, orderedCutKey_last]
    · intro h
      rw [orderedCutKey_castSucc, orderedCutKey_castSucc, WithTop.coe_lt_coe]
      exact sortedRows_strictMono z tag ht (Fin.castSucc_lt_castSucc_iff.mp h)

structure IncludedSample {n m : ℕ} (z : Sample n) (u : Sample m)
    (tag : Fin n → ℕ) (utag : Fin m → ℕ) where
  rows : Fin n ↪ Fin m
  obs_eq : ∀ i, u (rows i) = z i
  tag_eq : ∀ i, utag (rows i) = tag i

namespace IncludedSample

variable {n m : ℕ} {z : Sample n} {u : Sample m} {tag : Fin n → ℕ} {utag : Fin m → ℕ}

theorem key_eq (inc : IncludedSample z u tag utag) (i : Fin n) :
    key (u (inc.rows i)) (utag (inc.rows i)) = key (z i) (tag i) := by
  rw [inc.obs_eq i, inc.tag_eq i]

noncomputable def ordinal (inc : IncludedSample z u tag utag) (ht : Function.Injective tag)
    (hu : Function.Injective utag) (r : Fin (n + 1)) : Fin (m + 1) :=
  match cutAt z tag ht r with
  | none => Fin.last m
  | some i => Fin.castSucc ((sortedRows u utag hu).symm (inc.rows i))

theorem ordinal_castSucc (inc : IncludedSample z u tag utag) (ht : Function.Injective tag)
    (hu : Function.Injective utag) (r : Fin n) :
    inc.ordinal ht hu (Fin.castSucc r) =
      Fin.castSucc ((sortedRows u utag hu).symm (inc.rows (sortedRows z tag ht r))) := by
  simp [ordinal, cutAt]

theorem orderedCutKey_ordinal (inc : IncludedSample z u tag utag)
    (ht : Function.Injective tag) (hu : Function.Injective utag) (r : Fin (n + 1)) :
    orderedCutKey u utag hu (inc.ordinal ht hu r) = orderedCutKey z tag ht r := by
  refine Fin.lastCases ?_ (fun r => ?_) r
  · simp [ordinal, cutAt, orderedCutKey_last]
  · rw [ordinal_castSucc, orderedCutKey_castSucc, orderedCutKey_castSucc,
      Equiv.apply_symm_apply, inc.key_eq]

noncomputable def cutEmbedding (inc : IncludedSample z u tag utag)
    (ht : Function.Injective tag) (hu : Function.Injective utag) :
    Fin (n + 1) ↪o Fin (m + 1) :=
  OrderEmbedding.ofStrictMono (inc.ordinal ht hu) (by
    intro a b hab
    apply (orderedCutKey_strictMono u utag hu).lt_iff_lt.mp
    rw [inc.orderedCutKey_ordinal ht hu, inc.orderedCutKey_ordinal ht hu]
    exact orderedCutKey_strictMono z tag ht hab)

theorem cutEmbedding_last (inc : IncludedSample z u tag utag)
    (ht : Function.Injective tag) (hu : Function.Injective utag) :
    inc.cutEmbedding ht hu (Fin.last n) = Fin.last m := by
  change inc.ordinal ht hu (Fin.last n) = _
  simp [ordinal, cutAt]

theorem cutAt_cutEmbedding (inc : IncludedSample z u tag utag)
    (ht : Function.Injective tag) (hu : Function.Injective utag) (r : Fin (n + 1)) :
    cutAt u utag hu (inc.cutEmbedding ht hu r) = (cutAt z tag ht r).map inc.rows := by
  refine Fin.lastCases ?_ (fun k => ?_) r
  · rw [inc.cutEmbedding_last]
    simp [cutAt]
  · change cutAt u utag hu (inc.ordinal ht hu (Fin.castSucc k)) = _
    rw [inc.ordinal_castSucc]
    simp [cutAt]

theorem mem_range_cutEmbedding (inc : IncludedSample z u tag utag)
    (ht : Function.Injective tag) (hu : Function.Injective utag) (r : Fin (m + 1)) :
    r ∈ Set.range (inc.cutEmbedding ht hu) ↔
      ∀ i, cutAt u utag hu r = some i → i ∈ Set.range inc.rows := by
  refine Fin.lastCases ?_ (fun j => ?_) r
  · simp [cutAt, Set.mem_range]
    exact ⟨Fin.last n, inc.cutEmbedding_last ht hu⟩
  · simp only [cutAt, finSuccEquivLast_castSucc, Option.map_some, Option.some.injEq, forall_eq']
    constructor
    · rintro ⟨q, hq⟩
      refine Fin.lastCases ?_ (fun k => ?_) q hq
      · intro h
        rw [inc.cutEmbedding_last] at h
        exact False.elim (Fin.castSucc_ne_last j h.symm)
      · intro h
        change inc.ordinal ht hu (Fin.castSucc k) = _ at h
        rw [inc.ordinal_castSucc] at h
        use sortedRows z tag ht k
        simpa using congrArg (sortedRows u utag hu) (Fin.castSucc_injective _ h)
    · rintro ⟨i, hi⟩
      use Fin.castSucc ((sortedRows z tag ht).symm i)
      change inc.ordinal ht hu _ = _
      rw [inc.ordinal_castSucc, Equiv.apply_symm_apply, hi, Equiv.symm_apply_apply]

end IncludedSample

noncomputable def taggedError (cut : WithTop Key) (z : Observation) (tag : ℕ) : ℝ :=
  if (decide (cut ≤ (key z tag : WithTop Key)) : Bool) = z.2 then 0 else 1

theorem taggedError_mem_Icc (cut : WithTop Key) (z : Observation) (tag : ℕ) :
    taggedError cut z tag ∈ Set.Icc (0 : ℝ) 1 := by
  unfold taggedError
  split <;> norm_num

theorem virtualLoss_eq_sum_taggedError {n : ℕ} (z : Sample n) (tag : Fin n → ℕ)
    (ht : Function.Injective tag) (r : Fin (n + 1)) :
    virtualLoss z tag (cutAt z tag ht r) =
      ∑ i, taggedError (orderedCutKey z tag ht r) (z i) (tag i) := by
  unfold virtualLoss
  apply Finset.sum_congr rfl
  intro i _
  cases h : cutAt z tag ht r
  · simp [orderedCutKey, virtualPredict, taggedError, h]
  · simp [orderedCutKey, virtualPredict, taggedError, h]
    rfl

/-- Adding one row adds exactly the binary loss of that row at each shared cut. -/
theorem IncludedSample.loss_eq_union_sub {n : ℕ} {z : Sample n} {u : Sample (n + 1)}
    {tag : Fin n → ℕ} {utag : Fin (n + 1) → ℕ}
    (inc : IncludedSample z u tag utag) (ht : Function.Injective tag) (hu : Function.Injective utag)
    (i : Fin (n + 1)) (hi : i ∉ Set.range inc.rows) (r : Fin (n + 1)) :
    virtualLoss z tag (cutAt z tag ht r) =
      virtualLoss u utag (cutAt u utag hu (inc.cutEmbedding ht hu r)) -
        taggedError (orderedCutKey z tag ht r) (u i) (utag i) := by
  classical
  have hset : Finset.univ.map inc.rows = Finset.univ.erase i := by
    apply Finset.eq_of_subset_of_card_le
    · intro j hj
      obtain ⟨k, _, hk⟩ := Finset.mem_map.mp hj
      exact Finset.mem_erase.mpr ⟨fun he => hi ⟨k, hk.trans he⟩, Finset.mem_univ _⟩
    · simp
  rw [virtualLoss_eq_sum_taggedError, virtualLoss_eq_sum_taggedError]
  change _ = (∑ j, taggedError (orderedCutKey u utag hu (inc.ordinal ht hu r))
    (u j) (utag j)) - _
  rw [inc.orderedCutKey_ordinal ht hu]
  let f := fun j => taggedError (orderedCutKey z tag ht r) (u j) (utag j)
  have he : (∑ k, taggedError (orderedCutKey z tag ht r) (z k) (tag k)) =
      ∑ j ∈ Finset.univ.erase i, f j := by
    rw [← hset, Finset.sum_map]
    simp [f, inc.obs_eq, inc.tag_eq]
  rw [he, Finset.sum_erase_eq_sub (Finset.mem_univ i)]

end SteinkeZakynthinou
