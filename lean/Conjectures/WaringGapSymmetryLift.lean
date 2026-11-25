module

public import Conjectures.WaringGapSymmetryResidues

@[expose] public section

namespace WaringGapSymmetryCore

structure DoubleGapWitness (S : Nat → Prop) where
  F : Nat
  t : Nat
  above : ∀ n, F<n → S n
  F_gap : ¬ S F
  t_lt : t<F
  t_gap : ¬ S t
  other_gap : ¬ S (F-t)

def FourGen (d : ReductionData) (D n : Nat) : Prop :=
  ∃ l t, ThreeGen d t ∧ n=l*D+17*t

theorem four_zero (d : ReductionData) (D : Nat) : FourGen d D 0 :=
  ⟨0,0,three_zero d,by simp⟩

theorem four_add (d : ReductionData) (D : Nat) {a b : Nat}
    (ha : FourGen d D a) (hb : FourGen d D b) : FourGen d D (a+b) := by
  obtain ⟨i,t,ht,ha⟩ := ha
  obtain ⟨j,u,hu,hb⟩ := hb
  refine ⟨i+j,t+u,three_add d ht hu,?_⟩
  rw [Nat.add_mul,Nat.mul_add]
  omega

theorem four_scaled (d : ReductionData) (D t : Nat)
    (ht : ThreeGen d t) : FourGen d D (17*t) :=
  ⟨0,t,ht,by simp⟩

theorem four_D (d : ReductionData) (D : Nat) : FourGen d D D :=
  ⟨1,0,three_zero d,by simp⟩

theorem four_normalize (d : ReductionData) (D : Nat) (hD : ThreeGen d D)
    {n : Nat} (hn : FourGen d D n) :
    ∃ j, j<17 ∧ ∃ t, ThreeGen d t ∧ n=j*D+17*t := by
  obtain ⟨l,t,ht,he⟩ := hn
  refine ⟨l%17,Nat.mod_lt _ (by decide),t+(l/17)*D,three_add d ht (three_mul d hD _),?_⟩
  have h : l*D=(l%17)*D+17*((l/17)*D) := by
    calc
      l*D=(l%17+17*(l/17))*D := by rw [Nat.mod_add_div]
      _ = _ := by rw [Nat.add_mul,Nat.mul_assoc]
  rw [Nat.mul_add]
  omega

theorem residue17 (D j : Nat) (hD : D%17=16) (hj : j<17) :
    (j*D)%17=(17-j)%17 := by
  rw [Nat.mul_mod j D 17,hD,Nat.mod_eq_of_lt hj]
  omega

theorem residue17_unique (D j k : Nat) (hD : D%17=16)
    (hj : j<17) (hk : k<17) (he : (j*D)%17=(k*D)%17) : j=k := by
  rw [residue17 D j hD hj,residue17 D k hD hk] at he
  omega

theorem four_gap (d : ReductionData) (D j t : Nat) (hD : ThreeGen d D)
    (hDm : D%17=16) (hj : j<17) (ht : ¬ ThreeGen d t) :
    ¬ FourGen d D (j*D+17*t) := by
  intro hm
  obtain ⟨k,hk,u,hu,he⟩ := four_normalize d D hD hm
  have hmod := congrArg (fun n : Nat => n%17) he
  simp only [mod_add_multiple] at hmod
  have hjk := residue17_unique D j k hDm hj hk hmod
  subst k
  have he' : t=u := by omega
  subst u
  exact ht hu

theorem four_above (d : ReductionData) (D F n : Nat)
    (hDm : D%17=16) (hT : ∀ t, F<t → ThreeGen d t)
    (hn : 16*D+17*F<n) : FourGen d D n := by
  let j := (17-n%17)%17
  have hj : j<17 := Nat.mod_lt _ (by decide)
  have hr : (j*D)%17=n%17 := by
    rw [residue17 D j hDm hj]
    dsimp [j]
    have h := Nat.mod_lt n (by decide : 0<17)
    omega
  have hle : j*D≤16*D := Nat.mul_le_mul_right D (by omega)
  obtain ⟨t,he⟩ := same_mod_ge_multiple (j*D) n 17 (by decide) hr (by omega)
  exact ⟨j,t,hT t (by omega),he⟩

def lift_double_gap (d : ReductionData) (D : Nat)
    (w : DoubleGapWitness (ThreeGen d)) (hD : ThreeGen d D)
    (hDm : D%17=16) : DoubleGapWitness (FourGen d D) where
  F := 16*D+17*w.F
  t := 16*D+17*w.t
  above := fun n hn => four_above d D w.F n hDm w.above hn
  F_gap := four_gap d D 16 w.F hD hDm (by decide) w.F_gap
  t_lt := by have := w.t_lt; omega
  t_gap := four_gap d D 16 w.t hD hDm (by decide) w.t_gap
  other_gap := by
    have he : (16*D+17*w.F)-(16*D+17*w.t)=0*D+17*(w.F-w.t) := by
      have := w.t_lt
      simp only [Nat.zero_mul,Nat.zero_add]
      omega
    rw [he]
    exact four_gap d D 0 (w.F-w.t) hD hDm (by decide) w.other_gap

