import Conjectures.MaTangCoreUpperCollision
import Conjectures.MaTangCoreUniformSubset

/-!
# Ma–Tang's random subset-sum threshold conjecture
The finite upper bound passes from distinct words to uniform unordered subsets.
-/
namespace MaTangCoreUpperUniform
open MaTangCoreOccupancy MaTangCoreUpperPrefixes MaTangCoreUpperShift
open MaTangCoreUpperDyadic MaTangCoreBirthday MaTangCoreRank MaTangCoreUpperCollision
open MaTangCoreUniformSubset MaTangCoreSetCoverage MaTangCoreFactor
open MaTangCoreTranspose MaTangCoreDistinct
open MaTangCoreCoupling MaTangCoreMultiplicity

theorem subsetValues_perm_mem {α : Type} (g : TranslationData α)
    (ha : ∀ x y z, g.add (g.add x y) z = g.add x (g.add y z))
    {w v : List α} (h : w.Perm v) :
    ∀ x : α, x ∈ subsetValues g w ↔ x ∈ subsetValues g v := by
  induction h with
  | nil => intro x; rfl
  | cons a h ih =>
    intro x
    -- The same tail-membership equivalence is applied at every translated preimage.
    simp only [subsetValues,List.mem_append,List.mem_map]
    exact ⟨fun hh => hh.elim (fun ht => Or.inl ((ih x).mp ht))
      (fun ⟨z,hz,e⟩ => Or.inr ⟨z,(ih z).mp hz,e⟩),
      fun hh => hh.elim (fun ht => Or.inl ((ih x).mpr ht))
        (fun ⟨z,hz,e⟩ => Or.inr ⟨z,(ih z).mpr hz,e⟩)⟩
  | swap a b w =>
    intro x
    have hab (z : α) : g.add a (g.add b z) = g.add b (g.add a z) := by
      rw [← ha,← ha,g.add_comm a b]
    simp only [subsetValues,List.map_append,List.mem_append,List.map_map,Function.comp_def]
    simp only [hab,or_left_comm,or_assoc]
  | trans h₁ h₂ e₁ e₂ =>
    intro x
    exact (e₁ x).trans (e₂ x)

