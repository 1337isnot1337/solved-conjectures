import Mathlib.Data.Nat.Bitwise
import Mathlib.Tactic.IntervalCases
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! The all-size large-cut inequality in the Family B argument.
The identification of the explicit formula with the base game's Grundy function
is a separate published input, not assumed as a project axiom here. -/
namespace CutFamily

def xorList : List Nat → Nat
  | [] => 0
  | a::as => a ^^^ xorList as

theorem xor_le_add (a b : Nat) : a ^^^ b ≤ a+b := by
  induction a using Nat.binaryRec' generalizing b with
  | zero => simp
  | bit ab a ha ih =>
    induction b using Nat.binaryRec' with
    | zero => simp
    | bit bb b hb _ =>
      rw [Nat.xor_bit]
      have h := ih b
      cases ab <;> cases bb <;> simp [Nat.bit] at h ⊢ <;> omega

theorem xorList_le_sum (l : List Nat) : xorList l ≤ l.sum := by
  induction l with
  | nil => simp [xorList]
  | cons a l ih =>
    have := xor_le_add a (xorList l)
    simp only [xorList, List.sum_cons]
    omega

theorem xorList_lt_pow (l : List Nat) (k : Nat) (h : ∀ a ∈ l, a < 2^k) :
    xorList l < 2^k := by
  induction l with
  | nil => simp [xorList]
  | cons a l ih =>
    exact Nat.xor_lt_two_pow (h a (by simp)) (ih (by simpa using fun b hb => h b (by simp [hb])))

def block (x r : Nat) : Nat :=
  if r ≤ x then (r+1)%2
  else if r ≤ 2*x then 2+(r+1)%2
  else if r ≤ 3*x then if r = 2*x+1 then 1 else if r%2 = 0 then 4 else 5
  else if r ≤ 4*x then if r%2 = 0 then 2 else 3
  else if r ≤ 5*x then if r%2 = 0 then 5 else 4
  else if r%2 = 0 then 7 else 6

def value (x n : Nat) : Nat :=
  8*((n-1)/(6*x)) + block x ((n-1)%(6*x)+1)

theorem block_lt_eight (x r : Nat) : block x r < 8 := by
  unfold block
  split_ifs <;> omega

theorem block_small (x r : Nat) (h : r ≤ x) : block x r < 2 := by
  simp only [block, ite_eq_left h]
  omega

theorem block_medium (x r : Nat) (h : r ≤ 2*x) : block x r < 4 := by
  unfold block
  split_ifs <;> omega

theorem block_third (x r : Nat) (h : r ≤ 3*x) : block x r < 6 := by
  unfold block
  split_ifs <;> omega

def excess (l : List Nat) : Nat := (l.map (fun r => r-1)).sum

theorem excess_identity (l : List Nat) (h : ∀ r ∈ l, 0 < r) :
    l.sum = l.length + excess l := by
  induction l with
  | nil => simp [excess]
  | cons r l ih =>
    have hr := h r (by simp)
    have ht : ∀ a ∈ l, 0 < a := fun a ha => h a (by simp [ha])
    simp only [List.sum_cons, List.length_cons, excess, List.map_cons] at *
    have := ih ht
    omega

theorem member_excess (r : Nat) (l : List Nat) (hr : r ∈ l) : r-1 ≤ excess l := by
  induction l with
  | nil => simp at hr
  | cons a l ih =>
    simp only [List.mem_cons] at hr
    have he : excess (a::l) = (a-1)+excess l := by simp [excess]
    rcases hr with rfl | hr
    · omega
    · have := ih hr; omega

theorem xor_blocks_small (x : Nat) (l : List Nat) (h : excess l ≤ x-2) (hx : 2 ≤ x) :
    xorList (l.map (block x)) < 2 := by
  apply xorList_lt_pow _ 1
  intro b hb
  obtain ⟨r,hr,rfl⟩ := List.mem_map.mp hb
  have := member_excess r l hr
  exact block_small x r (by omega)

theorem xor_blocks_medium (x : Nat) (l : List Nat) (h : excess l ≤ 2*x-2) (hx : 2 ≤ x) :
    xorList (l.map (block x)) < 4 := by
  apply xorList_lt_pow _ 2
  intro b hb
  obtain ⟨r,hr,rfl⟩ := List.mem_map.mp hb
  have := member_excess r l hr
  exact block_medium x r (by omega)

