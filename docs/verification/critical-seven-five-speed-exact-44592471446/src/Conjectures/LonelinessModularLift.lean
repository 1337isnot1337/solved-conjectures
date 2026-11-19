import Conjectures.LonelinessModularWitness

/-! Exact coverage of binary residue lifts and the complementary distances
used by the modular search. These lemmas do not assume the search terminates. -/

namespace Loneliness.Modular

def binaryLift {ι : Type*} (m : ℕ) (x : ι → ℕ) (bits : ι → Bool) : ι → ℕ :=
  fun i => x i + if bits i then m else 0

theorem binaryLift_mod {ι : Type*} (m : ℕ) (x : ι → ℕ) (bits : ι → Bool) (i : ι) :
    binaryLift m x bits i % m = x i % m := by
  cases h : bits i <;> simp [binaryLift,h]

theorem binaryLift_lt {ι : Type*} {m : ℕ} {x : ι → ℕ}
    (hx : ∀ i, x i<m) (bits : ι → Bool) (i : ι) : binaryLift m x bits i < 2*m := by
  have hi := hx i
  cases h : bits i <;> simp only [binaryLift,h,Bool.false_eq_true,ite_false,ite_true]
  all_goals omega

theorem residue_binary_iff {m x y : ℕ} (hx : x<m) (hy : y<2*m) :
    y%m=x ↔ y=x ∨ y=x+m := by
  by_cases h : y<m
  · rw [Nat.mod_eq_of_lt h]
    omega
  · have hs : y-m<m := by omega
    rw [Nat.mod_eq_sub_mod (by omega),Nat.mod_eq_of_lt hs]
    omega

/-- Every residue over a fixed parent is exactly one of the binary lifts. -/
theorem binaryLift_complete {ι : Type*} {m : ℕ} {x y : ι → ℕ}
    (hx : ∀ i, x i<m) (hy : ∀ i, y i<2*m) (hparent : ∀ i, y i%m=x i) :
    ∃ bits : ι → Bool, y=binaryLift m x bits := by
  refine ⟨fun i => decide (m≤y i),?_⟩
  funext i
  have hh := (residue_binary_iff (hx i) (hy i)).mp (hparent i)
  by_cases h : m≤y i
  · simp only [binaryLift,decide_eq_true h,ite_true]
    have hi := hx i
    omega
  · simp only [binaryLift,decide_eq_false h,Bool.false_eq_true,ite_false,Nat.add_zero]
    omega

