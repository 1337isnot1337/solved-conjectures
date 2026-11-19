import Conjectures.CutPeriodWeightPiles

/-! Generated finite collision screen. Every successor and every excluded
target profile below is checked by kernel reduction. -/
namespace CutPeriod.Weight
set_option Elab.async false
set_option maxRecDepth 100000
set_option maxHeartbeats 0

def profileRows : Array (Array Nat) := #[
  #[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
  #[0,256,512,4,2048,512,272,2048,1024,4096,8192,16384,32768,0,0,32768],
  #[0,0,256,512,1280,2048,1537,4864,11008,1088,39680,8960,22273,34816,29952,13056],
  #[0,0,0,256,512,1280,2560,1792,6912,11012,24320,40704,28432,32512,48896,32516],
  #[0,0,0,0,256,512,1280,2560,1792,6912,12032,24320,48897,32512,65280,48960],
  #[0,0,0,0,0,256,512,1280,2560,1792,6912,12032,24320,48896,32512,65284],
  #[0,0,0,0,0,0,256,512,1280,2560,1792,6912,12032,24320,48896,32512],
  #[0,0,0,0,0,0,0,256,512,1280,2560,1792,6912,12032,24320,48896],
  #[0,0,0,0,0,0,0,0,256,512,1280,2560,1792,6912,12032,24320],
  #[0,0,0,0,0,0,0,0,0,256,512,1280,2560,1792,6912,12032]]

def profileMask (p w : Nat) : Nat := (profileRows[p]!)[w]!
def profileCode (r : Nat) (b : Bool) : Nat := r+(if b then 8 else 0)
def profileHas (p w r : Nat) (b : Bool) : Bool :=
  (profileMask p w).testBit (profileCode r b)

theorem profile_start : profileHas 0 0 0 false=true := by decide +kernel

theorem profile_step_finite : ∀ p : Fin 9, ∀ w : Fin 16, ∀ r : Fin 8,
    ∀ b : Bool, ∀ s : Shape,
    w.val+weight s≤15 → profileHas p.val w.val r.val b=true →
    profileHas (p.val+1) (w.val+weight s) (r.val ^^^ low s)
      (b || flexible s)=true := by decide +kernel

theorem profile_step (p w r : Nat) (b : Bool) (s : Shape)
    (hp : p<9) (hw : w+weight s≤15) (hr : r<8)
    (h : profileHas p w r b=true) :
    profileHas (p+1) (w+weight s) (r ^^^ low s) (b || flexible s)=true := by
  exact profile_step_finite ⟨p,hp⟩ ⟨w,by omega⟩ ⟨r,hr⟩ b s hw h

theorem profile_exclusion_finite : ∀ s : Shape, ∀ p : Fin 10,
    ∀ w : Fin 16, ∀ b : Bool,
    (p.val=2 ∨ p.val=3 ∨ p.val=8 ∨ p.val=9) →
    w.val≤weight s → w.val%12=weight s%12 →
    profileHas p.val w.val (low s) b=true → s.val=13 ∧ b=false := by
  decide +kernel

theorem profile_exclusion (s : Shape) (p w : Nat) (b : Bool)
    (hp : p=2 ∨ p=3 ∨ p=8 ∨ p=9)
    (hw : w≤weight s) (hmod : w%12=weight s%12)
    (h : profileHas p w (low s) b=true) : s.val=13 ∧ b=false := by
  have hbound := (weight_bounds s).2
  exact profile_exclusion_finite s ⟨p,by omega⟩ ⟨w,by omega⟩ b hp hw hmod h

end CutPeriod.Weight
