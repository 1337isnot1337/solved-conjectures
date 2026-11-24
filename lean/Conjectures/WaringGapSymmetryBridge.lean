module

public import Conjectures.WaringGapSymmetryCore

@[expose] public section

namespace WaringGapSymmetryCore

def ThreeGen (d : ReductionData) (n : Nat) : Prop :=
  ∃ i j k, n=weight d i j+d.x*k

theorem three_zero (d : ReductionData) : ThreeGen d 0 :=
  ⟨0,0,0,by simp [weight]⟩

theorem three_add (d : ReductionData) {a b : Nat}
    (ha : ThreeGen d a) (hb : ThreeGen d b) : ThreeGen d (a+b) := by
  obtain ⟨i,j,k,h1⟩ := ha
  obtain ⟨u,v,m,h2⟩ := hb
  refine ⟨i+u,j+v,k+m,?_⟩
  simp only [weight,Nat.add_mul,Nat.mul_add] at *
  omega

theorem three_mul (d : ReductionData) {a : Nat} (ha : ThreeGen d a)
    (k : Nat) : ThreeGen d (k*a) := by
  induction k with
  | zero => simpa using three_zero d
  | succ k ih =>
    rw [Nat.succ_mul]
    exact three_add d ih ha

theorem three_reduced (d : ReductionData) {n : Nat} (hn : ThreeGen d n) :
    ∃ i j k, Reduced d i j ∧ n=weight d i j+d.x*k := by
  obtain ⟨i,j,k,he⟩ := hn
  obtain ⟨u,v,m,hr,hw⟩ := reduce d i j
  refine ⟨u,v,m+k,hr,?_⟩
  rw [Nat.mul_add]
  omega

theorem mod_add_multiple (n x k : Nat) : (n+x*k)%x=n%x := by
  rw [Nat.add_mod, Nat.mul_mod]
  simp

theorem mod_scale (x a b c : Nat) (h : a%x=b%x) :
    (a*c)%x=(b*c)%x := by
  rw [Nat.mul_mod a c x, Nat.mul_mod b c x, h]

theorem coordinate_mod (x y z P Q h : Nat)
    (hy : (h*y)%x=P%x) (hz : (h*z)%x=Q%x)
    (i j u v : Nat) (he : (i*y+j*z)%x=(u*y+v*z)%x) :
    (P*i+Q*j)%x=(P*u+Q*v)%x := by
  have aux (a b : Nat) :
      (h*(a*y+b*z))%x=(P*a+Q*b)%x := by
    calc
      (h*(a*y+b*z))%x = ((h*y)*a+(h*z)*b)%x := by
        rw [Nat.mul_add]
        simp only [Nat.mul_assoc,Nat.mul_left_comm,Nat.mul_comm]
      _ = (((h*y)*a)%x+((h*z)*b)%x)%x := Nat.add_mod _ _ _
      _ = ((P*a)%x+(Q*b)%x)%x := by
        rw [mod_scale x (h*y) P a hy, mod_scale x (h*z) Q b hz]
      _ = (P*a+Q*b)%x := (Nat.add_mod _ _ _).symm
  rw [← aux i j, ← aux u v]
  rw [Nat.mul_comm h (i*y+j*z), Nat.mul_comm h (u*y+v*z)]
  exact mod_scale x _ _ h he

