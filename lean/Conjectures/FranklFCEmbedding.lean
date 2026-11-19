module

public import Conjectures.FranklFC

@[expose] public section

/-! Finite FC certificates survive an injective relabelling of their support.
The label function need only be injective on the finite canonical ground.
In particular, a pattern indexed by natural numbers can be embedded into an
arbitrary finite ground without requiring a global injection from `ℕ`. -/

namespace Frankl.FC

open scoped BigOperators
open LocalCertificate

variable {α β : Type*} [DecidableEq α] [DecidableEq β]

def pullPattern (W : Finset α) (f : α → β) (S : Finset β) : Finset α :=
  W.filter (fun x => f x ∈ S)

def pullFamily (W : Finset α) (f : α → β) (F : Finset (Finset β)) :
    Finset (Finset α) := F.image (pullPattern W f)

def pushWeights (W : Finset α) (f : α → β) (w : α → ℕ) (y : β) : ℕ :=
  ∑ x ∈ W, if f x = y then w x else 0

omit [DecidableEq α] in
theorem mem_pullPattern {W : Finset α} {f : α → β} {S : Finset β} {x : α} :
    x ∈ pullPattern W f S ↔ x ∈ W ∧ f x ∈ S := Finset.mem_filter

omit [DecidableEq α] in
theorem pullPattern_subset (W : Finset α) (f : α → β) (S : Finset β) :
    pullPattern W f S ⊆ W := Finset.filter_subset _ _

theorem pullPattern_union (W : Finset α) (f : α → β) (S T : Finset β) :
    pullPattern W f (S ∪ T) = pullPattern W f S ∪ pullPattern W f T := by
  ext x
  simp only [mem_pullPattern, Finset.mem_union, and_or_left]

omit [DecidableEq α] in
theorem pullPattern_image {W S : Finset α} {f : α → β}
    (hf : Set.InjOn f W) (hS : S ⊆ W) : pullPattern W f (S.image f) = S := by
  ext x
  constructor
  · intro hx
    obtain ⟨hxW, hxS⟩ := mem_pullPattern.mp hx
    obtain ⟨y, hy, hfy⟩ := Finset.mem_image.mp hxS
    exact hf (hS hy) hxW hfy ▸ hy
  · intro hx
    exact mem_pullPattern.mpr ⟨hS hx, Finset.mem_image_of_mem f hx⟩

omit [DecidableEq α] in
theorem image_pullPattern {W : Finset α} {S : Finset β} {f : α → β}
    (hS : S ⊆ W.image f) : (pullPattern W f S).image f = S := by
  ext y
  constructor
  · intro hy
    obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hy
    exact (mem_pullPattern.mp hx).2
  · intro hy
    obtain ⟨x, hx, hxy⟩ := Finset.mem_image.mp (hS hy)
    apply Finset.mem_image.mpr
    exact ⟨x, mem_pullPattern.mpr ⟨hx, hxy.symm ▸ hy⟩, hxy⟩

omit [DecidableEq α] in
theorem pullPattern_injOn_family {W : Finset α} {f : α → β}
    {F : Finset (Finset β)} (hF : F ⊆ (W.image f).powerset) :
    Set.InjOn (pullPattern W f) F := by
  intro S hS T hT h
  calc
    S = (pullPattern W f S).image f :=
      (image_pullPattern (Finset.mem_powerset.mp (hF hS))).symm
    _ = (pullPattern W f T).image f := congrArg (Finset.image f) h
    _ = T := image_pullPattern (Finset.mem_powerset.mp (hF hT))

theorem pullFamily_subset_powerset (W : Finset α) (f : α → β)
    (F : Finset (Finset β)) : pullFamily W f F ⊆ W.powerset := by
  intro S hS
  obtain ⟨T, _, rfl⟩ := Finset.mem_image.mp hS
  exact Finset.mem_powerset.mpr (pullPattern_subset W f T)

theorem pullFamily_closedFor {W : Finset α} {f : α → β}
    {base : Finset (Finset α)} {F : Finset (Finset β)}
    (hf : Set.InjOn f W) (hbase : ∀ B ∈ base, B ⊆ W)
    (hc : ShareSearch.ClosedFor (fun S T => S ∪ T)
      (base.image (Finset.image f)) F) :
    ShareSearch.ClosedFor (fun S T => S ∪ T) base (pullFamily W f F) := by
  constructor
  · intro S hS T hT
    obtain ⟨U, hU, rfl⟩ := Finset.mem_image.mp hS
    obtain ⟨V, hV, rfl⟩ := Finset.mem_image.mp hT
    have h := Finset.mem_image_of_mem (pullPattern W f) (hc.1 U hU V hV)
    simpa only [pullFamily, pullPattern_union] using h
  · intro S hS B hB
    obtain ⟨U, hU, rfl⟩ := Finset.mem_image.mp hS
    have h := Finset.mem_image_of_mem (pullPattern W f)
      (hc.2 U hU (B.image f) (Finset.mem_image_of_mem (Finset.image f) hB))
    simpa only [pullFamily, pullPattern_union, pullPattern_image hf (hbase B hB)] using h

