module

public import Conjectures.FranklFCBitCode
public import Conjectures.FranklFC
public import Conjectures.FranklShareFlowPointwise
public import Conjectures.FranklFCFiniteDomain

@[expose] public section

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Frankl.FC.VaughanStar

/-! Proposed by generate_lean_fc_masks.py. The finite decoder, each
branch, and every integer share transfer are checked in Lean. -/

def ground : Finset ℕ := Finset.range 5
def weights (i : ℕ) : ℕ := ([3, 3, 2, 2, 2] : List ℕ).getD i 0
def base : Finset (Finset ℕ) := {{0, 1, 2}, {0, 1, 3}, {0, 1, 2, 3}, {0, 1, 4}, {0, 1, 2, 4}, {0, 1, 3, 4}, {0, 1, 2, 3, 4}}
def codedBase : Finset ℕ := {7, 11, 15, 19, 23, 27, 31}
def codedShare (a : ℕ) : ℤ := share ground weights (BitCode.decode 5 a)

private def c0 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 4⟩,
    ⟨0, 11, 4⟩,
    ⟨0, 15, 4⟩,
    ⟨1, 15, 4⟩,
    ⟨1, 19, 2⟩,
    ⟨2, 19, 2⟩,
    ⟨2, 23, 4⟩,
    ⟨5, 19, 2⟩,
    ⟨6, 19, 2⟩,
    ⟨9, 19, 2⟩,
    ⟨10, 19, 2⟩,
    ⟨12, 19, 4⟩,
    ⟨17, 11, 2⟩,
    ⟨18, 11, 2⟩,
    ⟨20, 11, 4⟩,
    ⟨24, 7, 4⟩]
private def c1 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 4⟩,
    ⟨0, 11, 4⟩,
    ⟨0, 15, 4⟩,
    ⟨1, 15, 4⟩,
    ⟨5, 16, 2⟩,
    ⟨6, 16, 2⟩,
    ⟨9, 16, 2⟩,
    ⟨10, 16, 2⟩]
private def c2 : ShareFlow.Certificate ℕ :=
  .split 16 c0 c1
private def c3 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 4⟩,
    ⟨0, 19, 4⟩,
    ⟨0, 23, 4⟩,
    ⟨1, 23, 4⟩,
    ⟨5, 8, 2⟩,
    ⟨6, 8, 2⟩,
    ⟨17, 8, 2⟩,
    ⟨18, 8, 2⟩]
private def c4 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 4⟩,
    ⟨5, 8, 2⟩,
    ⟨6, 8, 2⟩,
    ⟨9, 16, 2⟩,
    ⟨10, 16, 2⟩]
private def c5 : ShareFlow.Certificate ℕ :=
  .leaf [⟨5, 8, 2⟩,
    ⟨6, 8, 2⟩,
    ⟨9, 16, 2⟩,
    ⟨12, 18, 4⟩,
    ⟨20, 2, 2⟩,
    ⟨20, 10, 2⟩]
private def c6 : ShareFlow.Certificate ℕ :=
  .split 2 c4 c5
private def c7 : ShareFlow.Certificate ℕ :=
  .leaf [⟨2, 24, 2⟩,
    ⟨5, 8, 2⟩,
    ⟨6, 8, 2⟩,
    ⟨12, 17, 4⟩,
    ⟨20, 1, 2⟩,
    ⟨20, 9, 2⟩]
private def c8 : ShareFlow.Certificate ℕ :=
  .split 1 c6 c7
private def c9 : ShareFlow.Certificate ℕ :=
  .split 16 c3 c8
private def c10 : ShareFlow.Certificate ℕ :=
  .split 8 c2 c9
private def c11 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 11, 4⟩,
    ⟨0, 19, 4⟩,
    ⟨0, 27, 4⟩,
    ⟨1, 27, 4⟩,
    ⟨9, 4, 2⟩,
    ⟨10, 4, 2⟩,
    ⟨17, 4, 2⟩,
    ⟨18, 4, 2⟩]
private def c12 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 11, 4⟩,
    ⟨5, 16, 2⟩,
    ⟨6, 16, 2⟩,
    ⟨9, 4, 2⟩,
    ⟨10, 4, 2⟩]
private def c13 : ShareFlow.Certificate ℕ :=
  .leaf [⟨5, 16, 2⟩,
    ⟨9, 4, 2⟩,
    ⟨10, 4, 2⟩,
    ⟨12, 18, 4⟩,
    ⟨24, 2, 2⟩,
    ⟨24, 6, 2⟩]
private def c14 : ShareFlow.Certificate ℕ :=
  .split 2 c12 c13
private def c15 : ShareFlow.Certificate ℕ :=
  .leaf [⟨2, 20, 2⟩,
    ⟨9, 4, 2⟩,
    ⟨10, 4, 2⟩,
    ⟨12, 17, 4⟩,
    ⟨24, 1, 2⟩,
    ⟨24, 5, 2⟩]