theorem residue_trichotomy (a b x : Nat) (ha : a<x+x) (hb : b<x+x)
    (he : a%x=b%x) : a=b ∨ a=b+x ∨ b=a+x := by
  by_cases h1 : a<x
  · rw [Nat.mod_eq_of_lt h1] at he
    by_cases h2 : b<x
    · rw [Nat.mod_eq_of_lt h2] at he
      exact Or.inl he
    · have hh : x≤b := by omega
      rw [Nat.mod_eq_sub_mod hh, Nat.mod_eq_of_lt (show b-x<x by omega)] at he
      omega
  · have hh : x≤a := by omega
    rw [Nat.mod_eq_sub_mod hh, Nat.mod_eq_of_lt (show a-x<x by omega)] at he
    by_cases h2 : b<x
    · rw [Nat.mod_eq_of_lt h2] at he
      omega
    · have hh' : x≤b := by omega
      rw [Nat.mod_eq_sub_mod hh', Nat.mod_eq_of_lt (show b-x<x by omega)] at he
      omega

def CoversResidues (d : ReductionData) : Prop :=
  ∀ n : Nat, ∃ i j, weight d i j % d.x = n%d.x

def UniqueReduced (d : ReductionData) : Prop :=
  ∀ i j u v : Nat, Reduced d i j → Reduced d u v →
    weight d i j % d.x = weight d u v % d.x → i=u ∧ j=v

theorem cover_of_certificate (d : ReductionData) (a b k : Nat)
    (he : a*d.y+b*d.z=1+d.x*k) : CoversResidues d := by
  intro n
  refine ⟨n*a,n*b,?_⟩
  have h : weight d (n*a) (n*b)=n+d.x*(n*k) := by
    calc
      weight d (n*a) (n*b) = n*(a*d.y+b*d.z) := by
        unfold weight
        rw [Nat.mul_add, Nat.mul_assoc, Nat.mul_assoc]
      _ = n*(1+d.x*k) := by rw [he]
      _ = n+d.x*(n*k) := by
        rw [Nat.mul_add, Nat.mul_one]
        simp only [Nat.mul_assoc,Nat.mul_comm,Nat.mul_left_comm]
  rw [h,mod_add_multiple]

theorem same_mod_ge_multiple (a b x : Nat) (hx : 0<x)
    (he : a%x=b%x) (hab : a≤b) : ∃ k, b=a+x*k := by
  have h1 := Nat.mod_add_div a x
  have h2 := Nat.mod_add_div b x
  have hq : a/x≤b/x := Nat.div_le_div_right hab
  have h3 := mul_split (b/x) (a/x) x hq
  rw [Nat.mul_comm (b/x) x, Nat.mul_comm (b/x-a/x) x,
      Nat.mul_comm (a/x) x] at h3
  exact ⟨b/x-a/x,by omega⟩

theorem above_bound (d : ReductionData) (cover : CoversResidues d)
    (n : Nat) (hn : maxWeight d-d.x<n) : ThreeGen d n := by
  obtain ⟨i,j,hi⟩ := cover n
  obtain ⟨u,v,m,hr,hw,he⟩ := bounded_reduction d i j
  rw [he,mod_add_multiple] at hi
  have hle : weight d u v≤n := by
    by_cases h : weight d u v≤n
    · exact h
    · obtain ⟨k,hk⟩ := same_mod_ge_multiple n (weight d u v) d.x
        d.x_pos hi.symm (by omega)
      have hk' : 0<k := by
        by_cases hz : k=0
        · rw [hz,Nat.mul_zero,Nat.add_zero] at hk
          omega
        · omega
      have hmul := Nat.mul_le_mul_left d.x (show 1≤k by omega)
      rw [Nat.mul_one] at hmul
      omega
  obtain ⟨k,hk⟩ := same_mod_ge_multiple (weight d u v) n d.x d.x_pos hi hle
  exact ⟨u,v,k,hk⟩

theorem gap_below_reduced (d : ReductionData) (unique : UniqueReduced d)
    (i j : Nat) (hr : Reduced d i j) (hw : d.x≤weight d i j) :
    ¬ ThreeGen d (weight d i j-d.x) := by
  intro h
  obtain ⟨u,v,k,hr',he⟩ := three_reduced d h
  have hmod : (weight d i j-d.x)%d.x=weight d i j%d.x := by
    have h : weight d i j=(weight d i j-d.x)+d.x*1 := by
      rw [Nat.mul_one]
      omega
    calc
      (weight d i j-d.x)%d.x =
          ((weight d i j-d.x)+d.x*1)%d.x := (mod_add_multiple _ _ _).symm
      _ = weight d i j%d.x := by rw [← h]
  have hh : weight d u v%d.x=weight d i j%d.x := by
    rw [he,mod_add_multiple] at hmod
    exact hmod
  obtain ⟨hu,hv⟩ := unique u v i j hr' hr hh
  subst u
  subst v
  have hp := d.x_pos
  omega

theorem pseudo_gap_add (d : ReductionData) (t n : Nat)
    (hx : ThreeGen d (t+d.x)) (hy : ThreeGen d (t+d.y))
    (hz : ThreeGen d (t+d.z)) (hn : ThreeGen d n) (hnpos : 0<n) :
    ThreeGen d (t+n) := by
  obtain ⟨i,j,k,he⟩ := hn
  by_cases hi : 0<i
  · have h : t+n=(t+d.y)+(weight d (i-1) j+d.x*k) := by
      have h' := mul_split i 1 d.y (by omega)
      rw [Nat.one_mul] at h'
      unfold weight at *
      omega
    rw [h]
    exact three_add d hy ⟨i-1,j,k,rfl⟩
  · by_cases hj : 0<j
    · have h : t+n=(t+d.z)+(weight d i (j-1)+d.x*k) := by
        have h' := mul_split j 1 d.z (by omega)
        rw [Nat.one_mul] at h'
        unfold weight at *
        omega
      rw [h]
      exact three_add d hz ⟨i,j-1,k,rfl⟩
    · have hk : 0<k := by
        by_cases hh : k=0
        · have hi' : i=0 := by omega
          have hj' : j=0 := by omega
          simp [hi',hj',hh,weight] at he
          omega
        · omega
      have h : t+n=(t+d.x)+(weight d i j+d.x*(k-1)) := by
        have h' := mul_split k 1 d.x (by omega)
        rw [Nat.one_mul,Nat.mul_comm k d.x,Nat.mul_comm (k-1) d.x] at h'
        omega
      rw [h]
      exact three_add d hx ⟨i,j,k-1,rfl⟩

theorem cover64 : CoversResidues data64 :=
  cover_of_certificate data64 605637028844486560 192541681802850798 5658291481426951400103288081989910395817489 (by decide)

set_option maxHeartbeats 4000000 in
theorem unique64 : UniqueReduced data64 := by
  intro i j u v hi hu he
  change i<18766804522483320 ∧ j<60 ∧ (i<18023064908340609 ∨ j<5) at hi
  change u<18766804522483320 ∧ v<60 ∧ (u<18023064908340609 ∨ v<5) at hu
  change (i*201981401193677204979873475840+j*31888299190750130411983905907939462100758272)%1085102592571150095=(u*201981401193677204979873475840+v*31888299190750130411983905907939462100758272)%1085102592571150095 at he
  obtain ⟨hi1,hi2,hi3⟩ := hi
  obtain ⟨hu1,hu2,hu3⟩ := hu
  have hA := coordinate_mod 1085102592571150095 201981401193677204979873475840 31888299190750130411983905907939462100758272 60 743739614142711 406837268550925863
    (by decide) (by decide) i j u v he
  have hB := coordinate_mod 1085102592571150095 201981401193677204979873475840 31888299190750130411983905907939462100758272 55 18766804522483320 969740588752481260
    (by decide) (by decide) i j u v he
  have hA' := residue_trichotomy (60*i+743739614142711*j) (60*u+743739614142711*v) 1085102592571150095
    (by omega) (by omega) hA
  have hB' := residue_trichotomy (55*i+18766804522483320*j) (55*u+18766804522483320*v) 1085102592571150095
    (by omega) (by omega) hB
  rcases hA' with hA'|hA'|hA' <;> rcases hB' with hB'|hB'|hB'
  all_goals rcases hi3 with hi3|hi3 <;> rcases hu3 with hu3|hu3 <;> omega

theorem cover128 : CoversResidues data128 :=
  cover_of_certificate data128 673412091720402879668151559679273665 19634276914226491121056059135758415293 16956492488865960669554705388023488272231619306776691461787121451176554357669093407277073 (by decide)

set_option maxHeartbeats 4000000 in
theorem unique128 : UniqueReduced data128 := by
  intro i j u v hi hu he
  change i<946318631155207323529554626079834 ∧ j<26520 ∧ (i<582047546224596705021171692327217 ∨ j<12575) at hi
  change u<946318631155207323529554626079834 ∧ v<26520 ∧ (u<582047546224596705021171692327217 ∨ v<12575) at hu
  change (i*693540269278740186560051344788971686216365387780931829946880+j*17286681629739522176010831429738907026745081717236581198658113327623783227275399600758272)%20016609818878733144904388672456953615=(u*693540269278740186560051344788971686216365387780931829946880+v*17286681629739522176010831429738907026745081717236581198658113327623783227275399600758272)%20016609818878733144904388672456953615 at he
  obtain ⟨hi1,hi2,hi3⟩ := hi
  obtain ⟨hu1,hu2,hu3⟩ := hu
  have hA := coordinate_mod 20016609818878733144904388672456953615 693540269278740186560051344788971686216365387780931829946880 17286681629739522176010831429738907026745081717236581198658113327623783227275399600758272 26520 364271084930610618508382933752617 7382481681128296803757218506390950806
    (by decide) (by decide) i j u v he
  have hB := coordinate_mod 20016609818878733144904388672456953615 693540269278740186560051344788971686216365387780931829946880 17286681629739522176010831429738907026745081717236581198658113327623783227275399600758272 13945 946318631155207323529554626079834 10733766628171766154518719926100529182
    (by decide) (by decide) i j u v he
  have hA' := residue_trichotomy (26520*i+364271084930610618508382933752617*j) (26520*u+364271084930610618508382933752617*v) 20016609818878733144904388672456953615
    (by omega) (by omega) hA
  have hB' := residue_trichotomy (13945*i+946318631155207323529554626079834*j) (13945*u+946318631155207323529554626079834*v) 20016609818878733144904388672456953615
    (by omega) (by omega) hB
  rcases hA' with hA'|hA'|hA' <;> rcases hB' with hB'|hB'|hB'
  all_goals rcases hi3 with hi3|hi3 <;> rcases hu3 with hu3|hu3 <;> omega

end WaringGapSymmetryCore