/-- The last residue row: a large residue leaves only first-block residues. -/
theorem xor_blocks_third (x : Nat) (l : List Nat) (hx : 4 ≤ x)
    (h : excess l ≤ 3*x-2) : xorList (l.map (block x)) < 6 := by
  induction l with
  | nil => simp [xorList]
  | cons r l ih =>
    have he : excess (r::l) = (r-1)+excess l := by simp [excess]
    have ht : excess l ≤ 3*x-2 := by omega
    have hr : r ≤ 3*x := by omega
    simp only [List.map_cons, xorList]
    by_cases hs : r ≤ x
    · have ha := block_small x r hs
      have hb := ih ht
      generalize block x r = a at *
      generalize xorList (l.map (block x)) = b at *
      interval_cases a <;> interval_cases b <;> decide
    · by_cases hm : r ≤ 2*x
      · have ha := block_medium x r hm
        have hb := xor_blocks_medium x l (by omega) (by omega)
        have hab := Nat.xor_lt_two_pow (n := 2) ha hb
        omega
      · have ha := block_third x r hr
        have hb := xor_blocks_small x l (by omega) (by omega)
        generalize block x r = a at *
        generalize xorList (l.map (block x)) = b at *
        interval_cases a <;> interval_cases b <;> decide

theorem xorList_div_eight (l : List Nat) :
    xorList l / 8 = xorList (l.map (fun a => a/8)) := by
  induction l with
  | nil => simp [xorList]
  | cons a l ih =>
    simpa only [xorList, List.map_cons, Nat.reducePow, ih] using
      (Nat.xor_div_two_pow (a := a) (b := xorList l) (n := 3))

theorem xorList_mod_eight (l : List Nat) :
    xorList l % 8 = xorList (l.map (fun a => a%8)) := by
  induction l with
  | nil => simp [xorList]
  | cons a l ih =>
    simpa only [xorList, List.map_cons, Nat.reducePow, ih] using
      (Nat.xor_mod_two_pow (a := a) (b := xorList l) (n := 3))

theorem value_div_eight (x n : Nat) : value x n / 8 = (n-1)/(6*x) := by
  have := block_lt_eight x ((n-1)%(6*x)+1)
  unfold value
  omega

theorem value_mod_eight (x n : Nat) : value x n % 8 = block x ((n-1)%(6*x)+1) := by
  have := block_lt_eight x ((n-1)%(6*x)+1)
  unfold value
  omega

/-- The central all-size inequality: every split into at least 3x+2
positive piles has XOR value strictly below the unsplit pile's formula. -/
theorem large_cut_decreases (x : Nat) (hx : 4 ≤ x) (l : List Nat)
    (hlive : ∀ n ∈ l, 0 < n) (hparts : 3*x+2 ≤ l.length) :
    xorList (l.map (value x)) < value x l.sum := by
  let D := 6*x
  let qs := l.map (fun n => (n-1)/D)
  let rs := l.map (fun n => (n-1)%D+1)
  let Q := qs.sum
  let R := rs.sum
  have hD : 0 < D := by dsimp [D]; omega
  have hrs : ∀ r ∈ rs, 0 < r := by
    intro r hr
    obtain ⟨n,hn,rfl⟩ := List.mem_map.mp hr
    omega
  have hlen : rs.length = l.length := List.length_map ..
  have hex := excess_identity rs hrs
  have hR : 0 < R := by dsimp [R]; omega
  have hsum : l.sum = D*Q+R := by
    have general : ∀ (ll : List Nat), (∀ n ∈ ll, 0 < n) →
        ll.sum = D*(ll.map (fun n => (n-1)/D)).sum +
          (ll.map (fun n => (n-1)%D+1)).sum := by
      intro ll hl
      induction ll with
      | nil => simp
      | cons n ll ih =>
        have hn := hl n (by simp)
        have hi := ih (fun a ha => hl a (by simp [ha]))
        have hd := Nat.mod_add_div (n-1) D
        have hnsub : n-1+1 = n := by omega
        simp only [List.map_cons, List.sum_cons]
        nlinarith only [hi, hd, hnsub]
    exact general l hlive
  have hn : l.sum-1 = D*Q+(R-1) := by omega
  have hquot : (l.sum-1)/D = Q+(R-1)/D := by
    rw [hn, Nat.add_comm, Nat.mul_comm D Q, Nat.add_mul_div_right _ _ hD, Nat.add_comm]
  have hhigh : xorList (l.map (value x)) / 8 ≤ Q := by
    rw [xorList_div_eight, List.map_map]
    simpa only [Function.comp_def, value_div_eight] using xorList_le_sum qs
  by_cases hover : D < R
  · have hdq : 1 ≤ (R-1)/D := (Nat.le_div_iff_mul_le hD).mpr (by omega)
    have hv := value_div_eight x l.sum
    change value x l.sum / 8 = (l.sum-1)/D at hv
    omega
  · have hRle : R ≤ D := by omega
    have hmod : (l.sum-1)%D+1 = R := by
      rw [hn, Nat.add_mod]
      simp only [Nat.mul_mod, Nat.mod_self, Nat.zero_mul, Nat.zero_mod, Nat.zero_add, Nat.mod_mod]
      rw [Nat.mod_eq_of_lt (by omega : R-1 < D)]
      omega
    have hval : value x l.sum = 8*Q+block x R := by
      unfold value
      change 8*((l.sum-1)/D)+block x ((l.sum-1)%D+1) = _
      rw [hmod, hquot, Nat.div_eq_of_lt (by omega : R-1 < D)]
      omega
    have hlow : xorList (l.map (value x)) % 8 = xorList (rs.map (block x)) := by
      rw [xorList_mod_eight, List.map_map]
      simp only [rs, D, List.map_map, Function.comp_def, value_mod_eight]
    have hE : excess rs ≤ R-(3*x+2) := by dsimp [R] at *; omega
    have hrlower : 3*x+2 ≤ R := by dsimp [R] at *; omega
    have hbound : xorList (rs.map (block x)) < block x R := by
      by_cases h4 : R ≤ 4*x
      · have hb := xor_blocks_small x rs (by omega) (by omega)
        have hbr : 2 ≤ block x R := by unfold block; split_ifs <;> omega
        omega
      · by_cases h5 : R ≤ 5*x
        · have hb := xor_blocks_medium x rs (by omega) (by omega)
          have hbr : 4 ≤ block x R := by unfold block; split_ifs <;> omega
          omega
        · have hb := xor_blocks_third x rs hx (by dsimp [D] at *; omega)
          have hbr : 6 ≤ block x R := by unfold block; split_ifs <;> omega
          omega
    omega

