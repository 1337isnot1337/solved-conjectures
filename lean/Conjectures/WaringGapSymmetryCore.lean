module

public import Init

@[expose] public section

/-! Partial formalization of the exact Apéry reduction in the existing
Benfield–Lippard stable Waring-gap symmetry result. The residue-bijection,
genus formulas, and identification of the stable gaps remain to be proved. -/
namespace WaringGapSymmetryCore

def prefixSum (w : Nat → Nat) : Nat → Nat
  | 0 => 0
  | k+1 => prefixSum w k + w k

theorem prefixSum_succ (w : Nat → Nat) (k : Nat) :
    prefixSum w (k+1) = prefixSum w k + w k := rfl

theorem reflect_sum_ge (w v : Nat → Nat) (F k : Nat)
    (hk : k ≤ F+1)
    (h : ∀ i, i ≤ F → v i ≤ w i + w (F-i)) :
    prefixSum v k + prefixSum w (F+1-k) ≤
      prefixSum w k + prefixSum w (F+1) := by
  induction k with
  | zero => simp [prefixSum]
  | succ k ih =>
    have hk' : k ≤ F+1 := by omega
    have hi := ih hk'
    have hp := h k (by omega)
    have he : F+1-k = (F-k)+1 := by omega
    rw [he, prefixSum_succ w (F-k)] at hi
    have he' : F+1-(k+1) = F-k := by omega
    rw [he', prefixSum_succ v k, prefixSum_succ w k]
    omega

theorem prefixSum_const (k : Nat) :
    prefixSum (fun _ => 1) k = k := by
  induction k with
  | zero => rfl
  | succ k ih => simp [prefixSum_succ, ih]

theorem prefixSum_one_extra (t k : Nat) :
    prefixSum (fun i => if i=t then 2 else 1) k =
      k + (if t<k then 1 else 0) := by
  induction k with
  | zero => simp [prefixSum]
  | succ k ih =>
    rw [prefixSum_succ, ih]
    by_cases h : k=t
    · have h1 : ¬ t<k := by omega
      have h2 : t<k+1 := by omega
      simp [h,h1,h2]
      omega
    · by_cases h1 : t<k
      · have h2 : t<k+1 := by omega
        simp [h,h1,h2]
        omega
      · have h2 : ¬ t<k+1 := by omega
        simp [h,h1,h2]

def gapBit (s : Nat → Bool) (i : Nat) : Nat :=
  if s i then 0 else 1

theorem reflected_pair_has_gap (s : Nat → Bool) (F i : Nat)
    (hi : i≤F) (hF : s F=false)
    (hadd : ∀ i j, s i=true → s j=true → s (i+j)=true) :
    1 ≤ gapBit s i + gapBit s (F-i) := by
  cases h : s i
  · simp [gapBit,h]
  · cases h' : s (F-i)
    · simp [gapBit,h,h']
    · have he : i+(F-i)=F := by omega
      have hn := hadd i (F-i) h h'
      rw [he,hF] at hn
      cases hn

theorem twice_genus_ge (s : Nat → Bool) (F : Nat)
    (hF : s F=false)
    (hadd : ∀ i j, s i=true → s j=true → s (i+j)=true) :
    F+1 ≤ 2*prefixSum (gapBit s) (F+1) := by
  have h := reflect_sum_ge (gapBit s) (fun _ => 1) F (F+1)
    (by omega) (fun i hi => reflected_pair_has_gap s F i hi hF hadd)
  rw [prefixSum_const] at h
  simp [prefixSum] at h
  omega

theorem strict_defect_of_double_gap (s : Nat → Bool) (F t : Nat)
    (ht : t≤F) (hF : s F=false)
    (hadd : ∀ i j, s i=true → s j=true → s (i+j)=true)
    (h1 : s t=false) (h2 : s (F-t)=false) :
    F+1 < 2*prefixSum (gapBit s) (F+1) := by
  have hh : ∀ i, i≤F →
      (if i=t then 2 else 1) ≤ gapBit s i + gapBit s (F-i) := by
    intro i hi
    by_cases he : i=t
    · subst i
      simp [gapBit,h1,h2]
    · simp only [he, if_false]
      exact reflected_pair_has_gap s F i hi hF hadd
  have h := reflect_sum_ge (gapBit s) (fun i => if i=t then 2 else 1)
    F (F+1) (by omega) hh
  rw [prefixSum_one_extra] at h
  have ht' : t<F+1 := by omega
  simp [prefixSum,ht'] at h
  omega

structure ReductionData where
  x : Nat
  y : Nat
  z : Nat
  L : Nat
  U : Nat
  V : Nat
  H : Nat
  k1 : Nat
  k2 : Nat
  x_pos : 0<x
  k1_pos : 0<k1
  k2_pos : 0<k2
  LV : V<L
  HU : U<H
  relation1 : L*y=U*z+x*k1
  relation2 : H*z=V*y+x*k2

def weight (d : ReductionData) (i j : Nat) := i*d.y+j*d.z

def Reduced (d : ReductionData) (i j : Nat) : Prop :=
  i<d.L ∧ j<d.H ∧ (i<d.L-d.V ∨ j<d.H-d.U)

theorem mul_split (i j y : Nat) (h : j≤i) :
    i*y=(i-j)*y+j*y := by
  rw [← Nat.add_mul]
  have he : i-j+j=i := by omega
  rw [he]

theorem corner_relation (d : ReductionData) :
    (d.L-d.V)*d.y+(d.H-d.U)*d.z=d.x*(d.k1+d.k2) := by
  have h1 := mul_split d.L d.V d.y (Nat.le_of_lt d.LV)
  have h2 := mul_split d.H d.U d.z (Nat.le_of_lt d.HU)
  have h3 := d.relation1
  have h4 := d.relation2
  rw [Nat.mul_add]
  omega

theorem reduce_step (d : ReductionData) (i j : Nat) (h : ¬ Reduced d i j) :
    ∃ u v m, 0<m ∧ weight d i j=weight d u v+d.x*m := by
  by_cases hi : d.L≤i
  · refine ⟨i-d.L,j+d.U,d.k1,d.k1_pos,?_⟩
    have h1 := mul_split i d.L d.y hi
    have h2 := d.relation1
    unfold weight
    rw [Nat.add_mul]
    omega
  · by_cases hj : d.H≤j
    · refine ⟨i+d.V,j-d.H,d.k2,d.k2_pos,?_⟩
      have h1 := mul_split j d.H d.z hj
      have h2 := d.relation2
      unfold weight
      rw [Nat.add_mul]
      omega
    · have hcorner : d.L-d.V≤i ∧ d.H-d.U≤j := by
        by_cases h' : i<d.L-d.V
        · exfalso
          apply h
          exact ⟨by omega,by omega,Or.inl h'⟩
        · by_cases h'' : j<d.H-d.U
          · exfalso
            apply h
            exact ⟨by omega,by omega,Or.inr h''⟩
          · omega
      refine ⟨i-(d.L-d.V),j-(d.H-d.U),d.k1+d.k2,by have := d.k1_pos; omega,?_⟩
      have h1 := mul_split i (d.L-d.V) d.y hcorner.1
      have h2 := mul_split j (d.H-d.U) d.z hcorner.2
      have h3 := corner_relation d
      unfold weight
      omega

theorem reduce (d : ReductionData) (i j : Nat) :
    ∃ u v m, Reduced d u v ∧ weight d i j=weight d u v+d.x*m := by
  have aux : ∀ n : Nat, ∀ a b, weight d a b=n →
      ∃ u v m, Reduced d u v ∧ weight d a b=weight d u v+d.x*m := by
    intro n
    induction n using Nat.strongRecOn with
    | ind n ih =>
      intro a b hw
      by_cases hr : Reduced d a b
      · exact ⟨a,b,0,hr,by simp⟩
      · obtain ⟨u,v,m,hm,he⟩ := reduce_step d a b hr
        have hp : 0<d.x*m := Nat.mul_pos d.x_pos hm
        have hlt : weight d u v<n := by omega
        obtain ⟨u',v',m',hr',he'⟩ := ih (weight d u v) hlt u v rfl
        refine ⟨u',v',m'+m,hr',?_⟩
        rw [Nat.mul_add]
        omega
  exact aux (weight d i j) i j rfl

def corner1 (d : ReductionData) := (d.L-1)*d.y+(d.H-d.U-1)*d.z
def corner2 (d : ReductionData) := (d.L-d.V-1)*d.y+(d.H-1)*d.z
def maxWeight (d : ReductionData) := max (corner1 d) (corner2 d)

theorem reduced_weight_le (d : ReductionData) (i j : Nat)
    (h : Reduced d i j) : weight d i j ≤ maxWeight d := by
  obtain ⟨hi,hj,hc⟩ := h
  cases hc with
  | inl h' =>
    have h1 := Nat.mul_le_mul_right d.y (show i≤d.L-d.V-1 by omega)
    have h2 := Nat.mul_le_mul_right d.z (show j≤d.H-1 by omega)
    have h3 : weight d i j≤corner2 d := by
      unfold weight corner2
      omega
    exact Nat.le_trans h3 (Nat.le_max_right _ _)
  | inr h' =>
    have h1 := Nat.mul_le_mul_right d.y (show i≤d.L-1 by omega)
    have h2 := Nat.mul_le_mul_right d.z (show j≤d.H-d.U-1 by omega)
    have h3 : weight d i j≤corner1 d := by
      unfold weight corner1
      omega
    exact Nat.le_trans h3 (Nat.le_max_left _ _)

theorem corners_reduced (d : ReductionData) :
    Reduced d (d.L-1) (d.H-d.U-1) ∧
    Reduced d (d.L-d.V-1) (d.H-1) := by
  have hl := d.LV
  have hh := d.HU
  unfold Reduced
  constructor
  · exact ⟨by omega,by omega,Or.inr (by omega)⟩
  · exact ⟨by omega,by omega,Or.inl (by omega)⟩

theorem bounded_reduction (d : ReductionData) (i j : Nat) :
    ∃ u v m, Reduced d u v ∧ weight d u v≤maxWeight d ∧
      weight d i j=weight d u v+d.x*m := by
  obtain ⟨u,v,m,hr,he⟩ := reduce d i j
  exact ⟨u,v,m,hr,reduced_weight_le d u v hr,he⟩

def data64 : ReductionData where
  x := (2^64-1)/17
  y := (3^64-1)/17
  z := (5^64-1)/17
  L := 18766804522483320
  U := 55
  V := 743739614142711
  H := 60
  k1 := 1876955259190588010127036672
  k2 := 1624801557131671352222750464
  x_pos := by decide
  k1_pos := by decide
  k2_pos := by decide
  LV := by decide
  HU := by decide
  relation1 := by decide
  relation2 := by decide

theorem shape_count64 :
    data64.L*data64.H-data64.U*data64.V=data64.x := by decide

theorem truncation_arithmetic64 :
    let a := 2^64-1
    let b := 3^64-1
    let c := 5^64-1
    let D := 17^64-1
    let B := (a/85-1)*b+4*c
    Nat.gcd a b=85 ∧ Nat.gcd (Nat.gcd a b) c=17 ∧
      Nat.gcd 17 D=1 ∧ B<7^64-1 ∧ B+16*D<19^64-1 ∧ B<17*D := by decide

theorem numeric_defect64 :
    let W := maxWeight data64
    let A := 2999610614445278606606529852688320245912872985058614999940142080
    let G := (A-data64.x*(data64.x-1)/2)/data64.x
    let F := W-data64.x
    2*G=F+1+6979829901167700205396291754551820692488960 ∧ 0<6979829901167700205396291754551820692488960 := by decide

def data128 : ReductionData where
  x := (2^128-1)/17
  y := (3^128-1)/17
  z := (5^128-1)/17
  L := 946318631155207323529554626079834
  U := 13945
  V := 364271084930610618508382933752617
  H := 26520
  k1 := 20745136499414189856135614816293061092178774050327194112
  k2 := 10281767609485541167108988157825722915151258513177098752
  x_pos := by decide
  k1_pos := by decide
  k2_pos := by decide
  LV := by decide
  HU := by decide
  relation1 := by decide
  relation2 := by decide

theorem shape_count128 :
    data128.L*data128.H-data128.U*data128.V=data128.x := by decide

theorem truncation_arithmetic128 :
    let a := 2^128-1
    let b := 3^128-1
    let c := 5^128-1
    let D := 17^128-1
    let B := (a/85-1)*b+4*c
    Nat.gcd a b=85 ∧ Nat.gcd (Nat.gcd a b) c=17 ∧
      Nat.gcd 17 D=1 ∧ B<7^128-1 ∧ B+16*D<19^128-1 ∧ B<17*D := by decide

theorem numeric_defect128 :
    let W := maxWeight data128
    let A := 9579212380987587900682264590047208423092603084284059822365600806326132160706686923463279080297747266306758678302933305747028341760
    let G := (A-data128.x*(data128.x-1)/2)/data128.x
    let F := W-data128.x
    2*G=F+1+83453540242898960781830249238740566391992592992955918666946398675767492529298241537816250880 ∧ 0<83453540242898960781830249238740566391992592992955918666946398675767492529298241537816250880 := by decide

end WaringGapSymmetryCore
