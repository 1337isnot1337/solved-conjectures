import Conjectures.CutFamilyBlocks

namespace CutFamily

theorem sum_quotient_residue (D : Nat) (l : List Nat) (hpos : ∀ n ∈ l, 0 < n) :
    l.sum = D*(l.map (fun n => (n-1)/D)).sum +
      (l.map (fun n => (n-1)%D+1)).sum := by
  induction l with
  | nil => simp
  | cons n l ih =>
    have hn := hpos n (by simp)
    have ht := ih (fun a ha => hpos a (by simp [ha]))
    have hd := Nat.mod_add_div (n-1) D
    have hnsub : n-1+1=n := by omega
    simp only [List.map_cons,List.sum_cons]
    nlinarith only [ht,hd,hnsub]

/-- A collision in the full formula forces a collision in its first-period
residues; any carry in the residue total makes the quotient too large. -/
theorem value_collision_residues (x : Nat) (hx : 4 ≤ x) (l : List Nat)
    (hpos : ∀ n ∈ l, 0 < n) (hne : l ≠ [])
    (hcollision : xorList (l.map (value x)) = value x l.sum) :
    let rs := l.map (fun n => (n-1)%(6*x)+1)
    rs.sum ≤ 6*x ∧ xorList (rs.map (block x)) = block x rs.sum := by
  let D := 6*x
  let qs := l.map (fun n => (n-1)/D)
  let rs := l.map (fun n => (n-1)%D+1)
  have hD : 0 < D := by dsimp [D]; omega
  have hsum : l.sum = D*qs.sum+rs.sum := sum_quotient_residue D l hpos
  have hrspos : ∀ r ∈ rs, 0 < r := by
    intro r hr
    obtain ⟨n,hn,rfl⟩ := List.mem_map.mp hr
    omega
  have hlen : 0 < rs.length := by
    simp only [rs, List.length_map]
    exact List.length_pos_iff.mpr hne
  have hR : 0 < rs.sum := by
    have hh := excess_identity rs hrspos
    omega
  have hn : l.sum-1 = D*qs.sum+(rs.sum-1) := by omega
  have hquot : (l.sum-1)/D = qs.sum+(rs.sum-1)/D := by
    rw [hn, Nat.add_comm, Nat.mul_comm D qs.sum, Nat.add_mul_div_right _ _ hD,
      Nat.add_comm]
  have hhigh : xorList (l.map (value x)) / 8 ≤ qs.sum := by
    rw [xorList_div_eight, List.map_map]
    simpa only [Function.comp_def, value_div_eight] using xorList_le_sum qs
  have hRle : rs.sum ≤ D := by
    rw [hcollision, value_div_eight] at hhigh
    change (l.sum-1)/D ≤ qs.sum at hhigh
    rw [hquot] at hhigh
    by_contra hh
    have hdq : 1 ≤ (rs.sum-1)/D := (Nat.le_div_iff_mul_le hD).mpr (by omega)
    omega
  have hmod : (l.sum-1)%D+1 = rs.sum := by
    rw [hn, Nat.add_mod]
    simp only [Nat.mul_mod, Nat.mod_self, Nat.zero_mul, Nat.zero_mod,
      Nat.zero_add, Nat.mod_mod]
    rw [Nat.mod_eq_of_lt (by omega : rs.sum-1 < D)]
    omega
  have hlow : xorList (l.map (value x)) % 8 = xorList (rs.map (block x)) := by
    rw [xorList_mod_eight, List.map_map]
    simp only [rs, D, List.map_map, Function.comp_def, value_mod_eight]
  constructor
  · exact hRle
  · have hh := congrArg (fun z => z%8) hcollision
    rw [hlow, value_mod_eight] at hh
    change xorList (rs.map (block x)) = block x ((l.sum-1)%D+1) at hh
    simpa only [hmod] using hh

theorem even_cut_excludes (x : Nat) (hx : 4 ≤ x) (l : List Nat)
    (hpos : ∀ n ∈ l, 0 < n) (hlen : x+1 ≤ l.length) (hodd : l.length%2=1) :
    xorList (l.map (value x)) ≠ value x l.sum := by
  intro he
  have hne : l ≠ [] := by intro hz; simp [hz] at hlen
  obtain ⟨hbound,hcollision⟩ := value_collision_residues x hx l hpos hne he
  exact odd_blocks_ne x hx _ (by
    intro r hr
    obtain ⟨n,hn,rfl⟩ := List.mem_map.mp hr
    omega) (by simpa using hlen) (by simpa using hodd) hbound hcollision