#print axioms large_cut_decreases

/-- An option is a legal split from the actual rules of CUT. -/
def OptionValue (cuts : Set Nat) (f : Nat → Nat) (n g : Nat) : Prop :=
  ∃ l : List Nat, (∀ h ∈ l, 0 < h) ∧ 2 ≤ l.length ∧
    l.length-1 ∈ cuts ∧ l.sum = n ∧ xorList (l.map f) = g

def IsMex (options : Nat → Prop) (g : Nat) : Prop :=
  ¬ options g ∧ ∀ v < g, options v

def SatisfiesMex (cuts : Set Nat) (f : Nat → Nat) : Prop :=
  ∀ n, 0 < n → IsMex (OptionValue cuts f n) (f n)

theorem mex_unique {options : Nat → Prop} {a b : Nat}
    (ha : IsMex options a) (hb : IsMex options b) : a=b := by
  rcases lt_trichotomy a b with h | h | h
  · exact False.elim (ha.1 (hb.2 a h))
  · exact h
  · exact False.elim (hb.1 (ha.2 b h))

theorem part_lt_sum (l : List Nat) (hpos : ∀ n ∈ l, 0 < n)
    (hlen : 2 ≤ l.length) (n : Nat) (hn : n ∈ l) : n < l.sum := by
  obtain ⟨a,b,rfl⟩ := List.append_of_mem hn
  have ha : ∀ r ∈ a, 0 < r := fun r hr => hpos r (by simp [hr])
  have hb : ∀ r ∈ b, 0 < r := fun r hr => hpos r (by simp [hr])
  have := excess_identity a ha
  have := excess_identity b hb
  simp only [List.length_append, List.length_cons, List.sum_append, List.sum_cons] at *
  omega

/-- The mex equations uniquely determine all positive pile values. -/
theorem grundy_unique (cuts : Set Nat) (f g : Nat → Nat)
    (hf : SatisfiesMex cuts f) (hg : SatisfiesMex cuts g) :
    ∀ n, 0 < n → f n = g n := by
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro hn
    have hop : OptionValue cuts f n = OptionValue cuts g n := by
      funext v
      apply propext
      constructor
      all_goals
        rintro ⟨l,hpos,hlen,hcut,hsum,hxor⟩
        refine ⟨l,hpos,hlen,hcut,hsum,?_⟩
      · have hmap : l.map f = l.map g := by
          apply List.map_congr_left
          intro h hh
          exact ih h (by rw [← hsum]; exact part_lt_sum l hpos hlen h hh) (hpos h hh)
        rw [← hmap]
        exact hxor
      · have hmap : l.map f = l.map g := by
          apply List.map_congr_left
          intro h hh
          exact ih h (by rw [← hsum]; exact part_lt_sum l hpos hlen h hh) (hpos h hh)
        rw [hmap]
        exact hxor
    apply mex_unique (hf n hn)
    rw [hop]
    exact hg n hn

