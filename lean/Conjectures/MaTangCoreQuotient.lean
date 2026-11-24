import Conjectures.MaTangCoreDecay

/-!
# Ma–Tang's random subset-sum threshold conjecture

Construct a literal surjective quotient matrix for every binary
subspace. This provides the inverse existence direction for the
finite kernel-generator coupling.
-/

namespace MaTangCoreQuotient

open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy
open MaTangCoreSubspace MaTangCoreRank MaTangCoreGenerator

def RowsOfSize (rows : List (List Bool)) (n : Nat) : Prop :=
  ∀ row ∈ rows, row.length = n

def correctedRows (rows : List (List Bool)) (v : List Bool) : List (List Bool) :=
  rows.map fun row => rowDot row v :: row

theorem correctedRows_length (rows : List (List Bool)) (v : List Bool) :
    (correctedRows rows v).length = rows.length := by simp [correctedRows]

theorem correctedRows_size (rows : List (List Bool)) (v : List Bool) (n : Nat)
    (h : RowsOfSize rows n) : RowsOfSize (correctedRows rows v) (n+1) := by
  intro row hr
  obtain ⟨s,hs,he⟩ := List.mem_map.mp hr
  subst row
  simp [h s hs]

theorem correctedRows_apply (rows : List (List Bool)) (v xs : List Bool)
    (a : Bool) (h : v.length = xs.length) :
    applyMatrix (correctedRows rows v) (a :: xs) =
      applyMatrix rows (if a then xorVec v xs else xs) := by
  induction rows with
  | nil => rfl
  | cons row rest ih =>
    change rowDot (rowDot row v :: row) (a :: xs) ::
      applyMatrix (correctedRows rest v) (a :: xs) =
      rowDot row (if a then xorVec v xs else xs) ::
      applyMatrix rest (if a then xorVec v xs else xs)
    rw [ih]
    cases a
    · simp [rowDot]
    · simp [rowDot,rowDot_xor row v xs h]

def liftedRows (rows : List (List Bool)) (n : Nat) : List (List Bool) :=
  (true :: List.replicate n false) :: rows.map (fun row => false :: row)

theorem liftedRows_length (rows : List (List Bool)) (n : Nat) :
    (liftedRows rows n).length = rows.length+1 := by simp [liftedRows]

theorem liftedRows_size (rows : List (List Bool)) (n : Nat)
    (h : RowsOfSize rows n) : RowsOfSize (liftedRows rows n) (n+1) := by
  intro row hr
  rcases List.mem_cons.mp hr with he | hm
  · subst row
    simp
  · obtain ⟨s,hs,he⟩ := List.mem_map.mp hm
    subst row
    simp [h s hs]

theorem rowDot_zero_left (n : Nat) (u : List Bool) :
    rowDot (List.replicate n false) u = false := by
  induction n generalizing u with
  | zero => rfl
  | succ n ih =>
    cases u with
    | nil => rfl
    | cons a us =>
      simp [List.replicate_succ,rowDot,ih us]

theorem apply_false_lift (rows : List (List Bool)) (a : Bool) (xs : List Bool) :
    applyMatrix (rows.map (fun row => false :: row)) (a :: xs) =
      applyMatrix rows xs := by
  induction rows with
  | nil => rfl
  | cons row rest ih =>
    change rowDot (false :: row) (a :: xs) ::
      applyMatrix (rest.map (fun row => false :: row)) (a :: xs) =
      rowDot row xs :: applyMatrix rest xs
    rw [ih]
    simp [rowDot]

theorem liftedRows_apply (rows : List (List Bool)) (n : Nat)
    (a : Bool) (xs : List Bool) :
    applyMatrix (liftedRows rows n) (a :: xs) =
      a :: applyMatrix rows xs := by
  change rowDot (true :: List.replicate n false) (a :: xs) ::
    applyMatrix (rows.map (fun row => false :: row)) (a :: xs) = _
  rw [apply_false_lift]
  simp [rowDot,rowDot_zero_left]