theorem filtered_subset_count {α : Type} [BEq α] [LawfulBEq α]
    (A : List α) (k : Nat) (hA : A.Nodup) (p : List α → Bool)
    (inv : ∀ {s w : List α}, s.Perm w → p s = p w) :
    ((distinctWords A k).filter p).length = ((kSubsets A k).filter p).length*falling k k := by
  let S := (kSubsets A k).filter p
  let W := (distinctWords A k).filter p
  let F := fun s : List α => distinctWords s k
  let L := taggedFibers S F
  have hL : L.length = S.length*falling k k := by
    apply taggedFibers_length
    intro s hs
    obtain ⟨hsub,hlen⟩ := (kSubsets_mem A k s).mp (List.mem_filter.mp hs).1
    change (distinctWords s k).length = _
    rw [distinctWords_length s (hsub.nodup hA) k,hlen]
  have he : L.length = W.length := by
    apply card_of_bijection L W
      (taggedFibers_nodup _ _ (filter_nodup _ _ (kSubsets_nodup A k hA)) (fun s hs =>
        distinctWords_nodup s k (((kSubsets_mem A k s).mp
          (List.mem_filter.mp hs).1).1.nodup hA)))
      (filter_nodup _ _ (distinctWords_nodup A k hA)) Prod.snd
    · intro q hq
      obtain ⟨hs,hw⟩ := (taggedFibers_mem _ _ q).mp hq
      obtain ⟨hks,hcov⟩ := List.mem_filter.mp hs
      have ee := permutation_fiber_members A k hA q.1 q.2 hks hw
      have hsn := ((kSubsets_mem A k q.1).mp hks).1.nodup hA
      have hwn := ((distinctWords_mem _ _ _).mp hw).2
      have hp := perm_of_nodup_members q.1 q.2 hsn hwn ee.2
      exact List.mem_filter.mpr ⟨ee.1, (inv hp) ▸ hcov⟩
    · intro q hq r hr eq
      obtain ⟨hqs,hqw⟩ := (taggedFibers_mem _ _ q).mp hq
      obtain ⟨hrs,hrw⟩ := (taggedFibers_mem _ _ r).mp hr
      have hqs' := (List.mem_filter.mp hqs).1
      have hrs' := (List.mem_filter.mp hrs).1
      have hq' := (permutation_fiber_members A k hA q.1 q.2 hqs' hqw).2
      have hr' := (permutation_fiber_members A k hA r.1 r.2 hrs' hrw).2
      have hs : ∀ a, a ∈ q.1 ↔ a ∈ r.1 := by
        intro a
        rw [hq' a,hr' a,eq]
      have ee := canonicalIn_congr A q.1 r.1 hs
      rw [canonicalIn_of_sublist A q.1 hA ((kSubsets_mem A k q.1).mp hqs').1,
        canonicalIn_of_sublist A r.1 hA ((kSubsets_mem A k r.1).mp hrs').1] at ee
      exact Prod.ext ee eq
    · intro w hw
      obtain ⟨hd,hcov⟩ := List.mem_filter.mp hw
      have h := canonicalIn_sample A k hA w hd
      have hm := (permutation_fiber_members A k hA _ w h.1 h.2).2
      have hsn := canonicalIn_nodup A w hA
      have hwn := ((distinctWords_mem A k w).mp hd).2
      have hp := perm_of_nodup_members _ _ hsn hwn hm
      have hc := (inv hp).symm ▸ hcov
      exact ⟨(canonicalIn A w,w),(taggedFibers_mem _ _ _).mpr
        ⟨List.mem_filter.mpr ⟨h.1,hc⟩,h.2⟩,rfl⟩
  exact he.symm.trans hL

def coveredB {α : Type} [BEq α] (g : TranslationData α) (A w : List α) : Bool :=
  !(decide (0 < missingCount g A w))

theorem coveredB_spec {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (cA : ∀ a, a ∈ A) (w : List α) :
    coveredB g A w = true ↔ ∀ x, x ∈ subsetValues g w := by
  rw [← missingCount_zero_iff g A cA w]
  simp [coveredB]

theorem coveredB_perm {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (cA : ∀ a, a ∈ A)
    (ha : ∀ x y z, g.add (g.add x y) z = g.add x (g.add y z))
    {w v : List α} (h : w.Perm v) :
    coveredB g A w = coveredB g A v := by
  have he : coveredB g A w = true ↔ coveredB g A v = true := by
    rw [coveredB_spec g A cA,coveredB_spec g A cA]
    exact ⟨fun hh x => (subsetValues_perm_mem g ha h x).mp (hh x),
      fun hh x => (subsetValues_perm_mem g ha h x).mpr (hh x)⟩
  cases h₁ : coveredB g A w <;> cases h₂ : coveredB g A v <;> simp_all

/-- Strict majority for the actual unordered sample, not sampling with replacement. -/
theorem uniform_coverage_gt_half {α : Type} [BEq α] [LawfulBEq α]
    (g : TranslationData α) (A : List α) (hA : A.Nodup) (cA : ∀ a, a ∈ A)
    (ha : ∀ x y z, g.add (g.add x y) z = g.add x (g.add y z))
    (hN : 2^16 ≤ A.length) :
    (kSubsets A (upperSampleSize A.length)).length <
      2*((kSubsets A (upperSampleSize A.length)).filter (coveredB g A)).length := by
  let k := upperSampleSize A.length
  have h := conditioned_cover g A hA cA hN
  change (distinctWords A k).length < 2*tally (coveredB g A) (distinctWords A k) at h
  rw [MaTangCoreGenerator.tally_filter_length,ordered_subset_count A k hA,
    filtered_subset_count A k hA _ (coveredB_perm g A cA ha),← Nat.mul_assoc] at h
  exact Nat.lt_of_mul_lt_mul_right h

end MaTangCoreUpperUniform

