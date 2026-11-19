module

public import Conjectures.FranklFCBitCode
public import Conjectures.FranklFC
public import Conjectures.FranklShareFlowPointwise
public import Conjectures.FranklFCFiniteDomain

@[expose] public section

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Frankl.FC.VaughanTriangle

/-! Proposed by generate_lean_fc_masks.py. The finite decoder, each
branch, and every integer share transfer are checked in Lean. -/

def ground : Finset ℕ := Finset.range 4
def weights (i : ℕ) : ℕ := ([1, 1, 1, 1] : List ℕ).getD i 0
def base : Finset (Finset ℕ) := {{0, 1, 2}, {0, 1, 3}, {0, 2, 3}, {0, 1, 2, 3}}
def codedBase : Finset ℕ := {7, 11, 13, 15}
def codedShare (a : ℕ) : ℤ := share ground weights (BitCode.decode 4 a)

private def c0 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 2⟩,
    ⟨0, 11, 2⟩,
    ⟨2, 13, 2⟩,
    ⟨4, 11, 2⟩,
    ⟨8, 13, 2⟩]
private def c1 : ShareFlow.Certificate ℕ :=
  .leaf []
private def c2 : ShareFlow.Certificate ℕ :=
  .leaf []
private def c3 : ShareFlow.Certificate ℕ :=
  .leaf [⟨8, 6, 2⟩]
private def c4 : ShareFlow.Certificate ℕ :=
  .split 4 c2 c3
private def c5 : ShareFlow.Certificate ℕ :=
  .split 2 c1 c4
private def c6 : ShareFlow.Certificate ℕ :=
  .split 1 c0 c5

private theorem checked0 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 4)
      codedShare (∅) ({1}) c0 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked1 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 4)
      codedShare ({1, 7, 11, 13, 15}) ({2}) c1 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked2 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 4)
      codedShare ({1, 2, 3, 7, 11, 13, 15}) ({4}) c2 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked3 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 4)
      codedShare ({1, 2, 3, 4, 5, 6, 7, 11, 13, 15}) (∅) c3 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked4 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 4)
      codedShare ({1, 2, 3, 7, 11, 13, 15}) (∅) c4 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 (∅ : Finset ℕ) = {4} := by decide +kernel
    rw [he]
    exact checked2
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({1, 2, 3, 7, 11, 13, 15}) 4 = {1, 2, 3, 4, 5, 6, 7, 11, 13, 15} := by decide +kernel
    rw [hf]
    exact checked3
private theorem checked5 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 4)
      codedShare ({1, 7, 11, 13, 15}) (∅) c5 = true := by
  apply ShareFlow.check_split
  · have he : insert 2 (∅ : Finset ℕ) = {2} := by decide +kernel
    rw [he]
    exact checked1
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({1, 7, 11, 13, 15}) 2 = {1, 2, 3, 7, 11, 13, 15} := by decide +kernel
    rw [hf]
    exact checked4
private theorem checked6 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 4)
      codedShare (∅) (∅) c6 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 (∅ : Finset ℕ) = {1} := by decide +kernel
    rw [he]
    exact checked0
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase (∅) 1 = {1, 7, 11, 13, 15} := by decide +kernel
    rw [hf]
    exact checked5

@[no_expose] def certificate : ShareFlow.Certificate ℕ := c6

theorem checked :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 4)
      codedShare ∅ ∅ certificate = true := by
  exact checked6

theorem coded_extension_share_nonnegative {family : Finset ℕ}
    (hc : ShareSearch.ClosedFor (fun a b : ℕ => a ||| b) codedBase family)
    (hd : family ⊆ (BitCode.domain 4)) :
    0 ≤ ∑ a ∈ family, codedShare a :=
  ShareFlow.certificate_nonnegative certificate checked hc hd

theorem extension_share_nonnegative {family : Finset (Finset ℕ)}
    (hc : ShareSearch.ClosedFor (fun A B => A ∪ B) base family)
    (hd : family ⊆ ground.powerset) :
    0 ≤ ∑ S ∈ family, share ground weights S := by
  exact extension_shares_of_finite_domain_certificate
    (D := BitCode.domain 4) (decode := BitCode.decode 4)
    (join := (fun a b : ℕ => a ||| b)) (codedBase := codedBase)
    (W := ground) (base := base) (w := weights) (codedShare := codedShare)
    (BitCode.decode_injOn 4) (BitCode.image_domain 4)
    (fun _ ha _ hb => BitCode.or_mem_domain ha hb)
    (fun a _ b _ => BitCode.decode_or 4 a b)
    (by decide +kernel) (by decide +kernel) (fun _ _ => rfl)
    certificate checked family hd hc

theorem abundant {family : Finset (Finset ℕ)}
    (hu : UnionClosed family) (hb : base ⊆ family) :
    ∃ x ∈ ground, 0 < weights x ∧ Abundant family x := by
  apply abundant_of_extension_shares hu hb (by decide +kernel)
    (by refine ⟨0, ?_, ?_⟩ <;> decide +kernel)
  exact fun _ hd hc => extension_share_nonnegative hc hd

end Frankl.FC.VaughanTriangle