theorem binaryLift_injective {ι : Type*} {m : ℕ} (hm : 0<m) (x : ι → ℕ) :
    Function.Injective (binaryLift m x) := by
  intro bits bits' h
  funext i
  have hi := congrFun h i
  cases hb : bits i <;> cases hb' : bits' i <;>
    simp only [binaryLift,hb,hb',Bool.false_eq_true,ite_false,ite_true,Nat.add_zero] at hi ⊢
  all_goals omega

/-- Exhausting the `2^n` bit choices covers every integer tuple reducing
to the given residue tuple, with no bound on its integer coordinates. -/
theorem integer_residues_binaryLift {ι : Type*} (v : ι → ℕ) {m : ℕ} (hm : 0<m) :
    ∃ bits : ι → Bool, (fun i => v i%(2*m))=binaryLift m (fun i => v i%m) bits := by
  apply binaryLift_complete
  · intro i
    exact Nat.mod_lt _ hm
  · intro i
    exact Nat.mod_lt _ (by omega)
  · intro i
    exact Nat.mod_mod_of_dvd _ ⟨2,by omega⟩

theorem folded_add_half (m a : ℕ) :
    folded (2*m) (a+m) + folded (2*m) a = m := by
  by_cases hm : m=0
  · subst m
    simp [folded]
  have hmpos : 0<m := Nat.pos_of_ne_zero hm
  have hr : a%(2*m)<2*m := Nat.mod_lt _ (by omega)
  have he : folded (2*m) (a+m)=folded (2*m) (a%(2*m)+m) :=
    folded_eq_of_mod_eq (by simp [Nat.add_mod])
  rw [he]
  by_cases hlow : a%(2*m)<m
  · have hsum : a%(2*m)+m<2*m := by omega
    have hf : folded (2*m) a=a%(2*m) := by
      unfold folded
      omega
    have hg : folded (2*m) (a%(2*m)+m)=m-a%(2*m) := by
      unfold folded
      rw [Nat.mod_eq_of_lt hsum]
      omega
    rw [hf,hg]
    omega
  · have hsum : 2*m≤a%(2*m)+m := by omega
    have hsub : a%(2*m)+m-2*m<2*m := by omega
    have hmod : (a%(2*m)+m)%(2*m)=a%(2*m)-m := by
      rw [Nat.mod_eq_sub_mod hsum,Nat.mod_eq_of_lt hsub]
      omega
    have hf : folded (2*m) a=2*m-a%(2*m) := by
      unfold folded
      omega
    have hg : folded (2*m) (a%(2*m)+m)=a%(2*m)-m := by
      unfold folded
      rw [hmod]
      omega
    rw [hf,hg]
    omega

theorem folded_odd_lift (m a t : ℕ) (ht : t%2=1) :
    folded (2*m) (t*(a+m))=m-folded (2*m) (t*a) := by
  by_cases hm : m=0
  · subst m
    simp [folded]
  have hmpos : 0<m := Nat.pos_of_ne_zero hm
  have htm : (t*m)%(2*m)=m := by
    calc
      (t*m)%(2*m) = (m*t)%(m*2) := by congr 1 <;> ring
      _ = m*(t%2) := Nat.mul_mod_mul_left m t 2
      _ = m := by rw [ht]; simp
  have he : folded (2*m) (t*(a+m))=folded (2*m) (t*a+m) := by
    apply folded_eq_of_mod_eq
    simp only [Nat.mul_add,Nat.add_mod,htm,
      Nat.mod_eq_of_lt (show m<2*m by omega),Nat.mod_mod]
  rw [he]
  have hsum := folded_add_half m (t*a)
  omega

/-- For odd multipliers the two possible child distances are complementary.
This is the exact arithmetic used by the bit-mask witness pruning. -/
theorem folded_binaryLift {ι : Type*} (m t : ℕ) (x : ι → ℕ) (bits : ι → Bool)
    (ht : t%2=1) (i : ι) :
    folded (2*m) (t*binaryLift m x bits i) =
      if bits i then m-folded (2*m) (t*x i) else folded (2*m) (t*x i) := by
  cases hb : bits i
  · simp [binaryLift,hb]
  · simpa only [binaryLift,hb,ite_true] using folded_odd_lift m (x i) t ht

/-- At most one of the two child residues can have a distance below a
threshold strictly smaller than one quarter of the child modulus. -/
theorem short_child_unique (m a bound : ℕ) (hb : 2*bound<m)
    (h₀ : folded (2*m) a≤bound) : ¬ folded (2*m) (a+m)≤bound := by
  have hsum := folded_add_half m a
  omega

theorem witness_ofFn_iff {n k m t : ℕ} (x : Fin n → ℕ) :
    Witness k m t (List.ofFn x) ↔ ∀ i, m≤k*folded m (t*x i) := by
  constructor
  · intro h i
    exact h (x i) (List.mem_ofFn.mpr ⟨i,rfl⟩)
  · intro h d hd
    obtain ⟨i,rfl⟩ := List.mem_ofFn.mp hd
    exact h i

theorem witness_ofFn_mod_congr {n k m t : ℕ} {x y : Fin n → ℕ}
    (hxy : ∀ i, x i%m=y i%m) :
    Witness k m t (List.ofFn x) ↔ Witness k m t (List.ofFn y) := by
  rw [witness_ofFn_iff,witness_ofFn_iff]
  have he (i : Fin n) : folded m (t*x i)=folded m (t*y i) := by
    apply folded_eq_of_mod_eq
    simp only [Nat.mul_mod,hxy,Nat.mod_mod]
  simp only [he]

def ChildWitness {n : ℕ} (k m t : ℕ) (x : Fin n → ℕ) (bits : Fin n → Bool) : Prop :=
  ∀ i, 2*m≤k*(if bits i then m-folded (2*m) (t*x i) else folded (2*m) (t*x i))

instance {n : ℕ} (k m t : ℕ) (x : Fin n → ℕ) (bits : Fin n → Bool) :
    Decidable (ChildWitness k m t x bits) :=
  inferInstanceAs (Decidable (∀ i, 2*m≤k*(if bits i then
    m-folded (2*m) (t*x i) else folded (2*m) (t*x i))))

theorem childWitness_iff {n k m t : ℕ} (x : Fin n → ℕ) (bits : Fin n → Bool)
    (ht : t%2=1) : ChildWitness k m t x bits ↔
      Witness k (2*m) t (List.ofFn (binaryLift m x bits)) := by
  rw [witness_ofFn_iff]
  simp only [ChildWitness,folded_binaryLift m t x bits ht]

/-- A child deleted by the coordinate mask has an actual real-time witness.
Any integer tuple with those child residues is excluded from the strict
low-value classification, regardless of the size of its coordinates. -/
theorem childWitness_value_lower {n k m t : ℕ} {x v : Fin n → ℕ}
    {bits : Fin n → Bool} (hk : 2≤k) (hm : 0<m) (ht : t%2=1)
    (hres : ∀ i, v i%(2*m)=binaryLift m x bits i%(2*m))
    (hw : ChildWitness k m t x bits) : (1 : ℝ)/k≤value (List.ofFn v) := by
  apply witness_value_lower hk (by omega : 0<2*m)
  exact (witness_ofFn_mod_congr hres).mpr ((childWitness_iff x bits ht).mp hw)

/-- At an even parent modulus, `1+m` is a self-inverse unit modulo `2m`. -/
theorem toggle_unit_inverse (m : ℕ) (hm : m%2=0) :
    ((1+m)*(1+m))%(2*m)=1%(2*m) := by
  obtain ⟨q,rfl⟩ := Nat.dvd_of_mod_eq_zero hm
  have he : (1+2*q)*(1+2*q)=1+(2*(2*q))*(q+1) := by ring
  rw [he]
  simp

theorem mul_half_mod (m x : ℕ) : (m*x)%(2*m)=m*(x%2) := by
  rw [Nat.mul_comm 2 m]
  exact Nat.mul_mod_mul_left m x 2

theorem toggle_unit_residue (m x : ℕ) :
    ((1+m)*x)%(2*m)=(x+m*(x%2))%(2*m) := by
  calc
    ((1+m)*x)%(2*m) = (x+m*x)%(2*m) := by congr 1; ring
    _ = (x%(2*m)+(m*x)%(2*m))%(2*m) := Nat.add_mod _ _ _
    _ = (x%(2*m)+(m*(x%2))%(2*m))%(2*m) := by
      rw [mul_half_mod,mul_half_mod,Nat.mod_mod]
    _ = (x+m*(x%2))%(2*m) := (Nat.add_mod _ _ _).symm

def toggleBits {ι : Type*} (x : ι → ℕ) (bits : ι → Bool) : ι → Bool :=
  fun i => if x i%2=1 then !(bits i) else bits i

theorem toggle_binaryLift {ι : Type*} {m : ℕ} {x : ι → ℕ}
    (hm : m%2=0) (hx : ∀ i, x i<m) (bits : ι → Bool) (i : ι) :
    ((1+m)*binaryLift m x bits i)%(2*m)=binaryLift m x (toggleBits x bits) i := by
  have hi := hx i
  have hsmall : x i<2*m := by omega
  have hplus : x i+m<2*m := by omega
  rw [toggle_unit_residue]
  have hpar : binaryLift m x bits i%2=x i%2 := by
    cases hb : bits i <;> simp [binaryLift,hb,Nat.add_mod,hm]
  rw [hpar]
  by_cases hodd : x i%2=1
  · cases hb : bits i
    · simp [binaryLift,toggleBits,hb,hodd,Nat.mod_eq_of_lt hplus]
    · have he : x i+m+m=x i+2*m := by omega
      simp [binaryLift,toggleBits,hb,hodd,he,Nat.mod_eq_of_lt hsmall]
  · have heven : x i%2=0 := by omega
    cases hb : bits i <;>
      simp [binaryLift,toggleBits,hb,heven,Nat.mod_eq_of_lt hsmall,
        Nat.mod_eq_of_lt hplus]

theorem toggleBits_pivot {ι : Type*} (x : ι → ℕ) (bits : ι → Bool)
    (i : ι) (hi : x i%2=1) : toggleBits x bits i=!(bits i) := by
  simp [toggleBits,hi]

theorem hasWitness_toggle_binaryLift {n k m : ℕ} {x : Fin n → ℕ}
    (hm : m%2=0) (hx : ∀ i, x i<m) (bits : Fin n → Bool) :
    HasWitness k (2*m) (List.ofFn (binaryLift m x (toggleBits x bits))) ↔
      HasWitness k (2*m) (List.ofFn (binaryLift m x bits)) := by
  have hres (i : Fin n) : binaryLift m x (toggleBits x bits) i%(2*m)=
      ((1+m)*binaryLift m x bits i)%(2*m) := by
    rw [toggle_binaryLift hm hx bits i,Nat.mod_eq_of_lt (binaryLift_lt hx _ i)]
  have he := exists_congr (fun t => witness_ofFn_mod_congr (k:=k) (t:=t) hres)
  apply he.trans
  simpa only [HasWitness,List.map_ofFn,Function.comp_def] using
    hasWitness_unit (k:=k) (toggle_unit_inverse m hm) (List.ofFn (binaryLift m x bits))

/-- Fixing the bit of one odd coordinate to zero preserves coverage up to
the explicit common unit `1+m`, so it preserves witnesslessness. -/
theorem binaryLift_pivot_coverage {n k m : ℕ} {x : Fin n → ℕ}
    (hm : m%2=0) (hx : ∀ i, x i<m) (bits : Fin n → Bool)
    (pivot : Fin n) (hp : x pivot%2=1) :
    ∃ bits' : Fin n → Bool, bits' pivot=false ∧
      (HasWitness k (2*m) (List.ofFn (binaryLift m x bits)) ↔
       HasWitness k (2*m) (List.ofFn (binaryLift m x bits'))) := by
  cases hb : bits pivot
  · exact ⟨bits,hb,Iff.rfl⟩
  · refine ⟨toggleBits x bits,?_,(hasWitness_toggle_binaryLift hm hx bits).symm⟩
    simp [toggleBits,hp,hb]

/-- Every parent unit has an odd lift which remains a unit at the child
modulus. Both the lifted multiplier and inverse reduce to their parent values. -/
theorem unit_binaryLift {m u v : ℕ} (hm : 1<m) (hunit : (u*v)%m=1%m) :
    ∃ u' v' : ℕ, u'%m=u%m ∧ v'%m=v%m ∧ u'%2=1 ∧
      (u'*v')%(2*m)=1%(2*m) := by
  have huone : (u*v)%m=1 := by simpa only [Nat.mod_eq_of_lt hm] using hunit
  have hodd : u%2=1 ∨ m%2=1 := by
    by_cases hu : u%2=1
    · exact Or.inl hu
    right
    have hueven : u%2=0 := by omega
    by_contra hmnot
    have hmeven : m%2=0 := by omega
    have hmdvd : 2∣m := Nat.dvd_of_mod_eq_zero hmeven
    have hh := congrArg (fun z => z%2) huone
    rw [Nat.mod_mod_of_dvd _ hmdvd] at hh
    simp [Nat.mul_mod,hueven] at hh
  have hchoice : ∃ u' : ℕ, u'%m=u%m ∧ u'%2=1 := by
    by_cases hu : u%2=1
    · exact ⟨u,rfl,hu⟩
    · have hmo : m%2=1 := hodd.resolve_left hu
      have hueven : u%2=0 := by omega
      refine ⟨u+m,by simp,?_⟩
      simp [Nat.add_mod,hueven,hmo]
  obtain ⟨u',hum,huodd⟩ := hchoice
  have hparent : (u'*v)%m=1 := by
    calc
      (u'*v)%m = (u*v)%m := by simp [Nat.mul_mod,hum]
      _ = 1 := huone
  have htwopos : 0<2*m := by omega
  have hres : ((u'*v)%(2*m))%m=1 := by
    rw [Nat.mod_mod_of_dvd _ (show m∣2*m from ⟨2,by omega⟩)]
    exact hparent
  have hcases := (residue_binary_iff hm (Nat.mod_lt (u'*v) htwopos)).mp hres
  rcases hcases with hcases | hcases
  · refine ⟨u',v,hum,rfl,huodd,?_⟩
    rw [hcases,Nat.mod_eq_of_lt (show 1<2*m by omega)]
  · refine ⟨u',v+m,hum,by simp,huodd,?_⟩
    have humul : (u'*m)%(2*m)=m := by
      rw [Nat.mul_comm u' m,mul_half_mod,huodd,Nat.mul_one]
    calc
      (u'*(v+m))%(2*m) = (u'*v+u'*m)%(2*m) := by rw [Nat.mul_add]
      _ = (1+m+m)%(2*m) := by rw [Nat.add_mod,hcases,humul]
      _ = (1+2*m)%(2*m) := by congr 1; omega
      _ = 1%(2*m) := by simp

end Loneliness.Modular
