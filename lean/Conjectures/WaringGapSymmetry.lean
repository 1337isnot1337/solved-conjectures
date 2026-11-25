module

public import Conjectures.WaringGapSymmetryMonoid

@[expose] public section

/-! Exact eventual positive-power representation statement corresponding to
Benfield–Lippard, arXiv:2404.08193v2, §10.1, Conjecture 10.1, and the
intended finite-domain reflection version of 10.2. The proof follows the
existing repository result and its alternative Apéry certificate. Both
power-of-two counterexamples are proved for the full infinite offset set,
not a finite cutoff or an assumed semigroup. -/

namespace WaringGapSymmetryCore

/-- A sum of exactly j positive e-th powers is j+n. -/
def Represents (e j n : Nat) : Prop :=
  ∃ l : List Nat, l.length=j ∧ (∀ m ∈ l, 0<m) ∧
    (l.map (fun m => m^e)).sum=j+n

theorem offsets_sum (e : Nat) (l : List Nat) (hp : ∀ m ∈ l, 0<m) :
    (l.map (fun m => m^e)).sum=l.length+(l.map (fun m => m^e-1)).sum := by
  induction l with
  | nil => rfl
  | cons a l ih =>
    have ha := hp a (by simp)
    have hl : ∀ m ∈ l, 0<m := fun m hm => hp m (List.mem_cons_of_mem _ hm)
    have hpow : 0<a^e := Nat.pow_pos ha
    simp only [List.map_cons,List.sum_cons,List.length_cons]
    rw [ih hl]
    omega

theorem generated_of_offsets (e : Nat) (l : List Nat) (hp : ∀ m ∈ l, 0<m) :
    Generated e (l.map (fun m => m^e-1)).sum := by
  induction l with
  | nil => exact Generated.zero
  | cons a l ih =>
    have ha := hp a (by simp)
    have hl : ∀ m ∈ l, 0<m := fun m hm => hp m (List.mem_cons_of_mem _ hm)
    simp only [List.map_cons,List.sum_cons]
    rw [Nat.add_comm]
    exact Generated.step (ih hl) ha

theorem offsets_of_generated (e n : Nat) (h : Generated e n) :
    ∃ l : List Nat, (∀ m ∈ l, 0<m) ∧ n=(l.map (fun m => m^e-1)).sum := by
  induction h with
  | zero => exact ⟨[],by simp,rfl⟩
  | @step n m hn hm ih =>
    obtain ⟨l,hp,he⟩ := ih
    refine ⟨m::l,?_,?_⟩
    · intro a ha
      rcases List.mem_cons.mp ha with h|h
      · rw [h]
        exact hm
      · exact hp a h
    · simp only [List.map_cons,List.sum_cons]
      omega

theorem generated_of_rep (e j n : Nat) (h : Represents e j n) :
    Generated e n := by
  obtain ⟨l,hlen,hp,hsum⟩ := h
  have he := offsets_sum e l hp
  have hn : n=(l.map (fun m => m^e-1)).sum := by omega
  rw [hn]
  exact generated_of_offsets e l hp

theorem rep_of_generated (e n : Nat) (h : Generated e n) :
    ∃ j, Represents e j n := by
  obtain ⟨l,hp,he⟩ := offsets_of_generated e n h
  refine ⟨l.length,l,rfl,hp,?_⟩
  have hs := offsets_sum e l hp
  omega

theorem rep_succ (e j n : Nat) (h : Represents e j n) :
    Represents e (j+1) n := by
  obtain ⟨l,hlen,hp,hsum⟩ := h
  refine ⟨1::l,?_,?_,?_⟩
  · simp [hlen]
  · intro a ha
    rcases List.mem_cons.mp ha with h|h
    · omega
    · exact hp a h
  · simp only [List.map_cons,List.sum_cons,Nat.one_pow]
    omega

theorem rep_pad (e j n : Nat) (h : Represents e j n) (k : Nat) :
    Represents e (j+k) n := by
  induction k with
  | zero => simpa using h
  | succ k ih =>
    rw [Nat.add_succ]
    exact rep_succ e (j+k) n ih

/-- A positive offset that is an exception for all sufficiently large
numbers of summands. This uses eventual nonrepresentability, not a
finite tested interval. -/
def StableException (e n : Nat) : Prop :=
  0<n ∧ ∃ J, ∀ j, J≤j → ¬ Represents e j n