/-- All new large cuts preserve the mex equations for the explicit formula.
Only the already-published base-game mex equations are hypotheses. -/
theorem large_cut_preserves_mex (x : Nat) (hx : 4 ≤ x)
    (base extra : Set Nat) (hbase : SatisfiesMex base (value x))
    (hextra : ∀ d ∈ extra, 3*x < d) :
    SatisfiesMex (base ∪ extra) (value x) := by
  intro n hn
  obtain ⟨habsent,hlower⟩ := hbase n hn
  constructor
  · rintro ⟨l,hpos,hlen,hcut,hsum,hxor⟩
    rcases hcut with hcut | hcut
    · exact habsent ⟨l,hpos,hlen,hcut,hsum,hxor⟩
    · have hd := hextra _ hcut
      have hlt := large_cut_decreases x hx l hpos (by omega)
      rw [hsum, hxor] at hlt
      omega
  · intro v hv
    obtain ⟨l,hpos,hlen,hcut,hsum,hxor⟩ := hlower v hv
    exact ⟨l,hpos,hlen,Or.inl hcut,hsum,hxor⟩

/-- The new game's actual mex function equals the published base formula,
conditional on the published base formula satisfying its mex equations. -/
theorem large_cut_preserves_grundy (x : Nat) (hx : 4 ≤ x)
    (base extra : Set Nat) (hbase : SatisfiesMex base (value x))
    (hextra : ∀ d ∈ extra, 3*x < d) (G : Nat → Nat)
    (hG : SatisfiesMex (base ∪ extra) G) : ∀ n, 0 < n → G n = value x n := by
  exact grundy_unique _ _ _ hG (large_cut_preserves_mex x hx base extra hbase hextra)

#print axioms large_cut_preserves_grundy


/-- Every feasible total is realized by a fixed number of bounded positive parts. -/
theorem bounded_composition (x d S : Nat) (hx : 1 ≤ x)
    (hlo : d ≤ S) (hhi : S ≤ d*x) :
    ∃ l : List Nat, l.length=d ∧ l.sum=S ∧ ∀ r ∈ l, 1 ≤ r ∧ r ≤ x := by
  induction d generalizing S with
  | zero =>
    have : S=0 := by omega
    subst S
    exact ⟨[],by simp,by simp,by simp⟩
  | succ d ih =>
    let a := min x (S-d)
    have ha : 1 ≤ a ∧ a ≤ x ∧ a ≤ S := by dsimp [a]; omega
    have hrlo : d ≤ S-a := by dsimp [a]; omega
    have hrhi : S-a ≤ d*x := by
      dsimp [a]
      by_cases h : x ≤ S-d
      · rw [Nat.min_eq_left h]
        have hhi2 : S ≤ d*x+x := by nlinarith only [hhi]
        omega
      · rw [Nat.min_eq_right (by omega)]
        have hdx : d ≤ d*x := by nlinarith
        omega
    obtain ⟨l,hlen,hsum,hparts⟩ := ih (S-a) hrlo hrhi
    refine ⟨a::l,by simp [hlen],by simp [hsum]; omega,?_⟩
    intro r hr
    rcases List.mem_cons.mp hr with rfl | hr
    · exact ⟨ha.1,ha.2.1⟩
    · exact hparts r hr

theorem value_first_period (x n : Nat) (hn : 1 ≤ n) (hu : n ≤ 6*x) :
    value x n = block x n := by
  have h : n-1 < 6*x := by omega
  have he : n-1+1=n := by omega
  simp only [value, Nat.div_eq_of_lt h, Nat.mod_eq_of_lt h, he, Nat.mul_zero, Nat.zero_add]

theorem small_xor_parity (x : Nat) (l : List Nat)
    (hparts : ∀ r ∈ l, 1 ≤ r ∧ r ≤ x) :
    xorList (l.map (value x)) = (l.sum+l.length)%2 := by
  induction l with
  | nil => simp [xorList]
  | cons r l ih =>
    have hr := hparts r (by simp)
    have ht : ∀ s ∈ l, 1 ≤ s ∧ s ≤ x := fun s hs => hparts s (by simp [hs])
    have hi := ih ht
    have hv : value x r = (r+1)%2 := by
      rw [value_first_period x r hr.1 (by omega)]
      simp only [block, ite_eq_left hr.2]
    have hxor := Nat.xor_mod_two_eq (m := value x r) (n := xorList (l.map (value x)))
    have hbound : value x r ^^^ xorList (l.map (value x)) < 2 :=
      Nat.xor_lt_two_pow (n:=1) (by rw [hv]; omega) (by rw [hi]; omega)
    simp only [List.map_cons, xorList, List.sum_cons, List.length_cons]
    omega

