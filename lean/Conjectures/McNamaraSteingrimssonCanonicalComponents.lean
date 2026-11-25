module

public import Conjectures.McNamaraSteingrimssonBlockCuts

@[expose] public section
namespace McNamaraSteingrimsson

/-- Canonical components are the nonempty intervals bounded by
consecutive sum cuts of the actual permutation. -/
def CanonicalComponent {d : ℕ} (p : Equiv.Perm (Fin d)) (a b : ℕ) : Prop :=
  CanonicalCut p a ∧ CanonicalCut p b ∧ a<b ∧
    ∀ k : ℕ, a<k → k<b → ¬CanonicalCut p k

theorem canonicalComponent_full_firstMax_block {s B : ℕ} {w : Fin s→ℕ}
    (hB : ∀ i,w i≤B) (p : BlockOrder w) (i : Fin s) (hw : 0<w i)
    (hp : BeginsWithMaximum (p i)) :
    CanonicalComponent (blockPermutation hB p) (blockOffset w i) (blockOffset w i+w i) :=
  ⟨canonicalCut_blockOffset hB p i,canonicalCut_blockEnd hB p i,
    Nat.lt_add_of_pos_right hw,fun _ h1 h2 => not_canonicalCut_inside_firstMax_block hB p hp h1 h2⟩

/-- A full-length canonical component in a block product of uniformly
bounded width must coincide with a full-width host block. In particular,
no proper fragment of a shorter exceptional block can confuse the
record of the full long summands. -/
theorem canonicalComponent_width_max {s B : ℕ} {w : Fin s→ℕ}
    (hB : ∀ i,w i≤B) (p : BlockOrder w) {a : ℕ}
    (h : CanonicalComponent (blockPermutation hB p) a (a+B)) :
    ∃ i : Fin s, w i=B ∧ blockOffset w i=a := by
  have hbound := h.2.1.1
  have hlt := h.2.2.1
  have ha : a<Fintype.card (BlockPosition w) := hlt.trans_le hbound
  obtain ⟨x,hx⟩ := blockOffsetCode_surjective hB ⟨a,ha⟩
  have he : blockOffset w x.fst+x.snd.val=a := congrArg Fin.val hx
  have hstart : blockOffset w x.fst≤a := by omega
  have hend : a<blockOffset w x.fst+w x.fst := by
    have hn := x.snd.isLt
    omega
  have hreach : a+B≤blockOffset w x.fst+w x.fst := by
    by_contra! H
    exact h.2.2.2 _ hend H (canonicalCut_blockEnd hB p x.fst)
  refine ⟨x.fst,?_,?_⟩
  · have Hw := hB x.fst
    omega
  · have Hw := hB x.fst
    omega

end McNamaraSteingrimsson