private def c16 : ShareFlow.Certificate ℕ :=
  .split 1 c14 c15
private def c17 : ShareFlow.Certificate ℕ :=
  .split 16 c11 c16
private def c18 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 19, 4⟩,
    ⟨5, 8, 2⟩,
    ⟨6, 8, 2⟩,
    ⟨17, 4, 2⟩,
    ⟨18, 4, 2⟩]
private def c19 : ShareFlow.Certificate ℕ :=
  .leaf [⟨5, 8, 2⟩,
    ⟨17, 4, 2⟩,
    ⟨18, 4, 2⟩,
    ⟨20, 10, 4⟩,
    ⟨24, 2, 2⟩,
    ⟨24, 6, 2⟩]
private def c20 : ShareFlow.Certificate ℕ :=
  .split 2 c18 c19
private def c21 : ShareFlow.Certificate ℕ :=
  .leaf [⟨2, 12, 2⟩,
    ⟨17, 4, 2⟩,
    ⟨18, 4, 2⟩,
    ⟨20, 9, 4⟩,
    ⟨24, 1, 2⟩,
    ⟨24, 5, 2⟩]
private def c22 : ShareFlow.Certificate ℕ :=
  .split 1 c20 c21
private def c23 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 12, 2⟩,
    ⟨1, 20, 2⟩,
    ⟨1, 24, 2⟩,
    ⟨2, 12, 2⟩,
    ⟨2, 20, 2⟩,
    ⟨2, 24, 2⟩,
    ⟨5, 24, 2⟩,
    ⟨6, 24, 2⟩,
    ⟨9, 20, 2⟩,
    ⟨10, 20, 2⟩,
    ⟨17, 12, 2⟩,
    ⟨18, 12, 2⟩]
private def c24 : ShareFlow.Certificate ℕ :=
  .split 16 c22 c23
private def c25 : ShareFlow.Certificate ℕ :=
  .split 8 c17 c24
private def c26 : ShareFlow.Certificate ℕ :=
  .split 4 c10 c25

private theorem checked0 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare (∅) ({4, 8, 16}) c0 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked1 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({16, 19, 23, 27, 31}) ({4, 8}) c1 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked2 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare (∅) ({4, 8}) c2 = true := by
  apply ShareFlow.check_split
  · have he : insert 16 ({4, 8} : Finset ℕ) = {4, 8, 16} := by decide +kernel
    rw [he]
    exact checked0
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase (∅) 16 = {16, 19, 23, 27, 31} := by decide +kernel
    rw [hf]
    exact checked1
private theorem checked3 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({8, 11, 15, 27, 31}) ({4, 16}) c3 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked4 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({8, 11, 15, 16, 19, 23, 24, 27, 31}) ({1, 2, 4}) c4 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked5 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 7, 8, 10, 11, 15, 16, 18, 19, 23, 24, 26, 27, 31}) ({1, 4}) c5 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked6 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({8, 11, 15, 16, 19, 23, 24, 27, 31}) ({1, 4}) c6 = true := by
  apply ShareFlow.check_split
  · have he : insert 2 ({1, 4} : Finset ℕ) = {1, 2, 4} := by decide +kernel
    rw [he]
    exact checked4
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({8, 11, 15, 16, 19, 23, 24, 27, 31}) 2 = {2, 7, 8, 10, 11, 15, 16, 18, 19, 23, 24, 26, 27, 31} := by decide +kernel
    rw [hf]
    exact checked5
private theorem checked7 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({1, 7, 8, 9, 11, 15, 16, 17, 19, 23, 24, 25, 27, 31}) ({4}) c7 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked8 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({8, 11, 15, 16, 19, 23, 24, 27, 31}) ({4}) c8 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 ({4} : Finset ℕ) = {1, 4} := by decide +kernel
    rw [he]
    exact checked6
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({8, 11, 15, 16, 19, 23, 24, 27, 31}) 1 = {1, 7, 8, 9, 11, 15, 16, 17, 19, 23, 24, 25, 27, 31} := by decide +kernel
    rw [hf]
    exact checked7
private theorem checked9 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({8, 11, 15, 27, 31}) ({4}) c9 = true := by
  apply ShareFlow.check_split
  · have he : insert 16 ({4} : Finset ℕ) = {4, 16} := by decide +kernel
    rw [he]
    exact checked3
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({8, 11, 15, 27, 31}) 16 = {8, 11, 15, 16, 19, 23, 24, 27, 31} := by decide +kernel
    rw [hf]
    exact checked8
private theorem checked10 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare (∅) ({4}) c10 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 ({4} : Finset ℕ) = {4, 8} := by decide +kernel
    rw [he]
    exact checked2
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase (∅) 8 = {8, 11, 15, 27, 31} := by decide +kernel
    rw [hf]
    exact checked9
