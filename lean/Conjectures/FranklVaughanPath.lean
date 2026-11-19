module

public import Conjectures.FranklFCBitCode
public import Conjectures.FranklFC
public import Conjectures.FranklShareFlowPointwise
public import Conjectures.FranklFCFiniteDomain

@[expose] public section

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Frankl.FC.VaughanPath

/-! Proposed by generate_lean_fc_masks.py. The finite decoder, each
branch, and every integer share transfer are checked in Lean. -/

def ground : Finset ℕ := Finset.range 5
def weights (i : ℕ) : ℕ := ([6, 3, 5, 5, 3] : List ℕ).getD i 0
def base : Finset (Finset ℕ) := {{0, 1, 2}, {0, 2, 3}, {0, 1, 2, 3}, {0, 3, 4}, {0, 2, 3, 4}, {0, 1, 2, 3, 4}}
def codedBase : Finset ℕ := {7, 13, 15, 25, 29, 31}
def codedShare (a : ℕ) : ℤ := share ground weights (BitCode.decode 5 a)

private def c0 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 6⟩,
    ⟨0, 13, 10⟩,
    ⟨0, 15, 6⟩,
    ⟨1, 15, 10⟩,
    ⟨3, 25, 4⟩,
    ⟨4, 25, 12⟩,
    ⟨6, 25, 6⟩,
    ⟨8, 25, 6⟩,
    ⟨8, 29, 4⟩,
    ⟨8, 31, 2⟩,
    ⟨10, 25, 6⟩,
    ⟨12, 31, 2⟩,
    ⟨17, 7, 4⟩,
    ⟨18, 7, 8⟩,
    ⟨18, 25, 2⟩,
    ⟨20, 15, 6⟩,
    ⟨24, 7, 6⟩]
private def c1 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 6⟩,
    ⟨0, 13, 10⟩,
    ⟨0, 15, 6⟩,
    ⟨1, 15, 10⟩,
    ⟨3, 25, 2⟩,
    ⟨3, 16, 2⟩,
    ⟨10, 25, 6⟩,
    ⟨12, 16, 2⟩,
    ⟨18, 25, 4⟩]
private def c2 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 20, 6⟩,
    ⟨3, 25, 2⟩,
    ⟨3, 16, 2⟩,
    ⟨8, 20, 4⟩,
    ⟨10, 4, 4⟩,
    ⟨10, 20, 2⟩,
    ⟨18, 25, 10⟩]
private def c3 : ShareFlow.Certificate ℕ :=
  .split 4 c1 c2
private def c4 : ShareFlow.Certificate ℕ :=
  .split 16 c0 c3
private def c5 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 13, 10⟩,
    ⟨0, 25, 6⟩,
    ⟨0, 29, 6⟩,
    ⟨12, 2, 2⟩,
    ⟨16, 7, 12⟩,
    ⟨16, 13, 4⟩,
    ⟨17, 13, 2⟩,
    ⟨17, 2, 2⟩,
    ⟨20, 13, 4⟩]
private def c6 : ShareFlow.Certificate ℕ :=
  .leaf [⟨10, 1, 6⟩,
    ⟨12, 2, 2⟩,
    ⟨16, 7, 12⟩,
    ⟨16, 3, 2⟩,
    ⟨20, 1, 6⟩]
private def c7 : ShareFlow.Certificate ℕ :=
  .split 1 c5 c6
private def c8 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 10, 6⟩,
    ⟨6, 8, 4⟩,
    ⟨17, 7, 2⟩,
    ⟨17, 2, 2⟩,
    ⟨18, 7, 10⟩,
    ⟨20, 8, 4⟩,
    ⟨20, 10, 2⟩]
private def c9 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 10, 6⟩,
    ⟨1, 18, 2⟩,
    ⟨6, 8, 4⟩,
    ⟨6, 24, 2⟩,
    ⟨12, 16, 2⟩,
    ⟨20, 8, 2⟩,
    ⟨20, 10, 4⟩]
private def c10 : ShareFlow.Certificate ℕ :=
  .split 16 c8 c9
private def c11 : ShareFlow.Certificate ℕ :=
  .split 8 c7 c10
private def c12 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 25, 6⟩,
    ⟨10, 4, 4⟩,
    ⟨17, 2, 2⟩,
    ⟨17, 4, 2⟩,
    ⟨18, 7, 10⟩,
    ⟨20, 7, 2⟩,
    ⟨24, 4, 4⟩,
    ⟨24, 6, 2⟩]
