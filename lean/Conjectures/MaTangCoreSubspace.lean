import Conjectures.MaTangCoreOccupancy

/-!
# Ma–Tang's random subset-sum threshold conjecture

Constructive binary-subspace parametrization by encoded kernel columns.
The induction splits at the first coordinate and chooses a vector with
first bit one precisely when such a vector exists. No rank assumption
or external linear-algebra theorem is used.
-/

namespace MaTangCoreSubspace

open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy

def labelVector (ls : List Nat) (t : List Bool) : List Bool :=
  ls.map fun b => encodedDot b t

theorem labelVector_length (ls : List Nat) (t : List Bool) :
    (labelVector ls t).length = ls.length := by simp [labelVector]

theorem encodedDot_one_cons (a : Bool) (t : List Bool) :
    encodedDot 1 (a :: t) = a := by
  cases a <;> simp [encodedDot,encodedDot_zero]

theorem encodedDot_lift (v a : Bool) (b : Nat) (t : List Bool) :
    encodedDot (2*b + (if v then 1 else 0)) (a :: t) =
      ((v && a) != encodedDot b t) := by
  cases v
  · have hdiv : (2*b+0)/2 = b := by omega
    have hmod : (2*b+0)%2 = 0 := by omega
    change ((((2*b+0)%2 == 1) && a) != encodedDot ((2*b+0)/2) t) = ((false && a) != encodedDot b t)
    rw [hdiv,hmod]
    rfl
  · have hdiv : (2*b+1)/2 = b := by omega
    have hmod : (2*b+1)%2 = 1 := by omega
    change ((((2*b+1)%2 == 1) && a) != encodedDot ((2*b+1)/2) t) = ((true && a) != encodedDot b t)
    rw [hdiv,hmod]
    rfl

/-- Adjoin the entries of a new generator as the low bit of each column. -/
def liftLabels : List Bool → List Nat → List Nat
  | v :: vs, b :: bs => (2*b + if v then 1 else 0) :: liftLabels vs bs
  | _, _ => []

theorem liftLabels_length (v : List Bool) (ls : List Nat)
    (h : v.length = ls.length) : (liftLabels v ls).length = ls.length := by
  induction v generalizing ls with
  | nil => cases ls with
    | nil => rfl
    | cons b bs => simp at h
  | cons a as ih =>
    cases ls with
    | nil => simp at h
    | cons b bs =>
      have ht : as.length = bs.length := by simpa using h
      simp [liftLabels,ih bs ht]

theorem liftLabels_bound (v : List Bool) (ls : List Nat) (r : Nat)
    (h : ∀ b ∈ ls, b < 2^r) :
    ∀ b ∈ liftLabels v ls, b < 2^(r+1) := by
  induction v generalizing ls with
  | nil => simp [liftLabels]
  | cons a as ih =>
    cases ls with
    | nil => simp [liftLabels]
    | cons b bs =>
      intro c hc
      rcases List.mem_cons.mp hc with he | hm
      · subst c
        have hb := h b (by simp)
        rw [Nat.pow_succ]
        cases a <;> simp <;> omega
      · exact ih bs (fun d hd => h d (by simp [hd])) c hm

theorem labelVector_lift (v : List Bool) (ls : List Nat)
    (a : Bool) (t : List Bool) (h : v.length = ls.length) :
    labelVector (liftLabels v ls) (a :: t) =
      if a then xorVec v (labelVector ls t) else labelVector ls t := by
  induction v generalizing ls with
  | nil =>
    cases ls with
    | nil => cases a <;> rfl
    | cons b bs => simp at h
  | cons b bs ih =>
    cases ls with
    | nil => simp at h
    | cons c cs =>
      have ht : bs.length = cs.length := by simpa using h
      have he := ih cs ht
      change encodedDot (2*c + if b then 1 else 0) (a :: t) ::
          labelVector (liftLabels bs cs) (a :: t) =
        if a then xorVec (b :: bs) (encodedDot c t :: labelVector cs t)
        else encodedDot c t :: labelVector cs t
      rw [encodedDot_lift,he]
      cases a <;> simp [xorVec]

structure BinarySubspace (n : Nat) where
  contains : List Bool → Prop
  length_eq : ∀ x, contains x → x.length = n
  zero_mem : contains (List.replicate n false)
  xor_mem : ∀ x y, contains x → contains y → contains (xorVec x y)

def tailSpace {n : Nat} (S : BinarySubspace (n+1)) : BinarySubspace n where
  contains x := S.contains (false :: x)
  length_eq x hx := by
    have h := S.length_eq (false :: x) hx
    simp at h
    exact h
  zero_mem := by simpa [List.replicate_succ] using S.zero_mem
  xor_mem x y hx hy := by
    have h := S.xor_mem (false :: x) (false :: y) hx hy
    exact h

/-- Exact parametrization: every vector in S has exactly one length-r
coefficient vector, and all columns lie in [0,2^r). -/
structure Encoding {n : Nat} (S : BinarySubspace n) (r : Nat) (ls : List Nat) : Prop where
  length_eq : ls.length = n
  bound : ∀ b ∈ ls, b < 2^r
  image : ∀ t, t.length = r → S.contains (labelVector ls t)
  surj : ∀ x, S.contains x → ∃ t, t.length = r ∧ labelVector ls t = x
  inj : ∀ t u, t.length = r → u.length = r →
    labelVector ls t = labelVector ls u → t = u