private theorem checked11 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({4, 7, 15, 23, 31}) ({8, 16}) c11 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked12 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({4, 7, 15, 16, 19, 20, 23, 27, 31}) ({1, 2, 8}) c12 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked13 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 4, 6, 7, 11, 15, 16, 18, 19, 20, 22, 23, 27, 31}) ({1, 8}) c13 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked14 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({4, 7, 15, 16, 19, 20, 23, 27, 31}) ({1, 8}) c14 = true := by
  apply ShareFlow.check_split
  · have he : insert 2 ({1, 8} : Finset ℕ) = {1, 2, 8} := by decide +kernel
    rw [he]
    exact checked12
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({4, 7, 15, 16, 19, 20, 23, 27, 31}) 2 = {2, 4, 6, 7, 11, 15, 16, 18, 19, 20, 22, 23, 27, 31} := by decide +kernel
    rw [hf]
    exact checked13
private theorem checked15 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({1, 4, 5, 7, 11, 15, 16, 17, 19, 20, 21, 23, 27, 31}) ({8}) c15 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked16 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({4, 7, 15, 16, 19, 20, 23, 27, 31}) ({8}) c16 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 ({8} : Finset ℕ) = {1, 8} := by decide +kernel
    rw [he]
    exact checked14
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({4, 7, 15, 16, 19, 20, 23, 27, 31}) 1 = {1, 4, 5, 7, 11, 15, 16, 17, 19, 20, 21, 23, 27, 31} := by decide +kernel
    rw [hf]
    exact checked15
private theorem checked17 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({4, 7, 15, 23, 31}) ({8}) c17 = true := by
  apply ShareFlow.check_split
  · have he : insert 16 ({8} : Finset ℕ) = {8, 16} := by decide +kernel
    rw [he]
    exact checked11
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({4, 7, 15, 23, 31}) 16 = {4, 7, 15, 16, 19, 20, 23, 27, 31} := by decide +kernel
    rw [hf]
    exact checked16
private theorem checked18 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({4, 7, 8, 11, 12, 15, 23, 27, 31}) ({1, 2, 16}) c18 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked19 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({2, 4, 6, 7, 8, 10, 11, 12, 14, 15, 19, 23, 27, 31}) ({1, 16}) c19 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked20 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({4, 7, 8, 11, 12, 15, 23, 27, 31}) ({1, 16}) c20 = true := by
  apply ShareFlow.check_split
  · have he : insert 2 ({1, 16} : Finset ℕ) = {1, 2, 16} := by decide +kernel
    rw [he]
    exact checked18
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({4, 7, 8, 11, 12, 15, 23, 27, 31}) 2 = {2, 4, 6, 7, 8, 10, 11, 12, 14, 15, 19, 23, 27, 31} := by decide +kernel
    rw [hf]
    exact checked19
private theorem checked21 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({1, 4, 5, 7, 8, 9, 11, 12, 13, 15, 19, 23, 27, 31}) ({16}) c21 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked22 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({4, 7, 8, 11, 12, 15, 23, 27, 31}) ({16}) c22 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 ({16} : Finset ℕ) = {1, 16} := by decide +kernel
    rw [he]
    exact checked20
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({4, 7, 8, 11, 12, 15, 23, 27, 31}) 1 = {1, 4, 5, 7, 8, 9, 11, 12, 13, 15, 19, 23, 27, 31} := by decide +kernel
    rw [hf]
    exact checked21
private theorem checked23 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({4, 7, 8, 11, 12, 15, 16, 19, 20, 23, 24, 27, 28, 31}) (∅) c23 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked24 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({4, 7, 8, 11, 12, 15, 23, 27, 31}) (∅) c24 = true := by
  apply ShareFlow.check_split
  · have he : insert 16 (∅ : Finset ℕ) = {16} := by decide +kernel
    rw [he]
    exact checked22
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({4, 7, 8, 11, 12, 15, 23, 27, 31}) 16 = {4, 7, 8, 11, 12, 15, 16, 19, 20, 23, 24, 27, 28, 31} := by decide +kernel
    rw [hf]
    exact checked23
private theorem checked25 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ({4, 7, 15, 23, 31}) (∅) c25 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 (∅ : Finset ℕ) = {8} := by decide +kernel
    rw [he]
    exact checked17
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({4, 7, 15, 23, 31}) 8 = {4, 7, 8, 11, 12, 15, 23, 27, 31} := by decide +kernel
    rw [hf]
    exact checked24
private theorem checked26 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare (∅) (∅) c26 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 (∅ : Finset ℕ) = {4} := by decide +kernel
    rw [he]
    exact checked10
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase (∅) 4 = {4, 7, 15, 23, 31} := by decide +kernel
    rw [hf]
    exact checked25

@[no_expose] def certificate : ShareFlow.Certificate ℕ := c26

theorem checked :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 5)
      codedShare ∅ ∅ certificate = true := by
  exact checked26

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

end Frankl.FC.VaughanStar