private def c13 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 10, 6⟩,
    ⟨17, 7, 4⟩,
    ⟨18, 7, 8⟩,
    ⟨18, 12, 2⟩,
    ⟨20, 8, 4⟩,
    ⟨20, 10, 2⟩,
    ⟨24, 6, 6⟩]
private def c14 : ShareFlow.Certificate ℕ :=
  .split 8 c12 c13
private def c15 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 18, 2⟩,
    ⟨1, 20, 6⟩,
    ⟨10, 4, 4⟩,
    ⟨10, 20, 2⟩,
    ⟨12, 16, 2⟩,
    ⟨24, 4, 2⟩,
    ⟨24, 6, 4⟩]
private def c16 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 10, 6⟩,
    ⟨1, 18, 2⟩,
    ⟨1, 20, 2⟩,
    ⟨17, 4, 4⟩]
private def c17 : ShareFlow.Certificate ℕ :=
  .split 8 c15 c16
private def c18 : ShareFlow.Certificate ℕ :=
  .split 16 c14 c17
private def c19 : ShareFlow.Certificate ℕ :=
  .split 4 c11 c18
private def c20 : ShareFlow.Certificate ℕ :=
  .split 2 c4 c19

private theorem checked0 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare (∅) ({2, 16}) c0 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked1 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({16, 23, 25, 29, 31}) ({2, 4}) c1 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked2 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({4, 7, 13, 15, 16, 20, 23, 25, 29, 31}) ({2}) c2 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked3 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({16, 23, 25, 29, 31}) ({2}) c3 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({2} : Finset ℕ) = {2, 4} := by decide +kernel
    rw [he]
    exact checked1
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({16, 23, 25, 29, 31}) 4 = {4, 7, 13, 15, 16, 20, 23, 25, 29, 31} := by decide +kernel
    rw [hf]
    exact checked2
private theorem checked4 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare (∅) ({2}) c4 = true := by
  apply ShareFlow.check_split
  · have he : insert 16 ({2} : Finset ℕ) = {2, 16} := by decide +kernel
    rw [he]
    exact checked0
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase (∅) 16 = {16, 23, 25, 29, 31} := by decide +kernel
    rw [hf]
    exact checked3
private theorem checked5 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 7, 15, 27, 31}) ({1, 4, 8}) c5 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked6 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({1, 2, 3, 7, 13, 15, 25, 27, 29, 31}) ({4, 8}) c6 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked7 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 7, 15, 27, 31}) ({4, 8}) c7 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 ({4, 8} : Finset ℕ) = {1, 4, 8} := by decide +kernel
    rw [he]
    exact checked5
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 15, 27, 31}) 1 = {1, 2, 3, 7, 13, 15, 25, 27, 29, 31} := by decide +kernel
    rw [hf]
    exact checked6
private theorem checked8 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 7, 8, 10, 13, 15, 25, 27, 29, 31}) ({4, 16}) c8 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked9 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 25, 26, 27, 29, 31}) ({4}) c9 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked10 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 7, 8, 10, 13, 15, 25, 27, 29, 31}) ({4}) c10 = true := by
  apply ShareFlow.check_split
  · have he : insert 16 ({4} : Finset ℕ) = {4, 16} := by decide +kernel
    rw [he]
    exact checked8
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 8, 10, 13, 15, 25, 27, 29, 31}) 16 = {2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 25, 26, 27, 29, 31} := by decide +kernel
    rw [hf]
    exact checked9
private theorem checked11 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 7, 15, 27, 31}) ({4}) c11 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 ({4} : Finset ℕ) = {4, 8} := by decide +kernel
    rw [he]
    exact checked7
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 15, 27, 31}) 8 = {2, 7, 8, 10, 13, 15, 25, 27, 29, 31} := by decide +kernel
    rw [hf]
    exact checked10