def F64 : Nat := maxWeight data64-data64.x
def t64 : Nat := corner1 data64-data64.x
def D64 : Nat := 17^64-1

theorem F_gap64 : ¬ ThreeGen data64 F64 := by
  have hr : Reduced data64 18023064908340608 59 := (corners_reduced data64).2
  have hg := gap_below_reduced data64 unique64 18023064908340608 59 hr (by decide)
  have he : F64=weight data64 18023064908340608 59-data64.x := by decide
  rw [he]
  exact hg

theorem t_gap64 : ¬ ThreeGen data64 t64 := by
  have hr : Reduced data64 18766804522483319 4 := (corners_reduced data64).1
  have hg := gap_below_reduced data64 unique64 18766804522483319 4 hr (by decide)
  have he : t64=weight data64 18766804522483319 4-data64.x := by decide
  rw [he]
  exact hg

theorem other_gap64 : ¬ ThreeGen data64 (F64-t64) := by
  intro h
  have hx : ThreeGen data64 (t64+data64.x) := ⟨18766804522483319,4,0,by decide⟩
  have hy : ThreeGen data64 (t64+data64.y) := ⟨0,59,1876955259190588010127036671,by decide⟩
  have hz : ThreeGen data64 (t64+data64.z) := ⟨743739614142710,0,3501756816322259362349787135,by decide⟩
  have hh := pseudo_gap_add data64 t64 (F64-t64) hx hy hz h (by decide)
  rw [show t64+(F64-t64)=F64 by decide] at hh
  exact F_gap64 hh

def threeWitness64 : DoubleGapWitness (ThreeGen data64) where
  F := F64
  t := t64
  above := fun n hn => above_bound data64 cover64 n hn
  F_gap := F_gap64
  t_lt := by decide
  t_gap := t_gap64
  other_gap := other_gap64

def fourWitness64 : DoubleGapWitness (FourGen data64 D64) :=
  lift_double_gap data64 D64 threeWitness64
    (above_bound data64 cover64 D64 (by decide)) (by decide)

def F128 : Nat := maxWeight data128-data128.x
def t128 : Nat := corner2 data128-data128.x
def D128 : Nat := 17^128-1

theorem F_gap128 : ¬ ThreeGen data128 F128 := by
  have hr : Reduced data128 946318631155207323529554626079833 12574 := (corners_reduced data128).1
  have hg := gap_below_reduced data128 unique128 946318631155207323529554626079833 12574 hr (by decide)
  have he : F128=weight data128 946318631155207323529554626079833 12574-data128.x := by decide
  rw [he]
  exact hg

theorem t_gap128 : ¬ ThreeGen data128 t128 := by
  have hr : Reduced data128 582047546224596705021171692327216 26519 := (corners_reduced data128).2
  have hg := gap_below_reduced data128 unique128 582047546224596705021171692327216 26519 hr (by decide)
  have he : t128=weight data128 582047546224596705021171692327216 26519-data128.x := by decide
  rw [he]
  exact hg

theorem other_gap128 : ¬ ThreeGen data128 (F128-t128) := by
  intro h
  have hx : ThreeGen data128 (t128+data128.x) := ⟨582047546224596705021171692327216,26519,0,by decide⟩
  have hy : ThreeGen data128 (t128+data128.y) := ⟨0,13944,31026904108899731023244602974118784007330032563504292863,by decide⟩
  have hz : ThreeGen data128 (t128+data128.z) := ⟨946318631155207323529554626079833,0,10281767609485541167108988157825722915151258513177098751,by decide⟩
  have hh := pseudo_gap_add data128 t128 (F128-t128) hx hy hz h (by decide)
  rw [show t128+(F128-t128)=F128 by decide] at hh
  exact F_gap128 hh

def threeWitness128 : DoubleGapWitness (ThreeGen data128) where
  F := F128
  t := t128
  above := fun n hn => above_bound data128 cover128 n hn
  F_gap := F_gap128
  t_lt := by decide
  t_gap := t_gap128
  other_gap := other_gap128

def fourWitness128 : DoubleGapWitness (FourGen data128 D128) :=
  lift_double_gap data128 D128 threeWitness128
    (above_bound data128 cover128 D128 (by decide)) (by decide)

end WaringGapSymmetryCore
