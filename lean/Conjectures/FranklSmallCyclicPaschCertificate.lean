module

public import Conjectures.FranklFCBitCode
public import Conjectures.FranklFC
public import Conjectures.FranklShareFlowPointwise
public import Conjectures.FranklFCFiniteDomain

@[expose] public section

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Frankl.FC.SmallCyclicPasch

/-! Proposed by generate_lean_fc_masks.py. The finite decoder, each
branch, and every integer share transfer are checked in Lean. -/

def ground : Finset ℕ := Finset.range 6
def weights (i : ℕ) : ℕ := ([1, 1, 1, 1, 1, 1] : List ℕ).getD i 0
def base : Finset (Finset ℕ) := {{0, 1, 2}, {0, 3, 4}, {0, 1, 2, 3, 4}, {2, 3, 5}, {0, 1, 2, 3, 5}, {1, 4, 5}, {0, 1, 2, 4, 5}, {0, 1, 3, 4, 5}, {0, 2, 3, 4, 5}, {1, 2, 3, 4, 5}, {0, 1, 2, 3, 4, 5}}
def codedBase : Finset ℕ := {7, 25, 31, 44, 47, 50, 55, 59, 61, 62, 63}
def codedShare (a : ℕ) : ℤ := share ground weights (BitCode.decode 6 a)

private def c0 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 31, 4⟩,
    ⟨0, 55, 2⟩,
    ⟨3, 25, 2⟩,
    ⟨4, 25, 2⟩,
    ⟨4, 47, 2⟩,
    ⟨5, 44, 2⟩,
    ⟨6, 44, 2⟩,
    ⟨8, 7, 2⟩,
    ⟨8, 50, 2⟩,
    ⟨9, 50, 2⟩,
    ⟨10, 55, 2⟩,
    ⟨12, 50, 2⟩,
    ⟨16, 7, 2⟩,
    ⟨16, 44, 2⟩,
    ⟨17, 44, 2⟩,
    ⟨18, 44, 2⟩,
    ⟨20, 47, 2⟩,
    ⟨24, 47, 2⟩,
    ⟨32, 7, 2⟩,
    ⟨32, 25, 2⟩,
    ⟨33, 50, 2⟩,
    ⟨34, 25, 2⟩,
    ⟨36, 25, 2⟩,
    ⟨40, 7, 2⟩,
    ⟨48, 7, 2⟩]
private def c1 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 61, 4⟩,
    ⟨3, 50, 2⟩,
    ⟨5, 25, 2⟩,
    ⟨6, 50, 2⟩,
    ⟨8, 7, 2⟩,
    ⟨8, 50, 2⟩,
    ⟨9, 44, 2⟩,
    ⟨16, 7, 2⟩,
    ⟨16, 44, 2⟩,
    ⟨32, 7, 2⟩,
    ⟨32, 25, 2⟩]
private def c2 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 50, 2⟩,
    ⟨5, 44, 2⟩,
    ⟨8, 7, 2⟩,
    ⟨8, 50, 2⟩,
    ⟨16, 7, 2⟩,
    ⟨16, 44, 2⟩,
    ⟨24, 6, 2⟩,
    ⟨32, 7, 2⟩,
    ⟨32, 25, 2⟩]
private def c3 : ShareFlow.Certificate ℕ :=
  .split 4 c1 c2
private def c4 : ShareFlow.Certificate ℕ :=
  .split 2 c0 c3
private def c5 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 62, 4⟩,
    ⟨3, 25, 2⟩,
    ⟨5, 25, 2⟩,
    ⟨6, 44, 2⟩,
    ⟨8, 7, 2⟩,
    ⟨8, 50, 2⟩,
    ⟨16, 7, 2⟩,
    ⟨16, 44, 2⟩,
    ⟨20, 50, 2⟩,
    ⟨32, 7, 2⟩,
    ⟨32, 25, 2⟩]
private def c6 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 25, 2⟩,
    ⟨6, 44, 2⟩,
    ⟨8, 7, 2⟩,
    ⟨8, 50, 2⟩,
    ⟨16, 7, 2⟩,
    ⟨16, 44, 2⟩,
    ⟨32, 7, 2⟩,
    ⟨32, 25, 2⟩,
    ⟨48, 5, 2⟩]
