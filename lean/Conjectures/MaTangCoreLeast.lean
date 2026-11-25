import Conjectures.MaTangCoreThreshold

/-!
# Ma–Tang's random subset-sum threshold conjecture
A least half-coverage threshold over all finite abelian groups.
-/
namespace MaTangCoreLeast
open MaTangCoreThreshold MaTangCoreUpperUniform MaTangCoreUpperShift
open MaTangCoreUpperDyadic MaTangCoreUniformSubset

theorem zero_mem {α : Type} (g : TranslationData α) (w : List α) :
    g.zero ∈ subsetValues g w := by
  induction w with
  | nil => simp [subsetValues]
  | cons a w ih => exact List.mem_append.mpr (Or.inl ih)

theorem elements_mem {α : Type} (g : TranslationData α) (unit : ∀ a, g.add a g.zero = a)
    (a : α) (w : List α) (h : a ∈ w) : a ∈ subsetValues g w := by
  induction w with
  | nil => simp at h
  | cons b w ih =>
    rcases List.mem_cons.mp h with e | hm
    · subst b
      exact List.mem_append.mpr (Or.inr (List.mem_map.mpr ⟨g.zero,zero_mem g w,unit _⟩))
    · exact List.mem_append.mpr (Or.inl (ih hm))

theorem full_half {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (cA : ∀ a, a ∈ A)
    (unit : ∀ a, g.add a g.zero = a) : HalfCoverage g A A.length := by
  have h : (kSubsets A A.length).filter (coveredB g A) = kSubsets A A.length := by
    apply List.filter_eq_self.mpr
    intro s hs
    have ⟨hsub,hlen⟩ := (kSubsets_mem _ _ _).mp hs
    have e := hsub.eq_of_length hlen
    subst s
    exact (coveredB_spec g A cA A).mpr (fun a => elements_mem g unit a A (cA a))
  unfold HalfCoverage
  rw [h]
  omega

/-- Each alphabet is a duplicate-free enumeration of the entire type.
The right unit and commutativity give a two-sided identity; adding the
associativity and translation inverses is equivalent to the abelian group laws. -/
def UniversalHalf (n k : Nat) : Prop :=
    k ≤ n ∧ ∀ (α : Type) [BEq α] [LawfulBEq α] (g : TranslationData α) (A : List α),
    A.Nodup → (∀ a, a ∈ A) → A.length = n →
    (∀ a, g.add a g.zero = a) →
    (∀ a b c, g.add (g.add a b) c = g.add a (g.add b c)) →
    HalfCoverage g A k

theorem universal_full (n : Nat) : UniversalHalf n n := by
  refine ⟨Nat.le_refl _,?_⟩
  intro α _ _ g A hA cA hlen hunit hAssoc
  rw [← hlen]
  exact full_half g A cA hunit

theorem exists_least_within (p : Nat → Prop) (b : Nat)
    (h : ∃ k, k ≤ b ∧ p k) :
    ∃ k, p k ∧ ∀ j, p j → k ≤ j := by
  classical
  induction b with
  | zero =>
    obtain ⟨k,hk,hp⟩ := h
    exact ⟨k,hp,fun j _ => by omega⟩
  | succ b ih =>
    by_cases old : ∃ k, k ≤ b ∧ p k
    · exact ih old
    · obtain ⟨k,hk,hp⟩ := h
      have hb : ¬ k ≤ b := fun hle => old ⟨k,hle,hp⟩
      exact ⟨k,hp,fun j hj => by
        apply Nat.le_of_not_gt
        intro hnj
        exact old ⟨j,by omega,hj⟩⟩

theorem exists_least (n : Nat) :
    ∃ k, UniversalHalf n k ∧ ∀ j, UniversalHalf n j → k ≤ j :=
  exists_least_within (UniversalHalf n) n ⟨n,Nat.le_refl _,universal_full n⟩

noncomputable def threshold (n : Nat) : Nat := Classical.choose (exists_least n)

theorem threshold_spec (n : Nat) : UniversalHalf n (threshold n) :=
  (Classical.choose_spec (exists_least n)).1

theorem threshold_min (n k : Nat) (h : UniversalHalf n k) : threshold n ≤ k :=
  (Classical.choose_spec (exists_least n)).2 k h

theorem threshold_upper (n : Nat) (hN : 2^16 ≤ n) : threshold n ≤ upperSampleSize n := by
  by_cases hk : upperSampleSize n ≤ n
  · apply threshold_min
    refine ⟨hk,?_⟩
    intro α _ _ g A hA cA hlen hunit hAssoc
    rw [← hlen]
    exact Nat.le_of_lt (uniform_coverage_gt_half g A hA cA hAssoc (hlen.symm ▸ hN))
  · have hh := (threshold_spec n).1
    omega

theorem threshold_lower_of_witness (n k : Nat)
    {α : Type} [BEq α] [LawfulBEq α] (g : TranslationData α) (A : List α)
    (hA : A.Nodup) (cA : ∀ a, a ∈ A) (hlen : A.length = n)
    (hunit : ∀ a, g.add a g.zero = a)
    (hAssoc : ∀ a b c, g.add (g.add a b) c = g.add a (g.add b c))
    (hfail : ¬ HalfCoverage g A k) : k < threshold n := by
  apply Nat.lt_of_not_ge
  intro h
  have hhalf := (threshold_spec n).2 α g A hA cA hlen hunit hAssoc
  exact hfail (halfCoverage_mono g A hA cA hAssoc _ _ h hhalf)

end MaTangCoreLeast