theorem binary_cut_excludes (x : Nat) (hx : 4 ≤ x) (a b : Nat)
    (ha : 0 < a) (hb : 0 < b) :
    value x a ^^^ value x b ≠ value x (a+b) := by
  intro he
  have hcollision : xorList ([a,b].map (value x)) = value x [a,b].sum := by
    simpa [xorList] using he
  obtain ⟨hbound,hh⟩ := value_collision_residues x hx [a,b] (by simp [ha,hb])
    (by simp) hcollision
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil,
    Nat.add_zero, xorList, Nat.xor_zero] at hbound hh
  exact binary_blocks_ne x _ _ hx (by omega) (by omega) hbound hh

theorem value_period (x q r : Nat) (hx : 4 ≤ x) (hr : 0 < r) (hru : r ≤ 6*x) :
    value x (6*x*q+r) = 8*q+block x r := by
  have hD : 0 < 6*x := by omega
  have hsub : 6*x*q+r-1 = 6*x*q+(r-1) := by omega
  have hdiv : (6*x*q+r-1)/(6*x) = q := by
    rw [hsub, Nat.add_comm, Nat.mul_comm (6*x) q,
      Nat.add_mul_div_right _ _ hD, Nat.div_eq_of_lt (by omega : r-1 < 6*x)]
    omega
  have hmod : (6*x*q+r-1)%(6*x)+1 = r := by
    rw [hsub, Nat.add_mod]
    simp only [Nat.mul_mod, Nat.mod_self, Nat.zero_mul, Nat.zero_mod,
      Nat.zero_add, Nat.mod_mod]
    rw [Nat.mod_eq_of_lt (by omega : r-1 < 6*x)]
    omega
  simp only [value, hdiv, hmod]

theorem xor_low (q a b : Nat) (ha : a < 8) (hb : b < 8) :
    (8*q+a) ^^^ b = 8*q+(a ^^^ b) := by
  have hdiv := Nat.xor_div_two_pow (a := 8*q+a) (b := b) (n := 3)
  have hmod := Nat.xor_mod_two_pow (a := 8*q+a) (b := b) (n := 3)
  have hab := Nat.xor_lt_two_pow (n := 3) ha hb
  have hqa : (8*q+a)/8=q := by omega
  have hma : (8*q+a)%8=a := by omega
  have hqb : b/8=0 := by omega
  have hmb : b%8=b := by omega
  simp only [Nat.reducePow, hqa, hma, hqb, hmb, Nat.xor_zero] at hdiv hmod
  omega

theorem xorList_append (l m : List Nat) : xorList (l++m) = xorList l ^^^ xorList m := by
  induction l with
  | nil => simp [xorList]
  | cons a l ih => simp only [List.cons_append, xorList, ih, Nat.xor_assoc]

theorem value_one (x : Nat) (hx : 4 ≤ x) : value x 1=0 := by
  rw [value_first_period x 1 (by omega) (by omega)]
  simp [block, show 1 ≤ x by omega]

theorem xor_replicate_ones (x k : Nat) (hx : 4 ≤ x) :
    xorList ((List.replicate k 1).map (value x))=0 := by
  induction k with
  | zero => simp [xorList]
  | succ k ih =>
    rw [List.replicate_succ,List.map_cons,xorList,value_one x hx,Nat.zero_xor]
    exact ih

def specialA (x d : Nat) : Nat :=
  match d with
  | 0 => 1
  | 1 => 2*x+1
  | 2 => x+1
  | 3 => 3*x+1
  | 4 => 4*x+1
  | 5 => 2*x+2
  | 6 => 5*x+1
  | _ => x+1

def specialB (x d : Nat) : Nat := if d=7 then 2*x+2 else 1

theorem special_spec (x d : Nat) (hx : 4 ≤ x) (hd : d < 8) :
    0 < specialA x d ∧ specialA x d ≤ 6*x ∧
    0 < specialB x d ∧ specialB x d ≤ 6*x ∧
    specialA x d + specialB x d = cost x d + 2 ∧
    code x (specialA x d) ^^^ code x (specialB x d) = d := by
  interval_cases d <;> simp (disch := omega) [specialA,specialB,cost,code]
  all_goals try split_ifs
  all_goals first | omega | (norm_num at * <;> omega)

theorem special_xor (x d : Nat) (hx : 4 ≤ x) (hd : d < 8) :
    value x (specialA x d) ^^^ value x (specialB x d) = d ^^^ (cost x d%2) := by
  obtain ⟨ha,hau,hb,hbu,hs,hc⟩ := special_spec x d hx hd
  rw [value_first_period x _ ha hau, value_first_period x _ hb hbu]
  have hh := blocks_codes x [specialA x d, specialB x d]
  simp only [List.map_cons, List.map_nil, xorList, Nat.xor_zero, List.sum_cons,
    List.sum_nil, List.length_cons, List.length_nil, Nat.add_zero] at hh
  rw [hc] at hh
  have hp : (specialA x d+specialB x d+2)%2=cost x d%2 := by omega
  simpa only [hp] using hh

