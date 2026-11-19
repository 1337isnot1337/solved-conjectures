import Conjectures.LonelinessFiveSpeedPackedScalar

/-! A scalar oracle stored in bounded packed blocks. The finite equality
certificate identifies every folded lookup with the existing scalar tree.
The block size and the function selecting blocks need no trusted premise. -/

namespace Loneliness.FiveSpeedCertificate

def blockPackedScalarMaskLookup (p blockSize : ℕ) (blocks : ℕ → ℕ) (a : ℕ) : ℕ :=
  (blocks (a / blockSize) >>> (p * (a % blockSize))) &&& fullMask p

def blockPackedScalarMask (p blockSize : ℕ) (blocks : ℕ → ℕ) (a : ℕ) : ℕ :=
  blockPackedScalarMaskLookup p blockSize blocks (foldResidue p a)

def blockPackedScalarTreeCheck (p blockSize : ℕ) (blocks : ℕ → ℕ)
    (tree : ScalarTree) : Bool :=
  (List.range (p / 2 + 1)).all (fun a =>
    decide (blockPackedScalarMaskLookup p blockSize blocks a = treeMaskLookup tree a))

theorem blockPackedScalarTreeCheck_iff (p blockSize : ℕ) (blocks : ℕ → ℕ)
    (tree : ScalarTree) :
    blockPackedScalarTreeCheck p blockSize blocks tree = true ↔
      ∀ a, a ≤ p / 2 →
        blockPackedScalarMaskLookup p blockSize blocks a = treeMaskLookup tree a := by
  simp only [blockPackedScalarTreeCheck, List.all_eq_true, decide_eq_true_eq,
    List.mem_range, Nat.lt_succ_iff]

theorem blockPackedScalarTreeCheck_lookup (p blockSize : ℕ) (blocks : ℕ → ℕ)
    (tree : ScalarTree) (hcheck : blockPackedScalarTreeCheck p blockSize blocks tree = true)
    (a : ℕ) (ha : a ≤ p / 2) :
    blockPackedScalarMaskLookup p blockSize blocks a = treeMaskLookup tree a :=
  (blockPackedScalarTreeCheck_iff p blockSize blocks tree).mp hcheck a ha

theorem blockPackedScalarMask_eq_treeMask (p blockSize : ℕ) (blocks : ℕ → ℕ)
    (tree : ScalarTree) (hcheck : blockPackedScalarTreeCheck p blockSize blocks tree = true)
    (a : ℕ) : blockPackedScalarMask p blockSize blocks a = treeMask p tree a :=
  blockPackedScalarTreeCheck_lookup p blockSize blocks tree hcheck _
    (foldResidue_le_half p a)

theorem blockPackedScalarMask_eq_treeMask_function (p blockSize : ℕ) (blocks : ℕ → ℕ)
    (tree : ScalarTree) (hcheck : blockPackedScalarTreeCheck p blockSize blocks tree = true) :
    blockPackedScalarMask p blockSize blocks = treeMask p tree := by
  funext a
  exact blockPackedScalarMask_eq_treeMask p blockSize blocks tree hcheck a

theorem blockPackedScalarMask_eq_packedScalarMask (p blockSize packed : ℕ)
    (blocks : ℕ → ℕ) (tree : ScalarTree)
    (hblock : blockPackedScalarTreeCheck p blockSize blocks tree = true)
    (hpacked : packedScalarTreeCheck p packed tree = true) :
    blockPackedScalarMask p blockSize blocks = packedScalarMask p packed :=
  (blockPackedScalarMask_eq_treeMask_function p blockSize blocks tree hblock).trans
    (packedScalarMask_eq_treeMask_function p packed tree hpacked).symm

theorem blockPackedScalarTreeCheck_sound (p blockSize : ℕ) (blocks : ℕ → ℕ)
    (tree : ScalarTree) (htree : scalarTreeCheck p tree = true)
    (hblocks : blockPackedScalarTreeCheck p blockSize blocks tree = true) (a : ℕ) :
    GoodMask p a (blockPackedScalarMask p blockSize blocks a) := by
  rw [blockPackedScalarMask_eq_treeMask p blockSize blocks tree hblocks a]
  exact scalarTreeCheck_sound p tree htree a

end Loneliness.FiveSpeedCertificate
