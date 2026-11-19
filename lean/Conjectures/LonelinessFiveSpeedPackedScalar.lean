import Conjectures.LonelinessFiveSpeedScalarTree

/-! Scalar masks can be stored as consecutive blocks of `p` bits in one
natural number. A finite equality check identifies every relevant block
with the already checked scalar tree. No correctness assumption is made
about the procedure that constructs the packed number. -/

namespace Loneliness.FiveSpeedCertificate

/-- The block at raw index `a`; index zero is included in the certificate. -/
def packedScalarMaskLookup (p packed a : ℕ) : ℕ :=
  (packed >>> (p * a)) &&& fullMask p

/-- Folding gives an oracle for every natural multiplier. -/
def packedScalarMask (p packed a : ℕ) : ℕ :=
  packedScalarMaskLookup p packed (foldResidue p a)

/-- Only the indices that can occur after folding need to be checked. -/
def packedScalarTreeCheck (p packed : ℕ) (tree : ScalarTree) : Bool :=
  (List.range (p / 2 + 1)).all (fun a =>
    decide (packedScalarMaskLookup p packed a = treeMaskLookup tree a))

theorem packedScalarTreeCheck_iff (p packed : ℕ) (tree : ScalarTree) :
    packedScalarTreeCheck p packed tree = true ↔
      ∀ a, a ≤ p / 2 →
        packedScalarMaskLookup p packed a = treeMaskLookup tree a := by
  simp only [packedScalarTreeCheck, List.all_eq_true, decide_eq_true_eq,
    List.mem_range, Nat.lt_succ_iff]

theorem packedScalarTreeCheck_lookup (p packed : ℕ) (tree : ScalarTree)
    (hcheck : packedScalarTreeCheck p packed tree = true)
    (a : ℕ) (ha : a ≤ p / 2) :
    packedScalarMaskLookup p packed a = treeMaskLookup tree a :=
  (packedScalarTreeCheck_iff p packed tree).mp hcheck a ha

/-- The packed oracle is exactly the existing tree oracle, including at
zero and at multipliers outside the checked half interval. -/
theorem packedScalarMask_eq_treeMask (p packed : ℕ) (tree : ScalarTree)
    (hcheck : packedScalarTreeCheck p packed tree = true) (a : ℕ) :
    packedScalarMask p packed a = treeMask p tree a :=
  packedScalarTreeCheck_lookup p packed tree hcheck _ (foldResidue_le_half p a)

theorem packedScalarMask_eq_treeMask_function (p packed : ℕ) (tree : ScalarTree)
    (hcheck : packedScalarTreeCheck p packed tree = true) :
    packedScalarMask p packed = treeMask p tree := by
  funext a
  exact packedScalarMask_eq_treeMask p packed tree hcheck a

/-- Both finite certificates are kernel-checkable Boolean equalities.
Together they give the full good-mask specification without any primality
or additional range premise. -/
theorem packedScalarTreeCheck_sound (p packed : ℕ) (tree : ScalarTree)
    (htree : scalarTreeCheck p tree = true)
    (hpacked : packedScalarTreeCheck p packed tree = true) (a : ℕ) :
    GoodMask p a (packedScalarMask p packed a) := by
  rw [packedScalarMask_eq_treeMask p packed tree hpacked a]
  exact scalarTreeCheck_sound p tree htree a

end Loneliness.FiveSpeedCertificate
