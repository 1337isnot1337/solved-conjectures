import Conjectures.LonelinessFourSpeedFastEnumeration

/-! A finite partition of support checks. Each row belongs to its checksum
bucket, and every bucket must carry a complete kernel-checked assertion.
The partition controls reduction memory without discarding any support. -/

namespace Loneliness.Modular.FourSpeed

def supportBucket (chunks : ℕ) (s : Finset ℕ) : ℕ :=
  (s.sum (fun a => a))%chunks

def bucketResidueCheck (num den m r : ℕ) (inv : ℕ → ℕ)
    (retained : Finset (Finset ℕ)) (chunks bucket : ℕ) : Bool :=
  decide (∀ s∈fastBoundedSupports m r, supportBucket chunks s=bucket →
    (r=1 ∨ PairNormalized m inv s) → rowCheck num den m retained s=true)

theorem residueCheck_of_buckets {num den m r chunks : ℕ}
    (hm : 2≤m) (hr : 0<r) (hchunks : 0<chunks)
    (inv : ℕ → ℕ) (retained : Finset (Finset ℕ))
    (hcheck : ∀ bucket : Fin chunks,
      bucketResidueCheck num den m r inv retained chunks bucket.val=true) :
    residueCheck num den m r inv retained=true := by
  unfold residueCheck
  apply decide_eq_true.mpr
  intro s hs
  have hsplit : s∈boundedSupports m r ∧ (r=1 ∨ PairNormalized m inv s) := by
    by_cases hr1 : r=1
    · refine ⟨?_,Or.inl hr1⟩
      simpa only [coveredSupports,hr1,ite_true] using hs
    · have hnorm : s∈normalizedSupports m r inv := by
        simpa only [coveredSupports,ite_eq_right hr1] using hs
      exact ⟨(Finset.mem_filter.mp hnorm).1,Or.inr (Finset.mem_filter.mp hnorm).2⟩
  have hfast : s∈fastBoundedSupports m r := by
    rw [fastBoundedSupports_eq hm hr]
    exact hsplit.1
  let bucket : Fin chunks := ⟨supportBucket chunks s,Nat.mod_lt _ hchunks⟩
  exact (of_decide_eq_true (hcheck bucket)) s hfast rfl hsplit.2

end Loneliness.Modular.FourSpeed