private theorem checked12 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 4, 6, 7, 13, 15, 27, 29, 31}) ({8, 16}) c12 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked13 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 4, 6, 7, 8, 10, 12, 13, 14, 15, 25, 27, 29, 31}) ({16}) c13 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked14 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 4, 6, 7, 13, 15, 27, 29, 31}) ({16}) c14 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 ({16} : Finset ℕ) = {8, 16} := by decide +kernel
    rw [he]
    exact checked12
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 4, 6, 7, 13, 15, 27, 29, 31}) 8 = {2, 4, 6, 7, 8, 10, 12, 13, 14, 15, 25, 27, 29, 31} := by decide +kernel
    rw [hf]
    exact checked13
private theorem checked15 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 4, 6, 7, 13, 15, 16, 18, 20, 22, 23, 25, 27, 29, 31}) ({8}) c15 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked16 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 4, 6, 7, 8, 10, 12, 13, 14, 15, 16, 18, 20, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31}) (∅) c16 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked17 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 4, 6, 7, 13, 15, 16, 18, 20, 22, 23, 25, 27, 29, 31}) (∅) c17 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 (∅ : Finset ℕ) = {8} := by decide +kernel
    rw [he]
    exact checked15
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 4, 6, 7, 13, 15, 16, 18, 20, 22, 23, 25, 27, 29, 31}) 8 = {2, 4, 6, 7, 8, 10, 12, 13, 14, 15, 16, 18, 20, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31} := by decide +kernel
    rw [hf]
    exact checked16
private theorem checked18 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 4, 6, 7, 13, 15, 27, 29, 31}) (∅) c18 = true := by
  apply ShareFlow.check_split
  · have he : insert 16 (∅ : Finset ℕ) = {16} := by decide +kernel
    rw [he]
    exact checked14
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 4, 6, 7, 13, 15, 27, 29, 31}) 16 = {2, 4, 6, 7, 13, 15, 16, 18, 20, 22, 23, 25, 27, 29, 31} := by decide +kernel
    rw [hf]
    exact checked17
private theorem checked19 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 7, 15, 27, 31}) (∅) c19 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 (∅ : Finset ℕ) = {4} := by decide +kernel
    rw [he]
    exact checked11
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 15, 27, 31}) 4 = {2, 4, 6, 7, 13, 15, 27, 29, 31} := by decide +kernel
    rw [hf]
    exact checked18
private theorem checked20 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare (∅) (∅) c20 = true := by
  apply ShareFlow.check_split
  · have he : insert 2 (∅ : Finset ℕ) = {2} := by decide +kernel
    rw [he]
    exact checked4
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase (∅) 2 = {2, 7, 15, 27, 31} := by decide +kernel
    rw [hf]
    exact checked19

@[no_expose] def certificate : ShareFlow.Certificate ℕ := c20

theorem checked :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ∅ ∅ certificate = true := by
  exact checked20

theorem coded_extension_share_nonnegative {family : Finset ℕ}
    (hc : ShareSearch.ClosedFor (fun a b : ℕ => a ||| b) codedBase family)
    (hd : family ⊆ (BitCode.domain 5)) :
    0 ≤ ∑ a ∈ family, codedShare a :=
  ShareFlow.certificate_nonnegative certificate checked hc hd

theorem extension_share_nonnegative {family : Finset (Finset ℕ)}
    (hc : ShareSearch.ClosedFor (fun A B => A ∪ B) base family)
    (hd : family ⊆ ground.powerset) :
    0 ≤ ∑ S ∈ family, share ground weights S := by
  exact extension_shares_of_finite_domain_certificate
    (D := BitCode.domain 5) (decode := BitCode.decode 5)
    (join := (fun a b : ℕ => a ||| b)) (codedBase := codedBase)
    (W := ground) (base := base) (w := weights) (codedShare := codedShare)
    (BitCode.decode_injOn 5) (BitCode.image_domain 5)
    (fun _ ha _ hb => BitCode.or_mem_domain ha hb)
    (fun a _ b _ => BitCode.decode_or 5 a b)
    (by decide +kernel) (by decide +kernel) (fun _ _ => rfl)
    certificate checked family hd hc

theorem abundant {family : Finset (Finset ℕ)}
    (hu : UnionClosed family) (hb : base ⊆ family) :
    ∃ x ∈ ground, 0 < weights x ∧ Abundant family x := by
  apply abundant_of_extension_shares hu hb (by decide +kernel)
    (by refine ⟨0, ?_, ?_⟩ <;> decide +kernel)
  exact fun _ hd hc => extension_share_nonnegative hc hd

end Frankl.FC.VaughanPath