private def c7 : ShareFlow.Certificate ℕ :=
  .split 4 c5 c6
private def c8 : ShareFlow.Certificate ℕ :=
  .leaf [⟨4, 25, 2⟩,
    ⟨4, 50, 2⟩,
    ⟨9, 7, 2⟩,
    ⟨10, 50, 2⟩,
    ⟨16, 7, 2⟩,
    ⟨16, 44, 2⟩,
    ⟨32, 7, 2⟩,
    ⟨32, 25, 2⟩,
    ⟨40, 3, 2⟩]
private def c9 : ShareFlow.Certificate ℕ :=
  .leaf [⟨5, 25, 2⟩,
    ⟨6, 50, 2⟩,
    ⟨16, 7, 2⟩,
    ⟨16, 44, 2⟩,
    ⟨20, 10, 2⟩,
    ⟨32, 7, 2⟩,
    ⟨32, 25, 2⟩,
    ⟨33, 10, 2⟩]
private def c10 : ShareFlow.Certificate ℕ :=
  .leaf [⟨16, 7, 2⟩,
    ⟨16, 44, 2⟩,
    ⟨18, 12, 2⟩,
    ⟨32, 7, 2⟩,
    ⟨32, 25, 2⟩,
    ⟨33, 10, 2⟩,
    ⟨48, 5, 2⟩]
private def c11 : ShareFlow.Certificate ℕ :=
  .split 4 c9 c10
private def c12 : ShareFlow.Certificate ℕ :=
  .split 8 c8 c11
private def c13 : ShareFlow.Certificate ℕ :=
  .split 2 c7 c12
private def c14 : ShareFlow.Certificate ℕ :=
  .split 1 c4 c13

private theorem checked0 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare (∅) ({1, 2}) c0 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked1 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 27, 31, 46, 47, 50, 55, 59, 62, 63}) ({1, 4}) c1 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked2 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 27, 29, 31, 44, 46, 47, 50, 54, 55, 59, 61, 62, 63}) ({1}) c2 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked3 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 27, 31, 46, 47, 50, 55, 59, 62, 63}) ({1}) c3 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({1} : Finset ℕ) = {1, 4} := by decide +kernel
    rw [he]
    exact checked1
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 27, 31, 46, 47, 50, 55, 59, 62, 63}) 4 = {2, 4, 6, 7, 27, 29, 31, 44, 46, 47, 50, 54, 55, 59, 61, 62, 63} := by decide +kernel
    rw [hf]
    exact checked2
private theorem checked4 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare (∅) ({1}) c4 = true := by
  apply ShareFlow.check_split
  · have he : insert 2 ({1} : Finset ℕ) = {1, 2} := by decide +kernel
    rw [he]
    exact checked0
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase (∅) 2 = {2, 7, 27, 31, 46, 47, 50, 55, 59, 62, 63} := by decide +kernel
    rw [hf]
    exact checked3
private theorem checked5 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 7, 25, 31, 45, 47, 51, 55, 59, 61, 63}) ({2, 4}) c5 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked6 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 4, 5, 7, 25, 29, 31, 44, 45, 47, 51, 54, 55, 59, 61, 62, 63}) ({2}) c6 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked7 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 7, 25, 31, 45, 47, 51, 55, 59, 61, 63}) ({2}) c7 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({2} : Finset ℕ) = {2, 4} := by decide +kernel
    rw [he]
    exact checked5
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({1, 7, 25, 31, 45, 47, 51, 55, 59, 61, 63}) 4 = {1, 4, 5, 7, 25, 29, 31, 44, 45, 47, 51, 54, 55, 59, 61, 62, 63} := by decide +kernel
    rw [hf]
    exact checked6
