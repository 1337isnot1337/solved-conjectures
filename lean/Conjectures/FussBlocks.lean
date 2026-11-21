import Conjectures.FussCounting
import Conjectures.FussWords
import Mathlib.Algebra.BigOperators.Fin

/-! Finite lists of north-run block lengths. -/
namespace FussBlocks
open scoped BigOperators

def BlockLists (L n : ℕ) := {xs : List ℕ // xs.length = L ∧ xs.sum = n}

noncomputable def weakEquivLists (L n : ℕ) : FussCounting.weakCompositions L n ≃ BlockLists L n where
  toFun f := ⟨List.ofFn f.val, by simp [List.sum_ofFn, f.property]⟩
  invFun xs := ⟨fun i => xs.val[i.val]'(by have := i.isLt; have hl := xs.property.1; omega), by
    have h := List.sum_ofFn (f := fun i : Fin L => xs.val[i.val]'(by have := i.isLt; have hl := xs.property.1; omega))
    have hof : List.ofFn (fun i : Fin L => xs.val[i.val]'(by have := i.isLt; have hl := xs.property.1; omega)) = xs.val := by
      cases xs with
      | mk xs hx =>
        obtain ⟨hl, hs⟩ := hx
        subst L
        exact List.ofFn_getElem
    rw [hof] at h
    exact h.symm.trans xs.property.2⟩
  left_inv f := by
    apply Subtype.ext
    funext i
    simp
  right_inv xs := by
    apply Subtype.ext
    cases xs with
    | mk xs hx =>
      obtain ⟨hl, hs⟩ := hx
      subst L
      exact List.ofFn_getElem

noncomputable instance (L n : ℕ) : Fintype (BlockLists L n) :=
  Fintype.ofEquiv (FussCounting.weakCompositions L n) (weakEquivLists L n)

theorem blockLists_card (L n : ℕ) : Fintype.card (BlockLists L n) = (L+n-1).choose n := by
  rw [← Fintype.card_congr (weakEquivLists L n), FussCounting.weakCompositions_card]

noncomputable def RawBlocks (L n k i : ℕ) :=
  {xs : BlockLists L n // (xs.val.filter (fun a => 0 < a)).length = k ∧
    (xs.val.filter (fun a => 1 < a)).length = i}

noncomputable instance (L n k i : ℕ) : Fintype (RawBlocks L n k i) := by
  classical
  unfold RawBlocks
  infer_instance

theorem blockWeight_injective (m : ℕ) (hm : 0 < m) : Function.Injective (FussWords.blockWeight m) := by
  intro a b h
  simp only [FussWords.blockWeight] at h
  have hmz : (m : ℤ) ≠ 0 := by exact_mod_cast (ne_of_gt hm)
  have hcast : (a : ℤ) = b := mul_left_cancel₀ hmz (by omega : (m : ℤ)*a = m*b)
  exact_mod_cast hcast

noncomputable def weights (m L n k i : ℕ) (xs : RawBlocks L n k i) : List ℤ :=
  xs.val.val.map (FussWords.blockWeight m)

theorem weights_injective (m L n k i : ℕ) (hm : 0 < m) :
    Function.Injective (weights m L n k i) := by
  intro a b he
  apply Subtype.ext
  apply Subtype.ext
  exact (blockWeight_injective m hm).list_map he

noncomputable def rotatedRaw (L n k i : ℕ) (xs : RawBlocks L n k i) (q : ℕ) : RawBlocks L n k i := by
  refine ⟨⟨xs.val.val.rotate q, ?_⟩, ?_⟩
  · exact ⟨by simpa using xs.val.property.1, by simpa using (List.rotate_perm xs.val.val q).sum_eq.trans xs.val.property.2⟩
  · constructor
    · exact ((List.rotate_perm xs.val.val q).filter (fun a => decide (0 < a))).length_eq.trans xs.property.1
    · exact ((List.rotate_perm xs.val.val q).filter (fun a => decide (1 < a))).length_eq.trans xs.property.2

theorem weights_rotated (m L n k i : ℕ) (xs : RawBlocks L n k i) (q : ℕ) :
    weights m L n k i (rotatedRaw L n k i xs q) = (weights m L n k i xs).rotate q := by
  simp [weights, rotatedRaw, List.map_rotate]

noncomputable def GoodRaw (m L n k i : ℕ) :=
  {xs : RawBlocks L n k i // FussCycle.GoodRotation (weights m L n k i xs) 0}

noncomputable instance (m L n k i : ℕ) : Fintype (GoodRaw m L n k i) := by
  classical
  unfold GoodRaw
  infer_instance

theorem raw_good_rotation_count (m n k i : ℕ) (hm : 0 < m) :
    Fintype.card (RawBlocks (m*n+1) n k i) =
      Fintype.card (GoodRaw m (m*n+1) n k i) * (m*n+1) := by
  classical
  let L := m*n+1
  let wt := weights m L n k i
  let S : Finset (List ℤ) := Finset.univ.image wt
  have hwi : Function.Injective wt := weights_injective m L n k i hm
  have hscard : S.card = Fintype.card (RawBlocks L n k i) := by
    simp [S, Finset.card_image_of_injective _ hwi]
  have hgoodset : FussCycle.goodWords S = Finset.univ.image (fun x : GoodRaw m L n k i => wt x.val) := by
    ext v
    simp only [FussCycle.goodWords, Finset.mem_filter, S, Finset.mem_image, Finset.mem_univ,
      true_and]
    constructor
    · rintro ⟨⟨x, rfl⟩, hg⟩
      exact ⟨⟨x,hg⟩, rfl⟩
    · rintro ⟨⟨x,hg⟩, rfl⟩
      exact ⟨⟨x,rfl⟩, hg⟩
  have hgi : Function.Injective (fun x : GoodRaw m L n k i => wt x.val) := by
    intro x y h
    exact Subtype.ext (hwi h)
  have hgcard : (FussCycle.goodWords S).card = Fintype.card (GoodRaw m L n k i) := by
    rw [hgoodset]
    simp [Finset.card_image_of_injective _ hgi]
  have hlen : ∀ xs ∈ S, xs.length = L := by
    intro xs hx
    obtain ⟨b, _, rfl⟩ := Finset.mem_image.mp hx
    simp [wt, weights, b.val.property.1]
  have hsum : ∀ xs ∈ S, xs.sum = -1 := by
    intro xs hx
    obtain ⟨b, _, rfl⟩ := Finset.mem_image.mp hx
    simp only [wt, weights, FussWords.weight_sum, b.val.property.1, b.val.property.2, L]
    push_cast
    ring
  have hclosed : ∀ xs ∈ S, ∀ q, xs.rotate q ∈ S := by
    intro xs hx q
    obtain ⟨b, _, rfl⟩ := Finset.mem_image.mp hx
    apply Finset.mem_image.mpr
    refine ⟨rotatedRaw L n k i b q, Finset.mem_univ _, ?_⟩
    exact weights_rotated m L n k i b q
  have hc := FussCycle.rotation_count S L (by dsimp [L]; omega) hlen hsum hclosed
  rw [hscard, hgcard] at hc
  exact hc

noncomputable def goodRawEquivGoodBlocks (m n k i : ℕ) :
    GoodRaw m (m*n+1) n k i ≃ FussWords.GoodBlocks m n k i where
  toFun b := ⟨b.val.val.val, b.val.val.property.2, b.val.val.property.1,
    b.property, b.val.property.1, b.val.property.2⟩
  invFun b := ⟨⟨⟨b.val, b.property.2.1, b.property.1⟩,
    b.property.2.2.2.1, b.property.2.2.2.2⟩, b.property.2.2.1⟩
  left_inv _ := rfl
  right_inv _ := rfl

noncomputable instance (m n k i : ℕ) : Fintype (FussWords.GoodBlocks m n k i) :=
  Fintype.ofEquiv (GoodRaw m (m*n+1) n k i) (goodRawEquivGoodBlocks m n k i)

noncomputable instance (m n k i : ℕ) [hm : Fact (0 < m)] [hn : Fact (0 < n)] :
    Fintype (FussWords.DyckPaths m n k i) :=
  Fintype.ofEquiv (FussWords.GoodBlocks m n k i)
    (FussWords.goodBlocksEquivPaths m n k i hm.out hn.out)

theorem raw_path_rotation_count (m n k i : ℕ) (hm : 0 < m) (hn : 0 < n) :
    Fintype.card (RawBlocks (m*n+1) n k i) =
      @Fintype.card (FussWords.DyckPaths m n k i)
        (Fintype.ofEquiv (FussWords.GoodBlocks m n k i)
          (FussWords.goodBlocksEquivPaths m n k i hm hn)) * (m*n+1) := by
  let : Fact (0 < m) := ⟨hm⟩
  let : Fact (0 < n) := ⟨hn⟩
  have h1 := Fintype.card_congr (goodRawEquivGoodBlocks m n k i)
  have h2 := Fintype.card_congr (FussWords.goodBlocksEquivPaths m n k i hm hn)
  rw [← h2, ← h1]
  exact raw_good_rotation_count m n k i hm

theorem length_filter_eq_sum (p : ℕ → Bool) (xs : List ℕ) :
    (xs.filter p).length = (xs.map (fun x => if p x then 1 else 0)).sum := by
  induction xs with
  | nil => rfl
  | cons x xs ih => cases hx : p x <;> simp [hx, ih, Nat.add_comm]

theorem length_filter_ofFn (L : ℕ) (f : Fin L → ℕ) (p : ℕ → Bool) :
    ((List.ofFn f).filter p).length = (Finset.univ.filter (fun x => p (f x))).card := by
  rw [length_filter_eq_sum]
  rw [List.map_ofFn, List.sum_ofFn, Finset.card_filter]
  rfl

def RawVectors (L n k i : ℕ) :=
  {f : FussCounting.weakCompositions L n //
    (Finset.univ.filter (fun x => 0 < f.val x)).card = k ∧
    (Finset.univ.filter (fun x => 1 < f.val x)).card = i}

noncomputable def rawVectorsEquiv (L n k i : ℕ) : RawVectors L n k i ≃ RawBlocks L n k i := by
  apply Equiv.subtypeEquiv (weakEquivLists L n)
  intro f
  change ((Finset.univ.filter (fun x => 0 < f.val x)).card = k ∧
    (Finset.univ.filter (fun x => 1 < f.val x)).card = i) ↔
    (((List.ofFn f.val).filter (fun a => 0 < a)).length = k ∧
     ((List.ofFn f.val).filter (fun a => 1 < a)).length = i)
  rw [length_filter_ofFn, length_filter_ofFn]
  simp

noncomputable instance (L n k i : ℕ) : Fintype (RawVectors L n k i) :=
  Fintype.ofEquiv (RawBlocks L n k i) (rawVectorsEquiv L n k i).symm

end FussBlocks