/-- A smaller odd cut has a legal split of 4x whose base-formula XOR
is exactly the base-formula value at 4x. -/
theorem sharp_collision (x d : Nat) (hx : 4 ≤ x) (heven : x%2=0)
    (hd : 5 ≤ d) (hodd : d%2=1) (hlt : d < 3*x) :
    ∃ l : List Nat, (∀ r ∈ l, 0 < r) ∧ l.length=d+1 ∧
      l.sum=4*x ∧ xorList (l.map (value x))=value x (4*x) := by
  obtain ⟨l,hlen,hsum,hparts⟩ := bounded_composition x d (3*x-1) (by omega)
    (by omega) (by
      have hmul : 3*x ≤ d*x := Nat.mul_le_mul_right x (by omega)
      omega)
  have hpar := small_xor_parity x l hparts
  have hzero : xorList (l.map (value x)) = 0 := by rw [hlen,hsum] at hpar; omega
  have hx1 : value x (x+1)=2 := by
    rw [value_first_period x (x+1) (by omega) (by omega)]
    unfold block
    split_ifs <;> omega
  have hx4 : value x (4*x)=2 := by
    rw [value_first_period x (4*x) (by omega) (by omega)]
    unfold block
    split_ifs <;> omega
  refine ⟨(x+1)::l,?_,by simp [hlen],by simp [hsum]; omega,?_⟩
  · intro r hr
    rcases List.mem_cons.mp hr with rfl | hr
    · omega
    · exact (hparts r hr).1
  · simp [xorList,hzero,hx1,hx4]

/-- Any CUT game allowing the smaller odd cut differs from the explicit base
formula by pile size 4x. No assumption about the other cuts is required. -/
theorem small_odd_cut_forces_difference (x d : Nat) (hx : 4 ≤ x) (heven : x%2=0)
    (hd : 5 ≤ d) (hodd : d%2=1) (hlt : d < 3*x)
    (cuts : Set Nat) (hcut : d ∈ cuts) (G : Nat → Nat) (hG : SatisfiesMex cuts G) :
    ∃ n, 0 < n ∧ n ≤ 4*x ∧ G n ≠ value x n := by
  classical
  by_contra hnone
  have hagree : ∀ n, 0 < n → n ≤ 4*x → G n = value x n := by
    intro n hn hle
    by_contra hne
    exact hnone ⟨n,hn,hle,hne⟩
  obtain ⟨l,hpos,hlen,hsum,hxor⟩ := sharp_collision x d hx heven hd hodd hlt
  have hmap : l.map G = l.map (value x) := by
    apply List.map_congr_left
    intro r hr
    exact hagree r (hpos r hr) (by
      have h := part_lt_sum l hpos (by omega) r hr
      rw [hsum] at h
      omega)
  have hmex := (hG (4*x) (by omega)).1
  apply hmex
  refine ⟨l,hpos,by omega,?_,hsum,?_⟩
  · simpa [hlen] using hcut
  · rw [hmap,hxor,← hagree (4*x) (by omega) (by omega)]

#print axioms small_odd_cut_forces_difference

/-- The sharp threshold, conditional only on the explicit published base formula.
The base set can include all the additional even cuts from Family B. -/
theorem family_b_threshold_of_base_formula (x y : Nat)
    (hx : 4 ≤ x) (heven : x%2=0) (hy : 5 ≤ y) (hodd : y%2=1)
    (base extra : Set Nat) (hyextra : y ∈ extra)
    (hmin : ∀ d ∈ extra, y ≤ d)
    (hbase : SatisfiesMex base (value x)) (G : Nat → Nat)
    (hG : SatisfiesMex (base ∪ extra) G) :
    (∀ n, 0 < n → G n = value x n) ↔ 3*x < y := by
  constructor
  · intro hagree
    by_contra hle
    have hlt : y < 3*x := by omega
    obtain ⟨n,hn,_,hne⟩ := small_odd_cut_forces_difference x y hx heven hy hodd hlt
      (base ∪ extra) (Or.inr hyextra) G hG
    exact hne (hagree n hn)
  · intro hgt
    exact large_cut_preserves_grundy x hx base extra hbase
      (fun d hd => lt_of_lt_of_le hgt (hmin d hd)) G hG

#print axioms family_b_threshold_of_base_formula
end CutFamily