theorem cost_le_five (x d : Nat) (hx : 1 ≤ x) (hd : d < 8) : cost x d ≤ 5*x := by
  interval_cases d <;> simp only [cost] <;> omega

/-- An equal pair absorbs all even surplus.  Together with two special residues
and one quotient/parity pile, this realizes every value above its exact cost. -/
theorem many_pile_witness (x n q z : Nat) (hx : 4 ≤ x) (heven : x%2=0)
    (hz : z < 8)
    (hsize : 6*x*q+x+1+cost x (z ^^^ ((n+1)%2)) ≤ n) :
    ∃ l : List Nat, (∀ h ∈ l, 0 < h) ∧ l.length=x+1 ∧
      l.sum=n ∧ xorList (l.map (value x))=8*q+z := by
  let d := z ^^^ ((n+1)%2)
  change 6*x*q+x+1+cost x d ≤ n at hsize
  have hd : d < 8 := Nat.xor_lt_two_pow (n := 3) hz (by omega)
  let B := 6*x*q+x+1+cost x d
  let surplus := n-B
  let e := surplus%2
  let t := surplus/2+1
  let a := specialA x d
  let b := specialB x d
  let h := 6*x*q+(1+e)
  let l := [h,a,b,t,t] ++ List.replicate (x-4) 1
  obtain ⟨ha,hau,hb,hbu,hs,hc⟩ := special_spec x d hx hd
  have he : e < 2 := by dsimp [e]; omega
  have ht : 0 < t := by dsimp [t]; omega
  have hsurplus : n=B+surplus := by dsimp [surplus,B]; omega
  have hdecomp : surplus=e+2*(t-1) := by
    have hh := Nat.mod_add_div surplus 2
    dsimp [e,t]
    omega
  have hvh : value x h = 8*q+e := by
    rw [value_period x q (1+e) hx (by omega) (by omega)]
    have hr : 1+e ≤ x := by omega
    simp only [block, ite_eq_left hr]
    omega
  have hpair := special_xor x d hx hd
  have hpB : B%2=(1+cost x d)%2 := by
    dsimp [B]
    simp [Nat.add_mod, Nat.mul_mod, heven]
  have hp : e ^^^ (cost x d%2) = (n+1)%2 := by
    have hh := Nat.xor_mod_two_eq (m := e) (n := cost x d%2)
    have hhbound := Nat.xor_lt_two_pow (n := 1) he (by omega : cost x d%2 < 2)
    have edef : e=surplus%2 := rfl
    omega
  have hxorl : xorList (l.map (value x)) = value x h ^^^
      (value x a ^^^ value x b) := by
    simp only [l, List.map_append, xorList_append, xor_replicate_ones x _ hx,
      Nat.xor_zero, List.map_cons, List.map_nil, xorList]
    simp only [Nat.xor_zero, Nat.xor_self]
  refine ⟨l,?_,?_,?_,?_⟩
  · intro r hr
    simp only [l, List.mem_append, List.mem_cons, List.not_mem_nil, or_false] at hr
    rcases hr with (rfl|rfl|rfl|rfl|rfl) | hr
    · dsimp [h]; omega
    · exact ha
    · exact hb
    · exact ht
    · exact ht
    · have hh := List.eq_of_mem_replicate hr
      omega
  · simp only [l, List.length_append, List.length_cons, List.length_nil,
      List.length_replicate]
    omega
  · simp only [l, List.sum_append, List.sum_cons, List.sum_nil,
      List.sum_replicate_nat, Nat.mul_one]
    dsimp [h,a,b,B] at *
    omega
  · rw [hxorl, hvh]
    change (8*q+e) ^^^ (value x (specialA x d) ^^^ value x (specialB x d)) = _
    rw [hpair, xor_low q e (d ^^^ (cost x d%2)) (by omega)
      (Nat.xor_lt_two_pow (n := 3) hd (by omega))]
    have hl : e ^^^ (d ^^^ (cost x d%2)) = z := by
      calc
        e ^^^ (d ^^^ (cost x d%2)) = d ^^^ (e ^^^ (cost x d%2)) := by ac_rfl
        _ = d ^^^ ((n+1)%2) := by rw [hp]
        _ = z := by dsimp [d]; simp only [Nat.xor_assoc, Nat.xor_self, Nat.xor_zero]
    rw [hl]

end CutFamily