omit [DecidableEq α] in
theorem pushWeights_apply {W : Finset α} {f : α → β} (w : α → ℕ)
    (hf : Set.InjOn f W) {x : α} (hx : x ∈ W) : pushWeights W f w (f x) = w x := by
  unfold pushWeights
  rw [Finset.sum_eq_single x]
  · simp only [ite_true]
  · intro y hy hxy
    have hne : f y ≠ f x := fun heq => hxy (hf hy hx heq)
    simp only [hne, ite_false]
  · intro h
    exact False.elim (h hx)

omit [DecidableEq α] in
theorem totalWeight_image {W : Finset α} {f : α → β} (w : α → ℕ)
    (hf : Set.InjOn f W) :
    totalWeight (W.image f) (pushWeights W f w) = totalWeight W w := by
  unfold totalWeight
  rw [Finset.sum_image hf]
  exact Finset.sum_congr rfl (fun x hx => pushWeights_apply w hf hx)

theorem patternWeight_image_pull {W : Finset α} {f : α → β} (w : α → ℕ)
    (hf : Set.InjOn f W) (S : Finset β) :
    patternWeight (W.image f) (pushWeights W f w) S =
      patternWeight W w (pullPattern W f S) := by
  unfold patternWeight
  rw [Finset.sum_image hf]
  apply Finset.sum_congr rfl
  intro x hx
  rw [pushWeights_apply w hf hx]
  simp only [mem_pullPattern, hx, true_and]

theorem share_image_pull {W : Finset α} {f : α → β} (w : α → ℕ)
    (hf : Set.InjOn f W) (S : Finset β) :
    share (W.image f) (pushWeights W f w) S = share W w (pullPattern W f S) := by
  unfold share
  rw [patternWeight_image_pull w hf, totalWeight_image w hf]

theorem sum_share_pullFamily {W : Finset α} {f : α → β} (w : α → ℕ)
    (hf : Set.InjOn f W) {F : Finset (Finset β)} (hF : F ⊆ (W.image f).powerset) :
    (∑ S ∈ pullFamily W f F, share W w S) =
      ∑ S ∈ F, share (W.image f) (pushWeights W f w) S := by
  unfold pullFamily
  rw [Finset.sum_image (pullPattern_injOn_family hF)]
  exact Finset.sum_congr rfl (fun S _ => (share_image_pull w hf S).symm)

/-- An exact finite extension-share theorem can be relabelled injectively
on its finite ground; outside labels are irrelevant. -/
theorem extension_shares_image {W : Finset α} {f : α → β}
    {base : Finset (Finset α)} {w : α → ℕ}
    (hf : Set.InjOn f W) (hbase : ∀ B ∈ base, B ⊆ W)
    (htest : ∀ F : Finset (Finset α), F ⊆ W.powerset →
      ShareSearch.ClosedFor (fun S T => S ∪ T) base F →
      0 ≤ ∑ S ∈ F, share W w S)
    (F : Finset (Finset β)) (hF : F ⊆ (W.image f).powerset)
    (hc : ShareSearch.ClosedFor (fun S T => S ∪ T)
      (base.image (Finset.image f)) F) :
    0 ≤ ∑ S ∈ F, share (W.image f) (pushWeights W f w) S := by
  have h := htest (pullFamily W f F) (pullFamily_subset_powerset W f F)
    (pullFamily_closedFor hf hbase hc)
  rwa [sum_share_pullFamily w hf hF] at h

/-- A certificate on natural-number patterns, or any finite canonical ground,
proves abundance after embedding its base into an arbitrary ambient family. -/
theorem abundant_of_embedded_extension_shares {W : Finset α} {f : α → β}
    {base : Finset (Finset α)} {w : α → ℕ} {family : Finset (Finset β)}
    (hf : Set.InjOn f W) (hbase : ∀ B ∈ base, B ⊆ W)
    (hw : ∃ x ∈ W, 0 < w x)
    (htest : ∀ F : Finset (Finset α), F ⊆ W.powerset →
      ShareSearch.ClosedFor (fun S T => S ∪ T) base F →
      0 ≤ ∑ S ∈ F, share W w S)
    (hu : UnionClosed family) (hb : base.image (Finset.image f) ⊆ family) :
    ∃ x ∈ W, 0 < w x ∧ Abundant family (f x) := by
  have hbase' : ∀ B ∈ base.image (Finset.image f), B ⊆ W.image f := by
    intro B hB
    obtain ⟨A, hA, rfl⟩ := Finset.mem_image.mp hB
    exact Finset.image_subset_image (hbase A hA)
  have hw' : ∃ y ∈ W.image f, 0 < pushWeights W f w y := by
    obtain ⟨x, hx, hpos⟩ := hw
    refine ⟨f x, Finset.mem_image_of_mem f hx, ?_⟩
    rwa [pushWeights_apply w hf hx]
  obtain ⟨y, hy, hpos, hab⟩ := abundant_of_extension_shares hu hb hbase' hw'
    (extension_shares_image hf hbase htest)
  obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hy
  refine ⟨x, hx, ?_, hab⟩
  rwa [pushWeights_apply w hf hx] at hpos

end Frankl.FC