private theorem checked8 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 2, 3, 7, 25, 27, 31, 45, 46, 47, 50, 51, 55, 59, 61, 62, 63}) ({8}) c8 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked9 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 2, 3, 7, 8, 9, 10, 11, 15, 25, 27, 31, 44, 45, 46, 47, 50, 51, 55, 58, 59, 61, 62, 63}) ({4}) c9 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked10 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 25, 27, 29, 31, 44, 45, 46, 47, 50, 51, 54, 55, 58, 59, 61, 62, 63}) (∅) c10 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked11 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 2, 3, 7, 8, 9, 10, 11, 15, 25, 27, 31, 44, 45, 46, 47, 50, 51, 55, 58, 59, 61, 62, 63}) (∅) c11 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 (∅ : Finset ℕ) = {4} := by decide +kernel
    rw [he]
    exact checked9
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({1, 2, 3, 7, 8, 9, 10, 11, 15, 25, 27, 31, 44, 45, 46, 47, 50, 51, 55, 58, 59, 61, 62, 63}) 4 = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 25, 27, 29, 31, 44, 45, 46, 47, 50, 51, 54, 55, 58, 59, 61, 62, 63} := by decide +kernel
    rw [hf]
    exact checked10
private theorem checked12 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 2, 3, 7, 25, 27, 31, 45, 46, 47, 50, 51, 55, 59, 61, 62, 63}) (∅) c12 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 (∅ : Finset ℕ) = {8} := by decide +kernel
    rw [he]
    exact checked8
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({1, 2, 3, 7, 25, 27, 31, 45, 46, 47, 50, 51, 55, 59, 61, 62, 63}) 8 = {1, 2, 3, 7, 8, 9, 10, 11, 15, 25, 27, 31, 44, 45, 46, 47, 50, 51, 55, 58, 59, 61, 62, 63} := by decide +kernel
    rw [hf]
    exact checked11
private theorem checked13 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 7, 25, 31, 45, 47, 51, 55, 59, 61, 63}) (∅) c13 = true := by
  apply ShareFlow.check_split
  · have he : insert 2 (∅ : Finset ℕ) = {2} := by decide +kernel
    rw [he]
    exact checked7
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({1, 7, 25, 31, 45, 47, 51, 55, 59, 61, 63}) 2 = {1, 2, 3, 7, 25, 27, 31, 45, 46, 47, 50, 51, 55, 59, 61, 62, 63} := by decide +kernel
    rw [hf]
    exact checked12
private theorem checked14 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare (∅) (∅) c14 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 (∅ : Finset ℕ) = {1} := by decide +kernel
    rw [he]
    exact checked4
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase (∅) 1 = {1, 7, 25, 31, 45, 47, 51, 55, 59, 61, 63} := by decide +kernel
    rw [hf]
    exact checked13

@[no_expose] def certificate : ShareFlow.Certificate ℕ := c14

theorem checked :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ∅ ∅ certificate = true := by
  exact checked14

theorem coded_extension_share_nonnegative {family : Finset ℕ}
    (hc : ShareSearch.ClosedFor (fun a b : ℕ => a ||| b) codedBase family)
    (hd : family ⊆ (BitCode.domain 6)) :
    0 ≤ ∑ a ∈ family, codedShare a :=
  ShareFlow.certificate_nonnegative certificate checked hc hd

theorem extension_share_nonnegative {family : Finset (Finset ℕ)}
    (hc : ShareSearch.ClosedFor (fun A B => A ∪ B) base family)
    (hd : family ⊆ ground.powerset) :
    0 ≤ ∑ S ∈ family, share ground weights S := by
  exact extension_shares_of_finite_domain_certificate
    (D := BitCode.domain 6) (decode := BitCode.decode 6)
    (join := (fun a b : ℕ => a ||| b)) (codedBase := codedBase)
    (W := ground) (base := base) (w := weights) (codedShare := codedShare)
    (BitCode.decode_injOn 6) (BitCode.image_domain 6)
    (fun _ ha _ hb => BitCode.or_mem_domain ha hb)
    (fun a _ b _ => BitCode.decode_or 6 a b)
    (by decide +kernel) (by decide +kernel) (fun _ _ => rfl)
    certificate checked family hd hc

theorem abundant {family : Finset (Finset ℕ)}
    (hu : UnionClosed family) (hb : base ⊆ family) :
    ∃ x ∈ ground, 0 < weights x ∧ Abundant family x := by
  apply abundant_of_extension_shares hu hb (by decide +kernel)
    (by refine ⟨0, ?_, ?_⟩ <;> decide +kernel)
  exact fun _ hd hc => extension_share_nonnegative hc hd

end Frankl.FC.SmallCyclicPasch
