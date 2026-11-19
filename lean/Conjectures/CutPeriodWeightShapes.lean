import Conjectures.CutPeriodParameters
import Conjectures.CutFamily

/-! A finite quotient/residue description of every positive candidate pile.
The two exceptional atoms have quotient zero. The final shape requires a
strictly positive quotient. These restrictions are part of the statements. -/
namespace CutPeriod.Weight

abbrev Shape := Fin 14

def weight (s : Shape) : Nat :=
  [1,2,4,5,7,8,9,10,11,12,15,3,6,6][s.val]!

def low (s : Shape) : Nat :=
  [0,1,3,1,3,2,4,5,6,7,7,2,4,0][s.val]!

def Admissible (s : Shape) (q : Nat) : Prop :=
  ((s.val=11 ∨ s.val=12) → q=0) ∧ (s.val=13 → 0<q)

instance (s : Shape) (q : Nat) : Decidable (Admissible s q) :=
  inferInstanceAs (Decidable (((s.val=11 ∨ s.val=12) → q=0) ∧
    (s.val=13 → 0<q)))

def flexible (s : Shape) : Bool := decide (s.val≠11 ∧ s.val≠12)

theorem weight_bounds (s : Shape) : 0<weight s ∧ weight s≤15 := by
  have h : ∀ s : Shape, 0<weight s ∧ weight s≤15 := by decide +kernel
  exact h s

theorem low_bound (s : Shape) : low s<8 := by
  have h : ∀ s : Shape, low s<8 := by decide +kernel
  exact h s

theorem admissible_zero (s : Shape) (hs : s.val<13) : Admissible s 0 := by
  unfold Admissible
  omega

theorem admissible_ray (s : Shape) (q : Nat) (hs : s.val<11) :
    Admissible s q := by
  unfold Admissible
  omega

theorem rigid_quotient (s : Shape) (q : Nat)
    (hq : Admissible s q) (hs : flexible s=false) : q=0 := by
  have h : ∀ s : Shape, flexible s=false → s.val=11 ∨ s.val=12 := by
    decide +kernel
  exact hq.1 (h s hs)

theorem positive_quotient (s : Shape) (q : Nat)
    (hq : Admissible s q) (hs : s.val=13) : 0<q := hq.2 hs

theorem shape_value (s : Shape) (q : Nat) (hq : Admissible s q) :
    value (12*q+weight s)=8*q+low s := by
  have hzero : ∀ s : Shape, Admissible s 0 → value (weight s)=low s := by
    decide +kernel
  have hone : ∀ s : Shape, Admissible s 1 →
      value (12+weight s)=8+low s := by decide +kernel
  by_cases hq0 : q=0
  · subst q
    simpa using hzero s hq
  · have hs1 : Admissible s 1 := by
      unfold Admissible at hq ⊢
      omega
    have hperiod := value_add_blocks (12+weight s) (q-1) (by omega)
    have harg : 12*q+weight s=(12+weight s)+12*(q-1) := by omega
    rw [harg,hperiod,hone s hs1]
    omega

def tailShape (r : Fin 12) : Shape :=
  Fin.ofNat 14 ([4,5,6,7,8,9,0,1,10,2,3,13][r.val]!)

theorem exists_shape (n : Nat) (hn : 0<n) :
    ∃ s : Shape, ∃ q : Nat, Admissible s q ∧
      n=12*q+weight s ∧ value n=8*q+low s := by
  by_cases hsmall : n≤6
  · have h : ∀ i : Fin 7, 0<i.val → ∃ s : Shape,
        Admissible s 0 ∧ i.val=weight s ∧ value i.val=low s := by
      decide +kernel
    obtain ⟨s,hs,hsize,hvalue⟩ := h ⟨n,by omega⟩ hn
    exact ⟨s,0,hs,by simpa using hsize,by simpa using hvalue⟩
  · let r : Fin 12 := ⟨(n-7)%12,Nat.mod_lt _ (by decide)⟩
    let d := block[r.val]!/8
    have hrows : ∀ r : Fin 12,
        7+r.val=12*(block[r.val]!/8)+weight (tailShape r) ∧
        block[r.val]! = 8*(block[r.val]!/8)+low (tailShape r) ∧
        (tailShape r).val≠11 ∧ (tailShape r).val≠12 ∧
        ((tailShape r).val=13 → 0<block[r.val]!/8) := by decide +kernel
    obtain ⟨hw,hv,ha,hb,hpos⟩ := hrows r
    have hdiv := Nat.mod_add_div (n-7) 12
    have hvalue := value_tail n (by omega)
    refine ⟨tailShape r,(n-7)/12+d,?_,?_,?_⟩
    · unfold Admissible
      dsimp only [d]
      omega
    · dsimp only [r,d] at *
      omega
    · dsimp only [r,d] at *
      omega

theorem nonatom_of_large (s : Shape) (q n : Nat) (hn : 7≤n)
    (hq : Admissible s q) (heq : n=12*q+weight s) :
    s.val≠11 ∧ s.val≠12 := by
  have hw : ∀ s : Shape, (s.val=11 ∨ s.val=12) → weight s≤6 := by
    decide +kernel
  constructor <;> intro h
  · have hq0 := hq.1 (Or.inl h)
    have hsmall := hw s (Or.inl h)
    omega
  · have hq0 := hq.1 (Or.inr h)
    have hsmall := hw s (Or.inr h)
    omega

end CutPeriod.Weight