/-- Every binary subspace is literally the kernel of a surjective
binary matrix. This is an induction on the ambient coordinate length,
with no quotient-space or rank theorem assumed. -/
theorem exists_quotient_matrix (n : Nat) (S : BinarySubspace n) :
    ∃ rows : List (List Bool), RowsOfSize rows n ∧ CoversBinary rows n ∧
      ∀ u : List Bool, u.length = n →
        (S.contains u ↔ applyMatrix rows u = List.replicate rows.length false) := by
  induction n with
  | zero =>
    refine ⟨[],?_,?_,?_⟩
    · intro row h
      simp at h
    · intro b hb
      have he : b = [] := List.eq_nil_of_length_eq_zero hb
      subst b
      exact ⟨[],rfl,rfl⟩
    · intro u hu
      have he : u = [] := List.eq_nil_of_length_eq_zero hu
      subst u
      constructor
      · intro _
        rfl
      · intro _
        exact S.zero_mem
  | succ n ih =>
    obtain ⟨rows,hr,hs,hk⟩ := ih (tailSpace S)
    by_cases ht : ∃ v : List Bool, S.contains (true :: v)
    · obtain ⟨v,hv⟩ := ht
      have hvl : v.length = n := by
        have h := S.length_eq (true :: v) hv
        simpa using h
      refine ⟨correctedRows rows v,correctedRows_size rows v n hr,?_,?_⟩
      · intro b hb
        have hb' : b.length = rows.length := by
          simpa [correctedRows_length] using hb
        obtain ⟨u,hu,he⟩ := hs b hb'
        refine ⟨false :: u,by simp [hu],?_⟩
        rw [correctedRows_apply rows v u false (hvl.trans hu.symm)]
        exact he
      · intro u hu
        cases u with
        | nil => simp at hu
        | cons a xs =>
          have hxs : xs.length = n := by simpa using hu
          have he := hvl.trans hxs.symm
          rw [correctedRows_apply rows v xs a he,correctedRows_length]
          cases a
          · exact hk xs hxs
          · have hxlen : (xorVec v xs).length = n :=
              (xorVec_length v xs he).trans hvl
            have hkey := hk (xorVec v xs) hxlen
            change S.contains (false :: xorVec v xs) ↔
              applyMatrix rows (xorVec v xs) = List.replicate rows.length false at hkey
            change S.contains (true :: xs) ↔
              applyMatrix rows (xorVec v xs) = List.replicate rows.length false
            rw [← hkey]
            constructor
            · intro hu
              exact S.xor_mem (true :: v) (true :: xs) hv hu
            · intro hu
              have hh := S.xor_mem (true :: v) (false :: xorVec v xs) hv hu
              change S.contains (true :: xorVec v (xorVec v xs)) at hh
              rw [xorVec_cancel v xs he] at hh
              exact hh
    · refine ⟨liftedRows rows n,liftedRows_size rows n hr,?_,?_⟩
      · intro b hb
        rw [liftedRows_length] at hb
        cases b with
        | nil => simp at hb
        | cons a bs =>
          have hbs : bs.length = rows.length := by simpa using hb
          obtain ⟨u,hu,he⟩ := hs bs hbs
          refine ⟨a :: u,by simp [hu],?_⟩
          rw [liftedRows_apply,he]
      · intro u hu
        cases u with
        | nil => simp at hu
        | cons a xs =>
          have hxs : xs.length = n := by simpa using hu
          rw [liftedRows_apply,liftedRows_length,List.replicate_succ]
          cases a
          · simpa [tailSpace] using hk xs hxs
          · constructor
            · intro h
              exact False.elim (ht ⟨xs,h⟩)
            · intro h
              have hh := (List.cons.inj h).1
              contradiction

theorem kernelVector_length (w : List Raw) (t : List Bool) :
    (kernelVector w t).length = w.length := by simp [kernelVector,maskBits]

def generatorSpace (w : List Raw) (r : Nat) : BinarySubspace w.length where
  contains u := ∃ t : List Bool, t.length = r ∧ kernelVector w t = u
  length_eq u h := by
    obtain ⟨t,_,he⟩ := h
    rw [← he,kernelVector_length]
  zero_mem := ⟨List.replicate r false,by simp,kernelVector_zero_param w r⟩
  xor_mem u v hu hv := by
    obtain ⟨t,ht,he⟩ := hu
    obtain ⟨s,hs,he'⟩ := hv
    have hlen : t.length = s.length := ht.trans hs.symm
    refine ⟨xorVec t s,(xorVec_length t s hlen).trans ht,?_⟩
    rw [kernelVector_xor w t s hlen,he,he']

theorem labelVector_map_fst (w : List Raw) (t : List Bool) :
    labelVector (w.map Prod.fst) t = kernelVector w t := by
  induction w with
  | nil => rfl
  | cons x xs ih =>
    change encodedDot x.1 t :: labelVector (xs.map Prod.fst) t =
      encodedDot x.1 t :: kernelVector xs t
    rw [ih]

theorem generator_encoding (w : List Raw) (r : Nat)
    (hbound : ∀ x ∈ w, x.1 < 2^r) (hinj : InjectiveParams w r) :
    Encoding (generatorSpace w r) r (w.map Prod.fst) := by
  constructor
  · simp
  · intro b hb
    obtain ⟨x,hx,he⟩ := List.mem_map.mp hb
    subst b
    exact hbound x hx
  · intro t ht
    rw [labelVector_map_fst]
    exact ⟨t,ht,rfl⟩
  · intro u hu
    obtain ⟨t,ht,he⟩ := hu
    exact ⟨t,ht,(labelVector_map_fst w t).trans he⟩
  · intro t u ht hu he
    rw [labelVector_map_fst,labelVector_map_fst] at he
    exact hinj t u ht hu he

/-- Every injective generator word of the true r-bit alphabet occurs as
the encoded kernel of at least one surjective quotient matrix with
exactly k−r output rows. -/
theorem quotient_of_good_generator (w : List Raw) (r : Nat)
    (hbound : ∀ x ∈ w, x.1 < 2^r) (hinj : InjectiveParams w r) :
    ∃ rows : List (List Bool), RowsOfSize rows w.length ∧
      CoversBinary rows w.length ∧ rows.length+r = w.length ∧
      Encoding (kernelSpace rows w.length) r (w.map Prod.fst) := by
  let S := generatorSpace w r
  obtain ⟨rows,hr,hs,hk⟩ := exists_quotient_matrix w.length S
  have E : Encoding S r (w.map Prod.fst) := generator_encoding w r hbound hinj
  have E' : Encoding (kernelSpace rows w.length) r (w.map Prod.fst) := by
    constructor
    · exact E.length_eq
    · exact E.bound
    · intro t ht
      have hu := E.image t ht
      have hlen := S.length_eq _ hu
      exact ⟨hlen,(hk _ hlen).mp hu⟩
    · intro u hu
      have hmem : S.contains u := (hk u hu.1).mpr hu.2
      exact E.surj u hmem
    · exact E.inj
  have hrank := encoding_rank_nullity rows w.length r hs _ E'
  exact ⟨rows,hr,hs,hrank.symm,E'⟩

end MaTangCoreQuotient