theorem vector_with_head (a : Bool) (v : List Bool) (ls : List Nat)
    (t : List Bool) (h : v.length = ls.length) :
    labelVector (1 :: liftLabels v ls) (a :: t) =
      a :: (if a then xorVec v (labelVector ls t) else labelVector ls t) := by
  change encodedDot 1 (a :: t) :: labelVector (liftLabels v ls) (a :: t) = _
  rw [encodedDot_one_cons,labelVector_lift v ls a t h]

/-- Gaussian elimination by the first coordinate, including the zero
subspace and the full cube. The constructed columns are an actual
basis representation, not an assumption on the matrix. -/
theorem exists_encoding (n : Nat) (S : BinarySubspace n) :
    ∃ r ≤ n, ∃ ls : List Nat, Encoding S r ls := by
  induction n with
  | zero =>
    refine ⟨0, Nat.le_refl _, [], ?_⟩
    constructor
    · rfl
    · simp
    · intro t _
      exact S.zero_mem
    · intro x hx
      have hnil : x = [] := List.eq_nil_of_length_eq_zero (S.length_eq x hx)
      exact ⟨[],rfl,hnil.symm⟩
    · intro t u ht hu _
      rw [List.eq_nil_of_length_eq_zero ht,List.eq_nil_of_length_eq_zero hu]
  | succ n ih =>
    obtain ⟨r,hr,ls,E⟩ := ih (tailSpace S)
    by_cases ht : ∃ v : List Bool, S.contains (true :: v)
    · obtain ⟨v,hv⟩ := ht
      have hvl : v.length = n := by
        have h := S.length_eq (true :: v) hv
        simpa using h
      have hvl' : v.length = ls.length := hvl.trans E.length_eq.symm
      refine ⟨r+1,by omega,1 :: liftLabels v ls,?_⟩
      constructor
      · simp [liftLabels_length v ls hvl',E.length_eq]
      · intro b hb
        rcases List.mem_cons.mp hb with he | hm
        · subst b
          have hp : 0 < 2^r := Nat.pow_pos (by decide)
          rw [Nat.pow_succ]
          omega
        · exact liftLabels_bound v ls r E.bound b hm
      · intro t htl
        cases t with
        | nil => simp at htl
        | cons a ts =>
          have hts : ts.length = r := by simpa using htl
          have hmem := E.image ts hts
          change S.contains (false :: labelVector ls ts) at hmem
          rw [vector_with_head a v ls ts hvl']
          cases a
          · exact hmem
          · exact S.xor_mem (true :: v) (false :: labelVector ls ts) hv hmem
      · intro x hx
        have hlen := S.length_eq x hx
        cases x with
        | nil => simp at hlen
        | cons a xs =>
          have hxs : xs.length = n := by simpa using hlen
          cases a
          · obtain ⟨ts,hts,he⟩ := E.surj xs hx
            refine ⟨false :: ts,by simp [hts],?_⟩
            rw [vector_with_head false v ls ts hvl']
            simpa using he
          · have hmem : (tailSpace S).contains (xorVec v xs) :=
              S.xor_mem (true :: v) (true :: xs) hv hx
            obtain ⟨ts,hts,he⟩ := E.surj (xorVec v xs) hmem
            refine ⟨true :: ts,by simp [hts],?_⟩
            rw [vector_with_head true v ls ts hvl']
            simp only [ite_true]
            rw [he,xorVec_cancel v xs (hvl.trans hxs.symm)]
      · intro t u ht hu he
        cases t with
        | nil => simp at ht
        | cons a ts =>
          cases u with
          | nil => simp at hu
          | cons b us =>
            have hts : ts.length = r := by simpa using ht
            have hus : us.length = r := by simpa using hu
            rw [vector_with_head a v ls ts hvl',vector_with_head b v ls us hvl'] at he
            obtain ⟨hab,heq⟩ := List.cons.inj he
            subst b
            have he' : labelVector ls ts = labelVector ls us := by
              cases a
              · exact heq
              · have hh := congrArg (xorVec v) heq
                exact (xorVec_cancel v (labelVector ls ts)
                  (hvl'.trans (labelVector_length ls ts).symm)).symm.trans
                  (hh.trans (xorVec_cancel v (labelVector ls us)
                    (hvl'.trans (labelVector_length ls us).symm)))
            rw [E.inj ts us hts hus he']
    · refine ⟨r,by omega,0 :: ls,?_⟩
      constructor
      · simp [E.length_eq]
      · intro b hb
        rcases List.mem_cons.mp hb with he | hm
        · subst b
          exact Nat.pow_pos (by decide)
        · exact E.bound b hm
      · intro t htl
        change S.contains (encodedDot 0 t :: labelVector ls t)
        rw [encodedDot_zero]
        exact E.image t htl
      · intro x hx
        have hlen := S.length_eq x hx
        cases x with
        | nil => simp at hlen
        | cons a xs =>
          cases a
          · obtain ⟨t,htl,he⟩ := E.surj xs hx
            refine ⟨t,htl,?_⟩
            change encodedDot 0 t :: labelVector ls t = false :: xs
            rw [encodedDot_zero,he]
          · exact False.elim (ht ⟨xs,hx⟩)
      · intro t u htl hul he
        change encodedDot 0 t :: labelVector ls t =
          encodedDot 0 u :: labelVector ls u at he
        exact E.inj t u htl hul (List.cons.inj he).2

end MaTangCoreSubspace
