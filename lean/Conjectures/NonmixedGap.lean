import Conjectures.NonmixedGapDensity

/-! Two nonmixed gaps: integer geometry and exact packing bounds. -/

namespace NonmixedGap

def Avoids (A : Set ℤ) (a b k m : ℤ) : Prop :=
  ∀ t ∈ A, ∀ i j : ℤ, 0 ≤ i → i ≤ k → 0 ≤ j → j ≤ m → 0 < i+j →
    t + (i*a+j*b) ∉ A

theorem avoids_swap {A : Set ℤ} {a b k m : ℤ}
    (h : Avoids A a b k m) : Avoids A b a m k := by
  intro t ht i j hi hik hj hjm hij
  simpa [add_comm, mul_comm] using h t ht j i hj hjm hi hik (by omega)

theorem avoids_translate {A : Set ℤ} {a b k m c : ℤ}
    (h : Avoids A a b k m) : Avoids {t | c+t ∈ A} a b k m := by
  intro t ht i j hi hik hj hjm hij
  simpa [add_assoc] using h (c+t) ht i j hi hik hj hjm hij

/-- The three possible ordered-lift displacements. Equal heights are allowed,
including the two copies of the anchored site at the ends of the path. -/
theorem displacement_cases {A : Set ℤ} {a b k m u v t t' : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hA : Avoids A a b k m) (ht : t ∈ A) (ht' : t' ∈ A)
    (ht0 : 0 ≤ t) (htn : t < (k+1)*a+m*b)
    (ht'0 : 0 ≤ t') (ht'n : t' < (k+1)*a+m*b)
    (heq : t' = t+a*u-b*v) (hw : 0 ≤ m*u+k*v)
    (hne : u ≠ 0 ∨ v ≠ 0) :
    (1 ≤ u ∧ 1 ≤ v) ∨
    (k+1 ≤ u ∧ 1-m ≤ v ∧ v ≤ 0) ∨
    (m+1 ≤ v ∧ -k ≤ u ∧ u ≤ 0) := by
  by_cases hv : v ≤ 0
  · have hu : 0 < u := by
      by_contra hn
      have hu0 : u ≤ 0 := by omega
      have hmu : m*u ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (by omega) hu0
      have hkv : k*v ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (by omega) hv
      have hmu0 : m*u = 0 := by omega
      have hkv0 : k*v = 0 := by omega
      have hu0' : u = 0 := (mul_eq_zero.mp hmu0).resolve_left (by omega)
      have hv0 : v = 0 := (mul_eq_zero.mp hkv0).resolve_left (by omega)
      omega
    have huk : k+1 ≤ u := by
      by_contra hn
      have huk' : u ≤ k := by omega
      have hmuk : m*u ≤ m*k := mul_le_mul_of_nonneg_left huk' (by omega)
      have hvm : -v ≤ m := by nlinarith
      have hex : t+(u*a+(-v)*b) ∈ A := by
        convert ht' using 1 <;> nlinarith only [heq]
      exact hA t ht u (-v) (by omega) huk' (by omega) hvm (by omega) hex
    have hvm : 1-m ≤ v := by
      by_contra hn
      have hvm' : v ≤ -m := by omega
      have hau := mul_le_mul_of_nonneg_left huk (le_of_lt ha)
      have hbv := mul_le_mul_of_nonneg_left hvm' (le_of_lt hb)
      nlinarith only [heq, ht0, ht'n, hau, hbv]
    exact Or.inr (Or.inl ⟨huk,hvm,hv⟩)
  · by_cases hu : u ≤ 0
    · have hvp : 0 < v := by omega
      have hvm : m+1 ≤ v := by
        by_contra hn
        have hvm' : v ≤ m := by omega
        have hkvm : k*v ≤ k*m := mul_le_mul_of_nonneg_left hvm' (by omega)
        have huk : -u ≤ k := by nlinarith
        have hex : t'+((-u)*a+v*b) ∈ A := by
          convert ht using 1 <;> nlinarith only [heq]
        exact hA t' ht' (-u) v (by omega) huk (by omega) hvm' (by omega) hex
      have huk : -k ≤ u := by
        by_contra hn
        have huk' : u ≤ -k-1 := by omega
        have hau := mul_le_mul_of_nonneg_left huk' (le_of_lt ha)
        have hbv := mul_le_mul_of_nonneg_left hvm (le_of_lt hb)
        nlinarith only [heq, ht'0, htn, hau, hbv, hb]
      exact Or.inr (Or.inr ⟨hvm,huk,hu⟩)
    · exact Or.inl ⟨by omega,by omega⟩

/-- The signed excess of a step: one for a nonpositive first coordinate,
minus one for a nonpositive second coordinate. -/
def stepExcess (u v : ℤ) : ℤ :=
  (if u ≤ 0 then 1 else 0) - (if v ≤ 0 then 1 else 0)

/-- The local inequalities sum directly to both interval counts. -/
theorem displacement_bounds {A : Set ℤ} {a b k m u v t t' : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hA : Avoids A a b k m) (ht : t ∈ A) (ht' : t' ∈ A)
    (ht0 : 0 ≤ t) (htn : t < (k+1)*a+m*b)
    (ht'0 : 0 ≤ t') (ht'n : t' < (k+1)*a+m*b)
    (heq : t' = t+a*u-b*v) (hw : 0 ≤ m*u+k*v)
    (hne : u ≠ 0 ∨ v ≠ 0) :
    0 < m*u+k*v ∧
    1+m*stepExcess u v ≤ v ∧
    (if t < k*a+(m+1)*b then 1 else 0) - k*stepExcess u v ≤ u := by
  rcases displacement_cases ha hb hk hm hA ht ht' ht0 htn ht'0 ht'n heq hw hne
      with ⟨hu,hv⟩ | ⟨hu,hv,hv0⟩ | ⟨hv,hu,hu0⟩
  · have hs : stepExcess u v = 0 := by simp [stepExcess,show ¬u ≤ 0 by omega,
        show ¬v ≤ 0 by omega]
    rw [hs]
    have hmu := mul_le_mul_of_nonneg_left hu (le_of_lt hm)
    have hkv := mul_le_mul_of_nonneg_left hv (le_of_lt hk)
    constructor
    · nlinarith only [hmu,hkv,hm,hk]
    constructor
    · omega
    · split_ifs <;> omega
  · have hs : stepExcess u v = -1 := by
      simp [stepExcess,show ¬u ≤ 0 by omega,hv0]
    rw [hs]
    have hmu := mul_le_mul_of_nonneg_left hu (le_of_lt hm)
    have hkv := mul_le_mul_of_nonneg_left hv (le_of_lt hk)
    constructor
    · nlinarith only [hmu,hkv,hm,hk]
    constructor
    · omega
    · split_ifs <;> omega
  · have hs : stepExcess u v = 1 := by
      simp [stepExcess,hu0,show ¬v ≤ 0 by omega]
    rw [hs]
    have hmu := mul_le_mul_of_nonneg_left hu (le_of_lt hm)
    have hkv := mul_le_mul_of_nonneg_left hv (le_of_lt hk)
    constructor
    · nlinarith only [hmu,hkv,hm,hk]
    constructor
    · omega
    · split_ifs with hsmall
      · have hu' : 1-k ≤ u := by
          by_contra hn
          have hueq : u = -k := by omega
          have hbv := mul_le_mul_of_nonneg_left hv (le_of_lt hb)
          rw [hueq] at heq
          nlinarith only [heq, ht'0, hsmall, hbv]
        omega
      · omega

/-- Numerical identities underlying the two density branches. -/
theorem branch_identities (a b k m d r : ℤ)
    (heq : a-b = (k+m+1)*d+r) :
    k*a+(m+1)*b = (k+m+1)*(b+k*d)+k*r ∧
    a*(b+k*d)-b*(b+k*d+r) = d*(k*a+(m+1)*b) ∧
    (b+k*d)*((k+1)*a+m*b)-(b+(k+1)*d)*(k*a+(m+1)*b) = b*r ∧
    (a-m*(d+1))*(k*a+(m+1)*b) -
      (a-(m+1)*(d+1))*((k+1)*a+m*b) = a*(k+m+1-r) := by
  have ha : a = b+(k+m+1)*d+r := by omega
  subst a
  constructor
  · ring
  constructor
  · ring
  constructor <;> ring

/-- Exchanging the gap lengths exchanges the two nonzero remainder branches. -/
theorem swap_remainder (a b k m d r : ℤ)
    (heq : a-b = (k+m+1)*d+r) :
    b-a = (m+k+1)*(-d-1)+(m+k+1-r) := by
  nlinarith only [heq]

def height (a b : ℤ) (p : ℤ × ℤ) : ℤ := a*p.1-b*p.2

def weight (k m : ℤ) (p : ℤ × ℤ) : ℤ := m*p.1+k*p.2

def normalizedLift (a b k m U V t : ℤ) : ℤ × ℤ :=
  let q := ((m*U-k*V)*t)/(k*a+m*b)
  (U*t-q*b, -V*t-q*a)

theorem normalizedLift_height (a b k m U V t : ℤ)
    (hbez : U*a+V*b=1) : height a b (normalizedLift a b k m U V t) = t := by
  unfold height normalizedLift
  dsimp
  calc
    _ = (U*a+V*b)*t := by ring
    _ = t := by rw [hbez]; ring

theorem normalizedLift_weight (a b k m U V t : ℤ) :
    weight k m (normalizedLift a b k m U V t) = ((m*U-k*V)*t)%(k*a+m*b) := by
  unfold weight normalizedLift
  dsimp
  have hh := Int.emod_add_mul_ediv ((m*U-k*V)*t) (k*a+m*b)
  calc
    _ = (m*U-k*V)*t - (k*a+m*b)*(((m*U-k*V)*t)/(k*a+m*b)) := by ring
    _ = ((m*U-k*V)*t)%(k*a+m*b) := by omega

@[simp] theorem normalizedLift_zero (a b k m U V : ℤ) :
    normalizedLift a b k m U V 0 = (0,0) := by simp [normalizedLift]

theorem normalizedLift_injective (a b k m U V : ℤ) (hbez : U*a+V*b=1) :
    Function.Injective (normalizedLift a b k m U V) := by
  intro t t' h
  have hh := congrArg (height a b) h
  simpa only [normalizedLift_height a b k m U V _ hbez] using hh

def GoodPoint (A : Set ℤ) (a b k m : ℤ) (p : ℤ × ℤ) : Prop :=
  height a b p ∈ A ∧ 0 ≤ height a b p ∧ height a b p < (k+1)*a+m*b ∧
    0 ≤ weight k m p ∧ weight k m p < k*a+m*b

theorem lift_good {A : Set ℤ} {a b k m U V t : ℤ}
    (hD : 0 < k*a+m*b) (hbez : U*a+V*b=1)
    (ht : t ∈ A) (ht0 : 0 ≤ t) (htn : t < (k+1)*a+m*b) :
    GoodPoint A a b k m (normalizedLift a b k m U V t) := by
  unfold GoodPoint
  rw [normalizedLift_height _ _ _ _ _ _ _ hbez, normalizedLift_weight]
  exact ⟨ht,ht0,htn,Int.emod_nonneg _ (by omega),Int.emod_lt_of_pos _ hD⟩

theorem ordered_points_strict {A : Set ℤ} {a b k m : ℤ} {p q : ℤ × ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hA : Avoids A a b k m) (hp : GoodPoint A a b k m p)
    (hq : GoodPoint A a b k m q) (hpq : p ≠ q)
    (hw : weight k m p ≤ weight k m q) : weight k m p < weight k m q := by
  obtain ⟨ht,ht0,htn,_,_⟩ := hp
  obtain ⟨ht',ht'0,ht'n,_,_⟩ := hq
  have hdiff : 0 ≤ m*(q.1-p.1)+k*(q.2-p.2) := by
    unfold weight at hw
    nlinarith only [hw]
  have hne : q.1-p.1 ≠ 0 ∨ q.2-p.2 ≠ 0 := by
    by_contra hn
    push_neg at hn
    apply hpq
    exact Prod.ext (by omega) (by omega)
  have hh := (displacement_bounds ha hb hk hm hA ht ht' ht0 htn ht'0 ht'n
    (by unfold height; ring) hdiff hne).1
  unfold weight
  nlinarith only [hh]

/-- Sum the local inequalities along any strictly weight-ordered lift path.
The final endpoint is `(b,a)` and is not counted as a new center. -/
theorem path_count_bounds {A : Set ℤ} {a b k m : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hA : Avoids A a b k m) (hzero : 0 ∈ A)
    (p : ℤ × ℤ) (l : List (ℤ × ℤ))
    (hp : GoodPoint A a b k m p)
    (hl : ∀ q ∈ l, GoodPoint A a b k m q)
    (hord : (p::l).Pairwise (fun p q => weight k m p < weight k m q)) :
    ∃ z : ℤ,
      ((p::l).map (fun q => if height a b q < k*a+(m+1)*b then (1:ℤ) else 0)).sum
        ≤ b-p.1+k*z ∧
      ((p::l).length : ℤ) ≤ a-p.2-m*z := by
  induction l generalizing p with
  | nil =>
    obtain ⟨ht,ht0,htn,hwp,hwpD⟩ := hp
    have hn2 : 0 < (k+1)*a+m*b := by positivity
    have hw : 0 ≤ m*(b-p.1)+k*(a-p.2) := by
      unfold weight at hwpD
      nlinarith only [hwpD]
    have hne : b-p.1 ≠ 0 ∨ a-p.2 ≠ 0 := by
      by_contra hn
      push_neg at hn
      unfold weight at hwpD
      have h1 : p.1 = b := by omega
      have h2 : p.2 = a := by omega
      rw [h1,h2] at hwpD
      nlinarith only [hwpD]
    obtain ⟨_,hv,hu⟩ := displacement_bounds ha hb hk hm hA ht hzero ht0 htn
      (by omega) hn2 (by unfold height; ring) hw hne
    refine ⟨stepExcess (b-p.1) (a-p.2),?_,?_⟩
    · simp only [List.map_cons,List.map_nil,List.sum_cons,List.sum_nil,add_zero]
      omega
    · simp only [List.length_cons,List.length_nil,Nat.cast_add,Nat.cast_zero,Nat.cast_one]
      omega
  | cons q qs ih =>
    have hq := hl q (by simp)
    have hqs : ∀ r ∈ qs, GoodPoint A a b k m r := by
      intro r hr
      exact hl r (by simp [hr])
    obtain ⟨hpq,hrest⟩ := List.pairwise_cons.mp hord
    obtain ⟨z,hx,hy⟩ := ih q hq hqs hrest
    obtain ⟨ht,ht0,htn,_,_⟩ := hp
    obtain ⟨ht',ht'0,ht'n,_,_⟩ := hq
    have hwq := hpq q (by simp)
    have hw : 0 ≤ m*(q.1-p.1)+k*(q.2-p.2) := by
      unfold weight at hwq
      nlinarith only [hwq]
    have hne : q.1-p.1 ≠ 0 ∨ q.2-p.2 ≠ 0 := by
      by_contra hn
      push_neg at hn
      unfold weight at hwq
      have h1 : q.1 = p.1 := by omega
      have h2 : q.2 = p.2 := by omega
      rw [h1,h2] at hwq
      exact lt_irrefl _ hwq
    obtain ⟨_,hv,hu⟩ := displacement_bounds ha hb hk hm hA ht ht' ht0 htn ht'0 ht'n
      (by unfold height; ring) hw hne
    refine ⟨stepExcess (q.1-p.1) (q.2-p.2)+z,?_,?_⟩
    · simp only [List.map_cons,List.sum_cons]
      simp only [List.map_cons,List.sum_cons] at hx
      nlinarith only [hu,hx]
    · simp only [List.length_cons,Nat.cast_add,Nat.cast_one] at hy ⊢
      nlinarith only [hv,hy]

theorem exists_sorted_by {α : Type*} (l : List α) (f : α → ℤ) :
    ∃ l' : List α, l'.Perm l ∧ l'.Pairwise (fun x y => f x ≤ f y) := by
  let cmp := fun x y => decide (f x ≤ f y)
  refine ⟨l.mergeSort cmp,List.mergeSort_perm _ _,?_⟩
  have htrans : ∀ x y z, cmp x y → cmp y z → cmp x z := by
    intro x y z hxy hyz
    simp only [cmp,decide_eq_true_eq] at hxy hyz ⊢
    omega
  have htotal : ∀ x y, cmp x y || cmp y x := by
    intro x y
    simp only [cmp,Bool.or_eq_true,decide_eq_true_eq]
    omega
  simpa only [cmp,decide_eq_true_eq] using List.pairwise_mergeSort htrans htotal l

/-- The finite anchored counting lemma. There is no restriction on the number
of centers or on the sizes of the four parameters. -/
theorem finite_counting {A : Set ℤ} {a b k m U V : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m)
    (hbez : U*a+V*b=1) (hA : Avoids A a b k m)
    (F : Finset ℤ) (hzero : 0 ∈ F)
    (hF : ∀ t ∈ F, t ∈ A ∧ 0 ≤ t ∧ t < (k+1)*a+m*b) :
    ∃ z : ℤ, ((F.filter (· < k*a+(m+1)*b)).card : ℤ) ≤ b+k*z ∧
      (F.card : ℤ) ≤ a-m*z := by
  classical
  let lift := normalizedLift a b k m U V
  have hD : 0 < k*a+m*b := by positivity
  have hlift : ∀ t ∈ F, GoodPoint A a b k m (lift t) := by
    intro t ht
    obtain ⟨htA,ht0,htn⟩ := hF t ht
    exact lift_good hD hbez htA ht0 htn
  obtain ⟨l,hperm,hord⟩ := exists_sorted_by (F.erase 0).toList (weight k m ∘ lift)
  have hlmem : ∀ t, t ∈ l ↔ t ≠ 0 ∧ t ∈ F := by
    intro t
    rw [hperm.mem_iff,Finset.mem_toList,Finset.mem_erase]
  have hlnodup : l.Nodup := hperm.nodup_iff.mpr (F.erase 0).nodup_toList
  have hnodup : (0::l).Nodup := by
    apply List.nodup_cons.mpr
    exact ⟨by simpa [hlmem] using (not_false : ¬False),hlnodup⟩
  have hmem : ∀ t, t ∈ (0::l) ↔ t ∈ F := by
    intro t
    simp only [List.mem_cons,hlmem]
    by_cases ht : t=0
    · subst t; simp [hzero]
    · simp [ht]
  have hfin : (0::l).toFinset = F := by ext t; simpa using hmem t
  have hlength : (0::l).length = F.card := by
    rw [←hfin,List.toFinset_card_of_nodup hnodup]
  have hlistgood : ∀ p ∈ (0::l).map lift, GoodPoint A a b k m p := by
    intro p hp
    obtain ⟨t,ht,rfl⟩ := List.mem_map.mp hp
    exact hlift t ((hmem t).mp ht)
  have hle : ((0::l).map lift).Pairwise (fun p q => weight k m p ≤ weight k m q) := by
    rw [List.pairwise_map]
    apply List.pairwise_cons.mpr
    refine ⟨?_,hord⟩
    intro t ht
    have hh := (hlift t ((hlmem t).mp ht).2).2.2.2.1
    simpa only [lift,normalizedLift_zero,weight,Int.mul_zero,add_zero] using hh
  have hmapnodup := hnodup.map (normalizedLift_injective a b k m U V hbez)
  have hstrict : ((0::l).map lift).Pairwise (fun p q => weight k m p < weight k m q) := by
    apply (hle.and hmapnodup).imp_of_mem
    intro p q hp hq hrel
    exact ordered_points_strict ha hb hk hm hA (hlistgood p hp) (hlistgood q hq)
      hrel.2 hrel.1
  have hzeroA := (hF 0 hzero).1
  have hp : GoodPoint A a b k m (0,0) := by
    simpa only [lift,normalizedLift_zero] using hlift 0 hzero
  have hrest : ∀ q ∈ l.map lift, GoodPoint A a b k m q := by
    intro q hq
    exact hlistgood q (by simp only [List.map_cons,List.mem_cons]; exact Or.inr hq)
  have hstrict' : ((0,0)::l.map lift).Pairwise (fun p q => weight k m p < weight k m q) := by
    simpa only [List.map_cons,lift,normalizedLift_zero] using hstrict
  obtain ⟨z,hx,hy⟩ := path_count_bounds ha hb hk hm hA hzeroA (0,0) (l.map lift)
    hp hrest hstrict'
  refine ⟨z,?_,?_⟩
  · have hsum : (((0::l).map lift).map
        (fun q => if height a b q < k*a+(m+1)*b then (1:ℤ) else 0)).sum =
        ((F.filter (· < k*a+(m+1)*b)).card : ℤ) := by
      calc
        _ = ((0::l).map (fun t => if t < k*a+(m+1)*b then (1:ℤ) else 0)).sum := by
          congr 1
          rw [List.map_map]
          apply List.map_congr_left
          intro t ht
          dsimp [lift]
          rw [normalizedLift_height _ _ _ _ _ _ _ hbez]
        _ = _ := by
          rw [←List.sum_toFinset _ hnodup,hfin]
          exact Finset.sum_boole (fun t : ℤ => t < k*a+(m+1)*b) F
    have hx' : (((0::l).map lift).map
        (fun q => if height a b q < k*a+(m+1)*b then (1:ℤ) else 0)).sum ≤ b+k*z := by
      simpa only [List.map_cons,lift,normalizedLift_zero,Prod.fst,sub_zero] using hx
    rw [hsum] at hx'
    exact hx'
  · have hlen' : ((0,0)::l.map lift).length = F.card := by
      simpa only [List.length_cons,List.length_map] using hlength
    simpa only [hlen',Prod.snd,sub_zero] using hy

/-- The paper's two interval counts, for arbitrary anchored avoiding sets. -/
theorem interval_counting {A : Set ℤ} {a b k m U V : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 < k) (hm : 0 < m) (hab : b ≤ a)
    (hbez : U*a+V*b=1) (hA : Avoids A a b k m) (hzero : 0 ∈ A) :
    ∃ z : ℤ,
      ((occupied A 0 (k*a+(m+1)*b)).card : ℤ) ≤ b+k*z ∧
      ((occupied A 0 ((k+1)*a+m*b)).card : ℤ) ≤ a-m*z := by
  classical
  have hlen : k*a+(m+1)*b ≤ (k+1)*a+m*b := by nlinarith only [hab]
  let F := occupied A 0 ((k+1)*a+m*b)
  have hz : 0 ∈ F := by
    change 0 ∈ occupied _ _ _
    rw [mem_occupied]
    exact ⟨by omega,by positivity,hzero⟩
  have hF : ∀ t ∈ F, t ∈ A ∧ 0 ≤ t ∧ t < (k+1)*a+m*b := by
    intro t ht
    have hh := mem_occupied.mp ht
    exact ⟨hh.2.2,hh.1,hh.2.1⟩
  obtain ⟨z,hx,hy⟩ := finite_counting ha hb hk hm hbez hA F hz hF
  have hfilt : F.filter (· < k*a+(m+1)*b) = occupied A 0 (k*a+(m+1)*b) := by
    ext t
    simp only [Finset.mem_filter,F,mem_occupied]
    constructor
    · rintro ⟨⟨ht0,ht2,htA⟩,ht1⟩
      exact ⟨ht0,ht1,htA⟩
    · rintro ⟨ht0,ht1,htA⟩
      exact ⟨⟨ht0,lt_of_lt_of_le ht1 hlen,htA⟩,ht1⟩
  exact ⟨z,by simpa only [hfilt] using hx,hy⟩

end NonmixedGap