theorem stable_iff (e n : Nat) :
    StableException e n ↔ ¬ Generated e n := by
  constructor
  · intro h hg
    obtain ⟨_,J,hJ⟩ := h
    obtain ⟨j,hj⟩ := rep_of_generated e n hg
    exact hJ (j+J) (by omega) (rep_pad e j n hj J)
  · intro h
    have hn : 0<n := by
      by_cases hz : n=0
      · subst n
        exact False.elim (h Generated.zero)
      · omega
    exact ⟨hn,0,fun j _ hr => h (generated_of_rep e j n hr)⟩

def IsLargestStableException (e F : Nat) : Prop :=
  StableException e F ∧ ∀ n, StableException e n → n≤F

noncomputable def memberBit (e n : Nat) : Bool :=
  @decide (Generated e n) (Classical.propDecidable _)

theorem memberBit_true (e n : Nat) :
    memberBit e n=true ↔ Generated e n := by
  simp [memberBit]

theorem memberBit_false (e n : Nat) :
    memberBit e n=false ↔ ¬ Generated e n := by
  simp [memberBit]

theorem gap_bit_correct (e n : Nat) :
    gapBit (memberBit e) n=1 ↔ StableException e n := by
  rw [stable_iff]
  cases h : memberBit e n
  · have hh := (memberBit_false e n).mp h
    simp [gapBit,h,hh]
  · have hh := (memberBit_true e n).mp h
    simp [gapBit,h,hh]

/-- Count of the exceptions in [0,F]. The count is the cardinality of the
entire stable exception set whenever F is its largest member. -/
noncomputable def stableCount (e F : Nat) : Nat :=
  prefixSum (gapBit (memberBit e)) (F+1)

theorem stable_symmetry_defect (e : Nat) (w : DoubleGapWitness (Generated e)) :
    IsLargestStableException e w.F ∧ w.t<w.F ∧
      StableException e w.t ∧ StableException e (w.F-w.t) ∧
      w.F+1<2*stableCount e w.F := by
  have hf := (stable_iff e w.F).mpr w.F_gap
  have ht := (stable_iff e w.t).mpr w.t_gap
  have ho := (stable_iff e (w.F-w.t)).mpr w.other_gap
  have hl : ∀ n, StableException e n → n≤w.F := by
    intro n hn
    by_cases hh : n≤w.F
    · exact hh
    · exact False.elim ((stable_iff e n).mp hn (w.above n (by omega)))
  have hadd : ∀ i j, memberBit e i=true → memberBit e j=true →
      memberBit e (i+j)=true := by
    intro i j hi hj
    exact (memberBit_true e (i+j)).mpr (generated_add e
      ((memberBit_true e i).mp hi) ((memberBit_true e j).mp hj))
  have hdef := strict_defect_of_double_gap (memberBit e) w.F w.t
    (Nat.le_of_lt w.t_lt) ((memberBit_false e w.F).mpr w.F_gap) hadd
    ((memberBit_false e w.t).mpr w.t_gap)
    ((memberBit_false e (w.F-w.t)).mpr w.other_gap)
  exact ⟨⟨hf,hl⟩,w.t_lt,ht,ho,hdef⟩

/-- The two counterexamples documented in the repository: strict defect,
and explicit failure of the reflection property for the full exception set. -/
theorem benfield_lippard_64 :
    ∃ F t, IsLargestStableException 64 F ∧ t<F ∧
      StableException 64 t ∧ StableException 64 (F-t) ∧
      F+1<2*stableCount 64 F :=
  ⟨generatedWitness64.F,generatedWitness64.t,
    stable_symmetry_defect 64 generatedWitness64⟩

theorem benfield_lippard_128 :
    ∃ F t, IsLargestStableException 128 F ∧ t<F ∧
      StableException 128 t ∧ StableException 128 (F-t) ∧
      F+1<2*stableCount 128 F :=
  ⟨generatedWitness128.F,generatedWitness128.t,
    stable_symmetry_defect 128 generatedWitness128⟩

def Conjecture10_1 : Prop :=
  ∀ k F : Nat, 0<k → IsLargestStableException (2^k) F →
    F=2*stableCount (2^k) F-1

theorem not_conjecture10_1 : ¬ Conjecture10_1 := by
  intro h
  obtain ⟨F,t,hF,ht,h1,h2,hdef⟩ := benfield_lippard_64
  have hc := h 6 F (by decide) hF
  change F=2*stableCount 64 F-1 at hc
  omega

