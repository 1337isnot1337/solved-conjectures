module

public import Conjectures.SobolewskiUlasExceptionPartitionModKernel
public import Conjectures.SobolewskiUlasExceptionClassificationInputs
public import Mathlib.Data.Bool.Basic

@[expose] public section
namespace SobolewskiUlasException

/-- The accept bits of the seven scanner states, read on the same input. -/
@[ext] structure ScannerBits where
  skipEven : Bool
  skipOdd : Bool
  middle : Bool
  offset : Bool
  parityTrue : Bool
  parityFalse : Bool
  dead : Bool
  deriving DecidableEq

def scannerBit (p : Phase) (n : ℕ) : Bool :=
  decide (scan p (Nat.digits 2 n) = Phase.parity false)

def scannerBits (n : ℕ) : ScannerBits :=
  ⟨scannerBit .skipEven n,scannerBit .skipOdd n,scannerBit .middle n,scannerBit .offset n,
    scannerBit (.parity true) n,scannerBit (.parity false) n,scannerBit .dead n⟩

def ScannerBits.even (s : ScannerBits) : ScannerBits :=
  ⟨s.skipOdd,s.skipEven,s.offset,s.parityTrue,s.parityTrue,s.parityFalse,s.dead⟩

def ScannerBits.odd (s : ScannerBits) : ScannerBits :=
  ⟨s.middle,s.dead,s.dead,s.parityFalse,s.parityFalse,s.parityTrue,s.dead⟩

theorem scannerBit_step (p : Phase) (n : ℕ) :
    scannerBit p n = scannerBit (scanStep p (n%2)) (n/2) := by
  unfold scannerBit
  apply Bool.decide_congr
  exact scan_digits_step p n

theorem scannerBits_even (n : ℕ) : scannerBits (2*n) = (scannerBits n).even := by
  have h (p : Phase) := scannerBit_step p (2*n)
  simp only [show (2*n)%2=0 by omega,show (2*n)/2=n by omega] at h
  have he := h .skipEven
  have ho := h .skipOdd
  have hm := h .middle
  have hf := h .offset
  have ht := h (.parity true)
  have hp := h (.parity false)
  have hd := h .dead
  apply ScannerBits.ext <;> simp_all [scannerBits,ScannerBits.even,scanStep]

theorem scannerBits_odd (n : ℕ) : scannerBits (2*n+1) = (scannerBits n).odd := by
  have h (p : Phase) := scannerBit_step p (2*n+1)
  simp only [show (2*n+1)%2=1 by omega,show (2*n+1)/2=n by omega] at h
  have he := h .skipEven
  have ho := h .skipOdd
  have hm := h .middle
  have hf := h .offset
  have ht := h (.parity true)
  have hp := h (.parity false)
  have hd := h .dead
  apply ScannerBits.ext <;> simp_all [scannerBits,ScannerBits.odd,scanStep]

def sourceIndicatorBit (n : ℕ) : Bool :=
  if n%2=0 then scannerBit .skipEven (n/2) else false

theorem sourceIndicatorBit_correct (n : ℕ) : sourceIndicatorBit n = true ↔ inSourceLayer n := by
  unfold sourceIndicatorBit scannerBit
  rw [inSourceLayer_iff_doubled]
  by_cases h : n%2=0
  · simp only [ite_eq_left h,decide_eq_true_eq]
    change accepted (scan .skipEven (Nat.digits 2 (n/2))) ↔ _
    rw [binary_scanner_correct]
    constructor
    · exact fun hp => ⟨n/2,hp,by omega⟩
    · rintro ⟨y,hy,he⟩
      rwa [show n/2=y by omega]
  · simp only [ite_eq_right h,Bool.false_eq_true,false_iff]
    rintro ⟨y,_,rfl⟩
    omega

@[ext] structure PartitionModState where
  x : ZMod 32
  y : ZMod 32
  z : ZMod 32
  scanBits : ScannerBits
  source : Bool
  positive : Bool
  deriving DecidableEq

def PartitionModState.even (s : PartitionModState) : PartitionModState :=
  ⟨-s.x+s.y,-3*s.y+s.z,4*s.y,s.scanBits.even,s.scanBits.skipEven,s.positive⟩

def PartitionModState.odd (s : PartitionModState) : PartitionModState :=
  ⟨s.y,-s.y+s.z,0,s.scanBits.odd,false,true⟩

noncomputable def partitionModState (n : ℕ) : PartitionModState :=
  ⟨partPrefix 1 n,2*partPrefix 2 n,8*partPrefix 3 n,scannerBits n,sourceIndicatorBit n,decide (0<n)⟩

theorem partitionModState_even (n : ℕ) :
    partitionModState (2*n) = (partitionModState n).even := by
  apply PartitionModState.ext
  · change partPrefix 1 (2*n) = -partPrefix 1 n + 2*partPrefix 2 n
    rw [(partPrefix_even_odd_one n).1]
    ring
  · change 2*partPrefix 2 (2*n) = -3*(2*partPrefix 2 n)+8*partPrefix 3 n
    rw [(partPrefix_even_odd_two n).1]
    ring
  · change 8*partPrefix 3 (2*n) = 4*(2*partPrefix 2 n)
    rw [(partPrefix_even_odd_three n).1]
    ring
  · exact scannerBits_even n
  · change sourceIndicatorBit (2*n) = scannerBit .skipEven n
    simp [sourceIndicatorBit]
  · change decide (0<2*n) = decide (0<n)
    exact Bool.decide_congr (by omega)

theorem partitionModState_odd (n : ℕ) :
    partitionModState (2*n+1) = (partitionModState n).odd := by
  apply PartitionModState.ext
  · exact (partPrefix_even_odd_one n).2
  · change 2*partPrefix 2 (2*n+1) = -(2*partPrefix 2 n)+8*partPrefix 3 n
    rw [(partPrefix_even_odd_two n).2]
    ring
  · exact (partPrefix_even_odd_three n).2
  · exact scannerBits_odd n
  · change sourceIndicatorBit (2*n+1) = false
    simp [sourceIndicatorBit]
  · change decide (0<2*n+1) = true
    simp

end SobolewskiUlasException
