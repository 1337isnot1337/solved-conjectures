import Conjectures.BinaryProjection
import Conjectures.CutPeriodPiles

/-! The lower-value relation needed for the universal mex certificate. -/
namespace CutPeriod
open BinaryAutomata
namespace Lower

def graphState (s : Fin 81) : Fin 27 := Fin.ofNat 27 (s.val/3)
def orderState (s : Fin 81) : Fin 3 := Fin.ofNat 3 (s.val%3)
def pack (a : Fin 27) (b : Fin 3) : Fin 81 := Fin.ofNat 81 (a.val*3+b.val)

def encoding : PairEncoding 27 3 81 := {
  left := graphState, right := orderState, pack := pack
  left_pack := by
    intro a b
    apply Fin.ext
    have ha := a.isLt
    have hb := b.isLt
    simp only [graphState,pack,Fin.val_ofNat]
    omega
  right_pack := by
    intro a b
    apply Fin.ext
    have ha := a.isLt
    have hb := b.isLt
    simp only [orderState,pack,Fin.val_ofNat,Nat.mod_mod]
    omega
  pack_parts := by
    intro s
    apply Fin.ext
    have hs := s.isLt
    simp only [graphState,orderState,pack,Fin.val_ofNat,Nat.mod_mod]
    omega
}

def semantic : NFA 81 := projectionMachine encoding GraphCertificate.machine

/-- Exact lower-value semantics for every binary word, with complete padding
of the hidden candidate-value track. -/
theorem correct (w : List Digit) : semantic.accepts w=true ↔
    0<decodeHigh sizeBit w ∧ decodeHigh valueBit w<value (decodeHigh sizeBit w) := by
  unfold semantic
  rw [projection_accepts_iff]
  constructor
  · rintro ⟨cols,hout,hhidden,hsizes,hgt⟩
    obtain ⟨hn,hvalue⟩ := (GraphCertificate.correct _).mp hhidden
    change 0<leftSize cols at hn
    change leftValue cols=value (leftSize cols) at hvalue
    subst w
    change 0<outSize cols ∧ outValue cols<value (outSize cols)
    rw [←hsizes]
    exact ⟨hn,by rw [←hvalue]; exact hgt⟩
  · rintro ⟨hn,hlt⟩
    have hwidth := decodeHigh_bound sizeBit sizeBit_bound w
    have hbound := value_le_size (decodeHigh sizeBit w)
    have hvwidth : value (decodeHigh sizeBit w)<2^w.length := by omega
    let hidden := encodeHigh w.length (decodeHigh sizeBit w) (value (decodeHigh sizeBit w))
    obtain ⟨hN,hG⟩ := encodeHigh_correct w.length (decodeHigh sizeBit w)
      (value (decodeHigh sizeBit w)) hwidth hvwidth
    change decodeHigh sizeBit hidden=decodeHigh sizeBit w at hN
    change decodeHigh valueBit hidden=value (decodeHigh sizeBit w) at hG
    have hhidden : GraphCertificate.machine.accepts hidden=true := by
      apply (GraphCertificate.correct _).mpr
      rw [hN,hG]
      exact ⟨hn,rfl⟩
    obtain ⟨cols,hl,hr,ho⟩ := columns_of_words hidden w w (encodeHigh_length _ _ _) rfl
    refine ⟨cols,ho,by rw [hl]; exact hhidden,?_,?_⟩
    · change decodeHigh sizeBit (cols.map Column.left)=decodeHigh sizeBit (cols.map Column.out)
      rw [hl,ho,hN]
    · change decodeHigh valueBit (cols.map Column.out)<decodeHigh valueBit (cols.map Column.left)
      rw [hl,ho,hG]
      exact hlt

#print axioms correct
end Lower
end CutPeriod