/-- The authors' intended finite-domain version of Conjecture 10.2. -/
def ReflectionConjecture : Prop :=
  ∀ k F n : Nat, 0<k → IsLargestStableException (2^k) F →
    n≤F → (StableException (2^k) n ↔ ¬ StableException (2^k) (F-n))

theorem not_reflection_conjecture : ¬ ReflectionConjecture := by
  intro h
  obtain ⟨F,t,hF,ht,h1,h2,_⟩ := benfield_lippard_64
  exact (h 6 F t (by decide) hF (Nat.le_of_lt ht)).mp h1 h2


/-- The paper's uniform set-stabilization convention. Its stabilized set,
if given as a predicate, agrees with the pointwise eventual definition. -/
def Stabilizes (e : Nat) (B : Nat → Prop) : Prop :=
  ∃ J, ∀ j, J≤j → ∀ n, B n ↔ (0<n ∧ ¬ Represents e j n)

theorem stabilized_matches (e : Nat) (B : Nat → Prop)
    (h : Stabilizes e B) (n : Nat) : B n ↔ StableException e n := by
  obtain ⟨J,hJ⟩ := h
  constructor
  · intro hn
    exact ⟨((hJ J (Nat.le_refl J) n).mp hn).1,J,
      fun j hj => ((hJ j hj n).mp hn).2⟩
  · intro hn
    obtain ⟨hn,K,hK⟩ := hn
    exact (hJ (J+K) (by omega) n).mpr ⟨hn,hK (J+K) (by omega)⟩

theorem count_filter_range (s : Nat → Bool) (N : Nat) :
    ((List.range N).filter (fun n => !(s n))).length=prefixSum (gapBit s) N := by
  induction N with
  | zero => rfl
  | succ N ih =>
    rw [List.range_succ,List.filter_append,List.length_append,ih,prefixSum_succ]
    cases h : s N <;> simp [h,gapBit]

/-- A duplicate-free enumeration of all stable exceptions below or at F. -/
noncomputable def stableList (e F : Nat) : List Nat :=
  (List.range (F+1)).filter (fun n => !(memberBit e n))

theorem stableList_length (e F : Nat) :
    (stableList e F).length=stableCount e F :=
  count_filter_range (memberBit e) (F+1)

theorem stableList_nodup (e F : Nat) : (stableList e F).Nodup := by
  exact List.Nodup.sublist List.filter_sublist List.nodup_range

theorem stableList_mem (e F n : Nat) (hF : IsLargestStableException e F) :
    n∈stableList e F ↔ StableException e n := by
  unfold stableList
  rw [List.mem_filter,List.mem_range]
  cases h : memberBit e n
  · have hs := (stable_iff e n).mpr ((memberBit_false e n).mp h)
    have hn := hF.2 n hs
    simp [hs,show n<F+1 by omega]
  · have hs : ¬ StableException e n :=
      fun hs => (stable_iff e n).mp hs ((memberBit_true e n).mp h)
    simp [hs]

/-- Strict inequality for the actual cardinality of the paper's B-set,
given as a duplicate-free list with precisely its members. -/
theorem stable_list_counterexample64 :
    ∃ F : Nat, ∃ B : List Nat, IsLargestStableException 64 F ∧
      B.Nodup ∧ (∀ n, n∈B ↔ StableException 64 n) ∧
      F+1<2*B.length := by
  obtain ⟨F,t,hF,ht,h1,h2,hdef⟩ := benfield_lippard_64
  refine ⟨F,stableList 64 F,hF,stableList_nodup 64 F,
    fun n => stableList_mem 64 F n hF,?_⟩
  rw [stableList_length]
  exact hdef

theorem stable_list_counterexample128 :
    ∃ F : Nat, ∃ B : List Nat, IsLargestStableException 128 F ∧
      B.Nodup ∧ (∀ n, n∈B ↔ StableException 128 n) ∧
      F+1<2*B.length := by
  obtain ⟨F,t,hF,ht,h1,h2,hdef⟩ := benfield_lippard_128
  refine ⟨F,stableList 128 F,hF,stableList_nodup 128 F,
    fun n => stableList_mem 128 F n hF,?_⟩
  rw [stableList_length]
  exact hdef

end WaringGapSymmetryCore
